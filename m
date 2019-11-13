Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22851FB283
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 15:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E8D6ED21;
	Wed, 13 Nov 2019 14:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822A86ED21
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 14:25:48 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13CE3222D0;
 Wed, 13 Nov 2019 14:25:46 +0000 (UTC)
Date: Wed, 13 Nov 2019 15:25:44 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tian Yunhao <t123yh@outlook.com>
Subject: Re: [PATCH] drm/sun4i: tcon: Set min division of TCON0_DCLK to 1.
Message-ID: <20191113142544.GG4345@gilmour.lan>
References: <MN2PR08MB57905AD8A00C08DA219377C989760@MN2PR08MB5790.namprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MN2PR08MB57905AD8A00C08DA219377C989760@MN2PR08MB5790.namprd08.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573655147;
 bh=pDH6eo76fm4Ww448YNgiv4t1zRqGCI1dzASDS0Ut32s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aMNaZPiEEJym5GYKRS667x/n1xh4eOgDRzc8G/n/xIZSqmcZfunMA2jeGXdiGjEY4
 HRY+yYwDVebZoA/4q8nqOT0B2qH4Zkk81tILKQ4aBPMK8Iqh2ke8aSPoCbJKV3G40x
 8PUI9B5nmBKJgQ2QY/GP1Rm9aqfFYRh9YqPzMdn8=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============0692972018=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0692972018==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6vu8ReRIjaA55nHT"
Content-Disposition: inline


--6vu8ReRIjaA55nHT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Nov 13, 2019 at 01:27:25PM +0000, Tian Yunhao wrote:
> The datasheet of V3s (and various other chips) wrote
> that TCON0_DCLK_DIV can be >= 1 if only dclk is used,
> and must >= 6 if dclk1 or dclk2 is used. As currently
> neither dclk1 nor dclk2 is used (no writes to these
> bits), let's set minimal division to 1.
>
> If this minimal division is 6, some common dot clock
> frequencies can't be produced (e.g. 30MHz will not be
> possible and will fallback to 25MHz), which is
> obviously not an expected behaviour.
>
> Signed-off-by: Yunhao Tian <t123yh@outlook.com>

Applied, thanks.

I had to update your author name to match the one in the
Signed-off-by. You probably want to check your git configuration to
remain consistent.

Maxime

--6vu8ReRIjaA55nHT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcwSaAAKCRDj7w1vZxhR
xU7XAP0fxqyNsoQ8ysyrGwSsWFp4AAWRd91NvKK8UgOJEivhHAEA9zIvnAoinYgK
QiNv766LtIfZTSaIm2fPqq3Ap46Q6QU=
=YtI3
-----END PGP SIGNATURE-----

--6vu8ReRIjaA55nHT--

--===============0692972018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0692972018==--
