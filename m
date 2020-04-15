Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772881AB8F8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C2B6EAEC;
	Thu, 16 Apr 2020 06:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC1789105
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 10:42:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3D93F70F;
 Wed, 15 Apr 2020 06:42:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 15 Apr 2020 06:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=8nobbbBWAxyXQWQe0I5jF6E/4q/
 4W6mxWyIL2Uc0dJE=; b=JKNAqqA+eRPskHhMT4TH/3lDSSwjpXHPNRuVLrD1I6B
 8l/dGgTLZnq2x8C00rBLt97pPg8xr3SgrUiqesEaIzOnhGR7NUunTZirYfJeT+th
 h4GMef2YODCg1jGKvtY1WwZHv6gmof+QUcsCd6/SeJWpYT+EXa88EfiWkBtJ1A/H
 BllfkbUXtpuc+pDHSJgW/xyLm5MvorfCIlJQ0lW211Hr3mTXAO/1qvYKHt6A1Q5K
 h74t5hRxbzb3OZ/KS4rgN8eSlgC6gEh/8bjRUJYb0tVMvGfqUiZH2ISfSWOuKOvm
 PdOxOhczG1oq0iJHOFdgOhpbfJ+F/w3wh4fqwnx/QAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8nobbb
 BWAxyXQWQe0I5jF6E/4q/4W6mxWyIL2Uc0dJE=; b=A4NWb2LsuGTz8Jviu1UBOB
 PB5Qe6KEPK+Q2ZxDRS+YmEFtjGcJcEvOizc8z0AEYXnjjxddvPQ02XPf/yuowbiQ
 cX1J+VllHRvIWIU9/a4DJbHB8q9FjIosXCO6+zT5ED2EBXTby/lYgr9lQZeGu/IS
 bkdnhVjY6vmeQxLYQs6/xphVty957CGVp9ls57Pah9qoMnLrxKGVePLuVlA380cu
 DAruUpScb6aojVXc1b4oH78sfcIBpNlS3Wt6kfhJ5DpYo1Yx0Gij5TOYBRMBaSyC
 gXBN5YPPTcvG0reQArV8Pg0iEoDSw9nG80gdC6nMPVe1n0WOEGYSIOJXoEw4lbng
 ==
X-ME-Sender: <xms:CeWWXhSplqMtI749YojQI9v4s0F-z-NUwNpmHIm5V2e4aaBEcgRZhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeefgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CeWWXiV9sMYMwosMp1M0fLxTEkciNWcriYPDjup40VgVYTOesUnSsw>
 <xmx:CeWWXjzfuATpI_bbUppQ7Of3v02C9fACB26TggUAg4Rm72zxYKtG0g>
 <xmx:CeWWXm_L44loqCiyb3iDnAryx3R28xWuM2H7Fu42hvELfoDXuTJo7Q>
 <xmx:CeWWXu01SvC8AZM7O8wUUKY4e6i0Wdlr1SuyzIRVBVmLDRiHBR7LUw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D0128328005A;
 Wed, 15 Apr 2020 06:42:16 -0400 (EDT)
Date: Wed, 15 Apr 2020 12:42:14 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH] drm/sun4i: hdmi ddc clk: Fix size of m divider
Message-ID: <20200415104214.ndkkxfnufkxgu53r@gilmour.lan>
References: <20200413095457.1176754-1-jernej.skrabec@siol.net>
 <CAGb2v65qetxxVX1yoCjyduM4zRTyF3YKX1g9CuaHZkF_Z+AKQg@mail.gmail.com>
 <CAGb2v66LxhqTBeA_Br=kUrTq83hocEcAzYYC6nXpASvkkjn+1g@mail.gmail.com>
 <1742537.tdWV9SEqCh@jernej-laptop>
MIME-Version: 1.0
In-Reply-To: <1742537.tdWV9SEqCh@jernej-laptop>
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0775370530=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0775370530==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iikhbqdgypmjrod7"
Content-Disposition: inline


--iikhbqdgypmjrod7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2020 at 06:09:08PM +0200, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 13. april 2020 ob 16:12:39 CEST je Chen-Yu Tsai napisal(a=
):
> > On Mon, Apr 13, 2020 at 6:11 PM Chen-Yu Tsai <wens@csie.org> wrote:
> > > On Mon, Apr 13, 2020 at 5:55 PM Jernej Skrabec <jernej.skrabec@siol.n=
et>
> wrote:
> > > > m divider in DDC clock register is 4 bits wide. Fix that.
> > > >
> > > > Fixes: 9c5681011a0c ("drm/sun4i: Add HDMI support")
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > >
> > > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> >
> > Cc stable?
>
> I don't think it's necessary:
> 1. It doesn't change much (anything?) for me when reading EDID. I don't t=
hink
> it's super important to have precise DDC clock in order to properly read =
EDID.
> 2. No matter if it has "Cc stable" tag or not, it will be eventually pick=
ed
> for stable due to fixes tag.
>
> This was only small observation when I was researching EDID readout issue=
 on
> A20 board, but sadly, I wasn't able to figure out why reading it sometimes
> fails. I noticed similar issue on SoCs with DE2 (most prominently on Oran=
gePi
> PC2 - H5), but there was easy workaround - I just disabled video driver i=
n U-
> Boot. However, if A20 display driver gets disabled in U-Boot, it totally
> breaks video output on my TV when Linux boots (no output). I guess there =
is
> more fundamental problem with clocks than just field size. I think we sho=
uld
> add more constraints in clock driver, like preset some clock parents and =
not
> allow to change parents when setting rate, but carefully, so simplefb doe=
sn't
> break. Such constraints should also solve problems with dual head setups.

I disagree here. Doing all sorts of special case just doesn't scale,
and we'll never have the special cases sorted out on all the boards
(and it's a nightmare to maintain).

Especially since it's basically putting a blanket over the actual
issue and looking the other way. If there's something wrong with how
we deal with (re)parenting, we should fix that. It impacts more than
just DRM, and all the SoCs.

Maxime

--iikhbqdgypmjrod7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpblBgAKCRDj7w1vZxhR
xYNeAQDkWOAE17PUs/+j0UPsIutwMt3fGauL7qUSC2cDBKT12AD/Yf2YkVdEbh8n
WD9IZaABcs8BR2mw6ne6+GE6MOR0Dgw=
=+u0/
-----END PGP SIGNATURE-----

--iikhbqdgypmjrod7--

--===============0775370530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0775370530==--
