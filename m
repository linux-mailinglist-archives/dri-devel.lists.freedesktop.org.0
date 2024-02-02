Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4256846E3E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 11:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2910510EFAD;
	Fri,  2 Feb 2024 10:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=asem.it header.i=@asem.it header.b="XBTCJr6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2123.outbound.protection.outlook.com [40.107.7.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8478A10EF05
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 10:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJJrIYC6XReprd7u6AUJ5g1DIKJRVtA2jLFb1ApSw24CNxYXjwlRWzKBvLSLXC6g5vR1k/ZFFo04bjG8J8Zrvztmwd8gzZ5Jucr5FTKoJlTYWfMtlDi1p4z77YQfNPMOQ9RVZSxhcQftShIAtNlOtda76Z0D3XoRL6mzfM3EBT8gAHhAxqdto6UCZ+FOjegKlBxeZnoAwJhPhrt7tW8WC++wAJUYDOziwKE3keJcN8iuMnRQtjDPEzQjiYJfz2OPpBuUzjHe5TGWOhA+oMKJ+5Or4Rm1yCeDH4WPAnF/HO+sBkaoJHocNHJVOkQDrYYWJkksp1k9ddPfA3CUeTXKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G229/OaVS7WM0OB9QT2qt3EijM3A8pbAwzy12W2aNQQ=;
 b=D9w9aqPI3u64oySjwOJPdjTvi8vXneqWu5CkNEFBwVhkJ65lNOvdaKYCzzFqgNAc3jyhDxldWS+OhWC5IKl3DUy9I5Q8NdS7xaP7ic28OXmWPyVlUcqbVMaCzBkb8D+Ckny0owHsp+Ba8ymPLrKUE96nRvdc7Zte5jQpOAafA0oGA0CvmUIccSqaS5Xj1odmAj83tE0hd5owRJZ2ALo/GreT0ZLwrMdUEy+egrais2snxUrrYZ6iJSsyM0iXWm4dZ6ofwnfgty11+SlKM6+qihKDQxWZfcG2CbtwCcmAGapWwcgkkWjzqblh3JWx9f0lH6a0y9+Zff10JFig+IgEDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G229/OaVS7WM0OB9QT2qt3EijM3A8pbAwzy12W2aNQQ=;
 b=XBTCJr6vHQ//nKXzzLPD+Ftq1jo/GJtadvzS4R6a9sTigyzZQjVtjAHHv1vHsI+OleeQY7KBdtNWksfzbb5hXS3mNofZd4Hu8XbFFdKqrqJAxkE4Ww3lyuWbaOSecr9i+xjg6b1uIBvpysb/+ryi0dIXaPIuKcnFVKBS79ZEzT0=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by DU0PR01MB9166.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:35d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Fri, 2 Feb
 2024 10:48:14 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::f272:d554:d6b7:13cd]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::f272:d554:d6b7:13cd%7]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 10:48:14 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: RE: [PATCH v2 2/3] backlight: mp3309c: use dev_err_probe() instead of
 dev_err()
Thread-Topic: [PATCH v2 2/3] backlight: mp3309c: use dev_err_probe() instead
 of dev_err()
Thread-Index: AQHaVSJjrzpLp99Mw0GnpuhGXMhRlLD237gg
Date: Fri, 2 Feb 2024 10:48:14 +0000
Message-ID: <DU2PR01MB80342AACFE14A5268F61A2F4F9422@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
 <20240201151537.367218-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240201151537.367218-3-andriy.shevchenko@linux.intel.com>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|DU0PR01MB9166:EE_
