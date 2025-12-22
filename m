Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114DCCD550E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 10:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC0310E590;
	Mon, 22 Dec 2025 09:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUZGjDmq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/jl+KYK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABD210E590
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:26:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM8ladw3964461
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wo8DxuCQVwaQ+O6OGBHHbUAaSkVwS6bkESopiCcsyUI=; b=nUZGjDmqSU6JkJDi
 ujae4w0B3PZeHAcmPkNlZPvaDdh/I0aFTXYHUMd094pA5J+V014PFQYqLlYXtRiI
 BGhU/8NmAVN/pG2q+Huf6nCxIVOfsSwMqv0a/FHFLcf/K2QNIf+ekEgDwKpLyA7T
 IFAsJqDiLqA8T9H7HP/jitiW33j5gjH8mgxacQeYQjc/HRIBOFxRl8xklc1F9L7O
 8vPvg/JFIwA6A6YcQMXHJ/uzLKcZedZEUL90jgz5jfETKEGLX9kRnmhkjy1e8qZW
 W5IRBi2Alq8RhYoUN2lLOksSSq4GkLCU3ldiKw7ady1/9szRM1FXJT5O3Gci3Mec
 Cufzbw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6h6ye-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:26:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f357ab5757so15852041cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 01:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766395598; x=1767000398;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wo8DxuCQVwaQ+O6OGBHHbUAaSkVwS6bkESopiCcsyUI=;
 b=K/jl+KYKR0BQSmmuYsuO6Kora6L2yxRUayZv+nDEfKaI3sxDyVZItT3kxu3yoh5Ok1
 7TnzGXHGLey3j+i8EvejeiO9nKTFC8XiLB6rjhTPg8+OwmKS536UgvyhrEPcC25zznL0
 CffqcsxIPxW8W6ewdSqG4d0lsQ67rAA7Btf7IwVeyyZH1umO0Ba0by6W+Agg96LS0NZL
 OOJ/G9HcRRw6c3WPXClGsgFGRLh8dlbphZsJyXVxNEcSF+YzqH4hxU/zeUfbUAEHBhwm
 vPJ+bGh42uVErdaSmDN6FMx//rQDMO+lzw6p1y30sNqfRjLhJFBsQPPat971mH4rjNur
 /Viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766395598; x=1767000398;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wo8DxuCQVwaQ+O6OGBHHbUAaSkVwS6bkESopiCcsyUI=;
 b=cLXWDN2ygf21uFQ51MhuT51YTutda0NTabsmE8MJQV8XEnuUfjojt/fY/FaOLdIHwY
 5XVJTkAA6SygyWoaHZqG7uXCdUQEu1JH6YlWKuVwramsNcNUr8SOrXik076us69tdsEt
 2AeJzdh0nFxAKRFtY3+ljRXORX+Np2IDxG9bc1CQ0C3mbExP3HvAmTK8CQLrQyPRuSOt
 b2QKCCBk3m9/IydTfD3KOSdqvY62B+CyrSw2zHaNQO52FtluVsbwM9DbdknQGJn7k+7x
 vWkZUlPTb45YaqWVTDCIWnhaprCpZ3UNHHVB6Tu9ww0nWA8JZxiRpqpLzhSrN22CzMax
 7fZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuEWx2V7BR8jN6xOv+7vz+rjgLr6bbckC4qNVssKfIAcFyFVoXVVl3r++G4QZoKX9e3UW5aHVb7hc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKGvUVEH6TJ3uiKMC+D0QouO9U3RdgsG2J21gq1IRM8eNNNaG4
 XEJOmrIi7cPQYmzWNny37FIWpLaxR+hble+UKwAflgUbZwM0AXx/K3Y/xxzleioRiaSDBX4hMqa
 MY5KNBBBuBevQgnpMoofOdYswLX7ArvSlmgI0cdWC4guzAUPLYVItlc0k91hdxF7OkxNG9Wc=
