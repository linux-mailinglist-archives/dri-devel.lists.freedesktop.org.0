Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7829989A869
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 04:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEBE1134E5;
	Sat,  6 Apr 2024 02:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ndlTDEZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F19A1134E5
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Apr 2024 02:15:09 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d52e65d4a8so42162481fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 19:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712369707; x=1712974507; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XhDrNzBi3oiG43zRalXwXnBhsTSPwZRL2FZ33nSnVdw=;
 b=ndlTDEZ3PnT9H6rkMuV1l+xENJMitrD3zjOKYrS4PPT8MuBmPF/o1RnhX9NEzjdDD5
 ntXUdISAWZveQM3lfUVHlSoiBYgcDFHDOqeQpBr2RnHSUroHshjuiawzdHAb6AdygWnY
 JG5g3hsnFuK/Gj16CAcXwIB4/ayXICI7jsYZknGMnEtpEMJYeBrKiDp6HGOIwZ1GYv3p
 b4CrmxsH0jVY6zUkgTcG6MXjdNjLp0cREc3Y0IgQbsiylWKkqWtsXqhAI2zHpIkgQcR/
 3ToVs5tTmxVL47Ba5aeLY4x5RjCtVvgoB/K3+PAbl1aXgtWVAhiDiGbV2RUpX6VkO/wp
 NesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712369707; x=1712974507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XhDrNzBi3oiG43zRalXwXnBhsTSPwZRL2FZ33nSnVdw=;
 b=JlXC5iy207yK1GGB1c9lETppLpO2z9eJ5tMiH3+/o0hdsth/UZre8eXEq609JqhWZN
 7jHOLlXevRDwdyQV4/ndJ04N/bIHnrhUsH+EPh0SOlZsOgM7KQP3+a3rUWtorfUALut5
 uaaQMxnN2O1gSGKeQ4Z+p0Di/+bXg4WLO1ZngCkghTRjG7deT2NMVhbxabdYfZunbqVL
 XdH+Uiyvcc1wlVKVsuovGbos/zyDnMrvGKg6DSNwWxdcliaMAPqW7ePCN5oIiMZWjMBg
 BkFTDI2HSLurlRJoR5r5TFEyn+bU8Bq62vCfvU+p3+Vl/Yq1UJUVq8kpFlrrUE5S6sQP
 b+PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsKUNlp1WORovfctKPXFbNSyOj+su+YakrELr/1fUMz8Sw8vut1SpOIyaUrn4awQPjgQ1yyI+QBnEc0Cv6VTP8bfyw/SIWny5Vowjurg0/
X-Gm-Message-State: AOJu0YzmQQ56NzBytjoVuCNuwOU2Wuvmazh03mEvb7/SWTCCKWlt7Gyw
 0esHRBSSHv4cuDtgR3tceQBBtAojnI2g2+4GYK0tmLAVijpHb0f5AJuLSkUjVgA=
X-Google-Smtp-Source: AGHT+IHgbI9drlF/n3E0ht+dUnRhYOaeqMiXPWKHXV7WRm8Zn8FiFB3dp3IVQhdo6PrNO2EoJnOnLw==
X-Received: by 2002:a2e:7219:0:b0:2d8:6a04:6ac4 with SMTP id
 n25-20020a2e7219000000b002d86a046ac4mr2399047ljc.28.1712369707253; 
 Fri, 05 Apr 2024 19:15:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a2eb5b0000000b002d816c0500asm333494ljn.118.2024.04.05.19.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 19:15:06 -0700 (PDT)
Date: Sat, 6 Apr 2024 05:15:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_bjorande@quicinc.com, johan@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
Message-ID: <esbu3omf2dg6h5fj4zmvhvet7k4qe6sewzoob64bmoc7nfktih@3dobc4uav5ay>
References: <20240406001715.8181-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240406001715.8181-1-quic_abhinavk@quicinc.com>
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

On Fri, Apr 05, 2024 at 05:17:14PM -0700, Abhinav Kumar wrote:
> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
> In the external HPD case, hotplug event is delivered by pmic glink to DP driver
> using drm_aux_hpd_bridge_notify().

There can be other drivers in front of the DP chain. For example,
altmode driver uses drm_connector_oob_hotplug_event() to deliver HPD
events.

