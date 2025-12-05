Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC7CCA94C3
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 21:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB10610EBB4;
	Fri,  5 Dec 2025 20:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpuPZvPk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOOOG5uZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850D910EBB2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 20:50:15 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5FBJhW4177142
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Dec 2025 20:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gw7CznOoeqy7ZE8WuH6aXklC
 ydGAte0EmNopHFxWFiU=; b=DpuPZvPkjLH39WxsReu1Ewe4XDEE5wIq1w/Etkh8
 43869rcGv+KOk12BCJBlYjmxYQ8vVrYPPisqndmyetGrDdKfS5//ip/znLJLwRA2
 s1mLZ516qxzmplTVZ4A6TBF4McxklD4ROKopE9Fh5VGiHtAt5ccZ7h5Xw8QAdMco
 H7ZoMZyIoa8vFtRIg4nk2bH4AWVKqWef75Dp22LpmxY1eVuLpeW3m7CX+AwiZI7K
 oR5/IWjv44BtQMndN4dwxVNB0UbabGa4pXRxpQzjLKNlxroobO34i1jhtud6P+TY
 q+9+W1Zx0WZFhyninPtQkWscPof/zxe0VsG18+CWS1II1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm59nre-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 20:50:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b30b6abb7bso516297185a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 12:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764967814; x=1765572614;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gw7CznOoeqy7ZE8WuH6aXklCydGAte0EmNopHFxWFiU=;
 b=HOOOG5uZq5MdKg0gf1o9LtoSZ2/ZhDodhH/jWvIeN11AsLiRnCzrpyONQiGpn5wEtA
 TFX6kQMODfp3ptWKiLmyrD1iKZeIxwVx0ZNt8MBaAnYFny6a6f2AtgzcmhbCDCTx61+4
 H5h831seHxXv3zAZ7TatfaPRs+VIG1oqahPpQyWzneTXRpnqnzB+rZMR1EUkXsf7yif5
 W8a7YjfaBEhvWoCylcCfHP9Cxi8l5hGJpq0ZJ+cQMRovipwxoRbiP652s4Dmpw8aS20J
 oGZskLuwE88X36uVD+skrJjksgcWCVuaNs/RxJp4GqnHPD8OHZAoDTlLHT89j7ZR/Hfp
 893w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764967814; x=1765572614;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gw7CznOoeqy7ZE8WuH6aXklCydGAte0EmNopHFxWFiU=;
 b=XUsHfT7sd9/A19dwFjFdV2DqekNfRVuGfCXmpqCPlH3qoEP25WwGV9Uz1N9bdQ/T3M
 WqJibj1/2a/OGWsjkhZrOfW6aithunRK89DsK9kbAW8yXFgBOHjhinaLxYUjjPl8ilpI
 gfUOUVMj6wpwGDlcgIKCmDVbdr7Xl/H8Ab2UHCAxa3LS8dxLPDR+G8vWP+Ee2AbRZlU6
 IOSAg9ttytIdMBUQpOdimlIPpc7MKIqLr5OqxbLt9cmxYu3T59uZJBKYxUITnfSTJw/l
 P10p2xcPuatKlSUHqyqGQwUQFr3Ugj7PAMUEv33AiSSpmR/YHdmFnSMjUAh9y6oYwFta
 3ihg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXVwKnB40vwDilEJoSamAue+eLN+5cmcH2LB27OqzTDmswtQgRrJsnITyZMLSV8kvuOglFVmdococ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5qYVyzvFd3PxpAsBDIo42Ua1XFc3H7XablvX7OIOPqmplIWJE
 ld34DbOST1SCyZRD3WcouFQJbkN3clAMmNtPPfU5VTbV6jI/M5JPof0pp54QqNWw360XJ1JvRNB
 g3nTXCWZF9heHeDuAhJ2LMuabXoQGnLsYxVsSwDkFpssaGj/QHjVoMA/XNG2eSV5DLt69/go=
X-Gm-Gg: ASbGnctmre6xhRDDjbyZzU5A2LThnFpQ8f/zkAZMFlgTG9NO6nEermaXHgQwh7QHj0s
 6nu5DWSHdLTP6ZV5pQV6CUQ68dufGSeLcF439576t/GDZw5v1Yxk9mhexKBpG81ZXQ0FlfRZwbk
 5S3OjasOc9AAeo0kNKunT6XQXrmydcvVCqCwL1BqsVbPTFoLrz7Iu0Vwxu/Fx93cB3qdM5s0ijI
 hayMiBQFcgJOAxPqeSdFyNHiUQhwsiJ3L12JUGv98ppR/XFIRoUkdkECDBlYmb9hK5bDZtEeeo+
 JrCOeObCPHQoq/LDhS/q3MP+auHNImtTYrnjCeG83L84X7nK0zmo69sMch0Cu7/1p6eYx+cOaKK
 zedbrP6uAHDohfLMt1BFnU3jR5vo+e2/v8mgUsyb5oW7/5Vff9ewKhzNta1aJNET5JhXkabzAT4
 N4Eh7MIfkvnSjmKoJwRr1bzAg=
