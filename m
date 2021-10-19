Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2DA433333
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 12:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6634489FDB;
	Tue, 19 Oct 2021 10:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F66289E15
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 10:07:50 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so2271468pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 03:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vLn9En22VQRQgqWAN1+Xm2qvyS4LIFg7U3akTCrFnjU=;
 b=FNc7ZLc6D0UBxdl9KmRvnnZAMGrgbWsil4ZjXiwMblp+WkUdvuEwX/wn/cIAnhcY7R
 UOJx4e8oeKELqXCKIYNTVm7re/i8Jqv9k7efVrps0H23rdtpIKhv34r8fJr087YFEn0t
 fELaDGQJb6XQfgHbsd8K5uG9itV9c+P2zU5Fp7Wb+6V9MuiGIooMFaqjqBLHqOz9d15G
 qwcFGRyYzGKfhFG5bOU1kXeGbOrr9/6nlAak5bSI8vgNyv9bJhcxxD/bmejk+T5srYpR
 Nua1ovgRBLqAPSbIsNO4nAo/QXuI+SDJUmghE6R5Faab8e1CMpydXEvMmwGgQEN+1IH1
 poyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vLn9En22VQRQgqWAN1+Xm2qvyS4LIFg7U3akTCrFnjU=;
 b=wUavNaWn+caxlb7zbuY3VmaqEAlqRLwk4FyM/NPG2hgOxeB3ctE3mT8BTs3hKxz1DX
 t/+zaSVBKymlWz45EFdt668HRV6/pW+MSU/NaRMnC6/ncqMJCJN/UZrmaBnAHPLo/5q6
 ZAFL0/g/oK+Vp+dwXWm9FEoS8rpbWIzv/pwAhN13AgJTW7TYXF331cSsscbL5KL+pDvm
 h80c3jy0uHQ7GOGIa3v3HWkTf+5zUQbELBMMl/UUr5C16Njei/1qEBysbvEgd32bMGPe
 aEEM72bgTO0ZYwc9npoujLEGBOJZWH1R1waOUguoe60qYhTRg0uJ89MPmxhUT9n1sTVH
 4waw==
X-Gm-Message-State: AOAM530/vBybu5fJIhPf2VufsRHpFxA2p57CkAmcJg7s71TwPwP8pxu+
 PPvXBmq5wsNUrzV8ILbTDBew1swvY5P+MgxmUasbIw==
X-Google-Smtp-Source: ABdhPJwyfTKtbEaDMGx1xcd0X7CFJoeJSKDyMUXMIKAxnb4rPfg9kgfVw429On219Pmm1DhYCb3kDVbyxHpABRqmjWA=
X-Received: by 2002:a17:902:b410:b0:13f:afe4:bf17 with SMTP id
 x16-20020a170902b41000b0013fafe4bf17mr15408842plr.24.1634638069638; Tue, 19
 Oct 2021 03:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210704140309.268469-1-jagan@amarulasolutions.com>
 <20211011063948.GA1487752@panicking>
 <CAOf5uwm6x5p2=xC_HDo5UR9FBfxVkeG8H0JvGgs5yE8fE=gu9A@mail.gmail.com>
In-Reply-To: <CAOf5uwm6x5p2=xC_HDo5UR9FBfxVkeG8H0JvGgs5yE8fE=gu9A@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Oct 2021 12:07:38 +0200
Message-ID: <CAG3jFyvE-RLsUchcBoen9rkyCT4iyLkZsx_1DkktVChpjLGoGw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Find the possible DSI devices
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Heiko Stubner <heiko@sntech.de>, 
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonathan Liu <net147@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, Alexander Sack <asac@linaro.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for catching this Michael.

> > Working on linux-next-5.14-rc4 on px30-evb rockchip board. On top of this patch for px30 dsi
> > I need to add:
> >
>
> I wrote the driver for evb px30 v11. I just need to clean up a bit.
> Anyway the video is correct.
> Using my patch. The display is not a module
>
> Module                  Size  Used by
> bluetooth             438272  2
> ecdh_generic           16384  1 bluetooth
> ecc                    36864  1 ecdh_generic
> brcmfmac              249856  0
> crct10dif_ce           20480  1
> brcmutil               20480  1 brcmfmac
> dwmac_rk               28672  0
> stmmac_platform        20480  1 dwmac_rk
> cfg80211              360448  1 brcmfmac
> rfkill                 36864  3 bluetooth,cfg80211
> stmmac                217088  2 stmmac_platform,dwmac_rk
> rockchip_saradc        16384  0
> pcs_xpcs               24576  1 stmmac
> industrialio_triggered_buffer    16384  1 rockchip_saradc
> rockchip_thermal       24576  0
> kfifo_buf              16384  1 industrialio_triggered_buffer
> rtc_rk808              16384  1
> goodix                 24576  0
> snd_soc_rockchip_i2s    16384  0
> snd_soc_rockchip_pcm    16384  1 snd_soc_rockchip_i2s
> adc_keys               16384  0
> fuse                  131072  1
> ipv6                  446464  36
>
> Michael

