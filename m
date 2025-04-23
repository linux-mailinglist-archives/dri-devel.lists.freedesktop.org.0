Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DB5A99B5F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 00:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8458910E0B9;
	Wed, 23 Apr 2025 22:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="R8GRu/FZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799B910E0B9;
 Wed, 23 Apr 2025 22:19:05 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB6N7g024369;
 Wed, 23 Apr 2025 22:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oeUFxMFx6nrxzSXI/SkRX4Q1OugOEfgA+K7GIguWCd4=; b=R8GRu/FZJpRG5pEu
 DP+yW0+BmptsdIdEhA8Kz3BmbRimN/uSZTbyd0AjJPFpZtD8E0TwGE1bfTLab905
 K3GgTC20xs5DbqfsRQ7PoETWvq9oBDoUSaNW65vw+H9UjbmU4Hf5VKaDyJczwoXj
 oe6KtfJeO7kCIFY0xWs4NK4Zbc7VTjr9L7pf/7ZJf3bFAzm4cvsFJ0zlmGF+hrIf
 MkFY6j6O2qJ8se+QhT6MKNQSTiDZly9v2X0tBFaj29LvtK3PNs8jskAkohPuuh1l
 wXbdBnchR22SgD8qZmDDpY/rN7SKV0hJywainD1yOCkxONOI9bx3i2Ej0lspoQ9c
 0shSYg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bgud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 22:18:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NMIwJF010406
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 22:18:58 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 15:18:57 -0700
Message-ID: <d9ef9d85-7d38-4bfa-84dd-1ae0878aa02b@quicinc.com>
Date: Wed, 23 Apr 2025 15:18:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-2-c983788987ae@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-2-c983788987ae@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6dLsYDGlO3Qdum4Szw-okUyxaD8VzboY
X-Proofpoint-GUID: 6dLsYDGlO3Qdum4Szw-okUyxaD8VzboY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NyBTYWx0ZWRfX2F41hgkfPksM
 gfcjU69aYf6ZywdwH4bliHUyBHahqUuBEtnYsU518CKMqUBsSLe9Qg7moeKd0AWeQCdlfflQaUa
 lL+zdvGbusOf5GcBOQ4ZqZyTcj64ya4pbtL3Lm65hNBVxVr2z4cYjbomVokuXb9hgxYP5MZQFEL
 iuobVGS2cu2W3sHoxPtT7jixc/3GCnLcQjPtjjcVgVwn5vLb+cIl/GBkYLbeFF3hhkQ94alOJ5c
 O8J9vKyT002odTAk70Hbl3YqVSCTCaBCkKcdMgeNEtSPaobqOnAHsFpIOjAhGTwgQtxBaWaig7D
 6ea/X8ptVga65oYUJaV/GOxwMzhbS2J2gkFFXSKqKcavKx797aoYTuBOX/hVCZ94SR4OvbpaR88
 aPDZcUMaZQxsXv7SWf2sn59M+/x66WpTcjXKUVKtiAwhhzOR71zczLB6iM52pPRe2EMghNH7
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=68096752 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=44wy0eceGWqoRLgzOdEA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230147
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



On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
> depends on COMMON_CLK.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 7 -------
>   1 file changed, 7 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
