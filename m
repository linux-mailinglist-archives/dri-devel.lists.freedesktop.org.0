Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83067CD5579
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 10:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DED10E57E;
	Mon, 22 Dec 2025 09:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ao204+l3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Joh+dfjE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9555A10E592
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:36:06 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM632mb3106883
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Kq3LMdMdij6fkif2PNLahCRwz5DF0om84C+pt+8LIEc=; b=Ao204+l3rub0U4Uo
 nt8KbxBgvEmGSjTLVa+80ofCTjIkmpS7GS9yV6+NYbm9vmdBlhiKAookikqckw4S
 hHTTOZ35YZccV6sDgOI1RYjcZyJnwii8O+ofkC1eLNp+4nRBvbfCe7k5yeMWchLa
 9lGd0Qo+TP6jN99eJUWEcrAG8C27mqQ4aDKeA4XS6tAvTBTHGMqAob7qDaK54FtO
 +YPiFbNT5VFGRPrRPx24fpltJYbQPWTTF5pTXlMozRn4fSY2v65VpMd9SbFtN8yG
 LqZBxPce9mFcwP5at2CKtzOWyEQrq6jD8EuBv5p4k36cJY7BoYEi2pqvBh1GS2Yl
 ExzRxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfmg80-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:36:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b9fb4c55f0so87192885a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 01:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766396165; x=1767000965;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kq3LMdMdij6fkif2PNLahCRwz5DF0om84C+pt+8LIEc=;
 b=Joh+dfjEAymcySC+JfDLmjRpdmv0Ukotdy7gKtuMknUaAwBCoMsrEE4jmi3UH2cOiY
 x8rI1jEuomy7tQQd5ilU3nEUy4Ze4A2bjBg9PoRqHjEy7AKwOqA0L7JX1/wuSsDkoenD
 ggo4wsrqSkK0HqA26KRsKK493NwKblWIVuvKmDPqYJeAKrpa8CSjwJa+4M5K6n29Eu5H
 7XwUce9QAz1qng7872d5g9fC0hT8NAzYO52w/A8pgDtDKBOmhVxqZAwDf7u6yqgNF0Sk
 aVNGojhn0ILyHEE76p0g4hewj3VKR+6+EoDGnMc8lFL7AvrSkVQDLXyiT2pQ1W4w67bw
 jzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766396165; x=1767000965;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kq3LMdMdij6fkif2PNLahCRwz5DF0om84C+pt+8LIEc=;
 b=Sh5yYy9Oh0cUD1Hg+R170yFdUGXWZz4BCX/JBy1JrLUv6rq4Re2TYWhmygHsNfXaxW
 IFs7pmWRRm3doOg2u4UWNkv/UgFxJLaFaMxOj6GSnQ+HcAF6qg/jtzDtRTYcfqvLgR37
 kHQq+Za8AuxfSebLL+1Wrx4QipJuCa/Em7B4mV2dMJNDs4W7Rp0dpEc1iQqnRWdNPXhZ
 0DrZmf9MBT7vP8h4eSCuzIL2Te3rmU3DgmGSDqdlLoisyWQRjJHzFl6hXs8M/6ZUiPOS
 4LYvKYvKz0Mb1/mSkSTkGcyWT6SMxXul9nM35exPmV8BN8098p8hIehLGo5bKebzIsMB
 l5JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoql9+xJPLWKIfMT7a4i5ZR/A/rCFba8r8OUM5FO6iqga0JiC8R+IxrqXUAim2GZVLCLcI9gZzOyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKKIL6mIrFSRKxGyOxgYL4RdKMM/TZg/jV4gtXvcFmw4efzC9/
 iGVmq2eE5Eu1/aSYxXd/i+qGR44p5qQo+zkR6d/cCkVsBj7K7hwILRGFw/ahDttS7J3gNoGh+Km
 kLXu7sxxet48d+RJzKX9rYoygXE/A+hdBHPCEbmetb+1HpRLBYf9QW110FovlUpuh0Pyadhg=
