Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B5D8D45A0
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 08:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0DC11B570;
	Thu, 30 May 2024 06:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zo/WB0qz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D0D11B570
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717051855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+6UhhRx41Z6T54/uX+rvRSIQ4bG3F0Fzy3rQ4r+M7Xw=;
 b=Zo/WB0qzugDH8DHm26NNmeR2ftoDnhFlo6Wv33toMGxVO/OiaHUx4WInW1AaDecsZTEFyI
 FG0oft5YXFF3om1mMH4IL/LFvRSCjDYExOUGIdKUYlqL8hEdmz/QtVFhfUQ6NW/xqYRUZS
 u9LMMijqRl3IPtWmMngQThYW8QrimTM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-1zLBBQsdNEuvMg3TdKHGNg-1; Thu, 30 May 2024 02:47:31 -0400
X-MC-Unique: 1zLBBQsdNEuvMg3TdKHGNg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-354f28306dfso448910f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 23:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717051648; x=1717656448;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6UhhRx41Z6T54/uX+rvRSIQ4bG3F0Fzy3rQ4r+M7Xw=;
 b=QzoLCxS5oI0k5ULJP/N5ASzRp2iGNc0MWHjg91zrk/8KkOb3hXqMaVLeRfLTcPPwgl
 ed9T5urNiJQ3nQ9JNxE9UMAu6nUD8Dk/btP/7YpKXX17aiDT8/K/6hatUVA7CxIb4bNJ
 YAgMP+g+7EYzAyUMfIMWFmKAjUNO0e0SAhDKVCKyix6gb3vptG698SL3pS97E4OmTBPU
 ey5TgzcX86TiqJPh2vOK01RC4Q2OzhnaIjrkrsZU2mKmpSWJggr1dbfSPXh1mwHG3t2y
 oMbGH1g59pTXEupeZ0yMklMANxPeo05AM88OVunnQGVSkDz+iPsHtVKcS/JZbJXk5i61
 ihxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHgyIwQHMkmdlkKXNnMIhYf6PqwEih7J6aNi2OVn8nJrurzCVpIyLHeDQWNdwqB/JB7BfumFLeXbv6llNb58PBL3SvXLtu5ySI3iBZi/TL
X-Gm-Message-State: AOJu0YzNP8ViJnpWouSDSo6Z0DmRLmuE7H+dPCs5o18nq2RFiS3LvrGi
 YFf+EYo6ZZ5OwjqWGAI+SJvNYBOKiIAo2exOxEQDQqcWVWyL/4quzvEgqIUn6uuKcgXnKLPyCvX
 WHPcrRkmgrFI21aSWnQeRglp2HITgc8Yp82kN6Ln80PyzA/poiciHRHuzIkew5LNjEw==
X-Received: by 2002:a05:6000:1883:b0:35d:bfa7:5f12 with SMTP id
 ffacd0b85a97d-35dc0091881mr968702f8f.19.1717051648526; 
 Wed, 29 May 2024 23:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2THkDfZkgav7wfIpmSg8axTLOU7esgmVr44vwAJ61wnkwr2ymTrnaq1t0RgEDsR5qCuZd2A==
X-Received: by 2002:a05:6000:1883:b0:35d:bfa7:5f12 with SMTP id
 ffacd0b85a97d-35dc0091881mr968678f8f.19.1717051648049; 
 Wed, 29 May 2024 23:47:28 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35579d7d963sm16775384f8f.21.2024.05.29.23.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 23:47:27 -0700 (PDT)
Date: Thu, 30 May 2024 08:47:25 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: gregkh@linuxfoundation.org, wedsonaf@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <Zlgg_Q5y3Q99Ts1s@pollux>
References: <2024052950-purely-sandstone-36c7@gregkh>
 <20240530.082824.289365952172442399.fujita.tomonori@gmail.com>
 <ZlfeA7MEZRv404MO@pollux.localdomain>
 <20240530.132433.2195707766186347550.fujita.tomonori@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240530.132433.2195707766186347550.fujita.tomonori@gmail.com>
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

