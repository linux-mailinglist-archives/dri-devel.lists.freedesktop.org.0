Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C075D804C21
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860D110E118;
	Tue,  5 Dec 2023 08:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5398510E118
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1701764287; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=ZvhTPWrGAUnbqzvxi8/d3zjqsh+hsJYfbQQ/aCNX0i56rGUT+GmHvt/IyHHXnv2mC1
 Wf4lPGYCFEe/Dt1hdLJrnaB25KCybSR6F3Pt1xUHMjFfnxqPDOsLwr38+bgvPrDoTk/e
 BBmw5bYvt0bsP2uFP26kHz/+9TVFHf7MNokwZj7HFGa1w8XpiCJUzfpyZ1WKnv3Wwxb/
 ypP2g8bTv/kY2Zest1H/QsdlAYzIhbDIk7hKDdz86oApFqYc6psLRoh3iWvBJDQD8BNp
 3EI3lHuFjpFrTi6JS95SxLiDYghzELX+SPCYZCKmcT/RbRrX2Ryevx1FTxRqsJI9wglk
 4jvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701764287;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=UIo0LOPdZ0hyfaT46apt2R+skxOQe6f0X6bP3Ofjdmg=;
 b=pvyDzRRqEYeQ9UdOYHX7KNAPulbro+Cobexf4aN9Y30cRASdaH/3J+DtQWMS4Sk27c
 hRaf7IjUSJgOLiLaap40Zg/zWgek99PL0bheS962TrWxielYyLC2We8I4eKF90qJM18q
 Ek9TkXGIsq41GrrFCk//0nkltPWUxs3BG9/yEnssiLn4TgYKkDC36wzyp2HFG7/kNiD0
 ODXRNTL2MpPw0G5F64jqkT+/M7KqZKx3jhxPxvl2lNsZ05odTC/T13IqCc9ui5vqsvv+
 StV57mIcp4ejul4nmfWCv/racqWHviyLu+eWQ1IfewEcnSV1vElp3/TqllUx6oPcqBTw
 lKIQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701764287;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=UIo0LOPdZ0hyfaT46apt2R+skxOQe6f0X6bP3Ofjdmg=;
 b=VAyu8YqDdjKNbEQTXnYxR1ebcPLEXhh6f3WGHMBLQvXBL9skMjBrPj3m4bH+/qeeLt
 4LCmDvs5psTBzQbCbfg/kCK4JI/URUSLw2mhhyyTTsQm5kvmBvyl3FXBgCAUpxk9/Pbf
 Zsw0z4rWuEPaX+OMJSjhuRWo2LZYF5MerOds63H+J0+VI/J0vvt9i+4oiHycdCsS7cDj
 95bhd3C+MNeZt8t1Gxwybmi3jx5vfkNaoS13vzhfAEN/FmzcNdqvOIjE4vrJmDSmEfWn
 keFdEjORWwqn07wyzT7bselji3UGwGh5LvQl/5BBXHxdlIHA6Ik2+T0F/mjNwT+enF09
 WoKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701764287;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=UIo0LOPdZ0hyfaT46apt2R+skxOQe6f0X6bP3Ofjdmg=;
 b=rgYhknTN5kCYaoTzgdf1Yza6aNg2Tj0Q7tTNZ4nlkxBC+ERBsoO5q6s7UMCLgwqFaL
 913GtbkyINUxDNaU5ICA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGeonQ="
Received: from smtpclient.apple by smtp.strato.de (RZmta 49.9.7 DYNA|AUTH)
 with ESMTPSA id 6c76e8zB58I5OvJ
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 5 Dec 2023 09:18:05 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20231204182245.33683-2-afd@ti.com>
Date: Tue, 5 Dec 2023 09:17:55 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <CFF198DA-5C42-425E-86F4-759629489ECB@goldelico.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
To: Andrew Davis <afd@ti.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew,

