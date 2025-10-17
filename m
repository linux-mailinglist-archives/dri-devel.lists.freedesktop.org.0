Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0662EBE8CF6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4231D10EBE9;
	Fri, 17 Oct 2025 13:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="aFXYlQFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A4010EBE9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:22:37 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-46fa88b5760so6551735e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760707356; x=1761312156;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=GnaDsn7nll18ow1kOpNbSLp5i6GMNaHfVFAbzbbvH9I=;
 b=aFXYlQFFGoHNkmDDhZsPurh0wsMP2YOLJGRix/z0c3qotqYDjWuoz5jhIn73oBrFA1
 HbVWubv/I/PNjKbBUyhTT/kJh8gDLmA8+Vn0YUTy8virn23kVTZkV7CWYOwzHbeX66ta
 zKgAVrdXNBTX7Xo2zRcQ+p+v+OcdaRjtj7KKknchVoB45TY51Ole4/wG+15SSGNGPN+/
 ymTT0buKeR4cALUBdwk9gKhizv9jaB8npHioe59dj1EAUbzcP5jPM13c62/ErHNZQDY6
 4LFbNDUJEorctfvyVDdYfwA9iMRjP1CxplECiFYWUNo44QgEZOVoWHZ4nKLhYZC/Ug79
 oMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760707356; x=1761312156;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GnaDsn7nll18ow1kOpNbSLp5i6GMNaHfVFAbzbbvH9I=;
 b=DXH2hfitu+Q1A9yR8VI8AD4sUjg50oWWWRcXTpz3tkHxcw+nQBlh8OmkmEym9rLL86
 ne970AqjGorpnXrCROcJ1APMz0V+9INPjh4rJQmx/IRFbJErP60NWtB/8c+uj0cIn/eN
 V2UsofaQq5uGOf6ZFOaedKw1RNUr38a5IM7bXTCiMAGYko4eTndxebRnzZKpqLRYA4AF
 WzexE40ON5B8TtV+Gt2rsWkQUoiKV8edcfz1UNB4gRa9Qo92Wq+68nvPv72YvOpwA+cd
 XXgYxEMOb0k0hajzGbyFwPKEMbu20JIG2jCj8QlTdYd4nAlGAiyIBEO74KiXnv0CZFbj
 L3Wg==
X-Gm-Message-State: AOJu0YzQEgbD212wPUjC7uO5ZsA8VWq9XPA9aHmbzlWF1wn4Z6p1Had5
 Uo8MVSOCZ3CbuID5Sh2djeNRGFWfY+blIEbbOZwOR6gcAcSxIbPW+uzSNagKdkZnpO5GrX/InaG
 RW6LUH9An0zkceuO0dQ==
X-Google-Smtp-Source: AGHT+IHm/rxQFjzIKD/ix4PvuHjEf9V7l7jdvLwUpstW+PdTOJzmLn/jF0s/g0PNGf6xGAdUynTKR0RdRZTpdF0=
X-Received: from wmna4.prod.google.com ([2002:a05:600c:684:b0:46e:45f4:a00b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e1f:b0:471:d2f:799a with SMTP id
 5b1f17b1804b1-47117877791mr24693975e9.16.1760707355934; 
 Fri, 17 Oct 2025 06:22:35 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:22:34 +0000
In-Reply-To: <20251016210955.2813186-3-lyude@redhat.com>
Mime-Version: 1.0
References: <20251016210955.2813186-1-lyude@redhat.com>
 <20251016210955.2813186-3-lyude@redhat.com>
Message-ID: <aPJDGqsRFzuARlgP@google.com>
Subject: Re: [PATCH v4 2/9] rust/drm: Add gem::impl_aref_for_gem_obj!
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Asahi Lina <lina+kernel@asahilina.net>,
 Shankari Anand <shankari.ak0208@gmail.com>, 
 open list <linux-kernel@vger.kernel.org>
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

On Thu, Oct 16, 2025 at 05:08:15PM -0400, Lyude Paul wrote:
> In the future we're going to be introducing more GEM object types in rust
> then just gem::Object<T>. Since all types of GEM objects have refcounting,
> let's introduce a macro that we can use in the gem crate in order to copy
> this boilerplate implementation for each type: impl_aref_for_gem_obj!().
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/gem/mod.rs | 53 +++++++++++++++++++++++++++-----------
>  1 file changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 20c2769a8c9d6..981fbb931e952 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -15,6 +15,43 @@
>  };
>  use core::{ops::Deref, ptr::NonNull};
>  
> +/// A macro for implementing [`AlwaysRefCounted`] for any GEM object type.
> +///
> +/// Since all GEM objects use the same refcounting scheme.
> +macro_rules! impl_aref_for_gem_obj {
> +    (
> +        impl $( <$( $tparam_id:ident ),+> )? for $type:ty
> +        $(
> +            where
> +                $( $bind_param:path : $bind_trait:path ),+
> +        )?
> +    ) => {
> +        // SAFETY: All gem objects are refcounted
> +        unsafe impl $( <$( $tparam_id ),+> )? crate::types::AlwaysRefCounted for $type
> +        $(
> +            where
> +                $( $bind_param : $bind_trait ),+
> +        )?
> +        {
> +            fn inc_ref(&self) {
> +                // SAFETY: The existence of a shared reference guarantees that the refcount is
> +                // non-zero.
> +                unsafe { bindings::drm_gem_object_get(self.as_raw()) };
> +            }
> +
> +            unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
> +                // SAFETY: `obj` is a valid pointer to an `Object<T>`.
> +                let obj = unsafe { obj.as_ref() };
> +
> +                // SAFETY: The safety requirements guarantee that the refcount is non-zero.
> +                unsafe { bindings::drm_gem_object_put(obj.as_raw()) };

I would prefer to move the call to `.as_raw()` to the `let obj` line so
that the reference more clearly expires before the call to
`drm_gem_object_put()`. The reference must not exist during the call to
`drm_gem_object_put()`.

> +            }
> +        }
> +    };
> +}
> +
> +pub(crate) use impl_aref_for_gem_obj;

The usual way to export macros outside the current file is:

1. Annotated with #[macro_export]
2. Export with `pub use impl_aref_for_gem_obj`

Alice
