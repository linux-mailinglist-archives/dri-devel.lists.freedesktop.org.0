Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA87515DAF
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 15:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A6310E58E;
	Sat, 30 Apr 2022 13:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2959310E57F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 13:38:07 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id 4so13489127ljw.11
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 06:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z224StPKpfNJkqYnnGlbrIBuLs4VIYMHgZt5SQSiFys=;
 b=mACw9Vli3vbd4TpAqv5Wx7FCeNaSq4U7VtaRV063GSQ5Bu2v73UDWnOy0i18Yt9+yg
 diYDG4rA8BGOw6joIuz8d01yqTNx7xCbKoqvHHePNUQyA40mZXA8ikq9C/4phGzWBXOu
 EOdDIP+U4DHcO8HryNBp1Lww1CQEpCNJ1Hp2sjud4RokVxh1HjszdUlq2794oStJ6avs
 d2YtyfE3u+xLlh0o8Hq/eIHia8J9ZZ2rGbOGt+Qihh21A48nuWfAbYj8vr9LP4KyZ9BZ
 YYyCIC5g3WdC74vXZ3D7sJIVxplD1e2K+pq6m8hfynfB2FxlCswY67bTQeBnnC/hzX1F
 ShVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z224StPKpfNJkqYnnGlbrIBuLs4VIYMHgZt5SQSiFys=;
 b=OMPMcbg5ojxKkdy9Cye1nP5gl8kFllrbw9c+mUGO7x/X77ZPhKVn/C1nt1WjrjQNBE
 LS1qEroWv1Uw1m3BhvPCUN7h2oQNpGgVdqstO4HojHavbXReALrrWcFjYRakrogvGjPf
 i7zUZslR7x/aPtUunNurJs60X3kiYIi18oVO7Y80XFxfhORZZnrCPcRLHr7qOenjM9IJ
 zzcXkFqcoUywO5rvDP0OR58UMzjvc1oALmqcKLbRj6ftbnpPEG/79Jk0j03LSyJqcpOb
 1aJR5EDRGh1tXZU25UcRiRzint7iJCefJON7jnkGukQx2a/4G3So4EHGXq16Qw8YcHzC
 1vgA==
X-Gm-Message-State: AOAM530BJcuzngIPVVJksFAkeipjkG9gw8xpV2Cz74nvH7HKbEyIcbMo
 flUKDnLnlGoqmirLmNgRH1V/6A==
X-Google-Smtp-Source: ABdhPJyvyODGlpLLWI7jidGiWEZ5qGHHMOMmVYQqsly4z9SlG0uQf2rtksojRoe4G+wpvMlKZrYUwQ==
X-Received: by 2002:a2e:bd83:0:b0:24e:fe7b:7235 with SMTP id
 o3-20020a2ebd83000000b0024efe7b7235mr2631688ljq.409.1651325885468; 
 Sat, 30 Apr 2022 06:38:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 16-20020a05651c00d000b0024f3d1daeebsm544327ljr.115.2022.04.30.06.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 06:38:05 -0700 (PDT)
Message-ID: <9b9e3b1a-5045-0ca0-95f1-61910566c353@linaro.org>
Date: Sat, 30 Apr 2022 16:38:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/msm/dpu: Clean up CRC debug logs
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20220430003917.132-1-quic_jesszhan@quicinc.com>
 <ee50adbc-7b39-e586-53f6-3102b3b8c7ff@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ee50adbc-7b39-e586-53f6-3102b3b8c7ff@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/04/2022 03:41, Abhinav Kumar wrote:
> Hi Jessica
> 
> Please add reported by for dmitry and suggested-by for Rob.

You (or Jessica) could have replied with these tags in the body of the 
message. Patchwork would have picked them up.

> 
> Thanks
> 
> Abhinav
> 
> On 4/29/2022 5:39 PM, Jessica Zhang wrote:
>> Currently, dpu_hw_lm_collect_misr returns EINVAL if CRC is disabled.
>> This causes a lot of spam in the DRM debug logs as it's called for every
>> vblank.
>>
>> Instead of returning EINVAL when CRC is disabled in
>> dpu_hw_lm_collect_misr, let's return ENODATA and add an extra ENODATA 
>> check
>> before the debug log in dpu_crtc_get_crc.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB5  (qrb5165)
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 3 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 2 +-
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 7763558ef566..16ba9f9b9a78 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -204,7 +204,8 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>>           rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
>>           if (rc) {
>> -            DRM_DEBUG_DRIVER("MISR read failed\n");
>> +            if (rc != -ENODATA)
>> +                DRM_DEBUG_DRIVER("MISR read failed\n");
>>               return rc;
>>           }
>>       }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> index 86363c0ec834..462f5082099e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> @@ -138,7 +138,7 @@ static int dpu_hw_lm_collect_misr(struct 
>> dpu_hw_mixer *ctx, u32 *misr_value)
>>       ctrl = DPU_REG_READ(c, LM_MISR_CTRL);
>>       if (!(ctrl & LM_MISR_CTRL_ENABLE))
>> -        return -EINVAL;
>> +        return -ENODATA;
>>       if (!(ctrl & LM_MISR_CTRL_STATUS))
>>           return -EINVAL;


-- 
With best wishes
Dmitry
