Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41F3D0378B
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DD310E755;
	Thu,  8 Jan 2026 14:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJD08MEM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBLX05Yp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC91D10E755
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:47:03 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6089SkMJ4052247
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 14:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=E05euwxAEaPxLzxhkVp86rla
 Fr3gpWYqRJx6YmxUvFY=; b=kJD08MEMU3oCMp/3slFjqu7ezHmKWErinn/XqRgi
 0q9pYByq/0orhd+I/qyFuE3H1hh/bbNBW9vL/2UruGtjD6rgQY9Q6u0KmPDpk6Ac
 QWgN7rN0sHPRkO1omlyAnjifkCRpDac5JKDE1LCTS23jpgeBG/VwLjKpl+GO3klO
 GUHknwAENLc8HD8WPOP7Q8CPeDR/vOqIDq0kunl16GTRV5qiDiqoVCr/cxZ6jtDm
 OPIK3JacwO+cR/biYvoa9dDY61WJNAalsUFvyzIeVnhh1bgeNuogfar/+ttv0aZk
 1ok28kt2jwyQGKeK1HCABvba2NloJk9Y23MYJNJ6v0LKuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8jcef-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 14:47:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b259f0da04so813006885a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 06:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767883622; x=1768488422;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E05euwxAEaPxLzxhkVp86rlaFr3gpWYqRJx6YmxUvFY=;
 b=bBLX05Yp5KzNn+0Nt3lJkoTXaqn4OF6kDeULUq8Zj4+5PCIhgGh9B2OLbx59k5uHz/
 fp0jeuSZTZT6f4FF6a+31DUxCZJX9eWRtYMpMNdp/0QGi4lh/vXCUbY61e9wuBpc4IiM
 2F5+9tNXyehp/7m2/FIEnfF6Eu+0E2Mw41GDsoP3iagVOS9NCmesLgmUdASQ9fSh5cMH
 JXj0QpzdDOFNDzI2CwMqexHGwvXLIWYXSbEp2E9LmlrocYg6KpUIgUJu59bL3FeiSBjL
 zd7Jx8xsT7oYHM61u0VlSBtaSwqFeDhk0M88ehVFC8/ypxpDWnkTEYjNEQywARFil7sn
 5YPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767883622; x=1768488422;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E05euwxAEaPxLzxhkVp86rlaFr3gpWYqRJx6YmxUvFY=;
 b=CosSg4nX7mZHEw6LhQmIKYHjHwVT9eU2qnkuFi7iJNdXasTzMCweCo8D/mSAfYprkM
 K92RWbbLgO0wpttc9aF5d+vy1kqnF67T7HemeWakLFhTrBalXCnAnmi24pFja6SQElz0
 wYTRzWWs+E0xcepl+TAB3TpEY1h0wUueeRbHH+eGRW3KQlQDf7T409GyYd+o0TXoWJ2x
 1j2a+O76YY7w/HqGA1mxRW0xYT/YjdzJfZrnnX7Jzotef2y3P5og3q3/Zmkay/Cb99p0
 B/vjqFf8BcxpqzbqFSQvdK7mYFyeWzJS0g57aFoU8zxfOOPlOwzKbGqC4jbtNFPk9ldM
 2cUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5egBiqKsA5a5AuC4l+RWcjNlBWgivJwIbk7iMiciq5I03QChrxk6sLPbLz+iewupUiPnsql2N60Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlQ/ivwrw86sDr7AqNwDseILUm/7oSXKuch/ZknVFP6PP+hycM
 HcO+04bdszNUKd0hNbiFqsNWCc8qz5Fxv3j28gpMBzdJ3KI9+zEMJ6sRJdTkGIOZqkr7Bg/FHyE
 qZlfCk1ZxCqUxdtwV3CsN3Jao53evmGodrf3HO2A6rVPaLIVg7n64ZJcGDVuUFtLvFWGu9co=
