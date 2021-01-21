Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319052FFE81
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80756E9BC;
	Fri, 22 Jan 2021 08:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788476E52D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 11:04:09 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E00615C0081;
 Thu, 21 Jan 2021 06:04:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 21 Jan 2021 06:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=BdC6sBpfkqeuRKbr+YS2x3XOUsy
 005Dr/ViXrL61NFk=; b=aDs6Dtzv8ag0v/0OXCRHZaCiLqFRU9NR2LJX3no7/5P
 oiKo0TNRe/TvB/YYUZ/jZZIkQEpJrPzX/EGprWCG3HRoY5tCc/EAe4WN4FHvZZEb
 EIuWe+y18XKUmNvgOeGnQYxc49ksvNLfutXtdh5jz5D87/OQ62HJrykQXhb58AW8
 hwSuVdXRRRWOY4U/0/Fe7D+yWT/3j5OJtqXw1wTRiLljsdJncDF3Q32y1mFKPhC8
 vE4pxZ+nD38Y6DxZJsi9DmxvKEGP02fa0GbFxLLCvVypWV3PfC4oTWd1Cg7riGru
 lggjx8VnM03uJb31JiTwnEflQFXJgmIqpnCfABJWgiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BdC6sB
 pfkqeuRKbr+YS2x3XOUsy005Dr/ViXrL61NFk=; b=euGOwYB9bR45t+dC23Xcgy
 NtVSS5qyte5VMfvKQsFiogJd6hp3oJmBs6biXHF5UKpmTBFoxKycWpapgUiXzOON
 6FxuaxmLGGw8acRRR46JGogBXzR3D3fASXKnVd5jVUl0EkA0nbsVi/4iKuC8N460
 QHOEQ+MF1O8/gtn2W3gWTubGYRRLzsmn722KmVRqTwD9OcCLDZ0yuTtcjm0B756f
 62iaoCy72yrS1gF7o8O/5JLMG64MGudRTWNFOVKSmxyeb8CZYiJHV12PRVlPkVNq
 xCii5SL345bYKkVn1iZHbc9I+fi+NrsZwyzhQF2NZz5KClzTyKXbCk4672PTDsuw
 ==
X-ME-Sender: <xms:qF8JYMI54x23CXANJM0kDWxNFPTtnUDaNX180g6VSDAyog1nkj_nRA>
 <xme:qF8JYAfPE_h5FYUb2hBoM468LIw193YEGFm7FXjf-D3VzzHvk5K0HdotBpEhskhMY
 u-TnMwsvmWdNDnMgSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qF8JYL0ieDSSseb5tabbtMa8a5LNjqBdtCnPtsxDbB6vs_DPDvfxGA>
 <xmx:qF8JYBiQauQscyBZas8pVm7Oo0jg6shqoZGePYZ6K3YTz1lSThtoUQ>
 <xmx:qF8JYJTyctlXriARHJtsI-QDppP1FnJy_AE49UOOBBF_ZjY7z4HvQQ>
 <xmx:qF8JYHcCOHcbh-tq_rDLwESbXL-PU4CndOMiHxKz8SOxX6ZLlFPS9A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0003F240066;
 Thu, 21 Jan 2021 06:04:07 -0500 (EST)
Date: Thu, 21 Jan 2021 12:04:06 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Lucas Nussbaum <lucas@debian.org>,
 Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>
Subject: Re: [PATCH 1/2] drm/vc4: Correct lbm size and calculation
Message-ID: <20210121110406.yeb4zoqwwgilyrhq@gilmour>
References: <20210121105759.1262699-1-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20210121105759.1262699-1-maxime@cerno.tech>
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============0537990099=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0537990099==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vwouope6l6r7ww7z"
Content-Disposition: inline


--vwouope6l6r7ww7z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lucas, Ryutaroh,

On Thu, Jan 21, 2021 at 11:57:58AM +0100, Maxime Ripard wrote:
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> LBM base address is measured in units of pixels per cycle.
> That is 4 for 2711 (hvs5) and 2 for 2708.
>=20
> We are wasting 75% of lbm by indexing without the scaling.
> But we were also using too high a size for the lbm resulting
> in partial corruption (right hand side) of vertically
> scaled images, usually at 4K or lower resolutions with more layers.
>=20
> The physical RAM of LBM on 2711 is 8 * 1920 * 16 * 12-bit
> (pixels are stored 12-bits per component regardless of format).
>=20
> The LBM adress indexes work in units of pixels per clock,
> so for 4 pixels per clock that means we have 32 * 1920 =3D 60K
>=20
> Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

This one should fix your issue

Feel free to test it and let me know if it's not the case

Maxime

--vwouope6l6r7ww7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAlfpgAKCRDj7w1vZxhR
xaBXAP0fiKQIxEzL81OKhR7b4IXJ/WrKoh15kNgOJP7kl1hCcQEArSxNfjGY4J1m
93cw+K/4shynPUohViNPfQ89sbN2CA4=
=t052
-----END PGP SIGNATURE-----

--vwouope6l6r7ww7z--

--===============0537990099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0537990099==--
