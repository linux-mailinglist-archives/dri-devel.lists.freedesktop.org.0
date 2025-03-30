Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574C3A75B4C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5E110E08F;
	Sun, 30 Mar 2025 17:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k+1bISK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E796A10E08F
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:11:26 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so1602989f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743354685; x=1743959485; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R4b97t2iNZAKut7KLkS83Rc79uAyUXLWxPQ6C5bVTrU=;
 b=k+1bISK85iI7RGjE/KVAhFNIdMi0pevRoozortbgonh9JRcl2aFmUPzSI5z/QHhue+
 BRknlS6UrpaHuBDBnf1IdBIjAzCkRDaTOILP02QseaCbDJ5q09hNXK4Fxu2PgmfYaQNt
 WQfGiATSYaYDLvtgooota2plPNYVKbXDdGlyDwUKp214yeFHtKht1JSwVuR2Miro3/Wd
 SHtcxj5JlVL/46E7u+F7bKNTBgZTmguBQZkccf3OLUg5oHoiwjz56oyOGAa4pKDzsG7I
 rNtYIREoy4tEwO16L5WpKq8IKocaCkX41We4oPOE9diJ60qXciwKW7LWPoUxIkoMHHpG
 UnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743354685; x=1743959485;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R4b97t2iNZAKut7KLkS83Rc79uAyUXLWxPQ6C5bVTrU=;
 b=e1Npb6oNMhE/L4rmAwrV4FGNV4rPaadxzaqq/W5v1Z6WSa0XmEuSF1dJFtlNYfowvc
 xn1PaVU00Itl+y74iCkTYciE6OCbCLyRnQ5LXcot+58rd+7MewxQB045HJC98/ise+eB
 I8V2tzE4Q7SFRyZLLaPW1ZWUZvIa6sU6oqc1wY8h1YAUJdMqVSTKaVbFgkBtsVhjf7jy
 rdwKi5wOiY6IdMhhYyAwzXedDQOaaNNttaloZuFju3fU+wFAi1Qjt0wY8Ne0X3NksMlF
 RM7VgPXna5Mu0cmPfS94tdsM1vk2sSWwYu/AzxCrYwvtz7eGZFA7AW3Fwo3wefsvSdB9
 3ZeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7v7dVx4EKbOkCjH3qT9caG1ATAbmqhvvT/7x9VGCv422u3TDAPsiZey/6biBPt0GSAO8lYK3rqNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMRxtKAUSMuryg82x2A37pra+C2JlMSxcrAiyJDo1x98QOG8+j
 mwjIEnPo90z3DYX6EplDMdTMcWynolYL4CTeNORt/YVm2hupGD9A08bbgYq3epEm1wjygT7LyHM
 7d5BsFtmfKh//u7Jg+vMlGhiVncOZ1i8MGIzz1A==
X-Gm-Gg: ASbGncvzMYEgzNUiqKNc7k/D+Md+8X4FCwQ6ur1gwxN6/KB4ghOVahTbODaxiBPhS3r
 w2RJutaR0IBZ9xC+vFb47DqWl89RUQ2vNJBkkeGlxaEKItusZsxCSM/A8wdDY/TVV5AsEPcERft
 FmtEOkW1c+3VcFIhmsoSIaoUzMLqdVeLeMS69LoG1AkCvEn2+kHfdhBh9qd0A=
X-Google-Smtp-Source: AGHT+IESmkFX9WGZ14shJazC3f3V8SS3eV+ERa/nkxZ/7Aq1l8r8Bj4//3nkJZVG/8zeTXlVCqZeeX9eCIOFP7LVNXY=
X-Received: by 2002:a5d:6d8b:0:b0:391:3049:d58d with SMTP id
 ffacd0b85a97d-39c1208ebcbmr4512836f8f.0.1743354684676; Sun, 30 Mar 2025
 10:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org>
 <qub7j44btsgd2vdn67jn65c7y7kx4dhjojoh4z5erjalugctad@fyenu2xkuo4b>
In-Reply-To: <qub7j44btsgd2vdn67jn65c7y7kx4dhjojoh4z5erjalugctad@fyenu2xkuo4b>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 30 Mar 2025 18:11:13 +0100
X-Gm-Features: AQ5f1JrJ3kNFlKh7MDeTNlz0Vx1kwpKl57VlL4YR0kRzy7Kt_Ar9ppBDIk2TzCo
Message-ID: <CACr-zFCOqGmsFnJ_aW7cV99gmQdEtso3JGEiFFeKjk6-p6R54w@mail.gmail.com>
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

