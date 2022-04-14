Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C17705006BC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18D010E240;
	Thu, 14 Apr 2022 07:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2BA10E240
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 07:13:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BT+WdA/a0w6DKFL19RR3iH5VDPThwTPtL5u7OkyL7d/RdP6JfDsGAi3EXDMQz+3qVvqtkSUJnJiShDz/hWjPFzxk6ZFVkvIofBSE8EtSspAKw7/UCnCsFnp1vu/7/yzkTNbbzalJGy5W8SIUfnLD+fDpORUe3auLTkfS5l+DUuBG7gByvFh6dI/Pzm3YhA9hoMwSLVbXya9so14ejogF5hhKwfFtXtuILiaBBn3jAKMxnJGxvoUKobVSkJsLBBLKPZrZoRXFtQbfASLEeqQBDdq9x0NcEjdFT3KlIZQp2mk6Gj1EowTIQa9lGAvd3QU1xxibRdeLHeo18h67DcijIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=perhVsqWBRyTIQEGAbeKyszuRRchJjkt9kKFDUT88JM=;
 b=hrzTsqwTHTIHv+Y9qo401pK/WXZFzIPK+GrTgMBEOyUnEp2kuMqsJeDY7x6zETiwcjCSyLafc6j3eKwi4iLPdSIqoe4aMyOGnV1QUSUabqjTVaNqCiIAduC9DAE0NwiD6EpzH8tuXfIQz+7F3GnYRmIydf2fx1oGiKVKRVemRCUJ8v0CPA6GOm76wf+Mx4Qg0BeZUIiGMt3Bao4L36L9Lr65W26tq61wBkSrrnM62y8s1obnayiV1TGPchKxLNnfeQbHx9WRAI5qFzl9Z1xpTxuieNDpRHq+Frq+mGY1PHWTyNmfF4caTCToIFm13x9Zh/82eM9LnzGc9PbG2TyNYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=perhVsqWBRyTIQEGAbeKyszuRRchJjkt9kKFDUT88JM=;
 b=ECZlMAjKESXW5eKFELgE4CorJ5TsV7XXwqJVVTGn1dSvlKFVOVrzTnL48KhZ2BudUP812qKmvI7EhvPnIIEkdznyKUpjulmsg+XciOR+sVOW90MAG2Y2TemHx0xESqkDlKE3+ld5ifwJTJWC1hLyrEJT6P+z4qe9EikXADgvY/g=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9601.jpnprd01.prod.outlook.com (2603:1096:400:192::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 07:13:18 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 07:13:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v2 0/7] Add RZ/G2L Display support
