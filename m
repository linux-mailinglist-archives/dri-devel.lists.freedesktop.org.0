Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0291A699A21
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 17:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E51E10E0BC;
	Thu, 16 Feb 2023 16:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8C210E0BC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 16:34:47 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y25so3459609lfa.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 08:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=diFcMl7EiQ4Yy7efeiZ3OzsfYg9S1P0IDLpWVAia4gc=;
 b=TZEVj6blLSM3TvR/3RKddHskVplgR1BxvUtfcaqwQ+cUEi9L73dcjisb3kSQhT2E4w
 q8gzVqPpmSear/S7FH/82Hlwv7O4iR5YlWjnzgKjYdyj8D/mpKVk8de1LM/oXWOrSFZt
 nvfgzDImQlNp4goDuK9SjqhgKBrLNMe4Lt/ryl3G4bZUg9RGGoOmMNW+g1hBBToHsP6F
 UHeMJZ8LBJoyzneUgw3BlAMVVOEyHmo8Zma/AHMkMlra+MPdHpZ05rEhVJUDMOJRZZvh
 +LwhshDbXSwrPGXoy3m49vtEz3BKAYxciLeBA0xb87DV88r8JeWoKfFgPVNnVpWeqmwq
 SE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=diFcMl7EiQ4Yy7efeiZ3OzsfYg9S1P0IDLpWVAia4gc=;
 b=DOECqFwY9srbQ2QLiLX0qc/4ENPT3N5ZjrkQKDJeTMuFIT/iOylI/MR3B026baymUD
 ien3t17FGW5VvCrpiDsNjFLcpQ9+ONIouth1AIdEzQljbGlY0rjjjV3KGnLhm7ApwD9n
 KfN4GmBdCYPA/e3z4KTqmygdqAIIGEZQt6CuXXsDUchCeQ+J+itw0HRNLewcb+Y4IK16
 b0HHSRIgdQXYIgvZ2rT8sM5+IOKZVZZ+bj9LQoL/J0UVIpol+uIYNj8ViaWCQDBW5ypu
 B0BzsTdZwctbCkeI5fXssl/grZV/0ysCwzHOo8e+8w4+prqo/E0Q+IiFWVVIqsBHh+ky
 e4Lg==
X-Gm-Message-State: AO0yUKXoNvzDQOaB8/bsXuIY3+wtPx2PFdL7+bJfUBM1DmsKObfE7jfj
 8geGFzdEdaFjIC1i5cREdhJG+w==
X-Google-Smtp-Source: AK7set8eJtMU0IWLEpLenMSU7LwwahI5pZHwaXed+WbOo941g1MrDoQAi7b/6xrXZ/qdwYkzpzYXGA==
X-Received: by 2002:a19:ae19:0:b0:4a4:68b8:f4e7 with SMTP id
 f25-20020a19ae19000000b004a468b8f4e7mr1756423lfc.45.1676565285190; 
 Thu, 16 Feb 2023 08:34:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h23-20020ac250d7000000b004db50b52c08sm346711lfm.102.2023.02.16.08.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:34:44 -0800 (PST)
Message-ID: <305a468a-d792-4f51-5a7a-bf38b9c685eb@linaro.org>
Date: Thu, 16 Feb 2023 18:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/3] drm/msm/dpu: Read previously-uninitialized SSPP
 scaler version from hw
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
 <20230215-sspp-scaler-version-v1-1-416b1500b85b@somainline.org>
 <CAA8EJpq1L32VQ1eQEk2YQWqCwHgdFQfuWPhQx=PmhzXvazLgPA@mail.gmail.com>
 <20230216083119.6ispk2xhahhzn5sx@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230216083119.6ispk2xhahhzn5sx@SoMainline.org>
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
Cc: freedreno@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, Chandan Uddaraju <chandanu@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/02/2023 10:31, Marijn Suijten wrote:
> On 2023-02-16 04:22:13, Dmitry Baryshkov wrote:
>> On Thu, 16 Feb 2023 at 01:02, Marijn Suijten
>> <marijn.suijten@somainline.org> wrote:
>>>
>>> DPU's catalog never assigned dpu_scaler_blk::version leading to
>>> initialization code in dpu_hw_setup_scaler3 to wander the wrong
>>> codepaths.  Instead of hardcoding the correct QSEED algorithm version,
>>> read it back from a hardware register.
>>>
>>> Note that this register is only available starting with QSEED3, where
>>> 0x1002 corresponds to QSEED3, 0x2004 to QSEED3LITE and 0x3000 to QSEED4.
>>
>> This is not purely accurate. 0x1003 (sdm845) also corresponds to QSEED3.
>> I'd say instead that there are several variations of QSEED3 scalers,
>> where starting from 0x2004 it is called QSEED3LITE and starting from
>> 0x3000 it is called QSEED4.
> 
> Good catch, I'll update that.
> 
>>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 8 +++++++-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 3 +++
>>>   3 files changed, 10 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index ddab9caebb18..96ce1766f4a1 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -324,11 +324,9 @@ struct dpu_src_blk {
>>>   /**
>>>    * struct dpu_scaler_blk: Scaler information
>>>    * @info:   HW register and features supported by this sub-blk
>>> - * @version: qseed block revision
>>>    */
>>>   struct dpu_scaler_blk {
>>>          DPU_HW_SUBBLK_INFO;
>>> -       u32 version;
>>
>> No. Please keep the version in the scaler subblk.  It is a version of
>> the QSEED (scaler block), not the SSPP's version.
> 
> You are right that the new variable in the parent (SSPP) block is
> nondescriptive and should have been named scaler_version.
> 
> However.
> 
> dpu_scaler_blk is only used as a const static struct in the catalog,
> meaning we cannot (should not!) store a runtime-read register value
> here.  Instead I followed your IRC suggestion to read the register in
> dpu_hw_sspp_init, but my original implementation called
> dpu_hw_get_scaler3_ver in _dpu_hw_sspp_setup_scaler3 where we already
> have access to the subblk_offset, allowing us to delete
> _dpu_hw_sspp_get_scaler3_ver.  Would you rather have that?  We don't
> need the register value anywhere else.

After giving it another thought, let's follow the vendor's approach and 
store the predefined scaler_version in hw catalog (in dpu_scaler_blk, as 
it currently is). This way we can still drop all QSEED3/3LITE/4 
crazyness, while keeping the data sane.

Then _dpu_hw_sspp_get_scaler3_ver() can also be dropped (or you can use 
it as a safety guard while doing dpu_hw_sspp init).

> 
>> There is a block called DS (destination scaler), which can be used to
>> scale the resulting image after the LM. This block also uses the
>> QSEED3(,LITE,4) scaler block.
> 
> Is this already supported in mainline, and is it the reason for
> previously having qseed_type globally available?  Is my understanding
> correct that this scaler subblk in the SSPP is merely an interface to
> it, allowing the same hardware to be used from the SSPP for intputs and
> after the LM for outputs?

No, I think qseed_type is a leftover from having the same thing 
implemented in three different ways. Maybe because of NIH syndrome?

DS is not supported, it was removed in the commit 
b033def8741aab3fb58e4bf6c1d5cd73b3beb357. I do not have a clear usecase 
for this block and of course we don't have uABI for it.

It would still be nice to keep it in the picture though. It was the main 
reason for moving scaler code from dpu_hw_sspp to dpu_hw_util.

> 
> <snip>
> 
> - Marijn

-- 
With best wishes
Dmitry

