Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B704AD0FB0
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jun 2025 22:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6A310E2A1;
	Sat,  7 Jun 2025 20:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmqkSygF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B67010E1EA
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jun 2025 20:17:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557HPRxL030124
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Jun 2025 20:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3qmPnw84nsjJYSerO2qslMAX
 4/52384vseCZfcQGqxQ=; b=SmqkSygFjoITTti8NDVWiGXB87TBwoXsGzz0jB29
 B1v099QQlLZbr2/Rzz3bV7j7dZXfXg+OYv0Zgv/kzBlKy2yntIpoRR+KQxSQ0Uj8
 7gREUCR+hhRytxVXgVUdYFNRAl9MgexhdE83DI6K+AKmshR59fTRrhtfNV7q/X4A
 DuJ4fPbjS9XdmMY87lBwqXupnw5fqOU0zcseQigo93IcpanRfMm5CwaRkmHgd9YM
 AZ6IP4RiSIqm0y3mBhg093q+tIJ5leZXehJq6QE3b9tn2+qEagzM3cNp4Srhj8ju
 fV7QohUY7UCUYxvGqW1xA7cMRpkXAleY6tq9IBoeZ0V3Fw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqc8xb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jun 2025 20:17:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5e2a31f75so955177785a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jun 2025 13:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749327462; x=1749932262;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qmPnw84nsjJYSerO2qslMAX4/52384vseCZfcQGqxQ=;
 b=L+3GYoZ6ftaEZKfBe2fIxu52KEOob3yiVNeU2IJ7Dvbg/99Vb0R2E7rt20DLR9fU6V
 tbovf4ILvE47rzNW1OTcSL23KvpmKc82ESkelLOdiYwr3YizPpqtpm2pKjwUnw6p74HE
 Nme9Snqw/PCTbLJgliV2iGRdNE3UEl0wp8s3yNG+AokzutDMNwES5q5Hn1T2DfSCJe7T
 1yZ6B9zIrvRw7n6TVhSNVw+nnGCdhKqcbuWSxn0RhwDa1cIlC/Bb0Em1zZ9YQZP9Hy+D
 BTTnw1k45i4DZ1wnNdk3dHur33NE3lQ/s1qnQjxRYEW1NRnWnSu6f0riMfytc1tD+4W5
 D2fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIyYMlDKFnNuSF0Z0Krzyf6AWGpxcWzt2JXYpRQQAXCHESSHcWQKenlo0MPaH2Q1vPxWGhEk8eckY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP6Hy2PR77kWgYOsnYvDyQnhsI6vPJGYjWjVs/PTgIBpXW/Nsq
 XSyY9KCeD+2HSJd15AfAUaQmI7Z4PTt2ESlKiSVG0TK15WIsfgX2LMNoFfqUIVm50u873vcu5fD
 OutZugxlTa4D33i4v3shMTdLgXsX9GO8G+W8F9d+fiXpwXY9XczBLxYGQefhAzGz0dvtzWzE=
X-Gm-Gg: ASbGncthJJxr/cZsOiQXkXsn0LdMdZLzbxo1hWWw1Pv3yPqT8sXbgsp8/gliCZ7Wmwq
 bzjLgBca1E32NRiiNiV5vAl0sGHZOOFIlkKOXUvw0U93UPOcGgpO2wmbXEqL0tZe8eDWZno5651
 JWAo0lcrHeAkPuF6qLYcY1s58jGbpkvzVE00Qp+UlFcRn8zi4jkB2bJPK+vLXIekp8xUY8Q/yKu
 iI6ArujCtly9xknORGZPfpJm/QR6C31PPNN/fnd6IueJqNCrcv38f4M1Chm/8OdFnm6D8weUhjH
 yRTfTULRuTOe42r0ivTtOGq3CObp5zAI/Y4oKYGKIOxExB4yUBRm9ViiC64eTyyD+LdBh5/YG6b
 3ZjuHNtUHmw==
X-Received: by 2002:a05:620a:2489:b0:7c5:4cb7:ac97 with SMTP id
 af79cd13be357-7d229861565mr1147394185a.1.1749327462089; 
 Sat, 07 Jun 2025 13:17:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMiOJSDHgZKgzl6P5JWEjv6Hum+DYD4sgyillMmaY0OHg1MeWucp1e6XYNy6taJN/WTT7xyA==
X-Received: by 2002:a05:620a:2489:b0:7c5:4cb7:ac97 with SMTP id
 af79cd13be357-7d229861565mr1147390185a.1.1749327461662; 
 Sat, 07 Jun 2025 13:17:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d00c0sm600890e87.22.2025.06.07.13.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 13:17:40 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:17:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
Message-ID: <wayrour74vlli27xrtxi2ff2v7q7ye2yknmk2mjpur5ry5gruv@hhh2mdb6lw2i>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfX8HIHnkjt52+G
 K0r/84SrXaIdsgkjZz9SFgoodfFB3TrwSIgGRlKdd/qD9lqkn0ffB+oFpenlV6AgV/2S7CVTZi9
 d37TjB3lefNjm607S9dC9+INk/cAtYpZAxST5Am+GrsxtRxd4N5ul8sf5u6LUG0xwsUF6y5YCFe
 dmRMkSeOtny36D6Wkien8l07+AyzKVJoTd13PC76dXwrV7Ltgl8DiPnO4RuQLoiDWv2lzQ6NTRM
 +CN8JlF0zbbzlr3v3KWVnSPRBA/MsuvdqMdm1nmyj2rrYUzVYOenBAkxMCKl0r45MVy5ZmKeXKu
 +smtoMe73Xb8jNLXXz2TVXF4zY9xuVs303a0uaFMNU58F2psFkiEdAfMb6LEtst/ofQUtES3jkG
 9vXabJABsd90JSayJpYQBCky/HgM1o48j2Lofp+couaX5fYPMyWjP0kxfRvehUoeUrLXNg4n
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68449e67 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=AdQzqMdWex-Pz1pjKtQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RrUIUAoa8bnS8lO0GBbHu87SmI5uJLXt
X-Proofpoint-ORIG-GUID: RrUIUAoa8bnS8lO0GBbHu87SmI5uJLXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070147
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

