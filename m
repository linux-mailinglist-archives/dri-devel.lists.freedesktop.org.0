Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4F11F236
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5BF6E398;
	Sat, 14 Dec 2019 14:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF2D6E03A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:00:02 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 80CF1226BB;
 Fri, 13 Dec 2019 05:00:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 13 Dec 2019 05:00:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=dg85uPxGzsaZzYbAGKso+8YkspF
 HfHJUjrHSDK6r8xI=; b=O8jJD9giDeUdA6s4fmvuPg2g8N+sO9jK+Vw8cFU/Gg9
 ViPIbW4nftLMBivm7inzydGiklwJXh7S07d/t5Aqbx6iA5CoOW6pHLojkf45pGXC
 fOwXgsVYKCzzt4GWouDWSTYojClwSXvGmb/blV8HJ8B1BJNyeCQbMXEGAvsVCY8P
 zIGsi4Uvb5PVrTKAAq6EVqsuLEukqgqjlj9scKz8cXJDocqPgdFbjerIKhS5Q6E8
 flQn8Jrnc466pIRK+lxAOtPHSY97S9yoG1CbKMGZWw56Sl41uZ7j+qiCQYu66+R1
 LIKNFQTqMjImTJVDc9aqKpioWWMRMTfetzGVEQ8+pLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dg85uP
 xGzsaZzYbAGKso+8YkspFHfHJUjrHSDK6r8xI=; b=VWypCmVDwCln5//jMXdVC8
 3pJvkcSsZmn+Me2r+WiFdF39cWJLXL3BCzjbpG6HLjf6aH7+Ol/ca0qQsu4u5/B2
 dq4QD6VZb2TNCAFxszcmLyIDtLQDW/HBFzO3ek60deviZAvOR465sDAk8d8L0aLH
 /49eT5abVTp9di9SJXeoCjfXe8MHdEvlZ6hua9R5fEeESd70GiU6ZSHe7ToWVMNV
 bdw4dlL3KA8Usb8+AYada6hJvMIdQsuhemoCYIZ6bZy4eeMEvY7dmPr094wi2DNR
 UW9jGjOQ0GhfycXeZr00ClhQSbHJJkXR42tYjnwyxmKDIxvjMjHxeG5E8o+lF4PQ
 ==
X-ME-Sender: <xms:HmHzXSv_alJTHsXgMa3V1Xf94adMA5vdhqb9sHtXEysszN4c48b1_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelledguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:HmHzXULCZiswcmmobwiAE38Bco9k2KBnWbFEdphaCbu3zw060e4dOQ>
 <xmx:HmHzXeN0eh3vh3kgl41pjvv4-bhaVNn5ujMzIdCI2zzqJtC76ihYBw>
 <xmx:HmHzXTzSp5FDllCn9KTFT14RvkAPoDV15ZO6Y-0dySuGUcKRRYUA6A>
 <xmx:IWHzXcQVfBbqsPdGhX1Mid-_rUDhYGELtqo8AVv2HimFm9jbZOmlHA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 33A4180065;
 Fri, 13 Dec 2019 04:59:58 -0500 (EST)
Date: Fri, 13 Dec 2019 10:59:56 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Yuti Amonkar <yamonkar@cadence.com>
Subject: Re: [PATCH v1 08/15] dt-bindings: phy: phy-cadence-torrent: Add
 clock bindings
Message-ID: <20191213095956.cr2peaieioo3lqka@gilmour.lan>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
 <1575368005-29797-9-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
In-Reply-To: <1575368005-29797-9-git-send-email-yamonkar@cadence.com>
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: mparab@cadence.com, praneeth@ti.com, dkangude@cadence.com, jsarha@ti.com,
 kishon@ti.com, tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org,
 sjakhade@cadence.com
Content-Type: multipart/mixed; boundary="===============2132488041=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2132488041==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xzeegba4s52dzhbn"
Content-Disposition: inline


--xzeegba4s52dzhbn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 03, 2019 at 11:13:18AM +0100, Yuti Amonkar wrote:
> Add Torrent PHY reference clock bindings.
>
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> ---
>  .../devicetree/bindings/phy/phy-cadence-torrent.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> index d0037bc..6e1d71e5 100644
> --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> @@ -16,6 +16,14 @@ properties:
>    compatible:
>      const: cdns,torrent-phy
>
> +  clocks:
> +    maxItems: 1
> +    description:
> +      PHY reference clock. Must contain an entry in clock-names.
> +
> +  clock-names:
> +    const: "refclk"
> +
>    reg:
>      items:
>        - description: Offset of the DPTX PHY configuration registers.
> @@ -36,6 +44,8 @@ properties:
>
>  required:
>    - compatible
> +  - clocks
> +  - clock-names

This also breaks previous DT that wouldn't have the clocks properties.

What you can do to support what you seem to be doing (changing the
properties and making the clocks properties required for the new one)
is:
  - Add a new compatible to the binding (without removing the older one)
  - Making the older one deprecated
  - Introduce the clocks properties to the binding
  - Making the clocks properties required for the new binding only

Maxime

--xzeegba4s52dzhbn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfNhHAAKCRDj7w1vZxhR
xSwuAQCMjmVrLzlKFKMyyuqJIhu84Hri3fTbUZrGVjXpr8xA1wEAwfKp6lfYaj7/
flmE9opQFr+vBpdNyKwohhAjIXPEHwo=
=2SE5
-----END PGP SIGNATURE-----

--xzeegba4s52dzhbn--

--===============2132488041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2132488041==--
