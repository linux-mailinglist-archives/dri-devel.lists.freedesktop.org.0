Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CDD4F16DF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 16:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A01B10F6A6;
	Mon,  4 Apr 2022 14:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C33D10F6A6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649082177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGgXZUsB6qEOr648UMJYiZ4EBAXqWSZg9Whr7jvlAuc=;
 b=VhMyK07MGVtQaDVIyoKIDu80uT88kvV/wU5Bs66q2HqWlfk1EhngXiigUXE05OZ+wCm91n
 CR/TlnwoBHKqYNA4/bAuu+TyugKtbx8KKYIMsT7hfh1/3tV32UZpg4ij10U05MnXhpNh6G
 CDdUAuwZp6NbyZi6tq+xgOCb0pbS3ds=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-HoPn8sc9NuKwL3C39JOLFw-1; Mon, 04 Apr 2022 10:22:56 -0400
X-MC-Unique: HoPn8sc9NuKwL3C39JOLFw-1
Received: by mail-qk1-f197.google.com with SMTP id
 o15-20020ae9f50f000000b00680a61f51c4so6306474qkg.15
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 07:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gGgXZUsB6qEOr648UMJYiZ4EBAXqWSZg9Whr7jvlAuc=;
 b=QFnxCgOrj4iNu5q1QfyqSL/VOo/t2lnKa23DGxAth4FUrsBAhSWZ+iJZJ5bv7iwyH4
 Xt1atrmciY7e7YJwyUPT8ONaD13vFQ9OunhgJtrW2nUHGDX6iKJCSd81ZDYB7XW7K26W
 9wEKHXxXIMTbgBvuHdGsRqHDrsThDPzokytyVADa4hYVe5uGThNVoMud7UXjPj8M8wmT
 XNrK5yNJPYLP9uwiMUybY+Fda8f5uBeHdY+xj1sy/BycCJVF8NDjPRgNwK83cDp+S5rG
 N5YK302NJ+6XfT31wm8iY57UNeF91aO5VyA6fVdSLLa3gb/ib73uZgCsOqCk37nUafU+
 jZDw==
X-Gm-Message-State: AOAM530CN/cTca5zEALQZVf0CQX46UaAUUnQwDXb8pT2GN8cx/Hmvpx1
 tdtiz0E5uZeSBQkQ7BEiRwCstBkWB10mQKf06AMj7UI8uleartrH77Yqz3goaciI7F4pRmMkyN7
 UQNncpf3TlyMPyJxqgXOrWcWgRw98I6B38ur4N2KOpDXAmm/TbsP7tAtVkxRY4dWcVmcezN4ENJ
 E=
X-Received: by 2002:a05:620a:29d6:b0:67d:4fb9:b5d0 with SMTP id
 s22-20020a05620a29d600b0067d4fb9b5d0mr14043442qkp.315.1649082175483; 
 Mon, 04 Apr 2022 07:22:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx15lHGIIep7OrN7uFQQKjsJ9tzZHqSepFg6e9Tapn7XhgINdXXp9STr9gMx4feaA1BuOUNww==
X-Received: by 2002:a05:620a:29d6:b0:67d:4fb9:b5d0 with SMTP id
 s22-20020a05620a29d600b0067d4fb9b5d0mr14043402qkp.315.1649082174925; 
 Mon, 04 Apr 2022 07:22:54 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05620a04f500b0067b4895472esm6477993qkh.5.2022.04.04.07.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 07:22:54 -0700 (PDT)
Subject: Re: [PATCH] drm/radeon: change si_default_state table from global to
 static
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220402162750.2805433-1-trix@redhat.com>
 <9e407616-47b5-ad16-bd16-cde23684fc69@amd.com>
 <12b2fd82-174a-6f05-0de6-02b6f0d2a1d6@redhat.com>
 <5cd17edb-cf60-cc6e-acd3-6a5cadc038e6@amd.com>
 <efb06a31-bc1a-1136-fe75-2d4911fea190@redhat.com>
 <d56cd099-4bd3-da15-f50e-f3ce835d114a@amd.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <5daf286f-bb79-ee76-e8fd-b387f96e91fe@redhat.com>
