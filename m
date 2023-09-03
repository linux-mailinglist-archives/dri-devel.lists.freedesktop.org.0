Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA826790F27
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 01:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBAC10E0C0;
	Sun,  3 Sep 2023 23:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557EA10E093
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 23:08:31 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bf57366ccdso9894615ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 16:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693782511; x=1694387311; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Hj7IulSg6psGu9TGsMG33yCBcsQ8GE+D/CDKZbJw97U=;
 b=B0vHa43NHdP6XEw60dLFjPLjwrrub4p/tacUlFexmTipstUzOOl+JTF5Ri+G5Vj7bw
 n4uztbKISZLkWfephJEt5bjj9XXSJ7W17P4tACXQBVF1KNJB6G+wubUmCTmXWINwYuaD
 9jFQIAX7inOWKvX2l6oW3s1NzQrw1VpBlN5JoumXw2NxY6d9U1tCkHIsrL/9ffoWDBAY
 nHCMlZZbYX2bbtHVc3iVvhdjoyjwfLXjynZVnUVO0p0IjxtUB8yQxpbOtWHBzNvveQzI
 p5g9wFpYrsjEK7QOJ0bPIMFKy68/ul+EQisOK6lGfbDkk+a6OZ2S2tUE5gI4Doxynh0P
 JPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693782511; x=1694387311;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hj7IulSg6psGu9TGsMG33yCBcsQ8GE+D/CDKZbJw97U=;
 b=cmL/IoO8WyB3Z9zpeuqHkH78SwCWb610cz4d64sPxj9u8J8Qsya41Cnm1o5mshs1i9
 fCGD9LHCxFoxLUHx/LhdFpH0Caqd17qPhPXzHnFKMKGDy2UIggA1DjDhQypmdH+AC7F8
 xS0NWLdmCLHVMiZ6Q1uZRS5WA0PPLZzFgal2cyR221ESdmS2oSctemWmC6CyXdUziT0m
 5Z/QIJ1s4V+CnxcLgrO3J3gYbMT2XsKlL/YwMR+e5mF4b3CTootMMMycpNbPCEp1GH85
 btxhE6MAVS3zIWQ5OIG3HoggvN12JeUNOVIIq6mbVcfyZlMdCQJLGhmuxJTUsKs/jX0B
 CWbw==
X-Gm-Message-State: AOJu0YxKROfH0kEP3tOnzf4+RY9w5D2t/pMFI92qR23cW56L8iYDvtq+
 88IR0RpfAlxfsdx+DUhI+kc=
X-Google-Smtp-Source: AGHT+IF0YF2/F3nm9B76hiQ8f2e6uxNrOFC7OSSv9FfTW9BsmLRr/utQnttK54QGUBobKV0mI2oWVQ==
X-Received: by 2002:a17:902:c44c:b0:1b8:6984:f5e5 with SMTP id
 m12-20020a170902c44c00b001b86984f5e5mr8099533plm.12.1693782510702; 
 Sun, 03 Sep 2023 16:08:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a170902820700b001b8052d58a0sm6297129pln.305.2023.09.03.16.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 16:08:29 -0700 (PDT)
Message-ID: <78473084-d4d5-685f-9778-4bbe8878a43e@roeck-us.net>
Date: Sun, 3 Sep 2023 16:08:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] lockdep: Fix static memory detection even more
Content-Language: en-US
To: Helge Deller <deller@gmx.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <ZNep5EcYskP9HtGD@p100>
 <b7526bf6-886f-457a-beba-84ae9f75bc77@roeck-us.net> <ZPT2cINsHd+sWJQU@ls3530>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ZPT2cINsHd+sWJQU@ls3530>
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

