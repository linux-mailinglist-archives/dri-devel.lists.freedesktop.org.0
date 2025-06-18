Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB89DADE50E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 09:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775C410E1D1;
	Wed, 18 Jun 2025 07:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NAtKKCnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C033B10E1D1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 07:59:24 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-43eea5a5d80so39342605e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 00:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750233562; x=1750838362;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=gE3cyMbdsQnJ5cCYU/k10Qcrh2iDe81VxgYFWcT5W9c=;
 b=NAtKKCnPMeZONMEbWcMIAMlh7r3kIuY32pT+erdJ/e488LhhG98e7B0jvG4izn/VX4
 kB8VG/RpeLuFzaCVQZizubhLroWgeQy0OWW78l6ljtHI5RXDj6Dth4hRHWYkr59+sP5E
 MqHeHuVpuCAtXFCV4uEbmGoxPVLhoQSdFjvitYwx6Kl/WaVNKWsXTRPXWR3rbtPh4SnH
 wdK4qrAj8TNw8m+fEabQ6cVxIni6e6w3OV8Dvvb4/3wpq5w53IZZ8a3npK5tI01k+g65
 oiVSOkeqvpDGqurQEUlGqvsk+21oOnStQ5Ei91a+MSR3ltsQi1rDlwnKRc4gh+WSbzzU
 Q3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750233562; x=1750838362;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gE3cyMbdsQnJ5cCYU/k10Qcrh2iDe81VxgYFWcT5W9c=;
 b=awJmVYgkjHLhiRoSniRVr7pe7tzTcKVSR49D+ZXBJDDtXSjlhzlCt3C+j2UWDLfEPk
 en+bUWPtb0oauwZKLVXT9ug2YYq2/Je6/xDAwQrD0UMU7xDfKIDLxCVz0/pJPgCM31cx
 Cls6lGVI/iMrTsJVeEIVQ7jxQZctPdmAwSrKjaUYqAmRN52HEVOLvKA+30dRj67AfeAA
 mIE2mpvRD+IQ4HyzrE9YMV7wUlDiOst7iz+FU7agDLFwNlqsBFjexa+f0X8H4PB867ec
 p2O2aA6OLQefEK82RsvJW8CBS4yYyTA/7MsqU3TAgMysBpoun/ef5SfDmhLKtfLB7uUw
 Goqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcPCUppfT3jJQly8hsjYKKu1zeXqiKuzIyvnu/mgFVp0X7Hk2fRW/sxLvxvwAXSeXlVwoC1TtcOcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydbvedYJ0jdwKVyQeYh77C29fcPpI8VTMQduA3wH9zWOS5dqFM
 wz5HUnIfFtN2MANpCuKaOtDt2S0KZN1hkLTh1GtmOhl0633toHiV0ju5w9EFyFQYcR+noEEESms
 QtDcTD95hcdGyD2dowg==
X-Google-Smtp-Source: AGHT+IHz0C1fYGWY5kiY7lnbdlwuTwLWyWDvSnxCqZ65/YnQjSJhZWyEL1X3Pk79eSjdSXC1t1NrM3Lzh/LlLWQ=
X-Received: from wmbep20.prod.google.com
 ([2002:a05:600c:8414:b0:450:df6d:a450])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348c:b0:450:cfcb:5c9b with SMTP id
 5b1f17b1804b1-4533ca7a16bmr135014865e9.1.1750233562598; 
 Wed, 18 Jun 2025 00:59:22 -0700 (PDT)
Date: Wed, 18 Jun 2025 07:59:20 +0000
In-Reply-To: <aFFzi88miMbCZ0yQ@pollux>
Mime-Version: 1.0
References: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>
 <aFFzi88miMbCZ0yQ@pollux>
Message-ID: <aFJx2IqLfCjWsbVv@google.com>
Subject: Re: [PATCH] rust: types: add Opaque::from_raw
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Tue, Jun 17, 2025 at 03:54:19PM +0200, Danilo Krummrich wrote:
> On Tue, Jun 17, 2025 at 01:36:47PM +0000, Alice Ryhl wrote:
> > Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> > `container_of!`") we have enforced that the field pointer passed to
> > container_of! must match the declared field. This caused mismatches when
> > using a pointer to bindings::x for fields of type Opaque<bindings::x>.
> > 
> > This situation encourages the user to simply pass field.cast() to the
> > container_of! macro, but this is not great because you might
> > accidentally pass a *mut bindings::y when the field type is
> > Opaque<bindings::x>, which would be wrong.
> > 
> > To help catch this kind of mistake, add a new Opaque::from_raw that
> > wraps a raw pointer in Opaque without changing the inner type.
> 
> The patch does more than that, it also adds a hint to container_of!() and fixes
> up two occurences. I feel like we should split it up.

I think they go together pretty naturally, but I can split it if you
insist.

> > +    /// The opposite operation of [`Opaque::raw_get`].
> > +    pub const fn from_raw(this: *const T) -> *const Self {
> 
> Do we want to name this from_raw()? Usually from_raw() methods return either
> Self or &'a Self.
> 
> Maybe something like cast_from() and rename raw_get() to cast_into()? I think
> the latter may be confusing anyways, since it sounds like it would do somthing
> with reference counting.

The name raw_get() mirrors the stdlib function UnsafeCell::raw_get().
The stdlib uses this naming because in Rust the word "get" normally has
nothing to do with reference counting - outside of the kernel, we use
"clone" for incrementing refcounts and nobody would ever call it "get".
That said, it may still be worth to rename the method. Thoughts?

Alice
