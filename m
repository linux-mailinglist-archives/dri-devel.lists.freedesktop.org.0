Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE582AF8132
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 21:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F5410E1C7;
	Thu,  3 Jul 2025 19:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SRQEIJsj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FA310E013;
 Thu,  3 Jul 2025 19:17:20 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-32cd0dfbd66so1943141fa.3; 
 Thu, 03 Jul 2025 12:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751570239; x=1752175039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R3Barr3IhXzrNTPGC2RTs5bswjpJKBTkkOzXAPniR4c=;
 b=SRQEIJsjjyPfoW7UIRrgm9Jn45nd1lOd46e29rRYnVSMdpE6E0RlVtjQmubqSEV8uJ
 i1utAYo3nN0Opsp5m9trFMv2E67Julo9rPbr+YDHfyQdpiSSqzJ9n4N/7zs/j1bdE+hA
 qBcjJgVTeGqvfxyDBlvP9Uq1Z4Z5/fC5/SDnybDCTl9xwG1EPv2N26EAxWycwXpURGlW
 oVIA3ebpic1y596PEaoZ2kRkBG81NXRaoqbbdlcbmAvfSIOLs2ToKjSz9S2YxhCG1Y11
 uU8rw//MmXaxtb04vhR2SAgVXXFaRIyXKjbep6XtUDnj4fh7U6/u0JeRH22BkvgcnLtj
 NqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751570239; x=1752175039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R3Barr3IhXzrNTPGC2RTs5bswjpJKBTkkOzXAPniR4c=;
 b=BtQ+cWxx4VCuS2N/vp9fK8WrMbV7plRzjNNOpCOYUQFmRu9+lGjmofng4aUTATZT0Q
 +u9BIBBFdh8rtwqjMOKUWP/G2yjxONpCKCM8LF3B1noHmvVY7iHO2vxh8VWCaG1+nskC
 wn8ID+k1DjQXN+zF9VepGOqW7gACJ65xjmpOFE64fGF2yZyJChyFh8tMhjVgujkdTe+A
 d8Bpe0ue5xjORc5Rn6txwXpPuO9q5t16Xvb/v6EJqckjRub6yZdOS9zw017zLeCndI+q
 ihz3+DyQ55ysv2Y0etV8610NMHmo+vQyWRgKazr581ku4Z1+pSdiKJXZheQOw6t+WG04
 RsXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXenZhzghLf03Njbdxl0KBKNHuD2fA20VhH68fKIMf+K5WadgkdEWpNdhIELSLrwMEdrS7SoVFNJKc=@lists.freedesktop.org,
 AJvYcCXoJLpvCuXvcHtzfEjI+u6UeeXx7OC016GrZjYg2kSXCob0wkg7t8nbFNCjGz9I3rpqy4ujscGxTA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbm3ZpxiV8PKQ4KqRW+8caHXNmhPB1oG0ZBE0wLEl49LJD/V+V
 77cVL6ew4LetyJLvSWC41sF9ijX49C/caIbYlElrYOhkTkTs+FYyRPQZessQZPqbjDiTJHSA+zF
 NzcoBOVjMpbnfhyZDxNNnDxSOKh6a48Y=
X-Gm-Gg: ASbGncuxV+QElrWoeFpZ9AX4l8MpLgSFlV8oimxzNu/7b7JocNlDfKxX5bLyjAnfg/X
 VYGDyeE4lWN2S2pOQ6UEjJmyAzivRLvE1pJjsZEisJoWyjEy6Nxu1TdI7fDTRie3uKTvU8cIdJ8
 hqwbiv+Rj9b2v7/uzuNp9kD14Qc6VtChn3El4mHf35bRaXSQ==
X-Google-Smtp-Source: AGHT+IGjC0TGXLvqJzlq7AH9t/Q8+27F2aQQEGTeZqTm6S+IuruBMFgglwnG67+02iIc84HBQzCfPbXa93QdJ3TTD74=
X-Received: by 2002:a05:651c:3c2:b0:327:fec0:b85d with SMTP id
 38308e7fff4ca-32e00049994mr27628221fa.21.1751570238849; Thu, 03 Jul 2025
 12:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
 <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
In-Reply-To: <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 3 Jul 2025 15:16:42 -0400
X-Gm-Features: Ac12FXxZ9om-DmQ4Jtb_QO5Js54rwUi8z1hnIkmX71Lj1sGPMSjTGrGnMcngSCg
Message-ID: <CAJ-ks9nCHCBqfM5nG3XpBBsWSqGpJLexV53UGL2i3KTdRiWRXQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Benno Lossin <lossin@kernel.org>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
 linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 3, 2025 at 2:55=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Thu, Jul 3, 2025 at 11:08=E2=80=AFAM Benno Lossin <lossin@kernel.org> =
