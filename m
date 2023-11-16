Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAE97EE864
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 21:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A1C10E6E6;
	Thu, 16 Nov 2023 20:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B78B10E6EB;
 Thu, 16 Nov 2023 20:36:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AGJiiiQ015832; Thu, 16 Nov 2023 20:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7nW4uUKOinMyfyACNCwFVXeHg4pie7w+X0CsEfRCaag=;
 b=U0z6WFwZrdlQon9j+EyB36vMbirx1VDCFC6vZYe7aetIRdH6JGJq/mWMZcaDV0iBEHNP
 Qb/U5vqksoRsEVNutk5s4/iWIVEYLLh8CaTyw8QEf82RTHliS8fmwFZuogh/F03DRldV
 VjnNWOkADqvCqgurK+9AN+xDVFdVsujouLUOzlZj2q0cd1ZLrCatBmBK4Vcfy3MnNsT/
 SaVafDzbkQQU0X1M2qU7yv0wMa3AhMdrX2EnxagdQzfJyHeLFVOjg/XCOqlOX3OI0h2g
 bq8F0pjCsH1jbzbvoIZfnve/SHZtvKTVivKKJnxnAAWhnTzJolGXGQ9Z9YmLfYcqL5ZM pw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ud1k53b3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 20:36:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AGKadlO031701
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 20:36:39 GMT
Received: from [10.110.71.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 12:36:38 -0800
Message-ID: <01b9bc3f-2afb-bd33-1212-d1dc7999b2bc@quicinc.com>
Date: Thu, 16 Nov 2023 12:36:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dsi: use the correct VREG_CTRL_1 value for 4nm
 cphy
Content-Language: en-US
To: Jonathan Marek <jonathan@marek.ca>, <freedreno@lists.freedesktop.org>
References: <20231110000216.29979-1-jonathan@marek.ca>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231110000216.29979-1-jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wEyKtP6vR8TjxeD1gO1F4ALFTNrsMgXc
X-Proofpoint-ORIG-GUID: wEyKtP6vR8TjxeD1gO1F4ALFTNrsMgXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_21,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=720 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311160159
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/9/2023 4:02 PM, Jonathan Marek wrote:
> Use the same value as the downstream driver. This change is needed for CPHY
> mode to work correctly.
> 
> Fixes: 8b034e6771113 ("drm/msm/dsi: add support for DSI-PHY on SM8550")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
> v2: fixed the Fixes: line
> 
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Good catch !

LGTM

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 3b1ed02f644d..89a6344bc865 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -918,7 +918,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
>   		if (phy->cphy_mode) {
>   			vreg_ctrl_0 = 0x45;
> -			vreg_ctrl_1 = 0x45;
> +			vreg_ctrl_1 = 0x41;
>   			glbl_rescode_top_ctrl = 0x00;
>   			glbl_rescode_bot_ctrl = 0x00;
>   		} else {
