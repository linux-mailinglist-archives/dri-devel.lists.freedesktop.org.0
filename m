Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 389CBF19E5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 16:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A64F6EDA3;
	Wed,  6 Nov 2019 15:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0536EDA3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 15:21:46 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85F712166E;
 Wed,  6 Nov 2019 15:21:45 +0000 (UTC)
Date: Wed, 6 Nov 2019 16:21:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH v5 2/7] drm/bridge: split some definitions of ANX78xx to
 dedicated headers
Message-ID: <20191106152131.GD8617@gilmour.lan>
References: <20191104110400.F319F68BE1@verein.lst.de>
 <20191104110605.F012268BFE@verein.lst.de>
 <20191105104126.GC3876@gilmour.lan> <20191105173332.GA11570@lst.de>
MIME-Version: 1.0
In-Reply-To: <20191105173332.GA11570@lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573053706;
 bh=Z5uRUEYMHnBMAkQQBIKbi4YuTu5BKSlKgXYE8gT6Bec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xKVvy8T7SQJv8gsuGyvvTQw5ONXKSc54BOSU448ev64QRk472PQZFFT/nTB1gGfTm
 HRd4abZ6Xa7XqWJMo9HkBoVMefaUGGv+B1N4aOjiFIldwk1TT+GQZckyJ9+VsuL24s
 agEi5bAJHcKcE/67YTYJsBFrzLGsfB8dA+5fwHKE=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1832196994=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1832196994==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Content-Disposition: inline


--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

On Tue, Nov 05, 2019 at 06:33:32PM +0100, Torsten Duwe wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
>
> Some definitions currently in analogix-anx78xx.h are not restricted to
> the ANX78xx series, but also applicable to other DisplayPort
> transmitters by Analogix.
>
> Split out them to dedicated headers, and make analogix-anx78xx.h include
> them.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> Signed-off-by: Torsten Duwe <duwe@suse.de>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
>
> ---
>
> On Tue, Nov 05, 2019 at 11:41:26AM +0100, Maxime Ripard wrote:
> >
> > This one doesn't apply on drm-misc-next. The fix doesn't look really
> > obvious to me, can you rebase and resend it?
>
> Sure.
> The set was based on 5.4-rc5, which lacks 025910db8057f from drm-misc-next
> You'll also have to
> diff -r anx6345-v5/v5-0005-drm-bridge-Add-Analogix-anx6345-support.patch anx6345-v5a/v5-0005-drm-bridge-Add-Analogix-anx6345-support.patch
> 116,117c116,117
> < +     [I2C_IDX_DPTX]  = ANALOGIX_I2C_DPTX,
> < +     [I2C_IDX_TXCOM] = ANALOGIX_I2C_TXCOMMON,
> ---
> > +     [I2C_IDX_DPTX]  = 0x70,
> > +     [I2C_IDX_TXCOM] = 0x72,
>
> To make it compile, with the changed coding style of 025910db8057f.
> Can you change that on the fly in 5/7 or shall I resend that, too?

Please resend the whole series rebased on top of either linux-next or
drm-misc-next.

Maxime

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcLk+wAKCRDj7w1vZxhR
xbUHAQDw1ZTTedeTOWdyiLtw5dPLgY1kNJLxyuWvOWpHnLkvfwEAtl4uNwJQytsL
qdyuTkhCiUtsu2g+nFxjoWkC/bEU0Q0=
=JKza
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--

--===============1832196994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1832196994==--
