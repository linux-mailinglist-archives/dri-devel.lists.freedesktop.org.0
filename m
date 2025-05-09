Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB5DAB1D59
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 21:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC52810EACC;
	Fri,  9 May 2025 19:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="P4R+L1lO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6420810EACE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 19:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746819314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8LkGhyvM5ULGVgnYgzQpkCzO/x50SWndRmWv8pvECYE=;
 b=P4R+L1lORouJhMSK2M34aX9ayMrJOrK4hCvfSxUaG7vNtK0W2t48Zx2s93Qi8yboS5/Pt6
 vSjLzgyAd9hPnQ2oVpkHbEijpTTJYBjWIj3gWddI5+K/0mJDgr46PZJXkaq7pR00adL3zI
 l5ak1KIq+Qme53cHqQeYeY+kRw7OhgY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-f2_4ZEYVOX-o-a47XcNB9Q-1; Fri, 09 May 2025 15:35:13 -0400
X-MC-Unique: f2_4ZEYVOX-o-a47XcNB9Q-1
X-Mimecast-MFC-AGG-ID: f2_4ZEYVOX-o-a47XcNB9Q_1746819312
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-7082ffc17c0so40388677b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 12:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746819312; x=1747424112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LkGhyvM5ULGVgnYgzQpkCzO/x50SWndRmWv8pvECYE=;
 b=ZCVwKk6WR951ovsRBkbGyVnsHtiR6Q8N9YSoKfGRPovSEl/IEv4emNPGtoZWiBAYPE
 6E8Rp6+/jRZM4CSB+/ykS4cbaCoPRNuRhDPyXJLdho0uaCQuFA8MQZXdl6JK04Zr5cnu
 3RSFL/foi2a5MgPQ2QhBKAZ0ZN9TykdSny0YoSK+Hx/r1TzPBD7p+8/nPbNg9jdTN9k1
 9r33xslaowNyUqp68RHFYxVG5imtySWo55q47v5LoHbtmmaGkANLnA4E7oSxYlCt2hx+
 keg5m2fhQjIjuxa4d5X83Bz0A9JS5uv5iGM6+pVK2XYebooaWSMFN1xYCoZB8FtfW3BH
 430A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlwf/M/Vozg3gK2g88Zp8QV1329c/Co8ettq12J2Qayl/n5snovG/qYrbFTwPV+36GwIjPYAmKw/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvCHTJNyeeQSUJqtbQHx2ZWXf/SjBuKkPxzbFzCqK0cjnShGtY
 97tpQOGI37F8BvcsOUYLvAgPb7GGnrizS37C+ZHIZVuc2f555Iv0mpdMXS445pMY2wUSgbEjWph
 OIRKam78dr6heHUGX/JBPjRXKYpp5pSRFrhKQfugKpihyFtryP8bbKVg1o3n9l8/VIktxI3rpZD
 nrBV5JmbMhwxVrmpIvliu5HV9cVK1E4tKgvljzT7NX
X-Gm-Gg: ASbGnctuIBxPwCz8AJ/Az/dz6iy/AvZfEoNe3l0WBHXOSQRvjqdBJAe98M0hu92UJDA
 8itcWQCaptTfo9KDM5yleVZXeIowJldhNFMtTVZwmNtPMYAHfg3HZH/66ZcMlsUcMYt4=
X-Received: by 2002:a05:690c:7487:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-70a3fa17f4amr68605327b3.15.1746819312138; 
 Fri, 09 May 2025 12:35:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt3PV5p9bgu7MwlRMnZkjDv9NjPEf3FqRtxZGYBPTrniTX6M6KWZ/kD+66XnLMxfTiUE1YPOACytjtNGlpEjA=
X-Received: by 2002:a05:690c:7487:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-70a3fa17f4amr68604677b3.15.1746819311690; Fri, 09 May 2025
 12:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-4-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-4-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 14:31:51 -0400
X-Gm-Features: AX0GCFvyosW1qSESkn4iHuCP9lrHnLnwOX6jMB7LV077XCjLfpAksJn92WhqF7U
Message-ID: <CAN9Xe3Tco_FuoSwhReP=ZyiXmbUiOtLnmY_weVx7ZhZpw8d8HA@mail.gmail.com>
Subject: Re: [PATCH v3 04/22] drm/bridge: cdns-dsi: convert to
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
 linux-stm32@st-md-mailman.stormreply.com, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gGazPL9bL0K-zyhnZAqcudJBcKY2zKLJiCiABUHgo1U_1746819312
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008f8be00634b910c9"
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

--0000000000008f8be00634b910c9
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
> Cc: Aradhya Bhatia <a-bhatia1@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index
> b022dd6e6b6e9e43bf11583806e1a8d1e7431ae8..7604574da66606c103cc035dd94b0e2=
11b64ebdc
> 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -1289,9 +1289,10 @@ static int cdns_dsi_drm_probe(struct
> platform_device *pdev)
>         int ret, irq;
>         u32 val;
>
> -       dsi =3D devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> -       if (!dsi)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(&pdev->dev, struct cdns_dsi,
> input.bridge,
> +                                   &cdns_dsi_bridge_funcs);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>
>         platform_set_drvdata(pdev, dsi);
>
> @@ -1349,7 +1350,6 @@ static int cdns_dsi_drm_probe(struct platform_devic=
e
> *pdev)
>          * CDNS_DPI_INPUT.
>          */
>         input->id =3D CDNS_DPI_INPUT;
> -       input->bridge.funcs =3D &cdns_dsi_bridge_funcs;
>         input->bridge.of_node =3D pdev->dev.of_node;
>
>         /* Mask all interrupts before registering the IRQ handler. */
>
> --


Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>


>
> 2.49.0
>
>

--0000000000008f8be00634b910c9
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
Cc: Aradhya Bhatia &lt;<a href=3D"mailto:a-bhatia1@ti.com" target=3D"_blank=
">a-bhatia1@ti.com</a>&gt;<br>
Cc: Tomi Valkeinen &lt;<a href=3D"mailto:tomi.valkeinen@ideasonboard.com" t=
arget=3D"_blank">tomi.valkeinen@ideasonboard.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/d=
rm/bridge/cadence/cdns-dsi-core.c<br>
index b022dd6e6b6e9e43bf11583806e1a8d1e7431ae8..7604574da66606c103cc035dd94=
b0e211b64ebdc 100644<br>
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c<br>
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c<br>
@@ -1289,9 +1289,10 @@ static int cdns_dsi_drm_probe(struct platform_device=
 *pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret, irq;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(=
*dsi), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dsi)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D devm_drm_bridge_alloc(&amp;pdev-&gt;dev=
, struct cdns_dsi, input.bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;cdns_dsi_bridge_fu=
ncs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dsi))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(dsi)=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, dsi);<br>
<br>
@@ -1349,7 +1350,6 @@ static int cdns_dsi_drm_probe(struct platform_device =
*pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* CDNS_DPI_INPUT.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 input-&gt;id =3D CDNS_DPI_INPUT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0input-&gt;bridge.funcs =3D &amp;cdns_dsi_bridge=
_funcs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 input-&gt;bridge.of_node =3D pdev-&gt;dev.of_no=
de;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Mask all interrupts before registering the I=
RQ handler. */<br>
<br>
--</blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a href=
=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"> <br>
2.49.0<br>
<br>
</blockquote></div></div>

--0000000000008f8be00634b910c9--

