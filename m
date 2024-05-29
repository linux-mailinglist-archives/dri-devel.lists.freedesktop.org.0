Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633708D2981
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 02:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC6910FB81;
	Wed, 29 May 2024 00:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="luue0b5U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CC11124A1;
 Wed, 29 May 2024 00:38:24 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6f91cb79ad7so136319b3a.3; 
 Tue, 28 May 2024 17:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716943104; x=1717547904; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=NXVj8Lz7S+dZA6aK/WZF+OYv3CYCpUwdY8awKL9dIMo=;
 b=luue0b5UXgzhwh+7mwG54x3uwK72QF/6tJa5xkrqvjKVgdLLaAqZkrpI/vnddurUZr
 L0rIrF1kmhGXMXTKJffCGt96y1lA23jkmfk4/7e7oRfLN49QL6i+xnuNN30kXPRmCPDc
 y3Umn97u8eZDmEKFi6lsS6ISUNKalocZVFgMnPi4Si+fI+GlT8g3Cf6nlNsYz1vDIIF3
 Tt0L7Q8NpxlkzxI8jvdMQo1RZMipf88Q2NsG7i69GawQwD3pH2i8JpRoh0P8wnyaulkq
 +0Q1YIw/KtMFng1xUj1ZOnh5gl99x2Py2o3eMXD/E04pLfS+I5vi2qPiMQ+neHDndRs+
 4e+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716943104; x=1717547904;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NXVj8Lz7S+dZA6aK/WZF+OYv3CYCpUwdY8awKL9dIMo=;
 b=TOpBrbqfQ00PYgWTRRgjKXF7sUlUoDOcduwWcgHrjtGokpfMsydHi2Hg0n1mrjaHKI
 RR/e/NIkLTUp5UxGuEXFKcI/mcayRzpc+MWEoLArrngpIYcm+A0hP9AwaGDiN4HFsk3A
 E/3O3W1dUB90tEsWeAq2lEfF+oqaa+KtQnHAhRsNaEMaflwc1lr52pYlmzsQ20a/i0DS
 fjzAEjuFWN6ArhrGLXAKMX6SeTPOVc/hqb7Cwbp7RjDg4vZdKSNSisowe4pB7+oihiYz
 D3BaUQ8bmFF2iOkl8fRLo6PDMupYUrDlvjvMwgtP9cwx6e+pL2Ap0C/3hAJl43BoBiRR
 p2+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk1goGJ7d6HSqUHhYfLcxxT1gOpnXJ18taJbPdnMR8Xwa6DLUtUEEcdTEpqRfE3dKC5Q1+XBWx4kF/TcL1BAwdXN6On9j9klaQm1lC/VG051rhM0cLMop4Vt8PH+YYvI4xsUXlKoxSWxboQq4nqQ==
X-Gm-Message-State: AOJu0YwTl59RfAyiA9AM+npVxSnqxODERXWDzf4t9lAlU5RczzmyxM+4
 0pQfLUa+Z8GNaKAn87Yhe65uHePw9qaIGu8WXChq1bLYlfLDMNjZ
X-Google-Smtp-Source: AGHT+IHnRbFd/HcZToBN+NtwDm3bF7eGrnVJi0st8rcdgnVNQz+KSvYbYCcRuBFxCw9yvzDZ1XumdA==
X-Received: by 2002:a05:6a00:38cc:b0:6ea:8604:cb1d with SMTP id
 d2e1a72fcca58-6f8f1a652eamr14543663b3a.0.1716943104282; 
 Tue, 28 May 2024 17:38:24 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp.
 [180.15.241.226]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fd4d51b9sm7001352b3a.188.2024.05.28.17.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 17:38:23 -0700 (PDT)
Date: Wed, 29 May 2024 09:38:07 +0900 (JST)
Message-Id: <20240529.093807.2141781600641468523.fujita.tomonori@gmail.com>
To: dakr@redhat.com
Cc: fujita.tomonori@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <ZlXLzCYiwdMxic3X@pollux>
References: <ZlTdh/eQAIhxNn9e@pollux.localdomain>
 <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
 <ZlXLzCYiwdMxic3X@pollux>
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

On Tue, 28 May 2024 14:19:24 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> On Tue, May 28, 2024 at 08:01:26PM +0900, FUJITA Tomonori wrote:
>> On Mon, 27 May 2024 21:22:47 +0200
>> Danilo Krummrich <dakr@redhat.com> wrote:
>> 
>> >> > +/// Abstraction around a C firmware struct.
>> >> > +///
>> >> > +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
>> >> > +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
>> >> > +/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
>> >> > +/// firmware is released once [`Firmware`] is dropped.
>> >> > +///
>> >> > +/// # Examples
>> >> > +///
>> >> > +/// ```
>> >> > +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
>> >> > +/// driver_load_firmware(fw.data());
>> >> > +/// ```
>> >> > +pub struct Firmware(Opaque<*const bindings::firmware>);
>> >> 
>> >> Wrapping a raw pointer is not the intended use of Qpaque type?
>> >> 
>> > 
>> > Indeed, will fix this in v2 and use NonNull instead. I'll also offload most of
>> > the boilerplate in the 'request' functions to some common 'request_internal' one.
>> 
>> You might need to add 'Invariants' comment on Firmware struct.
> 
> Which ones do you think should be documented?

Something like the comment for struct Page looks fine to me. But the
Rust reviewers might have a different opinion.

/// The pointer is valid, and has ownership over the page.
