Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CB6ABB2B9
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 03:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC3210E1F3;
	Mon, 19 May 2025 01:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVTnjCUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D7110E205
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:01:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INVxwm026084
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qq9RXq9SVzhhh+kL9lJzrgG+
 A/t/p+ZZEkzTdEVAQYI=; b=mVTnjCUXa5nvUgocAAsfyqzqSHq0o/ZsrB7cSvyZ
 jFwEejGeYLsqI/9Y1hn7ZtgNMetBkmKgaCHqwfqCMQ+a6OCD4yplgMyd3OkJKHJ2
 k5xg916aQRkGOfnuapKCbpGLs1dF3cAJZwsUmVCwBIK9eNxMpY/ehodoYLm/ykh4
 deZ/V2DM7HlNWiJvEyUnaQv2uWsEmfl2CCL47Nwq8ZEujEqIULO2CII/oKKPE58V
 qUCFasPv2mUd5Zb6WKBfN+MwnvvI06F1b3ohcgrPoQoSagpUTJjRermeaj3uIqs7
 qXgkODFxX3Ko/j7aI8SYbRxDiuGxQNq5Bba9B0lbHkmiOg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjstn3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:01:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8b2f0ab27so41703676d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 18:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747616489; x=1748221289;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qq9RXq9SVzhhh+kL9lJzrgG+A/t/p+ZZEkzTdEVAQYI=;
 b=bmeQLu1jjpAOVB+SbG4Snj0Ag3Hp8vKDqM71rACjxqdUO19VT3sKRhxZUYDMR+GGba
 YXdxL0fPD8NgchYJiOpGtd1rgYkFf2o5+1dZRKhC3N8FZa9fnKV99xOb4WtoOMkFGWJu
 on062nj0ZqUYS94Fknb+nWfjWblk7do4fxHFVjv20BUGXWuWp4CB0u6ynX6tIukb8Db7
 yVmIEOapocz4t4siRhriAab0QpkGaxKo7S6XsKCF8hJ5sp05D5aW0AAYi+V/lrldpDce
 h/0scXfwtfKhpIypGWA1/+YLy07XZAGmTg8wbdLYzR5fsVuQCQuPEf2uhXyhXNR1Y36k
 ZqhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvev8aImoRkALi6tOK3HmeeaC2A9yvrwV65pIYq07lxN1kPN983c46TTw+C74HiZA8599zRgkRUdA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh4mhevXLV9Qx0vxEl4fCYTsmmN2IUOs2V4kqJ6tb/iFOWWNG0
 j6Tqe4PFLlADf5BPEBH+kF3teBM/y4ayvEM0gx3EkqhV4FcKegC7pR4GlDh4hNSgu4rA/jtYxWg
 TGgDoNCdQgq5Uy1hkkC+UiBWeaLqZxC9NIDjjKgi1Gi7C3QEMzR8Vm/uLJNmQgoLvkVjbEMk=
X-Gm-Gg: ASbGnctvw0f3T3101ZeEMYq5GiX0Y7TKU4TVTaoLZkKFY0YvL3E0MZarOXhgwSWfGP3
 qeK+3YI/F2q4t9G1k0lfRQofn5h0SIsJrcthdHaJ6Ct9jSn+3XndX+FC6Y/lax5BpWfAVoVceAu
 I7SGQ+H1Eu5zfig9TDd52OcVobGuVUVMEaTe7z2yCYslDh7r6HEMcaC9N1xdpOnnvEKlWm6o6PJ
 O2aWnoNHd2A891Y89IBXm9fnGCNHzcjCABDwTSXdK4sOofI+ZvXMS1gL6AlW5lqpHjR2ZhooBDb
 38VvabmYhOl0tsgALQiJjp7QY3Ek5f28KRZTfsTV0/Spfg/c1d6XkFZL5aBqzjapJ3f4Fy/qcMs
 =
X-Received: by 2002:ad4:5f0d:0:b0:6f5:748e:c6f4 with SMTP id
 6a1803df08f44-6f8b087097dmr211392916d6.37.1747616488542; 
 Sun, 18 May 2025 18:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtM9T4XNbEFF8ECRVL2nou27yxJUbqWcJOM1bWrwp+s7uIIKSfzncgHPn8YqJw4vvYzHTGmg==
X-Received: by 2002:ad4:5f0d:0:b0:6f5:748e:c6f4 with SMTP id
 6a1803df08f44-6f8b087097dmr211392356d6.37.1747616488039; 
 Sun, 18 May 2025 18:01:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f161b1sm1638412e87.16.2025.05.18.18.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 18:01:27 -0700 (PDT)
Date: Mon, 19 May 2025 04:01:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <amakhija@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
 robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
