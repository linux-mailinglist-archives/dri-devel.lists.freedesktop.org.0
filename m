Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27566C262BE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB6A10EBF1;
	Fri, 31 Oct 2025 16:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdszCMC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC3110EBF1;
 Fri, 31 Oct 2025 16:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761928951; x=1793464951;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y9SS1AanRaN3IJF7ZKQYXKyWoIq2zbJr960kdKeZFA0=;
 b=PdszCMC2qt3jCmf7kUyS4hb7MkPmXHrk8M4upGst64FrZtZG4ooT1mlr
 48z3iAS6ULKF0y5bMfgEA184lL3Ow+dCxW5ea9Wim/ae3DuNPdZbP+53J
 8cBAPNFbtyOrPZtpOAzlGfN/arf9++nn4wqMagEXa+vWNoqa8e1d8jOt0
 K2nrL3N0CWBDBDkKWhZqT5uk7GT7xY9pzP1uO7hggUR6oX/MAxKnywyno
 S9fwf5359Cr8eyOGrcXXJkKpf+z+Qnti6mTFm+mxuOgeGBCrSPBltQFba
 E1PfMdt5gat+RVduz94L697C9eqWSI3zc4sVFIfEAndVPlCw3yc1/F/od Q==;
X-CSE-ConnectionGUID: fy2G5GTeQNad7g1ZQnZOEg==
X-CSE-MsgGUID: HOjIjhQqQxOKETaLEXKMPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="74386010"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="74386010"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:42:30 -0700
X-CSE-ConnectionGUID: BoHLWMZKSxalHKuavq7lIQ==
X-CSE-MsgGUID: JvpjFaUfTUCJl1yAWJcl3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="187016744"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.98])
 ([10.245.244.98])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:42:24 -0700
