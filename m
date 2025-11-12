Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FC8C548BA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 22:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598AF10E035;
	Wed, 12 Nov 2025 21:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dvvDkzDV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIEr/UXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B43C10E127
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 21:07:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ACFwsgK1814791
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 21:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DWMyaNg51yAfSqWuMQm6DsWh4pCeuwKPEWjNwRpWJFc=; b=dvvDkzDVzUeQRl9f
 VrapumChgiXe5wG4wMkNAAmc2X+v0HRLKhYGwECmwLn5SDxIJ/dG/L89sSSR45qP
 ws/IZSe+6bPavyd8gMfbInM3Vv7+zndUAV5zTFh9Y6OpkBqTNSRsaRRbYP5cduFh
 CWIGmuBHr6CPR6DZ9CP5ozuz6ll0/H859hD/xnRJFd/1ZpqZYXtlIFIachq2RHSu
 sKXNp8q1MWPTPRoWierLXH2yOCmctffd4K/7zW9wQSi6Q25dXAYbl/036hXGPNTS
 6DEQYSJcnphMTKRTv5QBoptmROh+jLflb8MXJeXYwixIjZT1LANQj0T8y7PtViCw
 gIt9tw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acwbprxnt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 21:07:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7a9fb6fcc78so45869b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 13:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762981668; x=1763586468;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DWMyaNg51yAfSqWuMQm6DsWh4pCeuwKPEWjNwRpWJFc=;
 b=GIEr/UXuPpk1rtx4g3ZNt73b00PXgrJOM9zj7skj3DXanlmpaZa3lOqQC4VThSMIBq
 YkF53l6gnTOvdJGu2mumXvaGVBIGsf4usL22eYkhepUn1Uk88cwqXz+0lcExmqr2Cg4X
 3R4/7y0qod4WXZpkWvQO+yyED7dV+2FaTtvpFOeYiX8SJq+b+JS5V5ue1JP8NtLsQVKX
 rFOp0oYoMUmKJkyIVIULHHz5kty2gG0bFvjDV7wAZCT6kBureOiGZsdaUpbSfhQ/uQzQ
 arEizNr8w/wQ9QmuBxoUHp2BHKlUENOr1ehbxIkYAkvUKzG35AYUGAZprGPVsBdCE4Wx
 oROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762981668; x=1763586468;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DWMyaNg51yAfSqWuMQm6DsWh4pCeuwKPEWjNwRpWJFc=;
 b=EJSeApA/dKhcb/FR0QdhkxUsgX9eSBfIabjUPDDMEYBmOlHbG3y65vh12dkkDCPteJ
 DFT0UBE9WrKhDzNuF2KXo2nN5/0DchwiTjg22dAFu07Htq/7P/HFsFRL1b1QpmWqUNrF
 z5eZBAOWssc4GUQMJsXIifOlncqrQVx68QZ4jgNhvFoZe2/8LVY80FB5N9IIbTDk1/tC
 INXKsj27gK/2k2LR6blxCTUbFnRzCfJdoWrtREETYN/EpC1NE4tlq9BYrep0C+Um7cXk
 jRoQBi5O7WQ4zMb+T19K2ogawlDrUE5gDyu87PGuIMbhjUfjT/bkuypgOkDJN93jG7sv
 EpSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnJxA3DAhwKfyEdo0VlQ1pUxFLaXcReSGCislq19FukvBsmWuGZ47FFr18BBjo6bislNeHVCSKyWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5S5l6CY12Hk8x+cRY9s6wrfg7m8KwiJNBtPRUDffFqYA/y8s4
 fH317dcfuAUcoQQj/RRKCHw1S6QjHoArldnu9wcpwu5RiyaWGzMKtZW0e/NmivndgW4AajZCguk
 tb7HVNvuWR76yr8BuE/AyaoYdROsN40ABQBQp5BEZEXtSzj/1MxBi/6iDXOiKDp47agEhX9M=
