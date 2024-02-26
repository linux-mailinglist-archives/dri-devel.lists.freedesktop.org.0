Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D157867FBB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 19:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424DC10E679;
	Mon, 26 Feb 2024 18:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MuSKjN2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E9B10E679
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 18:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708971785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cCyh1fS6CxovKv1gPz8IKomp8FTaiDcCxIal8qsZGls=;
 b=MuSKjN2QNZjiN4NQQwZNACrSoR3grQrNmV5gYPv47BnHopsZlCeBQcVBN7epzpE+lnTkIB
 77lr/IKY4Luwfwk6tAkkft7xP4m/eFLaprEVUO0YZKm66sFxYQcz5t8QM6rBAOLFTOCQ9Y
 6yHc3ODH0MC9GcJRZZJn7eDZjgdgw9k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-S4KTWm6OMRmcZNtmhoGohQ-1; Mon, 26 Feb 2024 13:23:03 -0500
X-MC-Unique: S4KTWm6OMRmcZNtmhoGohQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a3fcf5b93faso174733866b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 10:23:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708971783; x=1709576583;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cCyh1fS6CxovKv1gPz8IKomp8FTaiDcCxIal8qsZGls=;
 b=WD4j1NiQDdy7gsolurubmmOMMAKgl77iNranyLqdzZh1JRF7xunilxvqGlJBFYC4vi
 nMwhZIU03YE8RLkeZC4Dcp392akPv5SxDaxMF0v/WEVIOaePa1+cWYflU4YQyDqWRCLe
 EK3SZJRxKcxxw8/fImKo8DgkQKkYvyRPix07r/9fgtyVLSv6uDW/ZEcppa34zRDtEWX4
 s+nzCFayOSvEeV6do25Xm6igODTsyGmqDy6TM04ma4vUbF6j60ySu3lHu1shJinLxWpQ
 ZMhWmazZm1fIqAVViR83DIqQykHPoq5Ub7yDw00hfkx6raSwaYq3+MnELJdid8zXXJOt
 l6jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4iZzFI+2y+RWhW0Cf8voGqhIKMqo/u7uB49IdgZbGQg0pd1xrJn8TtCqsgKO8kZCtSLoPR/Ms0O2E0J590KgA5hxPrzR18Dzvv2KjTdx9
X-Gm-Message-State: AOJu0YyVwhrhIXFQgc1TeCUGOcu5d6bUyv3zBG4ItDwIQ51WwabMekdy
 HY6D9Tk4DnANweVNro8nXjleB+o8FnOBebMw9eyBsViwHs3PbIj0JcvowgLD/7/ciK/ulUdoblq
 WxmMcVlDcR35bO7BbNG6EiUDyCtZWskr7uQgjGuTo2Mz3/XduQz0QMo8MKoGqeIXDEg==
X-Received: by 2002:a17:906:2419:b0:a3e:f7ae:49b6 with SMTP id
 z25-20020a170906241900b00a3ef7ae49b6mr4646493eja.49.1708971782726; 
 Mon, 26 Feb 2024 10:23:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0xi5eTkheVkqPq6UtY8bISAGmavwy2kcsZ7HuesV1dnW2YMLuA1qidKdosRXmYke909YljQ==
X-Received: by 2002:a17:906:2419:b0:a3e:f7ae:49b6 with SMTP id
 z25-20020a170906241900b00a3ef7ae49b6mr4646480eja.49.1708971782421; 
 Mon, 26 Feb 2024 10:23:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a170906b18100b00a3f28bf94f8sm2648002ejy.199.2024.02.26.10.23.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 10:23:01 -0800 (PST)
Message-ID: <7817a2a2-b07d-4e9d-85e6-c11c5720d66e@redhat.com>
Date: Mon, 26 Feb 2024 19:23:01 +0100
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240202085408.23251-2-daniel.van.vugt@canonical.com>
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

Hi All,

On 2/2/24 09:53, Daniel van Vugt wrote:
> Until now, deferred console takeover only meant defer until there is
> output. But that risks stepping on the toes of userspace splash screens,
> as console messages may appear before the splash screen. So check for the
> "splash" parameter (as used by Plymouth) and if present then extend the
> deferral until the first switch.

Daniel, thank you for your patch but I do not believe that this
is the right solution. Deferring fbcon takeover further then
after the first text is output means that any errors about e.g.
a corrupt initrd or the kernel erroring out / crashing will not
be visible.

