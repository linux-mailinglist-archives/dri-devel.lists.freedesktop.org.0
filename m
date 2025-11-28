Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49A7C90E28
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 06:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4406710E0DD;
	Fri, 28 Nov 2025 05:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6DLqti9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYS5hzBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7993810E0DD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:27:56 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AS0jmBr3840173
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bU234KVyfuiQ071hOUaarXJSwgrW199aj94jOmrKW8A=; b=Q6DLqti9tTGUw+uX
 9rl9NCSMGJApFugNAQ6IBKmsRbS2nFD3I9+u+dzrtzqTRuO/s+TqRtPm/M0ZTPWE
 YEeOdU1vLx7KjNh+pRBVb65Ea6geq8j9YCXIeuaKh5OwHZguKfLkuPvPZX7k8TIt
 YpmU2V0bEacl5BNmZkEzd2fHRWbeI4ia7+1HQLpM6a4DKwrsYsMDigz9+TQEGQ5W
 j3X8SGD69yFALu5yyi95W1ABhaQmoq46t/1mRFFieb3BmK41p5xFuHhu35t05T/f
 Qs/S71zJy0tjncGt3ZYsHWye4O/cD/xUqEcMdZNOlIkEPTjxWCQCSj6h3Wpq9pYx
 VpXsEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apdj0bgnc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:27:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297f3710070so28659205ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 21:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764307674; x=1764912474;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bU234KVyfuiQ071hOUaarXJSwgrW199aj94jOmrKW8A=;
 b=cYS5hzBehLegSR43LTUhs0Nx6Cq8zkB6qsOP/hvdcti/9i5VDWs+RKdbZggFJDwjTo
 ynlwCOWZmzxjfaWu4+HohMpO+zItSQcid1QKwNo82WjFPoiEGdhYad+DBO93NJk8wOXV
 aq501LtO+Q8qV3G/RU5RrmK5y83xu/bxywqoXoJ52qmAvDkB6C8ii5YIyRzHzd0F5Edd
 TTkCRVI4A+T3rqUl/7JpRkjIrK3WfmcPHvpOZyPTuPclBBsM0FDEi7Cxs0bwy5OMMo65
 0ABazNdn4Zfz3KiPAMMWUuQM5mP71/e0xFqU3huX0B+z/g8wxIE7oEAkxa9LP42Rudi/
 WFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764307674; x=1764912474;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bU234KVyfuiQ071hOUaarXJSwgrW199aj94jOmrKW8A=;
 b=sq7ja6PvzM7oiGEPxJ60Nu99LKxoTO3Ao9sqBSZCCY75R9UmIPMYt+zJHd65v1j/fc
 nWAUcmqslNqjXTwbxYFuhC/dA0Yr27HEH1ZI+jJGbQa54Q4UDjXIPvxNEadiDZVChfeU
 KI0gNPh8l9aIyzC24plHkkilD/T9O63SRBWN3CKuCeEj+53IZB4MBKs3GpccEPRkmF4M
 7YTvMEwLemMFuuJfYah8r+yM+2xNnR5uathpy0WWdlEYYernQdJebBQuotF+U+D4AhWr
 HIcZWzWx2jvsRl95R+Yha/c6KGA7rcRhsaT7ZONXE2Ey8D19LjImriIVlgwB13jPjw2f
 +t7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEMEYha9Q2CWtbxEtqKIbwJYtcRdWF9A1/Zxb3klCzNDIdbMuWyjkaW2GV/EkF5zVCucJljcNK5HI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhaDobMPuAoRFNwRab4uCp9kxr4fNXyP/53exGeLRmvstNai1U
 asaLNB8F2i8oiJgBmOrMFfPu9wKLl3WsS1QiKf2M7R6MC8VD/BgL2LU8IVMlfHi9VL+olY1YQO8
 +OrIneM/Z7Uk8eTlDogk4nsqtyhKZbRUiRXSM04QrcFyljIILOxFwRlzMjn++4NlxUnQ3uYE=
X-Gm-Gg: ASbGncvweLH7L9fi3inaMLHDDVhKHgz8EEUEFBzKZ0EsPRNX2hjpfz5zujhZ87WWVpW
 stOn7jAeK5DJ2wyyIzD+OVwNdl/5r62WcaC+RK7f2MEpVZPyZCYw8lZUcmbC2npsPaepFDZVvkK
 lMpV48EfaEslSZgGzbedbd4bQ4qim6ou3DzD9dswmQLrZAC2IPj4TF+xXa8lbQdDATk+JGc0Vl5
 tDkB81oBRHhxS4GUlHQ5lScLGlYWy61Qse/e5vZpw6UxI69v9sMZraId68Vcd40B0HaAd6JkyRQ
 Kqt493DhAdB4OQ6keWnIPaYeSx5nzA9m4cRKGUft3PLxvNzUNHIi1CQLP5HofhzsS1FzHWdtJB0
 qzQ3RiAjoBlPEEjzMZ4Ul5QDtPZ/twOAyyjNlEQac7e3w6Z8eWdA143rS2iyP4/Elbcz/qgg=
