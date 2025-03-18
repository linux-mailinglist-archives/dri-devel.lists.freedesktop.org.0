Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A3A67396
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 13:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286BD10E470;
	Tue, 18 Mar 2025 12:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZBJi8cT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E1710E470
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:15:25 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9XMao006427
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kBlzBdfbGBXQZj0t5rIkzUhCArX3NpjNQoG/8nV0x44=; b=fZBJi8cTewc/hnHh
 XlCpzNGxV2zM+UyAEaj1hwbgD0b6O0kw9E0ymVXaPwJ2qYYjwabCx6svQ3eytUjW
 2zAqHgRbx5DQu7cd1sBM+maB8OwWD86BI9DxQA3Z8gefFhMsJbiiSODv5fhEiUtx
 WbSN4ZzyNfndiEatnAWVG3rJbJU5k4oR7R13W/NrLZcH2UeKFAcQSgLzoW5n+YpS
 vvKNViR6JLGyGNsi6VN+RMPt+RGzShbvZdBDBNbe5dDDid8AY08JfimOYtoE4DaP
 GFDmqw1hQo9jjdHr9pCQPxvKMTHRG3Wh2vn4jt2MjbazsD10FdKo8XvpqirrI6qb
 bkl1mg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdr5kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:15:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e8fec7ab4dso12585136d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 05:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742300123; x=1742904923;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kBlzBdfbGBXQZj0t5rIkzUhCArX3NpjNQoG/8nV0x44=;
 b=kQMrvElaTJ4UosWJp40gY9TTb/kWzm4pw7wdfPdEL+hMcRVPONMh65R+cXpmlUNE2d
 a8xOgH3hHqti8zqAaB3j4MtIKL35sT5VCkBMKE0NBFb+bMWikHf5O5ckK5GnLJmdfhqE
 nNdzcbHaE6GFJFJrBIdgtn/D8pE3cnIMjHs6k8f98RxgDYsHRU4ALb7AQD6zjmHHEFtd
 3qci7vNfAxs8mckdxC7psF6K8vfgvJWA4+uJLQcQo1/f2DUxaVlzF8Faj+h8xDu+SV3W
 2HUVqlO34GzsEVmR0PGlLU5FhfJA5/NiuxIToaAsI00WnXgTwq/zBAVCk49BUgEOA7E6
 pcXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCMe++UgZoflzia8dEUIjM1G8X4mWosBzZwIniaNpB6tPUszjfXh0nznU399KQoFIEBeAsnuYlZI4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDhK6ZId+L4GQ6qDvIzWT7nl986LZPT+kOhpHkMtA4Jnrq1b1W
 ImodPdZNiZcHE7/559aDUy8/0YkJZY/GGHrcHCJlCfpUaoGhaD/R8fupGrUF3EwA/iRb9yTJ37k
 z75iUpfNaq6XanzC/msDzgSmcyZYqyMn077R9jOkB90jNF4PZrE8wCPU00qn/jzRCrOs=
X-Gm-Gg: ASbGnctlfFx4LA6m/SUjv4aKHdzKFqqhUyvXh4oIBixWYb+QN40+aZGM3L/CHsxjecr
 rYpvuHp//YYw0e9dsTsfQ8/+f8qLDCa4EXQzXusjfvMOKGndUSQJqQ0zXpf3ewrMsP7j8rikdIM
 WYkD98giJCpLGHztf90WBgqX7Zg9jYSR1jCQpfai5ZSzX4yfpq+5QottjeTCprrHrMvv/vgz+EG
 egstZS7zcUREsB2tGTUWyYvjSOLsux0TUPmZRoDYP4G//vqJUxeCSxatYCpNKY4m5+N2qCgX4qj
 95/QRzKZ3vTtKYpARUqePGKehjOlxRHNaR0rQEyz4BaRy1OQK1TrjU2d6yc6SeOhx4ldEQ==
X-Received: by 2002:a05:622a:5b8a:b0:474:e4bd:834 with SMTP id
 d75a77b69052e-476c812bcc7mr89745051cf.2.1742300123015; 
 Tue, 18 Mar 2025 05:15:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY6u8VngElRtMZG5ciHl9cEYAqvDvzQnu/JRBYF2zIHLFOqy1SOhpbhhUVqwSAHmZkXc07xw==
X-Received: by 2002:a05:622a:5b8a:b0:474:e4bd:834 with SMTP id
 d75a77b69052e-476c812bcc7mr89744801cf.2.1742300122546; 
 Tue, 18 Mar 2025 05:15:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3149cf133sm843129366b.106.2025.03.18.05.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 05:15:22 -0700 (PDT)
Message-ID: <d0c03e76-8b61-4cc6-8839-448fbb64d4e9@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 13:15:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] ARM: dts: qcom: apq8064: move replicator out of soc
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Andy Gross
 <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-9-655c52e2ad97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-9-655c52e2ad97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d963dc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=DN3WPcqzEyWCdw6-I6oA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Qf4u-avxjUYDOXzw9Rc4MpcCFrsy5lzX
X-Proofpoint-GUID: Qf4u-avxjUYDOXzw9Rc4MpcCFrsy5lzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180090
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

On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> The CoreSight replicator device isn't a part of the system MMIO bus, as

the static kind, anyway - the dynamic ones are

> such it should not be a part of the soc node. Follow the example of
> other platforms and move it out of the soc bus to the top-level.
> 
> Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 66 ++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index a106f9f984fcb51dea1fff1515e6f290b36ccf99..acd94f3ba0350c5dcdd8f80885ee643d8cbddac7 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -278,6 +278,39 @@ scm {
>  		};
>  	};
>  
> +	replicator {
> +		compatible = "arm,coresight-static-replicator";
> +
> +		clocks = <&rpmcc RPM_QDSS_CLK>;
> +		clock-names = "apb_pclk";
> +
> +		out-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				replicator_out0: endpoint {

Please take the artistic liberty to add a newline before subnodes and re-sort
the in/out-ports to make them alphabetical

Konrad
