Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3642B0B908
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 01:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3803010E460;
	Sun, 20 Jul 2025 23:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DW1UMRrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBDF10E460;
 Sun, 20 Jul 2025 23:04:36 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-32b78b5aa39so35180891fa.1; 
 Sun, 20 Jul 2025 16:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753052675; x=1753657475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Xkw3NwxWxg5J2ji88ScO8XA3YV0z1vRakGJn9oB0XE=;
 b=DW1UMRrhbpmvQjwZry0zO7m7gc+tnQWEXa/XWpU4zQuNNg8aQY2xv2rdjgXAaaPfxs
 QPBrAPIdODqB0FuNs+Y/dZXOXB8nbcvtOCKm6DkZo0YDmLehdq+RJtbYRI81Mw1wmap7
 dMWCxY+B8UnmFpywxTSr2JKOEh+uRL2J57p/GOlKS5X8C/fng28drg04ZmVV1VsKi+ha
 FjyFrDd+W/Ku9mNuddved+OfEzytkBki8lK/dth+813xA2NmoVr0uX4tW8pNpVOdrCq4
 /Bt/sqDdH5oyYzjDkcDwLi2wQEdTk9baNIZeY4bBAPKqMTTpRhM6sD+1+yQ4MSP9r2G+
 FJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753052675; x=1753657475;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Xkw3NwxWxg5J2ji88ScO8XA3YV0z1vRakGJn9oB0XE=;
 b=UaEo4d5DASu8IpRUF7nO0hfw62Boi236uh6NDmRvnO/hT5dS0T/HAE4HHC1GaM6EnX
 m6gwjdbEQo/FptuWIfqKk9pnakGszzibXnVU6t4D2yf9MqByXQYaDygCXvaRBAVnyrXV
 k3LNOmeTR3glEuZWn627jZRfL3F8hMWI1MJrjmrDrvuZPCjPpR/0PfLRJlw5PNNLwCK7
 1tTppK7+/mb5XKTzDkcQ9RBOr5QL4xrPYKyDZoT0HvvXBQCvCkVx0wG98Q0n2skZAuxm
 Mt9IZgspEsbEj3Pb2YbV2818uO4DtajjuGgu9QkJcCpcw81qrE0+BnlHOB3LVmoVs8n3
 fhXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKsz7HziTtT1ldNL1cRYG0Ss7TL8BETPnBOZInO9avbYoyrAdkZgowfcCTz4oBz/Ur15FuW64tbaY=@lists.freedesktop.org,
 AJvYcCXB7UKwmSNohN8a3PDOJbk8HFlZ/5RHKz+zQic7UzGorgmw18BHOdPjJNH+oY84wuzyxERvBWYCAA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyScRgOUcut2q3yrSr90xKdWzsJlcsOMb/J27Q1yVbdJN9cFHOu
 WAo8NQWlxqx0L21Fe4nSVbR59B1tjgtIAp2ziGfFgcbrmFhBiLZjEpDY20o0IkJQcJx+k4qxYTl
 bQKzhPINZeblURq7so6ggivlqVkV1MUY=
X-Gm-Gg: ASbGncsip7PRtCtGtlBB2cc8D0VUEV9z+KIlJB6fnaFYVTS7CndtHCa+7t1+yH632Sa
 av30NGHDQWortqvssmHDYkBNoB/6GNlnYcfgWiHhu/cae7hCJAvOd8qGQcSiLxwycFKR7nkVYS8
 5OcI0N/WpfOR4w76C/A3XK2OdOORONRIiSVzo0r98FGRF8TaTJr9oY8Qj1cRs+2X4ENdLYATuP4
 OOAKH+q5VJBEcrnMbGxTXQOayI736hMH/tva8GjDw==
X-Google-Smtp-Source: AGHT+IHU8gAlgJi0gfSerHmpP+XVcJCFlizdHXk2oE9KNpuvqKE3vWLus6ifQ6OwXOlfO0aS5Oo9wOl6ZRFYMwgCbm0=
X-Received: by 2002:a05:651c:41d5:b0:32a:6aa0:2173 with SMTP id
 38308e7fff4ca-3308f5b6b0emr51195791fa.20.1753052674651; Sun, 20 Jul 2025
 16:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
 <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 20 Jul 2025 19:03:58 -0400
X-Gm-Features: Ac12FXyBZv6-1-SR-r4N9df7hS6FD2nQrghFQr18iPYH2j0BNLVFQznx1RbMWtg
Message-ID: <CAJ-ks9nBrT4C5xYk4eWUFX_nX5XXBYHEGo+fLtLWJE-D9Y5hKQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] rust: kernel: remove `fmt!`,
 fix clippy::uninlined-format-args
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
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

On Fri, Jul 4, 2025 at 4:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Rather than export a macro that delegates to `core::format_args`, simply
> re-export `core::format_args` as `fmt` from the prelude. This exposes
> clippy warnings which were previously obscured by this macro, such as:
>
>     warning: variables can be used directly in the `format!` string
>       --> ../drivers/cpufreq/rcpufreq_dt.rs:21:43
>        |
>     21 |     let prop_name =3D CString::try_from_fmt(fmt!("{}-supply", na=
me)).ok()?;
>        |                                           ^^^^^^^^^^^^^^^^^^^^^^=
^
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/master/index.html#uninlined_format_args
>        =3D note: `-W clippy::uninlined-format-args` implied by `-W clippy=
::all`
>        =3D help: to override `-W clippy::all` add `#[allow(clippy::uninli=
ned_format_args)]`
>     help: change this to
>        |
>     21 -     let prop_name =3D CString::try_from_fmt(fmt!("{}-supply", na=
me)).ok()?;
>     21 +     let prop_name =3D CString::try_from_fmt(fmt!("{name}-supply"=
)).ok()?;
>        |
>
> Thus fix them in the same commit. This could possibly be fixed in two
> stages, but the diff is small enough (outside of kernel/str.rs) that I
> hope it can taken in a single commit.

Just noticed a tiny typo here: it should say "can *be* taken".

Miguel, if you can fix that on apply, please do - but if not, no worries.
