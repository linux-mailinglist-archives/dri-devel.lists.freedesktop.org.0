Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35850A075E0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5566E10EDA5;
	Thu,  9 Jan 2025 12:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kpBe3zKW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2405210EDA5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:39:17 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso816776e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 04:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736426355; x=1737031155; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+fqi2sB9Eo33cd+pF6AS06tGvsYXM7VDT81xCwEBraw=;
 b=kpBe3zKWhI860DJZ9e2NE2yTz8KWdg2NHBC8AjPVvorp+K4pW1LZIi4JBEd5saxHeR
 /P3hWzgoSkh5XdufiKjbtYVj99d7QZmwKsrqSVp51BpEMCErAOvoR2X1O/IUI7BrdC3S
 YwOL9sUdu4hbPHyxSY2kNRdmAgmpSP51F/rLW52Uz43vfdUE2aWSi2PDuWTIKS6azPVK
 dNpSUv8BTrZV1CB3kJIOGIiY7CCFF1mV15DWLORYyNCI1+Ho545UJoIEcQ5b7bZdGexx
 8NpEJh8UtdKAti6ykJOWhNPTu9WPfFdxaCvEUoKIQm18bybr6szjwSP64wpHd+QJxDla
 Mwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736426355; x=1737031155;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+fqi2sB9Eo33cd+pF6AS06tGvsYXM7VDT81xCwEBraw=;
 b=KekekNv0Vhq/WHRqgYW4XABqCnVxTTUohJtmnT9j3Z5N8cb52g2hIjSNGd77AU74o9
 wTOFLBbvzNbCm2pleT+nAHJnEztuwF/byC698laHNzqyU5Q+/hkGOxc8wZvWJ3I/KmPA
 L4+igRQYM5Tj07wRV8R1IjSX3lJlWWgzdrzLTFXH/9ipivCATF1T6ZvIFwJLh3QhVp3y
 lNbvhb6Odcv6i+aI/HKvrwVYCaP8FA8VWW/1cqb+2/V0G7BJWtcNHitmtzex8cfHTZUl
 9xHWxFKq2Sr4mnOyKm2H/QVe6z0m8HWbZCHUW8OWXFLRIg09ahKTn9U8UfXqnLFVIGx4
 zSNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/1kehNBMstInIlBhNlmzwJEyiZYVayhLPnL2ugpzdpRGc9pDZ1YwW156YKv6uD5icFniOkH6Mvfg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGxGjMSUFnpGjqAy5jHqP761M39NudUm2aK5YkrHLXp3jS47P3
 Kx6WqFK78WMgxl3jgjAXjgYjTrg1Wm3C0K4TWtfExpzHvoMwEk2L6ICDsJRCVYg=
X-Gm-Gg: ASbGncvHf5BV4tJy4lcaciyFORJAeKPXx/iyNIJlqLSBEeq1wNsAmXKT1TVutVcZR8u
 lEeE0yLZBg1ImgH5PjD/lc5srQMkYA3bMMfbG93ebsV6KwvWNsnJdjLHLgOMYqw/UphnZzgHOiy
 NZcAtpTENBA+7rnY0ZHZZaQA7QaSYc7SM6kNFeF26XRggiVql7efxHHB0jCX6dg5BGi8GVljzYQ
 khRl4IGkzlpI2lnCMAJrjP1/j8+7rL2zBnD7Up85at6R/j2ruZGF2pzNHRerlrI3tYO39Y62fNt
 rUb/TL/bEnuJMe3MNqQBEed364phgSNUj8bc
X-Google-Smtp-Source: AGHT+IF8KTbR4QB2nrxLqa6lQMCAzL4XCQ4k/7mYRphIWqgLup+TimV/WVu8MCf6LAMcOCZjoERp1Q==
X-Received: by 2002:a05:6512:1242:b0:542:8da7:242f with SMTP id
 2adb3069b0e04-5428da724c7mr359076e87.10.1736426355407; 
 Thu, 09 Jan 2025 04:39:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea686dsm187270e87.156.2025.01.09.04.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:39:14 -0800 (PST)
Date: Thu, 9 Jan 2025 14:39:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 04/20] phy: phy-rockchip-samsung-hdptx: Add eDP mode
 support for RK3588
Message-ID: <kanqmwi4yzmqjxyxbd3ccmabitko3zfgockmhx22swz46zeqz2@klq3dkaukrxz>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-5-damon.ding@rock-chips.com>
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

On Thu, Jan 09, 2025 at 11:27:09AM +0800, Damon Ding wrote:
> The PHY is based on a Samsung IP block that supports HDMI 2.1, and eDP
> 1.4b. RK3588 integrates the Analogix eDP 1.3 TX controller IP and the
> HDMI/eDP TX Combo PHY to support eDP display.
> 
> Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
> pre-emphasis configurations of each link rate are set according to the
> eDP 1.3 requirements.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Add the module author
> 
> Changes in v3:
> - Split this patch into two, one for correction and the other for
>   extension
> 
> Changes in v4:
> - Add link_rate and lanes parameters in struct rk_hdptx_phy to store the
>   phy_configure() result for &phy_configure_opts.dp.link_rate and
>   &phy_configure_opts.dp.lanes
> 
> Changes in v5:
> - Reuse the existing functions rk_hdptx_phy_consumer_get() and
>   rk_hdptx_phy_consumer_put()
> - Return 0 instead of -EINVAL in rk_hdptx_phy_configure()
> - Remove rk_hdptx_phy_lane_disable() and related check of 0 lanes
> - Mention the design details in the commit message
> - Remove unnecessary rk_hdptx_phy_set_mode()
> ---
>  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 879 +++++++++++++++++-
>  1 file changed, 869 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
