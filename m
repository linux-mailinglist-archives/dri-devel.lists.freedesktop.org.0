Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58457524B2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 16:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F384710E6E8;
	Thu, 13 Jul 2023 14:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B956610E6E8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 14:11:09 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJx1c-0007fw-8f; Thu, 13 Jul 2023 16:10:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJx1V-00E8dn-6F; Thu, 13 Jul 2023 16:10:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJx1U-004ZOk-Ff; Thu, 13 Jul 2023 16:10:24 +0200
Date: Thu, 13 Jul 2023 16:10:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Message-ID: <20230713141023.52dkz5ezicwev74w@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com>
 <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
 <2ypl3btshoovedyyq7jaohjgmwr7egnhazuxuffbxudlljktml@syv5u27skpqr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eytq45gyqdlpfjx7"
Content-Disposition: inline
In-Reply-To: <2ypl3btshoovedyyq7jaohjgmwr7egnhazuxuffbxudlljktml@syv5u27skpqr>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, kernel@pengutronix.de,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Julia Lawall <julia.lawall@inria.fr>, Luben Tuikov <luben.tuikov@amd.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eytq45gyqdlpfjx7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Maxime,=20

On Thu, Jul 13, 2023 at 01:17:43PM +0200, Maxime Ripard wrote:
> On Thu, Jul 13, 2023 at 12:39:40PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Thu, Jul 13, 2023 at 12:23:50PM +0300, Jani Nikula wrote:
> > > On Thu, 13 Jul 2023, Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.=
de> wrote:
> > > > after most feedback for my series "drm/crtc: Rename struct drm_crtc=
::dev
> > > > to drm_dev"[1] was positive in principle, here comes a new series.
> > >=20
> > > I find it obnoxious to send a new series within 24 hours of the first,
> > > while the discussion is still in progress, and it's a misrepresentati=
on
> > > of the in-progress dicussion to say most of the feedback was positive.
> > >=20
> > > This is not the way to reach consensus.
> >=20
> > Let me tell you I didn't had any obnoxious intentions when sending this
> > new series. I honestly still think that the feedback was mostly positive
> > to the idea to get rid of struct drm_device *dev. Most discussion was
> > about splitting the series and the right name to use instead of "dev".
>=20
> And then you have a former and current maintainers that tell you that
> they'd prefer not to merge it at all.

I went back to the previous thread rereading the replies I got yesterday
(i.e. the ones I was aware when I started to respin the series). By then
following people stated their opinion:

 - Paul Kocialkowski
   Is happy with the status quo
   naming: drm_dev > { drmdev, drm }
 - Thomas Zimmermann
   All data structures should be converted
   naming: drm > *
 - Javier Martinez Canillas
   Generally in favour (also via irc)
   Wants a single patch
   naming: drm > drm_dev > dev
 - Russell King
   Sent a "Reviewed-by, Thanks"
 - Christan K=F6nig
   Wants a single patch
   naming: don't care
 - Maxime Ripard
   Wants a single patch
 - Sui Jingfeng
   no union
   naming: { drm, ddev } > drm_dev > dev
 - Luben Tuikov
   Wants a single patch
   naming: drm_dev > { drm, dev }
 - Jani Nikula
   unnecessary change.(is this a "no" or a "don't care"?)
   naming: drm > *
 - Sean Paul
   doesn't like this change

I admit I'm not aware about the roles here, but up to then only Sean
Paul wrote a clear no and maybe Jani Nikula a small one. I interpreted
Paul Kocialkowski's replay as indifferent to the renaming. All others
were in favour or only criticised details and naming.

What did I miss (apart from today's replies which indeed are more
negative:

 - Thierry Reding=20
   Agreed to Jani Nikula that this change is
   unnecessary, also understood that for non-DRM people it might be
   confusing.
   naming: dev > drm > *
 - Thomas Zimmermann
   Agreed to Sean Paul about the too high downsides
 - Geert Uytterhoeven
   In favour (also before via irc)
)?

> Ignoring those concerns

I'm really surprised by this suggestion. Either I really missed
something, or I'd like to ask these maintainers to communicate in a more
obvious way. If I send a series and I get feedback like "If you rename
drm_crtc.dev, you should also address *all* other data structures." (by
Thomas Zimmermann) or "When you automatically generate the patch (with
cocci for example) I usually prefer a single patch instead." (by
Christan K=F6nig) then I would expect that if they oppose the underlying
idea of the series they would say so, too. I'm sorry, I cannot read a
concern (to the underlying idea) from these replies. And so I addressed
the feedback about the details with a new series to have an updated base
for the discussion.

> and then sending a new version right away is, if not obnoxious,
> definitely aggressive.

If this is how you experience my submission even after I tried to
explain my real intentions, I'm sorry. And I'm sure there is a deep
misunderstanding somewhere.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--eytq45gyqdlpfjx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSwBc4ACgkQj4D7WH0S
/k6IOgf/ZvAaUMNXAU5w+OZXYps6wa2Nv/xki0relZOppUs1f28PPzwYrzh7kdrm
L09pU98OxQ0v/jeOWM7q5RMx2YQMqD8+zPHE2qGzVUyYOLES2ejPHOfcbYHQjMon
zi8Syin10MaueBNTQb4o62ssaslKA+sj7yByNCaEXHK4Gxi1d+UuvUDsXRiWX6Dk
77uYOm7/5/HU76bpYQ+gTCYSZeC6kA2tuOAc+Jumwtl15LwfsHEIKmec3N5CE4vc
XRrAE9Zrg8mIiEVmkp4+Sl7lgGmuy1cxMiIPqNcnur51uYkSaQWSgRi+mdTk+Add
Paem615LaN6gh8fXXC84Vv8i/IY1kA==
=G4PD
-----END PGP SIGNATURE-----

--eytq45gyqdlpfjx7--
