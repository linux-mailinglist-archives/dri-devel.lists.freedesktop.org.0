Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AE1A2DECE
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 16:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E2610E33D;
	Sun,  9 Feb 2025 15:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bQCOPtRf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C7D10E159;
 Sun,  9 Feb 2025 15:25:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5210FA40112;
 Sun,  9 Feb 2025 15:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BC4C4CEDD;
 Sun,  9 Feb 2025 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739114742;
 bh=08BrRKWgQML+UNiNXbeO8F7nrxKLc4CHz5eh3WB8g90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQCOPtRfxGN/3v85mUwUDJPp6hMstWFO7ZI3WDn3Uvq1p2/VX7iCPexYvMRu21NgN
 MVYs0JPZIStgMCmN86KZkwLYwTSJpjRavn+2qbB94B+bOVisrHlu/dzumsq+wwRpPJ
 jBrEtp/Jms9M9i2oEBT9zvXYU1rX84o2Bh4YhKtAZEAtiPSXXsZD/QJN0xho50hT39
 2qDjFRChq33COuPfXCQ5qyywOc3/DnFBcT7Gm9o8kDAmEOpLuhmfLc58MktZ85F0d0
 PaPiG5Oyf6XqlJ1o0R9uMx7pk/E3e53xlgZAfMrwbWYdO2g0Y4XvqJfdRc/d6iKU9y
 ImpE0tH4n5uGw==
Date: Sun, 9 Feb 2025 16:25:33 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Zhi Wang <zhiw@nvidia.com>, airlied@gmail.com, simona@ffwll.ch,
 corbet@lwn.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ajanulgu@redhat.com,
 lyude@redhat.com, pstanner@redhat.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add initial documentation
Message-ID: <Z6jI7cKZQe2gyM_v@pollux>
References: <20250204190400.2550-1-dakr@kernel.org>
 <20250204190400.2550-2-dakr@kernel.org>
 <20250205155646.00003c2f@nvidia.com>
 <D7M2HTWHNGEZ.10FM642ZMX1PX@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7M2HTWHNGEZ.10FM642ZMX1PX@nvidia.com>
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

On Fri, Feb 07, 2025 at 05:23:37PM +0900, Alexandre Courbot wrote:
> On Wed Feb 5, 2025 at 10:56 PM JST, Zhi Wang wrote:
> > On Tue,  4 Feb 2025 20:03:12 +0100
> > Danilo Krummrich <dakr@kernel.org> wrote:
> >> +  regressions with all 2nd level drivers.
> >> diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
> >> new file mode 100644
> >> index 000000000000..5e66ec35c5e3
> >> --- /dev/null
> >> +++ b/Documentation/gpu/nova/core/todo.rst
> >> @@ -0,0 +1,445 @@
> >> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +
> >> +=========
> >> +Task List
> >> +=========
> >> +
> >
> > ...
> >
> >> +
> >> +Generic register abstraction
> >> +----------------------------
> >> +
> >> +Work out how register constants and structures can be automatically generated
> >> +through generalized macros.
> >> +
> >> +Example:
> >> +
> >> +.. code-block:: rust
> >> +
> >> +	register!(BOOT0, 0x0, u32, pci::Bar<SIZE>, Fields [
> >> +	   MINOR_REVISION(3:0, RO),
> >> +	   MAJOR_REVISION(7:4, RO),
> >> +	   REVISION(7:0, RO), // Virtual register combining major and minor rev.
> >> +	])
> >> +
> >
> > I think it is better not to tie this to pci::Bar and its operations. It
> > would be better to have a intermediate container as the macro param. The
> > container holds the register region vaddr pointer, size, read/write traits.
> > The macro expands it from there, thus, we can also use this on firmware
> > memory structures, e.g. GSP WPR2 info.
> 
> Another reason for not tying this to a particular bus is that Tegra
> doesn't use PCI to reach the registers of its integrated GPU. Maybe we
> can remove that parameter from the register!() macro and have read()
> take a generic argument for its `bar` parameter instead, so that method
> gets automatically specialized for every type of bus we need to use?

This is just an example, I do not mean to tie this to the PCI bus. But rather
make it generic, such that it can be tied to any I/O resource.

Being able to tie the generated code (but not the macro itself) to a specific
resource though would be nice to have.
