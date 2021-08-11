Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5497B3E9B1C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 01:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593436E1E9;
	Wed, 11 Aug 2021 23:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605AE6E1E9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 23:05:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAAFE6108C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 23:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628723143;
 bh=LBkFZQCUVSz/Rhx1ZP4O8O+xC4njvVvDFWJMqfhUzZc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N7j+EgSapAyF+E2AEGflrSJiCZjpXiN2JMJWDRznUA/NrxH+lurInjTi1MtNpy85D
 xrJ7HqMEM0cEO5JzCgW2Lz0DffXyBVfrtxqKIXiAn6i5bBxbOSn+zcxVG6d6GvMMrK
 bVWXu4t+swt1Ylq/HkupY0NqVEegG6CVxnygcST8s+n1CW6/WYqUrUQkxfr5m2S/ow
 pMTVv8JkSs5Lvg++Yqzdkq9L51sUm711vSUAPRNPiIeTBhtJ5goF6+14H2UfZQX2Vu
 cZcu3ctNnysA4Km0Q2sG4gehaPE1JbwKv5poy95kXoLmCCFE/qu1rkqhn293tb2X4e
 qMsycz3wt/GRg==
Received: by mail-ej1-f50.google.com with SMTP id yk17so7480867ejb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 16:05:43 -0700 (PDT)
X-Gm-Message-State: AOAM5335ysrwQrKpH0/2g4HYczfZhVEG47H71miE1cpeI41Ytummsabc
 YVZKGy3EOOVnoVoI1PSkOoHV096YJGZm5zE4yQ==
X-Google-Smtp-Source: ABdhPJyl3xEbZZiTrI86cuk97OLZ4BOIdeT1gJvH8o+OFIusAC3qYu99JLfekICMO5HYVUlnTIbMmIkwRgDjMX6NUW0=
X-Received: by 2002:a17:906:fcd7:: with SMTP id
 qx23mr818236ejb.267.1628723142314; 
 Wed, 11 Aug 2021 16:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210810025503.16353-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20210810025503.16353-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 12 Aug 2021 07:05:31 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8+wnXxetnvijkc1FCN=bPuq8sO4psoTpjT9gS-4nieMw@mail.gmail.com>
Message-ID: <CAAOTY_8+wnXxetnvijkc1FCN=bPuq8sO4psoTpjT9gS-4nieMw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: add AAL output size configuration
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, fshao@chromium.org, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
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

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=881=
0=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:55=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> To avoid the output width and height is incorrect,
> AAL_OUTPUT_SIZE configuration should be set.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 0664d1392c26 ("drm/mediatek: Add AAL engine basic function")
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> Change in v2:
> - fix to one line
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 75bc00e17fc4..50d20562e612 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -34,6 +34,7 @@
>
>  #define DISP_AAL_EN                            0x0000
>  #define DISP_AAL_SIZE                          0x0030
> +#define DISP_AAL_OUTPUT_SIZE                   0x04d8
>
>  #define DISP_DITHER_EN                         0x0000
>  #define DITHER_EN                              BIT(0)
> @@ -197,6 +198,7 @@ static void mtk_aal_config(struct device *dev, unsign=
ed int w,
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
>         mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,=
 DISP_AAL_SIZE);
> +       mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,=
 DISP_AAL_OUTPUT_SIZE);
>  }
>
>  static void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state =
*state)
> --
> 2.18.0
>
