Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7511A792ED
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 18:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC34A10E829;
	Wed,  2 Apr 2025 16:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="apWjXtjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC16610E829
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 16:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743610904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oDL6a1pc8Id3LbxWTUismQ75BV7pp0IqOxg/VNyJigU=;
 b=apWjXtjrewFkWQ4psypD03umSrKJB4RHqW8VNHIEWqljEkOv7ckk4ut43C4A9bbtChYIOi
 mrZVbwYY4D1D1pdjBGOhraiJ5WdV7oUaQ8R+sX52HE7yaxxav+SfeI5xxmrC9c+9OmXPdn
 GSFOaxtZjJKfKkouqKZatVl29shFfgY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-KzjWPSuZOD2ujNaMmDEF-Q-1; Wed, 02 Apr 2025 12:21:41 -0400
X-MC-Unique: KzjWPSuZOD2ujNaMmDEF-Q-1
X-Mimecast-MFC-AGG-ID: KzjWPSuZOD2ujNaMmDEF-Q_1743610900
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-703b2fa08ddso22721697b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 09:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743610900; x=1744215700;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oDL6a1pc8Id3LbxWTUismQ75BV7pp0IqOxg/VNyJigU=;
 b=j7jyF1D0Mjzvy3KovkTPTHPyrJBJ0I2e82dLrYhI/HslEaRHOhNhYxYf4miMn9Odjd
 eIf5RoEviJCdag3csIx3ZxT6jU4Yz3W00dBuKwxOPxSdTV9Ic1/Nvrkyt39Wr/V6Z6NR
 57YRxak2GRxcwb1q9u0Sfnr4f4WeHA0u4A2hsdEEIbzryiDWDepnNpww8NrXsRL+FtIU
 fv5Nru4u6uGVXbLnTC7F+BDWn5rG0Z2iFh9oUpp40LUa9p9Bjz8SbDDF+8jcStX+iIyW
 OeReUJAA1Yqzo5WxG5Pndx/Bdb/Y2a/1sU6ySGxiK4K+jqn1wVYleiAWEDEZZETSrBV/
 WvOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRIE61ui8VbWIGpZmy3jTD29GoXc5zI1BL4f6+godB0p0SjDU1HawyBVB+LNwm8sp2gIkroVluHQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzORINhrJQANYwNYgfmVsnNXDqkdQTTVmJPxO5E40xqUizQsgSj
 xCbHYPxF9ZxKaGwsra73K/z88MsJa2/qbJymKYVBP7kDPIO8gyImJxnbnfXX+4L7LiICmPh+Fcl
 V4BT8r79sGu6djipA0SY9h3/7oUtK/OPWXjj6mfbIMsVCGEuL6XYkjk7FvU1PfrKZU91BS4NEu8
 EZe76NPcAXPt9RZomDQz8fWbxyoxmhtIfAYunOfu6Y
X-Gm-Gg: ASbGncvTJ/W6aajXXnGj2UyzBFc412XhnY+BLZq92lYeBBxLdYwLaIeaqLxKFpZOZRu
 0P+/Z+pDC2bLy05SmFXF3cjV8ScugUEc41HsBR2M555DL1NDJZ3w9/CQ2mJ0ZGAAJbsej89U=
X-Received: by 2002:a05:690c:6c08:b0:6fe:bf9d:5de6 with SMTP id
 00721157ae682-70256eeb8b5mr238643827b3.0.1743610900533; 
 Wed, 02 Apr 2025 09:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxEgyuwz9DGIMdqSsleYSyBFFr9SpLkkziyBULKDDNq6BGoyER6n9u1BfaD7XG2FkLXjDE7J1qbJyTSiHIm9A=
X-Received: by 2002:a05:690c:6c08:b0:6fe:bf9d:5de6 with SMTP id
 00721157ae682-70256eeb8b5mr238643417b3.0.1743610900226; Wed, 02 Apr 2025
 09:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
 <74718ea9-30e5-4d85-9f19-e597ab41af6e@linaro.org>
In-Reply-To: <74718ea9-30e5-4d85-9f19-e597ab41af6e@linaro.org>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 2 Apr 2025 11:20:07 -0400
X-Gm-Features: AQ5f1JqVmw4tHhPV31a6quGdq4RO3eHOJOesflgWjgqLrTg5eR3pOt6UzpbimsY
Message-ID: <CAN9Xe3SVFQYXxroRpoCs1R6diA7tA_7yjZjBwk2iW=9GgHQqfQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] drm/panel: Use refcounted allocation in place of
 devm_kzalloc()
