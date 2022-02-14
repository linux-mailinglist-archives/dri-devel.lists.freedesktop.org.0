Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2914B5755
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7683410E1C4;
	Mon, 14 Feb 2022 16:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCC410E169;
 Mon, 14 Feb 2022 16:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644857112; x=1676393112;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=R5ieivu0BFlgLSvg984cJ4TTRXItV8kiFd/9WEwoL3w=;
 b=NiRSMnprXRjEVLngh3asWJgcW3ih8AHEqnybglvWsTMMQ8DYErygCDC7
 wiBaEPaR5GDnkRKAyuyN3lEw/E8hvJFhgoRmyBfjJ6zzxRSwwolr8Lw1k
 5BOSQSyoC0qzWDfpLnKff2/1r1CXqdmLbYWMm4QpUewqtWolAm5P1/lzz w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Feb 2022 08:45:12 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 08:45:11 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 08:45:10 -0800
Received: from [10.110.63.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 14 Feb
 2022 08:45:09 -0800
Message-ID: <9e15b7fb-e37e-72d6-d2a7-e7a37e041f94@quicinc.com>
Date: Mon, 14 Feb 2022 08:45:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/3] Add connector_type to debug info to differentiate
 between eDP and DP
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
References: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
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

Can you please review this serial patches.

On 2/2/2022 10:56 AM, Kuogee Hsieh wrote:
> 1) Add connector_type to debug info to differentiate between eDP and DP
> 2) add more debug info to cover dp Phy
> 3) repalce DRM_DEBUG_DP with drm_debug_dp
>
> Kuogee Hsieh (3):
>    drm/msm/dp: add connector type to enhance debug messages
>    drm/msm/dp: enhance debug info related to dp phy
>    drm/msm/dp:  replace DRM_DEBUG_DP marco with drm_dbg_dp
>
>   drivers/gpu/drm/msm/dp/dp_audio.c   |  49 +++++++++------
>   drivers/gpu/drm/msm/dp/dp_catalog.c |  34 ++++++-----
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 116 +++++++++++++++++++-----------------
>   drivers/gpu/drm/msm/dp/dp_display.c | 103 ++++++++++++++++++++++----------
>   drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
>   drivers/gpu/drm/msm/dp/dp_link.c    |  99 +++++++++++++++++-------------
>   drivers/gpu/drm/msm/dp/dp_panel.c   |  43 +++++++------
>   drivers/gpu/drm/msm/dp/dp_parser.c  |   2 +-
>   drivers/gpu/drm/msm/dp/dp_power.c   |  20 ++++---
>   9 files changed, 283 insertions(+), 187 deletions(-)
>
