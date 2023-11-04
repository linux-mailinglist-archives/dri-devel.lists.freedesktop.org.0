Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90967E0F88
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 14:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411DD10E0BE;
	Sat,  4 Nov 2023 13:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D24710E0BE;
 Sat,  4 Nov 2023 13:02:33 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6ba54c3ed97so3078528b3a.2; 
 Sat, 04 Nov 2023 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699102952; x=1699707752; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LFVAhVDAedSPFBRNn04JrHWzW4kv30ibC/cuBpR5pcg=;
 b=Baka9YFWf5y+G9TWSAYxNWS8e2Xub/MJ3kvd5Qc5ljEaOBBSD2dpbxe1UQ8UifPSvA
 gAsDAf0+GxHpCiBN4N9iG8u8cJ6tWWgMpBMtdkEHG9dfhlPPjs91afuDrap3wWr/rYtS
 ToYgkWiTybd0Xpu/cqhd439u12JqxWULdXJCExKtkLqVawa8TfrsnOmPdSG/EgUOg93Z
 EPasEvMNGjr1jU5ecfvworYvVgmmCrjCVIz68toGem4FkAnTXbPWyzusO4BuNCHWVlO3
 Yi9kV3SAyV+3P15CqUb7TOXWCHYqJxGXJ3pCFA4h5y6AND9VTh6IJEjOo4Wwj/BQTc6S
 NRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699102952; x=1699707752;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LFVAhVDAedSPFBRNn04JrHWzW4kv30ibC/cuBpR5pcg=;
 b=makvNvIiPSH38XuKyTD5Lxi9w6Z/Jw8UxE2D05qVT9umvzcyCAiFNEzfGiBrV90/5/
 ZD1JuTif/arz6ncMmt3NuY53tt/6E+oo9faXLUVAO2mmpvTf8YfV0U1XUHFT0eru09bd
 v570C2AM51pbE6Q+i0PKFJnyQeX292Vja/+VArtOgwNI1wHUzl9pt336D6SXSb/y/D4g
 UZ1TB+JErq6j7ZY2c1kePXNX4C2NBOGHrbA5uY4j+6g5J5EzAmizg6c82r/o+gNR2aS/
 g7l9zaZSmUH0WRz/HdZX/oKKMfxj1HfZil3awX3wneTs6u6Gyn631dlggTcKo2qby4hF
 VC7g==
X-Gm-Message-State: AOJu0YwihVKko3i5xWcOx+x28fH4P/Zx9bVkfSHCvVg4dXJWgiTZBeif
 tX4kzHZCDeEYjHEtXF8CnvmrTSVjyyA=
X-Google-Smtp-Source: AGHT+IGb2vdo0cD4NjwXX5OmI6gWBS7QEBhZ6vsJMldsGy5t93N5hQHbF6HT7pFJFA7qYJp4Mni0UA==
X-Received: by 2002:a05:6a20:7348:b0:17a:eddb:ac6a with SMTP id
 v8-20020a056a20734800b0017aeddbac6amr31496489pzc.6.1699102952530; 
 Sat, 04 Nov 2023 06:02:32 -0700 (PDT)
Received: from [192.168.1.11] ([27.5.100.249])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a635554000000b0059d6f5196fasm2844708pgm.78.2023.11.04.06.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 06:02:32 -0700 (PDT)
Message-ID: <2bb714be-9511-4f79-a633-9f4467a6dcba@gmail.com>
Date: Sat, 4 Nov 2023 18:32:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: avoid variable reinitialization
Content-Language: en-US
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 daniel@ffwll.ch, airlied@gmail.com, Qingqing.Zhuo@amd.com,
 alvin.lee2@amd.com, wenjing.liu@amd.com, jun.lei@amd.com, Samson.Tam@amd.com
References: <20231024181134.48066-1-bragathemanick0908@gmail.com>
 <744beb05-1327-401e-a961-edfe63bd8927@gmail.com>
In-Reply-To: <744beb05-1327-401e-a961-edfe63bd8927@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 30/10/23 20:17, Bragatheswaran Manickavel wrote:
>
> On 24/10/23 23:41, Bragatheswaran Manickavel wrote:
>> The member variable enable_hpo_pg_support is already initialized
>> and hence the reinitialization instruction can be removed. Issue
>> identified using the doubleinit.cocci Coccinelle semantic patch script.
>>
>> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
>> ---
>>   drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c 
>> b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
>> index 99d55b958977..1fd9df8da09c 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
>> @@ -739,7 +739,6 @@ static const struct dc_debug_options 
>> debug_defaults_drv = {
>>       .disable_boot_optimizations = false,
>>       .disable_unbounded_requesting = false,
>>       .disable_mem_low_power = false,
>> -    .enable_hpo_pg_support = false,
>>       //must match enable_single_display_2to1_odm_policy to support 
>> dynamic ODM transitions
>>       .enable_double_buffered_dsc_pg_support = true,
>>       .enable_dp_dig_pixel_rate_div_policy = 1,
>
>
> just a friendly ping
>
> Thanks,
> Bragathe
>
Could someone help me in reviewing this changes ?

Thanks,
Bragathe