Thread-Topic: [PATCH v2 0/7] Add RZ/G2L Display support
Thread-Index: AQHYOTdMes34AyJXZke2fdKSEJXJZazvK6Dg
Date: Thu, 14 Apr 2022 07:13:18 +0000
Message-ID: <OS0PR01MB5922F835EA2DE122DAABAD8586EF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b9028d5-e7fe-4e94-27c4-08da1de64035
x-ms-traffictypediagnostic: TYCPR01MB9601:EE_
x-microsoft-antispam-prvs: <TYCPR01MB9601DCB4A039AF4899A9C2B886EF9@TYCPR01MB9601.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tu4lszYD1L3mSNDakGS2w4wLpHQZEa3iHp+etGBM1RA0gxw/hQWMBXKxC/YG64VDKt3Fczxl1J8N93SWb7/XI2Z2uCU5k+VEQ8y89QT55pR2IVHd6wqADny4/6XNZuMiSWGFHsFwHQuuxSAZoUG0BMsHu73ACeVNpY97A2tC8lTlVBNILwKinJnTjRg9tFUlLLQrBroPC3CAt/n2OnJqURNS9lFx5uZlNhO5jZB1Uz0WsUOcbf4x7woep4wibXoN+3PPPqw2N4TAFgHJ1yTv8pcbVlWvHxk71oHDdXrHLTLFc/+ko5NOGE8tSxGs8FA4pSyKZxrt/LUY0UhR+Tfgbov865ougliciCxcRsxEZWGQiKBiZxvrDhNIN91r2+NKOufIxv27/v/wNylyA7IxNpQW/ngcZvc6DBBv7yjHTCmUB9qscH0drAa6tu4zEubrDG97d521Zxqa9rT8mz0c4aa+QA88CHOMR9Op5fZ8ft2hjWeaRGh3HYmtxmY04cX+bXHIyrZf0kFtCRdC+ipHMmncMfrz8sPqri73j7D7PuClO35vrEM2RLY7F4B/3zVMVcvEIFxhiK2uOO/W4xT2N6JqHENQ9NuEZqq+p3XT34jTigPaHhafBYCCFDFwXiDavUJDTGYYugVs/Iz3cJ9YRWmr33LWaIGwxaYFjHqbCytjTaAiTdS2rILKVbJwh92HgSFyi1cvtQZmhhPY0D9rH8qV98w7g46wkCoEqXavfaJykVu3c7FPPEluY+IzrloOw7FV3KK131cBm3pDC+9TZj3DXj8KOqmuCf9hBnfVsVU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(71200400001)(107886003)(316002)(186003)(86362001)(4326008)(52536014)(38100700002)(8936002)(8676002)(38070700005)(6506007)(9686003)(7696005)(83380400001)(5660300002)(122000001)(66446008)(55016003)(66946007)(2906002)(64756008)(66476007)(66556008)(54906003)(110136005)(76116006)(45080400002)(508600001)(33656002)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NpV9S1NGri9/o6G9ZWwL9ixGoqeXtVzMFh70EfFhYz2y+2vfwjoc7s00R6wX?=
 =?us-ascii?Q?u+I0yHMq+eAnm9gscYQMUnAT3xUmIclnJODVRzpL9fkTGUb8PgkVEnyaZpfS?=
 =?us-ascii?Q?5mLF58b/rL07jJ5KHLvetENCA6pMWSgzD34MIDwLwsfZjfF560TPp4fh3Riu?=
 =?us-ascii?Q?PH9/Y1oChGf+wsomFPFcaPt2usRWyBFhfWVcUT5rp5948yO/SDbOzQS05DKR?=
 =?us-ascii?Q?KZ8mY2myImDg8vWQeYpJzwL2/GClHhTsaFi5v5+CybaIS50dvQP4ifxDpdpw?=
 =?us-ascii?Q?XxQp3BHi39ZlRZUWCN3YSuRkUC6/OqwNrwR6zthl+IDUt7cw7AWv3X7d0k8R?=
 =?us-ascii?Q?fBm9rew63frVha57pD7PkORC45nEpBIt/mZzMghe3kiFYwp72iCCypLPj+Iy?=
 =?us-ascii?Q?hXw10KrPUliq+isodsgtvzNCey52VM62+IBwfHnk4p0TY8iNyuFMIczpB6zQ?=
 =?us-ascii?Q?H6MS21tscQ6ARW78oyT9Vc3kw69N7VsVNlBfHVqS4QMVEMSLM4gfa90FKWPL?=
 =?us-ascii?Q?Up1CdanXgPTXFwsYecnvFEYX2e9kdB6+T+SKywQ74Cc5/wz/kGzmzkYRXROL?=
 =?us-ascii?Q?EoiKuCUBWq6ccTAEEl0kvHoFIr23Ym4MTFsIa4uM6W/Pgi0l6oiqpou6eT4h?=
 =?us-ascii?Q?/4tZWddc5v5W/dZOfISF0v1L4v2Y5Te4qykn9osfAnOUrLfQeblrf1gTWVgl?=
 =?us-ascii?Q?RATwT/E1YZDnufHhV+39adnsJ26+fZ2SH4R5HmXCwL2DsS9tTwuyg7WPa3cL?=
 =?us-ascii?Q?gnU1bpwrSZh/O7wrJx8m62izswm37ffHb0ds8O57irxabkoIJlPpAJwUAAMA?=
 =?us-ascii?Q?6mK4bfqsxJR2fwZvZITKdBSWNN81KErYeEOyKyBjSJcsCrhOVDmcE4+D7aad?=
 =?us-ascii?Q?dD57vGq8lB35u5t+9OilwR7pSrscEVZ5y71kudwa/HGSNsOwCq9zEavshqIa?=
 =?us-ascii?Q?jH+dDk+deuH9UBlLdJI6zBnpYRaK/lgCUcfdv2ubZXWZjT9h3c1FyVuE8xI2?=
 =?us-ascii?Q?64W2SY4wFvjoQZnkiTT6GmvRn7vvicnQg5AAK+Am1Fs45Uv1iQaY9QyrVMyY?=
 =?us-ascii?Q?mjEmeQUbRXnu3L8D1sPUWWk9sCwNlBkuqjQOWy4Pim4qM8HI2T1g0HECclwu?=
 =?us-ascii?Q?E5lakGSASF+QAqVcXxxtqeungqpIBirBaDcb5mfVu3kekkiijmhe/+cwmXEj?=
 =?us-ascii?Q?QAcRL7DWDHG8O6chTj88Kxtq+pmhr/3o6RXcbX94kKaWagnqT/lYaijuEK71?=
 =?us-ascii?Q?B/YRNjHtJBft5pcXmJqtymPSS4XlobOQfTL/9Nm6olKYI1DSc1ObwBH32zsa?=
 =?us-ascii?Q?GBjfExdI2K7/Kb2ZJWDzM/KfnEDbpCxJaEED54UjQoPYYeJwvpxVUkG4kEll?=
 =?us-ascii?Q?AnsHRtwoSu57HZTSdcxCWDxP9bUmppnjjmivPC7Z8y9POQbPac8bLWHGV1yp?=
 =?us-ascii?Q?xK605RgGDpJ8XO9q25c+4zjoIQidzaO39KQ4XjU7YEgK0hftVhFKXsTU59gD?=
 =?us-ascii?Q?Mh0xUckvfTZ6nOJwHsEeUxMrhvif1KwK/sC/+X9o5xwp8zTV0Ih02yBjCjfG?=
 =?us-ascii?Q?RCC9TCArq723C0Uvd6P3fgwS5EpYxSLrBQXQ/F7jbXZZRjOtOjtgyPpbaS3C?=
 =?us-ascii?Q?d81c7CPCdI1plJQJrbYt596Xe3lOhHZgjg+gZMk8mJC2aXiUmkxrYbPY1iTA?=
 =?us-ascii?Q?aN84VflXhzywwJwwX6Th0F1+tg+WTbwaf8b1nD6b3DACaVM17e8o3PcUUaWb?=
 =?us-ascii?Q?rDxunuHhUy0QJ3akIe63eJLiEfEYtsI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9028d5-e7fe-4e94-27c4-08da1de64035
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 07:13:18.2318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bhzni2c/eI0zvbwpIKuA2KUSFA5RTo3eV3epyMj+YyaCzJcH9arqHdGzGndaFVvRikeoBuAWBLuUL19WfBRLWZNgmCUGEzqpQ+CKVquREcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9601
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping, Are we happy with this patch series?

