Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7245324ADA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 08:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75AE6EC49;
	Thu, 25 Feb 2021 07:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840486EC49;
 Thu, 25 Feb 2021 07:08:10 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EE2305803A4;
 Thu, 25 Feb 2021 02:08:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 25 Feb 2021 02:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=AZu9RdHKS45RqbSECTd/B4xBxs/
 yBPCajZ0CCWUQcYY=; b=F2haPlwESmhsHIgpowjFwxWOr0QbuH5RaENdmik2sON
 QjMZqPrwtpfZdxRq7xw4lHg0nVy2vG3PSgw6C/3QSgIdlLwDskdmC37WqJ6P4WPe
 bWY9NiSeayJ1nXNhQ+nDlAhMwGqvu8HDU9xA8/pnebmYc/kXM1bECEvyPSnzFdij
 5lA58RDVyIvHOgzTmDXHHnKKRjLzcge4tucz4CvpV2d0WQQ73aAR1NV6U/l6/cee
 rLtGAKKsqOJHhEKLfqtJ47r8g86uTqunfrZQZYEvgIcOSIZsiICCrK8Drpp4tRK5
 eBH7zwLZJu9jqhjQ6tOABzqctn5AGNQrnTBFmhxph8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AZu9Rd
 HKS45RqbSECTd/B4xBxs/yBPCajZ0CCWUQcYY=; b=UMrinhy+cK61AOhbMKwx9C
 GFb30hWLQw5UdoOx8pxmhiRopiWfTVQ+W6MgORc2dNzTYYU1WI6IIXM7mjhCS2uT
 NgpwsM3cB7R2z3cyoWtYYCxYKzNw9L2T3BhKmEjvRLe/lbocC/deWpG2M4ISoWpH
 tZGqAkretzNg3UPJXEHoR5dNIAZ6/uh4z7OXZ+cM6O6lS9W4LQQwcdzUC1tZBY1d
 CrWappn1PFJmhQFqdA39KdrjTEnKHP8z8ZBOQQeYVv5E7PK+MEe4clZ1VYV/AQD9
 PsTPmXosctM4Z95uA6UTNd1C2MpYbX+Yh43o5S7IiPkDTmLb8G6mmqu0kdGLCqJg
 ==
X-ME-Sender: <xms:00w3YIBdueJnRZlKvFrknRG-Dx_X6lyia_1upL53zyaavNM0cqZDBw>
 <xme:00w3YKjr44wHD-t0zfIEZJdfAb2GMAaj8mTGHDjWkfOtWLsHZnoa07VynCLZ1rhB6
 Z19Bq-QmAMcSUWNg_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeekgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:00w3YLmeBKkBcd4aey9uT_4Je4M8FkZmqtWudKoqvLdnTX9jZtDdLQ>
 <xmx:00w3YOw2ASPGv603sBv6tV_PF3vN4zGlFqCO9rrEfpH9vkx7UMooOg>
 <xmx:00w3YNQusIQZcMjJ8SBKhdmUzETfdLV6YaWWy6IHFb16kq7-9yTCUA>
 <xmx:1kw3YOAg1gYFaF7YTyaRoxB9Ry69BXhMUhhYV-ZqyGtr56zAlbI1UQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 11857240064;
 Thu, 25 Feb 2021 02:08:02 -0500 (EST)
Date: Thu, 25 Feb 2021 08:08:00 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/11] drm/atomic: Pass the full state to planes async
 atomic check and update
Message-ID: <20210225070800.cylmzc4aw4lf64m3@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <cead3a20-08cf-78a4-88a9-c6b6697bd8b8@suse.de>
MIME-Version: 1.0
In-Reply-To: <cead3a20-08cf-78a4-88a9-c6b6697bd8b8@suse.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: multipart/mixed; boundary="===============1005517881=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1005517881==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rlwiyewnrnff76nn"
Content-Disposition: inline


--rlwiyewnrnff76nn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 24, 2021 at 12:33:45PM +0100, Thomas Zimmermann wrote:
> Hi Maxime,
>=20
> for the whole series:
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied the whole series, thanks to everyone involved in the review,
it's been a pretty daunting one :)

Maxime

--rlwiyewnrnff76nn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYDdM0AAKCRDj7w1vZxhR
xXSQAP9UU9PXpkIhgKjNrqj/cEuwE6x8DBwzz7lZblBuahSxVgEAmjXn+ByN2oJW
HFh1nkqeJIGSo3HrbEWp+YkGuQ0BuAw=
=HL4n
-----END PGP SIGNATURE-----

--rlwiyewnrnff76nn--

--===============1005517881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1005517881==--
