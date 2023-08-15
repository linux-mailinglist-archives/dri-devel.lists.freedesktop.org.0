Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0E77C8F8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 09:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2C410E0C6;
	Tue, 15 Aug 2023 07:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C6C10E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 07:57:40 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-79969c14964so1456826241.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 00:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692086259; x=1692691059;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lDmhrht0DgZsou5OmGTQJ7RdS2UG4tX4DI13kPMsfH8=;
 b=Hl8xpItKM1unZIC/QApK/kOpo7yZRoqZaB0tTBpIBX4YJfBz2jTSAWku5KL3CpotmC
 piTtzYuD1KJfr8vlCOFgPocp68n5wdLQ4oIke3Q1CgMpTBiK/tcCqjnMvbJiDRncq0pD
 zkvw4TBD7YXAkVEq54zbG5MWHSszi3tVK4LRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692086259; x=1692691059;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lDmhrht0DgZsou5OmGTQJ7RdS2UG4tX4DI13kPMsfH8=;
 b=AxDTxX0C6vZ5nm5cXnZ5K83HTXRTayHGxHxtfIWppG1sqg5oqK24MH1O2aZjz7KEcy
 J+TwhIAu74k3QOvNZ6yDmNRtBEkbEv378YoiRUflLTDFJVPL0TSyMGv+kZPAgXwAB20B
 IxKU3JX5h3g4cwNM2iz3ez1xzFezyV+rJJ/Nj69QfWS6RVOPEg5TN2XNld49pETc5M8s
 3tbxFLRntEz17/I7GXWtSamc7Z0GaMJSDj96o8Yk2PBQHFVGZxH9VjqpdxRCmoD7dma+
 BwYYQyniQAwkvqGE37MC2CYX1NZ0ZD1V9Cke62Uwwbx8M3o4bn+0ePESK2y9c3go2sKl
 qfVA==
X-Gm-Message-State: AOJu0YzFysO9xZwz87pRi6T8CF4H0+4KXDcZUqag7YjL1jHdMZB4ZJJt
 Jz2TrlZ9ykhxMxixJ8IULt52kqYULLlAfaoECl8ATw==
X-Google-Smtp-Source: AGHT+IEowaTnqYOhJvJPxTsiUy1ga51y3VUIR347NmHxFEGb93pAX1OVpvHZqI6/KkhO1jw551U7+Xzacun4OaWd7HY=
X-Received: by 2002:a05:6102:4b7:b0:443:5bec:a2fd with SMTP id
 r23-20020a05610204b700b004435beca2fdmr11705935vsa.18.1692086259473; Tue, 15
 Aug 2023 00:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
 <20230804072850.89365-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230804072850.89365-12-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Aug 2023 15:57:28 +0800
