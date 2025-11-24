Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D103EC82A08
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 23:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E6110E2E1;
	Mon, 24 Nov 2025 22:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IX8JCe81";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GRhXAd3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A6D10E2E1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:10:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AOJsWNu1161745
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P1IkRQX90E+6SINHSGTIxDgXOYU24GZeFnRVS4Zye7g=; b=IX8JCe81aZ4Z96ad
 LQ93m1F98NWgE2XRNocVygHnvwMc6pPv1IGhmTGeXZXEiwBpVbABwFB/Md3+rF+C
 nRBdK8UnvdLQZh4XU0JcNnIkdhgYRqGY+nOLkFZZ2jTaoZ4+VfSx1OHoOXmQdRIB
 dJxsXD8fTn/RD/AVsDThTFaAfNF5NHxrmgA4YxRvVI3dcQ3rWXtlknGEU/UvrvJ5
 QE1lal5uNXo6TAa5uiQ5fmvMAL6Wei8+tiu8oU9jruplalbakG36bFa8Ln5e2gpW
 vh44BBkQF+s7PHnLtZ+qjnC1z3iomsRiCkOJpZXWLya7JB2A/l67ZJ0p3HeayXWP
 xvqMuw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amkkntbr5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:10:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29557f43d56so60241705ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 14:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764022236; x=1764627036;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P1IkRQX90E+6SINHSGTIxDgXOYU24GZeFnRVS4Zye7g=;
 b=GRhXAd3PKTWyd9zXJdM6EzmpD2XuACwYNVf6BGRFOZHLhWVxn0mIV4VaU8uSGLWOpZ
 p8Xp3iNu9tuonRpEk4J9PmgJ29sbXEngFEW/HLBwUxzNdYcSdfUyu/WAyJflr39x0KBe
 XwBu9txkOj6hRdikNYm6w9SOSt6dPuZT/sap7pv+iYR5EJgGVpcMiHjlSB6gUox+uMMc
 egVgIo2K5i7ijT4oxvBlRnK9GCYBCX1WM2JKwclT6y/c1ANsdT97Z24FRA1QD36PUKCZ
 zE1/kVZquAa3B422Yhg8XaD4TB8mmkcjZiwl0KfGH/TGq9JQ331mMrW03s55aB/zrgWa
 J4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764022236; x=1764627036;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P1IkRQX90E+6SINHSGTIxDgXOYU24GZeFnRVS4Zye7g=;
 b=N0Hb8dSXprbP8GCidN/QxMcbEjIBmyAoUpybqE0cNI5vSlv6SUBaj2FGC9beQchAjz
 gE1slEHwqGI/HUdhhVPkkw6zl8LflHTEHE/c8CQnJtmPB/zsbAASQnnMKX045ofHIMRB
 t2NDfR60fBwUqxTIokMKbmeuw8SgdVTzL8kf6bRFjGkjvPaUj63+GPuh5QZEP8t5LX8Q
 ZLQ/SKck9ktylvCGeRACLNt1k7OY7MNQWbrLMyja7pkNIj8o2xLMUef5zTIxTqLZv/6j
 oFwETuH/XB1Cy7bY3riGOhVPYOYf5doZ2ENs5bUilWpDtUUkx6MHil2y05OZeXcVsfwO
 POPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6BkYjeUKuXhbARhRcH7NI8SQquvEBlU7mnnfpk3sTuTHprMRBvkRNZmj/kaGZ4oXCGvUE2gE3Ke0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDWQaiS/xUv4Zu6vZXZc8f4YQTjavQUbeIJg9xvEyIPBwWG5tz
 6bfRFNLUARWf7VdBsdVFeUupNEcQuoISbRboo4VDF2rQ1V6fUz9Djv1WkxThWM5BDmYanLWC9en
 rXIOdiW7ZdTvCf7bAvR8VWuhrACin1F3OmizLDlE5MBqDSwCC0NYTEgPTRUvmN2Qlv39Raio=
X-Gm-Gg: ASbGncsGpizFVpDRREqVN8w8hZzd5FrVkclbeJZoYshJJ4xSYaAvgP8X3+IMQbbDmAF
 uG6ACvUdm4kJwI5CNEgt+Xhl+hJdQpTNkvmoiKxBT1Sc+EGiNyobfISp41q/KoiYXIvcCo99qTh
 9BERSq/ACird/D+LpHpwNpAwLzAUaqrnMqMLiTAKDbdzfAtMAv573NRkh6aOB1S4pv1Bz2e7/5C
 ZXE/BFNt+fNyIppoQTBRDl5HtpCuJ+j1tss8A2DpmiRNIJM2xYC1jP3hvoS/k5tMv4cFQDf7H6W
 27PBSZ9ujfxBJfX49VP3ktRiTaBrsSxjcF6Yl5FMQP557rvrbINztquMw8uOd9/PrwWmlV+9ELI
 A1nFFGzifiKwo+9J/uFpdR/mypDgGVcTvm0U=
X-Received: by 2002:a17:903:1aa5:b0:298:4ee3:c21a with SMTP id
 d9443c01a7336-29baae40a33mr4509245ad.2.1764022236557; 
 Mon, 24 Nov 2025 14:10:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCFlcdURGFYX9T7gTdXnUcf8Uq2t38PcEn5iAANu+rMB94bLXIscK2ROxQ/LO/fYuI22iQTw==
X-Received: by 2002:a17:903:1aa5:b0:298:4ee3:c21a with SMTP id
 d9443c01a7336-29baae40a33mr4508935ad.2.1764022236070; 
 Mon, 24 Nov 2025 14:10:36 -0800 (PST)
Received: from [192.168.1.14] ([106.222.231.199])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b1387e3sm142941995ad.24.2025.11.24.14.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 14:10:35 -0800 (PST)
Message-ID: <efa2f4e7-97b7-465d-81e5-98d86975548f@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 03:40:28 +0530
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
X-Proofpoint-ORIG-GUID: dnd9wbPwdSkoL5Kfb8KeFrUo8jmpERaF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE5MiBTYWx0ZWRfX3GeIQqjohtr7
 cdkWjq/VUi0oI3PiV6xuTIMH5ZvoPItzEitLqsmUFUdHY+ZI9zN6KjuKtQRVzIp2FuxUr+p4C07
 soPoRTtrvis0pGcUnhCT09JVECQn803G3hBPFic8wdd+RXBlaKPO4ci5aWsTdUPtcgFCmicXg44
 eYzNwj6ra77uOWYui5nkUznlUt2fg99xjNxxSiZnQswDVYcop9rImjXzURqLmdAdl8U+IE+/ftO
 2iddWnnGT1Y6pf8KCAh9vDQr9cMq4Z5C4+n54OwDz17gDEkQRfxI2bvXdFZ0DBmlc3ATKl7y57l
 la0znKiIo3/8wLimcwydvT5EzSDvEq+zhh7D5HDrlTI6drL6waP1qQ1elbIQhYPCHiOaMSll3S3
 Sc/omydO6d3DpkgU43d12QhZQ7O1kg==
X-Proofpoint-GUID: dnd9wbPwdSkoL5Kfb8KeFrUo8jmpERaF
X-Authority-Analysis: v=2.4 cv=B8S0EetM c=1 sm=1 tr=0 ts=6924d7dd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=QME20dCx57Gc1q/4dZKLgg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6yKHOGsdPNW3Y-1pzmYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_08,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240192
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

That's better. Nice.

-Akhil.

> 
> Konrad

