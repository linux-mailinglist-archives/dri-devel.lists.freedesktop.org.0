Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87989A9234E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 19:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6227810E2CB;
	Thu, 17 Apr 2025 17:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k7RE0OWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B6F10E2CB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 17:01:16 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30ddad694c1so10680301fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744909274; x=1745514074; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WCm+5cTD1ipGuSKYz4yFrUfBStPZICztG7ial36N10I=;
 b=k7RE0OWDVkTmhRLg45vEBD3+QFAZB9c7cL4Dyo3XbYsbLwYDMTjKr552jmvqY687Ig
 NKBEohVdpJCv4wd3rN0OXiYTfcFEArFBQFmTleDk//MemWTMYsewnaY4wTdv8RSQXpbO
 1m3HMBdlz1Fe9whBg0NcjDSNZ4EVAVY9bJ7CO8oT2NPE+LlwIBfeqnUIuXjuyJZ4HjOW
 SdQj6rxCR6GLYxNv7Cu7GkMdylKGU31ob1+niEVCLod9NkCekBVwM7fcFTach00wdkci
 0dQSvf3MOMrRHyiKlHLRL+pBSIY43XD5YEjiuAlMNuLEdgrfJ5ByMXZSI39XHQjdpr62
 sW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744909274; x=1745514074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WCm+5cTD1ipGuSKYz4yFrUfBStPZICztG7ial36N10I=;
 b=OsUCfja8sSgzz+xuDCKV7/OWktPH219uJqxeYw06JJ2QvCsKkr28yeco0t9xwdhGay
 L65FCBOzQ4kuR12umqaPNXL43w8l8yHlMCEHv4j+xkArWlSS4x37c5Zm4iXlkX4e2+Od
 n8spSgyhA5xqZQsREQjo9JBaSvfSuvoCyR0g3lryLksM7CTLcwHXB/gXRZywwlrzHxOp
 OfJ4PmONuWJz3OKx1CA8dwPWfyu5hGZQOhZXIC8Od4NrqXQAe/TlhOOtkwCJNLxaAs9A
 v6TBU0r1a2wLhX0+6SLMPkdId0eOGAkeRr9jRzl/yaXr3DpeEy+9A1mYIP9YPUB7CclJ
 W3JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdhXNj1LUpl3grF3I49BpzkoTQ8GaHZXEHtJWHMoumLs1LpyQX+SqqmE/aNchKkbwf7Zyc6EptLSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfCVwSQkE8tr6YKS1BijfN2qggfj5XyjHl06forNsI4URHYru6
 AqkAyn/N8U53EKMYQWSIZrl2bAp3vF64Ykt+K8T6JKKTMro8l56SbHn61cpMtUEJSC3XuAjk6IB
 le1NlQs5zBJ4fzhVtnrKR8ujgXt0=
X-Gm-Gg: ASbGncucysWPW+iGomkG2MyCn5g7IYhkCuZVCbabKMJbvD6a7BxDNJbFX8q1qOXz6KA
 BJhGPTfgv7kaw21mR+4wLVRmaM/xrNi4TenBkCkw2CdSUVnKYQQqmHJS+6rlyZBKRu3mBmv7fNy
 iAO+W2IARwADUr1j8j4XZgVPr0oMM24eTHbFZjDu9Dg4YZc0ts7XVskso=
X-Google-Smtp-Source: AGHT+IHZAKP3/qvwJmsc5m8mvIzKS19yV7vWRxGgOitXjzOxUUQqlMCy6l+9mVxAv+hzn3jvGdnz5kayZsyPq+aJCYg=
X-Received: by 2002:a05:651c:1027:b0:310:85ba:113a with SMTP id
 38308e7fff4ca-31085ba14b3mr23077911fa.34.1744909272419; Thu, 17 Apr 2025
 10:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-1-18ec29b1b1f3@gmail.com>
 <680130ee.050a0220.393a1.0995@mx.google.com>
In-Reply-To: <680130ee.050a0220.393a1.0995@mx.google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 17 Apr 2025 13:00:36 -0400
X-Gm-Features: ATxdqUFUCc7UwWya32vBGQOBhztbpYLccod5SsXvC27P86OwyeljmPoIQlWpelQ
Message-ID: <CAJ-ks9kr4vRKKFA15D6rZ3PPAvteRmWNyHLpDAvWBzTN5iBP-g@mail.gmail.com>
Subject: Re: [PATCH v9 1/6] rust: enable `clippy::ptr_as_ptr` lint
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

