Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AECB8BE8D85
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB99A10EBF5;
	Fri, 17 Oct 2025 13:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="V2YseOya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEB010EBF3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:30:28 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-426c4d733c4so916653f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760707826; x=1761312626;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=1ss1QlA7acXACZyHR7wiT2Nqcn1nIjx/VSZWA+hhjA4=;
 b=V2YseOyaahnLT4jL8dXJyLgLWjREvbnzZd/i0i1kXdk+geH5u7EaCRk7fqHpgtGdSi
 9SEhC5fZOOTCgUO5Oy7Cjv/Ds2CWDRuR+qRq0+4Hq5LnG5cPjs3qH1Mzcl2VIzBXc8mg
 h/gYPqtYAkmlvFX/zJFLMuqfSFaNuyv6SpQsWQAoHYCVX5hvXjgAeuRsBZ8cQFFRjvlR
 RqMfNP677PzeMB2+7mxp3a7wSO+sQYC2kBp5yVxNO0t7MnWgTcZ8N0UbFlClStmJDVXX
 ygFkoEfp+VTEAfl2qdG69Ylwj+tNmb1GR2RExyI8KqYOI78+I4GRCKLDKeH/wwfAi2eB
 ze8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760707826; x=1761312626;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ss1QlA7acXACZyHR7wiT2Nqcn1nIjx/VSZWA+hhjA4=;
 b=pnRSzZhLbnzTF6NZknnsJgdJ45QjhdPaThPTDGo93pTdmb4jhF0NDx+l9rd2rB/5DZ
 p0BJU5aOgxUjJw+imiCOBRRXlwQ9Uprk8q3LhFCwT6qoZMZd1Ty/Cusztarx2PYDh6Fr
 EAOkK66tAD602MWyp1ivmaP4epsnVB8aZbMjNAY7UZmsfxeV5zHGG8NrpsQA4TtpVLST
 eAEl7HAOXNnQ66dELCOeiUbfZmLYZjjetCkMByyJvP/NlhZOVtRh1eujOsJbC8jDRJ2y
 16qnh5N1M7x+DHqQhEL53R7f20knsgOcGjkpBOCPkhglOz7n5rD9iCYNf+gmta46rddE
 +A9w==
X-Gm-Message-State: AOJu0Yw+3oMLQ31QjU6ZymgHvBKG5948FgntZhLrIbfL6coEwN/PyuK5
 g5joEz25EiyKf53Oy2uXaEde/ZPpSkk39gc+ZmM4rZgtbrcU48vhLqhsEa2bpGg7BDBAbbqBCIg
 XvCYp81sfWjCzda2ZiQ==
X-Google-Smtp-Source: AGHT+IElTbDFCunvl+Q6VKcSJIGvmBa3dVuDKgt0GL3PK5Tj4PCBAZb9dyem+MFrgb18Jr5MVI9nNpg0yqNiOdc=
X-Received: from wmcn16.prod.google.com ([2002:a05:600c:c0d0:b0:46f:aa50:d700])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:400d:b0:3ee:1461:1659 with SMTP id
 ffacd0b85a97d-42704d98980mr2657038f8f.31.1760707825710; 
 Fri, 17 Oct 2025 06:30:25 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:30:24 +0000
In-Reply-To: <20251016210955.2813186-7-lyude@redhat.com>
Mime-Version: 1.0
References: <20251016210955.2813186-1-lyude@redhat.com>
 <20251016210955.2813186-7-lyude@redhat.com>
Message-ID: <aPJE8EC5OmlmSrYt@google.com>
Subject: Re: [PATCH v4 6/9] rust: drm: gem: shmem: Add DRM shmem helper
 abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>, Asahi Lina <lina@asahilina.net>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Asahi Lina <lina+kernel@asahilina.net>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
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

On Thu, Oct 16, 2025 at 05:08:19PM -0400, Lyude Paul wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> The DRM shmem helper includes common code useful for drivers which
> allocate GEM objects as anonymous shmem. Add a Rust abstraction for
> this. Drivers can choose the raw GEM implementation or the shmem layer,
> depending on their needs.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> +impl<T: DriverObject> gem::IntoGEMObject for Object<T> {
> +    fn as_raw(&self) -> *mut bindings::drm_gem_object {
> +        // SAFETY: Our immutable reference is proof that this is are to dereference
> +        unsafe { &raw mut (*self.obj.get()).base }

Typo.

Also, in principle, this should refer to a type invariant saying that
`obj` is a valid shmem object.

> +    }
> +
> +    unsafe fn from_raw<'a>(obj: *mut bindings::drm_gem_object) -> &'a Object<T> {
> +        // SAFETY: The safety contract of from_gem_obj() guarantees that `obj` is contained within
> +        // `Self`
> +        unsafe {
> +            let obj: *mut Opaque<_> =
> +                container_of!(obj, bindings::drm_gem_shmem_object, base).cast();

Please use Opaque::cast_from() instead of the unrestricted cast()
operation.

There are several instances of this throughout the file.

Alice