On Sat, Jun 07, 2025 at 07:45:01PM +0530, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
>  3 files changed, 131 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc901f461384dd9b0d4 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
>  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		qfprom: efuse@221c8000 {
> +			compatible = "qcom,x1e80100-qfprom", "qcom,qfprom";
> +			reg = <0 0x221c8000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		pmu@24091000 {
>  			compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>  			reg = <0 0x24091000 0 0x1000>;
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> index cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af83078253fd39ece3a0c26a49 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> @@ -15,3 +15,7 @@ / {
>  	model = "Qualcomm Technologies, Inc. X1P42100 CRD";
>  	compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
>  };
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d43647888aa6eacac3de2ac9d 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> @@ -17,15 +17,134 @@
>  /delete-node/ &cpu_pd9;
>  /delete-node/ &cpu_pd10;
>  /delete-node/ &cpu_pd11;
> +/delete-node/ &gpu_opp_table;
>  /delete-node/ &pcie3_phy;
>  
>  &gcc {
>  	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
>  };
>  
> -/* The GPU is physically different and will be brought up later */
> +&gmu {
> +	/delete-property/ compatible;
> +	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> +};
> +
> +&qfprom {
> +	gpu_speed_bin: gpu_speed_bin@119 {
> +		reg = <0x119 0x2>;
> +		bits = <7 9>;
> +	};
> +};
> +
>  &gpu {
>  	/delete-property/ compatible;

I think, you can drop this line.

> +
> +	compatible = "qcom,adreno-43030c00", "qcom,adreno";
> +
> +	nvmem-cells = <&gpu_speed_bin>;
> +	nvmem-cell-names = "speed_bin";
> +
> +	gpu_opp_table: opp-table {
> +		compatible = "operating-points-v2-adreno", "operating-points-v2";
> +
> +		opp-1400000000 {
> +			opp-hz = /bits/ 64 <1400000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
> +			opp-peak-kBps = <16500000>;
> +			qcom,opp-acd-level = <0xa8295ffd>;
> +			opp-supported-hw = <0x3>;
> +		};
> +
> +		opp-1250000000 {
> +			opp-hz = /bits/ 64 <1250000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
> +			opp-peak-kBps = <16500000>;
> +			qcom,opp-acd-level = <0x882a5ffd>;
> +			opp-supported-hw = <0x7>;
> +		};
> +
> +		opp-1107000000 {
> +			opp-hz = /bits/ 64 <1107000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +			opp-peak-kBps = <16500000>;
> +			qcom,opp-acd-level = <0x882a5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-1014000000 {
> +			opp-hz = /bits/ 64 <1014000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +			opp-peak-kBps = <14398438>;
> +			qcom,opp-acd-level = <0xa82a5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-940000000 {
> +			opp-hz = /bits/ 64 <940000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +			opp-peak-kBps = <14398438>;
> +			qcom,opp-acd-level = <0xa82a5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-825000000 {
> +			opp-hz = /bits/ 64 <825000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +			opp-peak-kBps = <12449219>;
> +			qcom,opp-acd-level = <0x882b5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-720000000 {
> +			opp-hz = /bits/ 64 <720000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +			opp-peak-kBps = <10687500>;
> +			qcom,opp-acd-level = <0xa82c5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-666000000-0 {
> +			opp-hz = /bits/ 64 <666000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +			opp-peak-kBps = <8171875>;
> +			qcom,opp-acd-level = <0xa82d5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		/* Only applicable for SKUs which has 666Mhz as Fmax */
> +		opp-666000000-1 {
> +			opp-hz = /bits/ 64 <666000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +			opp-peak-kBps = <16500000>;

This looks odd, why is it so high?

> +			qcom,opp-acd-level = <0xa82d5ffd>;
> +			opp-supported-hw = <0x10>;
> +		};
> +
> +		opp-550000000 {
> +			opp-hz = /bits/ 64 <550000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +			opp-peak-kBps = <6074219>;
> +			qcom,opp-acd-level = <0x882e5ffd>;
> +			opp-supported-hw = <0x1f>;
> +		};
> +
> +		opp-380000000 {
> +			opp-hz = /bits/ 64 <380000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +			opp-peak-kBps = <3000000>;
> +			qcom,opp-acd-level = <0xc82f5ffd>;
> +			opp-supported-hw = <0x1f>;
> +		};
> +
> +		opp-280000000 {
> +			opp-hz = /bits/ 64 <280000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> +			opp-peak-kBps = <2136719>;
> +			qcom,opp-acd-level = <0xc82f5ffd>;
> +			opp-supported-hw = <0x1f>;
> +		};
> +	};
> +
>  };
>  
>  &gpucc {
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
