Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7244752C40B
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 22:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5577D10F4F5;
	Wed, 18 May 2022 20:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DE910F435;
 Wed, 18 May 2022 20:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652905177; x=1684441177;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=35+mVLkWcgooCHSr+c7HPDAJpJIycqcHxmTzAwsFFrI=;
 b=xZ/D5cMp1xtEF2DlrVSvAInKNOKHdg+Afc+SYjkNlgGghQzS4/nn5hp7
 blEmCp+72XGW9MBfDgaAw//06jO3Ye5TzBxMCVSiBAqg/Xwj5OWu4lVKn
 i/DJj4SwtoBmf2QsSjEUQqhn9wIB3Nv5OPrqaYBWPYDNuM3lQuLHVxwt1 E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 May 2022 13:19:37 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 13:19:37 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 18 May 2022 13:19:36 -0700
Received: from [10.110.42.114] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 18 May
 2022 13:19:35 -0700
Message-ID: <a905227d-0e3f-0e91-a6ac-a2fffc0b88df@quicinc.com>
Date: Wed, 18 May 2022 13:19:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/2] eDP/DP Phy vdda realted function
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1652892186-22346-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqq4fxxgY0mj0JBans3GE-HAuad4Zsf7Ntwy1WW3bHbTQ@mail.gmail.com>
 <98295144-2e05-674b-4983-5f1738480c86@quicinc.com>
 <38e1f139-6814-db63-1f4b-5a76a1ab0eda@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <38e1f139-6814-db63-1f4b-5a76a1ab0eda@linaro.org>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/18/2022 10:31 AM, Dmitry Baryshkov wrote:
> On 18/05/2022 20:29, Kuogee Hsieh wrote:
>>
>> On 5/18/2022 10:16 AM, Dmitry Baryshkov wrote:
>>> On Wed, 18 May 2022 at 19:43, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>>> wrote:
>>>> 1) add regulator_set_load() to eDP/DP phy
>>>> 2) remove vdda related function out of eDP/DP controller
>>> These patches touch two subsystems and have a dependency between them.
>>> How do we merge them?
>>
>> currently, both phy and controller are vote for regulator. The last 
>> vote will just increase count.
>>
>> Therefore the dependency should be very loose.
>
> So, do you propose to merge dp change a cycle after the phy changes go 
> in?
>
yes,
>>
>>
>>>> Kuogee Hsieh (2):
>>>>    phy/qcom: add regulator_set_load to edp/dp phy
>>>>    drm/msm/dp: delete vdda regulator related functions from eDP/DP
>>>>      controller
>>>>
>>>>   drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ------
>>>>   drivers/gpu/drm/msm/dp/dp_parser.h  |  6 ---
>>>>   drivers/gpu/drm/msm/dp/dp_power.c   | 95 
>>>> +------------------------------------
>>>>   drivers/phy/qualcomm/phy-qcom-edp.c | 25 ++++++++--
>>>>   drivers/phy/qualcomm/phy-qcom-qmp.c | 13 +++++
>>>>   5 files changed, 36 insertions(+), 117 deletions(-)
>>>>
>>>> -- 
>>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>>>> Forum,
>>>> a Linux Foundation Collaborative Project
>>>>
>>>
>
>
