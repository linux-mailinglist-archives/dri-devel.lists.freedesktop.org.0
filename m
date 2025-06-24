Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C168AE719F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 23:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B5D10E626;
	Tue, 24 Jun 2025 21:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UrUoTYT+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4599C10E626
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 21:36:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EA535435FE;
 Tue, 24 Jun 2025 21:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8169C4CEE3;
 Tue, 24 Jun 2025 21:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750800962;
 bh=HM5ZaLKft095fgLFQg806+Y/LLjBgrZ3W4+fWgD+86A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UrUoTYT+BY0SHnrHs3HePf2dndBJ7m97OwoJ3rgHMn+G8WYUSNVc1jgHZu3tJDdhE
 BeZe9OehQ9sndQhpZyatdJRfJRo98HZ+q3EcLmw6YDd+XF6L5no+K5AQbk/CjtSPS1
 RHsjZsFNyWvJ/nRzzbfuINCfMnOBnfCAeSVew35gtLOz0kfFnbSHpCzaAtUlXjEW4d
 zRYBPjpsUcziJ6OGKKDCIJRcNAzhlqZ1IdVf4AGk6zOawBic6tLTO38s5kvCV441mr
 AEIic/DkVYG8Gtgi5n77w9APZmpJM8coRbCopqGaUKzwjlbcAEj//RlJ89FG+677dJ
 qHymV6RGAHQ+w==
Date: Tue, 24 Jun 2025 23:35:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 daniel.almeida@collabora.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
 lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFsaPZKql35qPj0X@cassiopeiae>
References: <20250624212225.2169888-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624212225.2169888-1-beata.michalska@arm.com>
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

On Tue, Jun 24, 2025 at 11:22:25PM +0200, Beata Michalska wrote:
> With the Opaque<T>, the expectations are that Rust should not
> make any assumptions on the layout or invariants of the wrapped
> C types. That runs rather counter to ioctl arguments, which must
> adhere to certain data-layout constraits. By using Opaque<T>,
> ioctl handlers are forced to use unsafe code where non is acually

s/non/none/

> needed. This adds needless complexity and maintenance overhead,
> brining no safety benefits.
> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> [ nova-drm changes: Danilo ]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

It's your patch, it doesn't need my 'Signed-off-by:', but feel free to convert
it into:

	Acked-by: Danilo Krummrich <dakr@kernel.org>
