Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E954DE51
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 11:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5067113D51;
	Thu, 16 Jun 2022 09:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5805B113D51
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 09:41:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D2105C00D0;
 Thu, 16 Jun 2022 05:41:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 16 Jun 2022 05:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655372465; x=1655458865; bh=7pSPQGKusL
 tOQtJX5GKfDKgN5o3XievJJA21vYl2A9k=; b=EjdI2nGTCTXdWY3Tq1EJhWdMm0
 G9W1hZw9pjar+ygIP+mBhZLEi4fWiDE0nSlgY+KLdQZt0CFrQYDBDNx70rFFrm1q
 qLY0kGuLnRdD8VIG910nZoQM+gGE+87W97ilrmECVcZHBY/RI8RM+/BICQUIZE98
 l6HEPt0YX0YgvhQCN4Pcp3hxLja1/L7Jgvni51TJuL0HwrG7xbB89QCOQ+WE9YVT
 MhkWa8Njd6b3akw70Puc8SKKmfv0kwh3QDsy6I7tfdLrBW8NXItJF8wYEzcbgKu+
 biKaBh2h1xqkOUCjcy/YX+sEkLJIy5e1E3ojD6TWvn41GEdUC+h33yquQNQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655372465; x=1655458865; bh=7pSPQGKusLtOQtJX5GKfDKgN5o3X
 ievJJA21vYl2A9k=; b=JdqYOZWn+QUX+RNRBZxjVxqeRENGwn5iU9IXksKFW4LH
 5ankMPvA/dh7wsiJK25J1Jq2aq+B9kevGBNyXr/JjCCGYLZkerITtv7UkB/TyyZz
 c/RVHUZ+MsoOTA21NUy2HvBPis+dJeEME1GgiWLxtPWFZoP74PPSV74HMPfWyBar
 PjxipjGxt1SrkonKqusfLkv6s1xKnRO0ag+KhZlJnlaJfC3vYres0VaavOXzS7VZ
 2t5Tsg2zRxe6VcCFaR3xWI4vvgCglY60eV5waND4k+sDOU+5uS9gJlc94pRPVffY
 dFFNtvkFNYZBeP8h4HHm5rYk49ybJOmUVW0kuzLecg==
X-ME-Sender: <xms:sPqqYnKTHqyyxKaX6ScmhlOQbO9mvBbjHzyMBxm1h0IWs2MrZ-w4ZQ>
 <xme:sPqqYrJPi9I-rH0cogzYGLhBNHHRyUv0HOCSezUd6_tl0MhiQSD3cVscpXfLrXkmt
 TQzhMqFbIbvLhIGQO8>
X-ME-Received: <xmr:sPqqYvsyY5rxGhbgaq_2Jxq5fJKz5l6cC53hgvWofuux07pOkBLEAL4-z15iTM2amk4rVJstmo2iFQu338S4smBEBdRt9EPh8xwTtlo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvfedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:sfqqYgajUcpuE1qA4Jw1mHyAqaalBan6Z-PV6WwIGd1rkPrrESfogw>
 <xmx:sfqqYuaRBTcv4osKph-1cAl8pxmhkWaZX1SGFHEExIOB1FvVBC4Wpw>
 <xmx:sfqqYkBfYuP-mJcie5LTo8bySJVllnBYlI3WZbKxhEdcFA6jCbMx8g>
 <xmx:sfqqYlUhUw0lric8CEeu826jeM2RMplOLvHYcj9sZ_Wcrt2y5DPJFg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 05:41:04 -0400 (EDT)
Date: Thu, 16 Jun 2022 11:41:03 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 17/64] drm/vc4: crtc: Move debugfs_name to crtc_data
Message-ID: <20220616094103.dubzsbf2uuny472o@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-18-maxime@cerno.tech>
 <CAPY8ntCHiO7QrhOw7doE7PtzuTJEp4-u20rT_RDRBCmZ8fnQRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ikhwhefgnwzzybxg"
Content-Disposition: inline
In-Reply-To: <CAPY8ntCHiO7QrhOw7doE7PtzuTJEp4-u20rT_RDRBCmZ8fnQRw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ikhwhefgnwzzybxg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, Jun 14, 2022 at 04:57:45PM +0100, Dave Stevenson wrote:
> On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > All the CRTCs, including the TXP, have a debugfs file and name so we can
> > consolidate it into vc4_crtc_data.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> I was sort of expecting the vc4_debugfs_add_regset32 call to move to
> vc4_crtc_init so that it would be a common call for crtcs and txp, but
> that doesn't appear to happen in this set. The debugfs_name for the
> txp is therefore actually unused.

As of this patch, you're right

This is later changed by some other patch though:
https://lore.kernel.org/all/20220610092924.754942-60-maxime@cerno.tech/

Maxime

--ikhwhefgnwzzybxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqr6rwAKCRDj7w1vZxhR
xZEbAQCOXU/PD2ZHIxmQszDRwT2mCF0/B+qM2W/xjKEO5y2+UAD/UKQQMBn+mL5E
RJ5JzVk9ugzEyDvHKlPGQlbSDuBnngA=
=ItGP
-----END PGP SIGNATURE-----

--ikhwhefgnwzzybxg--
