Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563DAAB020E
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5350810E943;
	Thu,  8 May 2025 18:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kHsHZHjp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0396510E1AE;
 Thu,  8 May 2025 18:03:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5489bWVr011768;
 Thu, 8 May 2025 18:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1xCSXSoSXfhqtNF9xtoPFolydz5FMlZ2dUX0FvNORuM=; b=kHsHZHjpG6zWBYPj
 /KgVPSYpmwksE3ihQK+O+cZqdp4XYbD2W+Na0cOqxZ7QJG+tbakPyY9JIKnaDC0Y
 M0ngqQQvRSs6E+5SL8f5dJteBWzXxlN8G64VORfU6WPvaD5w/jLYeZhRoDeF/E65
 Rsxttjlb5w5g+5ZtS4V+ifBaUjPDnahyRcYCeTdfqGew9a0h39XauIJlNY8zKQeC
 ylvAzCS/WFEy0P783GhKhsprxg5QpNzCIpWIKVgZwJdsnnR5Mk20FKCFulJBQ0Nh
 qbeSHqg7wSCjoiS9FE6RFT0DAkB6Q2SeEmwgRj0FAUh6WzaA+Trvg5i+nJhrqPTh
 OWRGAQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52sbka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 May 2025 18:03:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548I3IZG029770
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 May 2025 18:03:18 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 11:03:18 -0700
Message-ID: <fe871e80-3117-42da-b50a-b9adf3cef3c9@quicinc.com>
Date: Thu, 8 May 2025 11:03:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/14] drm/msm/dpu: Use dedicated WB number definition
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE2MCBTYWx0ZWRfX11JsyQvBMy3b
 aYElRTXzk6tKI8+7RJJ2OfriKbfb2CykhFLBjXux41qAjLkzaSRGxc1xf+6RTQvoTw0I2S5uL/F
 D7KIO/IBnf67MuwgsNsLgrFgLe1Af9eHfBS1A1L0ymElCjmc+wzMu/2u6hTrPcGekbSmo8MQe+1
 leNxxwpjsNKRiPUYgbVvW099oX8ezhs5CjDS3N9055fgRIHgPRPWqVeUO5VD/86PBacfdQyog7E
 STCQ5ChXYx1ja/kaxltxC4S4rK2kZRE5S+Swgcy9XtiGaRV3hw3484lMBk8FWujspII6SaoQkaW
 23f2hnnc1dWs49BCQ3GuJnvANxr1GfEx0pFNVlyCK6SeExVZ69xVQPFaD62Z3TQ8ccUBaVv+m5N
 IswHRaB9QKRbd9RqBeLcsEjMOQ5mtOEf+RZK9ekTlug1HKB7gnJQXmoKN90qiqV/YovPMfVn
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681cf1e7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=gTC0tX81JuRyhgdZfrkA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: k-9LSWWYQuSIkfT3fEjifwfU49Q38zA-
X-Proofpoint-GUID: k-9LSWWYQuSIkfT3fEjifwfU49Q38zA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080160
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



On 5/6/2025 8:47 AM, Jun Nie wrote:
> Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
> supported at most in one encoder. The case of 4 channels per encoder is
> to be added. To avoid breaking current WB usage case, use dedicated WB
> definition before 4 WB usage case is supported in future.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3e4ff345bd6d9c0e2a08274874fac40690409cf0..a125a477404fdafee6495f6d3778160f14a01a96 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -56,6 +56,7 @@
>   	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
>   
>   #define MAX_CHANNELS_PER_ENC 2
> +#define MAX_CWB_PER_ENC 2
>   
>   #define IDLE_SHORT_TIMEOUT	1
>   
> @@ -182,7 +183,7 @@ struct dpu_encoder_virt {
>   	struct dpu_encoder_phys *cur_master;
>   	struct dpu_encoder_phys *cur_slave;
>   	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> -	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
>   	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>   
>   	unsigned int dsc_mask;
> @@ -2372,7 +2373,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
>   	 */
>   	cwb_cfg.input = INPUT_MODE_LM_OUT;
>   
> -	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
>   		hw_cwb = dpu_enc->hw_cwb[i];
>   		if (!hw_cwb)
>   			continue;
> 

