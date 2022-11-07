Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D271C62046D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B9110E1B7;
	Tue,  8 Nov 2022 00:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2710 seconds by postgrey-1.36 at gabe;
 Mon, 07 Nov 2022 21:12:47 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB6410E4C1;
 Mon,  7 Nov 2022 21:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:References:Cc:To:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k3Hc9VlT5IfcVarqA/4VLSa+Nt0/6JpM9DtmCHRop6A=; b=05q59jeVHkJM4t8M9hhAvhJ1ys
 65amkC2aluXsjhUi+v+944MSikNitpecdWkxHZLz8u1liQdwCPXoaBHJWO16dK/qx+bLVt0x4xFQ/
 fzWTkW9oNTxs7WS0+IpJvlc7BWX9UcxcB4mr9MOY4Rr8qytQuo1sI1dJPN17k7ZdHbaCr7Yc/dC9d
 9Fo3VYgCJXLuMTqhkbbBqhJRFRnkyxbZsqHxYNevlGOWofY+3xvaKkRkBppMO69pUDCOtOMAlXrxr
 U0qbXD3gLReAP7EC6E9VAxU4RMtiK5G/0CkZ44lEScXK+/k/nY2KVnG7LtHMI38Ze7cszyHeXz+fY
 bRd9nHLg==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sarha@kapsi.fi>)
 id 1os8hz-00CfOn-1k; Mon, 07 Nov 2022 22:27:03 +0200
MIME-Version: 1.0
Date: Mon, 07 Nov 2022 20:27:02 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: sarha@kapsi.fi
Message-ID: <4ad0beebfea802c1caec176f4d71955407cd5c4f@kapsi.fi>
To: "Sean Anderson" <sean.anderson@seco.com>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: undefined <20221103182222.2247724-1-sean.anderson@seco.com>
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: sarha@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=no autolearn_force=no version=3.4.6
Subject: Re: [PATCH 2/2] drm: Convert users of drm_of_component_match_add
 to component_match_add_of
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
X-Mailman-Approved-At: Tue, 08 Nov 2022 00:03:28 +0000
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 John Stultz <jstultz@google.com>, Mihail Atanassov <mihail.atanassov@arm.com>,
 Samuel Holland <samuel@sholland.org>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mali DP Maintainers <malidp@foss.arm.com>, linux-arm-msm@vger.kernel.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, linux-sunxi@lists.linux.dev,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, etnaviv@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Tomi Valkeinen <tomba@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

November 3, 2022 at 8:22 PM, "Sean Anderson" <sean.anderson@seco.com mail=
to:sean.anderson@seco.com?to=3D%22Sean%20Anderson%22%20%3Csean.anderson%4=
0seco.com%3E > wrote:

>=20
>=20Every user of this function either uses component_compare_of or
> something equivalent. Most of them immediately put the device node as
> well. Convert these users to component_match_add_of and remove
> drm_of_component_match_add.
>=20
>=20Signed-off-by: Sean Anderson <sean.anderson@seco.com>

Acked-by: Jyri Sarha <jyri.sarha=C4=B1@iki.fi>

Also tested that Beaglebone-Black HDMI audio, that relies on componet sys=
tem, still works. So for tilcdc:

Tested-by: Jyri Sarha <jyri.sarha@iki.fi>

