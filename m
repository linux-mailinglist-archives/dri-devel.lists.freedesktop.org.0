Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC027D88D8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 21:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B21210E86B;
	Thu, 26 Oct 2023 19:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C2910E86A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 19:16:21 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507c78d258fso1923307e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 12:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698347780; x=1698952580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MmfACo16Znzmc2tlkLC7HANA11z5OmTtfKSPsuqMXkQ=;
 b=luNO6ro1Bcptd4tJLrO2Is/khoH6lLipbVMYR6oRzB2BXmcc+EZWvs8wrXi7qOg/ON
 3vUPnkxLc9PTED5gMJ741YJSRmz32+5qgFXNCYM/1q/2HH9R3PLRGH6wo6w0XTeAxDtW
 KHioRhiQZ9QXXvAXODsNuotXkCaMNSjbzNdbQI0hDZl8+tna9K0UwcFTx7QBx+CZdCoM
 GVdm1IkfaT/4SF7t9cZ2DUtDfn9xBxUA2g5jbkhBIG0jAGAObD0G+w1qU213EwrTuGPX
 HXJhWJM/NcY8138B97fQqhp/imaV3n8DOwEYF+aWgzKlLv+LmYvvN/ZcYDEDYsc1dSPU
 TVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698347780; x=1698952580;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MmfACo16Znzmc2tlkLC7HANA11z5OmTtfKSPsuqMXkQ=;
 b=tlwXfCDLMBazTbsoz5tgmrHOiUKy9MbtQZM7JZdrpcVCKdkMmHhFxRlmNnCaNV7IT2
 xxdPhC4lEI6r194JbJ+92wN/NJM9Pe0nWJyBZK8OTCiQP+0QxMUHHGMrxXV2oSD54aXB
 YfWntzC8gNPJVewZMXGzxodh5HPxZl8HtFX4l7uUGBkPdNRPL/6ndEsZ4s36UDLb7klk
 SB+zGRGEjjud05kLskXplA4hMAbSe58OgpdBGxdZXa0OAXAvitph+jt6LfDOdnSRcp8O
 e3KKusXxTCtHWQJNSd8p8jvlRELCgFydLoeiP1hEIckNOKTvvvod2scDajzyqCf9BDsZ
 WgzA==
X-Gm-Message-State: AOJu0YzGIJcPdEHRSWFDJ4QtiBs2QGG9ApLR6xdyVrqXrv1sE8QRPepZ
 0OucWz3sw1RnKCcH2wxRqO048g==
X-Google-Smtp-Source: AGHT+IG+I8IqwyM3X+sAvm1ZUN54t+CWanNfCrnKDrk6SJrmu26XlqPpUrDfvcoLvyebrtu/2Fnzew==
X-Received: by 2002:a05:6512:1156:b0:503:7be:c85d with SMTP id
 m22-20020a056512115600b0050307bec85dmr246597lfg.35.1698347779684; 
 Thu, 26 Oct 2023 12:16:19 -0700 (PDT)
Received: from [172.30.204.229] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 be43-20020a056512252b00b004f13cd61ebbsm3119078lfb.175.2023.10.26.12.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 12:16:19 -0700 (PDT)
Message-ID: <6146cc54-b3f9-4875-851e-3d2981b23ffc@linaro.org>
Date: Thu, 26 Oct 2023 21:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Drop WARN_ON from patchid lookup for new
 GPUs
To: Rob Clark <robdclark@gmail.com>
References: <20231023-topic-adreno_warn-v1-1-bb1ee9391aa2@linaro.org>
 <CAF6AEGuS3PhNbh9Gmu1g9YpUcr3LOh1gZK-XBE+urdb5jRjorg@mail.gmail.com>
 <6a0398d1-22f4-4eb7-ba43-c448055be323@linaro.org>
 <CAF6AEGuqrm0pssjRDa9DK=NppU4Qq5cPZicbGfxKH2czJmjK2A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAF6AEGuqrm0pssjRDa9DK=NppU4Qq5cPZicbGfxKH2czJmjK2A@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/23/23 22:20, Rob Clark wrote:
> On Mon, Oct 23, 2023 at 12:56 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 10/23/23 21:42, Rob Clark wrote:
>>> On Mon, Oct 23, 2023 at 7:29 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>> New GPUs still use the lower 2 bytes of the chip id (in whatever form
>>>> it comes) to signify silicon revision. Drop the warning that makes it
>>>> sound as if that was unintended.
>>>>
>>>> Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying GPU")
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 -----
>>>>    1 file changed, 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> index 80b3f6312116..9a1ec42155fd 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> @@ -203,11 +203,6 @@ struct adreno_platform_config {
>>>>
>>>>    static inline uint8_t adreno_patchid(const struct adreno_gpu *gpu)
>>>>    {
>>>> -       /* It is probably ok to assume legacy "adreno_rev" format
>>>> -        * for all a6xx devices, but probably best to limit this
>>>> -        * to older things.
>>>> -        */
>>>> -       WARN_ON_ONCE(gpu->info->family >= ADRENO_6XX_GEN1);
>>>
>>> Maybe just change it to ADRENO_6XX_GEN4?
>> That also applies to 700
> 
> Then the warn is warning about what it is supposed to ;-)
> 
> I guess this is coming from a6xx_gmu_fw_start()?  I think we need a
> different way to construct the gmu chipid, since the point of this was
> to not depend on the low 8b having any particular meaning.  Perhaps we
> should just get the gmu chipid from the device table.
Guess that could work as well..

Konrad
