Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04816307139
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E726E92B;
	Thu, 28 Jan 2021 08:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73386E8DA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 06:16:13 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id z18so3998124ile.9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 22:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/KzLZrIlj2KEusKb+DCyZQltguwX4cquIABSWZ+YWu8=;
 b=HqmGgkXeKHV92s/9MhA3TQIkVUpzUw0v86uHHPVMKwq0rTqQWTi/SuEW9e5RKbe+RZ
 wyr+Y5vvEj436caCaAH80No/ZuRzT1uCqHhnL2It/OvCuK2BrPQ+fgZRdObo7Z4n7wXZ
 9p/I9NGSQLTfabyk/sU+R+5u6KivXtcIsIREg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/KzLZrIlj2KEusKb+DCyZQltguwX4cquIABSWZ+YWu8=;
 b=YMku6qP+1ZUCLU0xHb4m2GMQbIUEK4SFeCOj3UE2ILIXpZhL5fER/+jgow9BdW7Gio
 FhMfFkds08oz8ouE6StNfjbuf5PSXrYTFf2UvRARcfuBRV6f9Z6JLiiYN1H8QcmstcGM
 uneQR4PTikY6qzwo47lXnF/+rb4zQWHd1iK+omJs9rM6JerUS3xoolCoG+OBko22lL2z
 ZZ5SSTypZsxUihFkOeu/x69YJZwZhtLRcM416Exz2Yc3I640jyKIGfTJY4+n6C+RpINe
 o7V2vYdjuEWjtNZiM2jIPuJD5qdy4Whb4Lgylr4HATiylrOlH7xnV8LiyiyzpN5Q66aS
 g7XA==
X-Gm-Message-State: AOAM53250KTARihoaHQd6rZ0vmeuwZ/HhGcygyrTc32k2MM4+S8heqM7
 rAiS5U6VdBavSqBbnabqxoT+rSmmL5guqSQOpTsHQg==
X-Google-Smtp-Source: ABdhPJzBqhKTHMlI5tApnzJW0pJjO1n8CMr+sbfm3OGH0z5XL/nYsEZM5Ecpax4npwyGOI9nkuewCcEWRxOv827+6J4=
X-Received: by 2002:a92:15c6:: with SMTP id 67mr11242319ilv.283.1611814573141; 
 Wed, 27 Jan 2021 22:16:13 -0800 (PST)
MIME-Version: 1.0
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-9-hsinyi@chromium.org>
 <1611814421.28312.9.camel@mtksdaap41>
