Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE45B39BE5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 13:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2352F10E1D4;
	Thu, 28 Aug 2025 11:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dQPFiFEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81E110E1D4;
 Thu, 28 Aug 2025 11:45:55 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-325006ff07eso77467a91.1; 
 Thu, 28 Aug 2025 04:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756381555; x=1756986355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2H56yO/8NFGXQtE7p7bHZ/o1E70dyX3AMAnCJlBt6w=;
 b=dQPFiFEE5trpogGtFcs+sw4czMozzXgKuhR/Mz5mNVeIwKmOB0PHHAvV9bLf98oYbb
 RZ+oxHSY0PSFM72xzTveyPEZRdm2nbn3m4WYViQwDNSsz6gaox9rW57GAd0vX8nNu5wU
 AhFNGUcuOz88GuZu7Wq1yn9hEQAhcrsMR+a3JH4G/fWNvUFoTAioaJcw8czbw/E3DRLy
 oMokxgcVmaf3yCjjgD4QflUQSLRkjw02RnMsyGvVUwICGpg2pfPpxt+u2cx58nh9gFe4
 CmBxWaEFiBIBfXHFVUGGFP7L9NpmqPh6LPFtsJJEYmGTEVDHK5dQ4V3wgeb3wNGIisk3
 cKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756381555; x=1756986355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2H56yO/8NFGXQtE7p7bHZ/o1E70dyX3AMAnCJlBt6w=;
 b=LqTVXMFEvigGbaEELmR9ef4RlEehGwqI6Is8Dgqv95gUgwQWlxfI1QB4rfYVbeJ5si
 u5vtW59tqVV1dYbHabLKiUR5FQY2FncnyHvlqOn9uBIDAllBCEXilXSfB4PulJD7fZ9p
 txq7hr19NTW8UfoVbLNr+GodL6G2ls7J4VLrwSOw0rg82t/C+9XbrNgm7Y6qozesZPgj
 kmCRelgyeE+0EBI76ddGKj8N4jAOUiH2lcr7YN8EQIdegqOBoc4mYqH16TDAZ3QwS7Ax
 moOLwP6h3Kak9qe4XzpbWmH4M9AX547LPQ9aiV1bJd+vwRqeJekp30+Zy0/pEMQ/fbnx
 uMAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnMzjgIummVbDCp9QK8DofnOLb/+LcOmppIxtlPpPQmE9TWmcWpxRa3e1+/6paxVTSnNlXvoTufw0=@lists.freedesktop.org,
 AJvYcCXAebKHvaJYmMM6KqRHda/TDhrU0Wyl/a71wLC9mOMA12QYfOqCkcphyoEk9X4IZ4GQhZkqDgwqOg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1cqKdOuJ+nJiSFshqkicr7EJ1PiLgtfdt3yHj3tUBe5TY2Xhs
 X6cQfDnZXwAO+9W2CEJnXKbro0gGi48MPd4fwr93YOMj6W9+rbj6GkFyPiF7bNK2vseHr5eCTvW
 IVJskXuF0lNj1kCoX8JydoOcE42ycnvY=
X-Gm-Gg: ASbGncu5qFtNiuSX2k7vj1sUBupjZad/mbNTyFOcNQ2u6f3zB1kTRXWedm47UXWrqXm
 vzaT9w7Da4nSUa7GjyzCQUTRO8rhvYSQQ/bxH4Fp8en64Zletq01wCAj9KyZawXxDoIQLMWoAM2
 lQ3NGsMnjlWub9val/YccOCdOMVA4HuN88xuHQTGFNoPC9dN24qIthSuDxYwI9iech63rY04grz
 j8QIOc/NUPmf/G2z6jRj762faOSZokWnslmhYjQdXFwkQs5Tqe7dmyUPVR3TQkUN+vlZWmknK+Q
 voTy822yl/VMuwLQRIIk+L0j+aPNkt/7Ci/3
X-Google-Smtp-Source: AGHT+IG1ihsWTuJC99RCEFetl0OaKKf7I0MSOaGMg4ugbXGYCXUCMWGrBO89xxuGWPNGJExxHbx0h7dAYm9Df/5VgN0=
X-Received: by 2002:a17:90b:4d01:b0:31f:3d6:6d98 with SMTP id
 98e67ed59e1d1-32515ee8b50mr16448907a91.5.1756381555273; Thu, 28 Aug 2025
 04:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-1-93566252fe3a@nvidia.com>
 <DCE0VZXSP39I.FKGHKONUTB5L@nvidia.com>
In-Reply-To: <DCE0VZXSP39I.FKGHKONUTB5L@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 Aug 2025 13:45:43 +0200
X-Gm-Features: Ac12FXzDZTEvSN_jSpG0n7-NSUbagH20PpVfLwEy9ehcrmoj8GVXqea9N91DQ_U
Message-ID: <CANiq72=Z26jzVMbGfqL-_Wq8boX5qApmPCVGA1D6cwzOxgWWLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] rust: transmute: add `from_bytes_copy` method to
 `FromBytes` trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
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

On Thu, Aug 28, 2025 at 1:26=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> We got 3 Reviewed-by on this patch - Miguel, are you ok if I merge it
> together with Christian's `from_bytes` patch, since they are closely
> related?

If you are taking this series this cycle, then sure!

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
