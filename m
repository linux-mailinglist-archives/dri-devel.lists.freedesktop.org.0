Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D2FD07F58
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD34B10E86F;
	Fri,  9 Jan 2026 08:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="YMRNwSI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF0610E86F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:49:51 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260109084949euoutp0125b40c25589d327250319dcf2a4549a2~JA_AITBdy2011020110euoutp01T
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:49:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260109084949euoutp0125b40c25589d327250319dcf2a4549a2~JA_AITBdy2011020110euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1767948589;
 bh=DqIjDWDNDsxEnQmjqSn3lRLsKhnspZsn6fUpo/KCo90=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=YMRNwSI0wOZceG8PA3KPr6eUHpRCI4nEB1T3hx/UIUIEVNxe2jnxPUWw53vAm0Xm1
 mh77tLU02YzvuYMn7HWU5SQGgp0Ra/nxZGl2zLQxNys4T5mpfMsy+yMVavw/YhWI1V
 NSbVonu+LY+EjcCjR0PuqWH3TWe0nlE7XUaZit/I=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260109084948eucas1p25d45866af56896d55a77289f1816a144~JA9-oK3f80983509835eucas1p2E;
 Fri,  9 Jan 2026 08:49:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260109084946eusmtip19166b5af025e4b586d8c35e4bbabd918~JA99w3fNE3189931899eusmtip1L;
 Fri,  9 Jan 2026 08:49:46 +0000 (GMT)
Message-ID: <098a1557-aad0-4db4-822f-ed672e97c473@samsung.com>
Date: Fri, 9 Jan 2026 09:49:46 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 11/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: don't use the bridge pointer as an error indicator
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
 linux-arm-kernel@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-11-8bad3ef90b9f@bootlin.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260109084948eucas1p25d45866af56896d55a77289f1816a144
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260109073233eucas1p2221313acb7879127ca0582b2391ba460
X-EPHeader: CA
X-CMS-RootMailID: 20260109073233eucas1p2221313acb7879127ca0582b2391ba460
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
 <CGME20260109073233eucas1p2221313acb7879127ca0582b2391ba460@eucas1p2.samsung.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-11-8bad3ef90b9f@bootlin.com>
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

On 09.01.2026 08:31, Luca Ceresoli wrote:
> In preparation to handle refcounting of the out_bridge, we need to ensure
> the out_bridge pointer contains either a valid bridge pointer or NULL, not
> an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
> redeference an ERR_PTR.
>
> Stop using IS_ERR(next_bridge) as an indication of an error, and instead
> use the 'ret' integer.
>
> No functional change.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 8dd058124e93..afaa63c4d3f7 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1891,7 +1891,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   	struct device_node *np = dev->of_node;
>   	struct device_node *remote;
>   	struct drm_panel *panel;
> -	int ret;
> +	int ret = 0;
>   
>   	/*
>   	 * Devices can also be child nodes when we also control that device
> @@ -1926,16 +1926,17 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   	panel = of_drm_find_panel(remote);
>   	if (!IS_ERR(panel)) {
>   		next_bridge = devm_drm_panel_bridge_add(dev, panel);
> +		if (IS_ERR(next_bridge))
> +			ret = PTR_ERR(next_bridge);
>   	} else {
>   		next_bridge = of_drm_find_bridge(remote);
>   		if (!next_bridge)
> -			next_bridge = ERR_PTR(-EINVAL);
> +			ret = -EINVAL;
>   	}
>   
>   	of_node_put(remote);
>   
> -	if (IS_ERR(next_bridge)) {
> -		ret = PTR_ERR(next_bridge);
> +	if (ret) {
>   		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
>   		return ret;
>   	}
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