When the kernel e.g. oopses or panics because of not finding
its rootfs (I tested the latter option when writing the original
deferred fbcon takeover code) then fbcon must takeover and
print the messages from the dying kernel so that the user has
some notion of what is going wrong.

And since your patch seems to delay switching till the first
vc-switch this means that e.g. even after say gdm refusing
to start because of issues there still will be no text
output. This makes debugging various issues much harder.

Moreover Fedora has been doing flickerfree boot for many
years without needing this.

The kernel itself will be quiet as long as you set
CONFIG_CONSOLE_LOGLEVEL_QUIET=3 Ubuntu atm has set this
to 4 which means any kernel pr_err() or dev_err()
messages will get through and since there are quite
a few false positives of those Ubuntu really needs
to set CONFIG_CONSOLE_LOGLEVEL_QUIET=3 to fix part of:
https://bugs.launchpad.net/bugs/1970069

After that it is "just" a matter of not making userspace
output anything unless it has errors to report.

systemd already is quiet by default (only logging
errors) when quiet is on the kernel commandline.

So any remaining issues are Ubuntu specific boot
process bits and Ubuntu really should be able to
make those by silent unless they have important
info (errors or other unexpected things) to report.

Given that this will make debugging boot issues
much harder and that there are other IMHO better
alternatives I'm nacking this patch: NACK.

FWIW I believe that I'm actually saving Ubuntu
from shooting themselves in the foot here,
hiding all sort of boot errors (like the initrd
not finding /) until the user does a magic
alt+f2 followed by alt+f1 incantation really is
not doing yourself any favors wrt debugging any
sort of boot failures.

Regards,

Hans





> Closes: https://bugs.launchpad.net/bugs/1970069
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
> ---
>  drivers/video/fbdev/core/fbcon.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 63af6ab034..5b9f7635f7 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -76,6 +76,7 @@
>  #include <linux/crc32.h> /* For counting font checksums */
>  #include <linux/uaccess.h>
>  #include <asm/irq.h>
> +#include <asm/cmdline.h>
>  
>  #include "fbcon.h"
>  #include "fb_internal.h"
> @@ -146,6 +147,7 @@ static inline void fbcon_map_override(void)
>  
>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>  static bool deferred_takeover = true;
> +static int initial_console = -1;
>  #else
>  #define deferred_takeover false
>  #endif
> @@ -3341,7 +3343,7 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
>  	console_unlock();
>  }
>  
> -static struct notifier_block fbcon_output_nb;
> +static struct notifier_block fbcon_output_nb, fbcon_switch_nb;
>  static DECLARE_WORK(fbcon_deferred_takeover_work, fbcon_register_existing_fbs);
>  
>  static int fbcon_output_notifier(struct notifier_block *nb,
> @@ -3358,6 +3360,21 @@ static int fbcon_output_notifier(struct notifier_block *nb,
>  
>  	return NOTIFY_OK;
>  }
> +
> +static int fbcon_switch_notifier(struct notifier_block *nb,
> +				 unsigned long action, void *data)
> +{
> +	struct vc_data *vc = data;
> +
> +	WARN_CONSOLE_UNLOCKED();
> +
> +	if (vc->vc_num != initial_console) {
> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
> +		dummycon_register_output_notifier(&fbcon_output_nb);
> +	}
> +
> +	return NOTIFY_OK;
> +}
>  #endif
>  
>  static void fbcon_start(void)
> @@ -3370,7 +3387,14 @@ static void fbcon_start(void)
>  
>  	if (deferred_takeover) {
>  		fbcon_output_nb.notifier_call = fbcon_output_notifier;
> -		dummycon_register_output_notifier(&fbcon_output_nb);
> +		fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
> +		initial_console = fg_console;
> +
> +		if (cmdline_find_option_bool(boot_command_line, "splash"))
> +			dummycon_register_switch_notifier(&fbcon_switch_nb);
> +		else
> +			dummycon_register_output_notifier(&fbcon_output_nb);
> +
>  		return;
>  	}
>  #endif
> @@ -3417,8 +3441,10 @@ void __exit fb_console_exit(void)
>  {
>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>  	console_lock();
> -	if (deferred_takeover)
> +	if (deferred_takeover) {
>  		dummycon_unregister_output_notifier(&fbcon_output_nb);
> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
> +	}
>  	console_unlock();
>  
>  	cancel_work_sync(&fbcon_deferred_takeover_work);

