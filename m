Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1027B97C820
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 12:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A9B10E6C8;
	Thu, 19 Sep 2024 10:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sU7zbATy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A4D10E171;
 Thu, 19 Sep 2024 10:43:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 05F52A43C2E;
 Thu, 19 Sep 2024 10:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2292DC4CEC4;
 Thu, 19 Sep 2024 10:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726742605;
 bh=EHtny0pChaI3F5c8aTKE+T8QjpjMZEXc+nsAx7uwenA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sU7zbATy/klDP0d68H+TlJgnIWUgGVSiTim/rxcCaqr+Gefv4swwBqM9CJ2Nw/G6V
 sgZVCQyRDgPMcK6bq213wrEVossqlxrS+I+47Y5bMP2VSPMQvioeaOzElhZOfge9mj
 F2J4oQo88ngYsmE8SPnSVGVVRiiY18UsyMG7KkOzFlsiirtPhmkmOHglz+7LwDEafq
 Rpz2i+bAXp2pbs73KZH0WexL5Nd4X2OVu3yLD2RK2AB7GsXeXTRRk8Hwizd2P5aLQf
 JkN1qm336+osA/IFZYVw+FycXvYRDTnHQTXFUZlYZczIH1mkPFmDT6KhlOC/ca/iki
 FNFj3wKShba1w==
Date: Thu, 19 Sep 2024 12:43:22 +0200
From: Mark Brown <broonie@kernel.org>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 04/12] spi: intel-dg: spi register with mtd
Message-ID: <ZuwASoMtyWvZIFNg@finisterre.sirena.org.uk>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-5-alexander.usyskin@intel.com>
 <ZurX4xcy7TK45Omq@finisterre.sirena.org.uk>
 <PH7PR11MB7605B60D43732A60C0A32D46E5632@PH7PR11MB7605.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tIkx8wPTo++rhvtv"
Content-Disposition: inline
In-Reply-To: <PH7PR11MB7605B60D43732A60C0A32D46E5632@PH7PR11MB7605.namprd11.prod.outlook.com>
X-Cookie: Editing is a rewording activity.
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


--tIkx8wPTo++rhvtv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 19, 2024 at 10:01:06AM +0000, Winkler, Tomas wrote:
> > On Mon, Sep 16, 2024 at 04:49:20PM +0300, Alexander Usyskin wrote:

> > > +static int intel_dg_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
> > > +			      size_t *retlen, const u_char *buf) {
> > > +	return 0;
> > > +}

> > If these functions can legitimately be empty they should be removed.

> Those are place holder so the code will compile and implemented in following patches, this is compromise on not making too big changes.
> It use dot be acceptable compromise in past.

If you omit the functions you should obviously entirely omit them
entirely, including putting them in relevant ops struct.  As things
stand this just makes the code look buggy which doesn't help review,
you're adding functions which obviously don't work properly and not even
noting that in the changelog or code.  Just add the assignment of the
ops when you add the implementation of the ops, that way there's no
partially implemented step.

--tIkx8wPTo++rhvtv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbsAEkACgkQJNaLcl1U
h9BZlQf9EIUQoyUf37isOsOSa9SY28Yxwp4HgDn+oa/Vitp0xd1jVdZLhUs/Z0df
9gGnJBY8ih/cUYS0B5lfsO3xn2GYshDXgKext4X/F+WuCSs0LVJ19ZWJo/C0JcaR
2MPUQ+h3QjpL26Ug0vq08iXnZCWo5/dXYbYMZJB/Oj6ReSG4rDF8m8WsqYr4JcPn
nUkMM60rId1d59bb7dvgneR+ljIEnBvrc1QfzM7xwmkKZ2ftx/z4zhh4JaCYTkdS
aGbxDDXFauHdx6H/n0RgfUOKnRbl8TKWYJwG2SS6XBqXGaBO66u4oTlYjQD6RdTG
8jpm3WiJW3j3MAvX8gy/gUFUOyJeiQ==
=+4K1
-----END PGP SIGNATURE-----

--tIkx8wPTo++rhvtv--
