Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D981B2DA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 10:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3030810E321;
	Thu, 21 Dec 2023 09:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5A810E321
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 09:48:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 37270B81824;
 Thu, 21 Dec 2023 09:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14724C433C7;
 Thu, 21 Dec 2023 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703152094;
 bh=c2g5y6kiflVeNGhN8PpT0D5trQyz7k/JpEp8prWhHD0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SzlTHP+AeHmHs9xY452PnUZTHwFg60YYT0FJu680NOPj0v9145EzPbhwRRtmA1Esj
 4ULy8sC4WkHmR9QGMMGTzXOluYJZMa2F+ndbnzGsF/OLd0hCRJOZgqe/XVTSGrniSK
 pklfkmNpf9mXVFn/k3PNvymX39dITY+51a6wURsydk51TIeiJ7w90zDED7Yap0huVP
 Nb7jFWRNpXWvKfLgyF1Oqr4EfpNwTVKPb7grehwdAHJcLjCaDUaYi1nw9CYKm9r1xw
 jT8DJ7nl0AzN8oj6sglFzNTo+GidWcqcVKQ+tN4pwmrDbM42e4syVQSMZtaKm4g/rL
 9/flXmtRsY6mQ==
Date: Thu, 21 Dec 2023 10:48:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4] ASoC: hdmi-codec: drop drm/drm_edid.h include
Message-ID: <eexfqzmhm7z4gausmjqhqklidz7crfq3io4vwxsspfixkd4uqx@cayecc5z6uvg>
References: <20231214092856.4019251-1-jani.nikula@intel.com>
 <20231219121210.1076152-1-jani.nikula@intel.com>
 <8734vvuccx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7o3xr7p4t4lcajc6"
Content-Disposition: inline
In-Reply-To: <8734vvuccx.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Emma Anholt <emma@anholt.net>, linux-arm-msm@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-sound@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7o3xr7p4t4lcajc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 11:35:42AM +0200, Jani Nikula wrote:
> On Tue, 19 Dec 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > hdmi-codec.h does not appear to directly need drm/drm_edid.h for
> > anything. Remove it.
> >
> > There are some files that get drm/edid.h by proxy; include it where
> > needed.
> >
> > v2-v4: Fix build (kernel test robot <lkp@intel.com>)
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > ---
> >
> > I'm pretty sure I haven't compiled everything that might implicitly
> > depend on the include. However, the right thing to do is to include
> > drm_edid.h where needed, not from somewhat random intermediate
> > headers. I hope this uncovers anything I missed.
>=20
> The kernel test robot came back with clean results.
>=20
> Added a bunch more Cc's here. Ack to merge this via drm-misc-next,
> please?

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--7o3xr7p4t4lcajc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZYQJ2wAKCRDj7w1vZxhR
xSW0AQCJlH99BsxjepYQObIU2W6v087aYxO8BzYL4hwVes27CgEAvgEDL2E/HZHk
AfQBYylYm1Rf70+sI6J67z8P6Brc6QM=
=yy41
-----END PGP SIGNATURE-----

--7o3xr7p4t4lcajc6--
