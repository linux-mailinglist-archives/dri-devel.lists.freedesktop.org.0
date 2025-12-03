Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F1ECA1CC9
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 23:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC5310E151;
	Wed,  3 Dec 2025 22:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dBZzyRdt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F3D10E151
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 22:16:26 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-3e37ad3d95aso225052fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 14:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1764800185; x=1765404985;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/BQ+aq7QV9wwUu5JnIoDoUm9ffc2261+vDlHLPgQixY=;
 b=dBZzyRdtIZO4iccSV/sdMjsZuUzemP1ybtmiVKw5ffikM4sBbGLUWg3DSgdeTHXeQ5
 bF5Q7Wec9xNeCSOjO9n6z4Db3AMdv8px8BgESebJ1yUo43jtLdZcyIfriPR6rlF5gp85
 bPN3GEQ1LzwDf3sYu5yUG03kxlnmfmaiA+VAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764800185; x=1765404985;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/BQ+aq7QV9wwUu5JnIoDoUm9ffc2261+vDlHLPgQixY=;
 b=jbuqDTSHGfpwIteq+loGHKguuZTQ7aOpRZLKBw6lY/GgEBk5vXXEoZO7PfCggJQop1
 y1Z1ecK6Ab5rpQ+KkkJr7WuJVA1e4oDSlL899OaVE/D+LZOlVNkSj03wD+ENpP7yjVfR
 Tig4N5vVBIbCa6s+6YygvO2uAtdOCJUipi+Jm9lbf3mJQNW0/H3VwKmksAwb2Hrj9FOm
 vvKmp7GivlWmg3jrntAZoC7AoFM0Z5r1QkvEP11XAoL8MdtLocd9O+67Z/56xqU+sLem
 xCTCY2HqJPCRz3mxlZQERRYuH8ku0NLhTJ0ruGaBt4OZXGeHrceGFwfQ2YKBUQROIFq6
 2Ndg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoLBP1XS5g50lmrU//GhcypRzI/KNWanMSo5qQAzgR/WUULBMBMcknwnb/bU/a7saVqVCsdmLlV1Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywquz12w30QUvoX5QmSmRsUvuVRhzKJaombsBhRt+qv2PJXMMtw
 skWKxZOMHdy17G10iiE4nUESaTYGraFNkS+AHzWRa0NompK1nGsN0rBOIwnCz1bw8E4=
X-Gm-Gg: ASbGnctLFjs6MpJbFutvhk4A/wJGc9cN2sJdT2aATnCulHb16M35Lnsc87d3dsw6Ddl
 4stlBykSDWle+NtXm+6ZkmOffPm/8rnE+8B0KA+SYuqvtTr5QnqhGPqzhJ8u7B0yC8e+yh7WYfR
 UtKC0O5awfS61fb9quw65yUc2UY6CBbaZspUKOmnSkAE6xfnsh53nezAoGuyOjKXBbZQBmplw9h
 vetRhgUx5ZygXNIJjtBZ6OX1TeIy+Y1aWgDIWA4WOS60jdXt5wAa58x1kCEHV6AGXSKNZAzF8js
 bn6GrNuREuRb+JK8rZv91r68U0g/aSC/Q9oamUwUiz5Zs8jp+AuZEVo+5Ud3xDRwqi4GePD9JH/
 IRIV4oCrHXyaf5uIipFkb5AiXhj9zl53TkinFTAFFNYiMu5CWI+ZOgQPH
X-Google-Smtp-Source: AGHT+IGLm/MMHH27TVNlqYSIvX9zWGRL2Q08ixVb50qRPPkAoiUKIhGS/PeUtokINd7b7Xw8Q53j8g==
X-Received: by 2002:a05:6870:d607:b0:3ec:5a09:3014 with SMTP id
 586e51a60fabf-3f50634f9cemr438772fac.3.1764800185136; 
 Wed, 03 Dec 2025 14:16:25 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3f50aa34d4fsm15449fac.5.2025.12.03.14.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 14:16:24 -0800 (PST)
