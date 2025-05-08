Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA05AB02A3
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B355B10E960;
	Thu,  8 May 2025 18:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TJrT8AGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B97B10E073
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 18:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746728723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1dOaw2u8KQZnTxcmyzgkwbEdz5GYDBzXqfiof4lW7iQ=;
 b=TJrT8AGjv+IMAkML9NHE6QNjVQgbbqewzCsKFXL0akZ1Ua730VmFpABGJHSXQ/VO66Hla2
 Bxcxxn7Rphyfm2eIRevQjLp9tckDu6LHxyqPMJ3v9LYmt1oCa52h4vmH7vqYNCRzSTVEnQ
 oUMxt7w8eZxAsdyzx+mVz3rRUlMcJb4=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-Iy7-RgxmN26Cm-yRj8LAMw-1; Thu, 08 May 2025 14:25:20 -0400
X-MC-Unique: Iy7-RgxmN26Cm-yRj8LAMw-1
X-Mimecast-MFC-AGG-ID: Iy7-RgxmN26Cm-yRj8LAMw_1746728719
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-708b13627abso22262627b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 11:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746728719; x=1747333519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1dOaw2u8KQZnTxcmyzgkwbEdz5GYDBzXqfiof4lW7iQ=;
 b=bqIP/gaPYb9qMScRsgM0uU9APU1BKKlvERv9RVrT0YtXKXEvUw4TuU/PfEiPLqwMyg
 6DuzVIP305W2Uwa/yqLrP2crx534lI1xPFmQSc2QoWxX807stevI7BwCYzX0qA2dHhEe
 O9TDEwNp47U/gn50YvYbzbnOJTJW/B7harGhrKnhl2PkUQI+z6RWR7UGFYgPr94HD0v2
 bKtpShhuQle0aU8lwXT7zOBqI61cJj3xUB2JVqaPd3Pnl0rTTm9h1wTKdnDdCgMjeMO8
 2KdYOZ4SK7C6ECILQznKjcLT1xkB+to6di2xY+n+YcOOtEVYd024ROV2sUyFha7Zd38i
 GvHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX09wJh31ZKuW5atey7zOh7N/knKzaydzRZ7cX/5HN6k4DmEJBhI1xsm1oK+9OgwzPTKEOj8LnJwpU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI4xjNm3bN1dKfrzFrAxVIA7fs/aozDZd7id2Mgsbb527WmH3o
 T1TuOTVmo2tcsHILjx1bIs+zgvhv0POWDIXykuqDFj4TR2G+a+CbC53I0B7OlsHW3K/4hgmOCH0
 XKD1/8HUcGS2eSReQsm1vymWxgGMgwxhBD5E1c5SYmkPCtZ2A8NPhdRSk9q+yOx+kqn1RBmx58c
 S7r7mAo+HMgC/aihX5Z5hYYosuseoHTLziBG497R5Q
X-Gm-Gg: ASbGncvuFAc3Dj3wgTdGLvjgwncAjw7FUb8c6MzOWXgIS6OHrhuMJ4OY1TCJOJ6xnD4
 Eg7edLH559aO/Pdwds1l9iXodQGhNCKY79fL/NPRu0u4qv5hr2szou8tCCsNSWJSFzzU=
X-Received: by 2002:a05:690c:4b13:b0:703:ad10:a71b with SMTP id
 00721157ae682-70a3fb171c0mr6855377b3.29.1746728719510; 
 Thu, 08 May 2025 11:25:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqzVPpgOIiPeVcpc1c85FvVAGPb5jIL8nj0gE+BEYqBS2VS1CLVYZM8FQahSPc6BCLJiAKitydFXdbLx70wI0=
X-Received: by 2002:a05:690c:4b13:b0:703:ad10:a71b with SMTP id
 00721157ae682-70a3fb171c0mr6854997b3.29.1746728719153; Thu, 08 May 2025
 11:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
 <69543597-5e7e-454a-b83e-dd169a95baca@linaro.org>
In-Reply-To: <69543597-5e7e-454a-b83e-dd169a95baca@linaro.org>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 8 May 2025 13:24:34 -0400
X-Gm-Features: AX0GCFuCYFHpINPdKOjUvf-VRggoepE79A9eW2AjlT0gtzy42q3Xm8LcoHPdIfM
Message-ID: <CAN9Xe3SEk2hqBO4b3c3rUPQWS5pfu2KuNx2_z8HchPNw1wHHwg@mail.gmail.com>
Subject: Re: [PATCH 00/46] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part3
To: neil.armstrong@linaro.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>, Artur Weber <aweber.kernel@gmail.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>, Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4z_tO6OkIb4mV_Dv_ergmT4IL5NjP1_8HAG0rIXDv5Q_1746728719
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d3109b0634a3f81f"
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

--000000000000d3109b0634a3f81f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 6:04=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org>
wrote:

