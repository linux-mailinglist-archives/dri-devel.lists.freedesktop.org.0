Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D79EAD558B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 14:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A452010E651;
	Wed, 11 Jun 2025 12:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="m4QutV/x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB97410E650;
 Wed, 11 Jun 2025 12:29:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEBG029570;
 Wed, 11 Jun 2025 12:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lceMfIGYuCPCZ+W3coEkS0Ut+HidNJnVCjzT2QYpkyc=; b=m4QutV/xaKTpKISA
 NOwmIrj73dsc3KE2A3orL22BZtxj66vP/LhJHNPXNSDxoCBhsfUWXRfqcHZmXJxc
 NSHBVV5/ciMSesHHPlF2yiIhkZx5hZvwX1I6WB6Mm2SUA6b3iziXEM+X2Jz7XuNN
 CxdkVsuTWXNq1SJ23PZHm7OSh12YcYZ4k5RipN/vzXCm9SttyJ9yG2hO2HrkBg0L
 qrZ+YAZrIr+6OGdRfDjaoqfQtpf7TnQ70o+gaRmnzH0XbU2Z4UMwUji23leDIVTT
 TjGdWt0RdRgmHmqHfu8I9L1VOw/66MAGtlhrov+yOeopM8mFUnSl2k+LDIwdI1lV
 YciKMQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d124y0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jun 2025 12:29:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55BCT1Xi020022
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jun 2025 12:29:01 GMT
Received: from [10.216.28.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Jun
 2025 05:28:52 -0700
Message-ID: <80dae86f-fb3b-4469-9322-7996811d33cc@quicinc.com>
Date: Wed, 11 Jun 2025 17:58:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: defconfig: Enable X1P42100_GPUCC driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Akhil P Oommen
 <akhilpo@oss.qualcomm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry
 Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth
 Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-pm@vger.kernel.org>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <20250611-x1p-adreno-v2-2-5074907bebbd@oss.qualcomm.com>
 <810f7614-ed73-471e-bc5b-3305816737da@kernel.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <810f7614-ed73-471e-bc5b-3305816737da@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xvORiqpGvBtv2J1sNLJ6NcrW_sSxcy2e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEwNyBTYWx0ZWRfX6S74eAHxepUr
 DKO7C/ah9ofD43oLGaXM/WDQTt6dBTT4+CthKexuMHKsaRmv+IxRMl4kNygf9T8BldHdFVztYRl
 XXWC2i9tmGleOrLnFh3oa/tLlFquN0K3KZ/XhM0rXUdf08GskL+L0+xQQoEAmHgTEIJIx8snut7
 Wos9ulCOCB2QReriLLbHz3jFAlCYtRRnNv4NmLjSBz4NYR6oOmyKVsdn2NCQeq4JSvpN8s8z1Fi
 ZpQELKsNK48FQvo338aE6WMnvNPsDzOkVqI/4MW3aghAAxUV/zU5KL8qPJuVe4KKQ1RIS9D4m4u
 nILZ+yvWO5kNiUXjSaaM/NvFFtA68BY5b9X1VhhI5BUhJbq/DKBe/yVJXi/ztW7LLy+iHFF1e6y
 Je67yY3fTdTwLBzAbT8skLYeVbZbMlG7HLYeVgq1N4G3CiODf+86ULL4PnbVGNsHDz4b/SAo
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684976a4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=cSTdfOdMco8EzcehTqUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xvORiqpGvBtv2J1sNLJ6NcrW_sSxcy2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110107
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

On 6/11/2025 4:55 PM, Krzysztof Kozlowski wrote:
> On 11/06/2025 13:15, Akhil P Oommen wrote:
>> In order to enable GPU support in Snapdragon X1P42100
>> (8 CPU core version found on Asus Zenbook A14 and other
> 
> There is no A14 upstream board DTS in next. Your commit msg should
> provide rationale for this, e.g. which upstream boards use this driver.
> 

Will replace "Asus Zenbook" with "X1P42100 CRD" which is supported upstream.

-Akhil.

> Best regards,
> Krzysztof

