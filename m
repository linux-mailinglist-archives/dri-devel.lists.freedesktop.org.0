Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35414496C02
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 12:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840B510E181;
	Sat, 22 Jan 2022 11:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA7B10E15A
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 11:19:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAWGH9fJLdhw1M/GyDm8uvPlUUwHeRFBaArt0Oxw9rtUBAUUBkKshErjqu2zYh3DWJM2PG9mqHhZcAwYLguFAzvHYhb2nNK6t9GjPLmlKOaZKekBGNjhN2jZ18mpexndrOmdw4qS1ipp+zVcpzSOojfioghVVphQp4vOS+faSLq0oQJO0MUJQPGUGKsdTD/pn5p+SCrNHC9rYQZWNRUK2Zj8yYYaX8vViDb5pPlFw1JySnGksLGFnlncMwSwkK9/lhvtQVeiPXs4lf8HlJd9/cztVxlGRXGvOAb1cBifa9cwn11bu2ddQc6J1+/aJYgvh8gk3WNX1B+5LJwh9saWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3eKSs3UuOPu3jmydUSW/MiGOn1E+xYO02rBWZ/oAr4=;
 b=LnD2pmBj4DgvNsYFiBYwWTZktMox3V8TzImtcOaEXQUdaePFJheuRQiOg4zHzDRFvN5BbFVLGPgE6fdhj4qjZw4CbIkwGdueqg3oTclmvOfydE1cIGF1BUjj0Wq41YpBTDjTE0I7b/7OuuJIIxLp3jXS0qkG/csfiFC2zPsXwl9ambtJXBTD1q/MWvO+phcIxSx6E/fHCye7HBuSlNRaWMCs/sLaXA0A1k6LWJIeJdMOatZPWT5IUSyGWuCSnCy7GrV1C7w1g6TVtkNe6MPeFj6hHOuR7w0sGQrXMqoavaw67WqRHOBYjZyW/fbOMySTirdWv+4LyGme8gnclAW5og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3eKSs3UuOPu3jmydUSW/MiGOn1E+xYO02rBWZ/oAr4=;
 b=wh8JOKoLZCveQ5B9G5N+WsNyV7XscPuGrKj3+LthLk9q8u7O4tyb9y3jnhJtnZE4m0xdlFeKYZJE3Rs48Al/Q0FHz2fxfICFNNBpqbfKXIxxm2F9VvJwbfwF+sz9KOaqkugeFh54QIKnc1y72uay7aNLyu8KT0LRkubSNdM9Uqg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2881.jpnprd01.prod.outlook.com (2603:1096:603:3d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Sat, 22 Jan
 2022 11:19:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4909.014; Sat, 22 Jan 2022
 11:19:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [RFC 21/28] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Thread-Topic: [RFC 21/28] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Thread-Index: AQHYB9xwKtuS5FnnqUCQPdyyYKspOaxuSG8AgACqC4A=
Date: Sat, 22 Jan 2022 11:19:12 +0000
Message-ID: <OS0PR01MB59225EF96BB3EAF84AB12B14865C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-22-biju.das.jz@bp.renesas.com>
 <YetYPCwJeVMAO+6F@robh.at.kernel.org>
In-Reply-To: <YetYPCwJeVMAO+6F@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3615ce57-4730-444e-de9a-08d9dd9904d4
x-ms-traffictypediagnostic: OSAPR01MB2881:EE_
x-microsoft-antispam-prvs: <OSAPR01MB2881BF3EEF633EB519198520865C9@OSAPR01MB2881.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WI+H4yYNAsHWPMCimz2V8q1KXs9z0oMU9vwW3Urkvb6uv/qBVKsQnzkSUDi0gdzED14q2iljq5bIgleS+4dXzryFj0O4gHvIVIPi+WRXi9Hilapz62nB8iM5JPpib8akvHzTpCEd8+hs/R8CdXi6xV2kD+Vonj6ilTEGKJYYDtWGTURAlM4ubKsNc3DU2pu2WIOKEPs3Sx3S3FpLH8sCew1xLS36MhMOBoVx7PadguxZTzHdSDvHGtVSPg4V2LDHUkosjO403u6tJacQjoJwh6HnEZopo3YNUvYquA53RBq10XZJ3xEXNM0Lutwc2t7vQdkOj7gelF5W+7EdKE9QOtmevXr8gtv4A96aKzSWg7ePBLz1TP1Iyfz5MN9wsFkV2BxmJ3E6PUaODYHN1BmYltqyqd7WQMIxSQY0cAeaFQGYLd8uHUL2RpsbwmoY/xLTTz3N+Pe9bSSTOQO+bFpSk6Ksct/tMm6+TLKs1/x6gxx/Q46F3TrNZI1Jee+3ZQK0+HMENVF8Gvf6Imvo15YmrX4W8XpFrN7dVmDTlKU2IqwInqaQir6Yy4laSBqXH2H8+U7jQOteRp3oEERKvL1OQ/pgTj9SiLsnJASRJIgYpshACmziyA88iSU+NyESO6EqcvYV/MCNzmaqW9Cyo+nEP21kbhFafpFMnlNMOnN7/GIoaPzPWmoGhtcxCDfIzPnOCvY25HBD8Wrr6gl9CYxg6di/UMdA1mAxfpI6h+r5hQHVTFf7rNoJRvpA/K3D/CIYkOe+LSOWYYRZE51MIsGGjnOpUSiZ3wkyrl8xiGH68lU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(8676002)(54906003)(6916009)(66476007)(66446008)(66556008)(66946007)(64756008)(8936002)(76116006)(2906002)(122000001)(71200400001)(316002)(38100700002)(55016003)(6506007)(4326008)(52536014)(83380400001)(86362001)(33656002)(186003)(26005)(7696005)(508600001)(45080400002)(5660300002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a+aWwSpXC/qW3FqcVwBEgZGJ/ZTZEHpayN1G90PygmLOSLNBkC3fy+VbOXRj?=
 =?us-ascii?Q?04gM8og8Wey+LOSubvmXhOL04QbCnaAjqK9uEf6uF9+Y4gwvL9TDch8UzzUh?=
 =?us-ascii?Q?ITavYnzQPVStuGST+ugyeKEaVhoC9POqhxs71mKq8EQm3w29DQbV6E8AsQWd?=
 =?us-ascii?Q?hfa3X/BS5fP4rzhtYCpnTYS4TedOEBDXr90flpaFNjlVybdC81veZQICXLqT?=
 =?us-ascii?Q?kkpQ1qRCI6hq8voE2ibXIv6S81vMnvcO5ixDir/OBzb+rXDdDNXVSmviD0KL?=
 =?us-ascii?Q?bH1Ztiv8nhQdW4emrTt9SbG5Dkwp1gu0mtvXQITToSB/diFSX3S054bZJi0R?=
 =?us-ascii?Q?k0Qr0nR9D3v9Y0hYunDTz6iyS7zdJfgx7ZO71yJKC7hT3CVSpffRksblRAjM?=
 =?us-ascii?Q?PrwhPjfs/7LYLsw7fFAfYLa6DWyxEvDXK42ayXrI+AxXMxkXwCGBNguRZThQ?=
 =?us-ascii?Q?xAKp8uEclJWToltJMU86VZ1ciLxR0mfIk9AENEd2JZ9+7sMoEnu4PdECjSKs?=
 =?us-ascii?Q?Ef0rNpSFfimacDl7K3mIOmvQ0Rcz6B6KT6XrRfEUrReacRX6m+/TCHU3ZAW9?=
 =?us-ascii?Q?nE8Qud+Wg5/CXHRPU7FeDXovC4dX7ZSA3ZLYwSDTa9KlXY6vCgIRw+LZ0YjI?=
 =?us-ascii?Q?48HAHnlBJvYrvH1rrHaEVxT8NK1vd4q9ImyKf//Z5FCK3fu/lpd/qGI2R7fE?=
 =?us-ascii?Q?sD+XDJRHqx3gSgJY+xZNVJbLiLjmVr5pnrWar9W5FpTZRPgjj0P6vDdIe5CK?=
 =?us-ascii?Q?ZIUCGZwbeLx1duvVKxwHUy+hZSFGYf9AANgpT3AvIgbQZs6rlzJlcX/ocsjs?=
 =?us-ascii?Q?i5iSDowJ/js2T6Ma90AfHXG7tvRb5nAlUsqxFTZ0KxDuvbsj3OVMSmrF5uty?=
 =?us-ascii?Q?jc/gf5y04jy7m+QspvR9VGXGI05fv1WZKa+kAuVK1q3nUcdw1oVVwPrzmxSA?=
 =?us-ascii?Q?OZkhhBhlARn25EGrpQDPoqmaAi0AU2l0pR2W6kO6SfkaDKqi+fD7DDf+AXub?=
 =?us-ascii?Q?hz/6OG45onWZ8FTwp0KdH4b9GmYd36zIp5G41d8v0Z81ewomu1cd4sQuPuRz?=
 =?us-ascii?Q?8Yi0SuxyLW0Y3SWObcRh7Tu5LB5/Xq2rEedwJjPDPHsfckD8nG8Puqg9L6C/?=
 =?us-ascii?Q?ZY2yNeNGHP91ZSHPTb4zI6xpx3erZJQqpCTyaauG2lEUlA4LLC8jQJZicIyu?=
 =?us-ascii?Q?LgDGF0r498kN8d6FuPND1uMOf98JYl4zK7CofuFrbZSJzJiODiElrrpWFQqw?=
 =?us-ascii?Q?m6saQDxpeBlb8KKqxD30iBa/Lb1+RdtgKw2JSjCvl9GxIGMfRODXYvZtc368?=
 =?us-ascii?Q?ktpndj+z7FlpLfgrN3+tFqLnpzuebSQc2YsEyIqdqxOmU0td+Fe8pU+oEmDB?=
 =?us-ascii?Q?hwcRaRvYTx4COnevF+FiqRzLYmsd8ODoDbNF/PySuwRQz2S3evYuNHgFYqFz?=
 =?us-ascii?Q?dfxDooY8j/q7BpWhiK2fMeJx1UncmnsGpO6nNw6CvnCZAX7Z0dK+raGWNWbV?=
 =?us-ascii?Q?CghHIoCFv5XrXz8GGP0LsVwznJ4+Pyib/ttBEybtH7M772wEskPhJm//D1o0?=
 =?us-ascii?Q?9Fs2x38SLg90ewdjikryuxIyIsemMlgqMphya6C+d3XnBbcYQi1pW5xt3SAh?=
 =?us-ascii?Q?DARY3s+8UMO6UksBVRxUAPh00bbgxWtP1q+Gq9p8kLJsa+W8O4MURGtnwCTb?=
 =?us-ascii?Q?JbTe7A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3615ce57-4730-444e-de9a-08d9dd9904d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2022 11:19:12.9649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QGgbogDfDKG7O9oZRgMTu7ydWuVhcJXJn1nNdwsyA80bqVaoUdOBQocm0KeY+fHTo4JaT3BESa5xU1UiXnP7s9GiFcCntzyHbMF/xaj9EHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2881
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

Thanks for the review.

> Subject: Re: [RFC 21/28] dt-bindings: display: bridge: Document RZ/G2L
> MIPI DSI TX bindings
>=20
> On Wed, Jan 12, 2022 at 05:46:05PM +0000, Biju Das wrote:
> > The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's.
> > It can operate in DSI mode, with up to four data lanes.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/display/bridge/renesas,dsi.yaml  | 143
> > ++++++++++++++++++
> >  1 file changed, 143 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > new file mode 100644
> > index 000000000000..8e56a9c53cc5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yam
> > +++ l
> > @@ -0,0 +1,143 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +cetree.org%2Fschemas%2Fdisplay%2Fbridge%2Frenesas%2Cdsi.yaml%23&amp;d
> > +ata=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7C0494a54e80ad4334fbd208d=
9
> > +dd43393b%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637784103062464
> > +167%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
> > +iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DkrF2TinxFIRvSQWNMrJpAjUpk=
k
> > +cghJsFzWIOmh2Nwno%3D&amp;reserved=3D0
> > +$schema:
> > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cbiju.das=
.
> > +jz%40bp.renesas.com%7C0494a54e80ad4334fbd208d9dd43393b%7C53d82571da19
> > +47e49cb4625a166a4a2a%7C0%7C0%7C637784103062464167%7CUnknown%7CTWFpbGZ
> > +sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
> > +3D%7C3000&amp;sdata=3DXrwV3g0Jw0%2Bsi0J5PygxWTw614a0%2FtQGDF2HeMdBVsA%=
3
> > +D&amp;reserved=3D0
> > +
> > +title: Renesas R-Car MIPI DSI Encoder
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description: |
> > +  This binding describes the MIPI DSI encoder embedded in the Renesas
> > +  RZ/G2L family of SoC's. The encoder can operate in DSI mode with up
> > +  to four data lanes.
>=20
> Need a ref to dsi-controller.yaml.

Agreed. Will add this.

>=20
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,r9a07g044-mipi-dsi    # for RZ/G2L
> > +
> > +  reg:
> > +    items:
> > +      - description: Link register
> > +      - description: D-PHY register
>=20
> D-PHY isn't a separate block?

MIPI-DSI Tx module composed of MIPI DSI-2 Host Controller (LINK), and MIPI =
D-PHY Tx (DPHY).

Basically both D-PHY and Link are integrated inside MIPI-DSI Tx module.

Regards,
Biju

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
> > +        compatible =3D "renesas,r9a07g044-mipi-dsi";
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
