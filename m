Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C0A4D21CD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34A110E4AE;
	Tue,  8 Mar 2022 19:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDC58989C;
 Tue,  8 Mar 2022 19:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646768649; x=1678304649;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iNCOz7hZgjBQm4NquAnXW7pfqyYcChlO/XfWwJieS1A=;
 b=JnjRycK/u5ueeevlZq1hU3o2xuzW4p4SPzU4kClRVMfTiGODJMBHlGai
 P61k4LtPcU7dxMdvihTSv9qs+Fzf71mlIYYIvVjhR6gvAfDgwO5RIexiN
 W92JxaZHmmKTfhsszjfaYVcoeycqT3Ltmb5LcY4ubxxMFrLQMn8ouFxLL s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Mar 2022 11:44:09 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:44:08 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 8 Mar 2022 11:44:08 -0800
Received: from [10.110.69.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Tue, 8 Mar 2022
 11:44:07 -0800
Message-ID: <4daece94-c438-29dd-ef9d-e4c4c06187c4@quicinc.com>
Date: Tue, 8 Mar 2022 11:44:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
Content-Language: en-US
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87v8xxs2hz.fsf@intel.com>
 <CAF6AEGtdnWWhGp7U7nAPD4r3Uoe5BJKVm2rQ2MS=q5GqF6MYDA@mail.gmail.com>
 <YhyB0WmJDWVFO1se@pendragon.ideasonboard.com> <871qzn6vmc.fsf@intel.com>
 <Yhy/6+z7QshG+qOo@pendragon.ideasonboard.com>
 <YhzROBOwTUkZw3Ez@pendragon.ideasonboard.com>
 <4d8daabe-10d9-a3cf-d305-68414cffe4ed@quicinc.com>
 <Yh+4EOKA5FgrlZrF@pendragon.ideasonboard.com>
 <0cfd36a2-26e4-309d-d8e9-e3bf8a5d2417@quicinc.com>
 <MWHPR11MB174187335183FC24BE0F1EA5E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
 <CAA8EJppTVN1EnytD5mCmr4ZTi4M8u9ENOmJuweNyDRkB3LEHnw@mail.gmail.com>
 <MWHPR11MB1741708DEFD56E02C1BBC7A3E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
 <CAA8EJppHOJzJt=oapYhshajWt3mSXKjoMUdcnb3T_i+62Xo8NA@mail.gmail.com>
 <MWHPR11MB174170C633719C9CBAC0DE18E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
 <9ae6ae27-b8fb-712a-64ec-c5e069059689@quicinc.com>
 <MWHPR11MB1741B36C4BA59CDF84D9F52EE3099@MWHPR11MB1741.namprd11.prod.outlook.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <MWHPR11MB1741B36C4BA59CDF84D9F52EE3099@MWHPR11MB1741.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Carsten Haitzler <carsten.haitzler@arm.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel
 Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Suraj

On 3/8/2022 6:30 AM, Kandpal, Suraj wrote:
> Hi Abhinav,
>>> Hi,
>>>>> Hi,
>>>>>>> Hi Abhinav,
>>>>>>>> Hi Laurent
>>>>>>>>
>>>>>>>> Ok sure, I can take this up but I need to understand the proposal
>>>>>>>> a little bit more before proceeding on this. So we will discuss
>>>>>>>> this in another email where we specifically talk about the
>>>> connector changes.
>>>>>>>>
>>>>>>>> Also, I am willing to take this up once the encoder part is done
>>>>>>>> and merged so that atleast we keep moving on that as MSM WB
>>>>>>>> implementation can proceed with that first.
>>>>>>>>
>>>>>>>> Hi Jani and Suraj
>>>>>>>>
>>>>>>>> Any concerns with splitting up the series into encoder and
>>>>>>>> connector OR re- arranging them?
>>>>>>>>
>>>>>>>> Let me know if you can do this OR I can also split this up
>>>>>>>> keeping Suraj's name in the Co-developed by tag.
>>>>>>> I was actually thinking of floating a new patch series with both
>>>>>>> encoder and connector pointer changes but with a change in
>>>>>>> initialization functions wherein we allocate a connector and
>>>>>>> encoder incase the driver doesn’t have its own this should
>>>>>>> minimize the effect on other drivers already using current drm
>>>>>>> writeback framework and also
>>>>>> allow i915 to create its own connector.
>>>>>>
>>
>> I was proposing to split up the encoder and connector because the
>> comments from Laurent meant we were in agreement about the encoder
>> but not about the connector.
>>
>> I am afraid another attempt with the similar idea is only going to stall the
>> series again and hence i gave this option.
> 
> Seems like this patch series currently won't be able to move forward with the
> connector pointer change so I guess you can split the series to encoder pointer
> change where we optionally create encoder if required ,keeping my name in
> co-developed tag so that msm can move forward with its implementation and
> then we can work to see how the connector issue can be bypassed.
> 
> Best Regards,
> Suraj Kandpal

Thanks, let me re-spin this and will keep your name as co-developer.
Should be able to get it on the list in a week.

Thanks

Abhinav
>> Eventually its upto Laurent and the other maintainers to guide us forward on
>> this as this series has been stalled for weeks now.
>>
>>>>>> I thought that Laurent was quite strict about the connector. So I'd
>>>>>> suggest targeting drm_writeback_connector with an optionally
>>>>>> created encoder and the builtin connector
>>>>> In that case even if we target that i915 will not be able to move
>>>>> forward with its implementation of writeback as builtin connector
>>>>> does not work for us right now as explained earlier, optionally
>>>>> creating encoder and connector will help everyone move forward and
>>>>> once done
>>>> we
>>>>> can actually sit and work on how to side step this issue using
>>>>> Laurent's suggestion
>>>>
>>>> This is up to Laurent & other DRM maintainers to decide whether this
>>>> approach would be accepted or not.
>>>> So far unfortunately I have mostly seen the pushback and a strong
>>>> suggestion to stop treating each drm_connector as i915_connector.
>>>> I haven't checked the exact details, but IMO adding a branch if the
>>>> connector's type is DRM_CONNECTOR_VIRTUAL should be doable.
>>> Bringing in the change where we don’t treat each drm_connector as an
>>> intel_connector or even adding a branch which checks if drm_connector
>>> is DRM_CONNECTOR_VIRTUAL and conditionally cast it to intel_connector
>>> is quite a lot of work for i915.
>>> That's why I was suggesting if for now we could move forward with
>>> optionally creating both encoder and connector minimizing affects on
>>> other drivers as well as allowing us to move forward.
>>> What do you think, Launrent?
>>>
>>>>
>>>>>>
>>>>>>> We can work on Laurent's suggestion but that would first require
>>>>>>> the initial RFC patches and then a rework from both of our drivers
>>>>>>> side to see if they gel well with our current code which will take
>>>>>>> a considerable amount of time. We can for now however float the
>>>>>>> patch series up which minimally affects the current drivers and
>>>>>>> also allows
>>>>>>> i915 and msm to move forward with its writeback implementation off
>>>>>>> course with a proper documentation stating new drivers shouldn't
>>>>>>> try to
>>>>>> make their own connectors and encoders and that drm_writeback will
>>>>>> do that for them.
>>>>>>> Once that's done and merged we can work with Laurent on his
>>>>>>> proposal to improve the drm writeback framework so that this issue
>>>>>>> can be side
>>>>>> stepped entirely in future.
>>>>>>> For now I would like to keep the encoder and connector pointer
>>>>>>> changes
>>>>>> together.
>>>>>
>>>>
