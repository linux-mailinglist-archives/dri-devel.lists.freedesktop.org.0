Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258A85A53F6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 20:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B0410F557;
	Mon, 29 Aug 2022 18:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E4710F585
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 18:31:04 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id t5so11240129edc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 11:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=0apWzmbxZ6VSMOSdxKLI7EIdOM+xw2GQX81OaATu8Xk=;
 b=VQm2vxWIVG7VhOXm+l44OyLuO1EGS2doyKKeO+pYoldh+F5GQvYH+xdT6VQwFrTLK7
 9+p7YwwPXammzdBtQTFvM04ovVkcdB9vAteGSZDSyH+WsVg1uvfVvn5kOi0Hp5EqWurs
 ZVj0xlbW+Bpo7kr0mJHWYY32+JgIhit+X1/Fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=0apWzmbxZ6VSMOSdxKLI7EIdOM+xw2GQX81OaATu8Xk=;
 b=pWyW79NlwQ+hEVU1mFmWTmrwkVAOq3g8nl/BqluEayD3K5Bhfe8HTFIEUsaqEYPuRD
 k7xAd7S9u2NfLqgarBKjUAWiw642vy7jSfETPOFm57uhMU8FVvOEFR8C/z6qJ0kr7bCg
 gjmHVRMBOwErZrDZ1cZUk3Monc/UGVHIPzr7dVoLoeltZe6L4DA7W86zUYrERgD7FC8Y
 qW2UigG6Jg0U4KZLAu2AiR+sJgMj2zPppeyLJXsYaeAcaknO5wuSchi0MshapghRqNE2
 K9vGDj9PEyPoQvW+/DtvJCmw4v4Gdy/U3CtAJbFLWVqDHogufB7soPUKVbvfJM2Cq6RD
 ThxA==
X-Gm-Message-State: ACgBeo1cQootuzh2di/KRg9MZkI18Bo2x77zL2oFKIOsSRBPYer61tOt
 jRI/AR09PRaOHkdbc5OcPlRxT+Ey4uJm4DTocObv/g==
X-Google-Smtp-Source: AA6agR444uPYW0vCPhT+kHRjNy4qs7ja3fkxUys6kNXipAnb61aEE8/q1huyMzG1RZWXLvlDG7gao1/Wl3uyjiJsD8o=
X-Received: by 2002:aa7:cdc5:0:b0:447:91ef:a3cd with SMTP id
 h5-20020aa7cdc5000000b0044791efa3cdmr16933133edw.168.1661797862702; Mon, 29
 Aug 2022 11:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
 <CGME20220720155316eucas1p2ab58c67670ef8f30f0827fdbe5c41ef2@eucas1p2.samsung.com>
 <20220720155210.365977-7-jagan@amarulasolutions.com>
 <8598bc48-ab5d-92fe-076a-c1e6ca74fccd@samsung.com>
 <CAPY8ntCrOqYbE7X5vCP7xa9xqJY8RwpO68hWhg1UuYusd3EQCA@mail.gmail.com>
In-Reply-To: <CAPY8ntCrOqYbE7X5vCP7xa9xqJY8RwpO68hWhg1UuYusd3EQCA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 30 Aug 2022 00:00:51 +0530
Message-ID: <CAMty3ZC0pfwHff8Q0Dhh5iyipVmYVo3Gb6zEgEh7x9hQcK=oJw@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] drm: bridge: samsung-dsim: Add DSI init in
 bridge pre_enable()
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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

Hi Dave,

On Fri, Jul 22, 2022 at 9:35 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Jagan and Marek.
>
> On Fri, 22 Jul 2022 at 16:35, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >
> > On 20.07.2022 17:52, Jagan Teki wrote:
> > > Host transfer() in DSI master will invoke only when the DSI commands
> > > are sent from DSI devices like DSI Panel or DSI bridges and this
> > > host transfer wouldn't invoke for I2C-based-DSI bridge drivers.
> > >
> > > Handling DSI host initialization in transfer calls misses the
> > > controller setup for I2C configured DSI bridges.
> > >
> > > This patch adds the DSI initialization from transfer to bridge
> > > pre_enable as the bridge pre_enable API is invoked by core as
> > > it is common across all classes of DSI device drivers.
> >
> > This is still problematic in case of Exynos. Without a workaround like this
> >
> > https://github.com/mszyprow/linux/commit/11bbfc61272da9610dd5c574bb8ef838dc150961
> >
> > the display on the all real DSI panels on my Exynos based boards is broken.
>
> I'd queried on the other thread trying to address DSI operation [1] as
> to whether the test for STOP_STATE (presumably LP-11) at [2] was
> actually valid, but had no response.
> There is no need to check for bus contention at that point, but should
> it happen the driver doesn't write the registers in lines 862-868
> having returned -EFAULT at line 853. The controller is therefore only
> partially initialised.

Can you link me if you have any updated series on this? or the
existing one is the latest one itself?

Thanks,
Jagan.
