Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D485F3253F0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5136ECE2;
	Thu, 25 Feb 2021 16:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BE46ECDF;
 Thu, 25 Feb 2021 16:49:15 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 3220AAFC;
 Thu, 25 Feb 2021 11:49:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 25 Feb 2021 11:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=cuAQURJdnfSgehNwqoZk1C/1YBf
 RDgosoa7HMN3+99M=; b=NVV8IVnKUCdyez/2KHwR8UOkjaDSmanqd3E33w1kFsr
 Sw34LaOmm/7oe/E6b8wAmOUPKn4rUMJIuzeyqWalCgKUYupGwIxWrzi8TUyu4uFL
 tf3UuFYcvXERsZNmXejkAkyVWcqvGCwXtgFTB44uQNEl6ggQ6GH+kT0piYN+HfDw
 Lphbug6Zx4cZUt3KiyZTyl32HieS/jJDTVYMrfoGZEL52ZcDqVbJSTi2YZEyfFb0
 jKgTEX6XlXkmI0Fi7g1cwOgW+P06t+6MQ37C4GUM1PmcaJhSh1pCvt7SavUojb3i
 8zjofSneb1MNvly5P3RYybN3ppbZGMeXQ5/wb7duvbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cuAQUR
 JdnfSgehNwqoZk1C/1YBfRDgosoa7HMN3+99M=; b=kRJtWZ6HDijMQL9cp6CxhS
 qOl1UMUjIrHlE/D6w0f218HRPmQUoMkiuzmjvz4037Vrj7n/sHe+vn4KCG7WgYpK
 vPnRc8NrJtHgf9ZARvBk4lGCe12nl6i26nesAX6C7Y1EcrZt1VyB4dXuvAofqyO8
 Wd2gZBGaQIVCtXvt0hirThb/Je1xAOCFbdRlViNAo6rsReLr3pDglBApPtk0r4o1
 zxpHn96fQIgD0loMwQM1Su5WbeRebNOxM4E7qz9alCzPwfkilBffrIEPAUc85ylC
 kfivvBpIdfjkL3OM0b41cspZHNIAa6i1Jc0l2tKQ7Jm+exNN7NHGQ8i4T6FDLJvg
 ==
X-ME-Sender: <xms:CdU3YJhQOi6bPBWvtyfxwYR9u77XlV8inMMZYueH0E0UhHnprgsE7A>
 <xme:CdU3YABMf6v_20BWGfCThOthB-2oMeARuqrTFrvKCNKav3hsM9hy3NpuS2qu_cv3h
 Sr0Vtw48dKiET1ARhs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CdU3YCfd8Nv10qBBCpRZ6miJuhrm4ctV0DZwYGqgs1x5QEfhkfXSpQ>
 <xmx:CdU3YAcpWF-v3oYu-1fIt6yE7B5pT6J3qSDHA2Lj0THx769vAqSykA>
 <xmx:CdU3YOiuhHOun0-CbMJjXrQS1oLBVXjCE5N-cHro0wppHb8kKGme_Q>
 <xmx:CtU3YMNwiWR3KwEW_QtMlfDdROYJ4eEM0W58PduR2fIa9DMeNTYgIw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 93D4E1080067;
 Thu, 25 Feb 2021 11:49:13 -0500 (EST)
Date: Thu, 25 Feb 2021 17:49:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/compat: Clear bounce structures
Message-ID: <20210225164911.k2bwswyivied36i5@gilmour>
References: <20210222100643.400935-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20210222100643.400935-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 syzbot+620cf21140fc7e772a5d@syzkaller.appspotmail.com
Content-Type: multipart/mixed; boundary="===============0568371350=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0568371350==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="to5j3sdi4ygdh66q"
Content-Disposition: inline


--to5j3sdi4ygdh66q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 11:06:43AM +0100, Daniel Vetter wrote:
> Some of them have gaps, or fields we don't clear. Native ioctl code
> does full copies plus zero-extends on size mismatch, so nothing can
> leak. But compat is more hand-rolled so need to be careful.
>=20
> None of these matter for performance, so just memset.
>=20
> Also I didn't fix up the CONFIG_DRM_LEGACY or CONFIG_DRM_AGP ioctl, those
> are security holes anyway.
>=20
> Reported-by: syzbot+620cf21140fc7e772a5d@syzkaller.appspotmail.com # vbla=
nk ioctl
> Cc: syzbot+620cf21140fc7e772a5d@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--to5j3sdi4ygdh66q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYDfVBwAKCRDj7w1vZxhR
xe5PAP0f5XHtUCcC/Qvx5dzE+wAYFK8EvdJ+HJxByv0h2TCa3AD8DtkQmUtBpgjI
7ZXCtqX4GggrmLOTfU5RQ3ICfer8dwY=
=FxUz
-----END PGP SIGNATURE-----

--to5j3sdi4ygdh66q--

--===============0568371350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0568371350==--
