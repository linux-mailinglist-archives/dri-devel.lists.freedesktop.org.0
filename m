Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1DAB1EA2
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 23:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED17110EAF5;
	Fri,  9 May 2025 21:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AyGrc0L1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0394610EAF6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 21:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746824454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GxeeDi1H5MJB3Qfb+8ddZTQgXdj+sj14UlmauzFXdmw=;
 b=AyGrc0L1YzSA7iV7OZYcL81eXahi0TVNQ9ltj7ub121kg8Ct26kk9E9z5tcOWtVz9Oi0Br
 B5ysO3FhFTKeuu7uFJ8IipoSdQZVN0MdozzX287zL+cbyJhwHdEANX7QIb58of771B/yOm
 I9TOc7u4D5TebPJgVh0ctXIg+yviknA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-g6f7DAqVNI2dhzOQGNVR9A-1; Fri, 09 May 2025 17:00:50 -0400
X-MC-Unique: g6f7DAqVNI2dhzOQGNVR9A-1
X-Mimecast-MFC-AGG-ID: g6f7DAqVNI2dhzOQGNVR9A_1746824450
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-703d7a66d77so40641587b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 14:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746824450; x=1747429250;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GxeeDi1H5MJB3Qfb+8ddZTQgXdj+sj14UlmauzFXdmw=;
 b=jYNt97WOE0UteEBnXnfC6iLcYkbUlq+uQBjo4Q9Ytxle46y+DEMRV2z85Y3o2JHYGl
 aLNt0qoRWJNF/FOb79Y28xWREQL42hn589Rx5Y6t2UlBaJQ/jblcPxM4/iDU6biAd/Up
 eSaSLCFahddujdHB3dn7zePZ1FOGoGrJfHz0G90dcpHWC6ojGCVgQwlNCzwuPOcUUzoE
 nJHkNn7/P3/089Dvuj0JCNEw6Mn/D3hrFeO/rXONA2tLSGrVm8Ji3ZdvMCPhh4C4lrwK
 GVf2oAaIaCvGp3/AkPJJKD4A/euZOVU0LOp4lEjDjS2TZx7bztJ/KLE8PxbDCmYT6Fn5
 tu1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNRigatYKc2jGAmm02hF8qeIKPOwxr3IUmGweYhT3sT48ft4DfvhNVSZPncqfPnANOqaRjcLPzbUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxsPKRTbcHrOrIqDiIKzX13xSvFClAupe+vLVYVyBGPesW4KA0
 HehBsuXv0R52mjyrab+t5oqYS2zqmO4fbZ7Ccfl0dF/H3He7zDz43J0V6+VZ8XVQLKX2xQLxMtW
 urNSpTtEPq9BuDQk2ElXKvwkRjsQzltq7jKIJLgYT4r68StSkpCEhJc1XpEbNViwv7HjUmSYZxB
 SnKXyyklGIspjivyPfqXesrccYB9MdZRWpnsJ0kKUo
X-Gm-Gg: ASbGncsTFOJALsWDo5Wh1wcklTCV5Hl67/UZwalWL8973dIsglFnejJO8Iga12ji5zv
 JOEo8wmsoYlXLrMGBFwvzPibLcv00zzPSKR+K0mzzpevHVQvyq7Q+YacV70KgkkkW/hI=
X-Received: by 2002:a05:690c:4a13:b0:6f9:4c00:53ae with SMTP id
 00721157ae682-70a3fe639a7mr66359777b3.8.1746824449927; 
 Fri, 09 May 2025 14:00:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu4gFpdDMPdqrm3koI5DF4B/M2VVfyv/zoOi8I1BG0UWxlvYeEw87dshOpo9AfvNFUdksvtnpxYysUb+Askfc=
X-Received: by 2002:a05:690c:4a13:b0:6f9:4c00:53ae with SMTP id
 00721157ae682-70a3fe639a7mr66359047b3.8.1746824449542; Fri, 09 May 2025
 14:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-6-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-6-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 15:57:30 -0400
