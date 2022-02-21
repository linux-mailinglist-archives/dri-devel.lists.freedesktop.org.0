Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA094BD3D8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 03:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC4E10E20D;
	Mon, 21 Feb 2022 02:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876FD10E20D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:42:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0983C61119
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D6BC340F4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645411335;
 bh=UoHRsl3ZRU96P18QpcHnKzchZjXnC/+CtpXF8Fb9d9M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TvEfk/DJshewSDRHr+mPkPbV5Xz09ioUMe64CpUYz62fFQk5AmGG5IEjAsKPhKkbc
 vGNT+98FEBhkOQBPc2LHU6lIHJa4WjSHJ3+LVcTj1mKceOF+e/+kIjiiTp2xVmXbmF
 MKo4QUlKS3g9N2jyCcZkM1Sq40G/NM9o9y5L3GFw/vmyXAedvoRRrtQuihl+4SxUoN
 igmCYbLLlOXfOBHviflgix2yh8tUZ6HasKD2ZwFll0efa7Wq+NqltIFXR3rbXJyOPl
 Hl6lcyw/2J9XTKGBTrVnCJFYHRCJ6QliVP8qEWFQdaTD3nhaaZtz1Y4KBKtG115UA7
 0hELCQD3xeaZQ==
Received: by mail-ed1-f48.google.com with SMTP id c6so23616345edk.12
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 18:42:15 -0800 (PST)
X-Gm-Message-State: AOAM530XdPaH2HIWCL25UU9GvVydeBqIUUj2md6fxqd/xJD1JX8Ge8HD
 OOkH17/UYd7cMCjjOUrBLL+PBMMjQ+h35+2W2Q==
X-Google-Smtp-Source: ABdhPJwyhQ8g6xId+nP3ywHJC4Vyf7eb8yCWYnRKPDN4W18Y6Mb3ube6YcGgaWJ1wL9cRdkzuByPNaa5ERA+yGBQhSw=
X-Received: by 2002:a05:6402:5194:b0:409:97ec:3bdc with SMTP id
 q20-20020a056402519400b0040997ec3bdcmr19568718edd.314.1645411333805; Sun, 20
 Feb 2022 18:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-9-granquet@baylibre.com>
 <CAAOTY_8V91XH4sKeRfSz6hRPhXm15GBkQ76LWtfBBU5cAtWMqA@mail.gmail.com>
In-Reply-To: <CAAOTY_8V91XH4sKeRfSz6hRPhXm15GBkQ76LWtfBBU5cAtWMqA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 10:42:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9cmJn1CzYMqWwidwMavhoEX24muNuoWT+ZbQWUirqEFA@mail.gmail.com>
Message-ID: <CAAOTY_9cmJn1CzYMqWwidwMavhoEX24muNuoWT+ZbQWUirqEFA@mail.gmail.com>
Subject: Re: [PATCH v8 08/19] drm/mediatek: dpi: move dimension mask to board
 config
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Guillaume Ranquet <granquet@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Guillaume:

Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2022=E5=B9=B42=E6=9C=8821=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:40=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> HI, Guillaume:
>
> Guillaume Ranquet <granquet@baylibre.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=
=8818=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:56=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > Add flexibility by moving the dimension mask to the board config
>
> After change 'board' to 'SoC',
>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>
> >
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 26 ++++++++++++++++----------
> >  1 file changed, 16 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/media=
tek/mtk_dpi.c
> > index 454f8563efae4..8ca3455ed64ee 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -127,6 +127,8 @@ struct mtk_dpi_conf {
> >         u32 num_output_fmts;
> >         bool is_ck_de_pol;
> >         bool swap_input_support;
> > +       // Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (n=
o shift)

Sorry, this should be /* ... */

Regards,
Chun-Kuang.

> > +       u32 dimension_mask;
> >         const struct mtk_dpi_yc_limit *limit;
> >  };
> >
> > @@ -156,30 +158,30 @@ static void mtk_dpi_disable(struct mtk_dpi *dpi)
> >  static void mtk_dpi_config_hsync(struct mtk_dpi *dpi,
> >                                  struct mtk_dpi_sync_param *sync)
> >  {
> > -       mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH,
> > -                    sync->sync_width << HPW, HPW_MASK);
> > -       mtk_dpi_mask(dpi, DPI_TGEN_HPORCH,
> > -                    sync->back_porch << HBP, HBP_MASK);
> > +       mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH, sync->sync_width << HPW,
> > +                    dpi->conf->dimension_mask << HPW);
> > +       mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->back_porch << HBP,
> > +                    dpi->conf->dimension_mask << HBP);
> >         mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->front_porch << HFP,
> > -                    HFP_MASK);
> > +                    dpi->conf->dimension_mask << HFP);
> >  }
> >
> >  static void mtk_dpi_config_vsync(struct mtk_dpi *dpi,
> >                                  struct mtk_dpi_sync_param *sync,
> >                                  u32 width_addr, u32 porch_addr)
> >  {
> > -       mtk_dpi_mask(dpi, width_addr,
> > -                    sync->sync_width << VSYNC_WIDTH_SHIFT,
> > -                    VSYNC_WIDTH_MASK);
> >         mtk_dpi_mask(dpi, width_addr,
> >                      sync->shift_half_line << VSYNC_HALF_LINE_SHIFT,
> >                      VSYNC_HALF_LINE_MASK);
> > +       mtk_dpi_mask(dpi, width_addr,
> > +                    sync->sync_width << VSYNC_WIDTH_SHIFT,
> > +                    dpi->conf->dimension_mask << VSYNC_WIDTH_SHIFT);
> >         mtk_dpi_mask(dpi, porch_addr,
> >                      sync->back_porch << VSYNC_BACK_PORCH_SHIFT,
> > -                    VSYNC_BACK_PORCH_MASK);
> > +                    dpi->conf->dimension_mask << VSYNC_BACK_PORCH_SHIF=
T);
> >         mtk_dpi_mask(dpi, porch_addr,
> >                      sync->front_porch << VSYNC_FRONT_PORCH_SHIFT,
> > -                    VSYNC_FRONT_PORCH_MASK);
> > +                    dpi->conf->dimension_mask << VSYNC_FRONT_PORCH_SHI=
FT);
> >  }
> >
> >  static void mtk_dpi_config_vsync_lodd(struct mtk_dpi *dpi,
> > @@ -813,6 +815,7 @@ static const struct mtk_dpi_conf mt8173_conf =3D {
> >         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> >         .is_ck_de_pol =3D true,
> >         .swap_input_support =3D true,
> > +       .dimension_mask =3D HPW_MASK,
> >         .limit =3D &mtk_dpi_limit,
> >  };
> >
> > @@ -825,6 +828,7 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
> >         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> >         .is_ck_de_pol =3D true,
> >         .swap_input_support =3D true,
> > +       .dimension_mask =3D HPW_MASK,
> >         .limit =3D &mtk_dpi_limit,
> >  };
> >
> > @@ -836,6 +840,7 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
> >         .num_output_fmts =3D ARRAY_SIZE(mt8183_output_fmts),
> >         .is_ck_de_pol =3D true,
> >         .swap_input_support =3D true,
> > +       .dimension_mask =3D HPW_MASK,
> >         .limit =3D &mtk_dpi_limit,
> >  };
> >
> > @@ -847,6 +852,7 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
> >         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> >         .is_ck_de_pol =3D true,
> >         .swap_input_support =3D true,
> > +       .dimension_mask =3D HPW_MASK,
> >         .limit =3D &mtk_dpi_limit,
> >  };
> >
> > --
> > 2.34.1
> >