To: neil.armstrong@linaro.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2VTe9ph1oLH6uYYBJCXRNmd-CMW4eHjEj9bdZB8sxAQ_1743610900
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000055b55b0631ce0cb4"
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

--00000000000055b55b0631ce0cb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 10:24=E2=80=AFAM Neil Armstrong <neil.armstrong@lina=
ro.org>
wrote:

> On 01/04/2025 18:03, Anusha Srivatsa wrote:
> > Start converting drivers to use the API - devm_drm_panel_alloc().
> >
> > This series addresses only 10 drivers. There are 98 more to go. Sending
> this
> > series to mostly get feedback. if any change is required, it will be
> > incorporated in the next version and in the next series that will
> > address the remaining drivers.
> >
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> > Anusha Srivatsa (10):
> >        panel/abt-y030xx067a: Use the refcounted allocation in place of
> devm_kzalloc()
> >        panel/arm-versatile:  Use the refcounted allocation in place of
> devm_kzalloc()
> >        panel/z00t-tm5p5-n35596: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/auo-a030jtn01: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/bf060y8m-aj0: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/th101mb31ig002-28a: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/boe-tv101wum-ll2: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/dsi-cm: Use refcounted allocation in place of devm_kzalloc=
()
> >        panel/ebbg-ft8719: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/panel-edp: Use refcounted allocation in place of
> devm_kzalloc()
> >
> >   drivers/gpu/drm/panel/panel-abt-y030xx067a.c         | 10 ++++------
> >   drivers/gpu/drm/panel/panel-arm-versatile.c          | 11 +++++------
> >   drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 11 +++++------
> >   drivers/gpu/drm/panel/panel-auo-a030jtn01.c          | 10 ++++------
> >   drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c       | 11 +++++------
> >   drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 +++++------
> >   drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c       | 10 +++++-----
> >   drivers/gpu/drm/panel/panel-dsi-cm.c                 | 10 ++++------
> >   drivers/gpu/drm/panel/panel-ebbg-ft8719.c            | 11 +++++------
> >   drivers/gpu/drm/panel/panel-edp.c                    |  9 ++++-----
> >   10 files changed, 46 insertions(+), 58 deletions(-)
> > ---
> > base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057
> > change-id: 20250401-b4-drm-panel-mass-driver-convert-ddca32e95d16
> >
> > Best regards,
>
> Looks good to me
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


Thanks!

Anusha

--00000000000055b55b0631ce0cb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 2, =
2025 at 10:24=E2=80=AFAM Neil Armstrong &lt;<a href=3D"mailto:neil.armstron=
g@linaro.org">neil.armstrong@linaro.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On 01/04/2025 18:03, Anusha Srivatsa=
 wrote:<br>
&gt; Start converting drivers to use the API - devm_drm_panel_alloc().<br>
&gt; <br>
&gt; This series addresses only 10 drivers. There are 98 more to go. Sendin=
g this<br>
&gt; series to mostly get feedback. if any change is required, it will be<b=
r>
&gt; incorporated in the next version and in the next series that will<br>
&gt; address the remaining drivers.<br>
&gt; <br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; Anusha Srivatsa (10):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/abt-y030xx067a: Use the refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/arm-versatile:=C2=A0 Use the refcount=
ed allocation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/z00t-tm5p5-n35596: Use refcounted all=
ocation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/auo-a030jtn01: Use refcounted allocat=
ion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/bf060y8m-aj0: Use refcounted allocati=
on in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/th101mb31ig002-28a: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/boe-tv101wum-ll2: Use refcounted allo=
cation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/dsi-cm: Use refcounted allocation in =
place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/ebbg-ft8719: Use refcounted allocatio=
n in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/panel-edp: Use refcounted allocation =
in place of devm_kzalloc()<br>
&gt; <br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-abt-y030xx067a.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-arm-versatile.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 11 =
+++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-auo-a030jtn01.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 =
+++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-dsi-cm.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-ebbg-ft8719.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-edp.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++++-----<br>
&gt;=C2=A0 =C2=A010 files changed, 46 insertions(+), 58 deletions(-)<br>
&gt; ---<br>
&gt; base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057<br>
&gt; change-id: 20250401-b4-drm-panel-mass-driver-convert-ddca32e95d16<br>
&gt; <br>
&gt; Best regards,<br>
<br>
Looks good to me<br>
<br>
Reviewed-by: Neil Armstrong &lt;<a href=3D"mailto:neil.armstrong@linaro.org=
" target=3D"_blank">neil.armstrong@linaro.org</a>&gt;</blockquote><div><br>=
</div><div>Thanks!</div><div><br></div><div>Anusha <br></div></div></div>

--00000000000055b55b0631ce0cb4--

