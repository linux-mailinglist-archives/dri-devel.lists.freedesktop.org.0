Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C419DA329
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 08:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F3110EA11;
	Wed, 27 Nov 2024 07:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LJRdxrW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D5810EA05;
 Wed, 27 Nov 2024 07:36:08 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR64kee000834;
 Wed, 27 Nov 2024 07:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9SZE/ngSUWY+MFsrhLtZzarpm0W1+Jk37klDRXno5kc=; b=LJRdxrW7Q8uszm6o
 p8vN7FZZsXz3LEumLNi2CwbQDsouSTeo9ArKnYXv3N1iZW+N/C32PZkUbNHdraDL
 87NoFtlr3g0BUaXjXgXsnZOAvjdrmeWX6QpE+5W/K+75s8Fb2iEUrXZulwjPped0
 Brmrw5rDPos03+eRtfnix95OvztwR1FmU0Y4qkWwzrArfa2dmAR+y6wgRepUlkge
 V49luQc1mSJaE2L8qviMuzLntsfRPy+xDG69IDnGOhvyKeWJw16uIxnb9qrWklX8
 7IXCbu7oaplbOxiSK2l2Qb67hdND3JrhgEDhsgc8mzZEzJ6PI3zDHkpt1theDlai
 iHHVgQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435wuer7rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 07:36:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR7a0In029186
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 07:36:00 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 23:35:53 -0800
Message-ID: <dc44ae50-4113-4538-83ac-e3cb422ee53b@quicinc.com>
Date: Wed, 27 Nov 2024 15:35:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Ritesh Kumar
 <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com>
 <70abadbf-b796-4434-b2d8-0675c18eee07@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <70abadbf-b796-4434-b2d8-0675c18eee07@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: s9z3uS0GxjrUSJQqZB-Hjq9t7ElrnLht
X-Proofpoint-GUID: s9z3uS0GxjrUSJQqZB-Hjq9t7ElrnLht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 clxscore=1011 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270062
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



On 2024/11/27 15:15, Krzysztof Kozlowski wrote:
> On 27/11/2024 08:05, Yongxing Mou wrote:
>> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> 
> 
> Will fail testing, so only limited review.
> 
Thanks for reviewing,will fix it in next patchset.
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>> +    #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>> +    #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    mdss: display-subsystem@ae00000 {
>> +        compatible = "qcom,qcs8300-mdss";
>> +        reg = <0 0x0ae00000 0 0x1000>;
>> +        reg-names = "mdss";
>> +
>> +        interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
>> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                        <&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ACTIVE_ONLY
>> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                        <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +                         &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +        interconnect-names = "mdp0-mem",
>> +                             "mdp1-mem",
>> +                             "cpu-cfg";
>> +
>> +        power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
>> +
>> +        clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
>> +                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
>> +
>> +        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +
>> +        iommus = <&apps_smmu 0x1000 0x402>;
>> +
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        ranges;
>> +
>> +        status = "disabled";
> 
> No, your code cannot be disabled.
> 
Thanks, will remove it.
>> +
>> +        mdss_mdp: display-controller@ae01000 {
>> +            compatible = "qcom,qcs8300-dpu";
>> +            reg = <0 0x0ae01000 0 0x8f000>,
>> +                  <0 0x0aeb0000 0 0x2008>;
>> +            reg-names = "mdp", "vbif";
>> +
>> +            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>> +                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
>> +                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
>> +                     <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
>> +            clock-names = "bus",
>> +                          "iface",
>> +                          "lut",
>> +                          "core",
>> +                          "vsync";
>> +
>> +            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
>> +            assigned-clock-rates = <19200000>;
>> +            operating-points-v2 = <&mdp_opp_table>;
>> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +
>> +            interrupt-parent = <&mdss>;
>> +            interrupts = <0>;
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +                port@0 {
>> +                    reg = <0>;
>> +                    dpu_intf0_out: endpoint {
>> +                         remote-endpoint = <&mdss_dp0_in>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            mdp_opp_table: opp-table {
>> +                compatible = "operating-points-v2";
>> +
>> +                opp-375000000 {
>> +                    opp-hz = /bits/ 64 <375000000>;
>> +                    required-opps = <&rpmhpd_opp_svs_l1>;
>> +                };
>> +
>> +                opp-500000000 {
>> +                    opp-hz = /bits/ 64 <500000000>;
>> +                    required-opps = <&rpmhpd_opp_nom>;
>> +                };
>> +
>> +                opp-575000000 {
>> +                    opp-hz = /bits/ 64 <575000000>;
>> +                    required-opps = <&rpmhpd_opp_turbo>;
>> +                };
>> +
>> +                opp-650000000 {
>> +                    opp-hz = /bits/ 64 <650000000>;
>> +                    required-opps = <&rpmhpd_opp_turbo_l1>;
>> +                };
>> +            };
>> +        };
>> +
>> +        mdss_dp0: displayport-controller@af54000 {
>> +            compatible = "qcom,qcs8300-dp";
>> +
>> +            pinctrl-0 = <&dp_hot_plug_det>;
>> +            pinctrl-names = "default";
>> +
>> +            reg = <0 0xaf54000 0 0x104>,
>> +                <0 0xaf54200 0 0x0c0>,
>> +                <0 0xaf55000 0 0x770>,
>> +                <0 0xaf56000 0 0x09c>;
>> +
>> +            interrupt-parent = <&mdss>;
>> +            interrupts = <12>;
>> +            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> 
> Messed alignment in multiple places.
> 
Thanks, will fix it in next patchset.
>> +                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
>> +                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> +                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +            clock-names = "core_iface",
>> +                "core_aux",
>> +                "ctrl_link",
>> +                "ctrl_link_iface",
>> +                "stream_pixel";
>> +            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> +                 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
>> +            phys = <&mdss_edp_phy>;
>> +            phy-names = "dp";
>> +            operating-points-v2 = <&dp_opp_table>;
>> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +
>> +            #sound-dai-cells = <0>;
>> +            status = "disabled";
> 
> No, your code cannot be disabled.
> 
Got it. will remove it.
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    mdss_dp0_in: endpoint {
>> +                        remote-endpoint = <&dpu_intf0_out>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                   reg = <1>;
>> +                   mdss_dp_out: endpoint { };
>> +                };
>> +            };
>> +
>> +            dp_opp_table: opp-table {
>> +                compatible = "operating-points-v2";
>> +
>> +                opp-160000000 {
>> +                    opp-hz = /bits/ 64 <160000000>;
>> +                    required-opps = <&rpmhpd_opp_low_svs>;
>> +                };
>> +
>> +                opp-270000000 {
>> +                    opp-hz = /bits/ 64 <270000000>;
>> +                    required-opps = <&rpmhpd_opp_svs>;
>> +                };
>> +
>> +                opp-540000000 {
>> +                    opp-hz = /bits/ 64 <540000000>;
>> +                    required-opps = <&rpmhpd_opp_svs_l1>;
>> +                };
>> +
>> +                opp-810000000 {
>> +                    opp-hz = /bits/ 64 <810000000>;
>> +                    required-opps = <&rpmhpd_opp_nom>;
>> +                };
>> +            };
>> +
> 
> Drop stray blank lines.
> 
Got it.will fix this issue,there should be a '}'.
>> +    };
>> +...
>>
> 
> 
> Best regards,
> Krzysztof

