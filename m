Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B3AC453A
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 00:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC97510E3CF;
	Mon, 26 May 2025 22:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j7BNgT1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F35E10E3CF;
 Mon, 26 May 2025 22:31:33 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-310447fe59aso28850431fa.0; 
 Mon, 26 May 2025 15:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748298692; x=1748903492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jvLHYVJDLL1tRu00kxb4TV63RHH86AdnGIzbeTcCyBM=;
 b=j7BNgT1rhh4cyyH5DRhWGR613sHenlYpoZ2Fs3/GGVRtzDAVBBHWIUzxg1uit206vR
 RrYr0k8/8X8oCBnBWYpqwd1xnOVMSEnm8PP2NcrdEX22Xp1zlWhBh8Mi/irDFvjQgZ5a
 qjcmoxC+elBIMx7agLVTTD4RQedtWwMjEsdVKVw4XlVb1Giw7aNd2+cCxQKQALGutiqu
 6Lo+XOY+xh41yXnnpV05W3rVefL5bPqSyKCYOD0e5+Zooyuw1FAtilVr91d2pn93GZjX
 S+/8bBJ0EyZMuwLR21b2RqHkdPPVChTbbarmdCs+Q+D9iWH3WIvD/gyfUbyhDJkDpHz6
 KCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748298692; x=1748903492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jvLHYVJDLL1tRu00kxb4TV63RHH86AdnGIzbeTcCyBM=;
 b=l03t3Tb84JCXetD+TSqj+gzwnEOxD9er+NcOd6q1q4IUAtsa8LAJd5mn4e88PTBW28
 PM7kL3THWocZqgaAhxd106+oARcRU4q4IUrNB6RW8KY+2vF6i5KeDnL3aLIsH4vk7Kwj
 BJH36RGZe453zlyeMjPO7J8gkXCyX+NkgOTJjUwfQI7tCjUqYlnomcgiaNdWWzEAs5J3
 FBW50Vmu1j5UDFHN9kBIkCtijAPo+VzCG7rsHrzk3Rf0yzl36+TtJV9L+96bCDDZzxD9
 Y1/QCHI4QGVB0Ni25cKdMwceHkRnSd+UL+UHYk406atZEunjB8J4yErgmL1MXixwvWIa
 Q0FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi1BjyO2qNbnrHfJp8ytJ82jje7OXvxZAlY2MfMbpb55bJmqoUIXEj5Hk+DPJJzrbBtiaFVTRdQg==@lists.freedesktop.org,
 AJvYcCXFoHUtQquWQExNM+Vwab1xVaAwrUWRxu/PfBAg8OSYomGwvbAOiA62ZVjqfcoXWDsa7m8rDVSHln4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1kQhLlyhqVdUaYrXcqlaasfZgRiG9Y2ThRdv9B0ZTfzVclLnm
 ImoxWiJH08QzPvFszv0EGIho+uUKSZXxbgnf8lZi08B8OEchiDL+exhES5jT2reSQPubQ9ZB4Zw
 yo+lAkELJ7Fg28YL6mzBh6HbS2YIFgW4=
X-Gm-Gg: ASbGncsZKclyLRiuTA1oEAeo+uA1wX1ln+Y8Wj1YTkpJlz9IQEESANNHe2obh8yNsCU
 h9UJ+RfPeAdxMwKMqb4qpvzUjcWtG+0NSD5oz2A1ntUc4YNULc4QzR6dHdx4TfVPJ7tH9MX2Jxv
 bpJpSkzhLZLIwuE/sVpe6h/g3lMWOI0jxT9Kb4+TMF1QZj3AeBMyQYXXRCEfWGG8nGKrI=
X-Google-Smtp-Source: AGHT+IEJfWzc6VPUDuyUq0aTn+WE4sTfnbgvmOYP1K86Po8lb+CyhSBKVylPu7Ej7IoVB3uFqztWGvTQz/dCfNqAd+Q=
X-Received: by 2002:a05:651c:f01:b0:32a:664e:a923 with SMTP id
 38308e7fff4ca-32a664ea9e0mr10313091fa.22.1748298691742; Mon, 26 May 2025
 15:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-5-6412a94d9d75@gmail.com>
 <DA66OFXQCWUK.31LM78DIVABZV@kernel.org>
In-Reply-To: <DA66OFXQCWUK.31LM78DIVABZV@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 26 May 2025 18:30:55 -0400
X-Gm-Features: AX0GCFuHGuPmwsi9tWeeUypjxRW1UrvRCX_LVo0C-ggOVzUmGabC1z1bBuoaiZU
Message-ID: <CAJ-ks9m=okC9_K2MJU80xbnO+3+Z0hvC_FYzCtzW9pD=WA_xqQ@mail.gmail.com>
Subject: Re: [PATCH v10 5/5] rust: remove core::ffi::CStr reexport
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
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
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

On Mon, May 26, 2025 at 11:05=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> > Clean up references to `kernel::str::CStr`.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_panic_qr.rs   |  3 ++-
> >  drivers/gpu/nova-core/firmware.rs |  2 +-
> >  drivers/net/phy/ax88796b_rust.rs  |  1 +
> >  drivers/net/phy/qt2025.rs         |  1 +
> >  rust/kernel/device.rs             |  3 +--
> >  rust/kernel/driver.rs             |  4 ++--
> >  rust/kernel/error.rs              |  6 ++----
> >  rust/kernel/faux.rs               |  5 ++++-
> >  rust/kernel/firmware.rs           | 15 ++++-----------
> >  rust/kernel/kunit.rs              |  6 +++---
> >  rust/kernel/lib.rs                |  2 +-
> >  rust/kernel/miscdevice.rs         |  3 +--
> >  rust/kernel/net/phy.rs            |  4 +++-
> >  rust/kernel/of.rs                 |  3 ++-
> >  rust/kernel/pci.rs                |  2 +-
> >  rust/kernel/platform.rs           |  2 +-
> >  rust/kernel/prelude.rs            |  5 +----
> >  rust/kernel/str.rs                | 22 ++++++++++------------
> >  rust/kernel/sync/condvar.rs       |  4 ++--
> >  rust/kernel/sync/lock.rs          |  4 ++--
> >  rust/kernel/sync/lock/global.rs   |  5 +++--
> >  rust/kernel/sync/poll.rs          |  1 +
> >  rust/kernel/workqueue.rs          |  1 +
> >  rust/macros/module.rs             |  2 +-
> >  24 files changed, 51 insertions(+), 55 deletions(-)
>
> Haven't compile tested this series yet, but this commit seems to suggest
> to me that some of the previous commits introduced code that doesn't
> compile or emits warnings? If so that needs to be fixed.

That's not the case. There are no warnings and no compilation failures
in prior commits.