X-Gm-Gg: AY/fxX6z8LIkcfHeeUTYy5AcYhNga+B84+svBIdGu+MM9OgqydQW3GsPo5BkHFDWGaz
 mpBwgnEQ+iTXa39bJBLkyp5PPMbBMOifcr75jElYaNhaDGe7G6p6FeCselOSat620IMm4XzPj0x
 z5cQCvrDJr3nzOGexvEyCKwjSCCHmcPOJVND3VOLuBQ247TUYme1o4vEnDEePkrb6IUNuKx+qeY
 6fxhfBLzuOCDRtDo1My/mSv9MChDvtnjXDmtO2uXwHkrDO5WImknKGAqHRcYhQUNfp48T9/Kw3L
 nwLghGzCvlaI8D3m2Sgc3VaYBsJc3PmmShZ7vAzmMLbvKZCGrNKu5T1rYtbw5uCMgE4gsKS4bHG
 zbzHomhjPcZoVxTJ6PYgzN+vJJCRf2dsbYm8/pDyCmXWvjBs/0CooDMWVpgDRmHSqm8n8sUE6HT
 BSnMWwJmhCnVIi9JytFGrVQ4s=
X-Received: by 2002:a05:620a:7088:b0:8b2:e4f7:bfc3 with SMTP id
 af79cd13be357-8c3893ef8f2mr824071585a.55.1767883622329; 
 Thu, 08 Jan 2026 06:47:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZdKHI6y1PJg4kw3AOKfreiD9CPsGiS2albZ66Zp0/O0JjiGxU4Fura7f1B/vNXX4L1WRSNg==
X-Received: by 2002:a05:620a:7088:b0:8b2:e4f7:bfc3 with SMTP id
 af79cd13be357-8c3893ef8f2mr824066785a.55.1767883621894; 
 Thu, 08 Jan 2026 06:47:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382fd34bc69sm10292881fa.19.2026.01.08.06.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:47:01 -0800 (PST)
Date: Thu, 8 Jan 2026 16:46:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] drm/msm/adreno: Trust the SSoT UBWC config
Message-ID: <65qhwotmxkxoa434qxtiflkb77espumpnacrw4nymvf37ozhcg@d6ouxfisuylv>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695fc367 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3LDqQxKG0DOzahDZ0EMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: B7_iXT3jRZhn-UJMNuzrfNJc_Q-xnjUa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwNiBTYWx0ZWRfX4Dro4cDIiNsc
 FfpYRdge0C8yMen7+akXJ5NGDDUdh34kPWX1AXUe4hfdXTTZ8a5nO5ysqQBNOf4X8RtDrcnr1A5
 E/uTjsc9EAbGuM4hulSY1ESQ8QoIBX/iPCmFJRO5wnW4qnPa3t0XeU9C6zc7jShRRhxEQeSHL8K
 TKMrlrdDCd32/OY1zzqW0P3r6VUr86o2nYqy9AH1059rDJP9qPEyOl3M9uovJ64D34CDlOxqx07
 hygZMJdy+ueEpDNWBJyUrzEAXqCZZJno/02v+u/jdW90EEWQqeyycvQ/J1YHLneOCewfnJXXfXG
 HPzpcqTKDh014jYNEtw4UkZeCW+U+/+0ipd2DdlU8z5/vhhwa+3iCEf61Sk4S/IxBV/Og1zE0si
 cXognIRfErQ4jMQZmy9KQ44H/rpqU61jwCMjT3RjGxe2xNtZ6QscVFSdsY5bsdgpMq9KkCIPDJa
 pQQGfMizaw09YokQMNw==
X-Proofpoint-GUID: B7_iXT3jRZhn-UJMNuzrfNJc_Q-xnjUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080106
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

On Thu, Jan 08, 2026 at 03:21:52PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that the highest_bank_bit value is retrieved from the running
> system and the global config has been part of the tree for a couple
> of releases, there is no reason to keep any hardcoded values inside
> the GPU driver.
> 
> Get rid of them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 ++-------------------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 --
>  3 files changed, 6 insertions(+), 92 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
