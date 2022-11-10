Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4F0623CE0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 08:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B33110E672;
	Thu, 10 Nov 2022 07:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0741010E673
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 07:44:03 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j4so1707733lfk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 23:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5jfTJLbOMPdujf4x0+Dv265P0Iq2mzeM6nHnDg9MXeg=;
 b=AXwl/poTGLi7lfFlrmGBXrzE66dtjO4OOVqM19FCmrI0ZwQk+LqY6zACq8/X3twNXw
 Zkg4YXiiJBB7svvXzW+DAjry/BczhfMokjWFSHB9DdwBd+PCMlfrrd9BpSXLo1Azvqdw
 IyoV4L60VRlmSScFkCcEblUj5Hjo0UjXGCglUEsuacHEFFZslnmknVAvccWKI2MwkxFE
 exLejtP3Ua2z6/vAsau2/nrzgUQkskdDC0wqmI/DQbFn36KTlW3fGv0CX4V8EStT5apn
 WEyDPLFJHfUS9yO3Yw6S9ZNG5y+7qsmLf9uCIJGhgOlqBllr7qwIN8DBCsS+xNk4LqnT
 HKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5jfTJLbOMPdujf4x0+Dv265P0Iq2mzeM6nHnDg9MXeg=;
 b=IuRJY6xqmG9NktIAwRuqEvMLu7kBcJijJjj35EKiM3pH0W8n55PCKjtBNzpniJJcsp
 djw372/gbfkryY/ZkFeqHU3sejpJSd+TH1otXLzNoLa09egUt7e8zZ3jqYMGmW10FnGB
 TOOnAxyLRIiucSN+w2EhqOGvtC23rXDwbCroZ2o2rxzy7YRf71VAO3SDSyWbN8x86/ax
 FlMkCFmHt5DUiztVv74QzEdS/VlDoSqe47dOFTxaA1op7keAsXmC4J+Abl58VwfZM4lt
 PpdhIYyoYBln3Wf9TRcOW4mUueBnG7JN5Q/VLyYUqijR8WlSHlGMyGNZg3expdlXaWfh
 o9TA==
X-Gm-Message-State: ANoB5pl9fZoBQ3xFBe4qujOc2sOBN/+erjyFyafC8QIVt3QcnKXru5F8
 ke+HjTBUNSES6+Dg797EWBdmcQ==
X-Google-Smtp-Source: AA0mqf6rw5MRmht/n8jPYKogCphtvDWLgob4EoxUlawBLfCzM2NwRPQeACStT3Jcqs183rS14NBW8g==
X-Received: by 2002:a05:6512:758:b0:4b4:ead:697c with SMTP id
 c24-20020a056512075800b004b40ead697cmr2859653lfs.25.1668066241090; 
 Wed, 09 Nov 2022 23:44:01 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a05651239c400b00499cf3e3edcsm1227599lfu.296.2022.11.09.23.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 23:44:00 -0800 (PST)
Message-ID: <adf5f80a-17e5-1163-a93c-2759ae57d77d@linaro.org>
Date: Thu, 10 Nov 2022 10:43:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/msm/dp: remove limitation of link rate at 5.4G to
 support HBR3
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Doug Anderson <dianders@chromium.org>
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
 <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org>
 <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
 <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
 <155e4171-187c-4ecf-5a9b-12f0c2207524@linaro.org>
 <CAD=FV=Wk5rBSq9Mx1GCO0QFYckKV9KUFKL36Ld7dQX1ypHVcYw@mail.gmail.com>
 <CAD=FV=XTOUjVAGFWZ6xTkcNOrCT1p73aU-=KJNYUOxsS-BQsyA@mail.gmail.com>
 <c5aedb31-3881-50e7-f747-e75b18c3f4b8@linaro.org>
 <CAD=FV=WPde5wVOGCKQYGuGwgCwRebox4FF0MgV_2pPCTsfo_UA@mail.gmail.com>
 <60643572-4148-cea5-e64d-ec6534b0c407@linaro.org>
 <a4127ba2-5968-e8a9-da63-fd709aa01e7f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a4127ba2-5968-e8a9-da63-fd709aa01e7f@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/11/2022 02:47, Kuogee Hsieh wrote:
> 
> On 11/2/2022 11:04 AM, Dmitry Baryshkov wrote:
>> On 02/11/2022 20:28, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Wed, Nov 2, 2022 at 10:23 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>>> 1. Someone figures out how to model this with the bridge chain and
>>>>> then we only allow HBR3 if we detect we've got a TCPC that supports
>>>>> it. This seems like the cleanest / best but feels like a long pole.
>>>>> Not only have we been trying to get the TCPC-modeled-as-a-bridge stuff
>>>>> landed for a long time but even when we do it we still don't have a
>>>>> solution for how to communicate the number of lanes and other stuff
>>>>> between the TCPC and the DP controller so we have to enrich the bridge
>>>>> interface.
>>>>
>>>> I think we'd need some OOB interface. For example for DSI interfaces we
>>>> have mipi_dsi_device struct to communicate such OOB data.
>>>>
>>>> Also take a note regarding data-lanes from my previous email.
>>>
>>> Right, we can somehow communicate the max link rate through the bridge
>>> chain to the DP controller in an OOB manner that would work.
>>
>> I'd note that our dp_panel has some notion of such OOB data. So do AUX 
>> drivers including the panel-edp. My suggestion would be to consider 
>> both of them while modelling the OOB data.
>>
>>>
>>>
>>>>> 2. We add in a DT property to the display controller node that says
>>>>> the max link rate for use on this board. This feels like a hack, but
>>>>> maybe it's not too bad. Certainly it would be incredibly simple to
>>>>> implement. Actually... ...one could argue that even if we later model
>>>>> the TCPC as a bridge that this property would still be valid / useful!
>>>>> You could certainly imagine that the SoC supports HBR3 and the TCPC
>>>>> supports HBR3 but that the board routing between the SoC and the TCPC
>>>>> is bad and only supports HBR2. In this case the only way out is
>>>>> essentially a "board constraint" AKA a DT property in the DP
>>>>> controller.
>>>>
>>>> We have been discussing similar topics with Abhinav. Krzysztof 
>>>> suggested
>>>> using link-frequencies property to provide max and min values.
> 
> questions,
> 
> 1)is Krzysztof suggested had been implemented?

I can not parse this question, please excuse me.

Yes, Krzysztof suggested this being implemented as a link property, see 
media/video-interfaces.txt.

Moreover your implementation goes against both the existing definition 
(array with the list of frequencies) and Krzysztof's suggested extension 
(min and max). Listing just a single frequency goes against both these 
suggestions. In case of DP we have a fixed set of frequencies. Thus I'd 
suggest listing all supported frequencies instead.

> 2) where is link property i can add link-frequencies?

link node. Create outbound graph node, add link-frequencies there. Also 
as you are touching this part, please move the data-lanes property too.

> 
> 
>>>
>>> This sounds good to me and seems worth doing even if we eventually do 
>>> #1.
>>
>> And the bonus point is that it can be done easily.
>>

-- 
With best wishes
Dmitry

