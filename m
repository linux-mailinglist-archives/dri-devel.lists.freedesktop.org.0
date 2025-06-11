Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D448DAD556D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 14:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5651C10E64A;
	Wed, 11 Jun 2025 12:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gYDy+ZM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A8E10E64A;
 Wed, 11 Jun 2025 12:25:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DDrF023918;
 Wed, 11 Jun 2025 12:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pGAuQJnCZRenSUKeUSJste/qOhgDi8yuC9MgXtEQqHA=; b=gYDy+ZM8lCRyvKb8
 Y927Tqu4+0a16Mf2gDCVxhZfsUWS5YCE0iwHFZy79ojO1v5ENqTp3uLJv/Gb8cHK
 dX+rqJioT+ndWZCbQBq2xZA2324/Uce0Z4PNyFMX29jyvhLAT/I1HMEXodVLEN3x
 c45z59T9GTrijJd3hoWvOLkgnL+gJFkYhozjust+Ql9CRbCYCh2I9jcQEWZ6VXv8
 5c9n+wNGZ+qt0pQ5/QtgvYTR5utTiAlUW1QXEUlJpzM0Ck0zxXDtvCStQDwjduha
 arMy/gPTPJUJOxqkiFXoytpRBain2Z70mRSRHT6/N10L8uzVBYKGUQ27KDnaDYuH
 ALHz4A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tfhvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jun 2025 12:24:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55BCOuWd012122
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jun 2025 12:24:56 GMT
Received: from [10.216.28.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Jun
 2025 05:24:48 -0700
Message-ID: <d482653e-5c0e-4b03-98d6-2c898b445917@quicinc.com>
Date: Wed, 11 Jun 2025 17:54:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
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
 <20250611-x1p-adreno-v2-1-5074907bebbd@oss.qualcomm.com>
 <492417fe-c086-4980-b108-0487bad08155@kernel.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <492417fe-c086-4980-b108-0487bad08155@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 19Wy04pcgBOYQabLMROi2WkoaX8g-IgR
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=68497599 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=snIp_u72ujy8X2fHCcYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 19Wy04pcgBOYQabLMROi2WkoaX8g-IgR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEwNiBTYWx0ZWRfX8/VpQ35K3txV
 0LE/3vFvyiqLM1KGZhDyw53Hlk7CMoEbHrqhh0/DhZeXDc2YvHYAhicvpnujZyStWiy35n5K4rN
 wX+m80mCGjHNIvl0Ry5I0BXYGwz2LJkpBnyDmGlIYSi7/tbFY8dMtk83X/vB6RgHmK5fw+8c0EZ
 1tBW63P14pVPPyK4NJNNqZllRWwtW5xPwNXQmYHRSX51BdA4l+o+AJAbmK+dYX6PkXgilZMY1YD
 97BZ15yjVYz+ddZTvlddufqXy/JvHXCV4meWLqWU0hFePNdgnlmBm6zvH61JLpWiSjEKeuSuerb
 YAp5p1kVZMVHOG5K/h5A8NQ3RXIfacvN3HXqnu0oAnM2Cz9bgn65fbnu+MQSk5laoYL/BJ7jXq1
 iJwZdswf/j6MgVIP9xJSsJ/e2KTjOb7Yy2aXssLnpEXAsVAq6Jf5HNnu93XhdMqpcd+ZfrTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110106
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

On 6/11/2025 4:50 PM, Krzysztof Kozlowski wrote:
> On 11/06/2025 13:15, Akhil P Oommen wrote:
>> Update regex to allow multi-worded OPP entry names.
> 
> Why would we want multi-worded? This needs to be explained here.

I took the new regex from "opp-v2-base.yaml" file, so I thought it was
obvious enough. The requirement is that sometimes Adreno GPU may require
variants of OPP entries with same frequency. As an example, we may want
to vote different peak bandwidths in different SKUs for the same GPU
frequency. So to denote this minor variation, we can add an integer
suffix to the OPP entry name separated by '-'. An example from another
patch in this series:

 opp-666000000-0 {
         opp-hz = /bits/ 64 <666000000>;
         opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
         opp-peak-kBps = <8171875>;
         qcom,opp-acd-level = <0xa82d5ffd>;
         opp-supported-hw = <0xf>;
 };

 /* Only applicable for SKUs which has 666Mhz as Fmax */
 opp-666000000-1 {
         opp-hz = /bits/ 64 <666000000>;
         opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
         opp-peak-kBps = <16500000>;
         qcom,opp-acd-level = <0xa82d5ffd>;
         opp-supported-hw = <0x10>;
 };

I will add this explanation in the commit text in the next revision.

> 
> 
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>> index a27ba7b663d456f964628a91a661b51a684de1be..bba95799919eb52d12afa42354ed909d0ef3c627 100644
>> --- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>> @@ -23,7 +23,7 @@ properties:
>>        const: operating-points-v2-adreno
>>  
>>  patternProperties:
>> -  '^opp-[0-9]+$':
>> +  '^opp(-?[0-9]+)*$':
> 
> Not correct regex. You allow "opp", "opp1" and all other unusual
> variants. Commit does not explain what problem you are solving, so I
> have no clue what you want here, but for sure opp1 is wrong.

Just to confirm, would this be fine for the requirement I mentioned above?

"'^opp(-[0-9]+)*$'"

-Akhil.

> 
> 
> Best regards,
> Krzysztof

