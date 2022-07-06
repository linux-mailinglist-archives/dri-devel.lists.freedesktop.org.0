Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405C0569127
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA96311A4B7;
	Wed,  6 Jul 2022 17:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4BA11A4B7;
 Wed,  6 Jul 2022 17:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657130063; x=1688666063;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wqwUl286FkC6LKx5TWg4Qne3uSw2cm8aEVNNH2osSN8=;
 b=N1djg9l/bj1GJWwmCwWFdpgP8XE9MxG1RTZ2uB8cqvY4FedHZn9EOXNm
 N16E582c7P0+rewIWZ5ko7pVnQSAn7Shp995wnz6hOK251DMOrSV1yN6G
 /2I8LCNBTg+sUmjTxFR4jPuewClHYo2awn3yJxnZvz19qe78gL/Yk/NmS k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 06 Jul 2022 10:54:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 10:54:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Jul 2022 10:54:21 -0700
Received: from [10.110.5.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 6 Jul 2022
 10:54:20 -0700
Message-ID: <cdbfbad1-83a3-b15d-3000-eec425ae140c@quicinc.com>
Date: Wed, 6 Jul 2022 10:54:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] drm/msm/dp: make eDP panel as the first connected
 connector
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <bjorn.andersson@linaro.org>
References: <1657128246-15929-1-git-send-email-quic_khsieh@quicinc.com>
 <86ee9636-8827-7bad-6bd9-22191b2d293c@linaro.org>
 <949ae061-8191-2497-af56-1df74432272d@quicinc.com>
 <b85a7423-44ec-1f58-7465-e5322bc32cd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <b85a7423-44ec-1f58-7465-e5322bc32cd3@linaro.org>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/6/2022 10:41 AM, Dmitry Baryshkov wrote:
> On 06/07/2022 20:38, Kuogee Hsieh wrote:
>>
>> On 7/6/2022 10:25 AM, Dmitry Baryshkov wrote:
>>> On 06/07/2022 20:24, Kuogee Hsieh wrote:
>>>> Some userspace presumes that the first connected connector is the main
>>>> display, where it's supposed to display e.g. the login screen. For
>>>> laptops, this should be the main panel.
>>>>
>>>> This patch call drm_helper_move_panel_connectors_to_head() after
>>>> drm_bridge_connector_init() to make sure eDP stay at head of
>>>> connected connector list. This fixes unexpected corruption happen
>>>> at eDP panel if eDP is not placed at head of connected connector
>>>> list.
>>>>
>>>> Changes in v2:
>>>> -- move drm_helper_move_panel_connectors_to_head() to
>>>>         dpu_kms_drm_obj_init()
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> index 2b9d931..50ff666 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> @@ -763,6 +763,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms 
>>>> *dpu_kms)
>>>>       if (ret)
>>>>           return ret;
>>>>   +    drm_helper_move_panel_connectors_to_head(dev);
>>>
>>> This should be in msm_drv.c unless you have a strong reason to have 
>>> it here.
>> Can you please  provide more info why should be in msm_drv.c?
>
> Let me quote my message from v1 review:
>
> Please move this call to the msm_drm_init(). Calling this function 
> somewhere after the ->kms_init() would make sure that all panel 
> connectors are close to the top of the list, whichever MDP/DPU driver 
> is used and whichever actual interface is bound to this panel.
>
Below are the call flow in timing order, ->kms_init does not create 
connectors/interfaces, hw_init does that.

1) ->kms_init

2) ->hw_init -> dpu_kms_hw_init --> _dpu_kms_drm_obj_init()  --> 
_dpu_kms_setup_displays()--> msm_dp_modeset_init() --> creator 
connectors/interfaces

3) drm_helper_move_panel_connectors_to_head() <== add here??

>>> _dpu_kms_drm_obj_init() create and initialize drm obj one by one and 
>>> _dpu_kms_setup_displays() had created system wide 
>>> connectors/interfaces .
>>
>> After that should be fine to move edp to head of connector list.
>>
>>>> +
>>>>       num_encoders = 0;
>>>>       drm_for_each_encoder(encoder, dev)
>>>>           num_encoders++;
>>>
>>>
>
>
