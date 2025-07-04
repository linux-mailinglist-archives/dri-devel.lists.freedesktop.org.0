Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5D3AF9B36
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 21:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E17E10EA70;
	Fri,  4 Jul 2025 19:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ltiiabn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E344610EA70;
 Fri,  4 Jul 2025 19:39:30 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-32b553e33e6so10607351fa.2; 
 Fri, 04 Jul 2025 12:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751657969; x=1752262769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PaN1iXlsiktU/ZIaAdJUYYtsPKiTgtwWPQpDE5mPO2Y=;
 b=ltiiabn4bLC9Em0urjF2x2PqPEc/EBm6QJ3mBjZ5IFNCRtL7I0jxF2V0tTI7iGVNlQ
 jeptxgmKoJkObafxe16+0mbei2r6THCOEsGUifuioA4bkLoZKJ/kLH6vCGOcdU+Dikro
 0eU0bn1MFxkcgt2gYEcpLZXKVSC0I+zhSsyp1pJ8PBfLpTfYjhnzItPGB9t+85OxwDUk
 NhO250WbsW8R3Cro5hev0Op5glr4T9sFHO9HS2BVW1hbrJ2Ll6KaIro9uDqzlmhggHqb
 mSmtIwe/S5Chl2LMpLVlnro4WEKL9/CDaP3zWkInR4F+Emfoe3OKyDT/kwLmIxLVMoSa
 VTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751657969; x=1752262769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PaN1iXlsiktU/ZIaAdJUYYtsPKiTgtwWPQpDE5mPO2Y=;
 b=QGEjrTqTUDNrnMaak61MA+rNQK5gLbEhdhJjwvBVfQOeqyW96T1SQ9a/kb08ybTpDZ
 21Cy1JQ13CKYX1fO5xzuEHaHN0qNJdVCG4XkHO0JIg2wAFI7tfxBp0hj43hAqGV226NK
 T24QZ79fzZ37Y0GGPefvkf/PM5BTOwGATDU4nTmVUZ/1NqOt5JneI4ISHZRAR7I+VJrr
 hfTJJ4Tpriy381yVBGBrSVcOyQpNt9ZYfBU57WHbLL7P0/1rgwfkwX2vxvx2McY3IIVR
 jCu+fghMpO2mEUQYbwdb//jYzWcpzt7thYVgvWfxKMK/fsIx0rHsBngl6fypAwAz8A3B
 ISMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6rZbaW+tWg1Xd/TL+EFwncyXydKQZHbT8/keYTv1KRrvoWZZSAaw6zYV98wOMmvnnY30wTKmREQM=@lists.freedesktop.org,
 AJvYcCUS7OC7vRWTW1lQPGz1P4ek/WCTKt19qAptgZuqGeLR1lwRDNPj/Il5od9sfNeffY8U5l6V4gdW3g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrInK1VHZTfNMh+IM1zyWNdTqy30XQcb/Qi9BO0jWwLYB+RZRW
 wM+//78DlA5LN4CpRACB6CAzRxBbwVeaHYgqwcMs6N+EF5tX10hXdkxwjJUlkPF6M5g/C57LbAt
 zLNkjjwIQ0zbd0pFU8iPUf7bm+rVbV4k=
X-Gm-Gg: ASbGnctGQAX3lVSSNSaPv1bLwmKDJfFnAvvw/TeYExSwpxskUKWVqkSRH/se4LE4Ljh
 KbdUqPyBW45P5VRDjzn6RSs8BN3QlUNrYAXyJ3JSOedwjtn3dNiol5byFVsBXW+p76jh0vIQZNt
 2arrc1KNqnJEM/N07CdvT6ivxrugFmLc/jA8dvyIliPFagNLOxim9KPBtIrmFJPBGn9lpAu71du
 8nNdw==
X-Google-Smtp-Source: AGHT+IEUCasNpOjrLiPTdba+G1DzRMt5tyZu55jlQh+AX9oNhtSkPC1M27OuhbpRgJbummxXICHmkFV1J91gViP7ObU=
X-Received: by 2002:a2e:b88f:0:b0:32a:6c63:92a with SMTP id
 38308e7fff4ca-32f03639f57mr13413521fa.22.1751657968994; Fri, 04 Jul 2025
 12:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-3-29f7d3eb97a6@gmail.com>
 <DB3AFTUC22W1.39C4DMWSENZGB@kernel.org>
In-Reply-To: <DB3AFTUC22W1.39C4DMWSENZGB@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 4 Jul 2025 15:38:53 -0400
X-Gm-Features: Ac12FXzIFREDgXqCwrv6XJgEObqPEvHKICa5en-HTCiFL74MHyUAIu3tq-_u52g
Message-ID: <CAJ-ks9=Q2+zmBzq36aYnePmRm2b5NL3buMXP36FpmnJ+UU3FWQ@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] rust: replace `CStr` with `core::ffi::CStr`
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

On Fri, Jul 4, 2025 at 9:00=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Tue Jul 1, 2025 at 6:49 PM CEST, Tamir Duberstein wrote:
> > `kernel::ffi::CStr` was introduced in commit d126d2380131 ("rust: str:
> > add `CStr` type") in November 2022 as an upstreaming of earlier work
> > that was done in May 2021[0]. That earlier work, having predated the
> > inclusion of `CStr` in `core`, largely duplicated the implementation of
> > `std::ffi::CStr`.
> >
> > `std::ffi::CStr` was moved to `core::ffi::CStr` in Rust 1.64 in
> > September 2022. Hence replace `kernel::str::CStr` with `core::ffi::CStr=
`
> > to reduce our custom code footprint, and retain needed custom
> > functionality through an extension trait.
> >
> > C-String literals were added in Rust 1.77, while our MSRV is 1.78. Thus
> > opportunistically replace instances of `kernel::c_str!` with C-String
> > literals where other code changes were already necessary or where
> > existing code triggered clippy lints; the rest will be done in a later
> > commit.
> >
> > Link: https://github.com/Rust-for-Linux/linux/commit/faa3cbcca03d0dec8f=
8e43f1d8d5c0860d98a23f [0]
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_panic_qr.rs |   2 +-
> >  rust/kernel/auxiliary.rs        |   4 +-
> >  rust/kernel/configfs.rs         |   4 +-
> >  rust/kernel/cpufreq.rs          |   2 +-
> >  rust/kernel/device.rs           |   4 +-
> >  rust/kernel/drm/device.rs       |   4 +-
> >  rust/kernel/error.rs            |   4 +-
> >  rust/kernel/firmware.rs         |  11 +-
> >  rust/kernel/kunit.rs            |   6 +-
> >  rust/kernel/miscdevice.rs       |   2 +-
> >  rust/kernel/net/phy.rs          |   2 +-
> >  rust/kernel/of.rs               |   2 +-
> >  rust/kernel/prelude.rs          |   5 +-
> >  rust/kernel/seq_file.rs         |   4 +-
> >  rust/kernel/str.rs              | 394 +++++++++++---------------------=
--------
> >  rust/kernel/sync/condvar.rs     |   2 +-
> >  rust/kernel/sync/lock.rs        |   2 +-
> >  rust/kernel/sync/lock/global.rs |   2 +-
> >  samples/rust/rust_configfs.rs   |   2 +-
> >  19 files changed, 140 insertions(+), 318 deletions(-)
>
> Is it also possible to split this? First rename the existing functions
> on our CStr to match upstream & then you don't need to do the rename &
> removal of our CStr in the same patch?

Yes.
