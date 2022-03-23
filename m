Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EF44E589C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 19:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFEF89AEA;
	Wed, 23 Mar 2022 18:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2F389AEA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 18:43:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cY426Ntsq8mTVuPlGb3o77AfLMajoQRO13ITB0HYTnYlI7URT5jjPMS9zZAgK0LjNlrHW8rXO8T25TxrxBz5FoQ5sAIFVaik9ITqKhmodOanhm2R9UkC69eLdJm2s9788ilRlUYjdfdkWce6BENeaXIRz0TDATb18iaxpC/gf23LQTOQKUxOuTAgButtFIL/vTugOl4xiizjG4YYSACIicAv/M/roX7ckWleMi7bMwz+vS4+A/4ScTbM5HAtVHiYO8YyqacWiWUd8UY/yvrmTwJrGjwX8qDm6OmjCif0yW/ypca5QGf4VmqiwKmoq57I0ZL4ze82mxO7bGNFLsyWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4mfu2uIbUQlgoAHD00rEc8eOhrn46lAbO7LB44/W3E=;
 b=VmUlEE2SBQ6NoiVTF+PcMIPq+uaEQCC+J86w/uMTaq0P+mHaM5PLJw2q4pa8eNt+RlfFX635D1hTns0yOvQ8phPT/8ndVWWavkQtD0ZtGtD/+XZT7EzV7ZElbpbMfBE4r7xf00ckAgDkZVQ9x8Bce8oq5tBvJnH/cEJAHLOikPRS10ds2rWwykV/UKmQj4x0Rkfyrt0BejVFKBGgzLQfUCh11g/gWgbljNDNOa265gG90/3g+gyZS9cYLz4qWwMZS07p1QFkIGzRnx1QbzbhfOayXB7IKEYGm/MHA2s+uFO9lczucaOY15v9dMdLyHfSagIIAYhT+yAjc00FA9mnhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4mfu2uIbUQlgoAHD00rEc8eOhrn46lAbO7LB44/W3E=;
 b=Fwpw0PNGP7J868ZWA+LNwwykciRkIxVj7FBhKkKfHvkXsmgaMlMZVm04QrU+A7h918xqaXEkeHmMInNSJ4z6OeOOnf2rnDIRqVKcBFEgWtzqmZYchYDtyZxlnKsaq0F34N3SX0J+3Rga6gV2OzW2lvMnh9DH0PaqMAvj2h3euL4=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYAPR01MB4239.jpnprd01.prod.outlook.com (2603:1096:404:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 18:43:34 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::2c9d:7128:8d19:7a24]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::2c9d:7128:8d19:7a24%8]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 18:43:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Thread-Topic: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Thread-Index: AQHYN739eKkm02BV80+gG/89zR29V6zNVP+AgAABAfCAAAX58A==
Date: Wed, 23 Mar 2022 18:43:34 +0000
Message-ID: <TYCPR01MB5933D6C4D16F5C3454ADD7F386189@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220314161004.14765-1-biju.das.jz@bp.renesas.com>
 <20220314161004.14765-2-biju.das.jz@bp.renesas.com>
 <YjtkMxC0X7mMvMKX@robh.at.kernel.org>
 <TYCPR01MB593341D2E966F3C60ADAC8E986189@TYCPR01MB5933.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB593341D2E966F3C60ADAC8E986189@TYCPR01MB5933.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a990eabe-73d7-4f85-5dd9-08da0cfd0953
