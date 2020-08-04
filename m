Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE823C17B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 23:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4AD88A27;
	Tue,  4 Aug 2020 21:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFE288A27
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 21:31:19 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v9so10795409ljk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 14:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FSn8/3wQ+aneWpipF9I9x9eCCHOZwD+FOtKfa7L45tQ=;
 b=Xxj7tSaDtmF3oTx8eDLXf+K5XAonJt+jNywbelZv+veVJihvYxxXO7Ki3NJ1vojjQO
 WDw1VH1Fp5pkQcQJMAA90PhP3Pn0UNECg4ONaxY/yqScvglBxSS5eQrgHRTnyChqKHM8
 rlRyWCeJWkHPSyIH30C8067uq4tt6I+l+MJ/xNywpHkicBc3TQW9FWzi2GmAUtIbA+Xs
 zdGFNzPENEKeOEw3qpl30Zvuo2w9AqcfUS8deCTSlQAbMU4IzFSqGEcFQ5kaf6Y/c0b0
 79I96r+9nSMzfwtT/mM32lzwHzusZG4EZzClrZsV7dr3J6sCqpjBwlVKGa+rs6eaDttz
 ZqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FSn8/3wQ+aneWpipF9I9x9eCCHOZwD+FOtKfa7L45tQ=;
 b=F1Ega3FOfc1HLwExb7SWVP9V55Jx04bli2bWkCU9MtrmXdI8zCfdbvozpGIBygFdpR
 b0L5InNhTO5D6n6hqMnoQIMeUzSwdw99SipLQbdQFnjVyknQT6vFCbrythcg5ngnbaNz
 oN7iv7/Ovp/MhmFiUUuFHvsApzKCj6zrAH3Hjo+RLH1zlv0JN1sCw1EXhVViw8T/iWgT
 I+7cR9Kglehhrh5dnB4/TAF2tNqW6QHMOepfJoHDbfb5aCDDAAwHTtKCOyIkS6oqXic9
 82VFkexi3aigC0nIiqH++6PEvrzKrP9wl4HRbedL0jm1xwWErJq2Z+VJIaTMIWF4V5T2
 /kjg==
X-Gm-Message-State: AOAM532c/m6K+Lg7Iz3dexZmlIZeDV1f2YAR3Z65o4iuD7h6lJB8Az26
 dQy0UnEaCpXfZesrj49zIabdm9+kGfuDLkrxOS0Ilg==
X-Google-Smtp-Source: ABdhPJzTLgwMSkBUsIqvigMPlUyPkahNZ+4pPykZVUkzAkDC4PBFmVJhLHqKUxt/6nnYgCKLm2tifiINaBE0zK9wTiE=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr11580556ljj.283.1596576677792; 
 Tue, 04 Aug 2020 14:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200802110636.1018743-1-sam@ravnborg.org>
 <20200802110636.1018743-15-sam@ravnborg.org>
In-Reply-To: <20200802110636.1018743-15-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Aug 2020 23:31:06 +0200
Message-ID: <CACRpkdbCf67tWODBcUphNduWo_Oo4WdKqztMkxM55Xp7LL_bNA@mail.gmail.com>
Subject: Re: [PATCH v1 14/22] drm/panel: sony-acx424akp: Backlight update
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 2, 2020 at 1:07 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> - Use get method to read brightness
> - Use drm_panel support for backlight
>   - This drops enable/disable operations as they are no longer needed.
>     The enable/disable operations had some backlight related comments
>     that are no longer valid. The only correct way to enable/disable
>     backlight is using the backlight enable/disable helpers.
> - Use macro for backlight initialization
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Linus Walleij <linus.walleij@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
