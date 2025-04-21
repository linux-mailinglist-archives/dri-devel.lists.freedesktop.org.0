Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D47FA94DDF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 10:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C7410E352;
	Mon, 21 Apr 2025 08:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3Iz+LpB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BBB10E34D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:16:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KN7ZqH016844
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qARCO4unAM6dJGj6oIu6kaF+8Quq5ZnXo3x6/YySZCc=; b=j3Iz+LpB8LorWG4/
 1CRgb50Hdr7BG4LFJAXQcqfgg1+Uj9+RXqkWfEfMwjm6Apr+D8X6NSY0xWaIuiPb
 /8b4y4IATVJqv5A4W1NFSukAznl4+FtXIAf29CGI6SUP8+15uI+PgyGQ/vJlGzTc
 OJC/P7bHBUgYXsXmTkC2GpGB/vr5ToGLBauB5n6BbdB3Fw2TqPrV7e/ha9ILEL1n
 zai/mocynsO2NurF4QT4Cn0FxuUSuYd3QNDdlXDj+Bkzhx+1gn/wTaoigp8VD9EZ
 bkn2lu58n0V5tc2ASxUlKGGAUnFYjV7lMu5pulZzGR+MYYZPmuNf1VZjQpDQ51By
 NTUDIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454bkcvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:16:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c548e16909so310649885a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 01:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745223373; x=1745828173;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qARCO4unAM6dJGj6oIu6kaF+8Quq5ZnXo3x6/YySZCc=;
 b=RiElS0FhIQhSP1muZK7FvnYE14wAeGzXvJCUVwq8Qgy7XDAb3ReRMk68UtNYHkTaHv
 PcrlL+b1cCR8HLWeuQ47Ec5C6bBVwvVv6ZZk1MDitdEgA3NNNrSWSENlZX5Fgrnx+oc6
 UetK7Ob0Vd/FYFEMeQ4JkW2KMxh6XhIxRvKRXnhOdj4FiHwP0wLiV22oI/pXzppROnd6
 WVNQvc6O8s9Fb0Jttr8iY4U+DT+cONK1WYsIwI0tFG833BNy0u229IKVGHSHivQl+y4T
 VLYv0hmFY8AMoLbFcYbQsS/CVajoNhyvWzg0y10sKWr1z9z5JrShZRC9ea4KdXXzfUq/
 PnlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm+OOPftAIZ4fHPsiAxB7V1t3+Wjelf7UplkJAOIbIsiVOALSv4gvLPYX2YIbxZmTziP4NHYGJIj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNi4TpFG8+wu4bDypIK0LaYBQ9y2n0rYqFVxXwrC12RHxXga6K
 ZF7UsjwsoJu8Ye6YyezGQwalH5UiFXoeJ66OHpgckPQnwwzhk7Cnq9dVSGWcfkbzimM0ZV4Xcbb
 kz0Ka3NKh9cZir9SUYaOUB66KF1RVvIkHkjf8RkD97FcacuXBpCAbaYIAFyUrHJGLHrw=
X-Gm-Gg: ASbGncv9aTMjR3eSI62R6jYZzzWTzf0QiSKSwrNbhHJnJ6pMbxq8X1RgJiUzm+ZZhf/
 6IGVbFrM7NLywUuVoeBAeeKHq+NG1DUkVQNtiMB1aEj041YW5AFsUIVMwKCWFs1BzuRVTElObUu
 f7W9CgpoDj8H126dhmL6PvhQB+fxT+PsURUaS8G7EFFziVnnkwDUVIrgI4l8FEbhgIc0eScGlFd
 CaCtONrZiA/zaD9J/bSvAjUISAfp+hDQWx1T8W/T9Iq5JQsWCNDghVhv9KbnakmBrx7RIVtcxSF
 +R8naiumxV3wjRVym3Ji69eRbds/z5Z10ZbcOEOdquysADiVTW3GekKeZsWLlfj/zgJwm2Nbchk
 =
X-Received: by 2002:a05:620a:28c2:b0:7c5:5670:bd77 with SMTP id
 af79cd13be357-7c928049ca2mr1716049085a.55.1745223373006; 
 Mon, 21 Apr 2025 01:16:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjwyE7MQkTDxkTD4bMTdrQVyq0KgcRLomu9pE/oxDMbBAj8GbWGPITnj/B2mJvuVUIGwaJfg==
X-Received: by 2002:a05:620a:28c2:b0:7c5:5670:bd77 with SMTP id
 af79cd13be357-7c928049ca2mr1716045985a.55.1745223372683; 
 Mon, 21 Apr 2025 01:16:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e5424b5sm869330e87.95.2025.04.21.01.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 01:16:10 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:16:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8953: sort adreno clocks
Message-ID: <nxv2k2ofiao47w7gmqcgfgn57heucs6yp2og3lkzlavjarado7@p5u4663yw3oz>
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
 <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=6805fece cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=StrfYul8zGH_qiMLSD8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: wA0FYRCeDwdWAQo4pz9IEwe9kC-mPLwg
X-Proofpoint-GUID: wA0FYRCeDwdWAQo4pz9IEwe9kC-mPLwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=961 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210063
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

On Mon, Apr 21, 2025 at 05:09:22AM +0200, Barnabás Czémán wrote:
> Sort adreno clocks in alphabetical order.

Why? The order of the clocks here matches the order in which they should
be brought up.

> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 4793a60fa946195d3220b6c44dec170d443f56db..8a7e80c959fad09f950fe202eba76d3aae01d1ea 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -1052,18 +1052,18 @@ gpu: gpu@1c00000 {
>  			reg-names = "kgsl_3d0_reg_memory";
>  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
>  
> -			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
> +			clocks = <&gcc GCC_BIMC_GPU_CLK>,
> +				 <&gcc GCC_OXILI_AON_CLK>,
> +				 <&gcc GCC_OXILI_GFX3D_CLK>,
>  				 <&gcc GCC_OXILI_AHB_CLK>,
>  				 <&gcc GCC_BIMC_GFX_CLK>,
> -				 <&gcc GCC_BIMC_GPU_CLK>,
> -				 <&gcc GCC_OXILI_TIMER_CLK>,
> -				 <&gcc GCC_OXILI_AON_CLK>;
> -			clock-names = "core",
> +				 <&gcc GCC_OXILI_TIMER_CLK>;
> +			clock-names = "alt_mem_iface",
> +				      "alwayson",
> +				      "core",
>  				      "iface",
>  				      "mem_iface",
> -				      "alt_mem_iface",
> -				      "rbbmtimer",
> -				      "alwayson";
> +				      "rbbmtimer";
>  			power-domains = <&gcc OXILI_GX_GDSC>;
>  
>  			iommus = <&gpu_iommu 0>;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
