Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E422E4650C7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD21E6E8C8;
	Wed,  1 Dec 2021 15:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F916E8C8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:04:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A3224580BBD;
 Wed,  1 Dec 2021 10:04:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 01 Dec 2021 10:04:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ZoFA2Zbc1OH12rE3+N23QxGtCrJ
 BF6BVFWFzUwHdl3o=; b=CjVVR1p+1uQ4Ncq5iVuF6etbAKvWQDvXcKL5x0Uy5Wv
 EVTV2zJbfNwGBUyukE7a9Vb0BXHsFyGiiNMWlAtbmEzdpE/l7rujGgBQ5MvyQK8m
 VE08wQLF3aq0ef2Mg/h+br0vH31N4GYggm6/4ldrUuepTFW/fr2gwCaZXnwaE3Vy
 m2GHJPVMwALvDpmgEBCHfYEslkN89T4mJgTRkNQcQ0dFGh0f1ULaewfWjsBnWUj6
 LRepAF+y2rmla68RpRot9L9ld4De4KQj557mZuMm0QjyO9OkpAL2y03Vd+bfm7wo
 IrP+XbEqkLtANJZKvdATJVBYuN2YVoqpyAK784rMX1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZoFA2Z
 bc1OH12rE3+N23QxGtCrJBF6BVFWFzUwHdl3o=; b=aZaC2f8SpNg2TxptanmlVP
 /2AFwUoZ5Qea7KDTEVZ9nyxc+ZqosDWWs48UreHuQZEcUdDQH0YNxgUsygeO5VBx
 on9hmOWtmHe9dOnk+EhuHNo7HywMwDcauzRZlszwDV9LkGzDgEGej+ajNNCRVtAm
 pTLxPA5riYmMl7EqJ6fTx0XYB3y13MKrDVNqJUUwSdkp2O1IjyFx1TUh/KK+a7+e
 6bXyZxDNUWy0V9XSxWr/hdv9rWBhyOczDsDDlPjJT3EiCTY2Rssvpsa/Tl4hdj4c
 f/nKp72xhmfpLFZT+nMjtfHbccXpEn21mMxrQaoACUu2snSR2BRPbMYMwY9YvAoQ
 ==
X-ME-Sender: <xms:DI-nYfNPVRDrinkLNkT5qWLnBSPucfk3TU1EhybQyXpJ0DoKbS7Wnw>
 <xme:DI-nYZ94IVAz73qKY79NKkyTYuPOAVHmVXkPoyFk64v6lTcGQhvLREWrtF9QvBA_U
 95cmw0xkj9BAb_NjLk>
X-ME-Received: <xmr:DI-nYeSNkzyy_wj-kR9qGKMW2ap6HSPHcOecV0VZo8GbA7jZGl9iHqpUUnj8SMczCESBdmzGHK2nI4PM0lX_xWUZrFPynZhnzJiakIxWlf1k0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieefgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DI-nYTuuYSfWGHOJ7-6RWD_BWxvKw1SQ7Y-BrJ0Yn9RZkkTIx3_ptw>
 <xmx:DI-nYXf1x4toNPIFh5dK6mKWetowEGMfPii26O1uatv-SRejCLlr_A>
 <xmx:DI-nYf0JRyfQjnI9B_f6jg_CstLLfjhTqJMo1Cgyk2LqmRcpwFdhJA>
 <xmx:Do-nYf_M8BhZwNqIxQ1XAHz47T0AhRd6ml99fIDQ9c_vBJ83MXWcDw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Dec 2021 10:04:44 -0500 (EST)
Date: Wed, 1 Dec 2021 16:04:43 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
Message-ID: <20211201150443.7ya7xtiujx2mcver@houat>
References: <20211130095255.26710-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nwpnbcoygohixuuc"
Content-Disposition: inline
In-Reply-To: <20211130095255.26710-1-tzimmermann@suse.de>
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
Cc: kraxel@redhat.com, emma@anholt.net, tomeu.vizoso@collabora.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 lima@lists.freedesktop.org, yuq825@gmail.com, gurchetansingh@chromium.org,
 virtualization@lists.linux-foundation.org, dan.carpenter@oracle.com,
 alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nwpnbcoygohixuuc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 10:52:55AM +0100, Thomas Zimmermann wrote:
> GEM helper libraries use struct drm_driver.gem_create_object to let
> drivers override GEM object allocation. On failure, the call returns
> NULL.
>=20
> Change the semantics to make the calls return a pointer-encoded error.
> This aligns the callback with its callers. Fixes the ingenic driver,
> which already returns an error pointer.
>=20
> Also update the callers to handle the involved types more strictly.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> There is an alternative patch at [1] that updates the value returned
> by ingenics' gem_create_object to NULL. Fixing the interface to return
> an errno code is more consistent with the rest of the GEM functions.
>=20
> [1] https://lore.kernel.org/dri-devel/20211118111522.GD1147@kili/

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--nwpnbcoygohixuuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaePCwAKCRDj7w1vZxhR
xeESAQDL3ddwBo+CApe9f8ulM8xlVx70VoHtgg+gBs7yVLrepQD/Wfck/viwSoVG
RfTiisnJNfgZIlOgSuvYMJoX+NsgaQc=
=1URr
-----END PGP SIGNATURE-----

--nwpnbcoygohixuuc--
