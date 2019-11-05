Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C33EFB9B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 11:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8946E9BD;
	Tue,  5 Nov 2019 10:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40276E9BD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 10:41:29 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 130B3206BA;
 Tue,  5 Nov 2019 10:41:28 +0000 (UTC)
Date: Tue, 5 Nov 2019 11:41:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH v5 2/7] drm/bridge: split some definitions of ANX78xx to
 dedicated headers
Message-ID: <20191105104126.GC3876@gilmour.lan>
References: <20191104110400.F319F68BE1@verein.lst.de>
 <20191104110605.F012268BFE@verein.lst.de>
MIME-Version: 1.0
In-Reply-To: <20191104110605.F012268BFE@verein.lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572950489;
 bh=tYgfDNUiKF9OG4ZAZHs1pUURXP/0w4N53wTEREG05Pk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YltowqDGvnMBn/nVPnvQGpxkN/kl/KLHSWZ4Iz4UwBznH7w+V0gcqDNuSq2yAsfbo
 oJpi2x/ApcGc+grS9NYykkB2iWQz7g1j//dPIq/0KGRZ6Kjbpcmz6+O4L0Hy/Uyb8X
 dnxCjRrctg0qduKr+uh0C4chDMp3nKA/S+k/EVUc=
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
Content-Type: multipart/mixed; boundary="===============1547281373=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1547281373==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Oct 29, 2019 at 01:16:57PM +0100, Torsten Duwe wrote:
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

This one doesn't apply on drm-misc-next. The fix doesn't look really
obvious to me, can you rebase and resend it?

I'll apply the DT bindings and the DT tree so that it's part of the
next PR I'm going to send.

Maxime

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcFR1gAKCRDj7w1vZxhR
xV5aAQCXBnZlOkkH5HkRZaHAhmNuaFBDCCHJUlXqxSbXJL/X4QEA5kQpIKafNuiU
aw+xjEUvCpBo0PvmsdjNFuoA8dwovAI=
=FuMM
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--

--===============1547281373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1547281373==--
