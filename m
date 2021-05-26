Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EB33915D8
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C676F6EC87;
	Wed, 26 May 2021 11:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402476EC87
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ApStfRDU0a2Bcxs0DU/lRdHOKyM7PDXIMldhjFKUC1g=; b=JzBt+Vx/khdrcQKa/bcrJCd6Zx
 fy2Ur+KbJUCQu1V1LvcbfXGMIpq0u2XGgTsHwqL30rHarLjr6Xz6zVL1S9wsQnQ6PHVGSK2FIujAL
 TKSE7rn7w5l1aH2jN1YNF5v2xXXSAyKpOYiIC3Jx24xd/ETeQhNWS7t3T/uOUNTrTawc=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1llqvN-005xlj-Gk; Wed, 26 May 2021 10:38:05 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 93E77D05836; Wed, 26 May 2021 11:38:40 +0100 (BST)
Date: Wed, 26 May 2021 11:38:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 03/12] ASoC: hdmi-codec: Rework to support more controls
Message-ID: <YK4lMLG6PlxzDJhs@sirena.org.uk>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eIFZBnIxpSROlH5X"
Content-Disposition: inline
In-Reply-To: <20210525132354.297468-4-maxime@cerno.tech>
X-Cookie: Ahead warp factor one, Mr. Sulu.
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
Cc: alsa-devel@alsa-project.org, Tim Gover <tim.gover@raspberrypi.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Dom Cobley <dom@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eIFZBnIxpSROlH5X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 25, 2021 at 03:23:45PM +0200, Maxime Ripard wrote:
> We're going to add more controls to support the IEC958 output, so let's
> rework the control registration a bit to support more of them.

Acked-by: Mark Brown <broonie@kernel.org>

--eIFZBnIxpSROlH5X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCuJS8ACgkQJNaLcl1U
h9ABYQf/acYuDAkB3WhiZ1hCCQpVdonll1Aj3jSnr5WtK5yitGmh8cYms3T5uWUE
XmT9B52fCJh6IAHjAm9XZbBWm49ShM/pgA00Q6otZDb8zVSS6v39HIFvnRDDsRNx
ASGbUOdr4Z/1kPc4n8UDKlq45Dz8985Rtfoh5QknQEeD5P0zvNViwWcfjmVZ2UQ+
qJk9oC/WJIxhR6PyY8x0XbI4plfCO4WvEG9dEdKE4navagTtBVa5e9RxF1wyXK9r
dDaL9bRcRigdba+/DRBjrDrJEDQM5GUe9yT+znvJzcqmkPYt9q2qe6Wen6UxjKrf
seBlUHvVi2p9QEVe3haqTNcmB5vqzQ==
=RH7S
-----END PGP SIGNATURE-----

--eIFZBnIxpSROlH5X--
