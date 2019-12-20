Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B191292E4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B666E5B9;
	Mon, 23 Dec 2019 08:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F526EC6F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 15:57:21 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 73888632;
 Fri, 20 Dec 2019 10:57:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 20 Dec 2019 10:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=FuL6L8ki4JKg+f3Pyx2MZOx8OPq
 GiEwj7TQI+rOV0ds=; b=mg/u7gaJhm6mfXj78GXFaz3B7FAHzZF/59i3sNq+9GY
 gC5E6rSaLlow5k8KEr/uORtBCulpAENXkdbRrtTvKCTqcseW3JIngrxZQEvxHWS2
 53gkDu2PrMbZ/EhaZAzg2hZAIjMwr1GLpQp0XPYxwtXXVKjBv7fdFgQzt8xI6Pwt
 pc3/1Ci8s1Uv1jW/fC/Q2vw/3lfScc/C6wvETvOI5ALa9RjdS2PjbUxjlYH8LpQ6
 xJo58Frllbwssgsf2h1XZp2YN0Y4bPGWbxkCCKeIV/mDR7bHG2tj0HoxhoRS4eaf
 YbGRI76S7AzKaA4nhFM23QY5FkUILdG3BbN2JBNWOAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FuL6L8
 ki4JKg+f3Pyx2MZOx8OPqGiEwj7TQI+rOV0ds=; b=AHxcmy0HdCVxa7HVZZbLAA
 xKdnyC/O8C3I0mtM02fDwNP7OS+f6D04uq2fUZL2OHr1WzqP0oI2XCeZBHPc8Ry9
 YDbpp08kF1V3rt57AOvoyOyutuz5x+llns0j97Et49TbQuffcEIxubdkyK+JG+Y3
 V7VpP0KfyDH9IFj/+2dB2MIJySoFS8iLBJS6ZbpzMQX6d7ukBpzq5a6NY+0qOVDo
 jQMNyr+ISkZuytNNu8Fp9+2/LDh+67loZtlJxW+jcMTtTD/TaWjUWaX7+Qo9xKrS
 fpBC4RG4K6OsVBvmtYCPUdNDMm+KRno3jg3BjI4Y28pkmFBXSach6jq+hgUD3IGA
 ==
X-ME-Sender: <xms:X-_8XUiAsYGEgRHoultsoN-xGeblV7f06ajkKUhgXZ8vKKS_fPcoKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddufedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:YO_8XWsxwUGFSTL7uAYD4zodM8BUKTa-YcI7xak1-VtAisdP1dhfyA>
 <xmx:YO_8XbZtrekI1OuvK8Zju4JNP24AnoVUCr9MGYOQLXB_fFFgxmlGig>
 <xmx:YO_8XdVYMlfBWbn4f9J_bGT9LuUuiRTUSn1T5ZqamGW-hyaUT3Ysqw>
 <xmx:YO_8XWA9Bkj2eizDWfDi3KYeerQ43CZdZ_WsaKxSy9NIP-0f0zaUVTIu6Y0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B07B730608EA;
 Fri, 20 Dec 2019 10:57:19 -0500 (EST)
Date: Fri, 20 Dec 2019 16:57:18 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: display: ti, am65x-dss: Add dt-schema
 yaml binding
Message-ID: <20191220155718.tlahyintfdmnhilq@gilmour.lan>
References: <cover.1576857145.git.jsarha@ti.com>
 <1007a467492c2a588d4348106313a9f4853f3f20.1576857145.git.jsarha@ti.com>
MIME-Version: 1.0
In-Reply-To: <1007a467492c2a588d4348106313a9f4853f3f20.1576857145.git.jsarha@ti.com>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, robh+dt@kernel.org,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com, sjakhade@cadence.com,
 sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0188466563=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0188466563==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l4gc7kbgtwlovteo"
Content-Disposition: inline


--l4gc7kbgtwlovteo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 20, 2019 at 05:55:10PM +0200, Jyri Sarha wrote:
> Add dt-schema yaml bindig for AM65x DSS, AM65x version TI Keystone
> Display SubSystem.
>
> Version history:
>
> v2: no change
>
> v3: - Add ports node
>     - use allOf in ti,am65x-oldi-io-ctrl to add both $ref and maxItems
>     - Add includes to dts example
>     - reindent dts example
>
> v4: - Add descriptions to reg and clocks properties
>     - Remove minItems when its value is the same as maxItems value
>
> v5: - itemize reg and clocks properties' descriptions
>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--l4gc7kbgtwlovteo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfzvXgAKCRDj7w1vZxhR
xczfAQDWBo2TVQymv9WDhVRFaR0r+fr+xs045t+ReQg+ej1w9AEAimI0ACn+zSce
zoRayCgwwuouxn+zsu6TuPBWEj3n/Qk=
=FULP
-----END PGP SIGNATURE-----

--l4gc7kbgtwlovteo--

--===============0188466563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0188466563==--
