Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E055A6637
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 16:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AE810E0F8;
	Tue, 30 Aug 2022 14:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9611610E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 14:24:21 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id lx1so22454032ejb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=A9MdfBpTYZweRzcx0dE2DjVkPmCEU7qIzUPOygK0u3Y=;
 b=PrJpNjXxS/kHCmg3zADO3pAI+WRrI0XP21sq/wz47VAQ12xjjbncXLYGJX1VNayTfP
 E44HTE0ac5ORJCWKKgbbUJEzGDuioC/WEw2weUoosz7sWiz47vB/VI1XZgE3T3WirnPy
 sVnkKTRtZs2v4sna9FAaGbnbeBiraaCXZKNxa4487kpet5gJlU0ad7Ws8PUcXUOZBLxj
 feLvciPzn4g4AzPPjpp2G4tH2l/pXRCEggUv05W+qHGFmpL2bDDY4MMr6de6HeSqxcur
 5+6ZATGsB5GGFFzm+6Elb/j2UELv3Fj2GK9JpUaGgbDb1LRVbr50yklz3qUyCZkXndcI
 GQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=A9MdfBpTYZweRzcx0dE2DjVkPmCEU7qIzUPOygK0u3Y=;
 b=DxJdZ+gRNdUyQAPvmGioAehywH+oiMTboWcwEYC+oazY/iRMjpmZ6OE7lkA25tweNg
 dt8RqDV5msPaOl1XoNt17Lvpy6eEl1d0zKW3k1eEut2wJHVKEGb/WO2kPtoNtyNm1X/V
 bhS/72IbHk05lu36/FRppymUj3vaXsOMU/rZ4B2QrhXSih7+oCvHExMpIgJmJzLrVE3G
 yU7mzKD8Weh53bL1wzoq+3bn/XbtTgXpoWi2m9wHZRUURTWHxVvbwXRWERtkA/H5jvFW
 NbMPWKCBXlbQALm92MUgCBe8NIe+6lWmx7dp0Zj/YPpl5SazP4DM4Bk5/cOPnpUrTWl3
 pMow==
X-Gm-Message-State: ACgBeo22bvT3lWekQJ+0k9wnxjYvJwRDSmf4ewqpIXD3i4TO6ilgi1gV
 Fj8UfH2v6T4PvXzSPzlNC+Xr8JvLaaAir6c4Z7UuWQ==
X-Google-Smtp-Source: AA6agR6rk/3ZCEAGhGdlEIe1iBV/6Pk7Zr4lQyB2xbohhGWKkJSMTywMD4pMVUuVfGgD/C21Z09ZtrsmM/DDKQ/lUnY=
X-Received: by 2002:a17:906:8a74:b0:73d:d6bd:660b with SMTP id
 hy20-20020a1709068a7400b0073dd6bd660bmr16584196ejc.200.1661869459972; Tue, 30
 Aug 2022 07:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
 <CGME20220720155316eucas1p2ab58c67670ef8f30f0827fdbe5c41ef2@eucas1p2.samsung.com>
 <20220720155210.365977-7-jagan@amarulasolutions.com>
 <8598bc48-ab5d-92fe-076a-c1e6ca74fccd@samsung.com>
 <CAPY8ntCrOqYbE7X5vCP7xa9xqJY8RwpO68hWhg1UuYusd3EQCA@mail.gmail.com>
 <CAMty3ZC0pfwHff8Q0Dhh5iyipVmYVo3Gb6zEgEh7x9hQcK=oJw@mail.gmail.com>
In-Reply-To: <CAMty3ZC0pfwHff8Q0Dhh5iyipVmYVo3Gb6zEgEh7x9hQcK=oJw@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 30 Aug 2022 15:24:04 +0100
Message-ID: <CAPY8ntB3WwwWBLrJ9T_Zxc=K1PidmJo1pKYQP8UoeFaG0iuh_A@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] drm: bridge: samsung-dsim: Add DSI init in
 bridge pre_enable()
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan

On Mon, 29 Aug 2022 at 19:31, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Dave,
>
> On Fri, Jul 22, 2022 at 9:35 PM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Jagan and Marek.
> >
> > On Fri, 22 Jul 2022 at 16:35, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > >
> > > On 20.07.2022 17:52, Jagan Teki wrote:
> > > > Host transfer() in DSI master will invoke only when the DSI commands
> > > > are sent from DSI devices like DSI Panel or DSI bridges and this
> > > > host transfer wouldn't invoke for I2C-based-DSI bridge drivers.
> > > >
> > > > Handling DSI host initialization in transfer calls misses the
> > > > controller setup for I2C configured DSI bridges.
> > > >
> > > > This patch adds the DSI initialization from transfer to bridge
> > > > pre_enable as the bridge pre_enable API is invoked by core as
> > > > it is common across all classes of DSI device drivers.
> > >
> > > This is still problematic in case of Exynos. Without a workaround like this
> > >
> > > https://github.com/mszyprow/linux/commit/11bbfc61272da9610dd5c574bb8ef838dc150961
> > >
> > > the display on the all real DSI panels on my Exynos based boards is broken.
> >
> > I'd queried on the other thread trying to address DSI operation [1] as
> > to whether the test for STOP_STATE (presumably LP-11) at [2] was
> > actually valid, but had no response.
> > There is no need to check for bus contention at that point, but should
> > it happen the driver doesn't write the registers in lines 862-868
> > having returned -EFAULT at line 853. The controller is therefore only
> > partially initialised.
>
> Can you link me if you have any updated series on this? or the
> existing one is the latest one itself?

I've not updated my patch set as I didn't think there had been any
significant review comments to action -
https://patchwork.freedesktop.org/series/100252/ is still the latest.

Sam had suggested changing upstream to prev/next, but seeing as no one
else has expressed a view on that I didn't see much point in
respinning. If others agree with Sam, then I'll do it.

Checking I do note that the suggested change to drop
drm_bridge_chain_* API has been done by Sam. I don't see that having
been merged, but once it is patch 1 needs to be dropped / reworked.

I don't have any Exynos hardware, so can't really help out on the DSI
issues there other than making suggestions by inspection of the code.

  Dave

> Thanks,
> Jagan.
