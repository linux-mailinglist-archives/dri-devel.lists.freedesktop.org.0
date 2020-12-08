Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FC82D3D6D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0A76E301;
	Wed,  9 Dec 2020 08:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557996E9AA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 18:21:14 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id e23so12899102pgk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 10:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=69ZxS8NpuBFfq3dMMUK34uoPZnuHxlhCdKz8Q7+H1iw=;
 b=rsSy8DjSjzbDc0sbHQ7S0NMCf5oYMiYPU1VBQbgdqbKdGn3TtkJpjxxS+lP9V2APjr
 h7jqEq9f1oRC2yMDjRk/HPU63urSvYqsDn/+jIBZq82Q1HWBD10YKSJjs1ywgI2wI3Je
 fiBaN4QunaoM65dFCJO0RRbwT8YFddVD9QKUZjcddigxGsOw/5C1CkerOJrshV0LAG29
 z+R7zl2jTmiytq9cKhPpWwZHcaLg5DnzcFKqr9Fvy7sSkspvicup1HEOKC6jiQtzfzHj
 B8176rZyvn4Kwwx5gB+fujIqz0+Kp/OE+TIZs4oPkL3ici1kKHPXzPveOXhlAC6fbhe9
 f2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=69ZxS8NpuBFfq3dMMUK34uoPZnuHxlhCdKz8Q7+H1iw=;
 b=SenV3pvpJ26gepMNCF6rouK+BPDbFD0hrJf3kKMXiyDqeotDY6hbiivi2L9UymPVJ+
 5HUhsh5qVwfeItJkKNvzfvNWGXIABDS8j0woE/Yab3DdPUknkT8rVJ+8yi8cEumXv2Ak
 YzRFZD3UnR8WZQhM8jdAaWcoxUMuxetHdYdh5ztGRkhMWZcP1LFa0K3HOtkvdXo5l8Dg
 hd6iDfFxNrX2mtQT6wjEh0vparPl49gFOh4QQyicqREx5zUWzT/9RciL9wyJzAs7CRAz
 ol14LXjgz/Fzr0lryBkusNIg5NkKlGh/QEPerlNqdSgJ/WRhwgkv1d1XW7Xru/eP9Wg7
 5drA==
X-Gm-Message-State: AOAM530Cd/p+hg/FOrje8UwupkdjpZATZSq/4sON+StmviYkPkYvgpmQ
 2/OaYyxnuyQmgM5G3sVxt1mqAYEngiWSp+fP3bInFg==
X-Google-Smtp-Source: ABdhPJyjiKco4SfehN0PefCx1HbLYJrQRGQymvgBErwfXLEsvdc+8QV9rBpsch/L4CHfz1zm1S1MDluw9SJJ8GmDeWU=
X-Received: by 2002:a17:90b:1b05:: with SMTP id
 nu5mr5406298pjb.101.1607451673537; 
 Tue, 08 Dec 2020 10:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20201204081349.1182302-1-arnd@kernel.org>
 <CADnq5_OmAVZGuz=xHRyST4hE4w1g10wNBQ6iMgfpQD16-9QSiQ@mail.gmail.com>
 <b9d7e33c-4dcd-0075-d0ca-d22b2488c354@amd.com>
 <CAK8P3a09KQS7S5-vJU7ECJh0HXUhwZW9zOOp4c32mtvM5XcU1g@mail.gmail.com>
 <CAKwvOd=-2zoc06EY4R9ZJ0M874bQv3NuT8a0q9=RoYeMMtnXVQ@mail.gmail.com>
 <CAK8P3a0gjPWiRX0yg=i6Qxgyo02AtQVVsw+=w-OvF956Tn=jDw@mail.gmail.com>
 <CAKwvOd=+w6vJvvq9Pwnv1EHHzwCx=o_=PbSozXpqryN6P1yxVQ@mail.gmail.com>
 <CAK8P3a2_0bY+fmUHKjH8XCKpT1BepUGOV0HoKDSPnOvtKjA==g@mail.gmail.com>
In-Reply-To: <CAK8P3a2_0bY+fmUHKjH8XCKpT1BepUGOV0HoKDSPnOvtKjA==g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Dec 2020 10:21:02 -0800
Message-ID: <CAKwvOdmSzf7vFjjxWfvUR1FTeFoPToytQL_enR6CFXPCbUn8Gg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: make DRM_AMD_DC x86-only again
To: Arnd Bergmann <arnd@kernel.org>
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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

On Tue, Dec 8, 2020 at 6:26 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Dec 7, 2020 at 11:28 PM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > On Mon, Dec 7, 2020 at 2:17 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > On Mon, Dec 7, 2020 at 11:08 PM 'Nick Desaulniers' via Clang Built
> > > Linux <clang-built-linux@googlegroups.com> wrote:
> > > >
> > > > On Mon, Dec 7, 2020 at 1:57 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > > >
> > > > > Right, looking at my latest randconfig logs, I see the same problem on x86
> > > > > builds with clang as well, though I'm not entirely sure which other
> > > > > configuration
> > > > > options are needed to trigger it.
> > > > >
> > > > > So my patch can be disregarded, but I agree this needs a better fix,
> > > > > either in clang or in the dcn driver.
> > > >
> > > > If you could give https://github.com/ClangBuiltLinux/frame-larger-than
> > > > a spin again, I would appreciate any feedback.
> > >
> > > I've already tried it, but the tool doesn't seem to like me, I never
> > > get the information out of it that I want. This time it failed because
> > > it could not parse the .o file correctly.

The tool has a dependency on a python library for parsing ELF; I've
been having to teach it about various relocation types for non-x86_64
architectures; I'm sure the failure from that scenario is...gnarly.  I
don't know if my latest aarch64 fixes have been deployed (and it
depends on how the library is distributed).

> >
> > Can you send me a config to reproduce the .o file?
>
> The one attached here should reproduce it on x86.

Hmm...no warnings for me with that config on next-20201208:
$ make LLVM=1 -j71 olddefconfig
$ make LLVM=1 -j71
...
$ clang --version
clang version 12.0.0 (git@github.com:llvm/llvm-project.git
1c98f984105e552daa83ed8e92c61fba0e401410)
(ie. near ToT LLVM)

I see CONFIG_KASAN=y in the .config, so that's a recurring theme with
clang; excessive stack usage.  It does seem a shame to disable a
driver for a bunch of archs just due to KASAN stack usage.
$ grep KASAN=y 0x9077925C_defconfig
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_KASAN=y

Is there a different branch of a different tree that I should be
testing on instead? Otherwise, can you send the object file?
-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