> 
> The stacktrace showing the sequence of events is below:
> 
> dp_bridge_hpd_notify+0x18/0x70 [msm]
> drm_bridge_connector_detect+0x60/0xe8 [drm_kms_helper]
> drm_helper_probe_detect+0x94/0xc0 [drm_kms_helper]
> drm_helper_probe_single_connector_modes+0x43c/0x53c [drm_kms_helper]
> drm_client_modeset_probe+0x240/0x1114 [drm]
> drm_fb_helper_hotplug_event.part.26+0x9c/0xe8 [drm_kms_helper]
> drm_fb_helper_hotplug_event+0x24/0x38 [drm_kms_helper]
> msm_fbdev_client_hotplug+0x24/0xd4 [msm]
> drm_client_dev_hotplug+0xd8/0x148 [drm]
> drm_kms_helper_connector_hotplug_event+0x30/0x3c [drm_kms_helper]
> drm_bridge_connector_handle_hpd+0x84/0x94 [drm_kms_helper]
> drm_bridge_connector_hpd_cb+0xc/0x14 [drm_kms_helper]
> drm_bridge_hpd_notify+0x38/0x50 [drm]
> drm_aux_hpd_bridge_notify+0x14/0x20 [aux_hpd_bridge]
> pmic_glink_altmode_worker+0xec/0x27c [pmic_glink_altmode]
> process_scheduled_works+0x17c/0x2cc
> worker_thread+0x2ac/0x2d0
> kthread+0xfc/0x120
> 
> There are three notifications delivered to DP driver for each notification event.
> 
> 1) From the drm_aux_hpd_bridge_notify() itself as shown above
> 
> 2) From output_poll_execute() thread which arises due to
> drm_helper_probe_single_connector_modes() call of the above stacktrace
> as shown in more detail here.
> 
> dp_bridge_hpd_notify+0x18/0x70 [msm]
> drm_bridge_connector_detect+0x60/0xe8 [drm_kms_helper]
> drm_helper_probe_detect+0x94/0xc0 [drm_kms_helper]
> drm_helper_probe_single_connector_modes+0x43c/0x53c [drm_kms_helper]
> drm_client_modeset_probe+0x240/0x1114 [drm]
> drm_fb_helper_hotplug_event.part.26+0x9c/0xe8 [drm_kms_helper]
> drm_fb_helper_hotplug_event+0x24/0x38 [drm_kms_helper]
> msm_fbdev_client_hotplug+0x24/0xd4 [msm]
> drm_client_dev_hotplug+0xd8/0x148 [drm]
> drm_kms_helper_hotplug_event+0x30/0x3c [drm_kms_helper]
> output_poll_execute+0xe0/0x210 [drm_kms_helper]
> 
> 3) From the DP driver as the dp_bridge_hpd_notify() callback today triggers
> the hpd_event_thread for connect and disconnect events respectively via below stack
> 
> dp_bridge_hpd_notify+0x18/0x70 [msm]
> drm_bridge_connector_detect+0x60/0xe8 [drm_kms_helper]
> drm_helper_probe_detect_ctx+0x98/0x110 [drm_kms_helper]
> check_connector_changed+0x4c/0x20c [drm_kms_helper]
> drm_helper_hpd_irq_event+0x98/0x120 [drm_kms_helper]
> hpd_event_thread+0x478/0x5bc [msm]
> 
> We have to address why we end up with 3 events for every single event so something
> is broken with how we work with the drm_bridge_connector.
> 
> But, the dp_bridge_hpd_notify() delivered from output_poll_execute() thread will
> return the incorrect HPD status DP driver because the .detect() returns the value
> of link_ready and not the HPD status currently.
> 
> And because the HPD event thread has not run yet and this results in the two complementary
> events.
> 
> To fix this problem lets have dp_bridge_hpd_notify() call
> dp_hpd_plug_handle/unplug_handle() directly instead of going through the
> event thread.
> 
> Then the following .detect() called by drm_kms_helper_connector_hotplug_event()
> will return correct value of HPD status since it uses the correct link_ready value.
> 
> With this change, the HPD status delivered by both drm_bridge_connector_hpd_notify()
> and drm_kms_helper_connector_hotplug_event() will match each other consistently.

Please take a look at Documentation/process/submitting-patches.rst

With the commit message fixed, the change LGTM. Thanks a lot for
describing the call chains leading to this issue.

I must admit, initially I thought that the change should be rejected on
a basis of being a band-aid, but after studying the call graphs and the
locking within the DP driver, the change looks correct to me.

> 
> changes in v2:
> 	- Fix the commit message to explain the scenario
> 	- Fix the subject a little as well
> 
> Fixes: 542b37efc20e ("drm/msm/dp: Implement hpd_notify()")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d80f89581760..dfb10584ff97 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1665,7 +1665,8 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  		return;
>  
>  	if (!dp_display->link_ready && status == connector_status_connected)
> -		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> +		dp_hpd_plug_handle(dp, 0);
>  	else if (dp_display->link_ready && status == connector_status_disconnected)
> -		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +		dp_hpd_unplug_handle(dp, 0);
> +
>  }
> -- 
> 2.43.2
> 

-- 
With best wishes
Dmitry
