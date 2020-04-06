Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE881A0909
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3DD6E5AE;
	Tue,  7 Apr 2020 08:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595FB89B48
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 07:49:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9CE0A5C0199;
 Mon,  6 Apr 2020 03:49:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 06 Apr 2020 03:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=WQL8IioOinLl1us7Qgh+yYoIX4Q
 V+QhjykEfvPnvB94=; b=ixWxiOpUrjqMaYWFKkj86WWpKqeS2lJ9MEA58wogDC7
 D/ms4Fq/Hh0D3yoXVQhA65JuPeK9YxSCmljypi2z0UvhRrrja2vLyjWE3+pjKl/S
 /h9cnSGQkax/HNaR4hVQa5eX3DrOgDRMvsX/nBS/o890mKcL5w/f5s9oDzFifG8z
 wI6Tg2GmF7a47KZuUMcn3W97AaDHi47uNTuYu9r8NvqIA9QYwSlQ4T9Gzk1GQJMW
 MxuLixBwE40qMuIIplVN1JD5tFI13bv8blPyVfcEZ0ga8U44H+YRD3rTkn5NmLOW
 STWycnvOFxoy1LNEi6JX/wXY6qWU/vF75aF5tzH9sCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WQL8Ii
 oOinLl1us7Qgh+yYoIX4QV+QhjykEfvPnvB94=; b=y3eczTO3gvVCgIFnMzU1SF
 UOeWwXNKV2TwbmRr+j6uDCUrZ4TE3B50cImTK6roZxdpWipYfAEqtufIShRfPneD
 huIGlChnM7/CUF2XBnPhtQqlGningFxUDKHJFuUILy0sHsjPjUJd/rY+zI60yWcM
 qxLDpqklVusZ8Y/Zj7yGIuGHdQKtm5EoD9t32Yw1oQwCjM3ULUEcK7Tl2XXoYZqu
 /K6GbSxGTrxTGYbRDcqppGyLQRmSWmuu1ENSbr/saBvASOeij/3YYsJCRL/W6IwS
 uS2R9hRbRI5RTRKsSKnMxILZ7L5xLRcL1O9WNGSrclI0j6U2Tcr3O/e9kNaUEWsw
 ==
X-ME-Sender: <xms:-N6KXtJ7YI4FELpCSOqVsfFI1kaEIod1ZmPrtjjvuO7VlWQI3RcYdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
 rhhnohdrthgvtghhqeenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghruf
 hiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:-N6KXldRllGY-tDrHEOKfhXPn1--eexNMBEf5cMocKnjr8HdKeBPBA>
 <xmx:-N6KXofVR0eWXFf3bszoOAqUFZb52jsDwmcwRNLhk50I9bVshURLhQ>
 <xmx:-N6KXgPUdKb68mSl-rMYFE00hqUNXnhzY7LFqPFE_jhPNPqyGAlkBA>
 <xmx:-N6KXkCHPFbNU1ZYY4Z4VIMgKTV7WigE9sKM6Mj9bS5ju_aEgmddKQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3E582306D386;
 Mon,  6 Apr 2020 03:49:12 -0400 (EDT)
Date: Mon, 6 Apr 2020 09:49:11 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas,lvds: Convert
 binding to YAML
Message-ID: <20200406074911.pbqvqaxtuestwkp4@gilmour.lan>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:31 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1206814492=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1206814492==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="doukq5kol7opm52c"
Content-Disposition: inline


--doukq5kol7opm52c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2020 at 02:23:18AM +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car LVDS encoder text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--doukq5kol7opm52c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXore9wAKCRDj7w1vZxhR
xfLaAPwMLs4UHXmAFdPrEEPrL7/7S/VNbOnVVlxQ2Vw16N3DqwD/UN/3B+u71MXB
Ra9BpSDH1esSO1rFPFFIXQb6uibqLQ4=
=e67o
-----END PGP SIGNATURE-----

--doukq5kol7opm52c--

--===============1206814492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1206814492==--
