Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D31D64C3482
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 19:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD3E10ED84;
	Thu, 24 Feb 2022 18:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1385D10ED84
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 18:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645726835; x=1677262835;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=sC97fsj/Y2pQtq+iNfIGC3Upx+qj6pwOWFXs/RuudB4=;
 b=HEkab2p6NneRlCscoGm18yjgQTZO+hEL6Qdl7WCSVNe86/a6SrerHSdN
 3Ed6+SKO5eDYi1rDGHhms3cIC4KWFSqz6EIRRDr2VseDnnSfK8wTP2cTY
 YsWhP/6JLO29w3LX1/TjWjnxFXpx9WlPqZAG9rm3QW2ewcJyYnJuKVN9C o=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 24 Feb 2022 10:20:34 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 10:20:34 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 10:20:33 -0800
Received: from [10.110.6.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 24 Feb
 2022 10:20:32 -0800
Message-ID: <2e1095c2-ae18-b412-3dba-8be6dfcbdc99@quicinc.com>
Date: Thu, 24 Feb 2022 10:20:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 3/3] drm/msm/dp: replace DRM_DEBUG_DP marco with
 drm_dbg_dp
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1645122930-23863-1-git-send-email-quic_khsieh@quicinc.com>
 <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52cz6JibgsJ4MWsdGhAjxHa6en+JbyKjKHVwQDnM8-5Og@mail.gmail.com>
 <e01aefa4-0792-307d-caee-4fb3d2b32a23@quicinc.com>
In-Reply-To: <e01aefa4-0792-307d-caee-4fb3d2b32a23@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Are you still has concern on this patch?

Thanks,


On 2/17/2022 12:01 PM, Kuogee Hsieh wrote:
>
> On 2/17/2022 11:36 AM, Stephen Boyd wrote:
>> Quoting Kuogee Hsieh (2022-02-17 10:35:30)
>>> Since DRM_DEBUG_DP is deprecated in favor of drm_dbg_dp(NULL, ...),
>>> this patch replace all DRM_DEBUG_DP with drm_dbg_dp().
>>>
>>> Changes in v4:
>>> -- replace (strucr drm_dev *)NULL with drm_dev
>> Why can't the platform device be used?
> #define drm_dbg_dp(drm, fmt, ...)                                       \
>
>         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, 
> ##__VA_ARGS__)
>
> it looks for (drm)->dev (pointer)
>
> struct platform_device {
>         const char      *name;
>         int             id;
>         bool            id_auto;
>         struct device   dev          <== not an pointer here
>
>
>
>
