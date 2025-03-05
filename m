Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA236A53E92
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1D410E0D9;
	Wed,  5 Mar 2025 23:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R7Voks/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7576B10E0D9;
 Wed,  5 Mar 2025 23:40:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA7DB5C6C56;
 Wed,  5 Mar 2025 23:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E023C4CED1;
 Wed,  5 Mar 2025 23:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741218053;
 bh=Jvgd6Vxhn2iQaQ4MOAQsSTwAjHHbOpXxX726+Hdaoy4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R7Voks/4JqAn565twhIKIPLuQwijN0099cEH4dkKyGkZveaDI6LoTQqSvC1IBtnXr
 kol1I4cTzT/DKC7TeXlQASieui4zRsTh2ZtojG3xPH02AUhkBBRJc8x+skpXtNbtnO
 vJIuAcSY8N3AgjjAPhSnP76TrBQ/8t4VSPkWfKH1ObbOfepdY8uLOAjD1bDAbEEuHC
 8Z+R+II8Exn3abUo953QGJRSBkxar+6kNS6YszA9Z1CJY8WLVfayiFCI6vkqWnhwyK
 f+AIorZyYx2bJl5spMzqiPGDhAvn0uvYNDc+4IdYodVN99XUgqC0mCcM3F3wwNqRJm
 kfEKk+kpPu5Jg==
Date: Thu, 6 Mar 2025 00:40:44 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
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
Message-ID: <Z8jg_OokbtQ_WDS8@pollux>
References: <20250304173555.2496-1-dakr@kernel.org>
 <Z8isev0gwQJPs7S9@cassiopeiae>
 <Z8jd0evXjJtz1CRB@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8jd0evXjJtz1CRB@bombadil.infradead.org>
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

On Wed, Mar 05, 2025 at 03:27:13PM -0800, Luis Chamberlain wrote:
> On Wed, Mar 05, 2025 at 08:56:42PM +0100, Danilo Krummrich wrote:
> > On Tue, Mar 04, 2025 at 06:34:47PM +0100, Danilo Krummrich wrote:
> > > Danilo Krummrich (5):
> > >   rust: module: add type `LocalModule`
> > >   rust: firmware: introduce `firmware::ModInfoBuilder`
> > >   rust: firmware: add `module_firmware!` macro
> > 
> > Greg, Luis, Russ, any objections on me taking the two firmware patches through
> > the nova tree?
> 
> I don't speak Rust so I'd my recommendation would be to add the rust
> firmware file under the firmware loader entry for maintainers provided
> we get a volunteer from the rust community do help maintain *both* C and
> the Rust version of the firmware loader.

Yeah, you suggested that when I sent the first firmware loader abstraction more
than half a year ago and since I'm doing exactly that. :-)
