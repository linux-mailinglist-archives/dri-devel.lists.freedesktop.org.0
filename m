Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FFC378C4B
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 14:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50336E1A8;
	Mon, 10 May 2021 12:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2963E6E1A8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 12:32:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A79D65C01A3;
 Mon, 10 May 2021 08:32:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 10 May 2021 08:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=oObO8o2tNMzbSU4/I4bCTlKDZH5
 pBHbBb3SLAsD2hUU=; b=uNauK/jkeEozgJQXiu8ZVVoI/RvcyuA56y2xsTdwWZB
 0v8DOtWRP13qyap6Q6RR9Vz4VmAcBFq57iuBLe3z1gCj81ekbzHkQIhbtZJogYDS
 Z2fDHf3alxt9CluV9lHIwygA3rdk7DiRk74reShtHtHRL4wYc8PyGC6v1yGP7vdG
 EBJI71liWSyjvpIAJ+d/+vIDMafr4cbTUu8ojrzm40+V/bZhsxdLTJTL/xddDQvd
 boXuP+KfT9QnVNBhDWasEpS5ZdhrVAyJzfS3yRe2HdJBK6G0ZBnk0PrKgtb74qLi
 WT/+CXv6HSNIVU+0AD/HnF/3I31QbKBX3q73Qnf1/ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=oObO8o
 2tNMzbSU4/I4bCTlKDZH5pBHbBb3SLAsD2hUU=; b=fB5OlocDnX6odU9hjhCqnq
 wx70CnAuo7nLGyY7Lk6OS2TqCtcMhBbbA+jw1j1UGad8hVfojam25x4Y+oyr+pl2
 de3RVnsh8RslC8BVuNHhOyZnbeF6qS7byAteERqinRlLF4UFiUTBY1msA8Ea35Pt
 kWlFcsv1UPRCtNlSdrHq4Uj0ygYXQ/q1va/X8rMVMfCCKXqngQ5NSR4813DWIEsl
 1zRao3qO4C6hdCfBWk5itt1Ce/qVbeKcctdQafQmgDskUD/s0CBxVMIlWj/ynlR4
 KS/QYASKKFSLkBA5df3sOtTaf4iIhVJpT68G56T9MhVT5zIpiLTkpZQDc4ulHIag
 ==
X-ME-Sender: <xms:7ieZYPxsOmzgxIOg1UW9WxXxb-TIgGrR0CKKebhbCWyXNaSvWetzIg>
 <xme:7ieZYHTrENvJlVUF-8DNsQO3bKma1rLxqrofWLq9P2CPWdm9pLu8dY2kpStvtOsIn
 S8I9zxQYoPuzFlzuWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegkedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
 rhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeelkeeghefhuddtleejgfeljeffhe
 ffgfeijefhgfeufefhtdevteegheeiheegudenucfkphepledtrdekledrieekrdejieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7ieZYJXQDhjUPWKNxD-2PDLoXTfOlvO2bm0WOIcPmhkX6sunJLheAw>
 <xmx:7ieZYJgZ9FEuR095h10UdRnWrelAZTSeyO0vLdbO_CghObjtW0F0fw>
 <xmx:7ieZYBA6UdiTrGlU6Bd1fc_0YyMkmUQmQ3fuJGvNAxnrJE9XJYSPwg>
 <xmx:7yeZYM9r6bT2rLVvsVL0_eZreSOLkm6bBkjB9wAf0VdrfNUPxNbfIQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 08:32:46 -0400 (EDT)
Date: Mon, 10 May 2021 14:32:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rajat Asthana <thisisrast7@gmail.com>
Subject: Re: [PATCH] drm: Declare drm_send_event_helper static.
Message-ID: <20210510123243.hmwar3swmrewskjs@gilmour>
References: <20210509134252.488157-1-thisisrast7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3bqrf5xpqv6etbos"
Content-Disposition: inline
In-Reply-To: <20210509134252.488157-1-thisisrast7@gmail.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3bqrf5xpqv6etbos
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, May 09, 2021 at 07:12:52PM +0530, Rajat Asthana wrote:
> From: Rajat <thisisrast7@gmail.com>
>=20
> Declare drm_send_event_helper as static to fix sparse warning:
>=20
> > warning: symbol 'drm_send_event_helper' was not declared.
> > Should it be static?
>=20
> Signed-off-by: Rajat <thisisrast7@gmail.com>

Both the Author and Signed-off-by should have your full name

Thanks!
Maxime

--3bqrf5xpqv6etbos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYJkn6wAKCRDj7w1vZxhR
xRQ9APwPHSZPts1UIAqgRY/CgRs0O1YGQqMv21YRhb6knJ94AQEApfOc+eTQ6ucz
4XbQebw6e4QiW/7mvxkW4JeIn7pKdws=
=7fcP
-----END PGP SIGNATURE-----

--3bqrf5xpqv6etbos--
