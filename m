Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5489AC1EB91
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 08:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F7510E029;
	Thu, 30 Oct 2025 07:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJmdIQy1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6/+YxA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08B010E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 07:21:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U1lWhG4135361
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 07:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LrLH04bvWmhv/7dSuz9/jODN0MrjOzjLTOOh3RzYK98=; b=aJmdIQy1dzNp+YSO
 uYD5v7uBG6WccO2WyWuXmJygidw+st6zcZUCS7lIaBhlmZJpmOylw4iW5z7tzIQj
 CBaIaIFmECBjjXRoQLDWMk5s5RLgnz8ykhYfpF+El3Y33ArA1HM9BKRJQDrJlzg8
 Utf1dubsR4j27TTqKZRMdsjSU9OQpBCI2/hR9Hhwj3PsfUnCBk3PfEeOKWZiR7qG
 RhE9JMfGC5xei95FUIMhAjSAVkvwYXHdKtJtm1v6t1rUxO/+xxo0QgR//A2GwDB3
 /1UkAzswKyOkydIUPmcR2Yddv7v36LcZBzOJU4K+vB3kP8nvhREE+16xCZUtcZLV
 RkBlyQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9uqnf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 07:21:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-339ee6fe72cso196105a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 00:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761808880; x=1762413680;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LrLH04bvWmhv/7dSuz9/jODN0MrjOzjLTOOh3RzYK98=;
 b=i6/+YxA6ZW0QHAyleP3sENKWsggpj0uCUrhl9PKd/xy5Coam6X03D5O3qN+dyUh7ku
 wh7zRMGF82UIvBC1n12E65mC7Vey4Ovo6TH96DKV+78ztr6RbfzSjLnEYu1iftfyAle+
 pM7ZNjwaoyK3/QY7aNX0IJLSWd2vRzv8WW7ijdMayFAG4P4cOw7HS3yxj/zFIf5TVl0T
 +mDETFvW5e0rbHTwPH1WRdPc2wfRcDNNMTUwh5iNMJ+rAaaPDSOvbnJsAQoR4Y9IlkVb
 L5l/HzmIemA4FaTFMy2SupLg3gs269KLiMsSPTPZSAUZOq+qS3wP206yRijIHp8N/8BE
 de9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761808880; x=1762413680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LrLH04bvWmhv/7dSuz9/jODN0MrjOzjLTOOh3RzYK98=;
 b=THV/d9vyKfK4CUVuEoEXX2a3EL9ErkCdzXrTYsy30s+YsY7OhfPWDOPsszkQq78LHP
 VQIoClUXGXCUiAKhfYvgRSlFI6IZxeE62pRbjH45Hzk4Xnfw5KweDr4nc3F+Xe1M/tSd
 H1zoMekHqEQfaYT/jv3pNHDUIsdj0zqR8ZyBbWnk5WTp0Nc78xwZXlIRSgpjabF6+T/w
 PwUfQ1MKDC2aXhwUVf4GizBeZjDOhHA8hBrqYqlS9YlzSfe1lZ1trulBeUAFlB0qN7RZ
 y0tJGaB/s2YhVB+YwziuaBkfVMyHNu7ZgUQxIzVT9F5cBltQT4/z1XQnsRNvbH8M/jja
 tH1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSV8y5fWvTgaFmW8SpBwL3C76bRKiEk1YxHt/XkPGNqHwAOYDAhf1aWXTQ2Md38w8UXKsyApKWDg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx32tXjMGghaEHojdH5P17jq4wFyibQO+/1a7VNWCn6B5UcVdbO
 tMMHDeBmzSwN8R0vFUjPcIlRhU9obEd7Imir9ItKz/ltaUn2+ViZrFO0Y1MYyc8yOzD2N8AotIt
 4XLcIz+Kf4ch9Ty1IMgwD7CjfVogkLDbFunh4eRcDpt4WimSa7FaqlVDMVzPR0VbTMKDd60c=
