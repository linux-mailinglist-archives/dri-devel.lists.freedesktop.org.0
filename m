Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83017E2BC8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 19:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F0E10E3A1;
	Mon,  6 Nov 2023 18:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78AA10E134;
 Mon,  6 Nov 2023 18:19:25 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1cc2b8deb23so7022785ad.1; 
 Mon, 06 Nov 2023 10:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699294765; x=1699899565; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tl8ZlpdAg7GwtfMnMLLp2fEwluCCUsAiPSPuqFG5Xz0=;
 b=WlJSn7isvEUoSthDmgfHfJKHhgC/gOIj0Av7hLSSppiFFMYeodK73jMAmf4bbGlh+1
 j1SKHDwigRZgSdYTKmxjo6I4zrq2lKquLmA7uhYyXRgoac/660+feVSQb8Nusx2LwoPd
 uuPvh89k7BoJJjh/CelGZp6yXbV1+/ATEPz1LaQKv/qD/3gBND3cBhFf/h6BTvX+vGPu
 dfoyjaGf6e/FbkTUs+ld6z5VmxoWQ7auC0cg+wGZP4KAMBYi40PCrAAU/tgS2f8FYExh
 d954VAPPXFtclhFMi58RB0qAZMji+RTy/QPJLRpmRUhvkblbPLI/SDbYM8zPuyvHte3c
 x10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699294765; x=1699899565;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tl8ZlpdAg7GwtfMnMLLp2fEwluCCUsAiPSPuqFG5Xz0=;
 b=rBgbn9CiJ7sU+Xr/dtDK5rW/6/2WoyMIaMuMjMTWKLixGap9FRsj84M8Pm5ktvbF2u
 1+7DhveNsqb8qO+Djy/H28Zx3Do+Oa2RW4/+6AExfpNdbxvsA04OWe4uMPE1YmPfxoau
 y6Q5EU/aXH48FMHSKySbbIaX0m0GtYwwbI6TTtFX1dH3qVxsYP9ZT6KR1m3Jr9KMpy2g
 uCrruX0kpaue2j1AZBr06L90C/vZD3nW3I/5PfqBk0k0b+jNVh/WaFqt6gT/hdUx9QaU
 AqzAlonFF89Hh7ruE2ZVftIbggrvNbaeW51tnxSF2Lr8GPDAhsvmv82qcHyHt1Kc9dzW
 KdAg==
X-Gm-Message-State: AOJu0Yyt8njH9SvlzJgkA/wxKn0nTzXdU94yEWMlsVJ1VdZePMc6E0E2
 KIe/RbggoKR9TRJY9fe2c28=
X-Google-Smtp-Source: AGHT+IGZuMNhI2zZQoFqXXq3E+/brKmtT53P7YA09Nfn+zaDB3yG15dLm3XBrAxgDZ/f+n0Zz0X0rQ==
X-Received: by 2002:a17:902:f213:b0:1c4:1cd3:8062 with SMTP id
 m19-20020a170902f21300b001c41cd38062mr31371603plc.2.1699294765189; 
 Mon, 06 Nov 2023 10:19:25 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.211])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a170902e5ce00b001c9b35287aesm6204407plf.88.2023.11.06.10.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 10:19:24 -0800 (PST)
Message-ID: <ba31f441-80cd-4745-b425-23e5b9e0f9c0@gmail.com>
Date: Mon, 6 Nov 2023 23:49:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
 <87sf5jyvkt.fsf@intel.com> <a2310260-ba15-428e-9fd1-08abb9565b18@gmail.com>
 <87h6lyzvg8.fsf@intel.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <87h6lyzvg8.fsf@intel.com>
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/6/23 22:10, Jani Nikula wrote:
> On Mon, 06 Nov 2023, Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:
>> On 11/6/23 16:53, Jani Nikula wrote:
>>> On Fri, 03 Nov 2023, Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:
>>>> sparse static analysis tools generate a warning with this message
>>>> "Using plain integer as NULL pointer". In this case this warning is
>>>> being shown because we are trying to intialize a pointer to NULL using
>>>> integer value 0.
>>>>
>>>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/radeon/clearstate_evergreen.h | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/radeon/clearstate_evergreen.h b/drivers/gpu/drm/radeon/clearstate_evergreen.h
>>>> index 63a1ffbb3ced..3b645558f133 100644
>>>> --- a/drivers/gpu/drm/radeon/clearstate_evergreen.h
>>>> +++ b/drivers/gpu/drm/radeon/clearstate_evergreen.h
>>>> @@ -1049,7 +1049,7 @@ static const struct cs_extent_def SECT_CONTEXT_defs[] =
>>>>        {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
>>>>        {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
>>>>        {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
>>>> -    { 0, 0, 0 }
>>>> +    { NULL, 0, 0 }
>>>
>>> Random drive-by comment:
>>>
>>> I'd just use {} as the sentinel.
>>>
>>> BR,
>>> Jani.
>>>
>>>>    };
>>>>    static const u32 SECT_CLEAR_def_1[] =
>>>>    {
>>>> @@ -1060,7 +1060,7 @@ static const u32 SECT_CLEAR_def_1[] =
>>>>    static const struct cs_extent_def SECT_CLEAR_defs[] =
>>>>    {
>>>>        {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
>>>> -    { 0, 0, 0 }
>>>> +    { NULL, 0, 0 }
>>>>    };
>>>>    static const u32 SECT_CTRLCONST_def_1[] =
>>>>    {
>>>> @@ -1070,11 +1070,11 @@ static const u32 SECT_CTRLCONST_def_1[] =
>>>>    static const struct cs_extent_def SECT_CTRLCONST_defs[] =
>>>>    {
>>>>        {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
>>>> -    { 0, 0, 0 }
>>>> +    { NULL, 0, 0 }
>>>>    };
>>>>    static const struct cs_section_def evergreen_cs_data[] = {
>>>>        { SECT_CONTEXT_defs, SECT_CONTEXT },
>>>>        { SECT_CLEAR_defs, SECT_CLEAR },
>>>>        { SECT_CTRLCONST_defs, SECT_CTRLCONST },
>>>> -    { 0, SECT_NONE }
>>>> +    { NULL, SECT_NONE }
>>>>    };
>>>> --
>>>> 2.39.2
>>>>
>>>
>> Hi, Thanks for dropping by and the suggestion. I thought of using NULL
>> instead of {} is because, first the warning itself says that 0 is used
>> to intialize pointers with NULL, and second due this link
>> https://www.spinics.net/lists/linux-sparse/msg10066.html where linus is
>> talking about not using 0 NULL intialization of pointer variable and he
>> thinks this is a legitimate issue and not some false positive
> 
> But... {} is neither of those things. It's empty initialization instead
> of 0. It's valid in GCC and C23, and used all over the place in the
> kernel.
> 
> BR,
> Jani.
> 
> 
> 
If I understand correctly you want to me change from this "{ NULL, 
SECT_NONE }" to "{}" right? If yes, then according to what I read from 
some online, it is better to intialize variables especially pointer 
because in some cases a non initialized pointer doesnt always point to 
NULL. Not sure if this applies in kernel space as well. But yeah my 
knowledge is pretty limited in C in user space and in kernel space it is 
even more limited :)

