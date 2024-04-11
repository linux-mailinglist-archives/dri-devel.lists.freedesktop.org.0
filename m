Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92978A21A9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 00:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA2310E679;
	Thu, 11 Apr 2024 22:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KovFftIr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BBC10EDC2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 22:14:17 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d47a92cfefso2989831fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 15:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712873656; x=1713478456; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=khe35T3rndQtWq+CLonCh0dK535CORV1sgkkF2YQ4N0=;
 b=KovFftIrmH3enKJIEMI9tuaeePg7N6ov/ddl4novzfNx4kkd71KvDCLjhXqchr/6jY
 XW4HXMHlL5XyI1oJoxqdJcPn0ihVH7g+O9i6jx5bXmAe4a3k+lXxWm9GZJJT2u1EQqOF
 pdJNaAuA1FI3D03j0AkSpNiVk04DYLduR7K0VlUkxIrTcTXJT7QKbSkJtdrHXGEJx/mY
 5R+VeiX0AEMrT1ShtrfcR8KRbHM9NVq47fRcFnWuz1QqukwUwAyVZVsFEslHXChUBa2G
 GM1dQzsz/hEPzkyAn80SkGxKCQNu/7ygIsfwHA0fiapF5qNhScEwrQgv3siKdqOyOKTi
 90mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712873656; x=1713478456;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=khe35T3rndQtWq+CLonCh0dK535CORV1sgkkF2YQ4N0=;
 b=MysYVTiM6Pt2UmEBbWL0X0JJH+WsWfABCZe9zwf5FsxbqhG8O5rYCruld+gkHmStbt
 h7e5Og1CxSGW+beYMdMf0BjB/HjnCbvSAERAzBgb1BCsqxknfTCqGch2/CEw1ezGX3av
 bd+h8WuL9tF/xP0uSdEAm7k0F6XIg1b8O40ftYhaRCQ0p/Mf1RTlpOJRZNZV3nlB7d6u
 sJEQ9D1nEziP4b5pyGd/cgDVNSHrg2p9PkLDsfwZwEoK5BEFuDzJS+nF2RbZ8L4WkenY
 Xw6CZ0cL7tgTKXA8XmuUkmmwVRg+gCTG3AapGAR+wzBDU1p0kt6g5QFjZgKEYpc9UJqn
 oXzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4UbbiyKD/ck3IzfEYoD5MGmDpZ0tnmEQ5op0epiynYzoiZM6MDEWc/VlLoyVQZpiqdPFnIKUSLfFF2Hs/UazZ2CtMUFjpSiPrp/juBCh2
X-Gm-Message-State: AOJu0YxZMIbw/Azg7RrWw7KADv00fTG0cdnxMSssi+CjCfeCDL9P8owO
 b4Cm4xZgW3Wc1zRmfx3cOGr3P5I7csxNcoRr33eFQouKwM/y+iyCLkc5muL6LFc=
X-Google-Smtp-Source: AGHT+IHx0P+eB1kIYT0Tv83YHPKRC5dpyqK+7bi0JOpLYMlHiy8wC8MbHq/bVI7kd2Fur1HzCSF7Eg==
X-Received: by 2002:a05:6512:3a90:b0:516:d0c0:3c5 with SMTP id
 q16-20020a0565123a9000b00516d0c003c5mr640206lfu.24.1712873655777; 
 Thu, 11 Apr 2024 15:14:15 -0700 (PDT)
Received: from [172.30.204.35] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05651232ac00b00513c253696csm323775lfe.187.2024.04.11.15.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 15:14:15 -0700 (PDT)
Message-ID: <4c13573e-1398-492a-b2cd-3c5ffee348ff@linaro.org>
Date: Fri, 12 Apr 2024 00:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/msm/adreno: Implement SMEM-based speed bin
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-4-ce2b864251b1@linaro.org>
 <scvwfj44z3wpp7phvesfwjuv5awtlkwby2vvrpaq4i5fircrt3@i3ebya4iymf3>
 <730d6b9e-d6b4-41fd-bef3-b1fa6e914a35@linaro.org>
 <33qyr6cfruczllvavvwtbkyuqxmtao4bya4j32zhjx6ni27c6d@rxjehsw54l32>
 <321aa524-ab64-458a-b4c0-70294cc5467d@linaro.org>
 <CAA8EJprvss4RTXQWMQpcE6afpc0Q22zzeGxJBxh4s04E=8rGBA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJprvss4RTXQWMQpcE6afpc0Q22zzeGxJBxh4s04E=8rGBA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/11/24 23:46, Dmitry Baryshkov wrote:
> On Fri, 12 Apr 2024 at 00:35, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 4/10/24 21:26, Dmitry Baryshkov wrote:
>>> On Wed, Apr 10, 2024 at 01:42:33PM +0200, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 4/6/24 05:23, Dmitry Baryshkov wrote:
>>>>> On Fri, Apr 05, 2024 at 10:41:32AM +0200, Konrad Dybcio wrote:
>>>>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>>>>>> abstracted through SMEM, instead of being directly available in a fuse.
>>>>>>
>>>>>> Add support for SMEM-based speed binning, which includes getting
>>>>>> "feature code" and "product code" from said source and parsing them
>>>>>> to form something that lets us match OPPs against.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>
>>>>>> +  }
>>>>>> +
>>>>>> +  ret = qcom_smem_get_product_code(&pcode);
>>>>>> +  if (ret) {
>>>>>> +          dev_err(dev, "Couldn't get product code from SMEM!\n");
>>>>>> +          return ret;
>>>>>> +  }
>>>>>> +
>>>>>> +  /* Don't consider fcode for external feature codes */
>>>>>> +  if (fcode <= SOCINFO_FC_EXT_RESERVE)
>>>>>> +          fcode = SOCINFO_FC_UNKNOWN;
>>>>>> +
>>>>>> +  *speedbin = FIELD_PREP(ADRENO_SKU_ID_PCODE, pcode) |
>>>>>> +              FIELD_PREP(ADRENO_SKU_ID_FCODE, fcode);
>>>>>
>>>>> What about just asking the qcom_smem for the 'gpu_bin' and hiding gory
>>>>> details there? It almost feels that handling raw PCODE / FCODE here is
>>>>> too low-level and a subject to change depending on the socinfo format.
>>>>
>>>> No, the FCODE & PCODE can be interpreted differently across consumers.
>>>
>>> That's why I wrote about asking for 'gpu_bin'.
>>
>> I'd rather keep the magic GPU LUTs inside the adreno driver, especially
>> since not all Snapdragons feature Adreno, but all Adrenos are on
>> Snapdragons (modulo a2xx but I refuse to make design decisions treating
>> these equally to e.g. a6xx)
> 
> LUTs - yes. I wanted to push (FC << a) | (PC << b) and all the RESERVE
> / UNKNOWN magic there.

Ohh this specifically.. yeah I considered pushing that there as well,
but I realized this is specific to the GPU. The socinfo APIs should
only return a valid/unknown code for both P and F and let the consumer
figure out how to interpret these.

> 
>>
>>>
>>>>
>>>>>
>>>>>> +
>>>>>> +  return ret;
>>>>>>     }
>>>>>>     int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>>> @@ -1098,9 +1129,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>>>                             devm_pm_opp_set_clkname(dev, "core");
>>>>>>             }
>>>>>> -  if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>>>>>> +  if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>>>>>>                     speedbin = 0xffff;
>>>>>> -  adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>>>>>
>>>>> the &= 0xffff should probably go to the adreno_read_speedbin / nvmem
>>>>> case. WDYT?
>>>>
>>>> Ok, I can keep it, though realistically if this ever does anything
>>>> useful, it likely means the dt is wrong
>>>
>>> Yes, but if DT is wrong, we should probably fail in a sensible way. I
>>> just wanted to point out that previously we had this &0xffff, while your
>>> patch silently removes it.
>>
>> Right, but I don't believe it actually matters.. If that AND ever did
>> anything, this was a silent failure with garbage data passed in anyway.
>>
>> If you really insist, I can remove it separately.
> 
> I'd say, up to Rob or up to your consideration.

Konrad