In-Reply-To: <1611814421.28312.9.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 14:15:47 +0800
Message-ID: <CAJMQK-gHjmm-BaG83EXMOkT6KeCyJJN4ZqRDdT75BcED53bREw@mail.gmail.com>
Subject: Re: [PATCH v10 8/9] drm/mediatek: add DDP support for MT8183
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:35 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 2:13 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-Yi:
>
> Modify the title's prefix to 'soc: mediatek:'
>
> On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> >
> > Add DDP support for MT8183 SoC.
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c | 50 ++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> > index f531b119da7a9..f64e9c33e85ad 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -14,6 +14,8 @@
> >
> >  #define MT2701_MUTEX0_MOD0                   0x2c
> >  #define MT2701_MUTEX0_SOF0                   0x30
> > +#define MT8183_DISP_MUTEX0_MOD0                      0x30
> > +#define MT8183_DISP_MUTEX0_SOF0                      0x2c
>
> Modify 'DISP_MUTEX' to 'MUTEX'
>
> >
> >  #define DISP_REG_MUTEX_EN(n)                 (0x20 + 0x20 * (n))
> >  #define DISP_REG_MUTEX(n)                    (0x24 + 0x20 * (n))
> > @@ -37,6 +39,18 @@
> >  #define MT8167_MUTEX_MOD_DISP_DITHER         15
> >  #define MT8167_MUTEX_MOD_DISP_UFOE           16
> >
> > +#define MT8183_MUTEX_MOD_DISP_RDMA0          0
> > +#define MT8183_MUTEX_MOD_DISP_RDMA1          1
> > +#define MT8183_MUTEX_MOD_DISP_OVL0           9
> > +#define MT8183_MUTEX_MOD_DISP_OVL0_2L                10
> > +#define MT8183_MUTEX_MOD_DISP_OVL1_2L                11
> > +#define MT8183_MUTEX_MOD_DISP_WDMA0          12
> > +#define MT8183_MUTEX_MOD_DISP_COLOR0         13
> > +#define MT8183_MUTEX_MOD_DISP_CCORR0         14
> > +#define MT8183_MUTEX_MOD_DISP_AAL0           15
> > +#define MT8183_MUTEX_MOD_DISP_GAMMA0         16
> > +#define MT8183_MUTEX_MOD_DISP_DITHER0                17
> > +
> >  #define MT8173_MUTEX_MOD_DISP_OVL0           11
> >  #define MT8173_MUTEX_MOD_DISP_OVL1           12
> >  #define MT8173_MUTEX_MOD_DISP_RDMA0          13
> > @@ -87,6 +101,12 @@
> >  #define MT2712_MUTEX_SOF_DSI3                        6
> >  #define MT8167_MUTEX_SOF_DPI0                        2
> >  #define MT8167_MUTEX_SOF_DPI1                        3
> > +#define MT8183_MUTEX_SOF_DSI0                        1
> > +#define MT8183_MUTEX_SOF_DPI0                        2
> > +
> > +/* Add EOF setting so overlay hardware can receive frame done irq */
> > +#define MT8183_MUTEX_EOF_DSI0                        (MT8183_MUTEX_SOF_DSI0 << 6)
> > +#define MT8183_MUTEX_EOF_DPI0                        (MT8183_MUTEX_SOF_DPI0 << 6)
> >

Hi CK, comment is added here. I can move to mt8183_mutex_sof if preferred.

> >  struct mtk_mutex {
> >       int id;
> > @@ -181,6 +201,20 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> >       [DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
> >  };
> >
> > +static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> > +     [DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
> > +     [DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
> > +     [DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
> > +     [DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
> > +     [DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
> > +     [DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
> > +     [DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
> > +     [DDP_COMPONENT_OVL_2L1] = MT8183_MUTEX_MOD_DISP_OVL1_2L,
> > +     [DDP_COMPONENT_RDMA0] = MT8183_MUTEX_MOD_DISP_RDMA0,
> > +     [DDP_COMPONENT_RDMA1] = MT8183_MUTEX_MOD_DISP_RDMA1,
> > +     [DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
> > +};
> > +
> >  static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> >       [MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> >       [MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> > @@ -198,6 +232,12 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> >       [MUTEX_SOF_DPI1] = MT8167_MUTEX_SOF_DPI1,
> >  };
> >
> > +static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> > +     [MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> > +     [MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
> > +     [MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
>
> According to discussion in [1], add comment for the odd EOF setting.
>
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/1595469798-3824-8-git-send-email-yongqiang.niu@mediatek.com/
>
> Regards,
> CK.
>
>
> > +};
> > +
> >  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
> >       .mutex_mod = mt2701_mutex_mod,
> >       .mutex_sof = mt2712_mutex_sof,
> > @@ -227,6 +267,14 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
> >       .mutex_sof_reg = MT2701_MUTEX0_SOF0,
> >  };
> >
> > +static const struct mtk_mutex_data mt8183_mutex_driver_data = {
> > +     .mutex_mod = mt8183_mutex_mod,
> > +     .mutex_sof = mt8183_mutex_sof,
> > +     .mutex_mod_reg = MT8183_DISP_MUTEX0_MOD0,
> > +     .mutex_sof_reg = MT8183_DISP_MUTEX0_SOF0,
> > +     .no_clk = true,
> > +};
> > +
> >  struct mtk_mutex *mtk_mutex_get(struct device *dev)
> >  {
> >       struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> > @@ -457,6 +505,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
> >         .data = &mt8167_mutex_driver_data},
> >       { .compatible = "mediatek,mt8173-disp-mutex",
> >         .data = &mt8173_mutex_driver_data},
> > +     { .compatible = "mediatek,mt8183-disp-mutex",
> > +       .data = &mt8183_mutex_driver_data},
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
