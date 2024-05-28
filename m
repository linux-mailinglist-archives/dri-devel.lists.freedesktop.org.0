Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56F8D1E57
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 16:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C3410E3D9;
	Tue, 28 May 2024 14:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JJmm1wog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047B610E492
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716905932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z/BZ1nt51YTWYadDCqba2r6Z+lAvTA6hSb41k488cU8=;
 b=JJmm1wog/Xi3hUw3G9uspZVX9UNt/A7bXSMY0c+hmjskjYopNokUaFBTe1qvXvWRT37nLo
 Hvi6mQ0X/PyHeDYeO0TlL9Xi7/uXNP30FigRqyabv3HIF5Sf2y05dtG8pve8+ucUDeHH2+
 gvpNNL28HFUSJ/DE15xZHRpaRkS7Ig8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-_0O-E04NN9OvMIxwHwKcFA-1; Tue, 28 May 2024 10:18:48 -0400
X-MC-Unique: _0O-E04NN9OvMIxwHwKcFA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-35507e4c41dso1919559f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 07:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716905927; x=1717510727;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/BZ1nt51YTWYadDCqba2r6Z+lAvTA6hSb41k488cU8=;
 b=wj4aJ4Ajplczdd1AMgKmismNOwyQeI6myLbNQQyH4ePnLU5TpgFUMgBuiZhx49BhqA
 K6wQzQF/9annLFN1p3JF37CCGiNoDQI6TSW+EqpmqPveRSgM4BqQ1LrJ8m84G5Msi5fP
 xdxK4ithIREp/aryk+2FTi0sQiBR8zfZHDfSxmVCTD2UBnxFpNB5br2AWW+PzIr6VUdu
 wSuJ1ISwq/tTfHQMB9id5z08wZQ7Brgjh5nqNY3BWhQ9tbPo5eoRixtjb0uCqZxPyLMV
 GV19abLw2ugOsWNbEGHEL+irSi2B9iKRmCwum1Fcdh2RT4dPUlAmhYAfPe/AhzE7GGCm
 HNYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXhRSKzSwt9lBeHXNFEaJPtweHGzKIY8NWJom8gKhdp6a1MRsvVkVJr08X0tPWgi9KRXjwRPuLSSCMGb2IYpAfzWEMJPiPPmOF9I1ICO8r
X-Gm-Message-State: AOJu0YzfCQ8f8rqmZC4c+rjhGmXvTi27KImAEhUso3Ih/yAGlLIlnwRY
 7RJ++aaOk4PDc7nl7g4wtJuhY0RbwwUuySSmAXXbX1XXWlm8wa1mUy3Uf7/aW+d9aYY0K1T3L3O
 EtL+Kdv/mQ7hrvcQYSoVP4RbuXvVJNT+ELEZyuDRkHujAeB138ndhKLzOUJD+MF2mLA==
X-Received: by 2002:adf:f14a:0:b0:354:e22c:ea86 with SMTP id
 ffacd0b85a97d-35506d48b8cmr9521433f8f.9.1716905927691; 
 Tue, 28 May 2024 07:18:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzv0UKkNsSlIQyIXiOI2f3K/kj+ZZJuaGQwe6Mug19LllcchtBIhDXNRyuC86tE0PcwWttfw==
X-Received: by 2002:adf:f14a:0:b0:354:e22c:ea86 with SMTP id
 ffacd0b85a97d-35506d48b8cmr9521398f8f.9.1716905927283; 
 Tue, 28 May 2024 07:18:47 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35607bcdf26sm11788342f8f.99.2024.05.28.07.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 07:18:46 -0700 (PDT)
Date: Tue, 28 May 2024 16:18:44 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "wedsonaf@gmail.com" <wedsonaf@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>,
 "a.hindborg@samsung.com" <a.hindborg@samsung.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "fujita.tomonori@gmail.com" <fujita.tomonori@gmail.com>,
 "lina@asahilina.net" <lina@asahilina.net>,
 "pstanner@redhat.com" <pstanner@redhat.com>,
 "ajanulgu@redhat.com" <ajanulgu@redhat.com>,
 "lyude@redhat.com" <lyude@redhat.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlXnxGK24QaYLDmM@pollux>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
 <20240521083231.000074c2.zhiw@nvidia.com>
 <ZlTcnYNff2EDQJdj@pollux.localdomain>
 <fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com>
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