X-Received: by 2002:a17:903:2b0f:b0:297:e66a:2065 with SMTP id
 d9443c01a7336-29b6c6d0d46mr286081335ad.56.1764307674373; 
 Thu, 27 Nov 2025 21:27:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDTmfxXPvgxwTlUUIThN+iC9CGgSmXnh9oSSh6fI7QVMDdWMCB8DnyUD3jCI4KfCNeEel0FA==
X-Received: by 2002:a17:903:2b0f:b0:297:e66a:2065 with SMTP id
 d9443c01a7336-29b6c6d0d46mr286081055ad.56.1764307673874; 
 Thu, 27 Nov 2025 21:27:53 -0800 (PST)
Received: from ?IPV6:2401:4900:1c27:6704:8849:8c0d:18ec:2263?
 ([2401:4900:1c27:6704:8849:8c0d:18ec:2263])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3476a7a4c12sm7424746a91.9.2025.11.27.21.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 21:27:53 -0800 (PST)
Message-ID: <2c234003-c4b5-4b82-938c-8f7f85efedbc@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 10:57:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix a7xx per pipe register programming
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
 <bf66095e-9f25-4e0f-876a-00f637a7c696@oss.qualcomm.com>
 <c7d9f540-b1c0-45a4-befe-177b6d79277a@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <c7d9f540-b1c0-45a4-befe-177b6d79277a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNyBTYWx0ZWRfXwItsSCgIo1yL
 Zi5hPkLZmrKaPI7o8WDSSRA+j8omYrEQ2XfCYlTMmoWURUbPLLb8xpVEuIG1HhXLyOiMGQt5iut
 Qr9eCSW7Wg7cUXuO9F0PYxliio8dUyOCe6XYOiNc2i3gp+tzzbni9eGncgVS0ejO8TicxKUONyi
 vBauOI0mJuio7H0cvpXVtkYSe3QLP83aBoHC5d6gXEcTTGGSabn0O2UOErdmQunhuRiEq5+Hnyy
 Ew50+FU5EH4iFWZkuYyELzs+1MjkKj9BTOra/KR2H2PTQ8ccewsjikY0Pxv/WXN4jBB05LMVcwJ
 bIKWTgtIDL4mRrGVij0i57eEQAR17D1RoSAhAi7/ariVrOSWdc0GghoP2r9/nk+FS6FoBzBRw84
 F2ZvixIaOkbsxnHObjdiYBNQtXVmFQ==
X-Proofpoint-GUID: UZe0o8WmoKN1hFwA6xC9M4UeU3WDLor8
X-Proofpoint-ORIG-GUID: UZe0o8WmoKN1hFwA6xC9M4UeU3WDLor8
X-Authority-Analysis: v=2.4 cv=PJoCOPqC c=1 sm=1 tr=0 ts=692932db cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=jF3HVPuvk2LWSY_FLscA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280037
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

