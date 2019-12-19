Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EFD12642B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 15:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DB96EB7E;
	Thu, 19 Dec 2019 14:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B13F6EB7E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 14:02:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJE2d7x006319;
 Thu, 19 Dec 2019 08:02:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576764159;
 bh=Z/4zy0bcGlzZwPsLdqMD3dCPHP5/S3bwFza9AnZkYRc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=OqT+X7vBi7HBzPbV1doQXHCO4o6151/DytKPJ9///IgvYua5oJvj/8OWhWyP0GEQZ
 6FuSrlpEZ18zrRcfVynuWvtHkiDi2dQ0+Cpmg6t3Bxo+5plpVya651WwObe9dP0kuk
 6IlW6JFA58jPNV8UpKtseCpZ4/zb9vxEPUv/ghk0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJE2daH065521
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Dec 2019 08:02:39 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 08:02:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 08:02:34 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJE2V2F054819;
 Thu, 19 Dec 2019 08:02:32 -0600
Subject: Re: [PATCH v4 3/5] dt-bindings: display: ti, j721e-dss: Add dt-schema
 yaml binding
To: Maxime Ripard <maxime@cerno.tech>
References: <cover.1576704528.git.jsarha@ti.com>
 <89db418c91689beb6e63e0c3c99b39655948b429.1576704528.git.jsarha@ti.com>
 <20191219083839.lmuhxynbbqy4d4hp@gilmour.lan>
From: Jyri Sarha <jsarha@ti.com>
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2acd648f-6532-c7d8-c9d0-f4c5229c7923@ti.com>
Date: Thu, 19 Dec 2019 16:01:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219083839.lmuhxynbbqy4d4hp@gilmour.lan>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 sjakhade@cadence.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 robh+dt@kernel.org, tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
 subhajit_paul@ti.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0410972296=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0410972296==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="lvnmzd5MQJeWgjpGHrk5fUt4U9udObU1W"

--lvnmzd5MQJeWgjpGHrk5fUt4U9udObU1W
Content-Type: multipart/mixed; boundary="5pmhAxlWnc8hbbeJiFxw5k5ShGwaMHvg1"

--5pmhAxlWnc8hbbeJiFxw5k5ShGwaMHvg1
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 19/12/2019 10:38, Maxime Ripard wrote:
> Hi,
>=20
> On Thu, Dec 19, 2019 at 10:23:17AM +0200, Jyri Sarha wrote:
>> Add dt-schema yaml bindig for J721E DSS, J721E version TI Keystone
>> Display SubSystem.
>>
>> Version history:
>>
>> v2: no change
>>
>> v3: - reg-names: "wp" -> "wb"
>>     - Add ports node
>>     - Add includes to dts example
>>     - reindent dts example
>>
>> v4: - Add descriptions to reg, clocks, and interrups properties
>>     - Remove minItems when its value is the same as maxItems value
>>
>> Signed-off-by: Jyri Sarha <jsarha@ti.com>
>> ---
>>  .../bindings/display/ti/ti,j721e-dss.yaml     | 209 +++++++++++++++++=
+
>>  1 file changed, 209 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j7=
21e-dss.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss=
=2Eyaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
>> new file mode 100644
>> index 000000000000..cd68c4294f9a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
>> @@ -0,0 +1,209 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright 2019 Texas Instruments Incorporated
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/display/ti/ti,j721e-dss.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Texas Instruments J721E Display Subsystem
>> +
>> +maintainers:
>> +  - Jyri Sarha <jsarha@ti.com>
>> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
>> +
>> +description: |
>> +  The J721E TI Keystone Display SubSystem with four output ports and
>> +  four video planes. There is two full video planes and two "lite
>> +  planes" without scaling support. The video ports can be connected t=
o
>> +  the SoC's DPI pins or to integrated display bridges on the SoC.
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,j721e-dss
>> +
>> +  reg:
>> +    maxItems: 17
>> +    description: |
>> +      Addresses to each DSS memory region described in the SoC's TRM.=

>> +      The reg-names refer to memory regions as follows:
>> +      reg-names: Region Name in TRM:     Description:
>> +      common_m   DSS0_DISPC_0_COMMON_M   DSS Master common register a=
rea
>> +      common_s0  DSS0_DISPC_0_COMMON_SO  DSS Shared common register a=
rea 0
>> +      common_s1  DSS0_DISPC_0_COMMON_S1  DSS Shared common register a=
rea 1
>> +      common_s2  DSS0_DISPC_0_COMMON_S2  DSS Shared common register a=
rea 2
>> +      vidl1      DSS0_VIDL1              VIDL1 light video plane 1
>> +      vidl2      DSS0_VIDL2              VIDL2 light video plane 2
>> +      vid1       DSS0_VID1               VID1 video plane 1
>> +      vid2       DSS0_VID2               VID1 video plane 2
>> +      ovr1       DSS0_OVR1               OVR1 overlay manager for vp1=

>> +      ovr2       DSS0_OVR2               OVR2 overlay manager for vp2=

>> +      ovr3       DSS0_OVR3               OVR1 overlay manager for vp3=