X-Gm-Features: AX0GCFsXRmzCU1YWdcE7qOGXX4MM5M9X_-TsxuZaGU2s0VoAZtFUNeQly9oXeMk
Message-ID: <CAN9Xe3QkjfNqezBOV1CpvfiCGJZ89on=EHWHcE1oB6z_vjTUjg@mail.gmail.com>
Subject: Re: [PATCH v3 06/22] drm/bridge: nxp-ptn3460: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vY57oxDEDREQizpKflB-KnKk-UbDxbG5t9goI45I4Ho_1746824450
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ccdd1f0634ba42b2"
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

--000000000000ccdd1f0634ba42b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:56=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com>
wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/nxp-ptn3460.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> index
> 25d7c415478b14ef634bff4185a8dd8e866be0c6..7acb11f16dc19e87a84cc765b1cebef=
158662c00
> 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -261,10 +261,10 @@ static int ptn3460_probe(struct i2c_client *client)
>         struct drm_bridge *panel_bridge;
>         int ret;
>
> -       ptn_bridge =3D devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL)=
;
> -       if (!ptn_bridge) {
> -               return -ENOMEM;
> -       }
> +       ptn_bridge =3D devm_drm_bridge_alloc(dev, struct ptn3460_bridge,
> bridge,
> +                                          &ptn3460_bridge_funcs);
> +       if (IS_ERR(ptn_bridge))
> +               return PTR_ERR(ptn_bridge);
>
>         panel_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
>         if (IS_ERR(panel_bridge))
> @@ -300,7 +300,6 @@ static int ptn3460_probe(struct i2c_client *client)
>                 return ret;
>         }
>
> -       ptn_bridge->bridge.funcs =3D &ptn3460_bridge_funcs;
>         ptn_bridge->bridge.ops =3D DRM_BRIDGE_OP_EDID;
>         ptn_bridge->bridge.type =3D DRM_MODE_CONNECTOR_LVDS;
>         ptn_bridge->bridge.of_node =3D dev->of_node;
>
>
Looks good to me!
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>


> --
> 2.49.0
>
>

--000000000000ccdd1f0634ba42b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 9, =
2025 at 9:56=E2=80=AFAM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@b=
ootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">This is the new API for allocating DRM=
 bridges.<br>
<br>
Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.co=
m" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/nxp-ptn3460.c | 9 ++++-----<br>
=C2=A01 file changed, 4 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/=
nxp-ptn3460.c<br>
index 25d7c415478b14ef634bff4185a8dd8e866be0c6..7acb11f16dc19e87a84cc765b1c=
ebef158662c00 100644<br>
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c<br>
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c<br>
@@ -261,10 +261,10 @@ static int ptn3460_probe(struct i2c_client *client)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_bridge *panel_bridge;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ptn_bridge =3D devm_kzalloc(dev, sizeof(*ptn_br=
idge), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ptn_bridge) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ptn_bridge =3D devm_drm_bridge_alloc(dev, struc=
t ptn3460_bridge, bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;ptn3460_bridge_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(ptn_bridge))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(ptn_=
bridge);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel_bridge =3D devm_drm_of_get_bridge(dev, de=
v-&gt;of_node, 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(panel_bridge))<br>
@@ -300,7 +300,6 @@ static int ptn3460_probe(struct i2c_client *client)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ptn_bridge-&gt;bridge.funcs =3D &amp;ptn3460_br=
idge_funcs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptn_bridge-&gt;bridge.ops =3D DRM_BRIDGE_OP_EDI=
D;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptn_bridge-&gt;bridge.type =3D DRM_MODE_CONNECT=
OR_LVDS;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptn_bridge-&gt;bridge.of_node =3D dev-&gt;of_no=
de;<br>
<br></blockquote><div><br></div><div>Looks good to me!</div><div>Reviewed-b=
y: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com">asrivats@redh=
at.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--000000000000ccdd1f0634ba42b2--

