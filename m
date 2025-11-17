Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C5EC6493C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 15:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7CB10E025;
	Mon, 17 Nov 2025 14:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwW+gQ1b";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LVvgYZA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F0210E025
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:11:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB6OxK4108388
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j31M6W20uEBiKJiOsyxMXe5wI1O9DbfibFtCfzdK93w=; b=VwW+gQ1bZKZ4bchC
 0eJAWTU0VhFxfW1xuIn75ZsOvLyxTQrNZ1t8te6kxDyjM1hZVtlBS5t7caEgkLne
 1cVCEybNvgdIr/8kSF6m8DwZxbJ5HES/sOt8tYmLsbJ9S8TVboE/HkX8gceqA1TO
 /My0IsHahPTUpNJrusBF72DkQ9NgV0eAKTvwYwzIR3Gl9O5KDpIeQiPu8RlccaUH
 a54WhQPVksyZz+wN3Ip73+XBZo6poBe/3quHKAJpSr5j7RGUIS/YOAzBZ4J1dxi2
 6y/XlSMOATHyo7jb5IgPoEfEy8fUy77ri1l0VTdpC4cwlhRQvvpNx5UhHurjLZ+3
 1gEbRA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hp8g82-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:11:46 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-935153c7434so228950241.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 06:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763388706; x=1763993506;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j31M6W20uEBiKJiOsyxMXe5wI1O9DbfibFtCfzdK93w=;
 b=LVvgYZA86qbcAEMxkCMKglj/Mwzc7Fr+pqKSIq8GqBQb6bYD4xmz+7mX6dhRntix1H
 rrnyFBEZiNk+bzK9hoN9Bre8uwOUFnfuH70eOsKfLu/IYcoD4DEpyfNG0xW+kzYZH2Uu
 LfWV9qYU6G+pdP4eT8pv3ZluiYbc8Q7wnQDmF4Jdi27+1qh08KIhPCgFOxbnafWeP0fP
 jM+vUkrkTB7f7ICAPilpscN4Yxnzwygv0Z1OV8fJcHxTBLCzjwjbL24jx7s3nqFsfj2t
 Z3ftU+wSPtUOnKtlL/Jt4Kq3uViatcikMIYLvl7oUdZ/io9+fxYDKnJClKciyDoYMRRQ
 ZnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763388706; x=1763993506;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j31M6W20uEBiKJiOsyxMXe5wI1O9DbfibFtCfzdK93w=;
 b=wPP2UD7P9iGF4Qt8wyTWUlZyKeUHs7xnDhLcrhQcQOjJIsJfyQCf/Qm2GEs7GnwTun
 GYkjuj0vo0ng3wuHRQ1Kvt7VBfXnYgGNEkKt8v6KgGzal6QqiZqDVv3iFxgAoxqwt3F9
 +k66oPbI98L64G31fXzs894Ls8N5qQY81t8UrWbD5+nV2QEregq5pHDgDH46gYd73jRj
 v6xcEo03cZpaY/GXcozqQ7DLEIHhxYWWdDZvHijA1fJh3GjFbHz0I8CFnkzH3Jgbpnxr
 oYM5yUbU7zbqZdXQYUM4VIHoDlgTu8zXIuqZ1EHEPdwchlh0l/Indhn5e2iiQczTlpjx
 y+Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMwZFrCyjJWF+nzKoG1EH45u2iSx1zFtdnj08q9oLJQKZBcvEhDYm39q3ImZIVTNkRDModMq0rqmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9ZibJEo7n4dkyNcEea77xF/zH8KDspQsSRKo4CoSyw5OgVMKH
 CqKa5cr/XY7FES2XImF4qSY9N/Vt/4AwHop9JmgMYMoQh1osUgEwfGofUfm8SdyvvffrkfgJ7Pz
 JM4gHXmgvvyyDmx0spWaNad2uYhIh95nIQEQDtz0z4Ts37kjZaJ0Gor6gK6PfWYRRknjnc0Q=
X-Gm-Gg: ASbGncv315GrcX+a57iPpufCqNEkEMO12Xoj20mlcXsWZ2xAroji1K8qRjdg+YexfmG
 iXWaVbvGTd1RS6Dicjop+u8y4XDExccwZ0KtY6ENOt5el0lcN7IYYikwBbMszMe3bjPVST3vTWK
 aT7oRVoRj4WB1V+Rp8ee7ddlIOfyh6/dbgsu2fLp4eVRRkhUD09FRuTAgbXHqoHpHXTj9q/QLRb
 VDpCDd+kRt2kP6E4i6W/BSCYo0H+3uv+lf5rDfo9qigAr0OrXEJWkR931FLyoG42a3R6EmqNIGT
 zPS8u/uL9IjeCtcF2JxUU/H/bPp0QO7fJ1NpkTqAclmSJ+gcS2sqTbm6iNYECaatykxj1g6arzC
 GDLBTR1ZOV78TdIOjs+iDOhKMLb10mi3oFPA+CiaFvOYIQFRau+SC7u5r
X-Received: by 2002:a67:e703:0:b0:5db:ce49:5c64 with SMTP id
 ada2fe7eead31-5dfc85a1070mr1838382137.5.1763388705810; 
 Mon, 17 Nov 2025 06:11:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENBd0uWmCrys3Bjr4M1SOKmS2/3SUY9Sd2AfbAO69+iQX3Prr35SDtghb4rlEALS2PgI5ogQ==
X-Received: by 2002:a67:e703:0:b0:5db:ce49:5c64 with SMTP id
 ada2fe7eead31-5dfc85a1070mr1838348137.5.1763388705349; 
 Mon, 17 Nov 2025 06:11:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fdae69fsm1066684766b.51.2025.11.17.06.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:11:44 -0800 (PST)
Message-ID: <e2d50441-bb32-4a66-b00f-7c656c8817e1@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/20] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
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
 <20251114-kaana-gpu-support-v3-11-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-11-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SB62KklVr65y8DbvDAy5du2gC-0JYf6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMSBTYWx0ZWRfX8RIHNpvJ5/yo
 g9Acj4PAiJt1pph3eXHLUHpqffFsRuIjaZ/tgVk4U7L9uKsxGt09iw3xy4iJA4t96p4Hie84FYe
 6cQV+29EA02E/VuhbKSWhSkVm18OYjwIpA/AbEdVVZN/eCvnB3uC33VVO3d/ZVltAfXZ4Qbp9D2
 0oahszfQmJZANv73wAFHf4j0dTTnm+I9C5F+gS4yL1pjoYzSS5qXX4cjj+KPIPhOFh7WPQPyA9Y
 iJZ577wSonRmJEtxgg68SVbChDZav1LKHBsqLIj3bhhyT4ZddOfc4X0HuEWIFJGZCvSMLOMD2sA
 ePlRpx/7Fay2QGXa1O1xVywjf75098MhAQXpszQ8CQrIvGVIbo3YBIhzYaKh2PtNSy8J6xYA1XG
 nApN1Qo26COWPlE6+TJa1nkX6uXubg==
X-Proofpoint-ORIG-GUID: SB62KklVr65y8DbvDAy5du2gC-0JYf6i
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691b2d22 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VffenE3n-DyGx4saXfUA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170121
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
> Current logic assumes that the voltage corners in both MxG and MxA are
> always same. This is not true for recent targets. So, rework the rpmh init
> sequence to probe and calculate the votes with the respective rails, ie,
> GX rails should use MxG as secondary rail and Cx rail should use MxA as
> the secondary rail.
> 
> Fixes: d6225e0cd096 ("drm/msm/adreno: Add support for X185 GPU")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
