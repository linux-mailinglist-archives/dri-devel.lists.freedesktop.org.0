Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D609B4C42AF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 11:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883D410E89D;
	Fri, 25 Feb 2022 10:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665BC10E89D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 10:45:44 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id l25so6862982oic.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 02:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=9W7E1hMeG1GpPjzQeVUD/1vCh2scmLIMnbP1N8G+QsU=;
 b=a78eb+VOcuOTmv4bOMBCpo7vJLQy9FCHM/1qiKiR7NWjdkaaGpEheJtqR/k9YsTPrY
 H1hfhI0UGkzflpg6UoZIcrmOmH62XVa/0pRdkVWK0co1ELJvTSAYxRnVmtgGsLhQOSqq
 38DtnhPvdqltYNrOjAu41gmCWprvbnXkXHkrriTgzna054kb9OIAo9LV/Wg1EYiT90NT
 d/0cgDiY2iIFsxqgzYrLQFo0fDOyX7sVmj5wj1TH467Et6ftpdH7dFxdSfzSK3WdTu+o
 uH3mKU7NT9iEQKy3sYAUUiqBjtU4rK5/VyO10uQ0pHZSSz/KmCe8bjpipL1HyxRmed2f
 3/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=9W7E1hMeG1GpPjzQeVUD/1vCh2scmLIMnbP1N8G+QsU=;
 b=yk2KjOQM2sMcaV2pXU4XTsiyp6wVPO3qDpy1Yf7UaI48XIwKmTfK54SmUfXb28CSgh
 2Ii1oX9KkcIc81IISVLVBwpgjyf9KlCze52ElFSxQDJmrUG/CtN/eV+zDVsZtXXYGhFP
 svvA/kH67r3V/Ch7nU4yFR9d9lsj3hxnXkM4oLp1+0Cbu2gcA8HQGjvvxr0f/dh0NA5I
 bAUj9gipOHrzRTlgDmK9ERp6l0DrQq/rV8dNZzareWlcgAsTW/X+R532I6jC8JxSUJ31
 qA1LIHluLst3GUiiSYBy5GWtxMYZaQAidd+xisZ4XBh7rptqX+HGZdyHReUlC8SipK+I
 9gGg==
X-Gm-Message-State: AOAM530iiYhw7zEqt+Pw6mFDllbfVFmMcGGzZ7NSipLqnzT6S5GrfvC/
 F4ypX6VCq4OauaJ6iTy4Da2Ec/lkk1v2YRYi+8R2UA==
X-Google-Smtp-Source: ABdhPJxu3WAp8h43vtzTLY42//zgoS97B9OhbkZL3NmzaJ4HkMHPMXQTZzR34BelzCKWImB746hqT4H0VxqEaQANrdg=
X-Received: by 2002:a05:6808:114e:b0:2d5:4101:844e with SMTP id
 u14-20020a056808114e00b002d54101844emr1171890oiu.169.1645785943634; Fri, 25
 Feb 2022 02:45:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 02:45:43 -0800
MIME-Version: 1.0
In-Reply-To: <CAAOTY__u8R-WkTmnKkey5p7_fVuy2mgoRY4Fx_kqb5kb4hnqmQ@mail.gmail.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-6-granquet@baylibre.com>
 <CAAOTY__u8R-WkTmnKkey5p7_fVuy2mgoRY4Fx_kqb5kb4hnqmQ@mail.gmail.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 02:45:43 -0800
Message-ID: <CABnWg9t0x4GC_V+t9wkMJYjNnU0OYSaVdXi2sQD34dCNVHyVeQ@mail.gmail.com>
Subject: Re: [PATCH v8 05/19] drm/mediatek: dpi: move dpi limits to board
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
 ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Chun-Kuang Hu (2022-02-21 02:46:15)
> Hi, Guillaume:
>
> Guillaume Ranquet <granquet@baylibre.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=
=8818=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:56=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > Add flexibility by moving the dpi limits to the board config
>
> This patch looks good to me. But I would like to know what's this
> limit and why it vary in different SoC. If possible, would you please
> provide more description for this?
>
> Regards,
> Chun-Kuang.
>

Hi Chun-Kuang,

You are right, the commit message is rather vague and deserves more details=
.
I'll have to dig into the documentations I have access to and ask maybe ask
the engineers at mediatek for a detailed description.

Thx,
Guillaume.

