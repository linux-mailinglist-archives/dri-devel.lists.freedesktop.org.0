Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B12AD22DD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 17:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE4C10E09E;
	Mon,  9 Jun 2025 15:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XC4rp9fQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D74C10E09E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 15:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749484019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n+exqXLctb7pIXZ3RystgxyrHuS2KVFbA2BYqyeOIFE=;
 b=XC4rp9fQa0QwyZnZ5mxkkWYU719SOLYzzDPdfYc9YMc74BhTYr7uiW+Fy8JG+zJwCu/G+E
 fzulud8F6lbkad1nXMkmXU4tluA2p7KGrwbVX8C0dQVMo7nqQKrHav5qEnQbpyhrvPh0tF
 yTUdAqW0aHUsFT/odtuuf2HKpPB3Yz8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-5cng422fPumvrHvru2aEwQ-1; Mon, 09 Jun 2025 11:46:55 -0400
X-MC-Unique: 5cng422fPumvrHvru2aEwQ-1
X-Mimecast-MFC-AGG-ID: 5cng422fPumvrHvru2aEwQ_1749484015
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-70e2b627b47so52809907b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 08:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749484015; x=1750088815;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n+exqXLctb7pIXZ3RystgxyrHuS2KVFbA2BYqyeOIFE=;
 b=C1dV0uQ1qS2bE8KnwTGbfclYQOI6LtApQz1Q4eFYiCQrlc+CVgagOerMyPJ5+aqcoF
 HXxCl24nklnR71bUto1qUanec7zaxIIPlJpWEepONImnQOyG9MdB2bqk78FGg774S3LH
 an9bL80V179dqo7VRFxWvoVoMisRhq1cRi93io5WF6fVIoc2TQIW6PQUe90qhNPEKE3Z
 5uXa0IQN7GoyWEZaUtz66r1A5YVHDSJN4pPtszGFKSTnS5jxEkF+Pw5R33ATmhs716yG
 t3LrRRZ11Fq8rk+cx75JhL0CPEmCTwOVHeTSZOMAjTkhEBXp2cmdPgIHpghOU2Qxuu/g
 sWZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSKXSDvgY84dyfj+PjyKyyoXtkWPtfgVNwbki+kFkEvjd2Ktzxm9jF1M/z/iOWMAoJSooQZNfykuE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqFh01FuROk2fRjTBaFxO8W+PPNwqlmG3IjRmT6cRCEO5qTzkP
 8F2JY14Sqb3j3AFqrQDqbr82odwybDXuNcLEgGVrpUcsk4wVnYPXd5XBVnpJKFkq718jJuzp5s0
 q9Wa1y6BMyCf+LAf46MV+rxhrohIyZNrmScYxD1NjKfm8FH8xy8Xb1W3fDGqBoYnuAL39lL1FpT
 7ZQKRTuNL6aQjudKnF3jg2yn1DjhYGYgfwDJsfnTGhG0Dp
X-Gm-Gg: ASbGnctcIC3tYbx+XY/58tpY49DeuLnDApedmRCM3sv4HYuWuCFEWhiyPv7BM8W+2Ky
 T7V9YgYcdCHv/dAEmNt+/Ft6jxVQ9ws0acXEId/7qmqlfoh+fyQyEx89UYIBwtPEyZQUAiSOwOm
 Ia8A==
X-Received: by 2002:a05:690c:6e01:b0:703:b5ae:a3da with SMTP id
 00721157ae682-710f7780069mr202170427b3.32.1749484015322; 
 Mon, 09 Jun 2025 08:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgRLjppwWKXZB1jUIoJUrKcRE8Hsh2yQGLag7V9ja1G6FuEr+HKtMKlvzJYd0t45H9QX7a3xhs/Wg6cBWY+RU=
X-Received: by 2002:a05:690c:6e01:b0:703:b5ae:a3da with SMTP id
 00721157ae682-710f7780069mr202170077b3.32.1749484015044; Mon, 09 Jun 2025
 08:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
 <20250604-of_drm_find_panel_part1-v1-2-c632e12e131d@redhat.com>
 <20250606-radical-rigorous-buzzard-ca09cd@houat>
