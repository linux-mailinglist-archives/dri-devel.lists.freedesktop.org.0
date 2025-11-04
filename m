Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D63C3278A
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 18:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903E510E29D;
	Tue,  4 Nov 2025 17:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FD2ez7ad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22AF10E29D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 17:56:14 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-29301049db3so5402675ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 09:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762278974; x=1762883774; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cdbFu86UvaH/Ty0UuDTWSO6wJfAjqp1mmNJzmWiSQ2c=;
 b=FD2ez7adPbAFlZonGRGYZoquMJwqRa4S1Xjo/gvAR6A7cQc6qz6CYubWNCkGBfpNRF
 Ou+ThqUO/SHrug5dOMc2ekXgxAsv4yrmvyyR5W9sN1EJCvXEnKf01AgYTC+7MFd7+PbF
 jCc4Zt7o9nmcOTZOCxJ406y8wQcbzeN8CVerU8rnLUHd4rfGcv1x+Uqj9JXRka2qKK8P
 vGhf0dQqr5FPgQ/T3CKBkmSWwT2VE3G5vy2A2vaVkKSulEtBRag3NVDQm2yOufvp1Prr
 BDZ9rzH5/CCQ9noeFFBTbgfZFvTrvZo9gDi2S9STp0276OfYTfcxvsfmHm6TeW8WzZzS
 wQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762278974; x=1762883774;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cdbFu86UvaH/Ty0UuDTWSO6wJfAjqp1mmNJzmWiSQ2c=;
 b=YvtrghwB+qy0Zc4vKZN4YiGVoCP0Rd3giLWXv16haGOE+guWP61FJBM25dq2bFDhca
 nZBxSZdWPU4Rg26JIqic4HiCw6SXPw9uc7h9N+kXqjqQ8GxPbyc3kCCiy9FY1KiiABQY
 YcRWKTDwwJD7fy2eaXjRZs7XN5zPoylCaWK9GbrwX2CtzlywwJe7XBVYyAsIDuhkJ7YW
 nTRNTGEPCJV/sbI2Z1nvFwwv247NIOvDu1V0J39sjDuG0rgm1UPXf+gOch2qDE353l1J
 SMeP8akPQqiGleyR8YZnGKhElktcK98JXB9hM/qcfFL6w26NDfpciYLQPGt/tBoZA/vp
 BGDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsCmN4QdHJYSyqeBVgY5KT6Fpq2qLh7p2H3yF0QHRAfjU/HSwUSGqx9mF/h2BdFVy5Eg1gk6EdxeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpDjuC+LAYgtn9vTiFwqt6tRMVnHoqgyQSkSa4ZQRkyBtppDee
 AlxyOsPzEDFNKvbsNtza3sre/rfoGy9gG9EuoNnKARYv4T3u3sl5A1LjG15U3VuZt1ueSf80XX/
 FxNF4wuXB/C8f9/MohrHYlctmZAmzt6s=
X-Gm-Gg: ASbGnctYsPpReS/MBQuzhD3NZxVXcUmqIZ/odmm50+KWG6WglC1Fn9ffDAI8ht5jGz9
 EmvSt14aPWGUHf02x7vF/VBiavqFAzWlnrvfNRG+uq24WUaoVSyCqDv+bOJYYxfjSsx2fFnJfGj
 PMLGOZYUl5Z4B3/+qKxT0cwovRUbNkaJ2WFZogY76XP467GlMjSGGst9nPoBvr/6pge/8kmsRem
 ATAuewzljHbRLxaDYmzNMi2lUCeOVJH8h9Xo4H+xgoyjUivuRX4TlKbC8vjK6OfFtNPbY7WEhiY
 jl/BRoyymxwj0tZXZ3Sg+shwTk2g2lPxojGtxPrN1h2OIPMNl//mxdbu0JRqxVp9vdVJRmv93J3
 EENw=
X-Google-Smtp-Source: AGHT+IFmGK+yppNjtlfVt3PYHnSU7LCIeOR2djeBicyIzVEbAacDaOZ31AyCC8o6I/noT3LJVN5NEf+tFApmxdym8ME=
X-Received: by 2002:a17:902:db0d:b0:295:f960:be2a with SMTP id
 d9443c01a7336-2962ae6819fmr2827005ad.8.1762278974105; Tue, 04 Nov 2025
 09:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
 <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com>
 <02d37e88-8bfe-45ab-86da-0afa98fa1ebe@nvidia.com>
In-Reply-To: <02d37e88-8bfe-45ab-86da-0afa98fa1ebe@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 18:56:01 +0100
X-Gm-Features: AWmQ_bnuMtNId367X4k07V77YebHWkraMiqGBtJ_zKIeC98ruZBIIlgN0L2q9E0
Message-ID: <CANiq72mR8jpsi4ekNWM3CZCtVYinjFjUhhnGtF+cNn+Q2qiTOw@mail.gmail.com>
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
To: John Hubbard <jhubbard@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 nouveau@lists.freedesktop.org
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

On Mon, Nov 3, 2025 at 8:29=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> As Joel also was hinting at, is there any easy way to get this sort
> of thing automatically checked? This is what scripts/checkpatch.pl
> helps us out with on the C side, and maybe it is also the right
> tool for Rust...?

We have a few patches for that script (including for at least one of
the things above), but lately I have been thinking we may want to have
a different script or tools, ideally written in Rust, to encourage
contributions and reviews and tests and so on.

Moreover, for some of the cases above it is better to put it into
other tooling like `rustdoc`, Clippy, `rustfmt` or even klint,
depending on what it is -- over time I have opened quite a few
suggestions and some were implemented and work great, see e.g.

    https://github.com/Rust-for-Linux/linux/issues/349

If someone wants to help with some of that, of course, please ping me!

I also had a bot I wrote back then when we used GitHub, with quite a
few checks (especially around development process for newcomers to the
kernel, e.g. using the right SoB and tags etc.) which people seemed to
appreciate (to the point of someone mentioning it in a talk... :).

A long time ago I asked about making the bot send messages to the
mailing list when we migrated, but it wasn't OK'd back then. I can try
again, or perhaps it would make sense to make it send messages in
private.

Finally, nowadays, I imagine an LLM could do a reasonable job for some
of these as well, if there is available AI time somewhere (please see
my reply to Joel on that too).

Cheers,
Miguel
