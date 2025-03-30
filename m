Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50546A75B5B
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF5310E0BB;
	Sun, 30 Mar 2025 17:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NgqyByE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E174210E0BB
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:21:34 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so2830840f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743355293; x=1743960093; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bvpYX+K/AodRk2yrlhNcNhiKywoeo110V7x0PBQ87Co=;
 b=NgqyByE7HxxrQJJdXP7Q6KnLh6rF8Km/fhO8lk7tIvpfZ27LKZzkG1xYBkl0IwI02r
 h9MNlEyCitSiR/UB2xpyx2tI96yEikA19pHFOkfFiMNyj64ScU+JU/sdkbjfJJ20a6C7
 2ZwxJExeBPdYacVjfUbST6BCAikFZI02cqwDthEpZJKWvmEaaN8rJyqf69L1njgFz2P3
 TJiiHXDxeTNqwx6Lla2Zuyd/0pf3xkmqFOtjav0AB/h1TYZILFf8nw0rirIS18bBoj/s
 cz92V3YNYINFWMYbswg3rpyKFIJlUKl91jx5sqgVTh+hJlxnHuP9TETHi/SkmxGWIT/B
 vB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743355293; x=1743960093;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bvpYX+K/AodRk2yrlhNcNhiKywoeo110V7x0PBQ87Co=;
 b=VvZhckHhKnjtzgVC+SjTPL/85cMM3jgl+6w3wElxr2ISQTEd9KuYsmbvOWtWr46gMo
 eJqyfsH8EGS2BMzG1Lh1uLv3JnzW4BSeu9Nh+VuZzzh/UdnJyIWJr3w90E6YhfDKA9KL
 DN0MrE36AoOVTIeWu0R5KycNT9CFaTQewpvNDyUvvxQpgD4iQu/Dwn5ZmJEQ2ohLvC1o
 T1ILip9TcvkAlN1C7vbvStEylNTDyfKE85Y9IcWJe3l9pY9yXKLB/U2EfzdCUJzRG4ed
 JvUiB2kGRep6IHaKcVnTFaCsHFywCnRiTVXsV0DJeyJ0M5180BQM1YaLNwjYJTei/cC8
 ZXyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKnp01IguywCi1EMDl5K4I1S3XvP2tJ3KZiettLs5+nLQohB0E0qMzFo8Zuxggt/vlc/wzSh/JRUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFPxRL9YkyS2O3Az9AD3xTtbJuDH1o0gvHc7+ydqA2VIoowlr+
 ISjuDUT5WouVmoEu+dPGE1LSsqOPi2BzQsEkaRLagr9n2bcrJtKRV7gvD8Ieszf57fvf/0yETXP
 i5rdKq+2G0wKN42O9XDHq+tVpDip8GtFJOA60Yg==
X-Gm-Gg: ASbGnculAnXYs8KeTywouvJ40aSkBc5O5n/ycAXbxOrPLgUMUBAnP4cC6Zwid0WBlh/
 3q/l1vasNoSK3LfyHML+QHyrSl4ZlWcymRln9gWctnwrlt0nvI6ESyYOndKcvInYD0AYsmcRjzW
 1zpfhZh4tyDfXJkh7YV3m6U7Y1/xJCUgrJC6DRmPhi3658BjoPLQ5rnh1Q/Jw=
X-Google-Smtp-Source: AGHT+IHZAvUQFo9VpMJihbLl+F11Yde2TEIyOXG8uW2htVgQCykQuZxr/2E5jsXWU33NHpV0lIlb38eKHDoiQVosQ7g=
X-Received: by 2002:a05:6000:2910:b0:39a:c6c4:f877 with SMTP id
 ffacd0b85a97d-39c120dec00mr5390333f8f.20.1743355293359; Sun, 30 Mar 2025
 10:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org>
 <qub7j44btsgd2vdn67jn65c7y7kx4dhjojoh4z5erjalugctad@fyenu2xkuo4b>
 <CACr-zFCOqGmsFnJ_aW7cV99gmQdEtso3JGEiFFeKjk6-p6R54w@mail.gmail.com>
 <CAO9ioeWTgK2AYYt19VSOVjF6rt00xZ=gt1=dUb4A7UEEMwgaSA@mail.gmail.com>
