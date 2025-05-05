Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D4AA9E24
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 23:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BA610E135;
	Mon,  5 May 2025 21:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YBXsDe1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EDB10E135;
 Mon,  5 May 2025 21:28:52 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KTvD1016273;
 Mon, 5 May 2025 21:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6fbWtZrFp1kkYuOkSQk8CYkFh3yOINoeD9GEadRdKg0=; b=YBXsDe1r2MEnuvCk
 stuxZvV8nWs02iyRxILkdh/87YBMt7mL8X7YRPdhR6IoZO7U44uLLDov5bhXv9DI
 tLVvBUkBe4W9jfqJFDykgHaTLRA97DsmQoV1WZhUA/QWIAS1rGmmZsvErlQbQRCe
 Xhu8kPQ/DushQUl0Rw1dUrBGodXIo0gdSHpZ4jKziH5jI4TpMyMktniAMuSLfzt+
 eIQbTrpXkGMvTCns28JxZRmnEPD9OZubz0rfWgFuJigdfdl/RatF5aYZEzhQbum5
 7pZ0ZyydRemGEmQm2QVgY8B9rkF2IJ8qfN+tRd5gzc19DeTqjEzNW3hEg96+JW8C
 9cW7Gw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5da9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 21:28:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 545LSgNw007225
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 May 2025 21:28:42 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 14:28:41 -0700
Message-ID: <65710c50-9bfc-42e8-afad-ac01c7f96a9e@quicinc.com>
Date: Mon, 5 May 2025 14:28:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/24] drm/msm/dsi: Add support for SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
CC: Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek
 <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Rob Clark
 <robdclark@chromium.org>, <linux-clk@vger.kernel.org>, Srinivas Kandagatla
 <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-19-8cab30c3e4df@linaro.org>
 <hobn3fq647z54q6uqrooapokipr4zoxfb3tztg46lwzcsof3jd@5bwn34r2v7ks>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <hobn3fq647z54q6uqrooapokipr4zoxfb3tztg46lwzcsof3jd@5bwn34r2v7ks>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ATCruRLFzklvcy0jp1Cm81-oXR_9k4HK
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=68192d8b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8
 a=KKAkSRfTAAAA:8 a=jzqiswS_J5jijFRD548A:9 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ATCruRLFzklvcy0jp1Cm81-oXR_9k4HK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDIwMyBTYWx0ZWRfX6kTy4LFAd+Yg
 d5Uujajwhbhy3AlW1fYpyK2ioT63kN5cHDF0lMfLVeacnF7GSva7mVUH5Trjdiy58hMdUn9kIM1
 EjLtdSfSR+aR4Iw6cUalLYvTFffGzmBHGdXk1yN1ynQilzfE9otl9brVOjrjglpK70x+pi+YMSg
 /mjGjdREra1Afih99QNk0ApPukCfP2I1B4Igb3mbLtMMAYA55openn8u7tS7F0PRmOFmlf4dY/T
 3KzB3Pl/H+OGpxrmy4SJoxEkbxuYFk+A3TRXvYWJrrtV4g21vScPMGu1vdkUnR6vWy3Zno9hgXN
 MHzbDWwse5ZLM63rHYhaiMILOHhsd0GD/Ze26N15cMcguiOUq+EBYZ+VPDQUWT+0aogBmL/CxVN
 qoU2OpAaQYCm21FVZylUPbXWqrrpLYtLtHJ7euQnynaC1/i3VeQ/2jluffHqv2fGDercUezH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_09,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050203
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



