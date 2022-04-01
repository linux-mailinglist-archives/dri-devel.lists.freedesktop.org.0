Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5C14EFA9C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 21:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161C610E043;
	Fri,  1 Apr 2022 19:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4CB10E043;
 Fri,  1 Apr 2022 19:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648842720; x=1680378720;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mzQwyM79i2VPG1OyvzFuki0I0QTOLGm5moKyhLq7OwU=;
 b=bEgKcXNc2RAWPiL6hz0f3gdbQ6ufcaImCfy+64q4k+W15Oc070Mg2YEn
 3z/kGFf1nahLbL0ohxrrp3TzFQbLeb3/9bxz63w/fb85K4mZPqJfKQu8P
 Wugb3sOIzBwb9L0mqsWOuZnC1paIF9cqZxfN7AzN5BuOwHZp6o70W0Dpw g=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Apr 2022 12:51:59 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 12:51:59 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Apr 2022 12:51:58 -0700
Received: from [10.110.60.126] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 1 Apr 2022
 12:51:57 -0700
Message-ID: <b5717861-c3f6-960c-f5be-013db8c4fa68@quicinc.com>
Date: Fri, 1 Apr 2022 12:51:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 3/3] drm/msm/dp: replace DRM_DEBUG_DP marco with
 drm_dbg_dp
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1645122930-23863-1-git-send-email-quic_khsieh@quicinc.com>
 <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n50nMVEG5ccU=m0hNoyPnWvyugjRSXL9hoW=VOxm6+w2uw@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n50nMVEG5ccU=m0hNoyPnWvyugjRSXL9hoW=VOxm6+w2uw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Stephen,


Would you please help to pick this patch up to msm-next?

Thanks,

On 2/24/2022 10:40 AM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-02-17 10:35:30)
>> Since DRM_DEBUG_DP is deprecated in favor of drm_dbg_dp(NULL, ...),
>> this patch replace all DRM_DEBUG_DP with drm_dbg_dp().
>>
>> Changes in v4:
>> -- replace (strucr drm_dev *)NULL with drm_dev
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
