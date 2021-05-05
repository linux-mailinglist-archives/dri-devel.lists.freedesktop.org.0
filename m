Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8541373B9A
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 14:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29C76E43A;
	Wed,  5 May 2021 12:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFCF6E43A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 12:42:20 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id w4so2239355ljw.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y1dMmNrYG94oz59wSA/+KSKHQZ8uKPZPPZDXaMAM5W8=;
 b=vcvXLK0+9vUGAc43w/mbZ5NE5FEzq0eZhYhPjCCIqtvmStxUsJTFiVkZRA1v0txYaB
 DCFSTpmZ6WsKK0nkU5je18029+bxvISxDXzGZXrzNTvgh/CLftSjxSh+DGr/T7bD0M7v
 dDuB1CUoRpXvgiEACH5VJiiIZlJ/GVi64s7dqq5qBnV4+jg/KDihM5D/HxNJhuxFYFPP
 IFWjqWINXdVoXFxwOckn13jKIpK5KNE4/4/5622dIE1s8/XFDdGUESpL3Z+nZ6ictBMK
 MIJQya9vtz+LR/PthzdoVyRumDFZXqhfxhia9GXDoevnJ5HKROv6+EBTjJn8f0TzSDxJ
 Jp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1dMmNrYG94oz59wSA/+KSKHQZ8uKPZPPZDXaMAM5W8=;
 b=EAHl3itvPcaxZcFb57kpl4NVx6lLIm4B6xU5HW4W2fgv24wMb27Qg9NqALdJYOPMZD
 tqgOXy95brif/eTDweRaBLaWZhyZpvpEAXPaj4rpfcsOfPtge/Xu4mOFm5JZiLKgqaCh
 o6mqesJfL3hlqugv5XjuPhSCLxBNzCXNybyGVtTMLkOcmuJo7sl+/U6UILQvFL4WLcWG
 5/eUmoOX8Kyxs1Nn38fWGW5k0z+rQAcf6kOAG8FfV1b8OHL6lmy02o9MkdgiDTWE+9MS
 TBl+mY3h9c1aggFIxkDa7TVG8IYZZjTi43cjEXWRq/FqahedJB2Bets/g+Qv5FWApeTT
 y4bw==
X-Gm-Message-State: AOAM532HnkEFltjAIxM0WxXwl51SMUwiCgWT+NahNN01/YdJllIkaPeg
 AdDCEbOr9TXCJ9gNKejSKgg9ZkBZGygusuPtXpTL7A==
X-Google-Smtp-Source: ABdhPJwD2qv3lmY6EBn+J/conITkpSWX+6if1y8apZPxeEcCYZ5VCIWRQ1OX9U37hQtDNOzH+k4UKOHFPuUuT3pqLkw=
X-Received: by 2002:a2e:814d:: with SMTP id t13mr2021863ljg.467.1620218539365; 
 Wed, 05 May 2021 05:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
In-Reply-To: <20210505100218.108024-2-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 May 2021 14:42:08 +0200
Message-ID: <CACRpkdaSTRND3musZ1gC5gD1iF1DfBQnKAtS9z9j9u0anyAC4A@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Marek Vasut <marex@denx.de>
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 5, 2021 at 12:03 PM Marek Vasut <marex@denx.de> wrote:

> Add driver for TI SN65DSI83 Single-link DSI to Single-link LVDS bridge
> and TI SN65DSI84 Single-link DSI to Dual-link or 2x Single-link LVDS
> bridge. TI SN65DSI85 is unsupported due to lack of hardware to test on,
> but easy to add.
>
> The driver operates the chip via I2C bus. Currently the LVDS clock are
> always derived from DSI clock lane, which is the usual mode of operation.
> Support for clock from external oscillator is not implemented, but it is
> easy to add if ever needed. Only RGB888 pixel format is implemented, the
> LVDS666 is not supported, but could be added if needed.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Philippe Schenker <philippe.schenker@toradex.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Valentin Raevsky <valentin@compulab.co.il>
> To: dri-devel@lists.freedesktop.org

This looks very nice to me, despite the complex nature of the driver
it is a bliss to read this code with all nice comments and explanations.
I don't know the gory details as well as the bridge maintainers but from
my helicopter perspective, hats off.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
