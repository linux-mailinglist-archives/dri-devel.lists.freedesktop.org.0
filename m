Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D570E8B76B3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 15:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778F110F48C;
	Tue, 30 Apr 2024 13:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="elv7G6R/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7530310F613
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714482918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lc07mIYcskfJD6gmXNvynk5dUWHpLlMvh2bKKxgUtE=;
 b=elv7G6R/p9YNE6AADC6kP/Euhz85AGJ47N39+JOWkE3ROqde8d8l4xm1qNS5kUHaSjpsh1
 eH6rnjVSEwk5w7VGti9C0GyS7LM6vxnwOki6oMGfRPgN/k2NJbBjBChkYmk8mUPlXwKD9r
 l3rTzOV57/wtRaM3EVUB8+L8+8/Qbx0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-ee5epJHNPmW9-PPyHcrUzw-1; Tue, 30 Apr 2024 09:15:16 -0400
X-MC-Unique: ee5epJHNPmW9-PPyHcrUzw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-41c025915a9so13294955e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 06:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714482915; x=1715087715;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0lc07mIYcskfJD6gmXNvynk5dUWHpLlMvh2bKKxgUtE=;
 b=nPOb3137z6BG04wXNHDM45Wyiw2uUyt3kPDPiKGL1gG9KChLM7+KdXWsxRevhcCsya
 VUQ6+MUZUI+DE9fYWGYDhpN8VkjSEvIlsDE2d0eGjKwJQAaZP7eOkHhjXqwPxjP4uyHR
 Q7iidypKNrkifDh/Ppt+2mdxhKEJQRAoHvLHgOYU8c2gA7C8K/2d88XiPPNWaYbuqNm6
 cWePzCdlhUPHon7KCKtKyZRRqYbO9z+xE8m4IxOo/2Wg0oHIJHZ984CaU1D8HFrz9N0h
 vA3Ods90d09sx2uRl3s85FIF5igr4M7rNMt2wbt7E/ar/iCL2EzQZ4CYnEUVAy8ODepM
 i9Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMfpuZ6n152lCl5DRCUoxgu7ThldLup1DroRSvCPfl1ZdldDdlojZUGqM4uNTNKPVlng6Xl0jE9HPyUDtvHjmX9L2ED0hT6Zhsy0qybgNm
X-Gm-Message-State: AOJu0YzgORE1S/DeSmIZ7lxjnV3tr+WEfIvJb9L2y3bJGW1RZoY0Iguq
 uV5i/jtTfuq9lFUGQMWqHMgtJrtwHJJSNNMvcmPPJ6PnCY4k/R/MzLPSqS3QeqLydmqWuEJZfvT
 2mH5TPuY7qKN40qKfPz4MqzOXX0PiIEgydjZ8k8WGi6TI9cARyfrAxHilHgnoRzkU+Q==
X-Received: by 2002:a05:600c:45ca:b0:418:e6fc:3708 with SMTP id
 s10-20020a05600c45ca00b00418e6fc3708mr10319802wmo.24.1714482915266; 
 Tue, 30 Apr 2024 06:15:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ5/5+7+gSf8MNd12lRRU2c1txGOMK5iIFL6Awsfwq4VI/aYibKkB5lPplwQgJd8+1F8dxmA==
X-Received: by 2002:a05:600c:45ca:b0:418:e6fc:3708 with SMTP id
 s10-20020a05600c45ca00b00418e6fc3708mr10319786wmo.24.1714482914922; 
 Tue, 30 Apr 2024 06:15:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b0041c012ca327sm10523076wmq.45.2024.04.30.06.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 06:15:14 -0700 (PDT)
Message-ID: <59308970-b85a-4f09-a047-146bb24ffcb0@redhat.com>
Date: Tue, 30 Apr 2024 15:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v7] nouveau: add command-line GSP-RM registry support
To: Timur Tabi <ttabi@nvidia.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>,
 chaitanya.kumar.borah@intel.com, dri-devel@lists.freedesktop.org
References: <20240417215317.3490856-1-ttabi@nvidia.com>
 <162ef3c0-1d7b-4220-a21f-b0008657f8a5@redhat.com>
 <913052ca6c0988db1bab293cfae38529251b4594.camel@nvidia.com>
 <5df03f8d-7835-4a90-b8fa-d20bd05e62fc@redhat.com>
 <wuoxhpvhh7pzmniv5clkr3756fjrqyukahw63ugbljte72o5gq@fdc3wpcasimh>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <wuoxhpvhh7pzmniv5clkr3756fjrqyukahw63ugbljte72o5gq@fdc3wpcasimh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/30/24 15:06, Lucas De Marchi wrote:
> On Fri, Apr 26, 2024 at 06:08:19PM GMT, Danilo Krummrich wrote:
>> On 4/25/24 18:38, Timur Tabi wrote:
>>> On Thu, 2024-04-25 at 15:22 +0200, Danilo Krummrich wrote:
>>>>> +        size_t length;
>>>>> +
>>>>> +        /* Remove any whitespace from the parameter string */
>>>>> +        length = strip(p, " \t\n");
>>>>
>>>> With that, I see the following warning compiling this patch.
>>>>
>>>> warning: variable ‘length’ set but not used [-Wunused-but-set-variable]
>>>>
>>>> Did you intend to use the length for anything?
>>>
>>> No, and I could have sworn I fixed that before sending out v7.  I think I
>>> originally intended 'length' to determine when I finished parsing the
>>> string.
>>>
>>>> Also, looking at the warning made me aware of 'p' potentially being NULL.
>>>>
>>>> If you agree, I can fix the warning and add the corresponding NULL check
>>>> when
>>>> applying the patch.
>>>
>>> Yes, that would be great.  You can just delete 'length'.  The NULL check for
>>> 'p' should call clean_registry() before returning -ENOMEM.
>>
>> Applied to drm-misc-next, thanks!
> 
> 
> since this commit our CI is failing to build with the following error:
> 
>        CC [M]  drivers/gpu/drm/i915/display/intel_display_device.o
>      ../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function ‘build_registry’:
>      ../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at end of compound statement
>      1266 |   default:
>            |   ^~~~~~~
>        CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.o
>        HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
>        CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0.o
>      make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1
>      make[7]: *** Waiting for unfinished jobs....
> 
> you are missing a `break;` after that default.

@Timur, do you want to send a quick fix for this yourself? Otherwise, I can send
one as well.

We should fix this asap.

- Danilo

> 
> 
>>
>>>
>>> Thanks for catching this.
>>
> 

