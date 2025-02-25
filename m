Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597EEA44034
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 14:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C441910E0F1;
	Tue, 25 Feb 2025 13:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y68DGfYD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A4810E0F1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:10:52 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8dndk013317
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ygYBZ9DB9YSUCjV3ts2cfjtg+adg0ivMA3fujfqgrNg=; b=Y68DGfYDj77qcMi/
 2zsZ9HbdnbaJtJBwogbovVpvx5PL2FfTM6m/9CP6Y3reVov7bO7IGYiXgOcZbMPy
 IHLXWgi3pWlEzDd/tLKl6oprWdUWAC+EpMHSqZyV7D7Q6AwSfCOr/Yt9jiZMyiL5
 Q0D/LwQ+7/aCd8XPOc9HMpMNLhcS02cYhuRQNY2YpmzFb4//9ErBePNtEPWqFmUM
 UfgoeXZrmwSfUpmMv6lIvnOw2PwCUIMdIxyMYvywsZ6295g45Hnzn9vV6EzZv0Zt
 JSVmw0bwm2G68C/kVpTQYQ4NNq6bwF6/ui3/5Q3U403MyySCdLLD+xgU/aFql3SP
 W2mRPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wgs0nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:10:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-471edf114feso6217351cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 05:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740489051; x=1741093851;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ygYBZ9DB9YSUCjV3ts2cfjtg+adg0ivMA3fujfqgrNg=;
 b=b45wMqbALkjpsdnfkhYhQ+npL3TYrd5AG0sM2Tp4NGHxJruKoQgiBs/JeSP5RiWAMI
 disBcxuTaddEMD9+4VeLS8yLgiRgQMaQBC0qhR9vh//9G3JTLUGHQLR9F7tZ7GnYmbWi
 ey8gq1/awGDhfBj8jnnc3ZtmUeqUcx2LTBGr8p2W8/7vwTK4cQIv3P3bLFG01x1Eoaer
 K+vUuNvvyUWU8mMDhM7g3i8SF+31YeiUhxF0RSV+xVavtrHUKl/UW0loAVRWuKHBTomT
 /v0BjhTjfy1KvVGOfH7vp/rE+OhMGXr+F7MDh8JJ1/IxEyEY3o9n6K/3lshp7BswmdgP
 33Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfbucyjjza6tqHIftklH9oorQZ8pi8pMSiFaQYwX1FEO6a0OfLP4I1Drfdai63PqNeUmEe6kpod/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygXEle+OXPeGGaDnQcbQFoLSS+ZK31AH/FYPmbRkJXjG4eGFc1
 6WlppG/oqexUB4/gcI+/bgkg2GOISBFRWRrUPGKjQj9oIQwYhZEJK3BuqYhiI9n70XZWz9v7sQZ
 /bYq5vh0TC4xGrwfl/7y52AfiACubqdTpqoIYm7hymI4/LwUpi7iJyIdb9xuZ9mnRcqg=
X-Gm-Gg: ASbGncvER7MfbOKE4I6clK7kla4wsuT/pOcFKL7XNsgUrIuFxQtz+RBnwNOlyY3UtO8
 ZD7M0pglh0ixkJCRu+ZJOkppjaWZD/EPvWXU2pJSBrKRdfW7FZsDOkB2wrdifCdRkX70N1QTNKZ
 57/uBrQ9I0CfRcRS8dSF+bvTJ6q6yfxGPzeX+Lc26iIvvLAiA44eKIevrhwApWWMBq0KhXCdAnS
 XzBA3EnjtupapG3PFZOoKW+ncclNmc9GpiTfxq3eGHnMfRNHkAKa/0UIljzJAJq57E/iXUXGk3V
 pzM1uPChH7lcbS2AV8kmsmzdmV9P6KOl+OM9oh/Y6gxdo1m+bQyfKpSjpjtLTwmMgW/XDQ==
X-Received: by 2002:a05:622a:494:b0:472:801:3e6f with SMTP id
 d75a77b69052e-472229771b8mr97835351cf.10.1740489050908; 
 Tue, 25 Feb 2025 05:10:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0xw03/W+6JbMalKdB3Xj87E8H+dMaQ9tekePz+MT52R83K55h5CarFRLbuABJFco6rOWFow==
X-Received: by 2002:a05:622a:494:b0:472:801:3e6f with SMTP id
 d75a77b69052e-472229771b8mr97835081cf.10.1740489050525; 
 Tue, 25 Feb 2025 05:10:50 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed20122b0sm140606566b.107.2025.02.25.05.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 05:10:50 -0800 (PST)
Message-ID: <6600a115-a935-4d21-996f-e2251777fecb@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to
 DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-8-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250225121824.3869719-8-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5GxiuZhimrP56R186P7t17R-KVHHlcyB
X-Proofpoint-ORIG-GUID: 5GxiuZhimrP56R186P7t17R-KVHHlcyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250091
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

On 25.02.2025 1:18 PM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 136 ++++++++++++++++++++-
>  1 file changed, 135 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..151f66512303 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -517,9 +517,128 @@ &i2c11 {
>  
>  &i2c18 {
>  	clock-frequency = <400000>;
> -	pinctrl-0 = <&qup_i2c18_default>;
> +	pinctrl-0 = <&qup_i2c18_default>,
> +			<&io_expander_intr_active>,
> +			<&io_expander_reset_active>;

Please align the '<'s

>  	pinctrl-names = "default";
> +
>  	status = "okay";
> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <98 IRQ_TYPE_EDGE_BOTH>;

use interrupts-extended, here and below

Konrad
