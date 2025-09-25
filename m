Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115A4BA1B87
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 00:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB6D10E9BB;
	Thu, 25 Sep 2025 22:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0o/9238";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB99910E9BB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:02:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIUq3x005917
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WswtcLs0OrUJpjixJvlZQZiB
 DPTlc7OTq9eAlE8GdZk=; b=G0o/9238WnlcOs1XsiHSp3L8+474gfSmXsJ9fZs7
 G9U29w7y7nTLV8zf8OVYA4/bw1NMxkA8ytkYJxD5Zj/X6ZY18mUYq+Q4wZ7qq3EF
 efvN414/wAAHaoHYs9GIXfQReRQ030rnBDkr/SL9kBo2oWz/B3lOAU+DNE+6a86C
 Y/mFNgNd9u3OmjUz0l9ZFCN5IGiGv6MyucxaPsm/iwuXPrIIFT5/Mf/UBrFvkLkv
 lBqwXFROoJAtokjZbOqoVRQ/vMTgEvK06uu8X87wTAOXQnHWcHoabrVKdcfG76XS
 +KZ0oAzwDd2TLBFgYWZyU0cfn7s+LrQIDBglwtZ0iv8UxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db320g9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:02:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d7f90350f3so32040501cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837752; x=1759442552;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WswtcLs0OrUJpjixJvlZQZiBDPTlc7OTq9eAlE8GdZk=;
 b=MhXjHnk3EkKz1++xyT8bvr9B8alTEP2OOr4NQIkwJNMXbQpsTX3SO9BLQWXSkw9w/G
 berNTIOqALX5lPQtRzJxmpGLk2Mngdcy5b5LLmB/4PlGsZ6uOaemSde+9vGgGMYNQqkY
 05U1MKMsnxy4LFHwbnzhHc9yvtS1uhI7llUud9rVT90Uili8wipc8UILCLys3+VmpV7Q
 7v4Mu4lMItkh+VxoBeVg46Yx2zCt8gveEw4p0M9KHFqBDpIh6oJoFSZETVqsYpLvnNz0
 RABkwIJ7j06z60n5IqkPNBzy4pAl2X0Mxtk2bprVB26enpmDxOlRgo74WSAYw7YgPH1w
 QE7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhKRPlquFbvXRIwfBTcEUhNYrSDzbH3QI6e4rCEu2ExSzuS94jIEnsMQDFez6j0sXGnRkrRJ9suN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYIyAY9Q7hykBV1N0HDsnupKfzg4EyiGH3+bKuDSGZ2Cvl5QTR
 QYBLKsfUOP2b642gpPUDWlyZ+TJ+BXet+njR8cckbAD89ORTDVv/6ttIx36ZemayEUsRYy1T/SO
 +wiSJK+gn4e6+Hy2iQBuJHxXUpUF4jpLHAreSeOFM5tXtwiTr/ow+gLsvjP++cD29xO84hqA=
X-Gm-Gg: ASbGnctEEamJqAvzCCuY3JRtzGvmeWZU4BrCrosOnBL2c1nmldEnYAEZCy6a2bae5k8
 3CBejMuwWBfEMdCN8TuNok0H+NVlYUWSTzLzdvAs5ualMSzChjN2T2AOc6SenkzVMRElmuw1UVq
 FGsSOtRTVhXgiRXisaKLG0k/uE9H5iwNOqOYjknQ7jm7BhzxZQMj+uWhm0dpBguxljjWGjM8QaJ
 amNdMWG2grYXyFKA4IHMFzARIlSnh0rdgMBju9ksD/raBgFFh9a9EQTlif/d4ipTt+cuPolu4Hc
 zwkYUU8DzFUp6PC0Dc6Vq43W3QdE1arVEmv+5Sz5blUa6LHwmDT3iTXt7ZlVuYsODg4mE19tWeK
 MN0W+/Anga3rA2Nd+m2SAoHB98PBiSyM49r0Z+Sjl+KTZFChVh5Qz
X-Received: by 2002:ac8:5e06:0:b0:4c7:e39a:388a with SMTP id
 d75a77b69052e-4dac4133cadmr48183101cf.0.1758837751539; 
 Thu, 25 Sep 2025 15:02:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjm/ckt7DusryvD+RR3JgMyVr7iU1qTCLo6gNy24ib40rQZETTCozRfZCmrtkgIOjnQ9Px9g==
