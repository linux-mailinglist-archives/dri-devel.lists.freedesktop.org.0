Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30430C0CC9C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 10:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BF610E42F;
	Mon, 27 Oct 2025 09:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BTmPnrk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4111110E42B;
 Mon, 27 Oct 2025 09:56:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 325F46118B;
 Mon, 27 Oct 2025 09:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE62C4CEFF;
 Mon, 27 Oct 2025 09:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761559008;
 bh=Lxu5cscL1HwCBzlPnIr1BaQwvaRrU0uoXTu5LjXze2o=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=BTmPnrk79MH8XqKW5zleIBNMoiZ+DkrLxXgRoVKSk8GlvqP+QgS6PiCze6RdRBesb
 kXJZfDFiMQA4aL0u+6nB99Ro7nPXzm/fC+IFPzu8ELy8bBu9384TzYVCuLqP7o7ZIa
 EHm9srXvTGeIFfvlXaHyl14MK3KB86liYqmsclni6sL+QnKKyWxWfy9KccKAyMXZ0d
 4VpkCvtqtDWbtiKhX22Uu72chUrLISHb7dRMfBmNA9uDJj36tyXdgR3EpwGxkzOxb6
 BHPjvgXER+dkfuQaoJYMz57olyW2cj4Tp4pBXUxEbaEk3hc8sUmfADuM4U1M1b3mrw
 VeJ/Bsejy9Ilg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 10:56:41 +0100
Message-Id: <DDT0JTP91GO3.1EHF6L8MX4I3T@kernel.org>
To: "Beata Michalska" <beata.michalska@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, "Yury Norov" <yury.norov@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com> <aPklNydcTdOeXtdU@arm.com>
 <ACAA327A-AE2B-4D21-B8C5-C66BB5E09B7C@nvidia.com>
 <aPozw8TGp85YdmNU@arm.com>
 <47d6ab72-1526-457d-990a-928088ba7022@nvidia.com>
 <aP82DHvLC7zAEojN@arm.com>
In-Reply-To: <aP82DHvLC7zAEojN@arm.com>
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

On Mon Oct 27, 2025 at 10:06 AM CET, Beata Michalska wrote:
> It's more theoretical at this point, but there are drivers that do rely o=
n
> information from either DT or ACPI tables for the base address and size o=
f the
> MMIO region: anything that uses devm_platform_ioremap_resource() or
> devm_platform_ioremap_resource_byname() I guess.

Don't get confused, those are two different things: The size of the MMIO re=
gion
(or a PCI BAR) and the const SIZE generic in Io<SIZE> are two different thi=
ngs.

The former is the actual size of an MMIO region, whereas the latter is the
minimum size requested by a driver for proper operation.

For instance, let's assume your driver requests ten contiguous 32-bit regis=
ters
starting at offset zero of an MMIO region.

In this case you can call req.iomap_sized<0x28>(), because you know that yo=
ur
driver is not able to properly work without an MMIO region with at least a =
width
of 0x28 bytes.

The actual size of the MMIO region returned by req.iomap_sized<0x28>() may
indeed be smaller or larger than that, depending on what is defined in the =
DT,
ACPI or PCI BAR.

If smaller than the const SIZE generic, the call to req.iomap_sized<0x28>()=
 will
fail, otherwise it will be successful. The actual size of the MMIO region i=
s not
influenced by the const SIZE generic.
