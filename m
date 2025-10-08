Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B0CBC5806
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 17:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D2310E83F;
	Wed,  8 Oct 2025 15:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="izyx4qeJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E92710E84B;
 Wed,  8 Oct 2025 15:00:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AAC2A61F91;
 Wed,  8 Oct 2025 15:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45284C4CEE7;
 Wed,  8 Oct 2025 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759935608;
 bh=Zq4M4h4026xT+BGlmoGtIh/JGWUmGo07HG7ivwnX4b0=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=izyx4qeJQb2C5pEgtTwRd/dt0xDjWrxPxH8kFxMtHeiiYKekpB8WovdQserdiWVhd
 WOo8964xcCQppMRCby6GiMdy3k/9W9KueVb4PjVc0TbTV2r2qhay+jSZxbQPEUQEXt
 BNeKJsyP43lV8j6MTXpe7eNCCLDDdNYQW2MmEfDDNcS3Rml/gQ9ej2+1l+mP/iyCDf
 hweGdyr1kKNpG9WbuhWi+TMj7zOmro6ptx9WXG/Hs1/oxvFcdKaGVC9W9zScrvfgjw
 W3gzBvZLqQbJHyqegaPD1TBtEpyUSdM5DWxRWfath0BAxZ46fkIvwfiikI5d2S+GXB
 mNg8GebtPo/cQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Oct 2025 17:00:01 +0200
Message-Id: <DDD13PUEPSZO.ALDND33ZFFC7@kernel.org>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, <nouveau@lists.freedesktop.org>
To: "Yury Norov" <yury.norov@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <DDC49ZIRX79X.2Q4KW0UY7WUF3@kernel.org>
 <faa99188-7ccb-4c7c-b705-3a207f5acd17@nvidia.com>
 <DDCFLM3P5MCC.NEBRVTU7X2G3@kernel.org> <aOZ0_7YQw81lyMWt@yury>
In-Reply-To: <aOZ0_7YQw81lyMWt@yury>
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

On Wed Oct 8, 2025 at 4:28 PM CEST, Yury Norov wrote:
> On Wed, Oct 08, 2025 at 12:08:59AM +0200, Danilo Krummrich wrote:
>
>> Regarding the bitfields for page table management: Are we
>> sure that we can use raw bitfields for this?
>
> As per my current understanding we can't. Bitfields are not suitable for
> direct I/O and considered as a data storage. In the current scheme:
>
>         regs::NV_PFALCON_FALCON_DMATRFBASE::default()
>             .set_base((dma_start >> 8) as u32)
>             .write(bar, &E::ID);
>
> we account for endianess in the .write() method, which would be a part
> of register API, not bitfields.

I know, I proposed this register API design about a year ago, and Alex came=
 up
with an awesome implementation for it. :)

And yes, your understanding is correct, the idea is that the I/O backend th=
at
knows about the underlying bus, etc. takes care of the endianess.

However, we might still be able to use bitfields natively for page table
management structures: In [1] I asked for the NV_PMC_BOOT_1 register, which
might provide some endianess switch to ensure that we always match CPU
endianess.

> FYI: ARM64 is in process of dropping BE, and Linus announced the end
> of BE support for RISC-V:

Yeah, I'm aware of the thread. Also note that for RISC-V it was also clarif=
ied
that if it turns out that BE for RISC-V becomes relevant it would also find=
 its
way into the kernel. If that's likely is of course a different question.

However, there are still architectures such as s390x that could be supporte=
d.

So, long story short, my question from above is more meant to challenge if =
we
can really always guarantee that CPU and GPU endianess match for nova-core.

[1] https://lore.kernel.org/lkml/DDCV84IJHUML.126CB1CT0XMX5@kernel.org/
