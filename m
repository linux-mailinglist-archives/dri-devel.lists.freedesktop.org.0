Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1144243E2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 19:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E826EDD4;
	Wed,  6 Oct 2021 17:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF826EDD4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 17:19:41 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id r19so12460915lfe.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 10:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QA6phmeOesdAM5wMVcpZaMUAisiXa4MZUSLENBPOW+4=;
 b=Q9W9nZ7B1N1vXSzz9EqvyMg1/vAqx3Sq8bLg9IqwplJRcS1LrBuHcmZaLt3b8jsh9m
 S5Me2aZQphWK51Gko+88WspK87IIbDCF41WK07BYK91bii3M+QHzBJlBitRd+mu9NATH
 i/izE0Kv/Gq00GyZZP0AH6t7gAYF8PzKnylI4aBDH8yNncRZ7qQ1cXiPmjG17VwcuE/r
 G4Sh9COmRmSJROiPJLt6jorXQoAyi/FLmO6oKeTatXIxMZAtn2nnt8s/Zfr64UXBgvr/
 fXZqWpAAbDvZAUHPppta1wt9IjwfP9EAMgNbLqemaqTJiGaJMmePdaPjkKvDWyB07xwK
 1TMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QA6phmeOesdAM5wMVcpZaMUAisiXa4MZUSLENBPOW+4=;
 b=JWBDWAexaD+gbPe+4bCGFX5wQfBnXS7DDEPus/ppW/c5BRhGg738aOjo/bFGNoejw1
 suJt+PhpJHnn/sGt4ylrTI2wiEcnV3nNA3aeVK0SNXsRyGJUTVcxBPiIXpZjlA3Vqs8T
 Yro4qVajai+dh1Dvi5wCb22/QH9XqO0CNBoKQRErf3Ol1wOk0rS15QcIVAlf3gs4HF43
 P+6lcIdL7/ZXnVLWzEck2XYCuuAdd4cp0nxUrs5bfA2Wq09yrDq45N3RkdMEqomg8jeZ
 UTHVk+mAtaBDexAqrfMrdGVvlIsE0ZZWi8bm+clzEOlHv2U2O2oLvpJycMjQvY5iK/eO
 0GKA==
X-Gm-Message-State: AOAM532FfYAmktLBMLEB2rQkx5RxdqebNX+ZRqBRJ8y3X+rGSv85pApc
 Y4Lb5kbDrLYBeV29tEd9dL+l/Q==
X-Google-Smtp-Source: ABdhPJxIO9BZrZ5sysyuXjDdHOPAC3gqsRDyDW3/VQwQ9tKJV9opHTNmrYga6LwTTkN68rKGFb1nUw==
X-Received: by 2002:ac2:5626:: with SMTP id b6mr10753451lff.132.1633540779444; 
 Wed, 06 Oct 2021 10:19:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c10sm761985lfc.243.2021.10.06.10.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 10:19:39 -0700 (PDT)
Subject: Re: [PATCH v4 5/7] drm/msm/dp: Support up to 3 DP controllers
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-6-bjorn.andersson@linaro.org>
 <CAE-0n52gOCC8bUfMFnNHRKFoq2=q4Ho8a-UYH5JKgumguhUD2A@mail.gmail.com>
 <YVz/NOL3AFn2zBA0@ripper>
 <CAE-0n513cs282Dh_YFMHK2uKCVFSWxtNyfRaFwWGyUvpfShixw@mail.gmail.com>
 <YV0MAF/Y5BR1e6My@ripper>
 <CAE-0n53TwEyycpAaWVpRUKPpos4z-gqwrvyUdgobh1V88VUsXg@mail.gmail.com>
 <YV3XxadYE/KU2w89@ripper>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <2073d18c-f5d5-562f-0ddb-38abc8a4457b@linaro.org>
