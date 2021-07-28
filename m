Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 191DE3D90C9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 16:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56E06E081;
	Wed, 28 Jul 2021 14:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58816E040;
 Wed, 28 Jul 2021 14:40:16 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id v3so1197033uau.3;
 Wed, 28 Jul 2021 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gy/xEIwD/4wzE9AqH6vhN+tSbWlmdiFtY8oiM2gmEG0=;
 b=TB0d1d+Ax2PLNyC3+GFUdGDreDP3BoBSFSOPGzZ6WZyyFsTPWKeQnv8MMAs6RUDLXr
 /Vz1+J1ztxg1yM1QxaPR+IOybQqwqnUGwAc5gyc81hraGz6JV6yZailQVB98eJWRvI3+
 /hHEWxWpdQd4KUbXceZGbfkHFai0F6L3hZpCAAixyGv8Engvrp7OjjEZsBxGnnb5qHr1
 7R/R1TaKnFUBE7mCYF6fN/3rXe85Pr1db9bTxWz1Yepr+5wVtVjj6ieApmjkYf3rbX4w
 sHzQOhl4nmipVgLoy4MXgY/h48q9KLHpvN1iQclmYrT7C/asLUxK+TW6O2K+tCGdzSor
 /oQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gy/xEIwD/4wzE9AqH6vhN+tSbWlmdiFtY8oiM2gmEG0=;
 b=hhtEXmIe2hsE+/tSQQq3ea1o4h+YbJGqGdGUTCFtaxRieZ3M2oVEI3azqbC87zdAma
 wnxnd6vzMuFNdlPm7g3KOGztTJ9LQ6T5UN+aptHZgpDcHS0Bt6VFNDtE9IP2BFdY+Az4
 NqNQHKvudrBdAZx6QYZ48quNC8eM+B4y+CsFL1QUw1g9v1Yn4yMAfRfe8uTf+M1qkg6o
 96EbfZ8oad05m4Oba+Ei3kC0km0znOgrvYWMDoYsbyZuHoUXllmn4uM2JcXdgHx7qDsk
 nc2BCEHZZ5WpLfYcsI/dVwFFX7Bcvq3zXqMjwNqmJe/BPsVZIgWvRa624JAywTMOXcr+
 lkTg==
X-Gm-Message-State: AOAM5316tZUwCK+i18cGNL+lTBfNyaq8Gqgs3KuHnKsEH+fpgRUhruVR
 IpRtGIcwWUWY5Tvh0akooj3WQX1dYn9ike5OH7U=
X-Google-Smtp-Source: ABdhPJzw76LXfLoDCvAdTGV1bDUpE3FI0q8/Gg59XtoCCOUTfBE/DrFK7SrC+4QcQTNspTl+nQEAlzwlHPd7OT1kG2A=
X-Received: by 2002:ab0:6dcb:: with SMTP id r11mr116755uaf.128.1627483215360; 
 Wed, 28 Jul 2021 07:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-4-sean@poorly.run>
In-Reply-To: <20210721175526.22020-4-sean@poorly.run>
From: jim.cromie@gmail.com
Date: Wed, 28 Jul 2021 10:39:48 -0400
Message-ID: <CAJfuBxw2uAZozKgG58KvFnQfw8hzcqrzUfN=B0ucYDkU=h40=A@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 03/14] drm/i915/utils: Replace dev_printk with
 drm helpers
To: Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 1:55 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Use drm logging helpers to add support for the upcoming tracefs
> implementation.
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-4-sean@poorly.run #v5
>
> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> ---
>  drivers/gpu/drm/i915/i915_utils.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_utils.c b/drivers/gpu/drm/i915/i915_utils.c
> index f9e780dee9de..d858c92c6997 100644
> --- a/drivers/gpu/drm/i915/i915_utils.c
> +++ b/drivers/gpu/drm/i915/i915_utils.c
> @@ -30,10 +30,9 @@ __i915_printk(struct drm_i915_private *dev_priv, const char *level,
>         vaf.va = &args;
>
>         if (is_error)
> -               dev_printk(level, kdev, "%pV", &vaf);
> +               drm_dev_printk(kdev, level, "%pV", &vaf);
>         else
> -               dev_printk(level, kdev, "[" DRM_NAME ":%ps] %pV",
> -                          __builtin_return_address(0), &vaf);
> +               drm_err(&dev_priv->drm, "%pV", &vaf);

its slightly jarring to see drm_err() in the !is_err branch.
warn or notice seems better.


>
>         va_end(args);
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
