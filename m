Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22AFB2E21B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 18:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F2610E273;
	Wed, 20 Aug 2025 16:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uMW9dXlD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE3C10E78E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 16:17:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5A0F2601E5;
 Wed, 20 Aug 2025 16:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0149BC4CEEB;
 Wed, 20 Aug 2025 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755706640;
 bh=fONdSSWLD4ciYiiYXbL5hX7jHz6dYO1YgPzjDtd1z2M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uMW9dXlDZPJXeW4+QXLmySJuT9NWSD5weVPY9F1YR2z7W7y861mVHF9PbtkN6u+Rt
 QHEreW6gwrcrYFhPaxFDZwrMuOiMykNohoQpBMmB/OLplJoMF2AOwMWIrbPLubn7p0
 vdhDjuZCTxFXgmWsNR5hVb6N7fg76n6FaiglEh87wRYpoBzMh4qOZ697eZVPw3Op34
 Kc18qXW8Be16tw2WkEkHjGU6BITglxm5iIqU7qJUtVFoySwAp6qbBM5XOF2Pw7E2y6
 shyD3n6WygFBUZrOk038tn+Gm66qQhDMElBc/6xtFy/9p6J1zEwPV5mWhBrXqisTdM
 9uB594EVlImYQ==
Date: Wed, 20 Aug 2025 21:47:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "payne.lin" <payne.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
 jh.hsu@mediatek.com, Bincai Liu <bincai.liu@mediatek.com>
Subject: Re: [PATCH] phy: mediatek: Modify mipi clk upper bound to 2.5Gbps
Message-ID: <aKX1CxD_2mlOwYn-@vaman>
References: <20250814125406.4161220-1-payne.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814125406.4161220-1-payne.lin@mediatek.com>
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

On 14-08-25, 20:54, payne.lin wrote:
> From: Bincai Liu <bincai.liu@mediatek.com>
> 
> Mipi dphy can support up to 4k30 without dsc.

Good, how does that translate to below value change, can you please
explain?

> 
> Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
> Signed-off-by: Payne Lin <payne.lin@mediatek.com>
> ---
>  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> index 553725e1269c..b8233c496070 100644
> --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> @@ -100,7 +100,7 @@ static void mtk_mipi_tx_pll_disable(struct clk_hw *hw)
>  static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>  				       unsigned long *prate)
>  {
> -	return clamp_val(rate, 125000000, 1600000000);
> +	return clamp_val(rate, 125000000, 2500000000);
>  }
>  
>  static const struct clk_ops mtk_mipi_tx_pll_ops = {
> -- 
> 2.45.2

-- 
~Vinod
