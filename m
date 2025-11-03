Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE19C2C970
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BB410E41C;
	Mon,  3 Nov 2025 15:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHAktgvO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPsx/QtL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94E010E419
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:11:34 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A3AS2DZ2891119
 for <dri-devel@lists.freedesktop.org>; Mon, 3 Nov 2025 15:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UCJAK7Pd4+aj+wxIVjIVEoofMTvNUM501URNtwpY89s=; b=aHAktgvOJhWLL9Pl
 oiRageaRcNP0GjmoVER3oMJiQp0IIjFSdxDbLJUfKWF6V63+ycXERiNQ1sDNT6Lr
 3ClmeXGshkzuicp7+kkNlUJJ6vblUxHhBkxBRTT82ePameSLWo2Doy1e4P7n6Eki
 wprlWG/jMCkXCRUi1ynMh53bX8n0rEB/VOXcxFudUeIo74OdJIXlcAs6rcrTLeyo
 0uK0YnFue9obl0m7U1gkSN6O4bjdIVrWvNQJj6QsPsh5Ukqks7+n/4MSWCKCJ14b
 cb582dysdGLr2/4lLPhSBTi79ZInl4uDpIEYbjUC92h0WlAgX8WZieB0bXWsx/9Z
 QagOaQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6tnrgptj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 15:11:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-33da1f30fdfso11566396a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 07:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762182693; x=1762787493;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UCJAK7Pd4+aj+wxIVjIVEoofMTvNUM501URNtwpY89s=;
 b=bPsx/QtL3zqyED701acw/hwPPfSWgxyb8tCDYuSHrYdzgtJV6iAhaMNFJ9RHjEnoKr
 IR6aOq2muo0zG2JRTjC9HfQCAzAGR2JTgBV89JiWtkAsrS0lk+9UHjK3098j5IOGGoMz
 zBrf0wgyYLjya7NrcU+oelQRC/uaAtjV9bb0v224+jjYzQnLghto1kFoTfIt8qpk0eEu
 y6ffWoVkkZoMfqMJfoc0lZCs4OGvOu4YXL1o5GgkRsOIc9GrG6J8BpHS4mk4GPl8+rw7
 IN2InqnAfcfLVopEGvHLEd8HVpmLXw9HZagONm/gbR09gIhAZWhJtS9dU++LEnKdYaZh
 W1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762182693; x=1762787493;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UCJAK7Pd4+aj+wxIVjIVEoofMTvNUM501URNtwpY89s=;
 b=Cw71qiXEh1OvbemwU0KGdUFMq8kHHrAojgZsEyi7syKR24+Lm/mQHxSZWyFxS3Pa+9
 TcwmSgtcvzGSrOtb24E9SZjkuDFAoX/OMJPjRxKBgjmGeOsbmPb6615JZHKMPCpzAYXB
 LP39vqiRJaMfF2cnt90La3nV3mhLcK1by9LVL9gVixrgiWi9/r3TlGASqqyltgfRHwcx
 FPJS6Hk0D94rGKOk23dHExikbSURSN8FK9wW+m37FSl+hZ2Euj6w0bDdvqGbyxI/FgE4
 F40rhDgATMQ2D5x6DIWFYbCIjzC2RCaCEGOKq4Logj4deYFhXc0o/DIlMkyxLnNSw5sD
 zmhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2Tdk0gpfLEHvZ2qev5r2520GAFHwlk+sRYnBzRchQy/KZGGMiJdi52I65I5fIK2aTmOik21TMhz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2PDB4rpNTd8gR3k4z3/NAQBhz7kRMjFtyjQ6HZ/EOf0zm67IN
 AJ24W3XCCS5wEtgbM0supP7A3JNV/AWwfkdbj6CbnLWAJxFIsHdp9UgqbgPIbf1AKpWRUgYK2qW
 YLvPaC51gJ0mtwATS02ljEWbXypUdU7xJFJBT2x6vdbLGXjTN8DWULxsyzY1MK/w8b2YJaRE=
