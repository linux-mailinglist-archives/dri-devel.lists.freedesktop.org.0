Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F36A3F1C65
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 17:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D856E8F7;
	Thu, 19 Aug 2021 15:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C246E8F7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 15:14:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76480610FE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629386064;
 bh=6RbiCLR/J3ApdDbLsZpuHB3TvFLX+SWaJ1+NjJtMJY8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AHyPiVBoomZwv4Xo5tk1EFmp1N/E2HBfNMARLkELCOYJ9dI/EEsPG4CveHebEmUmv
 zvGhAgXRHaBBmkfo8a1vMdTSuAvstN00YmTIeiWZJ0qgZLWyn1dJ2mBNLq88xZLYaI
 2616jUShd6FjuLGxuGAcmuiZWR3OtByJ82LOxqWjacg+E2fC1xTUzKuxpkzqifCPP2
 S36iBh6O2H5PpME3yMtr9quGFHjxB/MYPxCAu1zGZo77fOso8S9lUmkgOGyhloQsge
 LhkW3QGVkkVQGqdxg2GNLtsvgof3RZ9kAf887waxUrG6aZrISLmIIHyERyuCsMM2oX
 C5ls+WQ3ef9nQ==
Received: by mail-ej1-f44.google.com with SMTP id qk33so13582908ejc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 08:14:24 -0700 (PDT)
X-Gm-Message-State: AOAM530iEpkdCj6nVLTTNN3MzHi+P84NtNOSZuba8QKxLhY3j4fpJZKf
 hRykTpWGj8LXPhG6SrT5oSm8QoTnvI/IB8lvwQ==
X-Google-Smtp-Source: ABdhPJxNW1csyeYOicQ3nM6PcDuxFbu6S4tmvu4KMqvNMAFuMYOi/tLANBBPh57govVIbwsYHsNcG7N9//UyPl43KyQ=
X-Received: by 2002:a17:906:f43:: with SMTP id
 h3mr16507585ejj.267.1629386062976; 
 Thu, 19 Aug 2021 08:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-9-jason-jh.lin@mediatek.com>
In-Reply-To: <20210819022327.13040-9-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 19 Aug 2021 23:14:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9_YwZH4dLyVXmW7irQ8WJaKFzT+72Pgczu1X3u4jvnbg@mail.gmail.com>
Message-ID: <CAAOTY_9_YwZH4dLyVXmW7irQ8WJaKFzT+72Pgczu1X3u4jvnbg@mail.gmail.com>
Subject: Re: [PATCH v8 08/13] drm/mediatek: remove unused define in
 mtk_drm_ddp_comp.c
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, fshao@chromium.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 singo.chang@mediatek.com, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
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

Hi, Jason:

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=881=
9=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:23=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Remove the unsed define in mtk_drm_ddp_comp.c

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 75bc00e17fc4..aaa7450b3e2b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -21,8 +21,6 @@
>  #include "mtk_drm_crtc.h"
>
>  #define DISP_OD_EN                             0x0000
> -#define DISP_OD_INTEN                          0x0008
> -#define DISP_OD_INTSTA                         0x000c
>  #define DISP_OD_CFG                            0x0020
>  #define DISP_OD_SIZE                           0x0030
>  #define DISP_DITHER_5                          0x0114
> @@ -42,8 +40,6 @@
>  #define DITHER_ENGINE_EN                       BIT(1)
>  #define DISP_DITHER_SIZE                       0x0030
>
> -#define LUT_10BIT_MASK                         0x03ff
> -
>  #define OD_RELAYMODE                           BIT(0)
>
>  #define UFO_BYPASS                             BIT(2)
> @@ -52,18 +48,12 @@
>
>  #define DISP_DITHERING                         BIT(2)
>  #define DITHER_LSB_ERR_SHIFT_R(x)              (((x) & 0x7) << 28)
> -#define DITHER_OVFLW_BIT_R(x)                  (((x) & 0x7) << 24)
>  #define DITHER_ADD_LSHIFT_R(x)                 (((x) & 0x7) << 20)
> -#define DITHER_ADD_RSHIFT_R(x)                 (((x) & 0x7) << 16)
>  #define DITHER_NEW_BIT_MODE                    BIT(0)
>  #define DITHER_LSB_ERR_SHIFT_B(x)              (((x) & 0x7) << 28)
> -#define DITHER_OVFLW_BIT_B(x)                  (((x) & 0x7) << 24)
>  #define DITHER_ADD_LSHIFT_B(x)                 (((x) & 0x7) << 20)
> -#define DITHER_ADD_RSHIFT_B(x)                 (((x) & 0x7) << 16)
>  #define DITHER_LSB_ERR_SHIFT_G(x)              (((x) & 0x7) << 12)
> -#define DITHER_OVFLW_BIT_G(x)                  (((x) & 0x7) << 8)
>  #define DITHER_ADD_LSHIFT_G(x)                 (((x) & 0x7) << 4)
> -#define DITHER_ADD_RSHIFT_G(x)                 (((x) & 0x7) << 0)
>
>  struct mtk_ddp_comp_dev {
>         struct clk *clk;
> --
> 2.18.0
>
