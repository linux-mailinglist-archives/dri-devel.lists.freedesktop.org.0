Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3564BB0736D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 12:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E1110E788;
	Wed, 16 Jul 2025 10:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PLbEUQoc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17E810E788;
 Wed, 16 Jul 2025 10:31:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 65AF56135E;
 Wed, 16 Jul 2025 10:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7204BC4CEF0;
 Wed, 16 Jul 2025 10:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752661868;
 bh=8xjOaqal/L40o2WPaOpIYLp/RLO1gYdLXInOd8YQJwM=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=PLbEUQoc8KGHbXmHGmyzzVcEje6nMuw1StUisbQClc9HnKjFSQZWYO1R56JucNMyu
 l4pVv5SBYHDgEJdiHTXTGLHEVe71F4sdowdeBcemJwALwrJgm4H2bvw9ViM4xRrOod
 0rePRKbBaiil7H+aiTCgAqSDX2BVMs7HVgyANvXFzXoanceEjA6OLdyUAwgMA7/mGC
 MWh8GROg1BfUibjwnsEPQ4grh7xlfTsmvlTAsW7piwxd/OQuK8/aJtrsmL9yBp8Lsz
 j+Ivtm+IFXZb8DXL5qYyYkhfXZKI9F55jeKr8OHG2WjmtwjAm3XImMAmCm2naJxiqa
 T2h64+xJCxeiw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 12:31:04 +0200
Message-Id: <DBDES17FT4ZZ.GVIUKUE5R9SE@kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the drm-misc tree
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Alice Ryhl" <aliceryhl@google.com>, "Intel
 Graphics" <intel-gfx@lists.freedesktop.org>, "DRI"
 <dri-devel@lists.freedesktop.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250716201656.4f0ea8d7@canb.auug.org.au>
In-Reply-To: <20250716201656.4f0ea8d7@canb.auug.org.au>
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

On Wed Jul 16, 2025 at 12:16 PM CEST, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/kernel/drm/gem/mod.rs
>
> between commit:
>
>   917b10d90990 ("drm: rust: rename as_ref() to from_raw() for drm constru=
ctors")
>
> from the drm-misc tree and commit:
>
>   8802e1684378 ("rust: types: add Opaque::cast_from")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me, thanks!
