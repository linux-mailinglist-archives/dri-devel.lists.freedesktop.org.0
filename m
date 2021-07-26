Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CD23D50CB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 02:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CCB6E409;
	Mon, 26 Jul 2021 00:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD416E194
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 00:38:31 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id j10so4346202vsl.10
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F0mFops6RFErjroa43HvDO5zUgCqDjDqGwKgr6A7M1o=;
 b=DtdjnnRqJinXS0Ban1Ir953X0mfQbJEb2Xa/Ta0fLXzYhwgutFhYL2YROXaexbXGMn
 VXyWXx3atQipGspV3b5Th0QdD68XMZFxF8T6rOSWHYVmKOq6JAVE5utF37BM5JyUAhRj
 SCrFhaSYK34ZovN9XuywdayV89MqBt8oVNXmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F0mFops6RFErjroa43HvDO5zUgCqDjDqGwKgr6A7M1o=;
 b=by0rCMMjWIeloFpDAGkDm9nxPKp6/ndqzxJ79UJbOmtbE9iDXo667YI8tK5d7/y/RK
 uFej89Q0/RYwMcxnB/1IPUvkUSsLP6bo0f7oqT1StLyiRlRStTD+Ji07jg5Hm9YjTrv3
 /CLFSjwciu1ON/G+35O9cjLaSWldfYiaaJHt5RdAXn5mKxe0mndHUiHe251oxlin78Jb
 XNQ4zDjhX2mFkbzLLYTzYKmSgfDBhf+aJ0DEvWMzdkuEdZfEM/lT3oELLEX/5t+l71gz
 4DqVB7FURz4y8RTh3kk/VSayYR4cOVDqy0B9kL9OYnIfXyGghQKIHSbOfHGipqSg0Ft6
 HnyQ==
X-Gm-Message-State: AOAM531+aRHeHx1+ByMw/NDhtt+YMLzA78EmgbTCKZ2am6VateeoyxKm
 WVLg2/iNgZCOQhreyliXgGjB1UyyYQ7NBMRzYvnTvg==
X-Google-Smtp-Source: ABdhPJwcIKgRTaxQjcesm8x84bNSb+rcNFoCFmDo8gL7peOWVGssJgE8s7+tDPE15BmNmDvdO+39bvoyKS9VKaZEQHE=
X-Received: by 2002:a67:e1c7:: with SMTP id p7mr10528020vsl.21.1627259909995; 
 Sun, 25 Jul 2021 17:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210629074703.v2.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <YP1nmsofOs5KHre+@ravnborg.org>
In-Reply-To: <YP1nmsofOs5KHre+@ravnborg.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 26 Jul 2021 08:38:18 +0800
Message-ID: <CANMq1KD_6DoNR9PvO9wrpEQc5BDwx6952mwz0poCw=hu+HsUbw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
 features
To: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 MSM <linux-arm-msm@vger.kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, Xin Ji <xji@analogixsemi.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 lkml <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 25, 2021 at 9:31 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Tue, Jun 29, 2021 at 07:47:21AM +0800, Nicolas Boichat wrote:
> > Many of the DSI flags have names opposite to their actual effects,
> > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > MIPI_DSI_MODE_NO_EOT_PACKET.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> Hi Nicolas,
>
> in this thread:
> https://lore.kernel.org/dri-devel/20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid/
> I see that several people added their Reviewed-by.
>
> Please either add the tgas if missing, or elaborate why you left them out.

Oh simple, I just forgot.

I regenerated the patch so it's a bit different from v1... Not 100%
sure if I can add those, since those were for the overall patch:
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@samsung.com>.

Those 2 shouldn't be a problem:
Reviewed-by: Xin Ji <xji@analogixsemi.com> # anx7625.c
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org> # msm/dsi

> I was suprised this had not landed yet.

Yep. Let me know if you want me to send a v3 with those tags.

Best,

