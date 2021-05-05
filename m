Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A1373B80
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 14:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AC66E25A;
	Wed,  5 May 2021 12:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC986E25A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 12:38:29 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id y9so2240717ljn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7jz0wfEaTjiRsEn3zc+8d7yiMJY9ky84eJFohIov42E=;
 b=CzVGS1APxjTmBN1mOTJ6DDKwucW9033xAOvkXvQMk7lVIICoqZHC8dWk909D2D2ImA
 cZq8a9myMnOz9e+35bd1yUSkpAt6Q/6zdPe8G1mftlE0P/F38cOJJELlAgml75ydiWGu
 iSWpcf+XBrVme5nQTvlUXgJ9eJIVQFPWJFJxcUNb5TUbLzhoFMY3I8Nzht1ngSaL0e9/
 YLZ02NohkL8yfaXjQbVyjuZAykY4DuB8RHNzf9UX4gyDKqhB13tiQNIwJYL9bsEO6Djc
 JRHfF/wB5YH/BRv/RhSpNcZlNCUXsJcoxR3WUlvMTnsDmefJdIsKwTKDp6xCepxcg/j5
 aNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7jz0wfEaTjiRsEn3zc+8d7yiMJY9ky84eJFohIov42E=;
 b=XV41ddiS0uBUjzY72P62dZu5A0XsqcCiOi0N/lPAkXIYegaC5iM2nV/g5RGOt4eDEe
 ioT20SWDYB9O7/hDBvRV57aqcMdBwg6rHOlWjbuyG0mBw31AdueEyk0dwIiK5a3aaMHJ
 Byza29cJPvVm8u20UANwA0E73fc8+EOWAzjR0RuyVZN//AalIYxtsHq0ncdIRTXIlxax
 +zLcUX45h7BihGPFwauWZBuq2WxEmChPWIXVpmzalHpwNn8tgsSJvvRtkpefp7eFcV9d
 QFosN2snXdEnLJ/WALnBKBkPifFlepQbXKYdYu/g/ZAPeNsK4twC57hFGDgJvC9zyURI
 yYgQ==
X-Gm-Message-State: AOAM5333k1HtSKMNQCaHWmlyUId+8wghMTZpQeyKXTrr06khHC5Vri28
 YfzfHSV9ypSvhPT9pRgi+C37OzOEE2qw3WiYQ0lOqg==
X-Google-Smtp-Source: ABdhPJw62T+5dKlLRZZKI0KxRU8HD6fa8e/7RHrL5x3kUDSZ/FqWvvvJJ/eFcc5c7Um3Z2Nidd1q/lr5EfOmMkb1CpM=
X-Received: by 2002:a2e:2e12:: with SMTP id u18mr13853586lju.200.1620218307890; 
 Wed, 05 May 2021 05:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210505100218.108024-1-marex@denx.de>
In-Reply-To: <20210505100218.108024-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 May 2021 14:38:17 +0200
Message-ID: <CACRpkdZpjxsm8hV6wrCs1jH-W2c_-0BH_y7du9vZJ0VMGa+=zg@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 and SN65DSI84 bindings
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 5, 2021 at 12:03 PM Marek Vasut <marex@denx.de> wrote:

> Add DT binding document for TI SN65DSI83 and SN65DSI84 DSI to LVDS bridge.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org

This looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
