Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE504E585B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 19:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5085110E061;
	Wed, 23 Mar 2022 18:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5C710E061
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 18:26:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aK9MEcwTy5MshxUedVDEkWr2rh/JzAtw+4X7lQWW5uQpaYUcZrvZkWXGARimHBiPZWFBZxW1BRsxRTSG9yQnNQzqzX+UtxVU3n/kFIeUsrN8ZVagk/xL1xXm7Ak1s1iZ0L75hqcCYwWCAAPGndayNFTLRUBOsuFwL+sCrvLnQY8CNfrURgLuyTOzyulIHLKf7KA59keKNZUhmPfGWK4k7RrrR23BXjbTWChrph4DVg0/c/SXicAYH0rlOfSrR7yr30M8falD26M2dw8NJRsWGqo4o87Ztmaf+mwnJCmGCZL0d97CdHqjbPnPQOoXqahKFX0wxwhpleKyIEBc9CEBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DhOY2/sIpJnoMqUyKSt4WTpmoo3pG5jHqNtQKmzlPk=;
 b=So6RYR2ZRx+jjjsWX3AL0glSed4OZtWfacmYNJwQYNP7tPeSSAMKaXupJ8yo1ptE3uUzzsJsuIMwUTR/GA0WnF3FUekjrljTBI8VaJtGO59Ks1jANeil+RIflPwvIuv1j5XFpzyabUZn1q/Thy8EfDUKyeUMhxjkTAvL6POHV3cElL9UfiQYi6CbUEx0q278mksJWdeqbdNRyVAJsGQItz0LH6/o3in59iz7KP0Ml80cKI6Q4/4VmoKJpWIaBE5xxLn2pYqu5do/VN96jQn4j5zVJVa+jhdV3MMgjrxwtPQ1pWnRZ9nFsynu4KbOZoSAaMBp2Y0NwbtNo+dDn68llg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DhOY2/sIpJnoMqUyKSt4WTpmoo3pG5jHqNtQKmzlPk=;
 b=XTSqWuibHDYblDQRxQRj7vJrsgTe2dqUfdVkl7U9arJEGYEKXm1hWwbb2/NALXfbZhKjZCNETBgGwv/bZCfTRP0TCKl1+NbochfK0A0zEH1k/861xoE1sY0fXdLPXrVraHMDjqcI6Eb3flfQrzIwZhHDlKDJ+EBYXGvbDJI80G8=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OS3PR01MB9382.jpnprd01.prod.outlook.com (2603:1096:604:1ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 18:26:31 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::2c9d:7128:8d19:7a24]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::2c9d:7128:8d19:7a24%8]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 18:26:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Thread-Topic: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Thread-Index: AQHYN739eKkm02BV80+gG/89zR29V6zNVP+AgAABAfA=
Date: Wed, 23 Mar 2022 18:26:31 +0000
Message-ID: <TYCPR01MB593341D2E966F3C60ADAC8E986189@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220314161004.14765-1-biju.das.jz@bp.renesas.com>
 <20220314161004.14765-2-biju.das.jz@bp.renesas.com>
 <YjtkMxC0X7mMvMKX@robh.at.kernel.org>
