Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BED46565FE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 00:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0437310E2DE;
	Mon, 26 Dec 2022 23:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44A810E2E0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 23:12:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5EC4660F51
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 23:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBD3C433F2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 23:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672096362;
 bh=3YDD7i5vigtk0jYnq/iRyL3tJUBwVFtguhEmbqMMi+I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aqlrtXHsiIDxJbcrsrfD/N6vtMEGNb9C6rrIZwHaatwMF7YyNjPqcv6quLX5Nc+Xi
 WKfy3zcvyM+w7Zs6jO6Vu1Ro1XXIwLgejG/lY/oXtEw7Nt6HcbNvp74xecShx/R4SS
 diiYgOv61ZvKZbOG6p1iPB1ujxTEzFJfZPEuuvgqnv1BBrSXKQ8wbh71Rb35mEkVuZ
 wtYhUhJPOzCI4KmHqktBTFTKjO5fuZoIqP+/+Mw8Ayas/ojCxDiG6SHIqnRGkZsoDv
 rTrl7zGSE49p0EUuUX3H3w/AFj7WvS1nJHLycNbDZLRHkcjxZfYABpi13AutwSKLtK
 1thQ1nby1QkLg==
Received: by mail-oi1-f182.google.com with SMTP id s187so11184102oie.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 15:12:42 -0800 (PST)
X-Gm-Message-State: AFqh2krGwfbyRlkSCd8H1NsGLH2u533xVfBR1U9eIxSqF04ZKQwjNPQy
 SAUpOyzVz5WwF1bEdIhxfLMc0zQCNbeVikx2ew==
X-Google-Smtp-Source: AMrXdXs+Xfs/7HZYsg6FqBL8RmGYK5b/oHgHaSwNLs4dZbF/Ssur4+vpSKVOTKJ3ZfbSeo62kyw3cPpuRwAjfFx/YTc=
X-Received: by 2002:a05:6808:130f:b0:35a:eee1:6710 with SMTP id
 y15-20020a056808130f00b0035aeee16710mr865013oiv.69.1672096361913; Mon, 26 Dec
 2022 15:12:41 -0800 (PST)
MIME-Version: 1.0
References: <1666577099-3859-1-git-send-email-xinlei.lee@mediatek.com>
 <1666577099-3859-3-git-send-email-xinlei.lee@mediatek.com>
In-Reply-To: <1666577099-3859-3-git-send-email-xinlei.lee@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 27 Dec 2022 07:12:31 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9QEZfQC=i_ZLMrQGs80BHbpv93H6bnsw6RkS4z7zXoGQ@mail.gmail.com>
Message-ID: <CAAOTY_9QEZfQC=i_ZLMrQGs80BHbpv93H6bnsw6RkS4z7zXoGQ@mail.gmail.com>
Subject: Re: [PATCH v13,2/3] drm: mediatek: Set dpi format in mmsys
To: xinlei.lee@mediatek.com
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
Cc: chunkuang.hu@kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 nfraprado@collabora.com, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Xinlei:

<xinlei.lee@mediatek.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=8824=E6=97=A5 =E9=
=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>
> Dpi output needs to adjust the output format to dual edge for MT8186.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 630a4e301ef6..ad87ecddf58d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -15,6 +15,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>  #include <linux/types.h>
>
>  #include <video/videomode.h>
> @@ -30,6 +31,7 @@
>  #include "mtk_disp_drv.h"
>  #include "mtk_dpi_regs.h"
>  #include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
>
>  enum mtk_dpi_out_bit_num {
>         MTK_DPI_OUT_BIT_NUM_8BITS,
> @@ -67,6 +69,7 @@ struct mtk_dpi {
>         struct drm_connector *connector;
>         void __iomem *regs;
>         struct device *dev;
> +       struct device *mmsys_dev;
>         struct clk *engine_clk;
>         struct clk *pixel_clk;
>         struct clk *tvd_clk;
> @@ -135,6 +138,7 @@ struct mtk_dpi_yc_limit {
>   * @yuv422_en_bit: Enable bit of yuv422.
>   * @csc_enable_bit: Enable bit of CSC.
>   * @pixels_per_iter: Quantity of transferred pixels per iteration.
> + * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs =
to be set in MMSYS.
>   */
>  struct mtk_dpi_conf {
>         unsigned int (*cal_factor)(int clock);
> @@ -153,6 +157,7 @@ struct mtk_dpi_conf {
>         u32 yuv422_en_bit;
>         u32 csc_enable_bit;
>         u32 pixels_per_iter;
> +       bool edge_cfg_in_mmsys;
>  };
>
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 m=
ask)
> @@ -449,8 +454,12 @@ static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
>                 mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
>                              dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_=
2X12_LE ?
>                              EDGE_SEL : 0, EDGE_SEL);
> +               if (dpi->conf->edge_cfg_in_mmsys)
> +                       mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev, MTK_=
DPI_RGB888_DDR_CON);
>         } else {
>                 mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE, 0=
);
> +               if (dpi->conf->edge_cfg_in_mmsys)
> +                       mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev, MTK_=
DPI_RGB888_SDR_CON);
>         }
>  }
>
> @@ -778,8 +787,10 @@ static int mtk_dpi_bind(struct device *dev, struct d=
evice *master, void *data)
>  {
>         struct mtk_dpi *dpi =3D dev_get_drvdata(dev);
>         struct drm_device *drm_dev =3D data;
> +       struct mtk_drm_private *priv =3D drm_dev->dev_private;
>         int ret;
>
> +       dpi->mmsys_dev =3D priv->mmsys_dev;
>         ret =3D drm_simple_encoder_init(drm_dev, &dpi->encoder,
>                                       DRM_MODE_ENCODER_TMDS);
>         if (ret) {
> --
> 2.18.0
>
