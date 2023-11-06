Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D727E250B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F1610E31B;
	Mon,  6 Nov 2023 13:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7556610E319;
 Mon,  6 Nov 2023 13:27:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E3D7AB80F63;
 Mon,  6 Nov 2023 13:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A15C433C7;
 Mon,  6 Nov 2023 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699277253;
 bh=Vu0muShwvRqsL9wegAEVP9IkcMiLR8CQSs1+kTxcN+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qfV5+5U4Hh2ssX+TWR27iwjuE/QZJ4Us4gyBB7P9vLLarquCMpYRWglUwbS3anF9j
 kav90yc4qloC2+jbLCkirbaXrWfvZRrDuYq2DEYMdaRdqP7H1x83gv8VfqZfOYGYQ3
 hN7jHdt7M8B/X2vo+xykObTazi9yoxwYzNn7ihlu4d10vyUSLpOy8T6HMn+vPUGJ97
 kK42Q/4n0GFy9lnyAuEtO4wp4RCSWGXGuyX+wRPfGEeo9FpV433cRO45As+WDbeaMX
 iGvqz2iF0AwE6eZ7WqPXMVY8sp8+NvskFSGAGgT46vnKr+TbsYP3NZZkS22TIYX47h
 X2MMMLrFhwSwQ==
Date: Mon, 6 Nov 2023 14:27:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "Manna, Animesh" <animesh.manna@intel.com>
Subject: Re: [PATCH v7 1/6] drm/panelreplay: dpcd register definition for
 panelreplay
Message-ID: <elcebygxs432bcj7oez7ndlfvb3lru7m7yznyqp2ei4ocjkvxp@23lf2rh45fmt>
References: <20231011110936.1851563-1-animesh.manna@intel.com>
 <20231011110936.1851563-2-animesh.manna@intel.com>
 <87jzqz194w.fsf@intel.com>
 <BL1PR11MB5979BF8B55E730D76DD29345F9AAA@BL1PR11MB5979.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mowf5xwkcgpkc23e"
Content-Disposition: inline
In-Reply-To: <BL1PR11MB5979BF8B55E730D76DD29345F9AAA@BL1PR11MB5979.namprd11.prod.outlook.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Hogander,
 Jouni" <jouni.hogander@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mowf5xwkcgpkc23e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2023 at 01:01:19PM +0000, Manna, Animesh wrote:
>=20
>=20
> > -----Original Message-----
> > From: Nikula, Jani <jani.nikula@intel.com>
> > Sent: Friday, November 3, 2023 2:55 PM
> > To: Manna, Animesh <animesh.manna@intel.com>; intel-
> > gfx@lists.freedesktop.org; Maxime Ripard <mripard@kernel.org>; Thomas
> > Zimmermann <tzimmermann@suse.de>; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>
> > Cc: dri-devel@lists.freedesktop.org; Manna, Animesh
> > <animesh.manna@intel.com>; Hogander, Jouni
> > <jouni.hogander@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
> > Subject: Re: [PATCH v7 1/6] drm/panelreplay: dpcd register definition f=
or
> > panelreplay
> >=20
> > On Wed, 11 Oct 2023, Animesh Manna <animesh.manna@intel.com> wrote:
> > > Add DPCD register definition for discovering, enabling and checking
> > > status of panel replay of the sink.
> > >
> > > Cc: Jouni H=F6gander <jouni.hogander@intel.com>
> > > Cc: Arun R Murthy <arun.r.murthy@intel.com>
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> >=20
> > Maarten, Maxime, Thomas -
> >=20
> > Ack for merging this via drm-intel-next?
>=20
> Ping!

Ack

Maxime

--mowf5xwkcgpkc23e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUjpwgAKCRDj7w1vZxhR
xTFwAQD3Pk8HTgJrz0YAsbzsQD8R1JJymcwV9KvzYnYGcV963AEAnA69tsX2Z0N9
cmT12vHmLGqDCqVuN3iITJGpIaV4vwQ=
=EHzr
-----END PGP SIGNATURE-----

--mowf5xwkcgpkc23e--