Message-ID: <9d520a1d-0b8d-4d30-b29f-230fc0f92b8a@linuxfoundation.org>
Date: Wed, 3 Dec 2025 15:16:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.18 amdgpu build error
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
References: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
 <1eb24816-530b-4470-8e58-ce7d8297996c@roeck-us.net>
 <0425d7b4-76e4-4057-83a5-a7b17a051c54@linuxfoundation.org>
 <ec77d11a-7613-4b75-8c9e-f2bba1595f0f@roeck-us.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ec77d11a-7613-4b75-8c9e-f2bba1595f0f@roeck-us.net>
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

On 12/2/25 14:23, Guenter Roeck wrote:
> On 12/2/25 13:01, Shuah Khan wrote:
>> On 12/1/25 19:31, Guenter Roeck wrote:
>>> On Mon, Dec 01, 2025 at 03:17:49PM -0700, Shuah Khan wrote:
>>>> Hi Alex,
>>>>
>>>> I am seeing the following make error on Linux 6.18.
>>>> I started seeing build failures since rc7 and rc6
>>>> build was just fine on the same config file.
>>>>
>>>> LD [M]  drivers/gpu/drm/amd/amdgpu/amdgpu.o
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu.o: error: objtool: elf_init_reloc: .rela.orc_unwind_ip: reloc 39935 already initialized!
>>>> make[6]: *** [scripts/Makefile.build:503: drivers/gpu/drm/amd/amdgpu/amdgpu.o] Error 255
>>>> make[6]: *** Deleting file 'drivers/gpu/drm/amd/amdgpu/amdgpu.o'
>>>> make[5]: *** [scripts/Makefile.build:556: drivers/gpu/drm/amd/amdgpu] Error 2
>>>> make[4]: *** [scripts/Makefile.build:556: drivers/gpu/drm] Error 2
>>>> make[3]: *** [scripts/Makefile.build:556: drivers/gpu] Error 2
>>>> make[2]: *** [scripts/Makefile.build:556: drivers] Error 2
>>>> make[1]: *** [/linux/linux_6.18/Makefile:2010: .] Error 2
>>>> make: *** [Makefile:248: __sub-make] Error 2
>>>>
>>>> I tried "make clean" and "make distclean" just in case, still see
>>>> the same error.
>>>>
>>>
>>> My test system does not report any problems. What is the configuration
>>> and compiler ?
>>>
>>
>> My one test system didn't report any problems. The other one did.
>> I am using gcc and the config is the same as the one used to build
>> 6.18-rc6 with no issues.
>>
>> I will keep digging to find what's wrong on my system.
>>
>> gcc version 14.2.0 (Debian 14.2.0-19)
>>
> 
> Interesting. That reminds me ... I used to have that kind of machine specific
> problems when building with CONFIG_RANDSTRUCT enabled. I worked around it
> by using gcc builds with plugin support disabled. In my case, there was
> nothing wrong with the system, just that each system has a slightly different
> hardware configuration which somehow influenced structure randomization, even
> across "make clean/distclean".
> 

CONFIG_RANDSTRUCT is disabled and so are the GCC_PLUGINS in my config.
I am also seeing issues with cloning kernel.org repos on my system after
a recent update:

remote: Enumerating objects: 11177736, done.
remote: Counting objects: 100% (1231/1231), done.
remote: Compressing objects: 100% (624/624), done.
remote: Total 11177736 (delta 855), reused 781 (delta 606), pack-reused 11176505 (from 1)
Receiving objects: 100% (11177736/11177736), 3.01 GiB | 7.10 MiB/s, done.
Resolving deltas: 100% (9198323/9198323), done.
fatal: did not receive expected object 0002003e951b5057c16de5a39140abcbf6e44e50
fatal: fetch-pack: invalid index-pack output

Happy start to the end of the year :(

thanks,
-- Shuah