Message-ID: <CAGXv+5Hw2QqRVCqxZ+P96uM4hcm3qSQESA8Kh5b6RyJDQLFqQQ@mail.gmail.com>
Subject: Re: [PATCH v10 11/16] drm/mediatek: gamma: Add support for 12-bit LUT
 and MT8195
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 3:29=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add support for 12-bit gamma lookup tables and introduce the first
> user for it: MT8195.
> While at it, also reorder the variables in mtk_gamma_set_common()
> and rename `lut_base` to `lut0_base` to improve readability.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 74 +++++++++++++++++++----
>  1 file changed, 62 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/=
mediatek/mtk_disp_gamma.c
> index 3f1c6815ea5a..7d2f8042ace0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -26,12 +26,20 @@
>  #define DISP_GAMMA_SIZE_VSIZE                          GENMASK(12, 0)
>  #define DISP_GAMMA_BANK                                0x0100
>  #define DISP_GAMMA_BANK_BANK                           GENMASK(1, 0)
> +#define DISP_GAMMA_BANK_DATA_MODE                      BIT(2)
>  #define DISP_GAMMA_LUT                         0x0700
> +#define DISP_GAMMA_LUT1                                0x0b00
>
> +/* For 10 bit LUT layout, R/G/B are in the same register */
>  #define DISP_GAMMA_LUT_10BIT_R                 GENMASK(29, 20)
>  #define DISP_GAMMA_LUT_10BIT_G                 GENMASK(19, 10)
>  #define DISP_GAMMA_LUT_10BIT_B                 GENMASK(9, 0)
>
> +/* For 12 bit LUT layout, R/G are in LUT, B is in LUT1 */
> +#define DISP_GAMMA_LUT_12BIT_R                 GENMASK(11, 0)
> +#define DISP_GAMMA_LUT_12BIT_G                 GENMASK(23, 12)
> +#define DISP_GAMMA_LUT_12BIT_B                 GENMASK(11, 0)
> +
>  #define LUT_10BIT_MASK                         0x03ff
>  #define LUT_BITS_DEFAULT                       10
>  #define LUT_SIZE_DEFAULT                       512
> @@ -77,14 +85,30 @@ unsigned int mtk_gamma_get_lut_size(struct device *de=
v)
>         return LUT_SIZE_DEFAULT;
>  }
>
> +/*
> + * SoCs supporting 12-bits LUTs are using a new register layout that doe=
s
> + * always support (by HW) both 12-bits and 10-bits LUT but, on those, we
> + * ignore the support for 10-bits in this driver and always use 12-bits.
> + *
> + * Summarizing:
> + * - SoC HW support 9/10-bits LUT only
> + *   - Old register layout
> + *     - 10-bits LUT supported
> + *     - 9-bits LUT not supported
> + * - SoC HW support both 10/12bits LUT
> + *   - New register layout
> + *     - 12-bits LUT supported
> + *     - 10-its LUT not supported
> + */
>  void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
>  {
>         struct mtk_disp_gamma *gamma =3D dev_get_drvdata(dev);
> -       unsigned int i;
> -       struct drm_color_lut *lut;
> -       void __iomem *lut_base;
> -       u32 cfg_val, lbank_val, word;
> +       void __iomem *lut0_base =3D gamma->regs + DISP_GAMMA_LUT;
> +       void __iomem *lut1_base =3D gamma->regs + DISP_GAMMA_LUT1;
> +       u32 cfg_val, data_mode, lbank_val, word[2];
>         int cur_bank, num_lut_banks;
> +       struct drm_color_lut *lut;
> +       unsigned int i;
>
>         /* If there's no gamma lut there's nothing to do here. */
>         if (!state->gamma_lut)
> @@ -92,14 +116,17 @@ void mtk_gamma_set(struct device *dev, struct drm_cr=
tc_state *state)
>
>         num_lut_banks =3D gamma->data->lut_size / gamma->data->lut_bank_s=
ize;
>         cfg_val =3D readl(gamma->regs + DISP_GAMMA_CFG);
> -       lut_base =3D gamma->regs + DISP_GAMMA_LUT;
>         lut =3D (struct drm_color_lut *)state->gamma_lut->data;
>
> +       /* Switch to 12 bits data mode if supported */
> +       data_mode =3D FIELD_PREP(DISP_GAMMA_BANK_DATA_MODE, !!(gamma->dat=
a->lut_bits =3D=3D 12));
> +
>         for (cur_bank =3D 0; cur_bank < num_lut_banks; cur_bank++) {
>
>                 /* Switch gamma bank and set data mode before writing LUT=
 */
>                 if (num_lut_banks > 1) {
>                         lbank_val =3D FIELD_PREP(DISP_GAMMA_BANK_BANK, cu=
r_bank);
> +                       lbank_val |=3D data_mode;
>                         writel(lbank_val, gamma->regs + DISP_GAMMA_BANK);
>                 }
>
> @@ -112,9 +139,15 @@ void mtk_gamma_set(struct device *dev, struct drm_cr=
tc_state *state)
>                         hwlut.blue =3D drm_color_lut_extract(lut[n].blue,=
 gamma->data->lut_bits);
>
>                         if (!gamma->data->lut_diff || (i % 2 =3D=3D 0)) {
> -                               word =3D FIELD_PREP(DISP_GAMMA_LUT_10BIT_=
R, hwlut.red);
> -                               word |=3D FIELD_PREP(DISP_GAMMA_LUT_10BIT=
_G, hwlut.green);
> -                               word |=3D FIELD_PREP(DISP_GAMMA_LUT_10BIT=
_B, hwlut.blue);
> +                               if (gamma->data->lut_bits =3D=3D 12) {
> +                                       word[0] =3D FIELD_PREP(DISP_GAMMA=
_LUT_12BIT_R, hwlut.red);
> +                                       word[0] |=3D FIELD_PREP(DISP_GAMM=
A_LUT_12BIT_G, hwlut.green);
> +                                       word[1] =3D FIELD_PREP(DISP_GAMMA=
_LUT_12BIT_B, hwlut.blue);
> +                               } else {
> +                                       word[0] =3D FIELD_PREP(DISP_GAMMA=
_LUT_10BIT_R, hwlut.red);
> +                                       word[0] |=3D FIELD_PREP(DISP_GAMM=
A_LUT_10BIT_G, hwlut.green);
> +                                       word[0] |=3D FIELD_PREP(DISP_GAMM=
A_LUT_10BIT_B, hwlut.blue);
> +                               }
>                         } else {
>                                 diff.red =3D lut[n].red - lut[n - 1].red;
>                                 diff.red =3D drm_color_lut_extract(diff.r=
ed, gamma->data->lut_bits);
> @@ -125,11 +158,19 @@ void mtk_gamma_set(struct device *dev, struct drm_c=
rtc_state *state)
>                                 diff.blue =3D lut[n].blue - lut[n - 1].bl=
ue;
>                                 diff.blue =3D drm_color_lut_extract(diff.=
blue, gamma->data->lut_bits);
>
> -                               word =3D FIELD_PREP(DISP_GAMMA_LUT_10BIT_=
R, diff.red);
> -                               word |=3D FIELD_PREP(DISP_GAMMA_LUT_10BIT=
_G, diff.green);
> -                               word |=3D FIELD_PREP(DISP_GAMMA_LUT_10BIT=
_B, diff.blue);
> +                               if (gamma->data->lut_bits =3D=3D 12) {
> +                                       word[0] =3D FIELD_PREP(DISP_GAMMA=
_LUT_12BIT_R, diff.red);
> +                                       word[0] |=3D FIELD_PREP(DISP_GAMM=
A_LUT_12BIT_G, diff.green);
> +                                       word[1] =3D FIELD_PREP(DISP_GAMMA=
_LUT_12BIT_B, diff.blue);
> +                               } else {
> +                                       word[0] =3D FIELD_PREP(DISP_GAMMA=
_LUT_10BIT_R, diff.red);
> +                                       word[0] |=3D FIELD_PREP(DISP_GAMM=
A_LUT_10BIT_G, diff.green);
> +                                       word[0] |=3D FIELD_PREP(DISP_GAMM=
A_LUT_10BIT_B, diff.blue);
> +                               }
>                         }
> -                       writel(word, (lut_base + i * 4));
> +                       writel(word[0], (lut0_base + i * 4));
> +                       if (gamma->data->lut_bits =3D=3D 12)
> +                               writel(word[1], (lut1_base + i * 4));
>                 }
>         }
>
> @@ -246,11 +287,20 @@ static const struct mtk_disp_gamma_data mt8183_gamm=
a_driver_data =3D {
>         .lut_size =3D 512,
>  };
>
> +static const struct mtk_disp_gamma_data mt8195_gamma_driver_data =3D {
> +       .lut_bank_size =3D 256,
> +       .lut_bits =3D 12,
> +       .lut_diff =3D true,
> +       .lut_size =3D 1024,
> +};
> +
>  static const struct of_device_id mtk_disp_gamma_driver_dt_match[] =3D {
>         { .compatible =3D "mediatek,mt8173-disp-gamma",
>           .data =3D &mt8173_gamma_driver_data},
>         { .compatible =3D "mediatek,mt8183-disp-gamma",
>           .data =3D &mt8183_gamma_driver_data},
> +       { .compatible =3D "mediatek,mt8195-disp-gamma",
> +         .data =3D &mt8195_gamma_driver_data},

I assume we need matching changes for the DT binding and to the DT?

ChenYu

>         {},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
> --
> 2.41.0
>
