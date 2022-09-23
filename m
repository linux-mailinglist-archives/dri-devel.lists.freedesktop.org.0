Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5915E7930
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 13:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C3110E85C;
	Fri, 23 Sep 2022 11:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A6310E84E;
 Fri, 23 Sep 2022 11:14:12 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EC446580219;
 Fri, 23 Sep 2022 07:14:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 23 Sep 2022 07:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663931649; x=1663938849; bh=U8iCHLFAXA
 03KunxPFzc62aKiSEd/kuLZlf3yHGCKvs=; b=KnfxfY7Xan2R/4k1btc8AOnQ76
 iapL04VVpwC3mc47Xy7W1ybrnD1B+GsvXIFtI8NCivc/3NvvFhKrGjyRSf8zqmBz
 h3oyGPndxWxRVfRDpUbc14sX5bSTJRat1pJNcdLKnFL5W5nTaYifVgElOvGp3KI+
 E9ax4ZkmVl6Z6BzFFIWjoZCeiSLc9HbAPr4f2xBDj7sW2WlZXAdybWq89LsngniV
 qDW59Qe5U4EnPdR3A+qAJI23fz97G00Jv7VBIbTDTaUawwJ0ohiBcYjqLlWgjgLf
 PnkoBElktz7rXP6uSVg98fzU5ETzORxC1FsOl1x+Qro/sgqAXssRV57flcgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663931649; x=1663938849; bh=U8iCHLFAXA03KunxPFzc62aKiSEd
 /kuLZlf3yHGCKvs=; b=1GhdtXSmXpYbKvsFs9JbbeWnAKG2XGmX2scD84UrYBfi
 5xsixll0/LQ9aZAnSFbrIUAh7jhK+uHTI2CUCZOfTgeCNwOKTg9k62U1eUCB2DBh
 kacuKD6ef9jZMedV6A7BDHPVujQQTga5+oQ/4ZNh3DZwP6OZvlR6gXGtRyU41V7t
 MoRZY8CdMqeG8L/U7N/B5MHYo7cFlxftdjPOjHJlb8wEaf3aprvkdwwO7Dcz4zEJ
 O6ybqeci288KeYjzCMFo1kPDOc0XickXrQo5fe1K9Jgh3uYx09LFELjFkvhhqBLp
 sc62E8aLibgzZhAMlGZX/8msotG7GTWkc7tjH8aPxg==
X-ME-Sender: <xms:AJUtY2xa1bk34l1pHTeeFyZSFR8XYGpS7RdYpivk6bGt8sXGIUQKmQ>
 <xme:AJUtYySkmhrE-td8_OS9SiOXKFpmkp0d18bkdwfgU5peHQl4FZm0ZvHTCDN8hua2E
 mI-QBptmV0YNwLF6vE>
X-ME-Received: <xmr:AJUtY4WT4MMS2L2fAvGxxlscWcbfOugjTcLumFJcpH419COuvEs87YYldelb79iSjqU6JfA-swpSmwhFHj6aBWiVOmXbhsZaa7c2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefiedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelueejheffvdetueeugfelteeigedtgfejvdfhffegjeehffekjeetgfef
 jeektdenucffohhmrghinhepkhhunhhithdruggvvhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AJUtY8i5p8Q5oDGyONfpJLocht4JJhZ0PDzuusO_NVh92D0XYWzYkg>
 <xmx:AJUtY4CO91y_-5wYfQ_-_V8bkgJPZ0qEQKMUuAuLUEtpMSneTEqMhA>
 <xmx:AJUtY9JIVd5aB0BLzvgr8rgJ9V52lbKx4HlFqJY9XHgQKAaSKJSjng>
 <xmx:AZUtYzbsLKdxOqkUmwsdNIJnDd-kHhg8D6i48JoU6mPEj3lD_CN6Uw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Sep 2022 07:14:08 -0400 (EDT)
Date: Fri, 23 Sep 2022 13:14:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 13/33] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
Message-ID: <20220923111405.mnspcuiwfzxyxix6@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
 <49ea7c7c-7d4c-8348-ea75-e0f376111e4c@suse.de>
 <b3c4ee65-fc56-f54c-3946-b6524fb36f72@redhat.com>
 <93969920-b5ed-ff15-48d4-02e2f9c23505@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4cwm4b5gx3ebmiqr"