X-Gm-Gg: ASbGncvg8nWi7DU99UWIND0JNqIP0zfXIddghdnNFKtfCa/3sHNOmq0cJ+OY3/VhkNi
 unUfPLxhXFoszYauNoU8/NqeSpzGLCTYB6vwy2YjR0IzlytG6EdZxmMFC51BAe0x3tCE7aB5KNm
 A0Cp9WmjFKjhz2GcYsqru+jVu6o0JIKdzSOAyNrhCrPjdz4CwKbGLGOkYS+Zfa16fvzEwFi/bTI
 xlzG7ItemCcvbp/9Vq52waccA51tOvt5Hoen18bRwjheWaXYz9MJ8qwO95AWbhcEZ+95prwJqYw
 a8Lfocv4rWjR0yDU6OQQJqf9ezaOt8Rjh8UpvYJBJZseEvclCA6wT5XAz6gUUmxNJj/2hcDkgxi
 GzDaQEi77gRliRJHelapF6NmGrDoN6aCjkBMek5/Yg8IZeuTMVdOiTSNGHt2HlrFtVVTYVA==
X-Received: by 2002:a05:6a21:4d8c:b0:341:fcbf:90b9 with SMTP id
 adf61e73a8af0-34653c0cc95mr3991163637.4.1761808880198; 
 Thu, 30 Oct 2025 00:21:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzZrHhcc1HTqPJ7CvrAphUHOthYYbudWGXcSpWUVourKLOVpK1kqUouzpCpiUJ1uwL+BHxGw==
X-Received: by 2002:a05:6a21:4d8c:b0:341:fcbf:90b9 with SMTP id
 adf61e73a8af0-34653c0cc95mr3991136637.4.1761808879701; 
 Thu, 30 Oct 2025 00:21:19 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b8c0d2364d5sm3941558a12.19.2025.10.30.00.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 00:21:19 -0700 (PDT)
Message-ID: <da6eebe0-13ec-4168-aac1-2eef9db3bd13@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 15:21:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-3-c4316975dd0e@oss.qualcomm.com>
 <xjes5h45y44cahs7avj4xngprwnks3alnf25tsbptyvckajz3q@lhawlg5vamls>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <xjes5h45y44cahs7avj4xngprwnks3alnf25tsbptyvckajz3q@lhawlg5vamls>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cZrfbP0sbw4RItozPaHs-eScA5_GwsM7
X-Proofpoint-GUID: cZrfbP0sbw4RItozPaHs-eScA5_GwsM7
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=690311f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tU0UsG_G8rlFAKuj474A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA1OCBTYWx0ZWRfXwkkKPigdw07a
 yuql5f3eltQ9PfE20prttJ+lOSc58MLulUYFkmgByoxIoR+uN0wQo5QQ6Wboq4DPwBVHM0anAz/
 v+SCh38fdoqdHm6tFzAuPOVJ3tfyJuKkOOtWpNMpbkDJp5rFEwtRGEwr/f6eXHIR2rLBy/aLB9g
 RcOLewYPMTvQ6kb4kPjf+FlEDBcs9jivjvb3YmfnHWw77mPXsdHW9ELC3S81sQeBpxQTZmZQcPp
 6mbX6RUPmCexcSqjlLWy45zB43Pp1IG/3mNXwny+YbnyVAbdnj9y2d9NW77frrL/6LHXjo+2zeO
 rXJc4IOOpGx9RQ+VJejKfWChdUmTYh/7S2vCdRLBRX2lr1hAiAjZmofgEqL/VgympmzZ4vh+a8S
 FHKIhBBl00mhSqvSEk0pQ2buw4YEiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300058
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


On 10/30/2025 1:32 AM, Bjorn Andersson wrote:
> On Fri, Oct 24, 2025 at 01:21:03PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
> Please fix the subject prefix and drop the "for SM6150" suffix.
>
> Regards,
> Bjorn


Ok, due to sm6150.dtsi have renamed to talos.dtsi in newest version.

Will update to 'arm64: dts: qcom: talos: Add DisplayPort and QMP USB3DP PHY'


>> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
>> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
>> clock assignments for proper DP integration.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 115 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 113 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> index 6128d8c48f9c0807ac488ddac3b2377678e8f8c3..9741f8d14c72ed7dd6a5e483c5c0d578662f1d31 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> @@ -14,6 +14,7 @@
>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> @@ -3717,6 +3718,7 @@ port@0 {
>>  						reg = <0>;
>>  
>>  						dpu_intf0_out: endpoint {
>> +							remote-endpoint = <&mdss_dp0_in>;
>>  						};
>>  					};
>>  
>> @@ -3749,6 +3751,89 @@ opp-307200000 {
>>  				};
>>  			};
>>  
>> +			mdss_dp0: displayport-controller@ae90000 {
>> +				compatible = "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom,sm8350-dp";
>> +
>> +				reg = <0x0 0x0ae90000 0x0 0x200>,
>> +				      <0x0 0x0ae90200 0x0 0x200>,
>> +				      <0x0 0x0ae90400 0x0 0x600>,
>> +				      <0x0 0x0ae90a00 0x0 0x600>,
>> +				      <0x0 0x0ae91000 0x0 0x600>;
>> +
>> +				interrupt-parent = <&mdss>;
>> +				interrupts = <12>;
>> +
>> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>> +				clock-names = "core_iface",
>> +					      "core_aux",
>> +					      "ctrl_link",
>> +					      "ctrl_link_iface",
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>> +
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>> +				assigned-clock-parents = <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>,
>> +							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;
>> +
>> +				phys = <&usb_qmpphy_2 QMP_USB43DP_DP_PHY>;
>> +				phy-names = "dp";
>> +
>> +				operating-points-v2 = <&dp_opp_table>;
>> +				power-domains = <&rpmhpd RPMHPD_CX>;
>> +
>> +				#sound-dai-cells = <0>;
>> +
>> +				status = "disabled";
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +
>> +						mdss_dp0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +
>> +						mdss_dp0_out: endpoint {
>> +							data-lanes = <3 2 0 1>;
>> +						};
>> +					};
>> +				};
>> +
>> +				dp_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-160000000 {
>> +						opp-hz = /bits/ 64 <160000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs>;
>> +					};
>> +
>> +					opp-270000000 {
>> +						opp-hz = /bits/ 64 <270000000>;
>> +						required-opps = <&rpmhpd_opp_svs>;
>> +					};
>> +
>> +					opp-540000000 {
>> +						opp-hz = /bits/ 64 <540000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +				};
>> +			};
>> +
>>  			mdss_dsi0: dsi@ae94000 {
>>  				compatible = "qcom,sm6150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>>  				reg = <0x0 0x0ae94000 0x0 0x400>;
>> @@ -3844,8 +3929,8 @@ dispcc: clock-controller@af00000 {
>>  				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
>>  				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
>>  				 <0>,
>> -				 <0>,
>> -				 <0>;
>> +				 <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
>> +				 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;
>>  
>>  			#clock-cells = <1>;
>>  			#reset-cells = <1>;
>> @@ -4214,6 +4299,32 @@ usb_qmpphy: phy@88e6000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		usb_qmpphy_2: phy@88e8000 {
>> +			compatible = "qcom,qcs615-qmp-usb3-dp-phy";
>> +			reg = <0x0 0x088e8000 0x0 0x2000>;
>> +
>> +			clocks = <&gcc GCC_USB2_SEC_PHY_AUX_CLK>,
>> +				 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
>> +				 <&gcc GCC_AHB2PHY_WEST_CLK>,
>> +				 <&gcc GCC_USB2_SEC_PHY_PIPE_CLK>;
>> +			clock-names = "aux",
>> +				      "ref",
>> +				      "cfg_ahb",
>> +				      "pipe";
>> +
>> +			resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
>> +				 <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
>> +			reset-names = "phy_phy",
>> +				      "dp_phy";
>> +
>> +			#clock-cells = <1>;
>> +			#phy-cells = <1>;
>> +
>> +			qcom,tcsr-reg = <&tcsr 0xbff0 0xb24c>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>>  		usb_1: usb@a6f8800 {
>>  			compatible = "qcom,qcs615-dwc3", "qcom,dwc3";
>>  			reg = <0x0 0x0a6f8800 0x0 0x400>;
>>
>> -- 
>> 2.34.1
>>
>>
