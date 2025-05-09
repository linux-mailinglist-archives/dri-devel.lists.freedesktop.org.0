Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101CDAB1F04
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 23:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DD010EAF8;
	Fri,  9 May 2025 21:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aEUBJlsj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6820B10EAF9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 21:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746825766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LdVqfKmThJm07P0exGRK9hDnCyE1RcHB+N7uNiEdGxE=;
 b=aEUBJlsjsoqSS758Z15DQxAz/tgymc7U2zEixS+py06kPyjKmv7+RoDaFwSqiCWgMjqfBQ
 JRe+BrE0XANc8FAlGGkiu4o2YVdsKm7ZWKrYGy8zUKIKtkRGLcM5PzRwzcMV0psxNMrMaL
 gextq4tHP0pUiSG9kRXiQL0YmZypXDU=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-qLjafhClPGS4F2OStwtUXg-1; Fri, 09 May 2025 17:22:45 -0400
X-MC-Unique: qLjafhClPGS4F2OStwtUXg-1
X-Mimecast-MFC-AGG-ID: qLjafhClPGS4F2OStwtUXg_1746825764
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-70a4be14d80so9975787b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 14:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746825764; x=1747430564;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LdVqfKmThJm07P0exGRK9hDnCyE1RcHB+N7uNiEdGxE=;
 b=QrDyu13bcFhTiMiJ+mGOPk70eqbFsNDtXJhKRmVgxtrrptWbSbaExIc6OTL+79z2ls
 zR7BwWf7gmtf4BylYrN51rFkA9xcLjufj9PDpSEOulJRq5Bi5cq0de1ynFH/KFoJBrgv
 djRFeWP71t2benhlKNgwpm7ED6i0T3GwOCrxPyUBLCkmM+uCYLYphxs3RQtbJYFQTMc2
 F8c5eiKZ1q0m3dSLNS9EatJTHGTdG7tDJxYnHW3l26KBLSaYjU0PeAiTH8H4fhR6Rp5X
 Ay6Xa4dZFHj7/1b1YIscO5J8f0kECYTvxKC3eXrx1A9vhZoHJLgJyBiBudtbNP5Uto/g
 xMWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV+EMiW7Df/93Ltf6hldGUSuhybxIX1ggo96IpeaTlav1pkGg2HxbGPt82gxOZuf/2wBUVOIZoueY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyd6dy5JT/DcDXgqfsY5J1xXkgbdrV9QKgzN1hWW6IyTZT08rGL
 a34pyVGPC6HA18h9Kyz884EiB8EyghI6j3yRANFFT+ZswndzqhY8rO6ylu1/XQZCuevYG640Loe
 cmeouZ+a8rRgIM8uI0fopJbc1NZOPxtjp/hM+a/wgDAlCKOOEzFkQA1cpjYvXdtZ3X5C/uwlBIP
 L4zbYXGGgArxkUUhuFm809GL9IqVPQWTIkuvzQPzfz
X-Gm-Gg: ASbGncsVzj2PAsN42fkxZLd1aL+rK2Ntn3rG3n/Nnd3O9XNHmn0rkL4LGdfvZLPWZWI
 ZUKrx/db49BRgSMdSboHHzOsbcwoQZOxDJX4pXPts248lFVFpXIWRddTNli9wWk+icn4=
X-Received: by 2002:a05:690c:7009:b0:708:ca5c:a6a8 with SMTP id
 00721157ae682-70a3f9f0da9mr67450787b3.8.1746825764623; 
 Fri, 09 May 2025 14:22:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDopTSrlnJzyCgp+EYSBa6JxbPJx4/LP7OI5Sp1VZU6wuPOj7Hxz+KUeYl6vqorEM3qIF+Lo36tLM2w2wHZDE=
X-Received: by 2002:a05:690c:7009:b0:708:ca5c:a6a8 with SMTP id
 00721157ae682-70a3f9f0da9mr67450257b3.8.1746825764261; Fri, 09 May 2025
 14:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-9-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-9-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 16:19:24 -0400
X-Gm-Features: AX0GCFsNWXW9muWWo4zVoZUeGmeN9R6JfxdUEGKDhysqIg1Bcsv5yzV0yIetNsM
Message-ID: <CAN9Xe3RYD9es-0Zivmg=weZWw-bT4mS_ATTAX7e76ytyyQGPEA@mail.gmail.com>
Subject: Re: [PATCH v3 09/22] drm/omap: dss: dsi: convert to
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
 linux-stm32@st-md-mailman.stormreply.com, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nLj5pyruDjsxMeNy8MdM_QSGyns50FZSHpFu3H15YKU_1746825764
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000029e5530634ba91dc"
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

--00000000000029e5530634ba91dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:56=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com>
wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c
> b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index
> 91ee63bfe0bc73e28877d0383812225867e167a4..b129e5a8d791507098c7b8d1bc54f54=
c4b453954
> 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4701,7 +4701,6 @@ static const struct drm_bridge_funcs
> dsi_bridge_funcs =3D {
>
>  static void dsi_bridge_init(struct dsi_data *dsi)
>  {
> -       dsi->bridge.funcs =3D &dsi_bridge_funcs;
>         dsi->bridge.of_node =3D dsi->host.dev->of_node;
>         dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
>
> @@ -4894,9 +4893,9 @@ static int dsi_probe(struct platform_device *pdev)
>         unsigned int i;
>         int r;
>
> -       dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> -       if (!dsi)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(dev, struct dsi_data, bridge,
> &dsi_bridge_funcs);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>
>         dsi->dev =3D dev;
>         dev_set_drvdata(dev, dsi);
>
>
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks,
Anusha

> --
> 2.49.0
>
>

--00000000000029e5530634ba91dc
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
<br>
---<br>
<br>
Cc: Tomi Valkeinen &lt;<a href=3D"mailto:tomi.valkeinen@ideasonboard.com" t=
arget=3D"_blank">tomi.valkeinen@ideasonboard.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/omapdrm/dss/dsi.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/ds=
s/dsi.c<br>
index 91ee63bfe0bc73e28877d0383812225867e167a4..b129e5a8d791507098c7b8d1bc5=
4f54c4b453954 100644<br>
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c<br>
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c<br>
@@ -4701,7 +4701,6 @@ static const struct drm_bridge_funcs dsi_bridge_funcs=
 =3D {<br>
<br>
=C2=A0static void dsi_bridge_init(struct dsi_data *dsi)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;bridge.funcs =3D &amp;dsi_bridge_funcs;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi-&gt;bridge.of_node =3D dsi-&gt;host.dev-&gt=
;of_node;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi-&gt;bridge.type =3D DRM_MODE_CONNECTOR_DSI;=
<br>
<br>
@@ -4894,9 +4893,9 @@ static int dsi_probe(struct platform_device *pdev)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KER=
NEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dsi)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D devm_drm_bridge_alloc(dev, struct dsi_d=
ata, bridge, &amp;dsi_bridge_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dsi))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(dsi)=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi-&gt;dev =3D dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_set_drvdata(dev, dsi);<br>
<br></blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a hr=
ef=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br=
></div><div>Thanks,</div><div>Anusha=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--00000000000029e5530634ba91dc--