X-Received: by 2002:a05:620a:29d5:b0:892:eeb9:4def with SMTP id
 af79cd13be357-8b6a256a79dmr55987085a.49.1764967813819; 
 Fri, 05 Dec 2025 12:50:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxQfS5gFXwOoXS1F9lFdXo5Ot/z20q2txyTRwyA/2lJFyTKuqo6sTodobEz4I40L/ZDD545A==
X-Received: by 2002:a05:620a:29d5:b0:892:eeb9:4def with SMTP id
 af79cd13be357-8b6a256a79dmr55981885a.49.1764967813304; 
 Fri, 05 Dec 2025 12:50:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7b245b6sm1790426e87.28.2025.12.05.12.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 12:50:10 -0800 (PST)
Date: Fri, 5 Dec 2025 22:50:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v4 6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
Message-ID: <uo6qbq5porpdqsne7a7y3wn5tj2jhdqxf7shy5pc22eo6lp7xq@uzpfng4lzz6o>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
 <20251204-qcs615-spin-2-v4-6-f5a00c5b663f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-qcs615-spin-2-v4-6-f5a00c5b663f@oss.qualcomm.com>
X-Proofpoint-GUID: u_G5-ZgRzLhlmyEoK0eI4Kvbt_E3TWWE
X-Proofpoint-ORIG-GUID: u_G5-ZgRzLhlmyEoK0eI4Kvbt_E3TWWE
X-Authority-Analysis: v=2.4 cv=XeOEDY55 c=1 sm=1 tr=0 ts=69334586 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VrvhRaur7Q1QZtYE1qIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NSBTYWx0ZWRfXwmazNs09kjsy
 bV/edQbzE1WwBou0uzZeaRwdN/Y29wPWQ9cuEYr5/dsjq9m/b6OQjS/88QdBtXeACpO+kcnW9YB
 QMlKxTyCBiFlojxqvI7JiqFiQK9SBPaPYO/4dCs6QnvE1y1ZG5C2LPV/etg5DoQVXHAWBceQrS6
 D0O7TNH/UgvieNDg8Yc8AtOt+HNI57KnGOhGuG6yZiDZJLDW3R1tEhQlTj7rtolwMSdzA04yZ9+
 iamnTLrw9jb5ONu3o/smdPPkmB4Ieh5ThxAGRUqYNL1AKaOdLhwrnqJh5ji8zlxGzLoqg86HU/X
 DrifnnZwx8s+cwAVbJaI8AJSrSCnEE7H094ePeyXz/rM2UD1vJnWRO/rE+DOLWivc3FTOzG90tH
 E2+EYcdKmLaxTsI8UIkVdSvlwYYU9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050155
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

On Thu, Dec 04, 2025 at 06:51:58PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for Talos chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 110 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 743c840e496d70133bf82928e9e0c3da9653a5ee..effaff88df83d5e6a0aab45a2732a00cae11e83e 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -647,6 +647,11 @@ rproc_adsp_mem: rproc-adsp@95900000 {
>  			reg = <0x0 0x95900000 0x0 0x1e00000>;
>  			no-map;
>  		};
> +
> +		pil_gpu_mem: pil-gpu@97715000 {
> +			reg = <0x0 0x97715000 0x0 0x2000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc: soc@0 {
> @@ -1826,6 +1831,111 @@ data-pins {
>  			};
>  		};
>  
> +		gpu: gpu@5000000 {
> +			compatible = "qcom,adreno-612.0", "qcom,adreno";
> +			reg = <0x0 0x05000000 0x0 0x40000>,
> +			      <0x0 0x0509e000 0x0 0x1000>,
> +			      <0x0 0x05061000 0x0 0x800>;
> +			reg-names = "kgsl_3d0_reg_memory",
> +				    "cx_mem",
> +				    "cx_dbgc";
> +
> +			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>;
> +			clock-names = "core";
> +
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "gfx-mem";
> +
> +			iommus = <&adreno_smmu 0x0 0x401>;
> +
> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +
> +			qcom,gmu = <&gmu>;
> +
> +			#cooling-cells = <2>;
> +
> +			status = "disabled";
> +
> +			gpu_zap_shader: zap-shader {
> +				memory-region = <&pil_gpu_mem>;
> +			};
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-845000000 {
> +					opp-hz = /bits/ 64 <845000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +					opp-peak-kBps = <7050000>;

JFI, An ongoing discussion in v3 regarding OPP tables and speed bins.

> +				};
> +

-- 
With best wishes
Dmitry
