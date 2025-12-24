Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C1CDBC10
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 10:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F098710E22F;
	Wed, 24 Dec 2025 09:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aaOLbJ8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1A910E1BB;
 Wed, 24 Dec 2025 09:09:13 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO2e32d913644; Wed, 24 Dec 2025 09:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c7pjphnT4e/Zd0agRQDQJ9JbAzfx9ojJZd+nQp5/Urw=; b=aaOLbJ8Q4EEjIRT8
 z32yS+fbeHxmHgVwWmnSZtC0zPp/iFx8uftyN6q+OibzhdUMQVLECWc1+hfyRky8
 8wDlSVuYbuujoF4C/8Od67n35uLqqUeTzgb59BPAFVqakvv2LWZP6M4mpetIIU7J
 niEkogMu2jE4+4mfk4/iT1KllUgzUtEZBBdx7OnSbv3cLnc4XhidBKL/zCi3RVlB
 bsCZASlbRUqhb3f2g7W/4vEUaOYPsMlMEvWHC+8iNlt4X/OzJyN3Xyz+OK23EGu0
 Fp90718BaHSmLN/9qzrSFCwtuTS3Hin6lWkY/f57/PqKJCEiWNd4qRXU3qXkuIfp
 wwWHtA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2jqub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Dec 2025 09:09:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BO98wo0012387
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Dec 2025 09:08:58 GMT
Received: from [10.206.97.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 24 Dec
 2025 01:08:51 -0800
Message-ID: <9e449e77-5445-4aec-a89a-835d98242876@quicinc.com>
Date: Wed, 24 Dec 2025 14:38:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: display: msm-dsi-phy-7nm: document
 the QCS8300 DSI PHY
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <marijn.suijten@somainline.org>,
 <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonathan@marek.ca>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-2-quic_amakhija@quicinc.com>
 <20251125-mauve-tamarin-of-education-c94bfb@kuoka>
 <bfuds7xrlgril2r2y3hysmvrboobietm5garm5q6t4gy36jvuq@qyosxqib3nv3>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <bfuds7xrlgril2r2y3hysmvrboobietm5garm5q6t4gy36jvuq@qyosxqib3nv3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfXzlFvJAn9ezeZ
 7aolP5pg8MY+7taJQ1ungLK2VvXlMF+jIE9FUptzSxzcOJ+MYtK+bXkx44ldjbh8RzM/uziAk8E
 W15g9rpeuCJH+eLtyMESzGGS7XuQYjoHQCaIHlTsH6471xWks/n28cmLOkx83Bis67xEHCcq52W
 wC/JjrBIFT2dn6IKGLNBbfCs8aQQAOrk59EBjSghQr7NBx/vkzvTW7NC6UegKlV00CogR7XIJyP
 Ld53S8jQC2+DEk2jPyJt+6nstjlgmnuXbXLzEDV+lnCq5zV42MwCI39Ct2zUOz9rlOhgaDpoV4r
 WVhhbWnLvjejVZbT/cEk6pcnkyIoAM6nUXm/cJStAictOZbu/5+ZIO65ipsWPVsiSrX5lUJfWYA
 JftZgwPUCka47L4c+2kssGWMtipHxgGRnkV7xgDTvbaZD0GATb3euAKEKozQjgWgKqhTp3hPc44
 xQ3XAjVvGyb/xBqql8Q==
X-Proofpoint-GUID: apC0m7P821iwOqht8RqiSZOpPjmSA4AN
X-Proofpoint-ORIG-GUID: apC0m7P821iwOqht8RqiSZOpPjmSA4AN
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694badac cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=YLxF30ALFz6TGyIxud8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240078
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

On 12/24/2025 12:06 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 10:31:42AM +0100, Krzysztof Kozlowski wrote:
>> On Tue, Nov 25, 2025 at 07:02:58AM +0530, Ayushi Makhija wrote:
>>> Document the DSI PHY on the QCS8300 Platform.
>>
>> Explain the hardware, so your diff would be justified. Instead of
>> stating obvious or copying the subject, say something useful. Why this
>> is compatible with different platforms?
> 
> Ayushi, any updates?
> 

Hi Dmitry, new patches for the series are ready, will upload them in sometime.

Thanks,
Ayushi

