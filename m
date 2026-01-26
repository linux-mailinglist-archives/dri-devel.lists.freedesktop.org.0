Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EaTKnDSd2mFlwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:45:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BEC8D3CC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496FD10E493;
	Mon, 26 Jan 2026 20:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AJRURO6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA6010E493
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 20:45:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 98E8743D45;
 Mon, 26 Jan 2026 20:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D800FC116C6;
 Mon, 26 Jan 2026 20:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769460330;
 bh=JwQdQNdNJV/HaQFrrnZMThrwdtFA2E+1dlPwru2wF4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AJRURO6SoU2+sHBJMNfvcn7oK0AmVW8DfHWWmTLcFqDSs9lYho8ZmNzH/5itsmS2U
 ZP2dzYHhGsQ84wHVq1Ful51YLZmSSvKLXbMrGHY6bNPJ/kWnH67nSOg5N45ps4D8kD
 cP5N+/6k+/YyXci95UdEb25+obCKMsi+UP/qlSVMVq9JBbnONvbDKeof/jUBBICfH9
 KtpyfBYiGA4ImavQ79ppYmqYFyKA5DBDNSnVXkHHRMxeyo47c/3XuCOKj8vyHi8Xzj
 2LFz3x1Pt4XrBVWN/BqJM16NmK5dpvh54y/VVj14n4rWtf907jYRLV3Juwld2I3n/H
 Cv3Y8eBDm9dRA==
Date: Mon, 26 Jan 2026 20:45:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: document Atrix 4G
 and Droid X2 DSI panel
Message-ID: <20260126-patchwork-cofounder-8b7bb715556a@spud>
References: <20260125131904.45372-1-clamor95@gmail.com>
 <20260125131904.45372-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vuJvPvavnR/jWTI2"
Content-Disposition: inline
In-Reply-To: <20260125131904.45372-2-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[conor@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:neil.armstrong@linaro.org,m:jessica.zhang@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C3BEC8D3CC
X-Rspamd-Action: no action


--vuJvPvavnR/jWTI2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 03:19:03PM +0200, Svyatoslav Ryhel wrote:
> Atrix 4G and Droid X2 use the same 540x960 DSI video mode panel. Exact
> panel vendor and model are unknown hence generic compatible is used based
> on board name it is used with.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/panel/motorola,mot-panel.yaml     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/motor=
ola,mot-panel.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/motorola,mot=
-panel.yaml b/Documentation/devicetree/bindings/display/panel/motorola,mot-=
panel.yaml
> new file mode 100644
> index 000000000000..2326a83bc405
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/motorola,mot-panel.=
yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/motorola,mot-panel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atrix 4G and Droid X2 DSI Display Panel
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description:
> +  Atrix 4G and Droid X2 use the same 540x960 DSI video mode panel. Exact
> +  panel vendor and model are unknown hence generic compatible is used.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: motorola,mot-panel

What's a "mot" panel? If that's short for motorola, wouldn't it be
better to conjure up something at least more specific to these
particular users? The commit message has some info, but I still dunno
where "mot" comes from.
Seems okay otherwise..

> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Regulator for main power supply.
> +
> +  vddio-supply:
> +    description: Regulator for 1.8V IO power supply.
> +
> +  backlight: true
> +  reset-gpios: true
> +  port: true
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel@0 {
> +            compatible =3D "motorola,mot-panel";
> +            reg =3D <0>;
> +
> +            reset-gpios =3D <&gpio 35 GPIO_ACTIVE_LOW>;
> +
> +            vdd-supply =3D <&vdd_5v0_panel>;
> +            vddio-supply =3D <&vdd_1v8_vio>;
> +
> +            backlight =3D <&backlight>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint =3D <&dsi_out>;
> +                };
> +            };
> +        };
> +    };
> +...
> --=20
> 2.51.0
>=20

--vuJvPvavnR/jWTI2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXfSZQAKCRB4tDGHoIJi
0tSfAQDyy1EKaJ2Dsy+RRBrGRX2fB0H7nv5dH6KfrKaTNuIqIwD9Eei/dAnityuS
7Ezm8EnxLsIT4lVVXzFwtuCus8nA0g8=
=He5Z
-----END PGP SIGNATURE-----

--vuJvPvavnR/jWTI2--