X-Received: by 2002:ac8:5e06:0:b0:4c7:e39a:388a with SMTP id
 d75a77b69052e-4dac4133cadmr48182281cf.0.1758837750889; 
 Thu, 25 Sep 2025 15:02:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313cde476sm1164996e87.48.2025.09.25.15.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:02:29 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:02:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
Message-ID: <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-3-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925053602.4105329-3-quic_amakhija@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d5bbf9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=HRGN58LKe5rzAvgwDGIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sX2wEXnMxyTqhacB-gF-hLjljVHsqrXw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX7N+ZQEOtJjjO
 n6H7vEOvxIaesTuNogtgEcWOEwUDPW2XGe8ZXAf0GXY0rU7txugcAoUqJaZke1p7Eo++bnk9rHj
 Zt4V5nvL4UV3FBpo4sAp5f0cFADOt+tI5CJJdk1VmRqkk01K1JoaeK8QwDotqksvGxZeSVCfRRT
 /qxOMmFMJdDjxxHvA+89BxyQJu6dCYOL4rLy8UjKgu8i4nLRdTJnNTYw7VGdIgqHTsacTl4hDtD
 UP/HOi38rWRRiJSGiN5b4QF4r3CVx0DHiUNXpBs8Ifo69JdstpUyXsbWKphb0ftkARYLLQAL1tq
 sKHeReHRiK6nJkHhO16QMO3yByXJtawu363HqB00AI3z9l56gTEgM5IjuNQX40axaqomOzpgCd2
 WpUFpGpWaEWujteTNeAKReaznnzz9A==
X-Proofpoint-GUID: sX2wEXnMxyTqhacB-gF-hLjljVHsqrXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172
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

On Thu, Sep 25, 2025 at 11:06:01AM +0530, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 95 ++++++++++++++++++++++++++-
>  1 file changed, 94 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index e0e1f63fc45b..834ae0522f2f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> @@ -4854,6 +4855,13 @@ dpu_intf0_out: endpoint {
>  							remote-endpoint = <&mdss_dp0_in>;
>  						};
>  					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&mdss_dsi0_in>;
> +						};
> +					};
>  				};
>  
>  				mdp_opp_table: opp-table {
> @@ -4881,6 +4889,89 @@ opp-650000000 {
>  				};
>  			};
>  
> +			mdss_dsi0: dsi@ae94000 {
> +				compatible =  "qcom,sa8775p-dsi-ctrl","qcom,mdss-dsi-ctrl";

qcom,qcs8300-dsi-ctrl. You might use three compatibles (qcs8300, sa8775p
and the generic one), but there should be qcs8300 one.

Also please add a whitespace after comma or (even better), keep one
compat per line (align on opening quote).

> +				reg = <0x0 0x0ae94000 0x0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
> +
> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK>,
> +					 <&dispcc MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +					 <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK>,
> +					 <&dispcc MDSS_DISP_CC_MDSS_ESC0_CLK>,
> +					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +
> +				assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> +							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
> +
> +				phys = <&mdss_dsi0_phy>;
> +
> +				operating-points-v2 = <&mdss_dsi_opp_table>;
> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
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
> +						mdss_dsi0_in: endpoint {
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +
> +				mdss_dsi_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
> +			};
> +
> +			mdss_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,sa8775p-dsi-phy-5nm";

Add qcs8300-specific compatible and use sa8775p as a fallback

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
> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +
>  			mdss_dp0_phy: phy@aec2a00 {
>  				compatible = "qcom,qcs8300-edp-phy", "qcom,sa8775p-edp-phy";
>  
> @@ -5008,7 +5099,9 @@ dispcc: clock-controller@af00000 {
>  				 <&mdss_dp0_phy 0>,
>  				 <&mdss_dp0_phy 1>,
>  				 <0>, <0>,
> -				 <0>, <0>, <0>, <0>;
> +				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> +				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
> +				 <0>, <0>;
>  			power-domains = <&rpmhpd RPMHPD_MMCX>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
