Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B966730E529
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 22:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50596E57E;
	Wed,  3 Feb 2021 21:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0116E57E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 21:52:13 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 113LpkfL015373
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Feb 2021 06:51:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 113LpkfL015373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1612389107;
 bh=gxgjcR0VEeZAZf1rRpSkG8b/Bi8s2o6fMLa0IvUA9lw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m8YX4O0ILm07ceuK5fotq4uY3K1hAC5ptJnoW/XxUW9j/FOFfRWgmXqWK2pF4kSRY
 4L+fB30NvHjrsFwew2rRy7cFbU3phsYIDhTUChcaf6G3eSioxTg0vL6rH4L65ZYLmT
 lz94outN2VEfVM9wget8Gd7fyhP75NCUuuRRltnOaYTm33ePYZq6JljjVBZK6k3iZl
 3ap3wl9kfMRsGrDugDGg9SYkc5ORYZDxbd775RD15YXafXAVy4IK760wiJDiB0jNk6
 ehrI5u1as17AjgQbBmj8OtK9khhGP8T+iYvA42Yow+UzzxKzQu5AGheonRWWDzVWiT
 +HiLyq5jRddPQ==
X-Nifty-SrcIP: [209.85.210.179]
Received: by mail-pf1-f179.google.com with SMTP id e19so701822pfh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 13:51:47 -0800 (PST)
X-Gm-Message-State: AOAM532tvxGU7/axekAGk6l3hhACqttEKhmMN9uyiTSbJ55yK15V+/MO
 ViqApq1ieq2P2hYDN3YC16/n6uuEoxS6f4YPmLA=
X-Google-Smtp-Source: ABdhPJx/LaBTQoB963qFg1P+igJksCCKE8Z041HxDmq3/pC0hBJHBlx2ThcrSaLxlu5UdkfwoNWPTs8TPJ6pU3GFLI0=
X-Received: by 2002:a63:575e:: with SMTP id h30mr5652383pgm.7.1612389106322;
 Wed, 03 Feb 2021 13:51:46 -0800 (PST)
MIME-Version: 1.0
References: <20210202070218.856847-1-masahiroy@kernel.org>
 <87eehy27b5.fsf@jogness.linutronix.de> <YBq/2ojccc4ZZp9y@alley>
In-Reply-To: <YBq/2ojccc4ZZp9y@alley>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 4 Feb 2021 06:51:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQyV-asWNY6CK6MWze9sFZS3CgXxtH2LEht5e=kjrLu7w@mail.gmail.com>
Message-ID: <CAK7LNAQyV-asWNY6CK6MWze9sFZS3CgXxtH2LEht5e=kjrLu7w@mail.gmail.com>
Subject: Re: [PATCH 1/3] printk: use CONFIG_CONSOLE_LOGLEVEL_* directly
To: Petr Mladek <pmladek@suse.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>, Russ Anderson <russ.anderson@hpe.com>,
 Steve Wahl <steve.wahl@hpe.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, Peter Jones <pjones@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Jiri Slaby <jirislaby@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, X86 ML <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
 John Ogness <john.ogness@linutronix.de>, Mike Travis <mike.travis@hpe.com>,
 Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 12:23 AM Petr Mladek <pmladek@suse.com> wrote:
>
> On Tue 2021-02-02 09:44:22, John Ogness wrote:
> > On 2021-02-02, Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > CONSOLE_LOGLEVEL_DEFAULT is nothing more than a shorthand of
> > > CONFIG_CONSOLE_LOGLEVEL_DEFAULT.
> > >
> > > When you change CONFIG_CONSOLE_LOGLEVEL_DEFAULT from Kconfig, almost
> > > all objects are rebuilt because CONFIG_CONSOLE_LOGLEVEL_DEFAULT is
> > > used in <linux/printk.h>, which is included from most of source files.
> > >
> > > In fact, there are only 4 users of CONSOLE_LOGLEVEL_DEFAULT:
> > >
> > >   arch/x86/platform/uv/uv_nmi.c
> > >   drivers/firmware/efi/libstub/efi-stub-helper.c
> > >   drivers/tty/sysrq.c
> > >   kernel/printk/printk.c
> > >
> > > So, when you change CONFIG_CONSOLE_LOGLEVEL_DEFAULT and rebuild the
> > > kernel, it is enough to recompile those 4 files.
> > >
> > > Remove the CONSOLE_LOGLEVEL_DEFAULT definition from <linux/printk.h>,
> > > and use CONFIG_CONSOLE_LOGLEVEL_DEFAULT directly.
> >
> > With commit a8fe19ebfbfd ("kernel/printk: use symbolic defines for
> > console loglevels") it can be seen that various drivers used to
> > hard-code their own values. The introduction of the macros in an
> > intuitive location (include/linux/printk.h) made it easier for authors
> > to find/use the various available printk settings and thresholds.
> >
> > Technically there is no problem using Kconfig macros directly. But will
> > authors bother to hunt down available Kconfig settings? Or will they
> > only look in printk.h to see what is available?
> >
> > IMHO if code wants to use settings from a foreign subsystem, it should
> > be taking those from headers of that subsystem, rather than using some
> > Kconfig settings from that subsystem. Headers exist to make information
> > available to external code. Kconfig (particularly for a subsystem) exist
> > to configure that subsystem.
>
> I agree with this this view.


I have never seen a policy to restrict
the use of CONFIG options in relevant
subsystem headers.



> What about using default_console_loglevel() in the external code?
> It reads the value from an array. This value is initialized to
> CONSOLE_LOGLEVEL_DEFAULT and never modified later.

I do not think default_console_loglevel()
is a perfect constant
because it can be modified via
/proc/sys/kernel/printk


I am not sure if it works either.

Some code may not be linked to vmlinux.
drivers/firmware/efi/libstub/efi-stub-helper.c




> Best Regards,
> Petr




--
Best Regards
Masahiro Yamada
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
