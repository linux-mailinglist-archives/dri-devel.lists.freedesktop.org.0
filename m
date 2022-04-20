Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B10508CA3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 17:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5656D10E1EC;
	Wed, 20 Apr 2022 15:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2091.outbound.protection.outlook.com [40.107.114.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82AF10E1EC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 15:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgxJmbx9e2ip+/3IJ350+6JU1HjAEbF7oovxwVHO3ozwOj7nvjzE3AWrTvcEV8wmZ5JcKY/0WTdwq04W3QwuAOsK7pBg+B1QThA2twdc5aNR7ORg/zRk5EpILK07iDX3Lf4KjzAumJdCs2PO4uhm1PRWplOcStNrIY9YnNt9t88F8nAcpQVbNyxzkT2azVROQNV77qZcmmwTpeqF0wEEG0J4paFqJObaU2Rx9Rd6OS3a7H42o7hAkP3IvI9ZZJae+f4WfEpoiXIm24yElHZTm0P9+mb9I8VcAJBi41nQwc8c+htBYFVUU7y6ggUd1VqH6bpyQv8YUBK60Lj5GjCzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AckHyi0DR7DHKp5M/ppp5LM7FPWU98RxFGam5Gcgns=;
 b=lRuKBCtHRTD38VT3WxvhPpT1PDd1pquIB5OdY6pB5bfhU7324D9jNeVQ+uI8VqonA1aNsJlwSS0nejKIur3l1j/Co8+TZjhEoWKBvWz3DcL+1tzaOsbmAyQDiQR9u3XWKryjxkDKaRwaBKkBXkrc48W1IPRTm9SsS2XnSUvQTmsoMHouu56claU/9ynpxausBFS8/2jJUQLsorG/yH0VzD7nP1oCaAWj+xPwnHtlqfL1411FWuhDXVTWYjujOtaCj0f3MBCrH6UnJCmxANUB/En7e1pBsL77rdD7fW/jk0I+e1P84c1FxDodlhar6CShMPaQnKIbpbMtNKJkNNptAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AckHyi0DR7DHKp5M/ppp5LM7FPWU98RxFGam5Gcgns=;
 b=tRR1dtj4S6VeYD0DW/OQPfkjMQyTshuE6IVaipbjD6wP2DESBU3N0Qz1wsFYmMB3pjxqi31Y3Q5vteHSSAcDjchmSi2YEHB8D9tmG3SAUX5mrluqu3bLrzLNs0qW2VzV7P+Lkzj3vVC2jMBfwgVAtw0x+94G+f81gjJ0/H6Rops=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8835.jpnprd01.prod.outlook.com (2603:1096:400:188::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 15:58:51 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 15:58:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 1/7] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
Thread-Topic: [PATCH v2 1/7] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
Thread-Index: AQHYOTdPILt0vWqjr0eFmBKEOUG5TazxAWKAgAgqh0A=
Date: Wed, 20 Apr 2022 15:58:51 +0000
Message-ID: <OS0PR01MB59222EF5AF43AC47D048F4BD86F59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
 <YllTed2IIAwWva6F@pendragon.ideasonboard.com>
In-Reply-To: <YllTed2IIAwWva6F@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c399d55c-551f-4194-09fc-08da22e6a9de
x-ms-traffictypediagnostic: TYCPR01MB8835:EE_
x-microsoft-antispam-prvs: <TYCPR01MB8835872EDF431E003177A1A686F59@TYCPR01MB8835.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rdQxU/Ca0EflbaCrEm7EwAHxqVQ2+rqfhukdCRX5rVwTdEb0Q5UBbbPpAMsw3YE0yplCx0kS/GILuXxEWzTCt6qc0RAHxjhIcaXgvjXpEvOmnD/dWBdQ+1wowwKJ2XwU7Qv4O8/GzhKharXZHC68ZARNZhVMq2sIxosVRw7LyxNC+2aWgQmhq1NqIRXHW+UWBhO3NM26gq2oo5l1TKyron3B8zmNagKuIGq7XtbqjCog+igbyX3rOsGGkxHHvWgR/tt5QOL0D+XF/4ETeCBHy4NNEqXp2JCDoGvf47BlbyN2YkHm42/JbaLwMsKYAxZcNFuVOm5kUwRhu+GwYGAMNcADMClB6A566GHFBaWRMxuEhQJ1y6pFIkbS3ipMV5kbl8yXMICw4SqvTTNXpo3lJRTTt6mGPaQRbUJxz4cOG31DM6ir30hl5pNo+1Cpuq0pEJUN+SI2xP2ZklNaVN14s64NLgcRTlMD6OD40s3jfpDMObGGcvJICxTMu2LUkQH2NT4NrFnsrhYexYIxffPr/8NFIxM0bXzXwzwZzK4hi18Vu2op2FV6sm5Na49Fctl2uA/Yl7ASzlR7WE70n+KGuPns4WaEFtM6FBxhgQ5pnyHk7Y01wVpE9OLMkVOmeUxizIIbtrDMuuL6sjhq7G7ftSDmzwnl3uzdIQeLs8J91oCwOUuMbqgcCYDbzEBzAeOXan112frsgLBjymhZQTFkJQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(38100700002)(6506007)(7696005)(52536014)(33656002)(76116006)(6916009)(86362001)(186003)(316002)(107886003)(5660300002)(26005)(71200400001)(38070700005)(4326008)(83380400001)(66946007)(66446008)(9686003)(8676002)(54906003)(66556008)(2906002)(8936002)(508600001)(64756008)(66476007)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3Ji9Az1YU7VWks1wKl4LGJ0DGQWNJXZemFWjLA8U4kpuXTXllS3+BBIWga56?=
 =?us-ascii?Q?8FyBhRJiPLSNs/aNqF227myCRqbpo+PRpQYwtl/AtODrDhsE8pDj6IokO2N8?=
 =?us-ascii?Q?GoVf/b4zO+7dNabmn1CNEQPibA/ixAqtL36yQm/C0Q/asfMN6S2p3Esvt7aX?=
 =?us-ascii?Q?AdVEPcvMLBDBAGq51eXNgIVYts5BmxXbAjScGGrMywDwfGXfySAAJVh8ad89?=
 =?us-ascii?Q?CoehqT+pFsQ2uXnJ1/gPEVo4OLaYFC+1Isk/ZnswWK7VHDy8E+0drNPMTbWN?=
 =?us-ascii?Q?mXIomHeYUGDDLVEZNGm2aecWpy77VF49wlQi+sQbkksM7Ka/8o4o82uIQZew?=
 =?us-ascii?Q?bIJh1/9cTBea/qbCt3oMILDIX5ZZultiFwPNF4g/lY2lvT0IcVgeh+VzEL/N?=
 =?us-ascii?Q?zqR72wjEFr718ck6N9Sh7Gqu2pKms5i6TSuntSVP7thM+y8K06w0hn+nPczP?=
 =?us-ascii?Q?DmSphG6bwh3qe8aJVTwZGotfgYe9/Xr73k54cltNDjtq1QvLtq9OtYCvrVjJ?=
 =?us-ascii?Q?ZANurgayH7FYhG5E67vTYP3LrX6LJFqJXU/FD4of3fLKDVfmjgGwS/wMayfu?=
 =?us-ascii?Q?/pnJUnb5YwlqQk3w9Udma2KEl8srBiyjGVZjjPFxl1ueJ8ZqLMCaieMAuZ/Y?=
 =?us-ascii?Q?uK1dPbD1P+74a2KdkqJPpaEby4GfMtAf3OJC1HYE7Cmyeo0DAmSyg688+vYu?=
 =?us-ascii?Q?kpF8QXnS4lkZh2ZD7pW+6f1OQ7fIlvEV5V66FFQ5d15ro+mTLwj2SbPvEmjx?=
 =?us-ascii?Q?cu0mQgAbgS+gN//YWKX5yCQONTW9ZpPCTBhRdjnk834plcxFCyaqJjSe9GrZ?=
 =?us-ascii?Q?qI+RavDNE63yqt1WjdYHYHfKzP2Cn/5zc+ISDaNG2I8Hkuv0TtDMGWl1VrQI?=
 =?us-ascii?Q?4ByP3LJxNl3Ra46JAti/qUlWjcjA3oUWLDACpCYkWCN0PkAaZfIeSfx7Z+yC?=
 =?us-ascii?Q?RQIqEwcfcVu4fOGKuNbpy4XUd2E3PmnEQpDd93uaiTvx6kIf3NSuIziv/DJt?=
 =?us-ascii?Q?2Ek/r4vDidd9EJPeg/HjUTboCX5efNeUxp8wx8WVR5Lgzot0nVgx6EGk9jgN?=
 =?us-ascii?Q?TFBz0JLGxJKQxJI3rvpMT+QBg3yi8I17yBIMfA2Wk402JAHZtB/5SpmBNaib?=
 =?us-ascii?Q?7L3pKIDIy76RD3dPyRgvELw1thRXnOIJ+eIZiPAt8i2tasuyzBGbaqLGpJV3?=
 =?us-ascii?Q?NU3vA9x4VSNOPeDVGj94+a/1jYmCCHN93OCeaghYsZ1ZjdEibfZU3DlZVDP4?=
 =?us-ascii?Q?i+/T0h8GMAwqbgMk1lorTSjnHlZBeMM1hTmhQNUdH/qmvmVYPM8ymsC99BDU?=
 =?us-ascii?Q?Rau/AGYkDKxaAxWxbiXLzxv3ht/3p8W1GOzSGTEKNFfvunrvE54YW210JZ1c?=
 =?us-ascii?Q?U1X3HNJusVhgrjVHeZiUadc7n8eEloZA5AsIZblgpXAxg024JbbZ1WvcN4W+?=
 =?us-ascii?Q?VUKmZkX7QqY+4ApNd17ocnAkWWcl47pPiSlClphH6AuybEaAsj+W0bdEkdN4?=
 =?us-ascii?Q?eU4nciAWrsncLQBCSn3asm9ZPFltgkU7c+YhPgjH7k/6erbIiMvx/1v+7UUS?=
 =?us-ascii?Q?dkHzl2k16dNf6DA5CpOuO5FBJNb69PC2YVdmfAgfn06hQphI65SL6PB34DZv?=
 =?us-ascii?Q?bbljoTw6PcfbdJ6fRL5QEweU8aJ6pzmny6KON0/z30Jrl08K7Sj8FghRe6dj?=
 =?us-ascii?Q?yO2c6yGfgslacMGdK6ChcbYfspVbuCIXtx2pUzl9hudEL589GvtnhuLbFwgw?=
 =?us-ascii?Q?jw/ZuojCFEVlw4IMnMFOTN3LxGUStUM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c399d55c-551f-4194-09fc-08da22e6a9de
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 15:58:51.3445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fOW7MH8ruc59XxeKbkN3tVop07fWOObCr9wTYhPFkoyGVIQly1JbyaX8sg/pwAUw+9kmJda0k+FXwYBtDqRHJccY7gKnYTxoOIjP5yeO20w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8835
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the feedback.

> Subject: Re: [PATCH v2 1/7] dt-bindings: display: renesas,du: Document
> r9a07g044l bindings
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Wed, Mar 16, 2022 at 01:10:54PM +0000, Biju Das wrote:
> > Extend the Renesas DU display bindings to support the r9a07g044l DU
> > module found on RZ/G2L LCDC.
>=20
> Stupid question, but as this DU and the R-Car DU are completely different
> pieces of hardware, wouldn't a separate bindings file make sense ?

OK, will create separate bindings for RZ/G2L DU

Cheers,
Biju

>=20
> The DT description in this patch looks good to me.
>=20
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * Updated commit description.
> >  * Removed LCDC references
> >  * Changed clock name from du.0->aclk
> >  * Changed reset name from du.0->du
> > RFC->v1:
> >  * Changed  minItems->maxItems for renesas,vsps.
> > RFC:
> >
> > ---
> >  .../bindings/display/renesas,du.yaml          | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > index 13efea574584..f560608bf4e8 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > @@ -40,6 +40,7 @@ properties:
> >        - renesas,du-r8a77990 # for R-Car E3 compatible DU
> >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> >        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> > +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU
> >
> >    reg:
> >      maxItems: 1
> > @@ -824,6 +825,59 @@ allOf:
> >          - reset-names
> >          - renesas,vsps
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r9a07g044l
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Main clock
> > +            - description: Register access clock
> > +            - description: Video clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: aclk
> > +            - const: pclk
> > +            - const: vclk
> > +
> > +        interrupts:
> > +          maxItems: 1
> > +
> > +        resets:
> > +          maxItems: 1
> > +
> > +        reset-names:
> > +          items:
> > +            - const: du
> > +
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: DPAD 0
> > +            port@1:
> > +              description: DSI 0
> > +            port@2: false
> > +            port@3: false
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +
> > +        renesas,vsps:
> > +          maxItems: 1
> > +
> > +      required:
> > +        - clock-names
> > +        - interrupts
> > +        - resets
> > +        - reset-names
> > +        - renesas,vsps
> > +
> >  additionalProperties: false
> >
> >  examples:
>=20
> --
> Regards,
>=20
> Laurent Pinchart
