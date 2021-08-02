Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6D23DE2CC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 01:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158A089BA9;
	Mon,  2 Aug 2021 23:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43CE89BA9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 23:00:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B82C60F94
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 23:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627945250;
 bh=e822VuDx6z8sMZ4u2JoN2zmm7TSpCXSrlQ2PRMcE4RA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JxOIrHwDEsSnb0iq0rIpsYlOLoG24P4miwqyD1FG7n4FWHzwDNfy/NHjYdDMu5Qji
 kXPSkX44FzNpdxEJtmmIARGgMRDYC9iIdUV2TyjtD0Sq+Kg/QNdoUV6RLsJm3/acl7
 25pdODPscvgAAJXGUOgPzTBKvkfiDzgA/ato56Vb671pWbF2IJGQzrlpL81XqgcdW3
 pRcpknNaL3LOwPZKRRkwGd2LdUK2o8yDLvrlVmcOBcoyoiz7VZp8vqJysP6tbh3Cse
 8+95COQy5cbA3qCXkRhDTUyY/YfbD6G1rfhrCL41k18t2xk1f7jCngE/ya9GL8S5ER
 FfHzzKXcHrclw==
Received: by mail-ed1-f42.google.com with SMTP id v20so12592424eda.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 16:00:50 -0700 (PDT)
X-Gm-Message-State: AOAM530OyuWaQDHOSc39FHTbBEMCphBLqvko8z+P9PtXOrfVlHXNqasV
 dNcWn78yXJtT2hWAzewZoPj43SoxzcP4RTEB/Q==
X-Google-Smtp-Source: ABdhPJx6Gl9WihqORzSylHXdbZm8MM0D7sQz2BcZWhMz275j1ol0e9w/UzfEvJ6WuteyWfPe8BLhoqmL0forF5o0OZA=
X-Received: by 2002:a05:6402:718:: with SMTP id
 w24mr21831525edx.49.1627945249057; 
 Mon, 02 Aug 2021 16:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <1626762588-6020-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626762588-6020-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626762588-6020-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 3 Aug 2021 07:00:37 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ynURx3Arevk_Tdc2V2uobJbeRA_2JjmZtsc=wT2V6aA@mail.gmail.com>
Message-ID: <CAAOTY_9ynURx3Arevk_Tdc2V2uobJbeRA_2JjmZtsc=wT2V6aA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/mediatek: add dither 6 setting
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Yongqiang:

Yongqiang Niu <yongqiang.niu@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=
=8820=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:30=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> dither 6 setting is missed in a6b7c98afdca
> bit 1 is lfsr_en( "Enables LFSR-type dithering"), need enable
> bit 2 is rdither_en(Enables running order dithering), need disable
>
> Fixes: a6b7c98afdca(drm/mediatek: add mtk_dither_set_common())
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
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
> @@ -135,6 +136,7 @@ void mtk_dither_set_common(void __iomem *regs, struct=
 cmdq_client_reg *cmdq_reg,
>
>         if (bpc >=3D MTK_MIN_BPC) {
>                 mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5)=
;
> +               mtk_ddp_write(cmdq_pkt, 0x3002, cmdq_reg, regs, DISP_DITH=
ER_6);

Symbolized 0x3002. BIT(1) is lfsr_en.

Regards,
Chun-Kuang.

>                 mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7)=
;
>                 mtk_ddp_write(cmdq_pkt,
>                               DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> --
> 1.8.1.1.dirty
>
