Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E0FA71C78
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 17:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F096B10E743;
	Wed, 26 Mar 2025 16:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Kzdqe9oz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC8410E743
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743008177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k6ix+TYrn8SDbI0i9oCfbrgKAolr8tx3RZ9t5hUT6UM=;
 b=Kzdqe9oz0PXW7PReeF4zV3Omt1ctJE/+nRGDdl620J9kQnLPUOlWohSjY2wNO5cCBzVjIG
 QhJ28FV99xi4SgnheuAXN/FHCTZaVtmF5xblOA2zaDBuSzr6WcwV9pyON812xCEt5yyXZk
 xvl/HZ1XdL+3Y98nVcbLd1LNvyKkC9o=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-ZLcfCvGUOP2Cy1GHWQTKjw-1; Wed, 26 Mar 2025 12:56:16 -0400
X-MC-Unique: ZLcfCvGUOP2Cy1GHWQTKjw-1
X-Mimecast-MFC-AGG-ID: ZLcfCvGUOP2Cy1GHWQTKjw_1743008176
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6ff4d1b7490so1294747b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743008176; x=1743612976;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k6ix+TYrn8SDbI0i9oCfbrgKAolr8tx3RZ9t5hUT6UM=;
 b=O+bEN2ID+aTK0NA6tSgvz4XrtOlbVkaLa3f3jMt5cWHdylyTg5g5TL6qU+dvbEIemw
 PL6cJglwuGjQ/aTrIHs3aQLuFQz33yMyoDesKCDwr+gsMUUNoVTlDQrIYMOJO9TI9667
 ZrYMQL/zJnfZtfhT5qy15aUXHxqg0CvkpZlnouPk28PRwf14wUBppY12XgdkRr7OD2sx
 vX5jy5cm1cXPFTn8zqU83hVNtvLfSoai7HyRGVxaVABk9BHU2ebIgg+D21bBNq7yBKWm
 TkIVBsIqlVM8MYC3ChegW24VHkGxwj692YJeTpX7nUeKDhYFK8n8okeVgoSt7If41DUe
 u0hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhL4UszMoC7TA12TsOVZna5kqgFcJqSdJhCQ+V/mWDrf3Ie/GtvtsYJdyTP7U9KPF3gbaexkVZb2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgEPwyHioG0aLFLz1KMJK8+3wEIO4lFHGAp1BrYGt7BZzMTIsP
 XS73C/wBGqvQw1QicycliGeAAdNiIPpIyxlC7uucLNKA9k62ZJaCPPi6X8Yj/fHiDiHxpWBcVY0
 1orZebUpFmBzjQSE43gZKZHeQdzmw8d3NI6lJK4+re/p+3clhZ5c6bPZxfcorjfFyCr/E5G2e3R
 YxykaH5UFGYz1CxavWvlFGKTcd5MSbyFfo0HHeRmi1
X-Gm-Gg: ASbGncsyRskNw79JvSgDVH8r803lW9NFsWiTnAQmFsjwCgeSXIys2IUkfLzu9zWHhCO
 kxgTqn5yT/040nOi2kT3VAnFQbFwQQOZ/XJdJGR5Nr1dZblYRVWAfO79k1oNwf7pkVl616Xs=
X-Received: by 2002:a05:690c:6c13:b0:6fb:277f:f022 with SMTP id
 00721157ae682-70224fcce69mr3452977b3.15.1743008175813; 
 Wed, 26 Mar 2025 09:56:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF46l0Om8U0cR/DyeTy1CvqTxhBBaUiRxwNu6i1+ncdICHx+ceRDNh3NzsQc3kqVXnthZhDbLO16SExcyfzjMw=
X-Received: by 2002:a05:690c:6c13:b0:6fb:277f:f022 with SMTP id
 00721157ae682-70224fcce69mr3452387b3.15.1743008175310; Wed, 26 Mar 2025
 09:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
 <20250325-b4-panel-refcounting-v1-3-4e2bf5d19c5d@redhat.com>
 <20250326-nondescript-imposing-termite-ef544a@houat>
In-Reply-To: <20250326-nondescript-imposing-termite-ef544a@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 26 Mar 2025 12:56:03 -0400
X-Gm-Features: AQ5f1JrJziRtR868z-FaGwe0BocoFaEy8ks4NXcXwOt0jjCS-KpiAa-VtLlocMk
Message-ID: <CAN9Xe3T8SvMNf8MQYCaoWz6OMSdfmJtKcfUHKbPKzRmR3JK0nQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/panel: get/put panel reference in
 drm_panel_add/remove()
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oAMp6mAaPwzL_ko-Bc7nlrutFddW-pA6ljGCnQS0wDk_1743008176
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000215c08063141b7b9"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000215c08063141b7b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 11:31=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:

> On Tue, Mar 25, 2025 at 01:24:10PM -0400, Anusha Srivatsa wrote:
> > Take the panel reference and put it back as required
> > using the helpers introduced in previous patch.
> > drm_panel_add() and drm_panel_remove()
> > add a panel to the global registry and removes a panel
> > respectively, use get() and put() helpers to keep up
> > with refcounting.
> >
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>
> We should defer merging that patch until we have converted all the panel
> drivers to the new allocation function.
>
> Luca, Maxime,

I ll drop this patch in the next iteration and send it once it is ready to
be merged.

Anusha

> Maxime
>

--000000000000215c08063141b7b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 26,=
 2025 at 11:31=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kerne=
l.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Tue, Mar 25, 2025 at 01:24:10PM -0400, Anusha S=
rivatsa wrote:<br>
&gt; Take the panel reference and put it back as required<br>
&gt; using the helpers introduced in previous patch.<br>
&gt; drm_panel_add() and drm_panel_remove()<br>
&gt; add a panel to the global registry and removes a panel<br>
&gt; respectively, use get() and put() helpers to keep up<br>
&gt; with refcounting.<br>
&gt; <br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
<br>
We should defer merging that patch until we have converted all the panel<br=
>
drivers to the new allocation function.<br>
<br></blockquote><div>Luca, Maxime,</div><div><br></div><div>I ll drop this=
 patch in the next iteration and send it once it is ready to be merged.</di=
v><div><br></div><div>Anusha <br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
Maxime<br>
</blockquote></div></div>

--000000000000215c08063141b7b9--

