Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CADAB55AA
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 15:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E361D10E3A3;
	Tue, 13 May 2025 13:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YxlRHcBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EE010E3A3;
 Tue, 13 May 2025 13:11:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 68EACA4CC8E;
 Tue, 13 May 2025 13:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148CBC4CEE4;
 Tue, 13 May 2025 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747141862;
 bh=gKhlhLz8On/I4blpj1Xo3XEfw/VwE1nkBsqpbi+0TmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YxlRHcBdIyTjITqhshYiFpQXnErtT8W0x9QfgcocaaCo3KmngxVi2PXU3ae//Rjoh
 n4XkubZAQmTCqOZ45WiYdnv11SkVaD8EReCBBjhdAeVed0+ggtyM/eMMx7I7O6YZwC
 0roJwxFIGOud8lJxctuySPBSWWTOZpr76LQKKFxNeAou84cnhNOVJKKAH0+telo092
 sBi0KjRi4500jrLdmCQQPQiPSNXK+31H5gtWADb+Fm+ygH8whuP46M/dbSvAuRyZnw
 3wKeAbQFoyl7THTiqI57VDigZ26jxFa7EcQgfJTBB/rjbroheuwJo7tpThgRc9SlH2
 lZe92SOiaznnA==
Date: Tue, 13 May 2025 15:10:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
Subject: Re: [PATCH v3 00/19] nova-core: run FWSEC-FRTS to perform first
 stage of GSP initialization
Message-ID: <aCNE3uxeuc8TU45w@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
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

On Wed, May 07, 2025 at 10:52:27PM +0900, Alexandre Courbot wrote:
>       gpu: nova-core: derive useful traits for Chipset
>       gpu: nova-core: add missing GA100 definition
>       gpu: nova-core: take bound device in Gpu::new
>       gpu: nova-core: define registers layout using helper macro

    [ Fix typo in commit message. - Danilo ]

>       gpu: nova-core: fix layout of NV_PMC_BOOT_0

    [ Use Result from kernel::prelude. - Danilo ]

>       gpu: nova-core: move Firmware to firmware module

    [ Don't require a bound device, remove pub visibility from Firmware
      fields, use FIRMWARE_VERSION consistently. - Danilo ]

Applied the patches above to nova-next, thanks!
