Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0386AAF91F3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 13:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A601610EA00;
	Fri,  4 Jul 2025 11:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e1+4MlBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBAD10EA00;
 Fri,  4 Jul 2025 11:59:05 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-553b584ac96so849427e87.1; 
 Fri, 04 Jul 2025 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751630344; x=1752235144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AX2ezheHMTwCnwKIKFQeSSolcoT52guQ9m4zT7OdyqQ=;
 b=e1+4MlBv909WocPlDiGdREMzoLUxFVgCmOgYl3aO87vwiXM5yhE4eJjiTMmRiyCxJk
 EK2PHv3gdqCXH8iTRGPiIXHY1ycXuOQUXb/sHbsl/36ScWc0/wuTIMFYBqWVCbbjSeJQ
 DRemY5hmX169Fa6ERswruI885vPDDm5MmwBUqnI3RwbFsmUymTVyIx5BccpMJih2ooR7
 ps/MvyB9cyg9t/OyvsqjAk/6i9ZD479584ILphiTXtW/cmMGvPOhwCnutec9zVv0TS4V
 O8zP00K65SejgiQmqRDm3mrCFNHzBgQEiwfW25um/R11v7w+TLtuIavz0Fd8QcF1a2mN
 Z6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751630344; x=1752235144;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AX2ezheHMTwCnwKIKFQeSSolcoT52guQ9m4zT7OdyqQ=;
 b=gXj8FLmzsShwMLsrhlGEUlX6lV6SjKA3cIu53ACdwrJWnOVuSxlahSqVggXRi8FZIg
 DmFqi/ry5PbP5G9Y+rHlyC13hibWArjC+hCaV1kWKn4JckbrXNLnJ1HDmsF6JfmXMGTy
 CRsNhJIpYMNoTPn44i+6MGBB/XmOQKyNoJH1JnzZ/FQla/JeCUz97/Biyrj8J4Fs90Gj
 KBh1Pmo9/08i/g6bZwy5Yine9OzfK6phPBtqEkMnE45xcLmslAl9Isc8v7TWn4zxt4SJ
 HxN7Z76Rj1ciwIRh/GuWwQNPXVAPXHbka2Gq5ZzMx0FlJKBRCroPsNZr61Rbnc1tbGWf
 vwDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNo56JYnNiQtLsyxBnnxTJvr4PyexyG9yYjkU6yS0PTFPRLSXIj3RAeOb23DEqoFopoAqMdS3b68U=@lists.freedesktop.org,
 AJvYcCXtqkIsjYXZZsrCIqyBm36GnVlav8FM8hCZty65eAJ5OEPjfUQ8baiF8Rh5BUMfY4mHF/whaFiSjw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn7WCvH5+dVgeT8dFdrIgNziEUW8ynjeiindAHoywIkgyGupUa
 z5DNIwbeqzjkjAEDBWv+Z7AhetmAkeoNAW68kch68shfTvLj1X4yJjnJcgYy/mvOncPpLGTckoE
 R8OpA23fWHhcOYFgjK3Wm1aGBfYUc83Q=
X-Gm-Gg: ASbGncvClORzSCc595RqzrjqHJpIEUJl3a2SvDPn1LBHhw2GmFKga92k7dZ7UI7dzkx
 XkGgsFfHGiLtPc1hkJ/45YqASFWE6ATpqZlCN4SgPFEbB9s2xlkVA5+YBR5Mjji7t5PxmXMCjO6
 N9jn5OnoXcQaXBIfig0lB0p+RbiaNru8ITqx3o0lFBp8lPMQDqDEC3jdG9p03gjbD88Bv+DqUqm
 XGIpA==
