Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84F293A1B1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 15:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB5B10E5DD;
	Tue, 23 Jul 2024 13:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="YCwo2kH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C58410E5D8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 13:38:25 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4279c924ca7so40392075e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 06:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721741903; x=1722346703;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N3K8G5pHeQAwS16+pZRohvo75/Cf2iIKXzbelmWiAXE=;
 b=YCwo2kH2k392XIEHH9fMVewXuZLbSQu17bJykUfqQ87M3kW2EZjRM76XxUDAburCr6
 /ugchPcourouAe1xadNHyDn98rMmySG87HEWVyNABurCR7ABgD9YT1STa+AYmpCR91lQ
 epumwaQUOTbLjJVxo1TjNs7tP6DfBLaox6DRh/1dUPtdVJx+lk4ojHbUfijG7wQhJ2h/
 htKlAQWhCIq8EtMHeTt5FNtnBPI9wibvZxz+2B8qEfOAEgLKOiULOe9ybfJwQnglnJMC
 5yVLnAXvjeXRWiaE4n3/GiR9w+pO9glHm6lJqrSskwh6NRtPt1d1LWTWexqWODLn5QNF
 LZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721741903; x=1722346703;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N3K8G5pHeQAwS16+pZRohvo75/Cf2iIKXzbelmWiAXE=;
 b=mt5ZbgvSi5Me7IYOcBWhYfCFdyGPzch7kDU6MpEv8DsCGDvjfptT4fesIERDcY/Uzw
 R6Q0t/Ew6JxCZtht8/DmRd0qV61T4JQ7aXS/i7H5KRmLxWR/RBvOWi55rKaZ5DJUSyYD
 KIye3daMFuIX+cdlXpq3FD5OInkFZJJQf4TtBDb1BrkqcZ72H15f+6poboctLwFQfe5l
 4b+fDDo22tqlCiRCKFjEf4U5xuQOe45S58BsIIpGhAhQyzN+tx/0JfJSFSiSHfpFbqet
 BR+noaQ//YBYf/o0zXnVFxsEW526tN3zgAeju4t+uOrd+7KWDTessLpI75AnQY3zRlZS
 gErg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWikLzNhVD1dXWCBTCbILyYegegQdpil0VySJM3XsOsZ7FjIqHUnF9M11acwUcST1WnKOECSTJ4FHbiY3HOL9klgDY83s1Y+UypjVPEwVCZ
X-Gm-Message-State: AOJu0Ywbi7X8VaYHuReSM8olhNecNlrEgIVC90YQt/UM1hR0kGvNcDLj
 XJTJot8j/jp1cmaaDalozLC/pGLivjT5697A0bjTUMC24ZcpLqcs1RTMdB4Ynmc=
X-Google-Smtp-Source: AGHT+IGbKurHrcBQxOwjoCy3I00Mb7Ii4AMC80qELYY6RamyBgLgQUYcRMumqK9YF+XJH9OtD5bRNQ==
X-Received: by 2002:a05:600c:4eca:b0:426:6876:83bb with SMTP id
 5b1f17b1804b1-427dc52921amr59397295e9.17.1721741903494; 
 Tue, 23 Jul 2024 06:38:23 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e420sm203734675e9.35.2024.07.23.06.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 06:38:23 -0700 (PDT)
Message-ID: <a8c7db04-7212-4bf0-b8b1-d371ee33478b@freebox.fr>
Date: Tue, 23 Jul 2024 15:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr>
 <20240627-hdmi-tx-v5-4-355d5c1fbc3c@freebox.fr>
 <d9898342-2439-4d3d-8e3d-5bf0a7a40245@linaro.org>
 <b6f6c845-6094-44ce-8ad0-ed4f6d353cec@freebox.fr>
 <CAA8EJpqrAFKCr63JHEpZ3b3zdRfoNXoJP6SqKDOO4sqc=c6YdQ@mail.gmail.com>
 <44101ecd-61f4-4609-bb22-12b40b692552@freebox.fr>
 <CAA8EJpprtmefNM_CJFRbYVNxOWUVVWbedBq44r7GXOdDrQ2WjA@mail.gmail.com>
 <04ef978f-2bfd-46cc-a9f7-40a6f1c507f8@linaro.org>
 <7d34a857-6495-482b-9070-1817c88c9913@freebox.fr>
 <45f5dae6-c606-4612-900a-b719f58d92ce@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <45f5dae6-c606-4612-900a-b719f58d92ce@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 23/07/2024 15:08, Konrad Dybcio wrote:

> On 23.07.2024 2:57 PM, Marc Gonzalez wrote:
>
>> On 23/07/2024 13:45, Konrad Dybcio wrote:
>>
>>> On 23.07.2024 11:59 AM, Dmitry Baryshkov wrote:
>>>
>>>> On Tue, 23 Jul 2024 at 12:48, Marc Gonzalez wrote:
>>>>
>>>>> On 16/07/2024 18:37, Dmitry Baryshkov wrote:
>>>>>
>>>>>> No, that's fine. It is the SMMU issue that Konrad has been asking you
>>>>>> to take a look at.
>>>>>
>>>>> Context:
>>>>>
>>>>> [    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>> [    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>> [    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>> [    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>> [    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>> [    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>> [    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>> [    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>> [    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>> [    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>
>>>>>
>>>>> As I mentioned, I don't think I've ever seen issues from cd00000.iommu
>>>>> on my board.
>>>>
>>>> Interestingly enough, I can also see iommu errors during WiFi startup
>>>> / shutdown on msm8998 / miix630. This leads me to thinking that it
>>>> well might be that there is a missing quirk in the iommu driver.
>>>>
>>>>> I can test a reboot loop for a few hours, to see if anything shows up.
>>>>
>>>> Yes, please.
>>>
>>> Yeah I do trust you Marc that it actually works for you and I'm not
>>> gonna delay this series because of that, but please go ahead and
>>> reboot-loop your board
>>>
>>> 8998/660 is """famous""" for it's iommu problems
>>
>> [   20.501062] arm-smmu 16c0000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x1, cbfrsynra=0x1900, cb=0
>>
>> I get the above warning pretty reliably.
>> I don't think it's related to the issue(s) you mentioned.
>> System just keeps plodding along.
> 
> Yeah that one's "fine"

I booted 40 times in a loop.

`grep -a -i FSYNR console.logs` just returns the same 16c0000.iommu
"Unhandled context fault" message 76 times (as above).

NB: I have maxcpus=1 set in bootargs.

Could the iommu issue be a race condition, NOT triggered when code
runs with less parallelism?

Regards

