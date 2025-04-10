Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B8A84DAA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 22:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1B710E3B5;
	Thu, 10 Apr 2025 20:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CekWLmOX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F9B10E195
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 20:01:53 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFh4ZU008193
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 20:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cQKF/VxyCC/OpmAoONC18oPV
 cOgA+smPZj7cgddFWhE=; b=CekWLmOXP/799feVGPBXyj1rLU0O205hSip17lRn
 1ZYB/jJTw5GWr9C/+D3Y/7cwpC90R0y32893q7WDyQNgHlzMZj12S3UeIrpNrgSh
 AmyPeytI35uNhNHR38qcioQoKtpU4o77PbSq7KmkdTUUnR5GzST/AxmBQ0kAUW+u
 Wuf9R+Q+0I38BY+GQBgxtnVwwhOO+FyT+dyyn4GqFBedvqdYnAtZQbFHx6pELFWQ
 jy/fqStHIgA1D6p8GZDWF8B9TTt2AxLyJmooiEP769ozMIoUfLbDGye2UmEz/qpt
 mnG3iudCH4i8IMKScfwJ+X5qjE3170a9RGSYFJad9KSwKQ==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd08bch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 20:01:52 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3d702175925so13677005ab.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 13:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744315311; x=1744920111;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQKF/VxyCC/OpmAoONC18oPVcOgA+smPZj7cgddFWhE=;
 b=K4w/oI3nBdUOcNUS34/ZtdoEqGbouiAxEj6sgwoHgR09QBO12VbgKCIZPzEn4O652I
 FdhEXjwMdnvrwQoGhnmZ3UAQuUIvIFK+6ZZxcATRziSWl16ANSSzKbGhby02QIC3U2NR
 Epck2tjyxYXFjHLKLRMN4R6L2NeTBf3R9n9teB0GCPhnjw723LfgKeyikZSFu3ffq3lb
 8FnFs32uQaPVp6nxXMKfFfsXMUdxw42dvUB4YYpDTglFtF+XKIMxv2bsFF6r4+6VtBHf
 aPpFzq16SooTtipOOT18s+D1ZRSgJH/Sh+/Tx0fm2Ys4o2OsiE37wW/YkYLteuvZ0LPN
 bNyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSpArrIMJ3wf7XYglO1cwyPolZh+EK/6AfTBZGE+gxfwS/GsgJuPK8tazYXJwBliooC6j30E7KHS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDQMLeB5fIkaFxHOIQkNU6IwFx/lXDcBSAhgcJwqMeahgWM3Rm
 h+4YKsCvh92WNILEqTHN+8ovrIGQuiouGtceMBJ1oa8IyzJzdxDpkjiPIMvAj0KcV1T0nNFVjSn
 u8NMvK/OBvdB7LY2JL5ZJL/ssdcPZcp+PsFFSje1sQuLYybc9WXC+dydUWKp11D+nRzD3Co5V7E
 o=
X-Gm-Gg: ASbGncuORMZfqyWvD6osexbFR76YHCJLkWfE2JeSgipz1Jq5GyWZ3fgsRWj3n6X1RWg
 Ob8egxXy49tR9I8uTuUA6vTVuY8e0nV6CY4jqr3p7TZB2Xfbqdpd1wIEkBjbNJux3dcDr1tgEI2
 RcYnICY0ha/uChR9or2GD6YzloSUrclV4cSLVnQFimEV6XmzkIqxs9A25x5FrllKuQBE39/HowP
 5mjnYiDE8lUmqA73Ew3KsaC+d0zg4lD3z0Gd2fjOdT/hbHAK/f8agutMdYIVEHYcVH4sbLfHfdE
 19puyX41rY3OQ32Pjw3ErD2LZ1yyUrb3r9YXMBy/O7dZ+cenEHJskWyjH4JvUwuY/w2M/5do3Rw
 =
X-Received: by 2002:a05:6e02:989:b0:3d6:d162:be12 with SMTP id
 e9e14a558f8ab-3d7ec277267mr1619385ab.21.1744315311224; 
 Thu, 10 Apr 2025 13:01:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOcgglq72/KtLWeA8A2vkExuJ9YEmeKKzeIWF0tQFF4TsI9WFOgD8ectS26sdoezA0dGVAXQ==