>> +      ovr4       DSS0_OVR4               OVR2 overlay manager for vp4=

>> +      vp1        DSS0_VP1                VP1 video port 1
>> +      vp2        DSS0_VP2                VP1 video port 2
>> +      vp3        DSS0_VP3                VP1 video port 3
>> +      vp4        DSS0_VP4                VP1 video port 4
>> +      wp         DSS0_WB                 Write Back registers
>=20
> I guess it applies to all your schemas in that patch series, but you
> could just do something like
>=20
> reg:
>   items:
>     - description: DSS Master common register area
>     - description: DSS Shared common register area 0
>     - description: DSS Shared common register area 1
>=20

Ok, thanks. I was not sure if you can do that (still a newbie with
yaml). What do you think about Peter Ujfalusi's suggestion of putting
the descriptions to reg-names (and clock-names and  interrupt-names)?
e.g. something like this:

  reg-names:
    items:
      - const: common_m
      - description: DSS Master common register area
      - const: common_s0
      - description: DSS Master common register area
=2E..

Or is that even allowed?


> ...
>=20
> That way, you wouldn't have to worry about the maxItems, and you end
> up doing pretty much that already in the description
>=20
>> +  reg-names:
>> +    items:
>> +      - const: common_m
>> +      - const: common_s0
>> +      - const: common_s1
>> +      - const: common_s2
>> +      - const: vidl1
>> +      - const: vidl2
>> +      - const: vid1
>> +      - const: vid2
>> +      - const: ovr1
>> +      - const: ovr2
>> +      - const: ovr3
>> +      - const: ovr4
>> +      - const: vp1
>> +      - const: vp2
>> +      - const: vp3
>> +      - const: vp4
>> +      - const: wb
>> +
>> +  clocks:
>> +    maxItems: 5
>> +    description:
>> +      phandles to clock nodes for DSS functional clock (fck) and vide=
o
>> +      port 1, 2, 3 and 4 pixel clocks (vp1, vp2, vp3, vp4).
>> +
>> +  clock-names:
>> +    items:
>> +      - const: fck
>> +      - const: vp1
>> +      - const: vp2
>> +      - const: vp3
>> +      - const: vp4
>> +
>> +  interrupts:
>> +    maxItems: 4
>> +    description:
>> +      Interrupt descriptions for common irq registers in common_m,
>> +      common_m0, common_m1, and common_m2, sections.
>=20
> Same story here, but the names don't match interrupt-names. I guess
> describing what those interrupts actually are would be great: you just
> define how the driver calls them, but not what they are actually doing
> or representing.
>=20
> I'm guessing that would end up in something like that:
>=20
> interrupts:
>   items:
>     - description: DSS Master interrupt
>     - description: DSS Shared 0 interrupt
>     - description: DSS Shared 1 interrupt
>     - description: DSS Shared 2 interrupt
>=20
> Maxime
>=20


--=20
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


--5pmhAxlWnc8hbbeJiFxw5k5ShGwaMHvg1--

--lvnmzd5MQJeWgjpGHrk5fUt4U9udObU1W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEMuwitgUoIEsi53ohkDazUNfWGUEFAl37gvYACgkQkDazUNfW
GUHD7hAA4F+jUC0zMFknujFq9bdfIDsncuO1m6FxZ3B4momsVeafI6VjXeoWjiNa
W9IodFTCqvbQP8h0HMY6E0Hv+cZWlhk+IMMF7r+I301uX+qEFeEgU2sI/EYfCYC+
BQcDtwjgU6nGbRzW36XDjQ4WO5YFV/ePP0ZSkDqmV4l+kKfso7bXPmIqWd6X8r+E
R5Z+KhKnkdyEaA+Ha8QRumnnKIku0jndR6AsbGNzOcEIZ/FMm7jlc3CAOmGL8R2p
y8iHp5sXpbF3Ewfxwj+imNf9VoCCsuvzlL8cugqJnhLa4A6EsY0JnGM2Su3IdrER
9krrROjJCDL69zW4Px463gO0T2suan9/t11ynH+z4Jj2B280ppGaqlGwMPbw5MAq
cyrTzsgNZwZj+xqWjdQO+GbSdduNCO4MmyTlmxfjbMGjRSCT0FSSo8AFpgXJ3gkt
/TL6n8qdUo5Pw13OI9t1Jg87/XeoipFTOMfJ2b64RMiSRG+Pc4DHZkTUyWUCIxQ2
oXTMEapnVljsM1Dzi5nGfgzVMtLLnfLBzNsvgLqhIxV9H3SzxoLM/KPEaZUqPlah
t3hbT+zl59DHZRrJtEhujgAX+Q4s3HK/65Wi97jedKd7cnwYW5gIDfS2BxPMtLdV
GpA1RlF+iC215KhV9rc5cURvSMoVRHj34KwkKzHhI02MuqzcfHE=
=s4ax
-----END PGP SIGNATURE-----

--lvnmzd5MQJeWgjpGHrk5fUt4U9udObU1W--

--===============0410972296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0410972296==--
