Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EB14CC7ED
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BB910EDF2;
	Thu,  3 Mar 2022 21:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CFC10EDEA;
 Thu,  3 Mar 2022 21:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646342579; x=1677878579;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dZMgWTTVxQBwMLLw02HkVQCrgECXmVAFuZOqW8AjXfw=;
 b=aG+9lZnsYFl4kEe7fczH6Zhpy4e+JkdxbNH5DcAnzE9W4u+VkHeHWJET
 Y/TC/F1p/dqn1sTEcEdqzrZ9V8b9YN3zI+sfbjLjGI9pIkhI8m5orc0Po
 3zCi9zmmJI4WupRgm/pwfx0GRyf97ojQ+XmpE3hmP7f4tbaRLnxJZ4+hE 8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Mar 2022 13:22:59 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 13:22:58 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 13:22:58 -0800
Received: from [10.110.60.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 3 Mar 2022
 13:22:57 -0800
Message-ID: <dee90099-d739-5f84-c1b8-0c0022afb02e@quicinc.com>
Date: Thu, 3 Mar 2022 13:22:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/4] drm/msm: Update generated headers
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20220303194758.710358-1-robdclark@gmail.com>
 <20220303194758.710358-2-robdclark@gmail.com>
 <1a42ff3e-154a-b2b8-9c99-8d5fba9a38e5@quicinc.com>
 <CAF6AEGvBzFKbPVe+6+kHVDdFFvxXeFCp-7Jx=61or96HdQby4g@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAF6AEGvBzFKbPVe+6+kHVDdFFvxXeFCp-7Jx=61or96HdQby4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/3/2022 1:11 PM, Rob Clark wrote:
> On Thu, Mar 3, 2022 at 12:42 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Hi Rob
>>
>> On 3/3/2022 11:46 AM, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Update headers from mesa commit:
>>>
>>>     commit 7e63fa2bb13cf14b765ad06d046789ee1879b5ef
>>>     Author:     Rob Clark <robclark@freedesktop.org>
>>>     AuthorDate: Wed Mar 2 17:11:10 2022 -0800
>>>
>>>         freedreno/registers: Add a couple regs we need for kernel
>>>
>>>         Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>         Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15221>
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/gpu/drm/msm/adreno/a2xx.xml.h         |  26 +-
>>>    drivers/gpu/drm/msm/adreno/a3xx.xml.h         |  30 +-
>>>    drivers/gpu/drm/msm/adreno/a4xx.xml.h         | 112 ++-
>>>    drivers/gpu/drm/msm/adreno/a5xx.xml.h         |  63 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx.xml.h         | 674 +++++++++++-------
>>>    drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h     |  26 +-
>>>    .../gpu/drm/msm/adreno/adreno_common.xml.h    |  31 +-
>>>    drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h   |  46 +-
>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h      |  37 +-
>>>    drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h      |  37 +-
>>>    drivers/gpu/drm/msm/disp/mdp_common.xml.h     |  37 +-
>>>    drivers/gpu/drm/msm/dsi/dsi.xml.h             |  37 +-
>>>    drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h    |  37 +-
>>>    drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h    |  37 +-
>>>    drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h    |  37 +-
>>>    drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h    |  37 +-
>>>    .../gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h   |  37 +-
>>>    drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h     | 480 -------------
>> Why is the 5nm PHY removed? Am i missing something?
> 
> Dmitry removed it in mesa, because it was identical to 7nm
> 
> BR,
> -R
Alright got it, for the display bits,
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>>
>> Thanks
>>
>> Abhinav
