Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3B163EDB7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9102110E5AC;
	Thu,  1 Dec 2022 10:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E45D10E5AC
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 10:28:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 32628580452;
 Thu,  1 Dec 2022 05:27:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 01 Dec 2022 05:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1669890479; x=1669897679; bh=eip0JYxLwA
 AvXLG5NBGWWs0mG1joDIdVXmK8+H3wc1I=; b=Ifcsm7mFF1kDXPSQsE2BjtauEl
 4bwtK3ys+M8QAe1DT6cDljjLeiP9u7O0waPCTSzJZvOmYsNzMNupyKSk7RlXCn+z
 SIt1N4VnFoe4DRug4ptdM/z7kJGtGgRWYHRgCq/DKQ6rEmGJI/hv+ECAVO3zMQeo
 m/6LelTKZuZRwHGi73LM3aKWDMjnFswHYQHFCEMLH1tLxRaMBy4KGPefilNGDnna
 6EK9Iysjbf14LMFylHM+HCptA8YYGFlPnzMz5BBJ2Eh0H5sA0SE1O0qzDtKn1/0s
 9fwoHGL9mP8OuXk1t9ZuXLI8vy7GGe+YC/LR8Z/wxq+3RwzxSR5zYC46inuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669890479; x=1669897679; bh=eip0JYxLwAAvXLG5NBGWWs0mG1jo
 DIdVXmK8+H3wc1I=; b=jHUQhnx+FI055/Dk7FSqjW8PozYbbmB3jI+xMqePY5Jj
 0UQDS9Y8DOSGFbJpQ4QEN9aB7JffyVZkvEDR0TvX5/EzJf+vOAqw79xBlTUNz7+W
 KJ0LinhY/5xoBand1PEsJ0azU99iEa5mlvOM30ACai17rfRBbmuaM4K74XyirEBt
 3bdKNePuRK7UFfRbZL8DsWMnAinS/Nin6J9uI9cwHq1W2z0iwwD3dx8k2i25xwvt
 Nvl4b6krJS5AIgr1bDa3eNVaF4kqOl0r/OVmPhb/RYd1D44m+b6kCfijbWUlpNQD
 qpJjMNXHbnnt75kCuekTNKj6DTBZHrZDeWEHpqPKXw==
X-ME-Sender: <xms:roGIY3t5EVZ6P2nmvzYh2n3KX1wn5jjGpXvnR_UMoii3VMCt7HzlbA>
 <xme:roGIY4dX70cqC8xyYYQZj1dMJaBWiGC6MgELboTwMB-kZwhyR6iQLWrSjM5W5iWVU
 pgvIZu9hJ57oIJZQ44>
X-ME-Received: <xmr:roGIY6zmX2PjGrVQ_9LAsGEJTWJ3icluf8JDoPz0NpBX8paAhbeL7jtLsJzHakw2XJKg9g0Tz6XO_DNKI9Hurpfi1Whh19sUL2BOd8R4ZMhYlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:roGIY2Mrh4wLnI7uI2YewVbvhK3flXFU53LCcK--03OlrKntaKrl8w>
 <xmx:roGIY38vEFyFckc2pabqAl8ozfHf0tdmLRtbjwDz8NpJU2xRwCFSUA>
 <xmx:roGIY2XviimfKRkxKNJvK6RXgTp7kk1xgLBBWK0mjxWstfwn18GKsQ>
 <xmx:r4GIY8I0DibJnlROOBEyRBqM50z2I12pSKhLfsOYzZPX_ytFUHGQuQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 05:27:58 -0500 (EST)
Date: Thu, 1 Dec 2022 11:27:56 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 01/17] drm/tests: helpers: Move the helper header to
 include/drm
Message-ID: <20221201102756.cdvxu4iryhu3rjpf@houat>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
 <20221123-rpi-kunit-tests-v2-1-efe5ed518b63@cerno.tech>
 <ebe02c21-7770-0415-096e-76a839bad154@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mtc5qjwrdj4bgosl"
Content-Disposition: inline
In-Reply-To: <ebe02c21-7770-0415-096e-76a839bad154@redhat.com>
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
Cc: linux-kselftest@vger.kernel.org,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Gow <davidgow@google.com>,
 linux-media@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mtc5qjwrdj4bgosl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Javier,

On Wed, Nov 30, 2022 at 09:00:03AM +0100, Javier Martinez Canillas wrote:
> On 11/28/22 15:53, Maxime Ripard wrote:
> > We'll need to use those helpers from drivers too, so let's move it to a
> > more visible location.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/tests/drm_client_modeset_test.c            | 3 +--
> >  drivers/gpu/drm/tests/drm_kunit_helpers.c                  | 3 +--
> >  drivers/gpu/drm/tests/drm_modes_test.c                     | 3 +--
> >  drivers/gpu/drm/tests/drm_probe_helper_test.c              | 3 +--
> >  {drivers/gpu/drm/tests =3D> include/drm}/drm_kunit_helpers.h | 0
> >  5 files changed, 4 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/=
gpu/drm/tests/drm_client_modeset_test.c
> > index 52929536a158..ed2f62e92fea 100644
> > --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
> > +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> > @@ -8,12 +8,11 @@
> >  #include <drm/drm_connector.h>
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_drv.h>
> > +#include <drm/drm_kunit_helpers.h>
>=20
> I wonder if now that this header was moved outside of the tests directory,
> if we should add stub functions in the header file that are just defined
> but do nothing if CONFIG_DRM_KUNIT_TEST isn't enabled. So that including
> it in drivers will be a no-op.
>=20
> Or do you plan to conditionally include this header file in drivers? So
> that is only included when CONFIG_DRM_KUNIT_TEST is enabled?

I'm not entirely sure. I'd expect only the tests to include it, and thus
would depend on DRM_KUNIT_TEST already. But we can always add the stubs
if it's ever included in a different context.

> Another thing that wondered is if we want a different namespace for this
> header, i.e: <drm/testing/drm_kunit_helpers.h>, to make it clear that is
> not part of the DRM API but just for testing helpers.

If there's a single header, I don't think we need to create the
directory. This is also something we can consolidate later on if needed.

> But these are open questions really, and they can be done as follow-up:
>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks :)
Maxime

--mtc5qjwrdj4bgosl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY4iBrAAKCRDj7w1vZxhR
xRpOAQDHwNPpAQkoE6hXFx/5LBWCsUpiuUg3V17tLDsBtosnuAD/TKCoP+W/vHA/
r8y7Tk1Pv3JAJ6pNY93sYVLHX2HmKQM=
=Kavk
-----END PGP SIGNATURE-----

--mtc5qjwrdj4bgosl--
