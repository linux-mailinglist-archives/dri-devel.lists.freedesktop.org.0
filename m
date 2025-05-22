Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB21AC0783
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 10:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B2410E911;
	Thu, 22 May 2025 08:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R9bWqrrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA8C10E911;
 Thu, 22 May 2025 08:45:02 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-231ba912ba1so7726055ad.2; 
 Thu, 22 May 2025 01:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747903502; x=1748508302; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e9dormL9HrrIAVH/MkapwqpUc/OQw/GWiqS4n86n8Ls=;
 b=R9bWqrrRjrRife8Whh7vD9l83PfJrIfa/3PQY8L2pjPHy6C9sq4SNpkd/rNKpJN/T3
 i2sv5wJDPPyTLLHNRuznaUDz/AzDmRJrKbUGGCIXOdytMBzUITSiAMbHbSN25511FvW2
 ca51Qg6Chpene8tFYSptWCjlnVJKOUMflEk3qHwm5MO4XKD/q4xS+Lk4tKsjRncOd2T7
 U8a07SrxoV1p2hAjNVl0BXYGMMddhzdgyXlPF/VuPKvYJ7rB81vKSF5mj/XA0TxqQBY5
 bef7zdlmMZNTb4GDIRigf8pWP2S4oxXYH2g/LrIw1DKAG2keTOTnImuUOU7iMwH6OvA6
 WuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747903502; x=1748508302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e9dormL9HrrIAVH/MkapwqpUc/OQw/GWiqS4n86n8Ls=;
 b=SwMMTiIheomQRaPU2Ye3av1LrbvV8t+QTBekL4KtINrCXvI4huwyEpCC1TyBJGrodt
 SXlN+XrWKxJENbjHYeD5M1CC7npkHK25+lxkopnZgjuGcdRQEviJKByXlLdtdr6OuICq
 7HKaeZuAG7WLlmsrOlSH7mLo8nFqyT7XKAIYSRV+5DugXtZknwMoxJD6Ti356FNi2I1T
 3HzCW8it2zlNIYmoo2aTYwjGMxhC2fGzjsWjKH0KE90S6kxLPJn6f/VgSACR8bCmnu6h
 3Cuj2AosAcXBsax2a6Scd7W04qMjwgTevKJRcGvZIQ64Xz/xihDdbF5f+6gis1xqiUn0
 Tr/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxYfxlhlZuhQHAIvyZ5hIF65UjpuRGrv0KnQvcakeyRT72gVv8oDFp1rkp0vep4o8iJw01fSlIUKk=@lists.freedesktop.org,
 AJvYcCW0T7TAo1ggw3zrTw3TMXQH8mGF9TTYSHcY4ynAkUziVAKIV84sX0bhWbc3enEfxhiKb6JzR/gFaQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxegmku8iaricFEe2TPOONXmvrIzIDimm9iMKTfUkIYpT5EwmVU
 rES9tBNHhHA6TAnzioEFIpcZJzuiK47KKz9x9z4SI6MFAZzWjSuVa3xDDUESJfuQJZZQzwBmX53
 VUKgAaE20+Gda5ts22Wx+y3JhGTuzjck=
X-Gm-Gg: ASbGnct0AFcLKbbk11XZ+QJFLwu7tJAHVVnBH8Krdj1eos3uDH8c09ZExgCN6XGDnSP
 1YYX0quuKPpDUPPvR010mPHnh12LKZIeKIo1GF8CgqVrP4g6xEg5XJM1GPPzfCKt3oOZmaGak9L
 l752/FVJXxodMW0S2yuZqx8y0KJ7kJpQiidRVRYUCozhc=
X-Google-Smtp-Source: AGHT+IHcDoEYiYNfDCdUkacNcMEAOzs+8U1TP1/BcHDhQFdNfXEeXQOFjK7ijS68XWJepFQkaZKUMIQQVff3hXBYuFc=
X-Received: by 2002:a17:902:eccd:b0:22e:50d1:b8d1 with SMTP id
 d9443c01a7336-231d437f0e7mr141804895ad.3.1747903502395; Thu, 22 May 2025
 01:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA2E1BNC668R.MMCARZ3K2NTS@nvidia.com>
In-Reply-To: <DA2E1BNC668R.MMCARZ3K2NTS@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 10:44:49 +0200
X-Gm-Features: AX0GCFvCHoNK_pM6k7TEPjfKCmoWB02CvdL9c9h6ygApOUg3uOuHv8pwBTVxdiI
Message-ID: <CANiq72nQwxqeRGWBW2WSHijUKLs4c26UGQvJFjt-_SpnJJaaYQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Thu, May 22, 2025 at 6:01=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Either that, or we enable `#![feature(const_trait_impl)]`. I just tried
> and with it we could indeed define and implement `NumExt` as const,
> which looks like the cleanest way to do this to me.

Hmm... I think that one is actively being worked on, with a possible
syntax change in the works. We would need to speak to upstream Rust to
see when we could reasonably stat to use it, and consider the older
compilers (e.g. if the syntax changes).

Cheers,
Miguel
