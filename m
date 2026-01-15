Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D952CD25648
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 16:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D105C10E79F;
	Thu, 15 Jan 2026 15:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XelfTWqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0201310E795
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 15:36:05 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-434302283dcso900442f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768491364; x=1769096164;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=GLaVRn2FkZUkVWgzT/uBjf8v0R07DMhycI5J8JYhxFU=;
 b=XelfTWqLU7khHmh6uiBb9RLdkdW/SlJ/AGZpb6ZEjEO5qL51eiHDE9vHyZUxS2Tagf
 AaAZiupLgIefmC2ISDC3EK5sG2KWKn5jkqmw+0sFrycoCO60b0UnOV9uF3ugqANgj2+1
 nh+bIGz6SHKcmjT1PupXxvbgLXOXe9kNvQAzZlZInvkQIUICAPiO9kTmhHE5BUqs52kk
 TXgtw4N9zFmsLSIFFYwFI1QVThZvGJVNdUuwebQrB2bvM+OIpQn2L+iiHAho+SfagQJ+
 4TCQJoHg1+h3hNlZfS+2TK3B7u5m1UCYKDfZwXNJXMJUomGR02+/YAkzu+vQSnTKFJDq
 52Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768491364; x=1769096164;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GLaVRn2FkZUkVWgzT/uBjf8v0R07DMhycI5J8JYhxFU=;
 b=CD1FDzN9AjdV5ZnYTntqnfvGBvR2GSDg9r1NMd/LUKSv5ZuwJSHvqwVBIEbxif7SIH
 3OpZsCkhIqqGWQY61pb5BzNuApSgQGBsdEI6eGJca41GcRt9HjVVHS8mWbrAxzb9H4RB
 xi1ZFDHukJ9rxvz20REllqNZz45nrFzxRtXQIMfwbOC9naQWG5YhwplTCrGOYOz9fJNk
 uOt9jfjIsd+BRk47io47VIVKay2eijAnx2Nuu6Z3q34TfGrw/qSLbwNuZzRefv9xMcMf
 KKdUXJYo/SnIxABrZw7HDJu+uLNHH2IKgL752wSMIKRvKZw3sCFvPR+esePhWLzyyc69
 wblQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDSDT3XcjEEQ271dZl+lsgAZpla+lvdHOqcxsK3p/YEehbHmg4QjLKj1LK/wuqr9A/w/jxZMfpqSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGQBKJ8+P7gahpZAsUX4LASV6L+D9mCq14Q8lBSA31fcs1rkw2
 DrpIKq5H2SpbosB9qFHkzogiJKSyHrIoNA1MPc1icXw0zgeROFVWQgGP/Y/iB9ZFiqWk403uRjS
 +NyRDqgkJkSSj6l7suQ==
X-Received: from wrbei5.prod.google.com ([2002:a05:6000:4185:b0:430:f681:413d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d89:0:b0:42b:4267:83e9 with SMTP id
 ffacd0b85a97d-4342c4f4cdemr7491225f8f.2.1768491364318; 
 Thu, 15 Jan 2026 07:36:04 -0800 (PST)
Date: Thu, 15 Jan 2026 15:36:03 +0000
In-Reply-To: <DFOP5BY09539.AFY5L5FV1HNV@kernel.org>
Mime-Version: 1.0
References: <20251202220924.520644-1-lyude@redhat.com>
 <20251202220924.520644-8-lyude@redhat.com>
 <DFOP5BY09539.AFY5L5FV1HNV@kernel.org>
Message-ID: <aWkJYyNds5zWpgYE@google.com>
Subject: Re: [PATCH v6 7/8] rust: Introduce iosys_map bindings
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, 
 Tamir Duberstein <tamird@gmail.com>, Xiangfei Ding <dingxiangfei2009@gmail.com>,
 Zhi Wang <zhiw@nvidia.com>, Matthew Maurer <mmaurer@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
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

On Thu, Jan 15, 2026 at 12:21:51AM +0100, Danilo Krummrich wrote:
> (Cc: Zhi, Matt, Alex)
> 
> On Tue Dec 2, 2025 at 11:03 PM CET, Lyude Paul wrote:
> > This introduces a set of bindings for working with iosys_map in rust code.
> > The design of this is heavily based off the design for both the io and
> > dma_map bindings for Rust.
> 
> I already had a chat with Lyude about this, but also want to post it here. I
> have mainly two comment on this:
> 
>   (1) The backing memory of iosys_map may be a device resource and hence has to
>       be protected against (bus) device / driver unbind.
> 
>   (2) The idea for the generic I/O infrastructure is to support arbitrary I/O
>       backends rather than only MMIO. For instance, this can also be PCI
>       configuration space, I2C, SPI, etc., but also DMA, VRAM, system memory,
>       etc.
> 
>       For this, there is a patch series from Zhi [1] splitting up the current
>       I/O structures into traits that we will land soon.
> 
>       We will also have macros analogous to dma_read!() and dma_write!() for the
>       generic I/O infrastructure, which Matt also works on for his QC SoC
>       driver.
> 
>       This will allow us to unify all kinds of I/O operations into a single
>       interface, supporting the read!() and write!() accessors for values, the
>       register!() macro and raw accessors, such as e.g. read32().
> 
>       With this we will have something that is way more powerful than iosys_map
>       and makes this abstraction obsolete.

The trait approach generally requires knowing the target type at
compile-time or paying dynamic function calls, but my understanding is
that iosys exists because you might not know which variant you want at
compile-time.

Perhaps we need an

	enum Iosys {
	    SystemMemory(...),
	    DmaMemory(...),
	}

and implement Io for Iosys in terms of the inner types.

Alice