X-Gm-Gg: ASbGncu4LG+EgvlSzb4OeKuxPmk4yT2/KjBmVdCgLGFtitErdNJZ3A0L/XGdSn9pTc4
 XBCADwJ0qu5c0hSETNs6lHmArV1rrJ7SQHZZEHlOYThsiSpvUka8eDUH9dPdZqSrj0oHbg4G3F8
 ZQlFfdx0WAARpGiFucz3oNfTC/CTi3JCKVFPIzsBzmDh1YBzgV8obchGxMw+8CcZATIf7JZB6Ho
 9ab3mIszzfuu27uKgICHaa050u9GevuAdJ95h7mO5DeHZCW/uxyE8UuWAuxy/wVlL20DbOxbw3V
 prUJhv3uocsV4fIgnn71nDifCzMc7WEQ9T7RoXw0HvgaKu+YQyDcKqFXPsGvWUlNzqM6gzt3ci2
 0s6X2mySGQY/hNcbOdZViNQ==
X-Received: by 2002:a05:6a00:9508:b0:77f:416e:de8e with SMTP id
 d2e1a72fcca58-7b7a4edebdbmr4669585b3a.26.1762981667654; 
 Wed, 12 Nov 2025 13:07:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKzD5r9VfuhnSBaFB/wMVsbTr573DGBz89wF4dbIOOszP4AA+4sdkCrWHfyRuslYFgh/6AuQ==
X-Received: by 2002:a05:6a00:9508:b0:77f:416e:de8e with SMTP id
 d2e1a72fcca58-7b7a4edebdbmr4669532b3a.26.1762981667046; 
 Wed, 12 Nov 2025 13:07:47 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0c9c0874bsm19343016b3a.16.2025.11.12.13.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 13:07:46 -0800 (PST)
Message-ID: <7ece2feb-79ab-478e-936b-607cfda22707@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 02:37:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] drm/msm/a8xx: Add support for Adreno X2-85 GPU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-17-bef18acd5e94@oss.qualcomm.com>
 <f9aafd73-fe4a-4399-a0c8-0da1c109283a@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <f9aafd73-fe4a-4399-a0c8-0da1c109283a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NvjcssdJ c=1 sm=1 tr=0 ts=6914f724 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wj3I1jakp0zn3Am71_UA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: ELV1C0qUQhiqdSsP5GhOjzUOdGlUuA8t
X-Proofpoint-ORIG-GUID: ELV1C0qUQhiqdSsP5GhOjzUOdGlUuA8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3MSBTYWx0ZWRfXxlZK5GeJYjcy
 XKgnF/MJXQcCXZXjk87lFKq2tp7q9IuFaecuI4WL5RA65rTiOcoj5QpUJQ9yb81BxwL7VjeSmHt
 C/r5RjZ4VN5eJs4Wv1OOAsS8ndvAlf3ZFOGABbod0cv3whRhYp0FpbgjRj11BlACiT3MD8gzVpe
 R/3C9Xr/jlluGfFv35AWRWGseRgI7JcFaUcyBQah5vMAU+OrW4jKDVoxKlLC/WnYBIkiweKBXN9
 S3gaAOQ4KI3YydkcSpUMfj0F7tHNmXQnGHB2ht5fT7XVjlTcrOyYXrtWEtzkNDUbE2QQFqJgI4J
 pdWgYhwqlWrd4IcoZU6CEQrjsJQgSWNu9eEeXTQvuXlwrMea5667g8m6TF3PSUxepkX0PSX7Xdv
 0tcfwd5dDFuOUUeY5FFeh53TfxR2Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120171
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

On 11/12/2025 8:11 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> Adreno X2-85 GPU is found in the next generation of Qualcomm's compute
>> series chipset called Snapdragon X2 Elite (a.k.a Glymur). It is based
>> on the new A8x slice architecture and features up to 4 slices. Due to
>> the wider 12 channel DDR support, there is higher DDR bandwidth available
>> than previous generation to improve performance.
>>
>> Add a new entry in the catalog along with the necessary register
>> configurations to enable support for it.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 131 ++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |   3 +
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 ++
>>  3 files changed, 139 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index fa3ae725f389..2e5b0573c212 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1625,6 +1625,108 @@ static const struct adreno_info a7xx_gpus[] = {
>>  };
>>  DECLARE_ADRENO_GPULIST(a7xx);
>>  
>> +static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
> 
> It's certainly not the same silicon, but a830 sets a bunch more regs
> here and has a lot more comments in kgsl. Could you check if any of
> these settings are required/beneficial?

This list will see more updates.

