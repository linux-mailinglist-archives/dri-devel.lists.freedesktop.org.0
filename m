Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F2C20D01B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 18:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338CB89C83;
	Mon, 29 Jun 2020 16:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCB689C83
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 16:23:18 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7BCD2558B;
 Mon, 29 Jun 2020 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593447798;
 bh=AjlqcdB7b/yBviJ2dBaRXJ18rVcn1CiQNkqMJCUoxNA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2MN0pxKJUDbdvXhRNswVrjxGLmO105O2QOoqyE9kfch4ST+ofF32/GUuu1b4xpVNY
 m5sRkdHBB8Ul2KQF6mjUIIXw2u+YA4hPPZcY61IRvLiWbBbjdtiYqXi8nKuUNrc8Ix
 TfRsDIqCbMaQoOwrs+zsVrXo0DDbmhxwZV3rQW98=
Date: Mon, 29 Jun 2020 17:23:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 9/9] drm/simplekms: Acquire memory aperture for framebuffer
Message-ID: <20200629162316.GF5499@sirena.org.uk>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-10-tzimmermann@suse.de>
 <20200629092230.GQ3278063@phenom.ffwll.local>
 <20200629160421.GA627453@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20200629160421.GA627453@kroah.com>
X-Cookie: Real programs don't eat cache.
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, hdegoede@redhat.com,
 kraxel@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1485427333=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1485427333==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hUH5gZbnpyIv7Mn4"
Content-Disposition: inline


--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 29, 2020 at 06:04:21PM +0200, Greg KH wrote:

> Yes, please do that.  Or, use the "virtual bus/device" code that some
> people at Intel are still trying to get into mergable shape.  See the
> posts on the netdev list for those details.

Any pointers on that?  There's also some ongoing discussion with MFD and
that's not been mentioned at all.

--hUH5gZbnpyIv7Mn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl76FXMACgkQJNaLcl1U
h9BMdQf+ObtQPXNkp3bEGTkFdoezfPjU4KbmmoYq2be7hGx/xXeqW8ko5xmyytaA
bqBsKsUWdHBVddF1c8onMToPg54DNnifxahhumjCvPStf+IBTPjF5wZx4JliKT8E
3tr8DsGOaHTndMnCeNLAQTc3eLLNE5TX6M1fZIlM1KCOHZGkt3FCZZQDksxweqo4
xuHbk/TTrXlI0kFu8SuyIetPFxZarktgHVYAy/UE/nTcNeErbse4N8j1SmRjIzE1
+2PcFyQNh//ldZJU5rArhC7yqmP3zPIP3RO1Pobnc5GvZjGKbihmRIPXiXQ/Tp0e
z72g7TJi43v3DxiLDqFP8YMPHass7A==
=+OVR
-----END PGP SIGNATURE-----

--hUH5gZbnpyIv7Mn4--

--===============1485427333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1485427333==--
