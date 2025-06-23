Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE6AAE49AC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3250210E3F5;
	Mon, 23 Jun 2025 16:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kVAGxA2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43A210E3F6;
 Mon, 23 Jun 2025 16:07:16 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-312a806f002so398016a91.3; 
 Mon, 23 Jun 2025 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750694836; x=1751299636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0tcXdovPS+zbja9QJVEVBxGT38A9W3l9YFmoO5UqOAk=;
 b=kVAGxA2B5i/jCQCILIpnm45lG56jJ14IeoQ78cqDURvevaLqIpFT8qRDpLbobPwFfG
 8EShzZ27mW2otDXtqrXcXQNRANGtyhkbYKrW7nDrG59PUi+m9Kku1nVZ1czheQXIxsec
 BZb3nhathArCvKApeh4EHJ0M1z6MVybLMwRfqteyBV2izPNe/Yku0HKxNQujfUDxxv3L
 WPk7tjEvwXYDClheG94BPMhL0Psz4ynQ6GhhFose/C4Z8zgm44MjcMas338CkQJ1ul6S
 FZhnGXBR4+VSMR8unaif17gmqiOr32YG9Sn6/LoePJX1ytLSHCQ8lC0hgR3QOqjuZxTb
 mLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750694836; x=1751299636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0tcXdovPS+zbja9QJVEVBxGT38A9W3l9YFmoO5UqOAk=;
 b=dgT52ckzFWibKWK+evPa1KdwuEdeVH2yIQ9N+xgoucrarIATRhl9tHZEU68oE3MRm/
 D+5wVpFxcF1S54OZv7MvdLTpKbywxWnXgisU3zIjaGUfAqG3EFfBaW5NbFBkgbW1rsAZ
 uVW90A4uoYQQ+wFvxwy5v5SZnVgnGDmpb+i2TueX/v1+WGT9kVfX3tr8uk10aNv1mv5S
 VyYiE1ikXS1OSWL4Re4wNPxZc7tHjtUwlMpCdDJ8LBM2ID9KOhRYqDJ/gaAWgL06jGHQ
 nYnbOnx266QT0hHzQIpnjwvus0k81I7YsUw817/91Q5p7ujHlO1EpAxPH6cZso8Pqz/F
 GezQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGJacPRRpxzIDXkN9/n/wUY3y7Fh0BUX9tNTDOp/VP+yO3AfMOxUHtBTVyMhlKnKrnso3Sc3mvaQ==@lists.freedesktop.org,
 AJvYcCWSjy3AFhHk/MJAqU6rwZ65oruxV6W+e3LgQEcscOLksW/ZkgvhlXu71SwEC30lGC0Mx7AKodWc9dQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3G54uqqHRykz356inn875d1WEcRoazl4eOj9I+V7wCAkOCPtW
 csP0B8CWNkTJaGAK0tRyuNrMvq17glVNM6w9TCS4wm5Ktodw21ltjBphdvEDult6iSRq3I0Iafb
 40KhKS2s1c9PsRraqVrKYZcK1xnsyyBg=
X-Gm-Gg: ASbGncs3KPci07spmqYhO/XcA33sjHMO0J8lPKadyZfGupbTupicdBMqXneHj9jl0da
 nYLKtvTHzE0kw36RjphppD6jVOVkTP/mld7N+pgSjef6mFEbClMMx0Y048iE6s0Fp+RYZJhCRHd
 o/IZaYHpP8zyWXgJypJxCjtHTEQRFvQVigIB+O5vZ/XkA=
X-Google-Smtp-Source: AGHT+IH9NL2lR9Uv4yi5aC7j9ur7IZFnZE3iQLVNBw894nkCrk2aK30n5d+w8auc9bWtvBbdzHz7hXqgkVpLEIog/tI=
X-Received: by 2002:a17:90b:5305:b0:312:e987:11b0 with SMTP id
 98e67ed59e1d1-3159d8d99d5mr7675733a91.6.1750694836185; Mon, 23 Jun 2025
 09:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
 <20250619-nova-frts-v6-4-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-4-ecf41ef99252@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Jun 2025 18:07:04 +0200
X-Gm-Features: Ac12FXxeFboeOQbrXj_NuX7sHbNjZwJOguO3r6RADbc_AKUo0NVkevTFuXJ8N_8
Message-ID: <CANiq72moyFrMi--y9ZdZK0EAoG26bTVsAo2O8ETxYHv4v_C6SQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/24] rust: make ETIMEDOUT error available
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, 
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

On Thu, Jun 19, 2025 at 3:24=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> We will use this error in the nova-core driver.
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
