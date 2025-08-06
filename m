Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7DCB1BF80
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 06:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9614C10E723;
	Wed,  6 Aug 2025 04:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="K7l1nMqH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BCE10E722;
 Wed,  6 Aug 2025 04:08:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761fENI019678;
 Wed, 6 Aug 2025 04:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cf/IEFEh6bpy+mOL09P3mAl7H1dfHsS0shyvj1/mrKQ=; b=K7l1nMqHlkKyw7f+
 KVy51ZlPWxp3uXq5Jx7T3jWVLSRBgAh4rDQDApXPXE4UprGcdD9UFMRd3ei8Xhub
 0+47mEqAJEmnp/wZPYU53glcG7GyHc6P+khV8WqXS1Pke53NhoHa33AyB5HdLigg
 Id2mzkISW3d7wP+deugn14d/NdieNId/EplpQmE0GPJrjJgCYW4R+XLRur1WHs5g
 Jx0oRTSoxRrJ0Ut3UsQIPpZPUmNDtE3d5Am2yrRfiskPrGpnv94LWFZgVDexi38f
 KQYCbk4VYzfxMIx43AOBbPrK7b4qmSzgALnwVPckoVM/8zUr1/KLDuBwOFb+yukR
 r+hmkg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvvscsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Aug 2025 04:08:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57648Ylc022036
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Aug 2025 04:08:34 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 5 Aug
 2025 21:08:28 -0700
Message-ID: <a5beeff2-ef06-449e-80b5-d0eecdfab8b3@quicinc.com>
Date: Wed, 6 Aug 2025 12:08:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] drm/msm: mdss: Add QCS8300 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-4-dbc17a8b86af@quicinc.com>
 <edsul4zxzcgg2lglxpor5xlzfq35c7r6gmw4o3iermf4z7ftpr@elzstjjft5m4>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <edsul4zxzcgg2lglxpor5xlzfq35c7r6gmw4o3iermf4z7ftpr@elzstjjft5m4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: OjM6xoaC8PExY8OOr3eEu2qcm9lVMW7c
X-Authority-Analysis: v=2.4 cv=GttC+l1C c=1 sm=1 tr=0 ts=6892d542 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=birXr522-b68I-Kh-oYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: OjM6xoaC8PExY8OOr3eEu2qcm9lVMW7c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXzLrPi9a1Ip/l
 bbnG3FX2c4gpn77ZCBdCxhYllGcz6xjPYzYiLkIrRbeqvBX6Etm469jBPEBaU9L2cybo8axjUJk
 o5Vs9mqJdtYRauUACPB4tFcC9DgRJNgms1s5ZY5zBQKMg8V8N7qGWnbMeO03W7RQavWIG4Qffpd
 A/3043ry0+HLLNFq0mRrw+Hnjc4kQmkFB1h8Mz5eUZyyC6o3fHNR3QS78siDZW5AEANth6TZyrc
 SbDsDUVyLw/H3J8olZtbcpxxasVwRomDITQWJ9mpqcjBhv+mV6Gh0sGg67wVv/hURwrcevsshUR
 jFagYrD45fQZRXd36ZsVFjL5y5D80dfTlC+YUXTiAD6ONpExm2sryYYjeTei/9gaRMVHwqg/Pgh
 BWZh4cXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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



On 2025/8/6 11:34, Dmitry Baryshkov wrote:
> On Wed, Aug 06, 2025 at 11:16:48AM +0800, Yongxing Mou wrote:
>> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_mdss.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
> Nit: the order of patches is incorrect, UBWC should come before MDSS. No
> need to resend the series just for the sake of this change.
> 
Thanks  for point that..

