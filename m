Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5756F3A67
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 00:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDCA10E340;
	Mon,  1 May 2023 22:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5715510E344
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 22:25:43 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4efef769000so3623692e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 15:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682979941; x=1685571941;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oAJEOm2eifjcgdP9OPqfMMNdpFPDXakE6ptALBvr0FQ=;
 b=Am26uoHegRus/zLYoGd7WF2yRrZOU/9G2hl0GArXKx1AV+B0PSnOdcEEANW/I2l0X7
 vDl5vULcNyDmPXsz3iR5YIaPo+D/0Htd9M0RrISu4caDCTvma7AbspUUjPdrqggClfCP
 J2kWn+Dr+DPUKaU9/itkQIx8D943H08n79OLiUHdg+iZO996f2h4CXFtus2TGe2A2s0Y
 nWuZcKBNkgkYx58JurmAdjTnT13BgBNzHkOu45PMXa1W4XpsmPhp9DuNp1Ext4+a1m8S
 8v3HEf5YWTuccY9JwJhOaEvM+C05D+AUL6RF9v2DwMMHXliZzZmKyfcaLXcrfx/ET6Sk
 fpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682979941; x=1685571941;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oAJEOm2eifjcgdP9OPqfMMNdpFPDXakE6ptALBvr0FQ=;
 b=eQ72DDwoxlrJyu4GOaRPJW5/7jU7lw154n5eMDAfdUpcDQhMHUJKXSkDYBIOeNf7hv
 gMtX1q/ERmoR1NDQ43i2rrsOMFqMQs7Ngx/etaPno9NhSOeMNfNGpWkeLN4Vc+H8QGn0
 KddW2DdkIOSXys92nPwXNvIBYGxmFpiWOWAsb3X5CpICrw2pIMsA8K+KBnqIoSreL18w
 MSuoNzI8Kf7KcuWN/4w1fD6gyzlAZQsDKvf1GmTzWnYNnA21BVdkbWAXpJKANGtOuY4N
 aEU+XqPDL4XK7apJ8IrSXJsl/SEl/piYUCtuZB6s4cHf+zb4H9AyEZWVblMb1MBuZom/
 onnw==
X-Gm-Message-State: AC+VfDyO4MDqGQ+QIX/VmIX/GNVXEN16NSSAcI2APubx1sBGRHY7ystM
 PekT8Bx8nEhgupWXZ/T7O/ykag==
X-Google-Smtp-Source: ACHHUZ7NhlhZxSnZcnpAUm2jh5zID/mvv3M45+MFV/GBMQYVzBIUhr5voUAlg2XHUcf7JdpDio4Rag==
X-Received: by 2002:ac2:52b7:0:b0:4d8:6c17:8a65 with SMTP id
 r23-20020ac252b7000000b004d86c178a65mr4694708lfm.58.1682979940881; 
 Mon, 01 May 2023 15:25:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o14-20020ac2494e000000b004efae490c51sm4612151lfi.240.2023.05.01.15.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 15:25:40 -0700 (PDT)
Message-ID: <ac05dbb8-5327-ec83-d8f3-9680dc450d88@linaro.org>
Date: Tue, 2 May 2023 01:25:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/4] drm/msm/dpu: move PINGPONG_NONE check to dpu_lm_init()
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
 <20230430203556.3184252-5-dmitry.baryshkov@linaro.org>
 <ncdyjjt72to7mop6kgd46kmhvcqdzqyftdklm37dn3j5ycufx4@uvg74dm2x2zp>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ncdyjjt72to7mop6kgd46kmhvcqdzqyftdklm37dn3j5ycufx4@uvg74dm2x2zp>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/05/2023 01:23, Marijn Suijten wrote:
> On 2023-04-30 23:35:56, Dmitry Baryshkov wrote:
>> Move the check for lm->pingpong being not NONE from dpu_rm_init() to
>> dpu_lm_init(), following the change to dpu_hw_intf_init().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> In some way I also suggested this change in [1], but did not receive a
> (N)ACK.

It seems we went on arguing on other topics and didn't respond to that 
phrase. Please excuse me.

> 
> [1]: https://lore.kernel.org/linux-arm-msm/ecopixnagol7yd5znvmjanknqbv7vi4ayy36vchaeyyhuavu4w@rkdfllrd4uzb/
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 5 +++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    | 5 -----
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> index 214f207ddf8a..d1c3bd8379ea 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> @@ -161,6 +161,11 @@ struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
>>   {
>>   	struct dpu_hw_mixer *c;
>>   
>> +	if (cfg->pingpong == PINGPONG_NONE) {
>> +		DPU_DEBUG("skip mixer %d without pingpong\n", cfg->id);
>> +		return NULL;
>> +	}
>> +
>>   	c = kzalloc(sizeof(*c), GFP_KERNEL);
>>   	if (!c)
>>   		return ERR_PTR(-ENOMEM);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index bf7b8e7c45b1..2ca3c666e22f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -117,11 +117,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>>   		struct dpu_hw_mixer *hw;
>>   		const struct dpu_lm_cfg *lm = &cat->mixer[i];
>>   
>> -		if (lm->pingpong == PINGPONG_NONE) {
>> -			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
>> -			continue;
>> -		}
>> -
>>   		hw = dpu_hw_lm_init(lm, mmio);
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

