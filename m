Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9833ABA9C58
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 17:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E55C10E443;
	Mon, 29 Sep 2025 15:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TKuaER3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B5410E443
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 15:17:40 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-26e81c17d60so9350695ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759159059; x=1759763859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1iLyMxHlvLqemJX+awTsijKkDTe2O7NspoX88eyf7wY=;
 b=TKuaER3tkbwMkbGgV3XH0EF3yBC4+dK1/KgKLRlvB6B9yhsI22OSucPs5Dn17pAKcg
 EE8SLQkErDHLwHmTWvnMXGL75PC1irQJr2aDolEqKT/advNIMy1UNpg9tNncwh/AI0MU
 nc1oDP9QtuffyUOqw1zGSxXeG0YEducasRNx1DcNhK4ObyhHSBEKhucUxdbZcO86WXgY
 pDmp7tYyxhfab5zbL6Ya9bf8zBcfFvmqo9AVgIA/cJd/27kGF37AkkRALWThmVLRrlNz
 dA72mmlKNDeEPeAe4Nw4YZ8QfbUUYzZbyoopgcrotO79sJ6w22BM/J4rXoBeNxRtvVJp
 kYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759159059; x=1759763859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1iLyMxHlvLqemJX+awTsijKkDTe2O7NspoX88eyf7wY=;
 b=rLuwU74tcEZpKIdctpjpuyuFSpsm2eyl/8ebHIjzMST0ayBtSMeFZtAoO2G5JICft7
 65hGAcGaeJZSIezURCm3umpAeoxmxKvjeAJGV9Um+glIXfEjMufrfur8aSMZXbhzWEDZ
 dADMrTam7/BbWhDKd4GPWyj9T7y21Lgv+MMv7QYrgoGeksmbtvkwxa1dFyMMByGmWAvf
 QP/eAlYipuaAp/m0bve4H5ah8+VkQD6eTgbfS0gUaMgO3Qvzaf3qQOxxDANOsCAQeL3e
 0GjUjAPSRVXf4MMn/xddqXpaqZAnx84YdukeF5RAmnogiDu4ETYLgQtznlk8kkglakEJ
 cg2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGZlnlIMNM4QsGcD9e0YullekrS0A5WH6ukudn0M0APIYDUOI7p7YLcJtHEh4/O4JunZ7GPY0qtUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzExXhu+ex7uwtENekJcvMCa29ergW+oa++tDzKFIhJjQmXgHrX
 u4UujMJ5WO00HSJhS4WkD15rBpA9L/kjWpUrcvsTQSAFRei+hCTIqUlbWTF8qQiivRPQvjf5vil
 C7gQxUF9AIkVw6oceZPOiL86h1w8lLwM=
X-Gm-Gg: ASbGncthT/ClSNfhrgJmhH1RwiDVYHsN+29saNbwyU/zpVJbtFEukETMAlpCgC1b0rL
 uAKH2yji6UmUqo+eRXJh99SF8F+VC5yG9PUjCELYm0acFudHP5LqChtGXT/iUbbNYltBrsS3zRX
 MglbgeU5l8HVKUf554ovgLtoXwTZ5rapQ4g2f70pUjUbJ41/B21kqutO4sU0LWj82vRd2px4Dmp
 1+rNDWFyK01MdctmTmVVfFD/cmsWvqELmHD9SHb4QFQlAmlbtYALpjNjvSR7atCfGlA0YzCAj/Q
 q9vhInoiAOpo8FXxC9k/k9aiYA==
X-Google-Smtp-Source: AGHT+IF+JvH4jpihgghfd5nlg8ufLea8+tJ9snOXOMk1JKbPQlxyBxaIt2jz343GE+cDEAtKIOGKVPpUKeLyULsn0zo=
X-Received: by 2002:a17:903:1386:b0:267:8b4f:df1f with SMTP id
 d9443c01a7336-27ed4f8284dmr68541345ad.1.1759159059465; Mon, 29 Sep 2025
 08:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-7-joelagnelf@nvidia.com>
 <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
 <DD5D59FH4JTT.2G5WEXF3RBCQJ@nvidia.com>
In-Reply-To: <DD5D59FH4JTT.2G5WEXF3RBCQJ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 17:17:27 +0200
X-Gm-Features: AS18NWCkUheGDFaapzA6FmlukqlhAVxssnWmdmmXWlzMCMUthOlFQRmkWB4hggM
Message-ID: <CANiq72nTrp0Mt72hJ_5qwZtJYSg_ir10ENcX5nXELC_=5vvpew@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter type
 conversion
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Yury Norov <yury.norov@gmail.com>,
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

On Mon, Sep 29, 2025 at 4:45=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> A bit radical maybe, but correcness ensues. :)

I am all for Ada/Pascal-like ranges and similar ones as long as we can
make them ergonomic enough with our current Rust and as long as we
still define newtypes over those when appropriate.

Rust may get support for that eventually too (called pattern types),
but we may want to do our own thing meanwhile, just like `Alignment`.

Cheers,
Miguel
