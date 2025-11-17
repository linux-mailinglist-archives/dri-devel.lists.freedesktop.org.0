Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74748C648DF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 15:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE93410E39B;
	Mon, 17 Nov 2025 14:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MS1vdrOy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfjhpmC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD0C10E39A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:06:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHBgopD2582066
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=; b=MS1vdrOy+Oy8cfz+
 4ZwEhGqMOTwdrAe5cxWzUtNCsTNKX1riWifIs6ssyofVIuMJo4Jt1EnM6NynNi0P
 ZPgH10fRFhFnzTVvml57WpBIOix/bYcQLPTqPjBt5AU+LsrabkfDORwaEtARWzEe
 kpA6rNV8Uyp7aNewdnthP/Yi659y5buh7LTpdSZJ20j7XkHtNcw2J2528/3QVLfx
 RnyeSXp4pu/weMDF9CpkXpelZqyXR/Cu2c5cqFOLGggAgqtshtWZXo9IcJPXANFE
 2nYLuhPHak5VbJ3KWxcKtaRuchxf+4KX0AZwXJbkuO4A2cMXuZ3Ly/up/cvxpGcl
 cRvowQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afssfa0tt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:06:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5dbd1b84432so637387137.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 06:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763388399; x=1763993199;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=;
 b=gfjhpmC6/yYq/guniGbgfx95RtYeVDwJIOmrFQ53huRSJIh8UMMza3HDSndJ1EtZBc
 luYrgF9v+NtTqa2Nmt8ZKTzXhQHhzIpSJA+fDOGyRBHL/jMEbcKy2VTHutOj7erulG+u
 c19SaFn8NqQWUkVCH2DEIpSev4eArFK/6zsQxh3qP+f8UU1g0UAi9JDdzfDW1jD+9ohg
 5AozIOjKa7O/9z6YQgR0MCvGgB+wvMjG988kg+m5PYb4rttMR1f1YNhpPz5tVNhjusKC
 Ozk445t2iNQV/7vEEm4uOPw/swOiAIJBIlSTEIb/B4PE3q6+Kncg84KorQkx+T4bz5jG
 tzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763388399; x=1763993199;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=;
 b=PBlflZkUh1D2pyd+8F7lnFvBHRhCVJb/TKrKB+Hod8YguFg2vfhz3vo8Ov/SbWRw42
 en3Ma1kvjuONKodvz5g1mhtho1fa8qYK+ZM5UzFwq2fXPKHPr1ExQcIb2m4VjjzfyLg3
 MtbFoKG9+TLVaPeh6ri0q3kleRtSxogzYLu7htdrIQapQSdCI0Z8WTNZcfpTiFldrIZd
 qDEoQmmXtzzgoQ8nnPxgz1nGM3Es1pwmlNOs0bW5EesJrtQ7oml4f4Ajmers1Z3NEFgX
 VmdGnyCFwAP9FwXxJZV7c5JRkZiH3JhrAuKpouMBNQ3aRmsewICfBC2sVOUU6KO2eHhJ
 MPQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRPRMl7vEOPb/2OFwgp/1MKGPlEft9tyxVetH9ZQMmKsJztkj9lRFwdXQI4vKsR7gPtu1RlUoDCnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbgxZQE1Gr0d11Sl31Le7FEdo3vm6yXk8xRcClVtTZcKfxdvPv
 rYl+XScxySAXf45TeQvrXOVpm94CQ4FeArdjZnZkf8nOjyk8w2+OiLqyTYxURCsQ8ZvWMD10Het
 CDxB1Mf7YC4DDtFgJa479QsPHXT2dljdKjJfO1dlGaTv27lSis5qBzbq+D1+zvmQoLttRduY=
X-Gm-Gg: ASbGncu0sZpx4FjkdwR2C9Fs8yj65G0Jn0jh0KBZm79uQ7bqoL18ZLLKv/CZRy+3msK
 BvKnUXx2MI/fGz2V6U2TkacMxVFPAyOHWS7syJa+mnMkW/kg+6EVCEDxN/D8juBz+/CJUiSUlV6
 Wsge/XASonA1Y8pTqheb8xBt85MNcamBpAlqvHBPdprBPtqcOS5bchCE+IPT9AXnchBLNJEoDwU
 BjgAjJDNL+CDNhUhPybpSzmUWAtL+aemIMMjUmCcqJbK5h+0yy2lUmVBmIZm72ODxSlN5CXuVis
 EFgdCrBQvmn/KzNIJLle96f4klueCQg5onQAxHzXv/oSY2oHrbFOPb3rPuU4lC5qxXt9zSs5/F7
 88p6CAHtbh39ohkBfU5aI1EwPPFSLXdYEaB0Cj185n823fdJU19gpPT5Y
X-Received: by 2002:a05:6102:5107:b0:5df:b081:4a2c with SMTP id
 ada2fe7eead31-5dfc85e072emr1619612137.7.1763388399379; 
 Mon, 17 Nov 2025 06:06:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKNiYRBfXeh/2aXn0HQPLKudUqGsF5V2HxhMggV6/QVJT/a/O/XTnuPbHT42rAwrh0e9Rc+w==
X-Received: by 2002:a05:6102:5107:b0:5df:b081:4a2c with SMTP id
 ada2fe7eead31-5dfc85e072emr1619547137.7.1763388398836; 
 Mon, 17 Nov 2025 06:06:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81172sm1079373866b.15.2025.11.17.06.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:06:38 -0800 (PST)
Message-ID: <60fb9b8c-86ac-4c4d-aebc-2c9c2f558fcb@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/20] drm/msm/a8xx: Add support for Adreno X2-85 GPU
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
 <20251114-kaana-gpu-support-v3-17-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-17-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0wMFXOTqCbw9X3qlxNp4HoG82kGdj3Ev
X-Proofpoint-GUID: 0wMFXOTqCbw9X3qlxNp4HoG82kGdj3Ev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMCBTYWx0ZWRfX7Y89tcQI1Z5I
 OGu8VcYDmjhF2sXZjqR63irkpEzorm9rKJcCCo4QlbYUI7RyIk83AR2enTfHozh2UoVPN7gnSOS
 nuXwDGQV7ElH28/JGcrqx4a2NDJfYDKM7H8Kjdh5ieqfkDkw8mTIYYRqqCIzhBqb0OTOqUKDY8X
 JsB4OOar0h3yJE6TksJ68dXg699HaqquIyLf3vCpTjsEuXnk/j7Ej42hwrQYb8lWJizjCDuPss2
 7C2EWweVto/vL//FlirHyLWOIZ6N/W44p2coQwrBSdoJqR1DDEB2o+kqb2mE6vnk7ZuOJoKNJoN
 Ckz404vgv4tebJmYQ2hUEdnAo362xU/C3wUYgoi/2YxD+z/OULLjAwURO8nLCkRsZpJAfbFUiZ5
 5qYr56Rsdy9yjd5cXt97rr6uR3Km+w==
X-Authority-Analysis: v=2.4 cv=IrkTsb/g c=1 sm=1 tr=0 ts=691b2bf0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KNdfcIBsQoTh3yukQZwA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170120
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
> Adreno X2-85 GPU is found in the next generation of Qualcomm's compute
> series chipset called Snapdragon X2 Elite (a.k.a Glymur). It is based
> on the new A8x slice architecture and features up to 4 slices. Due to
> the wider 12 channel DDR support, there is higher DDR bandwidth available
> than previous generation to improve performance.
> 
> Add a new entry in the catalog along with the necessary register
> configurations to enable support for it.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
