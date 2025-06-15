Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADD6ADA3A6
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 22:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C2310E22F;
	Sun, 15 Jun 2025 20:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WihhFccw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CD610E07A
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 20:41:56 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-32addf54a00so31743911fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 13:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750020114; x=1750624914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m8tUEHrU+aAiCA1wzd/2v+KwHHK/16tsTm7dd1xb+Qw=;
 b=WihhFccwGSHBQUH9Aa1Io4r+6BNenTJdfA4honkheQMKRBg44fP8ITjojHsqS2neiF
 BCWJ10NHIGDVgQg803ZBDyfefq+zHmdIA14VIZ7lS02nnd2vth9XTV2/ITHxggPHz7E6
 WeWs6cZPHawy99U0mgb7cLf4iukIeccVDjhqdY9HEOkdki7E9QLulb/1z4ZRlKBilWaK
 TmoAuTpkoa7HV2JFcs4H5uaLw2Rb5iPUD6RB3WodaZyWhuqQVRrR5Xl0xEdqehzM5vIY
 dGFm9aA5EuQBUyLGb/DgSF1Zg8zpp8fuca5vThLnIGsOG7Z/TkUG9rVJ1uxY1vOO+cAy
 Rzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750020114; x=1750624914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m8tUEHrU+aAiCA1wzd/2v+KwHHK/16tsTm7dd1xb+Qw=;
 b=MwRkc2mtuNthvUXZlCYvjEmtxYXUzwl3OTdPHXxX+5/+bKb1NuTu3AzrXl3J7AyXYn
 uozdCbdK1Ld8J93PVBd//OJrvzDz5NWK0W/8gEiEY0VxLYGiYgUu6InhtoHZATXXLRvV
 zXohgETrqHYRxCaBrfpZY2VfLZG6j9EmMsPkFZR2eti4tNOlTgkYl5Yz5Ew6R73A4qm3
 tql7hAm58XX16nAnrvjuw/V7BxdbQo+YhSfjKY2yw0E0Vn91RaP+N9nj4xVrnSD8HT27
 madgz3MH0oHrWf9AGfKHgrmTcrJ4sHJfgQqFk4u9JR0ckhR8YTJNwdLUgHS4SW40RK1D
 mhVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrAucc0Qi/ngPNZNtYB3cmr7Xuyb76wSI+7XDagrH8WaG+S1x38PtghxzCmkbr56WtRz97XMPOT3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJ/UO+573vWb1+LMU+XoJps+9zsy6B8eXtRdJKYPL2FMHlqM9s
 BvmMuksKkIW3zUa0qAJ0qZcrO1Dtv2kdy+u86a0hWzPqg/xkNGQZ/7wG/JgSNER5FayN0UmAHcI
 uW4AGvstzmeXlfuFfek1N9o2Lu/XY+aE=
X-Gm-Gg: ASbGncsEJmAsXTzmrMOlVzVJtPEmECcjN5FXTEel8YzmpzPS/neZEOwR7c/oe0OCwGd
 piWJQQU0Oxvz/7MsS2um1UcwZutwDnNGiCuykgnV9x9bnRGBMGv48TfJugOlBrDAVerxEqmmK2W
 ZqVAq9QVgapk+r+nL+PizQXgYX+7PWwNGMs/0uVRfGTHMCqTyTS1Im6OWQAnvW7ywUbBPjAkMac
 YGA+Q==
X-Google-Smtp-Source: AGHT+IF17qm+FSbVV14Pg7FJ215dDeNSyp0hu+3UB0vAUnPJ/I/b7hzjcOF97wvz/4vYu6TXyZ0HeK2zzMOU3xxjgxE=
X-Received: by 2002:a05:651c:507:b0:32b:3cf5:2ff3 with SMTP id
 38308e7fff4ca-32b4a5a5c9cmr14597681fa.22.1750020113944; Sun, 15 Jun 2025
 13:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-ptr-as-ptr-v11-0-ce5b41c6e9c6@gmail.com>
 <CANiq72m1ZWxPgCda1C-8X5XOvEq9Z9JfJZqhU4ZUzZ64=N+2fQ@mail.gmail.com>
