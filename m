Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55DEAC6717
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 12:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1731510E5DC;
	Wed, 28 May 2025 10:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="AVDilN3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0093310E155
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 10:36:35 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-442dc702850so28563685e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748428594; x=1749033394;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=Si1j6uouuZRKixZgcv6BHoJXWodMnlY2oC/q9yWhRtM=;
 b=AVDilN3x4BsFAWu0swB1GCi5As+U+m/FWkLFXM4xVR/dkSEA0yGx/bIdbsTRop0Bk6
 ns6zMrmC8IYcSh8GJAdQlmpviV6l4s8HazsbNuh2Defxa2ePSuruu5C9T9wrgJKoDuX6
 28VgcgD8A37926/mWRZbBPqtnRYpni9MesCoi2gI7zID5SbFZTwgvR2d/YFfd9qNttWn
 lJFgZTFZT/mtJTenfMx/ZJPRra9VlDvt+b2w+bnTGqfoYalTREx9hPR6ub9yU//B82dJ
 02ByV3ex8xJIX7zSBC2pJJzmAgjGseT9p+7g1AbmcpHg/rvLYZBdCwcZvCLuEmnn2f/K
 1ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428594; x=1749033394;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Si1j6uouuZRKixZgcv6BHoJXWodMnlY2oC/q9yWhRtM=;
 b=sAuoJ3EmqUwLE6KIjrxkLbk5k/TyXnUUDICSL+MtgzIHc9GqLF07TO6jNTgAuOdY/6
 xxTzG2ZMOxBT0YMR1n1ESh8rI7S/rfgZMwcbRmNyck6aB1nM/if7R7MQY6p6iSOIBsgx
 0UxB6J/W0oWhvFogSF/qjwDGiJVJZ/F3Dd5xWJswDiBFlu2lTWU/e28le4zKhQZJ2Nxb
 YUm4BKbzD1+VMcpgTAreJozMDbGRzmbPJ1FbdNqL9MKarSj7G4iiZpiUJpw64RLLI+Og
 kyo/8ApSKx3voFuLAHR+2i2QYJvRCNAvM88mzB6f2AHH4b/PGpe6SAfEkCNbftyWRET/
 wuVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdQ0no+yCp7o8XrEUZjMZIzR7Wi9PzP/pA30sooIi9uGqOOTiQZ1zZHVBDDZjC5TcKt76vANvmKCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxICZwmUCfpwNXR9eeLXTU3yNihP3VImWhkZUkUvA9zyZPeF18I
 qdDPySqqNfTBL83G0bexerYsvL1pLYCVTos0euo37MDhrZvcbMlUYagLaA08ZtrwCqOl2Aqk2o8
 bFKT/uqcJB1k+pIAITw==
X-Google-Smtp-Source: AGHT+IHiPY375iu6n+ZkU8ZC6vWYnO6vfkfIsES083JMYvmdbEogAqIJfVfK9XDvKlL1n6CsZmK6dlKKd2C91Us=
X-Received: from wmbhc21.prod.google.com
 ([2002:a05:600c:8715:b0:442:f984:ed5e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a13:b0:43d:160:cd9e with SMTP id
 5b1f17b1804b1-44c91fbb448mr159783095e9.17.1748428594079; 
 Wed, 28 May 2025 03:36:34 -0700 (PDT)
Date: Wed, 28 May 2025 10:36:31 +0000
In-Reply-To: <CAJ-ks9nd6_iGK+ie-f+F0x4kwpyEGJ-kQiQGt-ffdbVN5S6kOg@mail.gmail.com>
Mime-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-4-6412a94d9d75@gmail.com>
 <DA66NJXU86M4.1HU12P6E79JLO@kernel.org>
 <CAJ-ks9nd6_iGK+ie-f+F0x4kwpyEGJ-kQiQGt-ffdbVN5S6kOg@mail.gmail.com>
Message-ID: <aDbnLzPIGiAZISOq@google.com>
Subject: Re: [PATCH v10 4/5] rust: replace `kernel::c_str!` with C-Strings
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>,
 Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, 
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
 "Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
 linux-block@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Mon, May 26, 2025 at 06:29:46PM -0400, Tamir Duberstein wrote:
> On Mon, May 26, 2025 at 11:04=E2=80=AFAM Benno Lossin <lossin@kernel.org>=
 wrote:
> >
> > On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> > > +macro_rules! c_str_avoid_literals {
> >
> > I don't like this name, how about `concat_to_c_str` or
> > `concat_with_nul`?
> >
> > This macro also is useful from macros that have a normal string literal=
,
> > but can't turn it into a `c""` one.
>=20
> Uh, can you give an example? I'm not attached to the name.

I also think it should be renamed. Right now it sounds like it creates a
c string while avoiding literals in the input ... whatever that means. I
like Benno's suggestions, but str_to_cstr! could also work?

Alice
