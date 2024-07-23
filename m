Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9471093A2F7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 16:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69EB10E54A;
	Tue, 23 Jul 2024 14:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="AGg+6RaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56B0890BE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 14:40:53 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3683f56b9bdso2931161f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721745649; x=1722350449;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T3K8m7UYLI9e2nw2FiKuLBXvna2sOiFY/YtJCGaVVwg=;
 b=AGg+6RaEyAcymvEMd3dSBZryNGTD65zBHSYMPOuU12BMRAu4EUKVzttfyeqf3Evjx2
 WSzhBNxy2EVhHhA1oRJW27a3hWoBDncfoyrqBb5kJC8h8/2m5dzeK0AVTQPAWu4yeDP1
 peijWJDuf/h6pH+WIlxlMLrKvtz+0UlNa4e4P0PU6E5QmNJKk+/On7WncxA2LWPv7Kdk
 PRiCa6YmIF14gurOausSYMH9j/ANWjHzVU57AN0qmzyGQ+eya2RnGb+XEGPb3w7CO+Sr
 48+3jfuekG2uxJbjdVc/QU708BWcP/1dzYtRKXY2H/QLM6K2pBkk9Pl+hOcAnriNxVkj
 LKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721745649; x=1722350449;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T3K8m7UYLI9e2nw2FiKuLBXvna2sOiFY/YtJCGaVVwg=;
 b=vg/EPAxWi+6N3WeBLYNJ6Yw8N8FKN4XqkpMc0ZLXzb3k3ZNYxvzm31U8v3evFtne7T
 3sb0Dsh4g2JTzE6YV0riRNZOQeKlaYUBUGi8HPwN1u1H2E7jiAXsRQrHw/XHXN/We7jn
 o0YH/zXK0SRbufDKB3+ZdFKBKexXEBRy31zzPdF0TsE6GY/pnPsupOH2Sc9axiag+qD2
 zBcNk3kL9VRQG8t4rqsbCZ9RRnhT9RzkFsTdhTKO0UJBG91crzCdm2b7pAbc08T52yVn
 B1tJAzvmFrcfZCcXv4gBTWoxte2KfWaWIaCPO4lIsp1SJqlDamBCJRq0sVGGhjgyRNsz
 TVsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGArawdIF6XNwtGDbkTvUVhkjaP29QCs6x+VQuMzyFmM9dpaCSbRVCal7OQ8ZVxLCE45WlN8IXqiQa/aSUhyYDAxLOjAb8IZ+VC9P+FWwj
X-Gm-Message-State: AOJu0YxnRSafzS35pNgsC3Etq6cFfoUAR835LnbjDex7/icpR7kXm7B2
 YmzohD29zv1DxvztTF3CZcs6uBlg2yL+VAVr5rNApDoTUjUEeXoT0Ntg5NYp6Pc=
X-Google-Smtp-Source: AGHT+IGlwpdFnzbN5dFR3IJlUvCm4jcY/F9lixNZD/n0wR4wTR15Py/Fg3+cKLPkHHM/vuMRaPpzDw==
X-Received: by 2002:a05:6000:4026:b0:367:8a3b:2098 with SMTP id
 ffacd0b85a97d-369bbbb2e21mr7254343f8f.3.1721745649159; 
 Tue, 23 Jul 2024 07:40:49 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787cf182sm11760210f8f.82.2024.07.23.07.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 07:40:48 -0700 (PDT)
Message-ID: <0d5d3918-3988-4d29-8bb3-aaf7b0aa0045@freebox.fr>
Date: Tue, 23 Jul 2024 16:40:47 +0200
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
 <a8c7db04-7212-4bf0-b8b1-d371ee33478b@freebox.fr>
 <57c165e6-d942-4a17-a26b-7e4a0422127c@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <57c165e6-d942-4a17-a26b-7e4a0422127c@linaro.org>
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

On 23/07/2024 15:43, Konrad Dybcio wrote:

> On 23.07.2024 3:38 PM, Marc Gonzalez wrote:
>
>> On 23/07/2024 15:08, Konrad Dybcio wrote:
>>
>>> On 23.07.2024 2:57 PM, Marc Gonzalez wrote:
>>>
>>>> On 23/07/2024 13:45, Konrad Dybcio wrote:
>>>>
>>>>> On 23.07.2024 11:59 AM, Dmitry Baryshkov wrote:
>>>>>
>>>>>> On Tue, 23 Jul 2024 at 12:48, Marc Gonzalez wrote:
>>>>>>
>>>>>>> On 16/07/2024 18:37, Dmitry Baryshkov wrote:
>>>>>>>
>>>>>>>> No, that's fine. It is the SMMU issue that Konrad has been asking you
>>>>>>>> to take a look at.
>>>>>>>
>>>>>>> Context:
>>>>>>>
>>>>>>> [    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>>> [    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>>> [    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>>> [    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>>> [    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>>> [    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>>> [    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>>> [    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>>> [    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>>> [    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>>>
>>>>>>>
>>>>>>> As I mentioned, I don't think I've ever seen issues from cd00000.iommu
>>>>>>> on my board.
>>>>>>
>>>>>> Interestingly enough, I can also see iommu errors during WiFi startup
>>>>>> / shutdown on msm8998 / miix630. This leads me to thinking that it
>>>>>> well might be that there is a missing quirk in the iommu driver.
>>>>>>
>>>>>>> I can test a reboot loop for a few hours, to see if anything shows up.
>>>>>>
>>>>>> Yes, please.
>>>>>
>>>>> Yeah I do trust you Marc that it actually works for you and I'm not
>>>>> gonna delay this series because of that, but please go ahead and
>>>>> reboot-loop your board
>>>>>
>>>>> 8998/660 is """famous""" for it's iommu problems
>>>>
>>>> [   20.501062] arm-smmu 16c0000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x1, cbfrsynra=0x1900, cb=0
>>>>
>>>> I get the above warning pretty reliably.
>>>> I don't think it's related to the issue(s) you mentioned.
>>>> System just keeps plodding along.
>>>
>>> Yeah that one's "fine"
>>
>> I booted 40 times in a loop.
>>
>> `grep -a -i FSYNR console.logs` just returns the same 16c0000.iommu
>> "Unhandled context fault" message 76 times (as above).
>>
>> NB: I have maxcpus=1 set in bootargs.
>>
>> Could the iommu issue be a race condition, NOT triggered when code
>> runs with less parallelism?
> 
> No clue, can you try without maxcpus=1?

Same behavior without maxcpus=1

40 boots, no panics, no FSYNR other than 16c0000.iommu

> The thing will likely run slower (because reasons), but shouldn't
> explode

That makes sense!

- Hey, boot is slow. What can we do to make it slower?
- Well, just add a bunch of cores running in parallel, that will get the job done!

As a matter of fact, trying to boot to command-line with
maxcpus=1 causes the system to lock up & reboot.
I had to add a systemd script to enable some cores at init.
Some qcom daemon must be locking a core & expect progress
from another process.

Regards

