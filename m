Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BDEC4B8E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 12:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA756E92C;
	Wed,  2 Oct 2019 10:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7396E92C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 10:36:45 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DBAC218DE;
 Wed,  2 Oct 2019 10:36:44 +0000 (UTC)
Date: Wed, 2 Oct 2019 12:36:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 0/3] drm/sun4i: dsi: misc timing fixes
Message-ID: <20191002103642.jlbs44v4kwnxhrge@gilmour>
References: <20191001080253.6135-1-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20191001080253.6135-1-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570012605;
 bh=OTtxUEjlO9HcUPpiugCSBkopkvyXz2JCDw8OEY6QwX8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dop77VND9yEdv1ixP06TuVIV/36nU/gRS6iesokjS2CL7ZPgJdrbgDpvt2Aoxzgu2
 d5u137d5vOTMdKWAjM2hICqZFYPs7zzfRGPDLEKyrpW0K9Z2k28AGKCwWGyw0Bwo42
 t1VdFm3KNA9hZoIoMuUDxnLyR/+3oztIWtrtXmsE=
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0208782038=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0208782038==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6keczcenlhnwont6"
Content-Disposition: inline


--6keczcenlhnwont6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Oct 01, 2019 at 04:02:50PM +0800, Icenowy Zheng wrote:
> This patchset fixes some portion of timing calculation in sun6i_mipi_dsi
> driver according to the BSP driver.
>
> Two of the patches are reverting, one is fixing some misread of the BSP
> source code, another is fixing a wrong refactor that actually breaks the
> formula.
>
> The other non-reverting patch is fixing a porch error which is usually
> seen in the original driver commit. Most of porch errors are then fixed,
> but this one gets ignored.
>
> By applying these patches, several DSI panels are tested to be driven
> properly by the timing provided by the vendor, including the LCD panel
> of PinePhone "Don't Be Evil" DevKit, the final PinePhone panel and the
> panel on PineTab. Without these patches they need dirty timing hacks to
> work.

Thanks for going after that issue. Can you provide references to the
BSP on the various patches?

Ideally, having the panel drivers, and the panel datasheet would help.

Thanks!
Maxime

PS: where can we get one of those devices?

--6keczcenlhnwont6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZR9ugAKCRDj7w1vZxhR
xY0/AQC5eQr1MF2JwZuR7J6/60HoAsW6kKoOVaBBWurj6iMNTAD+JwOOdlDSQqrT
fievw3+uVVe3O0xnWQxGHYInw9LB6g4=
=q4a2
-----END PGP SIGNATURE-----

--6keczcenlhnwont6--

--===============0208782038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0208782038==--
