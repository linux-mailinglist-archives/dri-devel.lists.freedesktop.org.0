Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE65D006AA
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 00:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C5C10E11D;
	Wed,  7 Jan 2026 23:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="ZcRbrUwE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A78510E11D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 23:48:31 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260107234828euoutp01955cf036de90cbb90ceef5d5e6d8b9f8~Il8D4xZ6O0726807268euoutp016
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 23:48:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260107234828euoutp01955cf036de90cbb90ceef5d5e6d8b9f8~Il8D4xZ6O0726807268euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1767829708;
 bh=TYCzIUiOEy3kP/HiVQ2wZRrRPpZ4XZI8gw9kTIvwkig=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=ZcRbrUwE0aCSm07m0ZAGZxJqi+smXR6sOaSkQNGRA/aaVVXXra1EA26P9OVZXHgoM
 aGEhVYVOd3cGxnnM9aKFvNxes9G4ULczGDrTrEa1JxXTa/SmBbzJIT9RCMK9VIrcKZ
 UFzKdI1lMTHP5Czb15+QUV6lIyPeYK3iCwEMt8FE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260107234827eucas1p27fbd224b2f588f92989d2f7bfa08ab37~Il8C276YY0130501305eucas1p2E;
 Wed,  7 Jan 2026 23:48:27 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260107234825eusmtip2ddfb2c42a8a3442eed7670b1dee474df~Il8AyfPoH0345103451eusmtip2c;
 Wed,  7 Jan 2026 23:48:25 +0000 (GMT)
Message-ID: <77c70d7b-23bc-4f74-9a13-d10f4af132dd@samsung.com>
Date: Thu, 8 Jan 2026 00:48:24 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 00/12] drm/bridge: convert users of
 of_drm_find_bridge(), part 2
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philippe Cornu <philippe.cornu@st.com>,
 benjamin.gaignard@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Adrien
 Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260107234827eucas1p27fbd224b2f588f92989d2f7bfa08ab37
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260107131333eucas1p2ee0b7afe47dc2fafa29e893e4283962b
X-EPHeader: CA
X-CMS-RootMailID: 20260107131333eucas1p2ee0b7afe47dc2fafa29e893e4283962b
References: <CGME20260107131333eucas1p2ee0b7afe47dc2fafa29e893e4283962b@eucas1p2.samsung.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
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

On 07.01.2026 14:12, Luca Ceresoli wrote:
> This series converts all DRM bridge drivers (*) from the now deprecated
> of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
> allows correct bridge refcounting. It also converts per-driver
> "next_bridge" pointers to the unified drm_bridge::next_bridge which puts
> the reference automatically on bridge deallocation.
>
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].

This patchset breaks Exynos DSI (Samsung-DSIM) driver operation on all 
my test boards. I will try to debug it and provide more information 
tomorrow though.


