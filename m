Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCF2A7C663
	for <lists+dri-devel@lfdr.de>; Sat,  5 Apr 2025 00:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F6010E035;
	Fri,  4 Apr 2025 22:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOhfj/0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BA410E035
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 22:39:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEkTK030277
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Apr 2025 22:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oAQPPAwHz4E9W2g7oqIWAj/qTk23uygOmdFEWxol8hk=; b=jOhfj/0zRCcAbJQe
 qFeozMfMur4+mg0GLAWSsq/qWByJ10Zn03FKYICtyOqJ7DehQikQ8TOuqhBixExJ
 qxm3qFcRlkD6ry99hrq+4CiY7ydxVWN0gLiYpvPZ6gAg6+RaUIZeEmwJJn5vVdF7
 hkQxR9J3+JLhWhbXzcNHegkIDOyB6f54PSiOLrd5vapiiw/3oB4bqvAdqPx9l4hg
 W8cSl2mPs8VwYSFCkGHNuHXR6CSyaLtP2mi5JfyjxqFnbrEuuzIQhz16bbSkhJOE
 vXB8vcrhSCLAhAj6dnExSJHsKIyqWH5HOqnsJYmEVZZg4KFTX60kxRZ/7ZQBKchK
 BTdAsw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d5359b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 22:39:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-477608e8e4aso1179581cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 15:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743806345; x=1744411145;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oAQPPAwHz4E9W2g7oqIWAj/qTk23uygOmdFEWxol8hk=;
 b=uAHe2PH1svABf0x9tKdpRHnxOE9oQ+z7ZqufbLYibkD2bDcAi9cPllF+yhQEbJ12nf
 g+iSyRSgTMQnyN0PK0bD5qwDVzIKdmYe29/zGSLQRlrW/k08J6dptpbYTEqBGBkd76ia
 u30GldbpLtK1QzMSdby9Y64BG5r3tc/ehhgFu4nyMSXnpax/TCEhIu2l0j2uH32Hqv8W
 lO6pDojHanidLuHbRHZ1+xUk2e2zIPKTfpAqfkAnHN1d6NlJ4hGjl/XmuQMUzo9ilGfu
 YHG00l0lXHK5bxmH4L+xu2fMLEhFoqt6PGG+S08h0emPfanIhz75y3HqjHE+EdStjxKM
 a9cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYeClJUF4gEt+DUy2WXHoGTRwXEEHCUh4SgFLoKNUFPg1AeDhDrifjOdXeC1lZG5Fek4Hmm/KGspQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw22duwuSvfpgbLSjdd5vzc1sa4h6m9qfC1rcrmHlwDqIBsXd8Y
 i59pekavOTcofYCV1d5Bv6ZiCTaQgn4ta8+Ff54jcBMAIedkAfP8u3J8lqXcn2GTxTcNNIO8br6
 S3w7DGErSxa3fQSWD1DGiGWbZY9c8d46JcIFRLZhhsEBmieiNXkKI+Fs9AcKlZOrJqwE=
X-Gm-Gg: ASbGncvJRs+O4PRxJYCYXWTCpACkdXN1LcV0GqKw1so8z4sNipTpiQs2ipplBwNz/gp
 MfAnzy0bB0UVWg6BKwPNnMxOcv2200iy7UfMRvTTGhfkEUDrXKbhHOfLDFCN2MTDtMCpXJ3srRP
 GS11GIVbOdRK+aB5/zVnNg/PbEbDg0q1MZam+5NFFRWYIOEhOjQnTyqDkgUUBzL0MjXpcacVnU3
 oEvkJmxAgWG2m2XCBSQiUUkcct/EGn/ixcvl3f/tDhSnAvpigIUD/ISqDl5nxgxizUrXHJB4igU
 8h/lmcX2x1ek1busCYTsyehLpxCA5O4LHAJT4ACbBn03kIAEbN/yZg/l2vEZRljXmTPBLg==
X-Received: by 2002:a05:622a:1898:b0:475:876:ac3d with SMTP id
 d75a77b69052e-479249e2cd1mr26006451cf.13.1743806345084; 
 Fri, 04 Apr 2025 15:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+NzcEKIjX/Q355mfL2t7DYQXJRcMD6VxP8/NFF8Z5Gmr/gnpuijoylXIpLqB0qI6DVbx04w==
X-Received: by 2002:a05:622a:1898:b0:475:876:ac3d with SMTP id
 d75a77b69052e-479249e2cd1mr26006291cf.13.1743806344699; 
 Fri, 04 Apr 2025 15:39:04 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087f0a9c9sm3106401a12.41.2025.04.04.15.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 15:39:04 -0700 (PDT)
Message-ID: <79c9ab2d-f970-4dfb-9170-ac3dd8b1c772@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 00:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
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
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250404115539.1151201-8-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z1ktRuCTuqL4W4bWSsB9rTt7kUGLKMD-
X-Proofpoint-GUID: z1ktRuCTuqL4W4bWSsB9rTt7kUGLKMD-
X-Authority-Analysis: v=2.4 cv=Cvu/cm4D c=1 sm=1 tr=0 ts=67f05f89 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=GLHRRWOWZVtnXAxWSSAA:9
 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=786 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040156
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

On 4/4/25 1:55 PM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

[...]

> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		gpio2-hog {
> +			gpio-hog;
> +			gpios = <2 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "dsi0_int_pin";

Are you sure hogging is what you need here? Aren't those GPIOs only
required to be in a certain state when the connected devices are active?

Konrad