Can you submit this patch separately and add a Fixes tag to it?

With the above fixed, the drm-misc related changes have my ack.

Acked-by: Robert Foss <robert.foss@linaro.org>

>
> >
> > From a0e0344b4cb4df3d97fac0e27e0aa76a2a191b0e Mon Sep 17 00:00:00 2001
> > From: Michael Trimarchi <michael@amarulasolutions.com>
> > Date: Sun, 10 Oct 2021 23:56:20 +0200
> > Subject: [PATCH] drm: dw-mipi-dsi-rockchip: Avoid the attach before probe is
> >  completed
> >
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c   |  8 +++++++-
> >  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++++++----
> >  include/drm/bridge/dw_mipi_dsi.h                |  2 +-
> >  3 files changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > index 45f4515dda00..a5535f183af3 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > @@ -362,8 +362,14 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> >                 dsi->device_found = true;
> >         }
> >
> > +       /*
> > +        * NOTE: the dsi registration is implemented in
> > +        * platform driver, that to say dsi would be exist after
> > +        * probe is terminated. The call is done before the end of probe
> > +        * so we need to pass the dsi to the platform driver.
> > +        */
> >         if (pdata->host_ops && pdata->host_ops->attach) {
> > -               ret = pdata->host_ops->attach(pdata->priv_data, device);
> > +               ret = pdata->host_ops->attach(pdata->priv_data, device, dsi);
> >                 if (ret < 0)
> >                         return ret;
> >         }
> > diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > index ec7729d18cb8..cf7c9cf11c9e 100644
> > --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > @@ -972,12 +972,15 @@ static const struct component_ops dw_mipi_dsi_rockchip_ops = {
> >  };
> >
> >  static int dw_mipi_dsi_rockchip_host_attach(void *priv_data,
> > -                                           struct mipi_dsi_device *device)
> > +                                           struct mipi_dsi_device *device,
> > +                                           struct dw_mipi_dsi *dmd)
> >  {
> >         struct dw_mipi_dsi_rockchip *dsi = priv_data;
> >         struct device *second;
> >         int ret;
> >
> > +       dsi->dmd = dmd;
> > +
> >         ret = component_add(dsi->dev, &dw_mipi_dsi_rockchip_ops);
> >         if (ret) {
> >                 DRM_DEV_ERROR(dsi->dev, "Failed to register component: %d\n",
> > @@ -1027,6 +1030,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
> >         struct device_node *np = dev->of_node;
> >         struct dw_mipi_dsi_rockchip *dsi;
> >         struct resource *res;
> > +       struct dw_mipi_dsi *dmd;
> >         const struct rockchip_dw_dsi_chip_data *cdata =
> >                                 of_device_get_match_data(dev);
> >         int ret, i;
> > @@ -1115,9 +1119,9 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
> >         dsi->pdata.priv_data = dsi;
> >         platform_set_drvdata(pdev, dsi);
> >
> > -       dsi->dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
> > -       if (IS_ERR(dsi->dmd)) {
> > -               ret = PTR_ERR(dsi->dmd);
> > +       dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
> > +       if (IS_ERR(dmd)) {
> > +               ret = PTR_ERR(dmd);
> >                 if (ret != -EPROBE_DEFER)
> >                         DRM_DEV_ERROR(dev,
> >                                       "Failed to probe dw_mipi_dsi: %d\n", ret);
> > diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
> > index bda8aa7c2280..cf81f19806ad 100644
> > --- a/include/drm/bridge/dw_mipi_dsi.h
> > +++ b/include/drm/bridge/dw_mipi_dsi.h
> > @@ -41,7 +41,7 @@ struct dw_mipi_dsi_phy_ops {
> >
> >  struct dw_mipi_dsi_host_ops {
> >         int (*attach)(void *priv_data,
> > -                     struct mipi_dsi_device *dsi);
> > +                     struct mipi_dsi_device *dsi, struct dw_mipi_dsi *dmd);
> >         int (*detach)(void *priv_data,
> >                       struct mipi_dsi_device *dsi);
> >  };
> >
> > During the probing the sequence let arrive to attach before the rockchip
> > driver terminate to be registered. Anyway the panel is not working at
> > the moment for some timing issue
> >
