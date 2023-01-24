Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5C0678D9E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 02:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502F610E224;
	Tue, 24 Jan 2023 01:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A0810E221;
 Tue, 24 Jan 2023 01:40:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30O1ds8R021262; Tue, 24 Jan 2023 01:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/3vy53jBEpnE+wnWmj0hwFQxGQ678QJL24hO3+oswnI=;
 b=nZh6Hs3Dp/5LwPiE1zYzgxS6Hu8i5sjwg+sR60uAA7Mbw8a/G/Yj3OsPHeTUQ09i75z6
 oWoKMSDkej/8tseiX8Tc2uY/C2ON7fYx0wyp6WwTNtrdqwSMSeli3gGnha5jZYocy51E
 ScmfytgoJ0tA9YvCM88w40g3GUFEoelAieItLK5SyY5gkntq56yYFkQ6IY/roo1JX89k
 hYGVP8MywP3h1Hf0poqnCjXEYK2DEaHCPKyA9TBZhyklZ7PxqbwFxo/3AOzEhv7oYX3N
 4qhrZsMUaDA9D6onV78pLnV44hNsNuVAEqtBVoF+ohdPVFDNp3hpLjxWnXZDJW6OvkJ0 5g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89dr440k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jan 2023 01:40:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30O1eaiM020322
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jan 2023 01:40:36 GMT
Received: from [10.110.62.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 23 Jan
 2023 17:40:34 -0800
Message-ID: <d84f45ab-4cb1-c8fe-1109-3afefb1e3022@quicinc.com>
Date: Mon, 23 Jan 2023 17:40:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/msm/dpu: add missing ubwc_swizzle setting to
 catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230123062415.3027743-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230123062415.3027743-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: x61BMY0Qoh6keJoqgrWQxRmMhHPzg1t0
X-Proofpoint-ORIG-GUID: x61BMY0Qoh6keJoqgrWQxRmMhHPzg1t0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301240011
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/22/2023 10:24 PM, Dmitry Baryshkov wrote:
> Use the values from the vendor DTs to set ubwc_swizzle in the catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Matches all the vendor DTs, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
> 
> Changes since v1:
> - Added data for sc7280 and sm8550
> 
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index e45799e9fe49..b16e550fc4b6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -580,6 +580,7 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
>   	.base = 0x0, .len = 0x494,
>   	.features = 0,
>   	.highest_bank_bit = 0x1,
> +	.ubwc_swizzle = 0x7,
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>   		.reg_off = 0x2ac, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> @@ -593,6 +594,7 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>   	.base = 0x0, .len = 0x494,
>   	.features = 0,
>   	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> +	.ubwc_swizzle = 0x6,
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>   			.reg_off = 0x2AC, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> @@ -649,6 +651,7 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
>   	.base = 0x0, .len = 0x494,
>   	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> +	.ubwc_swizzle = 0x6,
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>   			.reg_off = 0x2AC, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> @@ -675,6 +678,7 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
>   	.name = "top_0", .id = MDP_TOP,
>   	.base = 0x0, .len = 0x2014,
>   	.highest_bank_bit = 0x1,
> +	.ubwc_swizzle = 0x6,
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>   		.reg_off = 0x2AC, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> @@ -711,6 +715,7 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
>   	.base = 0, .len = 0x494,
>   	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> +	.ubwc_swizzle = 0x6,
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>   			.reg_off = 0x4330, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