> On 03/04/2025 22:20, Anusha Srivatsa wrote:
> > Start converting drivers to use the API - devm_drm_panel_alloc().
> >
> > Final set of drivers.
> >
> > Part 1 of the conversion :
> https://patchwork.freedesktop.org/series/147082/
> > Part 2 of the conversion :
> https://patchwork.freedesktop.org/series/147157/
> >
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> > Anusha Srivatsa (46):
> >        panel/orisetech-otm8009a: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/raydium-rm67191: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/raydium-rm67200: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/raydium-rm68200: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/raydium-rm692e5: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/raydium-rm69380: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/ronbo-rb070d30: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-ams581vf01: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-ams639rq08: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-atna33xc20: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-db7430: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-ld9040: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-s6d16d0: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-s6d27a1: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-s6d7aa0: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-s6e3fa7: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-s6e3ha2: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-s6e3ha8: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-s6e63j0x03: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/s6e88a0-ams427ap24: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-s6e8aa0: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/samsung-sofef00: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/seiko-43wvf1g: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/sharp-ls037v7dw01: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/sharp-ls060t1sx01: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/sitronix-st7701: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/sitronix-st7703: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/sitronix-st7789v: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/sony-acx565akm: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/sony-td4353-jdi: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/truly-nt35521: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/panel-summit: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/synaptics-r63353: allocation in place of devm_kzalloc()
> >        panel/tpo-td028ttec1: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/tpo-td043mtea1: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/tpo-tpg110: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/visionox-r66451: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/visionox-rm69299: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/visionox-rm692e5.c: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/visionox-vtdr6130: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/widechips-ws2401: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/xinpeng-xpp055c272: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/s6e88a0-ams452ef01: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/nec-nl8048hl11: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/panel-lvds: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/lg-lb035q02: Use refcounted allocation in place of
> devm_kzalloc()
> >
> >   drivers/gpu/drm/panel/panel-lg-lb035q02.c                | 10
> ++++------
> >   drivers/gpu/drm/panel/panel-lvds.c                       | 12
> +++++-------
> >   drivers/gpu/drm/panel/panel-nec-nl8048hl11.c             | 10
> ++++------
> >   drivers/gpu/drm/panel/panel-orisetech-otm8009a.c         | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-raydium-rm67191.c            | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-raydium-rm67200.c            | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-raydium-rm68200.c            | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-raydium-rm692e5.c            | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-raydium-rm69380.c            | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-ronbo-rb070d30.c             | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-samsung-ams581vf01.c         | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-samsung-ams639rq08.c         | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-samsung-atna33xc20.c         | 11
> ++++++-----
> >   drivers/gpu/drm/panel/panel-samsung-db7430.c             | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-samsung-ld9040.c             | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-samsung-s6d16d0.c            | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-samsung-s6d27a1.c            | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c            | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c            | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c            | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c            | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c         | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c            | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-samsung-sofef00.c            | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-seiko-43wvf1g.c              | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c          | 10
> ++++------
> >   drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c          | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-sitronix-st7701.c            |  8 ++++---=
-
> >   drivers/gpu/drm/panel/panel-sitronix-st7703.c            | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-sitronix-st7789v.c           | 10
> ++++------
> >   drivers/gpu/drm/panel/panel-sony-acx565akm.c             | 10
> ++++------
> >   drivers/gpu/drm/panel/panel-sony-td4353-jdi.c            | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c   | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-summit.c                     | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-synaptics-r63353.c           | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-tpo-td028ttec1.c             | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-tpo-td043mtea1.c             | 10
> ++++------
> >   drivers/gpu/drm/panel/panel-tpo-tpg110.c                 | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-visionox-r66451.c            |  9 +++++--=
--
> >   drivers/gpu/drm/panel/panel-visionox-rm69299.c           | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-visionox-rm692e5.c           | 10
> +++++-----
> >   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c          | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-widechips-ws2401.c           | 11
> +++++------
> >   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c         | 10
> ++++------
> >   46 files changed, 223 insertions(+), 257 deletions(-)
> > ---
> > base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057
> > change-id: 20250402-b4-drm_panel_mass_driver_convert_part3-9b06bf9d3b22
> >
> > Best regards,
>
> With the patch 41 build failure fixed:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> Hey Neil,
Many thanks for the quick feedback. Working on resending with the fixes
suggested. I am seeing an error when I do a trailer update using b4:
 Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> (=E2=9C=97 DKIM/li=
naro.org)

^^^^^^ not seeing this with other reviews.
WIll send the new version once I have clarity on why I get this error.

Thanks!
Anusha

