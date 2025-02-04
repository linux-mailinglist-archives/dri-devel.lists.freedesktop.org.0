Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F2BA27AAF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 19:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB7C10E6ED;
	Tue,  4 Feb 2025 18:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SC1coa+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF50A10E6EC;
 Tue,  4 Feb 2025 18:56:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 440E35C65F7;
 Tue,  4 Feb 2025 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C39C4CEDF;
 Tue,  4 Feb 2025 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738695417;
 bh=+xlWDqA1nktIztC11TUlrCC7pQTndNouzw5baByuO/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SC1coa+xa1wViaQHjAzIsR7pvYfAcoh9lEYTOxbZ2oEoiR/uvXrmWQIP2rKTFXVkJ
 2hXeUFPLlWADm/MXPZLj4OUugt2CaBReKR5Mb/bEFRvF8tzsqrGA4bYOT+j3xyvVOs
 c8y4+K9W50C4GWUu1rVVbjWcC0W/tS+Zsuh0Hb9eMc1QuUdruj16+URqkkoPrCp5kU
 DwhhtH26xTW3T6Ui0W0KFncfC13rvzFqBHqY2tcqA/7hA02oT49MbG9g+C303moIVR
 3FLx3uwZ5k8gqFwJiMbjXHFIC52w0eaCT7+0NTHRYbq5tPCeVLvXORG6roCdzfZo/1
 J7FtICqOV6eTg==
Date: Tue, 4 Feb 2025 19:56:49 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
 "ajanulgu@redhat.com" <ajanulgu@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "lyude@redhat.com" <lyude@redhat.com>, Zhi Wang <zhiw@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, "mripard@kernel.org" <mripard@kernel.org>,
 Neo Jia <cjia@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
 "pstanner@redhat.com" <pstanner@redhat.com>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
Message-ID: <Z6Ji8XrBtrXvdZZY@cassiopeiae>
References: <20250131220432.17717-1-dakr@kernel.org>
 <2d521b9d57338927a176118587dca545f5e4f170.camel@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d521b9d57338927a176118587dca545f5e4f170.camel@nvidia.com>
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

On Tue, Feb 04, 2025 at 06:42:46PM +0000, Timur Tabi wrote:
> On Fri, 2025-01-31 at 23:04 +0100, Danilo Krummrich wrote:
> > +/// Structure encapsulating the firmware blobs required for the GPU to operate.
> > +#[allow(dead_code)]
> > +pub(crate) struct Firmware {
> > +    booter_load: firmware::Firmware,
> > +    booter_unload: firmware::Firmware,
> > +    gsp: firmware::Firmware,
> 
> What about the bootloader?

Gonna add it.
