Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB08B0E5AB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 23:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4AE10E06F;
	Tue, 22 Jul 2025 21:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFU09Jt6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE2310E719
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:41:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKTMB6004560
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jjqeRMS/46ph8PMRqSc+j1jHH5fh1ltcyKMQO/fuhWo=; b=EFU09Jt6AD+YRXLL
 pLgqiVq0wEeKhRgF5abY5Z0yiZHrPlHbor7i2DdETV0Z3EXMDY/qc51RT/cEOjvx
 MktNxllr1DW/6HMysgzyNTIYJ+k9kOCUiVeka24JsXhrX/tTvUUlygbRKQhAsM97
 0eW6nYR8woBJK9Kewf2BSSyLHigkdwDiAoLDe5TzznK9szmnksJrskPoFNJXmMnk
 yZoNDUyzXJXDHrskBoAmo3Kk07ePvld60vV92H0XUmXRIb8yiB0CWNU75FM0C5EW
 4ajn/hULaAumpB0Tp2AgpsA+NnvRAr/cx1DeQAXfBlts45kaJlOZLzkxZlrUld09
 69/Ncg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6n6tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:41:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74927be2ec0so7438474b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753220469; x=1753825269;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jjqeRMS/46ph8PMRqSc+j1jHH5fh1ltcyKMQO/fuhWo=;
 b=DH/XqXMWZtSoOxvNEfAx7wrzIyh2EIEkmVdbyvxLiaMykszqT+fc+QdNOXhU8ZL9sp
 xuntLIpp9F6XGyVAe3i1Jj1w16tMBM4xmJDW6BkAe12TamsLD7ZKwWQ0s7X7mlPOUegG
 C7a53DsmN+fdbPYOFc2qFi0KpHZ7C/6RhWdAgHTc1wXoOH0+Dz/h8u/YMXmycHRQjvyu
 MAT7HvJdkW+BNBRjkezVlTwrssKQ0MbDeV9nB1zKGPzuqj04VbKBp1wiIoxAE6dSW7s8
 juSOsN91m7nt6eLc3VPHarnf/pcdAGB9GDOUxiSRoB/Ln8SxHeRamqICBrsKPqdnBXpg
 sXew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXot3V2yxeJcQfdi16/jrbkxSo0Jd4oZlrNxDfLJrd/EFCvQG3fjtTuWgH0tlZw2WpzEw5qhOGfCoQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoYgFhB0oy8jDKwiBufCxIqsQpOi6ZCuh38XWCKwkxuRWr0D5W
 FWf12gjadWc/2T4/E9AytI484FihXBpdNXFDbs54PA3a168gpz0FgfJfmkNyNa9vp68kdxhIO6X
 TNzNsNWQhX3hVbtivDAYQLEP4bDYEYCmstRUe0sNUTtd/UaluWyeuniJbUHJoR/cDsnaqOaA=
X-Gm-Gg: ASbGncv1kGWwg7nhbuXH5xuYsCzUuAdISPUbIFqICc83EMk4SG3VDr7qJZn7tACI7XS
 hWQzuAfOpBm1LwprS1s5eZGt6ltQ5ZX9ossDZftyCwT08LJCxyXRYCAng5MEoLOKVcDJUf+N1N+
 P2s6aqWr3a67dRucfUe9eCDQw8XFNXT6iUIrAM1cNZaqo+yh1S/zQnAhbl3XvNQ1hN9AxCnpQCx
 op/xqTYlIWC9OlQzp4vzjwn4heL0dWsZW46WmbRFBQNOgpbMaYCT1PZUA8RQ3JiQo+FjVvRrLqP
 rrQtR6li01+LEyqFBCj9/OD2dKGIc71/cEj33/p9KkUHvtLhAxbk5IrWpYRfxunI
X-Received: by 2002:a05:6a20:9148:b0:217:ff4b:cc57 with SMTP id
 adf61e73a8af0-23d4915fb8amr590773637.39.1753220469363; 
 Tue, 22 Jul 2025 14:41:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAegiXBmz6me1rwnZXHQKFdO1xAzXIAxFFtINhqI1FUmRxyNoREYp9vqjr22X1YmcsF9Ffmg==
X-Received: by 2002:a05:6a20:9148:b0:217:ff4b:cc57 with SMTP id
 adf61e73a8af0-23d4915fb8amr590746637.39.1753220468954; 
 Tue, 22 Jul 2025 14:41:08 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-75ef7510655sm2143552b3a.55.2025.07.22.14.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 14:41:08 -0700 (PDT)
Message-ID: <02d1fa2a-0faf-44db-a683-53c5a51e09f1@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 03:11:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <38100984-df2c-4a15-a192-7f38b8671145@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <38100984-df2c-4a15-a192-7f38b8671145@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=68800576 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wgrHQ5V9N6DtgpC36WEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: dkq8jhs1XUq1ztrxIWjqQgA2eExoP06x
X-Proofpoint-GUID: dkq8jhs1XUq1ztrxIWjqQgA2eExoP06x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NiBTYWx0ZWRfX7ZPKyiETFwur
 WYNRl/OmgjmyH2D99Cijs9cddy2i7ecjzkcoia+SqjZE4WbbWqrG0pXhRCLtL66w9LnkddzEchX
 LEapNMVtxcbFoT0XSXzcHBiiPfzUilBM9NhdCfFr4sZdc5nAiTbHeam0804URVnpnVsdDOAvh02
 QFRut/jr8bYhLWPTMWRUZL8dqMC73ap5nxenJHZxdFmWGBf6JEYrM/DLxe6MDjfW+2wKdFBl/ML
 ds+cwBmszCbuo5aymcmsqQJADcEh3wR0u5Ud938afTNtm3hB90QqcOxFgmAS5Y1Lqd9QXOApZNH
 nLDwi9S0ksCUWI+quwcmHAEeiQginkzVOhRjZ9gbHZ5bZ2I9z/NwHXHzHnuPeRUGhvdZkWUCybJ
 oAIw9lNAtg5vfV7rV32u7EJogiUrmQxQG6JI6nYCMJq/yKnPVK3MP6aKCUmHBJTAPjH/Y1DM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=669 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220186
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

On 7/22/2025 8:25 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> Add the IFPC restore register list and enable IFPC support on Adreno
>> X1-85 gpu.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>  3 files changed, 78 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>>  
>>  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
>>  
>> +/* Applicable for X185, A750 */
>> +static const u32 a750_ifpc_reglist_regs[] = {
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
>> +	REG_A6XX_TPL1_NC_MODE_CNTL,
>> +	REG_A6XX_SP_NC_MODE_CNTL,
>> +	REG_A6XX_CP_DBG_ECO_CNTL,
>> +	REG_A6XX_CP_PROTECT_CNTL,
>> +	REG_A6XX_CP_PROTECT(0),
>> +	REG_A6XX_CP_PROTECT(1),
> 
> Is it fair to assume that we'd like to saverestore all CP_PROT
> registers on all SKUs, always? We can save some space in .rodata
> this way..

Yeah. Makes sense, but lets do that when we duplicate it in future.

-Akhil

> 
> Konrad

