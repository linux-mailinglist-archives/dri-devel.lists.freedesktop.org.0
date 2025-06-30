Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F59AEE5CC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 19:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1259810E0F8;
	Mon, 30 Jun 2025 17:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hGF49R/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A140010E0F8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 17:29:39 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b31d4886c50so909161a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751304579; x=1751909379; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CUYIdjmgv9njUUHSesywfXCZRgrZmBoh9yxN+weH9h4=;
 b=hGF49R/JmAwAmCmRruitWVmYT6q8YvbVZZUjo36x1jZ6nkMuKYzEhbvpyMtdas/tH/
 AcmpHl4l0lK1WEVJJdSvpOMI1tluT5x31oma2sUDaCBL2AtOd3jJPPowwJTIGiAX1RaA
 IKw9QivXL33QAFiT3QbL5kZtE/nqEVu/ko5JPLyjbHxOK1z4xzznCmbeYlS3m10mD6/n
 FX3L3VntrSNxDgeWmBHn7iEYD4APXKTkY2eDRk102JN/aGnlNFexCJzLeanldQEjk7pW
 a01ydx2tPkF+kEeqnH/h9m0+8hR0iADrMMJkhy/lpd3E1o8+iiLhUqMjozJboQ5wxPQz
 mkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751304579; x=1751909379;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CUYIdjmgv9njUUHSesywfXCZRgrZmBoh9yxN+weH9h4=;
 b=AiZMExp8aUbdei9MIRhOV654WZO8sHr0X+ClcVVllr5vyHOwofyDeL21elbDWCrtcc
 wR7IMO0KN3kV8cCERFj3TZKXOKyhXwBc83gYS9HpCsmUP+WHGOECg6h5IQcsn9ArZi0k
 5JlaBXjoimsoMmEB3wSRH+nTrpm+66HGnuZKjdUYfeePoPMQyyK9cg1cYuzZ6P/hUVgQ
 7aGVcL2uhr23Hiv6vgqJTNW27Li6w8OhTel/e/O9akt11RjEhtyrUSGd4R//otSZpJkM
 VY6Cl5IAEespy6+E/pfTIysRO0sFCrKjQxWvVZ90d4zzEsfFQUCgZkIf5n8pBLEjfc2J
 T9Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX//lF2v8zpGqZHxbEg2KSSH7N0PDued+j/xfbq6E/0wFmf4zobliAcrRz6aECjCGFc7OtZkWjWmfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgSvziyKX6Oi01CZGN5XTlN0DBpMANzJDWdo6QT4Mgqy4/DszD
 JZWdfLY3ToPNJOPiRV1iKqLXeEpFON/niIK8jDwLeS4wrNuyH8WAe5FDZwI9CRvprBckwMpzxRA
 zFJUge8G2mzFmiLwl9uIML7pJsLkK6rw=
X-Gm-Gg: ASbGncuma1GvV1zHkfsKPyRwUcbMwyk4f46ICbwNXxQQBlqX7xko0zeV5UTZYz2VnEJ
 lJ0shhuoTYANoVb12bPKTQwHciBFy8E9f8+2zBvaMPoDz55UEMstfjk562kI/9ppvtPI4pFeTgx
 ur6fsr14A+e+fM8SCbm+fPxT+kzTl994RT1l1guRA989ES4LYWfVeVyw==
X-Google-Smtp-Source: AGHT+IGlkyCbo6YfmrmszAWcBbTqpCcv1RsznazCnMzfIyfKQkN92UVyVeB8q+z39JjyvyKMtBZVUyeG1clRThxO3Bw=
X-Received: by 2002:a17:902:c412:b0:235:f250:84be with SMTP id
 d9443c01a7336-23ae93fe435mr60182125ad.9.1751304579036; Mon, 30 Jun 2025
 10:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <aF8lYpK_l2I-ts1k@pollux>
 <9D9AFE08-2CBB-4A89-866D-512D9080754C@collabora.com>
 <CANiq72mgt4ZD43Tm2bFr-gpicXMhFbC2DLqA6F0rN_J4rAe_CQ@mail.gmail.com>
 <CAL_JsqJktA2F4y8YFfZ5FzrwrJbtxkbiqts1LWT2KvXLSSDLjg@mail.gmail.com>
In-Reply-To: <CAL_JsqJktA2F4y8YFfZ5FzrwrJbtxkbiqts1LWT2KvXLSSDLjg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Jun 2025 19:29:26 +0200
X-Gm-Features: Ac12FXxGto_ukqtLcE7Azeq2vHM4J-jtxUirDXVzVuk5d6cwm2TGh_Ol6EnHOWI
Message-ID: <CANiq72mnQWU13qYi1jrhyhwp7iRPPijQ-pXJcyZhwS9WcbXo5w@mail.gmail.com>
Subject: Re: [PATCH] Introduce Tyr
To: Rob Herring <robh@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Stone <daniels@collabora.com>, Alice Ryhl <alice.ryhl@google.com>, 
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, kernel@collabora.com
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

On Mon, Jun 30, 2025 at 3:52=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> No. Drivers rely on empty stubs for all the providers they need. It
> would be pretty unmaintainable to depend on all of them. You want
> enabling drivers for compile testing as easy as possible.

That is fine -- I was referring to the current patch, which at the
moment requires it to build.

Cheers,
Miguel
