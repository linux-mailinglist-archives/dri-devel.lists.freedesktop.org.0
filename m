Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0FC62F927
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 16:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A3810E6FE;
	Fri, 18 Nov 2022 15:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD55A10E768
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 15:20:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8E9AtRzzHHBwkWnJvShlqBaGAoGiBCPBuZB+VBx8JxeuC9c7zFyl+5KXi1WYDsiItfBSnroB1014uBvQvQYT0rGtj+N14gwKw2P49xLjsGAm5aKg7G9/LBqO74n4L6l7IXL1kEdovqErJY8XLXI0zjjSY35WFSTdcrTedWepyEqRWEjbD81TCpIW8wpT68qGcgyTfkEzUytzzxr2y4ty8+R5DSe+G0IBWBMhaIrTGQMBY7CwvnjfzfWaVT/K0VEeMxPg/hK1eARCIEfsLqq0hgnkGPMh5woGgseZsJZiPB2DVkag0tG/yy/YLtYxuaAMuMFNgh3MoNqz7FMlT6erQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3sNu8PsjgmzF5josN+oUJm5naVuHczJ3mKr1/JXHVg=;
 b=eW0WFaF7Y8FWVPgq6Nn9yWntGyzGIeGAnUGXqxELaayhHydwrbGr8VskpcSSC3/62Bym5kkCWlzJCc7H60HlKwN0TvFUYkbSWSO3rGJ4hZXF9/vYRbWeIeWigtSmO4B+mUXdb6D5/jaQDv9nRIQIvF9WAeqn4xjI6KZ4prK6+zYg78t2L4wV+GFLPx7Lx25oG0qWeWBUmp5H/Fdq14rU0NNugITQ4QSHQIMUCPe7oehpN+DTCTqidghccHToUi2t8wPylaYNE+ZGqRzsxHWM2cH1yFxoSWimf05Rls40Zjo7yFe6gHBj0YYhJ7x1WK7G8oqwSXzBevDCRgcK/zk4YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3sNu8PsjgmzF5josN+oUJm5naVuHczJ3mKr1/JXHVg=;
 b=ghp/5oDsvVTpGk3uNaSkWd9JVT6TTencSNglJuIrzDjSfY6p4NSfAKXkRKV4sR5pe7v5WUQjQnM0cbCXkGEvGxTd4toSpqEnzKyxpfsif9TK6sJZbDE7KdWFrGHA2hOAm7iBe6HQQHjPTp0/ZI0VdkH6saNr72X17BnWkXtVTmM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8793.jpnprd01.prod.outlook.com (2603:1096:604:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 15:20:29 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5834.009; Fri, 18 Nov 2022
 15:20:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dan Carpenter <error27@gmail.com>
Subject: RE: [bug report] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Topic: [bug report] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Index: AQHY+16ZX3QE1FY8a0mWjMFcyJwrOq5Eyt+g
Date: Fri, 18 Nov 2022 15:20:29 +0000
Message-ID: <OS0PR01MB5922616741B726DEE4A5047886099@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <Y3eeMGDxaLcRxu69@kili>
In-Reply-To: <Y3eeMGDxaLcRxu69@kili>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8793:EE_
x-ms-office365-filtering-correlation-id: d078a90c-89de-403e-4a07-08dac9786d71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jMQsOKob4KdxtFCPIaNPuU30jaVYWiUWZPiRu8DBpJGQub5e5qS+8r6I7e+gr2N2bskNNT/FGqeoXUG5o6FFQpgkZXYxv464Tcp9jrEKCOaHszIu096FLY1d1t1/UgKL5dSVoQhrxp0h7mHxIEY0lHv1IJjqafddTuitFuGB2SAHRZP+CmbiN7K/FF5iYPqqNCSLtFDkaacjQvX7KhXsTcAMOZ52p9KxYY6ubHH4JVYEKC4ZOAuOsZMewlkFvGVWZrAJFMTLon7h2V2BSR36spGBk8rmT7ykc+w5jghBVBFSKT9WeD1p5yku02WqaE2JSXr7A2X2heMf7fDmJMtVACVCiQRQO0BRtbuwUHYTVa6UhwkrWZ5NZEslXAXxnWkUeUQhmUcLmhISCGUGsNRxLVAeiRMFlF+XJpOlwsq9fh415o3NN0Iwt7r7J4PG1IRzu4UR+Oe97efwVx9jysGMPR1uZEVnKO2+KovMp73Z5c4RYrrmiurEXywAp5auotZyDBNyPqLe7f3g5IjEwDSkJ890Reyi+Hj9ybIFi3wOhZwJ/UAuQce1+dhSu/voO/ta/hrOUtDD3cLryspYWw6kpec4oWhsaw0N7pG7vEyUQgIXKysBk+19yYXIYqxIs4AGr7O89IwglTEE/5ccaYPpX4LLZl7LPoQVfo6X+wXd/bDvjVpgSG3Bl38QAuLl63/KJSEpAmgTVe2OXLxgNnYIGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199015)(71200400001)(38070700005)(2906002)(122000001)(478600001)(7696005)(6506007)(26005)(316002)(6916009)(54906003)(9686003)(41300700001)(8936002)(64756008)(8676002)(66946007)(66476007)(186003)(52536014)(66446008)(66556008)(4326008)(76116006)(38100700002)(55016003)(33656002)(5660300002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qztlTzd9s8S/1K+Rfik+WYP+g10HazVPpwFKQYq2l6wJvOcmOk2r53WtK7I5?=
 =?us-ascii?Q?gK/5s3FWOh1Ylzw//NmZrcPLrrjWnLKoFjNRlcJqYzMSdMdFSgpm7NdsepYe?=
 =?us-ascii?Q?vMBWZsxkMrX923T4aw4ILVvvNkUbKeeI2uNiuCg9X/rCslVFH/aW0/iZylyC?=
 =?us-ascii?Q?UP1Cr3tGnBNTkIAZhXnwA53X1Kca1pR9SufGNAQ8xLZvCaAG9D+qjTy7K+Vp?=
 =?us-ascii?Q?fo1bTPlROM8YitWwuRxpxcOwMAeTQjP+AB3L19nIwUsbpTeuTAAEGjM7rPCc?=
 =?us-ascii?Q?204zx+tizyXug8QUl24rPHTu5Qy5XgG7jr1FXnrLSDgPEn3yzmK6Fuhbsvgj?=
 =?us-ascii?Q?Z04YfXvN20ewOjTNE6PKD4oWLDzsSogWJcYNui9VZNC2Usq5FxAI3e92i13p?=
 =?us-ascii?Q?WCA2dxuAcCuRjQ2kwLvU0cS+pPfMlq3wduhBIB3AV0PVwf1IhqUPNi4MfBCD?=
 =?us-ascii?Q?pvVaHs4QP0Mc6zJRbhTOhTfZ/+frHo/GkgAdknEnxT88/T/4QjtcQSXo3kUJ?=
 =?us-ascii?Q?2xEePXXdKA0triPdPoFmg0kNzidNe3IZcnQhteBFuQCtQCtZOeYBVcur7hwJ?=
 =?us-ascii?Q?Ms69M91GN+xNx1VSJlfaeEf6yz8/FWvuhJx6RVrLD7Ea06GvBK5siTcfXyNh?=
 =?us-ascii?Q?7IHIPFstYFZ323gZ3in1RmXYtteOuBUyXwK9ErXRUQeB45R7QyJpMva5gPAq?=
 =?us-ascii?Q?oVdmVkR9cTA7sVQZX6nb4ZtNLkVJT5yankW8BbA8HeXaej/QySHGN6SRnqNU?=
 =?us-ascii?Q?9DGmK6Sq1K0rM+kMjdzk0qid4gsRbmGkp28zDwTnuTNqNoKLPoA4dlTOFGUQ?=
 =?us-ascii?Q?J0e3xfdudizTMPItzBaCQ5YMzT1+rcy/Tl9h43OC50clN4GSO9Ey3DqggAI4?=
 =?us-ascii?Q?49plJ3Ksdzxjbxzcd9x5o+P0q+b/hKgpGe6ijfLE5zqWYsRbnV1sS7v7pEpW?=
 =?us-ascii?Q?5oguH/TwhMwGpm03QYCeiNfobyCbuwMFm+IBjI8zhGNFpkjwgkeifI71cwoW?=
 =?us-ascii?Q?+YlkCqxqnyryYVEwBOe76jiiRk3sZzbz9r2e0FtkE2b4ahXkgHalgZHIz8Id?=
 =?us-ascii?Q?+3HE5uwfreDpg1lryPmCyW+KRK8EW18pP+/3XJnhnDen/FPg1DhJq7DTj+hx?=
 =?us-ascii?Q?zo0dTYqKR2hzu9wBtRuFQCU4x7zmPuqAlU0JmWRDSD6/9or/gEtP7je02B/D?=
 =?us-ascii?Q?mea44QJgo2mBg1OAmCIaCiktjBmdO0WZPTaKprwZAfkEbgLs+X8AP/jXmu6A?=
 =?us-ascii?Q?y+nUlSNLnjMYozLDASyEzGTQiBSOnbRQyfI28za11hQN0rK4XfsWZM8W/gZv?=
 =?us-ascii?Q?mqbM5OzgDOrYR271MdCXGHh0ZS1XL+//0zUidLqiSwdRaTDVSA2hnaXzufXF?=
 =?us-ascii?Q?tcB5R9JyBbCnVl+rCOeWQtC4HiuXilOj+Pdx96wdrWyKUtQwqSjB+GoSGqST?=
 =?us-ascii?Q?ICoxrJci2PQ+oIQyYW/f7YOLgjfCMOzyhQtI5MAsMzuUwHFVRHW3XJev13qb?=
 =?us-ascii?Q?ZpofhGEVRvLqgzPGhAvB97H2QmorcdM70m8xlxbLcmYunqcNXTHyEXBffJUc?=
 =?us-ascii?Q?v02ATLqRUb0BLcqAywBJ39swutsZDwj3f3SAZLrPvZrVn5wfe6L4lhA23+IR?=
 =?us-ascii?Q?Jg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d078a90c-89de-403e-4a07-08dac9786d71
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 15:20:29.5434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qH4msmzcG92pwKEE488cjyNqOpApmo4ABctMrmm0NlGF+M5tKMSvo0W+mSYgz17AZ3M+4Fy8gX8Ag8hqdGN1Q2vNIhehbWOA9qIi5D2Tc/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8793
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan Carpenter,

Thanks for the feedback.

> Subject: [bug report] drm: rcar-du: Add RZ/G2L DSI driver
>=20
> Hello Biju Das,
>=20
> The patch 7a043f978ed1: "drm: rcar-du: Add RZ/G2L DSI driver" from Sep
> 20, 2022, leads to the following Smatch static checker warning:
>=20
> 	drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c:372
> rzg2l_mipi_dsi_set_display_timing()
> 	warn: uninitialized special assign 'vich1ppsetr |=3D (1 << 15)'
>=20
> drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
>     347 static void rzg2l_mipi_dsi_set_display_timing(struct
> rzg2l_mipi_dsi *dsi,
>     348                                               const struct
> drm_display_mode *mode)
>     349 {
>     350         u32 vich1ppsetr;
>     351         u32 vich1vssetr;
>     352         u32 vich1vpsetr;
>     353         u32 vich1hssetr;
>     354         u32 vich1hpsetr;
>     355         int dsi_format;
>     356         u32 delay[2];
>     357         u8 index;
>     358
>     359         /* Configuration for Pixel Packet */
>     360         dsi_format =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
>     361         switch (dsi_format) {
>     362         case 24:
>     363                 vich1ppsetr =3D VICH1PPSETR_DT_RGB24;
>     364                 break;
>     365         case 18:
>     366                 vich1ppsetr =3D VICH1PPSETR_DT_RGB18;
>     367                 break;
>=20
> What if mipi_dsi_pixel_format_to_bpp() returns 16?

This condition is already validated in rzg2l_mipi_dsi_host_attach(). For va=
l of 16,
It returns error. See line 623.

default:                                                                =20
                dev_err(dsi->dev, "Unsupported format 0x%04x\n", device->fo=
rmat);
                 return -EINVAL;=20

Cheers,
Biju =20

>=20
>     368         }
>     369
>     370         if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> &&
>     371             !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
> --> 372                 vich1ppsetr |=3D VICH1PPSETR_TXESYNC_PULSE;
>                         ^^^^^^^^^^^
> Uninitialized.
>=20
>     373
>     374         rzg2l_mipi_dsi_link_write(dsi, VICH1PPSETR,
> vich1ppsetr);
>=20
> regards,
> dan carpenter
