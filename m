Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC67AC5215
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 17:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C1F10E501;
	Tue, 27 May 2025 15:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HVkhE72+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C22310E501;
 Tue, 27 May 2025 15:32:10 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-55220699ba8so3556985e87.2; 
 Tue, 27 May 2025 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748359929; x=1748964729; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6xak8pIYLubcnK6pBqvVQcKCjzEoRL1YIbbP2xw0LEs=;
 b=HVkhE72+jZV+p6NUoZZav3i2LoRORA/weF88jnRjLvgNaP3AEUCop965wv3dSfDfXj
 bad/j88RKHCSoVTWBdKKeEZ5E8XKB4Dag5nIvdppN0GQuVfO+M49vNNu9EFhWTj1+Yoq
 PZKXEWkjA8gDoFtvhDBuHrVowll8M1mkrLpcvhsOXyS/83D21I/UzaN5q3RydUD97nsW
 L/dGn5jJ6WivXN+mdDNmS5bJ3LoCXnxTBerX/9Hi/0nTBtW6P1I0AXAfhVjg/rGK8rNZ
 cCo5ELQbh3CWBvc57ZoOxS4tFXg79PNKhFUDpQ89STgwa2j6f+kIqx/oDTVOYvGXUX1j
 hOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748359929; x=1748964729;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6xak8pIYLubcnK6pBqvVQcKCjzEoRL1YIbbP2xw0LEs=;
 b=b/PRoijFkTU8TkF0WDkxh9/tHHjHx7j3628tG5ay8Ab+58kUOnVs6kfGTLFegEb86B
 nTM5tvYgAALQtpPqKlohB+yvmWHmnntiKRd27wrTY36a8wgrKG2ZbAK8KgJ5QZe8MD62
 WwLnmE9gs9u41HehZEOXlFrUh6Vh6nXQ4/kmPx4B3FOxtoboCxUpDkDZONvfEIuBdnnJ
 /xNT4l4jAbBHxohhvjEWk/Z1hZrvJ2IsvkPPyhnOKbuPpa6fOFbkn8xfUSGnNK2AGWgX
 KNpnuj3lJIm2sx3Lcv/QZFsyikcawS4yZjo24SeJq2sFbDREn4V5BCkC7ho1Tme1llrW
 oqtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0BIncMfvIBwn1yCL3NDWUMs3P/f0UBbn9tHOeL0z6nbjLQqGzDKw4I4DLWRStDEVUGSi1p2V5xtg=@lists.freedesktop.org,
 AJvYcCWPlBA+D0torUWkwcwuidw2Kl8EU9VbzqDUDJiQrMT1EIvwSnw6bYGrWWKAZeiRDWaPejZGO2DP0w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJuVTyXXRRRckvBdElK4t6fxVQY774+ZVlhdOuKWZldFP+Ttcj
 v9MAYAiwG4NyiwuH48UBvL3IQImSns2hhj2rG3GXAwxN8Mt1ZEuL4pgqgEd6Blo1WWREqBjWfSJ
 8H5rZuhhEqtgoD4k3B6MFVm1riXgO5wg=
X-Gm-Gg: ASbGncs8iDWjg7n0QkUqMYwhmOKEPgSg9wThKYDq/a6FGmAE//Q8MON1M9CqGDsdFQl
 vo0pmWVx7NhJw93NoQCKRMoFcGBqUP7s+Zxm5xCEIbgq8ByAqKB0PkUbrVAWUrjSPr9O3eX9ezz
 6lZZQKiRCFDQSz+KQ4yk8xeJpjWuxaAj8JkH5t560WQtjX+Z4Q
X-Google-Smtp-Source: AGHT+IGvM6m4b/lOw7Cp3xhdEUvITDXLXKyTA8U5LnOCkoop3fcnfDwhYylu9Lc+nCvgTUxjeVkZb8rgZTfeSHv0dQ4=
X-Received: by 2002:ac2:4c41:0:b0:549:38d5:8853 with SMTP id
 2adb3069b0e04-5521c7addf9mr4617901e87.17.1748359928583; Tue, 27 May 2025
 08:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-4-6412a94d9d75@gmail.com>
 <DA66NJXU86M4.1HU12P6E79JLO@kernel.org>
 <CAJ-ks9nd6_iGK+ie-f+F0x4kwpyEGJ-kQiQGt-ffdbVN5S6kOg@mail.gmail.com>
 <DA6GWYHOSTWH.1OBQV7XCU2643@kernel.org>
In-Reply-To: <DA6GWYHOSTWH.1OBQV7XCU2643@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 27 May 2025 11:31:32 -0400
X-Gm-Features: AX0GCFuUtwm-Eot6MMjkQOKkHLHoljek9W49DxDhFIb7DRDERITQ1VimQxG0kN0
Message-ID: <CAJ-ks9=gW_viqDMQwyVeGfT9821tfZ7w-4Tycd7e7bZ3xKwXRw@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] rust: replace `kernel::c_str!` with C-Strings
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

On Mon, May 26, 2025 at 7:07=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Tue May 27, 2025 at 12:29 AM CEST, Tamir Duberstein wrote:
> > On Mon, May 26, 2025 at 11:04=E2=80=AFAM Benno Lossin <lossin@kernel.or=
g> wrote:
> >> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> >> > +macro_rules! c_str_avoid_literals {
> >>
> >> I don't like this name, how about `concat_to_c_str` or
> >> `concat_with_nul`?
> >>
> >> This macro also is useful from macros that have a normal string litera=
l,
> >> but can't turn it into a `c""` one.
> >
> > Uh, can you give an example? I'm not attached to the name.
>
> There is one in this patch (:
>
>     diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
>     index e5621d596ed3..09148e982f48 100644
>     --- a/rust/kernel/kunit.rs
>     +++ b/rust/kernel/kunit.rs
>     @@ -58,9 +58,10 @@ macro_rules! kunit_assert {
>                      break 'out;
>                  }
>
>     -            static FILE: &'static $crate::str::CStr =3D $crate::c_st=
r!($file);
>     +            static FILE: &'static $crate::str::CStr =3D $crate::c_st=
r_avoid_literals!($file);

Great point, and an easy one to replace with a c-string literal. Done in v1=
1.
