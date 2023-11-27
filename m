Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F181F7F98B1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 06:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF6A10E197;
	Mon, 27 Nov 2023 05:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2FB10E074;
 Mon, 27 Nov 2023 05:32:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltqPj4WLpDJYdHT+4WInqH0aeLOAU/A9zmy130O2JM8r7rASJoAza+t/WpU66tgyAkFAHKJnAzA/Z2NBeHD/lyWsIL20qz3DdE37S+WcZIZgGfP5Qf89g3e/V99gHhyRFqbwdVHZiGGty1mC3w+46eKpRo9mE1LRS4RW9cvRqPRKttFFsFqpbNNgWoP4lNVsUodj6irVKcqioPFW0lRwclrluBBWJYMxO3zE4aUMlfm9sfh4HEiNbgg7DZZRMI6GcP3kBmT1jVmCDih8XQrBM2haPFO04FZr++pkEru8dAvkzqhroOo83ddFAADgCZ5LK0c1r3bbLdcZM7tUqXtHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/moDtIKrLaEZ9O+P3MvoWR50Uhy9gWuNEO3gkDsOIqY=;
 b=WhpsvMht4JMGN8ehxNBmY+Q5X/aWln7p21um1HdNByrAWrqSpR2z9DzU7PbVxxp8/zgVY+wUiWK9dHg6Q6o5y6kWtQnXSisB+oKBgBMmo3l3tDM+ZB2L1QjVXJKu0LAM/W6BkiSyZWFdhIm4Q0gUXZPNVV6fAvW3rwLljI1EH4r++LACOai/ekv3ghm5HehFd9TP3r3u1z63NI3BB72ZwEI+ljShG70DPHGRGEiv6KFTH1v5Tu+4YFxf1UEm7jyVqruGiDciCoCollt6cjpAd/Lo1XOqB48yj9FM3sRvbq0TGJnTn6oLFjknqkGxCAW+2k8KNk95uort1zTY8WTnKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/moDtIKrLaEZ9O+P3MvoWR50Uhy9gWuNEO3gkDsOIqY=;
 b=RT4Z3AR5OfO+Stn4eQClr3PA61YcdaTdL6vVZ0OEABNT5K2Ooo0il619JPR+o3vyRhrns2+nzwi3aZoS923eC57li2zQyGrQi6JZhiP0G06I/HOFo16wkujjeWeI6njMRrWxG1+exup24+pG3uvo/+FaJ40OBL9kK3NOUz4NxtE=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7302.eurprd04.prod.outlook.com (2603:10a6:10:1a5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 05:32:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d99:f43f:65a3:9bf]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d99:f43f:65a3:9bf%7]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 05:32:02 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Subject: RE: linux-next: build failure after merge of the drm-misc-fixes tree
