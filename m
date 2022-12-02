Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB0A6408CD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 15:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3C210E086;
	Fri,  2 Dec 2022 14:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECC110E086
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 14:55:23 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id y15so1740197uan.6
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Dec 2022 06:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5DIEAfr9d518HvW1FSiaubDLh03ZD86HLPj22EhRASA=;
 b=MgMBJ7WIDH5uBn/FJmbn3JvpaNJXzjUsN/yoTbYt9iwGWdLJLFuD4gn2kZLqtbfqq2
 YQgVY11UCEi/Lxex0dtDvmeEOO4C1GhpPIIqZlQ/Z9MXPK8EgYcDZR9CB9mdP2tnjRZS
 nO5uc/GoesNi1F5J2kPXj6IBid0bLH36qa/8KRg/JzXi9AL3eUOx6fjfH2yGS8pBnmyL
 TSdqFN6Spb7H/uZ9orilhwA8kK7mJOkD9l10giw/6eI9Lio+YX88eBE5Q5PMpK9Gu21N
 feaviY/Zts4+MPfxxIatBQYjOoIVWIBLtes2Ar692W8ZhmHXmK6wX2jDS0ZTDfH1TN1m
 hu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5DIEAfr9d518HvW1FSiaubDLh03ZD86HLPj22EhRASA=;
 b=BealKObNx7bNOw4gf3O4/8GBZryFsLqlJnW5QNB2XXPIBVU8R4Il6XfFRnFcTlOqC2
 421V9aExxvoxkVWYLZY7LZvLf4ibBqUFjaRTpyh2A4SF+c2S7xq9E9hZTjjWCyv9pFw8
 wYjxx7HnvvMFD6TbpkhA7w5eFMVjckxGybTT2SQ+ncpToxCf4i53HeQkwjMwo5JusRoP
 e2Iza2U5zw1yji8Xet2FXhpVkosQZSoA8RucxH6EJhAzaRvUALYF3LjJI6BDunWq8Rh6
 F51IMiZC7hW9Cyd1ZCVS7UbK2iU45sxcDVmYMdh1MiM7zZCNHMGwyhweJgMyyczwfy5I
 kmHw==
X-Gm-Message-State: ANoB5pn5Jx7/87vQlLQFRJOrYye72RYgM628fY9kPeQojc3xIMqZEVu1
 zGbRNzLaFrbmPW88Y0mXLDR7cABXnHtFsNZJ+728UA==
X-Google-Smtp-Source: AA0mqf6K/loWDf6gEPPD+6VjHJZXYXH+Uqz6mfdnqU8g7iBWzsO3dLs+71EfuwIEbormn4UvaaFDfTRHeGU7vVhXFCA=
X-Received: by 2002:ab0:1432:0:b0:418:d13c:f3a4 with SMTP id
 b47-20020ab01432000000b00418d13cf3a4mr34683049uae.105.1669992922723; Fri, 02
 Dec 2022 06:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-7-jagan@amarulasolutions.com>
 <CGME20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15@eucas1p1.samsung.com>
 <04fb17e2-1b55-fbd9-d846-da3e3da4edb8@denx.de>
 <f33142de-862e-9775-b1c9-b871bb9a243c@samsung.com>
 <b66b44fc-5d4c-d3a8-8538-79003b14691e@denx.de>
 <CAMty3ZBfAY86fp7XxS9frrBiT9FRkJaNSRY-4CVpqGOvdpn1fw@mail.gmail.com>
 <58671662-9242-c7ef-53ef-60f9cdc3399a@denx.de>
 <CAMty3ZDVZJ6TjKjtq9wSHudmeD+7O1vB_j0V1xKjYGWnwMKa6Q@mail.gmail.com>
 <9f08a902-049c-1c00-7fed-3d7ee18b3d2c@samsung.com>
 <2ef1aae1-8ff9-22bc-9817-69d1eae8b485@denx.de>
In-Reply-To: <2ef1aae1-8ff9-22bc-9817-69d1eae8b485@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 2 Dec 2022 14:55:06 +0000
Message-ID: <CAPY8ntDH7QgLfg_MsXSeyD4uwiG7EHMd75qQA6SbDbO1P6ftow@mail.gmail.com>
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek

