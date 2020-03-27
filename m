Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789F0197529
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9BD6E090;
	Mon, 30 Mar 2020 07:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7996EA07
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 11:46:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2F94DABE9;
 Fri, 27 Mar 2020 11:46:53 +0000 (UTC)
Message-ID: <65a2d18ec2b901c6a89acc091cf9573a98fda75f.camel@suse.de>
Subject: Re: [PATCH] drm/vc4: Fix HDMI mode validation
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 27 Mar 2020 12:46:52 +0100
In-Reply-To: <20200326122001.22215-1-nsaenzjulienne@suse.de>
References: <20200326122001.22215-1-nsaenzjulienne@suse.de>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, f.fainelli@gmail.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0951081991=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0951081991==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-iTT4P/76bH6ldtNpzKaw"


--=-iTT4P/76bH6ldtNpzKaw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, 2020-03-26 at 13:20 +0100, Nicolas Saenz Julienne wrote:
> Current mode validation impedes setting up some video modes which should
> be supported otherwise. Namely 1920x1200@60Hz.
>=20
> Fix this by lowering the minimum HDMI state machine clock to pixel clock
> ratio allowed.
>=20
> Fixes: 32e823c63e90 ("drm/vc4: Reject HDMI modes with too high of clocks"=
)
> Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Would it be possible for you to take this in for v5.7 (or as a fix for v5.6=
,
but it seems a little late)?

A device-tree patch I have to channel trough the SoC tree depends on this t=
o
avoid regressions.

Regards,
Nicolas


--=-iTT4P/76bH6ldtNpzKaw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5956wACgkQlfZmHno8
x/71DAf7B3ekZLOCXw9+R/a+ahSyPrsNHq1P6dzIGD6ifYIhw0z2o9RynjiWrVXR
NDEjE8EYZXkiY3su8sXVNooI6/UsMGdkt4uxl4RXt6nic8561/HvS4B0g0ZXgQNm
HfLymT4h/x9ccphfxHTOkusKgHtF+Bb80qkD1Nb0LWpLkni63WiN5G22hTLWJLxx
+8vcUD5Dt5HYl7rGMCdcPQ/Wgs6KS/Gfit8jYWrTFvbAqzEwSDTWSJoE2Sp8aqnf
Gn2yEbFF63bX3/1/HMOaL8oFPpRZIx7ztmdwSuRLx0PaqQF2D0HpvXun/7mbnhSi
5DnAf/YNQZpZHCuWOA5JhUrzzox61Q==
=IHbT
-----END PGP SIGNATURE-----

--=-iTT4P/76bH6ldtNpzKaw--


--===============0951081991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0951081991==--

