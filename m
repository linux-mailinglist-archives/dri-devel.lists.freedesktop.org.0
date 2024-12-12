Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9590B9EEEF1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43F910E0C5;
	Thu, 12 Dec 2024 16:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TLW5LTOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F47E10ED56
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 16:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734019537;
 bh=J1scdp67Yf0dN731s+TeIiFUh/val29sz3XZEjfTzxU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TLW5LTOpDIKHws5iJ9xFtxE1SpY4vug6sm8YNGS9UMeD/RRqKXzTAAtKX20365AJh
 kILazhLvIPfBGbHfUhkqqWlYRkMyX87RVJY6maxF5yVxSg0qzxMMnqywXWBqdGdtMM
 L1wKaWDqLDWhCzJ9zS7wvrLU48dloqzWKKFjqumNdiNkF1nvBEAK4BjAoWtvXB2HuY
 SZFeZAfjqFp8elCWJTxyvNMYMd89BIcZRkkrYwl3mSC6m1xXhK3QhA2nMHECjSTJev
 TFgFupVDtvA6s9cAe6sZ0iFiJ3oo0P3EaGbrhYcgCqrzramOKQHrjReMSuwLpg09Ah
 Cqt0DYXeNJ9AA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C079417E37A4;
 Thu, 12 Dec 2024 17:05:36 +0100 (CET)
Message-ID: <6710abd1-128d-48ff-84a1-880053fd9e84@collabora.com>
Date: Thu, 12 Dec 2024 17:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dts: arm64: mediatek: mt8188: Update OVL compatible
 from MT8183 to MT8195
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fei Shao <fshao@chromium.org>
References: <20241212153344.27408-1-jason-jh.lin@mediatek.com>
 <20241212153344.27408-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241212153344.27408-3-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/12/24 16:33, Jason-JH.Lin ha scritto:
> The OVL hardware capabilities have changed starting from MT8195,
> making the MT8183 compatible no longer applicable.
> Therefore, it is necessary to update the OVL compatible from MT8183 to
> MT8195.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Jason, just so you know - I have patches here adding DSC and merge components of
VDO0, other than all MDP3 components.

Those are almost ready to send, I only need to finish some testing before ;-)

For this one, anyway:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index faccc7f16259..23ec3ff6cad9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -2488,7 +2488,7 @@ jpeg_decoder: jpeg-decoder@1a040000 {
>   		};
>   
>   		ovl0: ovl@1c000000 {
> -			compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8183-disp-ovl";
> +			compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl";
>   			reg = <0 0x1c000000 0 0x1000>;
>   			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
>   			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;


