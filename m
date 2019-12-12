Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B90B11CED2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 14:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5E76ED60;
	Thu, 12 Dec 2019 13:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBD86ED60
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 13:53:35 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id b18so955992qvo.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 05:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ed/t/6oeJhx6NCX/EwJS1CEx042ORHYn5Pc1LYgDiYk=;
 b=a2kIlcVXVFEvw/YydIKOKS4Lb7/q78xly1TolWjNFK1KAXGJVTD5owrOOVrs3VUw+3
 xpsXtcRuGjn0lfz0wGrK8GJSqCJF+FjbCVkvvIpsJmSgeIgmUzs+mizq1A830hnD0doL
 XtcaHX8O2ZHDCYr3BCZ70FXbRiTmSmOm9QRRS739RUXoIrwq2XZGuJf8EHSGtjo0XF7N
 U7+ZLgrVvkHFfl1okVnutqG7CrgWHHp4K7diPHFfencOiL9yGoZDMwOV8kQYLK4M6fzc
 wPqqm6NRVhT41R3/eMW4QIo3eguBDTN17K6xslUllhqb9bjHCw3xb9C8rIlA9acULU7G
 mf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ed/t/6oeJhx6NCX/EwJS1CEx042ORHYn5Pc1LYgDiYk=;
 b=LffZRnYBy6dYYt4FYoJLNAs6/CFgXNJXjXsRQYmLAeBlmwPXgVLanOS8FwDcKSElnE
 A2O1hhCP73EDVamkBTl751DZ2DRZeQwUzcdOPSFx70oV8mZVLJDlWD81a67iPAX3E7Ot
 Yec2RBEtVE2x1JViKNPNABRQ7MyXO+b0a4rrHBARJI8aPDsRpQG13wwzj6/5JSUhENrb
 6s+u9os4jsBPNVOqdfE/3XHAnJUm4SmiRShUC+Gea251nt6MFabhhknBo0pZ9v8T+K/x
 rfUWtGroD/XATZJmk5umiejGoeH9bgW70JoAI86hxs+V+x/IBD9CT15Gv3RqqTVb2vnv
 I8yw==
X-Gm-Message-State: APjAAAXApxYGOnXWhPcJTfjzl9lx0+CqVGWVohY3S/S5hJ85nwhL/Abj
 wina0xHQwU5sQNsRs9+5p9ke52BXgb5pKTIXbAE=
X-Google-Smtp-Source: APXvYqyVEjPP9m3MtsAGT4oIvwb+p3XTpze6uPc5UKngyuA33cLyibqp88r4AOvVIwQ7iY7TU8m/7B54I49V9N4Gnv4=
X-Received: by 2002:a0c:c24f:: with SMTP id w15mr8456873qvh.66.1576158814597; 
 Thu, 12 Dec 2019 05:53:34 -0800 (PST)
MIME-Version: 1.0
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
 <20190919065806.111016-8-jitao.shi@mediatek.com>
 <1569487880.9612.2.camel@mtksdaap41>
In-Reply-To: <1569487880.9612.2.camel@mtksdaap41>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 12 Dec 2019 14:53:23 +0100
Message-ID: <CAFqH_52oPHH-9GGCgsYVK5K6ys9OrdkMad59+Mm5CzSdbcx7rw@mail.gmail.com>
Subject: Re: [PATCH v7 7/9] drm/mediatek: change the dsi phytiming calculate
 method
To: CK Hu <ck.hu@mediatek.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 stonea168@163.com, cawa cheng <cawa.cheng@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, sj.huang@mediatek.com,
 Hsinyu Chao <hychao@chromium.org>, Ryan Case <ryandcase@chromium.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Missatge de CK Hu <ck.hu@mediatek.com> del dia dj., 26 de set. 2019 a les 10:51:
>
> Hi, Jitao:
>
> On Thu, 2019-09-19 at 14:58 +0800, Jitao Shi wrote:
> > Change the method of frame rate calc which can get more accurate
> > frame rate.
> >
> > data rate = pixel_clock * bit_per_pixel / lanes
> > Adjust hfp_wc to adapt the additional phy_data
> >
> > if MIPI_DSI_MODE_VIDEO_BURST
> >       hfp_wc = hfp * bpp - data_phy_cycles * lanes - 12 - 6;
> > else
> >       hfp_wc = hfp * bpp - data_phy_cycles * lanes - 12;
> >
> > Note:
> > //(2: 1 for sync, 1 for phy idle)
> > data_phy_cycles = T_hs_exit + T_lpx + T_hs_prepare + T_hs_zero + 2;
> >
> > bpp: bit per pixel
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>
> >
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Tested-by: Ryan Case <ryandcase@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 118 ++++++++++++++++++++---------