> ---
>=20
>=20.../gpu/drm/arm/display/komeda/komeda_drv.c | 6 ++--
> drivers/gpu/drm/arm/hdlcd_drv.c | 9 +-----
> drivers/gpu/drm/arm/malidp_drv.c | 11 +------
> drivers/gpu/drm/armada/armada_drv.c | 10 ++++---
> drivers/gpu/drm/drm_of.c | 29 +++----------------
> drivers/gpu/drm/etnaviv/etnaviv_drv.c | 4 +--
> .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 3 +-
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 +-
> drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 +--
> drivers/gpu/drm/msm/msm_drv.c | 14 ++++-----
> drivers/gpu/drm/sti/sti_drv.c | 3 +-
> drivers/gpu/drm/sun4i/sun4i_drv.c | 3 +-
> drivers/gpu/drm/tilcdc/tilcdc_external.c | 10 ++-----
> include/drm/drm_of.h | 12 --------
> 14 files changed, 33 insertions(+), 88 deletions(-)
>=20
>=20diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/driver=
s/gpu/drm/arm/display/komeda/komeda_drv.c
> index 9fce4239d4ad..e5bf439b799f 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -103,10 +103,8 @@ static void komeda_add_slave(struct device *master=
,
>  struct device_node *remote;
>=20
>=20 remote =3D of_graph_get_remote_node(np, port, endpoint);
> - if (remote) {
> - drm_of_component_match_add(master, match, component_compare_of, remot=
e);
> - of_node_put(remote);
> - }
> + if (remote)
> + component_match_add_of(master, match, remote);
> }
>=20
>=20static int komeda_platform_probe(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlc=
d_drv.c
> index a032003c340c..18e58863a2f1 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -352,11 +352,6 @@ static const struct component_master_ops hdlcd_mas=
ter_ops =3D {
>  .unbind =3D hdlcd_drm_unbind,
> };
>=20
>=20-static int compare_dev(struct device *dev, void *data)
> -{
> - return dev->of_node =3D=3D data;
> -}
> -
> static int hdlcd_probe(struct platform_device *pdev)
> {
>  struct device_node *port;
> @@ -367,9 +362,7 @@ static int hdlcd_probe(struct platform_device *pdev=
)
>  if (!port)
>  return -ENODEV;
>=20
>=20- drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
> - of_node_put(port);
> -
> + component_match_add_of(&pdev->dev, &match, port);
>  return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
>  match);
> }
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/mal=
idp_drv.c
> index 1d0b0c54ccc7..aace8b87c6d3 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -926,13 +926,6 @@ static const struct component_master_ops malidp_ma=
ster_ops =3D {
>  .unbind =3D malidp_unbind,
> };
>=20
>=20-static int malidp_compare_dev(struct device *dev, void *data)
> -{
> - struct device_node *np =3D data;
> -
> - return dev->of_node =3D=3D np;
> -}
> -
> static int malidp_platform_probe(struct platform_device *pdev)
> {
>  struct device_node *port;
> @@ -946,9 +939,7 @@ static int malidp_platform_probe(struct platform_de=
vice *pdev)
>  if (!port)
>  return -ENODEV;
>=20
>=20- drm_of_component_match_add(&pdev->dev, &match, malidp_compare_dev,
> - port);
> - of_node_put(port);
> + component_match_add_of(&pdev->dev, &match, port);
>  return component_master_add_with_match(&pdev->dev, &malidp_master_ops,
>  match);
> }
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/arma=
da/armada_drv.c
> index 0643887800b4..c0211ad7a45d 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -184,10 +184,12 @@ static void armada_add_endpoints(struct device *d=
ev,
>=20
>=20 for_each_endpoint_of_node(dev_node, ep) {
>  remote =3D of_graph_get_remote_port_parent(ep);
> - if (remote of_device_is_available(remote))
> - drm_of_component_match_add(dev, match, component_compare_of,
> - remote);
> - of_node_put(remote);
> + if (remote) {
> + if (of_device_is_available(remote))
> + component_match_add_of(dev, match, remote);
> + else
> + of_node_put(remote);
> + }
>  }
> }
>=20
>=20diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 7bbcb999bb75..0a474729ddf6 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -78,24 +78,6 @@ uint32_t drm_of_find_possible_crtcs(struct drm_devic=
e *dev,
> }
> EXPORT_SYMBOL(drm_of_find_possible_crtcs);
>=20
>=20-/**
> - * drm_of_component_match_add - Add a component helper OF node match r=
ule
> - * @master: master device
> - * @matchptr: component match pointer
> - * @compare: compare function used for matching component
> - * @node: of_node
> - */
> -void drm_of_component_match_add(struct device *master,
> - struct component_match **matchptr,
> - int (*compare)(struct device *, void *),
> - struct device_node *node)
> -{
> - of_node_get(node);
> - component_match_add_release(master, matchptr, component_release_of,
> - compare, node);
> -}
> -EXPORT_SYMBOL_GPL(drm_of_component_match_add);
> -
> /**
> * drm_of_component_probe - Generic probe function for a component based=
 master
> * @dev: master device containing the OF node
> @@ -130,10 +112,9 @@ int drm_of_component_probe(struct device *dev,
>  break;
>=20
>=20 if (of_device_is_available(port->parent))
> - drm_of_component_match_add(dev, &match, compare_of,
> - port);
> -
> - of_node_put(port);
> + component_match_add_of(dev, &match, port);
> + else
> + of_node_put(port);
>  }
>=20
>=20 if (i =3D=3D 0) {
> @@ -171,9 +152,7 @@ int drm_of_component_probe(struct device *dev,
>  continue;
>  }
>=20
>=20- drm_of_component_match_add(dev, &match, compare_of,
> - remote);
> - of_node_put(remote);
> + component_match_add_of(dev, &match, remote);
>  }
>  of_node_put(port);
>  }
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/et=
naviv/etnaviv_drv.c
> index 1d2b4fb4bcf8..4a0dba34a6e7 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -590,8 +590,8 @@ static int etnaviv_pdev_probe(struct platform_devic=
e *pdev)
>  if (!first_node)
>  first_node =3D core_node;
>=20
>=20- drm_of_component_match_add(&pdev->dev, &match,
> - component_compare_of, core_node);
> + of_node_get(core_node);
> + component_match_add_of(&pdev->dev, &match, core_node);
>  }
>  } else {
>  char **names =3D dev->platform_data;
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/=
gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index 73ee7f25f734..fc736759274f 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -273,8 +273,7 @@ static int kirin_drm_platform_probe(struct platform=
_device *pdev)
>  if (!remote)
>  return -ENODEV;
>=20
>=20- drm_of_component_match_add(dev, &match, component_compare_of, remot=
e);
> - of_node_put(remote);
> + component_match_add_of(dev, &match, remote);
>=20
>=20 return component_master_add_with_match(dev, &kirin_drm_ops, match);
> }
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/dr=
m/ingenic/ingenic-drm-drv.c
> index ab0515d2c420..75a19e6b85c0 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1445,8 +1445,7 @@ static int ingenic_drm_probe(struct platform_devi=
ce *pdev)
>  if (!np)
>  return ingenic_drm_bind(dev, false);
>=20
>=20- drm_of_component_match_add(dev, &match, component_compare_of, np);
> - of_node_put(np);
> + component_match_add_of(dev, &match, np);
>=20
>  return component_master_add_with_match(dev, &ingenic_master_ops, match=
);
> }
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_drv.c
> index 91f58db5915f..9ca265129659 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -779,8 +779,8 @@ static int mtk_drm_probe(struct platform_device *pd=
ev)
>  comp_type =3D=3D MTK_DSI) {
>  dev_info(dev, "Adding component match for %pOF\n",
>  node);
> - drm_of_component_match_add(dev, &match, component_compare_of,
> - node);
> + of_node_get(node);
> + component_match_add_of(dev, &match, node);
>  }
>=20
>=20 ret =3D mtk_ddp_comp_init(node, &private->ddp_comp[comp_id], comp_id=
);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> index 28034c21f6bc..1152da3d58dc 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -5,6 +5,7 @@
> * Author: Rob Clark <robdclark@gmail.com>
> */
>=20
>=20+#include <linux/component.h>
> #include <linux/dma-mapping.h>
> #include <linux/fault-inject.h>
> #include <linux/kthread.h>
> @@ -1148,10 +1149,9 @@ static int add_components_mdp(struct device *mas=
ter_dev,
>  continue;
>=20
>=20 if (of_device_is_available(intf))
> - drm_of_component_match_add(master_dev, matchptr,
> - component_compare_of, intf);
> -
> - of_node_put(intf);
> + component_match_add_of(master_dev, matchptr, intf);
> + else
> + of_node_put(intf);
>  }
>=20
>=20 return 0;
> @@ -1180,9 +1180,9 @@ static int add_gpu_components(struct device *dev,
>  return 0;
>=20
>=20 if (of_device_is_available(np))
> - drm_of_component_match_add(dev, matchptr, component_compare_of, np);
> -
> - of_node_put(np);
> + component_match_add_of(dev, matchptr, np);
> + else
> + of_node_put(np);
>=20
>=20 return 0;
> }
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_dr=
v.c
> index 7abf010a3293..3ae4b73dfa92 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -238,8 +238,7 @@ static int sti_platform_probe(struct platform_devic=
e *pdev)
>  child_np =3D of_get_next_available_child(node, NULL);
>=20
>=20 while (child_np) {
> - drm_of_component_match_add(dev, &match, component_compare_of,
> - child_np);
> + component_match_add_of(dev, &match, child_np);
>  child_np =3D of_get_next_available_child(node, child_np);
>  }
>=20
>=20diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4=
i/sun4i_drv.c
> index d06ffd99d86e..a67c2010c7a2 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -323,7 +323,8 @@ static int sun4i_drv_add_endpoints(struct device *d=
ev,
>  of_device_is_available(node))) {
>  /* Add current component */
>  DRM_DEBUG_DRIVER("Adding component %pOF\n", node);
> - drm_of_component_match_add(dev, match, component_compare_of, node);
> + of_node_get(node);
> + component_match_add_of(dev, match, node);
>  count++;
>  }
>=20
>=20diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/d=
rm/tilcdc/tilcdc_external.c
> index 3b86d002ef62..0138ce02a64f 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
> @@ -155,11 +155,6 @@ int tilcdc_attach_external_device(struct drm_devic=
e *ddev)
>  return ret;
> }
>=20
>=20-static int dev_match_of(struct device *dev, void *data)
> -{
> - return dev->of_node =3D=3D data;
> -}
> -
> int tilcdc_get_external_components(struct device *dev,
>  struct component_match **match)
> {
> @@ -173,7 +168,8 @@ int tilcdc_get_external_components(struct device *d=
ev,
>  }
>=20
>=20 if (match)
> - drm_of_component_match_add(dev, match, dev_match_of, node);
> - of_node_put(node);
> + component_match_add_of(dev, match, node);
> + else
> + of_node_put(node);
>  return 1;
> }
> diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
> index 10ab58c40746..685c44dc1dae 100644
> --- a/include/drm/drm_of.h
> +++ b/include/drm/drm_of.h
> @@ -33,10 +33,6 @@ uint32_t drm_of_crtc_port_mask(struct drm_device *de=
v,
>  struct device_node *port);
> uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
>  struct device_node *port);
> -void drm_of_component_match_add(struct device *master,
> - struct component_match **matchptr,
> - int (*compare)(struct device *, void *),
> - struct device_node *node);
> int drm_of_component_probe(struct device *dev,
>  int (*compare_of)(struct device *, void *),
>  const struct component_master_ops *m_ops);
> @@ -69,14 +65,6 @@ static inline uint32_t drm_of_find_possible_crtcs(st=
ruct drm_device *dev,
>  return 0;
> }
>=20
>=20-static inline void
> -drm_of_component_match_add(struct device *master,
> - struct component_match **matchptr,
> - int (*compare)(struct device *, void *),
> - struct device_node *node)
> -{
> -}
> -
> static inline int
> drm_of_component_probe(struct device *dev,
>  int (*compare_of)(struct device *, void *),
> --=20
>=202.35.1.1320.gc452695387.dirty
>
