Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CB1A0904
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F146E5CC;
	Tue,  7 Apr 2020 08:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551DE89B48
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 07:47:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D001C5C010E;
 Mon,  6 Apr 2020 03:47:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 06 Apr 2020 03:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=fk0IVzhLMx4QzUFZOk6q2lY6Tw3
 oTyL+WLLAWVNyr8U=; b=bBBgovKhtANZ4Kqu5wyDx1o8MbwDWBDBoQVtCwotREd
 dauBq9nPptC5A1ES9g+uU7q4rvptbXtTPD1u3XB0sFyYxCDMSMEEWkOLOQcxiZF6
 epFvtlDiQcRu1XUjTaNHP6SLunDLhSHVxl3H7am6OWXt9wE4mWx/XFQ+QwpgwFlM
 dvueZCJQjpsfRCtn5Z/cVLeEQUQfWsDEo/Sst7hR2dqgtwJmxKoC4HfHPSYyacWL
 SEqSw9dUngS1uXtybC21X21M/Mq8eGrgAKY4aRxnp+tWZRfpBrQEHIe1tk4Wx16g
 IQrjefSMXLhdRuu8PheGObXHwoqWS1WLwKAHho6EZ9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fk0IVz
 hLMx4QzUFZOk6q2lY6Tw3oTyL+WLLAWVNyr8U=; b=aiZb0/nMkqCX70WxZB568E
 X7XnNRWz+ad/9ZBhBR1ouFGW447oRw6vpuHXa/upP6c0w7W1rvFKjoyJS3WkOStN
 1qiBuJgxufRWFiGKJu6ffoewCcaWdiCW/ap6Ue6KiuZ/oRDnCzF83aOJPzkHOcJ8
 nOScO6lOFTZBi6H7gJ2L0KQ/BuKGjbhQuyE0AnWuPSSqICTlv+/PKUoBhzOItAQ9
 HP2rozUJ3D9iw5xkdPinYLHz+N3hlemBbsD+VuiPsar+qubK2IFY1WkRceLKcmNk
 /VRZBU/Q1nCbFRmprEyRoQaQtJ6SHueWx2Pjn1o6Op7/sgnOVmh7hrCOKrvttJbA
 ==
X-ME-Sender: <xms:gN6KXgJUXrwevyD6mY-hF5XDedYSBTvXtp0ioakXyQEcjFLQ4z2vig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
 rhhnohdrthgvtghhqeenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:gN6KXkYtdu-ooYFQPuyNxTZP8Uc9DUTgkUmx3O8eP1BH0wZQ6IuSlQ>
 <xmx:gN6KXkQe15Tm0SfcVApx8t-JwG-5DFQ2Ifo4NGznWccYw66h8gjApQ>
 <xmx:gN6KXsgLpdte4LUCVyqLOVzewWWYt7SjDv4bUqdCaJQYHTIwkwKivw>
 <xmx:gN6KXhYtyuJ7ksTpzurNk1JReJJmbBJsSA1ZjxaGO3fDZ2MNnCRxEg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 534643280063;
 Mon,  6 Apr 2020 03:47:12 -0400 (EDT)
Date: Mon, 6 Apr 2020 09:47:09 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: bridge: Reject additional
 properties in ports node
Message-ID: <20200406074709.uylqwzxhibnpic65@gilmour.lan>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200405232318.26833-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:31 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0105723442=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0105723442==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lr52ihsfnz2w4bde"
Content-Disposition: inline


--lr52ihsfnz2w4bde
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2020 at 02:23:15AM +0300, Laurent Pinchart wrote:
> Document the #address-cells and #size-cells properties of the ports node
> in the schemas of the bridge DT bindings, and set additionalProperties
> to false to reject additional properties.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--lr52ihsfnz2w4bde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXorefQAKCRDj7w1vZxhR
xeBHAP9hXicjhb9GJNSyQUQ9g3gGoIv2EMYGPhjhxjsJOVRQJgD/TWwXQyqz9ZMB
s2ADsJxD1fCR3ycfUEHThkwsGDJDKQ8=
=D22H
-----END PGP SIGNATURE-----

--lr52ihsfnz2w4bde--

--===============0105723442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0105723442==--
