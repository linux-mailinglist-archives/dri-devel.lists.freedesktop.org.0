Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBBF7667B2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 10:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C94910E6A3;
	Fri, 28 Jul 2023 08:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F52A10E6A3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 08:48:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96C4362044;
 Fri, 28 Jul 2023 08:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80ED6C433CA;
 Fri, 28 Jul 2023 08:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690534107;
 bh=MWYn0ZrD+F0fN2IJzgSEyyw2W5hXt/o/TWyWPk3BOWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O3IxMP29Fvt2U/ljC8FoYM2aSfMb4zzVIXEdQ56M3YkhOqas3XdA+FVqC9ij+r478
 vxEtmxmGKwWE4IFHmr4Uzq+l/M9WJHOIBLMDFe2mDqHhugB9Gj9vXaiFFs8sMM9hIW
 7Ld4Gcoa2bCFQdEEDBw+W7sdJjmL7810LMK22AhHXbuTRGxB5NLu4w6KGzuygwVEmx
 fjg6U4EHCWsA76AvETNxQNs+48uOc0WOJxneAy5YalDknBkjnOZpQnBfbMS2ZKka3Y
 Wkohx2HEOkEQXXNN1yZrb3U6eBrT5HxiuoM6MNb6gIaA1geJWVU0AFY3aGDm4iex/2
 UHfcK7Opo0cGA==
Date: Fri, 28 Jul 2023 10:48:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
Message-ID: <5vmoxioppbrbw3tshfr37m3mvkfattkidhkhvqlyqsqh3tniwh@lhjbpdwl7bud>
References: <20230720152737.102382-1-helen.koike@collabora.com>
 <CAF6AEGtXL5vjp3Uup6Mk19MiY8E26-tpyXVmxXYhMd3fiadykQ@mail.gmail.com>
 <CAF6AEGsxLg4og1EkCdno6P8x31KK=rJfmerJa8uMeNR-n7RVRg@mail.gmail.com>
 <CAPj87rPNyJ=mX1Um6yaN_jTV2gH5MhMxr3mnSb7=nB7NEOf2Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f2af24lhagcawgl4"
Content-Disposition: inline
In-Reply-To: <CAPj87rPNyJ=mX1Um6yaN_jTV2gH5MhMxr3mnSb7=nB7NEOf2Ag@mail.gmail.com>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 daniels@collabora.com, robdclark@google.com, corbet@lwn.net,
 khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 linux-rockchip@lists.infradead.org, jbrunet@baylibre.com,
 david.heidelberg@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 anholt@google.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--f2af24lhagcawgl4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 28, 2023 at 06:26:39AM +0100, Daniel Stone wrote:
> On Thu, 27 Jul 2023 at 22:47, Rob Clark <robdclark@gmail.com> wrote:
> > > I did run into a bit of a chicken vs. egg problem with testing the "in
> > > tree" version (compared to earlier versions which kept most of the yml
> > > and scripts in a separate tree), is that it actually requires this
> > > commit to exist in the branch you want to run CI on.  My earlier
> > > workaround of pulling the drm/ci commit in via
> > > ${branchname}-external-fixes no longer works.
> >
> > After unwinding some more gitlab repo settings that were for the
> > previous out-of-tree yml setup, I have this working.
> >
> > Tested-by: Rob Clark <robdclark@gmail.com>
> > Acked-by: Rob Clark <robdclark@gmail.com>
>=20
> And it's also:
> Acked-by: Daniel Stone <daniels@collabora.com>
>=20
> It's been back and forth a few times by now and reviewed pretty
> heavily by all the people who are across the CI details. I think the
> next step is to answer all the workflow questions by actually getting
> it into trees and using it in anger. There was some discussion about
> whether this should come in from drm-misc, or the core DRM tree, or a
> completely separate pull, but I'm not sure what the conclusion was ...
> maintainers, thoughts?

I'd be ok with merging it through drm-misc

Maxime

--f2af24lhagcawgl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMOA2AAKCRDj7w1vZxhR
xVJwAQC7Egc+whFQ35hiIzHma3bPEJSg/s0UJDLuo9YxMSO3XgEAgjTU7f/m28jW
62zzrvNx2pZMQInhGhPSzUgYMtiQ7Q4=
=b4ll
-----END PGP SIGNATURE-----

--f2af24lhagcawgl4--
