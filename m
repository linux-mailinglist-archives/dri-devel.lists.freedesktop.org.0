Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC356A53E6D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE3510E869;
	Wed,  5 Mar 2025 23:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dZE6dXrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2194910E86A;
 Wed,  5 Mar 2025 23:27:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 45632A46212;
 Wed,  5 Mar 2025 23:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D172EC4CEE7;
 Wed,  5 Mar 2025 23:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741217235;
 bh=4fh6Y0LoqV2EukUiCVG7hWelHTK03gMvl8F2X28vwI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dZE6dXrwe10pt4rZ14rgh49zXXInCwjXV0e8Ct77UHguHJF31XXuPjDLkMLQJ+Xzw
 4xehMU9SmUNLkM9hkGCKxaGzocL/CcRQyu55aWjy2rEbCAVhW8RV3KC6DEb69PFaIO
 54Nq5LE4gGBRzlU7f0FHbnmAECHtzp6fZYS87MMqeQ6NW/HOPAM8bkHGh0Mu2EhbeW
 1zLzft747iBe/SNvEBy1BlqblZN8f97rrAVUiXGfhO07Sq6fSfWng0C0B8kSPKLVTs
 qBOT2pHthRv8TOM4+FmAbokSW1K5G/7mNnw9eg34TKHeeVn6P4v6GxBbWAzeV9IdX4
 CqF+s+AZiXPbA==
Date: Wed, 5 Mar 2025 15:27:13 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, russ.weight@linux.dev, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, airlied@gmail.com,
 simona@ffwll.ch, corbet@lwn.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ajanulgu@redhat.com,
 lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com,
 cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
 acurrid@nvidia.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Initial Nova Core series
Message-ID: <Z8jd0evXjJtz1CRB@bombadil.infradead.org>
References: <20250304173555.2496-1-dakr@kernel.org>
 <Z8isev0gwQJPs7S9@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8isev0gwQJPs7S9@cassiopeiae>
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

On Wed, Mar 05, 2025 at 08:56:42PM +0100, Danilo Krummrich wrote:
> On Tue, Mar 04, 2025 at 06:34:47PM +0100, Danilo Krummrich wrote:
> > Danilo Krummrich (5):
> >   rust: module: add type `LocalModule`
> >   rust: firmware: introduce `firmware::ModInfoBuilder`
> >   rust: firmware: add `module_firmware!` macro
> 
> Greg, Luis, Russ, any objections on me taking the two firmware patches through
> the nova tree?

I don't speak Rust so I'd my recommendation would be to add the rust
firmware file under the firmware loader entry for maintainers provided
we get a volunteer from the rust community do help maintain *both* C and
the Rust version of the firmware loader.

  Luis
