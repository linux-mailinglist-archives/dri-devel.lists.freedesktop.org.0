Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF488040A5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 22:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B706C10E407;
	Mon,  4 Dec 2023 21:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06BD10E403;
 Mon,  4 Dec 2023 21:02:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B4ItNYD014464; Mon, 4 Dec 2023 21:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QYjIFnNstO3qlMsMHZghNVKgRaHWOBv3NyOgeVjlJHE=;
 b=I/TLW5O8+j11NFlRFaAKtDLMQgN9S4gAGpvceFBgvBuGhZLm/BfPfS+Xi9HSkAJ1U91e
 dvR+DkeiHBCqLzycZOBKdQRQ0y4QsxHS4FmFFZcwdttbRtECbf/L3V3Pr94Klvn9BEmV
 LE28vf1mIG/hRf+Vb69Uw1I/eG7KggCoiYFUKd0Rms4h0qpAXdIb5J1s/F+P59YhfU+z
 jtt8pnhczkArGwtrxFCmMJXbu0x+ql/jaZRjTiaq6af3y0MYfY2uK8fLsI4qCQydY8+L
 /Va8ZYvptPu3erpdY0ywCNp3TGudQ98WkrUq+BqPuiAw8yjiIj3/av512e7VZqgi+rTI rw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usfu791br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Dec 2023 21:02:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4L2Jn0019933
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 4 Dec 2023 21:02:19 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 13:02:19 -0800
Message-ID: <90d23728-66a5-d3fe-5920-90bf60093399@quicinc.com>
Date: Mon, 4 Dec 2023 13:02:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 2/4] drm/msm/mdss: Rename path references to mdp_path
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
 <20231202224247.1282567-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202224247.1282567-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: B1dOvlzBjbm9GEwV17PNaTxj00Xrytld
X-Proofpoint-ORIG-GUID: B1dOvlzBjbm9GEwV17PNaTxj00Xrytld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_19,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040164
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/2/2023 2:42 PM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
> CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
> calculated, but the latter one has static predefines spanning all SoCs.
> 
> In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
> the path-related struct members to include "mdp_".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nits and I am fine to fix them now or later as they existed even 
before this patch,

1) we can just have num_mdp_paths++ in both places instead of setting to 
1 and then increment.

2) Maybe some macro like MAX_MDP_ICC_PATH instead of 2 will be better.

3) Wondering whether we even need a num_path/num_mdp_path and just use 
ARRAY_SIZE for the loop and then check if (mdp_path) OR even better if 
icc has some sort of bulk_set_bw with num of paths.

Nothing these down but nothing to block this patch:

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 53bc496ace99..e1b208fd072e 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -40,8 +40,8 @@ struct msm_mdss {
>   		struct irq_domain *domain;
>   	} irq_controller;
>   	const struct msm_mdss_data *mdss_data;
> -	struct icc_path *path[2];
> -	u32 num_paths;
> +	struct icc_path *mdp_path[2];
> +	u32 num_mdp_paths;
>   };
>   
>   static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
> @@ -54,13 +54,13 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
>   	if (IS_ERR_OR_NULL(path0))
>   		return PTR_ERR_OR_ZERO(path0);
>   
> -	msm_mdss->path[0] = path0;
> -	msm_mdss->num_paths = 1;
> +	msm_mdss->mdp_path[0] = path0;
> +	msm_mdss->num_mdp_paths = 1;
>   
>   	path1 = devm_of_icc_get(dev, "mdp1-mem");
>   	if (!IS_ERR_OR_NULL(path1)) {
> -		msm_mdss->path[1] = path1;
> -		msm_mdss->num_paths++;
> +		msm_mdss->mdp_path[1] = path1;
> +		msm_mdss->num_mdp_paths++;
>   	}
>   
>   	return 0;
> @@ -70,8 +70,8 @@ static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
>   {
>   	int i;
>   
> -	for (i = 0; i < msm_mdss->num_paths; i++)
> -		icc_set_bw(msm_mdss->path[i], 0, Bps_to_icc(bw));
> +	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
> +		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
>   }
>   
>   static void msm_mdss_irq(struct irq_desc *desc)
