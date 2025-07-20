Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8337AB0B854
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 23:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BD910E053;
	Sun, 20 Jul 2025 21:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EqfbzRRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D43E10E053;
 Sun, 20 Jul 2025 21:25:08 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-313862d48e7so490294a91.1; 
 Sun, 20 Jul 2025 14:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753046708; x=1753651508; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZOfGo0Jsenpn6hZiffPRs915jB+hKQfehNQr85qBjhw=;
 b=EqfbzRRxC594EHoQgIuzWqVRo6eI62B6rig+sBXspW0JrRrseJtV+TnkaJ6zJCJncx
 dnW30E7rE963Au+qP1Uyd0P9jLTKwrMaSnNSEAl/DScbV6/z7SK4XccqI0tZ+dyG1CyI
 IB5y+5FPGCMQguHTwZ0qOIsm5M748PUNvS4RM0sI8h1Z1+nMxWgxsrds2fx7QxKTm3dr
 iROwRfcbgBZ1PMlD6Pcdt6t1XvS6MF9VGtRa5TmNiik220H5xsXNW9C4VM3nty2mfcpj
 5/HmdIBRjbfGCZwnVAwHAaFLNHyLoMvl8Fbdrd5CiP3XPOm9vGRvDzh7pUdfm7vOvdTE
 TSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753046708; x=1753651508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOfGo0Jsenpn6hZiffPRs915jB+hKQfehNQr85qBjhw=;
 b=CG2KkTDI90bhv/QSfeEkvNqAYQrDRKCouLMkSHl3YmKehQvk2FmITgqZ5rAknUyi92
 PqgBeJk95CurqaskywDfZXa6QPrC75OAv9G/sBrSSX4QSyL66NL1POTMXKZoS7udg2Uv
 KAaSluZylS/EdVjH+ebmK6hB7OwdCel//WW8R8JZqVvHbvIs0kc7zksCkd4yz+zzMydF
 BYobmO4BYSk96BAE+cx79FFqieBxd+Qa2crcyyrnc1zxMpO3nZrWSUWTVtJ73P0aLz6z
 /aElkutwqcr/sq5jrYBT2v96s6vYApzz6C/il4a9bAE5a1Ud8S+AtSn10fO5iBazJA1V
 +3TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt10ltC+Gn29AmrAPoS/fhmgnlOUuuKZxYDjBjfD8+sK+G0jrq16R+H2ng/i/dr0bZNslY37hjbA==@lists.freedesktop.org,
 AJvYcCW8/+o/9ePVeqS9SOvgTMmsRfTSe+tyeY4mY4x/LjQki+Q4EJV+/b40gr4vQUTRfsl47vFRfCrx03o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhQulO0zI6u2utwqCmUtXYZ7b0ma9OhgbgnsEa4Q4yZ2oL9yit
 rD0OlEpekE0aX98F/k97n6fwz/4gSajWFhaUHksYzwbrEFaqntlhRdYBQzsJBlTKluBdnFLrEmQ
 G7n+0HGgAw6P1PcuYx4SytIFm3PWVY90=
X-Gm-Gg: ASbGncvG4+bWHr6pBFtC4fsGh2CQ5SC6iPg5qHBLouKT7czcjr382HvOnNEtY3byi0Z
 P6YrQhYZa1KX5qeRstUrxhakvux2sA7ffc6HrPzQRcxGUzgPuQ+brAvTk/hPm4Dz8W6g+BVRX+R
 jAF59NecuywtyKnyk6eE0Goh2G7l8Q/I7tO4ac0g6ojYt2PTI9qN3MUzDoNFRxzpZQcE+ZwTkoO
 O7Y8CKELxdbIqzRWzk=
X-Google-Smtp-Source: AGHT+IEkcEPFJWVoqDC95ubnHjSmK+HgnV7Pk/LSgyHRbODBMgxYD03I2CuqEZBVSHRbSPTpfzdWXJRqkBiOadC0OLg=
X-Received: by 2002:a17:903:18d:b0:235:f1e4:3381 with SMTP id
 d9443c01a7336-23e24f33804mr97588565ad.8.1753046707493; Sun, 20 Jul 2025
 14:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
 <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 20 Jul 2025 23:24:54 +0200
X-Gm-Features: Ac12FXxNjw8Q4g3oEBeaU3nmS0KVSD6HWujMXOZAqRuJ_29r1bVUJEDsypVG_d0
Message-ID: <CANiq72mjiBK+DE-NOx1p+wWuZpnK=aPtgnMUUEzig+4jHZzemA@mail.gmail.com>
Subject: Re: [PATCH 1/6] rust: kernel: remove `fmt!`,
 fix clippy::uninlined-format-args
To: Tamir Duberstein <tamird@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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

On Fri, Jul 4, 2025 at 10:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
>  drivers/cpufreq/rcpufreq_dt.rs    |  3 +--
>  drivers/gpu/nova-core/firmware.rs |  5 +++--
>  rust/kernel/opp.rs                |  2 +-

Danilo, Viresh: I assume you are OK with this, but let me know
otherwise, thanks!

Cheers,
Miguel
