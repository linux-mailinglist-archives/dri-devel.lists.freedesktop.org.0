Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425E4B0174F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 11:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F6210E9ED;
	Fri, 11 Jul 2025 09:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tzNNTJ5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715DF10E9F0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:11:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 418EE5C7002;
 Fri, 11 Jul 2025 09:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D423EC4CEED;
 Fri, 11 Jul 2025 09:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752225075;
 bh=0nbohhXXJ5N3VvNtfOJEvo9EoQefvFRhKbjpAeYezH4=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=tzNNTJ5Y6XPI6v0D/HYxdnyjHHMcK4iE4HM0rsI3BsOC+YB5C40zGOLsmQ4cRjsLk
 pLtDcB7d0VsC1BGDxkeoKg/3f5XME8HXl66unVghLyFVan/90rhptQbURPN3EGTljB
 Cigp8TjQ1x9d3mIyVFhdfNHXxVv/qXXFNnihyzSgPmNXMBH0DXoiI+b4CAYuxiG3VX
 Z313gAOeeRL5rKCcUcYAuY7NWyECSn9sV4YWgZcB47j3nTL4Ia9sXY2PCVxsiAheRz
 kqJgC+Mxqa5OgVoq3UDK96M6bcF76NUeSDkK9s3nkzowv5ayABRJuybkq9HcenQh6y
 tP0AgCDwEIpdA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 11:11:09 +0200
Message-Id: <DB93Y46GKRRM.P22144H9APXG@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Peter Zijlstra"
 <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Bjorn Helgaas"
 <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <netdev@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] device: rust: rename Device::as_ref() to
 Device::from_raw()
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250711-device-as-ref-v2-0-1b16ab6402d7@google.com>
 <20250711-device-as-ref-v2-1-1b16ab6402d7@google.com>
In-Reply-To: <20250711-device-as-ref-v2-1-1b16ab6402d7@google.com>
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

On Fri Jul 11, 2025 at 10:04 AM CEST, Alice Ryhl wrote:
> The prefix as_* should not be used for a constructor. Constructors
> usually use the prefix from_* instead.
>
> Some prior art in the stdlib: Box::from_raw, CString::from_raw,
> Rc::from_raw, Arc::from_raw, Waker::from_raw, File::from_raw_fd.
>
> There is also prior art in the kernel crate: cpufreq::Policy::from_raw,
> fs::File::from_raw_file, Kuid::from_raw, ARef::from_raw,
> SeqFile::from_raw, VmaNew::from_raw, Io::from_raw.
>
> Link: https://lore.kernel.org/r/aCd8D5IA0RXZvtcv@pollux
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/auxiliary.rs  | 2 +-
>  rust/kernel/cpu.rs        | 2 +-
>  rust/kernel/device.rs     | 6 +++---
>  rust/kernel/drm/device.rs | 2 +-
>  rust/kernel/faux.rs       | 2 +-
>  rust/kernel/miscdevice.rs | 2 +-
>  rust/kernel/net/phy.rs    | 2 +-
>  rust/kernel/pci.rs        | 2 +-
>  rust/kernel/platform.rs   | 2 +-
>  9 files changed, 11 insertions(+), 11 deletions(-)
