Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B769D4ED92F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 14:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A51410F375;
	Thu, 31 Mar 2022 12:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D850C10F375
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 12:03:07 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so3423229pjf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 05:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8uwDRzbgvi8dTZ5DCIRCn+daSYKQ1V53jdPghIL4oIg=;
 b=tFkJihdOXiniuex1k/mCdmTWjzRFy84p2Ckd8GvxhgzUwUo1X/H7OY+y5/OvoOIivC
 B8v8SfOsv3wiVZhXq+HThNBwI037tvaRTzIaiIpU1Gj4eoUNHR6web65SFoAh9hodR1s
 XveZ2o2wLS1FiKou/xnNLaJLk/DaFY0YeX8UYtSkVio1vTdgjR9swX32rnWTCgNKPhmP
 FVtJfPjL6h9xxYiUlyZgjkMk0HuM+ByLeRACpRZswcPpw3zooCrDi14+TZkqRQTGzWPK
 pwVao7RnH0mc+GmcilKgiHI4hL42o5zvvjcqyD9A82z+S6JtgycC965lVlsaOSqQoLZd
 uUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8uwDRzbgvi8dTZ5DCIRCn+daSYKQ1V53jdPghIL4oIg=;
 b=D8dNVANnZW6G5umnlqhi0ekFPQ+P4fIekNshg88iWzNk9S1j7/r61uXRPA8Vp601qs
 5f+HaEU6tGdkCdbm+Yfep67oqUSOASCOiFjI2T0zLtvbn0umNxsiWSeD3JXbOzlRCb5g
 11D7VrzriP7H9d/nzr9YMwSv0mFc5+/hmCLyRIohWU6+L7Z61PcsLGp+NrtOU4cfhY56
 NLFa6Z/UuKez1S0XdfN1FvquXcyV8wSS3fXysVuu9g50yFK+791HLAnI8UoyCAkJ3ZQI
 z15DsK2Uhc1mNA/a/U6NcRQpHxKRwOFMcYs94Rpo1Q9lGxAiZGOw5AwisVV+JJwROxX0
 JZHQ==
X-Gm-Message-State: AOAM533uOh7rRhe6ZdJSnhPhwGBK8VPahxqLe/sPc+tpVkg0hQV/nZFq
 1lavIUOkKi8uI7Dc3p1nDJCsg8HacNHG6x2a27mElw==
X-Google-Smtp-Source: ABdhPJyxmZeBmiGfOxpZz1LUlwaCWjYjoseKnGitH2tPjwnW6kCjIWrK+20SucKZs6oClPsO57Ij2cJewj3rUMgpSo4=
X-Received: by 2002:a17:902:c94c:b0:154:45c6:fbea with SMTP id
 i12-20020a170902c94c00b0015445c6fbeamr5117688pla.117.1648728186735; Thu, 31
 Mar 2022 05:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220318184755.113152-1-marex@denx.de>
In-Reply-To: <20220318184755.113152-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 14:02:55 +0200
Message-ID: <CAG3jFyt1S3Rwx1t9BRvzy9zoPAwRr98_O-ovjHWHH+nN6b97qw@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] drm: bridge: icn6211: Fix hard-coded panel
 settings and add I2C support
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Marek,

On Fri, 18 Mar 2022 at 19:48, Marek Vasut <marex@denx.de> wrote:
>
> This series fixes multiple problems with the ICN6211 driver and adds
> support for configuration of the chip via I2C bus.
>
> First, in the current state, the ICN6211 driver hard-codes DPI timing
> and clock settings specific to some unknown panel. The settings provided
> by panel driver are ignored. Using any other panel than the one for which
> this driver is currently hard-coded can lead to permanent damage of the
> panel (per display supplier warning, and it sure did in my case. The
> damage looks like multiple rows of dead pixels at the bottom of the
> panel, and this is not going away even after long power off time).
>
> Much of this series thus fixes incorrect register layout, DPI timing
> programming, clock generation by adding actual PLL configuration code.
> This series no longer adds lane count decoding and retains current
> hard-coded lane count 4 due to disagreement over lane count parsing
> from DT. The lane count support will come later. The series also fills
> in a couple of registers with likely correct default values.
>
> Second, this series adds support for I2C configuration of the ICN6211.
> The device can be configured either via DSI command mode or via I2C,
> the register layout is the same in both cases.
>
> Since the datasheet for this device is very hard to come by, a lot of
> information has been salvaged from [1] and [2].
>
> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gpu/drm/bridge/icn6211.c
> [2] https://github.com/tdjastrzebski/ICN6211-Configurator
>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
>
> Marek Vasut (11):
>   drm: bridge: icn6211: Fix register layout
>   drm: bridge: icn6211: Fix HFP_HSW_HBP_HI and HFP_MIN handling
>   drm: bridge: icn6211: Add HS/VS/DE polarity handling
>   drm: bridge: icn6211: Add generic DSI-to-DPI PLL configuration
>   drm: bridge: icn6211: Use DSI burst mode without EoT and with LP
>     command mode
>   drm: bridge: icn6211: Disable DPI color swap
>   drm: bridge: icn6211: Set SYS_CTRL_1 to value used in examples
>   drm: bridge: icn6211: Implement atomic_get_input_bus_fmts
>   drm: bridge: icn6211: Add I2C configuration support
>   drm: bridge: icn6211: Rework ICN6211_DSI to chipone_writeb()
>   drm: bridge: icn6211: Read and validate chip IDs before configuration
>
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 486 ++++++++++++++++++++---
>  1 file changed, 434 insertions(+), 52 deletions(-)
>
> --
> 2.35.1
>

This series looks ready to be merged, could you fix the remaining
'checkpatch --strict' warnings that are applicable? Ideally the line
removal suggested by Maxime would be included too.
