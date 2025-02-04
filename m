Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0468EA27AAB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 19:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FB410E0B4;
	Tue,  4 Feb 2025 18:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QgfucYnu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8B810E0B4;
 Tue,  4 Feb 2025 18:56:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7582D5C65C1;
 Tue,  4 Feb 2025 18:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2E6C4CEDF;
 Tue,  4 Feb 2025 18:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738695395;
 bh=C4wZ8hF8BprpsK7/Y5Wrqtdlu2SuEdB+2cx2vBvEFwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QgfucYnuFb0fLjONwAtA4Xnxw0cIZgKFItmkoKSCdbL7aVkUj6n3hzOviOvkDwMye
 8fNywzhQrxGbEe0yZ/y3USnbR/TL+zkYMJ4CowzRNrVrak4n5pnCOo0PX+BzsCWDtB
 jogkXG/jzVcHBM/kTEW5ziDEv4HH2aVX+V12AQMsZd35CJk+4CXPwppqqzVfU/niW1
 1wCOuTSuWnN9FO1nRRL1WAW7GlHNyHqJjq2ZnlftgpdsReW3Ea1AhnHr3OC1YfAi54
 Nmhr7bDi/5aKLCahcwdiyri89VOJm37lPP4vhPV8BqaSZKEgF0ZySaNrYqSPy4U4cH
 vXgkt1FE8T25Q==
Date: Tue, 4 Feb 2025 19:56:27 +0100
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
Subject: Re: [PATCH 2/2] gpu: nova-core: add initial documentation
Message-ID: <Z6Ji2543iydfJwuh@cassiopeiae>
References: <20250131220432.17717-1-dakr@kernel.org>
 <20250131220432.17717-2-dakr@kernel.org>
 <168287b8cbb95f190a656f7f428e16b8ac93b41b.camel@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168287b8cbb95f190a656f7f428e16b8ac93b41b.camel@nvidia.com>
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

On Tue, Feb 04, 2025 at 06:40:41PM +0000, Timur Tabi wrote:
> On Fri, 2025-01-31 at 23:04 +0100, Danilo Krummrich wrote:
> > +Rust abstraction for debugfs APIs.
> > +
> > +| Reference: Export GSP log buffers
> > +| Complexity: Beginner
> 
> Seriously?

Well, that seems indeed a bit optimistic. :-)
