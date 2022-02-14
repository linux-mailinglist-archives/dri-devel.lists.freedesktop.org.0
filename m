Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431A24B5B23
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 21:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D14A10E2D8;
	Mon, 14 Feb 2022 20:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D11210E2DC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 20:43:53 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id z14so11894003lfu.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 12:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2X3kZbX+r2skgh31n7jW6xhk6e9XDlkUbEJcNaWJ+ok=;
 b=nJ/iv1ylRHCewgW3kX7nTwKriL4gG+aGFWMVjaQkCuEvYHFRquxbkW2FHqWayJTraJ
 rXODxi1LPc1lt/tleCav4RDJZ1IiqPhrQq5wMGZfkzqYQddNGLh148eIcLU1ff9YnsNV
 dJaf16l/WN0J5zA26yxW3t5XV0YodiR75nIzuRvhuxn51tTuKLSY+/S2+1GlwVinpXlq
 wnI9Ppd5HrvirRU/otTSRZGpydlUhIg9RzJKCM4Pj2zit3R9e9hURW+DnsdlUBx2MX7Y
 0h3qdcDDp5Nm7Tay33zdzHurJeXNjUpEYsiAiilMEDV08D5T3hXBEA9HkBPfzcFnzjF5
 cynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2X3kZbX+r2skgh31n7jW6xhk6e9XDlkUbEJcNaWJ+ok=;
 b=Ea5uK81O/OM30YGqSeF9M2iko2mAsJDNHsvvv2qgMrWVvHe+UQLgvpHQcGCvptFRNv
 YfzgrDTFZLUqbYSu5fJ2x6xEJmwnFUfwsqwDm/iQrGtU2kzvHEm1UNdAMo0Sl6Ev9Y5D
 GG+cZUK6U4Zqnl+DWyi6nNEGPu+1+wluSR7uNjdxMzKSrduroZiJJHMjedrgw7oMSITY
 cIHjsB5YXX1c4Dj5YhneQfDNUARyg6/guFZ7nhqpeDgMBI7Sj63hJQmOmg5s/Z/SzC5S
 YwgPh5SbR2JZniYLGesWcYzow9vwLCc0CQZbPdlsFfRP0DezMeJrDaJN/rtMHdeaR5vY
 v1UQ==
X-Gm-Message-State: AOAM531j74W+rdZM1s6CVeel/lJq23d4t9HoVCWIRGB93fMGEtzpgkjy
 l/oTLRX7/IVCiECESlXD42qwDA==
X-Google-Smtp-Source: ABdhPJzmq2rehfCSH3NsOJEjg3U/3L/c1dDAYZBLrw88w45OYI6UpA8++OFJu8ymh3U5ryuFxjDPxg==
X-Received: by 2002:a05:6512:ea8:: with SMTP id
 bi40mr628876lfb.258.1644871431323; 
 Mon, 14 Feb 2022 12:43:51 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id bi1sm4246363lfb.87.2022.02.14.12.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:43:50 -0800 (PST)
Message-ID: <2246d195-c3dc-e093-f456-55c00fe23c71@linaro.org>
Date: Mon, 14 Feb 2022 23:43:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 5/6] drm/msm/dpu: fix error handling in dpu_rm_init
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
 <20220121210618.3482550-6-dmitry.baryshkov@linaro.org>
 <5b517150-ae78-98c6-b9a8-d84905f38f56@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5b517150-ae78-98c6-b9a8-d84905f38f56@quicinc.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2022 22:15, Abhinav Kumar wrote:
> 
> 
> On 1/21/2022 1:06 PM, Dmitry Baryshkov wrote:
>> Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
>> the value is NULL, then the function will return 0 instead of a proper
>> return code. Moreover none of dpu_hw_*_init() functions can return NULL.
>> So, replace all dpu_rm_init()'s IS_ERR_OR_NULL() calls with IS_ERR().
>>
> Can you please give an example of a case where dpu_hw_*_init() can 
> return NULL?
> 
> All dpu_hw_*_init() functions are only called if the corresponding
> hw*_counts are valid. So I would like to understand this.
> 
> Now, if NULL is treated as a non-error case, should we atleast print
> a message indicating so?

- No dpu_hw_*init() can return NULL

- If at some point any of these functions returns NULL, it will cause a 
premature dpu_rm_init() termination with the success (=0) status, 
leaving parts of RM uninitialized.

Thus I'm replacing IS_ERR_OR_NULL with IS_ERR()

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index 96554e962e38..7497538adae1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -109,7 +109,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>               continue;
>>           }
>>           hw = dpu_hw_lm_init(lm->id, mmio, cat);
>> -        if (IS_ERR_OR_NULL(hw)) {
>> +        if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed lm object creation: err %d\n", rc);
>>               goto fail;
>> @@ -126,7 +126,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>               continue;
>>           }
>>           hw = dpu_hw_merge_3d_init(merge_3d->id, mmio, cat);
>> -        if (IS_ERR_OR_NULL(hw)) {
>> +        if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed merge_3d object creation: err %d\n",
>>                   rc);
>> @@ -144,7 +144,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>               continue;
>>           }
>>           hw = dpu_hw_pingpong_init(pp->id, mmio, cat);
>> -        if (IS_ERR_OR_NULL(hw)) {
>> +        if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed pingpong object creation: err %d\n",
>>                   rc);
>> @@ -168,7 +168,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>               continue;
>>           }
>>           hw = dpu_hw_intf_init(intf->id, mmio, cat);
>> -        if (IS_ERR_OR_NULL(hw)) {
>> +        if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed intf object creation: err %d\n", rc);
>>               goto fail;
>> @@ -185,7 +185,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>               continue;
>>           }
>>           hw = dpu_hw_ctl_init(ctl->id, mmio, cat);
>> -        if (IS_ERR_OR_NULL(hw)) {
>> +        if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed ctl object creation: err %d\n", rc);
>>               goto fail;
>> @@ -202,7 +202,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>               continue;
>>           }
>>           hw = dpu_hw_dspp_init(dspp->id, mmio, cat);
>> -        if (IS_ERR_OR_NULL(hw)) {
>> +        if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed dspp object creation: err %d\n", rc);
>>               goto fail;


-- 
With best wishes
Dmitry