On 5/5/2025 5:35 AM, Dmitry Baryshkov wrote:
> On Wed, Apr 30, 2025 at 03:00:49PM +0200, Krzysztof Kozlowski wrote:
>> Add support for DSI on Qualcomm SM8750 SoC with notable difference:
>>
>> DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
>> parents before DSI PHY is configured, the PLLs are prepared and their
>> initial rate is set.  Therefore assigned-clock-parents are not working
>> here and driver is responsible for reparenting clocks with proper
>> procedure: see dsi_clk_init_6g_v2_9().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes in v5:
>> 1. Only reparent byte and pixel clocks while PLLs is prepared. Setting
>>     rate works fine with earlier DISP CC patch for enabling their parents
>>     during rate change.
>>
>> Changes in v3:
>> 1. Drop 'struct msm_dsi_config sm8750_dsi_cfg' and use sm8650 one.
>>
>> SM8750 DSI PHY also needs Dmitry's patch:
>> https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
>> (or some other way of correct early setting of the DSI PHY PLL rate)
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi.h      |  2 +
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 14 +++++++
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 +
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 81 ++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 98 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
>> index 87496db203d6c7582eadcb74e94eb56a219df292..93c028a122f3a59b1632da76472e0a3e781c6ae8 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>> @@ -98,6 +98,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi);
>>   int msm_dsi_runtime_suspend(struct device *dev);
>>   int msm_dsi_runtime_resume(struct device *dev);
>>   int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host);
>> +int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host);
>>   int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host);
>>   int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
>>   int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
>> @@ -115,6 +116,7 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *iova);
>>   int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
>>   int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
>>   int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
>> +int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host);
>>   int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>>   int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>>   void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> index 7754dcec33d06e3d6eb8a9d55e53f24af073adb9..7f8a8de0897a579a525b466fd01bbcd95454c614 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> @@ -257,6 +257,18 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
>>   	.calc_clk_rate = dsi_calc_clk_rate_6g,
>>   };
>>   
>> +static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_9_host_ops = {
>> +	.link_clk_set_rate = dsi_link_clk_set_rate_6g_v2_9,
>> +	.link_clk_enable = dsi_link_clk_enable_6g,
>> +	.link_clk_disable = dsi_link_clk_disable_6g,
>> +	.clk_init_ver = dsi_clk_init_6g_v2_9,
>> +	.tx_buf_alloc = dsi_tx_buf_alloc_6g,
>> +	.tx_buf_get = dsi_tx_buf_get_6g,
>> +	.tx_buf_put = dsi_tx_buf_put_6g,
>> +	.dma_base_get = dsi_dma_base_get_6g,
>> +	.calc_clk_rate = dsi_calc_clk_rate_6g,
>> +};
>> +
>>   static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>>   	{MSM_DSI_VER_MAJOR_V2, MSM_DSI_V2_VER_MINOR_8064,
>>   		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
>> @@ -300,6 +312,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>>   		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
>>   		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
>> +		&sm8650_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
>>   };
>>   
>>   const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> index 120cb65164c1ba1deb9acb513e5f073bd560c496..859c279afbb0377d16f8406f3e6b083640aff5a1 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> @@ -30,6 +30,7 @@
>>   #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
>>   #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
>>   #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
>> +#define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
>>   
>>   #define MSM_DSI_V2_VER_MINOR_8064	0x0
>>   
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 4d75529c0e858160761f5eb55db65e5d7565c27b..694ed95897d49c477726a2b0bec1099e75a3ce21 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -119,6 +119,15 @@ struct msm_dsi_host {
>>   	struct clk *pixel_clk;
>>   	struct clk *byte_intf_clk;
>>   
>> +	/*
>> +	 * Clocks which needs to be properly parented between DISPCC and DSI PHY
>> +	 * PLL:
>> +	 */
>> +	struct clk *byte_src_clk;
>> +	struct clk *pixel_src_clk;
>> +	struct clk *dsi_pll_byte_clk;
>> +	struct clk *dsi_pll_pixel_clk;
>> +
>>   	unsigned long byte_clk_rate;
>>   	unsigned long byte_intf_clk_rate;
>>   	unsigned long pixel_clk_rate;
>> @@ -269,6 +278,38 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host)
>>   	return ret;
>>   }
>>   
>> +int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host)
>> +{
>> +	struct device *dev = &msm_host->pdev->dev;
>> +	int ret;
>> +
>> +	ret = dsi_clk_init_6g_v2(msm_host);
>> +	if (ret)
>> +		return ret;
>> +
>> +	msm_host->byte_src_clk = devm_clk_get(dev, "byte_src");
>> +	if (IS_ERR(msm_host->byte_src_clk))
>> +		return dev_err_probe(dev, PTR_ERR(msm_host->byte_src_clk),
>> +				     "can't get byte_src clock\n");
>> +
>> +	msm_host->dsi_pll_byte_clk = devm_clk_get(dev, "dsi_pll_byte");
>> +	if (IS_ERR(msm_host->dsi_pll_byte_clk))
>> +		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_byte_clk),
>> +				     "can't get dsi_pll_byte clock\n");
>> +
>> +	msm_host->pixel_src_clk = devm_clk_get(dev, "pixel_src");
>> +	if (IS_ERR(msm_host->pixel_src_clk))
>> +		return dev_err_probe(dev, PTR_ERR(msm_host->pixel_src_clk),
>> +				     "can't get pixel_src clock\n");
>> +
>> +	msm_host->dsi_pll_pixel_clk = devm_clk_get(dev, "dsi_pll_pixel");
>> +	if (IS_ERR(msm_host->dsi_pll_pixel_clk))
>> +		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_pixel_clk),
>> +				     "can't get dsi_pll_pixel clock\n");
>> +
>> +	return 0;
>> +}
>> +
>>   static int dsi_clk_init(struct msm_dsi_host *msm_host)
>>   {
>>   	struct platform_device *pdev = msm_host->pdev;
>> @@ -370,6 +411,46 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>>   	return 0;
>>   }
>>   
>> +int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host)
>> +{
>> +	struct device *dev = &msm_host->pdev->dev;
>> +	int ret;
>> +
>> +	/*
>> +	 * DSI PHY PLLs have to be enabled to allow reparenting to them and
>> +	 * setting the rates of pixel/byte clocks.
>> +	 */
> 
> According to the docs this should be handled by the
> CLK_OPS_PARENT_ENABLE flag. Please correct me if I'm wrong.
> 

I am also interested to know that if we are indeed setting 
CLK_OPS_PARENT_ENABLE flag, do we need this logic in the dsi driver.

If CLK_OPS_PARENT_ENABLE flag is not working as expected, shouldnt this 
be something fixed on the clk fwk side?

Thanks

Abhinav

>> +	ret = clk_prepare_enable(msm_host->dsi_pll_byte_clk);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_prepare_enable(msm_host->dsi_pll_pixel_clk);
> 
> And this.
> 
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
>> +		goto out_disable_byte_clk;
>> +	}
>> +
>> +	ret = clk_set_parent(msm_host->byte_src_clk, msm_host->dsi_pll_byte_clk);
>> +	if (ret)
>> +		dev_err(dev, "Failed to parent byte_src -> dsi_pll_byte: %d\n", ret);
>> +
>> +	ret = clk_set_parent(msm_host->pixel_src_clk, msm_host->dsi_pll_pixel_clk);
>> +	if (ret)
>> +		dev_err(dev, "Failed to parent pixel_src -> dsi_pll_pixel: %d\n", ret);
>> +
>> +	clk_disable_unprepare(msm_host->dsi_pll_pixel_clk);
>> +	clk_disable_unprepare(msm_host->dsi_pll_byte_clk);
>> +
>> +	return dsi_link_clk_set_rate_6g(msm_host);
>> +
>> +out_disable_byte_clk:
>> +	clk_disable_unprepare(msm_host->dsi_pll_byte_clk);
>> +
>> +	return ret;
>> +}
>> +
>>   int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
>>   {
>>   	int ret;
>>
>> -- 
>> 2.45.2
>>
> 

