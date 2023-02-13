Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAEB69484B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 15:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F2B10E5CD;
	Mon, 13 Feb 2023 14:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F8710E5CD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 14:41:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id s11so5471900edd.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 06:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wDjFxcjkidaHjzPxBdKqNTdzUqhlhn10myWbGJIgOuU=;
 b=trwjh13kzbqOvLJjn/dVumh2LtVz4aNU9W8NOe/b7iMWFoa808iU/lD7oia/hYawSn
 814oqZK+48F7N3XWBEVAhRP7hm136EdEQmHZhfKESnSh6mcaKyShH68iXiCciB+TCIkv
 rfLW3fPlQCQ9Vzr3zpqkHDCY1P57v6lqSpakeAQdKSOdcdp+ennjvNdQvHKyAxUsw6XJ
 9ln9mCJlYXvYx00wO1BqG6vUugA4/cOJRiU+viv9LDScXy+yCT9UnYXvg/2ROr13sACV
 rgfKWpSnTm2DgOQPExgViuJLbKTzfwJ2qctxe78gUtR61JVKeypvbp/lZl9zNJy9RrAM
 eiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wDjFxcjkidaHjzPxBdKqNTdzUqhlhn10myWbGJIgOuU=;
 b=sRi+uMjN2H9fAkn+iqOWSIORhfcBylACgwfTOLG38DSCOTjZTlyMiSkO+IyMECHCiK
 jBKlfEiLJtRmZvdTxsR+T6FkGloJXs74SX5ZTaXsmVUu4yy7F/9fcgPDl1SnTxqxPVkJ
 cjQKa1gw68/3QTgGIVxXSO5ESOXqJEBTncHSvNkDwORzDxKDGuRAvRJmJ9yMTa3Wo+4l
 sFVAlun85ay5SmDdLNlIarsKD8nXamLGPxXwsrJk9QQNpUlG0LtN6UcI+6FLCnQa1KdK
 FxCnGa/tO1YpQWmovvn2u70P0EyU4/49fkJXZjCQtcVFQg+jcDMQgx6Y4017PKXmcE+y
 0LHw==
X-Gm-Message-State: AO0yUKV5KuU34sO5Fp5/37ysFAUh2Y1dXq2m+Jgm6Ma17lnXVVv0tpf4
 lF/+ApetxTNRIMKleb9j96igUQ==
X-Google-Smtp-Source: AK7set8T0/X40ckTN9aZdS3UwOUDtnfhtWUWpBrsO8NZ/w66BWKgB1k3acnw0hX6LBPkR17ily/rDQ==
X-Received: by 2002:a50:d69b:0:b0:4ac:b866:7ebb with SMTP id
 r27-20020a50d69b000000b004acb8667ebbmr7917577edi.9.1676299258633; 
 Mon, 13 Feb 2023 06:40:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a508d51000000b004acc44ad062sm2177063edt.61.2023.02.13.06.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 06:40:58 -0800 (PST)
Message-ID: <e3c1a048-a9e1-53fa-5a19-cba62e8b1580@linaro.org>
Date: Mon, 13 Feb 2023 16:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/10] drm/msm/dpu: Allow variable SSPP/INTF_BLK size
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-6-konrad.dybcio@linaro.org>
 <20230213111220.ietr4aro6xu4emtu@SoMainline.org>
 <e6653ceb-bce1-9552-019d-278f455ba8a5@linaro.org>
 <20230213143148.qvyagudd3qm5jgwd@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213143148.qvyagudd3qm5jgwd@SoMainline.org>
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
Cc: freedreno@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, agross@kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 16:31, Marijn Suijten wrote:
> On 2023-02-13 13:38:33, Dmitry Baryshkov wrote:
>> On 13/02/2023 13:12, Marijn Suijten wrote:
>>> On 2023-02-11 13:26:51, Konrad Dybcio wrote:
>>>> These blocks are of variable length on different SoCs. Set the
>>>> correct values where I was able to retrieve it from downstream
>>>> DTs and leave the old defaults (0x1c8 for sspp and 0x280 for
>>>> intf) otherwise.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 242 +++++++++---------
>>>>    1 file changed, 121 insertions(+), 121 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> index 802050118345..d9ef1e133c1e 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> [..]
>>>> @@ -1848,10 +1848,10 @@ static struct dpu_dsc_cfg sm8150_dsc[] = {
>>>>    /*************************************************************
>>>>     * INTF sub blocks config
>>>>     *************************************************************/
>>>> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
>>>> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
>>>
>>> Dmitry and I discussed in #freedreno to instead add the INTF_BLK_DSI_TE
>>> macro that accounts for the INTF TE registers using this higher register
>>> area, as well as an extended signature to configure extra interrupts.
>>
>> Yes, that's still the plan. It's slightly painful that we are touching
>> this are simultaneously.
> 
> Should we (Konrad) then drop this patch as there's no need to add these
> (mostly RAZ/WI) registers to the dump until my INTF TE series starts
> using them?  That'll make rebasing easier on everyone too.

RAZ/WI is for not present registers (read-as-zero/write-ignore). I think 
that the growing register space is getting populated with registers 
(which we have been ignoring up to now).

> 
> - Marijn
> 
>>> (Besides, I think the len is currently only used for snapshot dumping
>>> and no validation for out-of-blk reads/writes)
>>
>> Yes. Because in most of the cases non-existing registers seem to be RAZ/WI.
>>
>>>
>>>>    	{\
>>>>    	.name = _name, .id = _id, \
>>>> -	.base = _base, .len = 0x280, \
>>>> +	.base = _base, .len = _len, \
>>>>    	.features = _features, \
>>>>    	.type = _type, \
>>>>    	.controller_id = _ctrl_id, \
>>> [..]
>>>
>>> - Marijn
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

