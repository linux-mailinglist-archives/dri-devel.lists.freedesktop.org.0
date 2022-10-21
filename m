Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AE2608564
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 09:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541FA10E37A;
	Sat, 22 Oct 2022 07:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB77D10E411
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 16:57:01 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a29so6251583lfo.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W3Uu99QSJVAMmiWHb36eCzi/+N/6BE68OSyGz5oyHeU=;
 b=LfMYZSTBFWBttSxhLHqk/La21IivgzaBCjR3wHgIr3Yp3MGLSyTjXyme0Z4cff/jvJ
 mI9qfEHa6d+cR6y4EW7sfbn59TNASL/xYfGVSJ5HR+jZs9S9dhEMaHI3qDD09xMO2VB8
 khjke4302tGm5XycDUUvEaHrc3bNG/LMQSVfDdGUCzeeKzFHTr0dQzVWq00NnYItOfKh
 WGifFaTkpWcWm6f7uCMsbhIOumSNvwMldY9si9XC73A6hGXor+caWf+W7qKoFiuiyCnC
 TDW+9zeYHB5ObiJDoNA7Jsi2rlocRfBPm8BauTelxoaSUGiREBM3Mag9uVKKdpFbcp8s
 CWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W3Uu99QSJVAMmiWHb36eCzi/+N/6BE68OSyGz5oyHeU=;
 b=xaq+lQyjVkAyhgnvkzycLNUgAEHVoa2JmCevgAA+ZXdKQ7T2//2x1PiDX/lrVuivu1
 OeGCMyxah+jskUUHDIHSYOynwLADf2A1RUKUQfB2OIBLkmPcchrWjgewHErJCwrBpoUY
 OE3tb+fb98mxrl9YVBt3C8WtOxYvMMWFnluGSaSEM6H7gJyH7VC8th1YpneeF+TZ6TWh
 VSGIPlvmtAFeUxkBaQDlt7OGLTRpDPfUyvQgzDJ0N0q4DCCfE/7AhcHrgeJ2r+ddUoW6
 RKNlA9ZZ1zSDp0BvUJCXGohdwsVbFVVy35I5s8ymT9bVZuSbKFNDVXzNeNbre+IbaI1M
 GKmA==
X-Gm-Message-State: ACrzQf37KLSxdrDPyK5x092AjGw7DtBAWIZx4kXwuzl2G0UjrBcty+gi
 CuQlk0PzqRP03dhmYu1N2ylSRrj3yFbaKDjJ024=
X-Google-Smtp-Source: AMsMyM4Aw71gU87C5iIrcBn8fAdF7VbiuZnADdRTBerCv3ryfXYGbIALq+k4Dn1qXmxRqAgW+2tEu0cnvRX3fAD9x1I=
X-Received: by 2002:a05:6512:108c:b0:4a2:a46d:1a1a with SMTP id
 j12-20020a056512108c00b004a2a46d1a1amr7867623lfg.471.1666371420046; Fri, 21
 Oct 2022 09:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221021131339.2203291-1-maxime@cerno.tech>
