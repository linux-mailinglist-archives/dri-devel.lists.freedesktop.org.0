Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8637936E8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 10:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D57910E59B;
	Wed,  6 Sep 2023 08:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E76010E59B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 08:11:42 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-34ccc0fca24so10716835ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693987901; x=1694592701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=IhhoVlvKUxA8fynkdsG8I8qeZV+Vy1d1rJq/QPqmrYo=;
 b=CXDRW5NeQmXnKdtGvM44qyAABWYFrvx+O4347WyVlv0a/WIbBFTgVcOROYSICnZMTG
 aMbxX3LydfdqxwtP+Fbf48fnzn8HyQ20CfZfvu0eHCpYyvOceTYWr3Qlu0YdmdRKBpJT
 OzvRKA4yGCFviEpP7wlrlB2Shfd2SKoFQkrdF0ccslNL8Fvm+SYGTAvioAlrRmjC4PBt
 SDXPWv79PSQDqSQ7y0vY3YNm9x3sh9UpVkcXUKJs98gmXpsbYBu2n3Ca/FN/S2Au6WzB
 XWgij78I3QHG4DBty8+zm6gD46u9tMSWOvdvqBRzOcbolRnRHiCPzDgvrtg45Q4X5/Fm
 2U2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693987901; x=1694592701;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IhhoVlvKUxA8fynkdsG8I8qeZV+Vy1d1rJq/QPqmrYo=;
 b=CmzGo7aCoVqo2Ska4/RaQ6rjEKoKx6jNYwUZYkYG8mpM3ZqbDxxH+qJXrz+OZU5Yx/
 olZljPCzsvzuJS+ECQaM/A3+0nbJQ/+JVREHvBLePi0+JIooEBxiVqhR+MWVN4vYQ0p+
 3Qk4QnV545zDAClLGYnDgFXNSRHCfVsGVFjw9f/B6K/6Z/xJ+cTTDs7RcUhO8uRCx54k
 u5C+CWcIEacSvYZzq+9Zz6I1sMeRuL4hkp3Pswj5C6lkSLj+GDmgX6vcGqLw1UDkfkqG
 0lrOasX6ObJpY0QloB7IJt4UwgEzV5Zq7aHJ2okrU/2aHfgmgnl+DJvVcWp/fofQ2/Oh
 jzbA==
X-Gm-Message-State: AOJu0Yw7522Senlye/zdPUdZdxjL6qHklmwf9+a7GRhsBSvbq93KLs59
 K44Cb8BNX/V/RZBn1hRuSqs=
X-Google-Smtp-Source: AGHT+IG5nXCsjWaR4AsUEv0RKaF7zFUYcGHnpQ+SqkUjFGSRHZlNHvOI3aha9sg5lEdUewtBLKisZQ==
X-Received: by 2002:a05:6e02:1c08:b0:34f:3651:9c74 with SMTP id
 l8-20020a056e021c0800b0034f36519c74mr940900ilh.0.1693987901497; 
 Wed, 06 Sep 2023 01:11:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a92cf08000000b0034bad471d1fsm4723496ilo.3.2023.09.06.01.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 01:11:40 -0700 (PDT)