In-Reply-To: <CAO9ioeWTgK2AYYt19VSOVjF6rt00xZ=gt1=dUb4A7UEEMwgaSA@mail.gmail.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 30 Mar 2025 18:21:22 +0100
X-Gm-Features: AQ5f1JrLWFza0zqCvZQPB1rXfmnGHx6V1wjRDf7ERoDS-ecMDm6_OId_WhaVlBk
Message-ID: <CACr-zFA=m=ObUF3ZOgbGth5tXEkfUPczbEveEtsZGvNLXm2q2Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Sun, 30 Mar 2025 at 18:17, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, 30 Mar 2025 at 20:11, Christopher Obbard
> <christopher.obbard@linaro.org> wrote:
> >
> > Hi Dmitry,
> >
> > On Sun, 30 Mar 2025 at 17:42, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sun, Mar 30, 2025 at 05:31:20PM +0100, Christopher Obbard wrote:
> > > > According to the eDP specification (VESA Embedded DisplayPort Standard
> > > > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > > > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > > > the MIN value as the effective PWM bit count.
> > > >
> > > > This commit updates the logic to clamp the reported
> > > > DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> > > > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. This ensures correct
> > > > handling of eDP panels that report a zero PWM bit count but still
> > > > provide valid non-zero MIN and MAX capability values. Without this
> > > > clamping, brightness values may be interpreted incorrectly, leading
> > > > to a dim or non-functional backlight.
> > > >
> > > > For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> > > > ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> > > > supports AUX backlight control and declares a valid 11-bit range.
> > > > Clamping ensures brightness scaling works as intended on such panels.
> > > >
> > > > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > > ---
> > > > Changes in v3:
> > > > - Properly rebase patch on top of latest version of drm-misc-next.
> > > > - Make patch more generic by clamping PWM bit count to advertised MIN
> > > >   and MAX capabilities (suggested by Dmitry).
> > > > - Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org
> > > >
> > > > Changes in v2:
> > > > - Split backlight brightness patch from T14s OLED enablement series.
> > > > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > > > - Rework commit message to reference eDP spec.
> > > > - Rebase on drm-misc-next.
> > > > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > > > ---
> > > >  drivers/gpu/drm/display/drm_dp_helper.c | 48 ++++++++++++++++++++-------------
> > > >  1 file changed, 30 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > index e2439c8a7fefe116b04aaa689b557e2387b05540..fcc26cb96a51066a503433b2dc660126155d179c 100644
> > > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > @@ -28,6 +28,7 @@
> > > >  #include <linux/init.h>
> > > >  #include <linux/iopoll.h>
> > > >  #include <linux/kernel.h>
> > > > +#include <linux/minmax.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/sched.h>
> > > >  #include <linux/seq_file.h>
> > > > @@ -4033,8 +4034,33 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > > >                           aux->name, ret);
> > > >               return -ENODEV;
> > > >       }
> > > > -
> > >
> > > Nitpick: please keep the empty line.
> >
> > Sure.
> >
> >
> > > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > > +     if (ret != 1) {
> > >
> > > No. Please take a look a few lines below, where you are removing
> > > corresponding lines.
> >
> > Hmm, the original code which reads CAP_MIN and CAP_MAX both check if
> > ret != 1 too, am I missing something ?
>
> Yes, you do. Please scroll this email a few lines down.

OK, so just so I understand fully before preparing next version, no
change is needed in the logic in this line? Just a commit message
change?


> >
> >
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > > +                         aux->name, ret);
> > > > +             return -ENODEV;
> > >
> > > Hmm. Why? It was 'return 0' before and your commit message contains no
> > > explanation.
> >
> > Yeah, basically returning 0 here would not set bl->max but indicate
> > success. Is my logic correct? I will simply update the commit message
> > if so.
>
> Please describe that in the commit message why it's required for those
> two reg reads to succeed.

Sure.

>
> >
> >
> > > > +     }
> > > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > > +     if (ret != 1) {
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > > +                         aux->name, ret);
> > > > +             return -ENODEV;
> > > > +     }
> > > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     /*
> > > > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > > > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > > +      * the sink must use the MIN value as the effective PWM bit count.
> > > > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > > > +      * correct brightness scaling on compliant eDP panels.
> > > > +      */
> > > > +     pn = clamp(pn, pn_min, pn_max);
> > > > +
> > > >       bl->max = (1 << pn) - 1;
> > > >       if (!driver_pwm_freq_hz)
> > > >               return 0;
> > > > @@ -4054,29 +4080,15 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > > >        */
> > > >       fxp = DIV_ROUND_CLOSEST(1000 * DP_EDP_BACKLIGHT_FREQ_BASE_KHZ, driver_pwm_freq_hz);
> > > >
> > > > -     /* Use highest possible value of Pn for more granularity of brightness adjustment while
> > > > +     /*
> > > > +      * Ensure frequency is within 25% of desired value.
> > > > +      * Use highest possible value of Pn for more granularity of brightness adjustment while
> > >
> > > Huh? I don't see a corresponding code change. If you are fixing the
> > > comment, it should come as a separate commit.
> >
> > Sure. I will drop this hunk.
> > I folded it into this commit as it was a leftover artifact of moving
> > the code around.
>
> Please refrain from folding unrelated changes.

Sure. I will be more careful in future.


> >
> > >
> > > >        * satisfying the conditions below.
> > > >        * - Pn is in the range of Pn_min and Pn_max
> > > >        * - F is in the range of 1 and 255
> > > >        * - FxP is within 25% of desired value.
> > > >        *   Note: 25% is arbitrary value and may need some tweak.
> > > >        */
> > > > -     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > > -     if (ret < 0) {
> > > > -             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > > -                         aux->name, ret);
> > > > -             return 0;
> > > > -     }
> > > > -     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > > -     if (ret < 0) {
> > > > -             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > > -                         aux->name, ret);
> > > > -             return 0;
> > > > -     }
> > > > -     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > -     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > -
> > > > -     /* Ensure frequency is within 25% of desired value */
> > > >       fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
> > > >       fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> > > >       if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
>
>
> --
> With best wishes
> Dmitry
