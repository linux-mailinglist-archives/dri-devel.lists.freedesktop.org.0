Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F8FAA4868
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 12:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1E110E325;
	Wed, 30 Apr 2025 10:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="owBorUhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F8810E0C1;
 Wed, 30 Apr 2025 10:32:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A8CA2445A9;
 Wed, 30 Apr 2025 10:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC66C4CEEA;
 Wed, 30 Apr 2025 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746009160;
 bh=o+S1aIP7xzbJyrhAIC/cn6ntSs0hD4BPJIGQKZt97QA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=owBorUhSaii7VmgJCrYuG9Fv/vFiEpeulZVWmpn2SI2y9kgzM1m372LoLJCviqERr
 7yavPWj1x247McK+IFtM7vLr01D0aKar6Nd40qUcxSZ4xWPs1i3ab6mveT2p8wTlIX
 uBidLfXY+pY09ClJ1FvUJczfR7V82b5Anq91hcoO6lAiw3dcVPIXxr01wuALpPRWMt
 sf9YBXQ8kq8OmxUWxMsGghoFmwaQWhdEGbw7PCK3KOl2K8fEUfVcu7yEyJxnFWg7+c
 KoCuEnXVWgjuLxN5qQRGU27IRSVQPGiJEFNx6885EFsSgr0KhU8295ww/87nLd1n0V
 futn8s4BTlWJw==
Date: Wed, 30 Apr 2025 12:32:33 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
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
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 11/16] gpu: nova-core: add falcon register definitions
 and base code
Message-ID: <aBH8QUwxabyo-oqm@pollux>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-11-ecd1cca23963@nvidia.com>
 <aAerWF9j5d01pQv0@cassiopeiae>
 <C4F54820-4FCE-4096-B341-DB9AB667D0B8@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C4F54820-4FCE-4096-B341-DB9AB667D0B8@nvidia.com>
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

On Wed, Apr 30, 2025 at 06:58:44AM +0000, Joel Fernandes wrote:
> > On Apr 22, 2025, at 10:45 AM, Danilo Krummrich <dakr@kernel.org> wrote:
> 
> > [1] https://play.rust-lang.org/?version=stable&mode=debug&edition=2024&gist=bf7035a07e79a4047fb6834eac03a9f2
> 
> I am still researching this idea from a rust point of view, but quick question - will this even work if the chip type (GAxxx) is determined at runtime? That does need runtime polymorphism.

I exetended the example in [2] to address this with `enum HalImpl<E: Engine>`
and a second architecture that is picked randomly. It needs match for every
access, but that's probably still better than the dynamic dispatch.

[2] https://play.rust-lang.org/?version=stable&mode=debug&edition=2024&gist=99ce0f12542488f78e35356c99a1e23f
