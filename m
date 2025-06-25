Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2E7AE831C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 14:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3213C10E706;
	Wed, 25 Jun 2025 12:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eLOpzzgz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8630210E706
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 12:47:49 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b2fcd6fe970so1166050a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750855669; x=1751460469; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xRdtBmMzlAb9QIbZaGxD9UlH4C68HhmhN0SNfJyz9VA=;
 b=eLOpzzgzvJZ0+J33kgd9/PFghNukA8c711vV+jT0NaH4WjJ8Vck+Pzfv6EcSbDPnz1
 EFx7DOU7b5CqgKGcU5+/vhc9jOnmez/WZ6X4pgESDwWwSvj5+NJ7gflOw6a5OjAvUhjq
 Bi2coYhqx71Awoox5VBWR757Mn4wEQ8c2YD5ZbriYVEgHcrSYMGvCtYgDGeaYUMvXpSw
 quMy7BDzgqAKiMM1MEG+Ez8LsXv+id5p8iALxwFkB3CD9d8UC0a6x+cnbo1RijUM7/eU
 cjM0eyYGeOSEV9cwiH87wR5NlMWHGoNyao9HuPcNfu/xo1v64m5ll6CkueMZXirnolop
 YAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750855669; x=1751460469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xRdtBmMzlAb9QIbZaGxD9UlH4C68HhmhN0SNfJyz9VA=;
 b=DJ/ENYu5jmTOcG524bIB45jMSg8tLL7hMCf/Zco8kYeWAr7DDL1JHxjMPJ/7buq1VB
 Fj4EXQaa/FOMmFNdLRZlYxxIm7Gy6TFG0OIQMJNFfRbZlvFE6TdeDzZBz7t2AzEkNwdy
 O5DhsqX1gIwiBqS4mR6xs1gYNKa3onsAYycgO8wAcjGggtdehSxcrKpfl2S7FtD2i78F
 eEwPplY9uJIfZbCm4oDYYA4TdLa4mIRJlXhV4R+bqtr3a4rkFSEpP6wxHcLbaE36dSIt
 VyRYCZp4CyCdW0Kup8JVGn7UyqedG1YP2DizoGbKDuIf8x0RrCumflYTHPigCCRlwh59
 aBpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe5RE+nDTVuMeTmkJsuKeZ2Wk4QwBSWK7A4KKk6a8n/fZPlwO0WhPtrsVgGbZrT8YjxC6prJpaiYQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn/multcNC4vgfpbgR3ZH9XG5kX084IwCBsMbfzNwXRa8hc+UW
 crQKFPDWOsmxQQxinj7IVccyB1oNVWvn3rptKs+tlko4IhjrqEuAyF4j7pu8Zxfy/q5CTUpfncl
 PXaktR+QbXxgVGMyTyTmwvYLUbuRJKpvQfX/4h+E=
X-Gm-Gg: ASbGncss6Z36B6fwlrBhZ2b2VFlZhrHj+oJRdLDhx3XJZIaI+J3FOyOXjJ04TTgAr3p
 t9s8bc38eqZnETKl+ys4LPkVzHAUMOGfhBQL6ntHaMt/SlElwvcTEwgYOHBEMNKkZOWnli0L8Lh
 v5YP+O/pLCMEfyrZ8LW/fCbZOQwisBA62VGuhwvzf5COo=
X-Google-Smtp-Source: AGHT+IHnvlarZCuv/RCxHiq29Qi7ylrCmEZXswOwHX+FJluU1B6A+ro+JsxQXvsVUnAYNWJueug97Vcpgz4xDNQHbpo=
X-Received: by 2002:a17:90b:51c6:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-315f25545b6mr1686463a91.0.1750855668951; Wed, 25 Jun 2025
 05:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250623-topics-tyr-drm_mm-v1-1-82fe8104a6f5@collabora.com>
In-Reply-To: <20250623-topics-tyr-drm_mm-v1-1-82fe8104a6f5@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Jun 2025 14:47:36 +0200
X-Gm-Features: Ac12FXyWwIT-f0p09GbrWuQHLM0OEITTFnrLijUbU8qrHeVE1B6UgsCWrUJVsP0
Message-ID: <CANiq72k07PuSodVgb+LDNw1jZVWhKt1BuYSULfBY8DBH1EJbBA@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: mm: Add DRM MM Range Allocator abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Asahi Lina <lina+kernel@asahilina.net>
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

On Tue, Jun 24, 2025 at 12:13=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Patches from others also need to be signed off by you as carrier.

> Changes from v0:

I assume you mean the RFC patch from more than 2 years ago, i.e.

    https://lore.kernel.org/rust-for-linux/20230307-rust-drm-v1-7-917ff5bc8=
0a8@asahilina.net/

Right?

(In general, it is very useful to have a link to the previous version
in the changelog, especially when it is a very long time ago, when
titles change, when it is non-obvious in general, etc.).

Thanks!

Cheers,
Miguel
