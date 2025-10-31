Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9360C23B95
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD7D10E294;
	Fri, 31 Oct 2025 08:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T1ygqf85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D769E10E294
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:14:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6FEF81A179F;
 Fri, 31 Oct 2025 08:14:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3224F60704;
 Fri, 31 Oct 2025 08:14:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5BCFC1180FC53; Fri, 31 Oct 2025 09:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761898491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5kqeQwCaBXcdDdY/fhWUYtRy6WjKsRWcRbvT6plygZk=;
 b=T1ygqf85lOMPWNIDgy20hrud9rCyd1xYGw6YtoFTSBH3pQHtW1WHik1l52Ilu0OT6lsl/L
 zHbQrU6Klq8WUqyjfkbqD9cE5v1+IHAHs3ioVdpqt4SZ+4sVt52p45QAqmqiNS4tAT6jN4
 JcFj+iG9CLwUNVoTsgr3/ZvFloNGRaGHDiWEJFsdStw7t0+V8b1u/1Cl4GZQUUToGmJ0Lj
 Aqk8f1rIgCxzN3KcXKmwhU9EE9CdtmRjNu8cIpT9LENVwKr1icISps9Ay8L6Yvp7cxG2ju
 K4FEKe9rAKcgYlnMBOvrU+XSh0Q0AWraH9ZR4sWbJefClS7Y3DjOAJX7nyVD2g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Oct 2025 09:14:45 +0100
Message-Id: <DDWCVYBQSV10.2MFZFEEHPYJY4@bootlin.com>
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, <imx@lists.linux.dev>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, "Sandor Yu" <sandor.yu@nxp.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 5/9] drm/imx: Add support for i.MX94 DCIF
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
 <20250911-dcif-upstreaming-v5-5-a1e8dab8ae40@oss.nxp.com>
In-Reply-To: <20250911-dcif-upstreaming-v5-5-a1e8dab8ae40@oss.nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Laurentiu,

On Thu Sep 11, 2025 at 1:37 PM CEST, Laurentiu Palcu wrote:

...

> +static struct drm_bridge *dcif_crtc_get_bridge(struct drm_crtc *crtc,
> +					       struct drm_crtc_state *crtc_state)
> +{
> +	struct drm_connector_state *conn_state;
> +	struct drm_encoder *encoder;
> +	struct drm_connector *conn;
> +	struct drm_bridge *bridge;
> +	int i;
> +
> +	for_each_new_connector_in_state(crtc_state->state, conn, conn_state, i)=
 {
> +		if (crtc !=3D conn_state->crtc)
> +			continue;
> +
> +		encoder =3D conn_state->best_encoder;
> +
> +		bridge =3D drm_bridge_chain_get_first_bridge(encoder);

The bridge returned by drm_bridge_chain_get_first_bridge() is refcounted
since v6.18-rc1 [0], so you have to put that reference...

> +		if (bridge)
> +			return bridge;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void dcif_crtc_query_output_bus_format(struct drm_crtc *crtc,
> +					      struct drm_crtc_state *crtc_state)
> +{
> +	struct dcif_crtc_state *dcif_state =3D to_dcif_crtc_state(crtc_state);
> +	struct drm_bridge_state *bridge_state;
> +	struct drm_bridge *bridge;
> +
> +	dcif_state->bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> +	dcif_state->bus_flags =3D 0;
> +
> +	bridge =3D dcif_crtc_get_bridge(crtc, crtc_state);
> +	if (!bridge)
> +		return;
> +
> +	bridge_state =3D drm_atomic_get_new_bridge_state(crtc_state->state, bri=
dge);
> +	if (!bridge_state)
> +		return;
> +
> +	dcif_state->bus_format =3D bridge_state->input_bus_cfg.format;
> +	dcif_state->bus_flags =3D bridge_state->input_bus_cfg.flags;

...perhaps here, when both the bridge pointer and the bridge_state pointer
referencing it go out of scope.

> +}

You can just call drm_bridge_put(bridge) there, or (at your option) use a
cleanup action:

 static void dcif_crtc_query_output_bus_format(struct drm_crtc *crtc,
                                               struct drm_crtc_state *crtc_=
state)
 {
         struct dcif_crtc_state *dcif_state =3D to_dcif_crtc_state(crtc_sta=
te);
         struct drm_bridge_state *bridge_state;
-        struct drm_bridge *bridge;

         dcif_state->bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
         dcif_state->bus_flags =3D 0;

-        bridge =3D dcif_crtc_get_bridge(crtc, crtc_state);
+        struct drm_bridge *bridge __free(drm_bridge_put) =3D dcif_crtc_get=
_bridge(crtc, crtc_state);
         if (!bridge)
                 return;

         bridge_state =3D drm_atomic_get_new_bridge_state(crtc_state->state=
, bridge);
         if (!bridge_state)
                 return;

         dcif_state->bus_format =3D bridge_state->input_bus_cfg.format;
         dcif_state->bus_flags =3D bridge_state->input_bus_cfg.flags;
 }

This would call drm_bridge_put() at end of scope, i.e. end of function.

You can also have a look at recent commits involving drm_bridge_put (git
log -p -Gdrm_bridge_put v6.16..origin/master) to see how other parts of the
kernel have added drm_bridge_put().

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8fa5909400f3773=
51836419223c33f1131f0f7d3

Best regards,
Luca

---
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
