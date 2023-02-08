Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361F668F9FD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 22:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A71610E87D;
	Wed,  8 Feb 2023 21:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5482B10E2FF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 21:57:55 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gr7so1000866ejb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 13:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MAMFt1aPJo18xP4AIsWhXb9FL9I/8bW+FhG+eCO1XZ4=;
 b=dpJkTAswmNccKOefc+p6ku7H/zyNja7d0Y+o+0Nm2WYF8rpIVn6Tp+oJ8y3ji7LT42
 cqdOnqg8PUEkyhw7qoxtnqJ7ya3xf8wnJUaaXasOczUrMOuI6xJTlydfky0+EY35qv1G
 xIZh/k8mu9W8d709rCFEXHLdmN46ttir6E9KKczApoLbbtWS1eee9jfjuRmV6+M4Qw/A
 rifUvq5FPhlQoUtvpMDlux/wjKi5BX5V3i69AkeQGMmnpVKqTJ6226Y6VQ9ViCCfyaoc
 zd43Pk9pTNMmRfsldMQvvDYIRkoGS50E2tCka6guliSwow/pnECvwNLlyKxT4Lp6JPYJ
 692w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MAMFt1aPJo18xP4AIsWhXb9FL9I/8bW+FhG+eCO1XZ4=;
 b=7UgsFfo5CcENXAjn3xLcsJAligINN8sBkFQbLc5cOqX37cwe9+swhARFYzs1xyLcwd
 Aj/Uiyndz54CcjekAumHDyMs4n8GdCe3C1V/Q+u39bTN4WgwuScny3jlziMpGibJCVfK
 Y9H2YALgu4ETuX8z9kVfn6i9k7Xzz5W8iqSdz5kyhKLKdJro0GaWI1b3TUG+T+tZzO9M
 nPfIUo5SzBYTug/K6delXqTDv6uH+YYyUfsFpQIBbiN8k6aOKNC5t1KIkbo4n4W1TfTd
 f9PPoVGYjNdkmvQ88TB0Mgzf34pyClDYEKUxIhz/fi0aiUfM2gOBfj5zZYytDGSGAGRL
 w8Gg==
X-Gm-Message-State: AO0yUKXwiOexl4UAexn9IJ/eESpMuB4qAS/De5HM1+tknXK7m5FSuOmE
 4zCx09ZmTO2EG52LsGc7V7HffA==
X-Google-Smtp-Source: AK7set/quKsrp7WTvk4iNDTfsuo8Oia95aFeSRmlzVjpzXa5AkK/EnbdW4P+pxFCzsz8odykxSRdsQ==
X-Received: by 2002:a17:906:8d07:b0:8aa:bf47:8533 with SMTP id
 rv7-20020a1709068d0700b008aabf478533mr6717723ejc.31.1675893473837; 
 Wed, 08 Feb 2023 13:57:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a17090674cc00b008aac25d8f7fsm5316ejl.97.2023.02.08.13.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 13:57:53 -0800 (PST)
Message-ID: <d7101ed7-12ba-4e0a-683f-718a5190ba71@linaro.org>
Date: Wed, 8 Feb 2023 23:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v12 13/14] drm/msm/disp/dpu: add PSR support for eDP
 interface in dpu driver
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Polimera <vpolimer@qti.qualcomm.com>,
 "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1675091494-13988-1-git-send-email-quic_vpolimer@quicinc.com>
 <1675091494-13988-14-git-send-email-quic_vpolimer@quicinc.com>
 <60af517c-e22d-780c-221c-4df41f1e7c5c@linaro.org>
 <BN0PR02MB81732F599DBA2D68A4B542DAE4DB9@BN0PR02MB8173.namprd02.prod.outlook.com>
 <3c3d8533-d0b6-2c7c-32a4-8c7fc1ae4af8@linaro.org>
