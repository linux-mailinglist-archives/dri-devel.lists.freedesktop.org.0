Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DA0589528
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 02:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4D418A542;
	Thu,  4 Aug 2022 00:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961C81137C6;
 Thu,  4 Aug 2022 00:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659572053; x=1691108053;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FDJvzeGuC8bBs/salTTDaf5k6IyWQvEiM6UfPyOQ9jo=;
 b=RlMoiQjWHcWfE0qNlL8sMdWM4cSJ7EaMrLkVjuQdJs+H70EvF5vJ2bjd
 VvdiUrkBkJ8wU3VjZ1hBk5fllviC/7GOp6Dd5Lj/eIKUqnDUHD3zDoCmR
 CD5Nt76hrj0eq7r6SGWnrEzn4EQu+dwS3yE3KtuAO2LOd+kE0omEaNH6s 4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Aug 2022 17:14:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 17:14:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 17:14:12 -0700
Received: from [10.38.247.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 17:14:08 -0700
Message-ID: <a1cc2a80-4d5e-e931-9063-aec772184bc0@quicinc.com>
Date: Wed, 3 Aug 2022 17:14:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 2/6] drm/msm/dsi: Fix number of regulators for SDM660
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.2.I94b3c3e412b7c208061349f05659e126483171b1@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220802153434.v3.2.I94b3c3e412b7c208061349f05659e126483171b1@changeid>
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
Cc: Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Mark Brown <broonie@kernel.org>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/2/2022 3:37 PM, Douglas Anderson wrote:
> 1 regulators is specified listed but the number 2 is specified. This
> presumably means we try to get a regulator with no name. Fix it.
> 
> Fixes: 033f47f7f121 ("drm/msm/dsi: Add DSI configuration for SDM660")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Agree with Marijn's comment here:

https://patchwork.freedesktop.org/patch/496153/?series=106731&rev=2#comment_894595

Will queue for -fixes with the fixes tag he has given

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - ("Fix number of regulators for SDM660") new for v2.
> 
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 02000a7b7a18..72c018e26f47 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -148,7 +148,7 @@ static const char * const dsi_sdm660_bus_clk_names[] = {
>   static const struct msm_dsi_config sdm660_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
>   	.reg_cfg = {
> -		.num = 2,
> +		.num = 1,
>   		.regs = {
>   			{"vdda", 12560, 4 },	/* 1.2 V */
>   		},
