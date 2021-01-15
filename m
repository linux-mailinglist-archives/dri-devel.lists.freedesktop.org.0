Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657582F8D00
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B296E5C5;
	Sat, 16 Jan 2021 10:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81136E45E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:14:44 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 807C45C01AD;
 Fri, 15 Jan 2021 13:14:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 15 Jan 2021 13:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=O0QO0kBHWpyZ7sOw1tflo9GJqtC
 LGDDPbKvFQKYvP/k=; b=ii+G6VUCs2S6Kf+bBjmcEylWqaWd52nt4Khp6ibbejT
 iqT6lrAAxwxjqbmWPMk7jTd++sY5gJquoIq7a+2qlWM19/iaGx/cR7gq2TRLH5Ns
 j2Tsp8J9hosLVPB40ap38rLWDX/PM2AZoXQBma99Gg7TRp0dAepXaWqI+MbJVi/v
 2uq6Y5yz9JKpnGMEn0jro+nubknzkEjBN2y2nIMphsPfFbfKFkelMD/mCUZzcUE/
 x5YYDHcv61LSLrqF7+oSRiVoWCAKYrZSheYbF3gQ+edcV1nu65WVv33mE8Q5ge5/
 /oAqHzNkkMVVFafikJo0HFWornfqmlLs4haAUrLr4nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=O0QO0k
 BHWpyZ7sOw1tflo9GJqtCLGDDPbKvFQKYvP/k=; b=BinXkS89uOwUG+kp9/N5YG
 w7/5LMuefpvBLUPa8L5MJNd8ezgkLehlm69LbAuXU9HulXgGXgGE1Fkijil2tTvD
 l+N3MGY3GRgBQvt7j/0pJdxBMMajmnw1z7Cxposh/ICupPJpkGUhPnwWxhHA4Hw9
 AedNJ6zOFn5xw0/uepRfhayen/QV6XSfJnj9Zzc7KdQQtCgMLtT+33ChPNRiGtbd
 SdoKxz60YD384kRPh2aDgAyDbMWzTz9eU6NZ+kvAH3MyfEOkvrag32K+GTBP0ZTs
 HYO1u9JMNiPxyVdH9AeQqtXHpLruxNkk+IdRrX3QNL3QyWLX30sesmyc+fnW6Ddw
 ==
X-ME-Sender: <xms:kNsBYGS04asJV0fWYainAyaAPKgUeXQXwV3cUW85CMSKg2338ljgcg>
 <xme:kNsBYLzCUUMM1bO2OThBCKyREuCLPM6j-FqsaBQYkGNnEzBUi4J47DW08vVonYNrZ
 lTlgAXa7qNfAIXal8c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kNsBYD0qdaPv_aKez48nIooCjwCtcv2X3YrY_VsL6QTjJStFS_xmZQ>
 <xmx:kNsBYCA29fc4r9FtiF0Gotow1ANpWpMMyBy-2eJxicdto7VMLNW-mw>
 <xmx:kNsBYPiPzMMrFN761DwS1AksCP1QxfOIaXFNUh6RG90shbwXMEo6EQ>
 <xmx:kdsBYFbNgIIbGCVLmVm_x-TFtBqKshqNcwrUXCGnDHtkfXQ8Malhqg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3A36A24005D;
 Fri, 15 Jan 2021 13:14:40 -0500 (EST)
Date: Fri, 15 Jan 2021 19:14:37 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Avoid ASoC error messages on startup
Message-ID: <20210115181437.uqlkrbapv6ydswuy@gilmour>
References: <1609256210-19863-1-git-send-email-stefan.wahren@i2se.com>
 <ab03444f-feb2-fbab-97fc-a070ccbe06b4@i2se.com>
 <20210113091957.odclfwmeykrkyq7v@gilmour>
 <20210113114223.GB4641@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20210113114223.GB4641@sirena.org.uk>
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, David Airlie <airlied@linux.ie>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1153670606=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1153670606==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xnbynu5cedivklzn"
Content-Disposition: inline


--xnbynu5cedivklzn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 13, 2021 at 11:42:23AM +0000, Mark Brown wrote:
> On Wed, Jan 13, 2021 at 10:19:57AM +0100, Maxime Ripard wrote:
>=20
> > I'd like to get Mark's opinion before merging though
>=20
> I'm not sure what the question is here?  I get CCed on a bunch of not
> obviously relevant DRM patches so there's a good chance I've just
> deleted some relevnat discussion.

The patch is question is here:
https://lore.kernel.org/dri-devel/1609256210-19863-1-git-send-email-stefan.=
wahren@i2se.com/

In particular, I'm not so sure whether it's fine to return -EPROBE_DEFER
in the startup hook.

Thanks!
Maxime


--xnbynu5cedivklzn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAHbjQAKCRDj7w1vZxhR
xXJVAQCpnGE0lElFUsjQWsGBbxYuDo6fTj2QZCDugDD2h5giuQEAtFomo8PiN+nI
/hbCrZSnoW4YnTzXZAhq7EE7Dc53ng4=
=v5TX
-----END PGP SIGNATURE-----

--xnbynu5cedivklzn--

--===============1153670606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1153670606==--
