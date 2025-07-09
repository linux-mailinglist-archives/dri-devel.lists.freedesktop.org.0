Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867ADAFF379
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 23:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B7C10E867;
	Wed,  9 Jul 2025 21:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U83rlo5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6873610E867;
 Wed,  9 Jul 2025 21:02:08 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-32b31afa781so2085351fa.3; 
 Wed, 09 Jul 2025 14:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752094927; x=1752699727; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/NYN5eCrplLxDbEYSWBaln4nRDogh/r4mbR4dmIqRU=;
 b=U83rlo5Vbl+IpEzkG5TUJl0ENwObKNmgPxeGDaAQf4WhqHKTRSg00dYhhCB54YnDSS
 uY91M/hDI/QDNy2RJzIYDcA9IhF2H3ADt1cstiQKRluWFfjzeIluEpQVyKpxSMoWcc9S
 X7dtUpRGflvr1dZR8VPPBPdpyWT6xz4hF4CTPBp9kOPEXAyC/RgZsm0Z2QZIrYZonN6y
 KVNq0cGwD1nq+nKarPlsP+a2uGOSpo7OP99tSJahEC8tYdUI7cf0VQOWXlFGO121F++n
 CYy2/qUlmnHjwkZH/9/zVprd/ui+bZAZ70Qn7KeqZTdBhSjnrH61KCfCCRG+arseI6U5
 GKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752094927; x=1752699727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/NYN5eCrplLxDbEYSWBaln4nRDogh/r4mbR4dmIqRU=;
 b=MWytniu9WeP86vr5c8Coq6NhMQP2jPXTq4gbs2xEgmw5RdmoLnCl/1kTTkMPxsX9fi
 8Wt+rLuA6yhSmB4YNY0yH7X+ObJsmqMzsvhC7CDkHcButqF8j/K1QIfw1yjSPl2kdbib
 +3tcjwfxsk1oqtPfmS1PEbjKjnnGt7EuwG/3K2LZaM/eex7M8MScw/6Gaye3wY1iSavD
 0xUyJWxwOqgQ95aGgJjNrf4C4u1xX7ZZ5CTBdUF2+DmNrU8ZkP2P6AYQ9CuZmGDNTqLb
 tbc9BVqNo+veE0PI+TLO3M5PnrO+ai3ijraltGGhh/9zv6WK29vPHNDbpiJeZ2CtgAHx
 w/Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFARe5IwtbYAdd030bQFJUOkPX1wdQvYHklTwrm0cRByDjWFJxo0GaDJHME03BNFQtYggJZQwSYYE=@lists.freedesktop.org,
 AJvYcCXJxrhKjKh8gYbUr1gtNfljMamXkMm1S1PuPVFcbZwWl5D9yVqPQJ77W1ZwGw3tFIvDGcD8eefmqA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz26LN2ZmbDFN39o11fNb2oPCYmTmcKorC6a9B3fXchAs477esO
 vR6TjDmVlmkZJqnKmfOi2aNe3bwe/zhwSnazS7oyHCVXrYHpo8P1YM1N9TdUIO1WJR8Hln9BKc5
 6aXV/3JCQbbP7QHEswLT3dC05DbgCkts=
X-Gm-Gg: ASbGncuBv2hJeHb3GcZjVWt9ojo7N22CnhKHaJ7JYknVYzl6sgBsW0H4Zdjrutv+XzY
 Z+3BcNTbwxkHlA0NMnSm1K+wogkIaxfLQQCJlJpKEHdGG3nGuKE19a1g8IESGueAlAqDPftK9tP
 bHT/npLZhhoV5Dg216FFxek8U1eyYBioy0+2ELVR8ZszN7
X-Google-Smtp-Source: AGHT+IExWIJ6hhfEb6UoxlwctM02YNDW0TZ2aarCHGVCLMDXTN2AKn+P851gVPEhqrddHdHhddIZDLinIFW32pqJpSE=
X-Received: by 2002:a2e:9d09:0:b0:310:81a0:64f7 with SMTP id
 38308e7fff4ca-32f5011b1ddmr2792091fa.24.1752094926332; Wed, 09 Jul 2025
 14:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
 <20250709-core-cstr-fanout-1-v1-7-64308e7203fc@gmail.com>
 <DB7SVTBZ46QB.31WTHFLWDHPZY@kernel.org>
In-Reply-To: <DB7SVTBZ46QB.31WTHFLWDHPZY@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 9 Jul 2025 17:01:28 -0400
X-Gm-Features: Ac12FXyhsUe6smRBxo6FiBw1g5N18SKhkX08Ac6QMkarBxohB2ddH5MIOdKITP8
Message-ID: <CAJ-ks9nNc_pThtb+gHUcjEnvR6V0RAEG0tkv+_DHYYjXs1N7=A@mail.gmail.com>
Subject: Re: [PATCH 7/9] rust: pin-init: use `kernel::{fmt,prelude::fmt!}`
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
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

On Wed, Jul 9, 2025 at 4:18=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Wed Jul 9, 2025 at 10:00 PM CEST, Tamir Duberstein wrote:
> > Reduce coupling to implementation details of the formatting machinery b=
y
> > avoiding direct use for `core`'s formatting traits and macros.
> >
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  rust/kernel/init.rs | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> I usually prefix patches to init.rs with `rust: init`. I'll fix it up
> when picking the patch or Miguel can do it if he takes it:
>
> Acked-by: Benno Lossin <lossin@kernel.org>

Actually, squinting at this patch more closely now, I think this isn't
what you had in mind. The comment says "Dummy error that can be
constructed outside the `kernel` crate." but the error now comes from
the kernel crate :(

Perhaps you could suggest a different modification that would both
meet the original intent and allow references to core::fmt to
disappear?
