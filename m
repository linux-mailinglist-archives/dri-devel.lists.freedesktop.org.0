Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB52A8693A2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 14:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF7A10E0E3;
	Tue, 27 Feb 2024 13:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ezYz7Fw3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5081A10E0E8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709041639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTVBC0lkZuIsWB3rrhjB8rqd7JwC06vqd7+76BYU8ms=;
 b=ezYz7Fw3t3tTBNX1V6aRqlnALqblL4K9+X6eyyhSPulEbEgryJkoRzNRBnyZYQh3UMN160
 QR7Z1X7xPhsMBxxeraza0QyIbeDJTGLhujVYFKrS22F1VmYdumBrPTa5vKq7N+wPK0grvC
 Utj+CkRctf1b/JwOlANDs88Iee+DOMw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-uVYm7KeyNjurnOQLgIST-Q-1; Tue, 27 Feb 2024 08:47:17 -0500
X-MC-Unique: uVYm7KeyNjurnOQLgIST-Q-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2d240155a45so34542391fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 05:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709041636; x=1709646436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hTVBC0lkZuIsWB3rrhjB8rqd7JwC06vqd7+76BYU8ms=;
 b=P3M4bdJyFvS4bBV/GMiF1jhv+uYR7QOmibVe63plNJu0u/S9rmMhRQjwAkJGsCwQXE
 PptNnFhKa5t/yGbhC3QU0imk8H5mQwutE/GAgTj2XVHVdgmzVnddQ9SHe/SodGnCkLSD
 /WDFZdqIz+h5s2s6zjhqU8Y5l7n0LcWgaxhAixZGdDmg86CdoUYyCx0HX3fDYJGhZ7PH
 V4MweIFmE6y6BqR3uIWdvD1yLvqRO0qDV5ljHZK/XHA2t5oKRydt2EC5mmCVZ8ctSXQC
 mDGcG+V3QnhFC4UsFYLOo4fb++1W63bwnzpamMUpQIY8xTovVAlj5Q7/UcWOZKGaYWjE
 WUkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZmh00LXVdKVlC6jjLDjjyDP6Yq56WrEmJX56IymyOY8lVDZSHsuBJ8fOI+zLuiwK0QfcFxoPo3BHgPeK1RkLS1eLIWX7OG8YZXjob9KAy
X-Gm-Message-State: AOJu0Yy0RkUDyFb7NgmBepaz/Pt59ObEx4rHQDgTgC4ls9rq/1Oer8z6
 zWCz+di3BpEgnn/1nN9+wqX16M5WS6W1eWa9oHr1c8gYK8IMz28mff/Y/m173NA2w0FdJ/b/owu
 gJ6gfY7fphQD0GFNJ2jvjuV4ElG52jq24MyUPtEmospz4Jrjm5Ph9FAjZRDoiqIYJ3A==
X-Received: by 2002:ac2:5d24:0:b0:512:e4f4:b562 with SMTP id
 i4-20020ac25d24000000b00512e4f4b562mr5674290lfb.31.1709041636293; 
 Tue, 27 Feb 2024 05:47:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLf7Vwour/XjLoxR2iw6tIoak85hY2uSnJmHhcKtZd8K/kuXb6PkldJJSdOoGoEaALcMMGrQ==
X-Received: by 2002:ac2:5d24:0:b0:512:e4f4:b562 with SMTP id
 i4-20020ac25d24000000b00512e4f4b562mr5674270lfb.31.1709041635850; 
 Tue, 27 Feb 2024 05:47:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 xa9-20020a170907b9c900b00a3e7a2d9ac4sm783359ejc.6.2024.02.27.05.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 05:47:15 -0800 (PST)
Message-ID: <f3cdd944-5e68-49e5-bae8-4bc1f9f59131@redhat.com>
Date: Tue, 27 Feb 2024 14:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fbcon: Defer console takeover for splash screens to
 first switch
To: Daniel van Vugt <daniel.van.vugt@canonical.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Jani Nikula <jani.nikula@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sebastien Bacher <seb128@ubuntu.com>
References: <20240202085408.23251-1-daniel.van.vugt@canonical.com>
 <20240202085408.23251-2-daniel.van.vugt@canonical.com>
 <7817a2a2-b07d-4e9d-85e6-c11c5720d66e@redhat.com>
 <39ffe230-36ac-484a-8fc1-0a12d6c38d82@canonical.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <39ffe230-36ac-484a-8fc1-0a12d6c38d82@canonical.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/27/24 02:06, Daniel van Vugt wrote:
> On 27/2/24 02:23, Hans de Goede wrote:
>> Hi All,
>>
>> On 2/2/24 09:53, Daniel van Vugt wrote:
>>> Until now, deferred console takeover only meant defer until there is
>>> output. But that risks stepping on the toes of userspace splash screens,
>>> as console messages may appear before the splash screen. So check for the
>>> "splash" parameter (as used by Plymouth) and if present then extend the
>>> deferral until the first switch.
>>
>> Daniel, thank you for your patch but I do not believe that this
>> is the right solution. Deferring fbcon takeover further then
>> after the first text is output means that any errors about e.g.
>> a corrupt initrd or the kernel erroring out / crashing will not
>> be visible.
> 
> That's not really correct. If a boot failure has occurred after the splash then
> pressing escape shows the log.

Hmm, I guess this is with the latest plymouth which has a builtin terminal
emulator for kernels without VT support ? Pressing ESC does not to a VC
switch and AFAICT that is what you are triggering on to allow fbcon takeover
after this patches.

> If a boot failure has occurred before the splash
> then it can be debugged visually by rebooting without the "splash" parameter.

Which requires the user to know this and requires the user to know how to
edit kernel cmdline parameters in e.g. grub. This is not a good user
experience. We want inexperienced users to just be able to point
a phone camera at the screen and take a picture of the errors.


>> When the kernel e.g. oopses or panics because of not finding
>> its rootfs (I tested the latter option when writing the original
>> deferred fbcon takeover code) then fbcon must takeover and
>> print the messages from the dying kernel so that the user has
>> some notion of what is going wrong.
> 
> Indeed, just reboot without the "splash" parameter to do that.

Again not something beginning Linux users will be able to do,
what happened to "Ubuntu: Linux for Human Beings" ?

>> And since your patch seems to delay switching till the first
>> vc-switch this means that e.g. even after say gdm refusing
>> to start because of issues there still will be no text
>> output. This makes debugging various issues much harder.
> 
> I've debugged many gdm failures and it is never useful to use the console for
> those. Reboot and get the system journal instead.

But users will not see any errors now, meaning they don't
even know where to begin with troubleshooting ...

>> Moreover Fedora has been doing flickerfree boot for many
>> years without needing this.
> 
> I believe Fedora has a mostly working solution, but not totally reliable, as
> mentioned in the commit message:
> 
> "even systems whose splash exists in initrd may not be not immune because they
>  still rely on racing against all possible kernel messages that might
>  trigger the fbcon takeover"

Only very serious kernel errors like oopses or panics will
trigger the takeover and that is *exactly* what we want.

There is a race where plymouth may hide such vary serious
messages, if plymouth does manage to start before the errors,
but that is actually an existing issue which we don't want
to make bigger by *always* hiding such errors.

>> The kernel itself will be quiet as long as you set
>> CONFIG_CONSOLE_LOGLEVEL_QUIET=3 Ubuntu atm has set this
>> to 4 which means any kernel pr_err() or dev_err()
>> messages will get through and since there are quite
>> a few false positives of those Ubuntu really needs
>> to set CONFIG_CONSOLE_LOGLEVEL_QUIET=3 to fix part of:
>> https://bugs.launchpad.net/bugs/1970069
> 
> Incorrect. In my testing some laptops needed log level as low as 2 to go quiet.
> And the Ubuntu kernel team is never going to fix all those for non-sponsored
> devices.

Notice that atm Ubuntu's kernel is using the too high
CONFIG_CONSOLE_LOGLEVEL_QUIET=4 with
CONFIG_CONSOLE_LOGLEVEL_QUIET=3 getting any errors logged
to the console should be very very rare.

The only thing I can think of is if the kernel oopses
/ WARN()s early on but the cause is innocent enough
that the boot happily continues.

In that case actually showing the oops/WARN() is a good
thing.

For all the years Fedora has had flickerfree boot I have
seen zero bug reports about this. If you have examples
of this actually being a problem please file bugs for
them (launchpad or bugzilla.kernel.org is fine) and
then lets take a look at those bugs and fix them.

These should be so rare that I'm not worried about this
becoming a never ending list of bugs (unlike pr_err() /
dev_err() messages of which there are simply too many).