wrote:
> >
> > On Thu Jul 3, 2025 at 3:55 PM CEST, Tamir Duberstein wrote:
> > > On Thu, Jul 3, 2025 at 5:32=E2=80=AFAM Benno Lossin <lossin@kernel.or=
g> wrote:
> > >> On Tue Jul 1, 2025 at 6:49 PM CEST, Tamir Duberstein wrote:
> > >> > Introduce a `fmt!` macro which wraps all arguments in
> > >> > `kernel::fmt::Adapter` and a `kernel::fmt::Display` trait. This en=
ables
> > >> > formatting of foreign types (like `core::ffi::CStr`) that do not
> > >> > implement `core::fmt::Display` due to concerns around lossy conver=
sions which
> > >> > do not apply in the kernel.
> > >> >
> > >> > Replace all direct calls to `format_args!` with `fmt!`.
> > >> >
> > >> > Replace all implementations of `core::fmt::Display` with implement=
ations
> > >> > of `kernel::fmt::Display`.
> > >> >
> > >> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > >> > Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-=
General/topic/Custom.20formatting/with/516476467
> > >> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > >> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > >> > ---
> > >> >  drivers/block/rnull.rs       |  2 +-
> > >> >  drivers/gpu/nova-core/gpu.rs |  4 +-
> > >> >  rust/kernel/block/mq.rs      |  2 +-
> > >> >  rust/kernel/device.rs        |  2 +-
> > >> >  rust/kernel/fmt.rs           | 89 +++++++++++++++++++++++++++++++=
++++++++
> > >> >  rust/kernel/kunit.rs         |  6 +--
> > >> >  rust/kernel/lib.rs           |  1 +
> > >> >  rust/kernel/prelude.rs       |  3 +-
> > >> >  rust/kernel/print.rs         |  4 +-
> > >> >  rust/kernel/seq_file.rs      |  2 +-
> > >> >  rust/kernel/str.rs           | 22 ++++------
> > >> >  rust/macros/fmt.rs           | 99 +++++++++++++++++++++++++++++++=
+++++++++++++
> > >> >  rust/macros/lib.rs           | 19 +++++++++
> > >> >  rust/macros/quote.rs         |  7 ++++
> > >> >  scripts/rustdoc_test_gen.rs  |  2 +-
> > >> >  15 files changed, 236 insertions(+), 28 deletions(-)
> > >>
> > >> This would be a lot easier to review if he proc-macro and the call
> > >> replacement were different patches.
> > >>
> > >> Also the `kernel/fmt.rs` file should be a different commit.
> > >
> > > Can you help me understand why? The changes you ask to be separated
> > > would all be in different files, so why would separate commits make i=
t
> > > easier to review?
> >
> > It takes less time to go through the entire patch and give a RB. I can
> > take smaller time chunks and don't have to get back into the entire
> > context of the patch when I don't have 30-60min available.
>
> Ah, I see what you mean. Yeah, the requirement to RB the entire patch
> does mean there's a benefit to smaller patches.
>
> > In this patch the biggest problem is the rename & addition of new
> > things, maybe just adding 200 lines in those files could be okay to go
> > together, see below for more.
>
> After implementing your suggestion of re-exporting things from
> `kernel::fmt` the diffstat is
>
> 26 files changed, 253 insertions(+), 51 deletions(-)
>
> so I guess I could do all the additions in one patch, but then
> *everything* else has to go in a single patch together because the
> formatting macros either want core::fmt::Display or
> kernel::fmt::Display; they can't work in a halfway state.
>
> >
> > > I prefer to keep things in one commit because the changes are highly
> > > interdependent. The proc macro doesn't make sense without
> > > kernel/fmt.rs and kernel/fmt.rs is useless without the proc macro.
> >
> > I think that `Adapter`, the custom `Display` and their impl blocks
> > don't need to be in the same commit as the proc-macro. They are related=
,
> > but maybe someone is not well-versed in proc-macros and thus doesn't
> > want to review that part.
>
> Sure, I guess I will split them. But as noted above: changing the
> formatting macros and all the types' trait implementations has to be a
> "flag day" change.
>
> >
> > >> > diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> > >> > new file mode 100644
> > >> > index 000000000000..348d16987de6
> > >> > --- /dev/null
> > >> > +++ b/rust/kernel/fmt.rs
> > >> > @@ -0,0 +1,89 @@
> > >> > +// SPDX-License-Identifier: GPL-2.0
> > >> > +
> > >> > +//! Formatting utilities.
> > >> > +
> > >> > +use core::fmt;
> > >>
> > >> I think we should pub export all types that we are still using from
> > >> `core::fmt`. For example `Result`, `Formatter`, `Debug` etc.
> > >>
> > >> That way I can still use the same pattern of importing `fmt` and the=
n
> > >> writing
> > >>
> > >>     impl fmt::Display for MyType {
> > >>         fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {}
> > >>     }
> > >
> > > Great idea, done for the next spin. It would be nice to be able to
> > > lint against references to `core::fmt` outside of kernel/fmt.rs.
> >
> > I think there was something in clippy that can do that globally and we
> > could allow that in this file?
>
> I didn't find anything suitable. Do you have one in mind?

I think we want https://github.com/rust-lang/rust-clippy/issues/14807.
