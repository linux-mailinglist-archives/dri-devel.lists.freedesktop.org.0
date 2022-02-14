Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CAE4B5733
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD6E10E140;
	Mon, 14 Feb 2022 16:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CDC10E13F;
 Mon, 14 Feb 2022 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644856895; x=1676392895;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+CymjWSyTM2WBMyL/3aJhWzerfakuKzZr1vwvSFvdxU=;
 b=MmpMAVastdv9b31xy93WokFuompa0wW6SoZA+33WhZA+nCa+M6ZkHFcA
 KvGgh/vt2L6E9aNtQPnBg5KvRg3N+ZxXnEgZZ6OBb6SRDx1auGdLH5ODH
 oKPjA2f2Lpl+3/5I15mmHlpZjzQgD4vY5WPK6entEDv4STJGIcbcAVoNF 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Feb 2022 08:41:34 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 08:41:34 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 08:41:33 -0800
Received: from [10.110.63.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 14 Feb
 2022 08:41:32 -0800
Message-ID: <bc21d3d2-78fb-cb3e-43e7-71b37804139d@quicinc.com>
Date: Mon, 14 Feb 2022 08:41:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm/msm/dp: always add fail-safe mode into connector
 mode list
Content-Language: en-US
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
References: <1643066274-25814-1-git-send-email-quic_khsieh@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <1643066274-25814-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Are you have more comments?


On 1/24/2022 3:17 PM, Kuogee Hsieh wrote:
> Some of DP link compliant test expects to return fail-safe mode
> if prefer detailed timing mode can not be supported by mainlink's
> lane and rate after link training. Therefore add fail-safe mode
> into connector mode list as backup mode. This patch fixes test
> case 4.2.2.1.
>
> Changes in v2:
> -- add Fixes text string
>
> Fixes: 4b85d405cfe9 ( "drm/msm/dp: reduce link rate if failed at link training 1")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 71db10c..f141872 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -212,6 +212,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   		if (drm_add_modes_noedid(connector, 640, 480))
>   			drm_set_preferred_mode(connector, 640, 480);
>   		mutex_unlock(&connector->dev->mode_config.mutex);
> +	} else {
> +		/* always add fail-safe mode as backup mode */
> +		mutex_lock(&connector->dev->mode_config.mutex);
> +		drm_add_modes_noedid(connector, 640, 480);
> +		mutex_unlock(&connector->dev->mode_config.mutex);
>   	}
>   
>   	if (panel->aux_cfg_update_done) {
