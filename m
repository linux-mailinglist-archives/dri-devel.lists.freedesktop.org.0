Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982D64F2B6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 21:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B3910E065;
	Fri, 16 Dec 2022 20:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1D410E065;
 Fri, 16 Dec 2022 20:53:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGJBBgr024824; Fri, 16 Dec 2022 20:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hw/esT0/XM4a+KpFYJ83ZxORLOabu0x7zhPJi2KNuQ0=;
 b=X5IxmXkRVMJ/ncRYWrhcfMNfP9RLCCPVeyx+6OCx+GD8XrI8LasiYMX4LYFesTAj9ipY
 +IVlQ5BxWuWKALjtqg8BKeNjakMW2upvBjIIX5vh0a7NswdThTZ1eA7sxDt6O62MRYhO
 ulhMMoOhP8x4Va+/AoKbQSVyuk7BhnHl5r5FekG2uphC+Hd/Wvv8xXFQ0zivUCQ9WXP5
 MG8fHyZgfHIzxdMJPcbkkfljOsxSGTsr52rFrXpnaQa+x6KMT7e36fKi4/z+ipWYYn9l
 4Fj2IUKVXUAULDIyD3sql37qyd+tkBDRKu4onhLDMbOz3Hmz2IjjD7CPvDtdXfLl6yH7 7w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mg2895qn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 20:53:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BGKrAx7004922
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 20:53:10 GMT
Received: from [10.110.127.101] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 16 Dec
 2022 12:53:08 -0800
Message-ID: <cee94281-07a5-42b7-3d60-6ef6367ff915@quicinc.com>
Date: Fri, 16 Dec 2022 12:53:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 2/6] drm/msm/dpu1: Add DSC config for sm8150 and sm8250
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-3-marijn.suijten@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221213232207.113607-3-marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1bRcK7Mx4X9HduAcyW6FAX9RncDD9be6
X-Proofpoint-ORIG-GUID: 1bRcK7Mx4X9HduAcyW6FAX9RncDD9be6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_14,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212160185
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Vinod
 Polimera <quic_vpolimer@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Haowen Bai <baihaowen@meizu.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen
 Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/13/2022 3:22 PM, Marijn Suijten wrote:
> These blocks on CTL V1 support setting a PINGPONG idx to send pixel
> output to.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 23 ++++++++++++++-----
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 318f0b4dbf6e..114ad8ca4554 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1566,18 +1566,25 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
>   /*************************************************************
>    * DSC sub blocks config
>    *************************************************************/
> -#define DSC_BLK(_name, _id, _base) \
> +#define DSC_BLK(_name, _id, _base, _features) \
>   	{\
>   	.name = _name, .id = _id, \
>   	.base = _base, .len = 0x140, \
> -	.features = 0, \
> +	.features = _features, \
>   	}
>   
>   static struct dpu_dsc_cfg sdm845_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00),
> +	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
> +	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
> +	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
> +};
> +
> +static struct dpu_dsc_cfg sm8150_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>   };
>   
>   /*************************************************************
> @@ -2474,6 +2481,8 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>   	.mixer = sm8150_lm,
>   	.dspp_count = ARRAY_SIZE(sm8150_dspp),
>   	.dspp = sm8150_dspp,
> +	.dsc_count = ARRAY_SIZE(sm8150_dsc),
> +	.dsc = sm8150_dsc,
>   	.pingpong_count = ARRAY_SIZE(sm8150_pp),
>   	.pingpong = sm8150_pp,
>   	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> @@ -2524,6 +2533,8 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
>   	.mixer = sm8150_lm,
>   	.dspp_count = ARRAY_SIZE(sm8150_dspp),
>   	.dspp = sm8150_dspp,
> +	.dsc_count = ARRAY_SIZE(sm8150_dsc),
> +	.dsc = sm8150_dsc,
>   	.pingpong_count = ARRAY_SIZE(sm8150_pp),
>   	.pingpong = sm8150_pp,
>   	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
