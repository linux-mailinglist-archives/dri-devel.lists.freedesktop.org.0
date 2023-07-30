Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C367682C3
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 02:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BF310E077;
	Sun, 30 Jul 2023 00:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE58510E12F
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 00:17:02 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-52164adea19so4350156a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 17:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690676221; x=1691281021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IyDiYzyGx4UvgqWERNXt4kvAmZTCp8INVoXxlJprM+4=;
 b=Kw+cRqjoqaBrmwHraK6M2NjMvW0b4GJ/1q2vb5+U9xwa71ijIQiBaeJVJRIU5Nv3+C
 OLTbPfiP/dGpU0XfBbryFPoEom61LA5vXt/IshLi2eYbzPYVo5Ss0Us5qJEasiFx1pxW
 l5n/FkY4vcTwWNiyhk9gYXiVotVtuQI74VTRYEgfEU5LWbZz3pWJRzdktWw1HBzv7R60
 LLeYFLAREltjEbfSg/V1H9Id2zmCX9ApEVE+bmcXlxsm6iNmpSPIosjlnqmEMpu72K/p
 UUs3ty5pwy7zNEjLjVv8li7qXZxMbARGmQzZZ0pumY72boXOWblFFpIhpZxwhZTTeAmJ
 KnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690676221; x=1691281021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IyDiYzyGx4UvgqWERNXt4kvAmZTCp8INVoXxlJprM+4=;
 b=gd1hCiaTmvMUJ5vD7F0wJEI1kgikB9Ix/pXDhens0VUHVM9kECh3DaM5C6XfDmBRxq
 N1krNYNDFdiK+GzJ0pgIokyoXX1ySEOIt//w7mC3I3ToMyFxVnfBd+qhpQIvSthpunhf
 ATL2OAjS3ffhv577a4eUaCWSblNiX4B9M6Uj4VacLb5JJbSDB9RqJgiiwclYkzN+BWXU
 bnPx2xsDbAZdcRmiOqwLTF8XDRMqzfYBbarFFG1RzxyBFebJ5Lp2zNyafeqRaeD3dw5U
 sdQu5XdkWPzqOE8zoLBwWlW6sNbQnQYDHhZW5BTdjiBjendQa7b8D/y1ltYw2fQSOW+u
 /Sbw==
X-Gm-Message-State: ABy/qLaAiJEKXVWt6odj4mTDVr7oGCBNOM3+4lzUboDjtiEcjGknDcNE
 p6aPVSpfjCHwRkx5x09KxM4nIg==
X-Google-Smtp-Source: APBJJlE636cK1NK+TXF9c1e6jFBSdt1HcOowNnkufWshWwS1KwKEioupE3bBW3uuuTe7lXLPVarJfw==
X-Received: by 2002:a17:907:a056:b0:99b:ec84:5b1b with SMTP id
 gz22-20020a170907a05600b0099bec845b1bmr2710969ejc.66.1690676221208; 
 Sat, 29 Jul 2023 17:17:01 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a1709066d1500b009920a690cd9sm3874602ejr.59.2023.07.29.17.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jul 2023 17:17:00 -0700 (PDT)
Message-ID: <4f0da76f-7b73-130f-e787-8fd8425da62a@linaro.org>
Date: Sun, 30 Jul 2023 03:16:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/7] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_init
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-8-dmitry.baryshkov@linaro.org>
 <bmmqdo6dyewxrgcfk3vcuff3tgrb6iqgzby3ionl4shaido2vw@cqc2qnvu3fnj>
 <b2uzkzfoj4sfg3fx3ufjd7i2x5dbbnsccodrgk7cnfvjf3yak4@tbesdrg2tke4>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b2uzkzfoj4sfg3fx3ufjd7i2x5dbbnsccodrgk7cnfvjf3yak4@tbesdrg2tke4>
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

On 27/07/2023 23:25, Marijn Suijten wrote:
> On 2023-07-27 22:22:20, Marijn Suijten wrote:
>> On 2023-07-27 19:21:04, Dmitry Baryshkov wrote:
>>> As the INTF is fixed at the encoder creation time, we can move the
>>> check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
>>> This function can return an error if INTF doesn't have required feature.
>>> Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
>>> useful, as this function returns void.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 37 +++++++++++--------
>>>   1 file changed, 21 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index 04a1106101a7..e1dd0e1b4793 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> @@ -325,24 +325,17 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>>>   	unsigned long vsync_hz;
>>>   	struct dpu_kms *dpu_kms;
>>>   
>>> -	if (phys_enc->has_intf_te) {
>>> -		if (!phys_enc->hw_intf ||
>>> -		    !phys_enc->hw_intf->ops.enable_tearcheck) {
>>> -			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
>>> -			return;
>>> -		}
>>> -
>>> -		DPU_DEBUG_CMDENC(cmd_enc, "");
>>> -	} else {
>>> -		if (!phys_enc->hw_pp ||
>>> -		    !phys_enc->hw_pp->ops.enable_tearcheck) {
>>> -			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
>>> -			return;
>>> -		}
>>> -
>>> -		DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
>>> +	if (!phys_enc->has_intf_te &&
>>> +	    (!phys_enc->hw_pp ||
>>> +	     !phys_enc->hw_pp->ops.enable_tearcheck)) {
>>
>> when is hw_pp assigned?  Can't we also check that somewhere in an init
>> phase?
> 
> It would happen right before dpu_encoder_phys_cmd_atomic_mode_set()
> where we already happen to check has_intf_te to switch on PP
> intr_readptr vs INTF intr_tear_rd_ptr.  Might be the perfect place for
> the pingpong callback checks?

The problem is that mode_set doesn't return an error (by design). I'd 
put a TODO here, so that if we ever move/change resource allocation, 
this check can be done next to it (atomic_check isn't a good place, 
since phys_enc.atomic_check happens before resource reallocation).

> 
> - Marijn
> 
>>
>> Also, you won't go over 100 chars (not even 80) by having the (!... ||
>> !...) on a single line.
>>
>>> +		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
>>> +		return;
>>>   	}
>>>   
>>> +	DPU_DEBUG_CMDENC(cmd_enc, "intf %d pp %d\n",
>>> +			 phys_enc->hw_intf->idx - INTF_0,
>>> +			 phys_enc->hw_pp->idx - PINGPONG_0);
>>> +
>>>   	mode = &phys_enc->cached_mode;
>>>   
>>>   	dpu_kms = phys_enc->dpu_kms;
>>> @@ -768,9 +761,21 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>>>   	phys_enc->intf_mode = INTF_MODE_CMD;
>>>   	cmd_enc->stream_sel = 0;
>>>   
>>> +	if (!phys_enc->hw_intf) {
>>> +		DPU_ERROR_CMDENC(cmd_enc, "no INTF provided\n");
>>> +
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>> +
>>>   	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
>>>   		phys_enc->has_intf_te = true;
>>>   
>>> +	if (phys_enc->has_intf_te && !phys_enc->hw_intf->ops.enable_tearcheck) {
>>
>> Any other callbacks we could check here, and remove the checks
>> elsewhere?
>>
>> As with enable_tearcheck() though, it does make the code less consistent
>> with its PP counterpart, which is checked ad-hoc everywhere (but maybe
>> that is fixable too).
>>
>> - Marijn
>>
>>> +		DPU_ERROR_CMDENC(cmd_enc, "tearcheck not supported\n");
>>> +
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>> +
>>>   	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
>>>   	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
>>>   
>>> -- 
>>> 2.39.2
>>>

-- 
With best wishes
Dmitry

