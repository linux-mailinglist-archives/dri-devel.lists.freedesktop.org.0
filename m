Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BFE2F5D70
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F32F6E150;
	Thu, 14 Jan 2021 09:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E926EB1B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 16:11:29 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 502AFA22;
 Wed, 13 Jan 2021 11:11:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 13 Jan 2021 11:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=b3d3UD3T3SVRKYXWvtuLGaC4DpJ
 MEGRmIS6rLC5g2W4=; b=PvVlBxfHXJcrSYmtch0io3B9Gpk07ASTjkz0P+RTgfR
 lbM5HSI15BD+ZJjuUa9+SlHfOpbGU8gO/2UPpJ+jauWG2dUAy8GlDbrhf3OzW0hh
 CqbNc//7bc0BelwF6T8mMbtPfspZTfdb7B1w8YFtMPeIVfcsaU43EPfIKzVv0qkA
 ITMQZU1Ht6iFO4lFjoFl+zqqbTCva4uEHeDe4ZgVlJKi3Ifi9fPqk817E21EJmq9
 CZvWdjXhYNVeW3saG6l0tKgH0oqE+CKFCAwklNsC9BJQ+vIof/rErToKlz473B1Z
 zCvFVhKKJRw/TynJCJ9S4lh277PGH3blkVkLzos15HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=b3d3UD
 3T3SVRKYXWvtuLGaC4DpJMEGRmIS6rLC5g2W4=; b=bDybs4xhjgwU1IbsmjiVFA
 LN7uQvRroriusWHkiabzqMxFWNFqMzDE7MssHEdC+Xjf74X9rpZuut3cH4jtx4N1
 378v6O5NXfpHxV9MxpaEd7VkrWRpFga4YDkTsbYuIsZaCGD7Sh3bBVBEgkQExVeB
 uASqLdMSUlI76j1zGPO5o9owU4/ZhIZs2YvumzAe5Kq6tpOcyyBavZUr82UcaXlF
 wqHgBjnukNVKQ+19Bgtas+RhQd6S6LfDGTHULdwPtjk4uZ4lXMoTivIsvGjYw3aI
 d85dnFQvg5VF5vTpKw8TVRorMzBzuSbqd4p0ZGQuLl3+bIELzVcVZbk2fq7xeYiQ
 ==
X-ME-Sender: <xms:rxv_X8TUdVB5AWh4fapYm9fLunJ2ozk_n0-UcjFUGEWhrxJMlMQ1pw>
 <xme:rxv_X1ytuxxTedt6qy1o7m3_iNBqPALPuODiwqrwegwbO5tbU1FU-jlm2e4PK6KfL
 L0LC-15TFoj942GjLs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdefgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rxv_X8DIPPXVu9SS8IRy3R0BwVckQw7xp6vljMIc6TG-vFsfGY5x3w>
 <xmx:rxv_XxHa8cq1M6H7yfGuSA0ti-UN-kuhO-FIF5CRmqFY_MRoYWN5ZQ>
 <xmx:rxv_XzP0rv90p3296taj_nT9_PxCq-cz9EvUjBlCodNUKDQhf591fg>
 <xmx:rxv_X7WDCiJA6RgIMGv9yJRM3XAGva89GnBUG8SCYzOEiBxTCMkMyg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1E1B240069;
 Wed, 13 Jan 2021 11:11:26 -0500 (EST)
Date: Wed, 13 Jan 2021 17:11:24 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>
Subject: Re: [PATCH RFT 0/2] drm/vc4: Clear the display list on startup
Message-ID: <20210113161124.zfqv5hklxlg5qltm@gilmour>
References: <20210112134730.810697-1-maxime@cerno.tech>
 <20210112195655.GA16821@xanadu.blop.info>
 <20210113.095159.2007886149433657238.ryutaroh@ict.e.titech.ac.jp>
MIME-Version: 1.0
In-Reply-To: <20210113.095159.2007886149433657238.ryutaroh@ict.e.titech.ac.jp>
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: lucas@debian.org, dri-devel@lists.freedesktop.org,
 dave.stevenson@raspberrypi.com
Content-Type: multipart/mixed; boundary="===============1786137644=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1786137644==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="obq7rx2pv5ck7foe"
Content-Disposition: inline


--obq7rx2pv5ck7foe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ryutaroh, Lucas,

On Wed, Jan 13, 2021 at 09:51:59AM +0900, Ryutaroh Matsumoto wrote:
> Hi Lucas,
>=20
> > week-end, so I cannot test before early next week. However I'm Ccing
> > Ryutaroh Matsumoto who could also reproduce it. Maybe he is in a better
> > position to test this (@Ryutaroh: I bounced the patches to you).
>=20
> Should I apply PATCH RFT 0--2/2 to
> https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.10.7.tar.xz
> or some branch of someone's git repo?
>=20
> On my Raspberry Pi 4B 8GB model, all versioins up to upstream 5.10.6
> fail to boot on USB MSD due to changes to the USB handling by raspi
> introduced in 5.10 series, and failed to boot from an SD card up to 5.10.3
> or so. No working WiFi connections neither on my raspi 4b.
>=20
> I am unsure if I can test the patch reliably. But I will try it within a =
few days.

We just had another lead on this one and that patch doesn't seem to
prove useful to fix it, so it's probably better to hold off the testing
at this point

Thanks!
Maxime

--obq7rx2pv5ck7foe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/8brAAKCRDj7w1vZxhR
xUr0AQDphhzkzC0cjwj2n00BX6nWfZER9/2771fs0T0cUk5XkgEAnQ4ZpEwGDNgp
DSF5Qi6O12jxt2GQ8Br0xviOR07yMQc=
=7Xfq
-----END PGP SIGNATURE-----

--obq7rx2pv5ck7foe--

--===============1786137644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1786137644==--
