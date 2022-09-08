Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFCA5B1838
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 11:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F3910E9EA;
	Thu,  8 Sep 2022 09:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93D610E9EC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 09:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1lX+wGROyBZDNHGjLHBRwz+82Q1+G2NoX7MTjZI59XOVZE08zifNbEnkx48dHy9XrEI0twhdeos4rwi/qJ82nbCHRo/Hxuh+cY3kraxdS0VdSIRhNu8RmIAYohmpHuRx++VXURAg4m09rPY6V/kaU5dV0JJhunC6v4IQCvJGZ3PAaY7MFUY6nRxeD+oUqRSIkYvj1Sr1dZPtKz41DsrFBbH+9vuF0Fa5u7bbDgk4Lh/BSjsSr9lKh4YHh2Dv01wNctfsF29QEif/RYarXKf46J8FrCGh5KCzcgVkJdK9CVAV2TDYloK8X2pcVEvmlA/Jw8syuY9mR0Sb4adEzEl4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0Q4l9NYUMtGI+b+8J8STh3PNfj8d3b9jY2R3QOciqY=;
 b=j8JtihjxD4P2A9Fyfdrrbz9w4hLONcuQL49yCC4N+5B+QiiL1Ed8ZOBy57MEo7etizDgf/OTX/EA7i//LBeKb4cLSmYWM5RUGCx2e+N7br3o+PolqNfEb4ss9f7HN6OxPAhqPJJj7ulBnPyeP8lJbY6YpAOz9yXmEUIkf01cuYztZMkYWoiH8LQ04mu0NJx04aU/U4R8UGHCelWinY/kwLCchZ9I1kafyU9Nqgta13jH8P3eELUWnLX1KfCeVIRAJ3YS/s6P9khmWv3PHtSfIi9tIrX2I2jAxRsNuCk0imwA+CaU5OLUhSrasTWt/EMoqgLv56WHKYFnD/dbelN+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0Q4l9NYUMtGI+b+8J8STh3PNfj8d3b9jY2R3QOciqY=;
 b=E8CHbil+wbA0kf2APx8IeccrqS6ZahdpveDXGkIYud8cEmcWVW6n2zpOXun9UVcOHxE1hNlWrsWx5CwjSHfHj1TmmefBN/U6zktDtfduOMmBYGwCOtgWin0sUmvf8IE0snhJnUgvDxqI2u4G/z2D0QbHRaypEAMunDCcjp/5KXs=
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com (2603:10a6:208:176::18)
 by VI1PR0402MB2797.eurprd04.prod.outlook.com (2603:10a6:800:ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 09:18:44 +0000
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::a0a9:d108:b1e7:7cc9]) by AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::a0a9:d108:b1e7:7cc9%4]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 09:18:43 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "sumit.garg@linaro.org" <sumit.garg@linaro.org>
Subject: Re: [EXT] Re: [PATCH v2 0/1] tee: Add tee_shm_register_fd
Thread-Topic: [EXT] Re: [PATCH v2 0/1] tee: Add tee_shm_register_fd
Thread-Index: AQHYrlglkVt62yOLKU2bEUe77YcK2K217YWAgB99bAA=
Date: Thu, 8 Sep 2022 09:18:43 +0000
Message-ID: <fb641c168a6b9fc041785a0baa8ee4b2d3ff8ed4.camel@nxp.com>
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <CAFA6WYM89+SrW2Br-fnFke4djt4GgGHXn7JS3=rxvAa7dAAY7w@mail.gmail.com>
In-Reply-To: <CAFA6WYM89+SrW2Br-fnFke4djt4GgGHXn7JS3=rxvAa7dAAY7w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9294ae72-ccf1-43a2-f88a-08da917b206d
x-ms-traffictypediagnostic: VI1PR0402MB2797:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KHhc+TiiI8cSDvlVboBioS8ZKBkOuyOTNY5Rns4/zS2FE/vvRbJhzhTGCW1VyrRzLvYw0R0JaV8rBJ2ml33G8AY5lnojR58AYhBCbhk9qItn72+llg3ZAe9pMZgpAgOr+QsmXqjsgEhqdWyCXSIMHmHzPMV5Jjca8mwii+go8WqiCjztSRpeQfce8jSrPSiWlM1MSQ4uNbpRXuaod6Jduy5MzLJPMQHwaomha4pKcDeM4xCWHKaEqIrdVWoKlnT1bQJpYFq4tyJU4Hfs8jKxOAtAHQ96xe04bwSMuV5F1dnOP/ALge2sICNzR75enk19MjxhAsx1AjQVGsKbqxBg7FpBuOKmP5XliWA/MEYEsqhuATVWiakrAJtvqkdO3LHRrApRIfSyFwBJCZLECqzec+2xm6ihH5F7V0dpCm/DkQSmurlmWOPQHsVTL7IGTVdMgcaAlfWGxti3/31edlKdijCwZ4xpvW58wd7HZItFXLLNRN5mTtL1tCxoHI3L1DpTLiDhsGUiHII3j9mSpNkOFm3L72IOA1p1oSBuZCufVwypjfADRqVj+MJAcDh8Y4Yz6a3xF7yzS9RWjtTop66lDyukPlqv4fWf5zqfPpthxBpEtnmrZ9VbIrX2CK8NzgRTl4ZnhU20weIoSnhA9gAFluWKB/OUbHYywWRaaWfAS6zHqZe7JFjUR9p6FORvlo5omNMDI07Bwy0QSg6JwEfAHYo175lhkyFRzXpbEyLb7brrsaRfFSDssdOey/0TnF6rN3DGLDYkhK9vhHOy7V6kzV4F4sfqSWHNGRDYc2DUT0hF54KDU7GcfS96f/E8b5XG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB6737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(64756008)(8936002)(5660300002)(7416002)(44832011)(2906002)(38070700005)(6486002)(38100700002)(122000001)(71200400001)(41300700001)(966005)(6506007)(478600001)(55236004)(26005)(6512007)(316002)(54906003)(45080400002)(83380400001)(76116006)(6916009)(66446008)(66476007)(4326008)(66556008)(8676002)(66946007)(2616005)(186003)(86362001)(36756003)(99106002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?dvxdqz0bVmplNoRPSy3CMDCT8ILcpOqJApwKnGrC5UrXa4d46AaM84zqh?=
 =?iso-8859-15?Q?o3wrdho7WBrafUCvlJiwqX0BqN7lZL0D4ctkGc8pY5F7wh0zcWGD3sf2n?=
 =?iso-8859-15?Q?DXckPq+M+wZpgNHeZFcherBAYHadlt426jCK+c5VSMQbaoYtqFNYXeHRs?=
 =?iso-8859-15?Q?jFuV//BnzJyxPeMR819bL3/YCCORxpCt11yPAVmzQ2CvToYkhbYxmMGL7?=
 =?iso-8859-15?Q?cuGhl/Xdx8XjbS0eSnslC/JoBwwqwJJTbdg6EVnoYSdWtAlVUB7QngPUO?=
 =?iso-8859-15?Q?yTlJPqObpdKJx6/PaxCH5TtI99gseJHn+BjUqrVD3stQbHE+GepiRNKA1?=
 =?iso-8859-15?Q?kJbdkz0ghKNmMotMwUOJXjADMDYeSWzt0Wc/BDhCrfJB1GaB1mlmsYSRA?=
 =?iso-8859-15?Q?mPvnOQu2MPVTxBvnxv9dKnN3XhP6OV0Y3caYBoLamvzwAYWutApBBd+/N?=
 =?iso-8859-15?Q?uZUOtE7z4ahKdvwhK+XFH13rzGQc/arSzQ9ThPLKNlEecwdf29nTTcoM5?=
 =?iso-8859-15?Q?LgRmDVBr6U+TvzfdhAP9i2NWQqNAb1t9Q3WBbhz9qUf+aB2ULRPe4lh8N?=
 =?iso-8859-15?Q?fp72rkwASPs1srZATemRM9w37yi92BaDcEkXdhCF6ZlVqUS8ou7kkF3Ff?=
 =?iso-8859-15?Q?wAG9z4tBztXxyDWPGDTSoiF4lh7NM8v8eVwdin6rzg8BiAIV5F5+TeyPg?=
 =?iso-8859-15?Q?zEpzrDPUFI6AWLHE/fwA/S2zQd0tcZhD/1Hota1RqB7aHNzhFD83zafuR?=
 =?iso-8859-15?Q?v0Z6Iic4SJ4m1B9ESy/JgJL9LUU8MhnwlVzSOTXTWjMNlbcdcAXyuh56Y?=
 =?iso-8859-15?Q?6QiTiATUG4NN8kOYYOJMTYgXSZA1GV0tEEJJMmBC/UzgL6sFg+XtSjb3X?=
 =?iso-8859-15?Q?VL0euF8uNznA1Pkqh02LlHnr+aiOxGENE+1iFgYidwx+ZZ/lHiNv5A3IT?=
 =?iso-8859-15?Q?34izfh4D/vxjynQQ/HlQv/mT9tObYnZ7H1YlNDu+fdjAaVhQr2Z6bby6A?=
 =?iso-8859-15?Q?ittdk+Fl9c6KioSeRWO0zeCvnN/qtxrl7jp5yvsCpEfd3CaH25IsjwrZ9?=
 =?iso-8859-15?Q?BYtixKLKTwqo9iPPOflldhGK8hIRhYweIIqE+ZrJGSvrYRAAq6LGVOl8L?=
 =?iso-8859-15?Q?ZuNFkiVmOuRR7z+6JosOgZAwAultf635IOz11ewPp6vBSUt0l7QJ+hqRT?=
 =?iso-8859-15?Q?UweysUhIujy5XNxNKqMQtzmHQt9HJ41CfmAEi6XHW71sLofZXObk8Ph22?=
 =?iso-8859-15?Q?T0xe27b0ZWhHbDeC5XI4LmY8ducp7QDLhBchxWwlHwNeVgG8a1XdQqJS9?=
 =?iso-8859-15?Q?4n1iAfulCNPkb5qA+k29Hs8mmJvnQDr5lOicpNEBEMJXTfOhxNcmeagGY?=
 =?iso-8859-15?Q?StMfHAjHxYJErNZ/BpgQjME70tNisanf2Z/Qgqx32c0mTzbownFM45kj+?=
 =?iso-8859-15?Q?QylfyHTIFzeydAbqqqKolv5QAzOOo2PRNF9837744+Tq6YsAlUo5ctcHg?=
 =?iso-8859-15?Q?mp+6ZOD+cMrEd0a2n9mXyypnLKKId7r+kCH7P3FGuvckG1wsYvBayR5db?=
 =?iso-8859-15?Q?rL1EQHaeMPesEUWfnGI/D0nqW3L0t+c9ARNFwkr3S6NRKoNbZjMtwqYmN?=
 =?iso-8859-15?Q?rrxPwj2p7kbRSfhgS/RDTarth33THhYJX1DTgth4B8u0xoLiEtQBSKJFk?=
 =?iso-8859-15?Q?SblJv3oeraqyLpi1JwfOV04t7w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <0A3212FE247CC248A5244C6E9B995876@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9294ae72-ccf1-43a2-f88a-08da917b206d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 09:18:43.6804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X9cJjUkbetImf7cUVaecakHgmmMvPu3RAbpRe4EqVbwH19z142xj3MZ3VGAbAAZz5oaJWfACLzmVnaYFqZuktg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2797
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
Cc: =?iso-8859-15?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "etienne.carriere@linaro.org" <etienne.carriere@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sumit

On ven., 2022-08-19 at 13:54 +0530, Sumit Garg wrote:
> Caution: EXT Email
>=20
> Hi Olivier,
>=20
> On Fri, 12 Aug 2022 at 20:01, Olivier Masse <olivier.masse@nxp.com>
> wrote:
> >=20
> > Add a new ioctl called TEE_IOC_SHM_REGISTER_FD to register a
> > shared memory from a dmabuf file descriptor.
> > This new ioctl will allow the Linux Kernel to register a buffer
> > to be used by the Secure Data Path OPTEE OS feature.
> >=20
> > Please find more information here:
> >=20
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fstatic.=
linaro.org%2Fconnect%2Fsan19%2Fpresentations%2Fsan19-107.pdf&amp;data=3D05%=
7C01%7Colivier.masse%40nxp.com%7C05071ff1c28044ab740908da81bc44e2%7C686ea1d=
3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637964942860947359%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00%7C%7C%7C&amp;sdata=3DnYLb2iMoJExdKEg4CL4eW5%2FQ%2Bqqj4Iw1TxFsd1UqWW0%3D&=
amp;reserved=3D0
> >=20
> > Patch tested on Hikey 6220.
> >=20
>=20
> AFAIU, for the OP-TEE SDP feature to work you need to have a DMA-BUF
> heap driver for allocating secure buffers through exposed chardev:
> "/dev/dma_heap/sdp". Have you tested it with some out-of-tree driver
> as I can't find it upstream? Also, do you plan to push that upstream
> as well?

It has been tested with linaro,secure-heap reserved dma heap memory
which is also in review for upstream.

>=20
> BTW, please add a changelog while sending newer patch-set versions.
>=20
> -Sumit
>=20
> > Etienne Carriere (1):
> >   tee: new ioctl to a register tee_shm from a dmabuf file
> > descriptor
> >=20
> >  drivers/tee/tee_core.c   | 38 +++++++++++++++
> >  drivers/tee/tee_shm.c    | 99
> > +++++++++++++++++++++++++++++++++++++++-
> >  include/linux/tee_drv.h  | 11 +++++
> >  include/uapi/linux/tee.h | 29 ++++++++++++
> >  4 files changed, 175 insertions(+), 2 deletions(-)
> >=20
> > --
> > 2.25.0
> >=20
