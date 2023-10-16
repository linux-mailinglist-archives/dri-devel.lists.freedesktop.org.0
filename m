Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168CB7CB42B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 22:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DE710E127;
	Mon, 16 Oct 2023 20:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04C910E0D0;
 Mon, 16 Oct 2023 20:12:31 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39GKCBYX005670; Mon, 16 Oct 2023 20:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=9byl/lLhIxYYtGiGlPgMckCJZec72dWbspiyKRKlEg4=;
 b=IUteNXSTbP33SulPGXdNwA703jyVpNHumgQD23tTADL/V8yzAC61cIQZzlsih0W7PRbw
 DH2cxSH3oOP8JnbxNxZXHVhyqPy30TXkCsUoegEmboxxKOTvnI9+K6mvsdg7e2UywMvG
 31ToAjGqQiMr/BM9S6Mmnz8AHB64cET14PjJ6AXhp3L+CgfGGp+tRRrCOM2ccNQTAT72
 nUTPakFQ9OBWf4GY38c6+XO1htVP0jalh7j7EbkBMTnB5bPPkgo5p1SgGdl516KkuCQc
 l1JTLUP4itYI0UOXhH5ci7WenRsSvMBextuZ4wPl9AvOmSsgY4jGUIXbf1bZPr4uth8L aA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tsc00r02n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Oct 2023 20:12:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39GKCAvB010719
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Oct 2023 20:12:10 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 16 Oct 2023 13:12:03 -0700
Date: Tue, 17 Oct 2023 01:41:59 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 2/7] drm/msm/adreno: Add ZAP firmware name to A635
Message-ID: <43q6mui3lofa4rqh667o54b2qcbqn5fg34ss5o7y7k7uxbxsro@dxgovofsrvqx>
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
 <20230926-topic-a643-v1-2-7af6937ac0a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926-topic-a643-v1-2-7af6937ac0a3@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: UOJ-DHna11eErJfOFBfC8zsLHc8pm-az
X-Proofpoint-GUID: UOJ-DHna11eErJfOFBfC8zsLHc8pm-az
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_10,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310160176
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 08:24:37PM +0200, Konrad Dybcio wrote:
> 
> Some (many?) devices with A635 expect a ZAP shader to be loaded.
> 
> Set the file name to allow for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index fa527935ffd4..16527fe8584d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -454,6 +454,7 @@ static const struct adreno_info gpulist[] = {
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>  			ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
> +		.zapfw = "a660_zap.mbn",

sc7280 doesn't have a TZ and so no zap shader support. Can we handle
this using "firmware-name" property in your top level platform dt? Zap
firmwares are signed with different keys for each OEMs. So there is
cross-compatibility anyway.

-Ahil.

>  		.hwcg = a660_hwcg,
>  		.address_space_size = SZ_16G,
>  		.speedbins = ADRENO_SPEEDBINS(
> 
> -- 
> 2.42.0
> 
