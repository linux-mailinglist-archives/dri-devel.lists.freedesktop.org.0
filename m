Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE68CA4B128
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 12:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D182B10E15F;
	Sun,  2 Mar 2025 11:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e8P+hjlt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D30C10E15F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 11:23:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 08CFB5C558F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 11:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1896DC4CEF0
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 11:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740914595;
 bh=88iTC3VCTOJkXkwpEcxod0WPhai7pUMfCO6THaRxiz0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=e8P+hjltOkA3uUaWCeGA+L9nKuJRQEkZkf/iy8iuR6mPo8s/BCWYzoHn2zvNTTv40
 sb79LxEzwQG3iBHcKFxul6zfX0ruYmCtYUeumswGt4+mG3BM5XgUXl5BazVBnCENha
 TQI0Sh/zdkYzUQs45W4kLPxN4/kfOWd4OAKqKUGH0xXqzFcy2Be/ZL0X48iyLQus7i
 cepteP6YWQjvMxy87RwpCczasv9dYAZ3Goh3uSSju4aF6xn0X8MXP3CufkO5LdJcOq
 oUtOrxSVxpU0AwgMFq6tedRLipvJScf539jOkY3MJim30cTD3pcLY0B4kIuQco3RXh
 FlFAFCAysIapA==
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-22359001f1aso77946835ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 03:23:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXEEObRGRMzJrDdVl6DRENsmZtM9B2ods3WSEHphEf50WPY//UeTxTE+lI6jaKYj+Bc076uK5HBBl4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNi7/mvdfXfsIIFOxqBOZh4vo/S9G7AObtekqiAIzRgGK2mjE7
 3lBS1fBsLMbOZMTdnbkRbfFLxK5NKG14Y90mrQNzC7YQF5sRQ0WYaiaM/wsSgY+hNszeK166VCu
 Ikl/I4Q15XA8EzRh9HdKNu507Iw==
X-Google-Smtp-Source: AGHT+IFpcs+J1xAyfK06/O6FF1+X82uEcHTSqmEDT4XqGI/sksYkVpLwFKzYZ1+KMrLF9RKJkiWsDGoNBEQOX9vfehk=
X-Received: by 2002:a17:902:dacf:b0:215:a179:14ca with SMTP id
 d9443c01a7336-22368f73284mr153333585ad.2.1740914594460; Sun, 02 Mar 2025
 03:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-8-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 19:24:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8LmRTabeuwXnwDxxodiPRkRD4P9diCO=5CHrwtT4h2QA@mail.gmail.com>
X-Gm-Features: AQ5f1JqaQEl0KFCViPa_ifgKV1VqZysAJMdPHTFuV6fAg_m9uoS6AEjQCuQA1_8
Message-ID: <CAAOTY_8LmRTabeuwXnwDxxodiPRkRD4P9diCO=5CHrwtT4h2QA@mail.gmail.com>
Subject: Re: [PATCH v7 07/43] drm/mediatek: mtk_dpi: Add support for DPI input
 clock from HDMI
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
> On some SoCs, like MT8195 and MT8188, the DPI instance that is
> reserved to the HDMI Transmitter uses a different clock topology.
>
> In this case, the DPI is clocked by the HDMI IP, and this outputs
> its clock to the MM input of dpi_pixel_clk, which is essential to
> enable register access to the DPI IP.
>
> Add a `clocked_by_hdmi` member to struct mtk_dpi_conf, and check
> it to avoid enabling the DPI clocks in the mediatek-drm internal
> .start() callback (and avoid disabing in the .stop() component
> callback): this will make sure that the clock configuration
> sequence is respected during display pipeline setup by following
> the bridge ops between DPI and HDMI, where the HDMI driver is
> expected to enable the clocks in the bridge's pre_enable(), and
> DPI in the enable() cb.

After fix conflicts, applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 9a6c0f75f764..9f83e82437dd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -145,6 +145,8 @@ struct mtk_dpi_factor {
>                       If present, implies that the feature must be enable=
d.
>   * @pixels_per_iter: Quantity of transferred pixels per iteration.
>   * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs =
to be set in MMSYS.
> + * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input clock,=
 needed
> + *                  for DPI registers access.
>   */
>  struct mtk_dpi_conf {
>         const struct mtk_dpi_factor *dpi_factor;
> @@ -165,6 +167,7 @@ struct mtk_dpi_conf {
>         u32 input_2p_en_bit;
>         u32 pixels_per_iter;
>         bool edge_cfg_in_mmsys;
> +       bool clocked_by_hdmi;
>  };
>
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 m=
ask)
> @@ -585,7 +588,9 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *d=
pi,
>         struct videomode vm =3D { 0 };
>
>         drm_display_mode_to_videomode(mode, &vm);
> -       mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
> +
> +       if (!dpi->conf->clocked_by_hdmi)
> +               mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
>
>         dpi_pol.ck_pol =3D MTK_DPI_POLARITY_FALLING;
>         dpi_pol.de_pol =3D MTK_DPI_POLARITY_RISING;
> @@ -920,14 +925,16 @@ void mtk_dpi_start(struct device *dev)
>  {
>         struct mtk_dpi *dpi =3D dev_get_drvdata(dev);
>
> -       mtk_dpi_power_on(dpi);
> +       if (!dpi->conf->clocked_by_hdmi)
> +               mtk_dpi_power_on(dpi);
>  }
>
>  void mtk_dpi_stop(struct device *dev)
>  {
>         struct mtk_dpi *dpi =3D dev_get_drvdata(dev);
>
> -       mtk_dpi_power_off(dpi);
> +       if (!dpi->conf->clocked_by_hdmi)
> +               mtk_dpi_power_off(dpi);
>  }
>
>  unsigned int mtk_dpi_encoder_index(struct device *dev)
> --
> 2.48.1
>
