Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 647623B1894
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 13:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657246E8A6;
	Wed, 23 Jun 2021 11:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F696E8A6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 11:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624446820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jnl2/rIg/QPDzGy+KJkBUGcAxtR6X5tNt16GwqYV2Ik=;
 b=IKzGp+PW+29AoQ7FUcLGm6Jak7VGE8NY790c9GbmQJ69Uz9OWuMkTVLFVEiL0PiuWs4/Vl
 ZAzul1Za4VaPlzoCraoeFYQyOT7pk3LVoSdx5c4OujSHNF7drUiVWTTeu++G9NggFW04AM
 qPQY/2/6PgPOXh+9oaCbPj0eBpF+sJU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-CSrh-UxsPTmtCAxf6xyYVA-1; Wed, 23 Jun 2021 07:13:38 -0400
X-MC-Unique: CSrh-UxsPTmtCAxf6xyYVA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o3-20020a05600c5103b02901aeb7a4ac06so1445697wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 04:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jnl2/rIg/QPDzGy+KJkBUGcAxtR6X5tNt16GwqYV2Ik=;
 b=Jd+txQCLPq++1E7rBt1lz5SINoRnqOxIXifbWxOwtTR7AJQWqPY/ZUK8c/f/ra0Lk3
 1YyG8BjLxNthXDnQcIgEvwgLhPB9SPIlogVpGBnXCIXbhfy/nuMO+s/tnPgZfi13l3FF
 iPSECCXcM5KHyISG8hEMqdhib1BXUqGtkmfkM60mwYRFBVIdceY0oZyy89+EZx2lVigr
 woqOVqtWr8SjSu5IPI9XzYwKHd3RR1yr1JKQaSW+CjtNwX/mI8eETZqeNypumpWGTDzm
 qGXaMhabJbRVZ6lJd2mU0t+Yz0fqBsnlbpl5G4D0HLSNzBrVy/Kl8hj4/zHHslrzgbIU
 1lSA==
X-Gm-Message-State: AOAM530qDh/sRwUD7MobP0FZNzKT24pnZxB0qYolDWKbPOsABb80rZWi
 +YLTA9ZyzHy5sPVOeEr7NpING/Et/W2/Oh2PJTghVljfWB+X8HznRi6IYpdzNuWic0ZtrHb297N
 iLLnRXo4HrrUnXUJ4NjZ2i8IxVStW
X-Received: by 2002:a1c:7510:: with SMTP id o16mr10132927wmc.137.1624446817643; 
 Wed, 23 Jun 2021 04:13:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJwLzoKoz8r+R/xKXeF7Lx7jZ0y9cE2C6Y8Oc0j2T+kzzTfX0/iX0JS/L3nt4PZRaysvKkkQ==
X-Received: by 2002:a1c:7510:: with SMTP id o16mr10132910wmc.137.1624446817467; 
 Wed, 23 Jun 2021 04:13:37 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id i6sm2590861wro.12.2021.06.23.04.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 04:13:36 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] drivers/firmware: consolidate EFI framebuffer
 setup for all arches
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20210601150017.774363-1-javierm@redhat.com>
 <9700697f-747c-fe36-d480-69762e845f30@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <07745425-8d1b-5c0a-1622-cb08828d396c@redhat.com>
Date: Wed, 23 Jun 2021 13:13:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9700697f-747c-fe36-d480-69762e845f30@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, linux-efi@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Robinson <pbrobinson@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

Thanks a lot for your feedback!

On 6/23/21 12:06 PM, Thomas Zimmermann wrote:

[snip]

>>   config SYSFB
>>   	bool
>>   	default y
>> -	depends on X86 || COMPILE_TEST
>> +	depends on X86 || ARM || ARM64 || RISCV || COMPILE_TEST
>>   
>> -config X86_SYSFB
>> +config SYSFB_SIMPLEFB
> 
> You should also update the help text for simpledrm to reflect this 
> change. See drivers/gpu/drm/tiny/Kconfig.
>

Indeed, I missed that. I'll update it in v3.

[snip]
 
>> +
>> +__init void sysfb_apply_efi_quirks(struct platform_device *pd)
>>   {
>>   	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI ||
>>   	    !(screen_info.capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
>> @@ -281,4 +348,10 @@ __init void sysfb_apply_efi_quirks(void)
>>   		screen_info.lfb_height = temp;
>>   		screen_info.lfb_linelength = 4 * screen_info.lfb_width;
>>   	}
>> +
>> +	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI &&
>> +	    IS_ENABLED(CONFIG_PCI)) {
> 
> We have a 100-character limit now. This should (?) fit onto a single line.
> 
> 

Oh, I didn't know the character limit was extended to 100 chars now.

[snip]

>>   
>>   	/* if the FB is incompatible, create a legacy framebuffer device */
>>   	if (si->orig_video_isVGA == VIDEO_TYPE_EFI)
>> -		name = "efi-framebuffer";
>> +		pd->name = "efi-framebuffer";
>>   	else if (si->orig_video_isVGA == VIDEO_TYPE_VLFB)
>> -		name = "vesa-framebuffer";
>> +		pd->name = "vesa-framebuffer";
>>   	else
>> -		name = "platform-framebuffer";
>> +		pd->name = "platform-framebuffer";
> 
> You're allocating the platform device with an empty name string. And 
> here you're overwriting the pointer. Can you rearrange the code to first 
> detect a proper name and then allocate the device with that name? It 
> takes a few bytes more memory, but seems in the spirit of the interface.
>

Right, I'll change that in v3 as well.
 
> Best regards
> Thomas
> 
Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

