Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B613566C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 11:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E766E3C4;
	Thu,  9 Jan 2020 10:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14786E3C4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 10:04:00 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3348F20673;
 Thu,  9 Jan 2020 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578564240;
 bh=EAbUup0u6x4vwDhewzBUsSbAJxXwsZBQSxw/cQMjjc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o3O8cSdw7oaSTI08ytkDaHTaiI5uf4s6BzLB7mK7SsavJtKyMcWZlspMnvrUd/tXz
 JiZBxnCuic2gf61air9a5/sMJJeXvWxJuk6S8gunZGqXVDucHhfeYWfaWYPkoQSVyA
 +Keal0P0GyDIzluncZcyuQnLxP5EnIW0qC+v39pM=
Date: Thu, 9 Jan 2020 11:03:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: Convert Allwinner display
 pipeline to schemas
Message-ID: <20200109100357.lmqe33ggag2oowlb@gilmour.lan>
References: <20200103152801.47254-1-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20200103152801.47254-1-maxime@cerno.tech>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0281476197=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0281476197==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="54reiogk2nzgbm2h"
Content-Disposition: inline


--54reiogk2nzgbm2h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Fri, Jan 03, 2020 at 04:27:58PM +0100, Maxime Ripard wrote:
> The Allwinner SoCs have a display engine composed of several controllers
> assembled differently depending on the SoC, the number and type of output
> they have, and the additional features they provide. A number of those are
> supported in Linux, with the matching bindings.
>
> Now that we have the DT validation in place, let's split into separate file
> and convert the device tree bindings for those controllers to schemas.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---
>
> Changes from v2:
>   - Changed a number of maxItems to minItems to make more sense
>   - Fixed a few enum that were improperly declared. This raised a bunch of
>     warnings that were unnoticed before. Fixed them.
>   - Added an if clause to the HDMI PHY binding to check the number of clocks
>
> Changes from v1:
>   - Declare the ports in the bindings

Does that new version address your comments?

As you know, this is the final schema patch for the Allwinner SoCs, so
I'd like to get this merged in 5.6 to close this off. Thanks!

Maxime

--54reiogk2nzgbm2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhb6jQAKCRDj7w1vZxhR
xR/6AQChv++Kk/i2sSVersFV4K91EMKf3vhP4uvSjusi081vnAEA56hf6j44G65S
pdZ8aP4dOevzZnW4TX+omVeQOiBQlwg=
=Utda
-----END PGP SIGNATURE-----

--54reiogk2nzgbm2h--

--===============0281476197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0281476197==--