--000000000000d3109b0634a3f81f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 7, =
2025 at 6:04=E2=80=AFAM Neil Armstrong &lt;<a href=3D"mailto:neil.armstrong=
@linaro.org">neil.armstrong@linaro.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On 03/04/2025 22:20, Anusha Srivatsa =
wrote:<br>
&gt; Start converting drivers to use the API - devm_drm_panel_alloc().<br>
&gt; <br>
&gt; Final set of drivers.<br>
&gt; <br>
&gt; Part 1 of the conversion : <a href=3D"https://patchwork.freedesktop.or=
g/series/147082/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.fr=
eedesktop.org/series/147082/</a><br>
&gt; Part 2 of the conversion : <a href=3D"https://patchwork.freedesktop.or=
g/series/147157/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.fr=
eedesktop.org/series/147157/</a><br>
&gt; <br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; Anusha Srivatsa (46):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/orisetech-otm8009a: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/raydium-rm67191: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/raydium-rm67200: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/raydium-rm68200: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/raydium-rm692e5: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/raydium-rm69380: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/ronbo-rb070d30: Use refcounted alloca=
tion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-ams581vf01: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-ams639rq08: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-atna33xc20: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-db7430: Use refcounted alloca=
tion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-ld9040: Use refcounted alloca=
tion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-s6d16d0: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-s6d27a1: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-s6d7aa0: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-s6e3fa7: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-s6e3ha2: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-s6e3ha8: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-s6e63j0x03: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/s6e88a0-ams427ap24: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-s6e8aa0: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/samsung-sofef00: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/seiko-43wvf1g: Use refcounted allocat=
ion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/sharp-ls037v7dw01: Use refcounted all=
ocation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/sharp-ls060t1sx01: Use refcounted all=
ocation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/sitronix-st7701: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/sitronix-st7703: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/sitronix-st7789v: Use refcounted allo=
cation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/sony-acx565akm: Use refcounted alloca=
tion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/sony-td4353-jdi: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/truly-nt35521: Use refcounted allocat=
ion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/panel-summit: Use refcounted allocati=
on in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/synaptics-r63353: allocation in place=
 of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/tpo-td028ttec1: Use refcounted alloca=
tion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/tpo-td043mtea1: Use refcounted alloca=
tion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/tpo-tpg110: Use refcounted allocation=
 in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/visionox-r66451: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/visionox-rm69299: Use refcounted allo=
cation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/visionox-rm692e5.c: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/visionox-vtdr6130: Use refcounted all=
ocation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/widechips-ws2401: Use refcounted allo=
cation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/xinpeng-xpp055c272: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/s6e88a0-ams452ef01: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/nec-nl8048hl11: Use refcounted alloca=
tion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/panel-lvds: Use refcounted allocation=
 in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/lg-lb035q02: Use refcounted allocatio=
n in place of devm_kzalloc()<br>
&gt; <br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-lg-lb035q02.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-lvds.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++++------=
-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-nec-nl8048hl11.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-orisetech-otm8009a.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-raydium-rm67191.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-raydium-rm67200.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-raydium-rm68200.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-raydium-rm692e5.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-raydium-rm69380.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-ronbo-rb070d30.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-ams581vf01.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-ams639rq08.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-atna33xc20.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-db7430.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-ld9040.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-s6d16d0.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-s6d27a1.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c |=
 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c |=
 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-samsung-sofef00.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-seiko-43wvf1g.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-sitronix-st7701.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-sitronix-st7703.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-sitronix-st7789v.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-sony-acx565akm.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-sony-td4353-jdi.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c=C2=
=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-summit.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-synaptics-r63353.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-tpo-td028ttec1.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-tpo-td043mtea1.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-tpo-tpg110.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-visionox-r66451.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +++++----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-visionox-rm69299.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-visionox-rm692e5.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-visionox-vtdr6130.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-widechips-ws2401.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++------<br>
&gt;=C2=A0 =C2=A046 files changed, 223 insertions(+), 257 deletions(-)<br>
&gt; ---<br>
&gt; base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057<br>
&gt; change-id: 20250402-b4-drm_panel_mass_driver_convert_part3-9b06bf9d3b2=
2<br>
&gt; <br>
&gt; Best regards,<br>
<br>
With the patch 41 build failure fixed:<br>
Reviewed-by: Neil Armstrong &lt;<a href=3D"mailto:neil.armstrong@linaro.org=
" target=3D"_blank">neil.armstrong@linaro.org</a>&gt;<br>
<br></blockquote><div>Hey Neil,</div><div>Many thanks for the quick feedbac=
k. Working on resending with the fixes suggested. I am seeing an error when=
 I do a trailer update using b4:</div><div>=C2=A0Reviewed-by: Neil Armstron=
g &lt;<a href=3D"mailto:neil.armstrong@linaro.org">neil.armstrong@linaro.or=
g</a>&gt; (=E2=9C=97 DKIM/<a href=3D"http://linaro.org">linaro.org</a>)</di=
v><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^ not seeing this with other reviews.</div><d=
iv>WIll send the new version once I have clarity on why I get this error.</=
div><div><br></div><div>Thanks!</div><div>Anusha</div></div></div>

--000000000000d3109b0634a3f81f--

