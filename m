Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE67F7A19D1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BAF10E240;
	Fri, 15 Sep 2023 08:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F1C10E240
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:58:39 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3496366072BA;
 Fri, 15 Sep 2023 09:58:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694768317;
 bh=QvOarZtm9q0/2Kba7YS408C3On3CckrdIr72iCDGik0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R69HQPLoeSJeRPnLMYl37vbwbaKYVtZ638yOLvIiYj8GORIrmSChH0A86OyLeP3WK
 szQREpUVuA8jzgUFa1NzVasateqS26xlwtwPcVMmnLLQmlKDdbnraH2fDpaAMRythX
 pbctN3GX+1bMVJ18SZIHOgyF1WeOzbz8IsX00JFpnAlPV8Kp4yRj2FKGLttIc+83bg
 V5ITMSFDWwLqcxc1+UNzeknVQ6RWXUTm4kt1xIqs1jMVxIP7yjjMdtidGnnjSofEwY
 wmUAoyN9wNxHI9lSerXXcAcsKk+99WTGY0yYqfxPguiez+aWO/cUCcGJellnTtL4RA
 xR7TrWis50apQ==
Message-ID: <0a184b35-133b-483c-d475-01120fbdc2ca@collabora.com>
Date: Fri, 15 Sep 2023 10:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] drm/mediatek: dsi: Fix EOTp generation
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230915075756.263591-1-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230915075756.263591-1-mwalle@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/09/23 09:57, Michael Walle ha scritto:
> The commit c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register
> definition") inverted the logic of the control bit. Maybe it was because
> of the bad naming which was fixed in commit 0f3b68b66a6d ("drm/dsi: Add
> _NO_ to MIPI_DSI_* flags disabling features"). In any case, the logic
> wrong and there will be no EOTp on the DSI link by default. Fix it.
> 
> Fixes: c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register definition")
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Hello Michael,
your commit is missing a small piece! :-)

Besides, I've already sent a fix for what you're trying to do here:
https://lore.kernel.org/linux-arm-kernel/07c93d61-c5fd-f074-abb2-73fdaa81fd65@collabora.com/T/

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d67e5c61a9b9..8024b20f6b13 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -407,7 +407,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>   	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
>   		tmp_reg |= HSTX_CKLP_EN;
>   
> -	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> +	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>   		tmp_reg |= DIS_EOT;
>   
>   	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);