x-ms-traffictypediagnostic: TYAPR01MB4239:EE_
x-microsoft-antispam-prvs: <TYAPR01MB4239FFD7E249A84268D45A3B86189@TYAPR01MB4239.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RmvBrrOHtHEYxFU650yryZFEtXT6PuRbyH9NpmX61PsMaE4fHwjYhvkt94Eyk9lUbXdCMGfPEbi/OzHPdZEiU6QBUN2ErCA8d32/intLZhSTm0xPqXjjdUJytP66Q8X/KtHQ2lugG7WRLxjQJq8XNPQNZ2MW+6Pj+KXu1vZ3MUq6aWm/zGyuB6FId4/iwRRyfE1rXF0fuR61Mp7pbf0jkARgvnghXL0dlGZnV6P4c/5/QAyfPP3KAChE9HEKgN31ypdxYgaOJ+aQvB52YzXoJ6iftg7PCzgiPNkYQ77SGMQipT0xYjNdE8zVLPnetvw9i5zjXffYTtjnyLrWyQLq5MsGetwj17Bw6QoiPSRA/bGET8p1dYWUa6LmMREWpCHelbi1TjRo61fKWjfIGAMtTDu9lkY5HkxPv7XeNIzta2SpNipvMnYOqYbZl8lUt2pUOyj5OGpg8quBhmBw22xL0tlMYcaJSlTvJpIlvJW1YUb41ho2gaCQvV0DpbCacOFm2fm3CK0MNkyP1+j/RKKl8ohM/IYmYwuXJZAn+rPNN+BhR969cpeH/sGTVP8t+jVH4itpE3ZW7w9uipO//fGUi/kYIYG1PArSrbYXTOxBiqvw8x9kkVFzoj9sksU9PJjqvFNfSiRHbC3Q+5bT7xfWYVau+lfeQ3nZHJ1oDOLWyabT+LK7HKkUHkQ4+FXoQGEda4SWEJJsmPEugy718zKInQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB5933.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(9686003)(2906002)(83380400001)(6506007)(7696005)(8676002)(71200400001)(54906003)(110136005)(66446008)(66556008)(66946007)(76116006)(55016003)(64756008)(66476007)(8936002)(122000001)(4326008)(5660300002)(33656002)(52536014)(38100700002)(508600001)(186003)(26005)(2940100002)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dHEyP3slaOssb9GLmQqP4+75b27K93llvYmVyeluTAv0cKelAecRDnpK/KsU?=
 =?us-ascii?Q?wEte8bjKKfjirLoQUUUlLmTNiBxiJXLS6lrs3EyJmLRVorGndQ91nVq2z75+?=
 =?us-ascii?Q?N1YzhMzk7bvUnivcfuAhO2V5NGQShVluqD/RE+SnawLP+5MVcALdcWzmqhmf?=
 =?us-ascii?Q?DQkpdK11Rl0rZu0kjRcCVXjq7mex3JX+Xyk4qIfF6QPhilpvo648lSOtsd5R?=
 =?us-ascii?Q?qx5ThCfhLX++lJS1f1fLf870ZgVbxrkHLwSUocXeRPleJyryHU5qwB++p4Ux?=
 =?us-ascii?Q?j3qpA3TnRfqEEzzqhqX/D++EnACU7itd5lvNPbyewcley2wE4nfJOy9lS5GW?=
 =?us-ascii?Q?1TjY4PC+neF9tMwTa+ifcFkCRAxltfgAdcBMtS/tsfMjHdOdyCqqP8Mz3lp6?=
 =?us-ascii?Q?a/eftGUe9vJ6bQ+7crdZIJ73htNxSC8Ta6teORXg1VOF+tBjbmFQVx61EJXn?=
 =?us-ascii?Q?8VbJBC55Qv0JY0F1l2rcP0n3TYMqUOVHZCSwE5AVnMnI3K9I/F+q5mxXupyj?=
 =?us-ascii?Q?9uIKWUs2K2pCiHv5885q3PjIAPk6A0voxQk93CMvNxjYckUleu8hdclWz5Mg?=
 =?us-ascii?Q?5vv8zCrf81+HcmjSYtr5aRfbQYgqV0Nr+G2NwkKH4VtxwvBcPtkQJblXYkSU?=
 =?us-ascii?Q?b5gbQTOx/UoHSmCZFIRt32XBnJyNFfrI1/THANMSyx6yK0CD0v09kPHWE0rG?=
 =?us-ascii?Q?yFUf4k6jdETl/FEbNVULeJ1DLReYS88JjVjJhGM2cbTlSsPn7ZhCNzQX4sv2?=
 =?us-ascii?Q?mjSw2fHqL5GMaxMW4+ce1hQ0HS6oCGfptJ2UinesNorSaXR/3qnVeanGGs4F?=
 =?us-ascii?Q?5ofy9nciDWbiKTi4SqOWxEFmbpJWGY1QYNrFA3y2yASyJbmXKzqCUK+rUFDL?=
 =?us-ascii?Q?G0y0R1U44iHyI/e0bwNj3iGZKSNtKr8yvnv+pg6lO6azV2vlSJmZef+ChiUm?=
 =?us-ascii?Q?e8/cnOr633xh/9rzqd/iwqrGJoGhzGVnUXdJLqmcX5CRBlJIOJDMc8gzZHrW?=
 =?us-ascii?Q?ugvTnlBqvcB9oVL5xRwX3GoT+KoVr9vtlLJfLhTl2htyLP0iqHHkeT3O5aM4?=
 =?us-ascii?Q?K+uWKuwkxltGP3WUyQu2s95yOJ8DRfoYPQBykJOcyWbC+QkvQs64LBBEfS27?=
 =?us-ascii?Q?9JUVT8ypMKfZ8S4IAN1motd8Th15uw8O9QjVxuJvyv/ebJxFSMh7GW6h3s1u?=
 =?us-ascii?Q?CJJW0p8r5/k7rtqfxv7wyLiNik2ib6H3mcDOjkXH7vOt14omVgCkZdMe9SmS?=
 =?us-ascii?Q?Rhdt+tfDh/xYdXCKwOHwjILWOj0xJn9OgLG/1pC0a6ZazVUL3bWfjnOQY6R0?=
 =?us-ascii?Q?YjOzbXa8orcKiMEMGgijVT2D/1ZFqPk8ZMd68mxTHJx5pqceNSWC0AzJnnA3?=
 =?us-ascii?Q?jKmcei+V92CfMj5JREflr3HrMflqrdTWSjVYeKAYcgsjj7y0r9qKnEerGd4W?=
 =?us-ascii?Q?AUJDNpT9tizpXM99+i3yuzb8qGBVQ7/PNLs5VuIVeCu6hQrbOk2suA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a990eabe-73d7-4f85-5dd9-08da0cfd0953
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2022 18:43:34.8595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVBqeE37zbwsRDJBq/s1t0cFRjaoE/RaTp13DU85TLIMUgy/XND3S2vtsLmdHX0mYLImDHySafRrqGb86fhjRSAdqtDmLoW+GMhnbvPAMd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4239
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

