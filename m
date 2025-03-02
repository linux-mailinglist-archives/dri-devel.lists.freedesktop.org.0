Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1976A4B48A
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 20:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBEB10E0FE;
	Sun,  2 Mar 2025 19:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BSLeh9Xc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAC310E0FE
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 19:52:31 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2fe9fd5e7f8so1124804a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 11:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740945151; x=1741549951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHXySMyyjeDeeoBzepTdnF20WqV9PuveI92RW7vhLSc=;
 b=BSLeh9XcC8KVisIjUsLTDhGcBg5FmIY5wpUVpBWjbX7tcUwg+//DiAxkWo9YnLgJuc
 uuRd3yfa2gQYVRrW9nXQ3GbfujQM255Yf0b4bvT+pO7bbqRZ64Rru6i0qpDHRG5oUR6M
 o920Y/GtHSbf+Hq+ZoQPKfCuRlJoymIijRJ6RgsOcb77NNMpSa7vhEEaWkL2eHrUZdtY
 R3/aXFfAdiZ4i4Ye905snQ82vssMgksEBJJIrumaK1BCRwyLFD71JRCSJH38l9RDRVAe
 bT7RcyCLFHdtGznSzm0zlemn/vswEVT14jmYZwK2RLCYb+5TYGR/5gLJqPQiZmC9Aj+0
 0U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740945151; x=1741549951;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHXySMyyjeDeeoBzepTdnF20WqV9PuveI92RW7vhLSc=;
 b=EDWJN2/Dw9BdFDsTDtnva/5puhCs7uZFHPZZq6cokvvlj5XINmrz747h/XFGDq74Rv
 p/h/UesQKBUIe3lkNJJyZzMLtDCm/RBSnQXJUdMIt3Vol+xU83J+2vzYBiBBDrTVaD27
 UskQgnxFHwWe2c9peYYk7T26SzfY2ytfujdwFg+ArosvzWRCELfTBG+plXb9DbPFXWgR
 tkDWCav/LSmSsRxPFGxmky91e0FMa+/RpxTpd6vdFX5K1PyErtSoclsXL0T3RVxo/Lr/
 b5Kml/yzceAsc0//3FHucHkM/8vNap5IeXAkA2oGdtvqac5pWPLW1+F3JVk+sNUbB89c
 5kcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyLiDe069al6KY/Rh6GZgRgPHIPtB46cUUVm3nIex9vJ77T6zr3r6S59Yyopx4isTCGpihxy0aCF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBX6kcQ3nrlodz+uARGTJXqgPZdQVqFEEAUxVGyOknDsY9ZHek
 5oyVDelgjiBQs50U/EcRIXLB4L4AXtYWfKXd/+rnAi933o09rGs/Je2DkSiS+1pAOMP0cCxY+ru
 lB/bHH2WbymnYtR1OLXWywA1ADlI=
X-Gm-Gg: ASbGncuElkrLfmRoCSYfuycIzocmN/EMujTTn01o7+veBUXbwygQD49mM6KfKhZU26h
 8ITwYMV1Bbh/swvLHz5w8BNt8qqRhLxS5KikDjonv8fuWFeq9BaPgnq8vI1de/OPD0ISMgE++Bd
 Fh0XaSefKHDOlyPChKe6/uKOnhaA==
X-Google-Smtp-Source: AGHT+IHnXTvUBTPtGobIrGFeedrO+dD850F4DUxvbbOgGEBNLvBYSu46PwNNNejdcvKsptIh1mncfr4QWRX4VhZrMPM=
X-Received: by 2002:a17:90b:4b87:b0:2fe:b54a:78 with SMTP id
 98e67ed59e1d1-2febabdc238mr6445294a91.4.1740945150875; Sun, 02 Mar 2025
 11:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20250301231602.917580-1-ojeda@kernel.org>
 <20250301231602.917580-2-ojeda@kernel.org>
 <CANiq72=69XAOapYBurbwsQOEaw2uamZ6ta=DT6cC-om9XK3dvA@mail.gmail.com>
 <Z8SMTiWzTDjIwGfO@kernel.org>
 <CANiq72nQNFSa0quEwLYMUVw-2CH3FwrV695k-rWfoQn5r0Mo0Q@mail.gmail.com>
 <Z8SkCA5HD2WxR_W0@kernel.org>
In-Reply-To: <Z8SkCA5HD2WxR_W0@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 2 Mar 2025 20:52:18 +0100
X-Gm-Features: AQ5f1JqoqH71Y7MXZ8zAgXFrFSAcx9pl4ZbmzXyaWyiug3l2Kok7TN_oewmQwdg
Message-ID: <CANiq72kPF5sS7tDrtp5vRnucWLkqvzDj6EY2UbyA+X+L72xszA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panic: fix overindented list items in
 documentation
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>, 
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

On Sun, Mar 2, 2025 at 7:31=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org> =
wrote:
>
> Ah, ok, I guessed that you might have some backing idea on what you put
> :-) Thanks for the explanation.

You're welcome!

Cheers,
Miguel
