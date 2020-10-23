Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6857D297D98
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4A26E900;
	Sat, 24 Oct 2020 17:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652A76F89C;
 Fri, 23 Oct 2020 15:13:15 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 97C1258021E;
 Fri, 23 Oct 2020 11:13:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 23 Oct 2020 11:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=yHUcAmJW2I9T3l6rNG9J/PGMT7A
 ONxqRp4Me/z+CyMI=; b=QHSU0VkXkO9RlO2AiXsgNqtJsfqEDmLJ4jP7OK/pZr1
 2hFvx/h45pissJNVcqIudrN/qPAZdBKj9RVGeuA5Fyf5TBH14R3L4eqmxQ71fH0m
 /74UieKdM+aKOxapRCjPCiWxQ6dElOQ7RCZJWJZvyxUgdXZqWxj4Do7JOaaayqDu
 wj11zrGCGoy7ZSWo+eOO7uAkJ6+OLmlgEyYpvCklS3n8r2Gb53CyAJd4KS34fB2M
 BNthsMPt2datZbhgTjTY9kcJd+5yqZnMA9xi6ITLj6t14Z9ZPAfZsMe40q3QeGW7
 yaW1Q6Ul6wRxnHJBgKGjZp1xex6cgw0qBQ0dQjUj3uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yHUcAm
 JW2I9T3l6rNG9J/PGMT7AONxqRp4Me/z+CyMI=; b=pASw2KLZ5pcvAmmrCSqIyh
 Sd6G8y7lbNeMnrBAVKiyCwxi5NvfkA9MUJITwOX7mikdN/YTZHtPAbSnhrVA9pZ/
 XcE9i8Lx9Y80YiNE4BBOOmmaLY+acxVxz9pcCV7c6ZxCJb0+05MiRYdKlghDGeUy
 mhyIpkmdgF+GuZ4QzyeyWHMhPraT9SgWo4Dcqxu0R24i53d1nISkK6L4zmRYGk4K
 ZRIYk1rM51NTM6OoV6n7zAQHa/TN8TyCCJVUNQrvH68L/qLLZmn/l9qBgFKT60s/
 0jw/3frCPOV4gcM4R2sxmphsFrhMCdnlXMP9SmO/ZGK4pFZMQpjPKKCmANq3Fvbg
 ==
X-ME-Sender: <xms:CPOSX5HPL-cq5fatPsGiygXdo8TS5zTFgeY8hCvxhWJou0zmrrNZNA>
 <xme:CPOSX-XCecNMSivmX3PH59bx0ywNy5EyaqQhCzXHe1FPInAhDTMSmC9akHv4KLy41
 Z2XXtrt62LoNIYh71g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkedtgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CPOSX7IRbth7Y-6TS_z_DfTmCYy5HucDpSfoePZ_CY_dNkuY01CCbg>
 <xmx:CPOSX_Hgvvvmh1B3eZdcTiSpkZec8o1gXMd_hbqefzzaQUnn-CABGw>
 <xmx:CPOSX_UQzkZGPbssURz5QLTaffUDZ0EgHbAKqqcYcJPMZuXd1W7T8Q>
 <xmx:CvOSXyP0DxljUcctKZUHHzsqsvVw2F4qSodqdYrd7rL3gqQa2jByeg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D69D328005D;
 Fri, 23 Oct 2020 11:13:12 -0400 (EDT)
Date: Fri, 23 Oct 2020 17:13:11 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 5/5] drm/<drivers>: Constify struct drm_driver
Message-ID: <20201023151311.dd246rt5chohjw57@gilmour.lan>
References: <20201023122811.2374118-1-daniel.vetter@ffwll.ch>
 <20201023122811.2374118-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20201023122811.2374118-5-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Sat, 24 Oct 2020 17:05:18 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>, nouveau@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: multipart/mixed; boundary="===============0857915395=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0857915395==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v4ipol7ndp77sm72"
Content-Disposition: inline


--v4ipol7ndp77sm72
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020 at 02:28:11PM +0200, Daniel Vetter wrote:
> Only the following drivers aren't converted:
> - amdgpu, because of the driver_feature mangling due to virt support
> - nouveau, because DRIVER_ATOMIC uapi is still not the default on the
>   platforms where it's supported (i.e. again driver_feature mangling)
> - vc4, again because of driver_feature mangling
> - qxl, because the ioctl table is somewhere else and moving that is
>   maybe a bit too much, hence the num_ioctls assignment prevents a
>   const driver structure.
>=20
> Note that for armada I also went ahead and made the ioctl array const.
>=20
> Only cc'ing the driver people who've not been converted (everyone else
> is way too much).
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>


Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--v4ipol7ndp77sm72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5LzBwAKCRDj7w1vZxhR
xQeYAP90dRsz0KSJ0nih77xgZfEUElpITJItnWR67S1ZmoKEwwEAoNThieyWwPHB
68gdd7FrdMZXhjQv8Q+AZTU3S7CBZg8=
=rHUD
-----END PGP SIGNATURE-----

--v4ipol7ndp77sm72--

--===============0857915395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0857915395==--
