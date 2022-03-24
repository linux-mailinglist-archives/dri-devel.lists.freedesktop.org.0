Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E664E604A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 09:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D7310E87E;
	Thu, 24 Mar 2022 08:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0D710E838
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 08:26:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXC6chHM8ZxzEj/HGK3SEVUOR64kGiLUHiukc757R4COF6jdCUXncW48vFPoBJAUbbXLHmfgLnfWmpJRpwl8kY3XfdFON+V9Gt0gZ2vWPVGrgs3pbc32eJDAOrAsJYOTrYEL7gREVgjq8HMIjRNcs6wwNs5/Phqttx9OH6ygVML/rlGKBYlmMjxhcA3pzLcbpk7Ryp0QiU12mYqCicB4xrv03vQ9mCATIpQ+seJw7eXMnhdttNcILYQOvaM9LBD+EDr6A4pHwaXu7zRtfmguUu+IEvJlg4JUMBG15Jszm9gorCD6n3kbNyg365svpluc6fl/KTg5vBq1V1FmBOEwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OoAbMtEoZFevP5djIifWY8zNgaIZsfbkZ0sX82r0yI=;
 b=CKjXqV8Sv/HKyOM4h67jf2lFm9nDiVjrSCsBH7bWDSrtu0v/J3n3Jl5CDl+nz0hLprLCTOhBT2Sgh7VZ3rcWj213IACoYmUsKnL60FtFf88zJmrxe+l1PBPbcHbreaZ31ImgUwUYmQTspiJKWaJ/PQVeEdKJ0kdTtVJWm9mXuscdNZbPJ4NUR2XTjVERNLAlnrvD6BpQHC9w/SY5vhwOgRQi2w9mNcKr7Wnin+MTjyh8UKSxOa5Pcu6nCcDrPTJI3Tu2+QIGx9pCTIQFwycOU1Yb5fNfNOXjwb+XeVcqa82QfJnu5TlKQyCpdqFmwfXYrLFW+CTtT02Zo0d4c2lsmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OoAbMtEoZFevP5djIifWY8zNgaIZsfbkZ0sX82r0yI=;
 b=I00cdNvovZ230eg1ACpTCrPcxBnu/iYlg887ExKYoi+zgvbFnF9Hf63w1sYutmjp7sN+/fm9qiRFaPpgZOTVpQBa1sx4m8n9x9LJSroRE78cdtgRMf68a1CCxTYyGcFbcJ9co1u9T79BRw9m2zx8ptcuwmn4yvDoYNqCRTtcJKs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB4671.jpnprd01.prod.outlook.com (2603:1096:404:126::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Thu, 24 Mar
 2022 08:26:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8%3]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 08:26:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Thread-Topic: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Thread-Index: AQHYN739eKkm02BV80+gG/89zR29V6zNVP+AgAABAfCAADmtAIAAsI7g
Date: Thu, 24 Mar 2022 08:26:30 +0000
Message-ID: <OS0PR01MB59222B817D5C4FEA8A8C372186199@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220314161004.14765-1-biju.das.jz@bp.renesas.com>
 <20220314161004.14765-2-biju.das.jz@bp.renesas.com>
 <YjtkMxC0X7mMvMKX@robh.at.kernel.org>
 <TYCPR01MB593341D2E966F3C60ADAC8E986189@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <YjuVbBck5RE79EPl@robh.at.kernel.org>
