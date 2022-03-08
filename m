Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2E84D182F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 13:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60EF10E48C;
	Tue,  8 Mar 2022 12:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0223A10E3C6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 12:46:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D9A65C0192;
 Tue,  8 Mar 2022 07:46:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 08 Mar 2022 07:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=bk8nf8W9otoMo6hXyWhJH1mY4tr/LouKSCCOGK
 18VBk=; b=MOCfONdY/YHg9cVpRyrmNZbsCvS1T0yRlyGBsFnY3aYj6rKvlQpf56
 q3DP3oLNnQyURp4l2qwoJc2uDyp3goGEVgLH+3B6ueK/au3USIL7D9q1oqD1kEnq
 29nO40lFtiXOrq/SO6ntqaKVLGzUoJLE0lv+98SIDB2iC1ZV5TQSWLJkuSu7+2gf
 JJvI9yZoK91xrsE3Q/d+uJWXkuwX3loEDrVFUf5sXncEb9CBb7a/Nu9qa4t4s2Vh
 Rx5Bz6RWCsrLf+eGbrKZFpXaxOCcoFNCkBMVJxlq/h0hZppA6dyLIhiJP2Kr9grJ
 eX/xAmHW60wWuKREneJmFuB9StVhuC9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bk8nf8W9otoMo6hXy
 WhJH1mY4tr/LouKSCCOGK18VBk=; b=XNJIDqlbMwo1I1FvU70Yk1wWqAober09M
 WxSuoRseQtDkDVC+XzvGT1XpGQzi1Iv+yr/+Q89rqHmzq2I7CjqBUEnxqn3c8ViG
 XScArpV5zOSa22cXkRo8ps33cTOHEuIePUNKc+Zf9PJNjQz0DZ6taj2zRjgLSedf
 Ub2aK0L5VZMkxuPZxtE3iDSKlNv7HhRtBHZqxV+jqDZb/ZIEQWon040icMpdxjBz
 9TE3SpCo0AHuyU/cVNgcxCSKikeUt3W6TWaow+vm4kJJLPz5ydAh0xNZdFsaf1ox
 3gLZ6bQho80pTPstGBrNxFBc/o5lrG0za6/2tLVXpgaodxyvXpUmg==
X-ME-Sender: <xms:FVAnYnKV0husP5lsZT7eBLFYmPrN2EtsmKJAMIBrTrNagoMkqR9Tsw>
 <xme:FVAnYrIp_PPdqcp-wsJqFqmgo3CEhM3clZAim1jU0v1O55lrQApQEbg6WOScBlWxl
 Z2Aq4mDgbbEfwNImZ4>
X-ME-Received: <xmr:FVAnYvsETDOMlajwtRjTFGczZbITx5jUc_AQ_2BpVOQmk2PLM1W2eCkY6CP4p-fCdPz6udHLrsMU10FNYxnuIfOLkB63kpjW2T_r3VU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FVAnYgYNH6pI7t7JrCK5Xl0fsYF7IEe_VQr0Ys7OBTl6ho_MkoiYIw>
 <xmx:FVAnYuazt8bjgIKo6FeYgJIc6-Xojg1ZLhls8zm0mFMBENxr0Gz4bg>
 <xmx:FVAnYkDZxnSe8QwNLSgjqlws-812vpHukbHu8UFfOyd-OoFRX7sVoA>
 <xmx:FVAnYlVTg2xq3dqqNxPbE7i_YgnMHlsk7qZKI2Y8AT_t5s1AO5ysXQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 07:46:12 -0500 (EST)
Date: Tue, 8 Mar 2022 13:46:10 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 04/13] drm: bridge: icn6211: Add HS/VS/DE polarity
 handling
Message-ID: <20220308124610.srka3xrbsm5ykyxy@houat>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-5-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ubik2x4nlbnrxch3"
Content-Disposition: inline
In-Reply-To: <20220304002508.75676-5-marex@denx.de>
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ubik2x4nlbnrxch3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2022 at 01:24:59AM +0100, Marek Vasut wrote:
> The driver currently hard-codes HS/VS polarity to active-low and DE to
> active-high, which is not correct for a lot of supported DPI panels.
> Add the missing mode flag handling for HS/VS/DE polarity.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--ubik2x4nlbnrxch3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYidQEgAKCRDj7w1vZxhR
xcSsAQDaSQ4jd0wctnAmjTFHtLqI7iFNwdcJ1j3Skrgkdnl7FgD/VPK2splJLNIv
on3ooFMAGQkGgFd9m5P2/YklCYl7Gww=
=KvXj
-----END PGP SIGNATURE-----

--ubik2x4nlbnrxch3--
