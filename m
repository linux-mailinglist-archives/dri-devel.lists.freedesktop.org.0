Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014E3A4B11C
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 12:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FBB10E183;
	Sun,  2 Mar 2025 11:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p2PYUixk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C84710E2FF
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 11:14:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A87B8611C6
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 11:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08ABC4CEEB
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740914041;
 bh=v/ma3IQHSnM+5ud0dShiwB+ncbp4M9rgz628up8ZOkA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p2PYUixk1Am9QalwwYyF2GaEFbCYaqRVuPbfG+n8JuQ59p/aG1I0T8htcVMF8hoUb
 lPmDYHN/tiQbjOEbChNi4BbmFmqD4wxwaMW26lC+JiBPKs2fWqQLfdRSIDicix3Ouy
 gPfC0KYV9i5g6r1oie50EYE/tu2V2RDj1JUChuafhKEIb0mQP+jiiRDFV8X6FvMU27
 r/eJyCjoLdCPUGAPdNSxCIQ4hgRXyQhDcKb1DzEaWXFiBtLfXBc+TwE/t4BQM8HOTc
 YJlaPJKB3YpBzGThPPK3aPqZcvDZo1roa92em+YvsqpRMOGc5a3hrmJ2pggQe4+ehO
 fQyTqz7Dgardw==
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2fea795bafeso5247058a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 03:14:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU+ugPZ0fyYGqSF3Qms3PDG/zqerylmTYSAPXd1JVhcskG84gWfW7slx8I5hRZ0NJprlRmWP7MOWt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDn7gr5cqNRzQgFomg8ezFCHh7nZrEqGbl3Q7sZ095WRST9Z/o
 BWLHq/l8WrUC+mn0JTk1rT2+PKB9aRc60RNgf60TRC56Gq6CqGJCS/YeK5lscZ+haaKs3tLznrW
 LWQm3QWjncDOppsLt2OOImPqfCg==
X-Google-Smtp-Source: AGHT+IGZksfSFwIbEcmNOhwDcGlaG+7/hc4R9GwB7WRzfYExI+bHgZUCSKMFME5+ViazM2T3gLoc2AcWZathoQG804E=
X-Received: by 2002:a17:90b:5550:b0:2fa:6793:e860 with SMTP id
 98e67ed59e1d1-2fea0c70b0emr22779361a91.0.1740914041329; Sun, 02 Mar 2025
 03:14:01 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-7-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 19:14:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8ztRjpES-JVYeznG6ZjutYiifQSX3poyZoSqbqXYJ+aw@mail.gmail.com>
X-Gm-Features: AQ5f1JqxhG4uqsABhT4weE72XZJ0MWxPfONUK4l6x3goUDKT1KHLjbb0-IMiCn0
Message-ID: <CAAOTY_8ztRjpES-JVYeznG6ZjutYiifQSX3poyZoSqbqXYJ+aw@mail.gmail.com>
Subject: Re: [PATCH v7 06/43] drm/mediatek: mtk_dpi: Move the input_2p_en bit
 to platform data
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
 jason-jh.lin@mediatek.com
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> In preparation for adding support for MT8195's HDMI reserved DPI
> instance, move the input_2p_en bit for DP_INTF to platform data.
>
> While at it, remove the input_2pixel member from platform data as
> having this bit implies that the 2pixel feature must be enabled.

Remember to run check patch, after fix check patch error, applied to
mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index bb1a17f1384b..9a6c0f75f764 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -135,14 +135,14 @@ struct mtk_dpi_factor {
>   * @is_ck_de_pol: Support CK/DE polarity.
>   * @swap_input_support: Support input swap function.
>   * @support_direct_pin: IP supports direct connection to dpi panels.
> - * @input_2pixel: Input pixel of dp_intf is 2 pixel per round, so enable=
 this
> - *               config to enable this feature.
>   * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_=
PORCH
>   *                 (no shift).
>   * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
>   * @channel_swap_shift: Shift value of channel swap.
>   * @yuv422_en_bit: Enable bit of yuv422.
>   * @csc_enable_bit: Enable bit of CSC.
> + * @input_2p_en_bit: Enable bit for input two pixel per round feature.
> +                     If present, implies that the feature must be enable=
d.
>   * @pixels_per_iter: Quantity of transferred pixels per iteration.
>   * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs =
to be set in MMSYS.
>   */
> @@ -157,12 +157,12 @@ struct mtk_dpi_conf {
>         bool is_ck_de_pol;
>         bool swap_input_support;
>         bool support_direct_pin;
> -       bool input_2pixel;
>         u32 dimension_mask;
>         u32 hvsize_mask;
>         u32 channel_swap_shift;
>         u32 yuv422_en_bit;
>         u32 csc_enable_bit;
> +       u32 input_2p_en_bit;
>         u32 pixels_per_iter;
>         bool edge_cfg_in_mmsys;
>  };
> @@ -651,9 +651,9 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *d=
pi,
>                 mtk_dpi_dual_edge(dpi);
>                 mtk_dpi_config_disable_edge(dpi);
>         }
> -       if (dpi->conf->input_2pixel) {
> -               mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
> -                            DPINTF_INPUT_2P_EN);
> +       if (dpi->conf->input_2p_en_bit) {
> +               mtk_dpi_mask(dpi, DPI_CON, dpi->conf->input_2p_en_bit,
> +                            dpi->conf->input_2p_en_bit);
>         }
>         mtk_dpi_sw_reset(dpi, false);
>
> @@ -1121,12 +1121,12 @@ static const struct mtk_dpi_conf mt8195_dpintf_co=
nf =3D {
>         .output_fmts =3D mt8195_output_fmts,
>         .num_output_fmts =3D ARRAY_SIZE(mt8195_output_fmts),
>         .pixels_per_iter =3D 4,
> -       .input_2pixel =3D true,
>         .dimension_mask =3D DPINTF_HPW_MASK,
>         .hvsize_mask =3D DPINTF_HSIZE_MASK,
>         .channel_swap_shift =3D DPINTF_CH_SWAP,
>         .yuv422_en_bit =3D DPINTF_YUV422_EN,
>         .csc_enable_bit =3D DPINTF_CSC_ENABLE,
> +       .input_2p_en_bit =3D DPINTF_INPUT_2P_EN,
>  };
>
>  static int mtk_dpi_probe(struct platform_device *pdev)
> --
> 2.48.1
>