I didn't look in detail yet because looks like there is a lot of maths
involved, but this patch introduces a regression for MT8173 or my
board (Acer Chromebook R 13 - ELM). I need to revert this patch in
order to make the display working, basically, I don't see any error
but I only get a black screen. Reverting this patch fixes the issue
for me. If anyone knows what could be the problem I'd appreciate.

Thanks,
 Enric

> >  1 file changed, 81 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index b3676426aeb5..b02373b04848 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -136,12 +136,6 @@
> >  #define DATA_0                               (0xff << 16)
> >  #define DATA_1                               (0xff << 24)
> >
> > -#define T_LPX                5
> > -#define T_HS_PREP    6
> > -#define T_HS_TRAIL   8
> > -#define T_HS_EXIT    7
> > -#define T_HS_ZERO    10
> > -
> >  #define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
> >
> >  #define MTK_DSI_HOST_IS_READ(type) \
> > @@ -150,6 +144,25 @@
> >       (type == MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM) || \
> >       (type == MIPI_DSI_DCS_READ))
> >
> > +struct mtk_phy_timing {
> > +     u32 lpx;
> > +     u32 da_hs_prepare;
> > +     u32 da_hs_zero;
> > +     u32 da_hs_trail;
> > +
> > +     u32 ta_go;
> > +     u32 ta_sure;
> > +     u32 ta_get;
> > +     u32 da_hs_exit;
> > +
> > +     u32 clk_hs_zero;
> > +     u32 clk_hs_trail;
> > +
> > +     u32 clk_hs_prepare;
> > +     u32 clk_hs_post;
> > +     u32 clk_hs_exit;
> > +};
> > +
> >  struct phy;
> >
> >  struct mtk_dsi_driver_data {
> > @@ -180,6 +193,7 @@ struct mtk_dsi {
> >       enum mipi_dsi_pixel_format format;
> >       unsigned int lanes;
> >       struct videomode vm;
> > +     struct mtk_phy_timing phy_timing;
> >       int refcount;
> >       bool enabled;
> >       u32 irq_data;
> > @@ -213,17 +227,36 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
> >  {
> >       u32 timcon0, timcon1, timcon2, timcon3;
> >       u32 ui, cycle_time;
> > +     struct mtk_phy_timing *timing = &dsi->phy_timing;
> > +
> > +     ui = DIV_ROUND_UP(1000000000, dsi->data_rate);
> > +     cycle_time = div_u64(8000000000ULL, dsi->data_rate);
> > +
> > +     timing->lpx = NS_TO_CYCLE(60, cycle_time);
> > +     timing->da_hs_prepare = NS_TO_CYCLE(50 + 5 * ui, cycle_time);
> > +     timing->da_hs_zero = NS_TO_CYCLE(110 + 6 * ui, cycle_time);
> > +     timing->da_hs_trail = NS_TO_CYCLE(77 + 4 * ui, cycle_time);
> >
> > -     ui = 1000 / dsi->data_rate + 0x01;
> > -     cycle_time = 8000 / dsi->data_rate + 0x01;
> > +     timing->ta_go = 4 * timing->lpx;
> > +     timing->ta_sure = 3 * timing->lpx / 2;
> > +     timing->ta_get = 5 * timing->lpx;
> > +     timing->da_hs_exit = 2 * timing->lpx;
> >
> > -     timcon0 = T_LPX | T_HS_PREP << 8 | T_HS_ZERO << 16 | T_HS_TRAIL << 24;
> > -     timcon1 = 4 * T_LPX | (3 * T_LPX / 2) << 8 | 5 * T_LPX << 16 |
> > -               T_HS_EXIT << 24;
> > -     timcon2 = ((NS_TO_CYCLE(0x64, cycle_time) + 0xa) << 24) |
> > -               (NS_TO_CYCLE(0x150, cycle_time) << 16);
> > -     timcon3 = NS_TO_CYCLE(0x40, cycle_time) | (2 * T_LPX) << 16 |
> > -               NS_TO_CYCLE(80 + 52 * ui, cycle_time) << 8;
> > +     timing->clk_hs_zero = NS_TO_CYCLE(336, cycle_time);
> > +     timing->clk_hs_trail = NS_TO_CYCLE(100, cycle_time) + 10;
> > +
> > +     timing->clk_hs_prepare = NS_TO_CYCLE(64, cycle_time);
> > +     timing->clk_hs_post = NS_TO_CYCLE(80 + 52 * ui, cycle_time);
> > +     timing->clk_hs_exit = 2 * timing->lpx;
> > +
> > +     timcon0 = timing->lpx | timing->da_hs_prepare << 8 |
> > +               timing->da_hs_zero << 16 | timing->da_hs_trail << 24;
> > +     timcon1 = timing->ta_go | timing->ta_sure << 8 |
> > +               timing->ta_get << 16 | timing->da_hs_exit << 24;
> > +     timcon2 = 1 << 8 | timing->clk_hs_zero << 16 |
> > +               timing->clk_hs_trail << 24;
> > +     timcon3 = timing->clk_hs_prepare | timing->clk_hs_post << 8 |
> > +               timing->clk_hs_exit << 16;
> >
> >       writel(timcon0, dsi->regs + DSI_PHY_TIMECON0);
> >       writel(timcon1, dsi->regs + DSI_PHY_TIMECON1);
> > @@ -410,7 +443,8 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
> >       u32 horizontal_sync_active_byte;
> >       u32 horizontal_backporch_byte;
> >       u32 horizontal_frontporch_byte;
> > -     u32 dsi_tmp_buf_bpp;
> > +     u32 dsi_tmp_buf_bpp, data_phy_cycles;
> > +     struct mtk_phy_timing *timing = &dsi->phy_timing;
> >
> >       struct videomode *vm = &dsi->vm;
> >
> > @@ -437,7 +471,34 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
> >               horizontal_backporch_byte = ((vm->hback_porch + vm->hsync_len) *
> >                       dsi_tmp_buf_bpp - 10);
> >
> > -     horizontal_frontporch_byte = (vm->hfront_porch * dsi_tmp_buf_bpp - 12);
> > +     data_phy_cycles = timing->lpx + timing->da_hs_prepare +
> > +                               timing->da_hs_zero + timing->da_hs_exit + 2;
> > +
> > +     if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> > +             if (vm->hfront_porch * dsi_tmp_buf_bpp >
> > +                 data_phy_cycles * dsi->lanes + 18) {
> > +                     horizontal_frontporch_byte = vm->hfront_porch *
> > +                                                  dsi_tmp_buf_bpp -
> > +                                                  data_phy_cycles *
> > +                                                  dsi->lanes - 18;
> > +             } else {
> > +                     DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
> > +                     horizontal_frontporch_byte = vm->hfront_porch *
> > +                                                  dsi_tmp_buf_bpp;
> > +             }
> > +     } else {
> > +             if (vm->hfront_porch * dsi_tmp_buf_bpp >
> > +                 data_phy_cycles * dsi->lanes + 12) {
> > +                     horizontal_frontporch_byte = vm->hfront_porch *
> > +                                                  dsi_tmp_buf_bpp -
> > +                                                  data_phy_cycles *
> > +                                                  dsi->lanes - 12;
> > +             } else {
> > +                     DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
> > +                     horizontal_frontporch_byte = vm->hfront_porch *
> > +                                                  dsi_tmp_buf_bpp;
> > +             }
> > +     }
> >
> >       writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
> >       writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
> > @@ -537,8 +598,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> >  {
> >       struct device *dev = dsi->host.dev;
> >       int ret;
> > -     u64 pixel_clock, total_bits;
> > -     u32 htotal, htotal_bits, bit_per_pixel, overhead_cycles, overhead_bits;
> > +     u32 bit_per_pixel;
> >
> >       if (++dsi->refcount != 1)
> >               return 0;
> > @@ -557,24 +617,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> >               break;
> >       }
> >
> > -     /**
> > -      * htotal_time = htotal * byte_per_pixel / num_lanes
> > -      * overhead_time = lpx + hs_prepare + hs_zero + hs_trail + hs_exit
> > -      * mipi_ratio = (htotal_time + overhead_time) / htotal_time
> > -      * data_rate = pixel_clock * bit_per_pixel * mipi_ratio / num_lanes;
> > -      */
> > -     pixel_clock = dsi->vm.pixelclock;
> > -     htotal = dsi->vm.hactive + dsi->vm.hback_porch + dsi->vm.hfront_porch +
> > -                     dsi->vm.hsync_len;
> > -     htotal_bits = htotal * bit_per_pixel;
> > -
> > -     overhead_cycles = T_LPX + T_HS_PREP + T_HS_ZERO + T_HS_TRAIL +
> > -                     T_HS_EXIT;
> > -     overhead_bits = overhead_cycles * dsi->lanes * 8;
> > -     total_bits = htotal_bits + overhead_bits;
> > -
> > -     dsi->data_rate = DIV_ROUND_UP_ULL(pixel_clock * total_bits,
> > -                                       htotal * dsi->lanes);
> > +     dsi->data_rate = DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
> > +                                       dsi->lanes);
> >
> >       ret = clk_set_rate(dsi->hs_clk, dsi->data_rate);
> >       if (ret < 0) {
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