On 9/3/23 14:11, Helge Deller wrote:
> * Guenter Roeck <linux@roeck-us.net>:
>> Hi,
>>
>> On Sat, Aug 12, 2023 at 05:48:52PM +0200, Helge Deller wrote:
>>> On the parisc architecture, lockdep reports for all static objects which
>>> are in the __initdata section (e.g. "setup_done" in devtmpfs,
>>> "kthreadd_done" in init/main.c) this warning:
>>>
>>> 	INFO: trying to register non-static key.
>>>
>>> The warning itself is wrong, because those objects are in the __initdata
>>> section, but the section itself is on parisc outside of range from
>>> _stext to _end, which is why the static_obj() functions returns a wrong
>>> answer.
>>>
>>> While fixing this issue, I noticed that the whole existing check can
>>> be simplified a lot.
>>> Instead of checking against the _stext and _end symbols (which include
>>> code areas too) just check for the .data and .bss segments (since we check a
>>> data object). This can be done with the existing is_kernel_core_data()
>>> macro.
>>>
>>> In addition objects in the __initdata section can be checked with
>>> init_section_contains().
>>>
>>> This partly reverts and simplifies commit bac59d18c701 ("x86/setup: Fix static
>>> memory detection").
>>>
>>> Tested on x86-64 and parisc.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>> Fixes: bac59d18c701 ("x86/setup: Fix static memory detection")
>>
>> On loongarch, this patch results in the following backtrace.
>>
>> EFI stub: Loaded initrd from LINUX_EFI_INITRD_MEDIA_GUID device path
>> EFI stub: Exiting boot services
>> [    0.000000] INFO: trying to register non-static key.
>> [    0.000000] The code is fine but needs lockdep annotation, or maybe
>> [    0.000000] you didn't initialize this object before use?
>> [    0.000000] turning off the locking correctness validator.
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.0+ #1
>> [    0.000000] Stack : 0000000000000000 0000000000000000 9000000000223d6c 9000000001df0000
>> [    0.000000]         9000000001df39a0 9000000001df39a8 0000000000000000 0000000000000000
>> [    0.000000]         9000000001df39a8 0000000000000001 0000000000000000 900000000154b910
>> [    0.000000]         fffffffffffffffe 9000000001df39a8 0000000000000000 0000000000000000
>> [    0.000000]         0000000000000001 0000000000000003 0000000000000010 0000000000000030
>> [    0.000000]         0000000000000063 0000000000000001 0000000000000000 0000000000000000
>> [    0.000000]         0000000000000000 0000000000000000 9000000001c60650 9000000001e12000
>> [    0.000000]         0000000000000000 9000000001560bc0 0000000000000000 9000000002ee6000
>> [    0.000000]         0000000000000000 0000000000000000 9000000000223d84 0000000000000000
>> [    0.000000]         00000000000000b0 0000000000000004 0000000000000000 0000000000000800
>> [    0.000000]         ...
>> [    0.000000] Call Trace:
>> [    0.000000] [<9000000000223d84>] show_stack+0x5c/0x180
>> [    0.000000] [<900000000153e0b4>] dump_stack_lvl+0x88/0xd0
>> [    0.000000] [<90000000002bc548>] register_lock_class+0x768/0x770
>> [    0.000000] [<90000000002bc710>] __lock_acquire+0xb0/0x2a18
>> [    0.000000] [<90000000002bba1c>] lock_acquire+0x11c/0x328
>> [    0.000000] [<9000000000b34a60>] __debug_object_init+0x60/0x244
>> [    0.000000] [<9000000000337f94>] init_cgroup_housekeeping+0xe8/0x144
>> [    0.000000] [<900000000033e364>] init_cgroup_root+0x38/0xa0
>> [    0.000000] [<90000000017801ac>] cgroup_init_early+0x44/0x16c
>> [    0.000000] [<9000000001770758>] start_kernel+0x50/0x624
>> [    0.000000] [<90000000015410b4>] kernel_entry+0xb4/0xc4
>>
>> Reverting it fixes the problem. Bisect log attached.
>>
>> This is also seen in v6.5.y and v6.4.y since the patch has been applied
>> to those branches.
> 
> Does this happens with CONFIG_SMP=n ?
> If so, I think the untested patch below might fix the issue.
> 

No, this is loongarch:defconfig with various debug options enabled.
That has CONFIG_SMP=y.

Guenter

> Helge
> 
> ---
> 
> [PATCH] loogarch: Keep PERCPU section in init section even for !CONFIG_SMP
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/loongarch/kernel/vmlinux.lds.S b/arch/loongarch/kernel/vmlinux.lds.S
> index b1686afcf876..32d61e931cdc 100644
> --- a/arch/loongarch/kernel/vmlinux.lds.S
> +++ b/arch/loongarch/kernel/vmlinux.lds.S
> @@ -99,9 +99,7 @@ SECTIONS
>   		EXIT_DATA
>   	}
>   
> -#ifdef CONFIG_SMP
>   	PERCPU_SECTION(1 << CONFIG_L1_CACHE_SHIFT)
> -#endif
>   
>   	.init.bss : {
>   		*(.init.bss)