X-Gm-Gg: AY/fxX596mCB4K9U1NHIcUy5oFRE9ZLxtE+ANusECaRwtNLWfJxrj8OmKCPdNySr/I3
 wix45SNKMRL2+sbZRUoiaIrPpKyQnZka98TyioCP9821QXYHFf6LQVyEFVaMWAjPa/4fHm6FWO2
 HJgwURFfYDExkPFH8Tf9so+qqbxEH+mu7XIRTCafoTEZayPcubt6iR/K0CnCwmx5lhnCez6rTTI
 q2TY0xD5Q9eidU6fYN/f7WIMSIUIhNWZV1PeXZV3I//sqWYFay7Lv3T6D3GPgHSpOmGlAPBXv19
 IjQVnvZvH5IGfUqiyO+CokI3ZmNzilYIj4RcSRDwOpgAfm5479fye2CxLtagF3SVy/4yFk42hmC
 O4wSM2+5GlB93RydRfDCGZTAYYEN1OMmocNNTl+p0SDq0QAmWclwHxp7fQ8RjJsonow==
X-Received: by 2002:a05:622a:6a07:b0:4f4:b372:db38 with SMTP id
 d75a77b69052e-4f4b372dc2fmr65536201cf.5.1766396165100; 
 Mon, 22 Dec 2025 01:36:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWpek2X38QiRtdwckvzye0DRKZoNSOPiseCm6P/erYFzBxx49LJUA8iJJlmbhUn/duX2bSIA==
X-Received: by 2002:a05:622a:6a07:b0:4f4:b372:db38 with SMTP id
 d75a77b69052e-4f4b372dc2fmr65536091cf.5.1766396164666; 
 Mon, 22 Dec 2025 01:36:04 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b90f53c16sm9874135a12.1.2025.12.22.01.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:36:04 -0800 (PST)
Message-ID: <a401c58b-a0f4-487a-8530-1c6ea411ff35@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:36:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] drm/msm: correct/add a load of kernel-doc comments
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=69491105 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QSihu6i2WLKBEhuxrFcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: mHNjQuMp3bCN_lUVjBRHOir6mVIYGy6H
X-Proofpoint-GUID: mHNjQuMp3bCN_lUVjBRHOir6mVIYGy6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NyBTYWx0ZWRfX8nXne7/RSJr1
 J4pSrWAapadhJP94KbFGcgq4CgjutHxf73DmWsL5AkBmQvAQvXZkTXt/voy9xuAw2uQOSOY4QL1
 +1j/+KSYQtaVwIjmKR/+2o9w+Vtsbm6zIQA8pp0arfTcXeuE55hht8Y3drEz8wLHzqTWF7Js7p1
 qEy4IrCqDCxMAChOsCNh7kml0isQU+BdkNSAW1vsl8wQwrYK8w0NhXfu3cSGhzZG5RgE/8vsOXo
 TSjq7MeRh79uaTNM6YShlPiHM2jHqlz/gVVmh8PxAkLWxtlO1Y+HXac/Gcpb4MZl+YclYee6qrt
 iA43XdlvfSzXa63jRZ6SdrwV3Muvnd78IaYeb+vepAZE5aAvpfqBztDUpQ6tij0WR+W6RWmT4BQ
 2/Wo9e4ZcXhI+dRzXkJtmWwYomK7w/d4kBD1rSfIu/0+67fX3k3FypjwwboosJPd1gTucEhXjG8
 /rX7rVCRMzv3kwPTH0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220087
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

On 12/19/25 7:46 PM, Randy Dunlap wrote:
> Correct a bunch of kernel-doc comments in drm/msm/.
> 
> [PATCH 01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
> [PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
> [PATCH 03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
> [PATCH 04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
> [PATCH 05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
> [PATCH 06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
> [PATCH 07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
> [PATCH 08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
> [PATCH 09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
> [PATCH 10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
> [PATCH 11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
> [PATCH 12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
> [PATCH 13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
> [PATCH 14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
> [PATCH 15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
> [PATCH 16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
> [PATCH 17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
> [PATCH 18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
> [PATCH 19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings

Much of these comments should be rewritten, but that's on us..

Thanks for taking the time making them at least format-compliant

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