In-Reply-To: <YjtkMxC0X7mMvMKX@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cd013b6-21b1-4f32-08ee-08da0cfaa782
x-ms-traffictypediagnostic: OS3PR01MB9382:EE_
x-microsoft-antispam-prvs: <OS3PR01MB9382A18D32A8B3BB7A199E2686189@OS3PR01MB9382.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kBJvKI1Kgr5ww0xxb+6ids2HVRgUM1OYz+DtC7GpNgV3Exv578T58JPTdqtww3MxseERC6jBqAN1O4bwA81OVaiYJVqX11+eA/smJa1fSo7SvHcNfWvpPz8A6VnLedQg257MbUcPAs/K05F6V8Eo+wQ/34+zQV/9V67I6xEq/Wx0ZGC7HeBKGtVPpgnw68g+0OXEwI82Z6zaC8w7Zt+xbU4ey30Wc4IbBbCHj0sO9HPQhblnhrPdLaZGKAGHG6sAPR7HzRbZfOf1CrXr4ZUI1pGVdQdCBur5ptjuSa83hvwX+WVR3WnY2VxQKnoE+GIqEqK+Q57s/dzEFYY7hpVIsYpzSUi7P8o2hIgnyY9xpLhnvdLiaaTbKBG7fiMT+LU2oXLgdqgo9LkQOSU919Mx+wdE0/Mf/1O8SiDzJMXAa4iVPSC8Ht09i25c9XyiXg3bZfoenq6TAsUOWQ3Z0u6V4SYf6Rlrs7PNJ6bBDb2+wQp7gdQmIDBwMRqQjjXRaIp4Dk5GlTJ41uYaAXsm3YiYfGs8QXbfSSHNDH4vKclVRUZZ2m/phrmyCba5+GD6XJneEi6plLh705AvEsRyicHXSQIwg3AfKyTrjFSLt5WY21KoF9CYDDlfPNKLQntdONZS5xdTaGkmbNNlBZk+1aTN6+dJ+tPJ7hSfmWoYon52uI1ya446nAGcBMOVqjW4W5fnfinPEeLeUQlNsWy/6dox4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB5933.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(52536014)(38070700005)(508600001)(8936002)(71200400001)(33656002)(4326008)(64756008)(122000001)(5660300002)(8676002)(316002)(66446008)(66946007)(2906002)(38100700002)(86362001)(66476007)(66556008)(76116006)(6916009)(54906003)(83380400001)(6506007)(9686003)(7696005)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4Xb36G7rd19caPXnlfkYtZaDjh3mj6CR8mFZRrP/THSxmH7fjtMFS7dPN3bP?=
 =?us-ascii?Q?QvUWda3l7dJW7hwhLgXqeq9Q7KxTdjAMrzRw/j0NSEkFYrT9/lzlnzhkIwog?=
 =?us-ascii?Q?H9GNpJjri6WJnucJACYSkE+IldqP/TshFRsqq1yQAcQgJz16RYBZsnFMXs3y?=
 =?us-ascii?Q?52oHGLdbS5M3x8AmAA/cpPTDrqZywMHSLhFf4x/CyiULEsY7/c//xa0czaqk?=
 =?us-ascii?Q?jpX1QcWLTEh4koGemkz16oNHws1QeEKQlwnIYUa+PWwJBc+OJyyl3pVtU7EE?=
 =?us-ascii?Q?BDebmFxR45h/u1kfg76A2P6EAu1ySNDszAjVHC6iwzWFPb/lL6VkV80YjFpf?=
 =?us-ascii?Q?JmVr61BZfP5YDkG2cKDnZPMuEbnzKJqyEZqGkU2HaKDY2IHthkG6KDTw3hfI?=
 =?us-ascii?Q?Trq9pkSg756nVEjXYp2/c7IWmG9w9XDe1CCCPUrV17+KDOpoqBTR8cCAsYax?=
 =?us-ascii?Q?Zo9d205PqD3OD0W9fScrVJdB/roeqCzDlpcr9MF5K99W9wz4WgzFEIZkA418?=
 =?us-ascii?Q?OgTO+XYwZ7MChCSyqqm3Q3SCcoVFzf2Wb3fY0CJDc3WhvDtpll7vY+Ba03OD?=
 =?us-ascii?Q?302ZFkGo0d6wW7YxRaitf+jUXO+cL1IlveJFRxKg9O35cPcpuEFWfMn/Vxfn?=
 =?us-ascii?Q?EKIKsj5R4Bq2OQ4tYGCwlkK2Jtk/tHozI4O3UXq4M8Zx0JwwhqgKDmnzxXNC?=
 =?us-ascii?Q?gW9xtiqri66jsuUuuUzbd+NhufdbfgX2wLPNJbl1ydIykYTSAucG1B2jHmfj?=
 =?us-ascii?Q?jwwnGNLRj+LjCQ0Y1QnPLKMKKf50oxrGPd7qMzJWZXDWat9ZBkq2NaaqJVzE?=
 =?us-ascii?Q?mEleRh2PFu0q2gNLuL8B27+OyciJHRKnjvdb7gAeTQ09eDn8V5RC0OZrOZfi?=
 =?us-ascii?Q?iC/Cs57U0AeERozbQMcAOHhGKkjLTD2G6nkz0ph2xIcMHqHv79TvekrWoLF9?=
 =?us-ascii?Q?vui0lkZA24hvoK5GDD//+i3A5GEY90DCALdkRRXpmdDBq4EUyFITUJ/xbV9n?=
 =?us-ascii?Q?TFDTWx7+EwmpZibthFce4JaV/iGHES8hFc5C62ufimhu+/hhBAeSLWDvkLkK?=
 =?us-ascii?Q?ulHUCizRHdLFo124DBCdDvBaS8LOjCJea5sFO9UbKZ1mvIZeRQrZFTgYcgv7?=
 =?us-ascii?Q?PMPCoyK2JTk1GkRbqdvtfVGuIofiA2owOduSgZpEBg62ywByOZpOhY63D7gx?=
 =?us-ascii?Q?t3SAiRYVQtzfmbYKxfaD7nsnfkjeBExAKoR35Zwq1Re7riV0g6a8P7uyNmsp?=
 =?us-ascii?Q?RCJ+/rugw6hQSinRB9fFjhdvpnICJIpZ4zTN547Zey4UC3DR8jRCXlJonSoi?=
 =?us-ascii?Q?c6r+9UwnfF315dKnOU5spa038jYmmMy9oCZ2IkYa20GQm9HNED61GQDcQT04?=
 =?us-ascii?Q?nmyyFEdRypPRJc6c/SiwJv9cja1pxCwPnze8mNHKkHEK+9kzN7AXlCNX014F?=
 =?us-ascii?Q?TWefYSe3oEHV/2Ubn24KnDH0t7e0Jg6on00aqBFwFpHct5cRBJTBLw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd013b6-21b1-4f32-08ee-08da0cfaa782
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2022 18:26:31.7165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cX2Ci8rDrsGtgUcZgKrwZ7WYGYL/yJsDsZMCoOPWyE6OFfGQwdxBnXYQMLMQGoYLhcJ72pa/YpjIPU6D+M61bC/xfL1OSptf7wWXTqO3EHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9382
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L
> MIPI DSI TX bindings
>=20
> On Mon, Mar 14, 2022 at 04:10:02PM +0000, Biju Das wrote:
> > The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's.
> > It can operate in DSI mode, with up to four data lanes.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > RFC->v1:
> >  * Added a ref to dsi-controller.yaml.
> > RFC:-
> >  *
> > ---
> >  .../bindings/display/bridge/renesas,dsi.yaml  | 146
> > ++++++++++++++++++
> >  1 file changed, 146 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > new file mode 100644
> > index 000000000000..74bc3782d230
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yam
> > +++ l
> > @@ -0,0 +1,146 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +
> > +title: Renesas RZ/G2L MIPI DSI Encoder
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description: |
> > +  This binding describes the MIPI DSI encoder embedded in the Renesas
> > +  RZ/G2L family of SoC's. The encoder can operate in DSI mode with up
> > +  to four data lanes.
> > +
> > +allOf:
> > +  - $ref: ../dsi-controller.yaml#
>=20
> Full path preferred:
>=20
> /schemas/display/dsi-controller.yaml#

