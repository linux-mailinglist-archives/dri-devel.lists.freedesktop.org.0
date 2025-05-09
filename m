Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185A1AB1F0F
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 23:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132F410E047;
	Fri,  9 May 2025 21:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WXK4r1Ch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F37C10EAF9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 21:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746826174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i/De0Jx5IFgD0sNFNUS/wwyJRmwsMymS62uY6uZUpus=;
 b=WXK4r1ChIvUDdcWcVoKVfsIgnmb6U8OYaw313/hvhBu/sRPkkg1/EWMeL/4E7nAtWh0myi
 4BPprF9glqghsu/BLBS0sk6Xn90WWnr4J3RMNjp2jRe58sHEsy4nmM5Ueapr5DGofc6b3J
 B3YG7YBWi1ZXnSWddGQdXeb2i9bxlm4=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-20-Q2j7YN1iCH81DgtTy3g-1; Fri, 09 May 2025 17:29:30 -0400
X-MC-Unique: 20-Q2j7YN1iCH81DgtTy3g-1
X-Mimecast-MFC-AGG-ID: 20-Q2j7YN1iCH81DgtTy3g_1746826170
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-708b6b57e67so38537517b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 14:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746826170; x=1747430970;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i/De0Jx5IFgD0sNFNUS/wwyJRmwsMymS62uY6uZUpus=;
 b=A2ua0UJ8QpA90JB+d8e9kiLrKSkzFWMtgAX6ALg+gsY00vr41qgC3p27EdX7C1L5cN
 9WOwedFMWTuwjR76z86gJiU+2V1WrcvkSQsPokJiIutaTYb+M8nONKuG3OBZWSuG7hCa
 ghRPkrkfQO9XFFFJ5OXmpurdH1V5bgLaOz2tf1+Zd/QaiUwtHBQa+Z8atZhSW7UIQBB1
 ClcxRhjs4ue2RMEzI1c2ZgWo6/v9eJW+FWgeuQDSw06kNoCaWXR3Y19Iu+sjpA7UUjlw
 EF41cDr1LiLPrekTJLxmOVqnSFuOH3it6R/MiOtBQ2KD8oIG1ZFRbdENVpT6wxyAfkUQ
 +qyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1wNMsQPUoKcs/flICRX2LL09XJ6WPeSlu1psh5HF1QYmb2ahWMh1IvocWQRCqvJlz4EJpYjqiZJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9C5su7oboYEoKcCF1qQZJSpYYkrDJt2S0FJzTkjgTm0tv9YIq
 yma8ynVnqtpJxGziSynMp5jqVPUK5QSEOAhm7MYgkkF3jnxGXz8aAhU2sCxGWQ26hf/vKfJtM+W
 B/m+iLcxyhHJ3dV8zHXNlA/pmSqZ/8f3WluBR14TGQYUBVGOV4777vkIrqbdV1qvmsKLuV/2Xeg
 mmtlDbfUca5BxRC7bTnVO1u5ncnZGSerLz/QA6xrXB
X-Gm-Gg: ASbGncu8cJFDFmpFq4TYsMT881O9ofrVqpu8a72ibjLyE0LRIH2x1t0Brr7alY3K2Bc
 sDEe7h1+ezC355/vCsGIbLZnPrZ8ShOzqVccdqeEfQwAbTTad/EKuMWFyV5y9cLkQTyg=
X-Received: by 2002:a05:690c:7487:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-70a3fa17f4amr73695947b3.15.1746826170060; 
 Fri, 09 May 2025 14:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp5EYYBrzU8/Gu19+QwyTIwBBoQnmr+XyBQWTJlN0PUivEqtKCpv1AmF6wAke9HmH9CtUVPC+jCWOQsyUY2qo=
X-Received: by 2002:a05:690c:7487:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-70a3fa17f4amr73695657b3.15.1746826169759; Fri, 09 May 2025
 14:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-14-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-14-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 16:26:09 -0400