On Thu, Apr 17, 2025 at 12:48=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Wed, Apr 16, 2025 at 01:36:05PM -0400, Tamir Duberstein wrote:
> > In Rust 1.51.0, Clippy introduced the `ptr_as_ptr` lint [1]:
> >
> > > Though `as` casts between raw pointers are not terrible,
> > > `pointer::cast` is safer because it cannot accidentally change the
> > > pointer's mutability, nor cast the pointer to other types like `usize=
`.
> >
> > There are a few classes of changes required:
> > - Modules generated by bindgen are marked
> >   `#[allow(clippy::ptr_as_ptr)]`.
> > - Inferred casts (` as _`) are replaced with `.cast()`.
> > - Ascribed casts (` as *... T`) are replaced with `.cast::<T>()`.
> > - Multistep casts from references (` as *const _ as *const T`) are
> >   replaced with `core::ptr::from_ref(&x).cast()` with or without `::<T>=
`
> >   according to the previous rules. The `core::ptr::from_ref` call is
> >   required because `(x as *const _).cast::<T>()` results in inference
> >   failure.
> > - Native literal C strings are replaced with `c_str!().as_char_ptr()`.
> > - `*mut *mut T as _` is replaced with `let *mut *const T =3D (*mut *mut
> >   T)`.cast();` since pointer to pointer can be confusing.
> >
> > Apply these changes and enable the lint -- no functional change
> > intended.
> >
> > Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_=
ptr [1]
> > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Thanks!

> A few nits below though...
>
> > ---
> >  Makefile                               |  1 +
> >  rust/bindings/lib.rs                   |  1 +
> >  rust/kernel/alloc/allocator_test.rs    |  2 +-
> >  rust/kernel/alloc/kvec.rs              |  4 ++--
> >  rust/kernel/device.rs                  |  4 ++--
> >  rust/kernel/devres.rs                  |  2 +-
> >  rust/kernel/dma.rs                     |  4 ++--
> >  rust/kernel/error.rs                   |  2 +-
> >  rust/kernel/firmware.rs                |  3 ++-
> >  rust/kernel/fs/file.rs                 |  2 +-
> >  rust/kernel/kunit.rs                   | 11 +++++++----
> >  rust/kernel/list/impl_list_item_mod.rs |  2 +-
> >  rust/kernel/pci.rs                     |  2 +-
> >  rust/kernel/platform.rs                |  4 +++-
> >  rust/kernel/print.rs                   |  6 +++---
> >  rust/kernel/seq_file.rs                |  2 +-
> >  rust/kernel/str.rs                     |  2 +-
> >  rust/kernel/sync/poll.rs               |  2 +-
> >  rust/kernel/time/hrtimer/pin.rs        |  2 +-
> >  rust/kernel/time/hrtimer/pin_mut.rs    |  2 +-
> >  rust/kernel/workqueue.rs               | 10 +++++-----
> >  rust/uapi/lib.rs                       |  1 +
> >  22 files changed, 40 insertions(+), 31 deletions(-)
> >
> [...]
> > diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/=
impl_list_item_mod.rs
> > index a0438537cee1..1f9498c1458f 100644
> > --- a/rust/kernel/list/impl_list_item_mod.rs
> > +++ b/rust/kernel/list/impl_list_item_mod.rs
> > @@ -34,7 +34,7 @@ pub unsafe trait HasListLinks<const ID: u64 =3D 0> {
> >      unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut ListLinks<ID>=
 {
> >          // SAFETY: The caller promises that the pointer is valid. The =
implementer promises that the
> >          // `OFFSET` constant is correct.
> > -        unsafe { (ptr as *mut u8).add(Self::OFFSET) as *mut ListLinks<=
ID> }
> > +        unsafe { ptr.cast::<u8>().add(Self::OFFSET).cast() }
>
> I think we better do:
>
>         unsafe { ptr.byte_add(Self::OFFSET).cast() }
>
> here, similar for a few instances below. Maybe in a follow-up patch?
> byte_add() is way more clear about what is done here.

This code is deleted in
https://lore.kernel.org/all/20250409-list-no-offset-v2-4-0bab7e3c9fd8@gmail=
.com/,
which could also use a review!

Cheers.
Tamir
