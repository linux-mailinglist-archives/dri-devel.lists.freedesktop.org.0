Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 697724C42DB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 11:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AAD10E905;
	Fri, 25 Feb 2022 10:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0605010E905
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 10:55:43 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 i6-20020a4ac506000000b0031c5ac6c078so5725531ooq.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 02:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=kysMFOh8+xcDGXHPPVRwQiPaslPV5k2XuSftAh0IGXM=;
 b=PfiEhsRzmUlc1wRl7CP4cP59K9Lm7uNP+Beg+DIjXFCoCXFJ6hYi3zhDk33axm8PI7
 OX61MA/O4DZS/HoW6kOxIWkvBiMuwlsca/oj02T1KYHGmh7HU8j8l2wGRgmnrZyMrQLS
 kXxVXXDFw3y+zQ+iN14/BLSQrgMsQfSFvHpmNWi95tMVAQyK7aoxcrrPGVyot4GcrsHL
 HqOYh5V6/opTiE2A3eCCw6smo2gMJjIk+78lXh+jd0q4r6SgMWNjwP3t9C0e2BnAVkbd
 NezHGnBxkQSrkIL3dcWMZI3u7OAGkRKDtJNnWZ8R9MWQw71qfg1N3irCviYM2WYS1oUs
 FWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=kysMFOh8+xcDGXHPPVRwQiPaslPV5k2XuSftAh0IGXM=;
 b=Gikj8S004YWFKe+GZ6vgUtGSBjU/RBeE2aym6A9pmWCSJBzf+I5rk7ZOW4yiL+j9jr
 E7gZZX166ao+EeiTP0jIPsjGckSsuPsdzOmYft2qHuSSL2CbgKtjMazxZK9yt1KZ5wmr
 7YIT02fjULML5CmRHSgsBuirD+EaPdr6Qq4y+ldq5alChsO4GTpl7ajwmD9YKIETre5+
 0FuRJDM24evOm8Lm4zQvolf+nz6LV+vJJNzs5I3lvL1mq8kEK27IcEE4VBckDnBoPkIn
 fLNaaHiGdtTjIX07w/CA1PPiVeDt9GVtWmh1r9XyI2epAxAWXjZDN+55U1/NeT+YSh4w
 yUFw==
X-Gm-Message-State: AOAM530TH31DLEC+m67bFdKaNz6+HgjlYyPzDoC3vUIET4hoiXWHgPdk
 M9nH1/wX4tuIjSAMIeTxU5kCA0SqZI/xCeQT/mZrPQ==
X-Google-Smtp-Source: ABdhPJyj6wu6NzHc7L+z5p9txi1s1uYfQozYWTw3yryTNIRQzg7lTSsRCXyXFdJgD2WTiJR3FSSONQVrrSY9I5VWBm8=
X-Received: by 2002:a4a:4112:0:b0:319:3eb2:11b with SMTP id
 x18-20020a4a4112000000b003193eb2011bmr2462193ooa.40.1645786542268; Fri, 25
 Feb 2022 02:55:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 02:55:41 -0800
MIME-Version: 1.0
In-Reply-To: <CAAOTY_-5g4fXVTOETDxbn2Cp3MVjFs-Sh9NT1NepfEXUhdJQEw@mail.gmail.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-8-granquet@baylibre.com>
 <CAAOTY_-5g4fXVTOETDxbn2Cp3MVjFs-Sh9NT1NepfEXUhdJQEw@mail.gmail.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 02:55:41 -0800
Message-ID: <CABnWg9vOOcKsGqjZmakX3XrMhHcj5r23AUs77EnLR+xuw0Cg3g@mail.gmail.com>
Subject: Re: [PATCH v8 07/19] drm/mediatek: dpi: implement a swap_input toggle
 in board config
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-phy@lists.infradead.org, deller@gmx.de,
 Kishon Vijay Abraham I <kishon@ti.com>, DTML <devicetree@vger.kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Chun-Kuang Hu (2022-02-21 03:32:32)
