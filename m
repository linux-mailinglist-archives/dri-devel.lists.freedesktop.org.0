Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DC629BAEA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C1A6E102;
	Tue, 27 Oct 2020 16:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2356E102
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:27:01 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 385F121655;
 Tue, 27 Oct 2020 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603816020;
 bh=kM+q5a/4CSozUbBt556ksVRBHVXOCmkxyQA/MctuzVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J0pkkZf0nkd5hT9kQnPgSGqY293gEZG5Qc5BHBXrcbnsjmpn7NKuFW75bGu28c4a/
 EeqnOK5o8KAPYd5pBFQmUXT4YcTrGa19RXW64meYpoXNSnooTYR5sgm17RtcwuREzK
 bdrStVPco0ZHfBJlJZTfCPNBx1yXpBkD0ZP8f7/o=
Date: Tue, 27 Oct 2020 16:26:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/vc4: hdmi: Avoid sleeping in atomic context
Message-ID: <20201027162655.GB4895@sirena.org.uk>
References: <20201027101558.427256-1-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20201027101558.427256-1-maxime@cerno.tech>
X-Cookie: That's no moon...
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alsa-devel@alsa-project.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============0948801066=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0948801066==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2020 at 11:15:58AM +0100, Maxime Ripard wrote:
> When running the trigger hook, ALSA by default will take a spinlock, and
> thus will run the trigger hook in atomic context.

Reviewed-by: Mark Brown <broonie@kernel.org>

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+YSk4ACgkQJNaLcl1U
h9Cr7AgAhRoOc4Gjttyj+tM4Dayl68xyuva+089cuxgC2SZpu4kBZCMfygj42A1b
XyU1mHn4CDblQ9xUZWdn5nhjNlxwhFLswRxz/f42ZiwsKk/GmYkiPEUM8gi31jBh
VyoWXXcDVeb+sUZi6wo7Oqca3PBC6xhUsdIVUh+zAksbJ6nTPKv5H+x3JnSY+l1A
Uk8k8xz9k00PdUJ08F6yLDFgWOIpurIRfrgcoSw69XXlcc2EOn55rf5k6ahS2jox
xw4p3amLaWmdna+zkFZEgorUskjjxO5tfcZenKZMTgXqvEjYo0h0Hl1d9qYwTxM0
P6XTxa6tghfpUovKg2IG87FZ1BZV2g==
=DS6+
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--

--===============0948801066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0948801066==--
