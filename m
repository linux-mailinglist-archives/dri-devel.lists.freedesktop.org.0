Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E81160CD2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5848B6E52C;
	Mon, 17 Feb 2020 08:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0449E6F909
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:31:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 53DA54A6E;
 Fri, 14 Feb 2020 07:31:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 14 Feb 2020 07:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=LUuxcNfSOwWscQIzR0So/9bxPwg
 KSUZdiJhu4bV4RMY=; b=XtRM0egZ9LFEDkRTeXdhuM9gUjP39GO4ceL2zKVwwxp
 MMmUN8x5JFgL6/19NIiBbwRu/P67nPc5qb1G4g9E0qWrm9+M5C5AtCMeqYzPWLTg
 pMUMq99QrKojNTQJ5AFtJoXLPlfD4xSzEzXfS16fjUixXsdPWYkWGxAqvrY1H1j7
 4bQRbnaUrnPlRcZcmI6nUR23mTXtir72naeeVPC73uckanpbbwwzEARwV2b3vTQX
 Dbq2RuItrh4czV83wfvX5KqNXL4g5HPqbI7BDUwxH3ZbNAwMSYIzFqwmTWheBkXA
 GAxBDjsFCh8WKdm1hEeOoYEkel+Vp2ZYGBo2qg2+bGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LUuxcN
 fSOwWscQIzR0So/9bxPwgKSUZdiJhu4bV4RMY=; b=XQZnzuG+cKkjMP8GtT93yn
 2USAOWihi/JiMXsSVVo5Xle6gBbPoyWw1qOlJh5BekWkq0zBerhOVB/59WTZSiM5
 1X7+T553CpRxxUmX/55GjZCl8Br3RQd19u3LTdHbETHlbRXxVeJDsrk+pOGd+GyB
 GI23zMTn8ICYXiFf9A5Btn5VzbpbiFtBNTuGBYS64ZZex9sVjbPc82+6mFZeWPQF
 rTxeefUSgBcDvyq3F7OCaiTOMsHMfC5/N8Gle6Y+d3Ec2jENbZEPK6CQi5Wirnbb
 Q/XzhVjll6jBlPvAlasIn6XYQE7GLxo2zMLzjIRVJ0Rjs2Q680Rn8DMRClzWhSSw
 ==
X-ME-Sender: <xms:JJNGXtvxKMhvkoe2jIj6PoUIdWliTZewrnHDKfkLDlOHhUIez1MqfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JJNGXk-nAqy58gO4J9jhlotpUkkgw-5gF3qoJOVA8jp6WMwRq7dNsQ>
 <xmx:JJNGXnG7vFKRr2zyhSUVwhQneV0N39HzAwStXJTSZ6WJKeax34xmpQ>
 <xmx:JJNGXqyQcNoZafwr-8OoOXMw3LwM6OUuXeORQpcWFZplz8Ic-1TUHw>
 <xmx:J5NGXh2kB6Otp6KfMhVdkrTLvPEyU7P1Z_WnG2mx4n3Jq0ulNi38Aw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DB06C3280067;
 Fri, 14 Feb 2020 07:31:31 -0500 (EST)
Date: Fri, 14 Feb 2020 13:31:30 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/sun4i: tcon: Support LVDS on the A33
Message-ID: <20200214123130.7bfn7d2imgpkief5@gilmour.lan>
References: <20200214122427.108675-1-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20200214122427.108675-1-maxime@cerno.tech>
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1462657683=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1462657683==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cedtemy3eui6wleb"
Content-Disposition: inline


--cedtemy3eui6wleb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 01:24:27PM +0100, Maxime Ripard wrote:
> The A33 TCON supports LVDS, so we can toggle the support switch.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Sorry, that one was a spurious send-email run ...

Maxime

--cedtemy3eui6wleb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkaTIgAKCRDj7w1vZxhR
xTM8AQDH1yyQdstxuKVzuZ87kQMF0t43L3SxHNcDVWVfUvSrpAD+O73ZNqlaoy4F
iNxK0jcWKBWBernguIgzQyobw/ovbgA=
=7Hpy
-----END PGP SIGNATURE-----

--cedtemy3eui6wleb--

--===============1462657683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1462657683==--