Message-ID: <tjp2pfescczqikbu2tzylx4ecb3n6trixvhbdwbpz6y4jc52wk@fmkdxrelun3i>
References: <20250513102611.1456868-1-amakhija@qti.qualcomm.com>
 <20250513102611.1456868-2-amakhija@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513102611.1456868-2-amakhija@qti.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8-d3hehEewo8iXDokfcB77Lb1ANr5YHT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDAwNyBTYWx0ZWRfXzNbewDgUyE65
 Zqdtttl0rD8i268U7s4qpJVati46LF85i14wQPROx2OJdTwnm1yey2XNyz4lylmn4t5hjL1OU+J
 DzQNed/lWk3/hyKCE3kZ30BI0GyKnU/eLMToGf4uYWCBzYM230riOtuxDKsvcrylpW0wsrTxX5L
 f44YmmryIfBhSkEjcl3tGLB/Qdn7ZjMgSKcS9HdAfPk8mXmsaDMpNitG/gSRisgcGY6NNSLaKWq
 OS67caKm0E9jDiulhs2vXwDTCaJjy2KQPSuVl1wnpo4Vol86a5RtnEmic26S7fiuwNaCc5fkMHw
 o9U516WPtNPkKUu+yM40VhHOOBVQZYLyBmKEMLvJkT/l+PZDxWeKbvQKzj1Cvdzme5nBGD5p4mq
 NwqAHwHPOSEIMcZRHt6zygwhZagbigZyuUggQHDDKBzQqt2G30uTuVr04371gXw7wz8iTZUv
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682a82e9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sOAf8FZNR29loNffVzUA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8-d3hehEewo8iXDokfcB77Lb1ANr5YHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_12,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190007
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

On Tue, May 13, 2025 at 03:56:10PM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Add device tree nodes for the DSI0 and DSI1 controllers
> with their corresponding PHYs found on Qualcomm SA8775P SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 186 +++++++++++++++++++++++++-
>  1 file changed, 185 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 5bd0c03476b1..f8777f17d24a 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
> @@ -4034,6 +4035,22 @@ dpu_intf4_out: endpoint {
>  							remote-endpoint = <&mdss0_dp1_in>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&mdss0_dsi0_in>;
> +						};
> +					};
> +
> +					port@3 {
> +						reg = <3>;
> +
> +						dpu_intf2_out: endpoint {
> +							remote-endpoint = <&mdss0_dsi1_in>;
> +						};
> +					};
>  				};
>  
>  				mdss0_mdp_opp_table: opp-table {
> @@ -4061,6 +4078,170 @@ opp-650000000 {
>  				};
>  			};
>  
> +			mdss0_dsi0: dsi@ae94000 {
> +				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +				reg = <0x0 0x0ae94000 0x0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss0>;
> +				interrupts = <4>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
> +							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
> +				phys = <&mdss0_dsi0_phy>;
> +
> +				operating-points-v2 = <&dsi0_opp_table>;
> +				power-domains = <&rpmhpd SA8775P_MMCX>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss0_dsi0_in: endpoint {
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss0_dsi0_out: endpoint{ };
> +					};
> +				};
> +
> +				dsi0_opp_table: opp-table {

mdss_dsi_opp_table: opp-table {}

> +					compatible = "operating-points-v2";
> +
> +					opp-358000000 {

Is there only one entry? Usually there are several.

> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
> +			};
> +
> +			mdss0_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
> +				reg = <0x0 0x0ae94400 0x0 0x200>,
> +				      <0x0 0x0ae94600 0x0 0x280>,
> +				      <0x0 0x0ae94900 0x0 0x27c>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +
> +			mdss0_dsi1: dsi@ae96000 {
> +				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +				reg = <0x0 0x0ae96000 0x0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss0>;
> +				interrupts = <5>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC1_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
> +							 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
> +				phys = <&mdss0_dsi1_phy>;
> +
> +				operating-points-v2 = <&dsi1_opp_table>;
> +				power-domains = <&rpmhpd SA8775P_MMCX>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss0_dsi1_in: endpoint {
> +							remote-endpoint = <&dpu_intf2_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss0_dsi1_out: endpoint { };
> +					};
> +				};
> +
> +				dsi1_opp_table: opp-table {

You don't need a second DSI OPP table.

> +					compatible = "operating-points-v2";
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
> +			};
> +
> +			mdss0_dsi1_phy: phy@ae96400 {
> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
> +				reg = <0x0 0x0ae96400 0x0 0x200>,
> +				      <0x0 0x0ae96600 0x0 0x280>,
> +				      <0x0 0x0ae96900 0x0 0x27c>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +
>  			mdss0_dp0_phy: phy@aec2a00 {
>  				compatible = "qcom,sa8775p-edp-phy";
>  
> @@ -4267,7 +4448,10 @@ dispcc0: clock-controller@af00000 {
>  				 <&sleep_clk>,
>  				 <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>,
>  				 <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>,
> -				 <0>, <0>, <0>, <0>;
> +				 <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
> +				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>,
> +				 <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
> +				 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
>  			power-domains = <&rpmhpd SA8775P_MMCX>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
