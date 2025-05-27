Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A949AC520F
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 17:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69BA10E044;
	Tue, 27 May 2025 15:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e4E2HF9e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B2A10E044;
 Tue, 27 May 2025 15:31:43 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-32a696ff4deso12741301fa.1; 
 Tue, 27 May 2025 08:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748359901; x=1748964701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iznhlCHEPeP5gtUawFfO/CMtIcM+gezphiFD8zog8f4=;
 b=e4E2HF9eljn9OQd6xqBlcbRe5sxBV7Y9+TZhjqp7duQ5QjFteB2k43Zk1NCOgnd97M
 GjWg7j3LHz6Q6nKRCJkAlR6uMnOi3tawv/hIiBLIlACgaA0+ubZMzjG24Fdr/Xp7lxiB
 Pbg1SVpydUZ74HmOIeAapSlrv29aHS3Phfmu6ZYpuldfRhCIu+DOaJUrcN7Dh7R52N/K
 UwpevdhSR+nmPOENHnK6/sBkBX3gcC+QOYLpJcPYvg9X8or+9YeOelLtbQS3yRmzP8T4
 8TxVnR7clFBMYchH010Kum1tn0IvLAaOA1XiE2571zpwj86dkLrwA/2kt6loQl2xDrlm
 ZCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748359901; x=1748964701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iznhlCHEPeP5gtUawFfO/CMtIcM+gezphiFD8zog8f4=;
 b=lOCVpdF7VWKdzMo2vqwA04dpAai1Gq2Xb/UsdaHMOEwD/XOOD60MZyq5zbrfG3hLaP
 1yJj1DZGG/mb1VkSvDKktF8OG/+/WEayW4c9xDZ0Qe8eQrUevjIoUzKLJul+YwyEb9q1
 Nqrw2y+ZInsbUeCuguCcnobB0FySsyrfIIcxbJOExGmwKF1FK27MVDFyiNRpGSDhGF+b
 Uff5nuwS0MsIy1WvunedzpIZEOXT1ovCjFu315crz8W1yOBEtyi7p4zJzSAooC2D5CJE
 wzpLtDF0PC5s4KzYbhfnqak0ewaKmTmpxJE/Z8SRc03rdqv2wjFg6bSIOcMYsmFs34M8
 eEVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0yAvKT4A1A5dybO66AgFhiik6/AJpORhSK3JalZ2pGvylpO+BkAa2fF3pqqs6CVOiLEeZouT4gg==@lists.freedesktop.org,
 AJvYcCWQH5TkDlD6zOtck+v9KGR97SzRugcaODBgOVqUzShOolFnZFarOIv+b6eGTrQNiCPFCDiP2i6+Uvw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweONwCN1u7E0uWF/VKRmaFecExzi9ZzvNytx4pG9vC2p2JEqgj
 KAGnMx4m0ac9Icd4TBsgkww6HtiMpJfYVgzuTJLxqzj/KNSfP7sx/9kRxWFm2+KNiFBx7r1LJXs
 4H+6A5tg8qXkUimHusadNeH6NvQVV1YU=
X-Gm-Gg: ASbGncvQdK/SD7AiUy1wZDL6k49berJtbJaZbzNC2om8hG3EOSIXEMiwC7V/Hy0lhZO
 +VhUvdeogQYo3+/r2JXzD/GJA1/arIRhI9TKYpsi07OKrNZ72dVjOJuuKtdt9q33e+2uV5VGBfJ
 rcUCEEOwUW34W/+x2h3mSOoUdhfF80EvGSws/aHVOCRgWgS1vH
X-Google-Smtp-Source: AGHT+IGh7j3R2Lz5ku1NP2jO6jmUvppwAP/M8QfRt/BCMIbepGXx0xkMd+/B+0FfsH2Ts/09nLW8pSm9EZf3hMbUgb0=
X-Received: by 2002:a05:651c:304c:b0:30d:895d:2fa5 with SMTP id
 38308e7fff4ca-3295ba248d3mr26953991fa.14.1748359900905; Tue, 27 May 2025
 08:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-3-6412a94d9d75@gmail.com>
 <DA66HHUA8ANF.BI2FH7POFSRJ@kernel.org>
 <CAJ-ks9kmDiOV_qH_s-r4Z4iQf2k6H7ZnqOf5okaQxWWxrj5Deg@mail.gmail.com>
 <DA6GUB3YOVBD.RWGBCC8CTE7K@kernel.org>
In-Reply-To: <DA6GUB3YOVBD.RWGBCC8CTE7K@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 27 May 2025 11:31:04 -0400
X-Gm-Features: AX0GCFt3TZm7A3lWw22HaGxbcPpRtWDbLI6U-f3H-j7VP2POqxnjTzuj9-Y7MDw
Message-ID: <CAJ-ks9mCZ5rKUFmkM=KPdw=gALjCjdMrMzedu89w7TxwvPyREg@mail.gmail.com>
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

On Mon, May 26, 2025 at 7:03=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Tue May 27, 2025 at 12:24 AM CEST, Tamir Duberstein wrote:
> > On Mon, May 26, 2025 at 10:56=E2=80=AFAM Benno Lossin <lossin@kernel.or=
g> wrote:
> >>
> >> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> >> > `std::ffi::CStr` was moved to `core::ffi::CStr` in Rust 1.64. Replac=
e
> >> > `kernel::str::CStr` with `core::ffi::CStr` now that we can.
> >>
> >> What's this supposed to mean?
> >
> > It means that kernel::str::CStr was introduced before core::ffi:CStr
> > was available. I didn't check this before, but it is indeed true - see
> > https://github.com/Rust-for-Linux/linux/commit/faa3cbcca03d0dec8f8e43f1=
d8d5c0860d98a23f.
>
> I see, then just write that and mention the commit.

=F0=9F=91=8D

> >> > C-String literals were added in Rust 1.77. Opportunistically replace
> >> > instances of `kernel::c_str!` with C-String literals where other cod=
e
> >> > changes were already necessary; the rest will be done in a later com=
mit.
> >>
> >> Similarly this, the message should explain the motivation for the
> >> change, the change itself and can include additional information.
> >
> > The motivation is implied (that using standard types is preferable to
> > having custom ones; this is also implicit rather than explicit in
> > https://github.com/Rust-for-Linux/linux/issues/1075), but I can
> > sharpen it.
>
> Please add this information to the commit message.

=F0=9F=91=8D
