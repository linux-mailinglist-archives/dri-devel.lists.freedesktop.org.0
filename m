Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4363915D4
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FDC6EC83;
	Wed, 26 May 2021 11:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2766 seconds by postgrey-1.36 at gabe;
 Wed, 26 May 2021 11:24:26 UTC
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90F76EC83
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TMe0IyJS6cQ+Lq2HcNsTfT78sP/9ZGYPAk05niLZNeM=; b=ueVfX9lZTHGcN+dDDycF9mQOdz
 iTPADjKo7qvHBeqyQkPRQjiKTc6yInxBCdzMcVMZ5IPGCSL7M/Bu5GCY0y7NBhPOcReo4cuyktI+a
 Lr+1b3l5uwbjLFKWwUZjAVSdl+pRuKIKUO7DDHwl1NDxUoBwdo4cda5SMSnbQtSf11mw=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1llqw2-005xmf-VR; Wed, 26 May 2021 10:38:47 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 49705D05864; Wed, 26 May 2021 11:39:21 +0100 (BST)
Date: Wed, 26 May 2021 11:39:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 05/12] ASoC: hdmi-codec: Add a prepare hook
Message-ID: <YK4lWaB6Lx+SPjpF@sirena.org.uk>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-6-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wI7EtUudqJM9+3Oj"
Content-Disposition: inline
In-Reply-To: <20210525132354.297468-6-maxime@cerno.tech>
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


--wI7EtUudqJM9+3Oj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 25, 2021 at 03:23:47PM +0200, Maxime Ripard wrote:
> The IEC958 status bit is usually set by the userspace after hw_params
> has been called, so in order to use whatever is set by the userspace, we
> need to implement the prepare hook. Let's add it to the hdmi_codec_ops,
> and mandate that either prepare or hw_params is implemented.

Acked-by: Mark Brown <broonie@kernel.org>

--wI7EtUudqJM9+3Oj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCuJVgACgkQJNaLcl1U
h9CRRggAhsstIqtcqC4EquItefHkzTS9v8kbwvJytct/Q8VBhXpc7T0EkxWdaCxn
s+7PulshfFDvB24KxgJcIs+bHVkn+e0dvfDLkjSd7RO+nGcIwnccOUzCJ2CX7/qS
++Q7uUsY8Ne55NUPIfMpubv32SIHaYeCHglZjHKaHNpsM58ANdTAN2Sl2PMJs3u6
phAyak9G80MvU5cjMto9WmV9zyGZ6uobiGH4qjx8wzO+71RuSMwCKVF6EZ/mdg26
8XLOMvwo44jmHGWCduFH3mdVtsPi89Tblv3wNBrLlwMjZhJ2AiEqssq67lKCbKF5
tvl87wk9yeLVRB/BD43Vpa3DajNrrg==
=7TgH
-----END PGP SIGNATURE-----

--wI7EtUudqJM9+3Oj--
