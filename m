Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B371CB29AA6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 09:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3A210E3D9;
	Mon, 18 Aug 2025 07:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2yIIDLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B29510E3D7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:17:26 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HMuKo9029100
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /qhnVhx2Ak6MmVxTVAge6g/u9xCi1sPaDT0gtIzKOTs=; b=i2yIIDLh60u3/pai
 iGEyQnRONS5vyvdznnmZ17Vjr8DHLxqUR1N7EJ6hPHyGbexWjXrpr7collEmvexA
 UK1xkUgQW7fh4QBbYauWbS+ljauo10SBwRlZjV42PtgglcZ1VqRzmI5bTmofvQ4i
 HMQExpzLy5lJXFwTAEXIF+8GGwRzAlbQslOhQDYdVGf3ZpkIzYgfzJnf9caY+RyN
 kgF6JlMYfDxp3xM+E8Li5D9RfwHzeaju+x3Thr3kPmaMNMQpYoTX7AL519FV8Ylg
 89AdsOLKi/+bxn8I7YRg5ZCS7PMOB/M4wBXQsktVcJExxqQYpHnf6XWirxmurj4v
 IzZw3A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ubre2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:17:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-244570600a1so44976985ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 00:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755501444; x=1756106244;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/qhnVhx2Ak6MmVxTVAge6g/u9xCi1sPaDT0gtIzKOTs=;
 b=hmL9hnfbTU4u1vbcLbd+VfjGtcfIqKfOcL+wD7M+pSQUBJcIDcxX/a6+VdhuyPzptL
 NlLjolRdq3kNhak48ogjPdlE/4zMJSkzOQQ1JvMbFpj8c+GEQjo4LhlGWpyvtqUGbJjp
 L9MTjjrYNEqvraY/qJnWalPeeoartKx2QAuemidmMGA0oVRLGgxv7qK0HByUTrlL7ozr
 mZgFLv+RlN2tvRD7dSOTMjkgrhHcOBoKmIL3R8C8laBKDWYPYUWQ0ppqPKirWVtlcJ4H
 LIwXlmwAYlqTZ65wHHyha8XiOCLHt5NVnCiutGijwU77+spaXEFzRwk+v03QoqrIrxY3
 5cSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9nrcN4I61NtBTrOMitVhcLZm3uUiHAcZIWArE4gojii0j4IyAjMC4CPiC25igoNsY2h5HpDnK4uk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxnxn5fM9oX+4WaT6mtwnQOJVxPOqpwh7fn8zf1eVEh5aDHMuDF
 RVP0jc6XkmLOBD94DXzpcK1ECaAdDMARd40XUR1xcw8NzsdrFAKun7JBxuzQLYUJRtYkif7EDVv
 4uCJsXAHuiuI9LIEvDTvp+V8ViONUcD3qiVUV/XC/+wvLB6TUj8dQfIzN8C+kYohAHvaZk/4=
X-Gm-Gg: ASbGncvASI62znWxd0R5ftUd1Iswz8xV+hNc57q4cmGWVOkgnqiCl7Qwm1AAE+1LAkC
 5ryjwgt5LBP5+/LZibM5wMI2QhDxlw/FzZvU/54FU5vv+WirOm2SKj1uIf+wu+yplTXtJS7sXrz
 N6dNlQxPMEnwXYCh8HEseAZHGULgr0Eh2VAnhmHXPcPhbTYC+fb1/56hN714RUFyjgSJ0JsWN6/
 5ZQmmOFpDCgLxWCGZln4JjLC3suTxSqKIDxaYPtd48xccLZ10Ta/1Au2kS6gJO4BJGv48NwTGVC
 zWc3JomSXD0mrwH1cRLEiLihfG2zJW9WNJy6Y5aqo9bpZ/C6WkrVUWE2cxAdlLG3
X-Received: by 2002:a17:902:f645:b0:240:86b2:ae9c with SMTP id
 d9443c01a7336-2446bdad87bmr122769675ad.14.1755501443896; 
 Mon, 18 Aug 2025 00:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQzDZnDrRPt9e9ar4NcGlKQx/v15yiS7nW8hWVOCiahtj0oNaVAIJtchO0QDQCqoEqEh/UUQ==
