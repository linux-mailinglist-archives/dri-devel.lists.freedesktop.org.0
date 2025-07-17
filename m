Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B33DB08E64
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 15:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB7910E099;
	Thu, 17 Jul 2025 13:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Joy3Of5i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD2710E099
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 13:38:32 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b38fdac002bso142754a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752759512; x=1753364312; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+AkjrzWPxBpSHEuKgQ5YjwK48qZvCjPPIkc2sko6UqM=;
 b=Joy3Of5i3TgmMT0/2wJeSIepaLSIJIj9TMmL3GuVY0PlK9jKnimYKQlHNfuHHsKu6b
 d54zZ2Qa/jZFROdY+IOs3CzyCMqi4m8ccDuOFY7/VNhpn15XBzbCRw3VdyfBNAC/dQMu
 Ux6aMUM9/onWS4xyvL0sWjYAjV2qxfJ4kB2mrJ6uVItsJic6taTn607tnnzCwD6U0C3/
 D0eBztsudLfJnfS4TFbQ8YbsA4NQFXpwTiTbceYTSAnBFV4XKvE7x4nGxPTkHTWb4EbF
 IbJEY2JBdVHubODLWQ7j4sc52NI8pJkG3mp5MjF90CPE/NSaWnGayvERBcmeVpRUvnQP
 ceDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752759512; x=1753364312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+AkjrzWPxBpSHEuKgQ5YjwK48qZvCjPPIkc2sko6UqM=;
 b=Q8ZRBWr1N/BPawVETbUSNv+wHXUzyN7BRL1Y0SptH63VdQGpjcoiY+wAb+tTCETSeA
 PIjVEuRdldxckLR80qMPlN+OHgpDLvuzLmrWF1uoaWUvY95h0bNy8eJFXxF0qmhlOyuR
 Zii7uA/vIw7OnOLaIfD2L9rQg9r4A1O8lthNraXhmzTdd0/DeKNl24IC5VHpk0wg8Yyh
 ePbpfG2LA2Rv/+9raMz7WgnOrtET5nTA5KRYSYKWUDTXc50UK3JfPbFUzZrS8jiGTe8y
 5N+H3pRHZCGxMT+WMQjkblKoJS4TMk7CZKdTy8kMISSHUCHcqQDsV6KWBc1IfgW+2Ov+
 N55A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0JC/kLOWaaVvzyD5bh2zIQ2fs7I6lBq890xxhgZUGDAQ5Tw2w+VwVnrTeCKxU68N2asq81hFLKG8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxoldcefhBgdUp+0O8mpzHXWvsGM3/lQ1r2lwHsFejRbXzjaeK
 fj2vNrBJm4zHidhPgPxCP7zWYLMlJJP3ZTAL9BjLCFy4CxKGqx9knFlPxXpmv/T7ZO8V/40J7SO
 5Wk5Slc4jgxw7QAN6wS4aDHC2Zr70INE=
X-Gm-Gg: ASbGncvdD382CCEDG88EZgLrebtoxn9ydqCcxemEhAtb7Xf4abaZ02lgxbWhbEaQKbq
 4O1r6CeiEw4U8am0v1v1w5en8oM+7vkcz26GBTYtAB2M0p/0wJePTbnrJ+JFhx/k4/aGWj1wwMs
 1B77wDbCQcmIk++LqEd7ZoOeg8hQPy6wMipZgbcBIlhVtTzLuQ4ZqCWrZFgsbbBpyrvVsBRkvbF
 JAcGDfVRPx/9dzJv70=
X-Google-Smtp-Source: AGHT+IGEsaFtyUBV0IjuVA7MPyoMvjy1LlulgWESoeSjWkqBQ+KEr3dS7TNu0MNbKccxo3wsApk66kr6WAzpxVFMFM8=
X-Received: by 2002:a17:90b:4f8f:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-31c9e5fd68dmr3601644a91.0.1752759512264; Thu, 17 Jul 2025
 06:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
 <20250624-opaque-from-raw-v2-2-e4da40bdc59c@google.com>
In-Reply-To: <20250624-opaque-from-raw-v2-2-e4da40bdc59c@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 17 Jul 2025 15:38:19 +0200
X-Gm-Features: Ac12FXz1hbZauBNzw9Btshfw3inaQsSA1Vx4_yL-0LcTTBRjd_Srl1BbiM_MOFU
Message-ID: <CANiq72mMJRpiE0AKbP0MtvnnxP4fSnOHGhRn+GCm=D5VeLduLA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: types: rename Opaque::raw_get to cast_into
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Jun 24, 2025 at 5:28=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> -                let cell_inner =3D ::core::cell::UnsafeCell::raw_get(sel=
f_ptr);
> +                let cell_inner =3D ::core::cell::UnsafeCell::cast_into(s=
elf_ptr);

Bah, we also missed this one -- I will rebase / send a patch.

Cheers,
Miguel
