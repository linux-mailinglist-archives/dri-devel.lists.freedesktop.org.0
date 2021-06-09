Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA71C3A14B7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 14:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4F36E05C;
	Wed,  9 Jun 2021 12:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B3F6E05C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 12:43:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4B1761183;
 Wed,  9 Jun 2021 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623242599;
 bh=3LmDIUZ1wKlG81I+AFVUAzlVq2kCXIgwekcGWmo3BKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pTrySzzH01xRqI6y+qazicvHLm3iUahU9lnsc49IiCQ3YhpFE1MGZmItjImUulTSl
 MTRFsckWs8M5r1tfrx9B1xss2tIBYo7mP9xDz9QvZyyHwxfPhKHCu0uD0+Vm2N03KG
 efqwhhxFl9HaT+aduguKYCqVi7iEE9OxgKF6gM0OROhOMWh178CnByE4KEur/yTy9L
 z/yAapPpoQtCE+lxO14rkrnEpAPHzKFYWUwtlKyoLCarKsKopozI0ezGJdI92mgpV9
 fhAVh/cqpu7lxRpBJ3Y97QebzByy2Ff9nk+bjy8MuaBdEX6s5RC5QZRUtpeoBFkcRi
 DlTmnMxs4axQQ==
Date: Wed, 9 Jun 2021 13:43:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 04/12] ASoC: hdmi-codec: Add iec958 controls
Message-ID: <20210609124304.GB5052@sirena.org.uk>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline
In-Reply-To: <20210525132354.297468-5-maxime@cerno.tech>
X-Cookie: Alex Haley was adopted!
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


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 03:23:46PM +0200, Maxime Ripard wrote:
> The IEC958 status bits can be exposed and modified by the userspace
> through dedicated ALSA controls.
>=20
> This patch implements those controls for the hdmi-codec driver. It
> relies on a default value being setup at probe time that can later be
> overridden by the control put.

This breaks bisection:

/mnt/kernel/sound/soc/codecs/hdmi-codec.c: In function 'hdmi_codec_hw_param=
s':
/mnt/kernel/sound/soc/codecs/hdmi-codec.c:504:50: error: invalid type argum=
ent of '->' (have 'struct hdmi_codec_params')
  memcpy(hp.iec.status, hcp->iec_status, sizeof(hp->iec_status));
                                                  ^~

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDAt1cACgkQJNaLcl1U
h9AuAwf6A2ho54/TuWajEspKMKa3Y8mJqdCmq/szJ3u4iWTqPzBREw/Xyol8SXcW
adYBtoSaS/Q6yh0OoY9A33TJwzQKwX4ZYow8t0KEmz7s/snT7Jgz8TUZPDE4ZEZb
hHB/oXRVboMFrY62HeW+SnN/4A3D0ooOalNMNrV3/Abzjm9isJqafRKkj2dr8ymG
7iplj1Rip+CLrhpSUi1ZF8aFTzqO7mckdD2pt/UN6k+aZ2oac65WgHhxOWt2m0q7
Zl0ZPA2J9rTqse01tGxJ2GfVommjEFXKkcZStuzvWN2vfM4En0fdyUsU0hlghy+o
15yz8IgChSQ1PGgdfwwc5YpcBvx2pw==
=Ztwb
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
