Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63AAAEC662
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 11:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CC210E0F6;
	Sat, 28 Jun 2025 09:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZoYLD8fw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F5510E0F6
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 09:31:34 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-313862d48e7so341786a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751103094; x=1751707894; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ONfV0fUcGhjneIypDLDcXnbButNtqOzxMv+hhdKx7Ks=;
 b=ZoYLD8fwH2BwikHWkvdpAyDK+PsfJ0V8s9jOERJtfP+791PE8B+U7HSC/xAOFagnaN
 W5M481TaBmczgTAeri0CZsVZTSAsbQqt00BBLUUNVbD/8MHfHVTU358tYxdypBwHKwEy
 2ikdWfMCrEOIh1gC0vWO0AOQsspw4ayrZM7M9HJw+4ECAIweahXfL8QTJxgbhGrsKG1i
 +1XSYMJEyLxijH4Evbnnt8donjWkT+ZVKr39Qqs7sVvLKrG/BscUJvS6ApX55IBScfzz
 vTsrlzqE0OBjDNgW6L/ZChpjwi3j4N1NjLD1ACDY6oLGTL01CYE6hv6HPq4rAZMFN8uI
 o/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751103094; x=1751707894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ONfV0fUcGhjneIypDLDcXnbButNtqOzxMv+hhdKx7Ks=;
 b=pe+WDJG4aPtl8G52Nv93SK0AQJYSXpAD9DWu4n35qmPtaHn/EuJlIDit/am13T/TDS
 rBm7gJY/6sgvryp+ncak1u2YfDbpbGscyRwv77v08iygd4McVplWaVg2KW2ywyW52wM8
 a43VQaihbEUqjNTqkYv0XxZpxWyIf0GzWgfUe78a2z4KzpZ+r52Tcx+HHx86aT2d6o4E
 rTs6PJP8ZPKK5uV4AS8bx8m/y5jWNX4sg19bd+51HDcN7vcjLZy8P+5yIIrBj3gShx5b
 M+Pysz0VHVheWHmff60gW0vyPCSDFxrHwdTItpXKaT8a84S9+losLO37DnHBXqzVqa2t
 PNBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGCbbhEJmd66CyfNcG7ktSd/XxJmiec4jzC1nssTlM3axiuzIcuA1lvl0M5Zwx9wVso6+/Ul16UJw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxN2CsUyaFOGtwU3t+doZyKM9pXru5CfQn8zitQhlQmZpEf2bRF
 XlkjguFJv+htKLkfNQY5VquOhUOVDgAHD8IF4BPKkHb4rUpXqAd6WUYSbzoATV7wR3eCERvfRb+
 VhP/gP3ii+1OAKlvu1h89qfR3z2jlPBU=
X-Gm-Gg: ASbGncsbYsea8dz222BiEDPokqNDqzy3jBsI0ysoJdp3dh2zXnnzeXqwt4No1usejlk
 UwfX7bNho3ovrfJp9Oh8GQbQ0tFLKoSkTRhHmQjHCF2QJPP7VmAXCjQ7mgQ2y10ZIbRaMi51AsJ
 DD3OKhZxcJlkz/WP9TgO8tH+sEkE+IElSe+QErjH7hZa4=
X-Google-Smtp-Source: AGHT+IGCL1ZwnkZbeKMkXvofitTo9uX9H0CCoXKQQY5hQuH7wk1pXGIhr5xcDOJ2eKhuRox+kb1wdEabGvobYiOsvpE=
X-Received: by 2002:a17:902:e744:b0:235:f1e4:3381 with SMTP id
 d9443c01a7336-23ae898f701mr13555125ad.8.1751103094322; Sat, 28 Jun 2025
 02:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <aF8lYpK_l2I-ts1k@pollux>
 <9D9AFE08-2CBB-4A89-866D-512D9080754C@collabora.com>
In-Reply-To: <9D9AFE08-2CBB-4A89-866D-512D9080754C@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Jun 2025 11:31:21 +0200
X-Gm-Features: Ac12FXxAXZ-frqKyQFue1u4JXDf34d02QnAAv4yImOCi7FZMfCJpz2L7ro96pf4
Message-ID: <CANiq72mgt4ZD43Tm2bFr-gpicXMhFbC2DLqA6F0rN_J4rAe_CQ@mail.gmail.com>
Subject: Re: [PATCH] Introduce Tyr
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>, 
 Alice Ryhl <alice.ryhl@google.com>, Beata Michalska <beata.michalska@arm.com>, 
 Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, kernel@collabora.com
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

On Sat, Jun 28, 2025 at 2:13=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Also, for some reason the Clippy lint did not save me this time.

Hmm... it should -- I tried to build it and Clippy reports it. There
is also another warning too [1].

I see the compiler reporting [2] too.

By the way, do you need to depend on `CONFIG_REGULATOR`?

Thanks!

Cheers,
Miguel

[1]

error: this operation has no effect
   --> drivers/gpu/drm/tyr/regs.rs:221:16
    |
221 |     (3 << 2) | ((w as u32) << 0) | ((r as u32) << 1)
    |                ^^^^^^^^^^^^^^^^^ help: consider reducing it to:
`((w as u32))`

[2]

error: variable does not need to be mutable
   --> rust/kernel/regulator.rs:295:29
    |
295 |     pub fn try_into_enabled(mut self) ->
Result<Regulator<Enabled>, Error<Disabled>> {
    |                             ----^^^^

error: variable does not need to be mutable
   --> rust/kernel/regulator.rs:324:30
    |
324 |     pub fn try_into_disabled(mut self) ->
Result<Regulator<Disabled>, Error<Enabled>> {
    |                              ----^^^^
