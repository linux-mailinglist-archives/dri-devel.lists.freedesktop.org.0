Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241BC9DB2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 13:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455646E9AB;
	Thu,  3 Oct 2019 11:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61836E9AB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 11:47:35 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15A932070B;
 Thu,  3 Oct 2019 11:47:34 +0000 (UTC)
Date: Thu, 3 Oct 2019 13:47:33 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v11 4/7] dt-bindings: sun6i-dsi: Add VCC-DSI supply
 property
Message-ID: <20191003114733.56mlar666l76uoyb@gilmour>
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-5-jagan@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20191003064527.15128-5-jagan@amarulasolutions.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570103255;
 bh=4nbskvtMte6G8Dn16qGwpWvD7usNNHZVowY6nzQ2Cx8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O20g3VXN3/cg4aktrTVEe1GoW8i3ThoeeCN1k/JWU6mjTRj16XPoBKKQyzKDaXwN2
 4lZpEHI+x/6TtmfN5YS8Gy5rtabyI3lmUdMvHUjqCRr2kyrMwRtkphLHWmIzPJAv5u
 qo1v5dHZgQ3uBbnCCPnNR81iVgTFACMX8U0wxo0I=
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 michael@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1167280409=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1167280409==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="abhaj7rlytqkllsn"
Content-Disposition: inline


--abhaj7rlytqkllsn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 03, 2019 at 12:15:24PM +0530, Jagan Teki wrote:
> Allwinner MIPI DSI controllers are supplied with SoC DSI
> power rails via VCC-DSI pin.
>
> Some board still work without supplying this but give more
> faith on datasheet and hardware schematics and document this
> supply property in required property list.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> index 47950fced28d..9d4c25b104f6 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> @@ -36,6 +36,9 @@ properties:
>    resets:
>      maxItems: 1
>
> +  vcc-dsi-supply:
> +    description: VCC-DSI power supply of the DSI encoder
> +

The driver treats it as mandatory, so I've added it to the binding, as
suggested by the commit log.

Maxime

--abhaj7rlytqkllsn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZXf1QAKCRDj7w1vZxhR
xQpxAP98mYp2+COHS85N0R4A/9rdJqX3YHaZ0XyYCj2Ihb0iVQD/QWC0ZaUcuku4
nKva2ZQhgqqxhRK3v8jH9MrfregJmAE=
=CYoo
-----END PGP SIGNATURE-----

--abhaj7rlytqkllsn--

--===============1167280409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1167280409==--
