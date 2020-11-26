Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9132C4C5D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 02:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FDB6E497;
	Thu, 26 Nov 2020 01:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251B36E423;
 Thu, 26 Nov 2020 01:03:52 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id a15so449966edy.1;
 Wed, 25 Nov 2020 17:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xrUNecpYGl2ZnAp3rrJ3f1A3dARLvQsZlRdOapjfXw0=;
 b=vMGQxGq7y+sUnfus4NNRlL7mJjO9BypG6eZpEKOX6MCNRDwwh7y5crDpnFTnhHRmOP
 iy1uxKv1PZ5qbXmgEMT5JS6z/cCyMhACpHO5ZsTXWYCjHwj8k1qgv8K4Mkk/V5Xw8O9w
 C5XKeTrxCMEc+x59jwuuO16fxqeOqSBaQnLDf2KY1v/CHzjs5coG53sDnlrWtJ37MxmO
 dyUHl10DpedfN3cyOtD/GN780M2GUveW5IXZsZhXj3rW2n32pmX1Il6WjOF70KBPowEd
 ovsiIq2DYj/RC1EDllVNMUkQ1msXJbvYkqNLmdqFeRrMmcIDBtJLa632zjchBwm388AJ
 ATVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xrUNecpYGl2ZnAp3rrJ3f1A3dARLvQsZlRdOapjfXw0=;
 b=dZLhA6koRuo8MJdSX2rBLxjSOfFSzYVZlCN5mM1sOhxFsgqYJmCGiOSfB81xX1aQlV
 34UzOQnLXmFa0zOe6oQHcMGcBKrTKT/e8P80tUraNDnNJFfXdoZy2LPIeC8xqhveIOLt
 +6WSmu9RMgdUaK69GxiVt6KsxJCrPqvSS+8Lm2EkN880+fYe0mkLcPxm5NFliDC1WG9g
 bm4I3OzgFkaMBh4Zl5LMTT0desU9CQF5+0ZYLJrkoWmaIV7e6fD8pQHbR/Bpj5kkAXA2
 5r3Jsekyg4uGy8SJ1kHB6gG+FP2BcO2mf/SE+RTpdmAs9r2LzdfmDUNe49dvxEHJmr9s
 n3Rw==
X-Gm-Message-State: AOAM531ZVrqAel77tKF2pPIyRsHy4rJ4T1IWF6TYXKUGmL4GmnaukyHd
 KCmpV6zGS0UOvwytqWK+UUtm9QqzROmSlYQIL80=
X-Google-Smtp-Source: ABdhPJwvoiEFiU5WBVRmpS6yLY1p8hwLYrKdQkByYXpFCjjUpX5zzGilbEr7+ASxTqngdlxEOXFe3x92Yd0obzSArVE=
X-Received: by 2002:a05:6402:1ac4:: with SMTP id
 ba4mr273237edb.383.1606352630490; 
 Wed, 25 Nov 2020 17:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20200916171855.129511-1-lyude@redhat.com>
 <20200916171855.129511-4-lyude@redhat.com>
In-Reply-To: <20200916171855.129511-4-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 26 Nov 2020 11:03:39 +1000
Message-ID: <CAPM=9tzLK3caEW661tCeSPhn0G0NihuztCdgyABDgtvZRvV4xA@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v2 3/8] drm/i915: Keep track of pwm-related
 backlight hooks separately
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Sept 2020 at 03:19, Lyude Paul <lyude@redhat.com> wrote:
>
> Currently, every different type of backlight hook that i915 supports is
> pretty straight forward - you have a backlight, probably through PWM
> (but maybe DPCD), with a single set of platform-specific hooks that are
> used for controlling it.
>
> HDR backlights, in particular VESA and Intel's HDR backlight
> implementations, can end up being more complicated. With Intel's
> proprietary interface, HDR backlight controls always run through the
> DPCD. When the backlight is in SDR backlight mode however, the driver
> may need to bypass the TCON and control the backlight directly through
> PWM.
>
> So, in order to support this we'll need to split our backlight callbacks
> into two groups: a set of high-level backlight control callbacks in
> intel_panel, and an additional set of pwm-specific backlight control
> callbacks. This also implies a functional changes for how these
> callbacks are used:
>
> * We now keep track of two separate backlight level ranges, one for the
>   high-level backlight, and one for the pwm backlight range
> * We also keep track of backlight enablement and PWM backlight
>   enablement separately
> * Since the currently set backlight level might not be the same as the
>   currently programmed PWM backlight level, we stop setting
>   panel->backlight.level with the currently programmed PWM backlight
>   level in panel->backlight.pwm_funcs.setup(). Instead, we rely
>   on the higher level backlight control functions to retrieve the
>   current PWM backlight level (in this case, intel_pwm_get_backlight()).
>   Note that there are still a few PWM backlight setup callbacks that
>   do actually need to retrieve the current PWM backlight level, although
>   we no longer save this value in panel->backlight.level like before.
> * panel->backlight.pwm_funcs.enable()/disable() both accept a PWM
>   brightness level, unlike their siblings
>   panel->backlight.enable()/disable(). This is so we can calculate the
>   actual PWM brightness level we want to set on disable/enable in the
>   higher level backlight enable()/disable() functions, since this value
>   might be scaled from a brightness level that doesn't come from PWM.

Oh this patch is a handful, I can see why people stall out here.

I'm going to be annoying maintainer and see if you can clean this up a
bit in advance
of this patch.

1) move the callbacks out of struct intel_panel.backlight into a separate struct
and use const static object tables, having fn ptrs and data co-located
in a struct
isn't great.

strcut intel_panel_backlight_funcs {

};
struct intel_panel {
    struct {
        struct intel_panel_backlight_funcs *funcs;
    };
};

type of thing.

I think you could reuse the backlight funcs struct for the pwm stuff
as well. (maybe with an assert on hz_to_pwm for the old hooks).

2) change the apis to pass 0 down in a separate patch, this modifies a
bunch of apis to pass in an extra level parameter, do that
first in a separate patch that doesn't change anything but hands 0
down the chain. Then switch over in another patch.

3) One comment in passing below.
>
>
> -       if (cpu_mode)
> -               val = pch_get_backlight(connector);
> -       else
> -               val = lpt_get_backlight(connector);
> -       val = intel_panel_compute_brightness(connector, val);
> -       panel->backlight.level = clamp(val, panel->backlight.min,
> -                                      panel->backlight.max);
>
>         if (cpu_mode) {
> +               val = intel_panel_sanitize_pwm_level(connector, pch_get_backlight(connector));
> +
>                 drm_dbg_kms(&dev_priv->drm,
>                             "CPU backlight register was enabled, switching to PCH override\n");
>
>                 /* Write converted CPU PWM value to PCH override register */
> -               lpt_set_backlight(connector->base.state, panel->backlight.level);
> +               lpt_set_backlight(connector->base.state, val);
>                 intel_de_write(dev_priv, BLC_PWM_PCH_CTL1,
>                                pch_ctl1 | BLM_PCH_OVERRIDE_ENABLE);
>
The change here confused me since it no longer calls lpt_get_backlight
in this path, the commit msg might explain this, but it didn't explain
is so I could figure out if that was a mistake or intentional.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
