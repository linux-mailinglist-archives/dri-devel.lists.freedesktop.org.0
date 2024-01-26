Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F75B83E535
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2EC10FF49;
	Fri, 26 Jan 2024 22:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973A910FF49;
 Fri, 26 Jan 2024 22:21:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QLo1SZ001194; Fri, 26 Jan 2024 22:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=166Ie8VvbbzTgl6TthT14j3Lan1/qMMhzaW9zZWLWo0=; b=a3
 kDYzFO6BAwLXWpuTtF5Uotzj0Ht9nWWv1ZT+9xPY1WnKhBhTdc/ZW04U+9ks9K93
 2UFqrGeN0MevJ5RAer/4UhW3dTDv8BjwjJeH7TH86YSL8IDVCvlFoTmZl82wm+og
 lOFRCDUMChtqK7KDWgcujkFF2m60O07G1aTjU6qabDgNvOQNGWu7rYRK03wXmPvv
 WovoB0wDWg253KZI3Cqsl5v7XTFzUdqYMAeRQgACRHcG/ui6Xx3MPyny1yzUXSmk
 uAHSJy5KESyujQoAhl7js7j1JJ55Yghe8W6FHnvCHkSfdfc6rJJ7usyVlx17MPK9
 YWHZzrJnb+sWJcUP6brw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv1q5aj9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:21:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMLRua010289
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:21:27 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:21:26 -0800
Message-ID: <61a5e246-7360-cd7c-c265-2519e9d8392a@quicinc.com>
Date: Fri, 26 Jan 2024 14:21:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 07/15] drm/msm/dp: stop parsing clock names from
 DT
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd
 <swboyd@chromium.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
 <20240126-dp-power-parser-cleanup-v3-7-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-7-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: niPwSwIrZyfr7hE95fTVzdxNJ_Ego_Hl