X-Received: by 2002:a05:6e02:989:b0:3d6:d162:be12 with SMTP id
 e9e14a558f8ab-3d7ec277267mr1618855ab.21.1744315310705; 
 Thu, 10 Apr 2025 13:01:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d51006bsm234397e87.170.2025.04.10.13.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 13:01:48 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:01:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <wzqct2y67h6bkazxv3se77slsheaw5rspgcrcfjm7ngr5t4alw@nktpqrt5woky>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
 <nxnqwh2mzvnxv5ytwjsyulxr6ct6mhv3z3v6q4ojrjhhclwv2i@55nb56hnwi3y>
 <0f4eca6c-67df-4730-88b3-a277903deabc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f4eca6c-67df-4730-88b3-a277903deabc@quicinc.com>
X-Proofpoint-ORIG-GUID: 2tp6TkYxCkt-TGFAVmn7ZYZA1wSkwIwn
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f823b0 cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=u-yodfwXetj8OPw8cswA:9 a=CjuIK1q_8ugA:10
 a=mHQ74H5e8mo-RpSg_uaF:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2tp6TkYxCkt-TGFAVmn7ZYZA1wSkwIwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100145
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

On Thu, Apr 10, 2025 at 06:37:54PM +0530, Ayushi Makhija wrote:
> Hi Dmirity/Konard
> 
> On 4/7/2025 1:42 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
> >> Add anx7625 DSI to DP bridge device nodes.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
> >>  1 file changed, 207 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> index 175f8b1e3b2d..8e784ccf4138 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> @@ -28,6 +28,13 @@ chosen {
> >>  		stdout-path = "serial0:115200n8";
> >>  	};
> >>  
> >> +	vph_pwr: vph-pwr-regulator {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "vph_pwr";
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> >> +	};
> >> +
> >>  	vreg_conn_1p8: vreg_conn_1p8 {
> >>  		compatible = "regulator-fixed";
> >>  		regulator-name = "vreg_conn_1p8";
> >> @@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
> >>  			};
> >>  		};
> >>  	};
> >> +
> >> +	dp-dsi0-connector {
> >> +		compatible = "dp-connector";
> >> +		label = "DSI0";
> >> +		type = "full-size";
> >> +
> >> +		port {
> >> +			dp_dsi0_connector_in: endpoint {
> >> +				remote-endpoint = <&dsi2dp_bridge0_out>;
> >> +			};
> >> +		};
> >> +	};
> >> +
> >> +	dp-dsi1-connector {
> >> +		compatible = "dp-connector";
> >> +		label = "DSI1";
> >> +		type = "full-size";
> >> +
> >> +		port {
> >> +			dp_dsi1_connector_in: endpoint {
> >> +				remote-endpoint = <&dsi2dp_bridge1_out>;
> >> +			};
> >> +		};
> >> +	};
> >>  };
> >>  
> >>  &apps_rsc {
> >> @@ -517,9 +548,135 @@ &i2c11 {
> >>  
> >>  &i2c18 {
> >>  	clock-frequency = <400000>;
> >> -	pinctrl-0 = <&qup_i2c18_default>;
> >> +	pinctrl-0 = <&qup_i2c18_default>,
> >> +		    <&io_expander_intr_active>,
> >> +		    <&io_expander_reset_active>;
> > 
> > These pinctrl entries should go to the IO expander itself.
> > 
> >>  	pinctrl-names = "default";
> >> +
> >>  	status = "okay";
> >> +
> >> +	io_expander: gpio@74 {
> >> +		compatible = "ti,tca9539";
> >> +		reg = <0x74>;
> >> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
> >> +		gpio-controller;
> >> +		#gpio-cells = <2>;
> >> +		interrupt-controller;
> >> +		#interrupt-cells = <2>;
> >> +
> >> +		gpio2-hog {
> > 
> > This needs a huuge explanation in the commit message. Otherwise I'd say
> > these pins should likely be used by the corresponding anx bridges.
> 
> Thanks, for the review.
> 
> Previously, I was referring to the downstream DT and misunderstood the use of gpio-hog.
> After reading the schematic, I realized that gpio2, gpio3, gpio10, and gpio11 are all input pins
> to the IO expander TC9539. We have already configured gpio2 and gpio10 as interrupts in the
> ANX7625 bridges, so the gpio-hog is not required. It is working without the gpio-hog configuration.

Please make sure that there are pinctrl entries for all pins.

-- 
With best wishes
Dmitry
