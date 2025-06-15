Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FACADA1EA
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 15:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D8C10E057;
	Sun, 15 Jun 2025 13:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BEr7/QgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D7510E057;
 Sun, 15 Jun 2025 13:32:46 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-313fab41fd5so254026a91.1; 
 Sun, 15 Jun 2025 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749994366; x=1750599166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6biztJOYDaIMr4ggV0+B+qehBU/oHbwf4HAdJFN2AM=;
 b=BEr7/QgGgblEVta3BeT5lWbFkWPzAGWtIL1ngO2PJCNHgovgfo+cqZ+rAVBab9J35R
 fLSKr0WHcH5phXLwDdRUxsInU7jK+qUDu2xH/6lENrpLUBfzKoY4/T0VubLSiCxDu+f9
 vR2dCZrnFdv8QiRrSdNNVg4acJrqcm8h7qthCX5glkAVbxbyLCU4/AfmfEl0vj/ajM9P
 0KGUAq1DSeHVjxEeRAGPSWr49rKP8Mzdvp2PZPc1kHqgKGYeLvtlZM7Xz4Yioz7/3Q5w
 5vcKjXIO++pflap2PugrTjBqD7UhS6DHXqi10uSuBzKvF5N/FxaYiNNOD+EIBsZKFORs
 ofag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749994366; x=1750599166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6biztJOYDaIMr4ggV0+B+qehBU/oHbwf4HAdJFN2AM=;
 b=RXA/W3WWWuIHNLM25qqsnCBVeL1o8rBEzbek0iBPEU1Pf8DjESRfDQGUpGn1vJ6tz1
 moXYrsX7+j1jc6Ovz9zfGGhxBdmwr4VStmwGwUJBkrgWv3x+HXh6XejUKXlhg/1BgMVu
 8F7JvnTxjs0kwhHh4OHkuU8fJovlIPQxvz6yqxlE4LyWVoaAZvo8hcn6GomdP9a1/iK4
 wLyGFuq3K8U+vQVArr4MQWwruTOxviCroy1CQTWDzEcrkPU1okaNYkSdnrdcRVh/URPb
 xd56jXU5eol2O1ww4w4yu6l06trhf7zlcSJhh4UV+FE/lcaikMd/i7vRf2WSsMPS6A45
 Hp1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuhXncgscVze+kquXuCt5xczuTrFPNK2GxtuRB9TDCMcvk2SSTia4AYUVFvvhjqEuMi8sB29tjnJk=@lists.freedesktop.org,
 AJvYcCXkOfAX6/dNI4kXj0YCQAbDxtqUr85RHHv/OjFViFlIygb+ehraPreoJwepgWEGYqSTAouAwCx3fA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP0VJ4EMlTLKaYxOg2byEi6pvfDYLrwP1qSRzyGOpG+SiSeDln
 8YVwqk1q1oTNzaZSW6yTokktf6hVEtLW8VzyooRa4Y0A4wHNgbdFfOw7xXNfdEW0MJI6R4WYqVn
 QDVpNo9Cx2dNZ+TzBaMcxAgEDK8PEgLE=
X-Gm-Gg: ASbGncvMfLKHRGfP91P6llWLnvToHFWvSZNIy5wzOLEQJ+ZZUa95Iykvrj9H58dd3tg
 ruKrE+nEw+d6u///mhHcRsCyseFlVguA25Ad4nq3fKMgUP9yXBYDlMqgR3evjXoP2+qhBawFEdj
 L/Q75H8iRIRAEb0Oux7SqwrxISXQIWuTHu6/Xrar0dM5h5SAqhvrQheQ==
X-Google-Smtp-Source: AGHT+IHQPepWr0PbwjEpszbly3f9S7PyiIfm9U5H1qbjy7Mjf/JI6jI8cAihWSLXmT4Yher59wp77PQ5KCOkUqJ5pgE=
X-Received: by 2002:a17:90a:d890:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-313f1da5571mr3359079a91.5.1749994365766; Sun, 15 Jun 2025
 06:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jun 2025 15:32:33 +0200
X-Gm-Features: AX0GCFtDT2rLIdlNco-7aTZNeN4QdhHpMIapjyRZrHTOhSvmbikJIdVociuqbmg
Message-ID: <CANiq72nS5DR2NxLoba1w83=Qsqzi-gdK7Le=y7BxPxQP5U6Rmg@mail.gmail.com>
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
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

On Thu, Jun 12, 2025 at 4:02=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +                /// assert_eq!(PowerOfTwo::<u32>::try_new(16).unwrap().v=
alue(), 16);

By the way, we are trying to write examples close to normal kernel
code as possible, so could you please use `?` here instead of
`unwrap()`?

It is not a big deal, when within `assert`s, but there is value in not
showing any `unwrap()`s, and to spot easily places where we actually
do `unwrap()`.

Also, please use intra-doc links wherever they may work, e.g. I think
[`PowerOfTwo`] and [`None`] will work.

Thanks!

Cheers,
Miguel