In-Reply-To: <YjuVbBck5RE79EPl@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b555b99e-c2fe-4f1a-a0e4-08da0d6fffb6
x-ms-traffictypediagnostic: TYAPR01MB4671:EE_
x-microsoft-antispam-prvs: <TYAPR01MB46718966A5609F856912B75086199@TYAPR01MB4671.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B7Ps99Uzig5PYQxfjf+RhYkD/QlWIvJfopNjOzRP+E6eN5ldRNl0TQ8kvaDEvQOne/9NTUvbp2QE/YpFOPq5RHLgmphbmEOy+7duLN4QQHUIjAUzGJMHautHos8XS2fKK6XqqA61o1xj6mR04cjiiDkeeiFisXwcf6MY7I310jF9H1ifdFoDa0q7zL0NbHdLy3Jn0FmOTk3dPTBUevp9+SItl+N531pHFZT6toiOEonErT56oT3Wq68GhtAQf+F2YMoZmik3myWYrkoC4Wutx7Rw/coI4ZC4X95c1TvopPo+3VUCzRwOSMFSGi4eJHJGjOqEfZyPf/IYewFTbP3MyOp4oVNU/be5yRuuhHPPyCr0bQlcr231JuNa6iCBmPbIlIIz0Ps8vNgL+ytaTL0cyhW/B4BC7eGwL8662F5Mr9DN0CQJDscAxsfUWX5hH/M5auMliOsZ+PKD8WeR3QwP1luLeB9DhmZrdQqmz6qW4chtCIYNr8TknqaT24jvZI7TA0anR+uBnKGe4qXd7LobTHQC+BJ8jaSo/6KLbYfE1/bD+l372w9S7W1azRJgCIOH2zaoi1piPdEazleyUBWjXGvpPPB56aEqBI3f3bl20EXvi0HXOFM1L7iYKDt9Dh4UXWzWVNuoE8AOQlnJJ40GGT3tC+CeMLVyR5o0roeEcOJRGhzz0+z6mpCG/Xh2r1LrMg5W+C7T70TNkjJ4GFC4kkJWpAT7PADkSTRKIQ/uMO6wyiJKsFC+j9rXRVYmc4UNpEL1yLHrgCalKsum49O8v+U6eMo97t2IDI9NoCKNFAep7lexdA6W3nvoIVczMMTiuv93Wc5DRcMEYkR1/vxzQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7696005)(9686003)(86362001)(6506007)(4326008)(508600001)(966005)(71200400001)(66946007)(83380400001)(26005)(38070700005)(186003)(66556008)(8936002)(52536014)(38100700002)(5660300002)(2906002)(55016003)(122000001)(54906003)(33656002)(316002)(66446008)(64756008)(76116006)(8676002)(6916009)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qoiuv1mcvmlZu6EA3Z01pO398px18XBf69RL42vX/6ay8hz43a5raXg/mMOo?=
 =?us-ascii?Q?1wP3bi2RSmbF642gb2RutCe6gu/1h2jDWMAT34x6BM2hXzQIM6xmS/qHq+3P?=
 =?us-ascii?Q?lOuVz6iXXbhg7BqIswi2L6OZTjszyJIfLWIWQOLaGa1ZQ/VZfpNHdW+Efc5Q?=
 =?us-ascii?Q?n1jS3/VeASzu9m6vI83Opf7O7dGaEVteqhA2w6XhYflYAj9dr1UkncIINL+P?=
 =?us-ascii?Q?TO6E91/ydNBZYfTkhz5JhEkw8gYlmFuuch4GCEoU7yw9wvGVgbGuTq22q1Fz?=
 =?us-ascii?Q?kONiJ0tCB/sw1BorockwLRw87M0GumPd6oHwoinFgygstykiH/OWmdwRWgEF?=
 =?us-ascii?Q?XjTxMQEeOovmlerMIfmqG8lvx2XdGVZ4ESUV/1591hXwn4TwAFfs1yAHkn5B?=
 =?us-ascii?Q?e0WvqkyKkkBjiF2WGQtg0fSYX3a5QV23L4jc40vl1sLIXZta10ynjc6MaCSy?=
 =?us-ascii?Q?nz4uQ+WSwH1XFdeBV3SITT+FFmKG34gFyRAFM4EKXsh/eYw7A9h6DYau4ksK?=
 =?us-ascii?Q?+LWTh7TPSZ8yCg5IyqkjthDIEQoPRgKcZvGNq3gJCyJpb884tqKw4UqoZh2B?=
 =?us-ascii?Q?iBDxMvvoidRV1pJ8h4LIf2l+80dJzNqHc42SX8PY0fL3fsDr/qFlS5+488P/?=
 =?us-ascii?Q?U7hH+hT4wCTLXjXMbc8v6cVH9Tfc6KFMzr7Rgl43IIRZDcnrIvWRVyIhqLVM?=
 =?us-ascii?Q?LVlym75nyLPtFqwN7cHu2pPIMD/TEtVee1nYznV4sq1k9OGaoxuz3Nl/gs5P?=
 =?us-ascii?Q?D//cMDu7u7pOpCpMDr+nSwlOP2EkR6tSf/S5QxpvCvaLTWKlwnlvymF6Mcoc?=
 =?us-ascii?Q?ASZbs11R940YBMXbsmMP33YgnI9bKkubl7DMtajU3xBhXrJvXfQuGHGWE6at?=
 =?us-ascii?Q?xNtxvsj5JhsbuSWSPDdFN52OjieDa5Eg0j8Kfjv+GJM+EU8EsUhSQRzgjEZI?=
 =?us-ascii?Q?nxey85BIU2BnL4oGwUmFoS2fCHw1y9rRLU5nXv4Oq1dkHBTrTbB0sOjTgIQy?=
 =?us-ascii?Q?4R6s8uG23O8GdBAhI/zcuhX/D9Pvsf5w3SpgdifUjEN0Jl3zTFs1GSgyW9Bg?=
 =?us-ascii?Q?HzFlzWS7L0rPshWNNVDsDvD0RnaLkzXvtIYJZx6hOyLvU6S1grmlyez0FwjI?=
 =?us-ascii?Q?ougxVBsDK5w+c5OBoulQs4sYrFpxYDAsbzV8v/nSGMiKvEM0xWqO0MhaKkck?=
 =?us-ascii?Q?XBAYn24Qh6iT+VZyqD1M7yT0fH88fzBRkCcQDcBC7IXKohgTDLh+6Lx730yU?=
 =?us-ascii?Q?yV+mqC/Lb5e5jTdJJZ9wVALrKFc9uV+aqlVME2OnhEUxwOe+rKy1bRKstBDF?=
 =?us-ascii?Q?fq3AQ6/hIRHm2fKCDrivoJiPxSblaD5UcwuDtd69WxOKAWrcv01EyqpiEyYc?=
 =?us-ascii?Q?DQez2FcfjgEAslNmFfd8qwH3X21YNgJg3DOgdBoI/S3ZRbxflFgrt6bLH37v?=
 =?us-ascii?Q?kwLiPazQNmKv84OW1WAaoGqegAAuKzV2wwY7V0ZiRX2KZMD+n5PjnA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b555b99e-c2fe-4f1a-a0e4-08da0d6fffb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 08:26:30.8411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: loEKpWRAtqYZrVMdvMJW0Ftt4EbOFPut0+Yd6lrvPLsyzHkf3MubPhQHfAy9qeS7fUfzGLwodJP5q3OGwt51kEx1cnUxbBV9GwsebmK6kEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4671
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

> Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L
> MIPI DSI TX bindings
>=20
> On Wed, Mar 23, 2022 at 06:26:31PM +0000, Biju Das wrote:
> > Hi Rob,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Document
> > > RZ/G2L MIPI DSI TX bindings
> > >
> > > On Mon, Mar 14, 2022 at 04:10:02PM +0000, Biju Das wrote:
> > > > The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family
> SoC's.
> > > > It can operate in DSI mode, with up to four data lanes.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > > RFC->v1:
> > > >  * Added a ref to dsi-controller.yaml.
> > > > RFC:-
> > > >  *
> > > > ---
> > > >  .../bindings/display/bridge/renesas,dsi.yaml  | 146
> > > > ++++++++++++++++++
> > > >  1 file changed, 146 insertions(+)  create mode 100644
> > > > Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yam
> > > > l
> > > > b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yam
> > > > l
> > > > new file mode 100644
> > > > index 000000000000..74bc3782d230
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi
> > > > +++ .yam
> > > > +++ l
> > > > @@ -0,0 +1,146 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> > > > +1.2
> > > > +---
> > > > +$id:
> > > > +
> > > > +title: Renesas RZ/G2L MIPI DSI Encoder
> > > > +
> > > > +maintainers:
> > > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > > +
> > > > +description: |
> > > > +  This binding describes the MIPI DSI encoder embedded in the
> > > > +Renesas
> > > > +  RZ/G2L family of SoC's. The encoder can operate in DSI mode
> > > > +with up
> > > > +  to four data lanes.
> > > > +
> > > > +allOf:
> > > > +  - $ref: ../dsi-controller.yaml#
> > >
> > > Full path preferred:
> > >
> > > /schemas/display/dsi-controller.yaml#
> >
> > OK. Will fix this.
> >
> > >
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - renesas,rzg2l-mipi-dsi # RZ/G2L and RZ/V2L
> > > > +
> > > > +  reg:
> > > > +    items:
> > > > +      - description: Link register
> > > > +      - description: D-PHY register
> > >
> > > D-PHY is not a separate block?
> >
> > Basically D-PHY is integrated inside MIPI-DSI Tx module.
> >
> > MIPI-DSI Tx module consists of MIPI DSI-2 Host controller (LINK) and
> > MIPI D-PHY Tx(D-PHY).
> >
> > That is the reason I have modelled like this.
> >
> > Is this model ok or am I missing something here? Please let me know.
>=20
> I don't know the details of the h/w so I can't say. We do see blocks with
> a phy modeled as 1 block only to need to separate them when the phy part
> changes in the next process node. I imagine we have it done both ways for
> DSI + D-PHY.

Yes, Please see [1] and [2], where (DSI + D-PHY) modelled as single block.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml=
?h=3Dnext-20220323

[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c?h=3Dnext-20220323

Regards,
Biju
