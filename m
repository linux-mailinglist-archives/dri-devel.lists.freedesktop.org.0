Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEA1A61068
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 12:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE9210E9C5;
	Fri, 14 Mar 2025 11:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XcB1Hmou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D6910E9C5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 11:49:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DAA4C5C625D;
 Fri, 14 Mar 2025 11:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFE5C4CEE3;
 Fri, 14 Mar 2025 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741952941;
 bh=27DMW218nRvLGFSPbZfKfMJ8zzDAqnq1Puiz351Oajg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XcB1Hmou+cQo9dLJVtB1ZK7pGmxWPgTypguLf2Xcgbrb+JMut9XP7vhS8MnJqj4EG
 qI3Fn06wstBOf2Z8lVRh8aivqSYwwmCfGrHtbcY1w77SLdnoRbGi1scWIjb6rKbX+w
 /aMYe2E9k+piMlf/uPmGSwanOhPiWONkM1EwYXshi7/PXpm+SNxvLXw8Nm9YO+lg11
 rEr060mdECviQuo+n8e5PyT2xakVFFm+sLuUD82CmzQLSF1AH0ld/e0RAWRudD6RSU
 uwTud9TBWkKkOs3bEhpOfzLtFPzlPCPkm0gff4PrD5AEtT221+rMfF6CJ0mhkheE69
 f5AZFzJfpgeUg==
Date: Fri, 14 Mar 2025 12:48:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, 
 Simona Vetter <sima@ffwll.ch>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v3 07/33] rust: drm/kms: Add drm_encoder bindings
Message-ID: <20250314-manipulative-important-mackerel-7a25ba@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-8-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="g47mv63cjnchwwjn"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-8-lyude@redhat.com>
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


--g47mv63cjnchwwjn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC v3 07/33] rust: drm/kms: Add drm_encoder bindings
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 05:59:23PM -0500, Lyude Paul wrote:
> +unsafe extern "C" fn encoder_destroy_callback<T: DriverEncoder>(
> +    encoder: *mut bindings::drm_encoder,
> +) {
> +    // SAFETY: DRM guarantees that `encoder` points to a valid initialized `drm_encoder`.
> +    unsafe { bindings::drm_encoder_cleanup(encoder) };
> +
> +    // SAFETY:
> +    // - DRM guarantees we are now the only one with access to this [`drm_encoder`].
> +    // - This cast is safe via `DriverEncoder`s type invariants.
> +    unsafe { drop(KBox::from_raw(encoder as *mut Encoder<T>)) };
> +}

I'm not sure we should expose drm_encoder_cleanup() there, if only
because it's not really up to the driver to deal with it anymore. We're
switching to drmm_encoder_alloc/init where having a destroy hook is
explicitly rejected.

Maxime

--g47mv63cjnchwwjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QXqgAKCRAnX84Zoj2+
dng1AX4lM8eAeLLHIHCVb6WGxGggfuubtHjG1Siqk2oobFl9xxhMe7o26QyYTZ3t
DYVA0T8BgMZLG+TwwxyzowXFT4tJ7HPLFf8bJqQLI6A3oA4eXg5fXlGjNDPiSmIx
IyVzVKUM7g==
=T9DB
-----END PGP SIGNATURE-----

--g47mv63cjnchwwjn--
