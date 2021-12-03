Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BEB467D84
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 19:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF4C7B6B5;
	Fri,  3 Dec 2021 18:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021047B6B3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 18:51:14 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id k37so8720574lfv.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 10:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AoGWj/bWqwFWdFDfAGCiZt2+Rrs0vhzQ2O7jMvIrWTE=;
 b=i7hnxehXR4Qq6dr9FYM+t6kwmA5qmPA39SksNpMT3nrmhOGSEp0jngHnpulMw5gXXb
 c+vskdcXt2UBcrbrvhsUNkWEIHIPFuVeBkFZmzot8MboOly04tZW5IK9Ex30bQYbYIFG
 hHp8w43Fhec4OCyS0j5tlitqI9VhnlZXT3VRk+LlTfHxItKgMqvHBFstf4FzVH3fmSz4
 5eSJ0v8ygAj24QW8Gp8v8JAW8GnU4VCOLeiKPBZo7FJsWbsNzpFbdSeApsYFHBWbeHjc
 lpGJEBgwU9yn9FvkYpUN9XfL7eLmwuNYYHWGaxAZ+JPdAZ2RYeGwtsAxVwKDxx4sBJmY
 IAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AoGWj/bWqwFWdFDfAGCiZt2+Rrs0vhzQ2O7jMvIrWTE=;
 b=rxl2Dq23GFnODh0fM3OahpLCBWKQjXcQvLYZK7p0jAACD78ON3XZgzTidHdLdYUKBb
 T7LOmsj+jiO/zxBCqzDd0x0g19TO2/JAcrn7/j/AztHkNVGwn37JqVuF13Xd/TqXHliJ
 FnDjuCu7Gwecm7/HJCCA5uDU49+Lj/Xe9P1bI8SEcpvP7xWBMtjt4ypfeyT/nPTEMFyR
 AgN4/+ylLla3itchkKaPiBR9OCCZ1nG4LP5beyAUTJb2zUMZCkp6EyizYrsxvXxEYsxk
 OdWa/u4Wek6IrP86VzKVpzr/v6wGDBuE0aYVkiYfotvLi9kyWxs92HZyNnec8akTXKl6
 xgfA==
X-Gm-Message-State: AOAM530YhiJsj4nclJUMKRm02Xx7314Tq7sAmevDD/mZ/3/DH+RKK0Aj
 eDHJyJ9QABph/MiXkXvE3hftJA==
X-Google-Smtp-Source: ABdhPJx3oNQ/pRiEn2+/u0ktbVPcBmU8snjmPDRzgL+8t9ORKohqKzHYrihygwoe+ybgKC2OUge75Q==
X-Received: by 2002:ac2:55a6:: with SMTP id y6mr18888149lfg.406.1638557473337; 
 Fri, 03 Dec 2021 10:51:13 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id c15sm465158lfb.154.2021.12.03.10.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 10:51:12 -0800 (PST)
Message-ID: <8ee2b4d4-44f3-6d03-b674-613b5b04a754@linaro.org>
Date: Fri, 3 Dec 2021 21:51:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/msm/a5xx: Add support for Adreno 506 GPU
Content-Language: en-GB
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20211022114349.102552-1-vladimir.lypak@gmail.com>
 <YXL16V17upehvUwt@ripper>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YXL16V17upehvUwt@ripper>
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
Cc: Iskren Chernev <iskren.chernev@gmail.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/10/2021 20:33, Bjorn Andersson wrote:
> On Fri 22 Oct 04:43 PDT 2021, Vladimir Lypak wrote:
> 
>> This GPU is found on SoCs such as MSM8953(650MHz), SDM450(600MHz),
>> SDM632(725MHz).
>>
>> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 34 ++++++++++++++--------
>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 18 ++++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 ++++
>>   3 files changed, 45 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> index 5e2750eb3810..249a0d8bc673 100644
>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> @@ -441,7 +441,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>   	const struct adreno_five_hwcg_regs *regs;
>>   	unsigned int i, sz;
>>   
>> -	if (adreno_is_a508(adreno_gpu)) {
>> +	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu)) {
>>   		regs = a50x_hwcg;
>>   		sz = ARRAY_SIZE(a50x_hwcg);
>>   	} else if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu)) {
>> @@ -485,7 +485,7 @@ static int a5xx_me_init(struct msm_gpu *gpu)
>>   	OUT_RING(ring, 0x00000000);
>>   
>>   	/* Specify workarounds for various microcode issues */
>> -	if (adreno_is_a530(adreno_gpu)) {
>> +	if (adreno_is_a506(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
>>   		/* Workaround for token end syncs
>>   		 * Force a WFI after every direct-render 3D mode draw and every
>>   		 * 2D mode 3 draw
>> @@ -620,8 +620,17 @@ static int a5xx_ucode_init(struct msm_gpu *gpu)
>>   
>>   static int a5xx_zap_shader_resume(struct msm_gpu *gpu)
>>   {
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>   	int ret;
>>   
>> +	/*
>> +	 * Adreno 506,508,512 have CPZ Retention feature and
>> +	 * don't need to resume zap shader
>> +	 */
>> +	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
>> +	    adreno_is_a512(adreno_gpu))
>> +		return 0;
> 
> Afaict all other changes in the patch adds a506 support, but this hunk
> changes a508 and a512 behavior.
> 
> I'm not saying that the change is wrong, but this hunk deserves to be in
> it's own patch - so that if there's any impact on those other versions
> it can be tracked down to that specific patch.

Vladimir, any plans to submit v2? This comment requests splitting the 
patch in two.


-- 
With best wishes
Dmitry
