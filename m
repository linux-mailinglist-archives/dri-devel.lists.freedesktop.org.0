Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E5B1292EB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882636E20D;
	Mon, 23 Dec 2019 08:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7937C6E0E1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 13:14:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7DDBD21EAF;
 Sun, 22 Dec 2019 08:14:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 22 Dec 2019 08:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6JRtu6/FSoZskdTK01GZ0CTmiB4
 OHc18FEE2M7YfZ44=; b=c/4QJdYH6JMfXxH0NVyif7qaUzgr2V8inPWeAOBwFV2
 A4klfeUDeSPZ9Oy+D9Va0C13hveYbiv21kXKt6mJ1H5uKtYSs0yoCYM8itRnWLfp
 i+HjH7Aji0Co5IuBNoYpmUp9/Hu++9zIc0HMUOZR4fLrEaOriLMYG5R40nyvyclN
 rUfB6aVZ0Mjob1WS48KvQOWW7cFSXPjmWrlXHQzvf7utUYG0rbDufqYfHOs7LOvc
 mfz0ry9ujrvsGTzv5ISkVam4PmjwGl7Wyq8mGfHU8nELVLsg8/F78eEHz0PKT3+d
 vo0ZJpSpziy7qsnzugZfDIpJyVNb1y0rMYOTN3bjibA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6JRtu6
 /FSoZskdTK01GZ0CTmiB4OHc18FEE2M7YfZ44=; b=PNu7Iyo/NjcmZ8rHntTCx4
 KgfzWGPy2rSjuwOhWsLCSFLkNjVMkeUrYQ84Cy/sOtxueIGyIQ1Aqq06QdPFDqfq
 YaMZxiH3HzbZceY/kCe60pfq6tCGdg3BMLYRT/ErMA1wUemz6n/ssJga/yV/Lxce
 lzgUSlwt0VkOYk7FKhznITzp+eU+fyEyst8fKCehOVFZlopbbo9OJ9SOGKqbD+FS
 TN2i8STNbdMinA2Wgx+ghpAB2XsMQA5X4kd+a+AQwET4XiYzJRq2vJZAJUo8MxbP
 lN0672Pyn2a+aKSnRJPr3SD4q3kScff3eLCvalvWDTro2M0lfFRw7g7Ml9H89+TQ
 ==
X-ME-Sender: <xms:GGz_XeL4pKMK6jPnylhuRRydSGJxd_t4_KYkhEeqDXxEI5jGSVAwwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddukedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:GGz_XRVCMCEGNFTmGX-CiZTX6yn5gGfKAO0AoH6xPZRPjOjFJ3lOfg>
 <xmx:GGz_XSh_f9oQ1wQodakDO4MOrEkwrpTHLAOWFUz5xIdAL63VwzEoZA>
 <xmx:GGz_XdsZFFzttiHHm4BuQkdOGG6ThE5UnsaWIzs_tQzYLEyokINtEg>
 <xmx:Gmz_XQQghZIAac85hGTAqKg-Clet6Yw8SBfI0ECEFXvGMh3D8EM4CA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2B3548005A;
 Sun, 22 Dec 2019 08:14:00 -0500 (EST)
Date: Sun, 22 Dec 2019 14:13:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: panel: Add binding document
 for Leadtek LTK500HD1829
Message-ID: <20191222131357.e6qropl3tjweh6sv@gilmour.lan>
References: <20191222000634.11284-1-heiko@sntech.de>
 <20191222000634.11284-2-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20191222000634.11284-2-heiko@sntech.de>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Type: multipart/mixed; boundary="===============0017477264=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0017477264==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sc7sshwacka3qoyv"
Content-Disposition: inline


--sc7sshwacka3qoyv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 22, 2019 at 01:06:33AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>
> The LTK500HD1829 is a 5.0" 720x1280 DSI display.
>
> changes in v2:
> - fix id (Maxime)
> - drop port (Maxime)
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--sc7sshwacka3qoyv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXf9sFQAKCRDj7w1vZxhR
xeVeAQCeTGqtBrvGfyWczqcpwD5okqbAPsi3jEh+8+Skuvmc/gEA7Andamgcj7F/
sswb8NI1BlqVqBoIVjiYQLE2K8kb8wE=
=zYW4
-----END PGP SIGNATURE-----

--sc7sshwacka3qoyv--

--===============0017477264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0017477264==--