X-Gm-Features: AX0GCFvRKuZCV8LHJEx8lT3s7zZ8NAFBTY2KWfQvQ2udmU7ulTzeD9WDaNkWM5c
Message-ID: <CAN9Xe3R+DUnUZiYxdgR7sMBuDZew2ZG0+b+_c4OzdKMVk+A4Gw@mail.gmail.com>
Subject: Re: [PATCH v3 14/22] drm/rcar-du: dsi: convert to
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jQCbkGtz066fWdPIDHPYA1L0OAWU7zqEAIO_PNQpHBg_1746826170
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000554e370634baa92b"
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

--000000000000554e370634baa92b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:57=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com>
wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index
> 7ab8be46c7f6547f29b4d45af7ac704283da9dcd..1af4c73f7a887712aef8c8176b0d033=
8d9ca9727
> 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -918,7 +918,6 @@ static int rcar_mipi_dsi_host_attach(struct
> mipi_dsi_host *host,
>         }
>
>         /* Initialize the DRM bridge. */
> -       dsi->bridge.funcs =3D &rcar_mipi_dsi_bridge_ops;
>         dsi->bridge.of_node =3D dsi->dev->of_node;
>         drm_bridge_add(&dsi->bridge);
>
> @@ -1004,9 +1003,10 @@ static int rcar_mipi_dsi_probe(struct
> platform_device *pdev)
>         struct rcar_mipi_dsi *dsi;
>         int ret;
>
> -       dsi =3D devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> -       if (dsi =3D=3D NULL)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(&pdev->dev, struct rcar_mipi_dsi,
> bridge,
> +                                   &rcar_mipi_dsi_bridge_ops);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>
>
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks,
Anusha

>         platform_set_drvdata(pdev, dsi);
>
>
> --
> 2.49.0
>
>

--000000000000554e370634baa92b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 9, =
2025 at 9:57=E2=80=AFAM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@b=
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
Cc: Kieran Bingham &lt;<a href=3D"mailto:kieran.bingham%2Brenesas@ideasonbo=
ard.com" target=3D"_blank">kieran.bingham+renesas@ideasonboard.com</a>&gt;<=
br>
Cc: Laurent Pinchart &lt;<a href=3D"mailto:laurent.pinchart%2Brenesas@ideas=
onboard.com" target=3D"_blank">laurent.pinchart+renesas@ideasonboard.com</a=
>&gt;<br>
Cc: Tomi Valkeinen &lt;<a href=3D"mailto:tomi.valkeinen%2Brenesas@ideasonbo=
ard.com" target=3D"_blank">tomi.valkeinen+renesas@ideasonboard.com</a>&gt;<=
br>
---<br>
=C2=A0drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_mipi_dsi.c<br>
index 7ab8be46c7f6547f29b4d45af7ac704283da9dcd..1af4c73f7a887712aef8c8176b0=
d0338d9ca9727 100644<br>
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c<br>
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c<br>
@@ -918,7 +918,6 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_ho=
st *host,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Initialize the DRM bridge. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;bridge.funcs =3D &amp;rcar_mipi_dsi_bri=
dge_ops;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi-&gt;bridge.of_node =3D dsi-&gt;dev-&gt;of_n=
ode;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_bridge_add(&amp;dsi-&gt;bridge);<br>
<br>
@@ -1004,9 +1003,10 @@ static int rcar_mipi_dsi_probe(struct platform_devic=
e *pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct rcar_mipi_dsi *dsi;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(=
*dsi), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D devm_drm_bridge_alloc(&amp;pdev-&gt;dev=
, struct rcar_mipi_dsi, bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;rcar_mipi_dsi_brid=
ge_ops);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dsi))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(dsi)=
;<br>
<br></blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a hr=
ef=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br=
></div><div>Thanks,</div><div>Anusha=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, dsi);<br>
<br>
<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--000000000000554e370634baa92b--

