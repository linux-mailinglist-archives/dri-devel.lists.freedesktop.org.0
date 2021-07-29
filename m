Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0713DAD97
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 22:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E663F6EE5A;
	Thu, 29 Jul 2021 20:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4946EE59
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 20:28:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so2200300wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 13:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yjvy0nNjdoVdeBRrNfPDRD8M9hukWpC6XSosKuNv5ME=;
 b=uXQbJc9YN7jcauyWcxa/AhQHH/ohDJah+P0h3TjE+ye9WEGAKdpNOiKwp67zax537M
 F43p5oywXQXzW7asCsVSZPRdoUPuNWn65XyxofHmG7aWxMGp+tJIyLgWAxAsx0xX4+BP
 83Mv2s4tjdzEoYFWep02aUKE+e0dh7ik6Pl6EJrAobwEdsQ2e0XYKw7xZ6NrHw42FtBb
 4KGArkAiSRGW1h0aCCjkK3PUpAakI9OvAOvzm8rg27FRIaYu+kLYVv7wp7HIrkpm3e6H
 lMm+UbmOX7hCOrlUJ1tRpU1ILGxcun833XNajyZNblK46IgBhP0Y8bxu0l5k15NUag+l
 n9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yjvy0nNjdoVdeBRrNfPDRD8M9hukWpC6XSosKuNv5ME=;
 b=UthUhOaIKrxKyY5p+YjQ3xedN/BIcpfb897uYTXIjqIcaL4QU6dnp/EHxN1M9EJNzO
 BE05ZHMiGdpn7h7t/CMPoutzRZ227Yxn5Ct4f74TWU55vgaFmOh5GeK4vC0YOJNh/K5q
 1rvXZQpGG2ZNb6gTC0hK5Id69LHU4Vnn1JjlGLsZaA9o9mEuF+ybAwca8KJgPRKu1uVA
 IHUipOq6gt7OflGJUaQy4S91BsCXKeyXZM3us5b8qVhi5qd884dKxWFbrooQpbAHzJmu
 IzE1AWQadajw9JQpS+xxSrGkomqI6eFrNgPL2U6nrtp8fYm3FI/ig9DEbOwa6OsNjGij
 TddA==
X-Gm-Message-State: AOAM5332g50/xyYdPCT5S1GGCmvw+/+bffmC70Bf2GAtNxEcgITZPZHl
 v0iYnZ/4FjlCfNyQvukuQQVf1A==
X-Google-Smtp-Source: ABdhPJzkzIH6AZrxd5zBBNCDr+3o/XoHDyD63OWg5X4bm6XBxl9fD1BIEF0IQ1s/N/Tdsj+GfXWN5w==
X-Received: by 2002:a05:600c:19d3:: with SMTP id
 u19mr224549wmq.115.1627590530830; 
 Thu, 29 Jul 2021 13:28:50 -0700 (PDT)
Received: from [192.168.1.12] (host-80-41-121-59.as13285.net. [80.41.121.59])
 by smtp.gmail.com with ESMTPSA id
 v6sm4474677wru.50.2021.07.29.13.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 13:28:50 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To: Rob Clark <robdclark@gmail.com>
References: <20210729183942.2839925-1-robdclark@gmail.com>
 <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
 <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
