Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2CC3DABFA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 21:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F30D6E030;
	Thu, 29 Jul 2021 19:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9696E030
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 19:42:52 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id a19so4777403qtx.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 12:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=64yQslIW6W7QqPGTuD8FUE1efa8mhm9yDQIT6VE7nC8=;
 b=Yk0G8QEfIJq8Kf9ydFd0uXVVLhLzCdeUlUn2XOJVQOguVJscKeacurhDnkoO/G3iJm
 HrZLkrUIejU8w+NQzGBMToqbUONRa8UDrRAwh1pnk+bi0VPwirfSq8YlxHf11mFz9qZA
 PJKOvDYGwCGs5Z7+r/7nXEGZqEWvUEkQSTCVo7k2ukrkFK1gIdhhUXqFIHCaA9aB+Sbj
 oa/xdshjzSmFTxOaPdLa6WLwJL33LYXiicI9IcU8y2FTiY/2fAUOG3YMv3dotoLXtrRK
 P2VGJqenukf7m6qvqKP6rpO8gUg5f2pGmv2qejujVzN2FABKYq59/LcHMgfVSqneAr4w
 +8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=64yQslIW6W7QqPGTuD8FUE1efa8mhm9yDQIT6VE7nC8=;
 b=XAimBOBGNRnCkUYpD7zQ0EWtWnylqmOQpraqXQYwfGw0+zb3xAmVUda4MaUlne1dB0
 oSVtm4L6gfZz/rg41KNTzc4FiVvArJI8vWb/MjIRJQtcvsIGr/fRGoXWvL1hREJmjhTq
 GmgMcFfIa1XFkWzleVH1zAhb5ZI5zJGKsOFQCzZ0huKNyV4eA2H3neQub1dtrb0BwFhx
 tvNP0ZWJm5UFYAiJ5L7Xvn9ioB3Jef2cvzqQq1GDzQou2CgkvSFx7xZCWCYUS4a1z/80
 WJ68Scgnyf2YNThcaOX85WBjg/jB+hMda06UpZWmbLi5CgKUpaGx2OVKoVJZNkWkkhq+
 c5Aw==
X-Gm-Message-State: AOAM532Z31GQSXS5zJElCfUZ0OmKl5/XM1uEdSCXmx8W1aN1tLb7Cy2T
 1nSeLGIAvW6Q7ejkiifVSZH7/A==
X-Google-Smtp-Source: ABdhPJzpbNXETkFkSSyKK2tzWyQADm607VDPajsOrlr0a7VYaR6XFHEiudYACcvx9lTufqmd4Nlq5Q==
X-Received: by 2002:ac8:51ca:: with SMTP id d10mr5650540qtn.97.1627587771113; 
 Thu, 29 Jul 2021 12:42:51 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id u7sm1688689qta.27.2021.07.29.12.42.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 29 Jul 2021 12:42:50 -0700 (PDT)
Date: Thu, 29 Jul 2021 15:42:46 -0400
From: Sean Paul <sean@poorly.run>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 0/6] drm/panel: atna33xc20: Fix the Samsung ATNA33XC20
 panel
Message-ID: <20210729194242.GB31127@art_vandelay>
References: <20210728164557.1882787-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728164557.1882787-1-dianders@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: narmstrong@baylibre.com, airlied@linux.ie,
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, a.hajda@samsung.com, thierry.reding@gmail.com,
 Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, jernej.skrabec@gmail.com,
 devicetree@vger.kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 linux-arm-msm@vger.kernel.org, steev@kali.org, rodrigo.vivi@intel.com,
 rajeevny@codeaurora.org, linux-kernel@vger.kernel.org, robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 09:45:51AM -0700, Douglas Anderson wrote:
> 
> The overall goal of this series is to make the Samsung ATNA33XC20
> panel work more properly. As part of this, we have:
> * A bugfix for the recently abstracted DP AUX backlight code.
> * A bugfix for the sequencing of the ti-sn65dsi86 bridge driver.
> * Removal of the panel from panel-simple and moving it to its own
>   driver.
> 
> If the bugfixes look good but the rest of the series needs work then
> those could land early on their own. There's no real compile time
> dependency on the bugfixes, things are just glitchier without them.
> 
> NOTE: this series will (slightly) conflict with my other recent series
> making eDP panels probable [1]. The conflict is easy to resolve and
> I'm happy to repost either once the other lands. It should be noted
> that the fact that the Samsung ATNA33XC20 needs its own panel driver
> means that it _can't_ handled as a probed driver. I think this is
> fine, at least for now. I don't think it would be easy to make a
> unified design with this panel and other panels given that it's an
> AMOLED panel and has a whole bunch of different components on board.
> 
> [1] https://lore.kernel.org/r/20210723002146.1962910-1-dianders@chromium.org/
> 
> 
> Douglas Anderson (6):

Hi Doug,
Thanks for the patchset, it all looks to me.


For all 6:

Reviewed-by: Sean Paul <seanpaul@chromium.org>

Sean

>   drm/dp: Don't zero PWMGEN_BIT_COUNT when driver_pwm_freq_hz not
>     specified
>   drm/bridge: ti-sn65dsi86: Fix power off sequence
>   drm/bridge: ti-sn65dsi86: Add some 100 us delays
>   Revert "drm/panel-simple: Add Samsung ATNA33XC20"
>   Revert "drm/panel-simple: Support for delays between GPIO & regulator"
>   drm/panel: atna33xc20: Introduce the Samsung ATNA33XC20 panel
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  17 +-
>  drivers/gpu/drm/drm_dp_helper.c               |  10 +-
>  drivers/gpu/drm/panel/Kconfig                 |  12 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 366 ++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c          |  61 ---
>  6 files changed, 398 insertions(+), 69 deletions(-)
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> 
> -- 
> 2.32.0.432.gabb21c7263-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