Thread-Topic: linux-next: build failure after merge of the drm-misc-fixes tree
Thread-Index: AQHaILAPih4tujf4ZkeAQQ148k8/RrCNoPhg
Date: Mon, 27 Nov 2023 05:32:02 +0000
Message-ID: <AM7PR04MB704669C9C5471A309F8F72B198BDA@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20231127083205.44b25fa8@canb.auug.org.au>
In-Reply-To: <20231127083205.44b25fa8@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|DBAPR04MB7302:EE_
x-ms-office365-filtering-correlation-id: b29317dd-989b-44aa-4442-08dbef0a2f44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IFUbNvIN6yE8DzgMWJj3u5uMduP8nsQDWf//NezNkWJgLkeasZejE9uqIIYLfvKb17JW8XgYzG9aOQOdJv+vGbYWmxRFmk8jo6I+wys1rR5DCcjTHmCwdkpow60J9ItVKPCvc/Yix1dilKHFjq666RmPqCyoO8Bqc7N8bbIpzJNIx0l3NB8Vnz5GmQE+/nY0ihypBg1pNS0MWBXiCUdfD9NSYERjdZOJzdOKiZYbRrdsEAklYME69mfP66TLk1xWXzrOPhHXE+ZOYIq9W1xAgXXMwSLHQ6VktOOwI+OLGH5UqkY90QJ/06JyECHBCU3b8s0oY5xDxUaIjoYRlwIineAofZbbdZ0+343zWZnyUehzZ75wIQ8AbcfDZX5ukehczXckZEjh0YG0azBODadGgQcrLxNhl6glBWdlck5iQrzsLJLZaXRpCAM7Q5QYGGYsOWrcghyHIYiQ+52Y/+haVuT782OdZVt+91AbOTJBidwd6cpstHwiLCk83Iwyd8noEL98UvRjM3SLCkkefF0SdQVFYFv6p3w25PxjKpp/Yhz2W8R6oJ3nYjAsCSkzvF0+rqRTuXA5ij9tHwdB2DTV0NTQjD2f78JTtw9b+5UEeTc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(346002)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6506007)(53546011)(966005)(478600001)(9686003)(7696005)(71200400001)(4744005)(83380400001)(2906002)(5660300002)(41300700001)(66946007)(76116006)(66556008)(66446008)(64756008)(110136005)(54906003)(66476007)(316002)(4326008)(52536014)(8936002)(8676002)(38100700002)(38070700009)(86362001)(122000001)(33656002)(55016003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tv4fPJ2YyZqweooepek4ymKf3SPqGxK8kuj6C3f5ZJHTF78z4bNs8Ozcn0AJ?=
 =?us-ascii?Q?2lSvwFldAsj5sEWZb4o8ovYXQibUR/0XD6ytJMhW/OEdf8/xPRTTYdy+FLKt?=
 =?us-ascii?Q?YUJjtDyyuoJSG6VguaMBRmk/yKubQUTuCShefLYQUGTePgAT8RyOzu2rVGTD?=
 =?us-ascii?Q?yZYpR3ObkYUGQ2f+XGOZLGPLCDJRDhjZAym+tfsdzMUlVHpSmv6WH7g6PAq2?=
 =?us-ascii?Q?HGusCgGCgM8epbeg5Do3IeYvM4VivKSZh0p3JhQjc8l2ev3BpI+2W9axzsTU?=
 =?us-ascii?Q?OrA2VdYiCV1VTks9YaI8Pgg5BjlZ22OcTnIFowc6U9WFtjPW+A3ZLJrD1ro2?=
 =?us-ascii?Q?MBgCEIB3C3MYJAnWv9rGU4GJcbdC+ZyJDQ1L5q6yVkZUxrMVBsxU+z+GfehC?=
 =?us-ascii?Q?Luv6aHUypjzn9JTl1d9E9RtbJyLBdYA8Vr9fjmLx9qe72Jf8RCZZzvkadjRb?=
 =?us-ascii?Q?TDDnS0nPxlu/b5ixhAY0S5pHADFMb+fKGconHhZ4DMIoYJ58FyFBZY3wij97?=
 =?us-ascii?Q?0H4336wRo57MV/ojgHfWGnpG9dPNfQB+e0Jd/V03jk39YoMyWVnt/HM1jF6z?=
 =?us-ascii?Q?IhnvLxcaQv5tt+KaJwrjYsrozOvN55vRWLIdhDki7bqGcUvu5EO47eCUTfAf?=
 =?us-ascii?Q?LZUDyXFijvXrAXhvrtDi+LauvwDbNobEs/mnXxy0eBYlMSmyCwKABBs8P2Km?=
 =?us-ascii?Q?m4nm4F1rIrDdh4lzl2y+VC3XpIGC3dT8wbgRobFh64gR7Xwuk6ccg94ryBeR?=
 =?us-ascii?Q?CItSEZrShGw7gauAMBQ/fIhbRBfCxHvYugGT2LebV5cH40Uv64NAg4+dulPb?=
 =?us-ascii?Q?/Mcl2qSj6JfS3cJQnFo6MJIO0+apVCeLSoOu03JbIVJaI6wk6E3faPuIGjR3?=
 =?us-ascii?Q?1QRCtlVjPH5xW+eF5XQjQKgRna9SKFdsWf7BNkyEN17IAy+BYY2fIHnJWNSE?=
 =?us-ascii?Q?ht2ckujx3nveB9c7uqkMGaoeGx2uFM0O0RxJtZ++ebWVZEjNkoE1n9jT8YD7?=
 =?us-ascii?Q?uXXcCDcqymqUkgFAgg8icyVM8rtJu2+rY1P8VKh+SNjUac9/AYmzh0Gh3iq9?=
 =?us-ascii?Q?tdW7cDh/8rebGPcInaMHM9sZKaH2OqEO5FIhes817mzvdsHopzQGRPyOgtYv?=
 =?us-ascii?Q?vO0QthtjITVwxmJgw7NcFG3uN8fFrhImSMC1C6YBg2oiwnEFORY8OVoxZhzd?=
 =?us-ascii?Q?Y1s7XiHQLupNGz4Yrf4y2Fof536Xu3u1KRHgESh3dBIS4zlT16aLTd3aja/o?=
 =?us-ascii?Q?QzRujaSjsQYsF1RCSG887L7VQIzXxMChKfaGb1JYbThXQAVeMWxMkd1HUXTd?=
 =?us-ascii?Q?C6QDHwvtcp2kPCkhUhtr9pyI0EOBpGlnfFJ0APbUK9wFvrdTyDPVSn2aS5Au?=
 =?us-ascii?Q?+D8V4D3uXlkh5lQc/aAREkcGbchECShvA15jPgpxWBubYeZQFxoJsSeqvjop?=
 =?us-ascii?Q?jFnfEtAalyFWZl6nGlZOZ0bOWUupvJaSCKzZ01mIbMi9l3UW6yb5YWzIPTb9?=
 =?us-ascii?Q?ocAm2/KpDHSIIR3zFU+pfoxshjiZCup9Il9ks4aCJz99RfNrDW3PZGlOD7Mi?=
 =?us-ascii?Q?s9TXPWmJhgSOGhY0QHM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b29317dd-989b-44aa-4442-08dbef0a2f44
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 05:32:02.4330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9l78jUn8FsP4wc5nZzyOnQavRHunZz3DmH/7DYCZDRjz2i3eduDTp+AKeN/F3N6koQxC3qv7tNRmD48koSQMvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7302
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, November 27, 2023 5:32 AM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> Hi all,
>=20
> After merging the drm-misc-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: "device_is_dependent"
> [drivers/gpu/drm/drm_kms_helper.ko] undefined!

I've sent a new patch series to address the build failure.
It includes a new patch to export device_is_dependent and then
adds the offending commit.
https://lore.kernel.org/all/20231127051414.3783108-1-victor.liu@nxp.com/T/#=
t

Regards,
Liu Ying

>=20
> Caused by commit
>=20
>   39d5b6a64ace ("drm/bridge: panel: Check device dependency before
> managing device link")
>=20
> I have used the drm-misc-fixes tree from next-20231124 for today.
>=20
> --
> Cheers,
> Stephen Rothwell
