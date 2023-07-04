Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C7D74668C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 02:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1FE10E257;
	Tue,  4 Jul 2023 00:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FF810E0FA;
 Tue,  4 Jul 2023 00:25:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3640PEuJ013322; Tue, 4 Jul 2023 00:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ScHfhnkPiOJeu3E6SeNN06wpSh54ebcvMeKrrLxBfV4=;
 b=Lne1dWsz7jNlvIv+h2qdYNJ5N1vHe6NVgQ4pm5DTc2+G8q3bcEutVExC+7rFzm/Xa6oU
 EC6YudNQKfQd8H39xPWObwVt+AJoo71c2UwJGB5srZ1t3OjiKV/CvtfxRpI5vsy055fC
 OnntLlgeeWYqigsMQ1yxwTo6y9PeJhE3QS2Z79SlTAzdYRCxJW8dZn5/H1bCbOWe5zw9
 m8ecyOsmMJLfNQ8gkVss0MsoXXCjikwV+QDU+O8EHkvlBob7vS2APglJajUaCc9diTFg
 yeBDxdo/pcLONzKyLA20BP86CGqi0gvKmE5rwkgnVbCh0LBYpFttd5MGfmKEXnybMmeg 0g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rkw8s1c3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jul 2023 00:25:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3640PCHH006890
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jul 2023 00:25:12 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 17:25:12 -0700
Message-ID: <aa639287-4a9b-13b6-57ec-a5ee49340751@quicinc.com>
Date: Mon, 3 Jul 2023 17:25:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 8/8] drm/msm/dpu: remove unused fields from struct
 dpu_core_perf
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-9-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230620000846.946925-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aYqbUZNK03Kny_Rq1T5vT5WDygDZnl1b
X-Proofpoint-GUID: aYqbUZNK03Kny_Rq1T5vT5WDygDZnl1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_17,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040001
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> Remove dpu_core_perf::dev and dpu_core_perf::debugfs_root fields, they
> are not used by the code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 2 +-
>   3 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index f779ad544347..7f110d15b101 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -395,11 +395,9 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>   #endif
>   
>   int dpu_core_perf_init(struct dpu_core_perf *perf,
> -		struct drm_device *dev,
>   		const struct dpu_perf_cfg *perf_cfg,
>   		struct clk *core_clk)
>   {
> -	perf->dev = dev;
>   	perf->perf_cfg = perf_cfg;
>   	perf->core_clk = core_clk;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index e1198c104b5e..623e2d058695 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -27,7 +27,6 @@ struct dpu_core_perf_params {
>   /**
>    * struct dpu_core_perf - definition of core performance context
>    * @dev: Pointer to drm device

remove dev from here too

> - * @debugfs_root: top level debug folder
>    * @perf_cfg: Platform-specific performance configuration
>    * @core_clk: Pointer to the core clock
>    * @core_clk_rate: current core clock rate
> @@ -36,8 +35,6 @@ struct dpu_core_perf_params {
>    * @enable_bw_release: debug control for bandwidth release
>    */
>   struct dpu_core_perf {
> -	struct drm_device *dev;
> -	struct dentry *debugfs_root;
>   	const struct dpu_perf_cfg *perf_cfg;
>   	struct clk *core_clk;
>   	u64 core_clk_rate;
> @@ -77,7 +74,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
>    * @core_clk: pointer to core clock
>    */
>   int dpu_core_perf_init(struct dpu_core_perf *perf,
> -		struct drm_device *dev,
>   		const struct dpu_perf_cfg *perf_cfg,
>   		struct clk *core_clk);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 4439147d2c35..5297cec68c9c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1115,7 +1115,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   		dpu_kms->hw_vbif[vbif->id] = hw;
>   	}
>   
> -	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog->perf,
> +	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf,
>   			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
>   	if (rc) {
>   		DPU_ERROR("failed to init perf %d\n", rc);
