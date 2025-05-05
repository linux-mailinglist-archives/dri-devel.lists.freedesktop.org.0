Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3BCAA9085
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 12:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F81110E32A;
	Mon,  5 May 2025 10:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pr5Ovneq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B6B10E32A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 10:02:44 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NHltg017230
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 10:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/9fYSq5DweCt0c/mKdUYu4zF
 2w/AfXBHNdWtUjJsnQE=; b=Pr5Ovneqtq/III50Kuv4i44I4PfmNM4qEPTCqgeW
 2MZSh/b5Mjc5oNqAzl10w9BJwm9CzrB/vf6fUEdCtZwD6RDJM1kyoLkcOVg8DdPJ
 O4oftrZklUGUjpBPguK9FBGPc824v543r30vi7PsGTamSJUsFpW04UDxIWO2CXoU
 CdcK8tWfAY8j5DHQsxxSihY10/MHpK8ylhfZcFDcrQ3maKfeIhxS6DUijW7EfmWX
 tAkWpT7Gxs2JzY2DkB6Maz3l92h1VIdbS7m11lMJ3hHXevr6hco7cKPEyT7uGtDh
 6cVgc3qHOSq5KITO2YSPaF5lWc7cZYZZUG1R0fvh1tfwmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n3kt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 10:02:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c793d573b2so114376385a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 03:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746439352; x=1747044152;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9fYSq5DweCt0c/mKdUYu4zF2w/AfXBHNdWtUjJsnQE=;
 b=bRM4uca54/LVL0+cdnHAKRTNH4XuTRSCPrMP50SKk6e2ldTNI2KQzOYLuEHaDJAwox
 M9VC5FHoQp2xYKPXcapDnZ6ceSw9TQTJ5dVOU0XzyDgcVC0fwKZweWEUfnPCCrnV4aV1
 clfgl+Ya+MBa4eTkTWVY6pEkTJhRariYulUmQSoEMSUMijNlb0FvH5M1+pbxFg+6+dfw
 sH+Bx/uonocJXsn1acVStow6CGqB6AJ/6mjzdHQq8IS+G8n4yjLL9Ff8KYD7cDczoCdl
 xo/lhM5sEEYTiKdFhXJfytUT44pXCOOtAwhAFiT6sLNHdbTlxTFm2DIlR4o5bKKeEqUl
 js1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwRXjIXMyNxNOL5zNLytWuYX1y8/FdWUHicJ7EtZvYccDSG+crW3SWGvarxhi0/oVofR/3WXVxNn8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFTwIz6PZD4jvVAlTjp3XMsC2kGyvx6ghWBnwVHKBej/gdcezj
 qPoWV4YhVAegQFxinTGvuDd/pcOmPXjdtuVpgDiXpsaB7QbSJYpan9mpO3he/czPVcPYXOMf/4t
 Cvyn1ona/GDkQo2pg4JkLTtNWr8Oa9neLqGWNWsU0dN1czKN1dMSmPIeJWwn+2WaEa6s=
X-Gm-Gg: ASbGncvcHa6mBvhqpi4ZbSAW5g/CphGI6SeJiUagRTBD60guK1aUyU5i3rbWtiYsBu6
 6T89kOP6iwzoAb/16SEE4XQlspa9Rrpj9Cgds6WxhCcnsysCIayMGfTdG1iGmqn7l04e4IlAZHz
 3l3u/wLXeQCuLPwZT1FlZpPY5h4U8Wq9FL7/nxO6YdpiaU8A6ytvWBLb0Q1qUHztwPRcsrjJX+T
 8RP/POsh0dmrpkdUnSP20+SsPe1vuHeKkoxG24ibRDLLFmwFUBB69Pb6VpWb94+2esjwQNSKXSi
 2X51QRTtYLnABG5df3MdjaLgyRDT0CaazvTlWCUEKBuDnOROE7+nnJ+GFfyiPAdHpBWtErp6Ywk
 =
X-Received: by 2002:a05:620a:271a:b0:7c8:e67b:8076 with SMTP id
 af79cd13be357-7cadfed7d3amr1246673185a.50.1746439352347; 
 Mon, 05 May 2025 03:02:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqWph76clESWo+RRt5n+cffHDapDxsmW2FMxzwgdEB/oc5DR9lfIjFKZY2YWluhdW3xKhUNA==
X-Received: by 2002:a05:620a:271a:b0:7c8:e67b:8076 with SMTP id
 af79cd13be357-7cadfed7d3amr1246669085a.50.1746439351979; 
 Mon, 05 May 2025 03:02:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202b18e4aesm16561471fa.113.2025.05.05.03.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 03:02:31 -0700 (PDT)
Date: Mon, 5 May 2025 13:02:29 +0300
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
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <grwlmrgi5cfv3jtuki57ug7gsqykpwdf2to2l7di6glfxtb7vz@6id6cpfkrbuh>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
 <20250505094245.2660750-3-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505094245.2660750-3-quic_amakhija@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5NSBTYWx0ZWRfX2NgFHnNOYobF
 4420An4C2UooSlHUkYCryBuefl957fN4bWaJCTWmH/OllBf0DMVC6FaNFNHvTdQumgc5P59TzvU
 7ojc6hl2o1VGW7o8VpJVNphUIopLC+QCozBoWN2qYzUgav63PY3LBzXqwSsum24Lea2oDQoxoRo
 ZfYfLSDZ1dArFI0aB2vPJU6R2wHls2qLmpmsIhOTtocgOI25qjawO77gSIZbQQIQsy/7oUAt8cv
 AyOUaaTAdSpKc3pj+s4e6c8hKH6o+RPv9U8k/d0tdvYPijn56DbwMn5BqCeljIkfyzCQZ1xGlTH
 DA71zodBpYa5PvcMdFAJWBqbyKtHpBVSDbmeztLxlbQ9l+T3lYf+FfCiheBiy75i6AT2JSN/1tG
 FLc6d9PCl5Kux6YQ6OpzEH4rHnT3Z8IS3M7/tnRUsoNK6pI06D3nO9uQKfVrS2kYlcUeiBwQ
X-Proofpoint-GUID: Qp4yCyhMgGp5XfeajXI0UrP75gbmlON1
X-Proofpoint-ORIG-GUID: Qp4yCyhMgGp5XfeajXI0UrP75gbmlON1
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=68188cc3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NFKUjzz3svuqp3DBVBsA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050095
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

On Mon, May 05, 2025 at 03:12:41PM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 183 +++++++++++++++++++++
>  1 file changed, 183 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..de14f3ea8835 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -28,6 +28,15 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;

12 V, if my eyes don't deceive me.

> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +

[...]

> +
> +			bridge@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> +				vdd10-supply = <&vph_pwr>;
> +				vdd18-supply = <&vph_pwr>;
> +				vdd33-supply = <&vph_pwr>;

Here you are saying that 1.0V, 1.8V and 3.3V pins are powered on by 12V
supply. I wonder how the board doesn't trigger all fire alarms in the
building.

> +

-- 
With best wishes
Dmitry
