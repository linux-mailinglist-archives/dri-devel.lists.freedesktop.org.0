Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C50AAB58A1
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 17:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306D210E24C;
	Tue, 13 May 2025 15:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IcLS/IgQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162A510E24C;
 Tue, 13 May 2025 15:32:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DDMLCR012669;
 Tue, 13 May 2025 15:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PxNGkPwqf4jFKyBd+vcrwJOzNsytgO6jsGrOuaIb9gw=; b=IcLS/IgQ3br9kThE
 tZany4kbp8qRehTskrCS3dz2Au8p4Je9QiCxlJ/7RICTRiJKvA8YBITCNquTHwAL
 Hg5Dk0GA6lNGl/D1PtvFYxdNsmBouq1U7AeEURVAhtcFmOcKiQ5Fkj5RIrFAEqd3
 YrTfGs2E7ZdGogWcKflXvpgBNT/pr66IVmP23J5jeeAk2VjrhF6++qd5vAYaQfF6
 DsmxLlmbO/yYOR/+rNeChcCo7smCoxffXTJxkzuDDke5hiM0GgEAPRyVXthF7S3O
 pXkMQBzYOqPfD9wfHh2f77TyYLjpgx7qxFpwJv8bSxoHRpEuDD/vQBVUV0/u/mBh
 PLSi0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt989aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 May 2025 15:31:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54DFVTu3006696
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 May 2025 15:31:29 GMT
Received: from [10.216.46.67] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 May
 2025 08:31:23 -0700
Message-ID: <1db93ab7-3974-49a7-8816-a495ed52888f@quicinc.com>
Date: Tue, 13 May 2025 21:01:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250509-a623-gpu-support-v4-0-d4da14600501@quicinc.com>
 <20250509-a623-gpu-support-v4-2-d4da14600501@quicinc.com>
 <24173d3b-272d-4cfd-8519-ad5c9cf7c555@oss.qualcomm.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <24173d3b-272d-4cfd-8519-ad5c9cf7c555@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE0OCBTYWx0ZWRfX4qnxRPIIwT/N
 uqRTXu/TL260pxU5SPjhrztjudmqs4QFhyZezSSivLVupY1YxxXLZGp+4jf6Lr5beNmCylr+yvy
 e6NIrr2BzQ/5kq/AeQfDJHFOc+IfBaHdfGUFk/sdq5gjfawILhmnIyvRKYckyILFqkxWdZmpgHF
 qU8EHPNFkhTrD1LLPBSocQf6lg1fbwTotpqLAT62p6YnTKGdtbMl9fJAgDuJZXHH5+g7i0kXB3b
 85XxY1ala4pqskEVTHDIEyX+bu4kXDqkQ+sVuwFZuDQO/wvD0YjJ/XcT9qfrNuBOo8swRNjH1HF
 7qOwqsxXSoP2Q9mwq/jvMlxIIG3Kqoi00C7bOzzfdbtdfxln6zZ1+3xRcHHrDqIECtP/58KGx9G
 H9L+pQv8gYEw+wCckpbbgOxEQHFO/rJxxCTNAn7ROVuXkuKS7oFLyeRFHLm4QtyoyugMGF/n
X-Proofpoint-ORIG-GUID: 0Rh83Zr8MejUAvZDE7Zt2TGAPBBSHPXD
X-Proofpoint-GUID: 0Rh83Zr8MejUAvZDE7Zt2TGAPBBSHPXD
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=682365e5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=sOY6sp4eF24iVwk-jeYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130148
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

On 5/13/2025 2:18 AM, Konrad Dybcio wrote:
> On 5/9/25 9:21 AM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and gmu nodes for qcs8300 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
> 
> 
>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 91 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 91 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index 40771b062e8d7010dd93d7cc7b3db73cfa16bfdb..1dbccb9a0c75366aa6986b6adb4feb6164ee8845 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -2660,6 +2660,97 @@ serdes0: phy@8909000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		gpu: gpu@3d00000 {
>> +			compatible = "qcom,adreno-623.0", "qcom,adreno";
>> +			reg = <0x0 0x03d00000 0x0 0x40000>,
> 
> I haven't noticed it up until now.. this should be moved up in the file
> to sort the nodes by unit address (the serdes node above is 0x089.., gpu
> is 0x03d..)

Looks like GPUCC block got misplaced too. Will fix.

> 
> Otherwise, please check if there are freq fuses on this platform, if not,
> feel free to add:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks. We have the SKU related data available. We will add those too in
the next revision.

-Akhil
> 
> Konrad
> 

