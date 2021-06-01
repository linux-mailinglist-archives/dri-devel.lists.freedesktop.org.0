Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC739735E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 14:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859CF6E197;
	Tue,  1 Jun 2021 12:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0298B6E197
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 12:36:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EAF960FE5;
 Tue,  1 Jun 2021 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622550994;
 bh=2+ivin/diukkvPRUMoKU7rL59DqrYfnBewenIeEPcR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VShp+p8WU+C5SXju/x1RnursJXYFwXVm7kesfGEsdonSYFoSZH9jyRF7NbXcLShI3
 JM41GwjxJ0leXNp6dr43QUoXpTwvsbUyZU/0gLMBIyiUDy1dwQjeMcdkJdY/wcEMZ1
 VjMzvekTSawV8DgJ/wfyLitvuN8mFMwYoNTQIxuw79ewrg4CLv3V+0UbcW+Ci5gOFf
 Kf2HGNtM6nkTg719e4HTUrDNsJyothhZnet7rxLLIsfWYqmondn5rGL+jiWRrf7Ef6
 HT1J3pwFZhAvUEPl63R8VNfe9DIGjsquK+MiuHamS3YmRviqEgldIi8QVPwsLh9v/m
 5kSQ7uJyIK49w==
Date: Tue, 1 Jun 2021 13:36:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 05/12] ASoC: hdmi-codec: Add a prepare hook
Message-ID: <20210601123600.GA4089@sirena.org.uk>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-6-maxime@cerno.tech>
 <YK4lWaB6Lx+SPjpF@sirena.org.uk>
 <20210531094213.kuuunk7ytu3q6sq6@gilmour>
 <s5hzgwb17ji.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline
In-Reply-To: <s5hzgwb17ji.wl-tiwai@suse.de>
X-Cookie: Sic Transit Gloria Thursdi.
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
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Dom Cobley <dom@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 31, 2021 at 01:12:17PM +0200, Takashi Iwai wrote:
> Maxime Ripard wrote:

> > There's a build dependency between the DRM bits and the new hook
> > introduced in hdmi-codec, would you be ok with merging it through the
> > drm tree?

> Speaking of ALSA core changes, I'm fine with that.

Yeah, a pull request for the shared bits would be handy in case there's
some collision with other work.

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmC2KccACgkQJNaLcl1U
h9BKcAf+O81ROM96RMUTZYJIimTQF0+J/oQkn+ESJXI+SHZBaclCwMSDyDON/sKl
JWt3ZmmxhZcLbu0e+i0IKllvpqlENXAAn3WxWdlC7/uFvY0fe1YLRTLVPUneRD0G
PY6UdYKkSfSbfQj/9CJR2svgHPHwrjtb2zrrFK+SnD57cAbuOsrKJPVNGQNl7YKl
p0KBajw4X98C2vToZhWraDaKNlq0PJ0IiPCqo17/UHi8M0dhr1VQ6lTcBGa3Wn6y
JkS69Xdqm+M7Nwz2LNekJ8yRBbjnpSA8d/ENLPUWiuRifvMYQlNCbJ0evCFQYhmn
szkAj4KiQQhziNgUPgsCjN+8N/HlLQ==
=/Jte
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
