Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D838BAFAE7D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 10:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2554310E2E6;
	Mon,  7 Jul 2025 08:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hjvh7/Q7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3AC10E279
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 08:20:27 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566LWj8q017104
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Jul 2025 08:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C4EMkoNbmivFQaZ38vGT0oUjiHc0kOLYnITvaWfz0JI=; b=Hjvh7/Q7eIK2cXzd
 iEpH0RXyeo2qPJ6R/Whb1vxgmucC8U0LEwI6sICWiYnDX/rvBRBOobOluIPAiYLx
 DVr8kqBJw/GIjXhhsCAZCjMstYsDqWfXbW0/B7NQ0i1iaA9hM1DC3uT5nUEk/j+I
 +6XAl+W1phlk9oN97CAl0q2v+U1Pc0B2SeOl+hHiyxWRdjyIzRFARi139yoPCN28
 gKtseI/xa88u+3tEEXBTZBQjzMZpJT9xhKE7iMSjuYbfi2S1we+zmoYvYtlgojIv
 oAWm0NO3uS9k9oBFF4QFMGQMuVFbBbE3tL9OcFH63QBmuTpc2O06FVdi8VLG7dB0
 zbSQOg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqkm7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 08:20:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6facde431b2so10972696d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 01:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751876426; x=1752481226;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C4EMkoNbmivFQaZ38vGT0oUjiHc0kOLYnITvaWfz0JI=;
 b=tYWG81CLg2dfRwXf2wFB2z0qQ73AZ238/e9wpPmjQk9I9GdM7K0PxePBWjNimxgaei
 61HmiLAGZ2fRmB2W8nTnSrXgIMVMiFlG8tVeX9IxqmaekNovwdBLmqh0qBhHTLhottnK
 /aB7PQ2G67FD/k/9EqxSoOvSZIo29RvAIYa9we5szA6c6eN/7kYlfNaV5Ovd029uImfG
 QG3/tQKThum94r4TDxank2wR2D1fIyNvlPNzJwo4db7RdYf9fsWyV3ysIutzYBUzrdUZ
 YKpOgMiDik8aVFmS8ECwAecSZUZ6nHqxOFuRo7rCajDsqALDsWWfVOJXy3NS736FoUvQ
 EeEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZe//0uneJLZcqBfVjXObq1BvxG+tGCLq647DaGkWbKuGuc1uU20RYhIDLxyRLJiGMeI/AQ7KpPJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKgbWntwGBO1otTSjeSxWgNdNjGKDbZ4PBTmvBtFziTN1RlA0l
 P91uBgTu5OEfW5LR5VdTJegF6Yp95tKamvvYO36sBKiCrtRGtyhNOlNoiicFrO/aWQTS7BCbiGk
 LH11iLcOHSJYgtLRL+L8EUkrtfutFONaaB9KmoTGOLgMOpEPfzpNcPNmQH3Rq10Allr8Zl+Y=
X-Gm-Gg: ASbGncv/i7T5UZ6Lkr0XFpbGh+5b0OWppkA7uGWbs7HPDUzjzSJ5D2UhQq0EoErdC7C
 MXlRiZOiIwC7MVJEdod5VMMYIHol/MordsV1nPQBbL0w2EtMEQ5ik08C5Pk7niD70+jU2wlA71T
 O8lTM/CFuWRjRt2+08O6RMKFqf1DdRtctKPPCbgu5g9M3UjXdSPRkIaUQSoAVSr6PZDQvvBt5TP
 IvY6l8df0cI5be4M4Nzf3udMVaOw0dCtjHTnkJWbVkmNXbdxQlQ8icitTCq3EnFgbbbEPXbINez
 mYivm8C3j9QOEUdfww+oEGzPpyN9Cx3VfJTuoxSPDUV71fL2+oLk8WiJmkyhldkV77yhZUkyZg+
 67ew=
X-Received: by 2002:ac8:7d84:0:b0:48a:80e5:72be with SMTP id
 d75a77b69052e-4a99760e68fmr67128711cf.2.1751876425653; 
 Mon, 07 Jul 2025 01:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPGxVHMXi+GqI4wQKS4e4w813HXxLKWhB28EavSoGs1CWC9w2RB9JctfqOOsv4gyMoFzYKXw==
X-Received: by 2002:ac8:7d84:0:b0:48a:80e5:72be with SMTP id
 d75a77b69052e-4a99760e68fmr67128551cf.2.1751876425100; 
 Mon, 07 Jul 2025 01:20:25 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b5e7c2sm665160066b.148.2025.07.07.01.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 01:20:24 -0700 (PDT)
Message-ID: <6f3af18f-6c39-4d48-ac87-abbdc905b896@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 10:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686b834a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5JVmSJ65WXatj3hz380A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 9tQUWC1sFQqsLUkZ77BCnZ2I7icTEcPd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0NyBTYWx0ZWRfX5MXOmXDLfK+f
 4TKOgKbgCvRIM0YQj1kPTTJJN8SKsOItk4z6ZM805XeJA0bHCag7xbEUIFJv6DV092LZ/VusN5N
 SrMThMSNQv7aa0Fms1ylOM37El+sf042llx0sWhkpW8TUGBNqlxFVlYFLNjj5Uqg1LCZOW/uopb
 uSh1DQddnxvJVl/fmgshmsT7JMd4tEraGlaCMwY/2ewQKuu4wGRR0iL6AnrzEwQGwCN3vENVwPd
 siroWhfYQty1Al/Qs/C64p2g0NZXNyG9itKNL2q2FB8cInHmBY9JHEafzNXEqQIIFyQc+ezgWrZ
 q5sqtemqHg791u7UfgA0vG91tM29hOD9fDmcjDrFPpUAqaMbBd+XRvPTDy5ObISgBNIc/c70ksP
 EEh6sesELmFJziJQ+hQ08WbAcISxikCXK21syyaZv4QezfEmmJSvZ2F03OyzEB3nHTOdGXhx
X-Proofpoint-GUID: 9tQUWC1sFQqsLUkZ77BCnZ2I7icTEcPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=807 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070047
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

On 7/6/25 1:01 PM, Dmitry Baryshkov wrote:
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
