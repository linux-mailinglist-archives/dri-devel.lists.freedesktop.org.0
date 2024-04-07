Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818A889ADF7
	for <lists+dri-devel@lfdr.de>; Sun,  7 Apr 2024 04:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCA510F673;
	Sun,  7 Apr 2024 02:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kjS0hESS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE4C10F672
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Apr 2024 02:04:00 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dccb1421bdeso3367171276.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Apr 2024 19:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712455439; x=1713060239; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/EZBl0kCTgMxcq/jZN2+jK2LUFglvi7j7hmZF1Wp3+U=;
 b=kjS0hESSUrIq01fzvsYvgpVpvY/hUHcyGYSCrgnatx1wZrCp53XgspD9ofVekGl/nU
 ShSCCYTV3H/mNarvBOXvbiQHsSO+HQ2vA5muZh0TzHd39ESnXkgnd70ofVF0LNwJqL6S
 6VjnPfiazwP4qQMZVzCGfs4vwCe9KeDjUy2rvXyYxefRW2b+JdqR+Kv7hoIbnXrlBLfO
 PRzVB6J0qrxc12+ZW9OoU4mQ4LPRwKF7xfSSvF9dWopLrzFHOSkHr7tSaQcT1gGLvEO8
 1Gypen9Z9rmL3j5JiiosjGAm4AHjeaeuCsKSMoaFCMc+DhyxNL+01iI8syDTHxyTTjRF
 0lTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712455439; x=1713060239;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/EZBl0kCTgMxcq/jZN2+jK2LUFglvi7j7hmZF1Wp3+U=;
 b=ZnpMGKrP/sUNxL0bonos5lh/iq3qw7AJm+rfhvl97U549AkK0XNBRIrzTSGcTeWgO9
 ea3pGc+IXXSUs/HtTBPnPhEE19rBVfxUIexRpO3QkuCPN1sqi0lLQRAeZzC9uWJvGL9i
 i/k9OpV4VNe9w4K14rS0puR5JZCdc02qB1DypO9lYhbOeoZ7b7kplGcLAEkSPsxh2yUT
 cM+doiQqc83WiWkEAE4Xt/r86cwqIoKer0xjTy0HKOsvt95FtTHLHXA0aui9OjYOIwL4
 qCRPLMPOQ7Sf0bsriPepLUPUwI0PgQ8aCyCgb6Yh/sLBKR5RyDZOfDSn/9D2W9h/VbVY
 PXTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwdnztsjj1GsO/74tG4N8rC/2nHpTeN4h8YFI12mbL2hmhP0yn4ZWhqGb5A3SCGIf7a2Wpb+fXNMqAwjg3JILfmHMqOmAtWFD/HIA6Bbf3
X-Gm-Message-State: AOJu0YxxKiRfd8JyjKV408g/bCKpPhqZdDxDhQN1CBmKcjpiUXqEdece
 IoW5l0So+GUt5l1QVGicC3pUhAnXsiEFaTiZvf9sjjrju7L/l2dhn7VJmJr7yEKz7++6IgidFOe
 zaXezYNWikfR1ifqZwXY4phYdTSFgZ2MgeOgrwg==
X-Google-Smtp-Source: AGHT+IESVmqrBCQSNOIT/MkWy80FprAX2aIJsvoJBlMs+XmRvzK7dLUtQxc4/cWFcP0mJPU8jaki6SnYPrG6VITHuTM=
X-Received: by 2002:a25:a282:0:b0:dcd:6722:c728 with SMTP id
 c2-20020a25a282000000b00dcd6722c728mr3984209ybi.14.1712455439287; Sat, 06 Apr
 2024 19:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 7 Apr 2024 05:03:48 +0300
Message-ID: <CAA8EJpo5=t7JUDmq9cbzBgk+MVmwUC=QD3XTtiVY+F9kPyyLwQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_bjorande@quicinc.com, johan@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sat, 6 Apr 2024 at 06:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
>
> For HPD events coming from external modules using drm_bridge_hpd_notify(),
> the sequence of calls leading to dp_bridge_hpd_notify() is like below:
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
> dp_bridge_hpd_notify() delivered from output_poll_execute() thread
> returns the incorrect HPD status as the MSM DP driver returns the value
> of link_ready and not the HPD status currently in the .detect() callback.
>
> And because the HPD event thread has not run yet, this results in two complementary
> events.
>
> To address this, fix dp_bridge_hpd_notify() to call dp_hpd_plug_handle/unplug_handle()
> directly to return consistent values for the above scenarios.
>
> changes in v3:
>         - Fix the commit message as per submitting guidelines.
>         - remove extra line added
>
> changes in v2:
>         - Fix the commit message to explain the scenario
>         - Fix the subject a little as well
>
> Fixes: 542b37efc20e ("drm/msm/dp: Implement hpd_notify()")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
