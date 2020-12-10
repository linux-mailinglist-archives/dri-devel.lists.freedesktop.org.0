Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71B2D716A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D597F6ECBD;
	Fri, 11 Dec 2020 08:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CF46EB8F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 22:53:08 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id t3so5658483pgi.11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zBQoi+y+4cg9DRWgUXN6Y3g43b49pmfyTju9GNYCKF4=;
 b=epzIn+GXL2xRZiFKNb83yt/sZKjrnuGozJcvL/k80AHs0PRugs0pGECPcN2D9RowNT
 58Nhmq6dFyetuaMfuzBicYmWEJcy8s0mfzXuOW/y4KiBpODDkzEkx0P3nBscn8ObAc3G
 9tiBswgYOW02zj6RBuiAqE4MxgsJTGInqhGtTCZnYg9iW9Dvifj/6oIFFiZgH2ssgihR
 0GDl7FzdoPwYTxG0vlat13fiwoTgLXqu7kIV6F88i0L9vLd/I9pg//G/Bz8zuciuX8wC
 vV+80IUlysG/MJv8/esb//jT5YiWnCrZwizGwhrGshFrcM5dzoJtuMoyTpL+3b1ChI3N
 4Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBQoi+y+4cg9DRWgUXN6Y3g43b49pmfyTju9GNYCKF4=;
 b=LqQrYGxBsosEaJBdbjmIv4tcfxX1K2pkYkERSv2U4uInlzHMpsuHnoosRz4vqBETfP
 di9uJfspbX9Auqna23C5OaQitK5ovaZvDBaaflcvYlxFveii1Po4wswpltZickN8RoYT
 9Zk1PnHolKrClr4S4Tvi1Q9Fi7u26Zu6b4gNrW20t12+3wpS4QMWAqxqzUKElyT4+tN3
 Fss4oGEK8A93MSHkh3VvMHDTd2KFMY8K1JeLqs8piMNa/fXq0ocTuSxI922eRTl8r8v4
 YLL2DTeIhgVsaAlThDm/zFLjBUVXBlLPhEBcTEGS5UGXU2yPkRerBHf/adVAoYdG4sAs
 M6dA==
X-Gm-Message-State: AOAM531xDO580ANN+/n6f5oBcDfyfhvNEjcEhSqlAvp12ZudrRl9g1x3
 IYrmCdB4gKlG2+mSWVIp6i7ocyYmR6PG7Z55mMGeSA==
X-Google-Smtp-Source: ABdhPJzgefMVmMYXcnkmkyw3AtrI8LZGEeda1eBjFypE6N5QaXKz/jj1Uu0Kqqr80kBp5HLmJawUNjuOXvaPX6DFiZQ=
X-Received: by 2002:a17:90b:1b05:: with SMTP id
 nu5mr9889752pjb.101.1607640788371; 
 Thu, 10 Dec 2020 14:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20201204081349.1182302-1-arnd@kernel.org>
 <CADnq5_OmAVZGuz=xHRyST4hE4w1g10wNBQ6iMgfpQD16-9QSiQ@mail.gmail.com>
 <b9d7e33c-4dcd-0075-d0ca-d22b2488c354@amd.com>
 <CAK8P3a09KQS7S5-vJU7ECJh0HXUhwZW9zOOp4c32mtvM5XcU1g@mail.gmail.com>
 <CAKwvOd=-2zoc06EY4R9ZJ0M874bQv3NuT8a0q9=RoYeMMtnXVQ@mail.gmail.com>
 <CAK8P3a0gjPWiRX0yg=i6Qxgyo02AtQVVsw+=w-OvF956Tn=jDw@mail.gmail.com>
 <CAKwvOd=+w6vJvvq9Pwnv1EHHzwCx=o_=PbSozXpqryN6P1yxVQ@mail.gmail.com>
 <CAK8P3a2_0bY+fmUHKjH8XCKpT1BepUGOV0HoKDSPnOvtKjA==g@mail.gmail.com>
 <CAKwvOdmSzf7vFjjxWfvUR1FTeFoPToytQL_enR6CFXPCbUn8Gg@mail.gmail.com>
 <CAK8P3a0ViH90qvr63H4J5Qn0FMfV4r9CeTHurj3N2qO2f=Dq+Q@mail.gmail.com>
In-Reply-To: <CAK8P3a0ViH90qvr63H4J5Qn0FMfV4r9CeTHurj3N2qO2f=Dq+Q@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 10 Dec 2020 14:52:56 -0800
Message-ID: <CAKwvOd=AKjojWfsB6UJKyJNkNZE4duYzGzRHSF1PubxmUazpJg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: make DRM_AMD_DC x86-only again
To: Arnd Bergmann <arnd@kernel.org>
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:07 +0000
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
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Roman Li <Roman.Li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Mauro Rossi <issor.oruam@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Kolesa <daniel@octaforge.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 8, 2020 at 2:18 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Tue, Dec 8, 2020 at 7:21 PM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > On Tue, Dec 8, 2020 at 6:26 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > On Mon, Dec 7, 2020 at 11:28 PM 'Nick Desaulniers' via Clang Built
> > > Linux <clang-built-linux@googlegroups.com> wrote:
> > Hmm...no warnings for me with that config on next-20201208:
> > $ make LLVM=1 -j71 olddefconfig
> > $ make LLVM=1 -j71
> > ...
> > $ clang --version
> > clang version 12.0.0 (git@github.com:llvm/llvm-project.git
> > 1c98f984105e552daa83ed8e92c61fba0e401410)
> > (ie. near ToT LLVM)
> >
> > I see CONFIG_KASAN=y in the .config, so that's a recurring theme with
> > clang; excessive stack usage.  It does seem a shame to disable a
> > driver for a bunch of archs just due to KASAN stack usage.
> > $ grep KASAN=y 0x9077925C_defconfig
> > CONFIG_HAVE_ARCH_KASAN=y
> > CONFIG_KASAN=y
> >
> > Is there a different branch of a different tree that I should be
> > testing on instead? Otherwise, can you send the object file?
>
> I was on a slightly older linux-next, and the latest version contains
> the patch "ubsan: enable for all*config builds" in linux-next,
> which enables CONFIG_UBSAN_SANITIZE_ALL. It took me
> an hour to figure out, but after turning that option off, the warning
> is back.
>
> I'll send you the object for reference in a private mail, it's kind
> of large.

Got it, thanks.

$ llvm-objdump -Dr
--disassemble-symbols=dml30_ModeSupportAndSystemConfigurationFull
display_mode_vba_30.o
...
   1584f: 48 81 ec a0 08 00 00          subq    $2208, %rsp
...
$ python3 /android0/frame-larger-than/frame_larger_than.py
display_mode_vba_30.o dml30_ModeSupportAndSystemConfigurationFull
No dwarf info found in display_mode_vba_30.o
$ llvm-readelf -S display_mode_vba_30.o | grep debug_info
$ echo $?
1

Can you rebuild+resend with CONFIG_DEBUG_INFO enabled?
frame_larger_than.py relies on the DWARF debug info to know what local
variables occupy how much stack space.
-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
