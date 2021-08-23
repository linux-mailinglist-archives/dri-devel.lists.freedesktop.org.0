Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC8A3F53A2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 01:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92358898C2;
	Mon, 23 Aug 2021 23:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6F5898C2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 23:24:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="197444352"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="197444352"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 16:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="464225310"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 23 Aug 2021 16:24:41 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 23 Aug 2021 16:24:40 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 23 Aug 2021 16:24:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 23 Aug 2021 16:24:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 23 Aug 2021 16:24:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOGBuE9pZASEjbT2MZUPZxb4IDxMwRwlWeT2sdOD3VNA5Yuh2T4G9mugvVXqgxO+Bn7HoKIuZv9NgQaspNeDFdX6/yD9u7R/o10u2Xs5CFwGymhycubZhIXT3GMAerK2/6yPup+jBrhketoh+Kl3j3GuGYaJn7hKsUspM6Mf6FwXyNyCyENA0g4Zdx7peJOD9jwKCLJAywKgTHOLreyPfzpCijJKeULK/TnuSDnmU4BeqmQsvVnE6zxS+3zzIOMcVedSIxP6DxOlNMTWamP81erE9LRK3vrmXZBjT0NGXEoqtloTctYYmcAk0kyka68qWhvIVzSU3Ag3g85A80Jivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2C7h9W00dTR+kePjwfRLV3EI4Emvf1uFzVBVVnFQJQ=;
 b=RG9g4bv7yvkZatBDIuVEENTJXerid6fV6s1Nkx7xRcMCqtZUrcH+L77aYz699ZggLPZdIF7MEcNr121sDq6xQdB4KN94QyS6PXvjXTK2eUhNiSWEc921Y3LbMxTI3AMS7N6PxlHZT5o/cnPJ0U29Dj/LoAHlyI5bDce0USki1m2BPQQbw/z19OKm8AWpNlm8CdEemnaExk1lgOV3I0iEQxJb1qDR8rVq7j25oiSj89rmdJaVaj0zPjU7m35BkFJcd1OeuYT3eAmwq3/Z/oZceLVmdbOasYXo/OX/KpJL2i27t9Da/HFnTPJFiy8QO1epqAs7OIhXvnTEEgFiJaeFSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2C7h9W00dTR+kePjwfRLV3EI4Emvf1uFzVBVVnFQJQ=;
 b=PLUkOY5uRpas8P0mej3LFS8IXzCIo2LsAW1fwdPm9V0qWExie/HgF+iGJfpxRWNHfccXcH/x7wPVoXDP8B4nnnAxBkw8agpIC0e0oWSij4Hgv935zioW34ipN2C7+uhsl1PsGhuHSU3X1c4cTVHfyAN2QxkiySL8Z6Sa3jWBZ0Y=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB3768.namprd11.prod.outlook.com (2603:10b6:a03:fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 23:24:38 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::e189:6f03:9fde:2062]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::e189:6f03:9fde:2062%5]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 23:24:38 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: jing yangyang <cgel.zte@gmail.com>
CC: "Dea, Edmund J" <edmund.j.dea@intel.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, jing yangyang <jing.yangyang@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: RE: [PATCH linux-next] : add put_device() after
 of_find_device_by_node()
Thread-Topic: [PATCH linux-next] : add put_device() after
 of_find_device_by_node()
