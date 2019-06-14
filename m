Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5143E4692B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F678909C;
	Fri, 14 Jun 2019 20:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E7348909C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:32:45 +0000 (UTC)
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
 by pokefinder.org (Postfix) with ESMTPSA id 1BFB72CF690;
 Fri, 14 Jun 2019 22:32:44 +0200 (CEST)
Date: Fri, 14 Jun 2019 22:32:43 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 17/28] drivers: Introduce bus_find_device_by_of_node()
 helper
Message-ID: <20190614203243.GC7991@kunai>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
 <1560534863-15115-18-git-send-email-suzuki.poulose@arm.com>
MIME-Version: 1.0
In-Reply-To: <1560534863-15115-18-git-send-email-suzuki.poulose@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, rafael@kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-spi@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: multipart/mixed; boundary="===============0248850129=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0248850129==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline


--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 06:54:12PM +0100, Suzuki K Poulose wrote:
> Add a wrapper to bus_find_device() to search for a device
> by the of_node pointer, reusing the generic match function.
> Also convert the existing users to make use of the new helper.
>=20
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: devicetree@vger.kernel.org
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-spi@vger.kernel.org
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Acked-by: Wolfram Sang <wsa@the-dreams.de> # for the I2C parts


--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0EBGsACgkQFA3kzBSg
KbZ+QhAAhP0RWmmLpy5mMKDwba8oyF5FX1jQZTj4zTukyeAJ5dFtxhQ8mANYEYOf
2rnnAm42pcb0kyDIvP6xMF+yg+UK2lyd12Ud6k5TD3y+7Ochwlkcyu1JJessZZir
YbDlY/eFeIyOzINxAx8yLLfYWncpANpAguyo321TmSXyoCFW1JbRlffuTxGKcXFt
qYFrLQdwosCtFQV33gLalIQ69zBhN5c7Jgf0pVhiUjH8NF73yF0hgOkl9ptdzROX
4Bzkw5RdlXV9N5yqy3lRa1iNzQ1BJlvFfOxphlHmUEvjXNlvvvHjKyInyFtsbpBR
tKeUTjeWeVEfwOidPkEmiB8G3+k1LuGX9yOXZmnvVcSqy0xel3CyzjhZWDn6sGdB
XgbvqJtd78g/Eaqr+y1WhaP5r8N8G/PzJODTtUkeisF06tocDxtLHLLhUjOhenDB
6eCpKAP3dL7wxniDPMG0xzckpCWeIlCMlM/2BN+OyX16P1jy10HreRmCiIug7/5V
6AFQji0dWbEwTtnTC6kYQsHXE3XRVILTHKJmWDE1R/Sosp08HOv128fw4G3a/5GK
Rx6tVLYgs75/X6kc20Cyy51wgJiteoV3CvSXmq8mGhdA4XP5v8TLtKVKWMj+UMOx
s+Q5PgkjDnvMXp7+HAGpHTlLe0tifUY2nZYtttsZKHraj4bgHoY=
=val9
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--

--===============0248850129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0248850129==--
