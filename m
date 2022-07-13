Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7C2573EB9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 23:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB98D11B865;
	Wed, 13 Jul 2022 21:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ED1112876;
 Wed, 13 Jul 2022 21:18:36 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso5830611pjc.1; 
 Wed, 13 Jul 2022 14:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=kvmBdvQg/8Gn5GQ6ktKwyk40airFB+prdhQxh8nJVNk=;
 b=MK1MDSnTj2CTaHexfUNMmag9cCZXdmf5weL/rz2GyjxeNfnihO/vyOyT/J65swUz2Q
 D/sJuMaua1GG412SFdfLHkl4rZPSkZeMhhOHLCA7vdvJX8Duuu8+ukuAqJdgMS4Tj5QS
 0l/u0JDkoeDYtp+GonY9rA0lP0raEMwKwrYA6d/qSmAvD2HcAT1HSqyHxx6e55uTMaIp
 YzzowDbrStxkYKOxI0s8P7NdNE6ZkByfLA3ogvn35r5Ly18XVHt+NoLXe4vGtO0bhmfm
 b6r3mK0CjooeFEtwcL98eHdI2xjq/ellSfJrJJs8Jp+pbUIUZ3t68BDoz7/pvjwSZYht
 NnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=kvmBdvQg/8Gn5GQ6ktKwyk40airFB+prdhQxh8nJVNk=;
 b=SoHU/w+i6ZLZXJRkdceCqjD+Dq0tdWcgAxJa8ZlQnvZXgyDIgueutpSz8PH6X4Fb57
 cRELcn2kXWe6OGyL/b/hisZ57xOgLGmJ94RkXIHNmkMtdw1ct+6vN82/xtXRo6BoVu97
 Pp+shgfPeJGei6Snf0HXkI7MtOOqiDchkPyurpXJQC8igVsrlT/27tAuoawoTDvhkIgk
 5eZzHXXli1o58jwY6kaSGb0Q/e1tJV9UZVq0hnvndYGCYJwvoL3coJO45yMxCvfVt8lX
 tOyXydWJ7KGKLXreaguul3WM6FsUVQDJ4lLReR3+kijdWikuZteKR8/MYwcsKS6pzQrz
 A0ow==
X-Gm-Message-State: AJIora+ChJFWNsAfszmzIKlD456W/MkU4nLc4l71s2BfkuRWybzAnJkN
 7WEj0Zbr3vbKPg+7UZET5nE=
X-Google-Smtp-Source: AGRyM1s93V9EN4nLCXOZbSYMcv810nnAfRKKMN9dC4VHdMKPxZv9TkjMfhbK5NDZ3maARd+j2KB6Mg==
X-Received: by 2002:a17:902:9a07:b0:16c:39bc:876 with SMTP id
 v7-20020a1709029a0700b0016c39bc0876mr4931225plp.42.1657747115831; 
 Wed, 13 Jul 2022 14:18:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 rm8-20020a17090b3ec800b001eff36b1f2asm2104283pjb.0.2022.07.13.14.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 14:18:34 -0700 (PDT)
Message-ID: <6a026c9a-c4ee-deba-e028-4c0f478c1911@roeck-us.net>
Date: Wed, 13 Jul 2022 14:18:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
References: <20220618232737.2036722-1-linux@roeck-us.net>
 <584fc348-7a60-26a2-af61-9edc4f4830e4@amd.com>
 <CADnq5_NkVWqcxwLMBeskqpcSEYCEjUAK0hqvA_PAo7ACHKL2cA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] drm/amd/display: Add missing hard-float compile flags for
 PPC64 builds