In-Reply-To: <CANiq72m1ZWxPgCda1C-8X5XOvEq9Z9JfJZqhU4ZUzZ64=N+2fQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 15 Jun 2025 16:41:17 -0400
X-Gm-Features: AX0GCFsBQDbpDdusKYtZ8m3QzN_wjkIx6XFjpQUGjjmQDdCD-7AoaM2XitZK-IE
Message-ID: <CAJ-ks9=eWA-CCJn32cVQZhBnz=dgjPTt6av0Uw2m+_nfRXYcbA@mail.gmail.com>
Subject: Re: [PATCH v11 0/6] rust: reduce `as` casts, enable related lints
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Fri, Jun 13, 2025 at 2:14=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jun 11, 2025 at 12:23=E2=80=AFPM Tamir Duberstein <tamird@gmail.c=
om> wrote:
> >
> > This series depends on "rust: retain pointer mut-ness in
> > `container_of!`"[1].
>
> Not anymore! :)
>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Thanks for rebasing, Tamir, I appreciate it.
>
> This has a bunch of hits in configfs, cpufreq and Nova [1]. I guess
> you built without those enabled.
>
> Could you please fix those? Since this affects other maintainers that
> we need to ask the Acked-by to, let's try to at least give them the
> final state.

Oops, I missed this email! I will send v12 shortly with these fixed.
Is there an easy way to enable all the relevant rust configs?

>
> Thanks!
>
> Cheers,
> Miguel
>
> [1]
>
> warning: reference as raw pointer
>    --> rust/kernel/configfs.rs:429:9
>
> warning: reference as raw pointer
>    --> rust/kernel/configfs.rs:467:9
>
> warning: reference as raw pointer
>    --> rust/kernel/configfs.rs:479:9
>
> warning: `as` casting between raw pointers without changing their constne=
ss
>    --> rust/kernel/configfs.rs:564:48
>
> warning: reference as raw pointer
>    --> rust/kernel/configfs.rs:721:39
>
> warning: reference as raw pointer
>    --> rust/kernel/configfs.rs:764:35
>
> warning: reference as raw pointer
>    --> rust/kernel/configfs.rs:783:35
>
> warning: reference as raw pointer
>    --> rust/kernel/configfs.rs:764:35
>
> warning: reference as raw pointer
>    --> rust/kernel/configfs.rs:783:35
>
> warning: using `as _` conversion
>    --> rust/kernel/cpufreq.rs:650:45
>
> warning: `as` casting between raw pointers without changing their constne=
ss
>    --> rust/kernel/cpufreq.rs:650:45
>
> warning: using `as _` conversion
>   --> drivers/gpu/nova-core/driver.rs:22:64
>
> warning: casts from `u8` to `u32` can be expressed infallibly using `From=
`
>    --> drivers/gpu/nova-core/regs/macros.rs:267:26
>
> warning: casts from `u8` to `u32` can be expressed infallibly using `From=
`
>    --> drivers/gpu/nova-core/regs/macros.rs:267:26
>
> warning: casts from `u8` to `u32` can be expressed infallibly using `From=
`
>    --> drivers/gpu/nova-core/regs/macros.rs:267:26
>
> warning: casts from `u8` to `u32` can be expressed infallibly using `From=
`
>    --> drivers/gpu/nova-core/regs/macros.rs:267:26
>
> warning: casts from `u8` to `u32` can be expressed infallibly using `From=
`
>    --> drivers/gpu/nova-core/regs/macros.rs:267:26
>
> warning: casts from `u8` to `u32` can be expressed infallibly using `From=
`
>   --> drivers/gpu/nova-core/regs.rs:35:65
