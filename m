Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7538B201FC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 10:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F174710E39F;
	Mon, 11 Aug 2025 08:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lveOeLxK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262D610E39F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 08:40:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ALY2Jo032690
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 08:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LIVwbR0aICOANyl1yo8eAsvQlfDzlKmgpVcSOQw7yWM=; b=lveOeLxKtakVxdYs
 GCrb1kM0qWyKHP5iNjb0zYzTTxQXSY1VLb9Zgs5jTPuyOL4v9Dcztp/+Jv7s7jFU
 g3kI2N2g51T9T8pKF6M9rTINjOEMB3fs8aAXIk4246i3Gih5N9qADlY8fj8/Df8+
 5RW6NTZ2Azruze/31Jc74AWC2CDxO8kH4HLFjQBAIBuWywXHQjqPaZ/TJVExIZP6
 LYU+8Jxh5nfYCjArpn7pkst16jpZZz437zEV4cSBQgxXfJRIkEcLBVUtKA7koyT7
 aoH1f4TbyeIA/St3ET7NvcqUFk5GaB3FmKT8FX9Z0gDmfzvXJ2FSnc0VDChAopWQ
 HzByaw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwngumrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 08:40:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70989fdb7f6so12462746d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 01:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754901611; x=1755506411;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LIVwbR0aICOANyl1yo8eAsvQlfDzlKmgpVcSOQw7yWM=;
 b=d+VtZunN054j34wsCKu+56ctW74QUlLfzLsjH/khY6r5DSxp3mBWskY5wThoXabvaL
 6WwIAAMw7kajEBbuSi8UFUTylAVjCACvCCsnatIb4J8i7aPQ5Si83nTO6TgRZ7TqdzfT
 t5JH/BlEVXzy0UM0OBWbWIQb4NXusccaIQTSxjNRkUhfyP1gI0s23kFtLguIcESUqS/8
 M1u0Ddoze82A+iZLnbQb/HjwpwM31al5u4Zxc8jECN0+v0JGNvITJtl9dzOMzryvhwin
 9O3cLzrq0BKatx6QqKzoW/6WC9rhWuy21TJBdWodtILkxoefBMNcvnsu3VfZ9aiDOcbq
 A17w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwm7toPkPqwWLuRTYEkr2gfJOZCoHWqRS+Vst6wWmUFWrDqBo3972fsoRIVtEx8AVJi9PrSnRO1nQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztXXAnCIFDMTNM564P+IOMU+mKdJjCXODtMBjZJhoCyXEg084Y
 2KQ0sPqWMq/5XLpogCd/2KBbcjQP6q5korfkFmsJBQCK0izerYI2N9oW0UQ0dyXK7X86WcR8MUR
 q+zCzVSBBayAEJA7VxUey6763fdfYW6HppbVjN8sdVMDK7F36TGcAY5VtqHVtxitmHBfk238=
X-Gm-Gg: ASbGnctpn0zxuHQOHAxGtXqxUQ8kSOEDvdwlHOwu/B/LbssQNl/YA6Izw/XsZYFWupQ
 jtu4t4Ea0Sowl+6puh1KSR890oEo9XMn9wc1Geo0+iDHsWBRMi6tLmuyizAoQfS337Mu1Y5lKjO
 2zhPWhWR9jZzgpeUJ3eBA4jimL2dZPwQmaQi8CQVc8hx62gAnTtbhB5JXopwV+w5kXB22YZjyoX
 W4foDziZ3v8SzrwJNJu+lXSqdiTsFMrdm2sQVbQ6KP+8qznAhR9NS3YFl0lp8CvZD8iOwWQyIXx
 yKhrszf7HJb8/vT0uvSiiQ6K1bdUK0i+pWm9xKUmmTIMeWKqANTX7wFNExLdl8MPCZjkDIaWdZG
 TSZARl9c7kTfMZoWhow==
X-Received: by 2002:a05:6214:2b0b:b0:707:1b36:28b0 with SMTP id
 6a1803df08f44-709b07d721fmr45628256d6.5.1754901610723; 
 Mon, 11 Aug 2025 01:40:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmqi4GHf2A7H36MKIKZoZhHH6tD7LdfZ+CPYZTKbI125W7w1bLdBwTOiUmiKDMJ/XmSBxNuw==
X-Received: by 2002:a05:6214:2b0b:b0:707:1b36:28b0 with SMTP id
 6a1803df08f44-709b07d721fmr45628116d6.5.1754901610242; 
 Mon, 11 Aug 2025 01:40:10 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f15a66sm18447502a12.16.2025.08.11.01.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 01:40:09 -0700 (PDT)
