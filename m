Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0A599B344
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 13:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B3910E32C;
	Sat, 12 Oct 2024 11:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cJpFYFcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7DD10E329
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 11:08:32 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2e2b720a0bbso495930a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 04:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728731312; x=1729336112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DXpQfdUU6RqG8+Te9GmI74BrkXUQuHFJl7lqEnDb0QY=;
 b=cJpFYFcF0HuC1AcFuYrOXpEgmbZ3ZEIh8AsbOwAiNTXbcfTsQxzA+BPu4yxkSw9BVI
 /LWZb07v2m87jWa9t8n3tONuWZ/Mf0ky+NW7GqkSZY14w4IxqdHGnR8chbMinzIiPZFJ
 xeUVPhxfGn/4zDKluEz2ORHXHywPX3Gd5jIdKiHA0DJU+ErI5n1gef9deFxoShgF3mqh
 4hO9M5m9mV41w1hVEznpwU2wQwdKRqp+cyPQp/+RWTMUu0nr/Q/ddubfVy3P/+XIdAQn
 ZNgyt3fIProitn/vkrnbomPtIf1mxh/taaU49CWcW3jx1rnyq6mqNHOi9MZNy7IOVjxE
 nCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728731312; x=1729336112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DXpQfdUU6RqG8+Te9GmI74BrkXUQuHFJl7lqEnDb0QY=;
 b=LqLb8FXKl2617ngBrr8Crci0CkJkvPM2Es8+9qZ4t312G3W6jaUxt+DA1GkyMRZlS2
 jDknNZmCfdLQKd9eNNHzldjcla4Io00aSvgaR/fkCCgWF+S3DBUCNdoariHLVUjEJpqn
 eJyaQ6rxR5Zqjvm/pbVNUPqgwxsU9d/gyfJP7MFVD4NPyDiN2UPxq3IAadoQXw2EAMdf
 7YUURiIdkaxeZYpIvZvSf4NXf3OTB3fqUmkMyfqieZsHUByA6cv7dc8m8WtGpqaeuAbo
 R/e9vJ4ga/QRfTws5eJ23LWiivULZ7WeOM7hnL/N8Ax11ldlFI7SdgbUd1vbdFMjOftI
 0PKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjLyIqThncmPQslZtRpGzCcOax115xGGSBcwEisq6b6fDbw9pwMXrTn6+obWyaq8glrJLug+sFirw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEIC/635jGMVgCTwK8eUzJZjXWUFHFQH9n3Otw6eigODGeCbHm
 pDqLDS5LstZC7H09Ao+wKTWBZ7U7WVABZxLByY77lA4gXgZJdYf1VvNj51LVGh4MiyICaK8USJB
 ljWURqLpcvJmQ10WK+fze2oKN3iQ=
X-Google-Smtp-Source: AGHT+IEnl6eBizhL/KUnxNn9a+QsJLplFC2sm8nTkqQ/Vhlea46k4opUZFsBOsyHgtkw2JwU3bkz7UAc+T3Ym2+XA88=
X-Received: by 2002:a05:6a00:848:b0:71e:4a06:8a62 with SMTP id
 d2e1a72fcca58-71e4a069110mr1956772b3a.7.1728731312294; Sat, 12 Oct 2024
 04:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <20241012075312.16342-7-witcher@wiredspace.de>
In-Reply-To: <20241012075312.16342-7-witcher@wiredspace.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Oct 2024 13:08:18 +0200
Message-ID: <CANiq72k2hDLf+PDkE6EQd7_UK2-XJYa3r2rVqDrjxARN7obT=A@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/panic: allow verbose version check
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sat, Oct 12, 2024 at 9:54=E2=80=AFAM Thomas B=C3=B6hler <witcher@wiredsp=
ace.de> wrote:
>
> Clippy warns about a reimplementation of `RangeInclusive::contains`:
>
>     error: manual `!RangeInclusive::contains` implementation
>        --> drivers/gpu/drm/drm_panic_qr.rs:986:8
>         |
>     986 |     if version < 1 || version > 40 {
>         |        ^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: use: `!(1..=3D40).cont=
ains(&version)`
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#manual_range_contains
>         =3D note: `-D clippy::manual-range-contains` implied by `-D warni=
ngs`
>         =3D help: to override `-D warnings` add `#[allow(clippy::manual_r=
ange_contains)]`
>
> Ignore this and keep the current implementation as that makes it easier
> to read.

Yeah, I wonder if we may want to disable globally this one (and
possibly the previous one too) -- I am ambivalent.

> +    #[allow(clippy::manual_range_contains)]

This (and the previous one) may be good candidates for `#[expect]`. We
don't have that yet in mainline, but it is in `rust-next`, so we can
clean it up next cycle.

Cheers,
Miguel
