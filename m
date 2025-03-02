Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C097A4B129
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 12:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC2110E083;
	Sun,  2 Mar 2025 11:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U96P/ECY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A13910E083
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 11:28:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 094575C53EE
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 11:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C4DC4CEE7
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740914906;
 bh=FfIs5OJets3zRpgfLQ3jbMz9ChRage5kgf6KcUykEhU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=U96P/ECYfFdfEmY00MOBO8lZ+Re2UyFVUwKO2FS24Ejg/IjOxkhSQxI85PwyuRviQ
 jw0j2xu1X4UgiqXdHaKaeY+WB59KjjmKegS5wg58lxuJJ5E8fzqUiNpdZvIKpTUoPt
 k3C2zE36OFaTgLS6X+8u9ptYdZvnV8LwA0lFllsahA3DdYuI780zZegI+ES26PM9Cp
 aPTAlRRUSRLwpbgud9El/r/9nvlCs5+SIOjc7KVF2ult/hqVOyGuWrSYEIAE3o3fuX
 WjxzpNcwZp7GRhDa6LiFEskOX6XnCX9PZqL5n3W4xVVp4EQc7ENG5ApvielC2RCpzO
 yu3zdNQvROmDg==
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2fce3b01efcso5071195a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 03:28:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVk52XcVUivN9Zd4ZM+q2OZM/rFTfjJi403iaL7oSlGywbK6BjZieU+QVBjpNB/4sxodMVXToi2VM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1Kt4vNBImdk0tEl4fMdwHr81ZKCaHphpAlMAPYlJFvaKC0F5B
 g85ydAoPaDNs0cUfepsA0qtQl6rroEH9p+d6dDMTLEK6gqpbSBnUK9ohhkKPmRIEJbLtLpk4UPk
 GSaaSo5tiri8fE14lIVbuUiuQRA==
X-Google-Smtp-Source: AGHT+IFRC1P9usso4XTv7JMgu0fBHyNMS/JMJfbPzBZYNlk0eFKXHASNV5TbO4HnaJUruaY5STSEE7582brQlBGjZAA=
X-Received: by 2002:a17:90a:e703:b0:2f4:43ce:dcea with SMTP id
 98e67ed59e1d1-2febac0573fmr13699214a91.25.1740914906028; Sun, 02 Mar 2025
 03:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-9-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 19:29:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8kxxaj+jum6CkJGHKrpjiX_cNt4FT345yET8GWR2QSFA@mail.gmail.com>
X-Gm-Features: AQ5f1JrqzU6s7sUO38hOT2IPnyssGJxMSyeRq4q2duHbl9tAb7DYvcalEylndsk
Message-ID: <CAAOTY_8kxxaj+jum6CkJGHKrpjiX_cNt4FT345yET8GWR2QSFA@mail.gmail.com>
Subject: Re: [PATCH v7 08/43] drm/mediatek: mtk_dpi: Support AFIFO 1T1P output
 and conversion
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
> On some SoCs, like MT8195 and MT8188, the DPI's FIFO controller
> (afifo) supports outputting either one or two pixels per round
> regardless of the input being 1T1P or 1T2P.
>
> Add a `output_1pixel` member to struct mtk_dpi_conf which, if
> set, will enable outputting one pixel per clock.
>
> In case the input is two pixel per clock (1T2P), the AFIFO HW
> will automatically (and internally) convert it to 1T1P.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 9f83e82437dd..e12dc73ed79c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -147,6 +147,8 @@ struct mtk_dpi_factor {
>   * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs =
to be set in MMSYS.
>   * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input clock,=
 needed
>   *                  for DPI registers access.
> + * @output_1pixel: Enable outputting one pixel per round; if the input i=
s two pixel per
> + *                 round, the DPI hardware will internally transform it =
to 1T1P.
>   */
>  struct mtk_dpi_conf {
>         const struct mtk_dpi_factor *dpi_factor;
> @@ -168,6 +170,7 @@ struct mtk_dpi_conf {
>         u32 pixels_per_iter;
>         bool edge_cfg_in_mmsys;
>         bool clocked_by_hdmi;
> +       bool output_1pixel;
>  };
>
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 m=
ask)
> @@ -653,7 +656,13 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *=
dpi,
>         if (dpi->conf->support_direct_pin) {
>                 mtk_dpi_config_yc_map(dpi, dpi->yc_map);
>                 mtk_dpi_config_2n_h_fre(dpi);
> -               mtk_dpi_dual_edge(dpi);
> +
> +               /* DPI can connect to either an external bridge or the in=
ternal HDMI encoder */
> +               if (dpi->conf->output_1pixel)
> +                       mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN, DP=
I_OUTPUT_1T1P_EN);
> +               else
> +                       mtk_dpi_dual_edge(dpi);
> +
>                 mtk_dpi_config_disable_edge(dpi);
>         }
>         if (dpi->conf->input_2p_en_bit) {
> --
> 2.48.1
>