On 11/28/2025 4:42 AM, Anna Maniscalco wrote:
> On 11/27/25 10:57 PM, Akhil P Oommen wrote:
>> On 11/27/2025 5:16 AM, Anna Maniscalco wrote:
>>> GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
>>> but it needs to be programmed for both.
>>>
>>> Program both pipes in hw_init and introducea separate reglist for it in
>>> order to add this register to the dynamic reglist which supports
>>> restoring registers per pipe.
>>>
>>> Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to
>>> a6xx_info")
>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++-
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 91 ++++++++++++++++++++
>>> +++++++++--
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 +++++
>>>   4 files changed, 109 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/
>>> drm/msm/adreno/a6xx_catalog.c
>>> index 29107b362346..c8d0b1d59b68 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -1376,7 +1376,6 @@ static const uint32_t a7xx_pwrup_reglist_regs[]
>>> = {
>>>       REG_A6XX_UCHE_MODE_CNTL,
>>>       REG_A6XX_RB_NC_MODE_CNTL,
>>>       REG_A6XX_RB_CMP_DBG_ECO_CNTL,
>>> -    REG_A7XX_GRAS_NC_MODE_CNTL,
>>>       REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
>>>       REG_A6XX_UCHE_GBIF_GX_CONFIG,
>>>       REG_A6XX_UCHE_CLIENT_PF,
>>> @@ -1448,6 +1447,12 @@ static const u32 a750_ifpc_reglist_regs[] = {
>>>     DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
>>>   +static const struct adreno_reglist_pipe a750_reglist_pipe_regs[] = {
>>> +    { REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
>>> +};
>>> +
>>> +DECLARE_ADRENO_REGLIST_PIPE_LIST(a750_reglist_pipe);
>>> +
>>>   static const struct adreno_info a7xx_gpus[] = {
>>>       {
>>>           .chip_ids = ADRENO_CHIP_IDS(0x07000200),
>>> @@ -1548,6 +1553,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>>               .protect = &a730_protect,
>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>               .ifpc_reglist = &a750_ifpc_reglist,
>>> +            .pipe_reglist = &a750_reglist_pipe,
>>>               .gbif_cx = a640_gbif,
>>>               .gmu_chipid = 0x7050001,
>>>               .gmu_cgc_mode = 0x00020202,
>>> @@ -1590,6 +1596,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>>               .protect = &a730_protect,
>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>               .ifpc_reglist = &a750_ifpc_reglist,
>>> +            .pipe_reglist = &a750_reglist_pipe,
>>>               .gbif_cx = a640_gbif,
>>>               .gmu_chipid = 0x7090100,
>>>               .gmu_cgc_mode = 0x00020202,
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/
>>> msm/adreno/a6xx_gpu.c
>>> index 0200a7e71cdf..b98f3e93d0a8 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -16,6 +16,72 @@
>>>     #define GPU_PAS_ID 13
>>>   +static void a7xx_aperture_slice_set(struct msm_gpu *gpu, enum
>>> adreno_pipe pipe)
>>> +{
>>> +    struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>> +    struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>> +    u32 val;
>>> +
>>> +    val = A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe);
>>> +
>>> +    if (a6xx_gpu->cached_aperture == val)
>>> +        return;
>>> +
>>> +    gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST, val);
>>> +
>>> +    a6xx_gpu->cached_aperture = val;
>>> +}
>>> +
>>> +static void a7xx_aperture_acquire(struct msm_gpu *gpu, enum
>>> adreno_pipe pipe, unsigned long *flags)
>>> +{
>>> +    struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>> +    struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>> +
>>> +    spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
>>> +
>>> +    a7xx_aperture_slice_set(gpu, pipe);
>>> +}
>>> +
>>> +static void a7xx_aperture_release(struct msm_gpu *gpu, unsigned long
>>> flags)
>>> +{
>>> +    struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>> +    struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>> +
>>> +    spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
>>> +}
>>> +
>>> +static void a7xx_aperture_clear(struct msm_gpu *gpu)
>>> +{
>>> +    unsigned long flags;
>>> +
>>> +    a7xx_aperture_acquire(gpu, PIPE_NONE, &flags);
>>> +    a7xx_aperture_release(gpu, flags);
>>> +}
>>> +
>>> +static void a7xx_write_pipe(struct msm_gpu *gpu, enum adreno_pipe
>>> pipe, u32 offset, u32 data)
>>> +{
>>> +    unsigned long flags;
>>> +
>>> +    a7xx_aperture_acquire(gpu, pipe, &flags);
>>> +    gpu_write(gpu, offset, data);
>>> +    a7xx_aperture_release(gpu, flags);
>>> +}
>>> +
>>> +static u32 a7xx_read_pipe(struct msm_gpu *gpu, enum adreno_pipe
>>> pipe, u32 offset)
>>> +{
>>> +    struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>> +    struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>> +    unsigned long flags;
>>> +    u32 val;
>>> +
>>> +    spin_lock_irqsave(&a6xx_gpu->aperture_lock, flags);
>>> +    a7xx_aperture_slice_set(gpu, pipe);
>>> +    val = gpu_read(gpu, offset);
>>> +    spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
>>> +
>>> +    return val;
>>> +}
>>> +
>> All of the above helper routines are unncessary because we access only a
>> single register under the aperture in a7x hw_init(). Lets drop these and
>> program the aperture register directly below.
> We also access (read) it in a7xx_patch_pwrup_reglist though, so do we
> want to inline it twice?

Yeah.

>>
>>
>>>   static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
>>>   {
>>>       u64 count_hi, count_lo, temp;
>>> @@ -849,9 +915,12 @@ static void a6xx_set_ubwc_config(struct msm_gpu
>>> *gpu)
>>>             min_acc_len_64b << 3 |
>>>             hbb_lo << 1 | ubwc_mode);
>>>   -    if (adreno_is_a7xx(adreno_gpu))
>>> -        gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
>>> -              FIELD_PREP(GENMASK(8, 5), hbb_lo));
>>> +    if (adreno_is_a7xx(adreno_gpu)) {
>>> +        for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_BV; pipe_id++)
>>> +            a7xx_write_pipe(gpu, pipe_id, REG_A7XX_GRAS_NC_MODE_CNTL,
>>> +                    FIELD_PREP(GENMASK(8, 5), hbb_lo));
>>> +        a7xx_aperture_clear(gpu);
>>> +    }
>>>         gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
>>>             min_acc_len_64b << 23 | hbb_lo << 21);
>>> @@ -865,9 +934,11 @@ static void a7xx_patch_pwrup_reglist(struct
>>> msm_gpu *gpu)
>>>       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>       const struct adreno_reglist_list *reglist;
>>> +    const struct adreno_reglist_pipe_list *pipe_reglist;
>>>       void *ptr = a6xx_gpu->pwrup_reglist_ptr;
>>>       struct cpu_gpu_lock *lock = ptr;
>>>       u32 *dest = (u32 *)&lock->regs[0];
>>> +    u32 pipe_reglist_count = 0;
>>>       int i;
>>>         lock->gpu_req = lock->cpu_req = lock->turn = 0;
>>> @@ -907,7 +978,19 @@ static void a7xx_patch_pwrup_reglist(struct
>>> msm_gpu *gpu)
>>>        * (<aperture, shifted 12 bits> <address> <data>), and the
>>> length is
>>>        * stored as number for triplets in dynamic_list_len.
>>>        */
>>> -    lock->dynamic_list_len = 0;
>>> +    pipe_reglist = adreno_gpu->info->a6xx->pipe_reglist;

