Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234EC235370
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 18:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C926EB94;
	Sat,  1 Aug 2020 16:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43AA6EB94
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 16:37:00 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id bo3so11806848ejb.11
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Aug 2020 09:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7nWoFZS16KHN7ELInZM3NkAqbsw8HmgfQtV5PkaAdOs=;
 b=sLJ2YymDgCE2aYqkgcFgGI6naddEomHT1AI/LblO1I2CIpKzR/X4HC0D8kFfsN6b+L
 XCYiypkgq9U/ws9p617+waX57F8r3r9xw2IEJINKnzTBI1kuSBY9ijEvHwlcNtuSjqeZ
 Hc2tgLSldiumX+1XnZPsDgJMdf1x61SK6XNyMc3TiFxkjVUQDHk06pK8LV6TXULby89E
 Q+sc+6B4I8vfJLc3o9x4Nzoa4qysw9eANsa9JKWVrWyM3DFMjubaz5YpI0uzS2O4ob16
 LSXsaZKRopTp92npa1jce/IFsU1kV5YolRnKSOBrqMK/vKjOiSQ1Nztp40qAyj1R/fd9
 WV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7nWoFZS16KHN7ELInZM3NkAqbsw8HmgfQtV5PkaAdOs=;
 b=Gj04c3f1PyPRM5XOrf1/NvMn0DRIByS82o0Mx88+4K9cfgkNzMMrWaSkl9Hi4mqB/L
 jv6BkSNcIt/FuSDer50CJQDcsh0k6rG/UgHQyywqk3N9rtRsuD/s/CPML4DBSUn8rlvQ
 dKt9accdkYp/nJb505K62KKOq22cEUqfOMcjhbft+4AaKdaRdnN9NQw6L0u6tLU3zo6p
 ds3dPddtM6vk/ZlwKofgDdu8q2WXwZkkljlwo5znJCpVqXjlBTmwMPpjK/3z6x5iaBfz
 uP/mvn6VS4nVqxR8+RRug+R/4rJXWtxDxgnzFNYEuRlj4wBdYHNUthQGdJaRYzodjBHh
 N7lQ==
X-Gm-Message-State: AOAM532YS/oOZrEDKZtKZZZomfsmcv0jyoyjjLJKQQdO9UjILGs0W20y
 8hX6GCahFSa9cAa0OJshU0q9nXGNOy1eWB3MCsJvjA==
X-Google-Smtp-Source: ABdhPJxOFGsY8qnjWmioIMQMzSoQMpAmcXHTZevYKI2hHLGadP9/WqNGAW9biPUhi7/KRXBONqPTrbpeIRc4H0g10M8=
X-Received: by 2002:a17:907:72c8:: with SMTP id
 du8mr9038155ejc.237.1596299819131; 
 Sat, 01 Aug 2020 09:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <159625229779.3040297.11363509688097221416.stgit@dwillia2-desk3.amr.corp.intel.com>
 <159625231266.3040297.2759117253481288037.stgit@dwillia2-desk3.amr.corp.intel.com>
 <545078f8-d6d3-5db7-02f6-648218513752@infradead.org>
In-Reply-To: <545078f8-d6d3-5db7-02f6-648218513752@infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 1 Aug 2020 09:36:48 -0700
Message-ID: <CAPcyv4iUtQ1Edau5e7GQumu1MxcAvorSNwnw9HGhzFDNuBS7=Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/23] x86/numa: Add 'nohmat' option
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Joao Martins <joao.m.martins@oracle.com>, X86 ML <x86@kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vishal L Verma <vishal.l.verma@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-nvdimm <linux-nvdimm@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 31, 2020 at 8:51 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 7/31/20 8:25 PM, Dan Williams wrote:
> > Disable parsing of the HMAT for debug, to workaround broken platform
> > instances, or cases where it is otherwise not wanted.
> >
> > ---
> >  arch/x86/mm/numa.c       |    2 ++
> >  drivers/acpi/numa/hmat.c |    8 +++++++-
> >  include/acpi/acpi_numa.h |    8 ++++++++
> >  3 files changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index 87c52822cc44..f3805bbaa784 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -41,6 +41,8 @@ static __init int numa_setup(char *opt)
> >               return numa_emu_cmdline(opt + 5);
> >       if (!strncmp(opt, "noacpi", 6))
> >               disable_srat();
> > +     if (!strncmp(opt, "nohmat", 6))
> > +             disable_hmat();
>
> Hopefully that will be documented in
> Documentation/x86/x86_64/boot-options.rst.

Sorry, yes, you gave that feedback before. I can do a quick respin
with this and the kbuild-robot compile fixups.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
