Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DC8A7134E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 10:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B59E10E675;
	Wed, 26 Mar 2025 09:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZlzHLupV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0CB10E675
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:05:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1F52AA40E01;
 Wed, 26 Mar 2025 08:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533D4C4CEE2;
 Wed, 26 Mar 2025 09:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742979909;
 bh=mnpakjbsWDJ6QAVeTop1dEsqx82RPFlsUvEaSg9Qnso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZlzHLupVbXC7oA/dBv/3qAYn1HNw/X5aK2ip0IvWs2OhHplce5FphmYbEphDuBw3K
 kBcCC+qMlmJpVtv1XkQmjk94iTq3DRFjI0JG9iaMLZsxmRCG2yWZ8OtUSZHmVRuW2R
 t5hvpd/0BpIeon00c/KO0BvZgPBXK6cyIeKuHB4qO4rCcUV42RfQWrRNQrc5I7woTl
 Ngot/O7k4if/2TkxvdRMA2cCQn8VSZ4hDZA/wJkOIJLM7fk9wm3hadLjaYXPllQvzd
 E+U17Ih72+yLKJNR7vvzKf7vWimdXqz98SEsbsYTY5GeVngX140APL4Ip+dzYHz6o4
 cczhzEWbIQs8g==
Date: Wed, 26 Mar 2025 10:05:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com, lina@asahilina.net, 
 daniel.almeida@collabora.com, j@jannau.net, ojeda@kernel.org,
 alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 3/8] rust: drm: add driver abstractions
Message-ID: <20250326-meaty-talented-beetle-16c5f7@houat>
References: <20250325235522.3992-1-dakr@kernel.org>
 <20250325235522.3992-4-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="isazp2xhinn5rgim"
Content-Disposition: inline
In-Reply-To: <20250325235522.3992-4-dakr@kernel.org>
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


--isazp2xhinn5rgim
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/8] rust: drm: add driver abstractions
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:54:30AM +0100, Danilo Krummrich wrote:
> +/// Information data for a DRM Driver.
> +pub struct DriverInfo {
> +    /// Driver major version.
> +    pub major: i32,
> +    /// Driver minor version.
> +    pub minor: i32,
> +    /// Driver patchlevel version.
> +    pub patchlevel: i32,
> +    /// Driver name.
> +    pub name: &'static CStr,
> +    /// Driver description.
> +    pub desc: &'static CStr,
> +    /// Driver date.
> +    pub date: &'static CStr,
> +}

The date was removed in 6.14

Once fixed,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--isazp2xhinn5rgim
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+PDQgAKCRDj7w1vZxhR
xUWeAQDUf8hSkOKxfYvnjZemM9/6PvcrFrTM6kkpg1vPqJ++pQEAngF4F51QZcBt
hwYoQsXR5pQHnIaqtsZn1FGzQDY4iwo=
=PzkD
-----END PGP SIGNATURE-----

--isazp2xhinn5rgim--
