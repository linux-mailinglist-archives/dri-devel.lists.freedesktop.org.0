Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8785357DB4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 09:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B266E9ED;
	Thu,  8 Apr 2021 07:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA4F6E9E9;
 Thu,  8 Apr 2021 07:58:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 153465C0158;
 Thu,  8 Apr 2021 03:58:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 08 Apr 2021 03:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ivSego4I7bZ5eKPvELmNaata1GV
 NDZ6LFRSh0KXK3/s=; b=QYYGFdH44pO2Brvkt6h7KBB2+iF3JvIxNLLyLozZSNq
 0/9i8XWoehGstw8qZj4OneximALk8Al3bZjWkd/x7EVOmrkdddsI/C1tLCMGwm+s
 v7ZZ3seD+zsnDZGQomRHyY7IgHF8FkF2pKUVZxHKHT3NXu/49Lir+1yUNLYN0OSc
 fYNRvFb00vS+EQqnuPT4KLvUZkp5EWI27727ZvHsMhECm5lGXiudgbjot60Xkgdb
 nUTldisoOBfS9YHyEDAFLpuof1ATnFKoiXTDOzpxHi3fgXhfwuDcIz1nUObUdd5R
 8EuFEV6M12FCH0fCGxXFPGuxQo6aJxBgPPbqzGAwX1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ivSego
 4I7bZ5eKPvELmNaata1GVNDZ6LFRSh0KXK3/s=; b=rnsqcrBJjqOEY/S7Xh5oeQ
 MBRGIS4lT5HcFM4R6cURTEKooZzLu3I3DYttwlHow+VpTgYDNRGBvBojuiubp8c3
 BLpBmhf/pgPwmw2Y5DNHfEE/T0SRFLI0dqpclqV3k44HvKLkVGP9ll8WGP4qG0zZ
 ETb7yjLoQomCgoj+zAVK8Z7DvKBQPwsZl3ARm06uH8IhBOKQWl45BGwdnf/MRGqd
 r7TmIsbPhELd8x08nGa2wasS3/2Isqu+V3RwVvyStv1KpQtk16mbhu05VcDs1EFk
 Ynogcpgt6MaIRtVp0WEheuzN7+LVNIsySF/OniDf0CDqJel9QrjzuNSOrlPmpM1g
 ==
X-ME-Sender: <xms:oLduYDHcmnIMqNmYCWPZuTEZfIYXjkhDfEA6iKLjVHKmV10Zfqo22g>
 <xme:oLduYAXj5bB9ftt8RZsN316A6HmRUWlk_EDIu-Hl8231IxEbAMt61GvyPglIAZhkS
 qV9Ut-DJ19ocxDWvIs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejkedguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oLduYFJ_1HEAfAiNW9uKySDw2WoWoU-7C_Ns6N8_BgFXkQvtCOMF8A>
 <xmx:oLduYBFOWSIpgaDU658cXNdjYlQ3FRm2u1PWP_OpDtMGyfS-olBBqA>
 <xmx:oLduYJVHGc5W6knP_Hxkh4FxppzptGc5Vl23fn7OK0QoZ09zpaRjaw>
 <xmx:orduYIE40mZx-jQjW4zFb_irlF7oDY06Vvke2o2XCWSiHQjdI7uRAQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04150108005F;
 Thu,  8 Apr 2021 03:58:23 -0400 (EDT)
Date: Thu, 8 Apr 2021 09:58:21 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/4] drm: Generic dumb_map_offset for TTM-based drivers
Message-ID: <20210408075821.bbmxlurmihd4ghpx@gilmour>
References: <20210406082942.24049-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210406082942.24049-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 bskeggs@redhat.com, spice-devel@lists.freedesktop.org, kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============1677253529=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1677253529==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nhsoqxufqmlyazgx"
Content-Disposition: inline


--nhsoqxufqmlyazgx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 06, 2021 at 10:29:38AM +0200, Thomas Zimmermann wrote:
> The implementation of drm_driver.dumb_map_offset is the same for several
> TTM-based drivers. Provide a common function in GEM-TTM helpers.

For the series:
Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--nhsoqxufqmlyazgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYG63nQAKCRDj7w1vZxhR
xRYHAQCB5YdMvJQCmZrSZdd7iTzptJmugGwvmitemDPO09KmEwD+MN5lN6korTN4
2ZX4gbC41r49DjVpw79WiUzkQ4ReUg8=
=KBmF
-----END PGP SIGNATURE-----

--nhsoqxufqmlyazgx--

--===============1677253529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1677253529==--
