Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64435B0C47B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 14:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1839F10E042;
	Mon, 21 Jul 2025 12:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e9UrPh7O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED03910E042;
 Mon, 21 Jul 2025 12:54:41 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-313dc7be67aso530978a91.0; 
 Mon, 21 Jul 2025 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753102481; x=1753707281; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bq5VgfjTkqyHZmMsa4CuFn3fXsUBDjAcxmYxO2xVUQQ=;
 b=e9UrPh7OZqUQS7e92qBPqGEArNzNOZR4GXnOg90o2CkGGixtosfkJXZMnFy2d0DMdQ
 /HJl/xu3FnWZS2xncT2Rl8XC9A7U21bqCexwJ31tp1Kb39UdrDVB5uRfja9ZSqTNGbU8
 2WRHLZ01PfWScsvs0z6fjaHPgpi98dFu8kJegGKhjwrPnB8iSDUvvInuoF6EPibDQg9C
 ySCIRdEcGeNEKEQ8NSzDHOeooph/zXs9IbQQBN3YsuKn6IB9D1SA/Bc5SdpzuexCxTd9
 FTcbJmMkp5qFTp3av+G08gKQm588bkQzexJLmp74uIaFkHEXtVDNsQeSdQv6eIEiWag9
 DvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753102481; x=1753707281;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bq5VgfjTkqyHZmMsa4CuFn3fXsUBDjAcxmYxO2xVUQQ=;
 b=mGABn6VpE3Hj8jxa+WeFX5uKj0V/xf052OCrpy0JwBGkw5PTV+SriawZuTLHAAb++O
 IB1moGwLn10RfMqDA3efO4vhzxQrlM8SLc4LbPVWDOjdWD9IEJ6vc8Fo/TVYB+ZChXYv
 RmyPfAL9tF/LeK8dKe+uVuvPUrwtWKwZmzsIGeMZ1CV5LP1ynsNX6fWqZdbhsFh7Osei
 AK1Ub9yaP6uPBbefwc+X2kx20v91x4z7pycCmF8C4Mb0IU/3VTpsT30ZGUKiJAOI/6Jm
 TBrdMGq3s16Cnd8u7rHUIJr/DEADt/+61ldl2oFaQsB7gse3gj/Yu2dG98/+nvE4szDh
 wxJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgtX6v2ZfzrhSteK8JcgZYQkz4u0HlyvROo/gvPWbpWmo1h26BMel1j5lb7Nowd03VXXDh0VqUdQ==@lists.freedesktop.org,
 AJvYcCVpWaBEL//8Ef3DyQH4w4XUk5Y3OrmCr71OeIFkRESBEgywdmYY4qXQv2IOwq2GjxHaIc/+wsi+ewU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEBVnh3bW5SQ8WRcRma7NO6CBDy1xjA9qRPWpevLUq+DTTOk5E
 E+Gbl6B1EpPhFq2oQFzd7weoxsgf9gueH4vyo39343o2F9BsWD+CekWFV7nU7Ux59UF5vHCrPyR
 hbnjg4ziGxi8Q2hGr44/D30/Pso/QcDk=
X-Gm-Gg: ASbGncsxqTulFqRk5Hc6WZYGqV0gRSKPwXTMIuDpkWC2XZwxgI+lHLgfQWbCag3OpST
 HhVUUB3WGHXpR3mjCIFFY2lOrRsEg2mFLT+xpsnUONuxBt9qZzxKJ20cRJmOu0dy98Ky+ZsE0j2
 iTLms0xxoHO3RuNI0NY4MgyjSVz/+7UEl9YjDmzrtaEpeXYgF9nUZtoQGsTotmqK/kyi6msMcwv
 LECXsW3Yw1eU+7e3u0=
X-Google-Smtp-Source: AGHT+IFI0uNUbtO1EL18MgqcISBuZun5VUryvqrsQhtAKtldt6P/mlWmjlPr/GgmBjbnB7SvG/K7ChJXEi849ooHmqA=
X-Received: by 2002:a17:90b:562c:b0:312:25dd:1c8a with SMTP id
 98e67ed59e1d1-31c9e6e8348mr11443694a91.2.1753102481364; Mon, 21 Jul 2025
 05:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
 <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
 <20250721073717.i6hr4iesfupzvtwf@vireshk-i7>
In-Reply-To: <20250721073717.i6hr4iesfupzvtwf@vireshk-i7>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Jul 2025 14:54:29 +0200
X-Gm-Features: Ac12FXy9X7WoYLkMFLbQ__okKUv8h09D5Y5ZLeDybojK9NFQlmOXBw1vbHf4mSI
Message-ID: <CANiq72mZxcwDX2X3RfRpHzqkmU6GBVadKPLJYF03Hj14O2x4PA@mail.gmail.com>
Subject: Re: [PATCH 1/6] rust: kernel: remove `fmt!`,
 fix clippy::uninlined-format-args
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Tamir Duberstein <tamird@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
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

On Mon, Jul 21, 2025 at 9:37=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks Viresh -- I will add this one if I rebase, since Stephen
already solved a conflict with it (I should have pinged earlier I
guess, sorry; I thought you guys didn't Ack so far since it was
trivial, but thanks to you both for them).

Cheers,
Miguel
