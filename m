Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC16E373BB6
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 14:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE9A6E440;
	Wed,  5 May 2021 12:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DEA6E440
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 12:51:27 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id u20so2257237lja.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ZKINt+24vkgq+jtEeRzmpva+N3VhWpG25a6HCCDQLg=;
 b=lsqTsl7XXHy6S6on3u5XAyk4I5ko7hEiejMokpIADhU8TTGOHuBxi28EfYt8Jf7FV/
 OnGwPXxfbb2dKPzov0N0V6NLD0nonHQEVWfTyW02sRnjp85USPGekyOLAQKJFWp9fF8E
 hqkQ/ym/tBF1B6XEQnez1qYEpgs7V6bTtplIPN8B/Ji0Uc1VvPaIIJbB6dxkhLrH3AqL
 3UtMnEuE9F6FZUX2A6rX80PBuBmh84a54AcIhfZ3QZ8F4adFMGl4Pe5TjEyqDS5EGFmn
 on3hpo4FRiMNfsvx4bzbW3vZtc2TN6Ndl2ZTM44H5dPIxkf925BYAYWpGTMK9970dbWN
 jpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ZKINt+24vkgq+jtEeRzmpva+N3VhWpG25a6HCCDQLg=;
 b=FZ+LoOke6TzBJaONGipjZTttIJcCZU6uIbGmxWjRRn2QtTlgEGYWrHfHiq2cZlP6d3
 L0hZQbICU1MoES7Ol1M4Gtl2/2LfJZmjTPkxCUt2TvGe9Al/TdutmvIzsVZ7oHTvk5Lz
 VykYZkn0Zvq6Wa3O29dSqK0OU2cJbqEwEu6hHdW1DMUaHE0isSPSJUmJm9YpBPCOnSIq
 Gc6pDmM4NQa7EOxLFSbHi+aJPejp/iwtKz/kpGXTY0eyUCzv/kqigccFXXjd4j0xX9P0
 xRy6ULm8pm4HVkihZfYZq/W4CD7Km4cdVVCX0hNvIVWa3O0PyXPoH6ECQcMwiIhV6+0J
 ORHg==
X-Gm-Message-State: AOAM531SY9Kn0GzZxdx2XtAEKWoQr5uvQzhL4XYvya0oz1Jnxath8nHh
 /AksW1UaU/90mMGClg3XGOSprxsNZzBQ3QurwArm6w==
X-Google-Smtp-Source: ABdhPJyQJiePbgT7/Tp3x1+jnfQmk7ukJ4HB+fh/IcgCx7MW+Kkyq/ARSBbLSXWU82nXtNazzReNnDeM6ZGufQXDZ/A=
X-Received: by 2002:a2e:a54c:: with SMTP id e12mr21964567ljn.326.1620219086062; 
 Wed, 05 May 2021 05:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
 <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com>
 <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
 <CACRpkdYfugrJ4WGn=w+viGXE6s5cdHjLC++jHPLVy_QH09KA8Q@mail.gmail.com>
 <CAD=FV=XXxTz8hi92y6p3hX7iVEHuqKHsrKPSnX_a__WCEQRAKw@mail.gmail.com>
 <CACRpkdZVH=h37hSjvjcNmRwV-RoBB-nvUbrOT80DoLr7n81R3Q@mail.gmail.com>
 <CAD=FV=Vzn0ih_RqR_ySJzFtq0B0x_4a-Uwjk56GeLyUZtTEXrQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Vzn0ih_RqR_ySJzFtq0B0x_4a-Uwjk56GeLyUZtTEXrQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 May 2021 14:51:14 +0200
Message-ID: <CACRpkdbOpJtoaX7Jayr1-QRvZOjKbt-D0XVy+Xvxga9RULoh1w@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
To: Doug Anderson <dianders@chromium.org>
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
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 3, 2021 at 10:41 PM Doug Anderson <dianders@chromium.org> wrote:

> > At your convenience and when you think there is too little
> > stuff in your sn65dsi86 TODO, check out
> > pinctrl-bcm63xx.c for an example of select GPIO_REGMAP
> > made very simple (this works fine as long as they are bit
> > offsets starting from 0).
>
> I seem to recall you mentioning something like this. When I looked at
> it in the past I wasn't convinced it would be easy. See my response
> [2]. The rough summary is that I didn't think the helpers were happy
> with the pm_runtime() model that I'm using. Did I get that wrong?

Yeah good point. It does seem a bit too complex for that.
Sorry for not remembering.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
