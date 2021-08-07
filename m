Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE393E36F4
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 21:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9C9899A7;
	Sat,  7 Aug 2021 19:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC81899E7
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Aug 2021 19:21:26 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z4so15663551wrv.11
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Aug 2021 12:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zC7y0PTScHH/ipa0plXxkGuFfW8aO4YnqDt5Y1MGCY0=;
 b=g3dFNgA7i0iE8E6mG+gjMhuM9jRtxcDw0QINW0Nsofw2sWRnJ31YxvzY7TPAvJGQRL
 m3S6eM8ljhIuOIxlVHvfjnVOR2NhRWEfhIvcY1gx/HX9z6/w64bX6A/xOSTx84k5AORF
 wBTUiYZJId0XcrNNwLsmoI2eZ40kbvSyYrA+wd/nV5R82vQifnxiyAcRXkqDFkvgCMKG
 r+NTnigaiyTlWiITnSk/zPdI1bCwHYfXcOV1KFpu/GHSr+HDWmzgbJK0S+Bk35DbzjKZ
 HrXRhu4D5WWtaGB7Cvy5shGwYLYmLFecYgejryXtHNOVgWvZeCB/1wIrnWK/4L8sqs8F
 Itbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zC7y0PTScHH/ipa0plXxkGuFfW8aO4YnqDt5Y1MGCY0=;
 b=bor/su87fqcLKIA2wo9O1eXboqF9aN/94cE9XrhpQGBdZub0BmaYR+iXHDuO8jWzYL
 XnCJsqV9TCbvRr1nDs2pvObpcWSwwtdRVLL9i5iF5xZHykim3Fe1EJ8US4uMKQPLtX6G
 OOxp2NjPFLohuM8VqxhAsMTMglUFiYsxHWa19VXm5BOb6X8IvbeMAc5G674nmnb0GHoA
 J+eD/H3TGOQv7wxzFeZK/jDRxKhBI8GBCpdYR6UwFNXYNv6rR/HH/R3wv54rpBu6ZlIT
 kDWY85IHgr4tppaUfSpJrUmDRnnv16Ip+yCAyCaTSp8SIynbcTxyZAAKOfVtJe2huUVF
 a84A==
X-Gm-Message-State: AOAM5339K/OwGXN/GxzMlxZYBUZ+t13MInXOkSt2/WQGTddvjwfHoykb
 Xe8NovSAo4c6Y531IJYQZdH25g==
X-Google-Smtp-Source: ABdhPJwiBDzwzKcPs4zWy4oXDjCpfq+MNG7C4K4L/MMLUf73Bu+Rx6T3sDCJusA6dSg21VQ09tviVw==
X-Received: by 2002:a05:6000:1241:: with SMTP id
 j1mr3531000wrx.338.1628364085060; 
 Sat, 07 Aug 2021 12:21:25 -0700 (PDT)
Received: from [192.168.1.12] (host-92-17-52-101.as13285.net. [92.17.52.101])
 by smtp.gmail.com with ESMTPSA id
 i10sm16041196wmq.21.2021.08.07.12.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 12:21:24 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <akhilpo@codeaurora.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <20210729183942.2839925-1-robdclark@gmail.com>
 <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
 <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
 <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
Message-ID: <b7334a1a-c4ad-da90-03b4-0d19e1811b13@linaro.org>
Date: Sat, 7 Aug 2021 20:21:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob, Akhil,

On 29/07/2021 21:53, Rob Clark wrote:
> On Thu, Jul 29, 2021 at 1:28 PM Caleb Connolly
> <caleb.connolly@linaro.org> wrote:
>>
>>
>>
>> On 29/07/2021 21:24, Rob Clark wrote:
>>> On Thu, Jul 29, 2021 at 1:06 PM Caleb Connolly
>>> <caleb.connolly@linaro.org> wrote:
>>>>
>>>> Hi Rob,
>>>>
>>>> I've done some more testing! It looks like before that patch ("drm/msm: Devfreq tuning") the GPU would never get above
>>>> the second frequency in the OPP table (342MHz) (at least, not in glxgears). With the patch applied it would more
>>>> aggressively jump up to the max frequency which seems to be unstable at the default regulator voltages.
>>>
>>> *ohh*, yeah, ok, that would explain it
>>>
>>>> Hacking the pm8005 s1 regulator (which provides VDD_GFX) up to 0.988v (instead of the stock 0.516v) makes the GPU stable
>>>> at the higher frequencies.
>>>>
>>>> Applying this patch reverts the behaviour, and the GPU never goes above 342MHz in glxgears, losing ~30% performance in
>>>> glxgear.
>>>>
>>>> I think (?) that enabling CPR support would be the proper solution to this - that would ensure that the regulators run
>>>> at the voltage the hardware needs to be stable.
>>>>
>>>> Is hacking the voltage higher (although ideally not quite that high) an acceptable short term solution until we have
>>>> CPR? Or would it be safer to just not make use of the higher frequencies on a630 for now?
>>>>
>>>
>>> tbh, I'm not sure about the regulator stuff and CPR.. Bjorn is already
>>> on CC and I added sboyd, maybe one of them knows better.
>>>
>>> In the short term, removing the higher problematic OPPs from dts might
>>> be a better option than this patch (which I'm dropping), since there
>>> is nothing stopping other workloads from hitting higher OPPs.
>> Oh yeah that sounds like a more sensible workaround than mine .
>>>
>>> I'm slightly curious why I didn't have problems at higher OPPs on my
>>> c630 laptop (sdm850)
>> Perhaps you won the sillicon lottery - iirc sdm850 is binned for higher clocks as is out of the factory.
>>
>> Would it be best to drop the OPPs for all devices? Or just those affected? I guess it's possible another c630 might
>> crash where yours doesn't?
> 
> I've not heard any reports of similar issues from the handful of other
> folks with c630's on #aarch64-laptops.. but I can't really say if that
> is luck or not.
It looks like this affects at least the OnePlus 6 and PocoPhone F1, I've done some more poking and the following diff 
seems to fix the stability issues completely, it seems the delay is required to let the update propagate.

This doesn't feel like the right fix, but hopefully it's enough to come up with a better solution than disabling the new 
devfreq behaviour on a630.

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index d7cec7f0dde0..69e2a5e84dae 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -139,6 +139,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
                 return;
         }

+       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
+
+       usleep_range(300, 500);
+
         gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);

         gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
@@ -158,7 +162,6 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
         if (ret)
                 dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);

-       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
         pm_runtime_put(gmu->dev);
  }
> 
> Maybe just remove it for affected devices?  But I'll defer to Bjorn.
> 
> BR,
> -R
> 

-- 
Kind Regards,
Caleb (they/them)
