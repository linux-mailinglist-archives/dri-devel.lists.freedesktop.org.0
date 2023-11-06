Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2A27E2EE1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 22:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02B910E436;
	Mon,  6 Nov 2023 21:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5C710E436;
 Mon,  6 Nov 2023 21:20:08 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-582050ce2d8so819816eaf.0; 
 Mon, 06 Nov 2023 13:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699305607; x=1699910407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1fyk105fO9nPx1K8RQh7z3r5ykWh5/CrtqeSXyVa34c=;
 b=HE7iYAtSDgKg4l4CWcWcumSQG9a21pWzw+EC6ZA+1tOjjgK08AcO2V4/Iwmgkmw7ct
 UmfcP0gEylosJu/w7hiXRtE4zhDecysB5F2BMe1q1s06vzSkjKWgbG3hBTZUR4425FSO
 m+r+x25BwoiWiDEPN6iG+2xxJ+GLqj4t63uiQzK1EoQj4mUsnBvcPb8eFrQoEC5BsYEA
 XtxoMgcMxHVTGEk+WSDocOIwtYDafmReMES8U5/+sAuPa6PfHwl52etypXaQXAC9+wn+
 FlCmPgX7Rskg5eHqGtZJ0/LmOVRJ9W3eejHPV1nGOLaAj6lwQQ8FjA1aciY2Jpi3nbUC
 rxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699305607; x=1699910407;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1fyk105fO9nPx1K8RQh7z3r5ykWh5/CrtqeSXyVa34c=;
 b=Mvr+p+5Fbe6ssz1y5x7tniscjb6XaUoLP5q7/eDmHlCLYEC48aXsGd5Hh6kMmXUPnx
 0REpD23OYsSVb59K/sq6lR53QLA+IEK/dxKr64jsJn9+ztIxwwHTTZJSW2hHNrg4PuZI
 9Q3FTsi5uzeVH9gQiqqGhK0yl0rSxPU7tYBBtZ0F+npxp4DLA7T3S5UED7S2XoGK72ms
 qWvuSZwwBYQE35ewXObt7AeZp0QdzItV/swRtlDOgIXV3YljO2ukS2w5C+VUuhAfdNdA
 1nBPBgXqKjxqgDrOltjbSqgF0TckTzcZi1H/joaBab/ZUm53Ul9sm7AXcTepTSQWDq2k
 lbeg==
X-Gm-Message-State: AOJu0YzFprqSdxYqweWebfF37WZd8fJLkXqusYpXv++kDfHKzCMBo7q6
 MMU3Jy5rlK6AFb6EjqnoxTI=
X-Google-Smtp-Source: AGHT+IH4VDf8xNiyaOS4OHF/NY+0agil1P2kuT4qJkDyOIVe9taGaS0U+sjLOgwU7KXVIGo4aSi+fQ==
X-Received: by 2002:a05:6358:f201:b0:169:4a72:2b84 with SMTP id
 jj1-20020a056358f20100b001694a722b84mr41339730rwb.1.1699305607292; 
 Mon, 06 Nov 2023 13:20:07 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.210])
 by smtp.gmail.com with ESMTPSA id
 y188-20020a6364c5000000b005b92ba3938dsm190941pgb.77.2023.11.06.13.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 13:20:06 -0800 (PST)
Message-ID: <3b92b89b-ca72-4012-b4f2-0b19e4ba9153@gmail.com>
Date: Tue, 7 Nov 2023 02:49:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
 <CADnq5_OkWD3YmCKgXbtk=Gnba3AgAiAWp2z_nzHQvRfEOsdXVg@mail.gmail.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <CADnq5_OkWD3YmCKgXbtk=Gnba3AgAiAWp2z_nzHQvRfEOsdXVg@mail.gmail.com>
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

On 11/7/23 00:25, Alex Deucher wrote:
> Applied.  This matches what we already do in the other clear state headers.
> 
> Alex
> 
> On Fri, Nov 3, 2023 at 12:00 PM Abhinav Singh
> <singhabhinav9051571833@gmail.com> wrote:
>>
>> sparse static analysis tools generate a warning with this message
>> "Using plain integer as NULL pointer". In this case this warning is
>> being shown because we are trying to intialize a pointer to NULL using
>> integer value 0.
>>
>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>> ---
>>   drivers/gpu/drm/radeon/clearstate_evergreen.h | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/clearstate_evergreen.h b/drivers/gpu/drm/radeon/clearstate_evergreen.h
>> index 63a1ffbb3ced..3b645558f133 100644
>> --- a/drivers/gpu/drm/radeon/clearstate_evergreen.h
>> +++ b/drivers/gpu/drm/radeon/clearstate_evergreen.h
>> @@ -1049,7 +1049,7 @@ static const struct cs_extent_def SECT_CONTEXT_defs[] =
>>       {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
>>       {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
>>       {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
>> -    { 0, 0, 0 }
>> +    { NULL, 0, 0 }
>>   };
>>   static const u32 SECT_CLEAR_def_1[] =
>>   {
>> @@ -1060,7 +1060,7 @@ static const u32 SECT_CLEAR_def_1[] =
>>   static const struct cs_extent_def SECT_CLEAR_defs[] =
>>   {
>>       {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
>> -    { 0, 0, 0 }
>> +    { NULL, 0, 0 }
>>   };
>>   static const u32 SECT_CTRLCONST_def_1[] =
>>   {
>> @@ -1070,11 +1070,11 @@ static const u32 SECT_CTRLCONST_def_1[] =
>>   static const struct cs_extent_def SECT_CTRLCONST_defs[] =
>>   {
>>       {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
>> -    { 0, 0, 0 }
>> +    { NULL, 0, 0 }
>>   };
>>   static const struct cs_section_def evergreen_cs_data[] = {
>>       { SECT_CONTEXT_defs, SECT_CONTEXT },
>>       { SECT_CLEAR_defs, SECT_CLEAR },
>>       { SECT_CTRLCONST_defs, SECT_CTRLCONST },
>> -    { 0, SECT_NONE }
>> +    { NULL, SECT_NONE }
>>   };
>> --
>> 2.39.2
>>
Hi Alex, thanks for looking into this. By applied you mean this patch is 
accepted and it has been merged?
