Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B403140DBB0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D38C6EDD9;
	Thu, 16 Sep 2021 13:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4286EDD9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:49:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id F281832009A1;
 Thu, 16 Sep 2021 09:49:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 16 Sep 2021 09:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=hGTVPZFTMsORaX5yiAkxUoFb7lF
 s1xVmUrZXKC4Tl80=; b=2TxfP18c0sCp4qlaH7ELC8YOs/GELiQ9PFVvGHPOnOe
 Jsepbl3Z6AYjMRYqEsWXWuFVawpmw9eg9UTz+R3j+1XAKDgOh2krQiUgMTxwsX3x
 728KnZwLVuvaF7oDoyt4vLXzsqrp2niSiVDJg3mOQp7TSngrXqg3BC0nRZika9Wu
 S/aQ1e2g4pFmqJ3nmX9Odz0NY4zDb/vDWKcxNXHxpK/2RYNMW6KlWcQYMdEhC7qn
 FBLiaQ4RWThuQVqkmWkBy0Z1I7a8Mw//hNGsicV+FlYVufvUlc9cWwtOEWt6HHHh
 1FBlYQjxF6OczhLY1l1Y52IkVtCHls+8EnJDLw3a1jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hGTVPZ
 FTMsORaX5yiAkxUoFb7lFs1xVmUrZXKC4Tl80=; b=Y6JykOIqHJmeOZW1JYFlHU
 hoESyUgOnZZfrVbZm9t4TNgWbJDO4R1Ra66CzDDLsb2FdoJphcnCLZHij7MNVhty
 hxKkAu1tike17BhuF5l33+0hFukv8vzVrZUyEVxFjOrOKT9BaQJR/OjqkyHo1yVs
 pbncNPsssG0kni3PsR1KMHDAtY1MnoIsEdRUHzdu1LqKIEaz4VSyyy5MqFcLtYlS
 Vf0g+afLWFKScXRvN+PQCBVi191u+tEl1I7RenGqFNsb+tG5VUOP53Rw0vR/HNGU
 exVSnOTZHilRSlNB14xonyZl7TsMd9ydqmernpVL8+bdHA0TKzPUe6EqMNNSCfXQ
 ==
X-ME-Sender: <xms:bUtDYVOZoH2BtLRrGzbOC1dewN5f7LqSi8IdSCbtoAfMljrgSpFyWw>
 <xme:bUtDYX_2m2F890zccEPFzp-y8Z9eU91-T2LwbA91DIEnnjsmTfAGHBYQlG6Ed5FSL
 m95Blnj7OL5E7xaQPw>
X-ME-Received: <xmr:bUtDYURmUgX1u9GxjNrqykowIsoX19Ps4lwqxM9a3jb9ifp4Aqno6_vZTpxO76Mr_cvnyah-hOyXO5HeNy1NMguXrfWZxvyvANrm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bUtDYRsPis-zFAWHuhhRBol9ZJRiYwijCo2kY7w9MqEwJ9ZaeRXo3A>
 <xmx:bUtDYdd0gvr-IkdUNWfFxX5wA5EbzCykj7g_b2T7NoBDZ24-aPYwhA>
 <xmx:bUtDYd2Fn4fR30AvRgZTT_Bu3X1eDGJ0cUs2fq_EOWQYdI5DGydosA>
 <xmx:b0tDYcxnNw1aHhRz5GSvMJZpDz0VKPmFa8GjkTCqin3TtnGCvfB2Jw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 09:49:33 -0400 (EDT)
Date: Thu, 16 Sep 2021 15:49:32 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, airlied@linux.ie, daniel@ffwll.ch, saravanak@google.com,
 megous@megous.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup
Message-ID: <20210916134932.omo7uln7vgwuponn@gilmour>
References: <20210915175836.3158839-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zoalnj333bw3b74u"
Content-Disposition: inline
In-Reply-To: <20210915175836.3158839-1-jernej.skrabec@gmail.com>
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


--zoalnj333bw3b74u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 07:58:36PM +0200, Jernej Skrabec wrote:
> Recent rework, which made HDMI PHY driver a platform device, inadvertely
> reversed clock setup order. HW is very touchy about it. Proper way is to
> handle controllers resets and clocks first and HDMI PHYs second.
>=20
> Currently, without this fix, first mode set completely fails (nothing on
> HDMI monitor) on H3 era PHYs. On H6, it still somehow work.
>=20
> Move HDMI PHY reset & clocks handling to sun8i_hdmi_phy_init() which
> will assure that code is executed after controllers reset & clocks are
> handled. Additionally, add sun8i_hdmi_phy_deinit() which will deinit
> them at controllers driver unload.
>=20
> Tested on A64, H3, H6 and R40.
>=20
> Fixes: 9bf3797796f5 ("drm/sun4i: dw-hdmi: Make HDMI PHY into a platform d=
evice")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks
Maxime

--zoalnj333bw3b74u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUNLbAAKCRDj7w1vZxhR
xZ1VAP97LhyfzDujhDpzpZoCr0Ek8Vrbmxn2TWjt+iqPJjmXJwD/ZfGocsWg01VQ
TbwLRdd1aOIfVXtbQfCKOhuuV4nakg0=
=XBvq
-----END PGP SIGNATURE-----

--zoalnj333bw3b74u--
