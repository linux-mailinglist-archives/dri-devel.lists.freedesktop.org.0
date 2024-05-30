Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ABA8D4345
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 04:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC9E10E236;
	Thu, 30 May 2024 02:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XP1oo+sr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B32910E236
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 02:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717034510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=55UuKSwYXJi7adh0NBI3TuBTOOEtGh+oD29onBT0shk=;
 b=XP1oo+srNLFBA97v1miNbVoD5ZH/5PVQm8LoDdwvB9Naanwa5TvH5fiZmbO/y0a1fTrSY1
 GR795vCCJMVeN1TgUOOeDp1Hl9ZdhWrWeG+iPRpT0syElAtWyVZZ7LcyoKLaMkeHkH30Hi
 HLhC5N2HlcJIL/YPeHVV+VKGhnJJwbs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-guxB9OQ8PdWnFyV5d2UdWg-1; Wed, 29 May 2024 22:01:49 -0400
X-MC-Unique: guxB9OQ8PdWnFyV5d2UdWg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42110ebbd0fso3638775e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 19:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717034505; x=1717639305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=55UuKSwYXJi7adh0NBI3TuBTOOEtGh+oD29onBT0shk=;
 b=bQ5PqYuBHrFVQgrdHDmhtuwq6TvUmbccg3Bc66yOnrJQms/6jdbQsQGCiQ4IiuVV0W
 bK5Fbk/uNi3KYbq9T4SC0bq3cp1XdS7b9BnheBp2r5FNj4Jn4976E2GRQv8upcUBKrN8
 OAVt55x7w+mbKXtpNrYRha3sB2Hu+IcjI9YBcfdsv8pixAaAueXMDTUbA0XHm6KewDEC
 bZBgJ3zRLtBJv0hOkzVSCu9FliVNKcLyTaNE0N9Kbjy2PjYOCojBAA7nF9AYWAY51XVe
 zDlHm10TlbL3KGDXOCFVIz3sIag8HgsJ7Ge29t6J56wFnnupdKN99P4WU+b3mZ5ii7kk
 H24Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXokVYj+t0AFLcr/xzgdnz5MP+eh8Ki0GBKqri5RhbQHzeynswfLsLgZtFX2BiK/0daImrujLvM9ZVSKo1EVioAJWZPgtFx8U5jB3SYFGtV
X-Gm-Message-State: AOJu0YxlIazqzd2n7cjJJAZVcYd3hh2DvUghBLtgfumKZQEtnvS2N+aJ
 NEo3tLj8N0+27wqjMzuRgdnqfA4pJ4xXbMtbJqwTbKtbJEgvsFxeXiQ/lp52sEhTF/+MWhNQOY1
 3wi8ZvUu90qzT28n0H42JCDfCUIIWYvpZG5Y1DTpzcZqPDfpmUMOZLYMdBhsDCHGBXA==
X-Received: by 2002:a05:600c:3115:b0:41a:ff7d:2473 with SMTP id
 5b1f17b1804b1-4212780a8f6mr10011095e9.4.1717034504946; 
 Wed, 29 May 2024 19:01:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm/RlXxCoTw+3/Eu3ygBcOVuc3izz16ZIvvwzqDoOJ+khErysmUe9W6T4HYOjHGaZFHaGekQ==
X-Received: by 2002:a05:600c:3115:b0:41a:ff7d:2473 with SMTP id
 5b1f17b1804b1-4212780a8f6mr10010795e9.4.1717034504440; 
 Wed, 29 May 2024 19:01:44 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:2c63:6b4d:717b:4982])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212708a6d6sm9547005e9.43.2024.05.29.19.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 19:01:43 -0700 (PDT)
Date: Thu, 30 May 2024 04:01:39 +0200
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
Message-ID: <ZlfeA7MEZRv404MO@pollux.localdomain>
References: <2024052816-makeshift-irrigate-cef5@gregkh>
 <20240529.092821.1593412345609718860.fujita.tomonori@gmail.com>
 <2024052950-purely-sandstone-36c7@gregkh>
 <20240530.082824.289365952172442399.fujita.tomonori@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240530.082824.289365952172442399.fujita.tomonori@gmail.com>
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

On Thu, May 30, 2024 at 08:28:24AM +0900, FUJITA Tomonori wrote:
> Hi,
> 
> On Wed, 29 May 2024 21:57:03 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> >> For a Rust PHY driver, you know that you have a valid pointer to C's
> >> device object of C's PHY device during the probe callback. The driver
> >> creates a Rust device object to wrap the C pointer to the C's device
> >> object and passes it to the firmware abstractions. The firmware
> >> abstractions gets the C's pointer from the Rust object and calls C's
> >> function to load firmware, returns the result.
> >> 
> >> You have concerns about the simple code like the following?
> >> 
> >> 
> >> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> >> new file mode 100644
> >> index 000000000000..6144437984a9
> >> --- /dev/null
> >> +++ b/rust/kernel/device.rs
> >> @@ -0,0 +1,30 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +//! Generic devices that are part of the kernel's driver model.
> >> +//!
> >> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> >> +
> >> +use crate::types::Opaque;
> >> +
> >> +#[repr(transparent)]
> >> +pub struct Device(Opaque<bindings::device>);
> >> +
> >> +impl Device {
> >> +    /// Creates a new [`Device`] instance from a raw pointer.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// For the duration of 'a, the pointer must point at a valid `device`.
> > 
> > If the following rust code does what this comment says, then sure, I'm
> > ok with it for now if it helps you all out with stuff like the firmware
> > interface for the phy rust code.
> 
> Great, thanks a lot!
> 
> Danilo and Wedson, are there any concerns about pushing this patch [1]
> for the firmware abstractions?

Well, if everyone is fine with this one I don't see why we can't we go with [1]
directly? AFAICS, we'd only need the following fix:

-//! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
+//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)

[1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/

> 
> I you prefer to be the author of the patch, please let me know. Who
> the author is doesn't matter to me. Otherwise, I'll add
> Co-developed-by tag.
> 
> [1] https://lore.kernel.org/rust-for-linux/20240529.092821.1593412345609718860.fujita.tomonori@gmail.com/
> 

