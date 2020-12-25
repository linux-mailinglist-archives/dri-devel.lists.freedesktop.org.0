Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D6E2E2AF0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8900E89BFD;
	Fri, 25 Dec 2020 09:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD0789A60
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Dec 2020 05:42:03 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id t8so3421691iov.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 21:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PlMtUb6LNC8P3gc+iXkKvKG83M1DexVAvEAzRVWxITY=;
 b=lHiKLepEmTVBKzVOqZMOdUO+bam5JUxzOlVGoxwouBh+Okd6afsSsgwbupNZJn6pmD
 r6SIgF65dhg16dirDrVlFdt1EirGiSiTEGyjAWG+K+KbUiy4gktKq7k7+q7VvVO2Wko5
 xbaaipAIIh5aWVy9h5KwTHqxyf+B5ynAyvERM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PlMtUb6LNC8P3gc+iXkKvKG83M1DexVAvEAzRVWxITY=;
 b=XQWnzX3Vp8rp7Lbwow4feY/p27dAoCHj2lwz1Kr61wAgNdfTr9lXGJeMAocfHlbRl3
 u3OOgLuclxx9YuTlsCLblSxjbprMONhL+mh+2k99v18omnS+vBJhywoWP6iefDccse5a
 ifVakhGrmw/LM9gHzCyaVFFW8bYpHHWXylJY2EuAlIYp63NqZSPTCxTg0sYuuTQQROdL
 rxw18mysC+Jc696H0aqmV4gpLDacgVzg4QYo7ZWR9bb7rSX4K4hmOObtXL/8U1U75wJF
 MEN1Fc0lTI5YxfuSHpgcaVGNgQ+8KfRnfrXdrvljBxZLBxeeiPEjZttGPYeZ5No5yIVR
 6c0Q==
X-Gm-Message-State: AOAM5313nFw6uZ/8ZdsMV65OJZJDI3+8eNH2uoqBAN9e7ucJYe8vxCcs
 mRtc8qiQgSeLS1ketx3+v1sacrXf7D/0XJWzV6J72w==
X-Google-Smtp-Source: ABdhPJz/+cJcq6YomNXSEFT4DzD0QlJzfOCNj88HO/Tv8guFHYZNuH/MTTVlBZy2M/y+rEwpPOm/m29MIqwDXdhQTjU=
X-Received: by 2002:a6b:b74e:: with SMTP id h75mr27168103iof.0.1608874922640; 
 Thu, 24 Dec 2020 21:42:02 -0800 (PST)
MIME-Version: 1.0
References: <20201123034652.3660584-1-hsinyi@chromium.org>
 <20201123034652.3660584-2-hsinyi@chromium.org>
 <CAJMQK-jrMmVXtwZ6XumbPf9P-FtFEm_QBP_yrn=PsHgnYBrV+g@mail.gmail.com>
In-Reply-To: <CAJMQK-jrMmVXtwZ6XumbPf9P-FtFEm_QBP_yrn=PsHgnYBrV+g@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 25 Dec 2020 13:41:36 +0800
Message-ID: <CAJMQK-iT1gzwYF6-F_mwJV5W5iPs9wEar83PMZFwva5ci5D72Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7625: disable regulators when power
 off
To: Xin Ji <xji@analogixsemi.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 9, 2020 at 12:43 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Mon, Nov 23, 2020 at 11:47 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > When suspending the driver, anx7625_power_standby() will be called to
> > turn off reset-gpios and enable-gpios. However, power supplies are not
> > disabled. To save power, the driver can get the power supply regulators
> > and turn off them in anx7625_power_standby().
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Gentle ping on the patch
>

After some testing, the powering sequence has some issue and would
cause i2c failures. The powering sequence needs to be rechecked.

> > ---
> > Change:
> > v2: none
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 25 +++++++++++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
> >  2 files changed, 26 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 65cc05982f82..eb9c4cc2504a 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> >  #include <linux/workqueue.h>
> > @@ -875,12 +876,20 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
> >  static void anx7625_power_on(struct anx7625_data *ctx)
> >  {
> >         struct device *dev = &ctx->client->dev;
> > +       int ret;
> >
> >         if (!ctx->pdata.low_power_mode) {
> >                 DRM_DEV_DEBUG_DRIVER(dev, "not low power mode!\n");
> >                 return;
> >         }
> >
> > +       ret = regulator_bulk_enable(ARRAY_SIZE(ctx->pdata.supplies),
> > +                                   ctx->pdata.supplies);
> > +       if (ret < 0) {
> > +               DRM_DEV_DEBUG_DRIVER(dev, "cannot enable regulators %d\n", ret);
> > +               return;
> > +       }
> > +
> >         /* Power on pin enable */
> >         gpiod_set_value(ctx->pdata.gpio_p_on, 1);
> >         usleep_range(10000, 11000);
> > @@ -894,6 +903,7 @@ static void anx7625_power_on(struct anx7625_data *ctx)
> >  static void anx7625_power_standby(struct anx7625_data *ctx)
> >  {
> >         struct device *dev = &ctx->client->dev;
> > +       int ret;
> >
> >         if (!ctx->pdata.low_power_mode) {
> >                 DRM_DEV_DEBUG_DRIVER(dev, "not low power mode!\n");
> > @@ -904,6 +914,12 @@ static void anx7625_power_standby(struct anx7625_data *ctx)
> >         usleep_range(1000, 1100);
> >         gpiod_set_value(ctx->pdata.gpio_p_on, 0);
> >         usleep_range(1000, 1100);
> > +
> > +       ret = regulator_bulk_disable(ARRAY_SIZE(ctx->pdata.supplies),
> > +                                    ctx->pdata.supplies);
> > +       if (ret < 0)
> > +               DRM_DEV_DEBUG_DRIVER(dev, "cannot disable regulators %d\n", ret);
> > +
> >         DRM_DEV_DEBUG_DRIVER(dev, "power down\n");
> >  }
> >
> > @@ -1742,6 +1758,15 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >         platform->client = client;
> >         i2c_set_clientdata(client, platform);
> >
> > +       pdata->supplies[0].supply = "vdd10";
> > +       pdata->supplies[1].supply = "vdd18";
> > +       pdata->supplies[2].supply = "vdd33";
> > +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pdata->supplies),
> > +                                     pdata->supplies);
> > +       if (ret) {
> > +               DRM_DEV_ERROR(dev, "fail to get power supplies: %d\n", ret);
> > +               return ret;
> > +       }
> >         anx7625_init_gpio(platform);
> >
> >         atomic_set(&platform->power_status, 0);
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > index 193ad86c5450..e4a086b3a3d7 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -350,6 +350,7 @@ struct s_edid_data {
> >  struct anx7625_platform_data {
> >         struct gpio_desc *gpio_p_on;
> >         struct gpio_desc *gpio_reset;
> > +       struct regulator_bulk_data supplies[3];
> >         struct drm_bridge *panel_bridge;
> >         int intp_irq;
> >         u32 low_power_mode;
> > --
> > 2.29.2.454.gaff20da3a2-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
