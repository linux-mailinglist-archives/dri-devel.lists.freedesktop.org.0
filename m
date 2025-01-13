Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43B5A0B2BF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1854B10E5E2;
	Mon, 13 Jan 2025 09:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="O1dn8fNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36AD10E5DF;
 Mon, 13 Jan 2025 09:27:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D6glEL024409;
 Mon, 13 Jan 2025 09:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MOfjFAH+CybZ33SMwzfNlmQyC6CmVOKixDLWbRV01BM=; b=O1dn8fNAabIUgm/j
 3BKm3WVSMnTh8LSexcu482RLtmKRfjcX2yK8sjt8q42vfX2+VXSRqG7xFdhKQVaa
 artSSdfyh6Gj+qf21EcNSQAhLTnC40CAxedR5HFvby7u1Lyt0+TXaYbCoZOEW5e5
 UT50Ggril+HHlopK9d5ivvzrz6h535htRps9WdtXoZHukccPtd5yow2efJ67H4j7
 nyA1dkF3C0P6YC9XgjWIzgOsH4HjKPiC5uBZ5/P43vTTRZNc2EdmIZ/BWu8NuC/i
 h08Dfgg5OScI6Lw4grVeS6tDMW9pcNODeNc5z4emleqhAYZI+MYX2bXu0b9FkaHv
 ZZXj7w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444wt4rd06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 09:27:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D9R57H029576
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 09:27:05 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 01:26:59 -0800
Message-ID: <9a87724c-1906-4a9b-bf01-e603b310e47a@quicinc.com>
Date: Mon, 13 Jan 2025 17:26:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Display enablement changes for Qualcomm QCS8300
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, "Kishon Vijay
 Abraham I" <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
 <qsq5so5i7fy3r7xcjtcr7aq2vtbywh57j3b3e7ddbsmmeu5qwy@pgcntgxknuul>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <qsq5so5i7fy3r7xcjtcr7aq2vtbywh57j3b3e7ddbsmmeu5qwy@pgcntgxknuul>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FZvTmcrhQQEHUT1SOKIGh2bA7JiNFdyI
X-Proofpoint-GUID: FZvTmcrhQQEHUT1SOKIGh2bA7JiNFdyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130080
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



On 2025/1/13 17:02, Dmitry Baryshkov wrote:
> On Mon, Jan 13, 2025 at 04:03:07PM +0800, Yongxing Mou wrote:
>> This series introduces support to enable the Mobile Display Subsystem (MDSS)
>> , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
>> QCS8300 target. It includes the addition of the hardware catalog, compatible
>> string, and their YAML bindings.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>> Changes in v3:Fixed review comments from Krzysztof, Dmitry.
>> - Fix the missing space issue in commit message.[Krzysztof]
>> - Separate the patch for the phy from this series.[Dmitry]
>> - Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
>> - Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com
>>
>> Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
>> - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
>> - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
>> - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
>> - Correct formatting errors and remove unnecessary status in MDSS
>>    bindings.[Krzysztof]
>> - Add the the necessary information in MDSS changes commit msg.[Dmitry]
>> - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
>>    20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
>> - Package the DisplayPort controller and eDP PHY bindings document to
>>    this patch series.
>> - Collecting MDSS changes reviewd-by Dmitry.
>> - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
>> - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
>> - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
>> ~
>>
>> ---
>> Yongxing Mou (4):
>>        dt-bindings: display/msm: Document the DPU for QCS8300
>>        dt-bindings: display: msm: dp-controller: document QCS8300 compatible
>>        dt-bindings: display/msm: Document MDSS on QCS8300
> 
> Is there any reason for not using a common style for these three
> commits?
> 
Hi，actually, for the dp-controller.yamel file, I just noticed that the 
previous platforms added the dt-binding files using this format. So, I 
followed their format to write the commit message. Such as dt-bindings 
for sm8650/sm8150/sm8250...
>>        drm/msm: mdss: Add QCS8300 support
>>
>>   .../bindings/display/msm/dp-controller.yaml        |   4 +
>>   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
>>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  13 +-
>>   drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
>>   4 files changed, 268 insertions(+), 4 deletions(-)
>> ---
>> base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
>> change-id: 20241224-mdssdt_qcs8300-11b7883dc60b
>>
>> Best regards,
>> -- 
>> Yongxing Mou <quic_yongmou@quicinc.com>
>>
> 

