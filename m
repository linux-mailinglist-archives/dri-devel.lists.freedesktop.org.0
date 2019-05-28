Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE462C35B
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29F26E19C;
	Tue, 28 May 2019 09:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B126E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:37:56 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 967CB240003;
 Tue, 28 May 2019 09:37:52 +0000 (UTC)
Date: Tue, 28 May 2019 11:39:01 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0
 to its companion LVDS1
Message-ID: <20190528093901.r6vbfnelwc3xfgn2@uno.localdomain>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-9-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190511210702.18394-9-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: NeoMutt/20180716
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2059335865=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2059335865==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eu54icbq2mbwkdiv"
Content-Disposition: inline


--eu54icbq2mbwkdiv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Sun, May 12, 2019 at 12:07:00AM +0300, Laurent Pinchart wrote:
> Add the new renesas,companion property to the LVDS0 node to point to the
> companion LVDS encoder LVDS1.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Provided this does not enable dual-link operations by default:
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> ---
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 ++
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index d2ad665fe2d9..b52e3fdb5fca 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -1731,6 +1731,8 @@
>  			resets = <&cpg 727>;
>  			status = "disabled";
>
> +			renesas,companion = <&lvds1>;
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 5bf3af246e14..94b5177eb152 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -1038,6 +1038,8 @@
>  			resets = <&cpg 727>;
>  			status = "disabled";
>
> +			renesas,companion = <&lvds1>;
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> --
> Regards,
>
> Laurent Pinchart
>

--eu54icbq2mbwkdiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlztAbUACgkQcjQGjxah
Vjys2BAAm83F07eJYtNcG2S2ON+7A+TRt4107WaQSVDoHcEAFaqqfLlSfD29oh9j
Bid/IwFoy8WKJkuJK4dLRO1o/RUhrd3Iv2F7McC92EjnvXAnII5GAx3Fd8B/7pYP
WAncr+SW0UlSwSdCsRrmYlC48d4Qnm95voC5gec44iNxz2IvZrLqdYBEMMhjJa1g
g+piG2YH4vaBpDFo7re+i0ZTZMlkRRu23gvx5hd1g5qSuPdjC9Jddxhb/5KK3tdk
8y9Rnv9X59JuIiE37kzHre0RBnhaBf5gpKE3Z5z9IQK616XlJ801bzDCZ3YKRPfi
g5Q2IciJT7E5prsjo3axJm3sphkhJfSYzXy4M8Ix3EQFeKOH8MkGy5EQOtTFl5/g
qsNz9mkPVi+eVUI/HoJ1lPpapOn076tcMuA1C85Ye5WEURjhARiQd/kna2HhYXl6
Hi54j5DuDq7MGFCLt+8dZkeoeC42KxRMzw+2cuX+BJbHPvrTSyQi4MvvdKS4kaWD
NDNoCZvIs9ZT5HiuzXOMlODaYmUsk/9Q5ATtNdz1BOwLs0Q8awP8Zh4hyaWxt+S0
dR2mu29egwtwmWEC91JrAkyz/n8wl6NDEuXjosht80K+/wqSY9tzLfDDxEEz5dNI
vDuIMmltf0sY6OVXsw0nL824c4fiBG06128nFjH8WP8kAdk71dc=
=D2l4
-----END PGP SIGNATURE-----

--eu54icbq2mbwkdiv--

--===============2059335865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2059335865==--
