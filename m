Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75276370719
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 13:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6406E192;
	Sat,  1 May 2021 11:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5ECA6E192
 for <dri-devel@lists.freedesktop.org>; Sat,  1 May 2021 11:59:18 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id 2so1103316lft.4
 for <dri-devel@lists.freedesktop.org>; Sat, 01 May 2021 04:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QLxSp/ePlciHnCzVMGdXgyEZo0R6BmfwYtxDKjI/pqU=;
 b=jcIi+kb7+jywxzREwePLOZyikDcoPK0Z0M1f/JhBnLif3jWV6ATJl0nXzhuKTa72Qm
 PQMeKbrrwBH5qU6RcI+NNhRgPjaBrwIYgPMpQvGGv4MtxK1r7IIEWX/CQ02RVRl1iFbP
 P42ki89fVr+tczmJUY02sjARyeOt/wHldYK1fffQ9dF5dcWQqYv7a03b2KoKkb/yXUB7
 czOvMyriPuA18ukQogxg9Z3Yk57cksDHyHt43PE/7IA3zPwZH4HW8aFNpNk1EGarsOXl
 pUjfQOfyivF2OAuny4eJEDvj7wVkpPBX0oatWIhPAKVSouQyEufzyxJr1bzere5HjMFs
 edJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QLxSp/ePlciHnCzVMGdXgyEZo0R6BmfwYtxDKjI/pqU=;
 b=G1tpgGBZ1nS2oop7NAFf4iwpOhsFQNxNw20/PTruvozVbWoWb5Jz/TtWvUC5Vkj4yF
 S6g6YqHp0P2UIBEmD/tpfr6NNUTwhcDDUEARvCS4JJ8c5QX69tkI5KxKV0ENUb5UF5+p
 JiXWy0YTX/kUfcyXiomVodtJtVrIrRK5USybxZwA8G6q1q1vWDW0yHTPFw9ybVw+2yKA
 zmPlprbOEE2YK/GuF0Cb92f4N6q2UGpriLMBvINN09P1a3+vBP1fZQzdQ2alsggUfpgQ
 7vVWjwKNKW1fwNUlGRYXEWrlIX1WJF4sjtmzKtReVNGxoBTBpeCxTz+3mJfnIN4ig9a0
 WRTg==
X-Gm-Message-State: AOAM530g6GaDKYhhsgbU2xklkd7fc6UGXDxjEaJ8kMfQzJ+5VM2Q1o1l
 ntfSQ9LhcXidRhXEuyfT4i9h1ndg7jyYQuASgPGUCA==
X-Google-Smtp-Source: ABdhPJw+F9WmElJwhUk24Nw7bpvwEd3U15o9b5hWV9qrpBy3C0X7Zj7MCbUNd4hF1kIE4C9w9FMOjoMDoXiThg28GGk=
X-Received: by 2002:a05:6512:3e1f:: with SMTP id
 i31mr6880595lfv.29.1619870357179; 
 Sat, 01 May 2021 04:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.9.I3e68fa38c4ccbdbdf145cad2b01e83a1e5eac302@changeid>
In-Reply-To: <20210423095743.v5.9.I3e68fa38c4ccbdbdf145cad2b01e83a1e5eac302@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 1 May 2021 13:59:06 +0200
Message-ID: <CACRpkdbZxauBFLvR_MMx4WD+K6DftK19Fivt_mkE=+Xr2EPUvQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/20] drm/bridge: ti-sn65dsi86: Break GPIO and
 MIPI-to-eDP bridge into sub-drivers
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
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Wolfram Sang <wsa@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 6:59 PM Douglas Anderson <dianders@chromium.org> wrote:

> Let's use the newly minted aux bus to break up the driver into sub
> drivers. We're not doing a full breakup here: all the code is still in
> the same file and remains largely untouched. The big goal here of
> using sub-drivers is to allow part of our code to finish probing even
> if some other code needs to defer. This can solve some chicken-and-egg
> problems. Specifically:
> - In commit 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for
>   delaying prepare()") we had to add a bit of a hack to simpel-panel
>   to support HPD showing up late. We can get rid of that hack now
>   since the GPIO part of our driver can finish probing early.
> - We have a desire to expose our DDC bus to simple-panel (and perhaps
>   to a backlight driver?). That will end up with the same
>   chicken-and-egg problem. A future patch to move this to a sub-driver
>   will fix it.
> - If/when we support the PWM functionality present in the bridge chip
>   for a backlight we'll end up with another chicken-and-egg
>   problem. If we allow the PWM to be a sub-driver too then it solves
>   this problem.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v5:
> - Fix module compile problems (Bjorn + kbuild bot)
> - Remove useless MODULE_DEVICE_TABLE (Bjorn).

This is generally a good idea. I have no idea when to use
auxbus or MFD but I trust that you researched that so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
