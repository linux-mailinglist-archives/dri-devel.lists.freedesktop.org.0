Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A02830BBC5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 11:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFD36E928;
	Tue,  2 Feb 2021 10:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47DC6E0EB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 10:09:25 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id u11so12167576plg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 02:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FYeJLFgukpjjaiX0ohZ3jkdwwwc8rHopLauzuSIyIdw=;
 b=tV+v78ppPBh5j1qozvGytXqYRH3YTJdedkA+I8BKPM/+ZtmYvrTzBWbeVfXbArKUSM
 iN4DyO4rLEKMayZ/QM19bmkFz6e2qX/7WaBp+PIDYEig7nWtknkexxzua6XvFhgpHqne
 lMEJZfTOQk7alc33ttk1hifGy5+zTtIrFKaHTSf6mg9Tfz5AO0tqYi4erZkvNM02mM7F
 34qhUEHyyimt6uvazTjZyHv98SSh3Jyu5L4GyjX35aHc1AQuPb7R2MgE/5cvZaUS1c2/
 oW/pTvabA1T2TAr4fqG1xQ9yyF5eenOs5p6igNbRJQAuRb/uXxQJoOvzreh2AVCzW5ld
 4Zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FYeJLFgukpjjaiX0ohZ3jkdwwwc8rHopLauzuSIyIdw=;
 b=nWChNDl6HySaPCJ1Cv9PhGeWAq4jovxpJpy7wgE/egf7qwTomo0e2HAI2wdLt7jfoz
 aYjURTMpRFzreUdjPNhSiS1BasApVHYCf/1rr+uiDMv6neFNvRkCGGS3vLXUc40qFrnj
 y+HVnLyEt2BGWB0xIo3KgZXUBdg7iSkuYGMUqWQi/4yVZDZ/z4PBj7YO1D6XTdG/t/yP
 Na0aDXHcmjBskG/v8sNPwDtu38xxtsDpBQukJOAqUj3KRzY8NtdEaRBVirM49w5O/3mb
 cggDaHdN9zWzhoet9BiAgHFJ0NHkNMK0Dd44IcKySVjY4h0U78GOpIKyOcMTlkOeDiId
 YqOQ==
X-Gm-Message-State: AOAM532fykO/6N3A6t3hxcd/mSFJMOkZo///s1LarsVW4BZC/J0AnOSz
 A9vvwuyRaTXth7mgeFPlUsA=
X-Google-Smtp-Source: ABdhPJzOiwWh5mPPYa1i19XPG4Fp5MvPpEcfOWz0ooMRC2HOki3phGTorM9UmMcRGoRVm4K5OTM51w==
X-Received: by 2002:a17:90a:d02:: with SMTP id
 t2mr3397288pja.130.1612260565335; 
 Tue, 02 Feb 2021 02:09:25 -0800 (PST)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id l2sm21403893pga.65.2021.02.02.02.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 02:09:24 -0800 (PST)
Date: Tue, 2 Feb 2021 19:09:21 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 1/3] printk: use CONFIG_CONSOLE_LOGLEVEL_* directly
Message-ID: <YBkk0cZXdwYdXIcD@jagdpanzerIV.localdomain>
References: <20210202070218.856847-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202070218.856847-1-masahiroy@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Russ Anderson <russ.anderson@hpe.com>, Steve Wahl <steve.wahl@hpe.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Peter Jones <pjones@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Petr Mladek <pmladek@suse.com>,
 John Ogness <john.ogness@linutronix.de>, Mike Travis <mike.travis@hpe.com>,
 Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On (21/02/02 16:02), Masahiro Yamada wrote:
> 
> CONSOLE_LOGLEVEL_DEFAULT is nothing more than a shorthand of
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT.
> 
> When you change CONFIG_CONSOLE_LOGLEVEL_DEFAULT from Kconfig, almost
> all objects are rebuilt because CONFIG_CONSOLE_LOGLEVEL_DEFAULT is
> used in <linux/printk.h>, which is included from most of source files.
> 
> In fact, there are only 4 users of CONSOLE_LOGLEVEL_DEFAULT:
> 
>   arch/x86/platform/uv/uv_nmi.c
>   drivers/firmware/efi/libstub/efi-stub-helper.c
>   drivers/tty/sysrq.c
>   kernel/printk/printk.c
> 
> So, when you change CONFIG_CONSOLE_LOGLEVEL_DEFAULT and rebuild the
> kernel, it is enough to recompile those 4 files.

Do you change CONFIG_CONSOLE_LOGLEVEL_DEFAULT so often that it becomes a
problem?

	-ss
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
