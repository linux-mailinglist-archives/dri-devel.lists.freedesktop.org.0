Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB56A87CC4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1C710E547;
	Mon, 14 Apr 2025 10:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bl2kTNjO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D151010E541;
 Mon, 14 Apr 2025 10:04:05 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99mCR028993;
 Mon, 14 Apr 2025 10:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cRPLfy2uJJmtyi5JccFjWXd9aKPL46uk82fq4phKWro=; b=bl2kTNjO3qn75rEB
 f6Qvzz37v0xwPZhACqPCzw59OKE9nUPu6mUsHZyZ/D8acRvSehhhS9w+FFJRxjuS
 iGdrtrpmY6XZ8E0r4Vy+sDhoc5kac+ba/PQHv3lWZuk1ukHVTjXxh00YxvOIDZYR
 DrN8Bs01mY6MaS9KdpAfV5WtHVi5kbY2sxrUiZv8SODW6oN7IzXXwMwiuarRueZC
 12cCMDZPQetVGcCakYSlu0QxLsrjt5ax1wWHHLCsAZORjzoSE+2bLgnXV5zkP26y
 IUHP4ZAWB4b5Ll3YF/BaPrCRTtnxRsKD4M4JRdFwY75XH/gbfBuCeQvixfSbR5JZ
 LqhmdA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1462a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Apr 2025 10:03:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53EA3r8J017866
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Apr 2025 10:03:53 GMT
Received: from [10.204.66.137] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 03:03:46 -0700
Message-ID: <e65414bf-acd6-4e47-bbab-d47e0ff81651@quicinc.com>
Date: Mon, 14 Apr 2025 15:33:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <andersson@kernel.org>,
 <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <konradybcio@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
 <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250311122445.3597100-4-quic_amakhija@quicinc.com>
 <20250312-calm-steadfast-cricket-fe9dd8@krzk-bin>
 <654d409e-2325-46e7-a064-ed9e64277e69@quicinc.com>
 <a168a473-c363-4041-8e3e-84fa44e92b10@kernel.org>
 <zpmr6cpiixyu2sj7r7oqpqsge6dcqw6xszldf7ugznmcrxqsme@efiwnggcn5qx>
 <a654d62e-502a-4a47-96c4-a44c14860e54@kernel.org>
 <767e11cd-e338-4e00-a8e7-2e15f3da84b4@oss.qualcomm.com>
 <04d90c1b-1b73-4b6a-b7fc-351754fbb16b@kernel.org>
 <bcc44dcc-8b8a-427a-9a38-8dc6d59c13e3@oss.qualcomm.com>
 <bfab7272-5a41-4072-82a8-0f7401b2affc@kernel.org>
 <vw4qkj6wtets6dx4irslusnyz2oztjljymzzcmomqxlcphxnvd@gpxrdgzhu5xu>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <vw4qkj6wtets6dx4irslusnyz2oztjljymzzcmomqxlcphxnvd@gpxrdgzhu5xu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fcdd8a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=5Xq4O0xs5KunBNiUOD0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZtTx-SX1Ic77Jw0-I654mLR5wxWoP_xL
X-Proofpoint-ORIG-GUID: ZtTx-SX1Ic77Jw0-I654mLR5wxWoP_xL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140072
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

Hi Krzysztof/Dmitry,

On 4/10/2025 2:46 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 10, 2025 at 08:08:17AM +0200, Krzysztof Kozlowski wrote:
>> On 09/04/2025 17:24, Dmitry Baryshkov wrote:
>>> On 09/04/2025 09:07, Krzysztof Kozlowski wrote:
>>>> On 08/04/2025 22:26, Dmitry Baryshkov wrote:
>>>>>>>>>>> +          - const: qcom,sa8775p-dsi-ctrl
>>>>>>>>>>> +          - const: qcom,mdss-dsi-ctrl
>>>>>>>>>>
>>>>>>>>>> Drop fallback
>>>>>>>>>>
>>>>>>>>>    
>>>>>>>>> Hi Krzysztof,
>>>>>>>>>
>>>>>>>>> I couldn't understand the meaning of "Drop fallback", could please elaborate it ?
>>>>>>>> Look at SM8750 example on the lists. Keep only front compatible.
>>>>>>>
>>>>>>> Why?
>>>>>>
>>>>>> To make things simpler and shorter.
>>>>>
>>>>> I'd prefer consistency. Previous platforms use qcom,mdss-dsi-ctrl.
>>>> Then you should have objected month(s) ago when Rob asked for dropping
>>>> fallback and since then we consistently drop it.
>>>
>>> Well... It's still not merged. is it?
>>> For SM8750 it kinda makes sense, because the clock handling is different 
>>> from all other current platforms. For the existing devices... I'm not 
>>> that sure.
>> How does it differ? The clock handling does not matter - this is just
>> select of schema for the child node.
> 
> Ah.... I'm sorry, I misinterpreted the email. Yes, having only a single
> compat here is perfectly fine. Please excuse me for the confusion.
> 

Thanks, for the review.

I will write single compatible string. Will update it in next patchset.

+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sa8775p-dsi-ctrl
+

Thanks,
Ayushi



