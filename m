Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2A02D2628
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DC46E990;
	Tue,  8 Dec 2020 08:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0987689CA1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:31:03 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 9A24A258;
 Mon,  7 Dec 2020 04:31:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 04:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=z5ZyPZ0sB07jM21O/6os818wwZU
 Z1qpCuRD3IUXSP40=; b=nddmxVTpZ1TXIEj7wFWN5R6qIatkbh5woUS+hhUg9MI
 8YX9+/jJXscGhFtFDsbItkxLwDO2DF4PTfEVQdg5cGrvqgy89iBgRmkdz64DKo6M
 IPKe7VOodhlOYwTv25JiR8eAWvq1l8YAlKVCZO0u4o+6Ryw2xIwtD9vjr5p/4huX
 qv1GXHQzqw1s2m0MEJyyUrHtL8+t7vNeXlRTcs1TuJnof2FeRbOy2HdSGjf/ZHN1
 b0fN8kdTM5gUxUW77o33TNCjWIHaZjzEoOI9H+N2bbIbXtLyjLmyooTf7qIJCH72
 Q9TSbUOhGTdWK6/SQrxxXd6CAO/TNZSp9rCoGG2KFjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=z5ZyPZ
 0sB07jM21O/6os818wwZUZ1qpCuRD3IUXSP40=; b=D8fMjLsKGhwcyUqwuzjDGn
 Udnk8AVCFxib1mmwqM7CtpRcoBCynn2/4R1sfFIuF5OMt/DYe9oCGTijNsdsBLsz
 vMaw0YAApXbQGNUVPESHiEEvKgkKb6saUZR1cS/B4MkpE3MNmHwruzELCZYWd8sy
 9/UPjuxvp9OBRT72HdABo7yn4GRyT6b6lXf1n57WDoC1enrhwlHCSRDcEmQahcj+
 01LpGf1XQuejVo45W5kgMKhaETKzbx10OnGsugAtEX7XGi3OGSwghBzhtnteap/1
 BljFynV8mLHYff+oP6KgL8eGCHluL3wzygJkDMh6r0chalN+SGvF8aK3WPVEIhjA
 ==
X-ME-Sender: <xms:VfbNX25uPNFTMQu4bwncBfkwrPFEkZA2iq2xyXEQsCfT0LR469daLA>
 <xme:VfbNX_70T9swZV6GnQ1CSFGX58fuqMtjIpNXQDI08CJtWCIjxD5w4QalxvJLht7Qx
 CGkeMeYH5Q4YhBbqbo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VfbNX1fcr0zd2rVLPC7Y_af6idJI-xHX96JbdITlexio_SqSIuAkWA>
 <xmx:VfbNXzJn7n3UW86UjyLSTxA3HOE82C1g9xbAUDevESCYNK2H3iUXoQ>
 <xmx:VfbNX6KglIn8CqsF9anRszs8C4MuZ6UsdY4S0MoqNAE5-KyoQZAcWg>
 <xmx:VvbNX7q6uITapv0vABPk-sX4nVJI8ciU50wPMCO6BIcunEU-AQa4tA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 30B251080057;
 Mon,  7 Dec 2020 04:31:01 -0500 (EST)
Date: Mon, 7 Dec 2020 10:31:00 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2] drm/vc4: hdmi: Don't poll for the infoframes status
 on setup
Message-ID: <20201207093100.6yllqslkih2cvz3t@gilmour>
References: <20201203074624.721559-1-maxime@cerno.tech>
 <CAPY8ntAo+nDY=aJy+5TCiJ_xUWZhkDtXtXxu6_9Mj5hvgmHfaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntAo+nDY=aJy+5TCiJ_xUWZhkDtXtXxu6_9Mj5hvgmHfaQ@mail.gmail.com>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0099907335=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0099907335==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3z4qyihwdqkje5gn"
Content-Disposition: inline


--3z4qyihwdqkje5gn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 03:36:11PM +0000, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Thu, 3 Dec 2020 at 07:46, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The infoframes are sent at a regular interval as a data island packet,
> > so we don't need to wait for them to be sent when we're setting them up.
> >
> > However, we do need to poll when we're enabling since the we can't
> > update the packet RAM until it has been sent.
> >
> > Let's add a boolean flag to tell whether we want to poll or not to
> > support both cases.
> >
> > Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> That looks like it should do what was intended - thanks.
>=20
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Applied, thanks!
Maxime

--3z4qyihwdqkje5gn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX832UwAKCRDj7w1vZxhR
xfFYAQDlKP9Rc8Cbh5nu3dOGwLLbX7IxgbNuCrZk/1+HDezGOQEA1qSasZH3P6g0
KPA2XoqE6jnhgfe1Iq1vPQDL/98pEwU=
=spUr
-----END PGP SIGNATURE-----

--3z4qyihwdqkje5gn--

--===============0099907335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0099907335==--
