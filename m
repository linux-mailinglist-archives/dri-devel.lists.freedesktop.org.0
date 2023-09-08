Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4898798636
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 12:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E95E10E044;
	Fri,  8 Sep 2023 10:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCDD10E044
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 10:58:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96A996135B;
 Fri,  8 Sep 2023 10:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A561BC433C8;
 Fri,  8 Sep 2023 10:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694170725;
 bh=a28uiZPMmvQ2Dy5ziyWVegDmXFO/qkM4aJyke+WaCtQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K7NWIEGRxjggWT7P3EHnn0BztoaFc+ffEjG0Vss+WIjjKuqUpTM+lDqNVgnY+MvTg
 Oq8nQ5eG+nw4K6TT1SnYUaX2SmVxWuR6lwFOL5lOn83U8Eg3kJIMPGT22Q+2QXBjsn
 DVu2DDQ15JaAn4LoE19N7aUwzqveduxtiltV2cLc0jmoLeqTKTOKxtqGC4bndyigk2
 cw/M4ixgLFFuMmRNq2ExbXnRiffIKI8H9jCsoNqpW6XmkGet9oLEavIu+zQcqCoG2q
 sszhzfD8YmUlu8gATney2ZHqr2j8y/A+aoW/WiKWWF1X9Y/c+PqLUTAHiTsrMwU/cH
 V/Y/isuMv0dRg==
Date: Fri, 8 Sep 2023 12:58:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Message-ID: <5ltuqgsepffvp6rjvmskqtvzyyhvk6phmixm3crfteznyejn4t@mtycsppney5x>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dv6ck3cjpnqkzky7"
Content-Disposition: inline
In-Reply-To: <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, ppaalanen@gmail.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dv6ck3cjpnqkzky7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 08, 2023 at 11:21:51AM +0200, Thomas Zimmermann wrote:
> Am 25.08.23 um 16:04 schrieb Jocelyn Falempe:
> [...]
> > + *
> > + *     But there are two exceptions only for dumb buffers:
> > + *     * To support XRGB8888 if it's not supported by the hardware.
>=20
>=20
> > + *     * Any driver is free to modify its internal representation of t=
he format,
> > + *       as long as it doesn't alter the visible content in any way, a=
nd doesn't
> > + *       modify the user-provided buffer. An example would be to drop =
the
> > + *       padding component from a format to save some memory bandwidth.
>=20
> I have strong objections to this point, _especially_ as you're apparently
> trying to sneak this in after our discussion.

I think it's an unfair characterization. This was discussed on
#dri-devel, and went through several rounds over the mailing lists, with
you in Cc for each. How is that sneaking something in?

> NAK on this part from my side.
>=20
> If you want userspace to be able to use a certain format, then export the
> corresponding 4cc code. Then let userspace decide what to do about it. If
> userspace pick a certain format, go with it.
>=20
> Hence, no implicit conversion from XRGB888 to RGB888, just because it's
> possible.

I'm not sure what's your argument is, really. Last time we discussed
this, you were saying that you were enforcing that rule because that was
the outcome of that (painful) discussion with Pekka and Javier. It turns
out that both Pekka and Javier are ok with the patch, so it's not clear
to me what your objections are at this point.

Are you really arguing that we shouldn't allow a driver to consume less
resources while not affecting any other component in the system in any
way?

Maxime

--dv6ck3cjpnqkzky7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPr+YQAKCRDj7w1vZxhR
xer/AQD1TW0s+mBvXYzc/9ONWRWPWzOyMStNXJxtk+dGikHiqQD+LrgsYhSY01ms
ofZ82iguN8COWxnXMrozaDj0FYpnhQM=
=YUEa
-----END PGP SIGNATURE-----

--dv6ck3cjpnqkzky7--