Date: Mon, 4 Apr 2022 07:22:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d56cd099-4bd3-da15-f50e-f3ce835d114a@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/4/22 6:32 AM, Christian König wrote:
> Am 04.04.22 um 15:01 schrieb Tom Rix:
>> On 4/4/22 5:34 AM, Christian König wrote:
>>> Am 04.04.22 um 14:32 schrieb Tom Rix:
>>>> On 4/3/22 8:23 AM, Christian König wrote:
>>>>> Am 02.04.22 um 18:27 schrieb Tom Rix:
>>>>>> Smatch reports these issues
>>>>>> si_blit_shaders.c:31:11: warning: symbol 'si_default_state'
>>>>>>    was not declared. Should it be static?
>>>>>> si_blit_shaders.c:253:11: warning: symbol 'si_default_size'
>>>>>>    was not declared. Should it be static?
>>>>>>
>>>>>> Both symbols are only used in si.c.  Single file symbols
>>>>>> should be static.  So move the si_default_state and
>>>>>> si_default_size to si.c and change their
>>>>>> storage-class-specifier to static.
>>>>>>
>>>>>> Remove unneeded si_blit_shaders.[c|h]
>>>>>
>>>>> Uff, well NAK.
>>>>>
>>>>> IIRC this was intentionally moved into a separate file because it 
>>>>> is rather large and not related to anything in si.c.
>>>>>
>>>>> It's unlikely that we are ever going to update it, but I would 
>>>>> still rather want to keep it separated.
>>>>>
>>>>> You should rather just include si_blit_shaders.h in 
>>>>> si_blit_shaders.c.
>>>>
>>>> Do you mean #include "si_blit_shaders.c" in si.c or similar ?
>>>
>>> No, as far as I can see you are getting this warning because of a 
>>> missing previous prototype for the exported array.
>>>
>>> This can be avoided if you add si_blit_shaders.h as an include to 
>>> si_blit_shaders.c.
>>
>> The warning is a symptom.
>>
>> There are about 5-6 similar big, global tables in radeon/ with 
>> similar one file uses.
>>
>> These global tables should become static.
>>
>> Moving the table to si_blit_shader.h would keep it separated, adding 
>> the 'static' would remove it from the globals.
>>
>> *.c removed, Makefile updated.
>
> Sound like that would work for me as well. Main concern is to keep 
> that in a separate file.
>
> But why do you want to drop it from globals in the first place?

Generally the least needed access should be used.

For security

https://cwe.mitre.org/data/definitions/1108.html

A big global table can hide introduced code.

For the compiler

global variables (can not/harder to) be optimized.

Tom

