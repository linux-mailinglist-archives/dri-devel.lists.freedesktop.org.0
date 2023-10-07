Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A377BC728
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 13:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A09D10E03C;
	Sat,  7 Oct 2023 11:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E3310E03C
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 11:34:32 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5a21ea6baccso36812057b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Oct 2023 04:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696678471; x=1697283271; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BUL9y8tZlO44flYbnwVHExhq5hSpJ5SL0h4EKu3o8eg=;
 b=fQzoabTZXKEX2YzUO3/ppEzFMb6SE+YpoHX7i2zNRaVY29XQjNP23/n9w5acKpanlX
 v+fn8b7kiRecQM0pVTIi0e8YEGNKs35ZnPbYcxX5MWk7G6sh7n/dBKrHEFrU5eAK1tja
 IJt9eUXS+WbhJE2ePf8JGvpzBGEcBNvKO/EqOg6L8VUks4kh+stlK6CM/QkFShTAkU8T
 kJU3MKx45wSHRczB4vZtZ17ZTDk3Istm7PXy8BbCK8N55p/rNxZeoLqcXgOyNhSSM/P2
 8qRJbLJpjsrN3yiGA01v+QyAl3Q59TeHsdkh7M6Z+vKvoS1/sdD572U9lGaIG1AvZ2rb
 +y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696678471; x=1697283271;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BUL9y8tZlO44flYbnwVHExhq5hSpJ5SL0h4EKu3o8eg=;
 b=S/96S0HqPFrfiJnz4gust3BpdRJIqfNgQIYU5ZgvlSJYtysOkazrPDtzPc/5rCvMuY
 oOHkoNZUSxQeyOlWR1+dKPK8ExuCYLI0Cf7ZTv/55LAuXWg0v9Bav+QURWet8XJNPHdB
 XlD+bw3n7wpfw+PlIInCzhm6w+wbyHSMSN4LTKHdCT37mNpxoX52dAtLqJL/YM5q7sJE
 3z98OhWqbULZi/gkAC5wivwJfOskPN5DFqUkfgiYcjEJPe/HxyVC9+4hI33nGulRFjd8
 V9x0EjthcdjbmgT/cPCtuzoi/VU2xj1CLOUonF3AqPXYIMo7+E7qbJsiWpLpwt7f5Nwi
 pCfQ==
X-Gm-Message-State: AOJu0YyeGsAFPY7g0RJUJ/60lvmkmbB/pgxNK8F5r42Z1Ok82yFiIbeh
 kzioxtArqFoXK6LrMZZgMn4m1mDo3KnG+RwtF51VsQ==
X-Google-Smtp-Source: AGHT+IED+W2CNRXknXxq1mbD1Zkyw3ORxCtJvNCcoL7lGlHItYDcn2L3EFqtw8GT5LNES0wEU6OG7NRtCXEl27Tj7+Q=
X-Received: by 2002:a81:c24a:0:b0:589:f995:eb9f with SMTP id
 t10-20020a81c24a000000b00589f995eb9fmr11364646ywg.45.1696678471076; Sat, 07
 Oct 2023 04:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
 <1696632910-21942-6-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1696632910-21942-6-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 7 Oct 2023 14:34:18 +0300
Message-ID: <CAA8EJpq=hCfPv0VgOYm5jXL98ncqwuwrTG7jBB2EgXYrY2C6qw@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] drm/msm/dp: incorporate pm_runtime framework into
 DP driver
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Currently DP driver is executed independent of PM runtime framework.
> This leads msm eDP panel can not being detected by edp_panel driver
> during generic_edp_panel_probe() due to AUX DPCD read failed at
> edp panel driver. Incorporate PM runtime framework into DP driver so
> that host controller's power and clocks are enable/disable through
> PM runtime mechanism.  Once PM runtime framework is incorporated into
> DP driver, waking up device from power up path is not necessary. Hence
> remove it.
>
> After incorporating pm_runtime framework into eDP/DP driver,
> dp_pm_suspend() to handle power off both DP phy and controller during
> suspend and dp_pm_resume() to handle power on both DP phy and controller
> during resume are not necessary. Therefore both dp_pm_suspend() and
> dp_pm_resume() are dropped and replace with dp_pm_runtime_suspend() and
> dp_pm_runtime_resume() respectively.
>
> Changes in v7:
> -- add comments to dp_pm_runtime_resume()
> -- add comments to dp_bridge_hpd_enable()
> -- delete dp->hpd_state = ST_DISCONNECTED from dp_bridge_hpd_notify()
>
> Changes in v6:
> -- delete dp_power_client_deinit(dp->power);
> -- remove if (!dp->dp_display.is_edp) condition checkout at plug_handle()
> -- remove if (!dp->dp_display.is_edp) condition checkout at unplug_handle()
> -- add IRQF_NO_AUTOEN to devm_request_irq()
> -- add enable_irq() and disable_irq() to pm_runtime_resume()/suspend()
> -- del dp->hpd_state = ST_DISCONNECTED from dp_bridge_hpd_disable()
>
> Changes in v5:
> -- remove pm_runtime_put_autosuspend feature, use pm_runtime_put_sync()
> -- squash add pm_runtime_force_suspend()/resume() patch into this patch
>
> Changes in v4:
> -- reworded commit text to explain why pm_framework is required for
>    edp panel
> -- reworded commit text to explain autosuspend is choiced
> -- delete EV_POWER_PM_GET and PM_EV_POWER_PUT from changes #3
> -- delete dp_display_pm_get() and dp_display_pm_Put() from changes #3
> -- return value from pm_runtime_resume_and_get() directly
> -- check return value of devm_pm_runtime_enable()
> -- delete pm_runtime_xxx from dp_display_remove()
> -- drop dp_display_host_init() from EV_HPD_INIT_SETUP
> -- drop both dp_pm_prepare() and dp_pm_compete() from this change
> -- delete ST_SUSPENDED state
> -- rewording commit text to add more details regrading the purpose
>    of this change
>
> Changes in v3:
> -- incorporate removing pm_runtime_xx() from dp_pwer.c to this patch
> -- use pm_runtime_resume_and_get() instead of pm_runtime_get()
> -- error checking pm_runtime_resume_and_get() return value
> -- add EV_POWER_PM_GET and PM_EV_POWER_PUT to handle HPD_GPIO case
> -- replace dp_pm_suspend() with pm_runtime_force_suspend()
> -- replace dp_pm_resume() with pm_runtime_force_resume()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     |   5 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 177 ++++++++++++++----------------------
>  drivers/gpu/drm/msm/dp/dp_power.c   |  16 ----
>  drivers/gpu/drm/msm/dp/dp_power.h   |  11 ---
>  4 files changed, 72 insertions(+), 137 deletions(-)


-- 
With best wishes
Dmitry
