Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B3EB26CA5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 18:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F1710E8BB;
	Thu, 14 Aug 2025 16:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgD3YFgW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D42A10E8B9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:38:35 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8l1wR027013
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jaTQfIJ1yVIsO9S61XfkZRmWT+mBRLlhDRy6dXJpoxk=; b=DgD3YFgWJFQFRh1m
 hGf1+FIo04Co6vUTW+fhtdIbSuyhnAGxW33sLBlzoDM7UglZcHUvJOG9+3DmxE9/
 8WKWrvmWg60Q17oFHxtnY9Wvqm98uZnTDd7/IFscWIwC9Mv67pqmfNKMocrL1MhT
 DDSFiZAOLvv3nPg/OMRJJlVqaHhOLZ0XC09/Z1WrWrXdQPb8h6T+9XxKkOBl71s5
 ASLQPsYfyMZdbGIeGJSyy/5Ksc7dvyNsatzr6cRVqr3hJ6ZeSvn2ndrWF1uEUh6p
 O27e9tRl4i/oTTApczcM1e3J4c33c/iw+/GXyK5F45RmtpAaTIrXOLmatCmftUUN
 V82GWQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjv93h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:38:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2430c5d4d73so24672315ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755189513; x=1755794313;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jaTQfIJ1yVIsO9S61XfkZRmWT+mBRLlhDRy6dXJpoxk=;
 b=ceDb8PkjeX5BPiVENB65ISCuNSf2KhKvluRQBvz0A3F9Kv2ENevkAoxs5mMVpzW80J
 TAveEdZQHoK4Bx3D+r9tirjuXNqq3OZKJ0PaQyCxR8XXSwcKNTkNJ3pGmqkBqc4WCtNH
 UlTe1sVyYi9/GBVnWC2FIlBs/k0mzPTDz3wtuZLgDsytf+cABYSFqyZhzSMp2pJXgjt0
 XxaVbCu2IZn7RyoKUHouUDGdHjDoGLgofkHwttgzH5KauN9Ewue1/2jrcCU56/45w5P0
 UX7cEx05oSyavgW2/PXUtpVWWE0h+nyjdCVARfV+IbM4CjztqFCHlxoQ2D/7i5jjlp4g
 Yn7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQIjPj0sASzLI+r87cgSlNDRQC2MPMU3nPNg+tGWUCDFTn2RTPUfbc3h0fNRor9KuThJJvWSc6LUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymdSIsixfAy5kvKma8BGzyvD73+6gbMKlJNRgnM8fI0Bv1Sinh
 ck4F/Nb/JnKbbDvmoSvxLyjFQntG5CMgBzIkvRl8o3vW9NV7GDnWqAHGus1CyIEoqyl1FlO0cEO
 KWCQyzL0+nAdRBoy8XY7DdoAiYU8n6N8h/off3J2MC5iyw/cSQfrQ2IYjfXdhV8oLTEnKIqM=
X-Gm-Gg: ASbGncszQkPKxUSo+Csxs9XlY1LGaRIoWk/xOc6eACFMoaF07e2+PmplReTKlSOXfeH
 y3aP3PeWeDjcM2hAIebNzg/Rcrhju9pwnHGxzkZr3Fg8o1YYnO+NjNIf8v/+P7VqwwhNZD3tt6/
 EnWtAQzBiDkIta/MCq50hpArJ6/eq2aPwygeOb2XjuOVhNdoH8FlS91eFqptNH3SCG1JT55Ls0s
 QC8D0Q9vEdDBMPb23DXJfmnp7AS93yj/49VmoT7d/QldBqb/8V31CoX+4iJbdzwnQNruAiXR1dC
 44E8siX/H2kU03mmsBzLGlE4Ztg7CB0dP9gXUiRpi4uY9Uz2bTxZdKQ3um49vGY=
X-Received: by 2002:a17:902:d483:b0:234:1e11:95a3 with SMTP id
 d9443c01a7336-2445978c8ccmr56761485ad.13.1755189512861; 
 Thu, 14 Aug 2025 09:38:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA5KjhREwZxocKHlp81qbREqS5IgYM2U1497mlRdma3ow5tbSm83x7BFjlpFu8sePsAp2J/g==
X-Received: by 2002:a17:902:d483:b0:234:1e11:95a3 with SMTP id
 d9443c01a7336-2445978c8ccmr56760915ad.13.1755189512299; 
 Thu, 14 Aug 2025 09:38:32 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24300f8c9d1sm71788655ad.129.2025.08.14.09.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 09:38:31 -0700 (PDT)
Message-ID: <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 22:08:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX0DvRYBTVwcDy
 PgHpwYN9PoTR/OgDn495uYWL18xnIGs4byRXAcWBe0iKiLwmd3lWtkzCrngeIZ4kPSp4BvS9gQE
 /AW75KaULYVUjh9ITtSYAtEO87Y86zAbDt2mkvqIt0YMnIpW7kpfSOlVvcDW2C/a5hWVxL4J1tj
 LSJmylgG1uvsH91NAadvz6HacpQjsfEbBUIqhsBxR80cvewAacjVp8OC5ZqQIam06VunZTRwC2S
 ajHJY1ggXgPxMLJOGuXrYgY3m0pCcGCV20ifG1m1LEe1E6ZVtmmkawQ1Dxr9FgL8/9v9uHshpC/
 Fi6ubjynIxXbn6oXTrO6svEns/Eo4hUfI7vtwHTZOMjmDt6GmehBhkTiltcMFRXBf42CnHtDJT6
 CAhXai9g
X-Proofpoint-GUID: XeFfzXBTsyrMbkpxt4vVtIfpL7IK-pzW
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689e110a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=geSN8yY6MFID4zSGlH7RRw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=7lXMnOvvf2IE2kTxY-AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XeFfzXBTsyrMbkpxt4vVtIfpL7IK-pzW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
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

On 8/14/2025 7:56 PM, Neil Armstrong wrote:
> Hi,
> 
> On 14/08/2025 13:22, Konrad Dybcio wrote:
>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
>>>>> along
>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>> OPP core scale the interconnect ddr path.
>>>>>
>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>> parameters
>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Used proper ACV perfmode bit/freq
>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>> ---
>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>   1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> index
>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>               .gmu_chipid = 0x7050001,
>>>>>               .gmu_cgc_mode = 0x00020202,
>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>> +                {
>>>>> +                    .name = "ACV",
>>>>> +                    .fixed = true,
>>>>> +                    .perfmode = BIT(3),
>>>>> +                    .perfmode_bw = 16500000,
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)

You are right that BIT(2) is GPU specific, but that support was
commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
use that in Linux too.

I know some docs show BIT(2) support, but lets not bring in untested
configurations.

-Akhil.

>>
>> This is *very* platform-dependent, goes without saying..
>>
>> I see BIT(2) is also valid for X1P4
> 
> 
> I'm confused, Akhil can you confirm ?
> 
> Neil>
>>
>> Konrad
> 

