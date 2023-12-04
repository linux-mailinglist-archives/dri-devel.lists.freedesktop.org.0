Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EBB80317E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 12:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8FA10E19E;
	Mon,  4 Dec 2023 11:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BD310E19E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 11:28:25 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50be4f03b06so1963697e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 03:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701689303; x=1702294103; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Lz+E+wLWwW8b7AOyJ2PaT0gpAg9bci3vqDG+CSgpeuM=;
 b=wYfqFhRMWF+nRy2Sz48YPMyszrgROTIcQLV+F0XIcuwsLU9QKcuB4dMESpo0iXjz2o
 fRVo8969szFt/PuqPWOa8h1fSjpj2pbRoPSyeHHO/sQtmBpG/I2Fcll96HlYdKGcEfXo
 GgaeUKKy/msSKT+hecu4J7IFAJudzCtQLzeV3ocosG7/fYjP4UgSXDGYWZF93VPNbh3T
 dRQWbBEdWVuMjVakFAO/I+MVGsIpbYpY3/VO/2H30fTTJnkpbwkoW0/kAV4RWLcmRKvd
 Leans/4RmLykx31pFgdnCKx5DtphHTIWQRaLT6riYzjXVGSt6YYdk8IgzGz3hGxW4MC6
 UFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701689303; x=1702294103;
 h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lz+E+wLWwW8b7AOyJ2PaT0gpAg9bci3vqDG+CSgpeuM=;
 b=QEVUcTX784/OgmWTEXayap/toj6ZD/Wu8p6txMn3c2QsnV0+C6cDcUDuuF8M1KEhzi
 Ifchd7b44zfncZAeyyJ0ytj681paGgBICSRGqJkX7d7dBxLO7RhZFNJuPlJfq6aDiWAW
 NLUHUw+z32P6zCdj/7oVMTcbaN5xyVyPDOu9QUyiBzBUJOA+7Mic06pAUugfVhftjE4/
 VjfPiurD/X4VM7HLDTSZfHUJ9uSt5pNFFMUKtd4LyoJg6MGI70RSYnOjdktdg26I4kbz
 S35ySSaMOWhZOkeUB7FDX5+AyCBHcvqsxg5XGzXF/Pt7CCv7ST7xzrvhgjuMFxtOoMrr
 hfxA==
X-Gm-Message-State: AOJu0Yze/XVDz/3MGPBKKkOTISCSwO5s5AEw7BG7bVGOiF6D6arR33+O
 ZJlHlh2X0odiEuG0mjFXoIbkLg==
X-Google-Smtp-Source: AGHT+IHuQs5GVLYsx0orUsAerBFbQOZVdpo7vi3c6v05bdjfdKwCb6YK4CDuwf2F/qghFWC9MxOUOg==
X-Received: by 2002:ac2:4d07:0:b0:50b:f83b:fe62 with SMTP id
 r7-20020ac24d07000000b0050bf83bfe62mr384695lfi.25.1701689303176; 
 Mon, 04 Dec 2023 03:28:23 -0800 (PST)
Received: from [192.168.209.83]
 (178235179097.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.97])
 by smtp.gmail.com with ESMTPSA id
 b100-20020a509f6d000000b0054c7a5a76b8sm2942768edf.0.2023.12.04.03.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 03:28:22 -0800 (PST)
Message-ID: <630d10c6-326a-4cdb-be6b-cd832378187b@linaro.org>
Date: Mon, 4 Dec 2023 12:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Drop WARN_ON from patchid lookup for new
 GPUs
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Rob Clark <robdclark@gmail.com>
References: <20231023-topic-adreno_warn-v1-1-bb1ee9391aa2@linaro.org>
 <CAF6AEGuS3PhNbh9Gmu1g9YpUcr3LOh1gZK-XBE+urdb5jRjorg@mail.gmail.com>
 <6a0398d1-22f4-4eb7-ba43-c448055be323@linaro.org>
 <CAF6AEGuqrm0pssjRDa9DK=NppU4Qq5cPZicbGfxKH2czJmjK2A@mail.gmail.com>
 <6146cc54-b3f9-4875-851e-3d2981b23ffc@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <6146cc54-b3f9-4875-851e-3d2981b23ffc@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26.10.2023 21:16, Konrad Dybcio wrote:
> 
> 
> On 10/23/23 22:20, Rob Clark wrote:
>> On Mon, Oct 23, 2023 at 12:56 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>>
>>>
>>> On 10/23/23 21:42, Rob Clark wrote:
>>>> On Mon, Oct 23, 2023 at 7:29 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>>
>>>>> New GPUs still use the lower 2 bytes of the chip id (in whatever form
>>>>> it comes) to signify silicon revision. Drop the warning that makes it
>>>>> sound as if that was unintended.
>>>>>
>>>>> Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying GPU")
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 -----
>>>>>    1 file changed, 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>> index 80b3f6312116..9a1ec42155fd 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>> @@ -203,11 +203,6 @@ struct adreno_platform_config {
>>>>>
>>>>>    static inline uint8_t adreno_patchid(const struct adreno_gpu *gpu)
>>>>>    {
>>>>> -       /* It is probably ok to assume legacy "adreno_rev" format
>>>>> -        * for all a6xx devices, but probably best to limit this
>>>>> -        * to older things.
>>>>> -        */
>>>>> -       WARN_ON_ONCE(gpu->info->family >= ADRENO_6XX_GEN1);
>>>>
>>>> Maybe just change it to ADRENO_6XX_GEN4?
>>> That also applies to 700
>>
>> Then the warn is warning about what it is supposed to ;-)
>>
>> I guess this is coming from a6xx_gmu_fw_start()?  I think we need a
>> different way to construct the gmu chipid, since the point of this was
>> to not depend on the low 8b having any particular meaning.  Perhaps we
>> should just get the gmu chipid from the device table.
> Guess that could work as well..
Well, I realized that we already sorta do this..

MAJ is always set to 7 (duh)
MIN has a lookup table that will expand with future additions
PATCHID needs to vary, and that should be CHIPID & 0xff

Konrad
