Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE17059A5C9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 20:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C299D10E163;
	Fri, 19 Aug 2022 18:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E5810E209
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 18:54:06 +0000 (UTC)
Received: from notapiano (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 240DC6601DC5;
 Fri, 19 Aug 2022 19:54:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660935245;
 bh=K0YLkb0y8E7IJjuV74dUqvmMPhGIIPSjh8y+QKSzuUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NnetjEoq0ZAPXfWQ9ci9nv05AU+ZorGb7w0REYn9xsxSKYfG+1B4H7QoC6Ee2r3oo
 eHx9NNBXej7nZ7pvMxtwRVBkhVA+/gvbWUmAk4NvzaifkQNUyfdZ8MGZtDWsif7nGk
 CS1hzqBGqDlZdmPpzSNFQ4A2CIMJYO+qPZHVIOlHRd8K/GLCzpVKAUnu9z5ZUEXTKp
 I55hbtVYs7VwTxzDdPQ4oJN830xsylunDdRgCia0JXtMqGElmaG9ctyR1FxGrWCWqK
 RMyvuMFRD9Gbx+8K3NfvyF1oRrlsi/12sDrqsHUM0v14tBtHfkwjVBs9/4z9fML1jU
 TR6pxUAL4Ojfw==
Date: Fri, 19 Aug 2022 14:54:00 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: xinlei.lee@mediatek.com
Subject: Re: [PATCH v2,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Message-ID: <20220819185400.aokd53xln6rmc3xk@notapiano>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
 <1659693461-27057-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1659693461-27057-2-git-send-email-xinlei.lee@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xinlei,

On Fri, Aug 05, 2022 at 05:57:40PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add mmsys func to manipulate dpi output format config for MT8186.

func -> function
config -> configuration

> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Same thing about the co-developed-by.

> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> ---
>  drivers/soc/mediatek/mt8186-mmsys.h    | 1 +
>  drivers/soc/mediatek/mtk-mmsys.c       | 8 ++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h | 3 +++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> index eb1ad9c37a9c..620c062e4893 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -3,6 +3,7 @@
>  #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
>  #define __SOC_MEDIATEK_MT8186_MMSYS_H
>  
> +#define MT8186_DPI_OUTPUT_FORMAT		0X400

0x400

(lowercase "x")

>  #define MT8186_MMSYS_OVL_CON			0xF04
>  #define MT8186_MMSYS_OVL0_CON_MASK			0x3
>  #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 9bbf0103b225..0e71a3296046 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -252,6 +252,14 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>  
> +void mtk_mmsys_ddp_dpi_confing(struct device *dev, u32 mask, u32 val,

confing -> config

But I'd add something to the name to indicate it handles specifically the
format:

mtk_mmsys_ddp_dpi_fmt_config

Thanks,
Nícolas