X-Gm-Gg: ASbGncuHzM8Ex3PO93Bf769p29TEkBsX2b6hBrWkXE8uAwK6zjmtX0F1zOh23eOEL9I
 /VCGOE9PiC8/aYkPGXH00PNc177H9SJM8KbXfXpT7bpawcQJWEEZ1g2xGTTOMkTfL7Yk2z0ZeM2
 hZxjuc7xhXeIRRpzU6U08+FOm1eSbLXVVD3jplpq5DLmoNcqAh5Fg9aPnBK18qdVqX1shd8+XSI
 GpDql8V6Nht19Diz5WKWBryWS3dQlO0wZq3UJ+bCKIU4wxxdFcyQPhSNe5VX10vYB7gvOfVsg0o
 PtM0bXw8wviMtOul/zJUK1eOvJj4s0paU13RO558b10uIQcc1HmUAOr1cDjMgi7URGYiDs8/6xz
 0n832JTv/pVaJ+mcAPn9Kzg==
X-Received: by 2002:a17:90b:51d1:b0:336:9dcf:ed14 with SMTP id
 98e67ed59e1d1-3408306b9f3mr15500191a91.23.1762182692517; 
 Mon, 03 Nov 2025 07:11:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESf0Nr7es9ACs3xLYQHQL6znc/SOeNTdnJIBLHpv32YpmW22UrjULWnWPm19AUoFoOpZYFYw==
X-Received: by 2002:a17:90b:51d1:b0:336:9dcf:ed14 with SMTP id
 98e67ed59e1d1-3408306b9f3mr15500142a91.23.1762182691936; 
 Mon, 03 Nov 2025 07:11:31 -0800 (PST)
Received: from [10.206.104.82] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-340ad517882sm4492958a91.5.2025.11.03.07.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 07:11:30 -0800 (PST)
Message-ID: <5272401a-612c-467e-a833-36fe72837d5b@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 20:41:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Chia-I Wu <olvaffe@gmail.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
 <CAPaKu7TQ3tkQREG8xphW_L5eQPLuQhA=oKjfmYVJDR7PsNBXQg@mail.gmail.com>
 <CACSVV02B8BzvznzOoMw0EgOXEY39syWdyfzTcqWB0qsYjf42hQ@mail.gmail.com>
 <1d6a50c3-eb1d-46a9-922c-e57e6e83779d@oss.qualcomm.com>
 <CAPaKu7QvBZmx0b8SDBY1H3u-Em+0py0BrGkmrfGUXkx1uQrg3A@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CAPaKu7QvBZmx0b8SDBY1H3u-Em+0py0BrGkmrfGUXkx1uQrg3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNiBTYWx0ZWRfX35CbABg8LavK
 d2gABko15OYc/5Bn3ael8voG6UnCniQuPfm0OYjdRXPOhoqaDY0oHEPyq8+fosV/zk1a3HmDpJC
 YwJiNpTB/0Jbyu5+ent89VGwlSkN/KSn377j/w95/D3OROPxIMiUKkL6gLWtkvcAOkKoQ5D5/vK
 F84oWmiEfVWn93E8QaXzIzKnFAS2KPcY/oHYQs5kofmVvKhzV7MZQN+R2Uat34PRMqml6JHAtfP
 1txg1sNwWrL7pbfpmG8dhPoLfLqa4XZHqyREJGignBorhki+IrU2vmWYCWgYW0sRw+eakXbehMY
 H/rf5g5TkFri17Xs4UfkmafdtY9t3XPQZMk5baKSaoI+UyDDd5fvycw4NepnQFz4tq/IUhPmZjV
 i/BW68k8hT0/Z116TYZX6MJotVXBgQ==
X-Proofpoint-GUID: 1TDYXl1dvTzMl4aX69Kav39oOCqEdl4R
X-Proofpoint-ORIG-GUID: 1TDYXl1dvTzMl4aX69Kav39oOCqEdl4R
X-Authority-Analysis: v=2.4 cv=BrSQAIX5 c=1 sm=1 tr=0 ts=6908c625 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=ZGesvalcjkYv3LExhKQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030136
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

