Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EBB69F2E0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 11:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D514010E954;
	Wed, 22 Feb 2023 10:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248AC10E951
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 10:44:08 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D9E76600864;
 Wed, 22 Feb 2023 10:44:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677062646;
 bh=2c2NjaUUjpoZ9sAYskn4chLZb1xFyWpgbPXg/Yf9Ihw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ltbA5xeVzjRT6lsN6jY1JhI/67FS776M26GCLglPecv2wIsthsOsCOXE5DgZS5kOI
 eC690RY+xGt9Q61oMOyvJbruXY3ZUzux9IKejP5bR4SQ1uGhzXwTUV8Uw9wFZtxBzE
 HeCxYsfMH1dJGgR6B+46Vajro0HABA+F9aqwzH5krNM03PpH9WhpsCuiFaODeJFA0s
 6VBegZwTykG9r1lFljFUI3VWru+X3nq/3BgXnWFZAm+u06opTtfxZoJGQJ7rOlP+B7
 u5nmcxjKqvmzGGfmoAl8jeXr42bf/dWJD4sGvH+kWwdqdPDuAg7nNf88Hy/jWJPpBn
 WIeQFz78C98Nw==
Message-ID: <24f7dcf8-4f65-d397-b080-30840536012b@collabora.com>
Date: Wed, 22 Feb 2023 11:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 1/2] drm/mediatek: change mmsys compatible for mt8195
 mediatek-drm
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20221227074759.5216-1-jason-jh.lin@mediatek.com>
 <20221227074759.5216-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221227074759.5216-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/12/22 08:47, Jason-JH.Lin ha scritto:
> Because compatible of mt8195 is changing from "mediatek,mt8195-mmsys"
> to "mediatek,mt8195-vdosys0".
> 
> We have to revert the multiple compatible finding function and
> add driver data of mt8195 vdosys0 to mediatek-drm and the sub driver.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c |   6 ++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 128 +++--------------------
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   6 --
>   3 files changed, 20 insertions(+), 120 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 0ec2e4049e07..66cdd0bc1311 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -370,6 +370,10 @@ static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
>   	.fifo_size = 5 * SZ_1K,
>   };
>   
> +static const struct mtk_disp_rdma_data mt8192_rdma_driver_data = {
> +	.fifo_size = 5 * SZ_1K,
> +};
> +
>   static const struct mtk_disp_rdma_data mt8195_rdma_driver_data = {
>   	.fifo_size = 1920,
>   };
> @@ -381,6 +385,8 @@ static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
>   	  .data = &mt8173_rdma_driver_data},
>   	{ .compatible = "mediatek,mt8183-disp-rdma",
>   	  .data = &mt8183_rdma_driver_data},
> +	{ .compatible = "mediatek,mt8192-disp-rdma",
> +	  .data = &mt8192_rdma_driver_data},
>   	{ .compatible = "mediatek,mt8195-disp-rdma",
>   	  .data = &mt8195_rdma_driver_data},
>   	{},

Can you please drop unrelated changes in mtk_disp_rdma.c and send a v8?
We should aim to get this entire thing (8195 vdosys1) finally upstream.


After dropping mtk_disp_rdma.c changes:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


