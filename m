Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4205BC226A6
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 22:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D839F10EA3C;
	Thu, 30 Oct 2025 21:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gj21ihIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2345D10E91C;
 Thu, 30 Oct 2025 21:27:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D51CB43EC6;
 Thu, 30 Oct 2025 21:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99C9C4CEF1;
 Thu, 30 Oct 2025 21:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761859672;
 bh=SVxofZBodQMq2edTAlTFELOdmGnbu0QYSQXYY2Xxvj4=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=gj21ihIpi0Frx5U2DXHXyw0i1BL8GIMyFNGu7SLPiUEQ6giI8X/bCxKhW1d9XjijV
 us2VQd/o1fhWhogEQdaPAxl0q7Y3G3TkaRGx9H0GwbAlWQ+UFBXxkmbQMfBxdyG66m
 vQJsQBcqwLjQACSBzNWK3dDxEZ1SNeU9PeaEb6d0udOzREGhhUdHEoN7Shi1sp53LF
 Ob0Aw/hQxa9GZSfrnpnUSUZIbEv3Q7jIyFFqwrt33vyapJaSJqiU8jE54EvTS0GHUQ
 hgKKXTrJH5Rt+tY6g2bkpT+boKLByo1R+pokToyeQ7RfbDPwI38X86n48Nu9Hz+Kqv
 w/Fb3sbEMq61Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 22:27:46 +0100
Message-Id: <DDVZ4L08QMIR.GFMG544BYQEO@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH RFC 3/4] rust: drm: Add DRM buddy allocator bindings
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "David Airlie" <airlied@gmail.com>,
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-4-joelagnelf@nvidia.com>
In-Reply-To: <20251030190613.1224287-4-joelagnelf@nvidia.com>
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

On Thu Oct 30, 2025 at 8:06 PM CET, Joel Fernandes wrote:
> +    ///
> +    /// Returns an [`AllocatedBlocks`] structure that owns the allocated=
 blocks and automatically
> +    /// frees them when dropped. Allocation of `list_head` uses the `gfp=
` flags passed.
> +    pub fn alloc_blocks(
> +        &self,
> +        start: usize,
> +        end: usize,
> +        size: usize,
> +        min_block_size: usize,
> +        flags: BuddyFlags,
> +        gfp: Flags,
> +    ) -> Result<AllocatedBlocks<'_>> {
> +        // Allocate list_head on the heap.
> +        let mut list_head =3D KBox::new(bindings::list_head::default(), =
gfp)?;
> +
> +        // SAFETY: list_head is valid and heap-allocated.
> +        unsafe {
> +            bindings::INIT_LIST_HEAD(&mut *list_head as *mut _);
> +        }

Not a full review, but a quick drive-by comment:

bindings::list_head has to be pinned in memory it should be

	let list_head =3D KBox::pin_init(Opaque::ffi_init(|slot: *mut bindings::li=
st_head| {
	    // SAFETY: `slot` is a valid pointer to uninitialized memory.
	    unsafe { bindings::INIT_LIST_HEAD(slot) };
	}), gfp)?;

if you're doing it by hand, but as mentioned in a previous patch, I think i=
t
would be nice to have a transparent wrapper type, CListHead, for this.