Date: Wed, 6 Oct 2021 20:19:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YV3XxadYE/KU2w89@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/10/2021 20:07, Bjorn Andersson wrote:
> On Tue 05 Oct 21:26 PDT 2021, Stephen Boyd wrote:
> 
>> Quoting Bjorn Andersson (2021-10-05 19:37:52)
>>> On Tue 05 Oct 19:06 PDT 2021, Stephen Boyd wrote:
>>>
>>>> Quoting Bjorn Andersson (2021-10-05 18:43:16)
>>>>> On Tue 05 Oct 17:43 PDT 2021, Stephen Boyd wrote:
>>>>>
>>>>>> Quoting Bjorn Andersson (2021-10-05 16:13:21)
>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>> index bdaf227f05dc..674cddfee5b0 100644
>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>> @@ -1233,7 +1239,7 @@ static int dp_display_probe(struct platform_device *pdev)
>>>>>>>          if (!dp)
>>>>>>>                  return -ENOMEM;
>>>>>>>
>>>>>>> -       desc = dp_display_get_desc(pdev);
>>>>>>> +       desc = dp_display_get_desc(pdev, &dp->id);
>>>>>>
>>>>>> I'm sad that dp->id has to match the number in the SoC specific
>>>>>> dpu_intf_cfg array in drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> still. Is there any way we can avoid that? Also, notice how those arrays
>>>>>> already have INTF_DP macros, which makes me think that it may be better
>>>>>> to connect this to those arrays instead of making an msm_dp_desc
>>>>>> structure and then make sure the 'type' member matches a connector
>>>>>> type number. Otherwise this code is super fragile.
>>>>>>
>>>>>
>>>>> I'm afraid I don't understand what you're proposing. Or which part you
>>>>> consider fragile, the indices of the INTF_DP instances aren't going to
>>>>> move around...
>>>>>
>>>>> I have N instances of the DP driver that I need to match to N entries
>>>>> from the platform specific intf array, I need some stable reference
>>>>> between them. When I started this journey I figured I could rely on the
>>>>> of_graph between the DPU and the interface controllers, but the values
>>>>> used there today are just bogus, so that was a no go.
>>>>>
>>>>> We can use whatever, as long as _dpu_kms_initialize_displayport() can
>>>>> come up with an identifier to put in h_tile_instance[0] so that
>>>>> dpu_encoder_setup_display() can find the relevant INTF.
>>>>>
>>>>
>>>> To make it more concrete we can look at sc7180
>>>>
>>>> static const struct dpu_intf_cfg sc7180_intf[] = {
>>>>          INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24,
>>>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>>>                                                       ^
>>>>                                                       |
>>>>
>>>> intf0 is irrelevant. Also the address is irrelevant. But here we have a
>>>> zero, the number after INTF_DP, and that is very relevant. That number
>>>> needs to match the dp->id. Somewhere we have a match between
>>>> controller_id and dp->id in the code.
>>>
>>> That number (the 0, not INTF_0) is what the code matches against dp->id
>>> in _dpu_kms_initialize_displayport(), in order to figure out that this
>>> is INTF_0 in dpu_encoder_setup_display().
>>>
>>> I.e. look at the sc8180x patch:
>>>
>>> INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>> INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>>> INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>>> /* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
>>> INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>>> INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
>>> INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, 2, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>>>
>>> Where the DP driver defines the 3 controllers with dp->id of 0, 1 and 2,
>>> which the DPU code will match against to INTF_0, INTF_4 and INTF_5.
>>>
>>
>> Yep. I'm saying that having to make that number in this intf array match
>> the order of the register mapping descriptor array is fragile. Why can't
>> we indicate the interface is DP or eDP with INTF_DP or INTF_EDP and then
>> map from the descriptor array to this intf array somehow so that the
>> order of the descriptor array doesn't matter? Then we don't have to put
>> the connector type in the descriptor array, and we don't have to keep
>> the order of the array a certain way to match this intf descriptor.
>>
>> Maybe
>>
>> 	struct msm_dp_desc {
>> 		phys_addr_t io_start;
>> 		unsigned int id;
> 
> The INTF_<N> constants are a property of the DPU driver and not
> available in the DP driver and the msm_dp struct is a property of the DP
> driver and can't be dereferenced in the DPU driver.
> 
> The proposed way around this is that the descs array defines the order
> in priv->dp[N] and this N is used as controller_id.
> 
> 
> So the only thing that I don't find straight forward here is that the
> eDP controller is considered just a DP controller, so you have to use
> INTF_DP, <N> for that, and not just INTF_EDP, 0.

Would it be better if we change the DPU driver to handle INTF_EDP too?

> 
>> 	};
>>
>> and then have msm_dp_desc::id equal INTF_<N> and then look through the
>> intf from DPU here in the DP driver to find the id and type of connector
>> that should be used by default? Still sort of fragile because the only
>> connection is an unsigned int which isn't great, but at least it's
>> explicit instead of implicit based on the array order.
> 
> No matter how I look at this, you need to put some number somewhere here
> that will be used to match up the INTF with the right DSI/DP encoder.
> 
> Using the proposed number scheme follows the numbering of all the DP
> controllers from the documentation.
> 
> Regards,
> Bjorn
> 


-- 
With best wishes
Dmitry