Message-ID: <79bbbd8b-e60b-435b-82b6-ea59230997e2@intel.com>
Date: Fri, 31 Oct 2025 16:42:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] samples: rust: Add sample demonstrating DRM buddy
 allocator
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, David Airlie <airlied@gmail.com>
Cc: acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-5-joelagnelf@nvidia.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251030190613.1224287-5-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 30/10/2025 19:06, Joel Fernandes wrote:
> Demonstrates usage of the DRM buddy allocator bindings through
> a simple test module that initializes the allocator, performs
> allocations, and prints information about the allocated blocks.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>   samples/rust/Kconfig           |  14 +++++
>   samples/rust/Makefile          |   1 +
>   samples/rust/rust_drm_buddy.rs | 106 +++++++++++++++++++++++++++++++++
>   3 files changed, 121 insertions(+)
>   create mode 100644 samples/rust/rust_drm_buddy.rs
> 
> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> index b45631e2593c..8ccb4064ba91 100644
> --- a/samples/rust/Kconfig
> +++ b/samples/rust/Kconfig
> @@ -21,6 +21,20 @@ config SAMPLE_RUST_CLIST
>   
>   	  If unsure, say N.
>   
> +config SAMPLE_RUST_DRM_BUDDY
> +	tristate "DRM buddy allocator sample"
> +	depends on DRM_BUDDY
> +	help
> +	  This option builds the Rust DRM buddy allocator sample.
> +
> +	  The sample demonstrates using the DRM buddy allocator bindings
> +	  to allocate and free memory blocks.
> +
> +	  To compile this as a module, choose M here:
> +	  the module will be called rust_drm_buddy.
> +
> +	  If unsure, say N.
> +
>   config SAMPLE_RUST_CONFIGFS
>   	tristate "Configfs sample"
>   	depends on CONFIGFS_FS
> diff --git a/samples/rust/Makefile b/samples/rust/Makefile
> index f8899c0df762..a56204ee4e96 100644
> --- a/samples/rust/Makefile
> +++ b/samples/rust/Makefile
> @@ -2,6 +2,7 @@
>   ccflags-y += -I$(src)				# needed for trace events
>   
>   obj-$(CONFIG_SAMPLE_RUST_CLIST)			+= rust_clist.o
> +obj-$(CONFIG_SAMPLE_RUST_DRM_BUDDY)		+= rust_drm_buddy.o
>   obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
>   obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE)		+= rust_misc_device.o
>   obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
> diff --git a/samples/rust/rust_drm_buddy.rs b/samples/rust/rust_drm_buddy.rs
> new file mode 100644
> index 000000000000..96907bc19243
> --- /dev/null
> +++ b/samples/rust/rust_drm_buddy.rs
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust DRM buddy allocator sample.
> +//!
> +//! This sample demonstrates using the DRM buddy allocator from Rust.
> +
> +use kernel::{
> +    drm::buddy::{
> +        BuddyFlags,
> +        DrmBuddy, //
> +    },
> +    prelude::*,
> +    sizes::*, //
> +};
> +
> +module! {
> +    type: RustDrmBuddySample,
> +    name: "rust_drm_buddy",
> +    authors: ["Joel Fernandes"],
> +    description: "DRM buddy allocator sample",
> +    license: "GPL",
> +}
> +
> +struct RustDrmBuddySample;
> +
> +impl kernel::Module for RustDrmBuddySample {
> +    fn init(_module: &'static ThisModule) -> Result<Self> {
> +        // Create a buddy allocator managing 1GB with 4KB chunks.
> +        let buddy = DrmBuddy::new(SZ_1G, SZ_4K)?;
> +
> +        pr_info!("=== Test 1: Single 16MB block ===\n");
> +        let allocated = buddy.alloc_blocks(
> +            0,
> +            0,

Does this map to the start/end? Surprised that this works with 
RANGE_ALLOCATION below. I guess it works because of the end-1, but I'm 
not sure if that was intended.

Anyway, probably you didn't really want RANGE_ALLOCATION here? That is 
only if you want something at a specific offset or within a special bias 
range. So here I think it will give you a massive bias range covering 
everything due to end-1, but all you wanted was any available 16M block, 
which is the typical flow? It still technically works, but looks a bit 
non-standard and will internally take the bias range path, which is not 
ideal :)

Also I guess worth updating the example in buddy.rs, which also does this?

> +            SZ_16M,
> +            SZ_4K,
> +            BuddyFlags::RANGE_ALLOCATION,
> +            GFP_KERNEL,
> +        )?;
> +
> +        let mut count = 0;
> +        for block in &allocated {
> +            pr_info!(
> +                "  Block {}: offset=0x{:x}, order={}, size={}\n",
> +                count,
> +                block.offset(),
> +                block.order(),
> +                block.size(&buddy)
> +            );
> +            count += 1;
> +        }
> +        pr_info!("  Total: {} blocks\n", count);
> +        drop(allocated);
> +
> +        pr_info!("=== Test 2: Three 4MB blocks ===\n");
> +        let allocated = buddy.alloc_blocks(
> +            0,
> +            0,
> +            SZ_4M * 3,
> +            SZ_4K,
> +            BuddyFlags::RANGE_ALLOCATION,
> +            GFP_KERNEL,
> +        )?;
> +
> +        count = 0;
> +        for block in &allocated {
> +            pr_info!(
> +                "  Block {}: offset=0x{:x}, order={}, size={}\n",
> +                count,
> +                block.offset(),
> +                block.order(),
> +                block.size(&buddy)
> +            );
> +            count += 1;
> +        }
> +        pr_info!("  Total: {} blocks\n", count);
> +        drop(allocated);
> +
> +        pr_info!("=== Test 3: Two 8MB blocks ===\n");
> +        let allocated = buddy.alloc_blocks(
> +            0,
> +            0,
> +            SZ_8M * 2,
> +            SZ_4K,
> +            BuddyFlags::RANGE_ALLOCATION,
> +            GFP_KERNEL,
> +        )?;
> +
> +        count = 0;
> +        for block in &allocated {
> +            pr_info!(
> +                "  Block {}: offset=0x{:x}, order={}, size={}\n",
> +                count,
> +                block.offset(),
> +                block.order(),
> +                block.size(&buddy)
> +            );
> +            count += 1;
> +        }
> +        pr_info!("  Total: {} blocks\n", count);
> +
> +        pr_info!("=== All tests passed! ===\n");
> +
> +        Ok(RustDrmBuddySample {})
> +    }
> +}

