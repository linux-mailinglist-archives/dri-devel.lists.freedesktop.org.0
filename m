Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B86B40028
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A511610E69C;
	Tue,  2 Sep 2025 12:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YjxLry+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4402F10E69B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 12:22:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CF5D640BFF;
 Tue,  2 Sep 2025 12:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3778AC4CEF9;
 Tue,  2 Sep 2025 12:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756815750;
 bh=WNvwZbGhhRwiEb2NPZN3SCJ15SAxBEIHxjUM1lFStyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YjxLry+kEeJUnxV6320vUXHUgAtysOdDe1jnnqQakBn7XHkLy8IoCYiz8XaXyarnp
 bWqO7UB1DMQbu6g/GNEI/9c683OShl1Tm5ybjq3HTAJ0dXNzeBgLPPvO/SE7jgcA6c
 on9jzYxcdrpIA8yMU+NHVWtno+Lr2A3a7ziQdUWLsRYUGyi58FjZMBnWq/r9qjRrVt
 moZAi2g3uJsCbVOi+L0c9EDWk68EAcF57Jl4mdwJ2fRqfB31D0uMEk7wcBGy/tp+kM
 ZrDCqn2GQow2szfYXf3yfR8Z0EfenYPsDinvAIX+5UA855oKs6nUJqJgTB/whvPG1t
 ttqlMwa6eVV5A==
Date: Tue, 2 Sep 2025 14:22:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Zijun Hu <quic_zijuhu@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
Message-ID: <20250902-speedy-friendly-alpaca-f80709@houat>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
 <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
 <aJJ9ttmL7wiw41fY@smile.fi.intel.com>
 <20250814183609.3788a6df@booty>
 <aKXRHAyfPHPpZmMs@smile.fi.intel.com>
 <20250902135709.19e1ef54@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ha3ss3lic4lbxxde"
Content-Disposition: inline
In-Reply-To: <20250902135709.19e1ef54@booty>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ha3ss3lic4lbxxde
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 01:57:09PM +0200, Luca Ceresoli wrote:
> Hello DRM maintainers,
>=20
> On Wed, 20 Aug 2025 16:43:56 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>=20
> > On Thu, Aug 14, 2025 at 06:36:09PM +0200, Luca Ceresoli wrote:
> > > On Wed, 6 Aug 2025 00:55:02 +0300
> > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > >  =20
> > > > On Fri, Aug 01, 2025 at 07:05:23PM +0200, Luca Ceresoli wrote: =20
> > > > > Add an equivalent of list_first_entry_or_null() to obtain the las=
t element
> > > > > of a list.   =20
> > > >=20
> > > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> =20
> > >=20
> > > Thanks Andy!
> > >=20
> > > However I'm not sure when and where this should be applied.
> > >=20
> > > Except for this one patch, all patches in the series are for
> > > drm-misc-next. Also, patch 1 is currently not needed by any other
> > > series AFAIK.
> > >=20
> > > Based on the above, is it correct to assume that the whole series can
> > > be applied on drm-misc-next? (when other patches will have a
> > > R-by/Ack-by of course)
> > >=20
> > > Also, is Andy's A-by enough to apply this patch? =20
> >=20
> > The list.h is common for many, I think going via DRM with my Ack is eno=
ugh
> > based on the Git history of my changes in this file. But if you want mo=
re
> > reliable source, get an Ack from Andrew Morton.
>=20
> While applying this patch with dim on drm-misc-next, dim push-branch
> failed because:
>=20
>   dim: ERROR: cb86408b1fc2 ("list: add list_last_entry_or_null()"): Manda=
tory Maintainer Acked-by missing., aborting
>=20
> Looking at the dim code, it is looking for a Reviewed- or Acked-by from
> people listed by `scripts/get_maintainer.pl --no-git-fallback -m --nol
> --norolestats`. but that command returns an empty string, so it will
> never allow me to push.
>=20
> How can I get that commit pushed to drm-misc-next?

Adding a MAINTAINERS entry for it would be nice too

Maxime

--ha3ss3lic4lbxxde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLbhewAKCRAnX84Zoj2+
dkQBAYDszpV6SGYWBTBgJCvIUpiseT/exARuDvzdOQmtFKiQnfCnA6jnGgP8dcxi
1t81QSABfjclCtf2qV5ucKcKjfmq3i46LSX4vnLy8fnGVrq09f1F1r8yuY2lSQs0
Cp9wkfBFxA==
=G+6D
-----END PGP SIGNATURE-----

--ha3ss3lic4lbxxde--
