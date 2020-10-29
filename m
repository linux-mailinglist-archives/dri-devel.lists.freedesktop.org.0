Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1FF29FFB9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA2E6ECE4;
	Fri, 30 Oct 2020 08:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB616E8A7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 17:43:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81904B1F6;
 Thu, 29 Oct 2020 17:43:29 +0000 (UTC)
Message-ID: <4d0028fdf797abd99f95d627e60e9322caa52596.camel@suse.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: Add a property to deal
 with WiFi coexistence
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  Eric Anholt <eric@anholt.net>
Date: Thu, 29 Oct 2020 18:43:27 +0100
In-Reply-To: <20201029134018.1948636-1-maxime@cerno.tech>
References: <20201029134018.1948636-1-maxime@cerno.tech>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0956412106=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0956412106==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dPeDp453d8U7UvrUEare"


--=-dPeDp453d8U7UvrUEare
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi maxime,

On Thu, 2020-10-29 at 14:40 +0100, Maxime Ripard wrote:
> The RaspberryPi4 has both a WiFi chip and HDMI outputs capable of doing
> 4k. Unfortunately, the 1440p resolution at 60Hz has a TMDS rate on the
> HDMI cable right in the middle of the first Wifi channel.
>=20
> Add a property to our HDMI controller, that could be reused by other
> similar HDMI controllers, to allow the OS to take whatever measure is
> necessary to avoid that crosstalk.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> ---
>=20
> Changes from v1:
>   - Renamed the property
>   - Split it into a separate patch
> ---
>  .../devicetree/bindings/display/brcm,bcm2711-hdmi.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.=
yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> index 03a76729d26c..7ce06f9f9f8e 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -76,6 +76,12 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  wifi-2.4ghz-coexistence:

I see you already renamed the property, but I can't seem to find v1 of the
series online. Sorry if this is redundant:

I wonder if it'd make sense to prefix the property like this:
"raspberrypi,wifi-2.4ghz-coexistence." I tend to associate the lack of pref=
ix
with generic properties, and also thought it was a rule. Although I may hav=
e as
well imagined it.

Other than that the series looks OK to me.

Regards,
Nicolas



--=-dPeDp453d8U7UvrUEare
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+a/z8ACgkQlfZmHno8
x/5GrAf+MH12IZ/4lseflFpGeeMrCiugkwqN+ahurTG44SM+ZoJwj9FcD3Nf9u+b
2S1EKBR1FOiAfPHZtXhymtS7TvF1K6csxAU8CrJwRCfEKDo0OI/p4Ly9/CipwLOT
GLh2Qvet66N+1Ak3bJ6fpeBgCrG4dQm4W0pWhmNA98s2KzR40/jVOq/O/uQ5x7xf
xl+YcfJ+130d4z8QTlHkAnOvOczvj03Iowewavd0oh5R7zq//6OCNoADLVfY0gJP
5UF7BuhYg8nYGu2LwOL+jB5SroZ0eFRNZvLxxOtl4C7oPdemvYI57OYDQHA9PqTi
EIx+MbXjqVxn+BdfzKmrGY+ZNEJBQA==
=VVnt
-----END PGP SIGNATURE-----

--=-dPeDp453d8U7UvrUEare--


--===============0956412106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0956412106==--