>
>         Sam
>
> > ---
> > I considered adding _DISABLE_ instead, but that'd make the
> > flag names a big too long.
> >
> > Generated with:
> > flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
> > flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
> > (then minor format changes)
> >
> > Changes in v2:
> >  - Rebased on latest linux-next, after some of the flags got fixed
> >    (Linus Walleij).
> >
> >  drivers/gpu/drm/bridge/adv7511/adv7533.c             | 2 +-
> >  drivers/gpu/drm/bridge/analogix/anx7625.c            | 2 +-
> >  drivers/gpu/drm/bridge/cdns-dsi.c                    | 4 ++--
> >  drivers/gpu/drm/bridge/lontium-lt8912b.c             | 2 +-
> >  drivers/gpu/drm/bridge/tc358768.c                    | 2 +-
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c              | 8 ++++----
> >  drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
> >  drivers/gpu/drm/mediatek/mtk_dsi.c                   | 4 ++--
> >  drivers/gpu/drm/msm/dsi/dsi_host.c                   | 8 ++++----
> >  drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 2 +-
> >  drivers/gpu/drm/panel/panel-dsi-cm.c                 | 2 +-
> >  drivers/gpu/drm/panel/panel-elida-kd35t133.c         | 2 +-
> >  drivers/gpu/drm/panel/panel-khadas-ts050.c           | 2 +-
> >  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c   | 2 +-
> >  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c   | 2 +-
> >  drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c   | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c     | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c        | 4 ++--
> >  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c      | 2 +-
> >  drivers/gpu/drm/panel/panel-simple.c                 | 2 +-
> >  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c     | 2 +-
> >  include/drm/drm_mipi_dsi.h                           | 8 ++++----
> >  22 files changed, 34 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > index aa19d5a40e31..59d718bde8c4 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > @@ -165,7 +165,7 @@ int adv7533_attach_dsi(struct adv7511 *adv)
> >       dsi->lanes = adv->num_dsi_lanes;
> >       dsi->format = MIPI_DSI_FMT_RGB888;
> >       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> > -                       MIPI_DSI_MODE_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
> > +                       MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
> >
> >       ret = mipi_dsi_attach(dsi);
> >       if (ret < 0) {
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 7519b7a0f29d..6ca9f7e00064 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1307,7 +1307,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
> >       dsi->format = MIPI_DSI_FMT_RGB888;
> >       dsi->mode_flags = MIPI_DSI_MODE_VIDEO   |
> >               MIPI_DSI_MODE_VIDEO_SYNC_PULSE  |
> > -             MIPI_DSI_MODE_EOT_PACKET        |
> > +             MIPI_DSI_MODE_NO_EOT_PACKET     |
> >               MIPI_DSI_MODE_VIDEO_HSE;
> >
> >       if (mipi_dsi_attach(dsi) < 0) {
> > diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> > index b31281f76117..e6e331071a00 100644
> > --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> > +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> > @@ -829,7 +829,7 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
> >       tmp = DIV_ROUND_UP(dsi_cfg.htotal, nlanes) -
> >             DIV_ROUND_UP(dsi_cfg.hsa, nlanes);
> >
> > -     if (!(output->dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> > +     if (!(output->dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> >               tmp -= DIV_ROUND_UP(DSI_EOT_PKT_SIZE, nlanes);
> >
> >       tx_byte_period = DIV_ROUND_DOWN_ULL((u64)NSEC_PER_SEC * 8,
> > @@ -902,7 +902,7 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
> >       tmp = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
> >       tmp &= ~(IF_VID_SELECT_MASK | HOST_EOT_GEN | IF_VID_MODE);
> >
> > -     if (!(output->dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> > +     if (!(output->dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> >               tmp |= HOST_EOT_GEN;
> >
> >       if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> > index 76c720b535fb..1b0c7eaf6c84 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> > @@ -487,7 +487,7 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
> >       dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> >                         MIPI_DSI_MODE_VIDEO_BURST |
> >                         MIPI_DSI_MODE_LPM |
> > -                       MIPI_DSI_MODE_EOT_PACKET;
> > +                       MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> >       ret = mipi_dsi_attach(dsi);
> >       if (ret < 0) {
> > diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> > index 8ed8302d6bbb..320f95ae6077 100644
> > --- a/drivers/gpu/drm/bridge/tc358768.c
> > +++ b/drivers/gpu/drm/bridge/tc358768.c
> > @@ -825,7 +825,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
> >       if (!(dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
> >               val |= TC358768_DSI_CONTROL_HSCKMD;
> >
> > -     if (dsi_dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
> > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> >               val |= TC358768_DSI_CONTROL_EOTDIS;
> >
> >       tc358768_write(priv, TC358768_DSI_CONFW, val);
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index 1d777d8c1a83..e39fac889edc 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -809,15 +809,15 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
> >                       reg |= DSIM_AUTO_MODE;
> >               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
> >                       reg |= DSIM_HSE_MODE;
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HFP))
> > +             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
> >                       reg |= DSIM_HFP_MODE;
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HBP))
> > +             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
> >                       reg |= DSIM_HBP_MODE;
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSA))
> > +             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
> >                       reg |= DSIM_HSA_MODE;
> >       }
> >
> > -     if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> > +     if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> >               reg |= DSIM_EOT_DISABLE;
> >
> >       switch (dsi->format) {
> > diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> > index 34a00d7e9c38..524852ed68f1 100644
> > --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> > +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> > @@ -760,7 +760,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
> >               DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
> >               DSI_MCTL_MAIN_DATA_CTL_READ_EN |
> >               DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
> > -     if (!(d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> > +     if (!(d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> >               val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
> >       writel(val, d->regs + DSI_MCTL_MAIN_DATA_CTL);
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index ae403c67cbd9..93b40c245f00 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -404,7 +404,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
> >       if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
> >               tmp_reg |= HSTX_CKLP_EN;
> >
> > -     if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> > +     if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> >               tmp_reg |= DIS_EOT;
> >
> >       writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
> > @@ -481,7 +481,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
> >                         timing->da_hs_zero + timing->da_hs_exit + 3;
> >
> >       delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
> > -     delta += dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET ? 2 : 0;
> > +     delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 2 : 0;
> >
> >       horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
> >       horizontal_front_back_byte = horizontal_frontporch_byte + horizontal_backporch_byte;
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index ed504fe5074f..b466a4af7c3e 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -849,11 +849,11 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
> >       if (flags & MIPI_DSI_MODE_VIDEO) {
> >               if (flags & MIPI_DSI_MODE_VIDEO_HSE)
> >                       data |= DSI_VID_CFG0_PULSE_MODE_HSA_HE;
> > -             if (flags & MIPI_DSI_MODE_VIDEO_HFP)
> > +             if (flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
> >                       data |= DSI_VID_CFG0_HFP_POWER_STOP;
> > -             if (flags & MIPI_DSI_MODE_VIDEO_HBP)
> > +             if (flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
> >                       data |= DSI_VID_CFG0_HBP_POWER_STOP;
> > -             if (flags & MIPI_DSI_MODE_VIDEO_HSA)
> > +             if (flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
> >                       data |= DSI_VID_CFG0_HSA_POWER_STOP;
> >               /* Always set low power stop mode for BLLP
> >                * to let command engine send packets
> > @@ -908,7 +908,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
> >                         DSI_T_CLK_PRE_EXTEND_INC_BY_2_BYTECLK);
> >
> >       data = 0;
> > -     if (!(flags & MIPI_DSI_MODE_EOT_PACKET))
> > +     if (!(flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> >               data |= DSI_EOT_PACKET_CTRL_TX_EOT_APPEND;
> >       dsi_write(msm_host, REG_DSI_EOT_PACKET_CTRL, data);
> >
> > diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> > index e95bc9f60b3f..44674ebedf59 100644
> > --- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> > +++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> > @@ -302,7 +302,7 @@ static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
> >       dsi->lanes = 4;
> >       dsi->format = MIPI_DSI_FMT_RGB888;
> >       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > -                       MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_EOT_PACKET |
> > +                       MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_NO_EOT_PACKET |
> >                         MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
> >
> >       drm_panel_init(&ctx->panel, dev, &tm5p5_nt35596_panel_funcs,
> > diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> > index 5fbfb71ca3d9..da4a69067e18 100644
> > --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> > +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> > @@ -574,7 +574,7 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
> >       dsi->lanes = 2;
> >       dsi->format = MIPI_DSI_FMT_RGB888;
> >       dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > -                       MIPI_DSI_MODE_EOT_PACKET;
> > +                       MIPI_DSI_MODE_NO_EOT_PACKET;
> >       dsi->hs_rate = ddata->panel_data->max_hs_rate;
> >       dsi->lp_rate = ddata->panel_data->max_lp_rate;
> >
> > diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> > index 4787f0833264..80227617a4d6 100644
> > --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> > +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> > @@ -273,7 +273,7 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
> >       dsi->lanes = 1;
> >       dsi->format = MIPI_DSI_FMT_RGB888;
> >       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > -                       MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET |
> > +                       MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET |
> >                         MIPI_DSI_CLOCK_NON_CONTINUOUS;
> >
> >       drm_panel_init(&ctx->panel, &dsi->dev, &kd35t133_funcs,
> > diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
> > index 8f6ac1a40c31..a3ec4cbdbf7a 100644
> > --- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
> > +++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
> > @@ -809,7 +809,7 @@ static int khadas_ts050_panel_probe(struct mipi_dsi_device *dsi)
> >       dsi->lanes = 4;
> >       dsi->format = MIPI_DSI_FMT_RGB888;
> >       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > -                       MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> > +                       MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> >       khadas_ts050 = devm_kzalloc(&dsi->dev, sizeof(*khadas_ts050),
> >                                   GFP_KERNEL);
> > diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> > index ed0d5f959037..a5a414920430 100644
> > --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> > +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> > @@ -593,7 +593,7 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
> >       dsi->lanes = 4;
> >       dsi->format = MIPI_DSI_FMT_RGB888;
> >       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > -                       MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> > +                       MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> >       drm_panel_init(&ctx->panel, &dsi->dev, &ltk050h3146w_funcs,
> >                      DRM_MODE_CONNECTOR_DSI);
> > diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> > index 3c00e4f8f803..21e48923836d 100644
> > --- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> > +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> > @@ -442,7 +442,7 @@ static int ltk500hd1829_probe(struct mipi_dsi_device *dsi)
> >       dsi->lanes = 4;
> >       dsi->format = MIPI_DSI_FMT_RGB888;
> >       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > -                       MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> > +                       MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> >       drm_panel_init(&ctx->panel, &dsi->dev, &ltk500hd1829_funcs,
> >                      DRM_MODE_CONNECTOR_DSI);
> > diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> > index 45b975dee587..198493a6eb6a 100644
> > --- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> > +++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> > @@ -184,7 +184,7 @@ static int osd101t2587_panel_probe(struct mipi_dsi_device *dsi)
> >       dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> >                         MIPI_DSI_MODE_VIDEO_BURST |
> >                         MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> > -                       MIPI_DSI_MODE_EOT_PACKET;
> > +                       MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> >       osd101t2587 = devm_kzalloc(&dsi->dev, sizeof(*osd101t2587), GFP_KERNEL);
> >       if (!osd101t2587)
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> > index b962c817fb30..ccc8ed6fe3ae 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> > @@ -446,7 +446,7 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
> >
> >       dsi->lanes = 1;
> >       dsi->format = MIPI_DSI_FMT_RGB888;
> > -     dsi->mode_flags = MIPI_DSI_MODE_EOT_PACKET;
> > +     dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> >       ctx->supplies[0].supply = "vdd3";
> >       ctx->supplies[1].supply = "vci";
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> > index 527371120266..9b3599d6d2de 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> > @@ -990,8 +990,8 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
> >       dsi->lanes = 4;
> >       dsi->format = MIPI_DSI_FMT_RGB888;
> >       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST
> > -             | MIPI_DSI_MODE_VIDEO_HFP | MIPI_DSI_MODE_VIDEO_HBP
> > -             | MIPI_DSI_MODE_VIDEO_HSA | MIPI_DSI_MODE_EOT_PACKET
> > +             | MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP
> > +             | MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET
> >               | MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_AUTO_VERT;
> >
> >       ret = s6e8aa0_parse_dt(ctx);
> > diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> > index 16dbf0f353ed..b937e24dac8e 100644
> > --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> > +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> > @@ -282,7 +282,7 @@ static int sharp_nt_panel_probe(struct mipi_dsi_device *dsi)
> >       dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> >                       MIPI_DSI_MODE_VIDEO_HSE |
> >                       MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > -                     MIPI_DSI_MODE_EOT_PACKET;
> > +                     MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> >       sharp_nt = devm_kzalloc(&dsi->dev, sizeof(*sharp_nt), GFP_KERNEL);
> >       if (!sharp_nt)
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 21939d4352cf..d490b5ef968a 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -4867,7 +4867,7 @@ static const struct panel_desc_dsi osd101t2045_53ts = {
> >       },
> >       .flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> >                MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> > -              MIPI_DSI_MODE_EOT_PACKET,
> > +              MIPI_DSI_MODE_NO_EOT_PACKET,
> >       .format = MIPI_DSI_FMT_RGB888,
> >       .lanes = 4,
> >  };
> > diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> > index 55172d63a922..d17aae8b71d7 100644
> > --- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> > +++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> > @@ -311,7 +311,7 @@ static int xpp055c272_probe(struct mipi_dsi_device *dsi)
> >       dsi->lanes = 4;
> >       dsi->format = MIPI_DSI_FMT_RGB888;
> >       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > -                       MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> > +                       MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> >       drm_panel_init(&ctx->panel, &dsi->dev, &xpp055c272_funcs,
> >                      DRM_MODE_CONNECTOR_DSI);
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 360e6377e84b..ba91cf22af51 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -119,15 +119,15 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
> >  /* enable hsync-end packets in vsync-pulse and v-porch area */
> >  #define MIPI_DSI_MODE_VIDEO_HSE              BIT(4)
> >  /* disable hfront-porch area */
> > -#define MIPI_DSI_MODE_VIDEO_HFP              BIT(5)
> > +#define MIPI_DSI_MODE_VIDEO_NO_HFP   BIT(5)
> >  /* disable hback-porch area */
> > -#define MIPI_DSI_MODE_VIDEO_HBP              BIT(6)
> > +#define MIPI_DSI_MODE_VIDEO_NO_HBP   BIT(6)
> >  /* disable hsync-active area */
> > -#define MIPI_DSI_MODE_VIDEO_HSA              BIT(7)
> > +#define MIPI_DSI_MODE_VIDEO_NO_HSA   BIT(7)
> >  /* flush display FIFO on vsync pulse */
> >  #define MIPI_DSI_MODE_VSYNC_FLUSH    BIT(8)
> >  /* disable EoT packets in HS mode */
> > -#define MIPI_DSI_MODE_EOT_PACKET     BIT(9)
> > +#define MIPI_DSI_MODE_NO_EOT_PACKET  BIT(9)
> >  /* device supports non-continuous clock behavior (DSI spec 5.6.1) */
> >  #define MIPI_DSI_CLOCK_NON_CONTINUOUS        BIT(10)
> >  /* transmit data in low power */
> > --
> > 2.32.0.93.g670b81a890-goog