NULL check for pipe_reglist?

-Akhil

>>> +    for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_BV; pipe_id++) {
>>> +        for (i = 0; i < pipe_reglist->count; i++) {
>>> +            if (pipe_reglist->regs[i].pipe & BIT(pipe_id) == 0)
>>> +                continue;
>>> +            *dest++ = A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id);
>>> +            *dest++ = pipe_reglist->regs[i].offset;
>>> +            *dest++ = a7xx_read_pipe(gpu, pipe_id,
>>> +                         pipe_reglist->regs[i].offset);
>>> +            pipe_reglist_count++;
>>> +        }
>>> +    }
>>> +    lock->dynamic_list_len = pipe_reglist_count;
>>>   }
>>>     static int a7xx_preempt_start(struct msm_gpu *gpu)
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/
>>> msm/adreno/a6xx_gpu.h
>>> index 6820216ec5fc..0a1d6acbc638 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>> @@ -46,6 +46,7 @@ struct a6xx_info {
>>>       const struct adreno_protect *protect;
>>>       const struct adreno_reglist_list *pwrup_reglist;
>>>       const struct adreno_reglist_list *ifpc_reglist;
>>> +    const struct adreno_reglist_pipe_list *pipe_reglist;
>>>       const struct adreno_reglist *gbif_cx;
>>>       const struct adreno_reglist_pipe *nonctxt_reglist;
>>>       u32 max_slices;
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/
>>> drm/msm/adreno/adreno_gpu.h
>>> index 0f8d3de97636..cd1846c1375e 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> @@ -182,12 +182,25 @@ struct adreno_reglist_list {
>>>       u32 count;
>>>   };
>>>   +struct adreno_reglist_pipe_list {
>>> +    /** @reg: List of register **/
>>> +    const struct adreno_reglist_pipe *regs;
>>> +    /** @count: Number of registers in the list **/
>>> +    u32 count;
>>> +};
>>> +
>> Please move this chunk down, just above the
>> DECLARE_ADRENO_REGLIST_PIPE_LIST
>>
>> -Akhil
>>
>>>   #define DECLARE_ADRENO_REGLIST_LIST(name)    \
>>>   static const struct adreno_reglist_list name = {        \
>>>       .regs = name ## _regs,                \
>>>       .count = ARRAY_SIZE(name ## _regs),        \
>>>   };
>>>   +#define DECLARE_ADRENO_REGLIST_PIPE_LIST(name)    \
>>> +static const struct adreno_reglist_pipe_list name = {        \
>>> +    .regs = name ## _regs,                \
>>> +    .count = ARRAY_SIZE(name ## _regs),        \
>>> +};
>>> +
>>>   struct adreno_gpu {
>>>       struct msm_gpu base;
>>>       const struct adreno_info *info;
>>>
>>> ---
>>> base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
>>> change-id: 20251126-gras_nc_mode_fix-7224ee506a39
>>>
>>> Best regards,
> 
> 
> Best regards,

