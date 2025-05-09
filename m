Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74F2AB1EC4
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 23:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2ABE10EAF6;
	Fri,  9 May 2025 21:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QVlWeLd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CCC10EAF6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 21:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746825324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nADWFNkzjtB9Jfn+qaS7u6sG7u22ATf691MD3dUkDrE=;
 b=QVlWeLd4N1dPqy4q8CAQjQmGjclj+S+L7PPIeAO5UMTm2L5iaiN7ec2RGPS+DBMWlz9VFs
 alNchjp310O6MM/RrMWy8hj4EQ8K8JpeLypKFCOea6VAAin1gzQVP6TO8GPytDEmsUsmJq
 i9HUF1LYjyiJuqmqPZDgA8LBVLPlKSg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-myyA5JAjMP-An6bw36m16Q-1; Fri, 09 May 2025 17:15:21 -0400
X-MC-Unique: myyA5JAjMP-An6bw36m16Q-1
X-Mimecast-MFC-AGG-ID: myyA5JAjMP-An6bw36m16Q_1746825321
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-703d7a66d77so40816837b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 14:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746825321; x=1747430121;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nADWFNkzjtB9Jfn+qaS7u6sG7u22ATf691MD3dUkDrE=;
 b=ZoX0COA9yP9Z0xyCF4jzVPhoRFceABz8OgK695NDbJwWJAG81VS/6EO2NefZORFKvB
 cve508/I7CoiJsAXHt4nN+jD9Psx1SLwPqvYFpg3tQu4StCpW5Zod95zr/zPp164ecgc
 X4dGmNonGUdzJMCOy/aIjAViw1oONKYqqQCIq7x41J8Zv32JzwWO5GXJd4DU4d4w6+eg
 cGBk82qKc0UGw2Q3NzfbidumkXSudYsVvX3UyZHaKM7xG1gAcze9ufxMcIE+32vsVBQU
 FYwzimXSooNelQYfxMI97xyjvHIFQqjJAzqfzVyRUJYYcHz+/1Dz8w5GoVHX7LS0M758
 4eHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNuAuGQimj3dyCqtJgzIMjjfL5apd6Q4qBFNxbCLXVbuz9+0SI0pP5AFaDRiteZ8C2vrfu1WfMzwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIbGVWmiBE8T756cCIw6/R0Cqk21zwySCK7zy1BxrkcwE0V2kR
 3qwFVLJwK3JTWhl/Ybxj9Q6w9S1rdkigFnx2K4jphaT41/Z2smoL//RjY2/wmJu5tqzADeljOh5
 ILz6fMfjImlxYUsKJYNCr6ufm8WFCwCCe9uEYnVjshjSMRYUbMHyVe1aJ+okIh0oVHd+tcWixQu
 nqx07B7/0jbpg7M9K0iI0BEJ5IfT8O9/EKo2qzehMg
X-Gm-Gg: ASbGncs7CRIDbtRxc0zkyRkPFFYTg8DqUrM49KKFlUVa5TSyNcpYo9l3vW6859Wqsg/
 n3x/IAUW2trd92BekL8/CRJni+UDJHZR/ph+bUOSA36r+oT2TEFCuLV0ehiffQGbWTto=
X-Received: by 2002:a05:690c:314:b0:6fe:c2b4:f099 with SMTP id
 00721157ae682-70a2caaff36mr121893637b3.7.1746825320861; 
 Fri, 09 May 2025 14:15:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDppELatHWApVBTbp/y0X7WZ9jAfvXOg+6Uo9FOaf+Dx2WgFQUjAVJ0M31TRzpZ6Ak/8kII08lb0sxuJedJKU=
X-Received: by 2002:a05:690c:314:b0:6fe:c2b4:f099 with SMTP id
 00721157ae682-70a2caaff36mr121892917b3.7.1746825320418; Fri, 09 May 2025
 14:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-8-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-8-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 16:12:00 -0400
