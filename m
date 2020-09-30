Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E9227FB38
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3BD6E861;
	Thu,  1 Oct 2020 08:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4146989C86
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 14:08:05 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id DE1435803A5;
 Wed, 30 Sep 2020 10:08:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 30 Sep 2020 10:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=4CHUtjs8mTgMe07nNzKeBnPZaAj
 ouHv1QvsW52wUJnY=; b=QvysVhAr1anAS+8xcvEpN4LnvWRvzv9xsYLawfZy3j+
 i1a57pdELNNICdEnaOD5MlN2hd1AvZLcKcNsLEDpUFts0P9pG64b35Xz52YHhKeG
 oNPzniULzux5UL78pjAdGYQ8b3cqaDue/CmaZA0OfHmK61Uowj6ZKwYSyDOh1Dpl
 BMmUoIxatxxOauWvuphSwAI6sY4yx9wOqjhHJoi5jxAjXYbaZRCQHJXyb11hTk3F
 HV1k8sgDN4oxWr89a+m6NGqpFabUlhshQGN6Vbfzd8itCkBxKGGEg/Sf2qZPB1x3
 rfp1MBj6cKRK2KdXAjY5JZz97UN/8Jpwbc600WZboQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4CHUtj
 s8mTgMe07nNzKeBnPZaAjouHv1QvsW52wUJnY=; b=oPTj1pq76Ldo2+cGdIN+ib
 rZXITHKW/cK4VeorcMv99OHlFFmd7JmK2Urf1c42EDrujnm0scKQQm7X2dn9VKkO
 bt7mIG190HIoOKtp5Po2KLuRXhGbBtBU/WqIon0Rj0Po0YjinAPoLVYEvamhiU2x
 Ch667bcmVfdJELn6VW35RXQVMAuvBt4XCjv5VfQwIbP8xTj1gaFjJvcOTWj6mLQZ
 vMth0Peibm4faJYkyzmLOzZPrpK6BN+1vrZBWix/1dYxHvyrcjXMOJThoH1ufjQB
 NcFhzPUe7HRi8O2g0tmzwIoJD2xog/MKcfZ9yIwjTCkczHfcaptz3g5zt65buZdA
 ==
X-ME-Sender: <xms:QJF0X0LLAvg0NVn075J81KHsVYstEul1Mj8FNzugQauMcZpNwcHiEA>
 <xme:QJF0X0LzmwAo40g9_SgXbANShQorA0CFVANg0oQ5NAAPF5D4jq7MY7Db_ttNMffzo
 y20D_a0bDERqL4HzOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfedvgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QJF0X0s3LNPP7OoFaVhMBl7W7Ezld7UXKzWxRd9asmOrTBPfOE8KNw>
 <xmx:QJF0XxZZiOurhk2ei2IJbNrM0yNaajW6pyGpFGupYQiQ6rg0Eh74aA>
 <xmx:QJF0X7Z2ozlN9wg44ynRnvbHMqWy2VqyvXlqNmDNo2EcRErseIQ2kQ>
 <xmx:QZF0X5BSCCBq8SdTYH93oBvlNYAoa2AA4uqUMAm9Q6w-IKpJ6fkj9Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C9A53280059;
 Wed, 30 Sep 2020 10:08:00 -0400 (EDT)
Date: Wed, 30 Sep 2020 16:07:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v5 80/80] ARM: dts: bcm2711: Enable the display pipeline
Message-ID: <20200930140758.gummt3umouva3wyu@gilmour.lan>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
 <20200929221526.GA1370981@ubuntu-m3-large-x86>
MIME-Version: 1.0
In-Reply-To: <20200929221526.GA1370981@ubuntu-m3-large-x86>
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1468379032=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1468379032==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nmd2zrhuwo3r2vsl"
Content-Disposition: inline


--nmd2zrhuwo3r2vsl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Tue, Sep 29, 2020 at 03:15:26PM -0700, Nathan Chancellor wrote:
> On Thu, Sep 03, 2020 at 10:01:52AM +0200, Maxime Ripard wrote:
> > Now that all the drivers have been adjusted for it, let's bring in the
> > necessary device tree changes.
> >=20
> > The VEC and PV3 are left out for now, since it will require a more spec=
ific
> > clock setup.
> >=20
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> > Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Apologies if this has already been reported or have a solution but this
> patch (and presumably series) breaks output to the serial console after
> a certain point during init. On Raspbian, I see systemd startup messages
> then the output just turns into complete garbage. It looks like this
> patch is merged first in linux-next, which is why my bisect fell on the
> DRM merge. I am happy to provide whatever information could be helpful
> for debugging this. I am on the latest version of the firmware
> (currently 26620cc9a63c6cb9965374d509479b4ee2c30241).

Unfortunately, the miniUART is in the same clock tree than the core
clock and will thus have those kind of issues when the core clock is
changed (which is also something that one should expect when using the
DRM or other drivers).

The only real workaround there would be to switch to one of the PL011
UARTs. I guess we can also somehow make the UART react to the core clock
frequency changes, but that's going to require some effort

Maxime

--nmd2zrhuwo3r2vsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3SRPgAKCRDj7w1vZxhR
xSt+AP0ayZmAvs/uQrHYd/JCYiYkSNEVkD1lmyO4nYjMymxRSwEA8vrzDPVI/xKN
0eYP8+ZWTkPuacJT4sSnKcZCYSzHcwE=
=YIDd
-----END PGP SIGNATURE-----

--nmd2zrhuwo3r2vsl--

--===============1468379032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1468379032==--
