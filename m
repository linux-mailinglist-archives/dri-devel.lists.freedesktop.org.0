Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5EDB39B78
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 13:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2799710E97C;
	Thu, 28 Aug 2025 11:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TXpZAKSN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AADA10E32B;
 Thu, 28 Aug 2025 11:26:47 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2488be81066so1821925ad.1; 
 Thu, 28 Aug 2025 04:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756380407; x=1756985207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TB49lARAguv+2novlKNuN0CFuq7GTPMP7W+cgTo2Hmc=;
 b=TXpZAKSN/R9WGjSmiRuTzDr3tOBf358pOnECW2OJwtD1aLYKO7Da9UphAManmnWhBO
 ri8mSB9gtWndmOoSYo6wKHiGjuQbLsv/QD/sZda8LbkZU0bxF7kdTdOZ69Gdpe+lyRdG
 /YveO/ouaG2imX3PUAbIextgnFW6ti2DyLrptnIzw+7ggnXl9kN4HgJAwmnbR0foQ9Eb
 IE3F52xDcFDwZcRWDqSgij1I5mOilj0tNpowd8x6OlqplhgKRBv2fWzwzZA7jFBjQmH4
 WWN+tBQBWcLuZgV23MfvO/Hvn6W/wgYbBMG3AFgxTd0dleVylc4B3YN1U8oea4YpcXdV
 MBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756380407; x=1756985207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TB49lARAguv+2novlKNuN0CFuq7GTPMP7W+cgTo2Hmc=;
 b=gyyuCS9LZqQSIOjPvo9xYu/MjXnDLujxeUoYlI+YgyPO/bLEZcNNG6S/gT79TblTJJ
 aDPhfv8czUMU4uloa3OaUnBE6lSnIKnFWCbb2Z1uqsS+e0lL4asYU1wlD9ydLLcNZ9i2
 YtVrqBsF9/L4zLsAXBoO6cVF5UASUZwFvgLnV07kyhaoUNKAn8mYeBJOW2bMsYGf0a97
 k3Rf6w3qnjwVlMAl+0xZ2GUseSIb+fXBlgO9X+Qa5pegvqnfRjfmntzmOBq4bmV42RRN
 74nVOsACyoGuQ/c7q3AfrqlZrK5FlwzOSjaYHPu8jUyCbx78DGUt9GgqO8FPjUvc9NtY
 qSkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwo8REp8Q6og2a3dpPBtS9+tKuC87krw4ffFNjuCBKq1tu1zoxYlRVOPtTOeFrreDUcm8aY4XNKCE=@lists.freedesktop.org,
 AJvYcCXt5t2Gneu/35MyvpBKEAD1sDSRv/xoHZBBUOpfa6wiceJ6ku9d6CCUhvuGE5npSXNTmTX9XCP8zQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNTPY1xWLM4JMEMoyly88UehDVOj/ryp0R+rHXbnSTwpU95+ET
 yIA3AdEj/a511PvtbVClL9sCTsX/uUrig4FymMDP4z/2NkIZSiMgwqUHf6eb9LMe+Jguq9zT2bW
 s1yKYUS6s4NUfbcLbV1RF3QYW+JeyiBw=
X-Gm-Gg: ASbGncvoTHY0plk7VomRYemQolVqq9REkSrqTjgYyxh7Qm12JfZRT8kqkQ04qg1wTFo
 5PHTHs7XqbjyC2NuZZmb4sKz8PB4/So1yIWktrGgxZgWMdMzMtlisAzw0OmtUMp/wnzFdgkSk0o
 BXGvjRyar08Bd6YWp8rjGOQfu4JTKOIlcLgnM1/wHTAOR5yu3EjY/hoEnU54WVO6cgHXTX7rf2e
 VdtpQxK6ZWy6VwYHdHOtM9955NN//CyQLot+XDlziTrq9ToIwBWaX1JNATO01sgTAxsQqWj9S8O
 FdtQtl8Lh7CHPgJNSChH8eWiwX6KWGVxo6i89iqlh6gqqdE=
X-Google-Smtp-Source: AGHT+IHHmDIHqxhO7l79GLUkJwaWQ7dZNpLn1zpLg1iQnq0+hdNtOQx1/t6zWJjm/sSiYUD2aH3gJhMn/p7bQf7ZDaE=
X-Received: by 2002:a17:902:f60d:b0:248:847b:8906 with SMTP id
 d9443c01a7336-248847b8b62mr52656055ad.11.1756380406614; Thu, 28 Aug 2025
 04:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
 <9adb92d4-6063-4032-bf76-f98dcfe2c824@nvidia.com>
 <DCD2VJ1WJW2O.VM7E4PD3DFYO@nvidia.com>
In-Reply-To: <DCD2VJ1WJW2O.VM7E4PD3DFYO@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 Aug 2025 13:26:34 +0200
X-Gm-Features: Ac12FXzy24K1wGe7TQOMJcL6Fdf60t07YBP-70leUEy1vm3L-w174pbiaRtsL7M
Message-ID: <CANiq72=nGbziZCKt=AneE_vXw76i=+td0dSVfbOJ8kJ9eYHw9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] gpu: nova-core: firmware: add support for common
 firmware header
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
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

On Wed, Aug 27, 2025 at 10:47=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> However, `fw_start + fw_size` can panic in debug configuration if it
> overflows. In a release build I believe it will just happily wrap, and

In the kernel, it is a panic in the default configuration, not just a debug=
 one.

We have debug assertions too -- and those are disabled by default, but
they are separate from the overflow checking, which is the one enabled
by default.

So, any use of those operators is limited to cases where one knows,
somehow, that it will not overflow. And e.g. user-controlled inputs
cannot use them at all.

So, conceptually, something like this:

  - Static assert if the compiler knows it cannot fail.
  - Build assert if the optimizer knows it cannot fail.
  - Unfallible (like the possibly panicking operators) if the
developer knows it cannot fail.
  - Fallible/wrapping/saturating/... if the developer isn't sure or it
simply cannot be known until runtime. User-derived inputs must use
this option (or rarely the unsafe one).
  - Unsafe if the developer knows it cannot fail and the other options
are not acceptable for some reason. Ideally paired with a debug
assertion (the compiler adds these already for many unsafe
preconditions).

In the past I requested upstream Rust a way to have a "third mode"
("report and continue") for the operators so that it would wrap (like
the non-panicking mode) but allowing us to add a customization point
so that we can e.g. `WARN_ON_ONCE`.

That would be ideal, because it is a nice middle ground that is not as
punishing if a developer gets it wrong, especially for "normal users",
where panics typically mean lost reports etc. And other kernel users,
like cloud operators, can keep the panicking mode.

As for discussing no-panic, sure!

Cheers,
Miguel
