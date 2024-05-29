Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D200C8D41F5
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 01:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDBF10EE85;
	Wed, 29 May 2024 23:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vhqt+JfG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912C710EE85;
 Wed, 29 May 2024 23:28:32 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2bde882ab2bso34952a91.3; 
 Wed, 29 May 2024 16:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717025312; x=1717630112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=1CbHtrgyTy3hlnL/xrFUFy4gX8XK+D4Wz02/A1kHTNU=;
 b=Vhqt+JfGvBkKG3WChe6PEX535djI9D+fI8hlg6r8UKb1BLFpIZMKOc4exYAuTfmcaa
 ajWxvMPZimgDFriB17+uaIa6tzQq2Wqvh8OirLGeQrQ5QIvZg/1Z5yRAhcf6fq1exWEH
 I0VHXQmLpHIBIiduRyVsSfy/8r/yTnMwtASPWFuTHgstrH9/gLMoFrv6xOskLFlD6eSW
 u9YzzhblJ3yC6C8QDi3ybhaPSBS6to8y/kHs65j2gqEIaQGEr5IH/wV9tElts4o/KiPd
 ysC7bUjBEjSSiVL2RDRG23Vp+n3bRAxbpTdxe5QN6uh5FWjqaC0ylHxHacb7oHVhPgvW
 RZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717025312; x=1717630112;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1CbHtrgyTy3hlnL/xrFUFy4gX8XK+D4Wz02/A1kHTNU=;
 b=e5bq1VhMXugJkIKBQ+ANYibQSYfoqB2k2lSuGo+mNJjkEXm1SwQRFdLMRamMcsIgYI
 WGKz8jOJ9KpJG8oQRsxDowYYl4jziJ5OWqQxCo+2RxEW1U9mqGl6VBoxvxKSwsqOPhlW
 mobZexEL6iTY1+r4GEZgZWAvYSg6befZPFEjMEI+4Gi3bTrX4juu2DTU6itq88TtfPXx
 8LYyJ+McFuMxcvaGANx6YnoYZ1p4ztlsBzjMdOBXKYmjYeAoPQ1y2vq7KCn/bHpuaV9W
 NbZG35khZJ+C5GzAf3qAJrjXB6GYeFzZCmGtHDVagEpXZw01ZKrXWQAWU9cKvscP9xuD
 AS3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwO1oblRuiqsw1H+x9MUzIwOeNwydneIxK/R1c0IumFU+jgFzJGXDzL+ldYDR+QFSKIUiFhtqaFgz6VGMaxTykO9MmPYtPE+vR3o5Q8WzyzKXI4u0Wax3cjR88t8CEgnBIWVKsXsHiF62kBfkDGA==
X-Gm-Message-State: AOJu0Yzytkfv4Yb81C7IJnH46Lfn33+ibyAakdtjB/wCnEumCIG9XrLO
 S/eB1ps8TdPrGDTpL9hKOLA4zfLfxRCtIQ1cb/So17RaovpinM+j
X-Google-Smtp-Source: AGHT+IE1OtjMwHtpI5sgyloFG5EHG3kwe46MRMtl7GShic69l2ObaEr6JnwIz7681roQpRkx2eLWJA==
X-Received: by 2002:a05:6a20:1001:b0:1af:a5e8:d184 with SMTP id
 adf61e73a8af0-1b2646a3a95mr445927637.5.1717025311753; 
 Wed, 29 May 2024 16:28:31 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp.
 [180.15.241.226]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f48bb6163asm69304775ad.37.2024.05.29.16.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 16:28:31 -0700 (PDT)
Date: Thu, 30 May 2024 08:28:24 +0900 (JST)
Message-Id: <20240530.082824.289365952172442399.fujita.tomonori@gmail.com>
To: gregkh@linuxfoundation.org, dakr@redhat.com, wedsonaf@gmail.com
Cc: fujita.tomonori@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <2024052950-purely-sandstone-36c7@gregkh>
References: <2024052816-makeshift-irrigate-cef5@gregkh>
 <20240529.092821.1593412345609718860.fujita.tomonori@gmail.com>
 <2024052950-purely-sandstone-36c7@gregkh>
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

On Wed, 29 May 2024 21:57:03 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

>> For a Rust PHY driver, you know that you have a valid pointer to C's
>> device object of C's PHY device during the probe callback. The driver
>> creates a Rust device object to wrap the C pointer to the C's device
>> object and passes it to the firmware abstractions. The firmware
>> abstractions gets the C's pointer from the Rust object and calls C's
>> function to load firmware, returns the result.
>> 
>> You have concerns about the simple code like the following?
>> 
>> 
>> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
>> new file mode 100644
>> index 000000000000..6144437984a9
>> --- /dev/null
>> +++ b/rust/kernel/device.rs
>> @@ -0,0 +1,30 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Generic devices that are part of the kernel's driver model.
>> +//!
>> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
>> +
>> +use crate::types::Opaque;
>> +
>> +#[repr(transparent)]
>> +pub struct Device(Opaque<bindings::device>);
>> +
>> +impl Device {
>> +    /// Creates a new [`Device`] instance from a raw pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// For the duration of 'a, the pointer must point at a valid `device`.
> 
> If the following rust code does what this comment says, then sure, I'm
> ok with it for now if it helps you all out with stuff like the firmware
> interface for the phy rust code.

Great, thanks a lot!

Danilo and Wedson, are there any concerns about pushing this patch [1]
for the firmware abstractions?

I you prefer to be the author of the patch, please let me know. Who
the author is doesn't matter to me. Otherwise, I'll add
Co-developed-by tag.

[1] https://lore.kernel.org/rust-for-linux/20240529.092821.1593412345609718860.fujita.tomonori@gmail.com/
