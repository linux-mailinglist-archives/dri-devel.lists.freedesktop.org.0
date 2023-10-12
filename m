Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2ED7C6208
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 03:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DE710E051;
	Thu, 12 Oct 2023 01:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A1010E051
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 01:04:10 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50573e85ee0so573842e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 18:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697072649; x=1697677449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cT2LvUtpeUGiSyAgace36wLACMbz8k4swUVY/0XIdR4=;
 b=TbH9CwNYpTx2eOC/9G/iMqAlIoYqe9hsFJ1x3XhW0JIr7yU0/zG/LhAX1mtq0ixWEw
 yheRRh22pwk9A8d7dnI/PcaMDi5JWEwijKkxtfie3uCLYwN2O+MgK5ZBUK2Aa1tkugN8
 LEOT5dmN4sqXYQ6M/P3bSZCA3B0pvFkim/KEDvrm8d/GsY82J3l4NufEgt57OQryu3Yt
 bq0X2J0uy3YBF8c9ZvPRfWAu8W++/LEmnRxEe4KHAxlEz7si1Bnkm0CHmssFIUHsuxlO
 Crg4y/pUizAsNmvcRNlvPMVf84IouGX9b33FUvIYlTl/XkPQJuZfZDQfsKiLRQkhYXcs
 Akmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697072649; x=1697677449;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cT2LvUtpeUGiSyAgace36wLACMbz8k4swUVY/0XIdR4=;
 b=IG9fJ0CIH5xwehtcEL8h5pBIHBfgjbpehRkNp92V+BMlZMvHFbO0cIUqcuGKD8yp9T
 jaORY8rvW8osrci4lccdKvJJQItTnCIG7OTdD7hzSQQAslJhtIkmNWHTY4QWxUU7Y8VP
 b88Zct3dLczPw3UCXgbzJmGfIA5XlbNI4ypymWqeZ71GAT3WWeAYpO2yhP+R8gb5AE4Q
 8Jb4eY77+zxijJVx0bVuqxzQkfPOFyrDNQ5E+jDvJf3tcU3sr++w2HIbZFE8/EEjj8NM
 sP6FqLaLijF5T2wkXm7UsmFYKdW1qghKR7nrytKcYwRDjb7QrpOp9aoScKUGgHbgs5GQ
 DfUQ==
X-Gm-Message-State: AOJu0YxEyKkGli4eV3nFm4TFivdB2svHE02RgmX9a7uAyxNvcNKawwu1
 /l3JG+okNCSjJFuH5+dZuZGqRQ==
X-Google-Smtp-Source: AGHT+IGSAu+eKUIXsF6dkBUn9j2AAUPMBTfKhJbCHRbAEys0dyVfEobQLZa2SxiiI3uhWGT0+ZG/Zg==
X-Received: by 2002:a19:ad04:0:b0:503:eac:747 with SMTP id
 t4-20020a19ad04000000b005030eac0747mr17643177lfc.47.1697072648996; 
 Wed, 11 Oct 2023 18:04:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c20-20020ac25314000000b004fdba93b92asm2526936lfh.252.2023.10.11.18.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 18:04:08 -0700 (PDT)
Message-ID: <c7e8d791-c8d5-440c-804d-4aa29be40f13@linaro.org>
Date: Thu, 12 Oct 2023 04:04:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] drm/msm/dp: incorporate pm_runtime framework into
 DP driver
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
 <1696632910-21942-6-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1696632910-21942-6-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/10/2023 01:55, Kuogee Hsieh wrote:
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
>     edp panel
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
>     of this change
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
> ---
>   drivers/gpu/drm/msm/dp/dp_aux.c     |   5 +
>   drivers/gpu/drm/msm/dp/dp_display.c | 177 ++++++++++++++----------------------
>   drivers/gpu/drm/msm/dp/dp_power.c   |  16 ----
>   drivers/gpu/drm/msm/dp/dp_power.h   |  11 ---
>   4 files changed, 72 insertions(+), 137 deletions(-)


[skipped the rest]

> @@ -173,11 +162,7 @@ int dp_power_init(struct dp_power *dp_power)
>   
>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>   
> -	pm_runtime_get_sync(power->dev);
> -
>   	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> -	if (rc)
> -		pm_runtime_put_sync(power->dev);
>   
>   	return rc;

Also this can not be as simple as:

int dp_power_init(struct dp_power *dp_power)
{
   	return dp_power_clk_enable(dp_power, DP_CORE_PM, true);
}


>   }-- 
With best wishes
Dmitry

