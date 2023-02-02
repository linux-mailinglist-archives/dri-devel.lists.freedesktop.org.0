Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08232687D69
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 13:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F7C10E505;
	Thu,  2 Feb 2023 12:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D3110E505
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 12:36:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C06F5C011C;
 Thu,  2 Feb 2023 07:36:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 02 Feb 2023 07:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1675341389; x=1675427789; bh=waVi4UTopf
 u55k3kJ/RsYCcyA3+rmCweChcJDhyw1w8=; b=d9wWWbtvu4DEaQwyXgwdDW5+8v
 ye+4t/kGDxMkVboERgUB0E1c/y2TMzsn39GQQedg+bFg/jJz8gTHa5Zh9rqOR7Pf
 aXlaho8OgBT3gO8HlG8yv/ePpwvUjDCrIZP9BWfs48oAlz6yolf5UzFLXYZOPyde
 L2XQwSmQM6UsSPJNi2emRdFrbFwfteXYwZB3QyKO7Nd9p5N2BrifgE6IEsOqXTTY
 JbdIYFuwppbKn9RILhCXQ7D+XhpbGyaD2shaRqUTCHHWSR1SRr1TQzLlIU2yzYjs
 3YeoolUGbsxdTFKk2zsUt2xewf9E6Th3YwgXEF9QpW1C1ymGBDahth4UEw9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1675341389; x=1675427789; bh=waVi4UTopfu55k3kJ/RsYCcyA3+r
 mCweChcJDhyw1w8=; b=CbAm7BqHKGeFnXi0FM4B4sWX3Xib6Co3LWhPuU4scBR0
 srZhytb8yWhWq+k0gUMM5qF2AALZdxuBJcnuSWK1lC2FbHpeo7FGitfUB60Dgp4g
 ZkYNuFoMykzlr9YjkjGLAmXFhHCXrGZTgPmSwl4IC4NZNyCjrpm9hQOpCanYBTgB
 SR8Z1OSjEsPDFHUaxSZVe7Vd0tVVW+TMB02mwv+isHkiybIXq7Y2rjv++YAl51IF
 XLICZMAQ5JWiwtrBdKGGKWN5JGdfKGCOXgC9xNvN9I4t6kMwHI4QhTGkkf9NBKKs
 5rPhEG+mDaUHqFN1h0yiusKXP34SbSX0vTSR4B620Q==
X-ME-Sender: <xms:Ta7bY5lSg6tifNUXAHKwfmzI_lXuNFqbapHdh31XlNEk5NeJHTwF7A>
 <xme:Ta7bY029IR6LG4KXbsDYNP1amVbTwW3o6cp2PbwUedctUHjuPwTkApkIUHOr55Fga
 z0eX6YU_aznUt5aLf4>
X-ME-Received: <xmr:Ta7bY_ofzWSbR-7k8MyML-bZlGcAj4Uoey-7TYO6Y1OiIrTj_DNW1oOGZiIXZxuLhRvKDXgOIoZf_SPuGHKiDhscHlonRjzvM50y1zXmzWhceQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ta7bY5mlbMGKa5P3SLdE78999epK997PxqwVf_565B7V7cly0As0gA>
 <xmx:Ta7bY328WYuZN3KgvycvoRmnNlZQTDV16xoV59nhWxnY6JK4-vR2Bg>
 <xmx:Ta7bY4srsJ40X6rtOhTITHvEIwlGsyMdxPIbURXwZl8Oke8Z8YlOzQ>
 <xmx:Ta7bYwtoTO6QUT6xLyLwu97pShkccVihIQfPwbZykGyE3OgxvJpE5g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 07:36:28 -0500 (EST)
Date: Thu, 2 Feb 2023 13:36:27 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/client: Convert to VISIBLE_IF_KUNIT
Message-ID: <20230202123627.yz23jowt33cfmm7z@houat>
References: <20230202110312.808607-1-maxime@cerno.tech>
 <a199df89-4dc4-0eff-e25b-4af44f2e020d@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="23jyfanv2mruorpt"
Content-Disposition: inline
In-Reply-To: <a199df89-4dc4-0eff-e25b-4af44f2e020d@igalia.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--23jyfanv2mruorpt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 08:31:27AM -0300, Ma=EDra Canal wrote:
> Hi Maxime,
>=20
> On 2/2/23 08:03, Maxime Ripard wrote:
> > Commit 8fc0380f6ba7 ("drm/client: Add some tests for
> > drm_connector_pick_cmdline_mode()") was meant to introduce unit tests
> > for the static drm_connector_pick_cmdline_mode() function.
> >=20
> > In such a case, the kunit documentation recommended to import the tests
> > source file directly from the source file with the static function to
> > test.
> >=20
> > While it was working, it's generally frowned upon. Fortunately, commit
> > 9c988fae6f6a ("kunit: add macro to allow conditionally exposing static
> > symbols to tests") introduced macros to easily deal with that case. We
> > can thus remove our include and use those macros instead.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/gpu/drm/drm_client_modeset.c | 11 ++++++-----
> >   1 file changed, 6 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm=
_client_modeset.c
> > index 1b12a3c201a3..f48882941852 100644
> > --- a/drivers/gpu/drm/drm_client_modeset.c
> > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > @@ -8,6 +8,9 @@
> >    */
> >   #include "drm/drm_modeset_lock.h"
> > +
> > +#include <kunit/visibility.h>
> > +
> >   #include <linux/module.h>
> >   #include <linux/mutex.h>
> >   #include <linux/slab.h>
> > @@ -159,7 +162,8 @@ drm_connector_has_preferred_mode(struct drm_connect=
or *connector, int width, int
> >   	return NULL;
> >   }
> > -static struct drm_display_mode *drm_connector_pick_cmdline_mode(struct=
 drm_connector *connector)
> > +VISIBLE_IF_KUNIT struct drm_display_mode *
> > +drm_connector_pick_cmdline_mode(struct drm_connector *connector)
> >   {
> >   	struct drm_cmdline_mode *cmdline_mode;
> >   	struct drm_display_mode *mode;
> > @@ -215,6 +219,7 @@ static struct drm_display_mode *drm_connector_pick_=
cmdline_mode(struct drm_conne
> >   	return NULL;
> >   }
> > +EXPORT_SYMBOL_IF_KUNIT(drm_connector_pick_cmdline_mode);
> >   static bool drm_connector_enabled(struct drm_connector *connector, bo=
ol strict)
> >   {
> > @@ -1233,7 +1238,3 @@ int drm_client_modeset_dpms(struct drm_client_dev=
 *client, int mode)
> >   	return ret;
> >   }
> >   EXPORT_SYMBOL(drm_client_modeset_dpms);
> > -
> > -#ifdef CONFIG_DRM_KUNIT_TEST
> > -#include "tests/drm_client_modeset_test.c"
> > -#endif
>=20
> As you removed this guard, you need to add drm_client_modeset_test.o
> to tests/Makefile, otherwise, drm_client_modeset_test won't compile.

Urgh, thanks for noticing this. I'll fix it up in a v2

Maxime

--23jyfanv2mruorpt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY9uuSwAKCRDj7w1vZxhR
xcgMAP0UEnl0aRDMNw2Bsxezez4yjgAJl3S4q+DEwj5Su0eooQEA4dDam1TZn8Ub
Pr9foFNfam0hLCBJGCONccYwMKcIoAg=
=/+je
-----END PGP SIGNATURE-----

--23jyfanv2mruorpt--
