Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E662B2BC93
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0641710E563;
	Tue, 19 Aug 2025 09:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YTqx1gZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D93510E563
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:06:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 104E55C4906;
 Tue, 19 Aug 2025 09:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E94AC4CEF1;
 Tue, 19 Aug 2025 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755594403;
 bh=GzTH2CWb9On4DhbDRVtbvg50ym9AgWV65w7+T69rKmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YTqx1gZXaylHz3EiNSkbLZlEa6mRbni6ZHYS3cE0QhR0qcfYV5lgvTs6UwCu9g7Xy
 gJMdH6ETy0478//DPHL+8e+Hs4hdFlobYZNSix007I7ZbxXiGxXk9kUBg0/NlTQmay
 UMDYlhItXG3Om7HIHNmhZckymB06d+cN1PcpV6TWJL/ZPD+wQPpTikP1KAiH0faXUO
 Ujl8efElB//svHZY6P4VjI30P/uPF7MKqxBfY5mqdWX+kqs6IbS98XPqOL4GxdJrpi
 dZVSY+7CkRuY8xWoSLEbFi/ytDwD1bsFKl/jvvru5kWsl7YPkZzM+cDUdk6GzVL6mf
 aqs2P+Vftj6dQ==
Date: Tue, 19 Aug 2025 11:06:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector
 APIs in Rust
Message-ID: <g5n4vx5hkreacrtjrbzsefnctvki6d7oh7qyjrb6wtqvzp7adl@rzmxiyblpnsz>
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rqlr5pzjvbwfohde"
Content-Disposition: inline
In-Reply-To: <20250818050251.102399-2-sergeantsagara@protonmail.com>
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


--rqlr5pzjvbwfohde
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector
 APIs in Rust
MIME-Version: 1.0

Hi Rahul,

On Mon, Aug 18, 2025 at 05:04:15AM +0000, Rahul Rameshbabu wrote:
> I am working on a drm_connector scoped backlight API in Rust. I have been
> looking through Hans de Goede's previous efforts on this topic to help
> guide my design. My hope is to enable backlight control over external
> displays through DDC or USB Monitor Control Class while also supporting
> internal panels. In parallel, I would like to improve the driver
> probing/selection mechanism when there are different candidates for driving
> a backlight device. This initial RFC is mainly intended to sanity check
> that the plumbing I have chosen for extending the DRM connector
> functionality in Rust seems reasonable.

It's a great goal, and I had that same discussion with Hans recently
too, but I can't find the link between backling/DDC CI, and Rust. Can
you elaborate?

Maxime

--rqlr5pzjvbwfohde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKQ+nwAKCRAnX84Zoj2+
dtm2AYDVQ35Eu8ffKbg1cayeMAq4RljdgTI+K4MjL/eXmTxoU4R3bUX1JJ2XL4wB
lCVy/VsBgLpG1jLb5sYJdf/FlkiKubkQxE4qnr4m8Dqm6qG+b2ljFC89ZT3kX5xD
gl3A6DJ5zA==
=1fQH
-----END PGP SIGNATURE-----

--rqlr5pzjvbwfohde--
