Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0B6B54515
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 10:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6CE10E185;
	Fri, 12 Sep 2025 08:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jGFVgYUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5B910E185
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:20:21 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b0438a5f20fso131742366b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757665219; x=1758270019;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=htk3m70PkqmNQYQ1yM5F8kN8JeFHH68mo4wtDzJpwoU=;
 b=jGFVgYUGj5sMRJhsgVnml20x+rHjv8LeAGVrO25FGdBsH2+hodYnmXFfx2H2p8tJFI
 HB+8G5flPd+Tx3dxISijNo7UGD/I+VsqSc2ii1975tFWjxPw+J8MpvPDz25qLQoqYobh
 moH6IxlTMrWD6QmcIcWWf4hkodt+52XvnAoBrGfNTxKIuwj5AwhChqPNKlvy2ES9mLT5
 XuSjHKh1HSJ6WruHbv4vkw56wpTiFWdZ8tLPgzJKpRTEWgNg6XjJPhoqb79Hv4lT4qZ8
 8ST+2ZylWbxMI6BmlrPh6977zw2i5Q+7lmgpQtty5OpGSaoIqC7E0Ot8e/0ym1x00zuV
 D3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757665219; x=1758270019;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=htk3m70PkqmNQYQ1yM5F8kN8JeFHH68mo4wtDzJpwoU=;
 b=f4vxUxY0u0XArTI51sLDL7U36PWKK5mZgpzI+nDcxCW8xI31AvXGaws9xzwxoYQzur
 VXidWYAeGCIoRKIcYaR112nRdnA4Ahbu+XUVBAp8AQYPLhet/kz51vo/pnl0lhsUKUbP
 kSdz9KLU5MkDmSLv+aO0tolXCD3QNw2aE3XIxpgV6zEU2zyBICdiVb3WiPe+p27Hlids
 yKuyqWXqd8w8F3b/lHFU0dDc5zv8/1QkV2nhLnPQ3Ilse6VLjBEQwiSEfxnrCuBDZccr
 mHEUpzC8iUu177FcL51V4amyOaA4AQsxpx+DxWQsaJ1H/8Sof/f/ucbklntHLfr/VdNq
 6fgA==
X-Gm-Message-State: AOJu0Yy9rjmZG86EfIVsDFT8HgeelOxpw045pgKwTDKjp1BoF48VGBSc
 SLa0/xTs8+T0assaC7EQjWGbQWTVOJl2cnLTi5yxctwzUirdytO6RTsIOrUnCmxHZ+GmDIDT9wp
 +s5ViGMz5woWft8Qvdg==
X-Google-Smtp-Source: AGHT+IGUMJAjpyCLFfDMgu2t5nhGP0t48j39Qyhwy6+dlmbmq8TAneB4QA7fEvHNFobhxTxMbIPzssYdjTCps3M=
X-Received: from ejej11.prod.google.com ([2002:a17:906:2a0b:b0:aff:53b:4790])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:980a:b0:b04:7ea3:a10c with SMTP id
 a640c23a62f3a-b07c3551576mr183083666b.8.1757665219559; 
 Fri, 12 Sep 2025 01:20:19 -0700 (PDT)
Date: Fri, 12 Sep 2025 08:20:18 +0000
In-Reply-To: <20250911230147.650077-4-lyude@redhat.com>
Mime-Version: 1.0
References: <20250911230147.650077-1-lyude@redhat.com>
 <20250911230147.650077-4-lyude@redhat.com>
Message-ID: <aMPXwhpskU1gWANU@google.com>
Subject: Re: [PATCH v4 3/3] rust: Add dma_buf stub bindings
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Tamir Duberstein <tamird@gmail.com>, Xiangfei Ding <dingxiangfei2009@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
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

On Thu, Sep 11, 2025 at 06:57:40PM -0400, Lyude Paul wrote:
> In order to implement the gem export callback, we need a type to represent
> struct dma_buf. So - this commit introduces a set of stub bindings for
> dma_buf. These bindings provide a ref-counted DmaBuf object, but don't
> currently implement any functionality for using the DmaBuf.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> 
> ---
> V3:
> * Rename as_ref() to from_raw()
> V4:
> * Add missing period to rustdoc at top of file
> 
>  rust/kernel/dma_buf.rs | 40 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs     |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 rust/kernel/dma_buf.rs
> 
> diff --git a/rust/kernel/dma_buf.rs b/rust/kernel/dma_buf.rs
> new file mode 100644
> index 0000000000000..50be3e4dd4098
> --- /dev/null
> +++ b/rust/kernel/dma_buf.rs
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! DMA buffer API.
> +//!
> +//! C header: [`include/linux/dma-buf.h`](srctree/include/linux/dma-buf.h)
> +
> +use bindings;
> +use kernel::types::*;
> +
> +/// A DMA buffer object.
> +///
> +/// # Invariants
> +///
> +/// The data layout of this type is equivalent to that of `struct dma_buf`.

I can already deduce that from the fact that it's a repr(transparent)
wrapper around Opaque<bindings::dma_buf>. Invariants should provide
*additional* guarantees that can't be deduced just from the declaration.

I would reword this to say that it contains a valid dma_buf rather than
speaking about the layout.

> +#[repr(transparent)]
> +pub struct DmaBuf(Opaque<bindings::dma_buf>);
> +
> +// SAFETY: `struct dma_buf` is thread-safe
> +unsafe impl Send for DmaBuf {}
> +// SAFETY: `struct dma_buf` is thread-safe
> +unsafe impl Sync for DmaBuf {}
> +
> +#[expect(unused)]

By making these methods pub, you don't need this #[expect].

> +impl DmaBuf {
> +    /// Convert from a `*mut bindings::dma_buf` to a [`DmaBuf`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller guarantees that `self_ptr` points to a valid initialized `struct dma_buf` for the
> +    /// duration of the lifetime of `'a`, and promises to not violate rust's data aliasing rules
> +    /// using the reference provided by this function.

I would just drop the sentence about the aliasing rules. If the caller
performs an unsafe operation on this DmaBuf, then the safety comment on
*that* unsafe operation should justify this - it's not needed here.

And if they violate the aliasing rules with a safe operation, then
probably that safe operation should be redesigned to prevent that,
rather than having a blanket statement here.

Alice
