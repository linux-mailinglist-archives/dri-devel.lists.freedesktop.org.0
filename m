Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189AB518C5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 16:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A11610E0CC;
	Wed, 10 Sep 2025 14:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TuiKFF0x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAE210E0CC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 14:04:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CDD87405BF;
 Wed, 10 Sep 2025 14:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3187EC4CEEB;
 Wed, 10 Sep 2025 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757513082;
 bh=ATU9dgy3b9wKc6pd3WupmwqCzZ6dSzE/gRNOxa3liac=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TuiKFF0xpk3X+MqrLNA03Tjd1x7v08zWrg8CB705EqXfVLqhv1ZU2Ln5ps8FJ2urP
 AGqAFuOSOGb8STcC55uqzD0UIEP8JWC/4CLb0P9N4aclCYyrn/OOZ1+hp60YOkTgSc
 TUlKmrIHN8yMXDvlcoqzaiPUONcGjDxGuWRYU68yjidvQ6tGir9Xik11UVsvZ+BJMK
 szC/U6TDZjv2hd7VhHMac5tpyicmF9Tokzf+TpT2+cf+4xfrcJS/MU3A/lYOvyavBR
 7Y4Tpy6PRR8/1fmo6FU0C7WmwADq3pTv72jCG4gaLLFTvKOeEd8jkkEZ2yP3TWs3Vs
 +ZEYZO68uYkbg==
Message-ID: <b44ca395-102e-4780-949d-9d656ba18ec0@kernel.org>
Date: Wed, 10 Sep 2025 16:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: drm: Introduce the Tyr driver for Arm Mali GPUs
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>,
 Steven Price <steven.price@arm.com>, Jeffrey Vander Stoep
 <jeffv@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
References: <20250910-tyr-v3-1-dba3bc2ae623@collabora.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250910-tyr-v3-1-dba3bc2ae623@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 9/10/25 3:51 PM, Daniel Almeida wrote:
> diff --git a/drivers/gpu/drm/tyr/Kconfig b/drivers/gpu/drm/tyr/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..de910b2cba3a48e0b238eb0f66279758c02dfb6f
> --- /dev/null
> +++ b/drivers/gpu/drm/tyr/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +config DRM_TYR
> +	tristate "Tyr (Rust DRM support for ARM Mali CSF-based GPUs)"
> +	depends on DRM=y
> +	depends on RUST
> +	depends on ARM || ARM64 || COMPILE_TEST
> +	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE

For the Nova drivers I did add

	default n

as long as the driver is work in progress.

> +	help
> +	  Rust DRM driver for ARM Mali CSF-based GPUs.
> +
> +	  This driver is for Mali (or Immortalis) Valhall Gxxx GPUs.
> +
> +	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
> +	  be supported with the panfrost driver as they are not CSF GPUs.
> +
> +	  if M is selected, the module will be called tyr.

I also did add

	This driver is work in progress and may not be functional.

to make it clear what people will get.
