Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE5AB0B900
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 00:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E06410E45C;
	Sun, 20 Jul 2025 22:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e/TNHY0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C4810E45C;
 Sun, 20 Jul 2025 22:58:05 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-313336f8438so685415a91.0; 
 Sun, 20 Jul 2025 15:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753052285; x=1753657085; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=daKnTV4fSp02pGETIV5FEMpqyBsp4GEPOMMbZuGBz/g=;
 b=e/TNHY0CWcKELNucbm/8hT1f9K3E2V2fzeC1vvb7cuS9YgszQ6gobCg00tFREgB1Wt
 PoI411CfNw5g7uRTjHFZGjcRdbFpgT+JTKcXunKaaXpPjH7tb7BKcqL8RuQm0Px4vN/K
 OWUbHVYt266e1mGbXFm9z/uJKhokcYrIYpmM8RKrjJY/zDyCDWRKEINj3v9PosaDXh1m
 wxIZyRE1TQULll33nbCra62TlWH8o4byXYn1oX36BbLCV2ombd0fliHf3sxYhoXMMIb7
 cyKaMHO5901bl768LetOw814kUoCxJO3DvtMt/nUPWjkqGzRVMoRq6Y9iUu2clEDgScz
 OeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753052285; x=1753657085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=daKnTV4fSp02pGETIV5FEMpqyBsp4GEPOMMbZuGBz/g=;
 b=vzv5FQdPGE9fx+0iSC5yGZ5coy+mipSGZgNoiEpgCCiJOqGoXxbYmq/613DuhtpwJT
 7iA2LO/C1JOF6RxhFBeRrjIZpNil8rp9V48qFrPBxeSnwJhAbESDOH6lDrm24L//8+I4
 cyxCclrULeTnfb3urT3PFtL2GGcd+rGjz2FYNQ6/2h9qlL9SqEIv4fSb49qWDHaNzEwU
 sZQFPNM+jqfd6mhSGsYHVNB7S345dCG47X57DJ8mfHBKUN7dkpZrMzWMIAgEAkYhsFkZ
 GU1Uk7SK9plGwjB132AwXm+4vBZhpLK4D6fi+zDOmtapWZkZJzF5RGVCYDxLPx0/otC8
 6A5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWEGDMI7Q7+8zD8FH90ersiIN4e0vqXo70J53vdwidjYucShmVCbpgfc4LYNYvI5I3/v+OQP21Gg==@lists.freedesktop.org,
 AJvYcCVzVohzftW8ixBFfDoYTM8cAFO/oqOPGPnUb+iWkLCVej00fTnnBpR649XRFNLZ7KDbwvjlfA2Qvfk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNw7iDhhNSUUVQW2P1vfVvSzgMw9QArMb+EYTwtcEHFLXsTU4i
 njlrLQYdaYUYz6MydlinaEo84hAAsNasfMk4pcVzpDjmJBiFzJSP4s8Gug+qO60DhoaM6p1tocT
 DF1GNzkgF6O8PyllsIPV/2KshffWIA0A=
X-Gm-Gg: ASbGncuDWmcCvaylPTedqqrNsbAZqFWjWxr4bzevWMCA1SFg1fRCJS1iYLcwY+sS5wj
 CvnpBCu0Xb8fu7QAG2TGWeBZVb5i0iyFrs01Y/owH95fRMT3pA+bxHvAy1Q1RUzNDQlLF73hlIh
 OlkG4TDxCIoJAc3dez0A2QgGwU+emCdstq8Th7AKEq4uljhEFbWmIuOpfdqjaLypeVCdEl/oqna
 /gJVVM4
X-Google-Smtp-Source: AGHT+IFzjmvc0kMfKRG7U+xZ8wdQiM8shuAqXzIYwkhDrfmjAGRQWO9y1Uiy4Ste1/hFhJYypkZPHvTw/dT2WozP73o=
X-Received: by 2002:a17:90b:5307:b0:311:b0d3:851 with SMTP id
 98e67ed59e1d1-31c9e75ef14mr12278425a91.4.1753052285238; Sun, 20 Jul 2025
 15:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Jul 2025 00:57:51 +0200
X-Gm-Features: Ac12FXxrHoi9ILUmBTRKm1OiT5BshvaFgsQVGJOA5I6_EA8yoKmhyCiVsD11rgg
Message-ID: <CANiq72mF8v7Gzr-dgfd68OPjJXDp=q+-asMiqcet0R0viqMbkw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Replace `kernel::str::CStr` with `core::ffi::CStr`
 (cycle 1)
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
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
> As this is a large migration that touches many subsystems, it will take
> place in several cycles, each of which may see multiple series:

Let's start the long road, then...

Applied to `rust-next` -- thanks everyone!

    [ Reworded title. - Miguel ]

    [ Reworded title. - Miguel ]

Cheers,
Miguel
