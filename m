Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E3CAD5575
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 14:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C6410E38A;
	Wed, 11 Jun 2025 12:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CQj851vI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B5310E38A;
 Wed, 11 Jun 2025 12:25:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DENR027189;
 Wed, 11 Jun 2025 12:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c6dng+NmjwGmVNZ97SvTt6nnPTfoc7CDndqawYoKecA=; b=CQj851vItCeJ03gE
 a+LrhLjw8M44GfdyTI08L7ooHeA3i1o8mMejPbmKqh7bNtbgFCHph4xuHNjrT8yY
 9//tXwnTuzDn+rO15eKB+60jm9Xrw94ZnxDfvBcv3Zm0NWQTh6hVwMzowGEbaseJ
 ijG7yoGbu5eEtUwAk6eqqWuybWy4wlCcnooIe8wurJ1JOn0ZNHSZaodDNPLOdv0G
 9ySLaR99hgeZURErgkDfpt5DVlZacxsDHPs2kPwQ+dTNmtsMuqGr8tLlvro6t7jT
 dq2/ratIa/jh+yYVDxXXO2W30bQROVDALYpi9qKp9Rcd2T5Av+IsNYBgNB8NnWwO
 Vg8ZWg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvcuk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jun 2025 12:25:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55BCPglG005497
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jun 2025 12:25:42 GMT
Received: from [10.216.28.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Jun
 2025 05:25:33 -0700
Message-ID: <c1008a6c-6aa6-4e42-8d76-9aeaa708d41a@quicinc.com>
Date: Wed, 11 Jun 2025 17:55:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add GPU support to X1P42100 SoC
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
 <20250611-x1p-adreno-v2-4-5074907bebbd@oss.qualcomm.com>
 <1ee554e4-d813-47cd-a1ab-9eaa4634cdb1@kernel.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <1ee554e4-d813-47cd-a1ab-9eaa4634cdb1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LJFgD0crCd2XFLk2fVs6HasaeizgOAS6
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684975c7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=tElcPi6GYvQhG-JPmBIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LJFgD0crCd2XFLk2fVs6HasaeizgOAS6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEwNiBTYWx0ZWRfX8c8v5ENXGd05
 UTomTWW1atRegb5wiad2v98e5LBy4Wht46THwUBBrcQqWsRfCcq/z1wzPLpIvlhT2FfEOe/x6ix
 qBOBVtZmYNPlKIJRBQSffKhlviQBRoegsF8ljM4Dij2DYukxJuxOM2gofQiiRxPMetD1C+7Llkn
 GIib4wF5G6QOpAYXGhMFaJEJJ1DptOahLaopR0Y2uaPFL2A5bDLOz0D6aZ90CqQv9LiV9Hx/xUO
 gX4hCzz1ZRcH1zggEVd7sbS6cwXCNupW4XboWeW2aw44S/ZntGKYXCNz/fRQC+KrPy5casNToPr
 PzC2shXdzflleQX5aeCsqtt4xyWZAuiITaJxVC/BAVF2EnuuX5zgjq9kLYn1zHKAKre7W2v/cpj
 OlYWmt3J05HiAgPm+ZU/vykHRjPI39DmA27GWmZrpPSMyUoTZA549Mw9TyuEzIHOuiD5vChh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
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

On 6/11/2025 4:52 PM, Krzysztof Kozlowski wrote:
> On 11/06/2025 13:15, Akhil P Oommen wrote:
>> +		opp-280000000 {
>> +			opp-hz = /bits/ 64 <280000000>;
>> +			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>> +			opp-peak-kBps = <2136719>;
>> +			qcom,opp-acd-level = <0xc82f5ffd>;
>> +			opp-supported-hw = <0x1f>;
>> +		};
>> +	};
>> +
>>  };
>>  
>>  &gpucc {
>> @@ -41,6 +150,13 @@ &pcie6a_phy {
>>  	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
>>  };
>>  
>> +&qfprom {
>> +	gpu_speed_bin: gpu_speed_bin@119 {
> 
> No underscores. You need to align downstream code to upstream. See
> coding style.

Ack.

-Akhil

> 
> 
> 
> Best regards,
> Krzysztof