In-Reply-To: <20221021131339.2203291-1-maxime@cerno.tech>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 21 Oct 2022 17:56:47 +0100
Message-ID: <CALeDE9PU3aJ9NHFA7b16-PondapxR9DS4ssSLqhEWsbf_d-vuA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vc4: hdmi: Fix HSM clock too low on Pi4
To: maxime@cerno.tech
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 22 Oct 2022 07:16:55 +0000
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
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 21, 2022 at 2:13 PM <maxime@cerno.tech> wrote:
>
> Commit ae71ab585c81 ("drm/vc4: hdmi: Enforce the minimum rate at
> runtime_resume") reintroduced the call to clk_set_min_rate in an attempt
> to fix the boot without a monitor connected on the RaspberryPi3.
>
> However, that introduced a regression breaking the display output
> entirely (black screen but no vblank timeout) on the Pi4.
>
> This is due to the fact that we now have in a typical modeset at boot,
> in vc4_hdmi_encoder_pre_crtc_configure(), we have a first call to
> clk_set_min_rate() asking for the minimum rate of the HSM clock for our
> given resolution, and then a call to pm_runtime_resume_and_get(). We
> will thus execute vc4_hdmi_runtime_resume() which, since the commit
> mentioned above, will call clk_set_min_rate() a second time with the
> absolute minimum rate we want to enforce on the HSM clock.
>
> We're thus effectively erasing the minimum mandated by the mode we're
> trying to set. The fact that only the Pi4 is affected is due to the fact
> that it uses a different clock driver that tries to minimize the HSM
> clock at all time. It will thus lower the HSM clock rate to 120MHz on
> the second clk_set_min_rate() call.
>
> The Pi3 doesn't use the same driver and will not change the frequency on
> the second clk_set_min_rate() call since it's still within the new
> boundaries and it doesn't have the code to minimize the clock rate as
> needed. So even though the boundaries are still off, the clock rate is
> still the right one for our given mode, so everything works.
>
> There is a lot of moving parts, so I couldn't find any obvious
> solution:
>
>   - Reverting the original is not an option, as that would break the Pi3
>     again.
>
>   - We can't move the clk_set_min_rate() call in _pre_crtc_configure()
>     since because, on the Pi3, the HSM clock has the CLK_SET_RATE_GATE
>     flag which prevents the clock rate from being changed after it's
>     been enabled. Our calls to clk_set_min_rate() can change it, so they
>     need to be done before clk_prepare_enable().
>
>   - We can't remove the call to clk_prepare_enable() from the
>     runtime_resume hook to put it into _pre_crtc_configure() either,
>     since we need that clock to be enabled to access the registers, and
>     we can't count on the fact that the display will be active in all
>     situations (doing any CEC operation, or listing the modes while
>     inactive are valid for example()).
>
>   - We can't drop the call to clk_set_min_rate() in
>     _pre_crtc_configure() since we would need to still enforce the
>     minimum rate for a given resolution, and runtime_resume doesn't have
>     access to the current mode, if there's any.
>
>   - We can't copy the TMDS character rate into vc4_hdmi and reuse it
>     since, because it's part of the KMS atomic state, it needs to be
>     protected by a mutex. Unfortunately, some functions (CEC operations,
>     mostly) can be reentrant (through the CEC framework) and still need
>     a pm_runtime_get.
>
> However, we can work around this issue by leveraging the fact that the
> clk_set_min_rate() calls set boundaries for its given struct clk, and
> that each different clk_get() call will return a different instance of
> struct clk. The clock framework will then aggregate the boundaries for
> each struct clk instances linked to a given clock, plus its hardware
> boundaries, and will use that.
>
> We can thus get an extra HSM clock user for runtime_pm use only, and use
> our different clock instances depending on the context: runtime_pm will
> use its own to set the absolute minimum clock setup so that we never
> lock the CPU waiting for a register access, and the modeset part will
> set its requirement for the current resolution. And we let the CCF do
> the coordination.
>
> It's not an ideal solution, but it's fairly unintrusive and doesn't
> really change any part of the logic so it looks like a rather safe fix.
>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2136234
> Fixes: ae71ab585c81 ("drm/vc4: hdmi: Enforce the minimum rate at runtime_resume")
> Reported-by: Peter Robinson <pbrobinson@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Tested-by: Peter Robinson <pbrobinson@gmail.com>

Initial testing here is looking good, I've tested on RPi4 8Gb with
Fedora 37 Workstation, and some basic headless boot testing on RPi400,
RPi3B and Zero2W. There will more updates on the linked bug and I'll
do some more testing tomorrow.

Thanks a lot for your assistance here Maxime, it's very much appreciated.

>
> ---
> Changes in v2:
> - Forgot one more clock to convert to the new one
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 21 +++++++++++++++++----
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
>  2 files changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index eb3aaaca2b80..3519b0c23d3b 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2732,9 +2732,16 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
>                 DRM_ERROR("Failed to get HDMI state machine clock\n");
>                 return PTR_ERR(vc4_hdmi->hsm_clock);
>         }
> +
>         vc4_hdmi->audio_clock = vc4_hdmi->hsm_clock;
>         vc4_hdmi->cec_clock = vc4_hdmi->hsm_clock;
>
> +       vc4_hdmi->hsm_rpm_clock = devm_clk_get(dev, "hdmi");
> +       if (IS_ERR(vc4_hdmi->hsm_rpm_clock)) {
> +               DRM_ERROR("Failed to get HDMI state machine clock\n");
> +               return PTR_ERR(vc4_hdmi->hsm_rpm_clock);
> +       }
> +
>         return 0;
>  }
>
> @@ -2816,6 +2823,12 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
>                 return PTR_ERR(vc4_hdmi->hsm_clock);
>         }
>
> +       vc4_hdmi->hsm_rpm_clock = devm_clk_get(dev, "hdmi");
> +       if (IS_ERR(vc4_hdmi->hsm_rpm_clock)) {
> +               DRM_ERROR("Failed to get HDMI state machine clock\n");
> +               return PTR_ERR(vc4_hdmi->hsm_rpm_clock);
> +       }
> +
>         vc4_hdmi->pixel_bvb_clock = devm_clk_get(dev, "bvb");
>         if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
>                 DRM_ERROR("Failed to get pixel bvb clock\n");
> @@ -2879,7 +2892,7 @@ static int vc4_hdmi_runtime_suspend(struct device *dev)
>  {
>         struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
>
> -       clk_disable_unprepare(vc4_hdmi->hsm_clock);
> +       clk_disable_unprepare(vc4_hdmi->hsm_rpm_clock);
>
>         return 0;
>  }
> @@ -2897,11 +2910,11 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
>          * its frequency while the power domain is active so that it
>          * keeps its rate.
>          */
> -       ret = clk_set_min_rate(vc4_hdmi->hsm_clock, HSM_MIN_CLOCK_FREQ);
> +       ret = clk_set_min_rate(vc4_hdmi->hsm_rpm_clock, HSM_MIN_CLOCK_FREQ);
>         if (ret)
>                 return ret;
>
> -       ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
> +       ret = clk_prepare_enable(vc4_hdmi->hsm_rpm_clock);
>         if (ret)
>                 return ret;
>
> @@ -2914,7 +2927,7 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
>          * case, it will lead to a silent CPU stall. Let's make sure we
>          * prevent such a case.
>          */
> -       rate = clk_get_rate(vc4_hdmi->hsm_clock);
> +       rate = clk_get_rate(vc4_hdmi->hsm_rpm_clock);
>         if (!rate) {
>                 ret = -EINVAL;
>                 goto err_disable_clk;
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 1520387b317f..fbc0a55f18e1 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -171,6 +171,7 @@ struct vc4_hdmi {
>         struct clk *cec_clock;
>         struct clk *pixel_clock;
>         struct clk *hsm_clock;
> +       struct clk *hsm_rpm_clock;
>         struct clk *audio_clock;
>         struct clk *pixel_bvb_clock;
>
> --
> 2.37.3
>
