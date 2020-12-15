Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BD72DBD1B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACE289F38;
	Wed, 16 Dec 2020 08:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F64E6E19B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:42:01 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id DD3065801CF;
 Tue, 15 Dec 2020 05:41:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 15 Dec 2020 05:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=IVHUcxd6jPfq0gERSuEaAzfSIsw
 xq6fdJuohmu/LEU0=; b=egPnR0Sqa+yTk4hK79/BaLtnZsh/hElYQOA4UzVraz+
 w8Uo0AKYJ9RhAedNbDpaOZOGMjFrQFGufEjWQV0K/aapRMgDW+Uj6GsQXOdXVQ2v
 e2gykxJRn924Qz9KakN/V7huDrG0YcuOrFO0GfG5S1Wj26FN2ZpO8INzFsTpBs2m
 /rLQWMPIGiU+XASCKx1O6YctquGpTs75pCVagTpmGTdXW2N6z+dhP+7cH7FN7PG1
 eS7rl2QOm1FqEk3vAX/PmB4gOu7L3k/ukKLOrcWeja6H3hX5k9ROOpmL1hox2y8Q
 CsG3gjk9FqHeD+GpXwiTDWmdEfz+sGitKmQb1hTj/HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IVHUcx
 d6jPfq0gERSuEaAzfSIswxq6fdJuohmu/LEU0=; b=fOL72VEhc0g9sJnVlYRO9R
 JClY06gdskAVrryVQQh9risA3JYZ4JsRLt6GzLN6Z+DRXNtkU4Jx1OheQr4FTX0+
 yMLyQQq3PNR4JLpLnI1rCT5GtX7VYaBmU1xnX9XPkgiiymzymwY0OaCLuQ+3GJlK
 E4MASRmD8c1mMW56ONpsbtYy2wZL9thYnmILaXzVy58eqI6KvKsmxpME+BjaHj+M
 M0XuYlTZB3Ejyp/wy6LGVZxCiSUvZWVNpa85Rxtt+UhDaCEJxquJEpEiH37ZDIE0
 8gYCTjZ66AH6UrKTq36x/GhnmyNGWyZ6xez5npocTHJC2yuDc95SvNlBdFyfGpCg
 ==
X-ME-Sender: <xms:85LYX_0b5RXgaNWmUxtl1uxuNGs8wms88RmR129AdGD6_ODBbxCQ2w>
 <xme:85LYXyUuE_7tO8WTa6V9ULX9iB17BD-bNxEX_BeT1A6nTvGszIobleCRRMKe-J1Gm
 WQmR2X10hbcduZrbD4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:85LYX67QZstiRlLYaFoqZlEgeFSjFnNAKLhFc-WBgXGYCcMUou0lqQ>
 <xmx:85LYX5I3qk1NAvL7cL-3ZR2lnmTanPSZRDsf4AczV526gvsMX6FLiw>
 <xmx:85LYX7J0kq4eC0hDEPXGXY_Rs-eTFkFEkQ1Jz2Q-zLtotJEXvMAyAw>
 <xmx:9pLYX6vXvS_WagMQA3Q9Wuzdp4qQ8s9CWk4Go8P2ssz7Zq3v7P_aMQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 684E624005D;
 Tue, 15 Dec 2020 05:41:55 -0500 (EST)
Date: Tue, 15 Dec 2020 11:41:53 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2 0/7] vc4: Convert to drm_atomic_helper_commit
Message-ID: <20201215104153.xdwrcvi7fr7etz2v@gilmour>
References: <20201204151138.1739736-1-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20201204151138.1739736-1-maxime@cerno.tech>
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0935502762=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0935502762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cwkuxl3gevsekw5l"
Content-Disposition: inline


--cwkuxl3gevsekw5l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 04:11:31PM +0100, Maxime Ripard wrote:
> Hi,
>=20
> Here's a conversion of vc4 to remove the hand-rolled atomic_commit helper=
 from
> vc4 in favour of the generic one.
>=20
> This requires some rework of vc4, but also a new hook and some documentat=
ion
> for corner-cases in the DRM core that have been reported and explained by
> Daniel recently.
>=20
> Let me know what you think,
> Maxime

Applied, thanks!
Maxime

--cwkuxl3gevsekw5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9iS8QAKCRDj7w1vZxhR
xehjAP9wOcR9qJcXi7naiRZnAejp0hlygHQ6DJWoGfUCMt3SZgD+N0zHvjYPWzcd
4WJiwGq6z+Zxs0+webVjQO18NRL1wQY=
=WbCd
-----END PGP SIGNATURE-----

--cwkuxl3gevsekw5l--

--===============0935502762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0935502762==--
