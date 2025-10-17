Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38259BE8C12
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C1C10EBE6;
	Fri, 17 Oct 2025 13:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UuhJbyzi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77F510EBE5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:10:19 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-47108163eeaso10017635e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760706618; x=1761311418;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=DoKMhSsyXfCYMAzn+A2bSpqJRrRoIP0G76cRQo/jaDg=;
 b=UuhJbyzidE0oJgFIUIXWzO3UlBCTmeH234RlXfS/PhJcLaSlTjFUSdNyPzbkDjiqW1
 2MsnjXZsfTJXc55U6j/2eVnjQybE+uIabZPlH7siAtWdW1+KFbSooLpwZGxDeCrbCmVT
 sgpQhJx1xySrZx12UY8mm5G8GZoXn34m5rIzXz8m3aLkL6WrvXFgzk3HroIWzowg3QT3
 TWxZbhi3YZUAcPJNhGJK3JRxQZzV5UGGRvdunsq0SQY7as3ec1pmQKGWfJPLCc035186
 9AN0HjS4en3XRv1hMx9qCogXqsaE5PHPh4ZZCf3r5Sbi2pESaovy9nCTVNESW0uucivu
 /EsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706618; x=1761311418;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DoKMhSsyXfCYMAzn+A2bSpqJRrRoIP0G76cRQo/jaDg=;
 b=cV8G7GsBqZwk8TeK1qwlfN70QtIwYtZWgIyY92hYxT23VBmYJSdAGHxvTwHoK+nC7o
 IU3ayPDdnRYcHYVnhdqu24wi2oCSgJNo9QHhl07LKP0wiOmNgUm0JZVICnag8pQsRhvE
 UXtCPma7kwx/CPPvzkVlSEwMULx7pH+VhS6gGynqfo5U1T9LOTATgxoQvTNY3OxBQKkP
 NSsVsTcUXjlOVNnKs59qI2BOuMIQfSuwi7XcTrhy28YqveySCpsK3TIW9xZEibABhCqY
 M04EJEq6RAlfntW/xvd0j3VNP6TkubtcLpurqn6uAeT1HtYMHWKTFGUjEuZIzRu9Mvrw
 OzCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnRsUsBvF/EAYqzPlJNUbD32ufsTndAY361arhhwy6r14Q7L3k6T7PUY64Sx9qctzQDLSFr08mpso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT3guCbLW7hkrASc8t24MPaKIxxkuUHWINOjUVOJPPVUCrKioA
 FVkMvQEBqhAnc+IkHtDXw+JyC98zAQjQFpkIrfLh4otuKy71WKHr8gba0Mt/YubGTDC8rLlMluc
 T3f4izxGDV25XvzYTww==
X-Google-Smtp-Source: AGHT+IFiCznOq3jJbbGi+1Po7x6b9rs4AbbiNhIwAWz98uYVYGfItGbGzMFvBzl0siZ+LujshcHcrsGvZWg5Wc0=
X-Received: from wmgg24.prod.google.com ([2002:a05:600d:18:b0:46f:aa50:d706])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b8c:b0:46e:4287:a85e with SMTP id
 5b1f17b1804b1-471178a4af1mr25882615e9.13.1760706618472; 
 Fri, 17 Oct 2025 06:10:18 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:10:17 +0000
In-Reply-To: <20251016202044.2748678-1-lyude@redhat.com>
Mime-Version: 1.0
References: <20251016202044.2748678-1-lyude@redhat.com>
Message-ID: <aPJAOXtv2knFkyDP@google.com>
Subject: Re: [PATCH] rust: drm/gem: Remove Object.dev
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina+kernel@asahilina.net>, 
 Shankari Anand <shankari.ak0208@gmail.com>
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

On Thu, Oct 16, 2025 at 04:18:58PM -0400, Lyude Paul wrote:
> I noticed by chance that there's actually already a pointer to this in
> struct drm_gem_object. So, no use in carrying this around!
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/gem/mod.rs | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 30c853988b942..28d929edae267 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -187,12 +187,10 @@ impl<T: IntoGEMObject> BaseObject for T {}
>  /// Invariants
>  ///
>  /// - `self.obj` is a valid instance of a `struct drm_gem_object`.
> -/// - `self.dev` is always a valid pointer to a `struct drm_device`.
>  #[repr(C)]
>  #[pin_data]
>  pub struct Object<T: DriverObject + Send + Sync> {
>      obj: Opaque<bindings::drm_gem_object>,
> -    dev: NonNull<drm::Device<T::Driver>>,
>      #[pin]
>      data: T,
>  }
> @@ -222,9 +220,6 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
>              try_pin_init!(Self {
>                  obj: Opaque::new(bindings::drm_gem_object::default()),
>                  data <- T::new(dev, size),
> -                // INVARIANT: The drm subsystem guarantees that the `struct drm_device` will live
> -                // as long as the GEM object lives.
> -                dev: dev.into(),
>              }),
>              GFP_KERNEL,
>          )?;
> @@ -247,9 +242,9 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
>  
>      /// Returns the `Device` that owns this GEM object.
>      pub fn dev(&self) -> &drm::Device<T::Driver> {
> -        // SAFETY: The DRM subsystem guarantees that the `struct drm_device` will live as long as
> -        // the GEM object lives, hence the pointer must be valid.
> -        unsafe { self.dev.as_ref() }
> +        // SAFETY: `struct drm_gem_object.dev` is initialized and valid for as long as the GEM
> +        // object lives.
> +        unsafe { drm::Device::from_raw((*self.as_raw()).dev) }

The wording here and in the invariants could be improved to say that
T::Driver is the right choice for the generic parameter.

Alice
