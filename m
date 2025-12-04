Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE7CCA3BAA
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB18A10E96E;
	Thu,  4 Dec 2025 13:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqFv3iHA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2yBfjOc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B020410E96F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:10:40 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4B0ur8614190
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 13:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 m2K2dG+OAFsTlsLCX6kJRr1wk8NbZkGqj6db/5frYcE=; b=dqFv3iHA/AWscMfT
 XmV19C7dBQ51O2gGGN34PlVrHuNtuzY8+B2hwucwHavQrm5v16imz0tw6bpj57Vt
 uWSS0rOW+k6gcl9g2uYjYGm2O5ViPSo6laRXs9OJXLG1a6R9RRP7TzhbjR+IeZqk
 TWV5OO67yFhGmmLLVpJGpA7NmUSpjRdwTGX1X/McdTEJ6s7oCdY5D7Fumy0Q3zvJ
 Tpm6CpzdoX4nIQBLBPWrkD+H8eO294HbdJTm6FsdUaPgYJkqIF2w6sG0GnG7Eh1N
 4aKbNx3rTrn0toEA564IFjRufwuzzlhO8gkbgaKJ9dAh956qPO6j7dzC1qpCm2hy
 siq0Mw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au9298axe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 13:10:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7b8973c4608so2512419b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 05:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764853839; x=1765458639;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m2K2dG+OAFsTlsLCX6kJRr1wk8NbZkGqj6db/5frYcE=;
 b=T2yBfjOc/VkPlipsqpF+VhTZDr8DgknSh4/QhwCpyXoGjT16r4Fs7S9LSEwF4L81zW
 p4XHjfSa3aRpbkYrUyMS73jXNhTc/VxRH8DhCyU6ThKK6DA4W42do/OeXDsSv6iE66rA
 wAEbMMQtMdH/l2/e2NcXddnDWc3R8pp0Sx5gTVBTR3K3jkYBWSMXx7pWbAyKiiw6Jc2Y
 GsoUexiCE5jUCzrUx9jxs1ldZbGjd9emeViQKrUHZzbDNYm6z/kENtEKn34yg359PONe
 t5fMiqwA3fSyZlcrHidLruHwS1e9kMTXM/gJvl0TTdw2mzSOSmVrsQvLlggXb/U/E8k1
 NTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764853839; x=1765458639;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m2K2dG+OAFsTlsLCX6kJRr1wk8NbZkGqj6db/5frYcE=;
 b=RpoQ2eligtO9kz5SFkxSZO5PiEwnRhT39MLo+5v9nfcFlyl0RYftXkk6kDLAWEI/Gk
 70Iab/s0k9GUYKuFt92Kl1VEoi5Wlg4fi6ts8v/CbK2Zvvm2zbLj5YmQxKxisO3YAGPW
 Lly+NxK18X5Vy9vTrzzTaYPdnJfHP3i9OrPdKguwRN4PWC4iEn3f4quAk2h2A+7B1Wek
 dazpKivClj21Z5/3sqnZH6k+u4dOdayqN+1aBkUB9Mo5lgkEas8iB/3L4VayZSS+JvfN
 B2QMjCOw+aa5t1DHFUHHtDBrlCnXyLh7LY8QIW5F0iFOPlnn6G8wkpK3e/KGixtfg1jY
 vSFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK0gWBwwSMlTJMK7yNrn9/OFkTrEFkEVTrqIAf9oHM0ipGjlwQDOLVabuhO6v99gKN40RE1WpLsz0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQFOyMmiGKaifedFggL1c0jJwYp4B4QhrPOz4UGlpN4Dncc+re
 wN8QP37UM9Arhuk3hikj0jExeFi60Mk9pp+Wbkfq0XVNU7gvG4M/llGqw+BxyiQIpYWC9IZS4qi
 1YyMqpJOHpjkMgJyWuOFkjYsNU72H6U7Hz3IlNojw46gEj7hT54JNmn9d/5QTu2kJBXz0Qgw=