> Hi, Guillaume:
>
> Guillaume Ranquet <granquet@baylibre.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=
=8818=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:56=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > Adds a bit of flexibility to support boards without swap_input support
> >
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/media=
tek/mtk_dpi.c
> > index 545a1337cc899..454f8563efae4 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -126,6 +126,7 @@ struct mtk_dpi_conf {
> >         const u32 *output_fmts;
> >         u32 num_output_fmts;
> >         bool is_ck_de_pol;
> > +       bool swap_input_support;
> >         const struct mtk_dpi_yc_limit *limit;
> >  };
> >
> > @@ -378,18 +379,21 @@ static void mtk_dpi_config_color_format(struct mt=
k_dpi *dpi,
> >             (format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> >                 mtk_dpi_config_yuv422_enable(dpi, false);
> >                 mtk_dpi_config_csc_enable(dpi, true);
> > -               mtk_dpi_config_swap_input(dpi, false);
> > +               if (dpi->conf->swap_input_support)
> > +                       mtk_dpi_config_swap_input(dpi, false);
> >                 mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SW=
AP_BGR);
> >         } else if ((format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
> >                    (format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL))=
 {
> >                 mtk_dpi_config_yuv422_enable(dpi, true);
> >                 mtk_dpi_config_csc_enable(dpi, true);
> > -               mtk_dpi_config_swap_input(dpi, true);
> > +               if (dpi->conf->swap_input_support)
> > +                       mtk_dpi_config_swap_input(dpi, true);
>
> In MT8173, MT2701, MT8183, MT8192, YCBCR_444 would not swap but
> YCBCR_422 would swap. But In MT8195, both YCBCR_444 and YCBCR_422
> would not swap, So I think one of these format would be abnormal in
> MT8195, right? Or would you provide more information about how this
> swap work?
>
> Regards,
> Chun-Kuang.
>

I'm not sure I have access to that level of information... and my
knowledge on mediatek
SoC is rather limited, I will circle back with mediatek engineers to
have a definite
answer.

Thx,
Guillaume
> >                 mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SW=
AP_RGB);
> >         } else {
> >                 mtk_dpi_config_yuv422_enable(dpi, false);
> >                 mtk_dpi_config_csc_enable(dpi, false);
> > -               mtk_dpi_config_swap_input(dpi, false);
> > +               if (dpi->conf->swap_input_support)
> > +                       mtk_dpi_config_swap_input(dpi, false);
> >                 mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SW=
AP_RGB);
> >         }
> >  }
> > @@ -808,6 +812,7 @@ static const struct mtk_dpi_conf mt8173_conf =3D {
> >         .output_fmts =3D mt8173_output_fmts,
> >         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> >         .is_ck_de_pol =3D true,
> > +       .swap_input_support =3D true,
> >         .limit =3D &mtk_dpi_limit,
> >  };
> >
> > @@ -819,6 +824,7 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
> >         .output_fmts =3D mt8173_output_fmts,
> >         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> >         .is_ck_de_pol =3D true,
> > +       .swap_input_support =3D true,
> >         .limit =3D &mtk_dpi_limit,
> >  };
> >
> > @@ -829,6 +835,7 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
> >         .output_fmts =3D mt8183_output_fmts,
> >         .num_output_fmts =3D ARRAY_SIZE(mt8183_output_fmts),
> >         .is_ck_de_pol =3D true,
> > +       .swap_input_support =3D true,
> >         .limit =3D &mtk_dpi_limit,
> >  };
> >
> > @@ -839,6 +846,7 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
> >         .output_fmts =3D mt8173_output_fmts,
> >         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> >         .is_ck_de_pol =3D true,
> > +       .swap_input_support =3D true,
> >         .limit =3D &mtk_dpi_limit,
> >  };
> >
> > --
> > 2.34.1
> >