Thread-Index: AQHXlWijNuCVLSkwqE+rSAtXsowutauBv3Ow
Date: Mon, 23 Aug 2021 23:24:38 +0000
Message-ID: <BY5PR11MB4182B03BCF3FE98A5B0054D78CC49@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210820021029.10770-1-jing.yangyang@zte.com.cn>
In-Reply-To: <20210820021029.10770-1-jing.yangyang@zte.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b32846ab-e4c9-4580-5e6d-08d9668d2d48
x-ms-traffictypediagnostic: BYAPR11MB3768:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3768B06F4A2E068E4A1B5EB98CC49@BYAPR11MB3768.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:449;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K7R8VdnhxauBxrvbCHPljpCb8SOHu5L0TRQ2bXBuseexBqazhjwUEn3PfO0/AH9pczs31gm+1E4ChhELswXg0a7gtdIvgmPsG6utFZqqVj2NdhRKkLc3m2bQK8RXmfhr+pZRgo/lDl+EhquGPP4XRXlgaNFLz/yP1WgNtrNXn39bdF/x8nUqPltYWu0ggebBZg3oDG/Upp5WFPWW0Yyb00nSlz5nqw+QADn+3/6rgylgfu5EvMEno4JTDqjFwilTWvsj6ucsWz0HVqQEskAbxNrJRkY1tI6hhtSRKfVkKhC3ZQ3g45HOExayi/Yf4vfAgV6er4kXfKptjOkJhpBktjXrcRRf6oT8nTWTQYsl5N11054qPoKrWIBXPKFd4XV74/RlDddctO2jx7vfP2l55joQU5BqYn9zvmtAj+YI6uSbJr4TMSnVwroEBv5fCbyX14iUqngmQbjYRx/y1HCFutKd4iyXaJS+a+DYOb+xpoLCEEOm5gFJ47pK0g7vRXdABJOhtTskSwhD1zMRQCPs7ls5v4pAhsN0mhCliXigXSXfZVl8STN/eJycDqy5WqdH4DTJC1COHCjt1n8wNgfZ+G1y95WUgZO2Nq4yYFVIrDz1V3jiklUULr/JJqaNIW7oWGDNkAKF8rKgY95E3J7bsw0Wrm+gHzKJhxHgh9ddQyl8YWK6eZV/y3WkJbeDcCWXg7qPsZyUGBaij2qbv5kg5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(4326008)(186003)(26005)(7696005)(6506007)(5660300002)(6916009)(55016002)(71200400001)(53546011)(9686003)(66946007)(122000001)(83380400001)(76116006)(38100700002)(38070700005)(316002)(33656002)(86362001)(2906002)(8936002)(66476007)(64756008)(66556008)(66446008)(54906003)(8676002)(478600001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T52kgVqHNqTIOk+xxejfUOslBQN62Pi7F0xKYKYxwxd2DDvA81aOwoJOcFT7?=
 =?us-ascii?Q?Qgz5Av5BEAd5gHEbXvq9DjtkVLesYg574SG4y04vcTi9xr1btsf5Dss//zgn?=
 =?us-ascii?Q?d/WVpmj5gg/4RO/eTqTYyr6R0Mcjbp+LcEX9TdWo6EsdTealTAGc3WNgA79B?=
 =?us-ascii?Q?aINH5+rWb4Hf+Ud3e7fCnOyB1XSyXj7Cq0g7SQBgHpb8iKYLwVQBNh/bPsbP?=
 =?us-ascii?Q?DbtW/pQAyDn15H5usCLlwLBDBRrob/lepHRlr6ATmZ/krAGWb1CeyvSKi3fx?=
 =?us-ascii?Q?8EtI6Y5xeIru+SB5iHmkxrLRYe498cCMwCU/9w5xgaDOa1J3VdLQ5xz3hWuv?=
 =?us-ascii?Q?IrM5up7GA0muUR1pCi0PtQym0VJBZ79QL2keC9qmDZG9plIWS5y4QhauKiac?=
 =?us-ascii?Q?K2hgvomfeAIbtdqXiMR3Pd+oW/G4c0sEUs92Ry5AkzIpvnM97FuuIPDrN/AV?=
 =?us-ascii?Q?O5OqDH2fnpwKsUOxezwuAMwNZ9xDMYBY0vRdMKszYt82IqARVrkkEm8JXVM7?=
 =?us-ascii?Q?vaUoIxG4BNc96DhMUhkyYKm+EmlSElIXC7IiKVnX1QyoJIhvucmS+gqldy6g?=
 =?us-ascii?Q?qxZ1dX3dAhwfqJXsWFIweJfUuVMTT39+ghyy7zYVKoWK3igutUPLt7cCkZBS?=
 =?us-ascii?Q?g9G4q9viTGrqtoMHMcXDaiiY3DMCmQdIuMjvbNdz+zIoA89vt+ZZHeQvvf5n?=
 =?us-ascii?Q?myj7vVKhpxAGiQ+gUxb35J8m83qzXGQcqh+liigX7gHLejgMXl7fDSNEK7O1?=
 =?us-ascii?Q?7mh6cHH2dgSA/XpqVMYgyJGcRXa8wqFAv8F5T2HmEXu+odvpfKfb88Yu9hx9?=
 =?us-ascii?Q?wgYFvOMepcea49rj/eFCALpZkIu7ejKksKSf/xUsR+YtoojZ2afZRLKfpRAd?=
 =?us-ascii?Q?09GXyx//a4+Kd1YAvInGpdfF0mnzghV9ExyNbk+SBJL+ZQcS6mD7U6YKGjKl?=
 =?us-ascii?Q?0JcuHugst3ijP7MgA//jZuRzXtRg+1P1abIHbEtoWGBWT2Wa75JCREJWE3Cq?=
 =?us-ascii?Q?xVGxGvVcOpgm0yhE1VOtN0rneWFlk3PsT0LmgImmqk5CObLiQ9N8jPgnMDEC?=
 =?us-ascii?Q?7pXUGq5ePCVomkGnCTrJF35yN/JwY7LmRPchHtFQHwcn41jpgs79tKfP3nYF?=
 =?us-ascii?Q?sgcmViN0LsIoG8RXxD+5B2iYxv38d2cXKx4/qSV7Bb0a2rLh9PqRY4LLukAk?=
 =?us-ascii?Q?cR1f65ZHc7PjiN6/qmDiEuifQwUlfKeg57CkOtwr+/g1qY2w+Xe1pvYZ7JDZ?=
 =?us-ascii?Q?WM3GhINU8UhPHtCsto5pkqEXvAshR3WTJzLDb7Vs8cM/ZXZRUq815RD9rked?=
 =?us-ascii?Q?X4M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32846ab-e4c9-4580-5e6d-08d9668d2d48
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 23:24:38.5005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +MSpIFfZygTFvFxS6BFb5UWUPiiYkwHMIa2gzt25xFsPr0m9svtlwl31dmpYBPsIcJYZ0FZ7mJGccMSIpPHtEZWTHRUuqX5BUpPrJPFJflI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3768
X-OriginatorOrg: intel.com
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

Acked-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

> -----Original Message-----
> From: jing yangyang <cgel.zte@gmail.com>
> Sent: Thursday, August 19, 2021 7:10 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.i=
e>;
> Daniel Vetter <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; jing yangyang <jing.yangyang@zte.com.cn>; Zeal
> Robot <zealci@zte.com.cn>
> Subject: [PATCH linux-next] : add put_device() after of_find_device_by_no=
de()
>=20
> This was found by coccicheck:
> ./drivers/gpu/drm/kmb/kmb_drv.c:503:2-8:
> ERROR  missing put_device; call of_find_device_by_node on line 490,
> but without a corresponding object release within this function.
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> index f54392e..58495a9 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -500,8 +500,10 @@ static int kmb_probe(struct platform_device *pdev)
>  	ret =3D kmb_dsi_host_bridge_init(get_device(&dsi_pdev->dev));
>=20
>  	if (ret =3D=3D -EPROBE_DEFER) {
> +		put_device(&dsi_pdev->dev);
>  		return -EPROBE_DEFER;
>  	} else if (ret) {
> +		put_device(&dsi_pdev->dev);
>  		DRM_ERROR("probe failed to initialize DSI host bridge\n");
>  		return ret;
>  	}
> @@ -509,9 +511,10 @@ static int kmb_probe(struct platform_device *pdev)
>  	/* Create DRM device */
>  	kmb =3D devm_drm_dev_alloc(dev, &kmb_driver,
>  				 struct kmb_drm_private, drm);
> -	if (IS_ERR(kmb))
> +	if (IS_ERR(kmb)) {
> +		put_device(&dsi_pdev->dev);
>  		return PTR_ERR(kmb);
> -
> +	}
>  	dev_set_drvdata(dev, &kmb->drm);
>=20
>  	/* Initialize MIPI DSI */
> --
> 1.8.3.1
>=20

