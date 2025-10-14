Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98692BD8F73
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD49B10E20B;
	Tue, 14 Oct 2025 11:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9asrrT4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4257310E20B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:17:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Ju1025660
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nTY/sBKgAT5aIZEsNJ7UkmXTNK2/xLiJmfXa3OXwmRY=; b=H9asrrT4bziTSUTF
 V6VBtIcf7EuLi3O1jaqyR11GQleaKwyBfoy9BMBYgZWVlru2W8E5gsaIqKNjCcul
 zzyWUoxK0d8iakUfcA8ynHWAZXLz3gxTvD98F9/ucQXl/Z9ju644Yu5Wm8UyXbUz
 Zhp/ZjLX5M5x+Kj/TF1/KzAgIs6HSdWKn1w4TYVuK0nB9wencMJ3q3Vjfu9Oz7NT
 +HapQzwEfru9IrInZNZ7gFllqSXnU5KRQT06jN8uHzncNSHtnvpvFF5ms0UcwaKM
 ntTKAKHLm6D8Zl8vg5PtTDQ0fqEBASJ8kVBbBsWY6Od+hyhAhi5CEY5XMTcfHIQH
 kS5zuA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg038x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:17:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b54aa407bc7so1301201a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 04:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760440664; x=1761045464;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nTY/sBKgAT5aIZEsNJ7UkmXTNK2/xLiJmfXa3OXwmRY=;
 b=vJNgzIGvujSDI/ebPmviJrXcblE2613Bswhl1JL8VPy09oij2u4Vx4T8q2gJ6gmOCo
 zcqChOk0HNffD+OfByE+2bAG1vYtBlojWol8aAjnKPDPe4G1+bKEHpOTh5wmn8bYtv+d
 m+/jNCBiwHvuiWbBmdSaSqgSuDEkL89EjdCz2mAebOg22Zlru2HfDYT7tbanHooQokoY
 NjswK6JSAXwws6mVSPaT0sqFf/WDM//OrCPXWUV0p01VrH7et17nHawTkC50nBE07z96
 4NrepU+Z3Fo3mkIIS/8/AC806/PHljlKiwSgCpAXlH4Xp57kMexLwBQcNaf7JiuxTk3t
 trjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWE4f9H1YGsKEVXJe6OXkBHIW/yWcyHs2BRW8Ur+WVhQPfK6axrDziTCYFOMd5q4z21ygmhqKJOak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0p5Vxp4kOwo1AJJgXDaG2IGYBsnkgTRTVU6WEGVcv+4m8WKCD
 c+7UyTg9fRYZdDdWP4Tf0KNkYt2JXtsYPo97eMPdHqC9vqgBqKll5AWY3HPeF3AH2mkspN6M4Kz
 CikFWpOOwoWaUHT/TPqeovbyHPhkQ+LpKx3qp0B1K9O5iIKO60WjttFcBOEvd0I26eZhhUQ8=
X-Gm-Gg: ASbGncuA1prFrlSVxbJGF6Hmqpg2wAVW27luV6FkGZ+TbfF1UZXRwAicmn35oW2EHNm
 UDHRpX7+WoZgAaQXT/WgpewX1ftRffhrxYFobJoSl6GCnHRmYpdL1xCn5jaHrCvLLVmAR9Dc+fl
 9l90t1p99+Am6PfQluEEW4BZ6Xoyz0ZncLHW0v69SdydPlxBnh04AOtUYDlzfvL7siBkByBnRvN
 BVG6ikMgf9Lq22OtvKLG68rHrzb7wWIdo9/F5vIFY74upWs1z5ezL2DkAAhVmJBUMPgeOuJYU9f
 DBlcpqq0LannZXVSPKMdLOlKwJaztYxtR4M1XwtgznKw8TrY3+wSCEO+gr+p4FhEUkrvFybvvIb
 fAiTtm5BNHr0rl+sTTuGsP88H4zWj0S4VNh8=
X-Received: by 2002:a05:6a00:39aa:b0:781:1f5e:8bc4 with SMTP id
 d2e1a72fcca58-79387a281famr13223997b3a.6.1760440663703; 
 Tue, 14 Oct 2025 04:17:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNqg1GAF0T4XgAhZMO0oLfa/blFZ3V9pL/XkmLQdf76VR8zUgzVCBYeKkV8ezLitvhxMOtCA==
X-Received: by 2002:a05:6a00:39aa:b0:781:1f5e:8bc4 with SMTP id
 d2e1a72fcca58-79387a281famr13223974b3a.6.1760440663219; 
 Tue, 14 Oct 2025 04:17:43 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b060c4esm14901588b3a.14.2025.10.14.04.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 04:17:42 -0700 (PDT)
Message-ID: <8e6720e9-6e9b-4530-b2b8-4e27a74665c5@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:17:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-2-1209df74d410@oss.qualcomm.com>
 <mij6av23fni6i4yb72xbjv3s2mil4eankjwt5n7jbafslvilem@qsk3644ilgcp>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <mij6av23fni6i4yb72xbjv3s2mil4eankjwt5n7jbafslvilem@qsk3644ilgcp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX0YJ+oTzRKAZG
 b3jpfA69WSTGYXSX5LdiVCFH6XIvSzeca0M3UAveVF2gbvWnGnnxl+nk/6Y3JmcjmdokFcya2zH
 wdjyMsg+u18I9YrAGc0W5ovCWNPrwg2eYI3DgkokhdU/KE0DU4+yJiwgWbMf7Z84mPZYVTFCcQw
 yxNcPATruN2EQHLSQ+sI7qYDFAkA1uLbK/XRFuLBcAsuahyjQel6TMudvBjEsCRakE8bDa+lRyN
 +Y/Fbz/IzR/XUrx78esQDcYEyne8nswnDtVS5TdoUuFSea+XoDuiUAyZ/nldaloG/lxa7NoP17q
 FpBc+qboz8NIv94Awn/SiuT2P8U/ol5OTfqHLxj/M+y73D1m7xF9QWRSkt6jDInMSa3TZ3bWsFu
 2suQzavDCdqWZ8YRz8M6mDg94GLM+g==
X-Proofpoint-GUID: D76l1wD0m7zeeKtia-5GDNholI_eNPfV
X-Proofpoint-ORIG-GUID: D76l1wD0m7zeeKtia-5GDNholI_eNPfV
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ee3158 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Y-oTvv0IyMzSHJg1AAYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
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


On 10/14/2025 6:18 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 05:42:11PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
>> for SM6150 SoC. Update clock and endpoint connections to enable DP
>> integration.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 110 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 108 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> index 6128d8c48f9c0807ac488ddac3b2377678e8f8c3..cdf53d74c778c652080b0288278353e20c317379 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> @@ -17,6 +17,7 @@
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>>  
>>  / {
>>  	interrupt-parent = <&intc>;
>> @@ -3717,6 +3718,7 @@ port@0 {
>>  						reg = <0>;
>>  
>>  						dpu_intf0_out: endpoint {
>> +							remote-endpoint = <&mdss_dp0_in>;
>>  						};
>>  					};
>>  
>> @@ -3749,6 +3751,84 @@ opp-307200000 {
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
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +				assigned-clock-parents = <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;
> Missing PIXEL1_CLK_SRC assignment


Ok, will update in next patch.


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
>> +						mdss_dp0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						mdss_dp0_out: endpoint {
> I thought that we need a data-lanes property somewhere here.


Ok, will update.


>> +						};
>> +					};
>> +				};
>> +
