Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 241491228D4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC566E97A;
	Tue, 17 Dec 2019 10:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CBC6E4B6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:48:23 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8277E712E;
 Mon, 16 Dec 2019 05:48:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 16 Dec 2019 05:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=b2sdt1L+RtAvCJWD+Ejy+ZFvgQM
 jCXlABUGffB8yAfA=; b=hpoeKy4M0e/xSvJLEpsfWD6wOgXYRtamc7oXmnJ0piJ
 I3b0fZd7v59vpwxad7wQ7IxLTz9XYIZcSri9aKECh0m9CZAqp7RJy/wpf+TKCk0H
 5drdwgmqEjXT2Q+noD1x+8Jeh0cexJphIVqVMMezk5wyNUeVKsY512uvA2jyko62
 joC4nuay5b6kHnbeRsHJctp83oWLygRop0qtKLLF4l0x4L5U29IPwBc1qC6a147H
 iyKQZeFWzr9T1mpkPO5GSA02X+Tb7bU/Eh/l1s+CXUMrr18ApOQ+vwKrZWnS7o5z
 08+V6irSPmYEc1zbk10CNKSW89FJVspqMaV3OK1+0QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=b2sdt1
 L+RtAvCJWD+Ejy+ZFvgQMjCXlABUGffB8yAfA=; b=wDSmux4G5XsrldAYsui0YF
 pYc8Svcsbxs4ZWyysfS0XnYYgzgFlGK65W2CxBUJlCWNyTC5mWVMT2cvaAfXSHfS
 uquhig/HLIC5SSZgSyJBr7pRjkYsl0aioO4aAme/OFok3dRbGp+dYN3Egryn3BjN
 ZQKtlfGjZRyzGqWJsuYq79ril5x5A7tBykog+2quKzQOsD601klvnizLN6sSJe21
 ORNH77lHrfe3ksC54G4wLc/YrjRHzwzNEC0MhJHCxcStVH5pKSPVYX6Vcg0Y8+K6
 O4HW2lD5mxpboe7fh8+ay7aHynmv3gNcxX2SFDwT0RtxurAfT9HyrPMpoL9KjUtw
 ==
X-ME-Sender: <xms:82D3XYYias_kvtl7_R0ILc0k8BsgyyYH-tzt2rV1jsQwfOdwtKr3XA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddthedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:82D3XWofO-dhm5zVt2cImA2pQHn1JHEAMECKaBperVUf4LUGme1KBQ>
 <xmx:82D3XcYf6FwSIxZiZteTo-Eyu0wayV82DR75lHASu3ZTWx5dJdEZjQ>
 <xmx:82D3XeTmSoQpebhQDlaOCf4ZnlRApl7Hq_DyQFTnf4GRE6ikH9CZZQ>
 <xmx:9GD3XYvCRlj-vrtszBqs79rDoXPTEjGttA70nTEU0BduQ4J5v2mBdw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id ACF288005A;
 Mon, 16 Dec 2019 05:48:18 -0500 (EST)
Date: Mon, 16 Dec 2019 11:48:16 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 02/12] dt-bindings: display: rockchip-lvds: Document PX30
 PHY
Message-ID: <20191216104816.zttjrgck3rdr54ok@gilmour.lan>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
 <20191213181051.25983-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20191213181051.25983-3-miquel.raynal@bootlin.com>
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0080738817=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0080738817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="inqcuz5g7xh4n5en"
Content-Disposition: inline


--inqcuz5g7xh4n5en
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 13, 2019 at 07:10:41PM +0100, Miquel Raynal wrote:
> PX30 SoCs use a single PHY shared by two display pipelines: MIPI DSI
> and LVDS. In the case of the LVDS IP, document the possibility to fill
> a PHY handle.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip-lvds.txt     | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
> index aa5663a6fd42..ec7b4341cfd2 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
> @@ -19,6 +19,9 @@ Required properties:
>  - rockchip,grf: phandle to the general register files syscon
>  - rockchip,output: "rgb", "lvds" or "duallvds", This describes the output interface
>
> +- phys: LVDS/DSI DPHY (px30 only)
> +- phy-names: name of the PHY, should be "dphy"

Should or must?

Also, phy-names is optional only for px30

Maxime

--inqcuz5g7xh4n5en
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfdg8AAKCRDj7w1vZxhR
xel0AP9MqWCTdMxRsTUEkW3yY3dbF1oX5qWpR8bMcDtuj70uRwEA57+6MTtKXQt5
k9opFOaTXgz5rq8ptFWDC/kAy5Z8/Ao=
=SRme
-----END PGP SIGNATURE-----

--inqcuz5g7xh4n5en--

--===============0080738817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0080738817==--