X-Gm-Gg: AY/fxX5GOG8IfjsfF3D6uU+sSzePU1WLwt9wk7pgF1Qx4ukT2ndTeKw1zqsp6t1AQbp
 D5lFBIrpSOJwEXkqEgi09JTM/txIT9evtET/s/pbvE+HMfKtWwxPYxKz0yVX/QZXwDN8Gy1DjcQ
 q4et9XrZfN+Vp3XnrtczeJOHtbJ+DJQKoN2UJByqO4MK+XWZMlpfgliurBuRykfczzZpwxo19S1
 9zqBs3mcKKe1zLeMiwzDs6MKuMKq2v8r+2ReJoYDbARVWNoK/cDUPc/BaDAmLiFU0KWSU6Wj9fY
 yX/z6NPc/MB2DK7a4Ax6v9n+Q9Vr4niCMPtTNX8S4Wg90i5NOR3xQcSqh2JRDE+jjEsCr3mRWAN
 GtjKUEEFqrZt/T4RNiMrDOAOyaB06r7DxT+2JFWAU48dSbAv8LC/V6ywmccD6EopR3g==
X-Received: by 2002:ac8:5a46:0:b0:4e6:eaff:3a4b with SMTP id
 d75a77b69052e-4f4abced018mr116971511cf.4.1766395597807; 
 Mon, 22 Dec 2025 01:26:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE05+S01gejT0XaDp2gizkJwFo7qbPLqzLq0CkAGwGWo2KI7w32IWpAUg4eMXCEAn3mtQh/wg==
X-Received: by 2002:ac8:5a46:0:b0:4e6:eaff:3a4b with SMTP id
 d75a77b69052e-4f4abced018mr116971271cf.4.1766395597306; 
 Mon, 22 Dec 2025 01:26:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8056ff4925sm590671266b.31.2025.12.22.01.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:26:36 -0800 (PST)
Message-ID: <b6ecada9-c3be-4c94-bba6-be16f253f151@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Revert "drm/msm/dpu: support plane splitting in
 quad-pipe case"
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
 <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
 <aUWqtbpldOG-dqIy@SoMainline.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aUWqtbpldOG-dqIy@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ehe1jyllx4f5HnglbWfEh9zXIn8GVK5s
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69490ece cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=cD7NnaPcIOXBppSYsfEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NSBTYWx0ZWRfX9akji4SFuhLD
 fp/OGSVij1tz51ygm+us1T7Vevuzr9x2OM29KJ6Ji8yXMrG1yO69VvbLr/WaHeDpi+UcQxWDeH5
 BPKvvBpetc/wlmgASjO8/0sm9u8dsjJKho5t6zOt7MMq4Lk9npFTlvrnhhk7l6Aedr2DD4tBoPj
 xTLK/87egHSGrjZUvqyQ6MTmT3YSF+fGeR3H/58H4l7+ZLImOZWpFY2I/PaCAtu2Q7ZPdS8gLhU
 HJjctmQ4CAw/MfPt0QAOB8YqhJqqIZrxy7iKEwK1akAM2+gdWduCexw8iQThb2sv/0pKfpsIxqN
 QKmkaDgl5D9KK3CVATKKk7B9+6fzLEwNIFwubkDgELX9yYtuTsdwFsOfeDjxQEQNO4i5n54iogK
 jiGc4Ipw+gzlr1q/5g/3b6IRDhMO7JzgdGS/bBg7gwkwoYs4EJfHhQntggTbdvzm1rFVmiCPohD
 D7OUWSuedW48ulmL7CQ==
X-Proofpoint-GUID: ehe1jyllx4f5HnglbWfEh9zXIn8GVK5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220085
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

On 12/19/25 8:55 PM, Marijn Suijten wrote:
> On 2025-12-19 12:39:01, Abel Vesa wrote:
>> This reverts commit 5978864e34b66bdae4d7613834c03dd5d0a0c891.
>>
>> At least on Hamoa based devices, there are IOMMU faults:
>>
>> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x3d0023, cbfrsynra=0x1c00, cb=13
>> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1c00
>> arm-smmu 15000000.iommu: FSYNR0 = 003d0023 [S1CBNDX=61 PNU PLVL=3]
> 
> I thought that this was normal, and that I was always seeing these on startup
> (something to do with framebuffer), but indeed by reverting this patch these
> are gone on at least the Xperia XZ2 (regular CMD-mode panel) and XZ3 (CMD-mode
> panel, 2:2:1 DSC-merge topology), both sdm845-based phones.

This is very close to what you've seen, but note this one comes with
iova = 0, meaning we're likely passing some garbage somewhere

Konrad
