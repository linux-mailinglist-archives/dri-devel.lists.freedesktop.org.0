Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25123CF437
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 08:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBFF89F0B;
	Tue, 20 Jul 2021 06:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F0F89F0B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 06:03:10 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id o8so18204271ilf.4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 23:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=86QVHJVxOCndQaXxHRwaOxxcq7eMK28HT05PxvcoBYI=;
 b=bu4dAUXhDfU3dlbFBsoThBblvvUC91XDro9V2evK/M12RqO1wW4gp88UdAm/F2rtFC
 Q/1ToZcP/0N8Nvxc65pfwLiL5UsrZuJIsOZIglgaGTuSjDq2XEYJy8yhmbnivp59FXrO
 5dgDFoUDO3t/Gm2bavuKXttbdx1eZLMxFrMqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=86QVHJVxOCndQaXxHRwaOxxcq7eMK28HT05PxvcoBYI=;
 b=K7/vh4fSYLj5aTyf10zNt8XRtwlb6rlTCDXHfqz17FHPKdFmfdbaca34k7IcMmIW3Q
 jn6Sku9qalAllHOwI2RiFW5iQsdF0xh5SsTMRA08RBnz8ilkqHr6IM81ymKDCyn+xOXI
 VkAPc8bitLdUx8ORxRBj0+KjfmAe6c/hPHULdL0lzV9xQdL8wgdGsUyYm1MlR4DTzBHh
 pswnu6Tg5H675LObnMssTWDYnzdtXsXVs2oNCQvi8W99sst+mhe/G/VSVUkCzGfG5k1h
 qSf944I8LvqJJTxLEo0AXaCDUmxbeCMXG9qCrcqhZIPQNP2nP/eplDysozQ2kersysL7
 EAmA==
X-Gm-Message-State: AOAM530RPE35r9G4/AdlxHT0sw+gxv1djmrgiT4tm+RzWMdwiV9a0N1l
 x58qOywLGgo1RDZaVMqNuGWlYpJwvwPDPSD9XGu2qA==
X-Google-Smtp-Source: ABdhPJwFk6YVkmc9gpzvQzRgdkNx/5Ot14DkNuPE+cqjEdJYOOoLrPx04nhKCCVAgpn8DccUvt9FPHZ2ECPmqkXRtQk=
X-Received: by 2002:a92:d305:: with SMTP id x5mr20209347ila.150.1626760989584; 
 Mon, 19 Jul 2021 23:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <1626760277-5733-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626760277-5733-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626760277-5733-2-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 20 Jul 2021 14:02:43 +0800
Message-ID: <CAJMQK-jK0WRgU47YZ8+Jdt50y2CnkUjHKT2C+xfTvgst9bTmTg@mail.gmail.com>
Subject: Re: [PATCH v3] Fixes: a6b7c98afdca(drm/mediatek: add
 mtk_dither_set_common() function)
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 1:51 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> dither 6 setting is missed in a6b7c98afdca
> bit 1 is lfsr_en( "Enables LFSR-type dithering"), need enable
> bit 2 is rdither_en(Enables running order dithering), need disable
>

Fixes tag should be here, and the title of this patch should be the
same as v2: drm/mediatek: add dither 6 setting

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 99cbf44..7dd8e05 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -26,6 +26,7 @@
>  #define DISP_OD_CFG                            0x0020
>  #define DISP_OD_SIZE                           0x0030
>  #define DISP_DITHER_5                          0x0114
> +#define DISP_DITHER_6                          0x0118
>  #define DISP_DITHER_7                          0x011c
>  #define DISP_DITHER_15                         0x013c
>  #define DISP_DITHER_16                         0x0140
> @@ -135,6 +136,7 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
>
>         if (bpc >= MTK_MIN_BPC) {
>                 mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
> +               mtk_ddp_write(cmdq_pkt, 0x3002, cmdq_reg, regs, DISP_DITHER_6);
>                 mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
>                 mtk_ddp_write(cmdq_pkt,
>                               DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> --
> 1.8.1.1.dirty
>
