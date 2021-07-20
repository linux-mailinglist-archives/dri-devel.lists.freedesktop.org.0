Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2E93CF3C5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 07:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C71789E36;
	Tue, 20 Jul 2021 05:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93B189E36
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 05:01:14 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id e13so18109379ilc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 22:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sdFmRaMOmgHuGWvIA23Uxlb55xudqfFv81rs6+IjDL8=;
 b=ev1KPypUlq3y0Q4/dy0N6VoE6A7j4QNY+od7m8kBCzEroX+XGVjvgM4EjjxV9Tse0k
 tYpASYDiB4O80BGdwAp9NKlwF1WBPnoLL5GIw4wqt6OimddHmlmr/PD4S03FNEeHnsDq
 ns9+32yAu01J8lLJKvy5Tt42o2zvu2IMmYY/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sdFmRaMOmgHuGWvIA23Uxlb55xudqfFv81rs6+IjDL8=;
 b=Io0ofX44pUrhuQqMTJKB4JUxKj9H/GXxju4xe2FsuZFul558I+3bjA7Vl272dlZf3X
 Cp0sDwF/UT1aftAC8MVZOPh2QZ/+m41LZMvjyo/ibkEyaLLJuwHDqawuqkX2pznjIkAs
 xiglvxMIMGYAPr5u2EUMoff/Ll184Y8u0hWoJ8yNqFVD404yyEUhObMgMrVw5o5XMWSu
 FmS+CQGGUCzS3Y30EZpLnNzGKWcXUHE+Ban895qm8oRMesrPg2TqpVOew8dpiotjS2tF
 4bnHuWS1Pn8PwYSRclRbfMWcEJVPiAVAjZwJ0Ls73qOXOKhKhRyybYS40fkcmP1QeE9Z
 7Nyg==
X-Gm-Message-State: AOAM533FU7OUVF5nyWbi7lLAb+IjJ+ZE7JDnB4M9v1V+WbZ033+slGG1
 evNdSRlQL/o9IUvId+gKEKx1o/PZ8f3Neh5lH+WvAQ==
X-Google-Smtp-Source: ABdhPJxvZdJx3bv0pe2kdZh0PN0L4BVAX2MZFdn/Gb2Ux/JNOFo8roz4c1a5MLWVtRCFH1YMiTt1HHEqW3KZXcnUX08=
X-Received: by 2002:a92:d305:: with SMTP id x5mr20065108ila.150.1626757274018; 
 Mon, 19 Jul 2021 22:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <1626683082-29570-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626683082-29570-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626683082-29570-2-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 20 Jul 2021 13:00:48 +0800
Message-ID: <CAJMQK-jsbudDCj2TjS13_z--5j+2heUgLYsCTQ23Xd7T4wUZYQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: add dither 6 setting
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

On Mon, Jul 19, 2021 at 4:24 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> in the first version dither patch
> https://patchwork.kernel.org/project/linux-mediatek/patch/1553667561-25447-13-git-send-email-yongqiang.niu@mediatek.com/
> dither 6 setting is included in that patch
I think you don't need to link the first version here.

> bit 1 is lfsr_en( "Enables LFSR-type dithering"), need enable
> bit 2 is rdither_en(Enables running order dithering), need disable
> in this issue
> https://partnerissuetracker.corp.google.com/issues/190643544
Can you describe the issue in text instead of pasting a link that is
not accessible to everyone?

>
> dither 6 setting missed in set dither common patch
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c?h=next-20210430&id=a6b7c98afdcad0f149010ae028b24f2d0dc24cdb

If this is fixing a previous patch, please add Fixes: tag instead of
pasting a link here.


>
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
