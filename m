Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C815CADA176
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 11:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1390E10E20A;
	Sun, 15 Jun 2025 09:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nW4Da215";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF4110E20A;
 Sun, 15 Jun 2025 09:37:34 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-31306794b30so586645a91.2; 
 Sun, 15 Jun 2025 02:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749980254; x=1750585054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/gjcFnYr1zulmPLSgYp/FlvofVHo2jy2BSHVlmNjNfE=;
 b=nW4Da2151VAV1cC61mcCNhOz6Ctr9aPjbYYpEgxORSwxPhlV2MeJH/bdujvOycG9FK
 uqKiXhpeY4Wj+PrdACjg7vLVM9U8Gq7U4wak+f8jeg320Gw8v1wkaUfdysVOeTJ4wloy
 sQkJq05s5PNuymUJMu8mfWxZIEWyDcXLdi4Ew1XI+4T4T1iffQUkbVxdib4Kcbct/QEd
 g8OGHceVsn8OwfLQ992/gC7LOoAHh1ogFZTMHFmuASn4+W3S/KwU9wrtn2hHhyhFTYfo
 H2l2E8PDzimTAx1aRIkNE4WRfG3zdkCDCvZEpS+IdPAQ08529pa4TCy4EfnqTTxV227H
 6SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749980254; x=1750585054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/gjcFnYr1zulmPLSgYp/FlvofVHo2jy2BSHVlmNjNfE=;
 b=ThsqxSFAMrtGLhgeHa1UHnbV5wwZfeGyO/FB82OBxzfMHaVtsOuClPBt5nykz59fdG
 b0DyoxGQ/TJa7/SW1XsohwPgXqGRP3uWLV2ZZN93IEcQpfKkCGtAuKbSjpeNdTQAfC30
 8rY0IzAG3Rq1K4DDd2AI9JCYzG0/OcR14/SnXuuPMQ3L90yO/9THwSG8d62UuhVjArNf
 xjsg1Ti7XU1iTmit/jS8/h01uu9n+yMkXYrXWrdKFeg/gTaZi0aA/lNZ+8jdcxUJLnOs
 vxW/bvhOCQKXrCzMNGYgC+1KrS8IQ7VsG6oUBwTU2m93fNseOQ+kZthOSE6FHcozbhZ6
 Wing==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwzM2SGTPmZ5+gw+STpVllHl2Z1tcNU9bHole6XqVFra80hxcB5ZjwMC5a19+IQzozE+rScosi6Z0=@lists.freedesktop.org,
 AJvYcCX6SherITeew+P9C0jcDTOpk+DdKaa+0ZtnjvJyTWgd5luCDQuK7r1qzoWcNKIISTgA7GrT6gFWDg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxecV3eFJ+SzhaUDcnBwTzfHmXFfUJf8fC0rDLeoqrssOAgk13u
 6TVVrupSFMyPeI/ch3VOeMu1RX/1pUSj04j25ySqWKWKLlvN83hnDTAPYQyNa6gqtMIKg+i3ecp
 a7pJOub0yndkRGprtO+BKhSa5KgSymCc=
X-Gm-Gg: ASbGncv7R9GchnlHXYaxdokwFD/t/zrKJDl9sRFTkhiANHdsajIZ3U04rLQOsD+p5Fk
 SUlgLSFh98CCOiHuZS4U4WOfbV42U01F1F5/PJgiX24+cGgzaMeQt/nR7Z34PaT+CblXjSAuEC6
 BzwLGw3cUXz5aub3xNw1+4K8IhqA389W4M03VyxuKSeN35n4N1vJOhmQ==
X-Google-Smtp-Source: AGHT+IGbIX4ZqW4W6JqEhTUKL7JgH4ax75TOpKeUB9Si29+wvmi0/pBeO4Qe4njiFfgTj8c0Ruhx6A+eKMp32rUHjw8=
X-Received: by 2002:a17:90b:17c8:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-313f18d8384mr2404966a91.0.1749980253763; Sun, 15 Jun 2025
 02:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jun 2025 11:37:21 +0200
X-Gm-Features: AX0GCFsoXlgaGr3xG5wD7wf0x5De99vBBegtuz6QksxqbmtS7108VOxDnXnDgxI
Message-ID: <CANiq72=3nDR=J2OXu9nWwZW_kcWfZ4KhZ3aS12_dcB=1EP2icQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/23] rust: num: add the `fls` operation
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
> +            /// ```
> +            /// use kernel::num::fls_u32;
> +            ///
> +            /// assert_eq!(fls_u32(0x0), 0);
> +            /// assert_eq!(fls_u32(0x1), 1);
> +            /// assert_eq!(fls_u32(0x10), 5);
> +            /// assert_eq!(fls_u32(0xffff), 16);
> +            /// assert_eq!(fls_u32(0x8000_0000), 32);
> +            /// ```

For a future patch series: this could provide examples per type
(passing them in the `impl_fls!` call).

I can create a good first issue if this lands and it is not somewhere alrea=
dy.

Cheers,
Miguel