On Tue, May 28, 2024 at 08:40:20AM +0000, Zhi Wang wrote:
> On 27/05/2024 22.18, Danilo Krummrich wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Tue, May 21, 2024 at 08:32:31AM +0300, Zhi Wang wrote:
> >> On Mon, 20 May 2024 19:24:19 +0200
> >> Danilo Krummrich <dakr@redhat.com> wrote:
> >>
> >>> Add an abstraction around the kernels firmware API to request firmware
> >>> images. The abstraction provides functions to access the firmware
> >>> buffer and / or copy it to a new buffer allocated with a given
> >>> allocator backend.
> >>>
> >>
> >> Was playing with firmware extractions based on this patch.
> >> Unfortunately I ended up with a lot of pointer operations, unsafe
> >> statements.
> >>
> >> As we know many vendors have a C headers for the definitions of the
> >> firwmare content, the driver extract the data by applying a struct
> >> pointer on it.
> >>
> >> But in rust, I feel it would nice that we can also have a common
> >> firmware extractor for drivers, that can wrap the pointer operations,
> >> take a list of the firmware struct members that converted from C headers
> >> as the input, offer the driver some common ABI methods to query them.
> >> Maybe that would ease the pain a lot.
> > 
> > So, you mean some abstraction that takes a list of types, offsets in the
> > firmware and a reference to the firmware itself and provides references to the
> > corresponding objects?
> > 
> > I agree it might be helpful to have some common infrastructure for this, but the
> > operations on it would still be unsafe, since ultimately it involves
> > dereferencing pointers.
> > 
> 
> I think the goal is to 1) concentrate the "unsafe" operations in a 
> abstraction so the driver doesn't have to write explanation of unsafe 
> operations here and there, improve the readability of the driver that 
> interacts with vendor-firmware buffer. 2) ease the driver maintenance 
> burden.

With a generic abstraction, as in 1), at lest some of the abstraction's
functions would be unsafe themselves, since they have to rely on the layout
(or offset) passed by the driver being correct. What if I pass a wrong layout /
offset for a structure that contains a pointer? This might still result in an
invalid pointer dereference. Am I missing something?

> 
> Some solutions I saw in different projects written in rust for 
> de-referencing a per-defined struct:
> 
> 1) Take the vendor firmware buffer as a whole, invent methods like 
> read/write with offset for operating the buffer.
> 
> In this scheme, the driver is responsible for taking care of each data 
> member in a vendor firmware struct and also its valid offset. The 
> abstraction only covers the boundary of the whole firmware buffer.
> 
> The cons is the readability of the operation of the vendor firmware 
> buffer in the driver is not good comparing with C code.
> 
> Hate to think a lot of xxx = vendor_firmware_struct.read(offset); // 
> reading item A in the code.
> 
> 2) Define the firmware struct in rust (might need to find a better way 
> to handle "union" in the definition of the vendor firmware struct). Use 
> macros to generate methods of accessing each data member for the vendor 
> firmware struct.
> 
> Then the code in the driver will be like xxx = 
> vendor_firmware_struct.item_a(); in the driver.
> 
> In this scheme, the abstraction and the generated methods covers the 
> boundary check. The "unsafe" statement can stay in the generated 
> struct-access methods.
> 
> This might even be implemented as a more generic rust feature in the kernel.

This sounds more like a driver specific abstraction to me, which, as you write,
we can probably come up with some macros that help implementing it.

But again, what if the offsets are within the boundary, but still at a wrong
offset? What if the data obtained from a wrong offset leads to other safety
implications when further processing them? I think no generic abstraction can
ever cover the safety parts of this (entirely). I think there are always semanic
parts to this the driver has to cover.

Generally, I think we should aim for some generalization, but I think we should
not expect it to cover all the safety aspects.

> 
> The cons is still the driver might need to sync between the C-version 
> definition and rust-version definition.

What do you mean with the driver needs to sync between a C and a Rust version of
structure definitions?

> 
> 3) Also re-using C bindings generation in the kernel came to my mind 
> when thinking of this problem, since it allows the rust code to access 
> the C struct, but they don't have the boundary check. Still need another 
> layer/macros to wrap it.

I think we should have the structure definitions in Rust directly.

- Danilo

> 
> 
> >>
> >> Thanks,
> >> Zhi.
> >>

