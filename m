Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59A11F235
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B45D6E39E;
	Sat, 14 Dec 2019 14:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6706E904
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:45:10 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id F1FA5AB1;
 Fri, 13 Dec 2019 10:45:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 13 Dec 2019 10:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=5JAgDtWDkIDmthg8go42Q5MuWRt
 6MKcHPtWZtAAcJHQ=; b=PN7VXzaGZLBHEKxf45e750Dl2CMz0pcRwodc/hlppS+
 gQbxrwF2BpFqwlUKEgmR47mR7mpq1+JaWcBtg+DdclkL3Np4nst5mkn5pvXvaYWX
 62p2Z2kql4Vc1ljsfDimuA6E6kRc7hKAY/hPTMI61vezEaRKr6MlLCp/U2dIwODs
 q/ESW59YiN2vXoUDuN15Ck/oCI6BkENWQO47kN0jCSUCyxoNUZLZRNU41m30L9oy
 J7hgDWMHd4SIEfEsIHmvZoYCxEqEO/q0tfDn0KIM9PS1+gtrn69UTUk14SBlMCgd
 GoNJaVs+qe6BHPKxnDBJ8QMnvlMb8tQNJnNCecKegBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5JAgDt
 WDkIDmthg8go42Q5MuWRt6MKcHPtWZtAAcJHQ=; b=NRBnoPL32IFe/ppdXPbHyD
 JlCmAmXUXBWDjcxOv7djZyq4N/frn9os8u9s3P7OeOYmUiKZvsBLiU8HQm74ajin
 56ceU4+nboZcow0s4m4dKUPt5xtkh1JPjI5uBm/YCTvRz4ENmCwZSo13Z37VeT+n
 tNdokzdUWZkWDV+VOUnc3yZJg03vzwMCYHkr3KWY5cG7iPkgKluNjtrtz912QvjW
 lFS6kdvAGS0/x2+9KRbk8NpjEsOctI00XoMlwLjGrNbfFku7rNsM/gycf4R1M/1d
 jM0bYwqdnX3/trN6IyZhPcZxfP8BY4o6Xvir6/AHMQPLRS4Mh6GEbpRKb1C4nErQ
 ==
X-ME-Sender: <xms:A7LzXRIpGdWXgs-RCzvqvY_O3sWAQKdnges0xjiqonywx3NyVAR9JQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelledgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpedfmhgrgihi
 mhgvsegtvghrnhhordhtvggthhdfuceomhgrgihimhgvsegtvghrnhhordhtvggthheqne
 cukfhppeeltddrkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgig
 ihhmvgestggvrhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:A7LzXRaeWXB6ahcz5QcuJwrKngDG_ehWxa6oeBHyCLOxUTWpoltvsQ>
 <xmx:A7LzXUsAI-zbFiG7dKW_-rq-Q1XnlM70Z8XEvuSEE7OHG7H9FroyXg>
 <xmx:A7LzXWuLTVs-NbjSSa3UVWoq_MZdSA4EYjZofJlFZCnd5RSwu2MKkw>
 <xmx:A7LzXZzOZ73RJ5K2xaFScnjfHaZU-PIpZdhLbUu4oN8ncTFhV7IAVQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D01B8006A;
 Fri, 13 Dec 2019 10:45:06 -0500 (EST)
Date: Fri, 13 Dec 2019 16:45:04 +0100
From: "maxime@cerno.tech" <maxime@cerno.tech>
To: Yuti Suresh Amonkar <yamonkar@cadence.com>
Subject: Re: [PATCH v1 03/15] phy: cadence-dp: Rename to phy-cadence-torrent
Message-ID: <20191213154504.2qvvh4z5gin3ymnd@gilmour.lan>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
 <1575368005-29797-4-git-send-email-yamonkar@cadence.com>
 <20191213095657.cia5cmcjopcxjyqo@gilmour.lan>
 <BYAPR07MB51104C210170FF41BF1098C4D2540@BYAPR07MB5110.namprd07.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BYAPR07MB51104C210170FF41BF1098C4D2540@BYAPR07MB5110.namprd07.prod.outlook.com>
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: Milind Parab <mparab@cadence.com>, "praneeth@ti.com" <praneeth@ti.com>,
 Dhananjay Vilasrao Kangude <dkangude@cadence.com>,
 "jsarha@ti.com" <jsarha@ti.com>, "kishon@ti.com" <kishon@ti.com>,
 "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Type: multipart/mixed; boundary="===============0818879934=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0818879934==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="watnj2ztuq7jcc6l"
Content-Disposition: inline


--watnj2ztuq7jcc6l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 13, 2019 at 11:05:56AM +0000, Yuti Suresh Amonkar wrote:
> Hi,
>
> > -----Original Message-----
> > From: Maxime Ripard <maxime@cerno.tech>
> > Sent: Friday, December 13, 2019 15:27
> > To: Yuti Suresh Amonkar <yamonkar@cadence.com>
> > Cc: dri-devel@lists.freedesktop.org; Milind Parab <mparab@cadence.com>;
> > praneeth@ti.com; Dhananjay Vilasrao Kangude <dkangude@cadence.com>;
> > jsarha@ti.com; kishon@ti.com; tomi.valkeinen@ti.com; Swapnil Kashinath
> > Jakhade <sjakhade@cadence.com>
> > Subject: Re: [PATCH v1 03/15] phy: cadence-dp: Rename to phy-cadence-
> > torrent
> >
> > EXTERNAL MAIL
> >
> >
> > Hi,
> >
> > On Tue, Dec 03, 2019 at 11:13:13AM +0100, Yuti Amonkar wrote:
> > > Rename Cadence DP PHY driver from phy-cadence-dp to
> > > phy-cadence-torrent to make it more generic for future use. Modifiy
> > > Makefile and Kconfig accordingly. Also, change driver compatible from
> > > "cdns,dp-phy" to "cdns,torrent-phy".
> >
> > You can't really do that though, this breaks any DT using the old compatible.
> >
>
> This driver has never been functional, and there do not exist any
> active use case, and hence the compatible string has never been in
> any of the dt file.

Ok, I guess that should be made clearer in the commit log then.

Thanks!
Maxime

--watnj2ztuq7jcc6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfOyAAAKCRDj7w1vZxhR
xch8AP9GpLTVXRF+HhRsGLZ+Xgz2KNZkQ+GetkM4LLdfn7O8vAD/dx1+jY2x/aJZ
3Ftq1QrcNaV8WyHUCdFwpcfYoYJy2QE=
=/oii
-----END PGP SIGNATURE-----

--watnj2ztuq7jcc6l--

--===============0818879934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0818879934==--
