Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC64AFEB34
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 16:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBC810E7F2;
	Wed,  9 Jul 2025 14:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iWAUgoEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801D310E7F2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 14:07:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB4975C67F0;
 Wed,  9 Jul 2025 14:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58832C4CEEF;
 Wed,  9 Jul 2025 14:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752070057;
 bh=Hm0bvF4DG4aG9LPmmsB2p15ILEZrzXfJImhqafJXnvY=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=iWAUgoEqjEQTQxZ36FcfbNFyFBVPNRA0D0JV+LccBOTVsCmu7JPvn/T8KCAllMK3m
 yxju8s4XhSpqboQ/ABUZU+sab5Sb9ZxwKjOPw0rMfPYjtgjoZYqhGJD7h7xPmOCk9F
 Q1eYDiHJ2Ck79lP1kalRvdLJAKjet2cN6wCrPYIG/feNTDBTuE9gBM7vk5Cl2+1ozD
 RSTRZGDDzDNMvJQdq++DOftuR0Ogn7QN5mmLbialUbGcKiRkAlsaVr66mYquIiKFAi
 pwcJA55gOMdV0+k/FI3k35OSsx2Vja23RzsrNV4BcLKC0bvdRt1UliBpANh/pnyf5I
 oTE0RvvJbcFzg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 16:07:30 +0200
Message-Id: <DB7KZXKOP5F0.1RMMCBJNR43KO@kernel.org>
Subject: Re: [PATCH] drm: rust: rename Device::as_ref() to Device::from_raw()
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Thomas Gleixner" <tglx@linutronix.de>, "Peter
 Zijlstra" <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Bjorn Helgaas"
 <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <netdev@vger.kernel.org>, <linux-pci@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250709-device-as-ref-v1-1-ebf7059ffa9c@google.com>
In-Reply-To: <20250709-device-as-ref-v1-1-ebf7059ffa9c@google.com>
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

On Wed Jul 9, 2025 at 3:53 PM CEST, Alice Ryhl wrote:
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
> Link: https://lore.kernel.org/r/aCZYcs6Aj-cz81qs@pollux

I think the link you actually wanted to refer to is probably [1]. :)

[1] https://lore.kernel.org/all/aCd8D5IA0RXZvtcv@pollux/

> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Can you please split this patch up in one for the DRM renames, i.e. drm::De=
vice,
gem::Object and drm::File, and one for device::Device?
