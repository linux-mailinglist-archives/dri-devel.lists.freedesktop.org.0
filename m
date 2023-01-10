Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3E664345
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 15:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA11A10E5D1;
	Tue, 10 Jan 2023 14:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C5C10E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 14:30:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55090B81686
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9631C433D2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673361040;
 bh=Ft5hewhBhdYXUka/gOOBMULEVYdfXdVyhTlVravny7Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KnXQ739qFhVa2dEopL68n2Ok09LxNVAZzrw+EdfgO37Yi/je0kbA4wRJYkaaJh+8W
 uHHL+fEq/ZAGaB+7YaCUSz+Ys2Qamw0N0nUqUxd1Nr31sRNRFtDv2X+BgqsjINK9en
 txfLtJdRqHIG/H0x9ZbdQQbZmZGsInlOJdpIrUbsyH8KS8EwelgtcnDv+dX16bJgRd
 M0xERXAEhcJ1J6HoMw94w0Uuf1TZ/XCI477E6ddUL2wyaDBboxnW0BoyvwoGJvEAea
 nXNO9w1p5ApK217xIcV0bKVtoSQKM0kUE+zMN7ku4rvjjiK1BhvKTv1facgYU2jGdz
 ldSGBGavalSYg==
Received: by mail-lf1-f52.google.com with SMTP id j17so18726847lfr.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 06:30:40 -0800 (PST)
X-Gm-Message-State: AFqh2koi+0hx399TL0ps6RGa4LLqyM2CP0YcEW8Kme8IjswVFVcER5Lk
 A8YNJsk3ev9xIVVeUtODWdUooUmQLVadt9XveTU=
X-Google-Smtp-Source: AMrXdXsGCXl5imR+5Ag+UULiUqPiN2NPwCkctr1I4ZqlLYeykxjkAncZBtoJoiKqIgfFw96YRojd4uts4JLGGCzJdSA=
X-Received: by 2002:a05:6512:3d93:b0:4b8:9001:a694 with SMTP id
 k19-20020a0565123d9300b004b89001a694mr3292555lfv.426.1673361038907; Tue, 10
 Jan 2023 06:30:38 -0800 (PST)
MIME-Version: 1.0
References: <20221221105402.6598-1-markuss.broks@gmail.com>
 <CAMj1kXGUC7dsSwVEUsAMeAoqDYtbqrM7SDOJTXbPfi-LrcSk9g@mail.gmail.com>
 <Y6xMnuMqpThmFn1q@smile.fi.intel.com>
In-Reply-To: <Y6xMnuMqpThmFn1q@smile.fi.intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 10 Jan 2023 15:30:27 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFtmK0jOt1Boeb6t=DoyVg6xWgCMVEB59jCm8zz7XcNAA@mail.gmail.com>
Message-ID: <CAMj1kXFtmK0jOt1Boeb6t=DoyVg6xWgCMVEB59jCm8zz7XcNAA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add generic framebuffer support to EFI earlycon
 driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 Markuss Broks <markuss.broks@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kim Phillips <kim.phillips@amd.com>,
 Will Deacon <will@kernel.org>, Jami Kettunen <jami.kettunen@protonmail.com>,
 linux-serial@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Borislav Petkov <bp@suse.de>, Jiri Slaby <jirislaby@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Dec 2022 at 15:04, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Dec 23, 2022 at 03:42:33PM +0100, Ard Biesheuvel wrote:
> > (cc Andy)
>
> I believe there are two reasons I'm Cc'ed now:
> - the Cc was forgotten. because I remember reviewing some parts
>   of this contribution
> - this conflicts (to some extent) with my patch that speeds up
>   the scrolling
>
> For the first it's obvious what to do, I think Markuss can include me
> in his v4.
>
> For the second I don't see the functional clash. The scrolling in this
> series is not anyhow optimized. I think my patch should go first as
> - it is less intrusive
> - it has been tested, or can be tested easily
>
> Tell me if I'm missing something here.
>

Thanks for your input.