On Thu, May 30, 2024 at 01:24:33PM +0900, FUJITA Tomonori wrote:
> Hi,
> 
> On Thu, 30 May 2024 04:01:39 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > On Thu, May 30, 2024 at 08:28:24AM +0900, FUJITA Tomonori wrote:
> >> Hi,
> >> 
> >> On Wed, 29 May 2024 21:57:03 +0200
> >> Greg KH <gregkh@linuxfoundation.org> wrote:
> >> 
> >> >> For a Rust PHY driver, you know that you have a valid pointer to C's
> >> >> device object of C's PHY device during the probe callback. The driver
> >> >> creates a Rust device object to wrap the C pointer to the C's device
> >> >> object and passes it to the firmware abstractions. The firmware
> >> >> abstractions gets the C's pointer from the Rust object and calls C's
> >> >> function to load firmware, returns the result.
> >> >> 
> >> >> You have concerns about the simple code like the following?
> >> >> 
> >> >> 
> >> >> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> >> >> new file mode 100644
> >> >> index 000000000000..6144437984a9
> >> >> --- /dev/null
> >> >> +++ b/rust/kernel/device.rs
> >> >> @@ -0,0 +1,30 @@
> >> >> +// SPDX-License-Identifier: GPL-2.0
> >> >> +
> >> >> +//! Generic devices that are part of the kernel's driver model.
> >> >> +//!
> >> >> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> >> >> +
> >> >> +use crate::types::Opaque;
> >> >> +
> >> >> +#[repr(transparent)]
> >> >> +pub struct Device(Opaque<bindings::device>);
> >> >> +
> >> >> +impl Device {
> >> >> +    /// Creates a new [`Device`] instance from a raw pointer.
> >> >> +    ///
> >> >> +    /// # Safety
> >> >> +    ///
> >> >> +    /// For the duration of 'a, the pointer must point at a valid `device`.
> >> > 
> >> > If the following rust code does what this comment says, then sure, I'm
> >> > ok with it for now if it helps you all out with stuff like the firmware
> >> > interface for the phy rust code.
> >> 
> >> Great, thanks a lot!
> >> 
> >> Danilo and Wedson, are there any concerns about pushing this patch [1]
> >> for the firmware abstractions?
> > 
> > Well, if everyone is fine with this one I don't see why we can't we go with [1]
> > directly? AFAICS, we'd only need the following fix:
> > 
> > -//! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
> > +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> > 
> > [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/
> 
> The difference is that your patch touches the reference count of a
> struct device. My patch doesn't.
> 
> The following part in your patch allows the rust code to freely play
> with the reference count of a struct device. Your Rust drm driver
> interact with the reference count in a different way than C's drm
> drivers if I understand correctly. I'm not sure that Greg will be
> convinenced with that approach.

I don't see how this is different than what we do in C. If you (for whatever
reason) want to keep a pointer to a struct device you should make sure to
increase the reference count of this device, such that it can't get freed for
the time being.

This is a 1:1 representation of that and conceptually identical.

> 
> +// SAFETY: Instances of `Device` are always ref-counted.
> +unsafe impl crate::types::AlwaysRefCounted for Device {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that the refcount is nonzero.
> +        unsafe { bindings::get_device(self.as_raw()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
> +        unsafe { bindings::put_device(obj.cast().as_ptr()) }
> +    }
> +}
> 
> The following comments give the impression that Rust abstractions
> wrongly interact with the reference count; callers check out the
> reference counter. Nobody should do that.

No, saying that the caller must ensure that the device "has a non-zero reference
count" is a perfectly valid requirement.

It doensn't mean that the calling code has to peek the actual reference count,
but it means that it must be ensured that while we try to increase the reference
count it can't drop to zero unexpectedly.

Your patch, as a subset of this one, has the same requirements as listed below.

> 
> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
> +    pub unsafe fn from_raw(ptr: *mut bindings::device) -> ARef<Self> {
> 
> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count for
> +    /// the entire duration when the returned reference exists.
> +    pub unsafe fn as_ref<'a>(ptr: *mut bindings::device) -> &'a Self {
> +        // SAFETY: Guaranteed by the safety requirements of the function.
> +        unsafe { &*ptr.cast() }
> +    }
> 

