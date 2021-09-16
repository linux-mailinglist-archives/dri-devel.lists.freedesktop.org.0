Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0302640DBA6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883646EDD3;
	Thu, 16 Sep 2021 13:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661646EDD3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:47:41 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 53571320098F;
 Thu, 16 Sep 2021 09:47:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 16 Sep 2021 09:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=rZIDhlnuGK6V5cK46t4Uvw4Yatx
 suOQ9msENEMMFQqI=; b=uv/epXvay+8cnwW6oginqM584OwhufyHQT+S40iMGgK
 vPXbLjOOX8k6QAS5g6DCS3j31W3GVXuX56KJNa+hPnrem0A9pJdpLbSvTZAR2EoJ
 nts2jUyVa+bl62kUBk8L8wMhqb8T106TVur2xcPSbVAZD3c9paMK+Es/u5wX5Xpu
 1OCuOtRxycdvbvYCk7qEc6jlKyU+mTEs8i1O4aWO1buVOxnelsc4z2BnE9L3Leex
 FkoLYfKVg15qL29ayW+K+yOyQzE08ZbIz5MFIlNh6UYwi3uLRICTUv+3bUUXjDCf
 keY0idC36xt0JbjEFn89iMI6tjgmkqXyi26LEcdEQFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rZIDhl
 nuGK6V5cK46t4Uvw4YatxsuOQ9msENEMMFQqI=; b=dJS9yWAXBKBHPQoeFPhIOm
 UKsY5+U52WPnXbNE9gbXqCfpxuzqnVyY8u4H0k9HeCianCiXsAjjVHVRgxckijP8
 UT/KvgCcy3Da+t9XvO8rcta3RyyA7kW6m2JoSJOVRsqTGMFh/ic5i+HTbYRvYsoS
 IlkoL9ChqdWfz3Yn723dEA3yiA5vMNj0kezOZWFeXgP2Qcz0DclhmZQbDj5P+znU
 qnAwhGao/ezWiENFRfkatARJumjp+HlAxJBoJHM0DYPTM2x47TkTaNVF5aFXOweV
 sTVfD4rsjJu7dUIE/MsidkjSOiDOtuDSnvHtgv694QuVomGjHBGasuiXcUtgoYeg
 ==
X-ME-Sender: <xms:90pDYYKz52dtZfZFQPIdBg6vYDuZXW7Jezd71XKuATEWfEz7WLNVQQ>
 <xme:90pDYYJWvOhOpLL6HuEk0VpBDCta_IUVGmAOhmgLSDUvGprUYipkyxEnP5cU2cREq
 nmdzAuUOKp-mkXOQL8>
X-ME-Received: <xmr:90pDYYv5IcH41WLpUpttmTdYUwCwM-o-rcvcWVJT6G3R-pUZA1LVuIqQG3O-DocYWc8ZB0vem_GhNsDdxRyELJJ_DKpEEpPZeObx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:90pDYVaOsZxLsFhBUfmXtDfXH0cGlAmgLCtWSWGSazV-Exr14QD6dg>
 <xmx:90pDYfaiBkWcPrDkuh1x39HoFVYH9UD1tE4A_ibDllbSKHpk3_9WAQ>
 <xmx:90pDYRAD62klcaI8dDpBd3EYP6s3UPfaJegCdazVOwsF35g7738ZLw>
 <xmx:-UpDYT6F0HWMwp2jPwntqaXgoi2LhKh1ktAA5XNnHsw8POUml6VI3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 09:47:34 -0400 (EDT)
Date: Thu, 16 Sep 2021 15:47:32 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: dw-hdmi: Make use of the helper function
 dev_err_probe()
Message-ID: <20210916134732.nrzetz4io5fmbxpq@gilmour>
References: <20210916105633.12162-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="42fvjejcppad3kvp"
Content-Disposition: inline
In-Reply-To: <20210916105633.12162-1-caihuoqing@baidu.com>
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


--42fvjejcppad3kvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 06:56:32PM +0800, Cai Huoqing wrote:
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> And using dev_err_probe() can reduce code size, the error value
> gets printed.
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied, thanks
Maxime

--42fvjejcppad3kvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUNK9AAKCRDj7w1vZxhR
xTSkAP98QRtzTOPuHy5A4zj83HE4sXcoxFGmghpXGhbYDhK6EAEAgs7KVG1NXR0z
loVt2Z3KCbUWVguTpLIBYkbQxonnMAE=
=vbrR
-----END PGP SIGNATURE-----

--42fvjejcppad3kvp--
