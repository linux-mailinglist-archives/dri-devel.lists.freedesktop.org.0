Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7239AEB0BB
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 14:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D0B6EE73;
	Thu, 31 Oct 2019 13:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AB86EE69
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 13:01:08 +0000 (UTC)
Received: from localhost (lns-bzn-32-82-254-4-138.adsl.proxad.net
 [82.254.4.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FF182080F;
 Thu, 31 Oct 2019 13:01:06 +0000 (UTC)
Date: Thu, 31 Oct 2019 13:51:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH v4 6/7] dt-bindings: Add ANX6345 DP/eDP transmitter binding
Message-ID: <20191031125100.qprbdaaysg3tmhif@hendrix>
References: <20191029153815.C631668C4E@verein.lst.de>
 <20191029153953.8EE9B68D04@verein.lst.de>
MIME-Version: 1.0
In-Reply-To: <20191029153953.8EE9B68D04@verein.lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572526867;
 bh=f8eRto+8exxLgWUVCKrmmM8ykoEw4tBZ+Sa1c7y0s1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JPgWzUplTsqtsEfcET7zNSf9SFujmQQQiVz6ScjU8KqRhl7L8N21vc1eI4dpAwt8d
 A4w6TuYAOUBZ6qC6lBBSRdgVUCMXuY57ED265QOpQriUW3BfrSq5F8CfqEG9YWMPmD
 6aj56dA7bidFDsGO+7aha31rwXjoNoEwTJQX8qGY=
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============0592886067=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0592886067==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4cs2y66oqe25ixg3"
Content-Disposition: inline


--4cs2y66oqe25ixg3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 29, 2019 at 01:16:57PM +0100, Torsten Duwe wrote:
> The anx6345 is an ultra-low power DisplayPort/eDP transmitter designed
> for portable devices.
>
> Add a binding document for it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Torsten Duwe <duwe@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/display/bridge/anx6345.yaml           | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/anx6345.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/anx6345.yaml b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
> new file mode 100644
> index 000000000000..094e8e8a5faa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/anx6345.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analogix ANX6345 eDP Transmitter Device Tree Bindings
> +
> +maintainers:
> +  - Torsten Duwe <duwe@lst.de>
> +
> +description: |
> +  The ANX6345 is an ultra-low power Full-HD eDP transmitter designed for
> +  portable devices.
> +
> +properties:
> +  compatible:
> +    const: analogix,anx6345
> +
> +  reg:
> +    maxItems: 1
> +    description: base I2C address of the device
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to active low reset
> +
> +  dvdd12-supply:
> +    maxItems: 1
> +    description: Regulator for 1.2V digital core power.
> +
> +  dvdd25-supply:
> +    maxItems: 1
> +    description: Regulator for 2.5V digital core power.
> +
> +  ports:
> +    anyOf:
> +      - port@0:
> +        description: Video port for LVTTL input
> +      - port@1:
> +        description: Video port for eDP output (panel or connector).
> +                     May be omitted if EDID works reliably.
> +    required:
> +      - port@0

Have you tried to validate those two ports in a DT?

I'm not quite sure what you wanted to express with that anyOf, but if
it was something like port@0 is mandatory, and port@1 is optional, it
should be something like this:

properties:

  ...

  ports:
    type: object

    properties:
      port@0:
        type: object
        description: |
	  Video port for LVTTL input

      port@1:
        type: object
        description: |
	  Video port for eDP output (..)

    required:
      - port@0

This way, you express that both port@0 and port@1 must by nodes, under
a node called ports, and port@0 is mandatory.

You should even push this a bit further by adding
additionalProperties: false to prevent a DT from having undocumented
properties and children for the main node and ports node.

Maxime

--4cs2y66oqe25ixg3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXbrYtAAKCRDj7w1vZxhR
xV1dAQC5514CdqdwGVxKBgHABRr2w2ucyLWqPk68wp3r0weRTAEA1E4SCm2To1Xt
ZnSJZF6aVIy6kDrJXQRDNT9vWD9JOwY=
=TzGz
-----END PGP SIGNATURE-----

--4cs2y66oqe25ixg3--

--===============0592886067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0592886067==--