> Am 04.12.2023 um 19:22 schrieb Andrew Davis <afd@ti.com>:
>=20
> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs from
> multiple vendors.

Great and thanks for the new attempt to get at least the Device Tree =
side
upstream. Really appreciated!

> Describe how the SGX GPU is integrated in these SoC,
> including register space and interrupts.

> Clocks, reset, and power domain
> information is SoC specific.

Indeed. This makes it understandable why you did not directly
take our scheme from the openpvrsgx project.

>=20
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
> .../devicetree/bindings/gpu/img,powervr.yaml  | 69 +++++++++++++++++--
> 1 file changed, 63 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml =
b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
> index a13298f1a1827..9f036891dad0b 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
> @@ -11,11 +11,33 @@ maintainers:
>   - Frank Binns <frank.binns@imgtec.com>
>=20
> properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'
> +
>   compatible:
> -    items:
> -      - enum:
> -          - ti,am62-gpu
> -      - const: img,img-axe # IMG AXE GPU model/revision is fully =
discoverable
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ti,am62-gpu
> +          - const: img,img-axe # IMG AXE GPU model/revision is fully =
discoverable
> +      - items:
> +          - enum:
> +              - ti,omap3430-gpu # Rev 121
> +              - ti,omap3630-gpu # Rev 125

Is the "Rev 121" and "Rev 125" a property of the SoC integration =
(clock/reset/power
hookup etc.) or of the integrated SGX core?

In my understanding the Revs are different variants of the SGX core =
(errata
fixes, instruction set, pipeline size etc.). And therefore the current =
driver code
has to be configured by some macros to handle such cases.

So the Rev should IMHO be part of the next line:

> +          - const: img,powervr-sgx530

+          - enum:
+              - img,powervr-sgx530-121
+              - img,powervr-sgx530-125

We have a similar definition in the openpvrsgx code.
Example: compatible =3D "ti,omap3-sgx530-121", "img,sgx530-121", =
"img,sgx530";

(I don't mind about the powervr- prefix).

This would allow a generic and universal sgx driver (loaded through just =
matching
"img,sgx530") to handle the errata and revision specifics at runtime =
based on the
compatible entry ("img,sgx530-121") and know about SoC integration =
("ti,omap3-sgx530-121").

And user-space can be made to load the right firmware variant based on =
"img,sgx530-121"

I don't know if there is some register which allows to discover the =
revision long
before the SGX subsystem is initialized and the firmware is up and =
running.

What I know is that it is possible to read out the revision after =
starting the firmware
but it may just echo the version number of the firmware binary provided =
from user-space.

> +      - items:
> +          - enum:
> +              - ingenic,jz4780-gpu # Rev 130
> +              - ti,omap4430-gpu # Rev 120
> +          - const: img,powervr-sgx540
> +      - items:
> +          - enum:
> +              - allwinner,sun6i-a31-gpu # MP2 Rev 115
> +              - ti,omap4470-gpu # MP1 Rev 112
> +              - ti,omap5432-gpu # MP2 Rev 105
> +              - ti,am5728-gpu # MP2 Rev 116
> +              - ti,am6548-gpu # MP1 Rev 117
> +          - const: img,powervr-sgx544
>=20
>   reg:
>     maxItems: 1
> @@ -40,8 +62,6 @@ properties:
> required:
>   - compatible
>   - reg
> -  - clocks
> -  - clock-names
>   - interrupts
>=20
> additionalProperties: false
> @@ -56,6 +76,43 @@ allOf:
>       properties:
>         clocks:
>           maxItems: 1
> +      required:
> +        - clocks
> +        - clock-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,am654-sgx544
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 1
> +      required:
> +        - power-domains
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun6i-a31-gpu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +      required:
> +        - clocks
> +        - clock-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ingenic,jz4780-gpu
> +    then:
> +      required:
> +        - clocks
> +        - clock-names
>=20
> examples:
>   - |
> --=20
> 2.39.2
>=20

BR and thanks,
Nikolaus=