On Fri, 2 Dec 2022 at 12:21, Marek Vasut <marex@denx.de> wrote:
>
> On 12/2/22 11:52, Marek Szyprowski wrote:
> > Hi,
> >
> > Sorry for delay, I was on a sick leave last 2 weeks.
> >
> > On 28.11.2022 15:43, Jagan Teki wrote:
> >> ,On Sat, Nov 26, 2022 at 3:44 AM Marek Vasut <marex@denx.de> wrote:
> >>> On 11/23/22 21:09, Jagan Teki wrote:
> >>>> On Sat, Nov 19, 2022 at 7:45 PM Marek Vasut <marex@denx.de> wrote:
> >>>>> On 11/17/22 14:04, Marek Szyprowski wrote:
> >>>>>> On 17.11.2022 05:58, Marek Vasut wrote:
> >>>>>>> On 11/10/22 19:38, Jagan Teki wrote:
> >>>>>>>> DSI host initialization handling in previous exynos dsi driver has
> >>>>>>>> some pitfalls. It initializes the host during host transfer() hook
> >>>>>>>> that is indeed not the desired call flow for I2C and any other DSI
> >>>>>>>> configured downstream bridges.
> >>>>>>>>
> >>>>>>>> Host transfer() is usually triggered for downstream DSI panels or
> >>>>>>>> bridges and I2C-configured-DSI bridges miss these host initialization
> >>>>>>>> as these downstream bridges use bridge operations hooks like pre_enable,
> >>>>>>>> and enable in order to initialize or set up the host.
> >>>>>>>>
> >>>>>>>> This patch is trying to handle the host init handler to satisfy all
> >>>>>>>> downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
> >>>>>>>> flag to ensure that host init is also done on first cmd transfer, this
> >>>>>>>> helps existing DSI panels work on exynos platform (form Marek
> >>>>>>>> Szyprowski).
> >>>>>>>>
> >>>>>>>> v8, v7, v6, v5:
> >>>>>>>> * none
> >>>>>>>>
> >>>>>>>> v4:
> >>>>>>>> * update init handling to ensure host init done on first cmd transfer
> >>>>>>>>
> >>>>>>>> v3:
> >>>>>>>> * none
> >>>>>>>>
> >>>>>>>> v2:
> >>>>>>>> * check initialized state in samsung_dsim_init
> >>>>>>>>
> >>>>>>>> v1:
> >>>>>>>> * keep DSI init in host transfer
> >>>>>>>>
> >>>>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>>>>>>> ---
> >>>>>>>>       drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
> >>>>>>>>       include/drm/bridge/samsung-dsim.h     |  5 +++--
> >>>>>>>>       2 files changed, 20 insertions(+), 10 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>>>> index bb1f45fd5a88..ec7e01ae02ea 100644
> >>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>>>> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct
> >>>>>>>> samsung_dsim *dsi)
> >>>>>>>>           disable_irq(dsi->irq);
> >>>>>>>>       }
> >>>>>>>>       -static int samsung_dsim_init(struct samsung_dsim *dsi)
> >>>>>>>> +static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int
> >>>>>>>> flag)
> >>>>>>>>       {
> >>>>>>>>           const struct samsung_dsim_driver_data *driver_data =
> >>>>>>>> dsi->driver_data;
> >>>>>>>>       +    if (dsi->state & flag)
> >>>>>>>> +        return 0;
> >>>>>>>> +
> >>>>>>>>           samsung_dsim_reset(dsi);
> >>>>>>>> -    samsung_dsim_enable_irq(dsi);
> >>>>>>>> +
> >>>>>>>> +    if (!(dsi->state & DSIM_STATE_INITIALIZED))
> >>>>>>>> +        samsung_dsim_enable_irq(dsi);
> >>>>>>>>             if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
> >>>>>>>>               samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
> >>>>>>>> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct
> >>>>>>>> samsung_dsim *dsi)
> >>>>>>>>           samsung_dsim_set_phy_ctrl(dsi);
> >>>>>>>>           samsung_dsim_init_link(dsi);
> >>>>>>>>       +    dsi->state |= flag;
> >>>>>>>> +
> >>>>>>>>           return 0;
> >>>>>>>>       }
> >>>>>>>>       @@ -1269,6 +1276,10 @@ static void
> >>>>>>>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
> >>>>>>>>           }
> >>>>>>>>             dsi->state |= DSIM_STATE_ENABLED;
> >>>>>>>> +
> >>>>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> >>>>>>>> +    if (ret)
> >>>>>>>> +        return;
> >>>>>>>>       }
> >>>>>>>>         static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> >>>>>>>> @@ -1458,12 +1469,9 @@ static ssize_t
> >>>>>>>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
> >>>>>>>>           if (!(dsi->state & DSIM_STATE_ENABLED))
> >>>>>>>>               return -EINVAL;
> >>>>>>>>       -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
> >>>>>>>> -        ret = samsung_dsim_init(dsi);
> >>>>>>>> -        if (ret)
> >>>>>>>> -            return ret;
> >>>>>>>> -        dsi->state |= DSIM_STATE_INITIALIZED;
> >>>>>>>> -    }
> >>>>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
> >>>>>>> This triggers full controller reset and reprogramming upon first
> >>>>>>> command transfer, is such heavy handed reload really necessary ?
> >>>>>> Yes it is, otherwise the proper DSI panels doesn't work with Exynos DRM
> >>>>>> DSI. If this is a real issue for you, then maybe the driver could do the
> >>>>>> initialization conditionally, in prepare() callback in case of IMX and
> >>>>>> on the first transfer in case of Exynos?
> >>>>> That's odd , it does actually break panel support for me, without this
> >>>>> double reset the panel works again. But I have to wonder, why would such
> >>>>> a full reset be necessary at all , even on the exynos ?
> >>>> Is it breaking samsung_dsim_reset from host_transfer? maybe checking
> >>>> whether a reset is required before calling it might fix the issue.  I
> >>>> agree with double initialization is odd but it seems it is required on
> >>>> some panels in Exynos, I think tweaking them and adjusting the panel
> >>>> code might resolve this discrepancy.
> >>> Can someone provide further details on the exynos problem ?
> >> If I'm correct this sequence is required in order to work the existing
> >> panel/bridges on exynos. Adjusting these panel/bridge codes can
> >> possibly fix the sequence further.
> >>
> >> Marek Szyprowski, please add if you have anything.
> >
> >
> > Well, frankly speaking the double initialization is not a correct
> > sequence, but this is the only one that actually works on Exynos based
> > boards with DSI panels after moving the initialization to bridge's
> > .prepare() callback.
>
> Somehow, I suspect this is related to the LP11 mode handling, which
> differs for different panels, right ? I think the RPi people worked on
> fixing that.
>
> +CC Dave

Yes. I've just sent out a v3 of that patch set.

Hopefully setting the pre_enable_prev_first flag on your peripheral's
drm_bridge, or prepare_prev_first if a drm_panel, will result in a
more sensible initialisation order for your panel.

Note that host_transfer should ensure that the host is initialised, as
it is valid to call it with the host in any state. If it has to
initialise, then it should deinitialise once the transfer has
completed.

Dave

> > I've already explained this and shared the results
> > of my investigation in my replies to the previous versions of this
> > patchset. The original Exynos DSI driver does the initialization on the
> > first DSI command. This however doesn't work for Jagan with I2C
> > controlled panels/bridges, so he moved the initialization to the
> > .prepare() callback, what broke the Exynos case (in-short - all tested
> > panels works fine only if the DSI host initialization is done AFTER
> > turning the panel's power on). For more information, see this thread:
> > https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/
> >
> > Now, the more I think of it, the more I'm convinced that we simply
> > should add a hack based on the HW type: do the initialization in
> > .prepare() for non-Exynos case and before the first transfer for the
> > Exynos case, as there is no way to detect the panel/next bridge type
> > (I2C or DSI controlled).
>
> Let's see what Dave has to say about this, maybe there is some further help.