On Sun, 30 Mar 2025 at 17:42, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Mar 30, 2025 at 05:31:20PM +0100, Christopher Obbard wrote:
> > According to the eDP specification (VESA Embedded DisplayPort Standard
> > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > the MIN value as the effective PWM bit count.
> >
> > This commit updates the logic to clamp the reported
> > DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. This ensures correct
> > handling of eDP panels that report a zero PWM bit count but still
> > provide valid non-zero MIN and MAX capability values. Without this
> > clamping, brightness values may be interpreted incorrectly, leading
> > to a dim or non-functional backlight.
> >
> > For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> > ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> > supports AUX backlight control and declares a valid 11-bit range.
> > Clamping ensures brightness scaling works as intended on such panels.
> >
> > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> > Changes in v3:
> > - Properly rebase patch on top of latest version of drm-misc-next.
> > - Make patch more generic by clamping PWM bit count to advertised MIN
> >   and MAX capabilities (suggested by Dmitry).
> > - Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org
> >
> > Changes in v2:
> > - Split backlight brightness patch from T14s OLED enablement series.
> > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > - Rework commit message to reference eDP spec.
> > - Rebase on drm-misc-next.
> > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 48 ++++++++++++++++++++-------------
> >  1 file changed, 30 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index e2439c8a7fefe116b04aaa689b557e2387b05540..fcc26cb96a51066a503433b2dc660126155d179c 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/init.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/kernel.h>
> > +#include <linux/minmax.h>
> >  #include <linux/module.h>
> >  #include <linux/sched.h>
> >  #include <linux/seq_file.h>
> > @@ -4033,8 +4034,33 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >                           aux->name, ret);
> >               return -ENODEV;
> >       }
> > -
>
> Nitpick: please keep the empty line.

Sure.


> >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > +     if (ret != 1) {
>
> No. Please take a look a few lines below, where you are removing
> corresponding lines.

Hmm, the original code which reads CAP_MIN and CAP_MAX both check if
ret != 1 too, am I missing something ?


> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > +                         aux->name, ret);
> > +             return -ENODEV;
>
> Hmm. Why? It was 'return 0' before and your commit message contains no
> explanation.

Yeah, basically returning 0 here would not set bl->max but indicate
success. Is my logic correct? I will simply update the commit message
if so.


> > +     }
> > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > +     if (ret != 1) {
> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > +                         aux->name, ret);
> > +             return -ENODEV;
> > +     }
> > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     /*
> > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > +      * the sink must use the MIN value as the effective PWM bit count.
> > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > +      * correct brightness scaling on compliant eDP panels.
> > +      */
> > +     pn = clamp(pn, pn_min, pn_max);
> > +
> >       bl->max = (1 << pn) - 1;
> >       if (!driver_pwm_freq_hz)
> >               return 0;
> > @@ -4054,29 +4080,15 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >        */
> >       fxp = DIV_ROUND_CLOSEST(1000 * DP_EDP_BACKLIGHT_FREQ_BASE_KHZ, driver_pwm_freq_hz);
> >
> > -     /* Use highest possible value of Pn for more granularity of brightness adjustment while
> > +     /*
> > +      * Ensure frequency is within 25% of desired value.
> > +      * Use highest possible value of Pn for more granularity of brightness adjustment while
>
> Huh? I don't see a corresponding code change. If you are fixing the
> comment, it should come as a separate commit.

Sure. I will drop this hunk.
I folded it into this commit as it was a leftover artifact of moving
the code around.

>
> >        * satisfying the conditions below.
> >        * - Pn is in the range of Pn_min and Pn_max
> >        * - F is in the range of 1 and 255
> >        * - FxP is within 25% of desired value.
> >        *   Note: 25% is arbitrary value and may need some tweak.
> >        */
> > -     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > -     if (ret < 0) {
> > -             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > -                         aux->name, ret);
> > -             return 0;
> > -     }
> > -     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > -     if (ret < 0) {
> > -             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > -                         aux->name, ret);
> > -             return 0;
> > -     }
> > -     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > -     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > -
> > -     /* Ensure frequency is within 25% of desired value */
> >       fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
> >       fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> >       if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
>
> --
> With best wishes
> Dmitry
