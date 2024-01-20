Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFE0835557
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 11:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBA110E1FA;
	Sun, 21 Jan 2024 10:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC41910E2B9
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 16:09:08 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6d9f94b9186so1895254b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 08:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705766888; x=1706371688; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5SRIc708Ewxn5oqvFcPUUTHSObiM7lHy3XQuZUJTS9g=;
 b=NJRwcIxVG5nckWT61FbBflNSfxqm9AoJ2PnvPq3G2Oj4mE2Fc65KSrN+3tKIsJGIwX
 3CL85Xj4WIhv8e8+JLjktl/Ot/l/wf9bx6I8VoIdWB3lvP8kDY8uRkuaO5qh+TkfY7eN
 zmjGJxXkQiNTWSU9etbTU3xaMlm4yjDn0E60fvtLqzvv2v0x2cqObatnZQg7t2gOo6HG
 4uGINHjxNu2hdrkr6YbIg1yJDVDu1nmhOvA6nOdzPO3xG5idXUuvph5IQnYeBFyu/upT
 W/LMSiMOyQ2Zh+pS+jc0m1xIjB1xHOxD7RMzvMlLF10xXgMv7jG7naA6XI9z8WGf0Vgn
 OBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705766888; x=1706371688;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5SRIc708Ewxn5oqvFcPUUTHSObiM7lHy3XQuZUJTS9g=;
 b=VA1KmJZMsJuXiAO32Qb77gDChfhkvmPRgkuW61HZGru6v6hAURfjK+XfNoM/+zVc8N
 VB4vKgPS7r82czdm9sdVkWCrSPfTfuCRe4JbS7zb0xAlvtuQixt0G8EB6QnKqISy12mC
 7BrFzgofQxC/Bed50bopA7ClhsOB0sbVYWOZ7CrQIMwO9oBnLgCVvv48ul+z2SagkTLa
 JgrNlsFfJpTmiv8sF26TYvyr1pA0rYJh0v8SK7/oE0KcQAF1vmZpAbunKwIBMDdIsPjn
 DhVFtZmOzBXg1suUgEa7fOb62RUvKDjVzN0+rqY1mlsqXb5atWjSCVMogfMDkFPHjxZa
 LFsQ==
X-Gm-Message-State: AOJu0Yw+aKMy3/MmSsBbZ0ShqznCHfQIbh3gQ1/SFbWt7BWSPkJBzYcV
 JvjB4CaggaFEr4lOF5lmTVMS9y62R7BOih5rX3K5x3FQOqjnRMuK
X-Google-Smtp-Source: AGHT+IF/LRVh+EhnZIcb360Bmu+M2y23dICW9Htj5/TwXbnwHtWGp2Ku2Ws3zYPF5Obj05yC1Rgmmw==
X-Received: by 2002:a05:6a00:3d4d:b0:6db:d5ba:ff41 with SMTP id
 lp13-20020a056a003d4d00b006dbd5baff41mr506333pfb.51.1705766888307; 
 Sat, 20 Jan 2024 08:08:08 -0800 (PST)
Received: from [192.168.100.35] (173-255-214-117.ip.linodeusercontent.com.
 [173.255.214.117]) by smtp.googlemail.com with ESMTPSA id
 r13-20020a63d90d000000b005ce033f3b54sm5432617pgg.27.2024.01.20.08.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jan 2024 08:08:07 -0800 (PST)
Message-ID: <4144ea1c-f500-43b6-8641-ea21acae3376@gmail.com>
Date: Sun, 21 Jan 2024 00:07:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: yetist <yetist@gmail.com>
Subject: Re: drm/loongson: Error out if no VRAM detected
To: Sui JIngfeng <sui.jingfeng@linux.dev>,
 Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>
References: <20240119104049.335449-1-chenhuacai@loongson.cn>
 <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
Content-Language: en-US
In-Reply-To: <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Jan 2024 10:54:13 +0000
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without this patch, my server cannot start the DM. It is a Loongson 
3C5000L server, with both a Loongson display controller and an ASPEED 
graphics card.

   $ lspci |grep VGA
   0000:00:06.1 VGA Compatible Controller: Loongson Technology LLC DC 
(Display Controller) (rev 01)
   0000:03:00.0 VGA-compatible controller: ASPEED Technology, Inc. 
ASPEED Graphics Family (revision 41)

When not working, there is the following information in dmesg:

   loongson 0000:00:06.1: [drm] Private vram start: 0xe00472a6000, size: 
0MiB
   Loongson 0000:00:06.1: [drm] *Error* Request (0MiB) failed


Anyway, this patch works fine with my server now, thank you.

Tested-by: Xiaotian Wu <wuxiaotian@loongson.cn>


在 2024/1/20 00:18, Sui JIngfeng 写道:
> Hi,
>
> Thanks a lot for contribution.
>
> On 2024/1/19 18:40, Huacai Chen wrote:
>> If there is no VRAM (it is true if there is a discreted card),
>
>
> Why the dedicated VRAM is gone whenthere is a discrete card?
>
> As far as I know, this is only possible on Loongson 3C5000 + aspeed 
> BMC server hardware platform where the dedicated VRAM chip of Loongson 
> Graphics is NOT soldered on the motherboard. Probably for cost reason, 
> but then, the platform BIOS(either UEFI or PMON) should turn off the 
> Loongson integrated graphics.
>
> Because without dedicated VRAM, this driver can not work correctly. Or 
> carve out
> part of system RAM as VRAM, and write the base address and size to the 
> BAR 2 of
> the GPU PCI device.
> This is NOT true  for Loongson 3A5000/3A6000  desktop hardware, 
> because I have do
> a lot test on various platform[1] before this driver was merged. It 
> never happens
> on a sane hardware configuration. Please update the commit message and 
> limit the
> scope.
>
> [1] https://github.com/loongson-gfx/loongson_boards
>
>> we get
>> such an error and Xorg fails to start:
>
>
> Yeah, If there is no dedicated VRAM, the driver can't allocate memory 
> for framebuffer.
> But this is probably more about the hardware configuration issue, not 
> a driver issue.
>
>
>> [  136.401131] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>> [  137.444342] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>> [  138.871166] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>> [  140.444078] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>> [  142.403993] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>> [  143.970625] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>> [  145.862013] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>>
>> So in lsdc_get_dedicated_vram() we error out if no VRAM (or VRAM is less
>> than 1MB which is also an unusable case) detected.
>
>
> This is not expected, if you want this driver be there and run normally.
> You should guarantee that there have at least 64MiB dedicated VRAM.
>
> I'm OK if this patch is strongly requested, but this is a kind of 
> error handling.
> Please give more details about the hardware in using and explain why 
> there is no
> dedicated VRAM available for your hardware.
>
>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> ---
>>   drivers/gpu/drm/loongson/lsdc_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c 
>> b/drivers/gpu/drm/loongson/lsdc_drv.c
>> index 89ccc0c43169..d8ff60b46abe 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
>> @@ -184,7 +184,7 @@ static int lsdc_get_dedicated_vram(struct 
>> lsdc_device *ldev,
>>       drm_info(ddev, "Dedicated vram start: 0x%llx, size: %uMiB\n",
>>            (u64)base, (u32)(size >> 20));
>>   -    return 0;
>> +    return (size > SZ_1M) ? 0 : -ENODEV;
>>   }
>>     static struct lsdc_device *
>

