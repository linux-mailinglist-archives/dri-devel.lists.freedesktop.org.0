Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB3AC64909
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 15:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637DB10E3B1;
	Mon, 17 Nov 2025 14:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSa2HpyV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BI1Fp4Fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DC810E39A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:09:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHAC2R43571473
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=; b=fSa2HpyVbEXyR5hs
 AUWWxsv+gPGVSCo4FW/z8Q0Z5Eimecl3OR0XXpW8dsYFPKyHvu/+W/bsFJ7R2wYE
 yE7xU5SMzPHOY0ife6MRwRqvPrVeVVPYpEs5B8mpA3Kac4OdYqdG1WF8Mgy+dx22
 L09YKmI5RpAtS6q1ugXdSg7b9+kWjbSjeYMNeD7NsLRlGqq/Q5+4JmbqR5uyI92d
 2yb0J8hx6WDz47JuY8WXKiAUexjO09H9IeKnAaLM7SDtBFAwhRIhtwAikacAmms6
 kAu6pjtK6ERfamox+wbyXsNm5l9ITldnyUb4NfOCBpKEMskvjfonOlezx7BqZtov
 zKuykg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbrmsc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:09:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-559a4539437so292334e0c.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 06:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763388550; x=1763993350;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=;
 b=BI1Fp4FyANB3Y49KOsX/pRi4JaFGBV+SKKoRpd9JpUQnvIqX9P+ty75BPM9pw2d3eb
 784wsjxxtOymXUhCfIKIbQPEr7g47HR64F99wyX5L/5kdmEx7MSsu0p8N2KrIeFZcOVr
 Z3iGDQvbkY0FDDhA5V6XglwbVn2+pq4pW5Gl9nzqEIDGArkPNqGoEzqi7JD2UMGMweSB
 z8i1P7f/Yjo9xhlMDlSDCsetkraM+kjnA7LR7A8EOKYF6pwvmWy5WpSeBBmbQlhoBrxf
 pGX6gmPPMXxefLQHaZEdc92s00cZtLz2fjc6Cr1cf+TOgq9s59lNaUm8s2OQJP8WsQx1
 ICfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763388550; x=1763993350;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=;
 b=KLgfFPd0zKSU6DCCLtFZ0x3T8Uo6WwMTrkFKEOzLCgdkTCWe3s4PRkl3CDyJoXJKPl
 4uCAk8pnfthV2bgLghjAjm89uWHxDCcgpkPQ0RRS3QzXJxTYrXal+zaXa0zOJdjMxcxf
 EBGKbCQryga/FGXi53LEfGcHpkBTaMd1Wdc+JuIDGVMMABDBtTXbbSrjTFS56ExZw6MM
 6mOgCJqs5cP9PfOIq2eBsqrmsaBspKkU8JT/m+sOPCOdW7xwa68kk9vlwPB6kcqNWeNS
 5rlczb0NaF9MDf6sMUstVfmLrygHaW4HaDJTo/C6PPRVn4LRy6j54N7N9EXInwKJDQSL
 41Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwnu/0Y7QUFdnTjuvDhbOERlcp8TJdYAjC9u6H6mNyEXbF90pEH/XE6ZhA3pTotINwcgzG0F4ZGNo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8md+Hf294QOjrOsu1Kuz77Ivxh7OzNjTikDLsAD4UVmvMOUis
 NGxLOxgbNfM5pjYXX80qyV1yj7AR3gdylwSaddRd14Y6XhglScv23LQ17l7B15i+XDf6UN5VTbD
 VPe3t9dvDCyHX+8JEeeH0CFSXZrdVbFMBTr5Lw8JU68R5YrQwGUeDhbBO4mGT97rsyfCS56g=
X-Gm-Gg: ASbGncvITXb6VjRp1ihtmVjzMSyJ7htWNxW8SBU0WvWdwYZWFeZGqJG8GTSz0setJTx
 TyNPnqXCt1ftX77gqsh0szI5+lkogfpSpT31lyNePMuROrTXx33BGed5ESBWvlWt0k8pzFC+h/l
 R6IIJbrdqpYBbFJMeNTsiq4mw13B3ZhwtrYr/C40PDNfYUMR655hljiL8j3Z4m/IuMtm3AXifzG
 hpxQBAdoEhzziYFAHPUY2dj9BGu43NF3OBx7tR1ysm2Hs0l4AWACXB1OFKE+Uwny81nES6cfJPp
 kk2gpvXisG8PLOYbgrX+5mcl4qRjlx2gxrzSkic9uQhvxgd0ADRC/KqT3Ue9mLZtk8DqNVrIMrA
 NRytrLyiik/9X7/ttQIK35YhmT95gSVwByCj4ol00CUBLfhnad+xNmOyc
X-Received: by 2002:ac5:c818:0:b0:55b:ac1:d05f with SMTP id
 71dfb90a1353d-55b1e8e656bmr1323587e0c.0.1763388550548; 
 Mon, 17 Nov 2025 06:09:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEn28HG0q377MHRpAVge77qxO8f44ujFbyC1+LqHPUCbNQVUi80/RIfFpD8JZBIKQiQvtEgA==
X-Received: by 2002:ac5:c818:0:b0:55b:ac1:d05f with SMTP id
 71dfb90a1353d-55b1e8e656bmr1323540e0c.0.1763388549969; 
 Mon, 17 Nov 2025 06:09:09 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f961bsm10439343a12.14.2025.11.17.06.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:09:09 -0800 (PST)
Message-ID: <eeda046b-cea1-4c57-86b9-217482568b0f@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/20] drm/msm/a8xx: Add support for A8x GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-10-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-10-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ADIBaWBpXzxmr7O4AE5yBv5eVbOjiU7r
X-Proofpoint-ORIG-GUID: ADIBaWBpXzxmr7O4AE5yBv5eVbOjiU7r
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691b2c87 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=N-Earc09p0J-wu5tJXsA:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMCBTYWx0ZWRfXznn3R6nhOTxB
 +kO+AMgApaL6emx9bAk86m3si15YWW+3pJTAEw7RW0zd5sHBfciMJo/mmBC7iHXEa2M0ko4lija
 dNbwF4VnPsi4snYmFSN5fg5T32fZnOs7tXLPBvHdiYPLUb/avH8C6ysfIVMbPYGnpfO8fTGAy4j
 MWuL1z7HCgINR7phjzw8toOndMFGBO2Xq+QJhVn8mOwytqb+QpxwRvhbHayrYI9nha+3qE5by7p
 3pmISXrBjjzovrU//au33WNO7Y1eqz5k3Ev3pBbgX3XCnWjVkfSLlulcstIcv+0vcln7nQUC4BU
 NaGMEXlamR0xXeFc27NfD5yRJCHIyUyoeha/a6zDkyviAAuqIa5LjoMP1vRUAmaiEXwE4dTBLkC
 Fmkda/CtxGMNhZKWMUNjR0X/a4QdKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170120
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

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> A8x GMU configuration are very similar to A7x. Unfortunately, there are
> minor shuffling in the register offsets in the GMU CX register region.
> Apart from that, there is a new HFI message support to pass table like
> data. This patch adds support for  perf table using this new HFI
> message.
> 
> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
> to simplify handling of MxG to MxA fallback along with the additional
> calculations for the new dependency vote.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
