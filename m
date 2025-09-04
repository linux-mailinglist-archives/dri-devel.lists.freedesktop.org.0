Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81462B436DE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 11:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9D510E9CA;
	Thu,  4 Sep 2025 09:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="l/96Upit";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7788C10E07A;
 Thu,  4 Sep 2025 09:18:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5841mNP9004991;
 Thu, 4 Sep 2025 09:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 baoKJWLvfk5vZCL5Lo+mCicXEHDPlRdfFPrnWUAdlV8=; b=l/96UpitUBFhZyhu
 aw9nTg3a5tN8qH0YwcQHjKZu5AuvtFHioKyDDbBu6kHMWP18sLliM6/cajbslDOH
 Ink3RWSKdSKo9vqF3QJiFWxrj29Xf54Iy/+UiUGIKa9WyVfHbcCQef0oYha2kMol
 L9j1YStjZdTam9QURNCR80scnOaGabMkb3E2JK5LMG5q1Os1BB25/phFBn57mQh2
 WolMINnCW7vP2jERgYWQZ/QDyexRgsYK+BmvKrvDXF4AjIB1MW6McV9VGQU5+yqT
 54i3dL5GWPks4Fro2tjJmKQvZezB+pQvICG12XQZG4MwJ4mAdlrYa/YxlvqSqlZy
 4LpohA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s70h7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 09:18:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5849Ioqj027240
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 4 Sep 2025 09:18:50 GMT
Received: from [10.217.199.111] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 4 Sep
 2025 02:18:43 -0700
Message-ID: <2735afb0-96ba-4efb-818d-0a7b342b7145@quicinc.com>
Date: Thu, 4 Sep 2025 14:48:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: lemans: Add GPU cooling
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Akhil P Oommen
 <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-4-97d26bb2144e@oss.qualcomm.com>
 <4ac0ff3d-38db-44cc-9e36-44f9e819e96d@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <quic_gkohli@quicinc.com>
In-Reply-To: <4ac0ff3d-38db-44cc-9e36-44f9e819e96d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX5EQpLzs7wFrs
 cC5KQJ/Qgxtm76RRZlGCjb7joFFWqqziKCj97/71EtxV6YEvyO4/fflEM3ezJ6fuUoZdDn+scDV
 dZ7EMTKicO27xWqtZ/4PSv297cVonRUL/gacBiT3JrCtn/8p7XlKkIlLOSZzvxwGz3h7mr7g3br
 Ft+XyX7KcMtsYS+hf1JjfELonjGEVAEv/sqDCpnM6kBtIDijuMjQOtQKH2CgTrq6aS5he0D3jtx
 MhGeU0uav+igxOMnY8CZKSBq0PrIWXooInxpBbVILGLUSgW/4+skPn2xSFoq1P0i4iQu0pSnqmu
 L06t4ZiGIFVi7+5oVMUJT32X8oZ0rBxoTx75a4kDupgtBu44m4om8qSwaI6zZ3VC3F6RxKORmI5
 kItkk8dC
X-Proofpoint-GUID: r3AiJCyyTwPoA44C1DZF2D46RO5W0qtj
X-Proofpoint-ORIG-GUID: r3AiJCyyTwPoA44C1DZF2D46RO5W0qtj
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b9597b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Tnv4r2qD--CattBqy9UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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



On 9/3/2025 5:48 PM, Konrad Dybcio wrote:
> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>> From: Gaurav Kohli <quic_gkohli@quicinc.com>
>>
>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>> reaches high temperatures.
>>
>> Set up GPU cooling by throttling the GPU speed
>> when reaching 105°C.
>>
>> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/lemans.dtsi | 67 +++++++++++++++++++++++++++++-------
>>   1 file changed, 55 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 8eac8d4719db9230105ad93ac22287850b6b007c..b5d4d07b2fd9c14a6f1cc462c695e864394cade2 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -20,6 +20,7 @@
>>   #include <dt-bindings/power/qcom,rpmhpd.h>
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/thermal/thermal.h>
>>   
>>   / {
>>   	interrupt-parent = <&intc>;
>> @@ -6816,13 +6817,20 @@ trip-point1 {
>>   			};
>>   		};
>>   
>> -		gpuss-0-thermal {
>> +		gpuss0_thermal: gpuss-0-thermal {
> 
> You don't need labels for the thermal zones, just the trip points below

Sure, will update.

> 
> Konrad
> 

