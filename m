Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FA190F588
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 19:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F2310E16C;
	Wed, 19 Jun 2024 17:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="on8V5Mdj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABA510E025;
 Wed, 19 Jun 2024 17:55:46 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JA1RBS009603;
 Wed, 19 Jun 2024 17:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gdemIeGUW7SntTIV0OosORE60E17h83CGJytC9LeqxU=; b=on8V5MdjvCDjTcpk
 yFZhq2pD/saTnDBgJ703iQn9gNjwMHYO7JkKjWEeG58e0OzbcdARt3dTme5zTZ5p
 9hdML01x45YR1+WrHbvhbL7szYIfAL3/iZBGCtg5y/1/53MaDBS4u5jlno+wz8M0
 y769slM0NtadMXLlHO38MJnYlLvxuAGuM/qo40bMTZlaSWlDE5ROHbj5tVCCnxWz
 bBmCit1LgkZRYa/bMKTehglIz6M8pZWBDr1GehBHQ8iz4f8X9koKjGju3gk/QsJ8
 2izlnsKJPLQUX9qAuT+PqJtrlcpVz4HDaiIlXPLxDqd4Dci6CF80dsVN8tW5bT0v
 vydKbg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9tjf3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 17:55:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45JHtgmj010303
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 17:55:42 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 10:55:42 -0700
Message-ID: <e75f21dc-ae10-4e44-8abd-41519d34f691@quicinc.com>
Date: Wed, 19 Jun 2024 10:55:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] drm/msm/hdmi: rename hpd_clks to pwr_clks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
 <20240522-fd-hdmi-hpd-v2-10-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-10-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -43Aoc1x1LWU4W3UU84iX3F7Y6odMSuL
X-Proofpoint-ORIG-GUID: -43Aoc1x1LWU4W3UU84iX3F7Y6odMSuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190135
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



On 5/22/2024 3:51 AM, Dmitry Baryshkov wrote:
> As these clocks are now used in the runtime PM callbacks, they have no
> connection to 'HPD'. Rename corresponding fields to follow clocks
> purpose, to power up the HDMI controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 26 +++++++++++++-------------
>   drivers/gpu/drm/msm/hdmi/hdmi.h |  6 +++---
>   2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index cc671baad87b..c39a1f3a7505 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -228,19 +228,19 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>   	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
>   
>   static const char *pwr_reg_names_8960[] = {"core-vdda"};
> -static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
> +static const char *pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
>   
>   static const struct hdmi_platform_config hdmi_tx_8960_config = {
>   		HDMI_CFG(pwr_reg, 8960),
> -		HDMI_CFG(hpd_clk, 8960),
> +		HDMI_CFG(pwr_clk, 8960),
>   };
>   
>   static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
> -static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
> +static const char *pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
>   
>   static const struct hdmi_platform_config hdmi_tx_8974_config = {
>   		HDMI_CFG(pwr_reg, 8x74),
> -		HDMI_CFG(hpd_clk, 8x74),
> +		HDMI_CFG(pwr_clk, 8x74),
>   };
>   
>   /*
> @@ -449,17 +449,17 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
>   
> -	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
> -				      config->hpd_clk_cnt,
> -				      sizeof(hdmi->hpd_clks[0]),
> +	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
> +				      config->pwr_clk_cnt,
> +				      sizeof(hdmi->pwr_clks[0]),
>   				      GFP_KERNEL);
> -	if (!hdmi->hpd_clks)
> +	if (!hdmi->pwr_clks)
>   		return -ENOMEM;
>   
> -	for (i = 0; i < config->hpd_clk_cnt; i++)
> -		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
> +	for (i = 0; i < config->pwr_clk_cnt; i++)
> +		hdmi->pwr_clks[i].id = config->pwr_clk_names[i];
>   
> -	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
> +	ret = devm_clk_bulk_get(&pdev->dev, config->pwr_clk_cnt, hdmi->pwr_clks);
>   	if (ret)
>   		return ret;
>   
> @@ -517,7 +517,7 @@ static int msm_hdmi_runtime_suspend(struct device *dev)
>   	struct hdmi *hdmi = dev_get_drvdata(dev);
>   	const struct hdmi_platform_config *config = hdmi->config;
>   
> -	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
> +	clk_bulk_disable_unprepare(config->pwr_clk_cnt, hdmi->pwr_clks);
>   
>   	pinctrl_pm_select_sleep_state(dev);
>   
> @@ -540,7 +540,7 @@ static int msm_hdmi_runtime_resume(struct device *dev)
>   	if (ret)
>   		goto fail;
>   
> -	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
> +	ret = clk_bulk_prepare_enable(config->pwr_clk_cnt, hdmi->pwr_clks);
>   	if (ret)
>   		goto fail;
>   
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index ee5463eb41b6..1e346e697f8e 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -49,7 +49,7 @@ struct hdmi {
>   	phys_addr_t mmio_phy_addr;
>   
>   	struct regulator_bulk_data *pwr_regs;
> -	struct clk_bulk_data *hpd_clks;
> +	struct clk_bulk_data *pwr_clks;
>   	struct clk *extp_clk;
>   
>   	struct gpio_desc *hpd_gpiod;
> @@ -90,8 +90,8 @@ struct hdmi_platform_config {
>   	int pwr_reg_cnt;
>   
>   	/* clks that need to be on for hpd: */
> -	const char **hpd_clk_names;
> -	int hpd_clk_cnt;
> +	const char **pwr_clk_names;
> +	int pwr_clk_cnt;
>   };
>   
>   struct hdmi_bridge {
> 
> -- 
> 2.39.2
> 
