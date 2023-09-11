Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A87E479A79F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 13:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE90710E2C5;
	Mon, 11 Sep 2023 11:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7538F10E2C5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 11:28:43 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 655AC6600BB0;
 Mon, 11 Sep 2023 12:28:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694431722;
 bh=VCO8hFhrrVLv5Zdp1yxb+bem6zXtstRZklPiz0+rgd4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Uk2qcLfxmAsXKNnobr9UNWX4/Ixh2BMKHQizFVNm6y/5eJw/LNhXRmE076AoXbeb2
 KNz58L4dve0LM/UXPpGDrjBwXVKxXhvw5P51AwyLvh34KSGxD69kIsN7LM8j2PMSK5
 MCajBCmrgbPfeIyr+6ETuuxKdVDc5Z7o7JyCLuDorWYeeCLWNdzAWi9grFLIG2fc9K
 BUgSM7KUdFx0SzGwjsKUaFaGbVzCKVtCoevH40yqAHtKO4GrsosIXsrvaShGuwSdym
 M7iAZg7SgY7HvPozqZvAaTCiS6RG/8j8mlBLA469IM0D8cBMMH222+BFB49eTZC+kW
 wWrOP2B9rYW3A==
Message-ID: <247d0b44-9359-2682-7e64-313eb1dd3e67@collabora.com>
Date: Mon, 11 Sep 2023 13:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RESEND PATCH v6 20/20] drm/mediatek: Set DPI input to 1T2P mode
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
 <20230911074233.31556-21-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911074233.31556-21-shawn.sung@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/09/23 09:42, Hsiao Chien Sung ha scritto:
> DPI input is in 1T2P mode on MT8195,
> align the setting of MT8188 with it,
> otherwise the screen will glitch.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

First of all, this commit needs a Fixes tag... but then, instead of getting a
1:1 duplicate of mt8195_dpintf_conf you can, at this point, entirely remove
mt8188_dpintf_conf and assign the 8195 one to the 8188 compatible: please do so.

Thanks,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 2f931e4e2b60..c6ee21e275ba 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -963,7 +963,7 @@ static const struct mtk_dpi_conf mt8188_dpintf_conf = {
>   	.output_fmts = mt8195_output_fmts,
>   	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
>   	.pixels_per_iter = 4,
> -	.input_2pixel = false,
> +	.input_2pixel = true,
>   	.dimension_mask = DPINTF_HPW_MASK,
>   	.hvsize_mask = DPINTF_HSIZE_MASK,
>   	.channel_swap_shift = DPINTF_CH_SWAP,
> --
> 2.18.0
> 

