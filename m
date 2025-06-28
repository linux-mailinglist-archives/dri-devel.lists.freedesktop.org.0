Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F84AEC66C
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 11:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4020E10E181;
	Sat, 28 Jun 2025 09:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ctfvnjbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF49A10E185
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 09:44:30 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-313fab41fd5so602039a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 02:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751103870; x=1751708670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xcHXHz1B1vmqvkEsjx9+yGzCZswDC3Fos+ipXd+Hnrs=;
 b=Ctfvnjbz+Qbrm9BQD3nVBploezlOiI+NVbnX1vV1bDSMXHGmGb1i+HHMPJv2QnFQ9+
 E8WX3KVdiHlYe0APYfYV2UTRko1QknqCTrB2CE4wMVucaE4I0JDoqiUhupfpTGlKq2k0
 Or6/H9oPiUpfyiwOAW2Fl1RcuPFzg8XmP5r0wbHnI3KiYcV2huO6V6gZNqCAtgXFK+HP
 yhhaHX8vD3Yk6SOJjJwhrIy3hDFGdpFqY9a+yHLoyBwwcQrL38UB1oFCtu20IuuH8RU6
 ADpWxaX1XsMCwJd/Y2bofwv+VFGz5mcNft3+oW8+Cg/H6O4//AqqHIkGTluBLtAcmt5+
 SZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751103870; x=1751708670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xcHXHz1B1vmqvkEsjx9+yGzCZswDC3Fos+ipXd+Hnrs=;
 b=r1delaigpVGdrJmQ3vOTNN1kJN/NOS/iP8SfimrvvASRhMKfIftLZOcDz1nT3Mu8Ff
 bhIrdcwma0lNSdPNXGfwl6xQoFPR+PYeu/XgH3pj7KLqXQuNu4xGjoPAQvxnNh4vu2OL
 igpMFiOkFU7/C8pv9Pq7fxC12wGgT2cNyrqZ3SywShSuRdPu4uPWWSKT3qLPygDO3U9n
 B2iOR5/M5b5Dvlln1YlR2K0l5ux8BIgVLyGq1JxgHRsuLCDb1KhXvAcFGW8N/qRPG7gl
 qJPvgOQDAx98H4o41UyjT0+iYXFZ2mSfemeb9gXzqdqcWN3owING/rLcSuiupXRV7ehU
 pEoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYMAq2ARGoCricm9tysWVXpCoEi9F4puoSYDRC9dWo5BceJ2GudRTtzWhiKHqagmD29bjm/BErEBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe3a3uZnaJFUAlSRL7LKd6qJig5ZUa9Wn70vXVEdMLEiWvwlow
 1PMApiqy9b4rAimLbdKh55lyCLL2rY1C+cEaR7LjrpyyxK4NM0bp9FQu/TxPJFgmjdsF81+8Jpu
 S6P0ZwH3JSEPNdyvNwhefOvgpmfkrlDU=
X-Gm-Gg: ASbGncuk9JAsTdITW6WzeJDLGAdxKG1z9EC+9z7612Imo2woGdwTDtxT6L3UD+DyY3h
 AdIjzScZSDCugSTzL6oQrhSr4jJ3LoIdWeQm9eMlpufr9qePGsRPjYfbClYlfOqdduaoOYznkLa
 +d4v3CdM/yUhz6eDhoKxgXUkCW4B0AUwX1l1BbCZksKu8=
X-Google-Smtp-Source: AGHT+IFpR2NtTiSDwMI35AZFOItnq7Bu2P5qPUqQ/PtEJe5JryIFAhz1wxHrIbGMDKN7vAFrdD0eE+FrYWg2knHpE+8=
X-Received: by 2002:a17:90b:2e4d:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-318ec4117d4mr1354608a91.3.1751103870255; Sat, 28 Jun 2025
 02:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
In-Reply-To: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Jun 2025 11:44:16 +0200
X-Gm-Features: Ac12FXzxLzruq7u-2xy50vbt4xsqJsvBZY52gJWCC8AWCWuJvvAtFd8VhM8e2dE
Message-ID: <CANiq72nJcEM09HbQB3_NpKGxr9x8Ah0VE+=XS=xvA26P2qg=_g@mail.gmail.com>
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

Hi Daniel,

Some procedural notes and general comments, and please note that some
may apply several times.

On Sat, Jun 28, 2025 at 12:35=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Signed-off-by: Rob Herring <robh@kernel.org>
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

No newline.

> [2]: https://gitlab.freedesktop.org/panfrost/linux/-/tree/tyr?ref_type=3D=
heads

The base commit seems to be the one in this branch, but the branch is
a custom one that is not intended to land as-is, right?

If all the patches are in the list already (like the regulator ones),
then I would suggest putting the links to those instead. Otherwise, I
would mark the patch as RFC, since it is not meant to be applied
as-is.

Maybe I am just missing context, and this is all crystal clear for
everyone else, but normally patches are supposed to be candidates to
be applied, possibly with other dependencies, all coming from the
list.

> +use core::pin::Pin

This should already be able to come from the prelude.

> +/// Convienence type alias for the DRM device type for this driver

"Convenience"

Also, please end comments/docs with periods.

> +unsafe impl Send for TyrData {}
> +unsafe impl Sync for TyrData {}

Clippy should catch this (orthogonal to what Danilo mentioned).

> +use kernel::alloc::flags::*;

Prelude covers this.

> +// SAFETY:
> +//
> +// This type is the same type exposed by Panthor's uAPI. As it's declare=
d as
> +// #repr(C), we can be sure that the layout is the same. Therefore, it i=
s safe
> +// to expose this to userspace.

If they are not bullets, please don't add newlines, i.e. you can start
in the same line.

Also, `#[repr(C)]`.

Regarding the safety comment, it should explain how it covers the
requirements of `AsBytes`:

    Values of this type may not contain any uninitialized bytes. This
type must not have interior mutability.

> +#[allow(dead_code)]

Could it be `expect`?

> +/// Powers on the l2 block.
> +pub(crate) fn l2_power_on(iomem: &Devres<IoMem>) -> Result<()> {

-> Result

> +#![allow(dead_code)]

Could it be `expect`?

> +    author: "The Tyr driver authors",

Please use the `authors` key (this one is going away) -- with it now
you could mention each author.

> +#include<uapi/drm/panthor_drm.h>

Missing space.

Cheers,
Miguel
