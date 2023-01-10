Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB8D663795
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 04:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EEE10E48A;
	Tue, 10 Jan 2023 03:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014FD10E48A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 03:00:41 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id cf42so16200246lfb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 19:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vGNSWgXiNo7bO/1JvCWVYLKNUP073maYmoraPl+oELM=;
 b=vJfZtUJTFEoaE6iDN4hnIuVIrKDFw+F8bCagFrwFuEbl76JugQCFnBUAA88hhu2bZ+
 iG09QF7SaiDy8+Wm+AeJcVtllB3mjMZBUExjdnIg3HdRMpTquyMMaUvKCjUXg9gvba+K
 8hFSnPc/jPWkZUtAyY+faUVQQpCIfJrQNhNmz2zfkEquyr3XS6ceVEpt2j5IQ46aIKQi
 HS+m2yFRSDTWsHrHxLgLlCp0FAchyN3H53+obCKmTLZOYDvOTqwgGWW1H5phj4tT60wE
 1akm9EvHiMJ8OVo9tJACCacJp0FvdaEJIcYQQ3fn0tw80vGc5pX12ozcbPitESLFwtpD
 B4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vGNSWgXiNo7bO/1JvCWVYLKNUP073maYmoraPl+oELM=;
 b=Wbf3P+gU55pwGVXbEflvxsYiBpa+Cl8TRDxWEuX4L79Y2Lh+uO9pYVLHFb+egsRStp
 3smolfCuwGK4oB0UFuminhDgWtLX5aC0UKM0146z5G5xvesaA+WZtqSdQW0ZvO2ZAKQs
 /v9BQk+yfs47AoaoVvyuRDOKeIzU/TrPxRM2sysyEVujul81FRGfZIvuzw6SzujmcRlq
 IbbW4+nGGgmn3b93tbiFCA8MG+nZlklwM5QsvGOpkkz7CmzjoS/m8pegl9AfteNSpvn4
 yByQ0sqBrCelg92qTRTRZ1QqCj+j0k+4cJ5oOw4I0K7ZlmzH4TfPk+fHDFbVtVuaWJfN
 995A==
X-Gm-Message-State: AFqh2koTiRWLCAa4lV1pd5mH+bZh++yIzDt5czovygA0H8iY996mZcUF
 1IPS5vaRAAAVZs3ogk+52pDcVQ==
X-Google-Smtp-Source: AMrXdXuiTtuxQJfmKeIUmkGDUseauz86VaeBml4galRaMMHH9YH+lB9Y6nAIwoewJqTR8XWcQf0vSQ==
X-Received: by 2002:a05:6512:6d4:b0:4cb:1e1:f380 with SMTP id
 u20-20020a05651206d400b004cb01e1f380mr17801412lff.40.1673319640181; 
 Mon, 09 Jan 2023 19:00:40 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a5-20020ac25e65000000b0049fff3f645esm1931581lfr.70.2023.01.09.19.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 19:00:39 -0800 (PST)
