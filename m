Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC47740DBA8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC636EDD4;
	Thu, 16 Sep 2021 13:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4496EDD4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:47:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 28A233200976;
 Thu, 16 Sep 2021 09:47:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 16 Sep 2021 09:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=ZsbUYBExbqhrIvcodkWis41pjnV
 EaK1V3/eLOX62TBQ=; b=W+s6UTB6l8lSVuMjAxWYuNkuG8F7xxYigx53h6P0ioI
 4DidS0a/xXDLC330xrwf1TBWMHWNO4nthqwr3+NmAg4CYWDNxCH8kb2RrrsYiW0e
 BmveAq4tgqg+4Hx64XzcNqr8pb2QDxt9rQk7kqQLQgJ9UmMamVLz5zSh3xUxEvFl
 UgLBvjlUnVaGUJDKDe/73amPv8D8e9ojLnHvdCoSGTY4LfBoo8Jf+sgLLJtDbSv/
 xS6834GcIV1va1Zz2h/hWQHTlarqXFTqcxTCYIAYFMc7D1Q2fNTipuy/VJ3Nf5Od
 kOKutV+K7ddIHRx3Vh+KrypT2Yp1bn3JXEXPSwuJ3Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZsbUYB
 ExbqhrIvcodkWis41pjnVEaK1V3/eLOX62TBQ=; b=jSJLqlrt0ZVjNe9Xj/KMZJ
 TbtDTvi7HORgYAVtc6ZEV1U+5wp0t9J73aFA/vy0mOntfJkDBCpMwSfWc/4WSvhQ
 aJsfKuolUOmrDJFLYLRR8CBelIkNYgordHlGe6sBBTT5YgUCFKu/SH7crSf+ab+O
 xOD5BefIxge3+nHBAbiqZvlpP/QuPQqXYF2p1lRHrcHAjpgrxODT1j5lFV+iWa5G
 N76k1xVXlp3DOYZhyl0gOnk/bIlywMSk3+zEksCmYtMYd9ROA0nJmIrXJC1OYP3W
 2UNechr5oPDImK5yf+YccfGvo/QeayS+mo2J1CpHpXcYSQY51PhBxmoqjxaBcF+w
 ==
X-ME-Sender: <xms:AktDYUJc1hmn3vnqglBnsH4U2c0M9qpvBv-Zt-zxMdZFCtiPljRJbA>
 <xme:AktDYUKw9iejnp3gWuU57bbRSMfhhPbQBv6gQvcWjxgy6jugkqwmwg7eZEGjiAkLr
 W-B63Yf1i0-m6cvdMc>
X-ME-Received: <xmr:AktDYUuwnFb2WovRidvArhBpjyjDbn67NQKl_iRYIvDNuWG0-yL36CBi5liIU8bw7Jo_HYLT9eG9zTnfxs0mqAAeAn1afUYj4frA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AktDYRbeIXtb8CNe4T_GFjWWFmYZbbhbSxOmhqvzbkvi-AWp-JHtxA>
 <xmx:AktDYbYXf-et9YM1lCtxJu5W1d72JMv7eVWavilMAVFHlfFvZrujjA>
 <xmx:AktDYdA4GfEICEcMs0NeC-xnzggsww-5N-UoLtB-0mtPveHjcRwl8A>
 <xmx:A0tDYf7OVKMmnwE975Gbg2JIqxN3KF-pb3nDk-cqhDhfDvwWpyxFlA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 09:47:46 -0400 (EDT)
Date: Thu, 16 Sep 2021 15:47:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: dsi: Make use of the helper function
 dev_err_probe()
Message-ID: <20210916134745.xhnnu6gszcvlxxvy@gilmour>
References: <20210916105625.12109-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6g2ybwxxr5blhdme"
Content-Disposition: inline
In-Reply-To: <20210916105625.12109-1-caihuoqing@baidu.com>
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


--6g2ybwxxr5blhdme
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 06:56:24PM +0800, Cai Huoqing wrote:
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> And using dev_err_probe() can reduce code size, the error value
> gets printed.
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied, thanks
Maxime

--6g2ybwxxr5blhdme
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUNLAQAKCRDj7w1vZxhR
xTMPAQDzNZ+t8LIuIVzLhPMZ/9gUqrnyYy7kPviLapc0Zu6l9AD/TygXQ+IKJysl
7C52jM60DNbDDF+Wnmktxs+JaD2sxwE=
=/2Gv
-----END PGP SIGNATURE-----

--6g2ybwxxr5blhdme--
