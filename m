Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB6D63915B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 23:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5871010E0C9;
	Fri, 25 Nov 2022 22:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D885810E0C9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 22:24:09 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 169BD6602B6F;
 Fri, 25 Nov 2022 22:24:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669415048;
 bh=n/JLhB9y1lHTrAqStH1aXYwPM6mB/oILrr8xuIpUxBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hL1D4Rz9csbBTpf1Zc8BME8cRYbNoiwVf+91duBmWBmSu3hj0B/x0mxj9IayaaEIF
 ZuRYN0f0bP4uheKt2VXEj61N1VnnDAzSmNKXfudty00OIalGaLuSTbLN/Hkgt23QOQ
 Lkd0dCcu5gqhI3S7O5m+O4ePoMFPq2dV4ybUNFRuVJIOLHiQUJ4NXJOrrGySa78inN
 ke/aQ/9ywGMunB4khwu9lr2l6PyFcvejc9M2a5d+4t7xePZKCqbNez4bkA/zopnbVZ
 eLjJySiDFw+mxFZW2jVoiFaXV8VW7/YY3jktdQ8LKTnULKmrPAMYL5tSmFXvTxp6+c
 KxtGmHbs3kcZQ==
Date: Fri, 25 Nov 2022 17:24:02 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH v28 6/7] drm/mediatek: add drm ovl_adaptor sub driver for
 MT8195
Message-ID: <20221125222402.u4qiolkqi2nsv7ae@notapiano>
References: <20221107072413.16178-1-nancy.lin@mediatek.com>
 <20221107072413.16178-7-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107072413.16178-7-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, wim@linux-watchdog.org,
 linux@roeck-us.net,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 03:24:12PM +0800, Nancy.Lin wrote:
> Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
> the component exists in the path.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
[..]
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 30dcb65d8a5a..ce5617ad04cb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
[..]
> @@ -897,22 +906,18 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  		crtc_i++;
>  
>  	for (i = 0; i < path_len; i++) {
> -		enum mtk_ddp_comp_id comp_id = path[i];
> +		unsigned int comp_id = path[i];
>  		struct device_node *node;
> -		struct mtk_ddp_comp *comp;
>  
>  		node = priv->comp_node[comp_id];
> -		comp = &priv->ddp_comp[comp_id];
> -
> -		if (!node) {
> -			dev_info(dev,
> -				 "Not creating crtc %d because component %d is disabled or missing\n",
> -				 crtc_i, comp_id);
> -			return 0;
> -		}
>  
> -		if (!comp->dev) {
> -			dev_err(dev, "Component %pOF not initialized\n", node);
> +		/* Not all drm components have a DTS device node, such as ovl_adaptor,
> +		 * which is the drm bring up sub driver
> +		 */
> +		if (!node && comp_id != DDP_COMPONENT_DRM_OVL_ADAPTOR) {
> +			dev_err(dev,
> +				"Not creating crtc %d because component %d is disabled, missing or not initialized\n",
> +				crtc_i, comp_id);
>  			return -ENODEV;

Why do you change the behavior here? If !node, the return should be 0, because
there are two separate data streams, for internal and external display, and they
are optional. It should be possible to for example have the nodes for external
display disabled in DT and still have the driver probe and have a working
internal display. But with this change you're breaking that. Also, this message
should stay as dev_info and not mention "not initialized", so basically it
should stay the same as before the change.

Thanks,
Nícolas
