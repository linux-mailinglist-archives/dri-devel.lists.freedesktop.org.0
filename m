Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D90260BB1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A546E442;
	Tue,  8 Sep 2020 07:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E519B6E4C4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 16:22:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id AB9C1550;
 Mon,  7 Sep 2020 12:22:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 07 Sep 2020 12:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=NMeb/Jt79wlEZMKIN0s9CoeiA/4
 hpNhEg427QLnnBVc=; b=RiqtibaZQUt4LBxzDScHaMZtZmnVMi/6eAjou8smB7V
 0TaEgdLpXZZmXvSpqp/oArGeWzeOqA0AU0u6k3kRd6K8Oppcmd9H6+9et4PwGT/i
 iQRQwDvqmOsfRxS2JNSJowxYT+vzsgPtBQyu9ARPuuwWF0fpN4lmxJnMBTv9A8ml
 hSTdPdB6nuiQH4uYDon9Ritc4LHvMwT7bzfxKF1sxgokxxMxXBNu6k6Xfj1m5Hrj
 Ibnbm/K0+GVWkHnhfX/M4ebQa8lFu65dd0dH58erNjsnrZEJ0AwmPOMuAs5N6D3m
 UDFSdh18HeF40X9e5BGPBymvK7XNZ8nOs50M95cKKnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NMeb/J
 t79wlEZMKIN0s9CoeiA/4hpNhEg427QLnnBVc=; b=jxr7T+r0XsFA+uu8oqRYR3
 usxutY2BmmlP+dpd9PCKlKoErhBhUq1SV7I68YMgkHvx/tE4P5aWQgEaXrzEIqXj
 vvY1EZgFsoniB/Fs/kazwB7dqk2c1aTtXrZ1Sx8HV6WosWMrvHaoOzqjV/MwH6ZY
 dAAChHEU4Y9U9mj82VQ9VASlDk8iJyjjogoC9PWHT6JVOSGG01+KW1PH5XX6rgFz
 RdCQ7V5IYmAkA0hiNSmEJxH4RtFr4MkeJsezWsPAcBh8nXI1xlkS83qaAtRBsSZw
 KMN9NNuPCmur8wbSifa+RHqjuN0s1a8CFtqsmjy/AT8maXBdkFK6VB/VdiKkh7AA
 ==
X-ME-Sender: <xms:Sl5WXygGMv78je365SmTp5rMGIlK_QsE4Ovw1pXC_Kv7wx_ZlYwupA>
 <xme:Sl5WXzCrqtFL0A_hiaVjw8JIWPuI_bhDdSYjyTrCSokwyhNUkRprCheu2Z4mMB_9l
 f4dlCxuRYQpLm810Fc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehtddguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Sl5WX6FbGANamhmtY4AVnvkT2Mvk09ZkOI9SWBjZtQH5Y_2pPqsRvw>
 <xmx:Sl5WX7QVAY_-rFROhDV5m1nfGR4lfXlbHbNdM733gZGwySI9RdD__A>
 <xmx:Sl5WX_y5KTNGr3mNHhjh2piLg0h9gvZqom0AGoqoF7f0BbJONpmkIg>
 <xmx:S15WXyq46Vu9p9p794Hh-AbSZMRLcOihg6L1VWwLvlcVUlASXv-qgpBYYSw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D2A0B3064683;
 Mon,  7 Sep 2020 12:22:33 -0400 (EDT)
Date: Mon, 7 Sep 2020 18:22:32 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v5 00/80] drm/vc4: Support BCM2711 Display Pipeline
Message-ID: <20200907162232.kfkskjuytfr7dyef@gilmour.lan>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
X-Mailman-Approved-At: Tue, 08 Sep 2020 07:17:17 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1141269533=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1141269533==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2giy2b7xu6bt6dgq"
Content-Disposition: inline


--2giy2b7xu6bt6dgq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 03, 2020 at 10:00:32AM +0200, Maxime Ripard wrote:
> Hi everyone,
>=20
> Here's a (pretty long) series to introduce support in the VC4 DRM driver
> for the display pipeline found in the BCM2711 (and thus the RaspberryPi 4=
).
>=20
> The main differences are that there's two HDMI controllers and that there=
's
> more pixelvalve now. Those pixelvalve come with a mux in the HVS that sti=
ll
> have only 3 FIFOs. Both of those differences are breaking a bunch of
> expectations in the driver, so we first need a good bunch of cleanup and
> reworks to introduce support for the new controllers.
>=20
> Similarly, the HDMI controller has all its registers shuffled and split in
> multiple controllers now, so we need a bunch of changes to support this as
> well.
>=20
> Only the HDMI support is enabled for now (even though the DPI and DSI
> outputs have been tested too).

I've applied the patches 1-79 to drm-misc. I guess the final DT patch
should go through the arm-soc tree?

Thanks to everyone involved in the reviews

Maxime

--2giy2b7xu6bt6dgq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1ZeSAAKCRDj7w1vZxhR
xcVNAQChBiLkPwY+5QvlL519sqeu9jt01LvwPwyFJrzT0B6+UgEA+CXZjIquRHWW
4cCAwsWvUKtyLKQesFEIyF2mmlhzzwU=
=lOLt
-----END PGP SIGNATURE-----

--2giy2b7xu6bt6dgq--

--===============1141269533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1141269533==--
