Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562565990FB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C088C10EA28;
	Thu, 18 Aug 2022 23:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427B210E6D9;
 Thu, 18 Aug 2022 23:11:25 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IMrC9L011384;
 Thu, 18 Aug 2022 23:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LwMe9vWTBIKzX8q+kA+JWETXwlgC1hWx7z5/AwjqoIg=;
 b=AY73Xy/KGHNTwZHgBpUWWLzgqJEXxKfgpJPcf4IVDE+Uk+64Srg7aMZJQ7geeRR5jEqU
 n8/ewv+FE5/q7ejCN4T/zG8zAlsVBhWLMdwCr13XNupB0VYxbZlFP3viI7HG8EM4u4R5
 nCH5YK9s7jz/xQcmEJwRLu3DQYNux9lyN71AHg4EPnMkHwu8bM/7UO/ASUmhe92OJH/J
 mRVvDrxt8mW9ANs9HwOZqTAuOrm+DvD2mg/xPyQos181xnwgD/oEzTPwYwbdHMDQT757
 hjmp6/TYclBaNJgK9+b4GADEimdCccEH/2D3qL71PQZ9KI0tgHiuLEl4wWFewuagM99Y kw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j1hhp2u79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 23:11:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27INBLMT019869
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 23:11:21 GMT
Received: from [10.111.166.229] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 18 Aug
 2022 16:11:19 -0700
Message-ID: <eca58cbc-dc7e-98d3-7618-858742b82614@quicinc.com>
Date: Thu, 18 Aug 2022 16:11:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Set panel orientation when
 directly connected
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20220706191442.1150634-1-swboyd@chromium.org>
 <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
 <CAF6AEGt_J6f1T+-6KtyCrUJrY2fh7Sz10L1AV1FSe8hueGREtQ@mail.gmail.com>
 <CAD=FV=W+VWtpTKAoyQpYMFteZy8iYB7-o=ACqkjr7YX7uCxZvg@mail.gmail.com>
 <CAD=FV=W9Gr9MyCg2rsKaA-ssSi5e3W5zO9sC56At+ceN4A2XtA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=W9Gr9MyCg2rsKaA-ssSi5e3W5zO9sC56At+ceN4A2XtA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FAtIbuZ2YlaJUXcNJf6H83gb0f5mPJda
X-Proofpoint-ORIG-GUID: FAtIbuZ2YlaJUXcNJf6H83gb0f5mPJda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_16,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180085
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
Cc: Sean Paul <sean@poorly.run>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, patches@lists.linux.dev,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug

On 8/17/2022 1:48 PM, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jul 20, 2022 at 3:42 PM Doug Anderson <dianders@chromium.org> wrote:
>>
>> Hi,
>>
>> On Wed, Jul 20, 2022 at 1:46 PM Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> On Fri, Jul 8, 2022 at 8:25 AM Doug Anderson <dianders@chromium.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On Wed, Jul 6, 2022 at 12:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
>>>>>
>>>>> Set the panel orientation in drm when the panel is directly connected,
>>>>> i.e. we're not using an external bridge. The external bridge case is
>>>>> already handled by the panel bridge code, so we only update the path we
>>>>> take when the panel is directly connected/internal. This silences a
>>>>> warning splat coming from __drm_mode_object_add() on Wormdingler boards.
>>>>>
>>>>> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
>>>>> Cc: Douglas Anderson <dianders@chromium.org>
>>>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>>>> ---
>>>>>
>>>>> This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
>>>>> to set orientation from panel") which is in drm-misc
>>>>>
>>>>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
>>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> I don't personally have objections to this, but (to my understanding)
>>>> "the future" is that everyone should use panel_bridge. If we made the
>>>> move to panel_bridge today then we wouldn't need to do this. In
>>>> general I think panel_bridge would end up letting us delete a bunch of
>>>> code...
>>>>
>>>> See commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with
>>>> panel-bridge") for when this was done by ti-sn65dsi86.
>>>>
>>>> Then again, I spent a small amount of time looking into this and it's
>>>> definitely non-trivial. Still likely worthwhile, but not worth
>>>> blocking a tiny fix like this. It also should be fairly obvious that
>>>> we should delete this when we switch to panel_bridge.
>>>>
>>>> Thus:
>>>>
>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>>
>>>> I'll assume that we'll just snooze this commit until drm-misc-next
>>>> merges into a tree that msm-next is based on, which will probably be
>>>> the next -rc1. If desired and Acked I could land this in
>>>> drm-misc-next, but it's probably not worth it?
>>>
>>> if you want to land this patch via drm-misc, which might be the
>>> easier/faster route, then:
>>>
>>> Acked-by: Rob Clark <robdclark@gmail.com>
>>
>> As per discussion on IRC, I'm not going to apply this to drm-misc-next.
>>
>> Given where we are in the cycle landing in drm-misc-next means it
>> won't be in mainline for a couple versions and I suspect that'll cause
>> merge conflicts with Dmitry's series [1]. ...and, of course, if
>> Dmitry's series lands then we don't even need ${SUBJECT} patch...
>>
>> So I think the plan is:
>>
>> 1. Snooze waiting for the next -rc1 since
>> drm_connector_set_orientation_from_panel() won't be in mainline until
>> then.
>>
>> 2. If Dmitry's series looks like a long way off, we could land
>> ${SUBJECT} patch in msm-next as a stopgap fix.
>>
>>
>> [1] https://lore.kernel.org/r/20220711094320.368062-5-dmitry.baryshkov@linaro.org/
> 
> Just checking up. What's the latest thinking here? Do we want to land
> Stephen's change as a stopgap?
> drm_connector_set_orientation_from_panel() is available in v6.0-rc1.
> 
> -Doug

As per todays discussion with Rob on IRC, we will start preparing the 
tree for the next release. So lets drop this one and take the panel 
bridge change instead since my comments on that were minor and can also 
be addressed in a follow up change, will take it up and send it over to 
Rob with some other changes.

Thanks

Abhinav