> >
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 25 ++++++++++++++++---------
> >  1 file changed, 16 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/media=
tek/mtk_dpi.c
> > index 4554e2de14309..4746eb3425674 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -125,6 +125,7 @@ struct mtk_dpi_conf {
> >         bool edge_sel_en;
> >         const u32 *output_fmts;
> >         u32 num_output_fmts;
> > +       const struct mtk_dpi_yc_limit *limit;
> >  };
> >
> >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32=
 mask)
> > @@ -235,9 +236,10 @@ static void mtk_dpi_config_fb_size(struct mtk_dpi =
*dpi, u32 width, u32 height)
> >         mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
> >  }
> >
> > -static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi,
> > -                                        struct mtk_dpi_yc_limit *limit=
)
> > +static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
> >  {
> > +       const struct mtk_dpi_yc_limit *limit =3D dpi->conf->limit;
> > +
> >         mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit->y_bottom << Y_LIMINT_BOT,
> >                      Y_LIMINT_BOT_MASK);
> >         mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit->y_top << Y_LIMINT_TOP,
> > @@ -449,7 +451,6 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> >  static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> >                                     struct drm_display_mode *mode)
> >  {
> > -       struct mtk_dpi_yc_limit limit;
> >         struct mtk_dpi_polarities dpi_pol;
> >         struct mtk_dpi_sync_param hsync;
> >         struct mtk_dpi_sync_param vsync_lodd =3D { 0 };
> > @@ -484,11 +485,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi=
 *dpi,
> >         dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
> >                 pll_rate, vm.pixelclock);
> >
> > -       limit.c_bottom =3D 0x0010;
> > -       limit.c_top =3D 0x0FE0;
> > -       limit.y_bottom =3D 0x0010;
> > -       limit.y_top =3D 0x0FE0;
> > -
> >         dpi_pol.ck_pol =3D MTK_DPI_POLARITY_FALLING;
> >         dpi_pol.de_pol =3D MTK_DPI_POLARITY_RISING;
> >         dpi_pol.hsync_pol =3D vm.flags & DISPLAY_FLAGS_HSYNC_HIGH ?
> > @@ -536,7 +532,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi =
*dpi,
> >         else
> >                 mtk_dpi_config_fb_size(dpi, vm.hactive, vm.vactive);
> >
> > -       mtk_dpi_config_channel_limit(dpi, &limit);
> > +       mtk_dpi_config_channel_limit(dpi);
> >         mtk_dpi_config_bit_num(dpi, dpi->bit_num);
> >         mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
> >         mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> > @@ -790,12 +786,20 @@ static const u32 mt8183_output_fmts[] =3D {
> >         MEDIA_BUS_FMT_RGB888_2X12_BE,
> >  };
> >
> > +static const struct mtk_dpi_yc_limit mtk_dpi_limit =3D {
> > +       .c_bottom =3D 0x0010,
> > +       .c_top =3D 0x0FE0,
> > +       .y_bottom =3D 0x0010,
> > +       .y_top =3D 0x0FE0,
> > +};
> > +
> >  static const struct mtk_dpi_conf mt8173_conf =3D {
> >         .cal_factor =3D mt8173_calculate_factor,
> >         .reg_h_fre_con =3D 0xe0,
> >         .max_clock_khz =3D 300000,
> >         .output_fmts =3D mt8173_output_fmts,
> >         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> > +       .limit =3D &mtk_dpi_limit,
> >  };
> >
> >  static const struct mtk_dpi_conf mt2701_conf =3D {
> > @@ -805,6 +809,7 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
> >         .max_clock_khz =3D 150000,
> >         .output_fmts =3D mt8173_output_fmts,
> >         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> > +       .limit =3D &mtk_dpi_limit,
> >  };
> >
> >  static const struct mtk_dpi_conf mt8183_conf =3D {
> > @@ -813,6 +818,7 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
> >         .max_clock_khz =3D 100000,
> >         .output_fmts =3D mt8183_output_fmts,
> >         .num_output_fmts =3D ARRAY_SIZE(mt8183_output_fmts),
> > +       .limit =3D &mtk_dpi_limit,
> >  };
> >
> >  static const struct mtk_dpi_conf mt8192_conf =3D {
> > @@ -821,6 +827,7 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
> >         .max_clock_khz =3D 150000,
> >         .output_fmts =3D mt8173_output_fmts,
> >         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> > +       .limit =3D &mtk_dpi_limit,
> >  };
> >
> >  static int mtk_dpi_probe(struct platform_device *pdev)
> > --
> > 2.34.1
> >
