Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6DEAEE5CD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 19:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B5410E10B;
	Mon, 30 Jun 2025 17:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lggH/Q3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16AA10E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 17:29:42 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-312efc384fcso585363a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751304582; x=1751909382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EXuYQU7ofnFyRQG+83B5WuZEhJmLAt5qEiC4cw0Gmg=;
 b=lggH/Q3dn1VZftCJGnIl9ocTLegcfNiT295zeXrfeSiyAs1QmQqT2+l6vlrZveIt0Q
 jUVGr3oN2F4eVkbLhxW6SaA8AvMP346lqhtcX4mpofOUsU2h6m6oG/mxDOPUxoYuHqPF
 xDY534EB4APQRXneazhqgCBzWLMKwBJ+NYqhBBRw1atqMHcOCszE5Z7MzMPTMQ4zcou7
 AUc5NyK4uoW/Ns+t8QE/Gnc7h9KnQZXFeulXPgTNiad9afV9ks/1XmQ5EZkmj8Jal7D9
 eBlt0ZQNGBI2Y6wsjQOZP+JA7VST/TTLVX3aPx1pjygMSDUMBYGsZHRkTJbG+eHajV/j
 bvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751304582; x=1751909382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2EXuYQU7ofnFyRQG+83B5WuZEhJmLAt5qEiC4cw0Gmg=;
 b=MQOpaz9k2anObsHDKDJ5elc8ju71dXscilYDMHyHcREzNTi8zHtCZ8FMJMEHXKeC91
 G+N31XJai9uqCGHC7DiVe6hucEG+bDVJ5tvGPlEGupQPeuQ6UPyAqLRFGVxXQLwKcxv8
 U0mTaz0/wda0gBib1w/suOa/4KNWwIeXoFKiYZeyE3IpW/MMl3GTtxFkBoDAJeZq7nPv
 x9eqN7/wnaeTdA91aDCL2YG5IgMtjtJIgS5rOCCaCaN2hViZEI50CoOsJEK2iC4kl4Eb
 4R7ShcZAvalCrSBU9f1lWgCN7e1gmgIFWFsGCEbcp7uYq9CQKz6zkzUlugz8oISsL2gg
 PWmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEb+qmaRuozzwlwIWEyzR3PP2CAqJLZDqa7y9AudS4OSHXyWLqGLOWQE/rRz15W9a7cDe/xUBw92o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy39Vsda0HVvVN0MhcTLnI/AEk5+eSWMXSFYXM2RVygRx3lVCh
 dUBzttqX9oCUC58UriwsFxxuzMhx6x4LMeXKRmlkkqpHNAJ2NBvvuENas5BwIOsudrG7O5SeeQT
 drA2/VwEKkPo4KDM7NX+TafktS/PPklU=
X-Gm-Gg: ASbGncvjexQ7+6ipKJIBWcsw5Vm2zdcDrPYBwg7RFT1shBzh5H7M+RyYdcmJ3NGJoye
 zTM2Q9c3mwRxGsjABHtZhZ/V2GBJ43PcRqW3d5PCBwEbf5zacOlPtgVCwpuL8geGNnS8gmdsmBr
 3cIr5O2XysJLZujEgZ48BFMxQU283Wi1mU5xJRTZaqEDCEw7i56Q+STw==
X-Google-Smtp-Source: AGHT+IHNFAoy4LZZlwy+/lc9cF0GFvTc1DQcOMPk7F5P4dPZFOhIkhTNy3nlwLcOglC6k+NTX3ec5cp0d0xZXUE089s=
X-Received: by 2002:a17:90b:390b:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-318edd3da95mr5373513a91.0.1751304582241; Mon, 30 Jun 2025
 10:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <CANiq72nJcEM09HbQB3_NpKGxr9x8Ah0VE+=XS=xvA26P2qg=_g@mail.gmail.com>
 <48605183-78B6-461E-9476-C96C8E55A55D@collabora.com>
 <CANiq72kWGUbpDW+WjKki4JUYX63j_GFBcyQse-rgddwyoFw7cg@mail.gmail.com>
 <5F5F10F8-C082-44AA-9126-3436E14D0855@collabora.com>
In-Reply-To: <5F5F10F8-C082-44AA-9126-3436E14D0855@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Jun 2025 19:29:29 +0200
X-Gm-Features: Ac12FXzbdm4NBVEeo_qmkEvUx8JoBPgE0GdbkjzAa5lShkG5ds9T9qC8hzuoveA
Message-ID: <CANiq72kYP5WcrFNhdAuJ_mK6s4kuBoJp3E_88HrXU4zfcb5UzQ@mail.gmail.com>
Subject: Re: [PATCH] Introduce Tyr
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Alice Ryhl <alice.ryhl@google.com>, Beata Michalska <beata.michalska@arm.com>, 
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

On Mon, Jun 30, 2025 at 5:23=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> When I said "in development"I was referring to "dead_code" specifically, =
as we
> will invariably have some of that until the other parts of the driver lan=
d.
>
> Just as an example: IMHO it doesn't make much sense to only introduce the
> register definitions used for this patch if we know for sure that:
>
> a) the currently unused definitions will be used once the subsequent part=
s land,
>
> b) they will not change, as they're derived from the hardware itself
>
> It makes more sense to just sit down and transcribe this part of the spec=
 at
> once. It lowers the chance of copy and paste errors too.
>
> As I said, I was unfamiliar with "expect". Can it be made to work on a mo=
dule
> level? Anyway, I can try to make this work with "expect" instead of =E2=
=80=9Callow", no
> worries :)

Hmm... I am not sure what you are trying to say -- using `expect`
should just generally be as simple as changing the word from `allow`.
`expect` works like `allow`, except it will complain if the lint does
not trigger. It is essentially just that. And, yeah, it works on
modules.

In particular, it should not change how you decide anything else. In
other words, it is not about avoiding `dead_code`, but rather about
using a better `allow(dead_code)`.

Sometimes `allow` is simpler, e.g. when triggering a lint depends on
the kernel configuration or other reasons, in which case using `allow`
is just fine (please see the docs I linked). But I don't think you are
in those cases (e.g. I don't see conditional compilation, at least in
the patch above), so that is why I suggested it.

I hope that clarifies.

Cheers,
Miguel
