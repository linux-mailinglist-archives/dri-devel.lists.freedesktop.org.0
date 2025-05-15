Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA31AB8FA4
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 21:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A8810E0EC;
	Thu, 15 May 2025 19:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P2jKAkYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D00A10E0EB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 19:05:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7C55CA4DFBE;
 Thu, 15 May 2025 19:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914ECC4CEE7;
 Thu, 15 May 2025 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747335912;
 bh=wn9/xjxTayOUOYmwhbUCTjFzR31JrxtMr60iStCwDdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P2jKAkYrdbP1ireKmr0EDd1VoCgYCkxv7y9Ue2gDbzq1DkwPbFJ8zJZTH33/ybHPI
 2Y0f/1eYU1lNfcchWBjFK7XSh5Mb556F9m5XLklAC++R0+Nb+HJfcMVwTK8RUko3JK
 ZbX4MmBeLy+qfMm1SFMJqOUZgfcZyFZGdVHkfP1hBmaQgeAfng9Kqe4kOXOHmGD3hF
 ezqOWB9Q2H8XnqFFdi3kRbLQYnOHbMdW39vNBQiH19QGbOdg7Bzf2keOLAB81B+fR8
 vzGQHrnpXPMnObTu3zNYFKdujZnu4HE0bkx+pKc9fE6YWgUaaH2tk3+wbng8HNVVYy
 Hz7Vq6qyDHsNw==
Date: Thu, 15 May 2025 21:05:04 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH 0/4] drm: Rust GEM bindings cleanup
Message-ID: <aCY64BWE_L1Udw-k@pollux>
References: <20250501183717.2058109-1-lyude@redhat.com>
 <aCY5T0B4GHAo6WK5@pollux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCY5T0B4GHAo6WK5@pollux>
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

On Thu, May 15, 2025 at 08:58:29PM +0200, Danilo Krummrich wrote:
> On Thu, May 01, 2025 at 02:33:15PM -0400, Lyude Paul wrote:
> > Just some patches to fix a handful of minor issues, some of which were already
> > mentioned on the mailing list. Some of these patches also make it just a
> > little bit easier to add the shmem bindings from Asahi in the future.
> 
> Applied to nova-next, thanks!

Of course I applied v2 [1]. :-)

[1] https://lore.kernel.org/dri-devel/20250513221046.903358-1-lyude@redhat.com/
