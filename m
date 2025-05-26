Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5057DAC452B
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 00:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2785310E382;
	Mon, 26 May 2025 22:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DFq3O/dP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F5210E382;
 Mon, 26 May 2025 22:25:29 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-32a6a1a5f6dso5344071fa.1; 
 Mon, 26 May 2025 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748298328; x=1748903128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gaenIVV6sgmeMP/e9IFhljAikGtRfCzZk1k/VfHMXwI=;
 b=DFq3O/dPCtwB0PdRfRF30sJk7vHQrZgzqn0PaLjdhN38RdkkTfv0WsgiA74ym2Uvuo
 z+ufSAg2ojPcmmMksksxor6DcGvtBAou/1ox3/mEALsiJPamB++naxE/fctdfZBkHp4q
 +zYowyLwR/Dql6fzSEXcG+GjHWESS/P/U4JEWRVYGC9M7WQxi0kTuUCb2uZYnA7bTn4H
 0IDeqJXsApYG1Z9/LKkYhRsRN3AuEye1n4191QbyVsvjvoqTfFCfNkA3bNHRWON0Kspb
 pCa+Q5w3YkbhDs+Jv1wH2rXecUQhRWmuRIVw/RVcClsuOFH7fOziH5qS5dW84HekZWkt
 2fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748298328; x=1748903128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gaenIVV6sgmeMP/e9IFhljAikGtRfCzZk1k/VfHMXwI=;
 b=mXrHs3RLloU+WFADNCMUGfczufNpH9XXb2aJLHv83anHDvUg+0OgVsXR/Vd5+/ylDC
 l45U/Ls5TH/elCZFy6QJ1DdXI6yQN5qZxcq2O1ovWPXa0BQPrtdHVsa12THpSOBm95n8
 eoLLXS2BFyrgNn4Q+UUeRlnd3NwL5DN5CE4LsaxdUiQQIBsGywgIpj9afZbeNQxvmg7T
 QgvLEV6opbbNbl2AsQQQhwriuRnpGthaT4ATEg16kRosQGrcKVmwT3XjThPOpZH+5UJo
 7LW+6Ho7l5mcR15SbnwtFTG4puer0qQkGgCqsf059qMr1ywe/OQcHNthLF56M21mcR8l
 Ez6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaQ/dJfCdG437+fDn0jEXUR/JW6M4i6g/lV5OV7wXIxUOszBxqN6D/0rUuR+ZUmklrEeNO91PnLbo=@lists.freedesktop.org,
 AJvYcCWCXMxfp9HKC6RD61bZhmz1HVfT9/9ajOklQiyBFTx32x64IvTTj2GH798JYS2XVKKwe8m6rK75Vg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFfVOlRQCDdULackmN0Xt+6HZ4andruhuPq9OChSGqGMxg21v3
 YDs/06rNmD/sU9WyKUzZ3TgR9rDZ4P/RPaN4N9AlVtRVOtMkx7D3wnzsO924NHmptj9XfS/Nlr5
 uqiq3eX48l/R2SXIA76RRmU2geZXG/FE=
X-Gm-Gg: ASbGncvMgAh6DcLgG/zxYwRPPSlwdgnLNRDZGlQakNiqsCC+ztB7b0QWm/IXF0wxw9f
 F8Jwiky3470i2UCGyohoQcQzqZfsCD8Hy3b9nWjUWsyGzxjSixPpEDYfcdTtP5AkWpsvtjAZjU/
 cZjEwSDQQxhKd44Y5hQ1KnXfo+t+3tGfOb9nDM9C1npCCcfa/wlhdAlvlSWFzgwHXs93cjOEqY0
 2HBbg==
X-Google-Smtp-Source: AGHT+IHcv7V2oazwv060W33dscTDl7PPQ1f7noMTAF+hm0IKskzHzh7MX/ZbURWbHci8ZixnjxyyZuMa+2GYUXijkPI=
X-Received: by 2002:a05:651c:1603:b0:30c:719:1145 with SMTP id
 38308e7fff4ca-3295b9f1d37mr26288281fa.17.1748298327492; Mon, 26 May 2025
 15:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-3-6412a94d9d75@gmail.com>
 <DA66HHUA8ANF.BI2FH7POFSRJ@kernel.org>
In-Reply-To: <DA66HHUA8ANF.BI2FH7POFSRJ@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 26 May 2025 18:24:51 -0400
X-Gm-Features: AX0GCFv_2H01vKjFOD3wQrlp_6f3fi8nlSDpIGif86GknHm_bqABvjuTuytW9u0
Message-ID: <CAJ-ks9kmDiOV_qH_s-r4Z4iQf2k6H7ZnqOf5okaQxWWxrj5Deg@mail.gmail.com>
Subject: Re: [PATCH v10 3/5] rust: replace `CStr` with `core::ffi::CStr`
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

On Mon, May 26, 2025 at 10:56=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> > `std::ffi::CStr` was moved to `core::ffi::CStr` in Rust 1.64. Replace
> > `kernel::str::CStr` with `core::ffi::CStr` now that we can.
>
> What's this supposed to mean?

It means that kernel::str::CStr was introduced before core::ffi:CStr
was available. I didn't check this before, but it is indeed true - see
https://github.com/Rust-for-Linux/linux/commit/faa3cbcca03d0dec8f8e43f1d8d5=
c0860d98a23f.

>
> > C-String literals were added in Rust 1.77. Opportunistically replace
> > instances of `kernel::c_str!` with C-String literals where other code
> > changes were already necessary; the rest will be done in a later commit=
.
>
> Similarly this, the message should explain the motivation for the
> change, the change itself and can include additional information.

The motivation is implied (that using standard types is preferable to
having custom ones; this is also implicit rather than explicit in
https://github.com/Rust-for-Linux/linux/issues/1075), but I can
sharpen it.


>
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_panic_qr.rs |   2 +-
> >  rust/kernel/device.rs           |   4 +-
> >  rust/kernel/error.rs            |   4 +-
> >  rust/kernel/firmware.rs         |  11 +-
> >  rust/kernel/kunit.rs            |   6 +-
> >  rust/kernel/miscdevice.rs       |   2 +-
> >  rust/kernel/net/phy.rs          |   2 +-
> >  rust/kernel/of.rs               |   2 +-
> >  rust/kernel/prelude.rs          |   5 +-
> >  rust/kernel/seq_file.rs         |   4 +-
> >  rust/kernel/str.rs              | 358 +++++++++-----------------------=
--------
> >  rust/kernel/sync/condvar.rs     |   2 +-
> >  rust/kernel/sync/lock.rs        |   2 +-
> >  rust/kernel/sync/lock/global.rs |   2 +-
> >  14 files changed, 112 insertions(+), 294 deletions(-)
>
> I'm a bit confused by some of the diffs here, they seem pretty messy,
> any chance that they can be improved?

I'm open to suggestions. I think the confusion arises from git trying
to keep code from moving; fundamentally much of the change is moving
methods to an extension trait, which means git has to choose between
keeping the documentation where it is, or keeping the implementation
where it is. If I use `--patience` then everything moves together, but
then the diffstat swells. Thoughts?