Message-ID: <d9357f4a-6f26-4570-bcb5-62fe39c78a70@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 10:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
 <937197e9-09dd-4f3c-bdb4-4001f5217c07@oss.qualcomm.com>
 <ba1d97d0-3420-4cca-8823-4d27cbe7bae6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ba1d97d0-3420-4cca-8823-4d27cbe7bae6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tuMcGalmkLCNAQlA8v0NG_oTep99ijGd
X-Authority-Analysis: v=2.4 cv=RunFLDmK c=1 sm=1 tr=0 ts=6899ac6b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qoSIoJJoY18thYJL65kA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: tuMcGalmkLCNAQlA8v0NG_oTep99ijGd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxOCBTYWx0ZWRfXx6ci3+Q89rLd
 NhJ9hzkfq27M60fzAE4R0qIRTKbKsvBYhiqRLBUkSKCIA3W1ml/6WfCFQrNvgdZRL8EYGgVZ8Ga
 puUB821YVq5oKjlndYyN4mUqdJCe38FTVkx9pl9Vo1RGlkc3KgqlT/OfctQeeq6enNRmsDMzxd4
 wjWUhTUf2dJV9Hqpc6519DQEEzCLKNfJkGF+X/4a4eQzs+DsPFlT9jhAegdIFW/j6lGpB5hFcjO
 hzQ2qT9fVoZW4Ty63HhV8wJCMV3ah+SLM6CVpWLe0QmFskAWy0H98Mrg9ZFe16EqkyjfAA9Aanq
 Q50fw6YIX/2OdEYO5D6P6dbJu63JwrWti8wBv0W2Z9ReqrseHO4MxMAi+Je+Qf/Atl0DfpQ1S+V
 R/as+mEc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090018
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

On 8/8/25 7:22 PM, Akhil P Oommen wrote:
> On 8/7/2025 7:21 PM, Konrad Dybcio wrote:
>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>> Since the PDC resides out of the GPU subsystem and cannot be reset in
>>> case it enters bad state, utmost care must be taken to trigger the PDC
>>> wake/sleep routines in the correct order.
>>>
>>> The PDC wake sequence can be exercised only after a PDC sleep sequence.
>>> Additionally, GMU firmware should initialize a few registers before the
>>> KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
>>> GMU firmware has not initialized. Track these dependencies using a new
>>> status variable and trigger PDC sleep/wake sequences appropriately.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> FWIW some time ago I made this patch, which tackles a similar issue,
>> perhaps it's a good idea to merge both:
>>
>> From 7d6441fc6ec5ee7fe723e1ad86d11fdd17bee922 Mon Sep 17 00:00:00 2001
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Date: Thu, 20 Feb 2025 10:28:51 +0100
>> Subject: [PATCH] drm/msm/adreno: Delay the Adreno RPMh startup to HFI init
>>
>> There's no use in trying to power up the GX logic before we're almost
>> ready to fire up the GPU. In fact, with A8xx the PDC and RSC uCode are
>> loaded by the GMU firmware, so we *must* wait for the GMU to fully
>> initialize before trying to do so.
>>
> 
> iirc, this wake up sequence should be done before fw start. That aligns
> with downstream sequence order too.

FWIW techpack/graphics adreno_gen7_gmu.c @ gfx-kernel.lnx.15.0.r3-rel
adb0a9da173e ("kgsl: rgmu: corrected pm suspend flag check on resume")

// load gmu fw, enable clocks, irq, set up chipid etc.
[...]

// unmask CM3_SYSRESET
ret = gen7_gmu_device_start(adreno_dev);
if (ret)
        goto err;

if (!test_bit(GMU_PRIV_PDC_RSC_LOADED, &gmu->flags)) {
	// set PDC_GPU_ENABLE_PDC & seq_start_addr
        ret = gen7_load_pdc_ucode(adreno_dev);
        if (ret)
                goto err;

	// disable hwcg, sleep/wake handshake setup, pdc ucode
        gen7_load_rsc_ucode(adreno_dev);
        set_bit(GMU_PRIV_PDC_RSC_LOADED, &gmu->flags);
}

// set HFI_CTRL_INIT
ret = gen7_gmu_hfi_start(adreno_dev);
if (ret)
        goto err;

// continue booting the gpus, send out feature messages

on a830, the patch is observably necessary (gmu doesn't start otherwise)

Konrad
