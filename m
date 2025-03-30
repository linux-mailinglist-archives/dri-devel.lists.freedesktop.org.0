Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C400A75B86
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C027110E326;
	Sun, 30 Mar 2025 17:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oKgHnJhA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AAB10E326
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:48:26 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so32226465e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743356904; x=1743961704; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q8bnYz3+E08nz4vPfLMJN2WUkwfYbX9/TWfImS8zWww=;
 b=oKgHnJhAGxkTzTUOOKDX+VjvfJH9onmfPwPOFQIYgJTuarsmygZp4EnCEQp1KdVEkm
 WczO5ywVuEbvr5wdUsvkgyV6nveodstDHKGyemIlvpQjfie6+LEvRC1cC5pgnsg/2+Vc
 cKUC7At1gvH8rbwgMc0/ifJHMZTmg0uzn3QTOMZRuysnq2olpCt6LMKSLPstoB7r2EWc
 sTnje1bgdDa026wpkQ9zWGgoYfuAO34CPpOTy4FJMtHBUVt0Xr8rlRUM1WIyXA+TG1vO
 IY0t9DIaNi6qcOkiKqofZc/W4fKhhXNl5fA6kSn7/SuCJfXcMdaz5umErhvLCkX631ao
 aquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743356904; x=1743961704;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q8bnYz3+E08nz4vPfLMJN2WUkwfYbX9/TWfImS8zWww=;
 b=ZSeYZDNtNj/m5KRbiHljgRUIBzqnuBdzVFVyHme4/vGvJDrvq+9Tk7vNhN8SOWMhih
 +DAjm1YgqdsrroeFQ1ULPsiCe5qdJJ/tMa2Bju/Cs9faqp5gwwSDH2SH+lfG+vSmKLWd
 V8LBPRnndyO0c+txoPFlpH2SboBaHcQe/uQtgIxtHorO56e2lqQJdC7t6b0/WM23z82/
 wSOG6UyToPHzIva9+S3+8d+TJpF0gCCHtrEBqUStEq5uIOK3qOyoryKh0OmiHMycTDKu
 TELHE/LHK9nAeUvn2DeZiOAX/avd6WvuTM+Ag0lcqud8ClcYpcq8weJSsawESwocQi61
 q6eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIi4WiPWzmDToDtnaeM6Bph+sLhqfYYfhgyEJjhwNKNrNkpiBc7/FxZ+lT4/EPdggaXQZViL1sQnI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU80o4qMwK3MLVjbKQhQclP2UpxJsLtDiCY4nUEta45IL6r+V0
 P+twKKPQXNrzqF/RLFJ0Meb5BJ/jzmtW3QKfQYrosV97X68E98iFaVr8eXdUfT28iJUfZtVxojN
 /TNt0y0x3QERhvyh9Zi44dQcKkm78RhE+2vdZgw==
X-Gm-Gg: ASbGncv0+MGtA0iN6E+t0GcALiYD5xaJ4cmlRX09izVHyGdezaKGa7hEAtlGpSNpKdo
 rZGci2HsfnB3ZZ8+Ql+Dm0cCXhcw57AMXTlhYax4ZYLodT8JxQGneqF1XM1L5WP5+wpgrMwIsJW
 w41fTU7KMdhVKH25+pCzZBI1vq9bd19W/FeB2tTmXOpKpSTC78qqE88zSCobc=
X-Google-Smtp-Source: AGHT+IG79/a/46o2+sWdSeSPFtl5xnoQ2heiea7o699JBwREuKo4OWeTmE61/YDvN7FF4/h2efgSCu7+R2pWTQXg+yY=
X-Received: by 2002:a05:6000:40e1:b0:390:e9ee:f27a with SMTP id
 ffacd0b85a97d-39c11ba5136mr5357215f8f.28.1743356904556; Sun, 30 Mar 2025
 10:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v4-1-85ef0991bdf8@linaro.org>
 <CAO9ioeUhx96EYXuMZL0LHBb=Z-prkwX0mPETMvsj-c1qddPtXg@mail.gmail.com>
In-Reply-To: <CAO9ioeUhx96EYXuMZL0LHBb=Z-prkwX0mPETMvsj-c1qddPtXg@mail.gmail.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 30 Mar 2025 18:48:13 +0100
X-Gm-Features: AQ5f1JrClIRKzKQQ3iyO9g--jGlWaoJ7hyeVGCPzif40VYGm9gtHa6Z15nDZeU8
Message-ID: <CACr-zFCN25V0zAttZ_7sSQN3UUEdEdkAv684cuRshqnRtExSKA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/dp: clamp PWM bit count to advertised MIN and MAX
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

On Sun, 30 Mar 2025 at 18:45, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, 30 Mar 2025 at 20:31, Christopher Obbard
> <christopher.obbard@linaro.org> wrote:
> >
> > According to the eDP specification (VESA Embedded DisplayPort Standard
> > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > the MIN value as the effective PWM bit count.
> >
> > This commit updates the logic to clamp the reported
> > DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. As part of this change,
> > the behavior is modified such that reading _CAP_MIN and _CAP_MAX
> > registers is now required to succeed. Before reading these registers
> > was optional.
> >
> > This ensures correct handling of eDP panels that report a zero PWM
> > bit count but still provide valid non-zero MIN and MAX capability
> > values. Without this clamping, brightness values may be interpreted
> > incorrectly, leading to a dim or non-functional backlight.
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
> > Changes in v4:
> > - Remove unrelated whitespace changes.
> > - Remove unrelated commit change.
> > - Add note to commit message about changing read of PWMGEN_BIT_COUNT_CAP_MIN
> >   and _CAP__MAX from optional to required.
> > - Link to v3: https://lore.kernel.org/r/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org
> >
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
> >  drivers/gpu/drm/display/drm_dp_helper.c | 42 +++++++++++++++++++++------------
> >  1 file changed, 27 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index e2439c8a7fefe116b04aaa689b557e2387b05540..b5c8a75d036b5d65262417de363409e3ff3f4560 100644
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
> > @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >         }
> >
> >         pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +       ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > +       if (ret != 1) {
>
> NAK. See previous discussion.

Sorry, I must be blind. That is blazingly obvious to me now!



> > +               drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > +                           aux->name, ret);
> > +               return -ENODEV;
> > +       }
> > +       pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>
>
> --
> With best wishes
> Dmitry