In-Reply-To: <20250606-radical-rigorous-buzzard-ca09cd@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 9 Jun 2025 10:45:35 -0500
X-Gm-Features: AX0GCFtY8jHY3mIEpHc87Dlcx3YhBZFOXikKGNNpwhmV1GQJR9Ktwv7hXBQw1tI
Message-ID: <CAN9Xe3Si6XwsGOesNKOx9M8PjBkMG2paWXV5gvAnujWih6sqtA@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/panel/samsung-dsicm: Keep up with refcounting
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DgCszCavJlmhZevFXf9RmeBqEFaO6ii-Hd3NGe4kDWI_1749484015
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000041dc6a0637257d53"
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

--00000000000041dc6a0637257d53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 7:03=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:

> On Wed, Jun 04, 2025 at 10:45:11PM -0500, Anusha Srivatsa wrote:
> > Put the panel reference back when driver is no
> > longer using it.
> >
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index
> 0014c497e3fe7d8349a119dbdda30d65d816cccf..3667855ff0d6d1b608c579573de657a=
f7fd14388
> 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1748,6 +1748,7 @@ static int samsung_dsim_host_attach(struct
> mipi_dsi_host *host,
> >                       dsi->out_bridge =3D ERR_PTR(-EINVAL);
> >       }
> >
> > +     drm_panel_put(panel);
> >       of_node_put(remote);
> >
> >       if (IS_ERR(dsi->out_bridge)) {
>
> Explaining in your commit log why you think it's a good idea to put it
> there would be really nice. In particular, it looks super odd to me that
> you would put the panel reference in attach.
>
Also, your patch doesn't work, and you have a reference inbalance. You
> have one taken by the panel driver, put in remove. You have one in
> drm_panel_add, put in drm_panel_remove. Which reference do you put here?
>
> This applies to your other patches too.
>
> Yes, I should get the ref in of_drm_find_panel() to put it here. With tha=
t
said, all callers
of of_drm_find_panel() should be converted instead of the small batch that
this series addresses.

Anusha

> Maxime
>

--00000000000041dc6a0637257d53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 6, =
2025 at 7:03=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.=
org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Wed, Jun 04, 2025 at 10:45:11PM -0500, Anusha Sri=
vatsa wrote:<br>
&gt; Put the panel reference back when driver is no<br>
&gt; longer using it.<br>
&gt; <br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/bridge/samsung-dsim.c | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/b=
ridge/samsung-dsim.c<br>
&gt; index 0014c497e3fe7d8349a119dbdda30d65d816cccf..3667855ff0d6d1b608c579=
573de657af7fd14388 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/samsung-dsim.c<br>
&gt; +++ b/drivers/gpu/drm/bridge/samsung-dsim.c<br>
&gt; @@ -1748,6 +1748,7 @@ static int samsung_dsim_host_attach(struct mipi_=
dsi_host *host,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dsi-&gt;out_bridge =3D ERR_PTR(-EINVAL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_panel_put(panel);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(remote);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dsi-&gt;out_bridge)) {<br>
<br>
Explaining in your commit log why you think it&#39;s a good idea to put it<=
br>
there would be really nice. In particular, it looks super odd to me that<br=
>
you would put the panel reference in attach. <br></blockquote><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
Also, your patch doesn&#39;t work, and you have a reference inbalance. You<=
br>
have one taken by the panel driver, put in remove. You have one in<br>
drm_panel_add, put in drm_panel_remove. Which reference do you put here?<br=
>
<br>
This applies to your other patches too.<br>
<br></blockquote><div>Yes, I should get the ref in of_drm_find_panel() to p=
ut it here. With that said, all callers=C2=A0</div><div>of of_drm_find_pane=
l() should be converted instead of the small batch that this series address=
es.</div><div><br></div><div>Anusha</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Maxime<br>
</blockquote></div></div>

--00000000000041dc6a0637257d53--