In-Reply-To: <CADnq5_NkVWqcxwLMBeskqpcSEYCEjUAK0hqvA_PAo7ACHKL2cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Leo Li <sunpeng.li@amd.com>, Michael Ellerman <mpe@ellerman.id.au>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/13/22 13:57, Alex Deucher wrote:
> On Thu, Jun 30, 2022 at 5:01 PM Rodrigo Siqueira Jordao
> <Rodrigo.Siqueira@amd.com> wrote:
>>
>>
>>
>> On 2022-06-18 19:27, Guenter Roeck wrote:
>>> ppc:allmodconfig builds fail with the following error.
>>>
>>> powerpc64-linux-ld:
>>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
>>>                uses hard float,
>>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
>>>                uses soft float
>>> powerpc64-linux-ld:
>>>        failed to merge target specific data of file
>>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
>>> powerpc64-linux-ld:
>>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
>>>                uses hard float,
>>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
>>>                uses soft float
>>> powerpc64-linux-ld:
>>>        failed to merge target specific data of
>>>        file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
>>> powerpc64-linux-ld:
>>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
>>>                uses hard float,
>>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
>>>                uses soft float
>>> powerpc64-linux-ld:
>>>        failed to merge target specific data of file
>>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
>>>
>>> The problem was introduced with commit 41b7a347bf14 ("powerpc: Book3S
>>> 64-bit outline-only KASAN support") which adds support for KASAN. This
>>> commit in turn enables DRM_AMD_DC_DCN because KCOV_INSTRUMENT_ALL and
>>> KCOV_ENABLE_COMPARISONS are no longer enabled. As result, new files are
>>> compiled which lack the selection of hard-float.
>>>
>>> Fixes: 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only KASAN support")
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Daniel Axtens <dja@axtens.net>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>>    drivers/gpu/drm/amd/display/dc/dcn31/Makefile  | 4 ++++
>>>    drivers/gpu/drm/amd/display/dc/dcn315/Makefile | 4 ++++
>>>    drivers/gpu/drm/amd/display/dc/dcn316/Makefile | 4 ++++
>>>    3 files changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
>>> index ec041e3cda30..74be02114ae4 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
>>> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
>>> @@ -15,6 +15,10 @@ DCN31 = dcn31_resource.o dcn31_hubbub.o dcn31_hwseq.o dcn31_init.o dcn31_hubp.o
>>>        dcn31_apg.o dcn31_hpo_dp_stream_encoder.o dcn31_hpo_dp_link_encoder.o \
>>>        dcn31_afmt.o dcn31_vpg.o
>>>
>>> +ifdef CONFIG_PPC64
>>> +CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o := -mhard-float -maltivec
>>> +endif
>>> +
>>>    AMD_DAL_DCN31 = $(addprefix $(AMDDALPATH)/dc/dcn31/,$(DCN31))
>>>
>>>    AMD_DISPLAY_FILES += $(AMD_DAL_DCN31)
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
>>> index 59381d24800b..1395c1ced8c5 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
>>> +++ b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
>>> @@ -25,6 +25,10 @@
>>>
>>>    DCN315 = dcn315_resource.o
>>>
>>> +ifdef CONFIG_PPC64
>>> +CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o := -mhard-float -maltivec
>>> +endif
>>> +
>>>    AMD_DAL_DCN315 = $(addprefix $(AMDDALPATH)/dc/dcn315/,$(DCN315))
>>>
>>>    AMD_DISPLAY_FILES += $(AMD_DAL_DCN315)
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
>>> index 819d44a9439b..c3d2dd78f1e2 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
>>> +++ b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
>>> @@ -25,6 +25,10 @@
>>>
>>>    DCN316 = dcn316_resource.o
>>>
>>> +ifdef CONFIG_PPC64
>>> +CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o := -mhard-float -maltivec
>>> +endif
>>> +
>>>    AMD_DAL_DCN316 = $(addprefix $(AMDDALPATH)/dc/dcn316/,$(DCN316))
>>>
>>>    AMD_DISPLAY_FILES += $(AMD_DAL_DCN316)
>>
>> Hi,
>>
>> I don't want to re-introduce those FPU flags for DCN31/DCN314/DCN316
>> since we fully isolate FPU operations for those ASICs inside the DML
> 
> I don't understand why we don't need to add the hard-float flags back
> on the other DCN blocks.  Did we miss something in the DML cleanup for
> DCN 3.1.x?  Anyway, at this point, the patch is:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> We can sort the rest out for 5.20.
> 

The problem is not the FPU operations, but the fact that soft-float
and hard-float compiled code is linked together. The soft-float and
hard-float ABIs on powerpc are not compatible, so one ends up with
an object file which is partially soft-float and partially hard-float
compiled and thus uses different ABIs. That can only create chaos,
so the linker complains about it.

Guenter