In-Reply-To: <3c3d8533-d0b6-2c7c-32a4-8c7fc1ae4af8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 17:25, Dmitry Baryshkov wrote:
> On 07/02/2023 16:26, Vinod Polimera wrote:
>>
>>
>>> -----Original Message-----
>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Sent: Tuesday, January 31, 2023 6:29 PM
>>> To: Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>; dri-
>>> devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>>> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org; robdclark@gmail.com;
>>> dianders@chromium.org; swboyd@chromium.org; Kalyan Thota (QUIC)
>>> <quic_kalyant@quicinc.com>; Kuogee Hsieh (QUIC)
>>> <quic_khsieh@quicinc.com>; Vishnuvardhan Prodduturi (QUIC)
>>> <quic_vproddut@quicinc.com>; Bjorn Andersson (QUIC)
>>> <quic_bjorande@quicinc.com>; Abhinav Kumar (QUIC)
>>> <quic_abhinavk@quicinc.com>; Sankeerth Billakanti (QUIC)
>>> <quic_sbillaka@quicinc.com>
>>> Subject: Re: [PATCH v12 13/14] drm/msm/disp/dpu: add PSR support for eDP
>>> interface in dpu driver
>>>
>>>
>>> On 30/01/2023 17:11, Vinod Polimera wrote:
>>>> Enable PSR on eDP interface using drm self-refresh librabry.
>>>> This patch uses a trigger from self-refresh library to enter/exit
>>>> into PSR, when there are no updates from framework.
>>>>
>>>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>>>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 ++++++++++++-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
>>>>    3 files changed, 27 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> index f29a339..60e5984 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> @@ -21,6 +21,7 @@
>>>>    #include <drm/drm_probe_helper.h>
>>>>    #include <drm/drm_rect.h>
>>>>    #include <drm/drm_vblank.h>
>>>> +#include <drm/drm_self_refresh_helper.h>
>>>>
>>>>    #include "dpu_kms.h"
>>>>    #include "dpu_hw_lm.h"
>>>> @@ -1021,6 +1022,9 @@ static void dpu_crtc_disable(struct drm_crtc 
>>>> *crtc,
>>>>
>>>>        DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
>>>>
>>>> +     if (old_crtc_state->self_refresh_active)
>>>> +             return;
>>>> +
>>>
>>> I have been looking at the crtc_needs_disable(). It explicitly mentions
>>> that 'We also need to run through the crtc_funcs->disable() function
>>> [..] if it's transitioning to self refresh mode...'. Don't we need to
>>> perform some cleanup here (like disabling the vblank irq handling,
>>> freeing the bandwidth, etc)?
>>
>> When self refresh active is enabled, then we will clean up irq 
>> handling and bandwidth etc.
>> The above case is to handle display off commit triggered when we are 
>> in psr as all
>>   the resources are already cleaned up . we just need to do an early 
>> return.
>>>
>>>>        /* Disable/save vblank irq handling */
>>>>        drm_crtc_vblank_off(crtc);
>>>>
>>>> @@ -1577,7 +1581,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device
>>> *dev, struct drm_plane *plane,
>>>>    {
>>>>        struct drm_crtc *crtc = NULL;
>>>>        struct dpu_crtc *dpu_crtc = NULL;
>>>> -     int i;
>>>> +     int i, ret;
>>>>
>>>>        dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
>>>>        if (!dpu_crtc)
>>>> @@ -1614,6 +1618,13 @@ struct drm_crtc *dpu_crtc_init(struct
>>> drm_device *dev, struct drm_plane *plane,
>>>>        /* initialize event handling */
>>>>        spin_lock_init(&dpu_crtc->event_lock);
>>>>
>>>> +     ret = drm_self_refresh_helper_init(crtc);
>>>> +     if (ret) {
>>>> +             DPU_ERROR("Failed to initialize %s with self-refresh 
>>>> helpers %d\n",
>>>> +                     crtc->name, ret);
>>>> +             return ERR_PTR(ret);
>>>> +     }
>>>> +
>>>>        DRM_DEBUG_KMS("%s: successfully initialized crtc\n", dpu_crtc-
>>>> name);
>>>>        return crtc;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 01b7509..450abb1 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -12,6 +12,7 @@
>>>>    #include <linux/kthread.h>
>>>>    #include <linux/seq_file.h>
>>>>
>>>> +#include <drm/drm_atomic.h>
>>>>    #include <drm/drm_crtc.h>
>>>>    #include <drm/drm_file.h>
>>>>    #include <drm/drm_probe_helper.h>
>>>> @@ -1212,11 +1213,24 @@ static void
>>> dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>>>>                                        struct drm_atomic_state *state)
>>>>    {
>>>>        struct dpu_encoder_virt *dpu_enc = NULL;
>>>> +     struct drm_crtc *crtc;
>>>> +     struct drm_crtc_state *old_state = NULL;
>>>>        int i = 0;
>>>>
>>>>        dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>>        DPU_DEBUG_ENC(dpu_enc, "\n");
>>>>
>>>> +     crtc = drm_atomic_get_old_crtc_for_encoder(state, drm_enc);
>>>> +     if (crtc)
>>>> +             old_state = drm_atomic_get_old_crtc_state(state, crtc);
>>>> +
>>>> +     /*
>>>> +      * The encoder is already disabled if self refresh mode was 
>>>> set earlier,
>>>> +      * in the old_state for the corresponding crtc.
>>>> +      */
>>>> +     if (old_state && old_state->self_refresh_active)
>>>> +             return;
>>>> +
>>>
>>> Again the same question here, doesn't crtc_needs_disable() take care of
>>> this clause? I might be missing something in the PSR state transitions.
>>> Could you please add some explanation here?
>> Same usecase as above, applies to encoder disable also when triggered 
>> via disable commit
>> When driver is in psr state.
> 
> Ack, thank you for the explanations. I'd like to take another glance 
> later today, but generally it look good to me.

After another glance it still looks good to me. Please send the last 
iteration of the series:
- moving all core patches to the first place, as it was asked 
previously. This will help us get them merged to drm core repo first
- dropping the patch 09 as agreed.

-- 
With best wishes
Dmitry

