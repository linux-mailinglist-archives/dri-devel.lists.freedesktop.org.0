Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FC3A4B8AF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F67810E146;
	Mon,  3 Mar 2025 08:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="P2Vyh8T8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC59E10E146
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:06:03 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-390effd3e85so2744466f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 00:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740989162; x=1741593962;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0iUVs2ZQh+M1rl5kLkJ/YPcqr6UkD+Cttj33+uPFnc=;
 b=P2Vyh8T8gSIsEEy+kfFdY8mtlHLUeNTgaYDaN+dBI5QOqFnx8tGnE97yA/NrIHfCmu
 j4PlT36MNM2SouMK5rB2DXnO55O3jDUrIhuGA2C0gRhStIFxNKjRjjBZ148i2zar5RtY
 kg1+47B3LRGu/f8XmEIH7mcmQZvIL5azEPa/zhns0NCpmk3BWBkc67uIHVH3jUkQ2qb5
 eihp0HlBElgEQgH4wODej/7VOQG+TfX5HF8BZk3D5AQ9VHZ4xdHEp/dj7V64ikWMl62r
 s9pg/hFRtx+JWcLl08pnRnggyV5wjIdVh6GntAD7i40Tnu2l0t9oZHOam6KtDeaHTh+K
 guAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740989162; x=1741593962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X0iUVs2ZQh+M1rl5kLkJ/YPcqr6UkD+Cttj33+uPFnc=;
 b=w3VlA8rNRD0/PbxreIFvbj6vkJcWeEReVJXeEQA+WIKaAJNixmF+yMLh0dKQCvlJVJ
 NbYcnunLDiIXOda+yxnkOaVXUiAyUbw+1qCvAe54MjY19Zj9PR+bCB21PWLDEGFH7W04
 GYrWjifBJlLfILcUsvJfpLBe7TZ65GIuICBzR9PbMlYMZ7B/UAbKr0gLB7b3g3JMEfOh
 WesT8xOsJSXfY178EdkVDLrCAiX/iQHL6PvKZXidHdTeZOq2xGaeUj/56yEr3s0pCvbE
 0CCdDmCNbim3TKYxbnVwoPdH1PKGQ+EucwAhOTUdkgG6sQtzckbQlL74yOI4OdqKXza7
 5U0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtC+tZfPyCJ619qQQ6mclijpLY4QtLxuUQ+2Cn026xAxm3B0NhCQnkJ049CicwF3GNCg0vACbei4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz36yIp848e7HGievzy0erPz3iE1D5Og9cnI9sWN/V0y7wPfxXW
 Bw/L/Y0G5gA/BGq60Eg+8Xp/z2ovqdiuTxg64ztz9zYpGka6RAQnPsKxTPcUDeEML9Jrd7BKEEJ
 V25/0pk80DKtjWqNtzlCy6LEtq5wSSUxOxjre
X-Gm-Gg: ASbGncsdNunujdrVsyG044O7wygQs49CS3oU43OkgMjCEz0o4/h0g/vbSFKzwxCIL23
 ybrWxLcHq4FGfd6QEB4RrZEv+vqu4mVeEZKFLNpD+WQXnrp+GGoqxZR+NNAb+Ho4KSDRV8q3qSk
 54ZNRwUFDTE9UcmkDJ4fH2exM9uHLUC6DYILvUjBy6vM4KCdvr4On3Q/EP
X-Google-Smtp-Source: AGHT+IEk6318AFfc1LcVsJJ84wt3g9PnbPRWzDdM7m2/xTI/OwzWoyIK3cmNaUT7+G0p9cZPZuhg9T+sy8bKgxhf/+k=
X-Received: by 2002:a5d:5f91:0:b0:38f:3c8a:4bf4 with SMTP id
 ffacd0b85a97d-390ec7cd27fmr9441896f8f.6.1740989162420; Mon, 03 Mar 2025
 00:06:02 -0800 (PST)
MIME-Version: 1.0
References: <20250301231602.917580-1-ojeda@kernel.org>
In-Reply-To: <20250301231602.917580-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 09:05:49 +0100
X-Gm-Features: AQ5f1JrxAQw0Rq7Ilhd1yFsj2dY9VjMUraWB3QJMgYSvaEWDQVWq8PuNQusYF1c
Message-ID: <CAH5fLgjhMfk1vZCc242vKYnTN13Ss23VhVhaAjwU67Z5qhP9mA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panic: use `div_ceil` to clean Clippy warning
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Alex Gaynor <alex.gaynor@gmail.com>, dri-devel@lists.freedesktop.org, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
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

On Sun, Mar 2, 2025 at 12:17=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with the upcoming Rust 1.86.0 (to be released 2025-04-03),
> Clippy warns:
>
>     error: manually reimplementing `div_ceil`
>        --> drivers/gpu/drm/drm_panic_qr.rs:548:26
>         |
>     548 |         let pad_offset =3D (offset + 7) / 8;
>         |                          ^^^^^^^^^^^^^^^^ help: consider using =
`.div_ceil()`: `offset.div_ceil(8)`
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#manual_div_ceil
>
> And similarly for `stride`. Thus apply the suggestion to both.
>
> The behavior (and thus codegen) is not exactly equivalent [1][2], since
> `div_ceil()` returns the right value for the values that currently
> would overflow.
>
> Link: https://github.com/rust-lang/rust-clippy/issues/14333 [1]
> Link: https://godbolt.org/z/dPq6nGnv3 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