Message-ID: <aa4fc2f4-204e-3570-fce3-ad9107061b73@linaro.org>
Date: Tue, 10 Jan 2023 05:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] drm/msm/dsi: implement opp table based check for
 dsi_mgr_bridge_mode_valid()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
 <1663807768-23969-2-git-send-email-quic_abhinavk@quicinc.com>
 <29e5110a-1759-8d8c-6646-f7b487990c0b@linaro.org>
 <b638db8c-20c8-827d-fd08-5e3bdb8dd924@linaro.org>
 <2d30f45a-ccd0-052e-6f6c-1e119c44f81a@quicinc.com>
 <8b8ea954-1747-2174-1977-a6e0f23d7fc7@linaro.org>
 <0180c789-9e7e-e1ed-3484-c638c860ce96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0180c789-9e7e-e1ed-3484-c638c860ce96@quicinc.com>
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
Cc: quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/01/2023 04:56, Abhinav Kumar wrote:
> 
> 
> On 1/9/2023 6:47 PM, Dmitry Baryshkov wrote:
>> On 10/01/2023 04:40, Abhinav Kumar wrote:
>>>
>>>
>>> On 1/9/2023 5:19 PM, Dmitry Baryshkov wrote:
>>>> On 27/10/2022 20:36, Dmitry Baryshkov wrote:
>>>>> On 22/09/2022 03:49, Abhinav Kumar wrote:
>>>>>> Currently there is no protection against a user trying to set
>>>>>> an unsupported mode on DSI. Implement a check based on the opp
>>>>>> table whether the byte clock for the mode can be supported by
>>>>>> validating whether an opp table entry exists.
>>>>>>
>>>>>> For devices which have not added opp table support yet, skip
>>>>>> this check otherwise it will break bootup on those devices.
>>>>>>
>>>>>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/15
>>>>>> Reported-by: Rob Clark <robdclark@gmail.com>
>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 23 +++++++++++++++++++++++
>>>>>>   1 file changed, 23 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>>>>>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>>>> index 3a1417397283..87b518c42965 100644
>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>>>> @@ -450,6 +450,29 @@ static enum drm_mode_status 
>>>>>> dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>>>>>>       int id = dsi_mgr_bridge_get_id(bridge);
>>>>>>       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>>>>       struct mipi_dsi_host *host = msm_dsi->host;
>>>>>> +    struct platform_device *pdev = msm_dsi->pdev;
>>>>>> +    struct dev_pm_opp *opp;
>>>>>> +    struct opp_table *opp_tbl;
>>>>>> +    unsigned long byte_clk_rate;
>>>>>> +
>>>>>> +    byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), 
>>>>>> mode);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * first check if there is an opp table available for the 
>>>>>> calculated
>>>>>> +     * byte clock and then check DSC related info. Some devices 
>>>>>> have not
>>>>>> +     * added support for OPP table. Skip the check for those.
>>>>>> +     */
>>>>>> +    opp_tbl = dev_pm_opp_get_opp_table(&pdev->dev);
>>>>>
>>>>> Can we store the table inside the msm_dsi during the init? Then we 
>>>>> won't have to get it again and again during each mode_valid call.
>>>>
>>>> I checked other drivers. I think we can skip the get_opp_table 
>>>> completely, can we not? Just handle ENODEV returned from 
>>>> dev_pm_opp_find_freq_ceil().
>>>>
>>>
>>> Your point is valid but I had a doubt on that API.
>>>
>>> As per the documentation of that API, it says
>>>
>>> 639  * Return: matching *opp and refreshes *freq accordingly, else 
>>> returns
>>> 640  * ERR_PTR in case of error and should be handled using IS_ERR. 
>>> Error return
>>> 641  * values can be:
>>> 642  * EINVAL:    for bad pointer
>>> 643  * ERANGE:    no match found for search
>>> 644  * ENODEV:    if device not found in list of registered devices
>>> 645  *
>>> 646  * The callers are required to call dev_pm_opp_put() for the 
>>> returned OPP after
>>> 647  * use.
>>> 648  */
>>> 649 struct dev_pm_opp *dev_pm_opp_find_freq_ceil(struct device *dev,
>>> 650                          unsigned long *freq)
>>> 651 {
>>>
>>> So ideally yes, ENODEV means that table was not found but .... that 
>>> API uses _find_opp_table under the hood.
>>>
>>> which says
>>>
>>> 79  * Return: pointer to 'struct opp_table' if found, otherwise 
>>> -ENODEV or
>>> 80  * -EINVAL based on type of error.
>>> 81  *
>>> 82  * The callers must call dev_pm_opp_put_opp_table() after the 
>>> table is used.
>>>
>>> Now, how would we know if the failure was due to table not found OR 
>>> entry not found.
>>>
>>> Table now found means that SOC has probably not started using OPP 
>>> table which is alright and not an error.
>>>
>>> But EINVAL could mean an entry not found which means it exceeds the 
>>> opp table limits.
>>
>> I think this would be -ERANGE as documented.
>>
>> EINVAL means dev is null or something of the same kind.
>>
> 
> Okay, so EINVAL and ERANGE are genuine errors but ENODEV is not in our 
> case as all SOCs might not have opp table yet.
> 
> Do you still think selective handling of these two errors is better than 
> the current implementation? That way its separation is clear.

I think that we should drop the opp_table handling.
Then select basing on the returned error:
  ERANGE => MODE_CLOCK_HIGH
  EINVAL and any other error => MODE_ERROR
  ENODEV => skip the check, continue with dsc

See below.

> 
>>>
>>> So there was some ambiguity on this. So I broke it down into two calls.
>>>
>>> If my concern is invalid, let me know.
>>>
>>> But I do agree with you that we can cache the opp table once rather 
>>> than doing it in every mode_valid().
>>>
>>>>>
>>>>>> +    if (opp_tbl) {
>>>>>> +        opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
>>>>>> +        if (IS_ERR(opp)) {
>>>>>> +            pr_err("opp table not found for freq %lu err: %ld\n",
>>>>>> +                    byte_clk_rate, PTR_ERR(opp));
>>>>>> +            return PTR_ERR(opp);

Note: mode_valid returns `enum drm_mode_status`, so we can not return 
PTR_ERR here.

>>>>>> +        }
>>>>>> +        dev_pm_opp_put(opp);
>>>>>> +        dev_pm_opp_put_opp_table(opp_tbl);
>>>>>> +    }
>>>>>>       return msm_dsi_host_check_dsc(host, mode);
>>>>>>   }
>>>>>
>>>>
>>

-- 
With best wishes
Dmitry

