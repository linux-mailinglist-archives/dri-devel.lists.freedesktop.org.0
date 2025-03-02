Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B4FA4AFB0
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 07:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7642F10E023;
	Sun,  2 Mar 2025 06:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T1anNLol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F76C10E023
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 06:54:19 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2f74e6c6cbcso1003470a91.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 22:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740898459; x=1741503259; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NLVLObx6uS9bBjmY8f5wb7+n2yEgDTNv1aQqp5H8/BY=;
 b=T1anNLolA3tKXb1CZ/2Al+2BoKhDAlAP+GP4VfpkmAvqbHkFebH2rxyJCDPgPgxMKb
 XdHKlQa/+5Z/rwwZBwJqDLudKxJs3sr04ZIBoBac2sQJS4acmxudFdNy41Zwg5knT8sl
 1P+xVCMKoASrf9oVXckR/Gsa6y/35EzJHWbN6+v4mHepAxUDyH3uf9mhrc7DwBvsPeih
 ikB696gj9W5IalFpj1it5kUb/mVY8H9bM4DM4FFnygauavOrYCezMyVTWOcI1yRTCInV
 9dbZ7KBJkG0cKMtQAxbUD0yn+rvKMqBNmgzxTICsNvwtEmli27RouEm87Sz8IftqbaEZ
 5eDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740898459; x=1741503259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NLVLObx6uS9bBjmY8f5wb7+n2yEgDTNv1aQqp5H8/BY=;
 b=Loz+in6mV7E7hsrCO0b7oyhHIfxGpu95Qxbu9hQHR3uGFSLdAYNC1gPq7aoZC9DJA9
 qZBrJ+ePT1MsoHqgC8wMTPys5gPoASLZvkX0S/PNUY4dMt4dh1/yF1OQ5UJ1Lkj/6BOB
 kK9YPqTaHzxzv/IcnhgqwjDVHCiQptcNH4cweU9sO/KsJmlmp4xX2Xog7JxxIxY/xJhy
 tnnQwR57etGIsqhlfZqw7DlbO9a3/LYLZxxwEOTP8A+vRO804JduB+vAF9ITqF5Lf1P0
 NVP32ssjFjdd7mKnKfTAdm6hns27ocLxQAWG9MPjqDOIHi765F+33rIr3vBawMBCLkCM
 B2TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF66nm/nqjKi3LXxsamnwK21W4fYOcMAAdG4+GDUCH1jFsPg7A3L84wbx3Bc90cJZ4rAS3QUKM6HA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHnIog9Ie1vk/u/epnrVoFMMBxzCBCSHPo25ej0456S3hnJ8Un
 b6Jzel7+sgboCQmMwOfSsG58/98WCyenO9ap+60/ypUXhYmkMVp68VXDIWlmSZ9ObyqP1cbzEGD
 0Sm8Y3PzZh0hYf+CF/Dd2BTazZ7A=
X-Gm-Gg: ASbGncuEo2jYEY6hLLSpCL3/jVzF2rImMB8U0/h2iMDsN5zGsrukj9SkwTCFsqqW5Gi
 dUvDIyYf+D2XGccyj2EgMhuhdJJ7/AjAWsHIIPSnB1mBb236l8b7kn9/xOtU4qzuNqo5vxgHkLl
 nKDKecryjJ5SA1Wrse8TXnxQ48jw==
X-Google-Smtp-Source: AGHT+IHh1k5f2tWxMNYSe/y3kE7Ra5Zf6Er2pwX6coXwO+JW2sI9aLEqs9LceEvDYhdwv4wseu00qX6LVvsx+04aHts=
X-Received: by 2002:a17:90b:1d8a:b0:2ee:6db1:21dc with SMTP id
 98e67ed59e1d1-2febab2bdf7mr5608489a91.1.1740898459164; Sat, 01 Mar 2025
 22:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20250301231602.917580-1-ojeda@kernel.org>
In-Reply-To: <20250301231602.917580-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 2 Mar 2025 07:54:00 +0100
X-Gm-Features: AQ5f1JrtjtdA7vxoGkxnJQQ2oihRlgLnRnvB1-jZWod_EJ2aQH_uVcVqeA0S0x8
Message-ID: <CANiq72ne57qiwgWSDE=C1bvBuYGsUg9f8PooM+V_nZFo1Z5ogQ@mail.gmail.com>
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

Cc: stable@vger.kernel.org # Needed in 6.12.y and 6.13.y only (Rust is
pinned in older LTSs).

Cheers,
Miguel
