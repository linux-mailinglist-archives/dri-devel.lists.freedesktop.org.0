Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0240FE37
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 18:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FB86E02C;
	Fri, 17 Sep 2021 16:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735186E02A;
 Fri, 17 Sep 2021 16:56:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 152E132001BB;
 Fri, 17 Sep 2021 12:56:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 17 Sep 2021 12:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=jRLqcO8DyOfLRMp2YJoKkxVQ/qr
 hMa51voQnXd8BUks=; b=tpelSp52Sh2CxisPGqKDGNRA452mrk6vgNjQ0GlWGJF
 ffsIqOos3nj9efE0XTWtqlvNi/QUopESQEuUaWnTa3VwJZcR33FtCwJ3+LPwJqSO
 teu1TU1fqgLCP1wHH9cDlFbt/zStFQibJPOFnKOUB2P+g4jMNgkDqSkPT1Ijjtgz
 Vu5R0Ufe2UvCDA9jNY+nRtkgw1dbx00TKWtrjoV6FinKDal7Y46YmUuCkpdLXDOF
 LpXIhICTcGjFoWpDZDfOu18avBdGgtxw+0LtvlOjcoSN60tkt08tvv52uOVyRd4a
 8iqMp1w/QszY41Q5EDZUOR/7mUnrphpMWROfEEUfmyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jRLqcO
 8DyOfLRMp2YJoKkxVQ/qrhMa51voQnXd8BUks=; b=OfqjzntzCj8kf2aNypo1hB
 pzX4Iu3j8f+LyIADIRb+YHXJPw94B23EHWLXwhw8xUhdBSbnG2fNWCiBhnLmGrWt
 /rByRtO02tamiwF9cOvx3wVhnwPDBa4LQ3vDKQv5ynqj3d3gzpr/6fp7fa6b9h5T
 Mdm+3Rf0a5RsLFnPbfaN3XcnBQmzCHC7CMXVeWoxBDLwF7+I3R9iUZ8Unh5D5foO
 OUuM3X6SRfZphq3LXtsr7chHkDtn226NdQssfJ2zJeBPA9QKtxU0NY0mVTu90oek
 PG3bciSufUEY36reMCoDcWTgOa3Ez+wO0K0Bc4cT9IE2KcxbxM/USFIwpPgg6Hvw
 ==
X-ME-Sender: <xms:x8hEYfZbl8Oo2oBwOr6qiB_-RgYS7U8KpSxZrVxfqY23ou9_yDaQWA>
 <xme:x8hEYeZHz6Y7lo8aVzUzV5TVbq-3qhNoNZvAyc0I20hrTC_wXMX9utTvAXciDF29m
 yGuRrdi-JMCJ5y5z_g>
X-ME-Received: <xmr:x8hEYR-ZQvSI8HPxkD20xxii8xQGFXZOMKXn0v6Im3Qg1aM9MfWi3M0qHljSS7PABXrCxv8Juu3ObAStgxJLpJ8hQkGXmk7W7uuD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehiedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuddvhfekkefhtdegiefhledutdevtdfhkedtleefjefgleduhfetudev
 jeehhfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
 ohdrthgvtghh
X-ME-Proxy: <xmx:x8hEYVp4ZCVOd4GDecGXyeMgXc6DiC-YtXA6dkRDkpcyhxF_PFr1jQ>
 <xmx:x8hEYareI2vpzmSjyhpYJG9SxMA_BS8hKID75lf9mjWc3Upl9N9UlQ>
 <xmx:x8hEYbQm8QkWcmHZktDzQYgsQWXD2okhhCaXGOb96cOv6xDaMnGEgQ>
 <xmx:yMhEYXCaS8e0dzkM1cEBxqHVqIGW4tx-qKTjlzBrf9UtHsHRTkMz3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Sep 2021 12:56:39 -0400 (EDT)
Date: Fri, 17 Sep 2021 18:56:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 manasi.d.navare@intel.com
Subject: Re: [PATCH v3 00/13] drm/i915/dp: dp 2.0 enabling prep work
Message-ID: <20210917165637.t3vdblkgk5rzplyu@gilmour>
References: <cover.1631191763.git.jani.nikula@intel.com>
 <87mtobuzuo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="achh35ttjdfm2zx5"
Content-Disposition: inline
In-Reply-To: <87mtobuzuo.fsf@intel.com>
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


--achh35ttjdfm2zx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 03:54:23PM +0300, Jani Nikula wrote:
> On Thu, 09 Sep 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> > v3 of https://patchwork.freedesktop.org/series/93800/ with minor tweaks
> > and the already merged patches obviously dropped.
> >
> > Jani Nikula (13):
> >   drm/dp: add DP 2.0 UHBR link rate and bw code conversions
> >   drm/dp: use more of the extended receiver cap
> >   drm/dp: add LTTPR DP 2.0 DPCD addresses
> >   drm/dp: add helper for extracting adjust 128b/132b TX FFE preset
>=20
> Maarten, Maxime, Thomas, can I get an ack to merge these four patches
> via drm-intel please, or would you prefer a topic branch instead?

Yes, you can merge them through drm-intel

Maxime

--achh35ttjdfm2zx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUTIxQAKCRDj7w1vZxhR
xUtDAQDKKR1NSMd9SgL0CLx5EN0AC0l0IrGq39QQImUN0QL/HwD/Ud//WNo1oIIU
uy37i+Kp/k+XDOpqVW8QR0U7s3hWbgU=
=5KZX
-----END PGP SIGNATURE-----

--achh35ttjdfm2zx5--