X-Received: by 2002:a17:902:f645:b0:240:86b2:ae9c with SMTP id
 d9443c01a7336-2446bdad87bmr122769485ad.14.1755501443427; 
 Mon, 18 Aug 2025 00:17:23 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.229.157])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9dbfdsm71325165ad.19.2025.08.18.00.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 00:17:23 -0700 (PDT)
Message-ID: <77db4861-4868-4110-8c31-eb2045ddbf4b@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:47:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
 <df007b41-5c3d-4c69-81b9-27155485ccf9@oss.qualcomm.com>
 <pxigrjxtizcrhn4l25ph4yh4runebintfp4swqfiewfq5hqceo@g5cy3mdgjir5>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <pxigrjxtizcrhn4l25ph4yh4runebintfp4swqfiewfq5hqceo@g5cy3mdgjir5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a2d385 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=9Q8gPALlkHEzzDxkdHlyxw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=tT0-4YtFDMztOtjXKeIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hZntXhz4yls3ULZf7uAtMDQDoys6ZIOg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfXwlqGJV4xvJr3
 HwVuZPLO7CZNTSVzEp3bXhOP8tvTeVxAN1OdffgvX2yOjd6VcizutABUfsbKux97hoX8u/AQWk1
 NS8c8pbnyyUVsf/T82AZNqr88O8HXoVtWL7UPkWCNJcwGh175mVXL/NHrljt5SA+7AOdsk5xkxf
 6g7UEKvoTKx+bDxI8kGZXq6Vmdd8BtrztuTeOjiqfUM3yOqkskfuKdGsIc25krsJHkLCwWcEzZ0
 MUPyA/B0ThRRiuKi42+ZetnBKtLhftvdk8Jhlq1cN/x2ZX143oPppk8OjE39BXfTlVmWc1T53bn
 okvw5YZ2IzoOv76FxuThpe0XW0XYkV9MFq+gMW8TMSnohy6/8T3Gi+EnkOsabhbY1ILDQCJCE8e
 9O26IOyK
X-Proofpoint-GUID: hZntXhz4yls3ULZf7uAtMDQDoys6ZIOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031
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

On 8/16/2025 3:45 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 14, 2025 at 07:52:13PM +0200, Konrad Dybcio wrote:
>> On 8/14/25 6:38 PM, Akhil P Oommen wrote:
>>> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 14/08/2025 13:22, Konrad Dybcio wrote:
>>>>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>>>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
>>>>>>>> along
>>>>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>>>>> OPP core scale the interconnect ddr path.
>>>>>>>>
>>>>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>>>>> parameters
>>>>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>>>>>
>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>> ---
>>>>>>>> Changes in v2:
>>>>>>>> - Used proper ACV perfmode bit/freq
>>>>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
>>>>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>>>>   1 file changed, 11 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
>>>>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>> index
>>>>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>>>>               .gmu_chipid = 0x7050001,
>>>>>>>>               .gmu_cgc_mode = 0x00020202,
>>>>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>>>>> +                {
>>>>>>>> +                    .name = "ACV",
>>>>>>>> +                    .fixed = true,
>>>>>>>> +                    .perfmode = BIT(3),
>>>>>>>> +                    .perfmode_bw = 16500000,
>>>>>>>
>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
>>>
>>> You are right that BIT(2) is GPU specific, but that support was
>>> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
>>> use that in Linux too.
>>>
>>> I know some docs show BIT(2) support, but lets not bring in untested
>>> configurations.
>>
>> Eh, then let's get the docs fixed if you don't trust them because we can't
>> work like that..
>>
>> FWIW this is information from per-platform RPMh cmd-db data
> 
> If it comes from cmd-db, then we should be requesting it from the cmd-db
> driver rather than hardcoding it here.

Not really. This should be under the control of GPU driver.
BIT(3) is correct for X1E.

-Akhil.

> 

