Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D94C8D1914
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124D5112124;
	Tue, 28 May 2024 11:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CZSQeSGz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43538112124;
 Tue, 28 May 2024 11:01:44 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2bde882ab2bso131209a91.3; 
 Tue, 28 May 2024 04:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716894103; x=1717498903; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=iiu6Rm5CIFCk4QRomYxhTqrZVCrSfLMD8/o2TBnR/WU=;
 b=CZSQeSGzuodYnd6jpZyIzKFnAJY/4DTu4fr3GkhqYdn4G5UHW91671OuuAoGh4hYIa
 pix3sv9yj1KL4lMORR6liyKvQfYH7m5FikOVyog5wjix4fbWg52OY6R8dlsWnDesH39b
 1RwenV57AY5xgIhkM2SrrWk8xq19Pofc4VpS4ZbG+ttAcZg0Ju9NNLKsQfUH+iYb6JV5
 Wa1lsQAdoP140+M3h+gtjcVneu83m9ElOmWyAPtG2KvKGz1Ng484OP3uofH07yFGedTG
 mHyU42j3GeAk0Z4ei/+VsPeU0OnUuvD4urQiCXSl6vXRUSTe87J56tYA1Uuv+hPfIkHk
 g4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716894103; x=1717498903;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iiu6Rm5CIFCk4QRomYxhTqrZVCrSfLMD8/o2TBnR/WU=;
 b=Am0x8PMMA4mxjXT27bFudTDB5AaSIBgbbI6u8x+2PUsd40T2baEyd19jtnWmt35Qvi
 kYGOiBnwXljjwz8+yESL9QPD9I+0w/lGxGTKH/57CniekXvJH/56jHC+CHF8OmM46jpM
 2XD80i6rQFlx1s7n0+b6KNBdpv2x59vvG5AAUlNEXl7dwrrssPCL2y++8uM77e0jIEwg
 Uy5m2ua7UfNy2CNGjFAin+OVcgh99yk29w0f5vAXksyKfNZr5sNmeu2qcmU/LYCVIekD
 0MFmxuSNFqQpI8Uf4NchOXGFnEbeEh0ub30KGxJ46KNnRvlMs/fKRvlBJIexF1lnQZK1
 JxSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP08fQWcU/cPtqCnuIJrH6S9w/wDgn5HG3VWlh/sPxD7g2PO+NMxbVgCMeS6CE5PnnCtdAJ1/mQosxTICTkvlic/gb0RAl5/hcVqCJE53Iws05d0sUW1cwj/a9whQBPlJpp/j1A04AX5pTFbkurg==
X-Gm-Message-State: AOJu0Ywrlm+1YEogD18k7nb7gAvYZ5m8fgMbHy/9V/FGWV/PkOmaY0jZ
 U5GTMDgV6m7uXVNQ0gAI8Si8V8xA64VVp04CU+Voqo6KCHzZ8/xi
X-Google-Smtp-Source: AGHT+IHK5eumprqwAuUfIcVd4VaPDiipzyGfVLdzZ2wsfbiHrJjeTv0bZYczA03Xit3eWLGqqN68hg==
X-Received: by 2002:a17:902:db08:b0:1f4:8ca4:411f with SMTP id
 d9443c01a7336-1f48ca44187mr62400315ad.6.1716894103380; 
 Tue, 28 May 2024 04:01:43 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp.
 [180.15.241.226]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c7afcf5sm77259205ad.87.2024.05.28.04.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 04:01:43 -0700 (PDT)
Date: Tue, 28 May 2024 20:01:26 +0900 (JST)
Message-Id: <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
To: dakr@redhat.com
Cc: fujita.tomonori@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <ZlTdh/eQAIhxNn9e@pollux.localdomain>
References: <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
 <ZlTdh/eQAIhxNn9e@pollux.localdomain>
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

On Mon, 27 May 2024 21:22:47 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

>> > +/// Abstraction around a C firmware struct.
>> > +///
>> > +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
>> > +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
>> > +/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
>> > +/// firmware is released once [`Firmware`] is dropped.
>> > +///
>> > +/// # Examples
>> > +///
>> > +/// ```
>> > +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
>> > +/// driver_load_firmware(fw.data());
>> > +/// ```
>> > +pub struct Firmware(Opaque<*const bindings::firmware>);
>> 
>> Wrapping a raw pointer is not the intended use of Qpaque type?
>> 
> 
> Indeed, will fix this in v2 and use NonNull instead. I'll also offload most of
> the boilerplate in the 'request' functions to some common 'request_internal' one.

You might need to add 'Invariants' comment on Firmware struct.

BTW, what merge window are you aiming for? As I wrote before, I have a
driver that needs the firmware abstractions (the minimum device
abstractions is enough; Device::as_raw() and as_ref()). So the sooner,
the better for me.
