Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF8420265D
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 22:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F213E6E353;
	Sat, 20 Jun 2020 20:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966E56E353
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 20:21:34 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z9so15177433ljh.13
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 13:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BWp0+qDm6D8+3mdyev80e+srYJlNGDQfDI6Ux1DPKEI=;
 b=qotg/ZeXIPMehWBAckg+OzF18WAadLD8hI2ucC1ErHAe3OF4T+ewG7b8UnXqPIrCJC
 NffQkxDyfJdTqZmnpSmScWrwE3vt69gKx1J5R+fiooBvd8reKOQJAOwDL2Er7dHcbG6r
 ujq99H01r7tEQL1RJapvL6hnCqnbi+U0YbRbTY5A4z9aOGUisYrUTF7uERjFvLEEhzQS
 r8WayBPRqSkjkZSvNs7AVxa4Zk7i7rM1CTDjSYTmrezr0UmbashCHAKHJQWIKZ5B8F6h
 50FhDx0XlT5NpnjJ09s6t9wAMWaJCWA9kl1w5ZXxh0f6MAzLvg7sK4mfjwEQKnbMHk3l
 H7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BWp0+qDm6D8+3mdyev80e+srYJlNGDQfDI6Ux1DPKEI=;
 b=IKn4nFx8kQdMnpXxYNxAMTaIpFgrCjIG7w8uWHNbeSNhe/E2MVNAezRFyRN1r4EYDF
 ESM2CnLrhcmPygUwcdukEzSAGAO/eTXbpzJuYoEBb88EtDZxbEcMF+gpvesvbMrRiWMh
 GM+XdI5eetRMspTgB6NEcLPNSDBrzlccTM7Arc5n9lDaJvjaFW/CvUYKGKX0y7Tfw3l5
 A7gx/NGrAZJknHSiMdLzpkHT/3JwzdqABOsGMsgC5u6ZttzuZ6wgM8Jw9x1wJ5nXr1Rm
 NUwubGtMRqM5vq4s5d5tXWKlMvlKqVZzcC1kOq5uXwZvyyeMqsj1zKqxZwmRg2GAYC8Q
 5O1w==
X-Gm-Message-State: AOAM531oB6mHFuEo0rQq20tMmbBHY6d3f0W1TjV67ggk+9oQUvDLfDv7
 ALsbnBL0renue37c4tmMRggijHPs3wjkobewwKH+TA==
X-Google-Smtp-Source: ABdhPJwztfJNiEkx5aQDaLYvFXoWh6IYZzLs+Pbi4Vm2pTrzkcb2BWJegviTjlgMxkuZFcxtSjiCvDT0ZWRTDHcS7BU=
X-Received: by 2002:a2e:351a:: with SMTP id z26mr4729522ljz.144.1592684492809; 
 Sat, 20 Jun 2020 13:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
In-Reply-To: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 20 Jun 2020 22:21:21 +0200
Message-ID: <CACRpkdZ+8B2hRDrBjA5uB8zneodE53ea9RJn1G33hJSJptShSQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Don't compile GPIO bits if
 not CONFIG_OF_GPIO
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, kernel test robot <lkp@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Sandeep Panda <spanda@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 8, 2020 at 7:48 PM Douglas Anderson <dianders@chromium.org> wrote:

> The kernel test robot noted that if "OF" is defined (which is needed
> to select DRM_TI_SN65DSI86 at all) but not OF_GPIO that we'd get
> compile failures because some of the members that we access in "struct
> gpio_chip" are only defined "#if defined(CONFIG_OF_GPIO)".
>
> All the GPIO bits in the driver are all nicely separated out.  We'll
> guard them with the same "#if defined" that the header has and add a
> little stub function if OF_GPIO is not defined.
>
> Fixes: 27ed2b3f22ed ("drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Fair enough,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
