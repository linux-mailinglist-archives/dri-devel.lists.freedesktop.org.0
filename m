Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34728ACACB7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 12:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE6210E160;
	Mon,  2 Jun 2025 10:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f+k/Qurj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A285210E160;
 Mon,  2 Jun 2025 10:49:54 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-32a658c4cc4so40283381fa.2; 
 Mon, 02 Jun 2025 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748861393; x=1749466193; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AsxbXe8qRFrC4RTDRdhQf2KM3tIF4wckI+MuVJmqklg=;
 b=f+k/QurjgTtacs7rRQ3rVr2ewSzZexg94gX1mVTBJ419SilSEyd+KOhL3K2OFWigPJ
 cCzRtbAAWG1Brw0b85fhSTfmzZQ+vl/qwJPF37EedwqTMFZebp/3JtQQ5uO+Y6q4HTxI
 vlRzLDBiw8PcubS0SDvLtFJ3sfnSe/k5sKdifSK6VsOVfXjpMm13Ocsqr7GAFM/BCiTo
 rUTGWCx3hpwKODq6hffCQBYHdD5el/jOwKTjHHV9Py0myL0L1k/KxmhIyM0fTr5b6Avj
 r84VzmZk8u5OMrGlYZQGrFc7jypPVOgPMuCgAKhRg1xnxdEcvNsI/nnUBQmEwJtNVppC
 MBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748861393; x=1749466193;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AsxbXe8qRFrC4RTDRdhQf2KM3tIF4wckI+MuVJmqklg=;
 b=vAxPp/bKhUgCt5d8WGp3Hmw0F61tOELVGljgl5Dr7pdTEe6xGbfRp+JWaQnfWD16PK
 kYTF8PirOwJgHmaczZMCUpPlPl4ZBGxITDgPmv8X2vwXNdv4ULXW1wX/X4Da3hpqmMpy
 Y1BecaQWZfLNz0cNbz4win3irYWafd3JCp6eMXhcoN0UwCTot53Q6mER9ka5ITtPPx+D
 ojjSKGcTHSUyhdETP12ch0L54A7IwFfP8jfvZTI/Ar7N0sLm+W/iFRdfL34NJEZG9JMo
 uR4HeUrMvr6MmtJ0CU+PbSHiM73CI0zfNYvGLUMzAOc4eH5xiY21puP2zCMH3Hj1QpPW
 sJow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX/DroIcU11mhX/xYH3gzZzBuy9bQg7DPfPOZ0AvrZTB32BMKbS26cWSdIAxaJBK3YlG9BAH2/9YM=@lists.freedesktop.org,
 AJvYcCV/FgqmR3OAuoxcoXjuv16B95EKXInLRtk9SkuS5ogWAECNmZttlG4ZMq1ITvKj6oLmTyDOJ4WVdA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywL239ymwDLXprZD6QLJ/gMG8I0VLbvOTs6o3CxjARtesyV6J6
 2xqybEaOEaOpNHtx90F5TAbw6150yoK5jPZBWfK+7ikzL0LoGCR8qEFHMSC2UY21EhUYRyFg70U
 NjLjLLzC01ChQCPDwA0yABP4BqZWG7s0=
X-Gm-Gg: ASbGncttrnrZTA42XByKb+JlsxhiXlWz2nQmzCQ0/+RDZtrjjfbXu98YhoRlPRWFUw5
 ltdQLh9O7sZeY0RILe29qLEIbTFPmQGi24eiRo2QRRfjRioHSOCDN4OUosIXsQ+hoV76JTEkOfb
 BQNY9akrXDXTTjvGx6yabxBmjSAkaxJfTZXyRzzrKBUHVpPPk/36HEca7Mk1vKshJyeyk=
X-Google-Smtp-Source: AGHT+IF5DWduxzl0/XGIjOoG2XZtzGtCfUO0aae++aWVjLV4gjiYEpeAaDYwqvBq64IuoR3CqF43l9YblyYjyY9SlHs=
X-Received: by 2002:a2e:9a0d:0:b0:32a:6a85:f294 with SMTP id
 38308e7fff4ca-32a9ea8fcabmr18219761fa.35.1748861392393; Mon, 02 Jun 2025
 03:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250530-cstr-core-v11-0-cd9c0cbcb902@gmail.com>
 <20250530-cstr-core-v11-3-cd9c0cbcb902@gmail.com>
 <aD1k4rRK8Pt5Tkva@google.com>
In-Reply-To: <aD1k4rRK8Pt5Tkva@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 2 Jun 2025 06:49:16 -0400
X-Gm-Features: AX0GCFuWGPYle2xpajsjX9J5Dr7DqqKyrlmViDc69KiPl9rdFF48mQDz9UTJ46o
Message-ID: <CAJ-ks9nx8fbm5J1yKfg4a1OOgBepu0LFFjdtomE=j4Gkszj=fA@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] rust: replace `CStr` with `core::ffi::CStr`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>,
 Benno Lossin <lossin@kernel.org>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
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

On Mon, Jun 2, 2025 at 4:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Fri, May 30, 2025 at 08:27:44AM -0400, Tamir Duberstein wrote:
> > `kernel::ffi::CStr` was introduced in commit d126d2380131 ("rust: str:
> > add `CStr` type") in November 2022 as an upstreaming of earlier work
> > that was done in May 2021[0]. That earlier work, having predated the
> > inclusion of `CStr` in `core`, largely duplicated the implementation of
> > `std::ffi::CStr`.
> >
> > `std::ffi::CStr` was moved to `core::ffi::CStr` in Rust 1.64 in
> > September 2022. Hence replace `kernel::str::CStr` with `core::ffi::CStr=
`
> > to reduce our custom code footprint, and retain needed custom
> > functionality through an extension trait.
> >
> > C-String literals were added in Rust 1.77, while our MSRV is 1.78. Thus
> > opportunistically replace instances of `kernel::c_str!` with C-String
> > literals where other code changes were already necessary or where
> > existing code triggered clippy lints; the rest will be done in a later
> > commit.
> >
> > Link: https://github.com/Rust-for-Linux/linux/commit/faa3cbcca03d0dec8f=
8e43f1d8d5c0860d98a23f [0]
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> > diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> > index 2494c96e105f..582ab648b14c 100644
> > --- a/rust/kernel/firmware.rs
> > +++ b/rust/kernel/firmware.rs
> > @@ -4,7 +4,14 @@
> >  //!
> >  //! C header: [`include/linux/firmware.h`](srctree/include/linux/firmw=
are.h)
> >
> > -use crate::{bindings, device::Device, error::Error, error::Result, ffi=
, str::CStr};
> > +use crate::{
> > +    bindings,
> > +    device::Device,
> > +    error::Error,
> > +    error::Result,
> > +    ffi,
> > +    str::{CStr, CStrExt as _},
> > +};
>
> Did you not add CStrExt to the prelude?

I did, but I didn't add the prelude to all files I had to update. This
one, like others, doesn't import the prelude.
