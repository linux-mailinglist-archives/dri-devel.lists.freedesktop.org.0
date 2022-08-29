Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1D15A4684
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 11:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055C410EE41;
	Mon, 29 Aug 2022 09:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA9F10EE41
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 09:52:53 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 55BDB6601EF3;
 Mon, 29 Aug 2022 10:52:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661766772;
 bh=DOOeZ5TocTeNw6rUquvXDuwOcgicPui9OcTrbY9j4bQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ku2W3MDOZWr/nzqhNKp5ebzlbv8gwpUjeWBI4IcZynG2q/6vyJ6J06KeMDL/ARDm1
 Y0yohfxSbjIpPsIB6l53B3hPD5ujRJhnDQ3njsBFMNrfydzuyLJs9fPZiwdwJRA73n
 XvyqWa+GrIdlpxU2n0QG50yCVuV7Q2I8SM0gEeSUHeXqHNlYDuG7BX2DM9Ua8zEAJt
 A29OdV0xK3pRF4Zr5jXlJCDoNPoB9aLQlKds3JRn1x4dXhMM4Rj1vyVRDv2PexYfVs
 OVYrtkeLmPpFGtj5QBcI/YxRkH7iPi0ocL9jjmgmBFvFzJaKbh44hzJwqkO8tNS531
 3n87+SEdtBH0g==
Message-ID: <3e33e564-a62d-d07c-f214-0f1857b99a9c@collabora.com>
Date: Mon, 29 Aug 2022 11:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 rex-bc.chen@mediatek.com, jason-jh.lin@mediatek.com,
 yongqiang.niu@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch
References: <1661743308-29120-1-git-send-email-xinlei.lee@mediatek.com>
 <1661743308-29120-2-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1661743308-29120-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 29/08/22 05:21, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add mmsys func to manipulate dpi output format config for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/soc/mediatek/mt8186-mmsys.h    | 1 +
>   drivers/soc/mediatek/mtk-mmsys.c       | 8 ++++++++
>   include/linux/soc/mediatek/mtk-mmsys.h | 3 +++
>   3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> index eb1ad9c37a9c..6eca3445bea3 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -3,6 +3,7 @@
>   #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
>   #define __SOC_MEDIATEK_MT8186_MMSYS_H
>   
> +#define MT8186_DPI_OUTPUT_FORMAT		0x400

For readability, can we please rename this definition to

MT8186_MMSYS_DPI_OUTPUT_FORMAT

Thanks,
Angelo