X-Google-Smtp-Source: AGHT+IFprJqElpi5vcjeJ23fLLN3WMzZLZ0CrkVny13pfXY112X2yXfPm/SOjbYZcibT+i59JoBTBmJ65qELc434iFo=
X-Received: by 2002:a05:6512:2528:b0:553:2868:635c with SMTP id
 2adb3069b0e04-556e60879d0mr712367e87.48.1751630343665; Fri, 04 Jul 2025
 04:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
 <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
 <DB2PIGAQHCJR.3BF8ZHECYH3KB@kernel.org>
 <CAJ-ks9=WmuXLJ6KkMEOP2jTvM_YBJO10SNsq0DU2J+_d4jp7qw@mail.gmail.com>
 <CAJ-ks9kNiOgPO7FF3cAbaSNtTWs0_PzQ4k4W0AxjHNFuMJnDcQ@mail.gmail.com>
 <DB36T5JWBL10.2F56EDJ1XKAD0@kernel.org>
In-Reply-To: <DB36T5JWBL10.2F56EDJ1XKAD0@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 4 Jul 2025 07:58:27 -0400
X-Gm-Features: Ac12FXwwR0QTbVNjts9p85kYh4knK1uvCt11R29enEo0nBiKI492OfZj839T-II
Message-ID: <CAJ-ks9=Jutg+UAwCVER_X91BGxWzmVq=OdStDgLZjTyMQSEX6Q@mail.gmail.com>
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

On Fri, Jul 4, 2025 at 6:09=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Fri Jul 4, 2025 at 1:23 AM CEST, Tamir Duberstein wrote:
> > On Thu, Jul 3, 2025 at 6:41=E2=80=AFPM Tamir Duberstein <tamird@gmail.c=
om> wrote:
> >> On Thu, Jul 3, 2025 at 4:36=E2=80=AFPM Benno Lossin <lossin@kernel.org=
> wrote:
> >> >
> >> > I don't understand, can't you just do:
> >> >
> >> > * add `rust/kernel/fmt.rs`,
> >> > * add `rust/macros/fmt.rs`,
> >> > * change all occurrences of `core::fmt` to `kernel::fmt` and
> >> >   `format_args!` to `fmt!`.
> >>
> >> Yes, such a split could be done - I will do so in the next spin
> >>
> >>
> >> > The last one could be split by subsystem, no? Some subsystems might
> >> > interact and thus need simultaneous splitting, but there should be s=
ome
> >> > independent ones.
> >>
> >> Yes, it probably can. As you say, some subsystems might interact - the
> >> claimed benefit of doing this subsystem-by-subsystem split is that it
> >> avoids conflicts with ongoing work that will conflict with a large
> >> patch, but this is also the downside; if ongoing work changes the set
> >> of interactions between subsystems then a maintainer may find
> >> themselves unable to emit the log message they want (because one
> >> subsystem is using kernel::fmt while another is still on core::fmt).
> >
> > I gave this a try. I ran into the problem that `format_args!` (and,
> > after this patch, `fmt!`) is at the center of `print_macro!`, which
> > itself underpins various other formatting macros. This means we'd have
> > to bifurcate the formatting infrastructure to support an incremental
> > migration. That's quite a bit of code, and likely quite a mess in the
> > resulting git history -- and that's setting aside the toil required to
> > figure out the correct combinations of subsystems that must migrate
> > together.
>
> So here is what we can do without duplicating the logic, though it
> requires multiple cycles:
>
> 1. We merge the two `fmt.rs` files & each subsystem merges an
>    implementation of `kernel::fmt::Display` for their types, but keeps
>    the `core::fmt::Display` impl around.
> 2. After all subsystems have merged the previous step, we change the
>    implementations of `print_macro!` to use `fmt!` instead of
>    `format_args!`.
> 3. We remove all occurrences of `core::fmt` (& replace them with
>    `kernel::fmt`), removing the `core::fmt::Display` impls.

That would probably work. We will probably see regressions because we
can't just replace `core::fmt` imports with `kernel::fmt`, so new code
may appear that uses the former.

I think this discussion would be productive on the next spin. The
changes in other subsystems are now almost entirely changing of import
paths -- perhaps that would be sufficiently uncontroversial for folks
to give their Acked-bys.
