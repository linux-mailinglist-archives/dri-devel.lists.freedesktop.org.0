Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D77236F35A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 02:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4EB6E408;
	Fri, 30 Apr 2021 00:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5476E408
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 00:58:57 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id s9so20808759ljj.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 17:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ug9+khgowmMqU2OH1VgDimh2CfwPCpiExOxiCSc2h0I=;
 b=UxYUIpC8zsej/AXMWEHLS+xgrFyIWrbe7S8c1+dqc6mKLDjUldq5OrdhSuTcgwyGvX
 EKur9XF+1qsoYmcQmJdKijXOXA5igWdz5sgsZ7NURwA0CR0W3b1Jl2E9pixlRFIfjyLn
 it+7n6Dz5UefHeJ3m1vDdsE2T22SE+/8blWlA6RTpDRqmlxsX8wPwlRRsSnVtBcxMXsp
 RELuSlLchmV/w47kuL3vicmHMyaRa6u36BXD3257xyrLaRtMPNwkYDNbDQ+XT4n+4Ktl
 K1viEypW8UvyiH61oVCc3HvBUjmC4UUWD+hkdEW3HwU3Jkc5lkk4pbfoeT4ytnx+7Rp/
 cbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ug9+khgowmMqU2OH1VgDimh2CfwPCpiExOxiCSc2h0I=;
 b=ZFrgpZcyXYLtvLIvl63IPvD07bVvPOAhc1IQi/o5Bkh7oLaOnnalvPfcfLcVTQw6BO
 5GE3m+l1pDcgPU0jXk6JEpYNshzbL+Yv/VcflptUkqY/MKzfXjQyDzWUF4/PV5XxTN0n
 P0XuberE5zLjsrx8ptjmWNSC78X3rRk0l/A2Ne14rh6FOSBthEV712Ivc9hWN2M+51w1
 6IjOHE4BGr9cukJtQ2EeREFpnzfm/6Hg11rXyyJBp4JucqcZ3PFWZNOl1cpoGsN9Rk4h
 Dsm1EkYfQJTrnPiYK0bXZMCwACCydw1X37nG+BfFXHAfnO+ucFMwjpDtvMZzT90Thpwg
 6OqA==
X-Gm-Message-State: AOAM533zi/uYj5Yu0/cjiWVdh7V1GZGVxDKx77yg5E1a4/80fj8x1I+b
 gZCik5PRHMGc/W4yhTrD9V99ZYGkCnZJSHbnm1DI4w==
X-Google-Smtp-Source: ABdhPJwlDZuKaqC8sT7GBS1lf5GJl0FtZXQZiW32Kva3RDd+ccG2UGF9RZliYJHFvIg1Ax8Qelrh/y+Im6KaZthl1FQ=
X-Received: by 2002:a05:651c:503:: with SMTP id
 o3mr1774994ljp.368.1619744336001; 
 Thu, 29 Apr 2021 17:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
In-Reply-To: <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Apr 2021 02:58:45 +0200
Message-ID: <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
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
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 6:59 PM Douglas Anderson <dianders@chromium.org> wrote:

> In commit 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to
> avoid excessive unprepare / prepare") we started using pm_runtime, but
> my patch neglected to add the proper pm_runtime_disable(). Doh! Add
> them now.
>
> Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

This patch as such:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Notice however: you turn on pm runtime pm_runtime_enable()
in panel_simple_probe() but are you ever turning it off in
panel_simple_remove()?

I think pm_runtime_disable(); need to be added there?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
