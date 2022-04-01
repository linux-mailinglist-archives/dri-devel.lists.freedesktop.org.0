Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2204EFAFE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 22:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FA810E037;
	Fri,  1 Apr 2022 20:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EB410E012;
 Fri,  1 Apr 2022 20:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648844252; x=1680380252;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=0iVObdGleih24MzhGqYB2GKJBy7AJG+MlhwGJWDUXIU=;
 b=HPT5zQXpxE5y1DiOWBy9KHa147Lj7N2Rp63LwQyMHS9ATt/Och+qxtby
 IU+YoaUQTVkdpdxAXyF2MMry+yi0EnL4YjQGC+StjODtVdDwqu7JsIPoR
 EG6ytXPREY96u21heKv4/n3hcsKZizaUB/5ZUZ4uZ1iwKtCh1nieCh1Eo E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Apr 2022 13:17:31 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 13:17:30 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Apr 2022 13:17:30 -0700
Received: from [10.110.60.126] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 1 Apr 2022
 13:17:29 -0700
Message-ID: <edc4a19e-c792-1e58-e73f-f26e423f11b9@quicinc.com>
Date: Fri, 1 Apr 2022 13:17:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v12 4/4] drm/msm/dp: enable widebus feature for display
 port
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1645824192-29670-1-git-send-email-quic_khsieh@quicinc.com>
 <1645824192-29670-5-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53s11KHrj-rzRkjV4q775XCoxzZCLK-HRCt=H1++DR-YQ@mail.gmail.com>
 <ccd8e82d-6121-3d2a-6a63-4fc7c0896881@quicinc.com>
In-Reply-To: <ccd8e82d-6121-3d2a-6a63-4fc7c0896881@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/1/2022 1:00 PM, Kuogee Hsieh wrote:
> Hi Stephen,
>
>
> Would you please to help land this serial of 4 patch into msm-next?
My mistake, should be kernel v5.15
>
> Thanks,
>
> On 2/25/2022 2:17 PM, Stephen Boyd wrote:
>> Quoting Kuogee Hsieh (2022-02-25 13:23:12)
>>> Widebus feature will transmit two pixel data per pixel clock to 
>>> interface.
>>> This feature now is required to be enabled to easy migrant to higher
>>> resolution applications in future. However since some legacy chipsets
>>> does not support this feature, this feature is enabled by setting
>>> wide_bus_en flag to true within msm_dp_desc struct.
>>>
>>> changes in v2:
>>> -- remove compression related code from timing
>>> -- remove op_info from  struct msm_drm_private
>>> -- remove unnecessary wide_bus_en variables
>>> -- pass wide_bus_en into timing configuration by struct msm_dp
>>>
>>> Changes in v3:
>>> -- split patch into 3 patches
>>> -- enable widebus feature base on chip hardware revision
>>>
>>> Changes in v5:
>>> -- DP_INTF_CONFIG_DATABUS_WIDEN
>>>
>>> Changes in v6:
>>> -- static inline bool msm_dp_wide_bus_enable() in msm_drv.h
>>>
>>> Changes in v7:
>>> -- add Tested-by
>>>
>>> Changes in v9:
>>> -- add wide_bus_en to msm_dp_desc
>>>
>>> Changes in v10:
>>> -- add wide_bus_en boolean to dp_catalog struc to avoid passing it 
>>> as parameter
>>>
>>> Changes in v11:
>>> -- add const to dp_catalog_hw_revision()
>>> -- add const to msm_dp_wide_bus_available()
>>>
>>> Changes in v12:
>>> -- dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
>>> -- msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
