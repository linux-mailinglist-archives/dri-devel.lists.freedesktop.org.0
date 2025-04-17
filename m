Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964EBA9198D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC8A10E1DD;
	Thu, 17 Apr 2025 10:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbak8cI5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7BC10E1DD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:40:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lEYP030240
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BjuAWeJK5hlBcayQ9LKvqOos
 Uc8OqTctTywMTRf5ORQ=; b=nbak8cI5wjIQO6uUIznf424kTrDzTn/9K6GVP0tC
 DQSa3ZpmDdvwWVI64JsD7GtF9lDiVsVOp1ac9cFWIEzd0kOQwLMS5AD7DKqj57hf
 kv2QhUSltme7lzAkD4N+LMcNbChzk3ztBl7prlt6Olub6H1wVTqfGAFmeUDItA61
 NGgpEcImagTbnFygZCFeO/DUafoTRyHR+5mfcnokURzZaYruh2OuLGSOS7Iw6pmP
 7NeGCKDmCIOHO5I6NYIv+vEzIPM3lb7CDzTEmrq59h3AuOQMfqRIc4pu+Eeml6z/
 tqyMkwzXZy8HutaRIPs6kv8JMKOg10oNsboprHUkcgppjA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69xk31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:40:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6eeb5e86c5fso7152766d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 03:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744886427; x=1745491227;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjuAWeJK5hlBcayQ9LKvqOosUc8OqTctTywMTRf5ORQ=;
 b=lSSQgAU9m6PyHD2piyt/2Xrvi6OiRqZkuzjMgfjKrl094xXaWelkq7UDn7DnbJlqnh
 iCpmasqBevuhQ1JQ8UQMTH8tXSCqGHybUbnYfPeBahvWb5bGbjx2gLtpY5oI9dhmjUg5
 DwNK/O5ugzk8xMHxtIMMP5L+6FlrMun40ahUBicMWqC5rYxWcVCP2Kc9AyuiNhCujxU/
 D5y0yYnLPERQ6PJkc5cnUug5iXByKx1hxnjpXOmEt80D1imOeRKFxGj0mRRsjb55T9WW
 k7gaBJ5gycfWYLiZ9hA8gajAtLbjbaesyEgN4BhhzKMXzL2sXffya4M6+i7ySWExHrFn
 r6yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpNdGOL08aRLho9ukV132lKrkgwZVnHdMoSKZvZkjGjm6Zq6unSItPMdkAlDJs/SUw1KI/OUI05J8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLiqOpN8nL63ui2RZ4qEkaSHL7fzFA32uP2g1js/OI61LNGKxI
 +wJD6/9lj0XPSbrLRbU4TTLJHRhCq0YkdKazLn6VETOThYhPjgVIIvzoa6/WovELeyYhOEF6MKg
 vgQWZ1U0x+pvd1fwz1sZZ/iLZaMo1h7ENklob3ECR1X/kYH/PL22bwSZRkARgRXcIoD0=
X-Gm-Gg: ASbGncs0YluIan8YgFL5o2rzHXva0/X9mTPB6JFxlNKY/udkcMhZxzP7DoFtsikgw+5
 MzxwGzh7o+eoHt1oe4HlUw5e45nPt6VPS1XDaY2vQbGwQeFMptZuEXqUx0Bf2NVcLAy2Ay55w7j
 qg8RE+B5HNbb+MK/5Cg/sBF+JYCIYapbR+ePM7wWjztAZYU0F+vYSqQDmpdHCHUfoCd4T9oUmnl
 fMXdWhAFU2ANsI1LmD9RYVih0BqqTOOT41MpTvNyApNCy1bn8QE4Zl1AvTnBUwO8hZYTK1Sb5fU
 keOlqoFUqBJaWlbyKgW/UpiQMAPeTkavjZtQoS8uChB6WfGAk/K0el7I3+91UDcYTc7NtfmyP0M
 =
X-Received: by 2002:a05:6214:4001:b0:6e8:9e9c:d212 with SMTP id
 6a1803df08f44-6f2b2dc00e7mr77993176d6.0.1744886427387; 
 Thu, 17 Apr 2025 03:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWp4eovQ0JlsFx/TXAsBf4ivXXpH+ynJJ2l0sinoyay/KdVJnwv8l7W0CfA/7FfRZ5I9Fg8A==
X-Received: by 2002:a05:6214:4001:b0:6e8:9e9c:d212 with SMTP id
 6a1803df08f44-6f2b2dc00e7mr77992926d6.0.1744886427069; 
 Thu, 17 Apr 2025 03:40:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d50253csm1981832e87.129.2025.04.17.03.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:40:26 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:40:24 +0300
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
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v4 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <qnhfnxvdsgnw5jh4xxaqz3p2x67qcrr7kn3vwdnyz5huchdtzy@aagflznjrvly>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
 <20250417053909.1051416-8-amakhija@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417053909.1051416-8-amakhija@qti.qualcomm.com>
X-Proofpoint-GUID: io1GcmoVN7KV_VrQjdZ5gP1lrGdq8nXy
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=6800dab2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=49572xSsTLiTCUh2GlUA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: io1GcmoVN7KV_VrQjdZ5gP1lrGdq8nXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170080
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

On Thu, Apr 17, 2025 at 11:09:05AM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 180 +++++++++++++++++++++
>  1 file changed, 180 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..d5b2dabe927d 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -28,6 +28,13 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>  	vreg_conn_1p8: vreg_conn_1p8 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vreg_conn_1p8";
> @@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	dp-dsi0-connector {
> +		compatible = "dp-connector";
> +		label = "DSI0";
> +		type = "full-size";
> +
> +		port {
> +			dp_dsi0_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge0_out>;
> +			};
> +		};
> +	};
> +
> +	dp-dsi1-connector {
> +		compatible = "dp-connector";
> +		label = "DSI1";
> +		type = "full-size";
> +
> +		port {
> +			dp_dsi1_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge1_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -519,7 +550,107 @@ &i2c18 {
>  	clock-frequency = <400000>;
>  	pinctrl-0 = <&qup_i2c18_default>;
>  	pinctrl-names = "default";
> +
>  	status = "okay";
> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;

No reset-gpios? Is the expander being used by something else so that we
don't want it to be reset during the bootup?

> +
> +		pinctrl-0 = <&io_expander_intr_active>,
> +			    <&io_expander_reset_active>;
> +		pinctrl-names = "default";
> +	};
> +

The rest LGTM

-- 
With best wishes
Dmitry