> Here's the work breakdown (➜ marks the current series):
>
>   1. ➜ add refcounting to DRM bridges struct drm_bridge,
>        based on devm_drm_bridge_alloc()
>      A. ✔ add new alloc API and refcounting (v6.16)
>      B. ✔ convert all bridge drivers to new API (v6.17)
>      C. ✔ kunit tests (v6.17)
>      D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
>           and warn on old allocation pattern (v6.17)
>      E. ➜ add get/put on drm_bridge accessors
>         1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
>         2. ✔ drm_bridge_get_prev_bridge() (v6.18)
>         3. ✔ drm_bridge_get_next_bridge() (v6.19)
>         4. ✔ drm_for_each_bridge_in_chain() (v6.19)
>         5. ✔ drm_bridge_connector_init (v6.19)
>         6. … protect encoder bridge chain with a mutex
>         7. ➜ of_drm_find_bridge
>            a. ✔… add of_drm_get_bridge(), convert basic direct users
> 	        (v6.20?, one driver still pending)
> 	  b. ➜ convert direct of_drm_get_bridge() users, part 2
> 	  c.   convert direct of_drm_get_bridge() users, part 3
> 	  d.   convert direct of_drm_get_bridge() users, part 4
> 	  e.   convert bridge-only drm_of_find_panel_or_bridge() users
>         8. drm_of_find_panel_or_bridge, *_of_get_bridge
>         9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
>      F. ✔ debugfs improvements
>         1. ✔ add top-level 'bridges' file (v6.16)
>         2. ✔ show refcount and list lingering bridges (v6.19)
>   2. … handle gracefully atomic updates during bridge removal
>      A. ✔ Add drm_dev_enter/exit() to protect device resources (v6.20?)
>      B. … protect private_obj removal from list
>   3. … DSI host-device driver interaction
>   4. ✔ removing the need for the "always-disconnected" connector
>   5. finish the hotplug bridge work, moving code to the core and potentially
>      removing the hotplug-bridge itself (this needs to be clarified as
>      points 1-3 are developed)
>
> [0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t
>
> This work is a continuation of the work to correctly handle bridge
> refcounting for existing of_drm_find_bridge(). The ground work is in:
>
>    - commit 293a8fd7721a ("drm/bridge: add of_drm_find_and_get_bridge()")
>    - commit 9da0e06abda8 ("drm/bridge: deprecate of_drm_find_bridge()")
>    - commit 3fdeae134ba9 ("drm/bridge: add next_bridge pointer to struct drm_bridge")
>
> The whole conversion is split in multiple series to make the review process
> a bit smoother. Parts 3 and 4 are converting non-bridge drivers (mostly
> encoders).
>
> (*) One bridge driver (synopsys/dw-hdmi) is converted in another series,
>      together with its (non-bridge) users. Additionally this series converts
>      drm_of_panel_bridge_remove() which is a special case, and has a bugfix
>      for it too.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Luca Ceresoli (12):
>        drm: of: drm_of_panel_bridge_remove(): fix device_node leak
>        drm: of: drm_of_panel_bridge_remove(): convert to of_drm_find_and_get_bridge()
>        drm/bridge: sii902x: convert to of_drm_find_and_get_bridge()
>        drm/bridge: thc63lvd1024: convert to of_drm_find_and_get_bridge()
>        drm/bridge: tfp410: convert to of_drm_find_and_get_bridge()
>        drm/bridge: tpd12s015: convert to of_drm_find_and_get_bridge()
>        drm/bridge: lt8912b: convert to of_drm_find_and_get_bridge()
>        drm/bridge: imx8mp-hdmi-pvi: convert to of_drm_find_and_get_bridge()
>        drm/bridge: imx8qxp-ldb: convert to of_drm_find_and_get_bridge()
>        drm/bridge: samsung-dsim: samsung_dsim_host_attach: use a temporary variable for the next bridge
>        drm/bridge: samsung-dsim: samsung_dsim_host_attach: don't use the bridge pointer as an error indicator
>        drm/bridge: samsung-dsim: samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()
>
>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 15 +++++++-------
>   drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c     |  3 ++-
>   drivers/gpu/drm/bridge/lontium-lt8912b.c     | 31 ++++++++++++++--------------
>   drivers/gpu/drm/bridge/samsung-dsim.c        | 28 ++++++++++++++++---------
>   drivers/gpu/drm/bridge/sii902x.c             |  7 +++----
>   drivers/gpu/drm/bridge/thc63lvd1024.c        |  7 +++----
>   drivers/gpu/drm/bridge/ti-tfp410.c           | 27 ++++++++++++------------
>   drivers/gpu/drm/bridge/ti-tpd12s015.c        |  8 +++----
>   include/drm/bridge/samsung-dsim.h            |  1 -
>   include/drm/drm_of.h                         |  6 +++++-
>   10 files changed, 69 insertions(+), 64 deletions(-)
> ---
> base-commit: 2bcba510a612cea32b8a536eedeabd7fcb413cd0
> change-id: 20251223-drm-bridge-alloc-getput-drm_of_find_bridge-2-12c6bbcb6896
>
> Best regards,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

