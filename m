Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB5051994F
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A70E10F50A;
	Wed,  4 May 2022 08:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248D710F50A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:10:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8999B5C0164;
 Wed,  4 May 2022 04:10:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 04 May 2022 04:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1651651833; x=1651738233; bh=bPK/7BcS9Z
 Vh3KOIsYKoLzx9Bn2Qwpk/lSWXMxu/LoI=; b=J6CLwRtA2ZYSjDHdqrBztHg381
 uRuW2bQZmiovtEl/Fiou6WhY8pFI19nYVQEWmjTmNlglayEEL0WpQSwPxKuZNehi
 n9BgkdA3xN0rkjol07ef/5ntqieRhE5UJETNX+hA1k7uLPsjALxNgRxDqiGtLZjK
 aXoiA07u3mup+HWuMsdh8nY+KhYLZrxCu1yF/pehMbQLplI8GvzdJPzJATOcIAY2
 wWPIaPFokJcoYGrOj0TRb6IkToybUsvYJhzJStDxisd6wReScwGAFwaGvnEEqRtw
 C/n5PLgdfzEwx9TquMYwdAmju1IlvoqKhwtUP+qT82WBdCZX0dN2EeUowDSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651651833; x=
 1651738233; bh=bPK/7BcS9ZVh3KOIsYKoLzx9Bn2Qwpk/lSWXMxu/LoI=; b=p
 zdnNIlQRXM+yQCUeZydDtKOnJ9c7mJLM74euDTdz2mjgAmwI45IVBBnrhsAtArAo
 V2sCFwDgjDWQBzvqLHG+ju1CDTSxKJ/oWQ1uzqStvurCKXArDcUMPUJiQLewJlje
 tKTLFl7tM+3+38RXEDOfso4hQY0fVWGbBi0cdh3tGD5YNrl7ZV1gJ4FAsxkJGswn
 cLoMGTLkkqaWyhe8ldYOyUosRbg0rgJi7Y1INTKXmq6PbDwBbr8RemgyMgrY3Iaw
 A4L71u2vPOfNVMfoYXEsUm8SAUwu6L1qftbjVI3FfjcffjwACUbvxK2w3ZPC5uHO
 FkQOlxn+15pbkLSYGKU/g==
X-ME-Sender: <xms:-DRyYkWVXFjCngtoAOuWrGTjaBdZ8nl3lFMyXDATzuWImclZIed8ng>
 <xme:-DRyYomoGYdKzjGFXq2nPvujQ9suChNwFlbtB7LU332-CN_6zk7DxjasS8RhbrMJq
 e27PQyQxylg_22cOig>
X-ME-Received: <xmr:-DRyYoYwBLfRq0WrfNXqSiOS2gcsw6oK0hpq0OVXf2qRMWWfCTVSt7wUlM9LnwV1XvR2eEtRxGJ7eAhOUfwa7KHna602xAb-gVfZQY8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeeigeetjeen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-DRyYjV5zOQ7DbD3VptxFu0qmPx95hgNLcYov6CKbtqRtBEn-cMbpQ>
 <xmx:-DRyYun9FA8ENPT1MkSVdXMFqQpNH_jnSC4SBuHOafSV7P4TbePPPQ>
 <xmx:-DRyYocOwuktBPfp9HSYQ6MuWcQmmep9CW3d6VkraxvJm68wkV97HQ>
 <xmx:-TRyYgVnUjHduSX9wKGztbduXCOmL6nbZTouotelrq9R_DRqK3PBQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 May 2022 04:10:32 -0400 (EDT)
Date: Wed, 4 May 2022 10:10:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/todo: Add entry for using kunit in the subsystem
Message-ID: <20220504081030.ky57nenipnif5r2e@houat>
References: <20220504080212.713275-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3nl2mgc5rvyywsjl"
Content-Disposition: inline
In-Reply-To: <20220504080212.713275-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3nl2mgc5rvyywsjl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 04, 2022 at 10:02:12AM +0200, Javier Martinez Canillas wrote:
> The Kernel Unit Testing (KUnit) framework provides a common framework for
> unit tests within the Linux kernel. Having a test suite would allow to
> identify regressions earlier.
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>=20
>  Documentation/gpu/todo.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 127e76ee0b2d..10bfb50908d1 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -603,6 +603,20 @@ Level: Advanced
>  Better Testing
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> +Add unit tests using the Kernel Unit Testing (KUnit) framework
> +--------------------------------------------------------------
> +
> +The `KUnit <https://www.kernel.org/doc/html/latest/dev-tools/kunit/index=
=2Ehtml>`_
> +provides a common framework for unit tests within the Linux kernel. Havi=
ng a
> +test suite would allow to identify regressions earlier.
> +
> +A good candidate for the first unit tests are the format-conversion help=
ers in
> +``drm_format_helper.c``.
> +
> +Contact: Javier Martinez Canillas <javierm@redhat.com>
> +
> +Level: Intermediate

Kunit is fairly easy to grasp if you have some knowledge of other unit
testing frameworks already (pytest, cmocka, etc.)

Another good candidate would be to convert (some ?) selftests to kunit.
I'm not sure the others, but at least test-drm_cmdline_parser should be
fairly easy to convert.

Maxime

--3nl2mgc5rvyywsjl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYnI09gAKCRDj7w1vZxhR
xd5LAQCNNRyTW43GNxecA9dlkRXKzQrvQOpErHWYblVKbVbEPwD/YtdmQ1zS0OV+
en3dU8LmtXErx0wwYkzOPG2RumzKugQ=
=slP5
-----END PGP SIGNATURE-----

--3nl2mgc5rvyywsjl--
