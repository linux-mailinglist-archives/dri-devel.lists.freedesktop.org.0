Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD612D3608
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 23:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B886E071;
	Tue,  8 Dec 2020 22:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9E76E06D;
 Tue,  8 Dec 2020 22:18:30 +0000 (UTC)
X-Gm-Message-State: AOAM531ItolYtFSVvD3Yu4ZdqTSwmUDrhiO01YBtUX1ypjV4Wy/15odi
 B2hVHtpOGCCWURSySJQ53zEVf9RO6BPEt92aMME=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607465910;
 bh=xFL+aV7HaUPdoDsPGiwsEiOwK43aRbX8SLueE905Gog=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D/Bamd5Zm/Kd8OEMMg2w/VlmfLHGs9ICY7QcY+ulPXlZt2szrG2ZLeNsmwtpJpA3F
 OEF6A9ZuX8PZ/rxBEvFjo9bi6wCAJqvae/KTCUsGvDpA36kAkKF0lyWPROLK8dGIOb
 aLwQ6Ednn2YONApUrgbt6VmxL4/FjRerh45a9+rivh4IYbYLpBEOiygbiOHHmdXaKe
 dM8ycWBysSL6XeuD0cLZZgmk4fclznMnuLQI3i9O+njHjUlpggRDjsBEgDVbft2jQj
 R1oypkXi2B/LIGWIJOcA5hHISH0pKx6kzerlU9IJR5EyUfHmmloIx8VPVtOUe4eioF
 fzCiKjjW4Kgnw==
X-Google-Smtp-Source: ABdhPJzlwEf8pGc7wtGNJ4gFAo+LbUpeXPzo5xZwgMNh5ZzlPdm16Ibf3YJ2IYrQrfy1mcUxMOBbdUVl3HhSn1AHVZg=
X-Received: by 2002:a4a:3b81:: with SMTP id s123mr110633oos.15.1607465909604; 
 Tue, 08 Dec 2020 14:18:29 -0800 (PST)
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
In-Reply-To: <CAKwvOdmSzf7vFjjxWfvUR1FTeFoPToytQL_enR6CFXPCbUn8Gg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 8 Dec 2020 23:18:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ViH90qvr63H4J5Qn0FMfV4r9CeTHurj3N2qO2f=Dq+Q@mail.gmail.com>
Message-ID: <CAK8P3a0ViH90qvr63H4J5Qn0FMfV4r9CeTHurj3N2qO2f=Dq+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: make DRM_AMD_DC x86-only again
To: Nick Desaulniers <ndesaulniers@google.com>
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

On Tue, Dec 8, 2020 at 7:21 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Tue, Dec 8, 2020 at 6:26 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Mon, Dec 7, 2020 at 11:28 PM 'Nick Desaulniers' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> Hmm...no warnings for me with that config on next-20201208:
> $ make LLVM=1 -j71 olddefconfig
> $ make LLVM=1 -j71
> ...
> $ clang --version
> clang version 12.0.0 (git@github.com:llvm/llvm-project.git
> 1c98f984105e552daa83ed8e92c61fba0e401410)
> (ie. near ToT LLVM)
>
> I see CONFIG_KASAN=y in the .config, so that's a recurring theme with
> clang; excessive stack usage.  It does seem a shame to disable a
> driver for a bunch of archs just due to KASAN stack usage.
> $ grep KASAN=y 0x9077925C_defconfig
> CONFIG_HAVE_ARCH_KASAN=y
> CONFIG_KASAN=y
>
> Is there a different branch of a different tree that I should be
> testing on instead? Otherwise, can you send the object file?

I was on a slightly older linux-next, and the latest version contains
the patch "ubsan: enable for all*config builds" in linux-next,
which enables CONFIG_UBSAN_SANITIZE_ALL. It took me
an hour to figure out, but after turning that option off, the warning
is back.

I'll send you the object for reference in a private mail, it's kind
of large.

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
