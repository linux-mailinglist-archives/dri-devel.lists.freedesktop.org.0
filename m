Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37157BEFC1A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 09:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068B010E271;
	Mon, 20 Oct 2025 07:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1ZNNLQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD52710E271
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 07:57:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMIqg9028857
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 07:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1ic5bNXxreVSIVO1Go5QvhyrCQOLU1BzWAxz5v8DrSQ=; b=K1ZNNLQ6LVjaczUZ
 hs26L1lDBuSAPCx4tS9XllytcsdrALVP+Rhehfantj4NkrUOBxN7D5LFY4xAD4vB
 fzXJBiKbhBt9fgpx4HcTgBhC4mVZCEhzjJ4ClCmO32M4RoBkfJjIQcuPQIEzn+/M
 z31PlbMDLbhe3qeRnxFYhMrz6Rtp3C3AxBMGPqGLb5xY45g6ZzVsbN0bHYMj1Ggd
 eAiY7tye26dhNSGIBS52flSj0YJBnabov0R5Mfq130uw8rM6gqh/SblhAzS5VyFz
 AGBp7q8va2IeLp1+hO69MQtMQU271el/UIye/ZKdvPhRYp5kfzp0oGEocYfHgIXq
 U4Y0tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfbyyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 07:57:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-886eaf88e01so184272985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 00:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760947038; x=1761551838;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ic5bNXxreVSIVO1Go5QvhyrCQOLU1BzWAxz5v8DrSQ=;
 b=URYe1W+Epw+PL5VOyn0qn1nKSgfqBsqD5Cv7Pk0CpXB93K6IRFRArfWOw1YwOE1oy8
 IXxSiJJHQG/IzLAzFqwz/iZTwlp7v4zZxF0jKNTSfX6fGyag73AVaJ0v1WunQiHLk1n+
 n3QOpeFxCuOq6hlS0J7UrobcLocxHCRPeuwq9GgA5nCWrrHKbZ/LT5BY1zn1p2Hb1dlU
 eHT96380RBo0ako/FjeNzWgFYUTN1ORdk+x/ri9UX3I55fUYkcuhVZSgC10msUiNS4zn
 Uufp4OUHKwADJJvL4FSMSSzEcfUH3KPHvDNwAI6R+QurwTlR5SubHIVrq2A6nCRS9Svl
 /U7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl6IX6wc+jLOMVrf7oY0V27Gcs/o79sZMliz0Zt4Uq17QhKRJp1Q8c8Yn/LyHAzEtjoN97xahqLcs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9UHAswDaUtofUKtJFnBwmcJakvKCjhsMreQvi8EzOVfDzg8Vt
 OCiPL2oPAUU/89AbAcMeXRqcw2HJ/ReSm9j6xEQHl5Jqgh6DHIRbXNT+dogpSVICO3VVFyj97bR
 uJpl8pumEEvC7S0gE83WPVTmhEepKWOkzHYOq9qvUenYsMJjuQpYc+fB1k3zl4W+zAiRuGDk=
X-Gm-Gg: ASbGncvV5/pnk+CFJOr8EaAG5GyRwWdRwaxxwDV1vFyDUb34UP4yrWsFU7yUgZJ1BZr
 SLIQHW6X9r7xygnzT0HVwp+ZZD9GxQJ0vejE7TzfQEN1TJoIeZYg2ZpMZB0+AwDB6LWvzry2ZzM
 fZi4i1+vy4kaI0ITaoMQwZPSpzVjSUpi46jg6F2FX5XHjoR2KG8KLgVqwWaUTazB99AUYrjanrC
 LEGu896QkM0IZ29FqJVOOPYjvBLo51dCeMTRlM4/axD8JenDwzAaDHaZGk11PjjHZkjIhQH24xf
 4Ujo0Aqe1zvuwkWOLFUzkC9Ky+eRZDieeJoI6M11grQKAKcd0LEG0WaboIVyPkhDfMMnBm+MOjS
 9puMTg3PmCp82BvUf6oO7c5x7snkb5gOMBgONJTWZb8KyBiw++XxdjJWh
X-Received: by 2002:ac8:7f45:0:b0:4e8:9af1:366c with SMTP id
 d75a77b69052e-4e89d362902mr105943431cf.9.1760947037887; 
 Mon, 20 Oct 2025 00:57:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBnWJcnNlKu9/v8lp9BtHCdJ5pN1JcnYbdJjV94hLdxAt6+Sr2jW+D0brGc3dRHU+JONj8xg==
X-Received: by 2002:ac8:7f45:0:b0:4e8:9af1:366c with SMTP id
 d75a77b69052e-4e89d362902mr105943331cf.9.1760947037470; 
 Mon, 20 Oct 2025 00:57:17 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4949998csm5964950a12.38.2025.10.20.00.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 00:57:16 -0700 (PDT)
Message-ID: <e3547ed7-9fc6-4521-a9c8-6318dcd76324@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 09:57:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-6-0baa44f80905@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-6-0baa44f80905@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WLm4WG1L06b5wyBmZEvxaEvjxGvAYdIj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX0dlVIsa14IzD
 3B4ATxU9VQ8C3roMl9osxbtb5a5U8rSMQaAhkhvOicJQStuhgFpOUTiucHtvUTdrKtdeQOQgQ03
 CZf/kIdLYHLXPaCBtA4ntOIlSedrAoxfCe0fR/0n9ELPDFbiTjoiQv9151fXJnSYmmsY7CO7Q/Z
 kvrM5Pr9kG0R3KEVBaTM+3IZpLp3DHCRnoF0Tq6NXJg2GZwiOXXlvldz1fxnf4Bq5wT9+HSIBjP
 MCRFdcaWHMbJ7VrkizY9kK0LeQh/WpTQ0Vhjjtxta8OFdYLxZpZ9UGcZQDAjYRjl2KbV/a/8Des
 J1ABX5Y7pbEA+KOhva5FqMb8rfmR9DXIs80P+1+RDI2ZIT5gjwklTM6P1VcqlsVEvvAgIR5DzGO
 6DEDcz98fLxBxkE7c78W304VPCEtOQ==
X-Proofpoint-GUID: WLm4WG1L06b5wyBmZEvxaEvjxGvAYdIj
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f5eb5f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iJWliPolnP7GhHh1kxwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027
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

On 10/17/25 7:08 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
