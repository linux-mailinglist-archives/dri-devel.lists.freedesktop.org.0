Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DC48D447B
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 06:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2362D11AAAA;
	Thu, 30 May 2024 04:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dGxIU3mh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D9911AAAA;
 Thu, 30 May 2024 04:24:42 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-681a3e5d376so7868a12.2; 
 Wed, 29 May 2024 21:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717043082; x=1717647882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=E3VVbhC6I5IDpIBKGc/cIzsKHjro6Wg4me5Z18wNEmY=;
 b=dGxIU3mhhfL0UISTahbboa/6mx+lwTrGJPMP5AOEW/sbEA4iOd/6pLPpLanBvT+UGZ
 9OtcZ0GJVAcLFZyV6+3T5DrRRpTWFZoDlpufSjSrtZxHoWPbNSwc+d7fRCzy2c031iZM
 02YFvQx8JKbr60D5pNe8m2EKliq420K/5R8liAC6LxSbd31/1RIacrmxLwl1JZ4hYzsi
 CKr+xKYKjDn0kG8uq/5DFuAXpRcIqgYIGz5AbrMKExTQ+krkfDqNnR1cW2nD4thzhHc7
 N+CFoOpjMoDBeED27ihe4bfyJrCecZ28vIxoJlhLAHsK95ZtSd2hqq+Q/VFYH9TGnmUa
 FtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717043082; x=1717647882;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=E3VVbhC6I5IDpIBKGc/cIzsKHjro6Wg4me5Z18wNEmY=;
 b=hqiQ3/mlQ5h+E4TGTEUqK/eMxQrSNr4dd8jnCjOU0KdGny0inHrnWzXBEKIqV6lUCY
 j7fv6QOaglIPSa53LflBmezd3Q5DyyVuDoJSZ2xAr3IR03PwdEINPxynLh4PP12GrgD0
 3G34As93w/qnTslA7+h2AN1TDKvt9cmJ9fgvRQHT3G24F6jeKVx4qTbT6IwRX8SNVUGS
 10825Qe6A41f9XQEslFEknGw/AxHsjC1XDm0E3FrCgS3EptMtjXq6oWsfzu0C0zaCJDV
 n7zkjqcHVrdEDGPgXBKSpmWlEnDHJCSHpEP7cxjMhpB18YYvJ4SXRVhQRcNCSJBiRAkV
 cTvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPjqOv2RtnaMJiFYtrhmWalQD8Ai4drmNC3BFiFP2STmhqzqPW9r88BkLIE4j5HJ1p+dhN/KZnPi7mm437iqD4di3vxcqcFmPhzGmEESmJREXLBvCunu0ByTGh4Dq1j6s8pfyiuXNBzUP0y/Ioog==
X-Gm-Message-State: AOJu0Yxq6E6yrcgGHRbhNnQant8MU1RPJzTYTuSM2NaB96WyLj9k2JjM
 Me4ZU/3IgzbGUpUmqB7BL7/u7aXdNEj10VTKyyKEQ9QnSwNexicf
X-Google-Smtp-Source: AGHT+IEJdZ4YE8MX8w0oPD51QAdlQikfgmInuFu5dotPFl7flHJL3hSTz7FpJiSJHzOGtR8YnBeuYQ==
X-Received: by 2002:a05:6a20:3219:b0:1af:96e7:2be6 with SMTP id
 adf61e73a8af0-1b26440808amr1198934637.0.1717043081669; 
 Wed, 29 May 2024 21:24:41 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp.
 [180.15.241.226]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f477d337cdsm83515795ad.71.2024.05.29.21.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 21:24:41 -0700 (PDT)
Date: Thu, 30 May 2024 13:24:33 +0900 (JST)
Message-Id: <20240530.132433.2195707766186347550.fujita.tomonori@gmail.com>
To: dakr@redhat.com, gregkh@linuxfoundation.org
Cc: fujita.tomonori@gmail.com, wedsonaf@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <ZlfeA7MEZRv404MO@pollux.localdomain>
References: <2024052950-purely-sandstone-36c7@gregkh>
 <20240530.082824.289365952172442399.fujita.tomonori@gmail.com>
 <ZlfeA7MEZRv404MO@pollux.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi,

On Thu, 30 May 2024 04:01:39 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> On Thu, May 30, 2024 at 08:28:24AM +0900, FUJITA Tomonori wrote:
>> Hi,
>> 
>> On Wed, 29 May 2024 21:57:03 +0200
>> Greg KH <gregkh@linuxfoundation.org> wrote:
>> 
>> >> For a Rust PHY driver, you know that you have a valid pointer to C's
>> >> device object of C's PHY device during the probe callback. The driver
>> >> creates a Rust device object to wrap the C pointer to the C's device
>> >> object and passes it to the firmware abstractions. The firmware
>> >> abstractions gets the C's pointer from the Rust object and calls C's
>> >> function to load firmware, returns the result.
>> >> 
>> >> You have concerns about the simple code like the following?
>> >> 
>> >> 
>> >> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
>> >> new file mode 100644
>> >> index 000000000000..6144437984a9
>> >> --- /dev/null
>> >> +++ b/rust/kernel/device.rs
>> >> @@ -0,0 +1,30 @@
>> >> +// SPDX-License-Identifier: GPL-2.0
>> >> +
>> >> +//! Generic devices that are part of the kernel's driver model.
>> >> +//!
>> >> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
>> >> +
>> >> +use crate::types::Opaque;
>> >> +
>> >> +#[repr(transparent)]
>> >> +pub struct Device(Opaque<bindings::device>);
>> >> +
>> >> +impl Device {
>> >> +    /// Creates a new [`Device`] instance from a raw pointer.
>> >> +    ///
>> >> +    /// # Safety
>> >> +    ///
>> >> +    /// For the duration of 'a, the pointer must point at a valid `device`.
>> > 
>> > If the following rust code does what this comment says, then sure, I'm
>> > ok with it for now if it helps you all out with stuff like the firmware
>> > interface for the phy rust code.
>> 
>> Great, thanks a lot!
>> 
>> Danilo and Wedson, are there any concerns about pushing this patch [1]
>> for the firmware abstractions?
> 
> Well, if everyone is fine with this one I don't see why we can't we go with [1]
> directly? AFAICS, we'd only need the following fix:
> 
> -//! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> 
> [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/

The difference is that your patch touches the reference count of a
struct device. My patch doesn't.

The following part in your patch allows the rust code to freely play
with the reference count of a struct device. Your Rust drm driver
interact with the reference count in a different way than C's drm
drivers if I understand correctly. I'm not sure that Greg will be
convinenced with that approach.

+// SAFETY: Instances of `Device` are always ref-counted.
+unsafe impl crate::types::AlwaysRefCounted for Device {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is nonzero.
+        unsafe { bindings::get_device(self.as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
+        unsafe { bindings::put_device(obj.cast().as_ptr()) }
+    }
+}

The following comments give the impression that Rust abstractions
wrongly interact with the reference count; callers check out the
reference counter. Nobody should do that.

+    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
+    pub unsafe fn from_raw(ptr: *mut bindings::device) -> ARef<Self> {

+    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count for
+    /// the entire duration when the returned reference exists.
+    pub unsafe fn as_ref<'a>(ptr: *mut bindings::device) -> &'a Self {
+        // SAFETY: Guaranteed by the safety requirements of the function.
+        unsafe { &*ptr.cast() }
+    }
