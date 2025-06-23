Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4307AAE4932
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 17:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFCB10E3F0;
	Mon, 23 Jun 2025 15:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="llcJ8Bg1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E749710E3E9;
 Mon, 23 Jun 2025 15:49:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22EA95C5F28;
 Mon, 23 Jun 2025 15:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA41C4CEEA;
 Mon, 23 Jun 2025 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750693791;
 bh=p5jsOelRBofIlMfVGe6HPkogI/0BxX7s0UubjR2mgu0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=llcJ8Bg1Cy/Z3eqrc0ESCpAK6W+TzwQFUwZDST71d97WHXB8iMvahuHygI4DiYht4
 LkBSWHEx2Q9wMbqJK1bNcNzCf7QJzn9P7LP4grCL6fSRx4Vn479snBGRk5ioartO/3
 HKHSYhoccEVZ2rsjfzr8QoIHVHhashvSQ2kD4OddIO1d+vR0rT586WR/MCpwpgAKbu
 GbsG715t+DqU+8LvhGKySzpntlEM6czIP4kQDWsbnt3np50GrCXJq1h+NlXgU8jnZP
 dZY+S+GCIZhf9xqDclY9Ur/Cjr3sCvOdMdlo46DEjDpl2g+xyiNh/atpzhWWAv3C0i
 TbeXVQzslIW9Q==
Date: Mon, 23 Jun 2025 17:49:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Benno Lossin <lossin@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 02/24] rust: dma: expose the count and size of
 CoherentAllocation
Message-ID: <aFl3mE-i_FInwJK5@cassiopeiae>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
 <20250619-nova-frts-v6-2-ecf41ef99252@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-nova-frts-v6-2-ecf41ef99252@nvidia.com>
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

On Thu, Jun 19, 2025 at 10:23:46PM +0900, Alexandre Courbot wrote:
> These properties are very useful to have (and to be used by nova-core)
> and should be accessible.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to alloc-next, thanks!

  [ Slightly extend the commit message. - Danilo ]