X-Proofpoint-GUID: niPwSwIrZyfr7hE95fTVzdxNJ_Ego_Hl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401260163
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/26/2024 10:26 AM, Dmitry Baryshkov wrote:
> All supported platforms use the same clocks configuration. Instead of
> parsing names from DT in a pretty complex manner, use the static
> configuration. If at some point newer (or older) platforms have
> different clock configuration, this clock config can be moved to the
> device data.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c   |  73 ++++++++++++++++++------
>   drivers/gpu/drm/msm/dp/dp_ctrl.h   |   6 ++
>   drivers/gpu/drm/msm/dp/dp_parser.c | 112 -------------------------------------
>   drivers/gpu/drm/msm/dp/dp_parser.h |  22 --------
>   4 files changed, 63 insertions(+), 150 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 56a424a82a1b..cfcf6136ffa6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -69,6 +69,11 @@ struct dp_vc_tu_mapping_table {
>   	u8 tu_size_minus1;
>   };
>   
> +struct dss_module_power {
> +	unsigned int num_clk;
> +	struct clk_bulk_data *clocks;
> +};
> +
>   struct dp_ctrl_private {
>   	struct dp_ctrl dp_ctrl;
>   	struct drm_device *drm_dev;
> @@ -79,6 +84,7 @@ struct dp_ctrl_private {
>   	struct dp_parser *parser;
>   	struct dp_catalog *catalog;
>   
> +	struct dss_module_power mp[DP_MAX_PM];
>   	struct clk *pixel_clk;
>   
>   	struct completion idle_comp;
> @@ -90,6 +96,15 @@ struct dp_ctrl_private {
>   	bool stream_clks_on;
>   };
>   
> +static inline const char *dp_pm_name(enum dp_pm_type module)
> +{
> +	switch (module) {
> +	case DP_CORE_PM:	return "DP_CORE_PM";
> +	case DP_CTRL_PM:	return "DP_CTRL_PM";
> +	default:		return "???";
> +	}
> +}
> +
>   static int dp_aux_link_configure(struct drm_dp_aux *aux,
>   					struct dp_link_info *link)
>   {
> @@ -1334,7 +1349,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
>   	if (pm_type != DP_CORE_PM &&
>   	    pm_type != DP_CTRL_PM) {
>   		DRM_ERROR("unsupported ctrl module: %s\n",
> -			  dp_parser_pm_name(pm_type));
> +			  dp_pm_name(pm_type));
>   		return -EINVAL;
>   	}
>   
> @@ -1354,7 +1369,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
>   		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
>   			drm_dbg_dp(ctrl->drm_dev,
>   				   "Enable core clks before link clks\n");
> -			mp = &ctrl->parser->mp[DP_CORE_PM];
> +			mp = &ctrl->mp[DP_CORE_PM];
>   
>   			ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
>   			if (ret)
> @@ -1364,7 +1379,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
>   		}
>   	}
>   
> -	mp = &ctrl->parser->mp[pm_type];
> +	mp = &ctrl->mp[pm_type];
>   	if (enable) {
>   		ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
>   		if (ret)
> @@ -1380,7 +1395,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
>   
>   	drm_dbg_dp(ctrl->drm_dev, "%s clocks for %s\n",
>   		   enable ? "enable" : "disable",
> -		   dp_parser_pm_name(pm_type));
> +		   dp_pm_name(pm_type));
>   	drm_dbg_dp(ctrl->drm_dev,
>   		   "stream_clks:%s link_clks:%s core_clks:%s\n",
>   		   ctrl->stream_clks_on ? "on" : "off",
> @@ -2158,30 +2173,56 @@ irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
>   	return ret;
>   }
>   
> +static const char *core_clks[] = {
> +	"core_iface",
> +	"core_aux",
> +};
> +
> +static const char *ctrl_clks[] = {
> +	"ctrl_link",
> +	"ctrl_link_iface",
> +};
> +
>   static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
>   {
> -	struct dp_ctrl_private *ctrl_private;
> -	int rc = 0;
> -	struct dss_module_power *core, *ctrl;
> +	struct dp_ctrl_private *ctrl;
> +	struct dss_module_power *core, *link;
>   	struct device *dev;
> +	int i, rc;
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +	dev = ctrl->dev;
>   
> -	ctrl_private = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> -	dev = ctrl_private->dev;
> +	core = &ctrl->mp[DP_CORE_PM];
> +	link = &ctrl->mp[DP_CTRL_PM];
>   
> -	core = &ctrl_private->parser->mp[DP_CORE_PM];
> -	ctrl = &ctrl_private->parser->mp[DP_CTRL_PM];
> +	core->num_clk = ARRAY_SIZE(core_clks);
> +	core->clocks = devm_kcalloc(dev, core->num_clk, sizeof(*core->clocks), GFP_KERNEL);
> +	if (!core->clocks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < core->num_clk; i++)
> +		core->clocks[i].id = core_clks[i];
>   
>   	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
>   	if (rc)
>   		return rc;
>   
> -	rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
> +	link->num_clk = ARRAY_SIZE(ctrl_clks);
> +	link->clocks = devm_kcalloc(dev, link->num_clk, sizeof(*link->clocks), GFP_KERNEL);
> +	if (!link->clocks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < link->num_clk; i++)
> +		link->clocks[i].id = ctrl_clks[i];
> +
> +	rc = devm_clk_bulk_get(dev, link->num_clk, link->clocks);
>   	if (rc)
> -		return -ENODEV;
> +		return rc;
>   
> -	ctrl_private->pixel_clk = devm_clk_get(dev, "stream_pixel");
> -	if (IS_ERR(ctrl_private->pixel_clk))
> -		return PTR_ERR(ctrl_private->pixel_clk);
> +	ctrl->pixel_clk = devm_clk_get(dev, "stream_pixel");
> +	if (IS_ERR(ctrl->pixel_clk))
> +		return PTR_ERR(ctrl->pixel_clk);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 85da5a7e5307..d8007a9d8260 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -17,6 +17,12 @@ struct dp_ctrl {
>   	bool wide_bus_en;
>   };
>   
> +enum dp_pm_type {
> +	DP_CORE_PM,
> +	DP_CTRL_PM,
> +	DP_MAX_PM
> +};
> +
>   int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
>   int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
>   int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index fe2b75f7555a..de7cfc340f0c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -141,114 +141,6 @@ static int dp_parser_misc(struct dp_parser *parser)
>   	return 0;
>   }
>   
> -static inline bool dp_parser_check_prefix(const char *clk_prefix,
> -						const char *clk_name)
> -{
> -	return !strncmp(clk_prefix, clk_name, strlen(clk_prefix));
> -}
> -
> -static int dp_parser_init_clk_data(struct dp_parser *parser)
> -{
> -	int num_clk, i, rc;
> -	int core_clk_count = 0, ctrl_clk_count = 0;
> -	const char *clk_name;
> -	struct device *dev = &parser->pdev->dev;
> -	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
> -	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
> -
> -	num_clk = of_property_count_strings(dev->of_node, "clock-names");
> -	if (num_clk <= 0) {
> -		DRM_ERROR("no clocks are defined\n");
> -		return -EINVAL;
> -	}
> -
> -	for (i = 0; i < num_clk; i++) {
> -		rc = of_property_read_string_index(dev->of_node,
> -				"clock-names", i, &clk_name);
> -		if (rc < 0)
> -			return rc;
> -
> -		if (dp_parser_check_prefix("core", clk_name))
> -			core_clk_count++;
> -
> -		if (dp_parser_check_prefix("ctrl", clk_name))
> -			ctrl_clk_count++;
> -	}
> -
> -	/* Initialize the CORE power module */
> -	if (core_clk_count == 0) {
> -		DRM_ERROR("no core clocks are defined\n");
> -		return -EINVAL;
> -	}
> -
> -	core_power->num_clk = core_clk_count;
> -	core_power->clocks = devm_kcalloc(dev,
> -			core_power->num_clk, sizeof(struct clk_bulk_data),
> -			GFP_KERNEL);
> -	if (!core_power->clocks)
> -		return -ENOMEM;
> -
> -	/* Initialize the CTRL power module */
> -	if (ctrl_clk_count == 0) {
> -		DRM_ERROR("no ctrl clocks are defined\n");
> -		return -EINVAL;
> -	}
> -
> -	ctrl_power->num_clk = ctrl_clk_count;
> -	ctrl_power->clocks = devm_kcalloc(dev,
> -			ctrl_power->num_clk, sizeof(struct clk_bulk_data),
> -			GFP_KERNEL);
> -	if (!ctrl_power->clocks) {
> -		ctrl_power->num_clk = 0;
> -		return -ENOMEM;
> -	}
> -
> -	return num_clk;
> -}
> -
> -static int dp_parser_clock(struct dp_parser *parser)
> -{
> -	int rc = 0, i = 0;
> -	int num_clk = 0;
> -	int core_clk_index = 0, ctrl_clk_index = 0;
> -	int core_clk_count = 0, ctrl_clk_count = 0;
> -	const char *clk_name;
> -	struct device *dev = &parser->pdev->dev;
> -	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
> -	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
> -
> -	rc =  dp_parser_init_clk_data(parser);
> -	if (rc < 0) {
> -		DRM_ERROR("failed to initialize power data %d\n", rc);
> -		return rc;
> -	}
> -
> -	num_clk = rc;
> -
> -	core_clk_count = core_power->num_clk;
> -	ctrl_clk_count = ctrl_power->num_clk;
> -
> -	for (i = 0; i < num_clk; i++) {
> -		rc = of_property_read_string_index(dev->of_node, "clock-names",
> -				i, &clk_name);
> -		if (rc) {
> -			DRM_ERROR("error reading clock-names %d\n", rc);
> -			return rc;
> -		}
> -		if (dp_parser_check_prefix("core", clk_name) &&
> -				core_clk_index < core_clk_count) {
> -			core_power->clocks[core_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
> -			core_clk_index++;
> -		} else if (dp_parser_check_prefix("ctrl", clk_name) &&
> -			   ctrl_clk_index < ctrl_clk_count) {
> -			ctrl_power->clocks[ctrl_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
> -			ctrl_clk_index++;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>   int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser)
>   {
>   	struct platform_device *pdev = parser->pdev;
> @@ -280,10 +172,6 @@ static int dp_parser_parse(struct dp_parser *parser)
>   	if (rc)
>   		return rc;
>   
> -	rc = dp_parser_clock(parser);
> -	if (rc)
> -		return rc;
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index c6fe26602e07..cad82c4d07da 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -16,12 +16,6 @@
>   #define DP_MAX_NUM_DP_LANES	4
>   #define DP_LINK_RATE_HBR2	540000 /* kbytes */
>   
> -enum dp_pm_type {
> -	DP_CORE_PM,
> -	DP_CTRL_PM,
> -	DP_MAX_PM
> -};
> -
>   struct dss_io_region {
>   	size_t len;
>   	void __iomem *base;
> @@ -34,15 +28,6 @@ struct dss_io_data {
>   	struct dss_io_region p0;
>   };
>   
> -static inline const char *dp_parser_pm_name(enum dp_pm_type module)
> -{
> -	switch (module) {
> -	case DP_CORE_PM:	return "DP_CORE_PM";
> -	case DP_CTRL_PM:	return "DP_CTRL_PM";
> -	default:		return "???";
> -	}
> -}
> -
>   /**
>    * struct dp_ctrl_resource - controller's IO related data
>    *
> @@ -55,20 +40,13 @@ struct dp_io {
>   	union phy_configure_opts phy_opts;
>   };
>   
> -struct dss_module_power {
> -	unsigned int num_clk;
> -	struct clk_bulk_data *clocks;
> -};
> -
>   /**
>    * struct dp_parser - DP parser's data exposed to clients
>    *
>    * @pdev: platform data of the client
> - * @mp: gpio, regulator and clock related data
>    */
>   struct dp_parser {
>   	struct platform_device *pdev;
> -	struct dss_module_power mp[DP_MAX_PM];
>   	struct dp_io io;
>   	u32 max_dp_lanes;
>   	u32 max_dp_link_rate;
>
