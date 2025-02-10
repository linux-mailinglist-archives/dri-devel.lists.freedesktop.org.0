Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A15A2F394
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 17:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C663710E391;
	Mon, 10 Feb 2025 16:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gH+hBbsr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FF210E391
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 16:32:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AApVc7011636
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 16:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jCHUXPT5Jmbjgw9rgNlW8gb3OHlH09svIQMyIII50QM=; b=gH+hBbsrMoJ0EZtr
 8i2tmGkDg5i78VFBr5c7s4xS0HArBGmQZ5On0j7eb55KczTFAI0rXFIu1h8jEy7D
 eu61Omh9hv+m2juT994GxYFqaNRblpSa1k1vbWFxm0cH2QbpkHbO19U0e5r67RCW
 a2vp8t1nr3uABuHc9TVwQszgo11vfz/9UcFND7sJAExK8Brv7Yq3dSvH9Fzn0j7N
 +Pe100+3an7fT3omg76JyVROf9UVs15e9vPfMySrF4PZmQDYh/u2qutk50Ylg4SD
 3optfukyB7cOoZKqGasLI5Qm2sy86HDFiigktd16ijFO1KOiS8/XWpJcu4HFlUCn
 wLzEKg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44q8kya4af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 16:32:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e448963aafso9486626d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 08:32:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739205134; x=1739809934;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jCHUXPT5Jmbjgw9rgNlW8gb3OHlH09svIQMyIII50QM=;
 b=ugVtfMbwV4xFrowCyOm76NsovCErzl4lXHVbl0B/cnnLuyZT+5nZWJ/eXNML6/OSI2
 CQTcugtiQs2NhbgBynfSHuZ84FsdnjHDcFsKtpQRYAZSN9jS+mPKThfnwPr049BF7ICk
 FRhaJtORvNT1yYtNBVLI6tPbMkuWRQeIxNaHly3kQWQQW29LrBBMKpsfLHrAULF0qVAk
 nFaqLV+P+AE4BjaSNTvdvWHqUvLLP+Ojj44ntQmdB342Kn8K9jj6YPwLegUY+qJy1goT
 VmL9r0aVhoLBFnIOPle6PvvGutVbBzUFqcDltg3ctI7S2ehmSCYNXJmD8IJLt+A5XgW2
 cpGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT8q6TVWsqFNgHuwu7B45gSpwBvGyaZsGKW0AoxbNOiB2oahb/xeSOQQqYIz5Z16AUY36gX8Z2ilY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6LvvhFp/NNDl2ikNLJt9qOkk/UfYuqH7A1e1l1KaIll9aUxkb
 GH4+r8HL6fWWE4KOhFCKc6RLt1V/97H5sNwTjIuno2YpBhqSK+PQU5nLZXee8S5g+B9fwbNE7X1
 /tfcIxraHJp8Rdf9ezpKtTKE0VlBJD/Xa/4QMQnQYp2vlhuJ8q7QxtbJJj9omm9yqSJQ=
X-Gm-Gg: ASbGncvMcA9onlSzGL2uHNkremtzlwx2jYqlJLCN5ur8zw4b9qDL6KCZLJLja7IEcyz
 HVCeVd/3PG3bdQfkjgSRcjeQHAgZzes/JtuBQJzqDkY0gyq3eqXJhHBUx1nzWLQgajuzak4O9F7
 hMM0jdCoh5tnu/6ei4se+vr/9A/bO0HNfMN26pGVmYX7qKNQEvD77EKJO8wmmNGO/AynECFrSra
 k54yyBPO/i+/Yp8fHKXW+4cOC/Zf4LBTNtCYING22+jyyr1no1O33VycjL5C2pWkj5aGOPK/CFM
 GyRCPN9N+yzrLl/VyasfsEKTlAPwDdX9hgixwFGgX519C/+jd58q5yeMMsk=
X-Received: by 2002:ac8:5852:0:b0:471:9ad0:9cc2 with SMTP id
 d75a77b69052e-4719ad09d04mr9899401cf.10.1739205134098; 
 Mon, 10 Feb 2025 08:32:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECQbeD0Elon8YIvNJ6FOZ4xgWrOhjbb6XFnJ6XLJ3Ft6s4VlucVZP20dQP1lS3ytB3OAZAtQ==
X-Received: by 2002:ac8:5852:0:b0:471:9ad0:9cc2 with SMTP id
 d75a77b69052e-4719ad09d04mr9899271cf.10.1739205133726; 
 Mon, 10 Feb 2025 08:32:13 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7b5d8d4a0sm353484466b.159.2025.02.10.08.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 08:32:13 -0800 (PST)
Message-ID: <a3f7bef6-bfc8-4a2e-b979-4aac7908306f@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WHXj9TBRzF5pS2Zz6MnHSClpwH-eTDWx
X-Proofpoint-ORIG-GUID: WHXj9TBRzF5pS2Zz6MnHSClpwH-eTDWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100136
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

On 10.02.2025 10:32 AM, Neil Armstrong wrote:
> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> add the missing cpu-cfg path to fix the dtbs check error.
> 
> Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
>  
>  			power-domains = <&dispcc MDSS_GDSC>;
>  
> -			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
> -			interconnect-names = "mdp0-mem";
> +			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,

QCOM_ICC_TAG_ALWAYS

> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;

QCOM_ICC_TAG_ACTIVE_ONLY

w that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
