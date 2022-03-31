Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 775E14EDCBA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B1E10E55F;
	Thu, 31 Mar 2022 15:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E648310E55F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:24:17 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id i11so12432501plg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xhxKgwP76Far9n81s98I79Y1uLVWi5gCu+TA3PoQE2c=;
 b=UK8LbTZT4WDc2JMzABSElX0v6C3idiwMpT22cdNqYguik4LzmVpnbDK2cPqNGQe2Mm
 kCuSIANQaJQBQKkrmDAoCvKasNzsMFVOf1NA9CCecFBVkQ3xVcEsmA1Ui5hJ0Dpf1uhP
 hE+U9Wo21nmpsF06b8bHSopE4bUAedXCOwRFDFwaRY94F1+3HdFJVHgWnANqETPTwiJs
 tU2F5ih+orZ/cidcq9wQ89gD6octhbQrMplmLVaMhQgfhfzEYFm2FJ3QRssdl0icFEe7
 sVQpFwdt33jPHMJZ6JOYsIkLV4SXGj221vTzzfHXF+zdBPr0guTM3UzIwnrDTYwOmoA2
 AbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xhxKgwP76Far9n81s98I79Y1uLVWi5gCu+TA3PoQE2c=;
 b=kSAMvsFbiJqCsJnDltz3EgReqKo/ojexyET1PsWl7nmWw33rVGNWD7q/v1r/od9E9a
 +b95glpjBAL2wgy2t6CYI3x69mp+1GE62YDjeHMtoEXLYRk2wUm0dVbrLbGwWh+7DqVJ
 L/rnHgBFXKCjzsiuZ1M1gv2I03tzAp2eRrDplt1fXJusUyYqHAPBVj3jChKVufKOjSHv
 e9+fFf+WqM/8Zuxx1419hw8iyCy5mh66B3vfuAY0tUa5n17D33KYr2UgC1FXkp6PcWwr
 0dTMRrm4ymCca/A5Aa5af+IzcEvp7haV7C+skguLfFV3GdQsEhMherHxVZeKsPkvtJFe
 7+Ag==
X-Gm-Message-State: AOAM531D5bRSBnBCttVgsnqsZlKJQI/utyQVJAi8vo7w5R2MfbZMcxV0
 decyJX9gIB+JChB3amvGyH9KHp1QYSbHvfT0+Iuk7w==
X-Google-Smtp-Source: ABdhPJzpdBeHS+vOPMn0WSYM+dGMeqZoahdg2u5AVYTYLzaW0WE4kG/q/KaRdJrDDnHv2Y6MJqL8vILnePR3wZcfawg=
X-Received: by 2002:a17:902:bb8d:b0:156:51a1:3f5a with SMTP id
 m13-20020a170902bb8d00b0015651a13f5amr5299425pls.65.1648740257488; Thu, 31
 Mar 2022 08:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220331150509.9838-1-marex@denx.de>
In-Reply-To: <20220331150509.9838-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 17:24:06 +0200
Message-ID: <CAG3jFyu6d2hGxJLv=yGAvb06m2-RQLw-aXu0uJKd+zqsJZOt2w@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] drm: bridge: icn6211: Fix hard-coded panel
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

On Thu, 31 Mar 2022 at 17:05, Marek Vasut <marex@denx.de> wrote:
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
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 491 ++++++++++++++++++++---
>  1 file changed, 437 insertions(+), 54 deletions(-)
>
> --
> 2.35.1
>

Applied to drm-misc-next.