Cheers,
Biju

> Subject: [PATCH v2 0/7] Add RZ/G2L Display support
>=20
> RZ/G2L LCD controller composed of Frame compression Processor(FCPVD),
> Video signal processor (VSPD) and Display unit(DU). The output of LCDC is
> connected to Display parallel interface and MIPI link video interface.
>=20
> This patch series aims to add basic display support on RZ/G2L SMARC EVK
> platform. The output from DSI is connected to ADV7535.
>=20
> The DU controller is similar to R-Car as it is connected to VSPD, so
> reusing most of R-Car code with new CRTC driver specific to RZ/G2L
>=20
> v1->v2:
>  * Based on [1], all references to 'rzg2l_lcdc' replaced with 'rzg2l_du'
>  * Updated commit description for bindings
>  * Removed LCDC references from bindings
>  * Changed clock name from du.0->aclk from bindings
>  * Changed reset name from du.0->du from bindings
>  * Replaced crtc_helper_funcs->rcar_crtc_helper_funcs
>  * Updated macro DRM_RZG2L_LCDC->DRM_RZG2L_DU
>  * Replaced rzg2l-lcdc-drm->rzg2l-du-drm
>  * Added forward declaration for struct reset_control
>=20
> [1]
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220312084205.31462=
-
> 2-
> biju.das.jz%40bp.renesas.com%2F&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.ren=
esa
> s.com%7C619fcf75486d47a9954408da074e6e1b%7C53d82571da1947e49cb4625a166a4a=
2
> a%7C0%7C0%7C637830330678043182%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
A
> iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D3zlHOf=
dKJ
> XLmDLGaMbbw%2BDUxQreKIEtvGUHNSuukDmg%3D&amp;reserved=3D0
>=20
> RFC->v1:
>  * Changed  minItems->maxItems for renesas,vsps.
>  * Added RZ/G2L LCDC driver with special handling for CRTC reusing
>    most of RCar DU code
>  * Fixed the comments for num_rpf from rpf's->RPFs/ and vsp->VSP.
> RFC:
>=20
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220112174612.10773=
-
> 18-
> biju.das.jz%40bp.renesas.com%2F&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.ren=
esa
> s.com%7C619fcf75486d47a9954408da074e6e1b%7C53d82571da1947e49cb4625a166a4a=
2
> a%7C0%7C0%7C637830330678043182%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
A
> iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DSXadiM=
Rg%
> 2Fw%2Fnt3R6K02Zke67CSFqIQtt34si2RCqyH0%3D&amp;reserved=3D0
>=20
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220112174612.10773=
-
> 12-
> biju.das.jz%40bp.renesas.com%2F&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.ren=
esa
> s.com%7C619fcf75486d47a9954408da074e6e1b%7C53d82571da1947e49cb4625a166a4a=
2
> a%7C0%7C0%7C637830330678043182%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
A
> iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DuRkp8h=
imf
> 53knLtbWBxfRa4HGY3SxmyLT5FBrpmFtqg%3D&amp;reserved=3D0
>=20
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220112174612.10773=
-
> 13-
> biju.das.jz%40bp.renesas.com%2F&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.ren=
esa
> s.com%7C619fcf75486d47a9954408da074e6e1b%7C53d82571da1947e49cb4625a166a4a=
2
> a%7C0%7C0%7C637830330678043182%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
A
> iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DMQAEyp=
28C
> rxHTvdHtarXlO6j0CkpCXZuqVHcbNWkXYI%3D&amp;reserved=3D0
>=20
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220112174612.10773=
-
> 19-
> biju.das.jz%40bp.renesas.com%2F&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.ren=
esa
> s.com%7C619fcf75486d47a9954408da074e6e1b%7C53d82571da1947e49cb4625a166a4a=
2
> a%7C0%7C0%7C637830330678043182%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
A
> iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D1y%2Bd=
5Yb
> UoXnMZL97%2F4LTcG8IDtze%2FW%2BwzHRXBEbUgSw%3D&amp;reserved=3D0
>=20
> Biju Das (7):
>   dt-bindings: display: renesas,du: Document r9a07g044l bindings
>   drm: rcar-du: Add num_rpf to struct rcar_du_device_info
>   drm: rcar-du: Add max_width and max_height to struct
>     rcar_du_device_info
>   drm: rcar-du: Move rcar_du_output_name() to rcar_du_common.c
>   drm: rcar-du: Factorise rcar_du_{atomic_check,modeset_init}
>   drm: rcar-du: Factorise
>     rcar_du_vsp{complete,enable,plane_atomic_check}
>   drm: rcar-du: Add RZ/G2L DU Support
>=20
>  .../bindings/display/renesas,du.yaml          |  54 ++
>  drivers/gpu/drm/rcar-du/Kconfig               |  18 +-
>  drivers/gpu/drm/rcar-du/Makefile              |  13 +
>  drivers/gpu/drm/rcar-du/rcar_du_common.c      |  30 +
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   8 +
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 100 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h         |  31 +
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  23 +-
>  drivers/gpu/drm/rcar-du/rcar_du_plane.h       |  12 +
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  18 +-
>  drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c       | 705 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_drv.c        | 221 ++++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_plane.c      |  82 ++
>  drivers/gpu/drm/rcar-du/rzg2l_du_regs.h       |  64 ++
>  14 files changed, 1334 insertions(+), 45 deletions(-)  create mode 10064=
4
> drivers/gpu/drm/rcar-du/rcar_du_common.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_plane.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
>=20
> --
> 2.17.1

