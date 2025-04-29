Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983A7A9FF57
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 04:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3F410E046;
	Tue, 29 Apr 2025 02:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="H3mpJgbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F0310E046;
 Tue, 29 Apr 2025 02:02:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq3ae006050;
 Tue, 29 Apr 2025 02:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 65OgRml+qIL1StxLPbFN+2FvbSuAIbl2TzcszrxVTSQ=; b=H3mpJgbHptuUYlpe
 0oIwnkHWgjErCeCuD9MSahqC7e2wHnT3VWrOoxJYypmDAi/a3+fu7V7XaGe7LBaR
 pa9eyfEaVKaMCXCPcMgrxHEzqJb/JyC+QktKZ4DS+zm2nwZOS35gD4W2FCvsCV2d
 I5sJOCt8qyI4P4kE87X6jeBfzPdfevxT3GbLGbDRYHlA03Ta1F9z82mlFpK6gFxS
 WTpa7h0fmeRF7K+aIFrVHsyJWjZ4eKK8dTGp0iaR39grAJey4V0Kq05Q+cpwBB0x
 Zv+dSCZewdXU1RWNvYSI+pIlJ5bBJFB7ukGF5c8Qc3I75zD48eM34HKJvUo4sjq1
 fQ4ObA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmjwvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Apr 2025 02:01:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T21uue021861
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Apr 2025 02:01:56 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 19:01:56 -0700
Message-ID: <c1587cf2-b389-45f4-9dc8-db29bbbe5eb0@quicinc.com>
Date: Mon, 28 Apr 2025 19:01:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: remove DSC feature bit for PINGPONG
 on SDM630
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?=
 <barnabas.czeman@mainlining.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
 <20250301-dpu-fix-catalog-v2-5-498271be8b50@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250301-dpu-fix-catalog-v2-5-498271be8b50@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 5xoE7j-jPDFzb3eZwWqoPTh0P62RPKsc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAxMyBTYWx0ZWRfX6oOzKiah8oEx
 LAWAzXVLa4L6dwGakcOWfxGN5JTiLeZHiMikJ22rtGp7D1CYU4BvinpQWKM8HTp3Gc+N+9t/1Hr
 aYjm5dBKpsLNx/xw5rGx0/zUGv+Ag8gaRICKu4U8C+QdB2O1hfchiT56wORMn8sYU5vtv7hXSjL
 lDJFmn89F7URV0zFNnU3JL+YzzXoiViLMzzanSn1aofdYx3gaND924vZwBRhp8i5vKnr0FNCRi0
 zUMWT1JZb+1iVBiyzhWJTLwNJs1aEWMDVhOq93WRIDwDs/0XV9aEDXlieHYhXeaoMf7o7PUoEHJ
 m1wPg9leEUjV841QcZIS2uc9H1Lop4AWpFs2Mr18oFAgqWXascznyIyWUx+SUfXi70BNnqGp7Sn
 GXYp8Ro1sNOAUfVFLpzVy+rgZXcsLiUwoROolU9LPCvgY1p6pMVx+LPmnsnN5VC1Jk9Po9Yr
X-Proofpoint-GUID: 5xoE7j-jPDFzb3eZwWqoPTh0P62RPKsc
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=68103315 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=HSyGJS9vhWUlg5_aX7AA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290013
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



On 3/1/2025 1:24 AM, Dmitry Baryshkov wrote:
> The SDM630 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask, replacing PINGPONG_SDM845_MASK with
> BIT(DPU_PINGPONG_DITHER).
> 
> Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> ---
> Note, Konrad pointed out that vendor DT doesn't define DIPTHER support
> for this platform, however I believe this is because support for this
> platform predates DITHER support in the vendor kernels.
> ---

Yes this is correct. This chipset has dither support in ping-pong.

>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> index 3aed9aa4c533f167ece7b4a5eb84fe49c4929df5..99c0f824d8f00474812bde12e7d83ba3de1834f1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> @@ -115,14 +115,14 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
> +		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x71000, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
> +		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
