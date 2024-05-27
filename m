Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7E28D0D29
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 21:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E01910E516;
	Mon, 27 May 2024 19:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZuYOtORv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D2110E5E3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 19:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716838013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=04BP6JgJRJaoyE7XZo+qyeTn0Ydmjf+GQEv5dhrT/JU=;
 b=ZuYOtORvg2mpZP9geldKLomThbu+qZhF+Igmd2gMBZjwaB/qvEkjX3h/dPQV7kIfFKl/R4
 Z5uH26bWwlEwp7RbZwPLMjq/XylR0+MKYU0CZLbR/oM3jLPqgxcFPgSmPQIaUkkab+xfhC
 UkTI0AJdN8rwRFu6Oxqhr2i0Fr9bBm0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-2TVFcC56PtKvNXPdvA-3Dg-1; Mon, 27 May 2024 15:26:52 -0400
X-MC-Unique: 2TVFcC56PtKvNXPdvA-3Dg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-354fc1122baso54775f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 12:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716838011; x=1717442811;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=04BP6JgJRJaoyE7XZo+qyeTn0Ydmjf+GQEv5dhrT/JU=;
 b=dazxoS4zdC8Mhq+kLyhTy4UYfFaLfjLQuTSIKOqvycQmcFqrEGLDllDOojSR4nhntR
 PkX7ANZ1KcaucPFT2D7vyMxAeffZAE8E7mQeDWfC9JL7uly+umKmCDNgFbenYtTvvHFB
 l3esL4Z4Fs5ZTqD7w7sUETR7ungUZ27fXHFVg6ifFTf4HruzbC3matwTLw4BH972GnAm
 LYmnn3bNlkgBw7cjSZ0MH4DYgBY8ZjYn4anrQjnSTFRf311shYrettY+ZVM8i8D1E/qp
 XrYHDDTPtgF7jYRGh2A5e9uFUmbfJ7S/n2dAsajmg7iswS5rxnAKIIr99bnFdOjCxr8N
 YVaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWbIw+FsM3JJ5m28utB9WlvauZDodK9zuFz0hToJ+pPG+zLs2QdfJTNfJAfqCJ6gcD7zwscevw8YZ+mqQLY937pdxS30bWoi1DoP5G9OEZ
X-Gm-Message-State: AOJu0YxQx1So7DnPPkdUEyw1erxLK+7fYbRrA0bsimGXiQdenlBEv0yn
 B8J/CquAvHdLcjk2EkkgEh0d+rXjnoEY4aHDgIHszctNRmwLlvcCpr+Ug5tbyapwrN9kdJsx4Bs
 tPz5q2rbMGTMsaJGbl7KgpzbJS3M0768iKEp1zIJ7nenQDylbWDWzA6mDgH5iASywoA==
X-Received: by 2002:a05:6000:1001:b0:354:db70:3815 with SMTP id
 ffacd0b85a97d-355270567abmr9871318f8f.7.1716838010930; 
 Mon, 27 May 2024 12:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpX5a3JazHsekJBC6hkppw/PzK2VdF3Dw2Az33nM3NarNt2rZRaGhpKwlikcM94rwQ/PNJkA==
X-Received: by 2002:a05:6000:1001:b0:354:db70:3815 with SMTP id
 ffacd0b85a97d-355270567abmr9871283f8f.7.1716838010499; 
 Mon, 27 May 2024 12:26:50 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:748f:dc54:236c:b760])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35aa40ee42bsm846020f8f.47.2024.05.27.12.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 12:26:50 -0700 (PDT)
Date: Mon, 27 May 2024 21:26:47 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Herring <robh@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, fujita.tomonori@gmail.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 3/8] rust: drm: Add Device and Driver abstractions
Message-ID: <ZlTed15hXf7UROP9@pollux.localdomain>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172059.181256-4-dakr@redhat.com>
 <20240521212333.GA731457-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240521212333.GA731457-robh@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Tue, May 21, 2024 at 04:23:33PM -0500, Rob Herring wrote:
> On Mon, May 20, 2024 at 07:20:50PM +0200, Danilo Krummrich wrote:
> > From: Asahi Lina <lina@asahilina.net>
> > 
> > Add abstractions for DRM drivers and devices. These go together in one
> > commit since both are fairly tightly coupled types.
> > 
> > A few things have been stubbed out, to be implemented as further bits of
> > the DRM subsystem are introduced.
> > 
> > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > Co-developed-by: Danilo Krummrich <dakr@redhat.com>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/bindings/bindings_helper.h |   2 +
> >  rust/kernel/drm/device.rs       |  87 +++++++++
> >  rust/kernel/drm/drv.rs          | 318 ++++++++++++++++++++++++++++++++
> >  rust/kernel/drm/mod.rs          |   2 +
> >  4 files changed, 409 insertions(+)
> >  create mode 100644 rust/kernel/drm/device.rs
> >  create mode 100644 rust/kernel/drm/drv.rs
> 
> [...]
> 
> > diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> > new file mode 100644
> > index 000000000000..5dd8f3f8df7c
> > --- /dev/null
> > +++ b/rust/kernel/drm/drv.rs
> > @@ -0,0 +1,318 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +
> > +//! DRM driver core.
> > +//!
> > +//! C header: [`include/linux/drm/drm_drv.h`](../../../../include/linux/drm/drm_drv.h)
> > +
> > +use crate::{
> > +    alloc::flags::*,
> > +    bindings, device, drm,
> > +    error::code::*,
> > +    error::{Error, Result},
> > +    prelude::*,
> > +    private::Sealed,
> > +    str::CStr,
> > +    types::{ARef, ForeignOwnable},
> > +    ThisModule,
> > +};
> > +use core::{
> > +    marker::{PhantomData, PhantomPinned},
> > +    pin::Pin,
> > +};
> > +use macros::vtable;
> > +
> > +/// Driver use the GEM memory manager. This should be set for all modern drivers.
> > +pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
> > +/// Driver supports mode setting interfaces (KMS).
> > +pub const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
> > +/// Driver supports dedicated render nodes.
> > +pub const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
> > +/// Driver supports the full atomic modesetting userspace API.
> > +///
> > +/// Drivers which only use atomic internally, but do not support the full userspace API (e.g. not
> > +/// all properties converted to atomic, or multi-plane updates are not guaranteed to be tear-free)
> > +/// should not set this flag.
> > +pub const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
> > +/// Driver supports DRM sync objects for explicit synchronization of command submission.
> > +pub const FEAT_SYNCOBJ: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ;
> > +/// Driver supports the timeline flavor of DRM sync objects for explicit synchronization of command
> > +/// submission.
> > +pub const FEAT_SYNCOBJ_TIMELINE: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ_TIMELINE;
> 
> This is missing an entry for DRIVER_GEM_GPUVA. And some others perhaps. 
> I suppose some are legacy which won't be needed any time soon if ever. 
> Not sure if you intend for this to be complete, or you are just adding 
> what you are using? Only FEAT_GEM is used by nova ATM.

Good catch, I think we should add all of them, except the legacy ones. If no one
disagrees, I will fix this in v2.

> 
> Rob
> 

