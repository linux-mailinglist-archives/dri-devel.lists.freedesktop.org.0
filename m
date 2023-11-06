Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE77E288A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 16:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C8310E348;
	Mon,  6 Nov 2023 15:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8873310E348;
 Mon,  6 Nov 2023 15:21:15 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6c343921866so635723b3a.0; 
 Mon, 06 Nov 2023 07:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699284075; x=1699888875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P92lxDHD1C4zCfjkheHzuT5lqonsPzQbwvZLdTTLERo=;
 b=jpt7+pvTolFjFo/5B1QqjgjasFfFroX5JWs1iy0Vhx+TkFNPgzlPEtk6ureo/BUOw7
 ARzSMGqYVnGthsPXxivlNJQpLx2YeyLRXiSOc+tvytX8Dnwa74BG3ywYt+5ZQhFboeDJ
 HCIl4L1cr/zWWmYZ3Tn4DyZWsOvH6Jc++AT+MHGWiFn5ElIg6XTxI9xrT6uVeznaM0i4
 0zZ1vSeYMvf8WS9lLNwHJZcOuEoZN9ffcHOqoviFEv64XQB+9WmGaftgndcUAUYRumPu
 vsiAKOkvXyBKDdjaX29KH3SKKjWYWDa/BliyWXe/dOJLFpEHOLuiIpYK254s9LBT5jFg
 h6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699284075; x=1699888875;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P92lxDHD1C4zCfjkheHzuT5lqonsPzQbwvZLdTTLERo=;
 b=lj6+0V7CAdgAbd/ZUCJKeQytrIu2mX/On9dDvh9hGJFROVpLgVb4PfeWJMsAn/Y8OG
 eqC4fT0wsG611maXGTrgLnDSO4HcbFPP5CLkwtu5bC+001vUwg55PSfLI6DxUj4e65sE
 w4LgPUBR9fl0gMcgX8/kNVg3IQFfDoliz6B4T3vDpZoHDx0tFgzEMEQwudrlGkW2Feyw
 YjQTOoKWP77RaU9DADDrfacTNfxR+c2Y5Q6dmxbomB+Hlkw428WxobobBgJi9CiDxtca
 O4mQCA3ydzk98+S1nPKSC6BvTH8Z2QchAnKSToFynxXfg1JxRxHRiskN678V4G2nARPw
 RXAg==
X-Gm-Message-State: AOJu0YxIIwgpAx9hR05ZRKyZPXYLRgkBECawpGIcb9i68yz7E4Ow0MKF
 RmJWxD3PsUttUK6kLWzdvag=
X-Google-Smtp-Source: AGHT+IE24GvzdFIzXU6AfcREyApaAuOpmL/V9kBcAm3FDckkeCxrMFOO4qFiX+Sawmz7v5gl44NziA==
X-Received: by 2002:a05:6a00:470a:b0:68f:c8b3:3077 with SMTP id
 df10-20020a056a00470a00b0068fc8b33077mr28116172pfb.1.1699284074970; 
 Mon, 06 Nov 2023 07:21:14 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.211])
 by smtp.gmail.com with ESMTPSA id
 n35-20020a056a000d6300b006b90f1706f1sm5777285pfv.134.2023.11.06.07.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 07:21:14 -0800 (PST)
Message-ID: <a2310260-ba15-428e-9fd1-08abb9565b18@gmail.com>
Date: Mon, 6 Nov 2023 20:51:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
To: Jani Nikula <jani.nikula@linux.intel.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
 <87sf5jyvkt.fsf@intel.com>
Content-Language: en-US
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <87sf5jyvkt.fsf@intel.com>
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

On 11/6/23 16:53, Jani Nikula wrote:
> On Fri, 03 Nov 2023, Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:
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
> 
> Random drive-by comment:
> 
> I'd just use {} as the sentinel.
> 
> BR,
> Jani.
> 
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
> 
Hi, Thanks for dropping by and the suggestion. I thought of using NULL 
instead of {} is because, first the warning itself says that 0 is used 
to intialize pointers with NULL, and second due this link 
https://www.spinics.net/lists/linux-sparse/msg10066.html where linus is 
talking about not using 0 NULL intialization of pointer variable and he 
thinks this is a legitimate issue and not some false positive

