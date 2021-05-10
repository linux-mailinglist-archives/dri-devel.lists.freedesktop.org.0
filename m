Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6218F37939E
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83626E898;
	Mon, 10 May 2021 16:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358146E898
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 16:20:26 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id b21so9424953plz.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0fWnbepkZzpOXZd5Aej2WwUh93xVx+Nhqui+NqMG42w=;
 b=eJUsSClChBveOTjxjQQ+bmWoecQYo3UAy1n/6GJMl++HeGQLcRlhEyapA7XW4zlZdQ
 YcsqGGsw4lOSRL5K0tBy+ZOjY6aWUCsv0iw92e9cdh0phgkSpdLoZrEsREIIlmd3KDzf
 2tY6aRxMKHQuS/YZL//pd5Yv2E+N09/DaIb7ZM5BngZDdxGQnJOTF75kHn8S0wfrs72J
 Y85sJ/cSWK+HNJUsrpydfTgc/bTTDFFnEK86hwnKi3P10Zj3GkIxq0RFclaq2orhjr8O
 BI/BLnaeXl1XcgJwHC5QB35X55iE8cdnkbfuFDbPvpny53P6kpfhSCGJigsq0Y6yKJVG
 Pv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0fWnbepkZzpOXZd5Aej2WwUh93xVx+Nhqui+NqMG42w=;
 b=IyPAahMW4UpMkrMPaYdXFJEQ5+B6Yg8JGxKys6tejecMRsb62umtGUmGgp0VUsHE4N
 M6fceyO0HNFQ8/DpXVtoD+lv3Ul3f37YoyG7gshazvbepsJmvlfH8+k15Ftbh3DooM9j
 dKVo5+YTFOJY3lzFPooeKIRtiC7/3/ZWlaCD2kAdEypw6EQTLupir3wIRqeJlebzSMK7
 kSiij9+72RjkeshoRWo6n0pLKKyFMEo1QyZqrS02l1Xs2qkwkhrRFpuEcM/qbV3xAPMI
 ds8H4libKM1b20+ZG5E3Xyl7iCt9uanhMvZ1mYrjX3nxkNdkeY+nu293WXd8Tt2onuX8
 c5zQ==
X-Gm-Message-State: AOAM533/lsr7JD5f7pa8uDEHqlr+Ao+bNWJUTLJW0i9I7bFfmgFCcMQU
 Wr3nKc5cB8IwlPk2n2OvioKFdVsTxSVzm85RHYxy9g==
X-Google-Smtp-Source: ABdhPJxUc61uV0PzwOO5GQyXabJ7EkGoObQ6Q+wiAfx+OxvyUE0V+UlwJ9niWyall6JkUFyEFsvYwXMSThRrfKTSX40=
X-Received: by 2002:a17:902:d2d2:b029:ee:fb71:c05e with SMTP id
 n18-20020a170902d2d2b02900eefb71c05emr25806031plc.13.1620663625728; Mon, 10
 May 2021 09:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201005134250.527153-1-marex@denx.de>
 <20201005134250.527153-3-marex@denx.de>
 <CAHCN7xJtnYHvLWkawYpi=BYbtfSrvHnNzqp767rOZjOGsAJV=g@mail.gmail.com>
In-Reply-To: <CAHCN7xJtnYHvLWkawYpi=BYbtfSrvHnNzqp767rOZjOGsAJV=g@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 10 May 2021 09:20:14 -0700
Message-ID: <CAJ+vNU2GU=dYznHjYvhWqS9fFssesj_Bg8HBW0891mcBB6WhvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] [RFC] drm/exynos: Add basic i.MX8MM support code
To: Adam Ford <aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 7:12 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Oct 5, 2020 at 8:48 AM Marek Vasut <marex@denx.de> wrote:
> >
> > This adds basic i.MX8MM glue code for the Samsung DSIM PHY.
> > There are still a couple of items which need to be sorted out
> > in drivers/gpu/drm/bridge/samsung-dsim.c before this can even
> > be merged, specifically:
> >
> > - The dsi->out_bridge is not populated until samsung_dsim_host_attach()
> >   is called, however samsung_dsim_host_attach() is not called until the
> >   next bridge attaches and calls mipi_dsi_attach(), and that only happens
> >   after the DSIM calls drm_bridge_attach() on that next bridge.
> >
> > - The samsung_dsim_bridge_mode_fixup() is needed for iMX8MM LCDIF to set
> >   the correct sync flags. This likely needs to be done in the glue code.
>
> Since you asked for an RFC, I
> I applied Michael's series and this series to 5.12 since we are so
> close on having the blk-clk and the power domain stuff working.  I
> also tried your patch for the ti-sn65dsi83 and the adv7511 on the
> Beacon imx8mm development kit.
>
> In both the HDMI bridge and LVDS bridge, I am able to get the modetest
> and drmdevice to return data that looks valid.  The resolution and
> refresh look correct, but I am not able to can an actual image to
> generate out to either the LVDS or the HDMI.  I am able to get the
> image to appear using the NXP kernel with the ADV7511 HDMI bridge, so
> that leads me to believe there might be something wrong with either
> LCDIF or the Samsung DSIM layer code.  I am guess it's the Samsung
> DSIM stuff since the LCDIF has been around for a while.
>
> I am not particularly well versed in the video world, but if you have
> something you'd like me to try, i am willing to try it.
>

Adam,

Try the patches Frieder had to make for his display from his git here:
https://github.com/fschrempf/linux/commits/v5.10-mx8mm-graphics.

I found I needed these for the display I have:
drm/exynos: Fix DE polarity for usage with LCDIF encoder
drm/exynos: Fix PLL PMS offset for P value bitfield

Best regards,

Tim
