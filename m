Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23B6A4AFB5
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 07:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A8810E0DA;
	Sun,  2 Mar 2025 06:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G6T8VLv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415AE10E0DA
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 06:54:44 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2fe9fd5e7f8so1003031a91.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 22:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740898484; x=1741503284; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RH50xcsm3w9EAvFEKvX4IOD4cvYkCw20gTdnoq0oYts=;
 b=G6T8VLv1XphXJ9HIQjiXbXVzChJD6MqmZbx6ILXZ5u1Am4ViejxrxsOgudvkysKrKQ
 vooAUM7/DhpamVPm5sRlDH4qCETZSgjscCy8hRLHHCyOuk0ecK5b0Upt5rguBU1yQ3w3
 L4ST5vKy5P6tIVsqA/4j1ICfnH8oxC613aB075+HW2Ca1YxavPkCXZGTMHtLTttZNtdH
 ueE6WlWNVMh/mUebnYKrnRkaYKxBVhj4VIgsoSCBAh3oj4U3nQL7FNX5Oh8a+AJUdvTr
 fEJH+/fX/HUdv8BV49iRk6FA3BaGV0hVU4HeoLV664E2AkgEU3wAbwkkdbf1T0BL9gV1
 Wcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740898484; x=1741503284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RH50xcsm3w9EAvFEKvX4IOD4cvYkCw20gTdnoq0oYts=;
 b=VpcpkutDl22CF3SXzWpKdX1RIDelhyOQLMbATffDFD5314n4diEj1yVJDCjg8lNaDG
 h2NUEl4/STwYH4/o44nCW4351yTmjmmQzmqV9YA6HfftW97lxUfVfpXOAHiDaBuIabQ3
 6ZhuXLBU03/RhflpYjqEXFJcqqfXewr9c+isSgAXNTkPkpEeU2VEEK91uYNyxYWrFtHk
 qQF44ieevsqtlczSpBdSyduUv3LYpSMWG+SSAYifSIvPCN+ezO/IvxQb7IZXFK8f8RAu
 G88ELSqVX1TctCYGGAIwOvbJMbcsaWUqvK/BuqMAFMkaYn9prnDZacJYX5CtRhqFyfnH
 x5Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKoavCHil4FeVPuRSat2hs53A8Gc0aZnu+c7jH/8NhICVTuqr+VW+QJH9Q2+xkknd0hMVQfnXu85A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmRwNW7lC2ySaWZtTzt8aLtg9R8aKp5RSlU8U7SSTIDmwu83gt
 FKvuA5InkWgrWjJVqz1C3BMHmFURY5/oNPflIiY0ItfxfghqZuUay18XTSq2zY6OFt0k+XYzUgJ
 tKKrtNWfhVMAlr4ppXQK78D/AO08=
X-Gm-Gg: ASbGnctxfSRfbxiaVKTDtmabXvlXybf9hZ5JtJVuIKZIRplyEfWzBT+aBBrVL/kn1Df
 VzQiVYhmfydqcuKaSshx/EuBtEMTDGm56nef4EIcQgUXuNUMhZZhcWZEhfJn3oGqabVIq683NPW
 23EU+gbB6dh4xqRoRcz/6jhm6JMw==
X-Google-Smtp-Source: AGHT+IH/HpdC5c2ntwoUexbl3FGQdhO1VQIGXrZoFJRa7qJpy5glII83KoHTFhfyZpEgHHy3fYGiMf0NHxFD6DEEMQo=
X-Received: by 2002:a17:90b:1d8a:b0:2ee:6db1:21dc with SMTP id
 98e67ed59e1d1-2febab2bdf7mr5608814a91.1.1740898482556; Sat, 01 Mar 2025
 22:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20250301231602.917580-1-ojeda@kernel.org>
 <20250301231602.917580-2-ojeda@kernel.org>
In-Reply-To: <20250301231602.917580-2-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 2 Mar 2025 07:54:00 +0100
X-Gm-Features: AQ5f1JqlzIC1SFXpGOf9WwRIHGTxmhHtxxGET_lxoSbzWK3HdSahnru-4p4t798
Message-ID: <CANiq72=69XAOapYBurbwsQOEaw2uamZ6ta=DT6cC-om9XK3dvA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panic: fix overindented list items in
 documentation
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
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
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
>     error: doc list item overindented
>        --> drivers/gpu/drm/drm_panic_qr.rs:914:5
>         |
>     914 | ///    will be encoded as binary segment, otherwise it will be =
encoded
>         |     ^^^ help: try using `  ` (2 spaces)
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#doc_overindented_list_items
>
> The overindentation is slightly hard to notice, since all the items
> start with a backquote that makes it look OK, but it is there.
>
> Thus fix it.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
Cc: stable@vger.kernel.org # Needed in 6.12.y and 6.13.y only (Rust is
pinned in older LTSs).

Cheers,
Miguel
