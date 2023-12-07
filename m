Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B53808944
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 14:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159C710E1FF;
	Thu,  7 Dec 2023 13:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB58E10E021
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 13:35:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C1E686210A;
 Thu,  7 Dec 2023 13:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC7AC433C7;
 Thu,  7 Dec 2023 13:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701956109;
 bh=a3ImIIWl/9JKO5Owo2SeQNG1D5n7GjVJRQZgsHPITcQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iOBUlcDBDOK0u+gNvLTwNj+0bN2Nj+JR8N3UNB/HwqhS3JLBUrUixKyjTFBaydbgW
 ZgygWn9Q7GxlDgEpM2Fw50lxewMVqG/kaIVclq01GliVTkFM+CM+r0JBFk98gwYXHR
 mDEuWfu1J2EADVH5k0ygXx6/ZYL59ceF1SXd1JbIGlQon+j1316FOGDkLHx/4Kz/2V
 0LTas/fERYwJX6nfPpjNX3YG7Br7z3PI9PLbGIjd2ker4XQpnKwregXUx8WGgBpVIa
 G3j553fzuKEvj71UER5bW3F60JBwgpgMui9eYEyxXGZAoeIuMP40+2hu5Rhvzj98Zt
 +vNd6Y39AStGw==
Date: Thu, 7 Dec 2023 14:35:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <2jp5v2wcq4r7kkko5csddotjeywpkctn3w25dd6zktpx22nvsc@p4jk6dcsvs65>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <SsSohScL3nokTnLEzO0FXd2Mhxq9IYM3_qjKhHD8-rynieR_0otvP-WmHQ18UNJuf1Dp7u4iaRB-XPZU4eAxZADSFODzbXxYPFuoJNJ6GcU=@emersion.fr>
 <wsdxippxzmtjujlcpp5t2tp2dvr2xmhwtogrvvhj3huyj73yj7@cg2uniryh2co>
 <bFzdpt0kEb3hhcEQ9HlUzLadbzI_hCTCVCTZJRua62Z3E6eZR1LeFFFHjOP_5hiyqnzM99aqj5PSUFh9mstWI5frJ2WY8_EEeULbjxDqmVY=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xt3igsetu4x6pxad"
Content-Disposition: inline
In-Reply-To: <bFzdpt0kEb3hhcEQ9HlUzLadbzI_hCTCVCTZJRua62Z3E6eZR1LeFFFHjOP_5hiyqnzM99aqj5PSUFh9mstWI5frJ2WY8_EEeULbjxDqmVY=@emersion.fr>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org,
 "T.J. Mercier" <tjmercier@google.com>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xt3igsetu4x6pxad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 04:52:06PM +0000, Simon Ser wrote:
> > I think the logicvc is a much better example for this, since it requires
> > framebuffers to be in a specific area, with each plane having a
> > dedicated area.
> >=20
> > AFAIK that's the most extreme example we have upstream.
>=20
> That kind of restriction is not supported by generic user-space. As far
> as user-space is concerned, scanout-capable buffers aren't tied to any
> plane in particular. Generic user-space allocates via GBM or dumb
> buffers, and at allocation time there is no hint about the plane the
> buffer will be attached to.
>=20
> I'm personally not super excited/interested about supporting this kind
> of weird setup which doesn't match the KMS uAPI.

Yeah... I think if we ever come to this, we can support it in two ways:

  - Either we handle it like simpledrm and the like by allocating a
    buffer and then memcpy'ing it to the right place;

  - Or if it's not fast enough, we create a single heap for the entire
    device, and then create some dynamic association between the
    framebuffer and the (hardware) plane depending on where the plane is
    in that area. That would be quite difficult to get right but not
    impossible imo.

Maxime

--xt3igsetu4x6pxad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXHKCQAKCRDj7w1vZxhR
xd/JAP45kMQDtI7Nw83dQ0AqCH293zHkT55M5dpezgu1o9TYTwEAxNjh+/gl+pGa
fR3T4IgWfN4LZREmEBki5CuBCoYrmAI=
=LGDf
-----END PGP SIGNATURE-----

--xt3igsetu4x6pxad--
