Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C2383B4D5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 23:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CE610EA88;
	Wed, 24 Jan 2024 22:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D996510EA88
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 22:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706135866; x=1737671866;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vJ8t7RNedy3OI+ybC9dAk0r2dz5Hz49O7ZBJVz1Fm5M=;
 b=gZbU0dR8904lMfz5PK3A6LjzKRzF3DykDHCs5b0vprsmrht0Di2mkZpo
 0C32b78CT4aPcw5cEYrHpOO4j8eZB7IpG8Ih7oHUcdpaTTUzgdBZJW/5S
 1dphwrbGVlfjG8q6mNNYEGoO2H3zYVJBoBJBf8TJiY16Rm8eArGK3vyg+
 Xz1MQPnnUlwNo4hBlqpALefP7hcQ18BFRO9KA/bhsRT075TuJQ1whz8wv
 MwUVEMUYAt68YRE2Ms64i3Ah7O3kqYAPsVSaaVs7rOF/BN+E8jDez4pci
 NfJ2F71giHm8p5wzf4haf3G7PpTaw35RZKMOXqj5nUyUY+LKj3FUG9ZV6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9375906"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9375906"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 14:37:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="876844292"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="876844292"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 14:37:45 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 14:37:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 14:37:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 14:37:44 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 14:37:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEU2XrM2eXMKNmKTrxk8H0enMOvXyIcsZgy86WMGKPYyYGa6VBNUoE7T232YAEpj064TRbU24h/YT7KdL5Q0KKuq57hZSCghjeimWVNzq6vvLcBp2EipBGoVTQcSzyYYhEnj4UOj8fA1jbuzYP0YFWo5VCSABM4PiGnfbUYhwSWQWFpl50AIm0zCpFBcfpqcQNaUAs5RrhrqxrXhvlZKYUiNeOiSZIklr7Zv8qodOAQzhN+aPL9YCHpEwmVPeUCDQ2VtxNrtWgH7cXFFIHUikDlocehTGJB07DlEGeBbH1m1we5Vue+JrrAmqVj1z/UsD7rtiVJJr0rprwrMI+6FSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aU0qwAWPXDOHvNk6VvARR78uMLoIprouoP8acCNUdiw=;
 b=kuIoelG8MQFzHem/A/6J7cRazN2eU4srod5RDCop8O00QGy4+B3xbnfKCDqbuNogpKNRTK5zU1+DDDq/gkGoovGfkDM6qs4F9pWm74sTilEWpcD0yaK6+IzwXWf8f7IKG7WL/UxzQyQ0Px/f25SGH4LAQR71bP6DuRyLKoam7qynmCro8bQ63l4st4wUIpCDGdjcaC5eNxdCuv4v20tKaJ8IoYWM6lHts9/8gdvrdAks2EZ7SQleKxoxnL5Z7H0818HWt7UcBfKBIg6DcK7aPOPRAMO25cPvbXzrnfIdlg3Ez7YTOtbaZrrAoN33VlBPQvSHdKZPWHrU+b6XQ2LNbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.39; Wed, 24 Jan
 2024 22:37:36 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::cbc8:6370:5df2:b2df]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::cbc8:6370:5df2:b2df%4]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 22:37:36 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Davis <afd@ti.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, Paul Cercueil <paul@crapouillou.net>
Subject: RE: [PATCH 3/3] udmabuf: Use module_misc_device() to register this
 device
Thread-Topic: [PATCH 3/3] udmabuf: Use module_misc_device() to register this
 device
Thread-Index: AQHaTklTbYB3YNw8AkevdQa0HClb0LDpjxhg
Date: Wed, 24 Jan 2024 22:37:36 +0000
Message-ID: <IA0PR11MB71855122BCF73421B7B531AEF87B2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240123221227.868341-1-afd@ti.com>
 <20240123221227.868341-3-afd@ti.com>