> Subject: RE: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L
> MIPI DSI TX bindings
>=20
> Hi Rob,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L
> > MIPI DSI TX bindings
> >
> > On Mon, Mar 14, 2022 at 04:10:02PM +0000, Biju Das wrote:
> > > The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's=
.
> > > It can operate in DSI mode, with up to four data lanes.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > RFC->v1:
> > >  * Added a ref to dsi-controller.yaml.
> > > RFC:-
> > >  *
> > > ---
> > >  .../bindings/display/bridge/renesas,dsi.yaml  | 146
> > > ++++++++++++++++++
> > >  1 file changed, 146 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > new file mode 100644
> > > index 000000000000..74bc3782d230
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.y
> > > +++ am
> > > +++ l
> > > @@ -0,0 +1,146 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +
> > > +title: Renesas RZ/G2L MIPI DSI Encoder
> > > +
> > > +maintainers:
> > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > +
> > > +description: |
> > > +  This binding describes the MIPI DSI encoder embedded in the
> > > +Renesas
> > > +  RZ/G2L family of SoC's. The encoder can operate in DSI mode with
> > > +up
> > > +  to four data lanes.
> > > +
> > > +allOf:
> > > +  - $ref: ../dsi-controller.yaml#
> >
> > Full path preferred:
> >
> > /schemas/display/dsi-controller.yaml#
>=20
> OK. Will fix this.
>=20
> >
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - renesas,rzg2l-mipi-dsi # RZ/G2L and RZ/V2L
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: Link register
> > > +      - description: D-PHY register
> >
> > D-PHY is not a separate block?

Got it. I will model as a single block.

Regards,
Biju

>=20
> Basically D-PHY is integrated inside MIPI-DSI Tx module.
>=20
> MIPI-DSI Tx module consists of MIPI DSI-2 Host controller (LINK) and MIPI
> D-PHY Tx(D-PHY).
>=20
> That is the reason I have modelled like this.
>=20
> Is this model ok or am I missing something here? Please let me know.
>=20
> >
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: DSI D-PHY PLL multiplied clock
> > > +      - description: DSI D-PHY system clock
> > > +      - description: DSI AXI bus clock
> > > +      - description: DSI Register access clock
> > > +      - description: DSI Video clock
> > > +      - description: DSI D_PHY Escape mode Receive clock
> >
> > D-PHY
> OK, Will fix this.
>=20
> Regards,
> Biju
> >
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: pllclk
> > > +      - const: sysclk
> > > +      - const: aclk
> > > +      - const: pclk
> > > +      - const: vclk
> > > +      - const: lpclk
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    items:
> > > +      - description: MIPI_DSI_CMN_RSTB
> > > +      - description: MIPI_DSI_ARESET_N
> > > +      - description: MIPI_DSI_PRESET_N
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: rst
> > > +      - const: arst
> > > +      - const: prst
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Parallel input port
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: DSI output port
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +
> > > +            required:
> > > +              - data-lanes
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - power-domains
> > > +  - resets
> > > +  - reset-names
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> > > +
> > > +    dsi0: dsi@10860000 {
> > > +        compatible =3D "renesas,rzg2l-mipi-dsi";
> > > +        reg =3D <0x10860000 0x10000>,
> > > +              <0x10850000 0x10000>;
> > > +        power-domains =3D <&cpg>;
> > > +        clocks =3D <&cpg CPG_MOD R9A07G044_MIPI_DSI_PLLCLK>,
> > > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_SYSCLK>,
> > > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_ACLK>,
> > > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_PCLK>,
> > > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_VCLK>,
> > > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_LPCLK>;
> > > +        clock-names =3D "pllclk", "sysclk", "aclk", "pclk", "vclk",
> > "lpclk";
> > > +        resets =3D <&cpg R9A07G044_MIPI_DSI_CMN_RSTB>,
> > > +                 <&cpg R9A07G044_MIPI_DSI_ARESET_N>,
> > > +                 <&cpg R9A07G044_MIPI_DSI_PRESET_N>;
> > > +        reset-names =3D "rst", "arst", "prst";
> > > +
> > > +        ports {
> > > +            #address-cells =3D <1>;
> > > +            #size-cells =3D <0>;
> > > +
> > > +            port@0 {
> > > +                reg =3D <0>;
> > > +                dsi0_in: endpoint {
> > > +                    remote-endpoint =3D <&du_out_dsi0>;
> > > +                };
> > > +            };
> > > +
> > > +            port@1 {
> > > +                reg =3D <1>;
> > > +                dsi0_out: endpoint {
> > > +                    data-lanes =3D <1 2 3 4>;
> > > +                    remote-endpoint =3D <&adv7535_in>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> > > --
> > > 2.17.1
> > >
> > >
