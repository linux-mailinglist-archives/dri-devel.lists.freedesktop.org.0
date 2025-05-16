Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137D0AB9BB2
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 14:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E011410EA7A;
	Fri, 16 May 2025 12:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JWBRPaQc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C2310E033;
 Fri, 16 May 2025 12:14:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D8FD844874;
 Fri, 16 May 2025 12:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D07C4CEE4;
 Fri, 16 May 2025 12:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747397642;
 bh=l0eKWla4Ve3xFHCq34yr+gQ3U6VR2dIwm5VdL5/Mo3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JWBRPaQckf2fwpuqhBvYNiyD0sGG/KsTdE2FEkybtywn7sN588dftgBncSwZFoij9
 v1bjmnDG+RycQe3ZKwauQyuYf6kVQa3RQ1/MDSVrU510eIJxPlAsJKVSWcrP08iVCj
 WFi9sJ8uGR9HRoz5o4JUG2FawrVZGdLVCaCYYfdbjcVZIUJnrT/olpna8o4e3sbF7B
 gqMjbdfpm+1w4/l0i11jHc2/pfiMeqhFxDvYy9UE36e4bLqkXNlQ1Vij6KiwLuI4Sh
 42P6xa4FIQR2GUorQ27C2tpHE4WkBMSP/dZZkcEIMGn80TFBpiumRNdFh0aEsKhSO3
 D/U6OufZSLmQw==
Date: Fri, 16 May 2025 14:13:56 +0200
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 0/3] rust: select AUXILIARY_BUS instead of depending
 on it
Message-ID: <aCcsBIOJHr-hq4Wg@pollux>
References: <20250515-aux_bus-v2-0-47c70f96ae9b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-aux_bus-v2-0-47c70f96ae9b@nvidia.com>
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

On Thu, May 15, 2025 at 05:23:17PM +0900, Alexandre Courbot wrote:
> I noticed this after trying to understand why my minimal Nova defconfig
> was not selecting NOVA_CORE anymore and why I couldn't even find it in
> menuconfig.
> 
> CONFIG_AUXILIARY_BUS cannot be enabled directly and must be selected by
> another module. Options that depend on it thus cannot be enabled unless
> a different module selecting AUXILIARY_BUS is also enabled.
> 
> All non-Rust modules using CONFIG_AUXILIARY_BUS select it, so it should
> make sense for the Rust ones to use that scheme as well.

Applied to nova-next, thanks!
