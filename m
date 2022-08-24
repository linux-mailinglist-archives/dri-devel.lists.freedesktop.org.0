Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 484AC59F086
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 03:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F67D10E002;
	Wed, 24 Aug 2022 01:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892A010E383;
 Wed, 24 Aug 2022 01:08:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NNMrgB012726;
 Wed, 24 Aug 2022 01:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ju8dreiFKv/nF4Pg7D54M/P9AU5w7rPzGS86cxTfih8=;
 b=aEQSPedbk/cpZ2HypBdJ4M9AXlc/MITgp5nZfOxIHRKrjvwbpZqEwYIIElELUHDCETp9
 6mUtcrJJp66hK3OdLaPXKissmS6V23b+viHRdZHrKmmF+FRf4ByYv+xPSdLZmiVEMiGo
 gjJX87xbE3pHsXwqq2njUjScNvtSLxSREsjmF9ZrgA+aEDPWI80TbpPzJlVjMbTNVVQG
 F+9BS9esPfK1ZPkPJ1F8MkeRpZ0OWLF2pp0kFSevHb/wRpgFz9/3PbYkqvMVSackiHQg
 w41BEj9nh3e2rFiVI8Y0KUMnfpKaq1w9m/ZnL8HYzPEeT49VvkocEAihnNTJ/VcsmCw8 9w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52pk9ck8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 01:08:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27O18SKM000468
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 01:08:28 GMT
Received: from [10.111.161.24] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 23 Aug
 2022 18:08:25 -0700
Message-ID: <31faa17e-b521-9f83-2701-12bf8fd76e4b@quicinc.com>
Date: Tue, 23 Aug 2022 18:08:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 2/3] drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Rob Herring
 <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
 <20220704161148.814510-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220704161148.814510-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VdkGr2Ow7ViAMVnUT2LLdGJVNYnO4IOO
X-Proofpoint-ORIG-GUID: VdkGr2Ow7ViAMVnUT2LLdGJVNYnO4IOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240001
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/4/2022 9:11 AM, Dmitry Baryshkov wrote:
> On MSM8996 the HDMI PHY provides the PLL clock to the MMCC. As we are
> preparing to convert the MSM8996 to use DT clocks properties (rather
> than global clock names), register the OF clock provider.
> 
> While we are at it, also change the driver to use clk_parent_data rather
> parent_names to setup a link to the XO clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 25 +++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> index b06d9d25a189..4dd055416620 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> @@ -691,15 +691,13 @@ static const struct clk_ops hdmi_8996_pll_ops = {
>   	.is_enabled = hdmi_8996_pll_is_enabled,
>   };
>   
> -static const char * const hdmi_pll_parents[] = {
> -	"xo",
> -};
> -
>   static const struct clk_init_data pll_init = {
>   	.name = "hdmipll",
>   	.ops = &hdmi_8996_pll_ops,
> -	.parent_names = hdmi_pll_parents,
> -	.num_parents = ARRAY_SIZE(hdmi_pll_parents),
> +	.parent_data = (const struct clk_parent_data[]){
> +		{ .fw_name = "xo", .name = "xo_board" },
> +	},
> +	.num_parents = 1,
>   	.flags = CLK_IGNORE_UNUSED,
>   };
>   
> @@ -707,8 +705,7 @@ int msm_hdmi_pll_8996_init(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct hdmi_pll_8996 *pll;
> -	struct clk *clk;
> -	int i;
> +	int i, ret;
>   
>   	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
>   	if (!pll)
> @@ -735,10 +732,16 @@ int msm_hdmi_pll_8996_init(struct platform_device *pdev)
>   	}
>   	pll->clk_hw.init = &pll_init;
>   
> -	clk = devm_clk_register(dev, &pll->clk_hw);
> -	if (IS_ERR(clk)) {
> +	ret = devm_clk_hw_register(dev, &pll->clk_hw);
> +	if (ret) {
>   		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
> -		return -EINVAL;
> +		return ret;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
> +		return ret;
>   	}
>   
>   	return 0;
