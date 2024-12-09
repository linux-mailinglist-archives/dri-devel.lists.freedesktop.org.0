Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0875B9EA336
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 00:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A1610E008;
	Mon,  9 Dec 2024 23:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WTyVSwCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB6410E008
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 23:57:52 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2ee8ecb721dso868184a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 15:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733788672; x=1734393472; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rHPxJ7hPLFpQidTl4ZL+eTNzMYzt1IS2TVSHXzTpC5c=;
 b=WTyVSwCy0eG4LIvNWZI3/UEuImrdhW9rO6a39uWve6tyFTYXbShRUrQTd/mRyuZBPv
 nOapc5xeejexAbMPSReraIbRNTOXUJZriLKh9vzCb/wRt3xETPVulI6tTVkTACLhwVPL
 FuBq3Gqeuj3ciVFNQ6Lt67eWixkJtxMQiXQO4pWA633LQBwXpc3Ab6v3srMEH80I5GsZ
 17SQ58Vj/xeku8kLkgkSb3YvKgyvj0JRLq1uPMEhiXPY2BuSaIo5G9Tp/SesAer6zWaf
 y7p9Mxn3yBdYAqg2k6hA8yS+nSyfV6sNH/t7g63Pp0VzFfzsS12Zj6ldIkD3zmX5JHNe
 mUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733788672; x=1734393472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rHPxJ7hPLFpQidTl4ZL+eTNzMYzt1IS2TVSHXzTpC5c=;
 b=f0D6w345bkPYQs0jB+eJxfC9eiMEDSnxoLuJCeBG5ViRYAsV6uRAUfek6ehHRe0DF0
 fILMCK7qdkSqF4mhr5rFIyvySjRXaUhOZxBstveQcHqbpl+VNwetCwSluHsbEJOnuqjh
 nO5g2cV7MvrVj65TYxvBXHnmE8iqo4dhKdSCBjx4TFJqIrSbchjQidXR8yvBk2QKq0ue
 Hy2fK8mDgTzLVew4eeqcPyFAkJXwKDOXNZcV7PLZtIcOHQCsvJecwEVexBnL8wi0Ke4Z
 4XVF91ix78HXRm3dCuAOpGSZIIzAh02pwEUneNfSYix9W5wT4fMiyFbqEbffJGo8xkVY
 x+ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzJsiwcJKnNvu3o0+Zy9mN69PCfRGvG8BJFy6ht4RgagpTVVgAczOD+RRBg+gYhGGynv0QhovXhvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yztv7kumfFpZwRcZzkCqBdAIKae9Wx7uB5XPUkHwZcITr/4VbZF
 I6KzsfGINx9kasvJcx0SAOxdJXp5dIBkit0KotWmyJwWM9H417S6Kd19TdK0WbXAI2nWpZZXCLO
 y4BqZPf0Mf4pe0jRQEyF986OG3FM=
X-Gm-Gg: ASbGncu70DYXrqvGEi3rtokycjphkkeE1SkqqaWwU2UoIq22Ian7kr+0BV3jp18JhBk
 RFf0QJ5qcCMFQVRJL2AdcKGVe3og8Bi7FmYw=
X-Google-Smtp-Source: AGHT+IFA3lV2vvANGAr/q1J0rO42UgmCv9jlCFJWKSe4+sKE0L6emUcGAjynzPESeucKuAY0Wly56Rz8xKK+eETDnTw=
X-Received: by 2002:a17:90b:1a88:b0:2ee:b665:12c2 with SMTP id
 98e67ed59e1d1-2efd472eba2mr848875a91.2.1733788671803; Mon, 09 Dec 2024
 15:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20241125233332.697497-1-ojeda@kernel.org>
In-Reply-To: <20241125233332.697497-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Dec 2024 00:57:39 +0100
Message-ID: <CANiq72=gRDr658wi=PbEcwTM7oEdmBU2Fr=wKw9eq2kEbrjWHQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: remove spurious empty line to clean warning
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, stable@vger.kernel.org
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

On Tue, Nov 26, 2024 at 12:33=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Clippy in the upcoming Rust 1.83.0 spots a spurious empty line since the
> `clippy::empty_line_after_doc_comments` warning is now enabled by default
> given it is part of the `suspicious` group [1]:
>
>     error: empty line after doc comment
>        --> drivers/gpu/drm/drm_panic_qr.rs:931:1
>         |
>     931 | / /// They must remain valid for the duration of the function c=
all.
>     932 | |
>         | |_
>     933 |   #[no_mangle]
>     934 | / pub unsafe extern "C" fn drm_panic_qr_generate(
>     935 | |     url: *const i8,
>     936 | |     data: *mut u8,
>     937 | |     data_len: usize,
>     ...   |
>     940 | |     tmp_size: usize,
>     941 | | ) -> u8 {
>         | |_______- the comment documents this function
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#empty_line_after_doc_comments
>         =3D note: `-D clippy::empty-line-after-doc-comments` implied by `=
-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(clippy::empty_li=
ne_after_doc_comments)]`
>         =3D help: if the empty line is unintentional remove it
>
> Thus remove the empty line.
>
> Cc: stable@vger.kernel.org
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Link: https://github.com/rust-lang/rust-clippy/pull/13091 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks!

Cheers,
Miguel
