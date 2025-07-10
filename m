Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A185B0032F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 15:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0F910E8DB;
	Thu, 10 Jul 2025 13:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MyfFEi35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBACA10E8D3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 13:20:55 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so831476f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752153654; x=1752758454;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/d3JWJXTPbcoiacIjfsqcFG5gW+YCew8k+ctgwhFlQI=;
 b=MyfFEi35Kr+iTzjME+6300aKpTDri+yX3mWlIXak2qCzVTs3JAOlRMCA80J3EQepuu
 uy8Gcs1mDuhOngjSMj0kmKK+lGDEfLs0eYgzap3ynWvN/F3kCY4sIHbnJ6FqOR5Dq9lo
 mCgu506a6Qw/qBUjgkmoWhR9qAaR8cGA81xF9Lq0OW6Eo5HUNXtCJNa6J6pTf88tpJg7
 BEhzno2P7lE7GiRub2wEVLoQ8lTRFhHPv11gGONkb7FkVHdq+FrRL9s1ONzhvlHEV5GK
 ot7FHCAYrmIR4XEdsMwVjS7iqyRPZrsahVXnQm3Wnh5jkFVcE/CX4eRYvGj0n0/2MwFS
 N9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752153654; x=1752758454;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/d3JWJXTPbcoiacIjfsqcFG5gW+YCew8k+ctgwhFlQI=;
 b=QfA7edhQrFyQfocbAc8MxSCt4z+rtH5waXKKD79Kl8cg1heQeJdpy2BAnB//0roVxn
 ZqzsD2nWHEns624sFM+bfg+hrLsj59jZLzB+HH0e1ob9j0Wd+tT6dVdV/Iu0Ujsfmglf
 G5/rIQYuawnqzLQLgLszcUDiAaFLsxDrOeqo2xe5HBDPhRrsd+d7gr8ucXN5AyW0v6TH
 iXikFoNAKvACWAMnoQcwZ3vpGIxP02yu/Q+W/C4l3YEiev7DSAKO/o4z7qOEv/kN14Em
 P25uw7bVV4bM7iLneZLKBS3Aj15v5xOQtKliKv/YW2phw2a+aHa8PCiHrp/NcUu2abSM
 2bHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwZOUmYyr59KigDVSI8vB7L5bHUJ2pBDGQ8DyVo7KaJGv4kPZwe48hGhcWuaK0KRCkwa2RsjO90DE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9haUiRa+E69OdDMU5XC5/p7eNkknGV35iTEdP7xQKI8ESDrdK
 CK4NB9nRSHO1/ViiOgHWI+PQzj9NvK2ZxY39gqi0G1OgsBQSAGnjmLnptN6Se84HvvC4IOdz1J6
 Zqg60VXE1ADd07CR6PRJKBAUqfeMInSBM2uRL087A
X-Gm-Gg: ASbGnctRUWW90OisjoQwCESSSnox4Sa5wK7RXBy8WjE1EWo9YgZE+3nVQcFR94DcBAt
 Sd8dkzfVqKcjvTVBXhNqHzaNS6qvzHAsHtasPFUymP8Jg8taCTPBbs3moRMWPrBEYRKIgaec86z
 z8hGO3Q40vVp5RRUBkdH/OP2U+SgHSesknf5ceXWhPRSmdce27f1EZa/CZoJue12HPczyo7/y96
 w==
X-Google-Smtp-Source: AGHT+IFujM42vH3V09euhJ0T7/vZlUGl5l2Mqd+XJHCpPSNb1kApqRjCh9Jtd3SgLVxJgkK09tgAyiBl1EsMOOSUJIA=
X-Received: by 2002:a05:6000:2806:b0:3b2:e07f:757 with SMTP id
 ffacd0b85a97d-3b5e788d3d0mr2685032f8f.1.1752153654256; Thu, 10 Jul 2025
 06:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Jul 2025 15:20:41 +0200
X-Gm-Features: Ac12FXzitYxvRbQjbTDWexl7FT9vfcJPNeta0DSIvcawfTODepd7_rNw8p5wCA4
Message-ID: <CAH5fLggU_DsJ4-gj_xBeGgG8mS4CSrypNsmOqu6c677Lyyvqxw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Replace `kernel::str::CStr` with `core::ffi::CStr`
 (cycle 1)
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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

On Fri, Jul 4, 2025 at 10:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> This series makes preparations for the replacement of our custom `CStr`
> type with the analogous type available in `core`.
>
> As this is a large migration that touches many subsystems, it will take
> place in several cycles, each of which may see multiple series:
> 1. introduces facades in the kernel crate that downstream
>    code can reference. [this series]
> 2. migrate downstream code to kernel crate facades. (N series, divided
>    by subsystem).
> 3. replace kernel crate facades to allow `Display`ing foreign types
>    (such as `core::ffi::CStr`). Replace `CStr` with `core::ffi::CStr`.
> 4. migrate uses of `c_str!` to C-String literals. Replace references to
>    `kernel::str::CStr` with `kernel::ffi::CStr`. (N series, divided by
>    subsystem).
> 5. rename `c_str!` to discourage use. Remove `CStr` reexport from
>    `kernel/str.rs`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (6):
>       rust: kernel: remove `fmt!`, fix clippy::uninlined-format-args
>       rust: kernel: add `fmt` module
>       rust: use `kernel::{fmt,prelude::fmt!}`
>       rust: str: remove unnecessary qualification
>       rust: add `CStr` methods matching `core::ffi::CStr`
>       rust: use `core::ffi::CStr` method names
>
>  drivers/cpufreq/rcpufreq_dt.rs    |  3 +-
>  drivers/gpu/nova-core/firmware.rs |  5 +-
>  rust/kernel/error.rs              |  8 ++--
>  rust/kernel/fmt.rs                |  7 +++
>  rust/kernel/lib.rs                |  1 +
>  rust/kernel/opp.rs                |  2 +-
>  rust/kernel/prelude.rs            |  2 +-
>  rust/kernel/print.rs              |  6 +--
>  rust/kernel/str.rs                | 97 ++++++++++++++++++++++++---------=
------
>  samples/rust/rust_print_main.rs   |  2 +-
>  10 files changed, 83 insertions(+), 50 deletions(-)
> ---
> base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
> change-id: 20250704-core-cstr-prepare-9b9e6a7bd57e
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
