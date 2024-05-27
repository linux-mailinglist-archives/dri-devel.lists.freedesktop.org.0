Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A68D0CC4
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 21:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC1510E44B;
	Mon, 27 May 2024 19:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EDj6nLh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3734010E2E4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 19:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716837775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+bh6eeKyL8dV8w1mLvCxudFIQs1HlIb6gTyNzpVbwLw=;
 b=EDj6nLh3siS05U1fsW7DN+qktIdNz0JlbMOadZJOKBpiopntL57Rn6Fe+BuJfDe3nfXkv3
 qA/LCa4cV5rXRXv6J+IVj1afmO7Qx+yTIv4l0OE+PQ0PFTPuiMdFrpWRURojm0nuK4EsPj
 b/mhhjunuRiPR5dM2vtUg7CE/q7MLJw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-tNY4P-bsOa-MwPS87fYZqQ-1; Mon, 27 May 2024 15:22:52 -0400
X-MC-Unique: tNY4P-bsOa-MwPS87fYZqQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5785f7b847cso73479a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 12:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716837771; x=1717442571;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bh6eeKyL8dV8w1mLvCxudFIQs1HlIb6gTyNzpVbwLw=;
 b=RWpBxYuLJVmRFlagVXvyNo8ZYWNrwkhROoOc/MYl5uzRCLJ/j5H2a/cN3RMy0+N9uk
 14eJdXEbwiE/UL4JI64AQlrYupHkJ7TKulRhVjKKHf4Gunqu+6d9KJbQhWU6DZ0y02UH
 gsgl2x9JddVyHRzSOaSUh/HR5QWjulP+jatdYU/ZoHieE0yDXl8xr3t+0b1Wf8Spn3RS
 Ig1S/KVx1NsqL1NZqjDbn/2FriGOMb4aJ6AsKxpZ2ICgHOG7L+uOSXG7AwdLA1zBh+Zq
 zxXQ/XeaFaqLWC2ifNo/6O8xWmi4BPiADIP7tQYHWnR4TQsdMMIFtOc2NYaIBdRQgKnl
 2zrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmdf0AqsWlJmT8XyvA1V96Qu+ro9HeOarRfzXKMTDjY0S0s9ONb9k+yQoaVOi36vhuNGIR3WBfcwXHV5VWtJbRqOhKSX/jIRGg9bMJkIV6
X-Gm-Message-State: AOJu0YzKGapTcGPmN4Jj/8SOO/SuwDz0oBQOdHH0nRa2e8bz+AxfLny3
 C+SwYVj9pi7GI0DT2P3HEuNiIHmF3eT+nAfVodnYgzqWaitrjMk0PQful0QHVZ2HIm3Mr8XspFR
 utmb+LH2yXh+hhc6UZb644G5Xhz5qbJ8WgWPWpLJretw4pODXVCbWnBbGEbO+2bGn5g==
X-Received: by 2002:a50:9354:0:b0:579:c4e8:42bf with SMTP id
 4fb4d7f45d1cf-579c4e84380mr4666430a12.12.1716837770899; 
 Mon, 27 May 2024 12:22:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjAcWifdc1cmj4PyyLda94dlOEBvjOTiDHYgpo+M4fPeLYt+JqhR5bWaQW9VkpsHWQ9CeNbw==
X-Received: by 2002:a50:9354:0:b0:579:c4e8:42bf with SMTP id
 4fb4d7f45d1cf-579c4e84380mr4666397a12.12.1716837770413; 
 Mon, 27 May 2024 12:22:50 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:748f:dc54:236c:b760])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579cec28c0dsm2325554a12.66.2024.05.27.12.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 12:22:50 -0700 (PDT)
Date: Mon, 27 May 2024 21:22:47 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlTdh/eQAIhxNn9e@pollux.localdomain>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
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

On Wed, May 22, 2024 at 08:53:34AM +0900, FUJITA Tomonori wrote:
> Hi,
> Thanks for working on the firmware API!
> 
> On Mon, 20 May 2024 19:24:19 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > Add an abstraction around the kernels firmware API to request firmware
> > images. The abstraction provides functions to access the firmware
> > buffer and / or copy it to a new buffer allocated with a given allocator
> > backend.
> > 
> > The firmware is released once the abstraction is dropped.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/bindings/bindings_helper.h |  1 +
> >  rust/kernel/firmware.rs         | 74 +++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs              |  1 +
> >  3 files changed, 76 insertions(+)
> >  create mode 100644 rust/kernel/firmware.rs
> > 
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> > index b245db8d5a87..e4ffc47da5ec 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -14,6 +14,7 @@
> >  #include <kunit/test.h>
> >  #include <linux/errname.h>
> >  #include <linux/ethtool.h>
> > +#include <linux/firmware.h>
> >  #include <linux/jiffies.h>
> >  #include <linux/mdio.h>
> >  #include <linux/pci.h>
> > diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> > new file mode 100644
> > index 000000000000..700504fb3c9c
> > --- /dev/null
> > +++ b/rust/kernel/firmware.rs
> > @@ -0,0 +1,74 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Firmware abstraction
> > +//!
> > +//! C header: [`include/linux/firmware.h`](../../../../include/linux/firmware.h")
> > +
> > +use crate::{bindings, device::Device, error::Error, error::Result, str::CStr, types::Opaque};
> > +
> > +/// Abstraction around a C firmware struct.
> > +///
> > +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
> > +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
> > +/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
> > +/// firmware is released once [`Firmware`] is dropped.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
> > +/// driver_load_firmware(fw.data());
> > +/// ```
> > +pub struct Firmware(Opaque<*const bindings::firmware>);
> 
> Wrapping a raw pointer is not the intended use of Qpaque type?
> 

Indeed, will fix this in v2 and use NonNull instead. I'll also offload most of
the boilerplate in the 'request' functions to some common 'request_internal' one.

