Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BC27E71F0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 20:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C568110E22D;
	Thu,  9 Nov 2023 19:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F81B10E22D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 19:09:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C0DEEB81A6A;
 Thu,  9 Nov 2023 19:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B76C433C7;
 Thu,  9 Nov 2023 19:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699556962;
 bh=Z33k+xuedSco43o/KXdJ68xi7mbfKEzF94k9ANiqfg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Chgb9KdU3qf5/xnOHeeGOgxbzDMSGk1KYgDVNKfakoXUxP88uREWIx+ZHLMrulMse
 MhBLnLifJ4svl3LH5u1jgvg/FoC/mqwfH8JFYivk25gHelrwrwZFS0GpP8IBkKR53A
 8vdQvHZ3jCqVQfQMXIbT4mnWKwILlc1LaBAy5XTHlWZ2izav2GK8AEnXtcyUDeHkeK
 tPf9Dhrij3bGtfhNNlUhpZimwsVvJyVs1mmAZWxUMrrF7gRe1/mZOM12bXJuZRWsMf
 HdT1JuHvSAMrU9DRRc6hF31MC/caczF8Bgutcgtx5v0hQHzu3RcDlwH0G9dx4d/3w5
 u8o16dgmFlUBA==
Date: Thu, 9 Nov 2023 20:09:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <hqeyywu2pnava4hdgmjnsktsdkblia4mllrtffl5skocqm7kkx@eqtiltsn44ts>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <bEg7cd-LFy1CzhAIao2Dt0cNFUFEb6D1ZhZN1Rec3w151EjXWpaXsOAs2MmvEPMxQjVhuE0k3qvuryxN6hJp5tJCU1b7EqSKHdTXte-UvmQ=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rvsgqymbq7vpdbql"
Content-Disposition: inline
In-Reply-To: <bEg7cd-LFy1CzhAIao2Dt0cNFUFEb6D1ZhZN1Rec3w151EjXWpaXsOAs2MmvEPMxQjVhuE0k3qvuryxN6hJp5tJCU1b7EqSKHdTXte-UvmQ=@emersion.fr>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rvsgqymbq7vpdbql
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 03:31:44PM +0000, Simon Ser wrote:
> > > - What would be a good name for the heap? "vc4" is maybe a bit naive =
and
> > > not precise enough. Something with "cma"? Do we need to plan a naming
> > > scheme to accomodate for multiple vc4 devices?
> >=20
> > That's a general issue though that happens with pretty much all devices
> > with a separate node for modesetting and rendering, so I don't think
> > addressing it only for vc4 make sense, we should make it generic.
> >=20
> > So maybe something like "scanout"?
> >=20
> > One thing we need to consider too is that the Pi5 will have multiple
> > display nodes (4(?) iirc) with different capabilities, vc4 being only
> > one of them. This will impact that solution too.
>=20
> I'm not sure trying to find a unique generic name for all split render/di=
splay
> SoC is a good idea:
>=20
> - For the purposes of replacing DRM dumb buffers usage from v3d, we don't
>   actually need a generic name, it's perfectly fine to hardcode a name he=
re
>   since vc4 is pretty much hardcoded there already.

Right. I'm wondering how that will work with drivers like panfrost or
powervr that will need to interact with different display drivers. We
will have the same issue for those, but we won't be able to hardcode the
driver name.

Similarly, if you have multiple display drivers, what "scanout-capable"
will mean might differ from one device to the other. Some have
constraints on the memory they can access for example, so you cannot
just assume that a scanout-capable buffer allocated by vc4 might not be
scanout-capable for one of the RP1 DSI device.

> - As you said, "scanout" may be ill-defined depending on the system. What=
 if
>   a PCIe or USB device is plugged in? What if vkms is loaded? What if the=
re are
>   multiple platform display devices? What does "scanout" mean then?
> - A generic solution to advertise what DMA heaps a DRM display device is
>   compatible with is probably better addressed by populating sysfs with n=
ew
>   files.

That would be a good idea indeed

>   We've talked with Sima at XDC about adding a symlink pointing to the
>   DMA heap and extra metadata files describing priorities and such.
>   However we don't actually need that part for the purposes of v3d --
>   I think I'd rather defer that until more DMA heaps are plumbed
>   across the DRM drivers.

Honestly, I don't think we can afford to only consider vc4/v3d here. The
issue you described seem to affect any SoC with a split scanout/GPU,
which is pretty much all of them? And if they are all affected, we
should design something that fixes it once and for all.

Maxime

--rvsgqymbq7vpdbql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZU0uXwAKCRDj7w1vZxhR
xWZFAP9nUna41oPgwigt5RmV/kH6aQ3/qH/XCRnFFiHn9bmaswEAgPdRx32fJGCb
8SIIL+pT5/arIw2Y36Y4l07hitiqrQc=
=Axsz
-----END PGP SIGNATURE-----

--rvsgqymbq7vpdbql--