X-Gm-Features: AX0GCFvkeMsWo0PkdeGNZVPSEOEq27001W3hGFbQbs-mb7RlOGMt0yubyvY0ySM
Message-ID: <CAN9Xe3QFFr-igXdknR9iuTk1YPYUAjjANBdYsB_sT7rzvRS1jA@mail.gmail.com>
Subject: Re: [PATCH v3 08/22] drm/omap: dss: dpi: convert to
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
 "Rob Herring (Arm)" <robh@kernel.org>, Helge Deller <deller@gmx.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jn2N6NRQwNhreVKmbB-bdH8NdRQLOmQYw9DjHjMYo2E_1746825321
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b567400634ba7651"
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

--000000000000b567400634ba7651
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
> Cc: "Rob Herring (Arm)" <robh@kernel.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dpi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c
> b/drivers/gpu/drm/omapdrm/dss/dpi.c
> index
> 6eff97a091602f6d137095b3b7bf54fce17e8d3e..9f86db774c395db7e3396cbf2694748=
fc23c309d
> 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dpi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
> @@ -562,7 +562,6 @@ static const struct drm_bridge_funcs dpi_bridge_funcs
> =3D {
>
>  static void dpi_bridge_init(struct dpi_data *dpi)
>  {
> -       dpi->bridge.funcs =3D &dpi_bridge_funcs;
>         dpi->bridge.of_node =3D dpi->pdev->dev.of_node;
>         dpi->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
>
> @@ -707,9 +706,9 @@ int dpi_init_port(struct dss_device *dss, struct
> platform_device *pdev,
>         u32 datalines;
>         int r;
>
> -       dpi =3D devm_kzalloc(&pdev->dev, sizeof(*dpi), GFP_KERNEL);
> -       if (!dpi)
> -               return -ENOMEM;
> +       dpi =3D devm_drm_bridge_alloc(&pdev->dev, struct dpi_data, bridge=
,
> &dpi_bridge_funcs);
> +       if (IS_ERR(dpi))
> +               return PTR_ERR(dpi);
>
>         ep =3D of_graph_get_next_port_endpoint(port, NULL);
>         if (!ep)
>
>
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks,
Anusha

> --
> 2.49.0
>
>

--000000000000b567400634ba7651
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
Cc: &quot;Rob Herring (Arm)&quot; &lt;<a href=3D"mailto:robh@kernel.org" ta=
rget=3D"_blank">robh@kernel.org</a>&gt;<br>
Cc: Helge Deller &lt;<a href=3D"mailto:deller@gmx.de" target=3D"_blank">del=
ler@gmx.de</a>&gt;<br>
Cc: Kuninori Morimoto &lt;<a href=3D"mailto:kuninori.morimoto.gx@renesas.co=
m" target=3D"_blank">kuninori.morimoto.gx@renesas.com</a>&gt;<br>
Cc: Tomi Valkeinen &lt;<a href=3D"mailto:tomi.valkeinen@ideasonboard.com" t=
arget=3D"_blank">tomi.valkeinen@ideasonboard.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/omapdrm/dss/dpi.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/ds=
s/dpi.c<br>
index 6eff97a091602f6d137095b3b7bf54fce17e8d3e..9f86db774c395db7e3396cbf269=
4748fc23c309d 100644<br>
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c<br>
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c<br>
@@ -562,7 +562,6 @@ static const struct drm_bridge_funcs dpi_bridge_funcs =
=3D {<br>
<br>
=C2=A0static void dpi_bridge_init(struct dpi_data *dpi)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dpi-&gt;bridge.funcs =3D &amp;dpi_bridge_funcs;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dpi-&gt;bridge.of_node =3D dpi-&gt;pdev-&gt;dev=
.of_node;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dpi-&gt;bridge.type =3D DRM_MODE_CONNECTOR_DPI;=
<br>
<br>
@@ -707,9 +706,9 @@ int dpi_init_port(struct dss_device *dss, struct platfo=
rm_device *pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 datalines;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dpi =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(=
*dpi), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dpi)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dpi =3D devm_drm_bridge_alloc(&amp;pdev-&gt;dev=
, struct dpi_data, bridge, &amp;dpi_bridge_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dpi))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(dpi)=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ep =3D of_graph_get_next_port_endpoint(port, NU=
LL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ep)<br>
<br></blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a hr=
ef=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br=
></div><div>Thanks,</div><div>Anusha=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--000000000000b567400634ba7651--

