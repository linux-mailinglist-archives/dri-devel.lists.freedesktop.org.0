Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C051AB36C1
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87AB10E187;
	Mon, 12 May 2025 12:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VtjcylKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4190E10E187
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:11:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD09A5C5E0C;
 Mon, 12 May 2025 12:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE28C4CEE7;
 Mon, 12 May 2025 12:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747051877;
 bh=q4eRIz5gjXM2GQAmWEtAt6syFIFK0R9/zFDd8CK/zSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VtjcylKgCfJVGwLxr5DduPtm+LTwhyW5vbUN1WdXNJJ9oSs4QkdwiCdC7yuteFaQQ
 jMptnxTZMrJp2gCXJZndOy974mnpEw0HaIBeDTVnQHFTaxZWqxR087IuivVPV9ezp3
 +Xa1P1Zpwb0Bk4ZxLXJFbTuCYDjofpESMJ6P4oGlFKRZvIaiMWgLfregK6xeuhPvgO
 I6ng0l1uEwbS6tL2mJaHEEOsFQeNW1a/Oy47NEXB9/ociSi7bUexZkEML1InhNx+pk
 +tjPPpB8HQ2XfJGoIrtao/kJiYVQR9s2mRU4XwhkWUigiYU4OErC9vx6Cpb3hVXPkX
 sC2IXHrZ3SlXw==
Date: Mon, 12 May 2025 14:11:11 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH 1/4] rust: drm: gem: Use NonNull for Object::dev
Message-ID: <aCHlX4-DSYPuJv_Z@pollux>
References: <20250501183717.2058109-1-lyude@redhat.com>
 <20250501183717.2058109-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501183717.2058109-2-lyude@redhat.com>
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

On Thu, May 01, 2025 at 02:33:16PM -0400, Lyude Paul wrote:
> There is usually not much of a reason to use a raw pointer in a data
> struct, so move this to NonNull instead.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
