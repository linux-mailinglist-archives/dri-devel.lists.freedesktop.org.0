Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645E5B3ABE1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737BA10E047;
	Thu, 28 Aug 2025 20:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tCkXWO2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE0B10E047;
 Thu, 28 Aug 2025 20:44:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 423D541996;
 Thu, 28 Aug 2025 20:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E175BC4CEEB;
 Thu, 28 Aug 2025 20:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1756413883;
 bh=c89mH4stV6Zw6WSUN9mFaTaOy7zgcpvR4oJ9c7bESJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tCkXWO2J3IewsQYx55BhxEF7giI4rYr6qrTJLCIFVVrshlB1bWXdQlsi8RicotIKS
 hUHU+S9ffKyJmwgkscaccilQ/WW1mCTanW44QGMapvpzgWz7Oci7qoxw4iySgcbujm
 WoI3AkcwBVA2+owQxnMSQlc5kKc36eZTkrN7Z6LQ=
Date: Thu, 28 Aug 2025 16:44:41 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/8] gpu: nova-core: process and prepare more
 firmwares to boot GSP
Message-ID: <20250828-precise-python-of-witchcraft-9d9a8c@lemur>
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <dc18894e-09d3-4088-9be0-22c2070b61f4@nvidia.com>
 <DCD2P4ORDLYV.2NSHXI305AF2E@nvidia.com>
 <79c7d5b5-5fe0-4306-b8c4-3c91758a4c00@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <79c7d5b5-5fe0-4306-b8c4-3c91758a4c00@nvidia.com>
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

On Wed, Aug 27, 2025 at 02:56:26PM -0700, John Hubbard wrote:
> > Right, b4 is supposed to be able to help with this as well, but indeed a
> 
> It really doesn't quite, though.
> 
> It is true that "base" (git format-patch --base) helps "b4 am" set things
> up, but then a subsequent "git am" fails due to missing prerequisites.
> 
> b4 isn't set up to go retrieve those, on its own anyway.

Sure it is. :)

Try `b4 shazam -H` on this series.

-K