x-ms-office365-filtering-correlation-id: f6e66064-0d89-4a55-d38f-08dc23dc7544
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TR/ComlcdhfAEJ0o5qizQZttVbYDYLpC9wDOxraG0HDKKcwdkiFGtIo8ATYpgzabCR+fGV2hrr/Df4TbeEFKTWNtkzwRHz4jLz7hAyM4NOyCQ7YrnmMezq+cdSyzhFtv5CzUctY07FqP/3HuKuFNTMJD6SVlbiQ2MQ+MQnzJCU+ymiiUO0U9EfDlOXIuEepyCreIQuzJcLv+/ouAN4FodX8L9loYTX3CUObGpVfsnDKNeLpqjWB9MG3UGSyTym/vP/Znrat/9RQA6kjXpG0iA64Cq8qfTeyDYR5wFDysFAaq4i2G+Q+b9YKBfPZVvxBgx1FeM/zKCN7x8iJ4UaG9ka0TmF47UxinvSp2jfQP5Kpz+XDPnrz6wdEaYm+XmaCv6XGcIUX6TPalLNA+lEMwn824RQd2zVEH0eLNY+O3FraSKChnCom+cLcxuRe+/efX2ZgO+thMXk7oYPg3BcJxtic5cRcMPwoNoDyQtSw7r3XghgmSk/tjBoO/JiQJJGKVVNBQ1Fe4PFOQbqzOP8myvHuLOfsbcCUyk3mnRVDzR3uBfBEyWebn5zIsA/qtic25PTfv2+Bfk4gYUfogS6MFi815+DMvgIk2tAuAcH1kfuzlOl4pa5RChgWhi9CNg7Yz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39850400004)(366004)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(41300700001)(38100700002)(122000001)(55016003)(558084003)(7696005)(8936002)(86362001)(64756008)(2906002)(54906003)(6506007)(66476007)(66446008)(71200400001)(66946007)(316002)(33656002)(478600001)(9686003)(5660300002)(52536014)(26005)(4326008)(76116006)(38070700009)(110136005)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+IUwDA52b4EhTwEbM1TJQWIkLgZ02ZqJ24FklrcrzCj8BQb2iaYSmuIiLMnN?=
 =?us-ascii?Q?nSYYHvwssto3rN1Xd0iQav4gLPsaNtzEVNocGX+r97gwW/U/lJO5+ANl7mvM?=
 =?us-ascii?Q?Bgf4PgMKfQhzfdYtX3iQeXEMpK1n0TvlCLCu1GHhtauaVjji7EDAtW33gTOe?=
 =?us-ascii?Q?Yx3PF18gl3N9mml5ClI8+WEbVPfaFgdpqQzRyBkUDFwaYCkKWqXBZMEBGMBS?=
 =?us-ascii?Q?ZADfpCWAlCm75qsbU9ylBD3hJHcKE2KctLqJtC8ZBi6AyW//SQPRh/9HsWvW?=
 =?us-ascii?Q?h5AKIWXrB1Y48gSY0WuOg7tlhXMHmNfAvASVulKh949ZQxwitfOdK+sG2vS3?=
 =?us-ascii?Q?4h6yAvZpWngK8Bw2QHphHfQX9g+/9NWUwuWYnGOVzoQW/xj0EC8e/PrTyWTN?=
 =?us-ascii?Q?wXzcFsmEwxIRCoLXSMvLG4HGjhGA5g4RFWWFTb2761tcOq1H74GBX90zdImO?=
 =?us-ascii?Q?Tn4+LsEwz+v4UI4/85wIzC92e/YuO+ptIgL7a1bJvLVA7VSHwDjQzp/dFhxw?=
 =?us-ascii?Q?nHX0aJ+ApMqhVAi4x+sb6UCJpho++LrIYGbFacdbhOdOmLeOhTsxGzKnKG9e?=
 =?us-ascii?Q?p9kZ6Rtd0USO3YqTfrZBLJJUhNuuQkIRioBGnRMOnzbAX2Pyt/lwWlxbXGPg?=
 =?us-ascii?Q?1jv4W9w3msCPCA/ZQgTpWGWCSnr+KqJyf9RaVtFfVr79zKG+eOyQmFqr4tps?=
 =?us-ascii?Q?sMSUXLMed0mKas3pF8iHFxZI/EwCKTWsyDTwLqGkEZiWDV89FFdfmlPG/sqP?=
 =?us-ascii?Q?ZF6X6xd286y2/6w0HJqCIICRZATNYeQ6yPlatO/IsGeosRCx0q/KiD6645KD?=
 =?us-ascii?Q?iG1xdZnZu4qppiEOcuDcBM3EtIBzGNtRsuwWmWxog2tg2WQ5Ptnyc0XaoW6t?=
 =?us-ascii?Q?+fINuEgwYewMbz7MvXeZkT0xRb0ARW5Hu595c6dSK1phMJxKgK+KbGAaV6dO?=
 =?us-ascii?Q?VZHbYXH3I6ZlSLN0k6a7WCB8WIllXz6k//g/UX1O/JgSQFKKmzSAftKH6vvO?=
 =?us-ascii?Q?sk5uCTO/qLXfddHRyWT3sUPzcs0khVgzrluptpXALXqf5r7fFd4PupM8CbPs?=
 =?us-ascii?Q?769zjC2JcuTmhE2FSgTyqW+P9EElUI6m9kLYR9diOREP5x6r62UxUvE9+qmB?=
 =?us-ascii?Q?+bQZYcsy5sM/5DRq9FoH2WRHKcqe0Wusl/WDYN+AW0al1Y3zJqB3DDT59wqK?=
 =?us-ascii?Q?XC/TTk0iXTY4+uax6XneyNRuRYajvWz0ODC3xU9/vthiUSVItDoHEe03Tonj?=
 =?us-ascii?Q?enqDDwxQ9zsWsdVvY8iCVzXx1K3fulp7YYUbzVWDsb8XCWLgSmL93IP57ug2?=
 =?us-ascii?Q?eP/oCvMRFZESc9ls9LRCAnWrBenPplFM7sSlfahiv6lxhft5k4fb99cYssls?=
 =?us-ascii?Q?s6d56aHbkUQqiSAb4WIUXVHYa6/SxBDZuq/3Oj8F6itKfNEPAZTmFYFYfKoj?=
 =?us-ascii?Q?E0FYqr2CA7UNE78a/qp8FRYHZ+K8nVlYttkZbrufY22aHvv6TF+JI3E2YIhL?=
 =?us-ascii?Q?Xwi3qJwjsNS66KS68hBYrb1j1kbQ9Y5zfH4F8W5m6QYBJQw/nzeC8zyWoK8c?=
 =?us-ascii?Q?pCakFIKIgIoGKwt2NmI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e66064-0d89-4a55-d38f-08dc23dc7544
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2024 10:48:14.6567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 88BBeKvPIqlTCr3Ynw6pq5r6tjp41j60xMUsyRY9+RxKgORmfb9i8E8uTw2A6nYTVdpSfsexEz+YbTcW6ym9cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9166
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

> Replace dev_err() with dev_err_probe().
>=20
> This helps in simplifing code and standardizing the error output.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Tested-by: Flavio Suligoi <f.suligoi@asem.it>

Flavio