X-Gm-Gg: ASbGncuUmukEI33rWyUc/XGiMVCXJdi26YNNsb1fMNnEAWB27Ov/1lpVuEU0jbaB4sX
 2HNgZHj80ccpfqO672h6K+NHl8aVyfSQQF6g9w4MUk8DFrqBV9JfEOgzpwEMHGx74akEJqOZj1f
 kbM0B3slspMHGqKOzsZrge7xFjgj19eXzCx/mMWimuOkETf3+DLNrgRUnhrQypwvpJaWvjYhi2o
 ugHMTJLTHhm2GK+DmbDY1Z3gBzDj9YtC5gTTob/PpteJWSuxMw+NStErt6UGFfZYATu+/4abivM
 pdfRbzlRpM6P1m0R7kyC5q2Dvp40/p9cBJtPj39R+3Ft/1A1gRvrpW6R4I62BcJkdne3IKjq+gw
 vFbvQcyYUUejAosxJx/cBIdf7EDnDpaem/w==
X-Received: by 2002:a05:6a00:3a1c:b0:7a9:c21a:559a with SMTP id
 d2e1a72fcca58-7e226e2de0bmr3219780b3a.8.1764853839407; 
 Thu, 04 Dec 2025 05:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzWjvtqQGT91E8vkBQvMcAoAvWRgDe3oW5gq4ULEbuYC5TSGRTZv0nuedZ7pKUKHPPmAwtCw==
X-Received: by 2002:a05:6a00:3a1c:b0:7a9:c21a:559a with SMTP id
 d2e1a72fcca58-7e226e2de0bmr3219746b3a.8.1764853838937; 
 Thu, 04 Dec 2025 05:10:38 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7e2ade44a4asm2174039b3a.36.2025.12.04.05.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 05:10:38 -0800 (PST)
Message-ID: <936b6a48-a5e5-4efb-be7c-215ac670677d@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 18:40:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
 <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E8j5kC8tQ1UsUvRbO13LdokzMZTZCafD
X-Proofpoint-GUID: E8j5kC8tQ1UsUvRbO13LdokzMZTZCafD
X-Authority-Analysis: v=2.4 cv=UddciaSN c=1 sm=1 tr=0 ts=69318850 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8zqzhdr9uPwxYiBKMiUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwNyBTYWx0ZWRfX9qGD8yFuc0YM
 1fAZeq/cL/pkXeL2IOFQkkkNoDW+sEexyH97SiIx5xoiJsXHLftaBCZFkp5G2MLy2CVXlluwLZR
 VMLA6lKViVaziSFp9gaqvsuxrjTTSdjJJ46OgKC4wPKG8u4T6aDDGfuzleMvlBLBwJ5ZTF8npTn
 hRxIARspwHPQar1koLSPJ+GLLPOrpjbA2cj/kqqNTtcWiPP23ab6/4pPbDu6DvoljQa9Hgzw858
 slKTVS4B+F0kRmpewOwHkmFG7V24bbXBek3TB9s5iwVN/dAeC0otl6hQeVHjrS4QB859M97rfcU
 xJUHHhKZVRI7nwmjZ3oBBb0ch15sADKgSwZJMlNX7JC415ICe4BQ1NArKgGJOyQwWxzI7EWSvU0
 3Z1Qc2goxiBUD5nBOusC0xM52F+lqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040107
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

On 11/22/2025 7:08 PM, Konrad Dybcio wrote:
> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>> Some GPUs like A612 doesn't use a named register range resource. This
>> is because the reg-name property is discouraged when there is just a
>> single resource.
>>
>> To address this, retrieve the 'gmu' register range by its index. It is
>> always guaranteed to be at index 0.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 5903cd891b49..9662201cd2e9 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>>  	return 0;
>>  }
>>  
>> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>> -		const char *name, resource_size_t *start)
>> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
> 
> Can we drop this and just use devm_platform_get_and_ioremap_resource()?

This API seems to lock the io region and fails with -EBUSY if the region
is already in use. I am worried it may regress other chipsets. So, I
dropped this idea at the last moment.

-Akhil

> 
> Konrad

