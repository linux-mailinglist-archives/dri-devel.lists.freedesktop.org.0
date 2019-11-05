Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8917DEFBAF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 11:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C5D6E9C0;
	Tue,  5 Nov 2019 10:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152536E9C0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 10:43:45 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C7CB206BA;
 Tue,  5 Nov 2019 10:43:44 +0000 (UTC)
Date: Tue, 5 Nov 2019 11:43:42 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH v5 6/7] dt-bindings: Add ANX6345 DP/eDP transmitter binding
Message-ID: <20191105104342.GD3876@gilmour.lan>
References: <20191104110400.F319F68BE1@verein.lst.de>
 <20191104110613.C3BA468C4E@verein.lst.de>
MIME-Version: 1.0
In-Reply-To: <20191104110613.C3BA468C4E@verein.lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572950624;
 bh=PSQEEnZ0laTDZiGYUA/GbDjYoEzSM/8mbSzwF/BKSyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PJkpTS1MgUmm8+9CqOP+yjuzMwiYk0PVtRfX5d7YaOUBySwDZ9cM6PgMR3Cggx8Uq
 s/m93j31qYZSdoH7bqpcy6kTd9X/IXdOTOrhEHCjBFRVcbjOe/BQN0TsNli8mNcnw0
 Dc9MpcOaQ87R/WxVfPrh8mXBTe9k5st6ALK08InI=
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
Content-Type: multipart/mixed; boundary="===============1166016425=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1166016425==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline


--s9fJI615cBHmzTOP
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

Applied, thanks

(still, there's one comment below that can be addressed in a
subsequent patch).

> ---
>  .../bindings/display/bridge/anx6345.yaml           | 102 ++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/anx6345.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/anx6345.yaml b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
> new file mode 100644
> index 000000000000..094e8e8a5faa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
> @@ -0,0 +1,102 @@
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
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          Video port for LVTTL input
> +
> +      port@1:
> +        type: object
> +        description: |
> +          Video port for eDP output (panel or connector).
> +          May be omitted if EDID works reliably.
> +
> +    required:
> +      - port@0

You should have something like:

ports:
  type: object
  additionalProperties: false

as well...

> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - dvdd12-supply
> +  - dvdd25-supply
> +  - ports
> +
> +additionalProperties: false

This prevents additional properties only on the top-level node, not
its children.

Maxime

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcFSXgAKCRDj7w1vZxhR
xWDyAQC/sTEqgIPTcOOELk+/c6UietuE9I6ZSjYK0vSixbY85QEA3YGf1cUesRov
KKmSnjZjgmC0YlV/4YVCj4ZQF1Dkkw0=
=1muA
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--

--===============1166016425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1166016425==--