>
> Christian.
>
>>
>> Tom
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> This could have the same effect of while keeping these separate failes
>>>>
>>>> Tom
>>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/radeon/Makefile          |   2 +-
>>>>>>   drivers/gpu/drm/radeon/si.c              | 224 
>>>>>> +++++++++++++++++++-
>>>>>>   drivers/gpu/drm/radeon/si_blit_shaders.c | 253 
>>>>>> -----------------------
>>>>>>   drivers/gpu/drm/radeon/si_blit_shaders.h |  32 ---
>>>>>>   4 files changed, 224 insertions(+), 287 deletions(-)
>>>>>>   delete mode 100644 drivers/gpu/drm/radeon/si_blit_shaders.c
>>>>>>   delete mode 100644 drivers/gpu/drm/radeon/si_blit_shaders.h
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/radeon/Makefile 
>>>>>> b/drivers/gpu/drm/radeon/Makefile
>>>>>> index 11c97edde54d..664381f4eb07 100644
>>>>>> --- a/drivers/gpu/drm/radeon/Makefile
>>>>>> +++ b/drivers/gpu/drm/radeon/Makefile
>>>>>> @@ -44,7 +44,7 @@ radeon-y += radeon_device.o radeon_asic.o 
>>>>>> radeon_kms.o \
>>>>>>       evergreen.o evergreen_cs.o evergreen_blit_shaders.o \
>>>>>>       evergreen_hdmi.o radeon_trace_points.o ni.o 
>>>>>> cayman_blit_shaders.o \
>>>>>>       atombios_encoders.o radeon_semaphore.o radeon_sa.o 
>>>>>> atombios_i2c.o si.o \
>>>>>> -    si_blit_shaders.o radeon_prime.o cik.o cik_blit_shaders.o \
>>>>>> +    radeon_prime.o cik.o cik_blit_shaders.o \
>>>>>>       r600_dpm.o rs780_dpm.o rv6xx_dpm.o rv770_dpm.o rv730_dpm.o 
>>>>>> rv740_dpm.o \
>>>>>>       rv770_smc.o cypress_dpm.o btc_dpm.o sumo_dpm.o sumo_smc.o 
>>>>>> trinity_dpm.o \
>>>>>>       trinity_smc.o ni_dpm.o si_smc.o si_dpm.o kv_smc.o kv_dpm.o 
>>>>>> ci_smc.o \
>>>>>> diff --git a/drivers/gpu/drm/radeon/si.c 
>>>>>> b/drivers/gpu/drm/radeon/si.c
>>>>>> index 8d5e4b25609d..a4032702e302 100644
>>>>>> --- a/drivers/gpu/drm/radeon/si.c
>>>>>> +++ b/drivers/gpu/drm/radeon/si.c
>>>>>> @@ -38,7 +38,6 @@
>>>>>>   #include "radeon_asic.h"
>>>>>>   #include "radeon_audio.h"
>>>>>>   #include "radeon_ucode.h"
>>>>>> -#include "si_blit_shaders.h"
>>>>>>   #include "si.h"
>>>>>>   #include "sid.h"
>>>>>>   @@ -3553,6 +3552,229 @@ static int si_cp_load_microcode(struct 
>>>>>> radeon_device *rdev)
>>>>>>       return 0;
>>>>>>   }
>>>>>>   +static const u32 si_default_state[] = {
>>>>>> +    0xc0066900,
>>>>>> +    0x00000000,
>>>>>> +    0x00000060, /* DB_RENDER_CONTROL */
>>>>>> +    0x00000000, /* DB_COUNT_CONTROL */
>>>>>> +    0x00000000, /* DB_DEPTH_VIEW */
>>>>>> +    0x0000002a, /* DB_RENDER_OVERRIDE */
>>>>>> +    0x00000000, /* DB_RENDER_OVERRIDE2 */
>>>>>> +    0x00000000, /* DB_HTILE_DATA_BASE */
>>>>>> +
>>>>>> +    0xc0046900,
>>>>>> +    0x00000008,
>>>>>> +    0x00000000, /* DB_DEPTH_BOUNDS_MIN */
>>>>>> +    0x00000000, /* DB_DEPTH_BOUNDS_MAX */
>>>>>> +    0x00000000, /* DB_STENCIL_CLEAR */
>>>>>> +    0x00000000, /* DB_DEPTH_CLEAR */
>>>>>> +
>>>>>> +    0xc0036900,
>>>>>> +    0x0000000f,
>>>>>> +    0x00000000, /* DB_DEPTH_INFO */
>>>>>> +    0x00000000, /* DB_Z_INFO */
>>>>>> +    0x00000000, /* DB_STENCIL_INFO */
>>>>>> +
>>>>>> +    0xc0016900,
>>>>>> +    0x00000080,
>>>>>> +    0x00000000, /* PA_SC_WINDOW_OFFSET */
>>>>>> +
>>>>>> +    0xc00d6900,
>>>>>> +    0x00000083,
>>>>>> +    0x0000ffff, /* PA_SC_CLIPRECT_RULE */
>>>>>> +    0x00000000, /* PA_SC_CLIPRECT_0_TL */
>>>>>> +    0x20002000, /* PA_SC_CLIPRECT_0_BR */
>>>>>> +    0x00000000,
>>>>>> +    0x20002000,
>>>>>> +    0x00000000,
>>>>>> +    0x20002000,
>>>>>> +    0x00000000,
>>>>>> +    0x20002000,
>>>>>> +    0xaaaaaaaa, /* PA_SC_EDGERULE */
>>>>>> +    0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
>>>>>> +    0x0000000f, /* CB_TARGET_MASK */
>>>>>> +    0x0000000f, /* CB_SHADER_MASK */
>>>>>> +
>>>>>> +    0xc0226900,
>>>>>> +    0x00000094,
>>>>>> +    0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
>>>>>> +    0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x80000000,
>>>>>> +    0x20002000,
>>>>>> +    0x00000000, /* PA_SC_VPORT_ZMIN_0 */
>>>>>> +    0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
>>>>>> +
>>>>>> +    0xc0026900,
>>>>>> +    0x000000d9,
>>>>>> +    0x00000000, /* CP_RINGID */
>>>>>> +    0x00000000, /* CP_VMID */
>>>>>> +
>>>>>> +    0xc0046900,
>>>>>> +    0x00000100,
>>>>>> +    0xffffffff, /* VGT_MAX_VTX_INDX */
>>>>>> +    0x00000000, /* VGT_MIN_VTX_INDX */
>>>>>> +    0x00000000, /* VGT_INDX_OFFSET */
>>>>>> +    0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
>>>>>> +
>>>>>> +    0xc0046900,
>>>>>> +    0x00000105,
>>>>>> +    0x00000000, /* CB_BLEND_RED */
>>>>>> +    0x00000000, /* CB_BLEND_GREEN */
>>>>>> +    0x00000000, /* CB_BLEND_BLUE */
>>>>>> +    0x00000000, /* CB_BLEND_ALPHA */
>>>>>> +
>>>>>> +    0xc0016900,
>>>>>> +    0x000001e0,
>>>>>> +    0x00000000, /* CB_BLEND0_CONTROL */
>>>>>> +
>>>>>> +    0xc00e6900,
>>>>>> +    0x00000200,
>>>>>> +    0x00000000, /* DB_DEPTH_CONTROL */
>>>>>> +    0x00000000, /* DB_EQAA */
>>>>>> +    0x00cc0010, /* CB_COLOR_CONTROL */
>>>>>> +    0x00000210, /* DB_SHADER_CONTROL */
>>>>>> +    0x00010000, /* PA_CL_CLIP_CNTL */
>>>>>> +    0x00000004, /* PA_SU_SC_MODE_CNTL */
>>>>>> +    0x00000100, /* PA_CL_VTE_CNTL */
>>>>>> +    0x00000000, /* PA_CL_VS_OUT_CNTL */
>>>>>> +    0x00000000, /* PA_CL_NANINF_CNTL */
>>>>>> +    0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
>>>>>> +    0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
>>>>>> +    0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
>>>>>> +    0x00000000, /*  */
>>>>>> +    0x00000000, /*  */
>>>>>> +
>>>>>> +    0xc0116900,
>>>>>> +    0x00000280,
>>>>>> +    0x00000000, /* PA_SU_POINT_SIZE */
>>>>>> +    0x00000000, /* PA_SU_POINT_MINMAX */
>>>>>> +    0x00000008, /* PA_SU_LINE_CNTL */
>>>>>> +    0x00000000, /* PA_SC_LINE_STIPPLE */
>>>>>> +    0x00000000, /* VGT_OUTPUT_PATH_CNTL */
>>>>>> +    0x00000000, /* VGT_HOS_CNTL */
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000, /* VGT_GS_MODE */
>>>>>> +
>>>>>> +    0xc0026900,
>>>>>> +    0x00000292,
>>>>>> +    0x00000000, /* PA_SC_MODE_CNTL_0 */
>>>>>> +    0x00000000, /* PA_SC_MODE_CNTL_1 */
>>>>>> +
>>>>>> +    0xc0016900,
>>>>>> +    0x000002a1,
>>>>>> +    0x00000000, /* VGT_PRIMITIVEID_EN */
>>>>>> +
>>>>>> +    0xc0016900,
>>>>>> +    0x000002a5,
>>>>>> +    0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
>>>>>> +
>>>>>> +    0xc0026900,
>>>>>> +    0x000002a8,
>>>>>> +    0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
>>>>>> +    0x00000000,
>>>>>> +
>>>>>> +    0xc0026900,
>>>>>> +    0x000002ad,
>>>>>> +    0x00000000, /* VGT_REUSE_OFF */
>>>>>> +    0x00000000,
>>>>>> +
>>>>>> +    0xc0016900,
>>>>>> +    0x000002d5,
>>>>>> +    0x00000000, /* VGT_SHADER_STAGES_EN */
>>>>>> +
>>>>>> +    0xc0016900,
>>>>>> +    0x000002dc,
>>>>>> +    0x0000aa00, /* DB_ALPHA_TO_MASK */
>>>>>> +
>>>>>> +    0xc0066900,
>>>>>> +    0x000002de,
>>>>>> +    0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +
>>>>>> +    0xc0026900,
>>>>>> +    0x000002e5,
>>>>>> +    0x00000000, /* VGT_STRMOUT_CONFIG */
>>>>>> +    0x00000000,
>>>>>> +
>>>>>> +    0xc01b6900,
>>>>>> +    0x000002f5,
>>>>>> +    0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
>>>>>> +    0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
>>>>>> +    0x00000000, /* PA_SC_LINE_CNTL */
>>>>>> +    0x00000000, /* PA_SC_AA_CONFIG */
>>>>>> +    0x00000005, /* PA_SU_VTX_CNTL */
>>>>>> +    0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
>>>>>> +    0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
>>>>>> +    0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
>>>>>> +    0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
>>>>>> +    0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0x00000000,
>>>>>> +    0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
>>>>>> +    0xffffffff,
>>>>>> +
>>>>>> +    0xc0026900,
>>>>>> +    0x00000316,
>>>>>> +    0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
>>>>>> +    0x00000010, /*  */
>>>>>> +};
>>>>>> +
>>>>>> +static const u32 si_default_size = ARRAY_SIZE(si_default_state);
>>>>>> +
>>>>>>   static int si_cp_start(struct radeon_device *rdev)
>>>>>>   {
>>>>>>       struct radeon_ring *ring = 
>>>>>> &rdev->ring[RADEON_RING_TYPE_GFX_INDEX];
>>>>>> diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.c 
>>>>>> b/drivers/gpu/drm/radeon/si_blit_shaders.c
>>>>>> deleted file mode 100644
>>>>>> index ec415e7dfa4b..000000000000
>>>>>> --- a/drivers/gpu/drm/radeon/si_blit_shaders.c
>>>>>> +++ /dev/null
>>>>>> @@ -1,253 +0,0 @@
>>>>>> -/*
>>>>>> - * Copyright 2011 Advanced Micro Devices, Inc.
>>>>>> - *
>>>>>> - * Permission is hereby granted, free of charge, to any person 
>>>>>> obtaining a
>>>>>> - * copy of this software and associated documentation files (the 
>>>>>> "Software"),
>>>>>> - * to deal in the Software without restriction, including 
>>>>>> without limitation
>>>>>> - * the rights to use, copy, modify, merge, publish, distribute, 
>>>>>> sublicense,
>>>>>> - * and/or sell copies of the Software, and to permit persons to 
>>>>>> whom the
>>>>>> - * Software is furnished to do so, subject to the following 
>>>>>> conditions:
>>>>>> - *
>>>>>> - * The above copyright notice and this permission notice 
>>>>>> (including the next
>>>>>> - * paragraph) shall be included in all copies or substantial 
>>>>>> portions of the
>>>>>> - * Software.
>>>>>> - *
>>>>>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
>>>>>> KIND, EXPRESS OR
>>>>>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>>>>> MERCHANTABILITY,
>>>>>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO 
>>>>>> EVENT SHALL
>>>>>> - * THE COPYRIGHT HOLDER(S) AND/OR ITS SUPPLIERS BE LIABLE FOR 
>>>>>> ANY CLAIM, DAMAGES OR
>>>>>> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>>>>> OTHERWISE,
>>>>>> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR 
>>>>>> THE USE OR OTHER
>>>>>> - * DEALINGS IN THE SOFTWARE.
>>>>>> - *
>>>>>> - * Authors:
>>>>>> - *     Alex Deucher <alexander.deucher@amd.com>
>>>>>> - */
>>>>>> -
>>>>>> -#include <linux/types.h>
>>>>>> -#include <linux/bug.h>
>>>>>> -#include <linux/kernel.h>
>>>>>> -
>>>>>> -const u32 si_default_state[] =
>>>>>> -{
>>>>>> -    0xc0066900,
>>>>>> -    0x00000000,
>>>>>> -    0x00000060, /* DB_RENDER_CONTROL */
>>>>>> -    0x00000000, /* DB_COUNT_CONTROL */
>>>>>> -    0x00000000, /* DB_DEPTH_VIEW */
>>>>>> -    0x0000002a, /* DB_RENDER_OVERRIDE */
>>>>>> -    0x00000000, /* DB_RENDER_OVERRIDE2 */
>>>>>> -    0x00000000, /* DB_HTILE_DATA_BASE */
>>>>>> -
>>>>>> -    0xc0046900,
>>>>>> -    0x00000008,
>>>>>> -    0x00000000, /* DB_DEPTH_BOUNDS_MIN */
>>>>>> -    0x00000000, /* DB_DEPTH_BOUNDS_MAX */
>>>>>> -    0x00000000, /* DB_STENCIL_CLEAR */
>>>>>> -    0x00000000, /* DB_DEPTH_CLEAR */
>>>>>> -
>>>>>> -    0xc0036900,
>>>>>> -    0x0000000f,
>>>>>> -    0x00000000, /* DB_DEPTH_INFO */
>>>>>> -    0x00000000, /* DB_Z_INFO */
>>>>>> -    0x00000000, /* DB_STENCIL_INFO */
>>>>>> -
>>>>>> -    0xc0016900,
>>>>>> -    0x00000080,
>>>>>> -    0x00000000, /* PA_SC_WINDOW_OFFSET */
>>>>>> -
>>>>>> -    0xc00d6900,
>>>>>> -    0x00000083,
>>>>>> -    0x0000ffff, /* PA_SC_CLIPRECT_RULE */
>>>>>> -    0x00000000, /* PA_SC_CLIPRECT_0_TL */
>>>>>> -    0x20002000, /* PA_SC_CLIPRECT_0_BR */
>>>>>> -    0x00000000,
>>>>>> -    0x20002000,
>>>>>> -    0x00000000,
>>>>>> -    0x20002000,
>>>>>> -    0x00000000,
>>>>>> -    0x20002000,
>>>>>> -    0xaaaaaaaa, /* PA_SC_EDGERULE */
>>>>>> -    0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
>>>>>> -    0x0000000f, /* CB_TARGET_MASK */
>>>>>> -    0x0000000f, /* CB_SHADER_MASK */
>>>>>> -
>>>>>> -    0xc0226900,
>>>>>> -    0x00000094,
>>>>>> -    0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
>>>>>> -    0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x80000000,
>>>>>> -    0x20002000,
>>>>>> -    0x00000000, /* PA_SC_VPORT_ZMIN_0 */
>>>>>> -    0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
>>>>>> -
>>>>>> -    0xc0026900,
>>>>>> -    0x000000d9,
>>>>>> -    0x00000000, /* CP_RINGID */
>>>>>> -    0x00000000, /* CP_VMID */
>>>>>> -
>>>>>> -    0xc0046900,
>>>>>> -    0x00000100,
>>>>>> -    0xffffffff, /* VGT_MAX_VTX_INDX */
>>>>>> -    0x00000000, /* VGT_MIN_VTX_INDX */
>>>>>> -    0x00000000, /* VGT_INDX_OFFSET */
>>>>>> -    0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
>>>>>> -
>>>>>> -    0xc0046900,
>>>>>> -    0x00000105,
>>>>>> -    0x00000000, /* CB_BLEND_RED */
>>>>>> -    0x00000000, /* CB_BLEND_GREEN */
>>>>>> -    0x00000000, /* CB_BLEND_BLUE */
>>>>>> -    0x00000000, /* CB_BLEND_ALPHA */
>>>>>> -
>>>>>> -    0xc0016900,
>>>>>> -    0x000001e0,
>>>>>> -    0x00000000, /* CB_BLEND0_CONTROL */
>>>>>> -
>>>>>> -    0xc00e6900,
>>>>>> -    0x00000200,
>>>>>> -    0x00000000, /* DB_DEPTH_CONTROL */
>>>>>> -    0x00000000, /* DB_EQAA */
>>>>>> -    0x00cc0010, /* CB_COLOR_CONTROL */
>>>>>> -    0x00000210, /* DB_SHADER_CONTROL */
>>>>>> -    0x00010000, /* PA_CL_CLIP_CNTL */
>>>>>> -    0x00000004, /* PA_SU_SC_MODE_CNTL */
>>>>>> -    0x00000100, /* PA_CL_VTE_CNTL */
>>>>>> -    0x00000000, /* PA_CL_VS_OUT_CNTL */
>>>>>> -    0x00000000, /* PA_CL_NANINF_CNTL */
>>>>>> -    0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
>>>>>> -    0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
>>>>>> -    0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
>>>>>> -    0x00000000, /*  */
>>>>>> -    0x00000000, /*  */
>>>>>> -
>>>>>> -    0xc0116900,
>>>>>> -    0x00000280,
>>>>>> -    0x00000000, /* PA_SU_POINT_SIZE */
>>>>>> -    0x00000000, /* PA_SU_POINT_MINMAX */
>>>>>> -    0x00000008, /* PA_SU_LINE_CNTL */
>>>>>> -    0x00000000, /* PA_SC_LINE_STIPPLE */
>>>>>> -    0x00000000, /* VGT_OUTPUT_PATH_CNTL */
>>>>>> -    0x00000000, /* VGT_HOS_CNTL */
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000, /* VGT_GS_MODE */
>>>>>> -
>>>>>> -    0xc0026900,
>>>>>> -    0x00000292,
>>>>>> -    0x00000000, /* PA_SC_MODE_CNTL_0 */
>>>>>> -    0x00000000, /* PA_SC_MODE_CNTL_1 */
>>>>>> -
>>>>>> -    0xc0016900,
>>>>>> -    0x000002a1,
>>>>>> -    0x00000000, /* VGT_PRIMITIVEID_EN */
>>>>>> -
>>>>>> -    0xc0016900,
>>>>>> -    0x000002a5,
>>>>>> -    0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
>>>>>> -
>>>>>> -    0xc0026900,
>>>>>> -    0x000002a8,
>>>>>> -    0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
>>>>>> -    0x00000000,
>>>>>> -
>>>>>> -    0xc0026900,
>>>>>> -    0x000002ad,
>>>>>> -    0x00000000, /* VGT_REUSE_OFF */
>>>>>> -    0x00000000,
>>>>>> -
>>>>>> -    0xc0016900,
>>>>>> -    0x000002d5,
>>>>>> -    0x00000000, /* VGT_SHADER_STAGES_EN */
>>>>>> -
>>>>>> -    0xc0016900,
>>>>>> -    0x000002dc,
>>>>>> -    0x0000aa00, /* DB_ALPHA_TO_MASK */
>>>>>> -
>>>>>> -    0xc0066900,
>>>>>> -    0x000002de,
>>>>>> -    0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -
>>>>>> -    0xc0026900,
>>>>>> -    0x000002e5,
>>>>>> -    0x00000000, /* VGT_STRMOUT_CONFIG */
>>>>>> -    0x00000000,
>>>>>> -
>>>>>> -    0xc01b6900,
>>>>>> -    0x000002f5,
>>>>>> -    0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
>>>>>> -    0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
>>>>>> -    0x00000000, /* PA_SC_LINE_CNTL */
>>>>>> -    0x00000000, /* PA_SC_AA_CONFIG */
>>>>>> -    0x00000005, /* PA_SU_VTX_CNTL */
>>>>>> -    0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
>>>>>> -    0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
>>>>>> -    0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
>>>>>> -    0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
>>>>>> -    0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0x00000000,
>>>>>> -    0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
>>>>>> -    0xffffffff,
>>>>>> -
>>>>>> -    0xc0026900,
>>>>>> -    0x00000316,
>>>>>> -    0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
>>>>>> -    0x00000010, /*  */
>>>>>> -};
>>>>>> -
>>>>>> -const u32 si_default_size = ARRAY_SIZE(si_default_state);
>>>>>> diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.h 
>>>>>> b/drivers/gpu/drm/radeon/si_blit_shaders.h
>>>>>> deleted file mode 100644
>>>>>> index c739e51e3961..000000000000
>>>>>> --- a/drivers/gpu/drm/radeon/si_blit_shaders.h
>>>>>> +++ /dev/null
>>>>>> @@ -1,32 +0,0 @@
>>>>>> -/*
>>>>>> - * Copyright 2011 Advanced Micro Devices, Inc.
>>>>>> - *
>>>>>> - * Permission is hereby granted, free of charge, to any person 
>>>>>> obtaining a
>>>>>> - * copy of this software and associated documentation files (the 
>>>>>> "Software"),
>>>>>> - * to deal in the Software without restriction, including 
>>>>>> without limitation
>>>>>> - * the rights to use, copy, modify, merge, publish, distribute, 
>>>>>> sublicense,
>>>>>> - * and/or sell copies of the Software, and to permit persons to 
>>>>>> whom the
>>>>>> - * Software is furnished to do so, subject to the following 
>>>>>> conditions:
>>>>>> - *
>>>>>> - * The above copyright notice and this permission notice 
>>>>>> (including the next
>>>>>> - * paragraph) shall be included in all copies or substantial 
>>>>>> portions of the
>>>>>> - * Software.
>>>>>> - *
>>>>>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
>>>>>> KIND, EXPRESS OR
>>>>>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>>>>> MERCHANTABILITY,
>>>>>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO 
>>>>>> EVENT SHALL
>>>>>> - * THE COPYRIGHT HOLDER(S) AND/OR ITS SUPPLIERS BE LIABLE FOR 
>>>>>> ANY CLAIM, DAMAGES OR
>>>>>> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>>>>> OTHERWISE,
>>>>>> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR 
>>>>>> THE USE OR OTHER
>>>>>> - * DEALINGS IN THE SOFTWARE.
>>>>>> - *
>>>>>> - */
>>>>>> -
>>>>>> -#ifndef SI_BLIT_SHADERS_H
>>>>>> -#define SI_BLIT_SHADERS_H
>>>>>> -
>>>>>> -extern const u32 si_default_state[];
>>>>>> -
>>>>>> -extern const u32 si_default_size;
>>>>>> -
>>>>>> -#endif
>>>>>
>>>>
>>>
>>
>

