Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B967A90A85
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 19:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6002D10E108;
	Wed, 16 Apr 2025 17:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PP7xHz4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199F710E108
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 17:54:13 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30bfc79ad97so11470251fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744826051; x=1745430851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hlh2fjr1p5zOr1jLNmoVy5ueVHw8TQ5D92sVTob9JxA=;
 b=PP7xHz4V5L+CzLcTnRqe4hAFx9rnPVTdW1aGQM/+3yCE/2xyW/5ZehXtl7HTeOz4Bt
 ejirNFpch0Z60SoyAwA5ukj8BwFdbvzdzLsdAI3IlXlVb15E+NmkPm5noqnAA/C7ninj
 +/LaAlP+L5tHX/sLJCnndKQIZ1BHnIsTeIoRdhGDJ+pApLX09zKOrDF7SmYNYlzwACSX
 5M5u0OPA5P2AOLdAiNKIdF+l24ukWhi6ZoE2fzkNW+5PWEISWl/9lT2hbJuL9Jta370Q
 vR3y3rEPWLZDfipyMjKc2JHPpDUhtoXzF+eUrLCY4cOnAD8qd9+bdLvw+whfssF1XZ7A
 l9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744826051; x=1745430851;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hlh2fjr1p5zOr1jLNmoVy5ueVHw8TQ5D92sVTob9JxA=;
 b=GedYFz/Z+IA1XljHuzBteo/jL0Mt4voxMtCJBHwSpXotKRcJ4OuWOxznOmhhAuo+4Q
 SBXWWwDdabp6ZzNawbzXen4WG/1oeF5Imxbdl8QuSpvAhXu2fpL7k29YGYysfug6fzWR
 7m4b8XyGouos0EuDihODzHW+CXtSnqIBc/jWS/ft9CQQUQa9s7teUzNfIICg637pgYTW
 cC6xxty64PBuRlQrKDLWyC79vdKAZbKVE6ZVs+nj6v8EJR7wk7KlNeKkLodFMfhjQ01v
 LZ0JnyDK2IU9XDVkwzMtSnsOPbR1Ck4VUywiv+TY2K1A6njXrYJge+rYuaUcgN0dxkt+
 iCPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW70uEpeZq41Iz3QxoJfJOF6jNiCqu6y9Dy/YMFtJyJre4LwVmry04QDKiQI7JefShGRhy8//hotQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/XN5tql0qnxOcJ3UXnWLwcpXhfbzbIJyUmJkz5PweW0dTBlPq
 B22NyLkiodzEmworwpDXtGkylmVB7RStEZ75V0RHZ38BU331Q8sQ2VEVHlGO5DC1ZvzRtLH9I3Z
 s3UOaAKkfrcP+cN0cxQHMHuHF5dw=
X-Gm-Gg: ASbGnctHZp8gR7FW8AIT1g/Ioca1mr5iQ7Qi31sUUlIrGzd0eElioyod8hX3cULD52N
 f3pujOYACP5PVuAx5xkppo7eHgRU7efRrXYyyS96/5PkIkhCrP6PSorn5sgbLIMif1Ikqa+2J1L
 hxkBigQosa5YOy3xCr3bj6vo1Ix8G1shMAF5dtig==
X-Google-Smtp-Source: AGHT+IHdVZCfT1hHQSRWgqhTI/bFks+re46BrEdji8oUTIIg3UUsqBCnhQautOPIEbcY+jJYHZHUq4U0ygS+69zWTu0=
X-Received: by 2002:a2e:9247:0:b0:30b:eb0a:ed63 with SMTP id
 38308e7fff4ca-3108574e780mr829931fa.18.1744826050903; Wed, 16 Apr 2025
 10:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-6-18ec29b1b1f3@gmail.com>
 <67ffee16.c80a0220.1dbd15.c3ad@mx.google.com>
In-Reply-To: <67ffee16.c80a0220.1dbd15.c3ad@mx.google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 16 Apr 2025 13:53:34 -0400
X-Gm-Features: ATxdqUHSRnIpPPQBV0jkAOVSIHT_IhSMCpuq3at5fw7oWfF51dZkACZO8GK6lVs
Message-ID: <CAJ-ks9n-5Gkp61ODfBbf3==fYp1AbexANLZaQpsGj_mj1WRfkA@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] rust: enable `clippy::ref_as_ptr` lint
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
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

On Wed, Apr 16, 2025 at 1:51=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Wed, Apr 16, 2025 at 01:36:10PM -0400, Tamir Duberstein wrote:
> > In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:
> >
> > > Using `as` casts may result in silently changing mutability or type.
> >
> > While this doesn't eliminate unchecked `as` conversions, it makes such
> > conversions easier to scrutinize.  It also has the slight benefit of
> > removing a degree of freedom on which to bikeshed. Thus apply the
> > changes and enable the lint -- no functional change intended.
> >
> > Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_=
ptr [1]
> > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > Link: https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton.me/
> > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
>
> Thanks!

Thank you! I updated the earlier patches as well.
