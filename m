Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEA347B3FB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 20:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8424E10EEA3;
	Mon, 20 Dec 2021 19:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103CA10EDB4;
 Mon, 20 Dec 2021 19:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640029928; x=1671565928;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JNN1uzilupz3x6T8siWug0oHtxLE5fcKr4idYesvVD0=;
 b=dN5Mtr2L+M9NCKQBnFnHJShLREqsLXiadbOLbs0om0rZZmwTsFmgEUPj
 JOVAAxDkvTi9IqoEt+MxCsNuoYKljkyz1tdQybnbdYnvrxWBfFy5YrOi+
 /EelV3p6GlURok/8mTrbUIqEf9Y3x78r7raLiEBFbeZ5HJDT8WjxjrRBG 8=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Dec 2021 11:52:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 11:52:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 20 Dec 2021 11:52:07 -0800
Received: from [10.111.163.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 20 Dec
 2021 11:52:04 -0800
Message-ID: <68dd102a-ac6b-bbe3-64b6-53ce622ca8e5@quicinc.com>
Date: Mon, 20 Dec 2021 11:52:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6] drm/msm/dp: Add sc8180x DP controllers
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20211217002643.2305526-1-bjorn.andersson@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211217002643.2305526-1-bjorn.andersson@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/16/2021 4:26 PM, Bjorn Andersson wrote:
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> 
> Changes since v5:
> - Dropped DPU hw catalog change from the patch
> - Rebased the patch
> 
>   drivers/gpu/drm/msm/dp/dp_display.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 8d9c19dbf33e..a9f5368559b4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -143,10 +143,21 @@ static const struct msm_dp_config sc7280_dp_cfg = {
>   	.num_descs = 2,
>   };
>   
> +static const struct msm_dp_config sc8180x_dp_cfg = {
> +	.descs = (const struct msm_dp_desc[]) {
> +		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +		[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +		[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> +	},
> +	.num_descs = 3,
> +};
> +
>   static const struct of_device_id dp_dt_match[] = {
>   	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>   	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
>   	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
> +	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
> +	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
>   	{}
>   };
>   
