Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B12CAD9441
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA2710E1DC;
	Fri, 13 Jun 2025 18:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CEPwvsCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC5C10E1DC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 18:14:54 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-235a6b89dfaso3342985ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 11:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749838494; x=1750443294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wF4gp/2m+krKdbuHM8VFo8aUcpegmRfbsaqd6bWd3zs=;
 b=CEPwvsCF9gVyyX3ZTkYfL/Ufxj200MoQJrq/r05Ocru+QZ21K5NxlLR9k6Q1qhsvN+
 c5P4T1qzWcncdFcSrJhfdduDgcwhIcdvUfL5DQtrGqGydGy4fVKsIIfq4JdTM40wkL/R
 OCHWCvidCHwUp8CwkilvU0NFljpAMldBOGDIv8zVl7HQqlMQQdYijk2wRAbEc2GZtJmp
 A0RpeDu0Sg+vucoUhAPTjwiGtQT7xjc4rtWrhcDmbAmzWR6PNIZw3DyH9YEuqLW/z6f8
 7YS2H9w2voAax8qGec63wGyuqEltIN/AfLv99J2bdD/9GStNGCWd+6Tj2ImhfoIRzMoi
 cwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749838494; x=1750443294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wF4gp/2m+krKdbuHM8VFo8aUcpegmRfbsaqd6bWd3zs=;
 b=R86jrCXRhOCKJUEt+Bpxd9yateF/+SEOaKobeKunt37iX0+LBVevXy+Lobd4xofdNv
 n+H4sFNo5qG7DQaKvG+9c84AjAX7qePYMpZNddGxG0DKJwOtvb142hGXSTUyl5+SjsYa
 VzItrmoyXY37pwHFHU2g0dGYQbHfj24KmVq6qa1jl3GUhkSKEkeTkxTm1m0GEIAPkzYR
 GVuGqbiPI1g8yTNc5XQUkgbgVTFZ1uecokkxoSSQlzqgUIyHhQJq37ONI0bI40dHMszM
 n3/XkABG97D+HAMNHJloBkgadIax3qCUlbh893CHBeOP9tcN/7pxdEALxHENgAy8vrSy
 zoMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnGlGP73JLHYMUJP9V4o3MMI31nx+MeoIpacmiaSORAm8oynY8zDuVawIAtZxMy7vxaTneA8L/3Pc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8HsU+GxhToVv7A0fbwXO7e7azOysl1Oar9smLrr86sejY8BAN
 e6eTedxk1RmFrRMGOCCd3ebJuavsUssLmeKjIf+ZqS82Edu/jaRb08bE63Q/mf9W2IpVCNH9alR
 u/hRh8Z7/ZshUJ/dHStpnKKU2IFNYtrk=
X-Gm-Gg: ASbGncvlLjBUkeosrOCaCRRSSu1hB6sdBiwruMdvn6DRXbP27esRJYtg89l5MdKwQef
 hXkivjrf4p8MeC+XnAFBJxQ0AXuzTzkpt3tk76FJpdICUwrN9v5ZZCVx95nkjG5pTE/DhSDC1yw
 G4QUu27swxeX5OSJhgA7g7mqegKLGmMDEBVDvAQ8+wABY=
X-Google-Smtp-Source: AGHT+IFYalb1OTW7qnfDKSlOci9VWDAXekpMbN5b2vtf3GW8ZUpuOTwRiHQFxL1wuWQtjgsw7eVkO7CajlLxN6YkM2A=
X-Received: by 2002:a17:902:d48d:b0:234:d14c:50ff with SMTP id
 d9443c01a7336-2366b00ba59mr2634725ad.6.1749838494222; Fri, 13 Jun 2025
 11:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-ptr-as-ptr-v11-0-ce5b41c6e9c6@gmail.com>
In-Reply-To: <20250611-ptr-as-ptr-v11-0-ce5b41c6e9c6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Jun 2025 20:14:41 +0200
X-Gm-Features: AX0GCFtsUq0DPj-o5G6erQ-PfWcX7A0QtacSDQOlDe1Lx8EsxSkeObOaFNw6_Co
Message-ID: <CANiq72m1ZWxPgCda1C-8X5XOvEq9Z9JfJZqhU4ZUzZ64=N+2fQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/6] rust: reduce `as` casts, enable related lints
To: Tamir Duberstein <tamird@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org
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

On Wed, Jun 11, 2025 at 12:23=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> This series depends on "rust: retain pointer mut-ness in
> `container_of!`"[1].

Not anymore! :)

> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Thanks for rebasing, Tamir, I appreciate it.

This has a bunch of hits in configfs, cpufreq and Nova [1]. I guess
you built without those enabled.

Could you please fix those? Since this affects other maintainers that
we need to ask the Acked-by to, let's try to at least give them the
final state.

Thanks!

Cheers,
Miguel

[1]

warning: reference as raw pointer
   --> rust/kernel/configfs.rs:429:9

warning: reference as raw pointer
   --> rust/kernel/configfs.rs:467:9

warning: reference as raw pointer
   --> rust/kernel/configfs.rs:479:9

warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/configfs.rs:564:48

warning: reference as raw pointer
   --> rust/kernel/configfs.rs:721:39

warning: reference as raw pointer
   --> rust/kernel/configfs.rs:764:35

warning: reference as raw pointer
   --> rust/kernel/configfs.rs:783:35

warning: reference as raw pointer
   --> rust/kernel/configfs.rs:764:35

warning: reference as raw pointer
   --> rust/kernel/configfs.rs:783:35

warning: using `as _` conversion
   --> rust/kernel/cpufreq.rs:650:45

warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/cpufreq.rs:650:45

warning: using `as _` conversion
  --> drivers/gpu/nova-core/driver.rs:22:64

warning: casts from `u8` to `u32` can be expressed infallibly using `From`
   --> drivers/gpu/nova-core/regs/macros.rs:267:26

warning: casts from `u8` to `u32` can be expressed infallibly using `From`
   --> drivers/gpu/nova-core/regs/macros.rs:267:26

warning: casts from `u8` to `u32` can be expressed infallibly using `From`
   --> drivers/gpu/nova-core/regs/macros.rs:267:26

warning: casts from `u8` to `u32` can be expressed infallibly using `From`
   --> drivers/gpu/nova-core/regs/macros.rs:267:26

warning: casts from `u8` to `u32` can be expressed infallibly using `From`
   --> drivers/gpu/nova-core/regs/macros.rs:267:26

warning: casts from `u8` to `u32` can be expressed infallibly using `From`
  --> drivers/gpu/nova-core/regs.rs:35:65
