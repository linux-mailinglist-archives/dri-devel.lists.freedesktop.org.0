Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDCE3FD716
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 11:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DB66E167;
	Wed,  1 Sep 2021 09:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005DC6E167
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 09:44:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 70FD15C014F;
 Wed,  1 Sep 2021 05:44:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 01 Sep 2021 05:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=6cqD6nQU5pFx8MAxYYBBxZtH1FT
 T+OpzwxSoVHjjIx8=; b=Jjx+mQGGcl0KfpMh6xBG9jcGkscjv7OVbOWc6HAYONz
 i/zDxG1I1XyZTkJ5cuPlhpAiQjZGl78/YwGXaT8wcOwkxRERAs+m+/LbUFq6Sqil
 nleOQlAWeiSCk1kKuVywYvz29de7sXDCdkyHJWq41sW2Voov+XO7Gko8bxJKElga
 vu3mnoNNhdO2+OmEl98W3EbUmNVfiFUgpuoSxvh+NmYQHeZJKfBy18lmaEoVtyxH
 UUIRMDpflee9nGPOLpam9IW88WtjthcGs3cgAEW+9WVhq4uni/WsjasQx99X2sop
 f+6oxY4pmGss9aBbfcxti782vfg/W1hRNj6DRLRITkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6cqD6n
 QU5pFx8MAxYYBBxZtH1FTT+OpzwxSoVHjjIx8=; b=du+Xej6xiP9EGnN59wRQ/a
 Srup81rEW7CptsszqncYW44yweYDS5Yow4Tndzd1Vje9aH23zXdjfL0uDVxb6YcM
 JkAblFPLpPTXv7vp5TjEt1qTs2pxRcnKV9EeOZAo5NHhPOzrZmIV8HmWxeXr6qO0
 Ll8iesTe9SJZ2ygGJFW0qzf2fdI0gmFHKbvYBf6YCWGPNjA9Q29h6fGNSAIC4tlY
 f1147co1vzcWT6BKc/r6xuvdzHrsnp0ZI74dTSOVQ9UALuCdR0tjSfj82GypE5iS
 uSVEz6rLba5bXjvD4xAKORyuTBdIN36jB0n7ZWiChPi9o4MbMqf99EFVLY844WPg
 ==
X-ME-Sender: <xms:ZEsvYVDH1KnE0bc8Baym3zYXNNAWm3wJOmdSJ72I_in2S2y3Wipv-w>
 <xme:ZEsvYTjZYOBbdprRwYe75IHuNPEkqm0FHDUikMn2Ce5ZWNypHVQmSonr2v5IaEdYC
 oaOzyVdFwXVSbN3hAw>
X-ME-Received: <xmr:ZEsvYQklZVOEx5MBsBXLLx2nXZeV_DTowQQ42dlenbzDlu9i9uRtcGauwVmqZ3V17W_Ok7UxolH7E9P4lQTU8oA9JqnsbUoFhIPM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZEsvYfxGhphYsEYqMY5S5EZLsCb2iSI-MIPUCIREA0Uv56IupVkhcg>
 <xmx:ZEsvYaRlhskCQbmNGpMbNLLxyLFLbOW2vUico55VB9yRTmumYGEiqQ>
 <xmx:ZEsvYSY7ofla5CHO8g_f4_5nxffjlqRgctqxC-rgEaxjbVlaVtIHlQ>
 <xmx:ZUsvYXQhExoXMwwJPUBJzGcUT3dPtW-8_k6sEuhvWq5b0OlvzFYfQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:44:03 -0400 (EDT)
Date: Wed, 1 Sep 2021 11:44:01 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <20210901094401.rwaux4lyy3ivn4nc@gilmour>
References: <20210831135740.4826-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="okxolxv65jazku7a"
Content-Disposition: inline
In-Reply-To: <20210831135740.4826-1-caihuoqing@baidu.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--okxolxv65jazku7a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 09:57:39PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied, thanks
Maxime

--okxolxv65jazku7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYS9LYQAKCRDj7w1vZxhR
xX18AP4/IqAB1srwA8hQX/sBqM5thlUz3OEzuv9Pc2S2lAEzLQEAkizux+YgDtIN
iesfNJpUVVlmUgfshBN/eXr4M/T4Kwo=
=YXNY
-----END PGP SIGNATURE-----

--okxolxv65jazku7a--