Message-ID: <081537c0-0d74-0242-451a-e6bd6f71cdd9@roeck-us.net>
Date: Wed, 6 Sep 2023 01:11:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] lockdep: Fix static memory detection even more
To: Helge Deller <deller@gmx.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <ZNep5EcYskP9HtGD@p100>
 <b7526bf6-886f-457a-beba-84ae9f75bc77@roeck-us.net> <ZPT2cINsHd+sWJQU@ls3530>
 <78473084-d4d5-685f-9778-4bbe8878a43e@roeck-us.net> <ZPgnslFTlwImJ+Aq@ls3530>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ZPgnslFTlwImJ+Aq@ls3530>
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
Cc: linux-parisc@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/6/23 00:18, Helge Deller wrote:
> * Guenter Roeck <linux@roeck-us.net>:
>> On 9/3/23 14:11, Helge Deller wrote:
>>> * Guenter Roeck <linux@roeck-us.net>:
>>>> Hi,
>>>>
>>>> On Sat, Aug 12, 2023 at 05:48:52PM +0200, Helge Deller wrote:
>>>>> On the parisc architecture, lockdep reports for all static objects which
>>>>> are in the __initdata section (e.g. "setup_done" in devtmpfs,
>>>>> "kthreadd_done" in init/main.c) this warning:
>>>>>
>>>>> 	INFO: trying to register non-static key.
>>>>>
>>>>> The warning itself is wrong, because those objects are in the __initdata
>>>>> section, but the section itself is on parisc outside of range from
>>>>> _stext to _end, which is why the static_obj() functions returns a wrong
>>>>> answer.
>>>>>
>>>>> While fixing this issue, I noticed that the whole existing check can
>>>>> be simplified a lot.
>>>>> Instead of checking against the _stext and _end symbols (which include
>>>>> code areas too) just check for the .data and .bss segments (since we check a
>>>>> data object). This can be done with the existing is_kernel_core_data()
>>>>> macro.
>>>>>
>>>>> In addition objects in the __initdata section can be checked with
>>>>> init_section_contains().
>>>>>
>>>>> This partly reverts and simplifies commit bac59d18c701 ("x86/setup: Fix static
>>>>> memory detection").
>>>>>
>>>>> Tested on x86-64 and parisc.
>>>>>
>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>> Fixes: bac59d18c701 ("x86/setup: Fix static memory detection")
>>>>
>>>> On loongarch, this patch results in the following backtrace.
>>>>
>>>> EFI stub: Loaded initrd from LINUX_EFI_INITRD_MEDIA_GUID device path
>>>> EFI stub: Exiting boot services
>>>> [    0.000000] INFO: trying to register non-static key.
>>>> [    0.000000] The code is fine but needs lockdep annotation, or maybe
>>>> [    0.000000] you didn't initialize this object before use?
>>>> [    0.000000] turning off the locking correctness validator.
>>>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.0+ #1
>>>> [    0.000000] Stack : 0000000000000000 0000000000000000 9000000000223d6c 9000000001df0000
>>>> [    0.000000]         9000000001df39a0 9000000001df39a8 0000000000000000 0000000000000000
>>>> [    0.000000]         9000000001df39a8 0000000000000001 0000000000000000 900000000154b910
>>>> [    0.000000]         fffffffffffffffe 9000000001df39a8 0000000000000000 0000000000000000
>>>> [    0.000000]         0000000000000001 0000000000000003 0000000000000010 0000000000000030
>>>> [    0.000000]         0000000000000063 0000000000000001 0000000000000000 0000000000000000
>>>> [    0.000000]         0000000000000000 0000000000000000 9000000001c60650 9000000001e12000
>>>> [    0.000000]         0000000000000000 9000000001560bc0 0000000000000000 9000000002ee6000
>>>> [    0.000000]         0000000000000000 0000000000000000 9000000000223d84 0000000000000000
>>>> [    0.000000]         00000000000000b0 0000000000000004 0000000000000000 0000000000000800
>>>> [    0.000000]         ...
>>>> [    0.000000] Call Trace:
>>>> [    0.000000] [<9000000000223d84>] show_stack+0x5c/0x180
>>>> [    0.000000] [<900000000153e0b4>] dump_stack_lvl+0x88/0xd0
>>>> [    0.000000] [<90000000002bc548>] register_lock_class+0x768/0x770
>>>> [    0.000000] [<90000000002bc710>] __lock_acquire+0xb0/0x2a18
>>>> [    0.000000] [<90000000002bba1c>] lock_acquire+0x11c/0x328
>>>> [    0.000000] [<9000000000b34a60>] __debug_object_init+0x60/0x244
>>>> [    0.000000] [<9000000000337f94>] init_cgroup_housekeeping+0xe8/0x144
>>>> [    0.000000] [<900000000033e364>] init_cgroup_root+0x38/0xa0
>>>> [    0.000000] [<90000000017801ac>] cgroup_init_early+0x44/0x16c
>>>> [    0.000000] [<9000000001770758>] start_kernel+0x50/0x624
>>>> [    0.000000] [<90000000015410b4>] kernel_entry+0xb4/0xc4
>>>>
>>>> Reverting it fixes the problem. Bisect log attached.
>>>>
>>>> This is also seen in v6.5.y and v6.4.y since the patch has been applied
>>>> to those branches.
>>>
>>> Does this happens with CONFIG_SMP=n ?
>>> If so, I think the untested patch below might fix the issue.
>>>
>>
>> No, this is loongarch:defconfig with various debug options enabled.
>> That has CONFIG_SMP=y.
> 
> Could you apply below patch and verify with the contents of the
> System.map file where the lock is located ?
> 
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index e85b5ad3e206..db0a301f9740 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -969,7 +969,7 @@ static bool assign_lock_key(struct lockdep_map *lock)
>   	else {
>   		/* Debug-check: all keys must be persistent! */
>   		debug_locks_off();
> -		pr_err("INFO: trying to register non-static key.\n");
> +		pr_err("INFO: trying to register non-static key at %08lx.\n", addr);
>   		pr_err("The code is fine but needs lockdep annotation, or maybe\n");
>   		pr_err("you didn't initialize this object before use?\n");
>   		pr_err("turning off the locking correctness validator.\n");

90000000015602d0 D __la_abs_end
...
90000000016815c0 d fill_pool_map.3  <--- lock pointer
...
9000000001770000 T __init_begin

Guenter

