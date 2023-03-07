Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20456AE2EE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39EB10E4BB;
	Tue,  7 Mar 2023 14:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2129 seconds by postgrey-1.36 at gabe;
 Tue, 07 Mar 2023 14:43:27 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE72710E4BB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:Cc:To:Message-ID:From:Content-Transfer-Encoding:
 Content-Type:Date:MIME-Version:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5DMLJzQKqdF6oeNoZF8t9+eClq9ynzLjSSrN4tmUXPA=; b=BXjkskeT2aCDjWBkFBi1gJSE0o
 KxttfCw6RT9DA1gOSi4J8shGJu4zeme59ibiNNsvkb2rcdRzl+RzXgjtRJUQHlpW9ES6pOJXlcMkQ
 1YUunvfpuepMFk47fKFBEH+mHsl/MVkWXlkZMKwvtMZzfk5wOgCVTk5Dy+lPayv9jc9+Cq1I4kveh
 sRcaJZ6kguPGCQxRbtimP/mOXWCLp6qzl6IBCYsIw0WnrMvQuWcqIHof8zj4Mvy/2HNbKpmJr3vt2
 GfvjpvMMFUnBZZSI07Rxijc/DJ7u8UP3CCDrVyYwjMBmB67yAbqwP2ef5iI8eloeedS7kNS9dDn/k
 F60VybOw==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sarha@kapsi.fi>)
 id 1pZXxt-005UaU-Pn; Tue, 07 Mar 2023 16:06:54 +0200
MIME-Version: 1.0
Date: Tue, 07 Mar 2023 14:06:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: sarha@kapsi.fi
Message-ID: <25a439e6a6d58701e5a73b33ed0d7a4a0d9a68e2@kapsi.fi>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: sarha@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=no autolearn_force=no version=3.4.6
Subject: Re: [PATCH 18/22] drm/tilcdc: Use GEM DMA fbdev emulation
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

March 1, 2023 at 5:30 PM, "Thomas Zimmermann" <tzimmermann@suse.de mailto=
:tzimmermann@suse.de?to=3D%22Thomas%20Zimmermann%22%20%3Ctzimmermann%40su=
se.de%3E > wrote:

>=20
>=20Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>=20
>=20Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20

Acked-by:=20Jyri Sarha <jyri.s

>=20
>=20---
> drivers/gpu/drm/tilcdc/tilcdc_drv.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
>=20diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/ti=
lcdc/tilcdc_drv.c
> index 4ca426007dc8..fe56beea3e93 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -16,7 +16,7 @@
> #include <drm/drm_atomic_helper.h>
> #include <drm/drm_debugfs.h>
> #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_dma.h>
> #include <drm/drm_fourcc.h>
> #include <drm/drm_gem_dma_helper.h>
> #include <drm/drm_gem_framebuffer_helper.h>
> @@ -384,7 +384,7 @@ static int tilcdc_init(const struct drm_driver *ddr=
v, struct device *dev)
> goto init_failed;
> priv->is_registered =3D true;
>=20
>=20- drm_fbdev_generic_setup(ddev, bpp);
> + drm_fbdev_dma_setup(ddev, bpp);
> return 0;
>=20
>=20init_failed:
> --=20
>=202.39.2
>
