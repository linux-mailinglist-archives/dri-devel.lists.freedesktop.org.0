Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 432EF21048D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA956E7DA;
	Wed,  1 Jul 2020 07:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EC989DB7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 08:02:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B3F5C252;
 Tue, 30 Jun 2020 04:02:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 30 Jun 2020 04:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=lu/WrihdsYQOer+w6h1sKVAQhhh
 zpgn9ANfbrgSBg08=; b=g9qa6/3vky6RpenoRSFz45zMGoY4KA1E6jJ0ZUcRlEV
 PQcFqd2AKRhgIaYvOf/xP29zscXyHpDGRrWtCl4WxMhPhmbQ+jRrNnBuMAcwCTdI
 5f0s03IvSlUqq2Wsb0eyaFpZ4emls8T4KMikrDhjWaYDcU/jbhqkrvBTQ+j/SaDM
 frRilLO1PAoEStRK4Tpa4AU8+Lird/mo7WTS8GWFDoofnPbkvgp1803YopTt61n6
 VYaM2OsbJct65v3QU2aCKXAN7KQbZpUkB/2irR7fA7szGLuzIxb4u8eltpWdx8xi
 J3TvQIqfNXYrIadNJUyVlUdBjgqNLVjBBkMx3dmyBGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lu/Wri
 hdsYQOer+w6h1sKVAQhhhzpgn9ANfbrgSBg08=; b=IENVijjTKHsAo29my84QNt
 HY8lF7lDEOJ1kLi3ESudeyXEHRivnOWiNwwtK0hFN0ul7TjHAChlcJ9b/UzEhDHo
 2eSoaardOH9Tki2+UbX0NcHp8T+t9rF6ldTEmBqXEeD0iRl/n+MqM88uGD/YexL0
 i7rEqqodW1Nbz/TEu5c0Ktgyj2ZYvr5Sq8IKPiG+hAT4eIDXqbD+Df4RjhDxytpa
 HQDi64fBZOLZPdGKuqhLFiD1D3ph99Tl74Payu2AtJc3oLcRgtinz2LfM2+qapUa
 EhyIrnoGNF/cXhGkxJro55Kk40oA2hXYpU3L8v3v4EGPz5o64hxYzEowPxEE4gTw
 ==
X-ME-Sender: <xms:n_H6Xkl5STMdOqdfkt3UgUS68MEyZUSxq3JRCbrWivKFaQus7QqTjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddttddguddvlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeefjeefkeduiefgkefgheefteekueetkeeiueekgedvvdevgfejgfduudei
 veejieenucffohhmrghinhepshhuphgvrhhushgvrhdrtghomhdprghrmhgsihgrnhdrtg
 homhenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:n_H6Xj1Wgj7m0IMsjDA-5IvL7RGLmM0Jnqca4MD3W9rSANjADEgZ0A>
 <xmx:n_H6XirelRRngq7-TERnqrtXaDDByLZhYcxsz78xbouElrd66cwcXQ>
 <xmx:n_H6XgnABOkXWd6TTqOF4FAFV72iOHSRpCk5Z-6-a0xY3kQAhUFRjA>
 <xmx:ofH6XnydwAiBKEXYT_AJwIgA_erJoiMK9bYjJ5pqJUG8o5ThSUckXw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04A033280066;
 Tue, 30 Jun 2020 04:02:38 -0400 (EDT)
Date: Tue, 30 Jun 2020 10:02:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH] drm: sun4i: hdmi: Remove extra HPD polling
Message-ID: <20200630080237.dsg7umd6ju2oamg4@gilmour.lan>
References: <20200629060032.24134-1-wens@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200629060032.24134-1-wens@kernel.org>
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0629802180=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0629802180==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f6hdlqsued72r5t5"
Content-Disposition: inline


--f6hdlqsued72r5t5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 29, 2020 at 02:00:32PM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The HPD sense mechanism in Allwinner's old HDMI encoder hardware is more
> or less an input-only GPIO. Other GPIO-based HPD implementations
> directly return the current state, instead of polling for a specific
> state and returning the other if that times out.
>=20
> Remove the I/O polling from sun4i_hdmi_connector_detect() and directly
> return a known state based on the current reading. This also gets rid
> of excessive CPU usage by kworker as reported on Stack Exchange [1] and
> Armbian forums [2].
>=20
>  [1] https://superuser.com/questions/1515001/debian-10-buster-on-cubietru=
ck-with-bug-in-sun4i-drm-hdmi
>  [2] https://forum.armbian.com/topic/14282-headless-systems-and-sun4i_drm=
_hdmi-a10a20/
>=20
> Fixes: 9c5681011a0c ("drm/sun4i: Add HDMI support")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks for figuring that out

Maxime

--f6hdlqsued72r5t5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXvrxnQAKCRDj7w1vZxhR
xe0/AP9AfcSEFn4bwp+kbpsDasBM88jTsQJiznSvcxSJ4WCaWwEA/XSg2I9jaQuc
Vrmg3HbVedQSShsVClRiJer2EomSNgY=
=Tbdr
-----END PGP SIGNATURE-----

--f6hdlqsued72r5t5--

--===============0629802180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0629802180==--
