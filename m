Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A50B6ADAA31
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 10:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068EB10E068;
	Mon, 16 Jun 2025 08:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="l8VrpesE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7941F10E068
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 08:04:07 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2780353f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 01:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750061046; x=1750665846;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f1PYGjMBDRYf08ilo6nO6r65U87ulrrDAGAp9xwJARk=;
 b=l8VrpesEaXgs83qFD4+7JBWVuEt02iui6DLmTB8x69g8+S7sBRarCHFb9mNlfQxS2G
 BaDREhr0eXClLvO5pq8srnDs+bwg/lYLgYeQSRX5XFkrjAac60KQD0DCRatryxSMW6e4
 Lm36izcGpRxKueVuciSK28Z0RvuZFENfMrQLqrXwe0FTSmvw+zChbQA5d3DaF6c2TuAM
 kM1ZrRIklPsK0jGqVRpNAFFMYi/HwA6VslBypS0eUVPqWaayl4amIxb16IAk53dGjz72
 qGl0M9uLbeqSMor6F+DPWlfMIUK0ocxh3zoQWmHOWm+qOznO2Nmvpfmcls+NGyGRw2Kx
 CMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750061046; x=1750665846;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f1PYGjMBDRYf08ilo6nO6r65U87ulrrDAGAp9xwJARk=;
 b=KZX7RlAN1hg19cIqPRWXnSUkDGR9oGp4rUfCGQo0I0JauGJhMobXMRGYQfK6+20/M0
 gx+FjCCqBm7UgJ9qvxSHc5m2KNrwYRn4jcyOvGS/4uO6HdTQ9fo5DXU0Dhhbl+838Vfo
 6j8nKhCjIirD5lJwqTxXGNo4q7BzQ/Mi10E+dDB1vxRe9JmNDiyhC2Fov6Vutl2TJJzm
 OIy6YDussT2K2gFfQgXMMPPnwYhovD92AyCFzQ3NJqvyhqJLd+NaqNepQiMZXaM4e8cD
 E3ZMt60TuGJUnS2hn//4GPO+N9j0mS1kLiWlBaOXkDrc/MMe2vVKph95CKy0hLAYBgDV
 JTEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzV0KMLFXHkcvdvBciNltE7bkJIlW7D4Kh5BnA9VH361gMTQlu2r00yBrd394lsZ5rBnM3lCG/C+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLaGJ5n5S51g30KyDMxd4PMiacRyOu3nbaE1eNwxjBkxHfQ2G4
 z3Xia9qhRXS9TvN9jLfuKtXnlLMKqLbm4GMEvyYk8F0CUAEhTlT0OX9cuulzkxhiUowuOPwtVsx
 ATKKewLRGuN52JasadwPAecTSWEu6HQxe4DXY69xJ
X-Gm-Gg: ASbGnct7126NkrONBKgph+eL7MosBX+33EK1IvND4HG6WXGbe1SduI5kcEW4QKl6ic8
 aLjedSeCm+KgX3c/5j7PRUCQW2Go5Laky4sRXN3hywSAr5qmA6Pc9ogWhBXw4V+QtsGpLoRmUYE
 wOYJUK8VwtvzoPXnk/3csHZhI6Vf6Xr/54GMqkOln2p/HAWSz/FvZXHlE=
X-Google-Smtp-Source: AGHT+IFJNYnGY++zKK9ezz4GBc7LrhfZRQuFSNzgJFJ9/LkEAc06KUhMt33Oo5LPfwTK3+h2aideyFG6HmImWi9Q2XQ=
X-Received: by 2002:a5d:5846:0:b0:3a4:eef5:dece with SMTP id
 ffacd0b85a97d-3a5723a3729mr6989355f8f.35.1750061045848; Mon, 16 Jun 2025
 01:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250514105734.3898411-1-andrewjballance@gmail.com>
In-Reply-To: <20250514105734.3898411-1-andrewjballance@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 16 Jun 2025 10:03:53 +0200
X-Gm-Features: AX0GCFuzgZ7WEl16NbBTVWyiSxMdvM6mQ36bWXoU4zjT-XrCROgztLnIerofDY4
Message-ID: <CAH5fLgjgtLQMaAZxufttzoVCJpAfTifn6VWwKZ7Q6vAOOvG+ug@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] rust: add support for port io
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: dakr@kernel.org, a.hindborg@kernel.org, airlied@gmail.com, 
 akpm@linux-foundation.org, alex.gaynor@gmail.com, 
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, benno.lossin@proton.me, 
 bhelgaas@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
 daniel.almeida@collabora.com, fujita.tomonori@gmail.com, gary@garyguo.net, 
 gregkh@linuxfoundation.org, kwilczynski@kernel.org, me@kloenk.dev, 
 ojeda@kernel.org, raag.jadav@intel.com, rafael@kernel.org, simona@ffwll.ch, 
 tmgross@umich.edu, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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

On Wed, May 14, 2025 at 12:58=E2=80=AFPM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> currently the rust `Io` type maps to the c read{b, w, l, q}/write{b, w, l=
, q}
> functions and have no support for port io. this can be a problem for pci:=
:Bar
> because the pointer returned by pci_iomap can be either PIO or MMIO [0].
>
> this patch series splits the `Io` type into `Io`, and `MMIo`. `Io` can be
> used to access PIO or MMIO. `MMIo` can only access memory mapped IO but
> might, depending on the arch, be faster than `Io`. and updates pci::Bar,
> so that it is generic over Io and, a user can optionally give a compile
> time hint about the type of io.
>
> Link: https://docs.kernel.org/6.11/driver-api/pci/pci.html#c.pci_iomap [0=
]

This series seems to try and solve parts of the same problems as
Daniel's patchset:
https://lore.kernel.org/rust-for-linux/20250603-topics-tyr-platform_iomem-v=
9-0-a27e04157e3e@collabora.com/#r

We should probably align these two patchsets so that they do not add
incompatible abstractions for the same thing.

Alice