On 11/2/2025 11:25 PM, Chia-I Wu wrote:
> On Sat, Nov 1, 2025 at 12:52 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 11/1/2025 6:27 PM, Rob Clark wrote:
>>> On Fri, Oct 31, 2025 at 4:43 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>>>>
>>>> On Mon, Sep 8, 2025 at 1:28 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>>>
>>>>> Add the IFPC restore register list and enable IFPC support on Adreno
>>>>> X1-85 gpu.
>>>>>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 68 ++++++++++++++++++++++++++++++-
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>>  3 files changed, 79 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..547c046730a9b50a82cc9b27f08a5b1eeb08dced 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>>>>>
>>>>>  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
>>>>>
>>>>> +/* Applicable for X185, A750 */
>>>>> +static const u32 a750_ifpc_reglist_regs[] = {
>>>>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
>>>>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
>>>>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
>>>>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
>>>>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
>>>>> +       REG_A6XX_TPL1_NC_MODE_CNTL,
>>>>> +       REG_A6XX_SP_NC_MODE_CNTL,
>>>>> +       REG_A6XX_CP_DBG_ECO_CNTL,
>>>>> +       REG_A6XX_CP_PROTECT_CNTL,
>>>>> +       REG_A6XX_CP_PROTECT(0),
>>>>> +       REG_A6XX_CP_PROTECT(1),
>>>>> +       REG_A6XX_CP_PROTECT(2),
>>>>> +       REG_A6XX_CP_PROTECT(3),
>>>>> +       REG_A6XX_CP_PROTECT(4),
>>>>> +       REG_A6XX_CP_PROTECT(5),
>>>>> +       REG_A6XX_CP_PROTECT(6),
>>>>> +       REG_A6XX_CP_PROTECT(7),
>>>>> +       REG_A6XX_CP_PROTECT(8),
>>>>> +       REG_A6XX_CP_PROTECT(9),
>>>>> +       REG_A6XX_CP_PROTECT(10),
>>>>> +       REG_A6XX_CP_PROTECT(11),
>>>>> +       REG_A6XX_CP_PROTECT(12),
>>>>> +       REG_A6XX_CP_PROTECT(13),
>>>>> +       REG_A6XX_CP_PROTECT(14),
>>>>> +       REG_A6XX_CP_PROTECT(15),
>>>>> +       REG_A6XX_CP_PROTECT(16),
>>>>> +       REG_A6XX_CP_PROTECT(17),
>>>>> +       REG_A6XX_CP_PROTECT(18),
>>>>> +       REG_A6XX_CP_PROTECT(19),
>>>>> +       REG_A6XX_CP_PROTECT(20),
>>>>> +       REG_A6XX_CP_PROTECT(21),
>>>>> +       REG_A6XX_CP_PROTECT(22),
>>>>> +       REG_A6XX_CP_PROTECT(23),
>>>>> +       REG_A6XX_CP_PROTECT(24),
>>>>> +       REG_A6XX_CP_PROTECT(25),
>>>>> +       REG_A6XX_CP_PROTECT(26),
>>>>> +       REG_A6XX_CP_PROTECT(27),
>>>>> +       REG_A6XX_CP_PROTECT(28),
>>>>> +       REG_A6XX_CP_PROTECT(29),
>>>>> +       REG_A6XX_CP_PROTECT(30),
>>>>> +       REG_A6XX_CP_PROTECT(31),
>>>>> +       REG_A6XX_CP_PROTECT(32),
>>>>> +       REG_A6XX_CP_PROTECT(33),
>>>>> +       REG_A6XX_CP_PROTECT(34),
>>>>> +       REG_A6XX_CP_PROTECT(35),
>>>>> +       REG_A6XX_CP_PROTECT(36),
>>>>> +       REG_A6XX_CP_PROTECT(37),
>>>>> +       REG_A6XX_CP_PROTECT(38),
>>>>> +       REG_A6XX_CP_PROTECT(39),
>>>>> +       REG_A6XX_CP_PROTECT(40),
>>>>> +       REG_A6XX_CP_PROTECT(41),
>>>>> +       REG_A6XX_CP_PROTECT(42),
>>>>> +       REG_A6XX_CP_PROTECT(43),
>>>>> +       REG_A6XX_CP_PROTECT(44),
>>>>> +       REG_A6XX_CP_PROTECT(45),
>>>>> +       REG_A6XX_CP_PROTECT(46),
>>>>> +       REG_A6XX_CP_PROTECT(47),
>>>>> +};
>>>>> +
>>>>> +DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
>>>>> +
>>>>>  static const struct adreno_info a7xx_gpus[] = {
>>>>>         {
>>>>>                 .chip_ids = ADRENO_CHIP_IDS(0x07000200),
>>>>> @@ -1432,12 +1495,14 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>                 .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>>>>                 .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>>>>>                           ADRENO_QUIRK_HAS_HW_APRIV |
>>>>> -                         ADRENO_QUIRK_PREEMPTION,
>>>>> +                         ADRENO_QUIRK_PREEMPTION |
>>>>> +                         ADRENO_QUIRK_IFPC,
>>>>>                 .init = a6xx_gpu_init,
>>>>>                 .a6xx = &(const struct a6xx_info) {
>>>>>                         .hwcg = a740_hwcg,
>>>>>                         .protect = &a730_protect,
>>>>>                         .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>> +                       .ifpc_reglist = &a750_ifpc_reglist,
>>>>>                         .gmu_chipid = 0x7050001,
>>>>>                         .gmu_cgc_mode = 0x00020202,
>>>>>                 },
>>>>> @@ -1466,6 +1531,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>                 .a6xx = &(const struct a6xx_info) {
>>>>>                         .protect = &a730_protect,
>>>>>                         .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>> +                       .ifpc_reglist = &a750_ifpc_reglist,
>>>>>                         .gmu_chipid = 0x7090100,
>>>>>                         .gmu_cgc_mode = 0x00020202,
>>>>>                         .bcms = (const struct a6xx_bcm[]) {
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> index 76dd78f5c48ea818a2aa209e0c0c88bc5e8f4e06..91a2a82c4f388ca6b052172efdd7255165f3c04a 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> @@ -828,11 +828,10 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>>>>>         u32 *dest = (u32 *)&lock->regs[0];
>>>>>         int i;
>>>>>
>>>>> -       reglist = adreno_gpu->info->a6xx->pwrup_reglist;
>>>>> -
>>>>>         lock->gpu_req = lock->cpu_req = lock->turn = 0;
>>>>> -       lock->ifpc_list_len = 0;
>>>>> -       lock->preemption_list_len = reglist->count;
>>>>> +
>>>>> +       reglist = adreno_gpu->info->a6xx->ifpc_reglist;
>>>> This is NULL on X1-45 and causes
>>>>
>>>>   [    8.795603] Unable to handle kernel NULL pointer dereference at
>>>> virtual address 0000000000000008
>>>
>>> Hmm, this is probably going to happen on all a7xx which don't have
>>> IFPC from the looks of it.
>>>
>>> We should either check for the IFPC quirk.. or maybe just drop the
>>> quirk and decide whether IFPC is supported based on ifpc_reglist !=
>>> NULL?
>>>
>>> (That said, we probably do want to have IFPC enabled for x1-45)
>>
>> We should add a check for IFPC quirk here. Chia, do you plan to send a fix?
>>
>> To enable IFPC, we can just add a750_ifpc_reglist_regs[] to
>> adreno_gpu->info->a6xx->ifpc_reglist and enable the IFPC quirk.
> Maybe it is easier for you to do the fix? Because I would have several
> little questions (what happens when the reglist and the quirk flag are
> inconsistent? how about preemption reglist?)
> 
> I am happy to do the testing.

No problem. I will send a fix.

-Akhil

> 
>>
>> -Akhil.
>>
>>>
>>> BR,
>>> -R
>>>
>>>>> +       lock->ifpc_list_len = reglist->count;
>>>>>
>>>>>         /*
>>>>>          * For each entry in each of the lists, write the offset and the current
>>>>> @@ -843,6 +842,14 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>>>>>                 *dest++ = gpu_read(gpu, reglist->regs[i]);
>>>>>         }
>>>>>
>>>>> +       reglist = adreno_gpu->info->a6xx->pwrup_reglist;
>>>>> +       lock->preemption_list_len = reglist->count;
>>>>> +
>>>>> +       for (i = 0; i < reglist->count; i++) {
>>>>> +               *dest++ = reglist->regs[i];
>>>>> +               *dest++ = gpu_read(gpu, reglist->regs[i]);
>>>>> +       }
>>>>> +
>>>>>         /*
>>>>>          * The overall register list is composed of
>>>>>          * 1. Static IFPC-only registers
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>>> index 124c63c4615930b00c64e488a498163ae35afccd..0b17d36c36a9567e6afa4269ae7783ed3578e40e 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>>> @@ -45,6 +45,7 @@ struct a6xx_info {
>>>>>         const struct adreno_reglist *hwcg;
>>>>>         const struct adreno_protect *protect;
>>>>>         const struct adreno_reglist_list *pwrup_reglist;
>>>>> +       const struct adreno_reglist_list *ifpc_reglist;
>>>>>         u32 gmu_chipid;
>>>>>         u32 gmu_cgc_mode;
>>>>>         u32 prim_fifo_threshold;
>>>>>
>>>>> --
>>>>> 2.50.1
>>>>>
>>

