Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF21A400DEB
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 06:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0440D89E59;
	Sun,  5 Sep 2021 04:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA77389E59
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 04:18:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FB9960FE6
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 04:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630815509;
 bh=hILamdUxAScAanWUq9dM9vg/cWHDnGZEiyiKkUJl9g4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tmZMQa+nwkbHtU6/6zmn2ClmmhDgxFNLclrztOmm1y5TsjbK3vdWV3trieA+hFI54
 2pVs0EPg4lHhsNWC8KCW5uHjPTSrzcxN6FaYa/aW5+oaoYbcdBZhqKTGD2tuJgr/8O
 sLGFJwSupP4j/ZO6a3ffhgfUiDVEIjvSaznm/leYQpsMrPwypWGRcu9QpyJyoYR+td
 ZUKuE2Q6CPoIV/t4tywRkKMcddeNVP6Zmy4O014hzggPrUox4Yn/0rRIvt7zTAzsxd
 mShAFNcH0lF/pUJc1S9XVLsPuEQ2q7iNjcN2Geb3jeLaQAmY7veAQphD9h+HpxWvfp
 DoYoo3ZxejBVg==
Received: by mail-ed1-f50.google.com with SMTP id g21so4631414edw.4
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Sep 2021 21:18:29 -0700 (PDT)
X-Gm-Message-State: AOAM533omr+fRLO7Pcck45GDnpaIuGXj16sJIKFrYg1p93lFYRLmssub
 WbMNK76cMl9vT41UwhmbNwE4c/uV3mAT0d0F7Q==
X-Google-Smtp-Source: ABdhPJyhdyVAnNA0Mv4NieZnYZWl2o+UnL75b6sLcTvXxKX77z04lVP3xY3uwzh8aNDQCHuVhS+3EYQvEM8c/7Oj8dY=
X-Received: by 2002:a50:bb0f:: with SMTP id y15mr1727649ede.159.1630815507961; 
 Sat, 04 Sep 2021 21:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
 <20210825144833.7757-10-jason-jh.lin@mediatek.com>
In-Reply-To: <20210825144833.7757-10-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Sep 2021 12:18:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY__UuzKqNoTSQw9OwPCyQH7m9Sdf-CUvdcnr7jz5Hne-nA@mail.gmail.com>
Message-ID: <CAAOTY__UuzKqNoTSQw9OwPCyQH7m9Sdf-CUvdcnr7jz5Hne-nA@mail.gmail.com>
Subject: Re: [PATCH v9 09/14] drm/mediatek: remove unused define in
 mtk_drm_ddp_comp.c
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, fshao@chromium.org, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, 
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

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=882=
5=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8810:48=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Remove the unsed define in mtk_drm_ddp_comp.c

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> rebase on [1] series
> [1] drm/mediatek: Separate aal module
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D5164=
63
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 99cbf44463e4..484080a0defa 100644
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
> @@ -39,26 +37,18 @@
>  #define DITHER_ENGINE_EN                       BIT(1)
>  #define DISP_DITHER_SIZE                       0x0030
>
> -#define LUT_10BIT_MASK                         0x03ff
> -
>  #define OD_RELAYMODE                           BIT(0)
>
>  #define UFO_BYPASS                             BIT(2)
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
