Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407F27200F3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 13:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EFF10E672;
	Fri,  2 Jun 2023 11:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3DE10E672
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 11:55:01 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BDE195C00C7;
 Fri,  2 Jun 2023 07:55:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 02 Jun 2023 07:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1685706900; x=1685793300; bh=xl
 0dWsnSHNU6Oq7hyFYYTj5l1ENm7Ds992qDl/Rs71A=; b=ZmEOUtjCv6stQtxyvL
 CbYMpBkaqvZXA+IEg4LiEgbsXOlNZ1EIIIbbutiZfL/4BreaVWxSkFVseG+8rB18
 YYGregZB+99NeibpKXYNgrSe61SDaQ/5TkWlzJbLdq8XF+lOkk+Fn6c3PZu5wKe2
 cnE07pXPLldeQlz+xd/nK8cOCEpjWQh88ArV0zOS+0bnMBpmhss8UdUGi5cAtY1Q
 yEUu//s3wHSTghpclQg9+p7BjUsMBMkLDXfNnqJyHdIUkrkJd4R3r0KBzaqvsLQj
 AIK+JuEoRFoYRmIqLnbJ5ukU0ftDARNQZc/5z9tXuUO0o28YkAm2oPfhEILEcjdd
 S1+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1685706900; x=1685793300; bh=xl0dWsnSHNU6O
 q7hyFYYTj5l1ENm7Ds992qDl/Rs71A=; b=Uiuk4DwliPopZUFJNQxPBQxZWi5Mk
 ENGzJei9RkBu7BhON7GX7ETGgDiMnAlpr0VmcAsq4cwSwkcY8tHGBDlIKApsAZHt
 v+arONJ1wZrzYFZJJULuJwB4KAgwdTLcH3XtX3yE6TCwf7UnzHOg3Iq//aEuvgUi
 tT3hcFHhJSoeqo6NzQzW/581inYZWtCwXOJhQBgCD6XjlPhS1vp8Pv79nXSirlv1
 X0s4GQU7k5X8yNNViXK8r1qkchpIirR/PonymUBThgHqFKxCDSrE/rCFS0ImB5MA
 eMgX3qk1NxSHt+UT/zCJfQwlppbVgX1HAh7lyDnP7M1pyt9ro/oYNGODA==
X-ME-Sender: <xms:lNh5ZOCm3ixCH_G8952yVo-eJzS8mNzF-U9exP_3e2F6S01Hay7nWg>
 <xme:lNh5ZIhpMIME2xLYCG7B1_JEqUR3IS5IkxXHhPSy2bv36bMXjGpF4jWd8kfeIzt1_
 SsMgp7CSfM9QzWFo-c>
X-ME-Received: <xmr:lNh5ZBl3LYtZ1mtApA4yhLkW-qtF1h7sTGiN2uEUJlBcnApzzFpzvhh0LHt1aKWvWIT93tvn1oGWqljm6J8Jig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeelfedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lNh5ZMyXS9lJ9vuAN_JfrlCsEevogBVazDbW3UsCXo7CT9Rn7vbzNQ>
 <xmx:lNh5ZDSu5IO-MkP4zGLSoVYFjD6vGJ_TfXQ7oHS0E5SEEZhyRThCbw>
 <xmx:lNh5ZHaAt82P60-zTjHFM1Oywvp5-jJvzPmY9kLYQ0XHsIVg6wnI9A>
 <xmx:lNh5ZNc-Jz7DEXq43VCYE0sTcvKERgrWSRIHJNdcR8KHMH0AV2BJ8g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Jun 2023 07:54:59 -0400 (EDT)
Date: Fri, 2 Jun 2023 13:54:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: mailmap: Add missing email address
Message-ID: <jegv63j4u36b377c7oz6w5eudahofxhg3kpvi2h7ehona3p3pb@j55ak3uot2ip>
References: <20230531133724.133872-1-maxime@cerno.tech>
 <2641c5ba-37b4-daf8-bba8-1577e112c411@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="avsfyb7qtlu4gpcr"
Content-Disposition: inline
In-Reply-To: <2641c5ba-37b4-daf8-bba8-1577e112c411@loongson.cn>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--avsfyb7qtlu4gpcr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Jun 01, 2023 at 12:11:59AM +0800, Sui Jingfeng wrote:
> Okey, that sound fine.

Is it a Reviewed-by?

Maxime

--avsfyb7qtlu4gpcr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZHnYkQAKCRDj7w1vZxhR
xdu0AP9xlWrgZ3/3VHuZp0evvMZAaVaOeolTbxip0D8+AqshqQD7Bn6+OlC4dh6z
khUXhmcW0F0j1E2bylVuKdh6hYMnXwM=
=oAlx
-----END PGP SIGNATURE-----

--avsfyb7qtlu4gpcr--