OK. Will fix this.

>=20
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,rzg2l-mipi-dsi # RZ/G2L and RZ/V2L
> > +
> > +  reg:
> > +    items:
> > +      - description: Link register
> > +      - description: D-PHY register
>=20
> D-PHY is not a separate block?

Basically D-PHY is integrated inside MIPI-DSI Tx module.

MIPI-DSI Tx module consists of MIPI DSI-2 Host controller (LINK)
and MIPI D-PHY Tx(D-PHY).

That is the reason I have modelled like this.

Is this model ok or am I missing something here? Please let me know.

>=20
> > +
> > +  clocks:
> > +    items:
> > +      - description: DSI D-PHY PLL multiplied clock
> > +      - description: DSI D-PHY system clock
> > +      - description: DSI AXI bus clock
> > +      - description: DSI Register access clock
> > +      - description: DSI Video clock
> > +      - description: DSI D_PHY Escape mode Receive clock
>=20
> D-PHY
OK, Will fix this.

Regards,
Biju
>=20
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pllclk
> > +      - const: sysclk
> > +      - const: aclk
> > +      - const: pclk
> > +      - const: vclk
> > +      - const: lpclk
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    items:
> > +      - description: MIPI_DSI_CMN_RSTB
> > +      - description: MIPI_DSI_ARESET_N
> > +      - description: MIPI_DSI_PRESET_N
> > +
> > +  reset-names:
> > +    items:
> > +      - const: rst
> > +      - const: arst
> > +      - const: prst
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Parallel input port
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: DSI output port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +            required:
> > +              - data-lanes
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> > +
> > +    dsi0: dsi@10860000 {
> > +        compatible =3D "renesas,rzg2l-mipi-dsi";
> > +        reg =3D <0x10860000 0x10000>,
> > +              <0x10850000 0x10000>;
> > +        power-domains =3D <&cpg>;
> > +        clocks =3D <&cpg CPG_MOD R9A07G044_MIPI_DSI_PLLCLK>,
> > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_SYSCLK>,
> > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_ACLK>,
> > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_PCLK>,
> > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_VCLK>,
> > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_LPCLK>;
> > +        clock-names =3D "pllclk", "sysclk", "aclk", "pclk", "vclk",
> "lpclk";
> > +        resets =3D <&cpg R9A07G044_MIPI_DSI_CMN_RSTB>,
> > +                 <&cpg R9A07G044_MIPI_DSI_ARESET_N>,
> > +                 <&cpg R9A07G044_MIPI_DSI_PRESET_N>;
> > +        reset-names =3D "rst", "arst", "prst";
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +                dsi0_in: endpoint {
> > +                    remote-endpoint =3D <&du_out_dsi0>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +                dsi0_out: endpoint {
> > +                    data-lanes =3D <1 2 3 4>;
> > +                    remote-endpoint =3D <&adv7535_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > --
> > 2.17.1
> >
> >
