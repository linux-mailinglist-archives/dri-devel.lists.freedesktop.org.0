Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 908726950C6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 20:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8532410E6EC;
	Mon, 13 Feb 2023 19:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DEE10E6E5;
 Mon, 13 Feb 2023 19:37:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DJPOaY028625; Mon, 13 Feb 2023 19:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UBlGb3ZRbBBaGOWdx1oTO/ER4dXltViw5GOGbB1sVUQ=;
 b=VlSXV2ZWv5f1u4B3iX+rN2KqybvBm3F091JYbXsDQqCbTenX+0zK5LBoABt+p+h7BnoK
 c5b4vP59+qNB7wjhee6j5W8JzSbOCCFCTG6rGRuPcbrn/5sJnc5zVgt6QfGNIIamfBgP
 z4s+VYgj7qIUd9nUrapvE6K9av5zyJzK9YmjRkTWnLJSVZ5ba8IMjo1wYz7a+fQFUIpj
 aUjMZMVX56CUZfbTWUgGvjFB6Fob4Cej9xydQBO+wyO6yC19MCkKsqjER7nkXgyQah68
 UL5DJ7xbeAP6tIBvWJrPOsR/8HvmIA6MTlEiY7K23T6GmsFniA2hcqfHcWqxUwt1TwzD UA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nqpmmgrbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 19:37:17 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31DJbGH9020514
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 19:37:16 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 13 Feb
 2023 11:37:15 -0800
Message-ID: <773cd72b-a766-1764-e25f-0af1174f0e51@quicinc.com>
Date: Mon, 13 Feb 2023 11:37:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH 5/7] drm/msm/dpu: Document and enable TEAR interrupts
 on DSI interfaces
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-6-marijn.suijten@somainline.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20221231215006.211860-6-marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: JEZBexlGk0nECIoGpUcYGnIKPoAtwR_O
X-Proofpoint-GUID: JEZBexlGk0nECIoGpUcYGnIKPoAtwR_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130171
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 linux-kernel@vger.kernel.org, Jami
 Kettunen <jami.kettunen@somainline.org>, Bjorn Andersson <andersson@kernel.org>,
 Adam Skladowski <a39.skl@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/31/2022 1:50 PM, Marijn Suijten wrote:
> All SoCs since DPU 5.0.0 (and seemingly up until and including 6.0.0,
> but excluding 7.x.x) have the tear interrupt and control registers moved
> out of the PINGPONG block and into the INTF block.  Wire up the
> necessary interrupts and IRQ masks on all supported hardware.

Hi Marijn,

Thanks for the patch.

I saw that in your commit msg, you mentioned that 7.x doesn't have 
tearcheck in the INTF block -- can you double check that this is correct?

I'm working on SM8350 (DPU v7) and I'm seeing that it does have 
tearcheck in INTF block.

> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 78 +++++++++++--------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 12 +++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h      |  3 +
>   5 files changed, 68 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 1cfe94494135..b9b9b5b0b615 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -86,6 +86,15 @@
>   
>   #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>   
> +#define IRQ_MSM8998_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF0_INTR) | \
> +			 BIT(MDP_INTF1_INTR) | \
> +			 BIT(MDP_INTF2_INTR) | \
> +			 BIT(MDP_INTF3_INTR) | \
> +			 BIT(MDP_INTF4_INTR))
> +
>   #define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			 BIT(MDP_SSPP_TOP0_INTR2) | \
>   			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> @@ -100,13 +109,15 @@
>   #define IRQ_QCM2290_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			 BIT(MDP_SSPP_TOP0_INTR2) | \
>   			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -			 BIT(MDP_INTF1_INTR))
> +			 BIT(MDP_INTF1_INTR) | \
> +			 BIT(MDP_INTF1_TEAR_INTR))
>   
>   #define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			 BIT(MDP_SSPP_TOP0_INTR2) | \
>   			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>   			 BIT(MDP_INTF0_INTR) | \
> -			 BIT(MDP_INTF1_INTR))
> +			 BIT(MDP_INTF1_INTR) | \
> +			 BIT(MDP_INTF1_TEAR_INTR))
>   
>   #define IRQ_SC7280_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			 BIT(MDP_SSPP_TOP0_INTR2) | \
> @@ -120,7 +131,9 @@
>   			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>   			 BIT(MDP_INTF0_INTR) | \
>   			 BIT(MDP_INTF1_INTR) | \
> +			 BIT(MDP_INTF1_TEAR_INTR) | \
>   			 BIT(MDP_INTF2_INTR) | \
> +			 BIT(MDP_INTF2_TEAR_INTR) | \
>   			 BIT(MDP_INTF3_INTR) | \
>   			 BIT(MDP_INTF4_INTR))
>   
> @@ -129,7 +142,9 @@
>   			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>   			  BIT(MDP_INTF0_INTR) | \
>   			  BIT(MDP_INTF1_INTR) | \
> +			  BIT(MDP_INTF1_TEAR_INTR) | \
>   			  BIT(MDP_INTF2_INTR) | \
> +			  BIT(MDP_INTF2_TEAR_INTR) | \
>   			  BIT(MDP_INTF3_INTR) | \
>   			  BIT(MDP_INTF4_INTR) | \
>   			  BIT(MDP_INTF5_INTR) | \
> @@ -1300,63 +1315,64 @@ static struct dpu_dsc_cfg sdm845_dsc[] = {
>   /*************************************************************
>    * INTF sub blocks config
>    *************************************************************/
> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit, _tear_reg, _tear_rd_ptr_bit) \
>   	{\
>   	.name = _name, .id = _id, \
> -	.base = _base, .len = 0x280, \
> +	.base = _base, .len = _len, \
>   	.features = _features, \
>   	.type = _type, \
>   	.controller_id = _ctrl_id, \
>   	.prog_fetch_lines_worst_case = _progfetch, \
>   	.intr_underrun = DPU_IRQ_IDX(_reg, _underrun_bit), \
>   	.intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
> +	.intr_tear_rd_ptr = DPU_IRQ_IDX(_tear_reg, _tear_rd_ptr_bit), \
>   	}
>   
>   static const struct dpu_intf_cfg msm8998_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x268, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),

Just wondering, how were the lengths calculated for the INTF blocks? The 
values in general seem a little off to me.

For example, I'm looking downstream and it seems to me that the length 
for the INTF_0 on MSM8998 should be 0x280. Similarly for SC7280, I'm 
seeing that length for INTF + tearcheck should be 0x2c4.

Thanks,

Jessica Zhang

> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x268, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27, -1, -1),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x268, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29, -1, -1),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x268, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31, -1, -1),
>   };
>   
>   static const struct dpu_intf_cfg sdm845_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27, -1, -1),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x280, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29, -1, -1),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31, -1, -1),
>   };
>   
>   static const struct dpu_intf_cfg sc7180_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27, MDP_INTF1_TEAR_INTR, 2),
>   };
>   
>   static const struct dpu_intf_cfg sm8150_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27, MDP_INTF1_TEAR_INTR, 2),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x2b8, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29, MDP_INTF2_TEAR_INTR, 2),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31, -1, -1),
>   };
>   
>   static const struct dpu_intf_cfg sc7280_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2b8, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27, MDP_INTF1_TEAR_INTR, 2),
> +	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23, -1, -1),
>   };
>   
>   static const struct dpu_intf_cfg sc8180x_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27, MDP_INTF1_TEAR_INTR, 2),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x2b8, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29, MDP_INTF2_TEAR_INTR, 2),
>   	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> -	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31, -1, -1),
> +	INTF_BLK("intf_4", INTF_4, 0x6C000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21, -1, -1),
> +	INTF_BLK("intf_5", INTF_5, 0x6C800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23, -1, -1),
>   };
>   
>   static const struct dpu_intf_cfg qcm2290_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2b8, INTF_NONE, 0, 0, 0, 0, 0, 0, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27, MDP_INTF2_TEAR_INTR, 2),
>   };
>   
>   /*************************************************************
> @@ -1849,7 +1865,7 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
>   	.vbif = msm8998_vbif,
>   	.reg_dma_count = 0,
>   	.perf = &msm8998_perf_data,
> -	.mdss_irqs = IRQ_SM8250_MASK,
> +	.mdss_irqs = IRQ_MSM8998_MASK,
>   };
>   
>   static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
> @@ -1947,7 +1963,7 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>   	.reg_dma_count = 1,
>   	.dma_cfg = &sm8150_regdma,
>   	.perf = &sm8150_perf_data,
> -	.mdss_irqs = IRQ_SDM845_MASK,
> +	.mdss_irqs = IRQ_SM8250_MASK,
>   };
>   
>   static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index e0e153889ab7..2ea17e4ef3e5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -638,8 +638,9 @@ struct dpu_dsc_cfg {
>    * @type:              Interface type(DSI, DP, HDMI)
>    * @controller_id:     Controller Instance ID in case of multiple of intf type
>    * @prog_fetch_lines_worst_case	Worst case latency num lines needed to prefetch
> - * @intr_underrun:	index for INTF underrun interrupt
> - * @intr_vsync:	        index for INTF VSYNC interrupt
> + * @intr_underrun:     index for INTF underrun interrupt
> + * @intr_vsync:        index for INTF VSYNC interrupt
> + * @intr_tear_rd_ptr:  index for INTF TEAR_RD_PTR interrupt
>    */
>   struct dpu_intf_cfg  {
>   	DPU_HW_BLK_INFO;
> @@ -648,6 +649,7 @@ struct dpu_intf_cfg  {
>   	u32 prog_fetch_lines_worst_case;
>   	s32 intr_underrun;
>   	s32 intr_vsync;
> +	s32 intr_tear_rd_ptr;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index cf1b6d84c18a..044136a97fac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -24,6 +24,8 @@
>   #define MDP_INTF_3_OFF			0x6B800
>   #define MDP_INTF_4_OFF			0x6C000
>   #define MDP_INTF_5_OFF			0x6C800
> +#define MDP_INTF_1_TEAR_OFF		0x6D800
> +#define MDP_INTF_2_TEAR_OFF		0x6D900
>   #define MDP_AD4_0_OFF			0x7C000
>   #define MDP_AD4_1_OFF			0x7D000
>   #define MDP_AD4_INTR_EN_OFF		0x41c
> @@ -99,6 +101,16 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>   		MDP_INTF_5_OFF+INTF_INTR_EN,
>   		MDP_INTF_5_OFF+INTF_INTR_STATUS
>   	},
> +	[MDP_INTF1_TEAR_INTR] = {
> +		MDP_INTF_1_TEAR_OFF+INTF_INTR_TEAR_CLEAR,
> +		MDP_INTF_1_TEAR_OFF+INTF_INTR_TEAR_EN,
> +		MDP_INTF_1_TEAR_OFF+INTF_INTR_TEAR_STATUS
> +	},
> +	[MDP_INTF2_TEAR_INTR] = {
> +		MDP_INTF_2_TEAR_OFF+INTF_INTR_TEAR_CLEAR,
> +		MDP_INTF_2_TEAR_OFF+INTF_INTR_TEAR_EN,
> +		MDP_INTF_2_TEAR_OFF+INTF_INTR_TEAR_STATUS
> +	},
>   	[MDP_AD4_0_INTR] = {
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 46443955443c..b447e4a1d9f4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -23,6 +23,8 @@ enum dpu_hw_intr_reg {
>   	MDP_INTF3_INTR,
>   	MDP_INTF4_INTR,
>   	MDP_INTF5_INTR,
> +	MDP_INTF1_TEAR_INTR,
> +	MDP_INTF2_TEAR_INTR,
>   	MDP_AD4_0_INTR,
>   	MDP_AD4_1_INTR,
>   	MDP_INTF0_7xxx_INTR,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> index c8156ed4b7fb..6bdac515fd54 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> @@ -10,6 +10,9 @@
>   /**
>    * MDP TOP block Register and bit fields and defines
>    */
> +#define INTF_INTR_TEAR_EN               0x000
> +#define INTF_INTR_TEAR_STATUS           0x004
> +#define INTF_INTR_TEAR_CLEAR            0x008
>   #define DISP_INTF_SEL                   0x004
>   #define INTR_EN                         0x010
>   #define INTR_STATUS                     0x014
> -- 
> 2.39.0
> 
