Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B285F7E3503
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 07:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D3C10E4A8;
	Tue,  7 Nov 2023 06:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA6910E4A8;
 Tue,  7 Nov 2023 06:03:53 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-55b5a37acb6so497041a12.0; 
 Mon, 06 Nov 2023 22:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699337033; x=1699941833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lKFEEOwu+JwvBa63rAI+zxMPRAeyFot/drhB3OU5pF8=;
 b=ie8ew4LsN+ypok8ozXSlovg3ysD64hkWKfZb4cKvi/GE67E15xUfuyRVR2tq9gCxZy
 QKIm+Zw3sXc0Qnbq2ScDnR2aaR7mXMfdznLtqgt+QlVY9rZdhdCQ9jJZ8HlyOmYSMfaB
 aiaM0heeJ8b3mAizJ9PmlkuQDYcn+O6wNh5329fj/gbg12vk6VvW2iDRQZkd0MhkGQR7
 B+HrhoPfPRF43bTfmi+OWyMK1IKEu2UB3xSn/K7jA0G2x+Vc9+kOb8rEXXs/gZRRjWpp
 ZRvdHulYYs8taTnH4+7gD4wEEebJm/pOHdJLLn2EaFCAWwYOyoxavOdVwb9WW40Xegb9
 o94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699337033; x=1699941833;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lKFEEOwu+JwvBa63rAI+zxMPRAeyFot/drhB3OU5pF8=;
 b=Uga0ykPmWPHc5nqW2yLLG83SS5lQqCK6kA68HA4tpOvhVUlFcgn8ofOJsHhqhU9IMb
 BCpbzjnVX5XkZJOuB3zQTmNrk5103/K2EGbsn2qweCqjdiOwL/oIcvZbkZiyYYbaBvp2
 tP2+y+GlahEFnptoaCauEDlztV3aD2WgPfAmM7+ZlNsVQAvqbOTlsCRpRDdPQIEpgojl
 mknhXMLogDUFwa40YSV4MzpqgpzdY42oVyYbSYimRSFK6C4gaNOD7ZMq9sKAy2oAOdRC
 dDQLMbsIycOUIJ3BFGuUV+CM+YOQmu0BmkjXCfT1874qjwuLHlx8DKCxhgLPdxEU6+vW
 OdDg==
X-Gm-Message-State: AOJu0YwqH948xEf7IHaTOqO5pjqATI+tO6BMY+ppozrDG5R98vElsBjV
 K2tpNVKF6IabtV9i+kzcq+irAaQa5kYEY9Xw
X-Google-Smtp-Source: AGHT+IEYjDnHlZaeLjHfEXLGnwRtpD+SbIvNxQUtdUAz9T0ERhq0lqVvZiRjtyeTQBeHaCk0XeNZnw==
X-Received: by 2002:a17:903:32d2:b0:1cc:32c6:e5fa with SMTP id
 i18-20020a17090332d200b001cc32c6e5famr28596508plr.6.1699337032527; 
 Mon, 06 Nov 2023 22:03:52 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.209])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a170902c38900b001c726147a45sm6840474plg.190.2023.11.06.22.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 22:03:52 -0800 (PST)
Message-ID: <d252d281-96a5-404c-a6a2-fbaa65bea28a@gmail.com>
Date: Tue, 7 Nov 2023 11:33:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
 <CADnq5_OkWD3YmCKgXbtk=Gnba3AgAiAWp2z_nzHQvRfEOsdXVg@mail.gmail.com>
 <3b92b89b-ca72-4012-b4f2-0b19e4ba9153@gmail.com>
 <CADnq5_PXRN+PL4wp+sWOXs2L5nQiRmfrw4065R1TE4YKw-ZeUA@mail.gmail.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <CADnq5_PXRN+PL4wp+sWOXs2L5nQiRmfrw4065R1TE4YKw-ZeUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, linux-kernel-mentees@lists.linuxfoundation.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/23 03:07, Alex Deucher wrote:
> On Mon, Nov 6, 2023 at 4:20 PM Abhinav Singh
> <singhabhinav9051571833@gmail.com> wrote:
>>
>> On 11/7/23 00:25, Alex Deucher wrote:
>>> Applied.  This matches what we already do in the other clear state headers.
>>>
>>> Alex
>>>
>>> On Fri, Nov 3, 2023 at 12:00 PM Abhinav Singh
>>> <singhabhinav9051571833@gmail.com> wrote:
>>>>
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
>> Hi Alex, thanks for looking into this. By applied you mean this patch is
>> accepted and it has been merged?
> 
> Yes.  Once it makes it through our CI system, it will show up in my
> drm-next tree.
> 
> Alex
Okay, this is my first patch to get into kernel :)
Thank you once again for your time with this patch and accepting it.
