Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292781C5A84
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 17:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5895B6E5D3;
	Tue,  5 May 2020 15:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823C96E5D3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 15:08:04 +0000 (UTC)
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MlNYj-1iqvGx3Alx-00llie for <dri-devel@lists.freedesktop.org>; Tue, 05
 May 2020 17:08:02 +0200
Received: by mail-qk1-f174.google.com with SMTP id g185so2579107qke.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 08:08:02 -0700 (PDT)
X-Gm-Message-State: AGi0PuY+lxT6nJ8ZYZE/s1NdtWAoMo/8pij8Nck7wBWL+Y6d01rOIf4X
 fXBSAb+In6NZ2SFZFhqRqZTCtqb5QWVS/xiIdH0=
X-Google-Smtp-Source: APiQypLiOT+7IwI9rxENX6COgKMKWkszRH1A8ioRyBipPnDvFINtZDeTAFba6U/nOjaK75OsthpNiD3Px61PZ644fKk=
X-Received: by 2002:a37:b543:: with SMTP id e64mr3963064qkf.394.1588691281639; 
 Tue, 05 May 2020 08:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140407.373983-1-arnd@arndb.de>
 <CANpmjNNw6M9Gqj6WGTHH4Cegu8roTVu5x6Vqs_tCBxX3gPwL4A@mail.gmail.com>
In-Reply-To: <CANpmjNNw6M9Gqj6WGTHH4Cegu8roTVu5x6Vqs_tCBxX3gPwL4A@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 5 May 2020 17:07:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a01jV71_EzaCkaZgG51vnJ+x1c192dZ9efEKTawF6noDQ@mail.gmail.com>
Message-ID: <CAK8P3a01jV71_EzaCkaZgG51vnJ+x1c192dZ9efEKTawF6noDQ@mail.gmail.com>
Subject: Re: [PATCH] omapfb: don't annotate dss_conv_list as __initdata
To: Marco Elver <elver@google.com>
X-Provags-ID: V03:K1:rR4dzF9ZDBEkyhDNvBGktKFP6zypZ5lnGj04rKw8KCYtkqruYsq
 6u40ciXvCN71ROb5Y2RMKSJz29vj/hv4+6W1ihfJqucBBD0sE+PFWefkrrxx+MCb0NEpQMw
 NgnVblvJbSNCsE22ez8UwDpT1hGKpZjSWZw1tN9JtCsHvFFtDAPRmcGtzr5nmA+d5wX/DQl
 0yCARmnhx3xlnrOJ7/Xig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:skjzpCXL0wg=:PdgvrgEa8Kg8lZ2xuHs5A6
 adeJoaQFcndHBZM0WzJhwSWRGlYVbaPm8L7VM9o/InzC6xszc5ZIpX4G6jA92k7t67deh79vJ
 iwUwjdSFRiFqGyUESJWXTKBFYgBA5lpX71ermYPgYq3YrqtCfTaxGjj0P5isYPjNG0P5CgsMT
 L4rodu78hWKDX1W/fWY6a3Z1UIcU3h57YKue6xhio/98r8Mi+3HFaDgJU2EZoEbbwxsk5Brkr
 /qyHKGS6i3kaTGWvJ7MBXfZUIot5S2hWJAiCZZy8tnxg34La0D5mAC3tOXcs2RxngWt0ZBCgH
 CVOKvb3dOJUdnfU3mQzMy1DIYWNBwH87AlUg9TFQPST8Jov/akGnUB7+GSXQ8ArCfRbS86/CZ
 BX7yqYDJEr1vsIfTJSnSWMFlU5CwNy3gVxFEZ3D9NYgW5Ax7A3okmAh0p9fqxXMpQ6y0Raaf5
 OTiOVEE26PsGdm4C67b5cHZ0NZ4VH14pgywQKoEyMUGPKNJRo4IygWklus9mQ7POSRg7BHKD2
 kmJrewQxn+t53AoTRskrQnXFZY+AyzGgnrzXzv/t3aaoRDX8O9620SNFxqrMPd4mOlJkUMAW4
 Ntqm27CPqSe47g3l0h/v2FMQWnHmhc5guQf5dYchZuzqgcjvgPkG5gvcFPjmZbdENiCby5/N/
 PZ8yQ0AGAmtRfBiOJL4Pm8blt1bgf/t2UCvvdV+JvquL4Axxk+8/L5Hnzg6oVQi7wZa5nxQsh
 vefjTRKs3uzOKgKnpT7hUyqo8WRN3L2KqgqRTn6or1OvC7xXGYJ6OQTmKNP5T1zr60pmj/a05
 hSWH4qjQ5i0gtDxGoNRf+ZEoOheNT52O/fkwJWU/eJYnZgL848=
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
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexios Zavras <alexios.zavras@intel.com>, Will Deacon <will@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap <linux-omap@vger.kernel.org>,
 Enrico Weigelt <info@metux.net>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 5, 2020 at 4:12 PM 'Marco Elver' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
> On Tue, 5 May 2020 at 16:04, Arnd Bergmann <arnd@arndb.de> wrote:
> > With the kcsan changes, __read_once_size() is not inlined, but
> > clang can decide to emit a version that hardcodes the address, which
> > in turn triggers a warning for dss_conv_list being __initdata but
> > __read_once_size() not being __init:
> >
> > WARNING: modpost: vmlinux.o(.text+0x6e4d7a): Section mismatch in
> > reference from the function __read_once_size() to the variable
> > .init.data:dss_conv_list
> > The function __read_once_size() references
> > the variable __initdata dss_conv_list.
> > This is often because __read_once_size lacks a __initdata
> > annotation or the annotation of dss_conv_list is wrong.
> >
> > This is clearly a false positive warning, but it's hard to tell
> > who is to blame for it. Work around it by removing the __initdata
> > annotation, wasting the space of two pointers in return for getting
> > rid of the warning.
> >
> > Fixes: dfd402a4c4ba ("kcsan: Add Kernel Concurrency Sanitizer infrastructure")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> [+Cc Will]
>
> I think Will is working on a series that completely overhauls
> READ_ONCE/WRITE_ONCE, also getting rid of __read_once_size() in the
> process, which would make this patch redundant. If we can live with
> this warning until the new READ_ONCE/WRITE_ONCE gets merged, we can
> probably keep things as-is for now.

Ok, let's drop this one for now.

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
