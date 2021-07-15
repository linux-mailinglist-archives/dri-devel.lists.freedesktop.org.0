Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EEE3C9ADF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 10:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC796E5A9;
	Thu, 15 Jul 2021 08:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2858E6E5A9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 08:52:17 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id w194so5754934oie.5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 01:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RAf0f97MmIhZvtB+APA2xQ10y7p9bTqNCPlvTRo+PMA=;
 b=lX2OjtvXnkjttAevWT3Pbs0HioNflvR5Y8J8n6DItrNg180Cq8ffUHgPm6VMdSul6h
 0dk+QLbtnufD9ApK+cEFvH5dX3fAITLpx2cSMBQ4+bB3+X2udywv6fFKBCE5YHQ9ga6h
 LuY3DRJt2hsXOmCfXO3UpkBBvZz4exVuyxt10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RAf0f97MmIhZvtB+APA2xQ10y7p9bTqNCPlvTRo+PMA=;
 b=ix8ah3vVgVqgx4ZF9wbnv5wt9GqMcNVYRTEpT61ALQqqcnUdEFgEMrU5iMKfmF/Qqt
 8QormZloZaIxyxTPxX0xyXcchf9J6L4OfzqHiHfPFuuZ11/zomcOYDsca77AWa1BGBOd
 0Y3osUI0raVcE0k10trjDYM3rOINx6GlU2rmbZTJJXc0sdQYVo0/1ENzLpErJdJqtBl5
 SG/em9UNgcMZCbakxEBoPPazWBiPB+Vw/Ud9ag3r35v3Pw9+DeRS/3LKGJYruc22l8Yc
 //XIvfp0YEVGEdisRpImVEcjNWjocpUIfYl2OhrxcxmiaxsJ2rH72Brz0GgYsKSJnGV5
 4Udw==
X-Gm-Message-State: AOAM531zG+nxvEtT2gVMi/OE2pM6kZbyAIon9x9s//jnqpifutteJOwe
 oqJ4kBzHMhs4KDnha4jlfA9wEBxHqaN+INZgAu8MQA==
X-Google-Smtp-Source: ABdhPJwLtqQVYv/tJGeptuf1lwmr1aETKxirUNNSqUgbZMR8439pmSRRmvi6yuS4JxLrHzMFlLH7jckDiL/6W+Ka/C0=
X-Received: by 2002:aca:d4cf:: with SMTP id l198mr6968741oig.14.1626339136544; 
 Thu, 15 Jul 2021 01:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210715080017.239633-1-linus.walleij@linaro.org>
In-Reply-To: <20210715080017.239633-1-linus.walleij@linaro.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Jul 2021 10:52:05 +0200
Message-ID: <CAKMK7uHqn9_CFaKYJ=X9SbMi3yXOXECe4tEyhW4noDfB_PaS+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Document internal backlight handling
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 10:02 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Panels with internal backlight need to assign their backlight member
> directly.
>
> Reported-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  include/drm/drm_panel.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 33605c3f0eba..1e63fadf1368 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -144,8 +144,9 @@ struct drm_panel {
>          * Backlight device, used to turn on backlight after the call
>          * to enable(), and to turn off backlight before the call to
>          * disable().
> -        * backlight is set by drm_panel_of_backlight() and drivers
> -        * shall not assign it.
> +        * External backlight is assigned by drm_panel_of_backlight() while
> +        * panel-internal backlight is assigned directly to this member by the
> +        * panel driver.

External/internal feels a bit like imprecise wording. Maybe something like

drm_panel_of_backlight() automatically sets this, drivers which obtain
their backlight through some other means need to explicitly set this
themselves.

And then perhaps also update the kerneldoc for drm_panel_of_backlight?

Maybe in the future we'll have some similar helpers for acpi or the
backlight on dp aux or whatever might happen with hardware.

Either way: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Because updating and clarifying docs is always great!
-Daniel

>          */
>         struct backlight_device *backlight;
>
> --
> 2.31.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