In-Reply-To: <20240123221227.868341-3-afd@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA0PR11MB4592:EE_
x-ms-office365-filtering-correlation-id: 72509d9c-2f6c-4431-d989-08dc1d2d1075
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cnuhEP8HFBeY7JGsTTpK765qRWb7MZYPQH1/vsBiA2jhANeSfwR9Ku4rNW+fsqUUbnx5OREA0NvIEQIMOI993vYlBYLrfBT0WGMe6ZAKaWYxL1nuQkLRH+ssNXILPNqov6Inai6OJlLEBIRoIabiXV4AdySoYALgUdCeARZbTWUTMcBBsROqIpgp4+033eEx7j/VD6FxYteaTOw/iIUBJeYEM2vCz00rUj4ixyWyWpQNavK2ArJYI5Yf3Mi14vsjYzqH6fyxBsfep6RLwhHpUlyIWNtWegSitBu+nVbISaOr2U6wfGqMH3p0HMdGErjVavTSIus1MrJEz+o2CtURGNf0cnT0SB2tkiALJDU+8u4uzVqaXcglxEfJZ0iZuH7FannxoE4w8JKDZgvbitVyHPr/Zp5lD9+AK1yXTm8GTvRRTIa8Hie4TPmbzx5hSk+ecIjje++At/ePbmEC1uSv1M4g638WcY5ciKIko98fxPikIYVrancmpkWSzdmdmB0BvrCH3kE+LXas8KQYXF0iq6Wz8OHZmaZ1i2M/vSs5yJVdcx6kPPwZ+QxfEg3vlB1dQxeKicti2Ag7bZhiD8UDDJTz8od1/TroX0xB0KEFww7G7c3c3XrX0jXKVIpenFFM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(55016003)(83380400001)(41300700001)(86362001)(33656002)(82960400001)(38070700009)(122000001)(38100700002)(9686003)(2906002)(26005)(71200400001)(66946007)(66446008)(316002)(64756008)(110136005)(6506007)(66556008)(4326008)(7696005)(52536014)(76116006)(54906003)(66476007)(478600001)(8676002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?9MOIZudVVNHug0posfUbn9pzRx5tofKsdX2Ntr1AnepfxhYN2MTlsjh4o3?=
 =?iso-8859-1?Q?n42nZErG1+xMXB7e2mG8P0SW30TjcUQ2IzTKSQt2mV2mfqmPjmy8nESH36?=
 =?iso-8859-1?Q?Shdi3JAe5Tl9mm5NUYa9Hzci0xKFhJ78SpW6L7/1MrRn8CpZjaudTrgYB5?=
 =?iso-8859-1?Q?UO3OhJ6+Ddox3DBckaWqcWmNMPrhSSnbvkvf011aOee2bH8ZBXyX6RgtF4?=
 =?iso-8859-1?Q?LKLIKnLIcFCaXj40iP+MfbgXINTc4+FWXHVMhkG2rMEzoGPC7whJ+OR0x0?=
 =?iso-8859-1?Q?S5G7IsK5jiefevxRYIaoRWUHzo93TGrG/LKg/mPPm4V5Hc+in0SUnfzldD?=
 =?iso-8859-1?Q?X5KdKwny3N22SWmpOHRvDhuznKW6ZZQemce8sLLsEa1rL6LXvT+nFqpTWG?=
 =?iso-8859-1?Q?lHW1RNHnNnxALRdjVDTtiT1eHF2axxBRDlbb0LvPEqadTf+P1WHtQT/GMl?=
 =?iso-8859-1?Q?xrHQeUnhNfcln+Hvf/JSzd/UYULMtGuHbZsRNXAS8KrapDLvdu3593aMHs?=
 =?iso-8859-1?Q?KjbfKCKmM7+eqlYAvM2hU36XWxRjOROFmY5mMghcZz5KDk5/ZqswWauuUi?=
 =?iso-8859-1?Q?JnI2o+LPcwiMj1ZUQyj6TXv+ODLNYN6f5P7YjfV12V+BZFAIDWHOMQGbNS?=
 =?iso-8859-1?Q?k7LFXsy8t8FoGwtjzfk8ezASzQ1LmdeckCeamKScj3+vR4wamyhye3IuzQ?=
 =?iso-8859-1?Q?7KJQrM1lXtzKaWNq2aE78pkRmVbj+QZMj/U6pQert2CNLIJEhSjrn0z/a0?=
 =?iso-8859-1?Q?yPZvE3EyBDy1FM7I/dPESZ2MxfLY7/kjl4bkLTvDedQSh9DEsa8hFo2pvF?=
 =?iso-8859-1?Q?05GOXCGI1QnfLhca38fj+dw/EFDJWz0EKDi713bDbflcUox/CUBc+VCJ+A?=
 =?iso-8859-1?Q?s3Y+Tj5uOHZSJElUw/FV+zzLqRjjIZwa04moPxO2ioUMm0jM+unRCbvJVz?=
 =?iso-8859-1?Q?jd6Gy7luFfG0im87X/G0igEDmI2CJfb305xOvO4Db9R5eAe2WDFk22/KSL?=
 =?iso-8859-1?Q?oq9M/pt/8uETYinug6p2eRwOwIny9YnfaJdyTolPOPfJ6GA0kzVG30THrU?=
 =?iso-8859-1?Q?gvNQ/f2bue5f42+jrMcy5rdWJNiqjysk/aMbS21t0fgI0v76Shcg+c5vmG?=
 =?iso-8859-1?Q?TCatZc9zuI+BXr9OGiEh/vwhvhTVaQeyiRA0qoPGZgTOD8xIOb0cUFsKPz?=
 =?iso-8859-1?Q?M8RB8OFl/VN3iYTxScQtVn/dqpOE/GB/3haJJS/MvIQVfc5vA2PgHQOyVa?=
 =?iso-8859-1?Q?/RvKImnnjZUJ+uao/bGmV99qVQYcEnmyvfZLoGlWsWrvFJYeownIM5RrZa?=
 =?iso-8859-1?Q?x80yZ3bknZMLH/beHDo26KvmbzVjXNSOlDRBpUNsRTOBrp7uoJRfccxTvl?=
 =?iso-8859-1?Q?FmZjuvXu0JzBEYNmLL5DwqoXeiWp8eoqo9oFKa8z9AYPAnes+Gml02XHrI?=
 =?iso-8859-1?Q?xLslrnyA5NHVwms8U4IZTSTlsV/t7Sb9bBVrQe6x1Nza2l1AW2j1NOKc9H?=
 =?iso-8859-1?Q?/HlEQhbpOtzSwWzwpWpDQgFzT2QMjCryyQr526faqgqbJvDv6rRm+Yj8TP?=
 =?iso-8859-1?Q?ysoW9AtyMZmLmUb+O/SmU0D0hp30wWqRx0Z41IYrPEuGJj5VAyvEJeN0aK?=
 =?iso-8859-1?Q?BCd+WDo4NAXp1D78oDL+KXQxz31V9vSkW1?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72509d9c-2f6c-4431-d989-08dc1d2d1075
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 22:37:36.6153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qrddnmXo4W1xU+84KQMKV1vfVlFpo1rpFClrJajWuZQGgpdRjXigRPFSFCzaE1DYm0+997Ff1w0NhfWQxMyU0FndX3pIdk6/Y0tciYgbGhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

>=20
> Now that we do not need to call dma_coerce_mask_and_coherent() on our
> miscdevice device, use the module_misc_device() helper for registering an=
d
> module init/exit.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/dma-buf/udmabuf.c | 30 +-----------------------------
>  1 file changed, 1 insertion(+), 29 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c index
> ab6764322523c..3028ac3fd9f6a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -392,34 +392,6 @@ static struct miscdevice udmabuf_misc =3D {
>  	.name           =3D "udmabuf",
>  	.fops           =3D &udmabuf_fops,
>  };
> -
> -static int __init udmabuf_dev_init(void) -{
> -	int ret;
> -
> -	ret =3D misc_register(&udmabuf_misc);
> -	if (ret < 0) {
> -		pr_err("Could not initialize udmabuf device\n");
> -		return ret;
> -	}
> -
> -	ret =3D dma_coerce_mask_and_coherent(udmabuf_misc.this_device,
> -					   DMA_BIT_MASK(64));
> -	if (ret < 0) {
> -		pr_err("Could not setup DMA mask for udmabuf device\n");
> -		misc_deregister(&udmabuf_misc);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static void __exit udmabuf_dev_exit(void) -{
> -	misc_deregister(&udmabuf_misc);
> -}
> -
> -module_init(udmabuf_dev_init)
> -module_exit(udmabuf_dev_exit)
> +module_misc_device(udmabuf_misc);
>=20
>  MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
> --
> 2.39.2

