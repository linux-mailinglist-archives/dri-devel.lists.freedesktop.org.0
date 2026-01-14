Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA954D1D986
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122E510E08F;
	Wed, 14 Jan 2026 09:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIR3aNnG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtkWwGXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C9310E5E2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:37:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E7jCgL2789550
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RhhbnWDSKAq3cY01bhquUpPCOlQ2BxpDupyc8QFMtqM=; b=ZIR3aNnGGldnQyYj
 UhaMs10N5GTIacsoOSvFIWOeLuRRwZ5lobaveKIaeJqCzbLnTbjlFbEnlU2937KW
 0YqvSPUNXI9VDRqIFskq+hODjYuz/Pg79uq6nLJae8XoAxJmyBo84agJAN+fZSEv
 Jg4J27UNoujc8JxEC0JkAOnJXhnBqMnXG5sGh0khnD5AUy6AEAnXFSJBpjJqpNxH
 IE8I5ccvOt4NcHW7BNECeGDM9cUwz8PEEKi6QL/X7ypTLNF6fVQNDpe1B72KbrQG
 ZDTojSWdrqhF3TEmt2bw/W+4FQb47Bm8usqHOPq/sWjccDAxe0Nvwx+LaqrHU0Xm
 U3uedQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7vab7y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:37:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-501468a59d6so3665171cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768383478; x=1768988278;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RhhbnWDSKAq3cY01bhquUpPCOlQ2BxpDupyc8QFMtqM=;
 b=OtkWwGXUIuh8f1fJh/nRgVUU21udlWsSe5dQ0dR/8yfe3Tvjo0H/UZpruCcp4tj5TF
 9L5RwuvEe550MQVklNTtjIPOc2LxfReD/YPggX1ZVEZTC9gvmffOYvRIowcyGTYwGHTp
 g/WmE93xX0Z23tZQcc7MbtE2t77eOrrd74x51CqJX6l4Xez+E999aK58e6knxYZagJxr
 xTU40z64RiSaSqTJRuTjh21VRKRTUaoaTuDqjXhnll/gOS4Np/M1TIJmwAR1giCK98id
 ih50GBAcIKuIDXbkPGes3aNjc33R3JNO63w39jjgPYH3KT9DNX9KxhVKAahbnDRrRHmv
 +1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768383478; x=1768988278;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RhhbnWDSKAq3cY01bhquUpPCOlQ2BxpDupyc8QFMtqM=;
 b=V5ZVXDOmQe074q+3vcJ8XourZI3dd7liePmVbRtsUmoyBBf8fhthBy7/oZ9xtRUsZN
 4jl3gX8d3ropwxsWA4QvJvPo6eGyZtlv4U++zNYw7F20j4mbtf5l9fgn540phW8Fq+dD
 hT+LTdykgjyS28EFI96jBuzwEaVKFzDrDH7056UFFSIxBkzVMXTXVZ/ESxpkppB6PCJa
 K5OPMW5YJxSUMfecz6mi78JeIiAvUO2GwY1nNwkNYrZA83S4yIB48U5R58JMVFQt7r8Z
 rNXLKKrMbNBK32+rAVFwHnSN5UEocobrMdE5HiH+fdBmmbyHiY7uguMoXN6aP1mQ/rM1
 wkXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc0x/ypvHHvOX6KKA+W/oMqLG6ndcjD8wWdqWmtZOXpFY+PMxSPhmfcMXKQg4/vZPaEyBbEWveHWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjwW4rRmnewUgxNSejXjcDe5++K12t29ojPoKQa0NycUPjEUUh
 +dSGMHyN2gGfgHj2azOPGTbdcxF4NVXIHy+DW39F7Lme7M5s5ve0xjpdzqoYtjCvXiJ9Lk/Gugd
 NIekkng5OytpnWZQLJwsIj4v+ZPR5CnFTKpfvertZXJtwmbLJi+wLv18eJf5JVZK1KvcAFD0=
X-Gm-Gg: AY/fxX7W9j59zuhMt3FEWok193hF11tmcKkv5CgNI/Fqdc3MHDA1wLL0UkKKS7uVnct
 iePaek5arAw6h2Z6JHQUBTAJamVEjLAUt42sAd/17H7j4AAS5HCDee0anHR3g1wrO+o/zCw4hg+
 G3hjyRsLt0urU5wzE+gA+G9azD+E9cUKf+uWDjYxoLq+ehaEuNM4Bttl0UUqyX1zZn9OBFdfvDc
 cWrp8aiXWbcmvE8Vog/CGdQ/whwLCSCjrUchjqR0tbD21R0DIOwtMm00/nhy6HmPpV1TL9iktTx
 RyOLbetATTpxt0io7jGQHvXzCt/WLtKTQbimJLPmDp3VdkRj2kjlrThxMMDI6ARtmbt5ssP+zXZ
 YtN4iJQbSgkvq5fWsVfagBroT2tAkaJI+wwBK5PMnjk8xkG+bDpImWp0YZsAeXMzUKmQ=
X-Received: by 2002:ac8:7d85:0:b0:4ff:b754:3a52 with SMTP id
 d75a77b69052e-5014816e52emr21627171cf.0.1768383478301; 
 Wed, 14 Jan 2026 01:37:58 -0800 (PST)
X-Received: by 2002:ac8:7d85:0:b0:4ff:b754:3a52 with SMTP id
 d75a77b69052e-5014816e52emr21626971cf.0.1768383477873; 
 Wed, 14 Jan 2026 01:37:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c3f89sm22240499a12.5.2026.01.14.01.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:37:57 -0800 (PST)
Message-ID: <44d2ba08-e760-4f7d-bd87-6ef3a5415ebb@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] soc: qcom: ubwc: add helper to get min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX+jjK833ie8IE
 F7CHfxxlvbC0ou4YJtsIYloKYMe5PviBFI1gGAATISk5XrFyk/WY+mZlOZEugGwV2dHQDPDlWsl
 fYQa8mVydiJCEO6d37h6/uxun0rmw23fcmmgqe6snWhrGcgU4a9i9FNIWmB12jVy6wPx9ADdsA0
 rI/lSwwt/k9SZl3i//M6GhKqdeMg28zIBohptVtF7UxB529PEvWMHbm/uifFZQr3yu42d3lWv78
 FVHWRU4ltVeE0PaMTIHq+hM7VgiVDMq07hyAsS2yVz4GKNUnsNTNkCIeAUfTdTiFFSNJlPKNKJl
 fLyf4tg5C02M5S1wSatXSbgni98bHrWHJ+xN+Fu7MLLe1DQA/eZV+9E7XKrKm506Ryl1fENy33X
 LA1SwlW2Uv0kLOvykcdFALXPKixStH6eOeLDxyc/Kn8OczfosDvYeHEQi75Y6U1ZXV974IEYBi+
 gp/39xJ8EjlFBFaQNMQ==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=696763f7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4J1ihs_Kgnsqm2W37X4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: im_Xdhhr8aSZLVL4cxikr_o0fieH_c-z
X-Proofpoint-ORIG-GUID: im_Xdhhr8aSZLVL4cxikr_o0fieH_c-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140078
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

On 1/13/26 5:57 PM, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> The helper reflects our current best guess, it blindly copies the
> approach adopted by the MDSS drivers and it matches current values
> selected by the GPU driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