Content-Disposition: inline
In-Reply-To: <93969920-b5ed-ff15-48d4-02e2f9c23505@suse.de>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4cwm4b5gx3ebmiqr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 12:30:09PM +0200, Thomas Zimmermann wrote:
> Am 23.09.22 um 11:26 schrieb Javier Martinez Canillas:
> > On 9/23/22 11:15, Thomas Zimmermann wrote:
> > > Hi
> > >=20
> > > Am 22.09.22 um 16:25 schrieb Maxime Ripard:
> > > > drm_connector_pick_cmdline_mode() is in charge of finding a proper
> > > > drm_display_mode from the definition we got in the video=3D command=
 line
> > > > argument.
> > > >=20
> > > > Let's add some unit tests to make sure we're not getting any regres=
sions
> > > > there.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > >=20
> > > > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm=
/drm_client_modeset.c
> > > > index bbc535cc50dd..d553e793e673 100644
> > > > --- a/drivers/gpu/drm/drm_client_modeset.c
> > > > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > > > @@ -1237,3 +1237,7 @@ int drm_client_modeset_dpms(struct drm_client=
_dev *client, int mode)
> > > >    	return ret;
> > > >    }
> > > >    EXPORT_SYMBOL(drm_client_modeset_dpms);
> > > > +
> > > > +#ifdef CONFIG_DRM_KUNIT_TEST
> > > > +#include "tests/drm_client_modeset_test.c"
> > > > +#endif
> > >=20
> > > I strongly dislike this style of including source files in each other.
> > > It's a recipe for all kind of build errors. Can you do something else?
> > >=20
> >=20
> > This seems to be the convention used to test static functions and what's
> > documented in the Kunit docs: https://kunit.dev/third_party/kernel/docs=
/tips.html#testing-static-functions
>=20
> That document says "...one option is to conditionally #include the test
> file...". This doesn't sound like a strong requirement.

No, but this is the only option documented, which still indicates a very
strong preference.

> > I agree with you that's not ideal but I think that consistency with how
> > it is done by other subsystems is also important.
> > > As the tested function is an internal interface, maybe export a wrapp=
er
> > > if tests are enabled, like this:
> > >=20
> > > #ifdef CONFIG_DRM_KUNIT_TEST
> > > struct drm_display_mode *
> > > drm_connector_pick_cmdline_mode_kunit(drm_conenctor)
> > > {
> > >     return drm_connector_pick_cmdline_mode(connector)
> > > }
> > > EXPORT_SYMBOL(drm_connector_pick_cmdline_mode_kunit)
> > > #endif
> > >=20
> > > The wrapper's declaration can be located in the kunit test file.

And I'm afraid this just doesn't scale. If we start testing more and
more static functions, do we really want to have that wrapper for each
of them?

> > But that's also not nice since we are artificially exposing these only
> > to allow the static functions to be called from unit tests. And would
> > be a different approach than the one used by all other subsystems...
> >=20
>=20
> There's the problem of interference between the source files when building
> the code. It's also not the same source code after including the test fil=
e.
> At a minimum, including the tests' source file further includes more file=
s.
> <kunit/tests.h> also includes quite a few of Linux header files.
>=20
> IMHO the current convention (if any) is far from optimal and we should
> consider breaking it.

I mean... this is a discussion about theoretical issues. If there is
indeed some regular build errors on this, then sure, we can change it.

I'm confident that will affect pretty much every one using kunit equally
though, so I'm fairly sure the documentation itself will have changed.

But right now we're discussing an alternative because of a problem we
never experienced. I don't see the point of breaking the consistency
provided by the documentation for something not backed by any actual
problem.

Maxime

--4cwm4b5gx3ebmiqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYy2U/QAKCRDj7w1vZxhR
xbjnAQDguqVberZj4t3P9J7J+oQg19WB9p14JwDj9eYuF79RiAEAjgZAHDUtrTKk
vCbaI/ojPoO94K+YindeHthKWzTZrwo=
=uI0t
-----END PGP SIGNATURE-----

--4cwm4b5gx3ebmiqr--
