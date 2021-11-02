Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FAD4439F5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 00:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1D873919;
	Tue,  2 Nov 2021 23:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5D173918
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 23:45:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E030A6109D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 23:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635896704;
 bh=vPWkcBo86BKXwrWC2Qmwb+8ugZHdTIg3yCp8jZrT4So=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dWGnqdTy6EO7H4LtFwBmfmPTHjiCwUBWySCiJ5Eqr8S+8tG61+LcSyR9TwEkmpZ1g
 Z4RJoxYyuiFBmbCGwqp7JhqMPv/zpxahpa4Diba9LVrcnPrvN640bSjK0eIKoZz4og
 LkeZnBl0NLy+kV+hcnsgQlZai2jr0TjHu5pWZImuOya9id20awwjPQVaScG5qZanSy
 ygmg0hmbSzq8/5kcDltaliIlB/hTrsz0Od8ykBP+xOLNUWA7yNInD62ra8A8pgXsIE
 BeB+9fR0Zn6v0dEdC3Mqh0I77dTNjc4/6x+Pn10kCg7O+rboZ2F2sczmZ2+qDRAAiI
 w1JmBbNEZzzfA==
Received: by mail-ed1-f42.google.com with SMTP id g14so3092895edz.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 16:45:04 -0700 (PDT)
X-Gm-Message-State: AOAM530l6o7/zhhEsjE9sHMb6XI0n1xjO2nsCbWkYty0B//94z/U00Ro
 NJGjJCgwKvmSypy3VMskxJxN5W+tsr82a/tBTg==
X-Google-Smtp-Source: ABdhPJx78xVu8kk62eC7oU7ATd8SHhqdRwLd4zs6Ro16CmY9rBQi3H+kNLSo5dcEKqzkwoK7bgzmFSJ4lPSesTMqBL0=
X-Received: by 2002:a17:907:6ea6:: with SMTP id
 sh38mr51576120ejc.388.1635896703367; 
 Tue, 02 Nov 2021 16:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
 <20211029075203.17093-15-nancy.lin@mediatek.com>
In-Reply-To: <20211029075203.17093-15-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 3 Nov 2021 07:44:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_94jzVaDQC-DBdo584oQ6u_j=ibjRyTQEXaDwrSo24rsQ@mail.gmail.com>
Message-ID: <CAAOTY_94jzVaDQC-DBdo584oQ6u_j=ibjRyTQEXaDwrSo24rsQ@mail.gmail.com>
Subject: Re: [PATCH v7 14/20] drm/mediatek: add display merge start/stop API
 for cmdq support
To: "Nancy.Lin" <nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=8829=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add merge start/stop API for cmdq support. The ovl_adaptor merges
> are configured with each drm plane update. Need to enable/disable
> merge with cmdq making sure all the settings taken effect in the
> same vblank.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 ++
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 20 +++++++++++++++++---
>  2 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index c2de53a5892e..224a710bb537 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -66,6 +66,8 @@ void mtk_merge_stop(struct device *dev);
>  void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsi=
gned int r_w,
>                               unsigned int h, unsigned int vrefresh, unsi=
gned int bpc,
>                               struct cmdq_pkt *cmdq_pkt);
> +void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)=
;
> +void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>
>  void mtk_ovl_bgclr_in_on(struct device *dev);
>  void mtk_ovl_bgclr_in_off(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/=
mediatek/mtk_disp_merge.c
> index 558e0cb2a297..92c81ce24a49 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -67,17 +67,31 @@ struct mtk_disp_merge {
>  };
>
>  void mtk_merge_start(struct device *dev)
> +{
> +       mtk_merge_start_cmdq(dev, NULL);
> +}
> +
> +void mtk_merge_stop(struct device *dev)
>  {
>         struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
>
> -       writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
> +       mtk_merge_stop_cmdq(dev, NULL);
>  }
>
> -void mtk_merge_stop(struct device *dev)
> +void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> +
> +       mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
> +                     DISP_REG_MERGE_CTRL);
> +}
> +
> +void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
>  {
>         struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
>
> -       writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
> +       mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
> +                     DISP_REG_MERGE_CTRL);
>  }
>
>  static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
> --
> 2.18.0
>
