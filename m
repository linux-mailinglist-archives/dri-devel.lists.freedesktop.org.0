Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73A7CEA94
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B1E89F08;
	Mon,  7 Oct 2019 17:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C47C89F08
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:27:47 +0000 (UTC)
Received: from earth.universe (dyndsl-037-138-090-170.ewe-ip-backbone.de
 [37.138.90.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 443372133F;
 Mon,  7 Oct 2019 17:27:47 +0000 (UTC)
Received: by earth.universe (Postfix, from userid 1000)
 id 3E4FA3C0CA1; Mon,  7 Oct 2019 19:27:45 +0200 (CEST)
Date: Mon, 7 Oct 2019 19:27:45 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/5] Fix SPI module alias for panels used by omapdrm
Message-ID: <20191007172745.e7obunwprgdiclwk@earth.universe>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570469267;
 bh=ADw94PRMffDcSy7CEAv64e3rw87jHsCySzGRg20pcQE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r6zyno1esSBXGw5ZGv5usX7wTuhMw11rjdkUi6HARYgQDdaQF7NeVi2MDUg7QGz+K
 Il1M9hXoL+wnonE7z64MSbtsDFZY6FNHzViBrxLrrvYzYcJzKLwEO0s/qXHtCtTRO2
 bhhCwlHIrsCn7Uiz+VC8v6n9wA7IToOrJmcl0W0g=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, thierry.reding@gmail.com,
 Jyri Sarha <jsarha@ti.com>, letux-kernel@openphoenux.org, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0829100985=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0829100985==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6l3anbcfnqxbanzz"
Content-Disposition: inline


--6l3anbcfnqxbanzz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Oct 07, 2019 at 08:07:56PM +0300, Laurent Pinchart wrote:
> This patch series fixes a module alias issue with the five recently
> added panel drivers used by omapdrm.

For the whole series:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--6l3anbcfnqxbanzz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2bdY0ACgkQ2O7X88g7
+ppcMw//R+no2w6dsdlDSaOCK/KGfl9/Zag/UlNED/KhLLbD4m9KCs5kfUR2e11S
BLfqv7I5m0hPIW2/t57YC58pMiZJHR+VwVAgpUwyFRaPzBYh+WLjuGDu/ZhKHwSD
mreHbqJGFo3lxWKmSRXL9/qsAxdgyt+0Ge4GmqnLEy4mI0UmZBl/C2lOQzJJeJqs
mbUSBgXeK5MBgsUGX9d4sAEmgCM+SE/tD57cxmNFShA8WJw8+IBDKMvCzXUWOv0Y
gL5udj/ZiZ124g5iZkcsfuMIl2fzr5xwCJ3VUdxRlYYmJd8+XUlKoI2QAM34+qgs
GGhqxmh+g2crHHuzJXNN7exwS0v8f+jF61Evo+whanNXOVE531iqMO+EOySxs6HF
Szuap7KNTrzouANBOiTwqeZBx9jePxyJCCu23pAEP1yoAgSMe2Aj+YmWcMqCjMWU
zmRvZuF9Nh3jPa+v5VCFKS0ywCEhZME2iOd0ua1A50i/XKRJ35L6e62BUh8yW60l
CxU58A9YUO2x+nzG3QlvnroBdQIEpjLp3tnhsBC0E7cMicrQ2RncRxgpqw63P201
+uaIX7j8PXQ4SUwA587026IRWCdXzZepD1Y+nsXUboOtFY6BhZMpRGJf0payP3bT
Hd9KikLDwiC9rWTJpnVdq7q1M2KBd2EdLIy22X0maaWLY7RKm9Y=
=WZC1
-----END PGP SIGNATURE-----

--6l3anbcfnqxbanzz--

--===============0829100985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0829100985==--