> 
> 
>> +static const u32 x285_protect_regs[] = {
>> +	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
> 
> In case anyone asks, there are simply no registers before 0x8<<2
> 
>> +	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
>> +	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
>> +	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
>> +	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
>> +	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
>> +	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
>> +	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
>> +	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
>> +	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
>> +	A6XX_PROTECT_NORDWR(0x0082c, 0x0000),
>> +	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
>> +	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
>> +	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
>> +	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
>> +	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
>> +	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
>> +	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
>> +	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
>> +	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
>> +	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
>> +	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
> 
> 830 has start=0x03cc6 len=0x1fff but that must be a bug unless a lot of
> registers have shifted from there.. I see there's perf counters so perhaps
> perfetto-proofing?
> 
>> +	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
>> +	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
>> +	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
>> +	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
>> +	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
>> +	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
>> +	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
>> +	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
>> +	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
>> +	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
>> +	A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
> 
> 830 has len=4 here, with len=6 you can't write to GEN8_SP_NC_MODE_CNTL_2
> which I think may be useful for UMD
On A8x, all non-ctxt register configurations are moved to KMD.

> 
>> +	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
>> +	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
>> +	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
>> +	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
>> +	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> 
> This carveout differs slightly vs 830 but I think that's mandated
> 
>> +	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
>> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
>> +	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
>> +	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
>> +	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
>> +	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
>> +	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
>> +	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
> 
> This differs vs a830 but it's kgsl that has a harmless? logic bug:
> 
> { GEN8_CP_PROTECT_REG_GLOBAL + 40, 0x1f400, 0x1f877, 1 },
> { GEN8_CP_PROTECT_REG_GLOBAL + 41, 0x1f878, 0x1ffff, 0 },
> { GEN8_CP_PROTECT_REG_GLOBAL + 42, 0x1f930, 0x1fc59, 1 },
> 
> (0x1f930 is overwritten)

I think this overlay is intentional to save a protect register.
Otherwise, we need to use 3 Protect registers to describe this range.

> 
>> +	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
>> +	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
>> +	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
>> +	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
>> +	A6XX_PROTECT_NORDWR(0x27882, 0x000a),
> 
> These 2 seem to have been changed vs 830 for counters (all good)
We are not opening up the perfcounters to UMD for A8x at the moment. We
should think about the UABI for perfcounter before that.

> 
>> +	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
>> +};
>> +
>> +DECLARE_ADRENO_PROTECT(x285_protect, 64);
>> +
>>  static const uint32_t a840_pwrup_reglist_regs[] = {
>>  	REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
>>  	REG_A7XX_SP_READ_SEL,
>> @@ -1809,6 +1911,35 @@ static const struct adreno_reglist a840_gbif[] = {
>>  
>>  static const struct adreno_info a8xx_gpus[] = {
>>  	{
>> +		.chip_ids = ADRENO_CHIP_IDS(0x44070041),
>> +		.family = ADRENO_8XX_GEN1,
>> +		.fw = {
>> +			[ADRENO_FW_SQE] = "gen80100_sqe.fw",
>> +			[ADRENO_FW_GMU] = "gen80100_gmu.bin",
>> +		},
>> +		.gmem = 21 * SZ_1M,
>> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> +			  ADRENO_QUIRK_HAS_HW_APRIV,
> 
> No preemption and IFPC - I supopose the smart thing to do before we
> know things are stable

Right.

> 
>> +		.funcs = &a8xx_gpu_funcs,
>> +		.a6xx = &(const struct a6xx_info) {
>> +			.protect = &x285_protect,
>> +			.nonctxt_reglist = x285_nonctxt_regs,
>> +			.gbif_cx = a840_gbif,
>> +			.gmu_chipid = 0x8010100,
> 
> Is this the chip id for the final revision silicon?

Yes. For v2.

> 
> [...]
> 
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index ad140b0d641d..d283d0b55623 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -175,6 +175,9 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>  	u32 val;
>>  
>> +	if (adreno_is_x285(adreno_gpu))
>> +		gpu_write(gpu, REG_A8XX_RBBM_CGC_0_PC, 0x00000702);
> 
> kgsl sets this only when turning on hwcg (bool state in this func) and
> on a830 family - should we turn this into an A8XX_GEN1 check?

X285 is not strictly Gen1 or Gen2. HW development is not really linear.
I might update it to GEN2 in future when we add more a8x features. Not sure.

We can revisit this when we add A830 GPU.

-Akhil.
 >
> Konrad

