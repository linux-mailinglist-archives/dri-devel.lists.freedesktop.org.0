Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E2C6065DF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 18:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D153010E52D;
	Thu, 20 Oct 2022 16:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC4E10E5A7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 16:33:17 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5C056660252A;
 Thu, 20 Oct 2022 17:33:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666283595;
 bh=Q6u2GbH3PGV2qnNkRIJ/Fn4pm+KSrq6IxNUNSYEyuFY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HrvyrFKm+YQPD31b/I/zrMo5s4g3vbGwhHZXD9Ufc/Pg/y7i650rPbKDnJIG1VUp8
 M2Tyxtgn+uKnhvC0Mu+s5VmAoBE27ikd2mXu3diJWF0yTaaAbSdlwZZ1qRdrZ197tR
 NA7dlUGIyrWt9IWpPHc1F4nLKZ1WXBzFlC3jdJBoNPlg8ba7auPTaHQoWejaI2X0N1
 UiHUX1QcJgYwceHrOw8ORtuKug1p/T92+mF0AlvbzQ8kP6RLAVT47bEeer5nqQeBfY
 FSmlosRyu4VUA8L52cHjyMdpGk0PYNjHZ3fMSuaAPGTP0bND2dOA3OyRa0Z9aS3omy
 0lWp6oiNXPRqg==
Date: Thu, 20 Oct 2022 12:33:10 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: xinlei.lee@mediatek.com
Subject: Re: [PATCH v12,1/3] soc: mediatek: Add all settings to
 mtk_mmsys_ddp_dpi_fmt_config func
Message-ID: <20221020163310.tpkjvr7pe5vhwylh@notapiano>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
 <1666147936-27368-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1666147936-27368-2-git-send-email-xinlei.lee@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 19, 2022 at 10:52:14AM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> The difference between MT8186 and other ICs is that when modifying the
> output format, we need to modify the mmsys_base+0x400 register to take
> effect.
> So when setting the dpi output format, we need to call mmsys_func to set

mmsys_func isn't something that exists in the code. Instead mention the actual
function name: mtk_mmsys_ddp_dpi_fmt_config.

> it to MT8186 synchronously.


Here, before saying that the commit adds all the settings for dpi, you could
have mentioned that the previous commit lacked those, to make it clearer:

Commit a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi output for MT8186")
lacked some of the possible output formats and also had a wrong bitmask.


> Adding mmsys all the settings that need to be modified with dpi are for
> mt8186.

This sentence I would change to the following one:

Add the missing output formats and fix the bitmask.


Finally, you're also making the function more HW-agnostic (although in my
opinion this could've been a future separate commit), so it's worth mentioning
it here:

While at it, also update mtk_mmsys_ddp_dpi_fmt_config() to use generic formats,
so that it is slightly easier to extend for other platforms.

> 
> Fixes: a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi
> output for MT8186")

The fixes tag should be kept in a single line, without wrapping.

> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/soc/mediatek/mt8186-mmsys.h    |  8 +++++---
>  drivers/soc/mediatek/mtk-mmsys.c       | 27 ++++++++++++++++++++------
>  include/linux/soc/mediatek/mtk-mmsys.h |  7 +++++++
>  3 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> index 09b1ccbc0093..035aec1eb616 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -5,9 +5,11 @@
>  
>  /* Values for DPI configuration in MMSYS address space */
>  #define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
> -#define DPI_FORMAT_MASK					0x1
> -#define DPI_RGB888_DDR_CON				BIT(0)
> -#define DPI_RGB565_SDR_CON				BIT(1)
> +#define DPI_FORMAT_MASK					GENMASK(1, 0)
> +#define DPI_RGB888_SDR_CON				0
> +#define DPI_RGB888_DDR_CON				1
> +#define DPI_RGB565_SDR_CON				2
> +#define DPI_RGB565_DDR_CON				3

These defines should all have a MT8186_ prefix. This will avoid confusions now
that mtk_mmsys_ddp_dpi_fmt_config() is being made more platform-agnostic.

>  
>  #define MT8186_MMSYS_OVL_CON			0xF04
>  #define MT8186_MMSYS_OVL0_CON_MASK			0x3
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index d2c7a87aab87..205f6de45851 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -238,12 +238,27 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
>  
>  void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
>  {
> -	if (val)
> -		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> -				      DPI_RGB888_DDR_CON, DPI_FORMAT_MASK);
> -	else
> -		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> -				      DPI_RGB565_SDR_CON, DPI_FORMAT_MASK);
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +
> +	switch (val) {
> +	case MTK_DPI_RGB888_SDR_CON:
> +		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_FORMAT_MASK, DPI_RGB888_SDR_CON);
> +		break;
> +	case MTK_DPI_RGB565_SDR_CON:
> +		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_FORMAT_MASK, DPI_RGB565_SDR_CON);
> +		break;
> +	case MTK_DPI_RGB565_DDR_CON:
> +		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_FORMAT_MASK, DPI_RGB565_DDR_CON);
> +		break;
> +	case MTK_DPI_RGB888_DDR_CON:
> +	default:
> +		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_FORMAT_MASK, DPI_RGB888_DDR_CON);
> +		break;
> +	}

To be honest I don't really see the point of making the function slightly more
platform-agnostic like this. With a single platform making use of it it's just
an unneeded extra abstraction, and it could easily be done when a second
platform starts requiring this as well...

In any case,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

>  }
[..]
