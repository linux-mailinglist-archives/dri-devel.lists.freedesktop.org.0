Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8F4AAC38A
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 14:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519928911F;
	Tue,  6 May 2025 12:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YyTlYYaa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120B110E66F;
 Tue,  6 May 2025 12:13:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54695gtl007469;
 Tue, 6 May 2025 12:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g+8ErY9oHQMlQMEnCRYn1BQv+DISlwRBCfGqrDlnd+s=; b=YyTlYYaaARdxifdJ
 86gqUytYI/7Q+xkYSlqDwSrn5sOqNBOge1qhuYKiXucHKVW2h/hWZXmVSrqmYCsA
 DX6k/ON+ByKSpg8t+vcpNlTdtfIJukBzOVhRZnZJmj7Kyi+2K0eFrJwbpM6YKCIT
 duPlSffrNiinm/1WqF9ZLFpMvKqKkEVAK3UPUNXj7Q1KnUMKoyhDTsLuB8NGPVuF
 +fDZykNCnaMeAbc9rb9HT2svIZMwN0o20TLSRGTD9Cnbnudirj054u3qwOh0Jgcm
 HRQg9hGel40SsF0iPu+gzjP4wxYH6x3W1gYKu7AINL2DiZTDKfGfsbM9faSlV3I5
 v1tdMQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg25da-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 May 2025 12:13:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546CCxEs002722
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 May 2025 12:12:59 GMT
Received: from [10.204.66.29] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 05:12:53 -0700
Message-ID: <88b139c4-0a35-4c9e-9993-573fede29b71@quicinc.com>
Date: Tue, 6 May 2025 17:42:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <marijn.suijten@somainline.org>,
 <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
 <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
 <20250505094245.2660750-3-quic_amakhija@quicinc.com>
 <grwlmrgi5cfv3jtuki57ug7gsqykpwdf2to2l7di6glfxtb7vz@6id6cpfkrbuh>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <grwlmrgi5cfv3jtuki57ug7gsqykpwdf2to2l7di6glfxtb7vz@6id6cpfkrbuh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: G1KgRhxzS8wGVuQOxOuy73P-KLg8HOge
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExNyBTYWx0ZWRfX6DTOTWhNQiUz
 vgbkH0f/GaPe1RAjRB75eI/YgIIB3lBSA+nkS3ri13WLyxh23kPK8KLWiMqzzAnOGJbSOtDn1nG
 zh5M2oM9OndoYb6SxefuqY3QwKoJIJplF9p2yRNYSMwqtJp9pXP9AyV8hYn1s+t2ak+bXAMjuDt
 hrtDJ97NC7LcBLKtVuvIziQG2joTxJyKzYnlbPbgkzMwpEEmCFz3H7lLYmSy/qqV7t7Ye/n6gJ6
 xZsYrzgytNGjguyHfOKc3Ugs/qPOJpxgXtJZrEZx//SunPZQ7xgrsjSKiqjZojA4ntvfpTrMzIS
 pBGtydxGcB5uppluLmVZAlHyyJyc5Q/66VcmdTGcCUBjFoHDXoB8SRDBZmXi2/x/C2rboADvM31
 0YsPgokQ/0eTc/mVjmTNb/Xi7kckczQWomGOwzfbYiptQDCm5jzckuDhHeq6ZRJ5cbRVcjgN
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=6819fccd cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=lEiHe2e3eBi0j0Qs8ccA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: G1KgRhxzS8wGVuQOxOuy73P-KLg8HOge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060117
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

Hi Dmitry,

On 5/5/2025 3:32 PM, Dmitry Baryshkov wrote:
> On Mon, May 05, 2025 at 03:12:41PM +0530, Ayushi Makhija wrote:
>> Add anx7625 DSI to DP bridge device nodes.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 183 +++++++++++++++++++++
>>  1 file changed, 183 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> index 175f8b1e3b2d..de14f3ea8835 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> @@ -28,6 +28,15 @@ chosen {
>>  		stdout-path = "serial0:115200n8";
>>  	};
>>  
>> +	vph_pwr: vph-pwr-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vph_pwr";
>> +		regulator-min-microvolt = <12000000>;
>> +		regulator-max-microvolt = <12000000>;
> 
> 12 V, if my eyes don't deceive me.

Yes, it's 12V. According to the chipset's power grid, the VPH rail is rated at 12 volts.
That's significantly higher than what we typically see on mobile platforms. I guess,
this is due to the SA8775P Ride SX being designed for automotive applications, where higher voltage levels are required.

> 
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
> 
> [...]
> 
>> +
>> +			bridge@58 {
>> +				compatible = "analogix,anx7625";
>> +				reg = <0x58>;
>> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
>> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
>> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
>> +				vdd10-supply = <&vph_pwr>;
>> +				vdd18-supply = <&vph_pwr>;
>> +				vdd33-supply = <&vph_pwr>;
> 
> Here you are saying that 1.0V, 1.8V and 3.3V pins are powered on by 12V
> supply. I wonder how the board doesn't trigger all fire alarms in the
> building.
> 

Let me try to explain the connections from the schematics.

In the SA8775P RIDE SX platform, the ANX bridge supplies are connected from the below sources:

1) AVDD1P8 is sourced from the `VREG_1P8` of the backplane card.
2) AVDD3P0 is sourced from the `VREG_3P0` of the backplane card.
3) AVDD1P0 is sourced from the TPS74801 LDO voltage regulator that has `VREG_1P8` connected to
   VIN & EN lines, and `VREG_3P0` connected to BIAS line.
 
The `VREG_1P8` is sourced from a buck converter TPS54618CQRTERQ1 that is using 
`VREG_5P0` as VIN and EN_VR1P8_M3P3 as EN signal. 
Where the `EN_VR1P8_M3P3` is an output signal from SAK-TC397XX-256F300S BD micro-controller.
 
Similarly, the `VREG_1P3` and `VREG_5P0` are sourced from another buck converter LM5143QRWGRQ1
that is using `VREG_12P0` as VIN and `EN_VR5P0_M3P3` as EN signal.
Where the EN_VR5P0_M3P3 is an output from the same micro-controller.
 
Combining above details, all three ANX bridge supplies are getting enabled by `VREG_12P0` supply,
`EN_VR1P8_M3P3` and `EN_VR5P0_M3P3` signals once the SOC is out of reset.
 
The `VREG_12P0` is directly sourced from `VBATT_IN`.
 
Since, there is no SW control for ANX bridge supplies and they are getting enabled
once the SOC is out of reset, I have used vph-pwr-regulator dummy regulator.
I am not sure if it's the right way to handle above scenario. Please let me know if there is other way to do the same.

Thanks,
Ayushi

>> +
> 