Message-ID: <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
Date: Thu, 29 Jul 2021 21:28:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29/07/2021 21:24, Rob Clark wrote:
> On Thu, Jul 29, 2021 at 1:06 PM Caleb Connolly
> <caleb.connolly@linaro.org> wrote:
>>
>> Hi Rob,
>>
>> I've done some more testing! It looks like before that patch ("drm/msm: Devfreq tuning") the GPU would never get above
>> the second frequency in the OPP table (342MHz) (at least, not in glxgears). With the patch applied it would more
>> aggressively jump up to the max frequency which seems to be unstable at the default regulator voltages.
> 
> *ohh*, yeah, ok, that would explain it
> 
>> Hacking the pm8005 s1 regulator (which provides VDD_GFX) up to 0.988v (instead of the stock 0.516v) makes the GPU stable
>> at the higher frequencies.
>>
>> Applying this patch reverts the behaviour, and the GPU never goes above 342MHz in glxgears, losing ~30% performance in
>> glxgear.
>>
>> I think (?) that enabling CPR support would be the proper solution to this - that would ensure that the regulators run
>> at the voltage the hardware needs to be stable.
>>
>> Is hacking the voltage higher (although ideally not quite that high) an acceptable short term solution until we have
>> CPR? Or would it be safer to just not make use of the higher frequencies on a630 for now?
>>
> 
> tbh, I'm not sure about the regulator stuff and CPR.. Bjorn is already
> on CC and I added sboyd, maybe one of them knows better.
> 
> In the short term, removing the higher problematic OPPs from dts might
> be a better option than this patch (which I'm dropping), since there
> is nothing stopping other workloads from hitting higher OPPs.
Oh yeah that sounds like a more sensible workaround than mine 😅.
> 
> I'm slightly curious why I didn't have problems at higher OPPs on my
> c630 laptop (sdm850)
Perhaps you won the sillicon lottery - iirc sdm850 is binned for higher clocks as is out of the factory.

Would it be best to drop the OPPs for all devices? Or just those affected? I guess it's possible another c630 might 
crash where yours doesn't?
> 
> BR,
> -R
> 
>>
>> On 29/07/2021 19:39, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> The more frequent frequency transitions resulting from clamping freq to
>>> minimum when the GPU is idle seems to be causing some issue with the bus
>>> getting voted off when it should be on.  (An enable racing with an async
>>> disable?)  This might be a problem outside of the GPU, as I can't
>>> reproduce this on a618 which uses the same GMU fw and same mechanism to
>>> communicate with GMU to set opp.  For now, just revert to previous
>>> devfreq behavior on a630 until the issue is understood.
>>>
>>> Reported-by: Caleb Connolly <caleb.connolly@linaro.org>
>>> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
>>>    drivers/gpu/drm/msm/msm_gpu.h           |  2 ++
>>>    drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 12 ++++++++++++
>>>    3 files changed, 17 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> index 748665232d29..9fd08b413010 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> @@ -945,6 +945,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>        pm_runtime_use_autosuspend(dev);
>>>        pm_runtime_enable(dev);
>>>
>>> +     if (adreno_is_a630(adreno_gpu))
>>> +             gpu->devfreq.disable_freq_clamping = true;
>>> +
>>>        return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
>>>                        adreno_gpu->info->name, &adreno_gpu_config);
>>>    }
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
>>> index 0e4b45bff2e6..7e11b667f939 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>>> @@ -112,6 +112,8 @@ struct msm_gpu_devfreq {
>>>         * it is inactive.
>>>         */
>>>        unsigned long idle_freq;
>>> +
>>> +     bool disable_freq_clamping;
>>>    };
>>>
>>>    struct msm_gpu {
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>> index 0a1ee20296a2..a832af436251 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>> @@ -94,6 +94,12 @@ void msm_devfreq_init(struct msm_gpu *gpu)
>>>        if (!gpu->funcs->gpu_busy)
>>>                return;
>>>
>>> +     /* Revert to previous polling interval if we aren't using freq clamping
>>> +      * to preserve previous behavior
>>> +      */
>>> +     if (gpu->devfreq.disable_freq_clamping)
>>> +             msm_devfreq_profile.polling_ms = 10;
>>> +
>>>        msm_devfreq_profile.initial_freq = gpu->fast_rate;
>>>
>>>        /*
>>> @@ -151,6 +157,9 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>>>        unsigned int idle_time;
>>>        unsigned long target_freq = df->idle_freq;
>>>
>>> +     if (gpu->devfreq.disable_freq_clamping)
>>> +             return;
>>> +
>>>        /*
>>>         * Hold devfreq lock to synchronize with get_dev_status()/
>>>         * target() callbacks
>>> @@ -186,6 +195,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>>>        struct msm_gpu_devfreq *df = &gpu->devfreq;
>>>        unsigned long idle_freq, target_freq = 0;
>>>
>>> +     if (gpu->devfreq.disable_freq_clamping)
>>> +             return;
>>> +
>>>        /*
>>>         * Hold devfreq lock to synchronize with get_dev_status()/
>>>         * target() callbacks
>>>
>>
>> --
>> Kind Regards,
>> Caleb (they/them)

-- 
Kind Regards,
Caleb (they/them)
