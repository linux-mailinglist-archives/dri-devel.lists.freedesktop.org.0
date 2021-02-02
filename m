Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4203030CF97
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 00:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623A76E12E;
	Tue,  2 Feb 2021 23:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 57583 seconds by postgrey-1.36 at gabe;
 Tue, 02 Feb 2021 23:05:03 UTC
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989516E9BA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 23:05:03 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 112N4kjv000730
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Feb 2021 08:04:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 112N4kjv000730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1612307086;
 bh=UGA0Rplim8ZfC6e4whP20xTht9RzqhbWWxLaXhzWRUA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tOBe0hEHHf9tvmT3rHNnjBL9ugZuudIECWVtYvCik/AC2pP1I4bqBET4RIJ/vBKSB
 0aRw/i7F91TD/PzkclnU2rVRXFMEw6JAzCx93I17/rKXeFG7l0py1WRGJG2fQCZQLj
 q99jD6spPDWOLAzyv0+yHJdvetuJ0mv8N9l2T+24C2KTXwMzAOnAFXBCq1xn8EfdZh
 EqvYL29bZ/OMZE6jEBXdHTulk62/GRSs0uLVCRks7bcTqFsH9kUUbnniWFdepR5nay
 nVRHIn7crbFdyzki6dQc69GxxIU1dobMhHCeavZav8fqc5flWT+QiFEmuYa9o3WH3Q
 4bzZRX2Ms/k9g==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id j11so10764499plt.11
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 15:04:46 -0800 (PST)
X-Gm-Message-State: AOAM530bVLyWqrmZaMWcB0sWlHVf2pOQ1b4Vc+AfYDjLoJA8OK0FW4Qv
 bUTz3fiJBgU7yJCSthgmOL4PrCnwZlPuORYjjTA=
X-Google-Smtp-Source: ABdhPJxvtHfeu+crGL+CyXAo0FUYVHkXnleiaiv+dMA4n8+oso6WU2K79gP3aD12VFT56j8XRv47GWHWmTyr4FAXNxk=
X-Received: by 2002:a17:90b:1b50:: with SMTP id
 nv16mr88481pjb.153.1612307085830; 
 Tue, 02 Feb 2021 15:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20210202070218.856847-1-masahiroy@kernel.org>
 <YBkk0cZXdwYdXIcD@jagdpanzerIV.localdomain>
In-Reply-To: <YBkk0cZXdwYdXIcD@jagdpanzerIV.localdomain>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 3 Feb 2021 08:04:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQh=bMuyEinKzr6t28E2TuSWAhYU=M+jeJ+HiNhjQN=3A@mail.gmail.com>
Message-ID: <CAK7LNAQh=bMuyEinKzr6t28E2TuSWAhYU=M+jeJ+HiNhjQN=3A@mail.gmail.com>
Subject: Re: [PATCH 1/3] printk: use CONFIG_CONSOLE_LOGLEVEL_* directly
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
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
 Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 Mike Travis <mike.travis@hpe.com>, Steven Rostedt <rostedt@goodmis.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 2, 2021 at 7:09 PM Sergey Senozhatsky
<sergey.senozhatsky@gmail.com> wrote:
>
> On (21/02/02 16:02), Masahiro Yamada wrote:
> >
> > CONSOLE_LOGLEVEL_DEFAULT is nothing more than a shorthand of
> > CONFIG_CONSOLE_LOGLEVEL_DEFAULT.
> >
> > When you change CONFIG_CONSOLE_LOGLEVEL_DEFAULT from Kconfig, almost
> > all objects are rebuilt because CONFIG_CONSOLE_LOGLEVEL_DEFAULT is
> > used in <linux/printk.h>, which is included from most of source files.
> >
> > In fact, there are only 4 users of CONSOLE_LOGLEVEL_DEFAULT:
> >
> >   arch/x86/platform/uv/uv_nmi.c
> >   drivers/firmware/efi/libstub/efi-stub-helper.c
> >   drivers/tty/sysrq.c
> >   kernel/printk/printk.c
> >
> > So, when you change CONFIG_CONSOLE_LOGLEVEL_DEFAULT and rebuild the
> > kernel, it is enough to recompile those 4 files.
>
> Do you change CONFIG_CONSOLE_LOGLEVEL_DEFAULT so often that it becomes a
> problem?
>
>         -ss



<linux/printk.h> is one of most included headers,
so it is worth downsizing.

CONSOLE_LOGLEVEL_DEFAULT is not such a parameter
that printk() users need to know.

Changing CONFIG_CONSOLE_LOGLEVEL_DEFAULT results in
the rebuilds of the entire tree, which is a flag of
bad code structure.

So, this is not only CONSOLE_LOGLEVEL_DEFAULT.
<linux/printk.h> contains parameters
and func declarations that printk() users
do not need to know.

Examples:
CONSOLE_LOGLEVEL_DEFAULT
log_buf_addr_get()
log_buf_len_get()
oops_in_progress
...


They are only needed for those who want
to more closely get access to
the printk internals.


Ideally, such parameters and func
declarations can go to the subsystems'
local header (kernel/printk/internal.h)
but when it is not possible,
they can be separated out to
a different header.


I can see a similar idea in the consumer/provider
model in several subsystems.

Consumers and providers are often orthogonal,
and de-coupling them clarifies
who needs what.

See other subsystems, for example,

<linux/clk.h>           -  clk consumer
<linux/clk-provider.h>  -  clk provider













--
Best Regards
Masahiro Yamada
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
