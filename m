Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A985453E4E3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 15:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2F110E641;
	Mon,  6 Jun 2022 13:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0228810E664
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 13:52:24 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 37096320091A;
 Mon,  6 Jun 2022 09:52:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 06 Jun 2022 09:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654523541; x=1654609941; bh=JO3uf90VYu
 DzOsaAFOhdlrZDhya56oTpSDsv/mUF4IE=; b=w8hbVrvso6Urf1H3+tCPrbSRmF
 F9x0nC5bkAfesPw5qE8GxI+JeuX36afQuHvbae1QqD1d0qNwYnqTqcrnXVc/1e5I
 Zg/l7VBbvnCTj5ZlGxFgLYYkFTXfxXiZPN1VrebXQoKlvOW+Jyg67dc3Q0mI4uyj
 2G4P0lSr7S21GhLkk8ZEJpsnr3VN1msNotgFJMF3bGGmYhTX7llMq5cDCX3A+mcB
 4z6IRtaSOV3KRG03HsozZ9jbJMIlBS5wedEhlAB+za2KEjRtGf3xXZ+IZ2cUvWsI
 YjNJNhtr64BQDwNh4iwt4IJGOIN5+Co4OBme5gEfLVxt39lVdwy+SPyv7Czg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654523541; x=1654609941; bh=JO3uf90VYuDzOsaAFOhdlrZDhya5
 6oTpSDsv/mUF4IE=; b=eG8cAwfA2gti21UxC/QyrXy8ii0BN18epUqqtqIMnui7
 PzDuIPu8Xr/Ghx7DyLuKMR5gZ2unbeIyLCZ2Tun8dY1nALxA1ndiXuV29U60lpXk
 IYdmNYxvnj4cUshCRVFjI4KqODazMOcyLkDjEv2u3iv8rGxIc3T0qYF/lTO0VoAj
 p/AqouSCqq/p4rqzjKWeN42V+j6eDF2DJ6Kb7+ZfArvhpwPl20nUEG/E62NVxQuE
 s+XEdlvO9U6Q22D6hEMb7RKnqeerldonPKtNyUng01SzBcyO4N6iJR+KqjQx01hc
 E42++zJxbIbxQokjvnha4y63XZJgUHsvkasKuIv9Rw==
X-ME-Sender: <xms:lQaeYnYJyUXsg1mIABswyP-yjBes-t6T2LCq7J4Z9-e1Q9xdfTtLfQ>
 <xme:lQaeYmYn16kyFxVLV65R22LIp0JCDJiwfH46plc0o-9ELRQZFvWkEIf0Jc9JTYgvf
 0cVCGKQ4G4JCVl0gIs>
X-ME-Received: <xmr:lQaeYp_CaVs8foVyL4yTuScOXMF3dHzWwXinJDRgFOmw9dayod1DqxcFucrBLszc5AME5naMf-E3YkJp9bqEw1c24JNkUVwE1f7PXw4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtvddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lQaeYtojWoJ3eE5oAPz7UfTt0YMfyNY9dc5Q5Kha1k8Z4IIaz3pj4Q>
 <xmx:lQaeYirk0tElFIs5vfHdONwizaWhGb2zPEVj2bdpVDcA7weJxTb9wg>
 <xmx:lQaeYjR-ZxNCbPcBVWXTq_-iqDLh62R40X5YmXZvlUG0-raKZmuBQg>
 <xmx:lQaeYh3vB-n46tPNg9kjKb56_2yKokzFizfkFPHIJgOmPCQM_jUmfA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jun 2022 09:52:20 -0400 (EDT)
Date: Mon, 6 Jun 2022 15:52:19 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
Message-ID: <20220606135219.nwhp4fdawg2qjeam@houat>
References: <20220606095516.938934-1-jose.exposito89@gmail.com>
 <20220606095516.938934-2-jose.exposito89@gmail.com>
 <20220606134242.h6kuqn4zbpmc2rql@houat>
 <576ed6ef-b961-9214-2c9b-56cb5b493b4e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bilcjadqyeu5dusd"
Content-Disposition: inline
In-Reply-To: <576ed6ef-b961-9214-2c9b-56cb5b493b4e@redhat.com>
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
Cc: davidgow@google.com, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bilcjadqyeu5dusd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hi,

On Mon, Jun 06, 2022 at 03:49:57PM +0200, Javier Martinez Canillas wrote:
> Hello Maxime,
>=20
> On 6/6/22 15:42, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Jun 06, 2022 at 11:55:16AM +0200, Jos=E9 Exp=F3sito wrote:
> >> Test the conversion from XRGB8888 to RGB332.
> >>
> >> What is tested?
> >>
> >>  - Different values for the X in XRGB8888 to make sure it is ignored
> >>  - Different clip values: Single pixel and full and partial buffer
> >>  - Well known colors: White, black, red, green, blue, magenta, yellow
> >>    and cyan
> >>  - Other colors: Randomly picked
> >>  - Destination pitch
> >>
> >> How to run the tests?
> >>
> >>  $ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/drm \
> >>          --kconfig_add CONFIG_VIRTIO_UML=3Dy \
> >>          --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=3Dy
> >=20
> > It's not clear to me why you would need VIRTIO here? The Kunit config
> > file should be enough to run the tests properly
> >
>=20
> It's needed or otherwise KUnit will complain with:
>=20
> ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/drm/.kunit=
config
> [15:47:31] Configuring KUnit Kernel ...
> Regenerating .config ...
> Populating config with:
> $ make ARCH=3Dum O=3D.kunit olddefconfig
> ERROR:root:Not all Kconfig options selected in kunitconfig were in the ge=
nerated .config.
> This is probably due to unsatisfied dependencies.
> Missing: CONFIG_DRM=3Dy, CONFIG_DRM_KUNIT_TEST=3Dy
> Note: many Kconfig options aren't available on UML. You can try running o=
n a different architecture with something like "--arch=3Dx86_64".
>=20
> The following works correctly but it won't use User Mode Linux:
>=20
> ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/drm/.kunit=
config --arch=3Dx86_64

But then, can't we add them to .kunitconfig?

We should avoid that gotcha entirely

Maxime

--bilcjadqyeu5dusd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYp4GkwAKCRDj7w1vZxhR
xT6PAQDhwfp2fjJmUMUJPnpt4aT/XrvencrUwbHEHr3BC5MJmAEArrmm08IruivD
HYAgDNsHi3OXg1TE3K/2v9c95skILAw=
=d37x
-----END PGP SIGNATURE-----

--bilcjadqyeu5dusd--
