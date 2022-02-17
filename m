Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136B4B94E1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 01:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CD510E678;
	Thu, 17 Feb 2022 00:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7087710E672;
 Thu, 17 Feb 2022 00:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645057345; x=1676593345;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ucdt4Brg9XCP0oAU6WsflfUGosiIIcW4RUCgD2Kvpt8=;
 b=Pt2GqUZpir9UvhR5J012hi4yoMxOnJxZDI8G28bhCj2SipxKHZVHWuo3
 j6Tn8hjDrnAKMeClGIk5jsnpLF96QsLTm9qMuqUf8dhzymNngpGl/hcXh
 WZ5j+E29nwSc4KuXFCta6nDsOJ5re9kN4HVvvr5Zc4pq66WQA76qB4uIy 4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 16 Feb 2022 16:22:24 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 16:22:23 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 16:22:23 -0800
Received: from [10.110.54.133] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 16 Feb
 2022 16:22:21 -0800
Message-ID: <f480811d-3e82-a6c7-1e57-fabe51604f9b@quicinc.com>
Date: Wed, 16 Feb 2022 16:22:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] drm/msm/dp: replace DRM_DEBUG_DP marco with
 drm_dbg_dp
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
 <1643828199-8564-4-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n534MH7ih4nKbjY5EewcZ0J73Zp_A=Q-CJ0M_z3nWoVaVQ@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n534MH7ih4nKbjY5EewcZ0J73Zp_A=Q-CJ0M_z3nWoVaVQ@mail.gmail.com>
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


On 2/16/2022 3:46 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-02-02 10:56:39)
>
> Please add some commit text
>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_audio.c   |  49 +++++++++++------
>>   drivers/gpu/drm/msm/dp/dp_catalog.c |  34 +++++++-----
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 106 +++++++++++++++++++-----------------
>>   drivers/gpu/drm/msm/dp/dp_display.c |  68 +++++++++++++----------
>>   drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
>>   drivers/gpu/drm/msm/dp/dp_link.c    |  99 +++++++++++++++++++--------------
>>   drivers/gpu/drm/msm/dp/dp_panel.c   |  43 +++++++++------
>>   drivers/gpu/drm/msm/dp/dp_parser.c  |   2 +-
>>   drivers/gpu/drm/msm/dp/dp_power.c   |  20 ++++---
>>   9 files changed, 246 insertions(+), 179 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
>> index d7e4a39..4fbbe0a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
>> @@ -136,7 +136,8 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>>          parity_byte = dp_audio_calculate_parity(new_value);
>>          value |= ((new_value << HEADER_BYTE_1_BIT)
>>                          | (parity_byte << PARITY_BYTE_1_BIT));
>> -       DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
>> +       drm_dbg_dp((struct drm_device *)NULL,
> Why can't we pass the platform device pointer? Surely the cast is not
> necessary and in fact harmful.

Platform device only available at top level (dp_display.c), other level 
has no access to platform device or drm_device.

I will just apss NULL, such as  drm_dbg_dp(NULL, ...), if not device 
available.

