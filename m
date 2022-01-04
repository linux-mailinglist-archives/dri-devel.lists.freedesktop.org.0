Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB103483EDB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 10:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE50310E51C;
	Tue,  4 Jan 2022 09:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC33710E51C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 09:08:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E676D1F42D09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641287285;
 bh=8Dx96BzS5V0cNEYbDj2kjQ7X4Fa7vPHPz+P7c6y5cIw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=H/Jkyi5lCDzjOSF6jvyqDzBlvnbdD6WiEuWhu0q4kvZym9jq1IlSx2Aunuh5w3kdJ
 RRTaGEdt9RnDRQiXxMT6+JDmiFhRGu98pJ8wQmgTf2hJiWp2yHAqtZ+JVQ+7gRL1d6
 TksM0T4L5/ZLTKCfelFi/+5Ic4M00fN7IZ9+y7m/GMXJKIqKp1UEuiqN8yvM8VuYug
 Nv5/BK9IqvAgreCruqp4Uqxr0jIHpKJ8os6As0Sv3j70r5mE/+tr+3MKVdPsZqWdDI
 lRTpL6r00foKr3ZnCqdDQb/O/nwVcWep7I/cBCvAav3hJclnhFnE43e40PdLYmr/Bl
 636PjsSVY2R5g==
Subject: Re: [PATCH v4] drm/mediatek: Fix mtk_cec_mask()
To: Miles Chen <miles.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Junzhi Zhao <junzhi.zhao@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>
References: <20220103054706.8072-1-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1c57eecc-de2d-b3dc-6ea6-ddd50db70e95@collabora.com>
Date: Tue, 4 Jan 2022 10:08:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220103054706.8072-1-miles.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zhiqiang Lin <zhiqiang.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 03/01/22 06:47, Miles Chen ha scritto:
> In current implementation, mtk_cec_mask() writes val into target register
> and ignores the mask. After talking to our hdmi experts, mtk_cec_mask()
> should read a register, clean only mask bits, and update (val | mask) bits
> to the register.
> 
> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> 
> Cc: Zhiqiang Lin <zhiqiang.lin@mediatek.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> 
> Change since v1:
> add Fixes tag
> 
> Change since v2:
> add explanation of mtk_cec_mask()
> 
> Change since v3:
> change misleading subject and modify the commit message since this is a bug fix patch
> 
> ---
>   drivers/gpu/drm/mediatek/mtk_cec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index e9cef5c0c8f7..cdfa648910b2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -85,7 +85,7 @@ static void mtk_cec_mask(struct mtk_cec *cec, unsigned int offset,
>   	u32 tmp = readl(cec->regs + offset) & ~mask;
>   
>   	tmp |= val & mask;
> -	writel(val, cec->regs + offset);
> +	writel(tmp, cec->regs + offset);
>   }
>   
>   void mtk_cec_set_hpd_event(struct device *dev,
> 

