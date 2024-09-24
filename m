Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5AD983F37
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635B510E553;
	Tue, 24 Sep 2024 07:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="i6sqpHLC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B4E10E52E;
 Tue, 24 Sep 2024 07:36:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NLbhQQ013399;
 Tue, 24 Sep 2024 07:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3vSl8/tgumwzTtSU/+cJb/78OCp9SfqkuKQi/5ue410=; b=i6sqpHLCveY8H+pM
 kac5GCuDufohWTSIJ4EqKez9LOx1WNrvt6uvvzRj8Koa8ljkpvsQGxeueDJFkZ9D
 eL+Ku6Kq2PxyOP6eCGgDRZT4ZnuYpU8myKfUklbwmh0w1ZSE0NySuyaAPGnV/XCc
 epu30g8XkEbRb6dV8iLyDe/muMsd9YDSPmSgCBXgfrpK2UYoPaCvuHt8Ikk2/VgS
 OqI2XFjD2QDG5hPMD9xFASmrlyrOeGHZGZruAGSbcKz5rzbUgcmjplsD1ck4LLAP
 ciL+VCKrUfgn/d0UgAAQohBrWt8uzEBrtgUTSO9RKDRN4j/wKheg/Z4PqS+qjhah
 Hy9/yQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spc2qdrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 07:36:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O7aChu013627
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 07:36:12 GMT
Received: from [10.204.67.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 00:36:03 -0700
Message-ID: <a09e0bb8-5de9-4633-ab0f-161ec5800346@quicinc.com>
Date: Tue, 24 Sep 2024 13:06:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sa8775p: add display dt nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <swboyd@chromium.org>,
 <konrad.dybcio@linaro.org>, <danila@jiaxyga.com>,
 <bigfoot@classfun.cn>, <neil.armstrong@linaro.org>,
 <mailingradian@gmail.com>, <quic_jesszhan@quicinc.com>,
 <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <quic_kalyant@quicinc.com>, <quic_jmadiset@quicinc.com>,
 <quic_vpolimer@quicinc.com>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-6-quic_mahap@quicinc.com>
 <kxxcjrqndc2qzmexn4mm4vmfugfo23y63aa6oyia3uiwpe3arr@sbvdni2f2hq2>
From: Mahadevan P <quic_mahap@quicinc.com>
In-Reply-To: <kxxcjrqndc2qzmexn4mm4vmfugfo23y63aa6oyia3uiwpe3arr@sbvdni2f2hq2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jSNZQzWRDhpysE3fnS0fNyt0MRWttfnT
X-Proofpoint-ORIG-GUID: jSNZQzWRDhpysE3fnS0fNyt0MRWttfnT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240051
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


On 9/12/2024 1:30 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 12, 2024 at 12:44:37PM GMT, Mahadevan wrote:
>> Add mdss and mdp DT nodes for SA8775P.
>>
>> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 85 +++++++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 67ba124d20f8..d5d8e02fdb29 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -6,6 +6,7 @@
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>>   #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>> @@ -2937,6 +2938,90 @@ camcc: clock-controller@ade0000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		mdss0: display-subsystem@ae00000 {
> Is there going to be mdss1?


Currently we don't have plan to enable mdss1. Do we need to rename label 
to just "mdss" in that case?


>
>> +			compatible = "qcom,sa8775p-mdss";
>> +			reg = <0x0 0x0ae00000 0x0 0x1000>;
>> +			reg-names = "mdss";
>> +
>> +			/* same path used twice */
>> +			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
>> +					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "mdp0-mem",
>> +					     "mdp1-mem",
>> +					     "cpu-cfg";
>> +
>> +			power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
>> +
>> +			clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
>> +				 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
>> +
>> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <1>;
>> +
>> +			iommus = <&apps_smmu 0x1000 0x402>;
>> +
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>> +			status = "disabled";
>> +
>> +			mdss0_mdp: display-controller@ae01000 {
>> +				compatible = "qcom,sa8775p-dpu";
>> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
>> +				      <0x0 0x0aeb0000 0x0 0x2008>;
>> +				reg-names = "mdp", "vbif";
>> +
>> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>> +					<&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +					<&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
>> +					<&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
>> +					<&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> Wrong indentation


Sure will correct.


>
>> +				clock-names = "bus",
>> +					      "iface",
>> +					      "lut",
>> +					      "core",
>> +					      "vsync";
>> +
>> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
>> +				assigned-clock-rates = <19200000>;
>> +
>> +				operating-points-v2 = <&mdss0_mdp_opp_table>;
>> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +
>> +				interrupt-parent = <&mdss0>;
>> +				interrupts = <0>;
>> +
>> +				mdss0_mdp_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-375000000 {
>> +						opp-hz = /bits/ 64 <375000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +
>> +					opp-500000000 {
>> +						opp-hz = /bits/ 64 <500000000>;
>> +						required-opps = <&rpmhpd_opp_nom>;
>> +					};
>> +
>> +					opp-575000000 {
>> +						opp-hz = /bits/ 64 <575000000>;
>> +						required-opps = <&rpmhpd_opp_turbo>;
>> +					};
>> +
>> +					opp-650000000 {
>> +						opp-hz = /bits/ 64 <650000000>;
>> +						required-opps = <&rpmhpd_opp_turbo_l1>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>>   		dispcc0: clock-controller@af00000 {
>>   			compatible = "qcom,sa8775p-dispcc0";
>>   			reg = <0x0 0x0af00000 0x0 0x20000>;
>> -- 
>> 2.34.1
>>
