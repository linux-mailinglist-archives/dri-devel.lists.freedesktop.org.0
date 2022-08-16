Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAF15955E7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 11:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8333FD2971;
	Tue, 16 Aug 2022 09:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745B5CAA31
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 09:07:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyuWkgGYDiki/yJft1vnXPsssYED4jZ7gpy16ygm55DMQlAVP7FrkGZ3H9B15B8FQP3d8mgvoGEtEWt04tliq9oTVgo7ehH/y5Vt6oe6MOvY0h2NSIw8eI5zH7QW5ov1htPt9dodtMfV10Q60Z1+qYpQDFkKnvcqePpkE7vQmN7Rkf7RvdPSraqPstSEm1otSOeBtu1LunQixWBphegS+dY8T8CYh+3dWcUTxFzcD4YundhmUBoZIsj2l1WxtCxZ+tKxPWgfnUbZJxannX+ZEgbQn3HdCo2TzDtQ8HxDnweI/BGVkG2J8k8MZeKLVqMXSHedeB8OjY7WyZr98RrV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3y/Y5XJbccaxB8Sdwx9sH9NZeC8dm8psE3hgAMmSCo=;
 b=MA8r413b07m3CrpbqBjIMhhGPMzmY7jANEmnjmeR81xcold3WFZBI1hocUdxNfjLJNfNfzMWOVFCZrDz8JxLEHJO7Ib/ErvtMpxgWMlIjXFoAmdDk8lK8w6XJNdf7PNuPdFvhl4xP5tD93kt28rV31/J6SEQ7tYCVb65HjyeylvVACZLKrM1JpmCNlqx+qus5mt+eEW62yzRHnfuIqlacyLVNz9nau+TO/023DLGhOmdD4Rx4CjylFXleO8tuI7CdHh1TY5GJkZeHAB1RHM4CQdd08mNXQdYeW1z1cAvZoxETDO5HohHQoXWj1R3TR+U+oc0OCiivH667gHtEjCQyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3y/Y5XJbccaxB8Sdwx9sH9NZeC8dm8psE3hgAMmSCo=;
 b=SbAks66CgU7sgWaFtz2n3PAdXpDnJUe7hk4RHBTJwBOEh3iI9Wqcuww+I2M0N6tIHpQzWG+y7kbqeWAkuQ5jtbHjSkUoKI3cT9xLyADY8zqGjgHi4H+Bm+9uHY4BMZ/X8iEzc4+7cEsK+E1EfPtsA0MdiD3LCYkxF2IvqKficCY=
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by HE1PR04MB3114.eurprd04.prod.outlook.com (2603:10a6:7:20::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 09:06:57 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 09:06:57 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>
Subject: Re: [EXT] Re: [PATCH v2 0/1] tee: Add tee_shm_register_fd
Thread-Topic: [EXT] Re: [PATCH v2 0/1] tee: Add tee_shm_register_fd
Thread-Index: AQHYrlglkVt62yOLKU2bEUe77YcK2K2xNLAAgAANWwA=
Date: Tue, 16 Aug 2022 09:06:56 +0000
Message-ID: <0cd2fbe9eac3eff50ed22fcd7ac6742ff46064fd.camel@nxp.com>
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <CAHUa44EgA1btRyj2ByooyLr9Q+8AmW=9EfjtQFxyr7DuCXASvA@mail.gmail.com>
In-Reply-To: <CAHUa44EgA1btRyj2ByooyLr9Q+8AmW=9EfjtQFxyr7DuCXASvA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c839e74c-e71a-4f64-6a2f-08da7f66abb5
x-ms-traffictypediagnostic: HE1PR04MB3114:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 03E+iqwbQy+UAezGBG0mZvvN3ozvu9deDmiqPhVsWBJlWme/x17WhHExexubcTSCYEmI4ShOFNjmWMs7J8T9GhV/88iQENtnb1ZIv4dOxY6V5tFuMG4T8Vt1iOF8eU36zFt8MwVOjMA9ycTROAyoMQwfpP5zdCMvD5arXkrnoGd3eKGdCGVmzQm/LpPOzDU0OlJ8dDjVRq03vK5FPirlhcm0AGxAGnHsZfhZA7LzYJhc9I0GiO1l4nJvdd81DWjdkeUoc4hgOebS8hGtUEQZHacmbElVi9RWFjxdWvvbJiz7hMatHlDAI1kxM+UbeH+HyVNMWuzAKxJ8WGuZ1u2tBgZAiF+SACMS7tNbUuOW7XulEgpJjoR2iIpBu0aEvxnYmuh76rmRRiX+9mKnHhSEz5CHO/Hcj0OG+1NY+Nw8NA+8ErcTb56uV+OTGtvR6XcqAoCbWaGazFjJMruIWfQAxDLbyGHEJkgTN96LruqZuVTm4tWY9rz5iVrh6TNZDz1tXaetFQgoVDSj6KC5RBK8TiP1oFrvd2p5bq71hukYRwtDJszT03aP7JaGCPnazz9m3rPEffFFR4dcIZEszQPTuN7FTkZyOzRShEo09eN8iOYgohdhwZihHCzmjpzTVeZRSxh988wVXEFnl8IeU1Z12iOReKbv5Bt/CPygtQCz1EDXk59nquCC6fC+9wy6UTpfps1LJui0xPDsh+rXZbNsrns+C8XshElB7yWQvP5EBKYSun4tZhr3LNHvMYAGuJku888iS9LsbFdfNAzpyWQ7Za33dnAeq60MPwu32y+RIA+JhFY2+Tl0yRh6BOV2aNvgTfocoh5VMTlvbcc2ATrXcg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(71200400001)(186003)(2616005)(8676002)(6512007)(6506007)(26005)(53546011)(66946007)(36756003)(6486002)(478600001)(41300700001)(966005)(4326008)(86362001)(38070700005)(91956017)(122000001)(83380400001)(316002)(7416002)(45080400002)(8936002)(2906002)(5660300002)(44832011)(64756008)(66556008)(76116006)(66446008)(6916009)(38100700002)(54906003)(66476007)(99106002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?Vvq+iwnWaczp8I8kGqllEizRg4J3IvgxOFleEYKkA7FIN4qFWtZEIKuf6?=
 =?iso-8859-15?Q?KOMeaJwCzj3zrQ20+au7RxZHwmjLmbFxiYQWtFyt2AVsE0YPW9qcYrmqN?=
 =?iso-8859-15?Q?sNbxrqjiDePjZme5z/85uxHiyCXPdz/a/SohmPE2sRGILAlevdH6GyIoH?=
 =?iso-8859-15?Q?/6G6aPSzrgWjIdpsaou+2zLbDqhgPOsL3/6aNDVcJG0NIM7K+e+g739oH?=
 =?iso-8859-15?Q?ZERHCMsUiAm3jQvWUwyMLqHGyRzDIJjU6bsrU4SGyzDo4FgVatm0UODT8?=
 =?iso-8859-15?Q?4+VeHpGLvdYqnAfDv7YKvzBdwaACehu7fKlFXhNRCFmADvDlY0vmzzDem?=
 =?iso-8859-15?Q?RZktTVzrPxisnR+oK9X8qNHIugD//cKzvdKiLFaaT5OWDYpEhDeQJzuN2?=
 =?iso-8859-15?Q?E2HiGSrS8/hNtY47qF5qa1YJ50BZ7T403AR45l8/7RAHrGXgLSG8fJTFb?=
 =?iso-8859-15?Q?2Pwf/BQpLUt9LuvKKC59o+c0XT381A61OAKji1oJuz/X4BxwtYOa/PuRu?=
 =?iso-8859-15?Q?X8Ri+AERWX9VAp55c8hczpmGoayPTU9gtaMAuwo9CbtWqyP1lnu+rGd+M?=
 =?iso-8859-15?Q?mJ0UhTC5Ppw/5WUamkQX72Ogt+yxNyYttA5hjuSU1yx/XKGyl6i1Jpdvv?=
 =?iso-8859-15?Q?Yo6QqtWZB1idMu8qaS2fEeeMZxhD8bzJn4H6KGUmBoENo2sGdWntMUy1u?=
 =?iso-8859-15?Q?RQBMumoN0asVsrw6S4OFJCZWeLvTzoQriJeQZn1MsCQEeyxXP9g0IEGz8?=
 =?iso-8859-15?Q?LRFgmay5kqZ7FouSWZACU8qXD9jdpzFQRxHTfmNqm6lolBhBpszutv8Gz?=
 =?iso-8859-15?Q?9LX1mKpWvUlNrdrkcCUT2P5ym5Do6b/CQ++CsYUFgm5yjxu4fs7ICo0R4?=
 =?iso-8859-15?Q?4FeGt0xESwJFtXqsdfCcj7+CCBp7HimTEQ9Q3bEeiv1LDmj806+SEuQUx?=
 =?iso-8859-15?Q?79xF6XqOuLqFC+ygXPqfz3xjhtXqXn+mcw8jRVl8cv5Mxwud3H+To8Asl?=
 =?iso-8859-15?Q?ECJ+xzyUEQWmX4xUazqqCJXHZ9sTtPv0cA5GI6Gw+TQrBMIg/1j9q3VM9?=
 =?iso-8859-15?Q?XNdnNIzMqk26kMSwszxY/kyB3TfENIQVxiaUXxs6zcwHoP8lAcbwzSAbJ?=
 =?iso-8859-15?Q?k46itJcaAcmWiGj+iRP/3q0TbN+Ly4N8nOwCfORfR6S75wtDTNhYidzn7?=
 =?iso-8859-15?Q?Y1p4C6zlOrYl3DRi2ISw5Pb3IlRWuOHpt3m8CINnVN9qv9/giXsnSeEXV?=
 =?iso-8859-15?Q?31v5jID1SvSKGzyb82MadbP5NPcBmq+7qd6g/u24CVZpHWFYb/qdq+Y/P?=
 =?iso-8859-15?Q?T0aSq3NBE5+p+PavV816XomIiaks42KdR+nAKOg4MpWZaHar1EqdfZjlw?=
 =?iso-8859-15?Q?LH+YgLF2P8nrB5t4LtT5Q7SWbHdyzO/Y4l95VfJ+kRC4S5r6grQKuT4Yu?=
 =?iso-8859-15?Q?+DK3EXyxLYZgHsqhNSrDQgZKoCEDgNBhThz8clA0leZSgPC7fuKEE9+tB?=
 =?iso-8859-15?Q?NPVcjlyQj1StGXMl20HaMtsXlker5hxYk6QRME6ZwxRqo2uctkODXrbri?=
 =?iso-8859-15?Q?mpvCkwIwuPPrhJJT+7AyL8kEzilpItSX/qOn2KWJh6tlpbPfM6vlpW0hO?=
 =?iso-8859-15?Q?6IhGvwbxKbRnlXHCG7GOVOxwHvan8dihdRhmV4c9xyxxPkZp73JR3Jc9S?=
 =?iso-8859-15?Q?4PDD?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <A01E2C74227620439EF2D174D5B2867E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c839e74c-e71a-4f64-6a2f-08da7f66abb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 09:06:57.0062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /mpJ2eZCnmi7GXXIs4wBXPzLLugS2f0vBXbropqHGcvSOPrUDf8kV7hw4nDjQUDXcl+//VO+7t2uohMhYyXS7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3114
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
Cc: "sumit.garg@linaro.org" <sumit.garg@linaro.org>,
 =?iso-8859-15?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 "etienne.carriere@linaro.org" <etienne.carriere@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jens,

On mar., 2022-08-16 at 10:17 +0200, Jens Wiklander wrote:
> Caution: EXT Email
>=20
> Hi Olivier,
>=20
> On Fri, Aug 12, 2022 at 4:31 PM Olivier Masse <olivier.masse@nxp.com>
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
7C01%7Colivier.masse%40nxp.com%7C20ddb873be8f4cd89b5408da7f5fda26%7C686ea1d=
3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637962346897373445%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00%7C%7C%7C&amp;sdata=3DcMbuihC0Hat4DEVORzcGhzwjO%2FxclAW43AIcvR8yReE%3D&am=
p;reserved=3D0
> >=20
> > Patch tested on Hikey 6220.
>=20
> What's new in this V2?

Just updated the cover letter and minor change to fix a build error
with gcc-11 for x86 architecture:
>> ./usr/include/linux/tee.h:136:13: error: expected declaration
specifiers or '...' before numeric constant
     136 | } __aligned(8);
         |             ^

Best regards,
Olivier

>=20
> Thanks,
> Jens
>=20
> >=20
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
