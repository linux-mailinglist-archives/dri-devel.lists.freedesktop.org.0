Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AECFC188731
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBBC6E1B2;
	Tue, 17 Mar 2020 14:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3D5898E1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 08:50:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 296B08EF;
 Tue, 17 Mar 2020 04:50:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 17 Mar 2020 04:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=zCGYpnzGTKAxX7pUBJOtGNvlOfZ
 7IPU6gRT7wc7yTRI=; b=fn5o7pAOKmZYoXdFWoEY0k/kASRx1aEFJ5opERqKO6T
 CVtT8sAqNLqfsuV4n3lHCGB/SBMsOQK0rEsgU2bbzb+UITvsSOu8DSN+dk27KOX6
 hwm2jKShAlRm8i4AXH08o2u861o7G1DAbzyAegsX99Qq97ZL/djdAruJ1FsL19mK
 W8L04AQEUxx2ZiOQBBezoNiEibvpoZ+AttPF974s4+Jbhz+WbsNY3DTQn3RmHtgs
 YmAblUFJha115NROBwBreXODBsXLmfzxKfy44yoaT+JTb6mpMCWic5qa7fIPLkUE
 594qUq8QOXacWc6wcBswxCwwqB/cHohJmtaVdRs3OtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zCGYpn
 zGTKAxX7pUBJOtGNvlOfZ7IPU6gRT7wc7yTRI=; b=4Y2BL16WLEL7nBoPjHz3Ur
 4jrXBYDqhKKbnrK5YHYdeX8E/H79JrTSEpoBMRgbDOkk8mQ5Pl/hYZxxlI4SUiSV
 KPTUCWC7HiXNu887n7pXSXByBEbtyMSdVQq+Ss56elxOEQfftFsU5uK8xAt1Jy7w
 3ukhC4aq/OkdyiN405nPq6d9pSG5VX1JfAGtHzphhggQvK+z5mE2mBsC6PV3PIzP
 shoHIpRP7EjbVF2jFj4A5WPB7QecxVhvihpRgrVOCYMYKfpQpEhu6ZpFqiYbP3AM
 9s/gs6yl6vgIn7/7Oh0fsP5YygbecCv0KuidT4sn+pawUdMwktrLJRSV6zSfdA9g
 ==
X-ME-Sender: <xms:OY9wXub-E3BTfLcytX0IkRbgxIRpAV7Nz8KYGy9tMQ12ULTksEVV5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefgedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkpheple
 dtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OY9wXtOWv9ycp6W3e8Pv0DcFdvtHsASZn2HQ-QcknX5qjYAgzl8rXQ>
 <xmx:OY9wXkUD6uts6JjkHgIRxzF1Kqz6mm0VVoUHzmaG_b0ckgNmLAV-eA>
 <xmx:OY9wXqKf3b2HDRMOb28EsmoTNlR_M-90XuMhQRM-c1-NfywRMNwtYw>
 <xmx:OY9wXujKkCvXvgwimjmBClVsBQ5efImjAKscO_0RfeMwX25YI6i0Pg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E08D93280065;
 Tue, 17 Mar 2020 04:50:00 -0400 (EDT)
Date: Tue, 17 Mar 2020 09:49:59 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: drop data-mapping from
 panel-dpi
Message-ID: <20200317084959.atqs2anx56kamrsy@gilmour.lan>
References: <20200314153047.2486-1-sam@ravnborg.org>
 <20200314153047.2486-2-sam@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200314153047.2486-2-sam@ravnborg.org>
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1628092389=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1628092389==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kckf3ptgyrolpnwx"
Content-Disposition: inline


--kckf3ptgyrolpnwx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sam,

On Sat, Mar 14, 2020 at 04:30:45PM +0100, Sam Ravnborg wrote:
> data-mapping may not be the best way to describe the
> data format used between panels and display interface.
>
> Drop it from the panel-dpi binding so we do not start to rely on it.
> We can then work out how to best describe this mapping and when
> we know it, we can add it to this binding.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>

I can't say whether it's the right decision or not, but if you want to
go forward with this, you should maintain the backward compatibility,
so leave the code to deal with this as a fallback solution...

> ---
>  .../devicetree/bindings/display/panel/panel-dpi.yaml   | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> index f63870384c00..0cd74c8dab42 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -21,15 +21,6 @@ properties:
>        - {}
>        - const: panel-dpi
>
> -  data-mapping:
> -    enum:
> -      - rgb24
> -      - rgb565
> -      - bgr666
> -    description: |
> -      Describes the media format, how the display panel is connected
> -      to the display interface.
> -

And keep that DT property documented too.

You can express that it's only here for compatibility using the
deprecated keyword though.

It doesn't do anything at the moment, but the next spec of the schema
language uses it, so as soon as the library implements it we'll report
it.

Maxime

--kckf3ptgyrolpnwx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXnCPNwAKCRDj7w1vZxhR
xcNpAP4lzuRGAwFYh5y+KeNFAOY796ne1LwEH8+K4HPXcBYHagD8CW+vPUHR9A2J
un9AV2OEmT4nllSsArdbNxKgSXo7agk=
=NOwr
-----END PGP SIGNATURE-----

--kckf3ptgyrolpnwx--

--===============1628092389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1628092389==--