>> After that it is "just" a matter of not making userspace
>> output anything unless it has errors to report.
>>
>> systemd already is quiet by default (only logging
>> errors) when quiet is on the kernel commandline.
> 
> Unfortunately not true for Ubuntu. We carry a noisy systemd patch which I'm
> told we can't remove in the short term:
> 
> https://bugs.launchpad.net/ubuntu/+source/plymouth/+bug/1970069/comments/39

Well then make the patch less noisy? Suppressing non
error message unless in debug mode should be easy
even with a downstream patch.

> Thanks for your input, but I respectfully disagree and did consider these
> points already.

Sorry, but your real problem here seems to be your
noisy downstream systemd patch. I'm not going to ack
a kernel patch which I consider a bad idea because
Ubuntu has a non standard systemd patch which is
to trigger happy with spamming the console.

So this is still a NACK from me.

Regards,

Hans





>>> Closes: https://bugs.launchpad.net/bugs/1970069
>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
>>> ---
>>>  drivers/video/fbdev/core/fbcon.c | 32 +++++++++++++++++++++++++++++---
>>>  1 file changed, 29 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>>> index 63af6ab034..5b9f7635f7 100644
>>> --- a/drivers/video/fbdev/core/fbcon.c
>>> +++ b/drivers/video/fbdev/core/fbcon.c
>>> @@ -76,6 +76,7 @@
>>>  #include <linux/crc32.h> /* For counting font checksums */
>>>  #include <linux/uaccess.h>
>>>  #include <asm/irq.h>
>>> +#include <asm/cmdline.h>
>>>  
>>>  #include "fbcon.h"
>>>  #include "fb_internal.h"
>>> @@ -146,6 +147,7 @@ static inline void fbcon_map_override(void)
>>>  
>>>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>  static bool deferred_takeover = true;
>>> +static int initial_console = -1;
>>>  #else
>>>  #define deferred_takeover false
>>>  #endif
>>> @@ -3341,7 +3343,7 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
>>>  	console_unlock();
>>>  }
>>>  
>>> -static struct notifier_block fbcon_output_nb;
>>> +static struct notifier_block fbcon_output_nb, fbcon_switch_nb;
>>>  static DECLARE_WORK(fbcon_deferred_takeover_work, fbcon_register_existing_fbs);
>>>  
>>>  static int fbcon_output_notifier(struct notifier_block *nb,
>>> @@ -3358,6 +3360,21 @@ static int fbcon_output_notifier(struct notifier_block *nb,
>>>  
>>>  	return NOTIFY_OK;
>>>  }
>>> +
>>> +static int fbcon_switch_notifier(struct notifier_block *nb,
>>> +				 unsigned long action, void *data)
>>> +{
>>> +	struct vc_data *vc = data;
>>> +
>>> +	WARN_CONSOLE_UNLOCKED();
>>> +
>>> +	if (vc->vc_num != initial_console) {
>>> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>> +		dummycon_register_output_notifier(&fbcon_output_nb);
>>> +	}
>>> +
>>> +	return NOTIFY_OK;
>>> +}
>>>  #endif
>>>  
>>>  static void fbcon_start(void)
>>> @@ -3370,7 +3387,14 @@ static void fbcon_start(void)
>>>  
>>>  	if (deferred_takeover) {
>>>  		fbcon_output_nb.notifier_call = fbcon_output_notifier;
>>> -		dummycon_register_output_notifier(&fbcon_output_nb);
>>> +		fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
>>> +		initial_console = fg_console;
>>> +
>>> +		if (cmdline_find_option_bool(boot_command_line, "splash"))
>>> +			dummycon_register_switch_notifier(&fbcon_switch_nb);
>>> +		else
>>> +			dummycon_register_output_notifier(&fbcon_output_nb);
>>> +
>>>  		return;
>>>  	}
>>>  #endif
>>> @@ -3417,8 +3441,10 @@ void __exit fb_console_exit(void)
>>>  {
>>>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>  	console_lock();
>>> -	if (deferred_takeover)
>>> +	if (deferred_takeover) {
>>>  		dummycon_unregister_output_notifier(&fbcon_output_nb);
>>> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>> +	}
>>>  	console_unlock();
>>>  
>>>  	cancel_work_sync(&fbcon_deferred_takeover_work);
>>
> 

