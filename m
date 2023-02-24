Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414146A178F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 08:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F7F10E0A3;
	Fri, 24 Feb 2023 07:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9058910E099;
 Fri, 24 Feb 2023 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677225287; x=1708761287;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pUnqgz/R/n6xywVVZiiExvd0slDq0hanTIiRgZ3WYW0=;
 b=nVpAtxZWdQl100WQhiYMlLT7J/uBVTeNNqr7wMLNtx5sc45nh7tf+Ss5
 bLDZ7aVaPEVK2cazwkaXIeyScf4iPBzlA1R+gB+dqoYnAd5BjNx8fYprv
 S0jFQGFg+nyr3zRN8rAHHRyXpALXYn5OCf6GAarfMeEjJESdxCY4kaOYj
 NSbFnAf9p174SO+2AgEYylyG/SHJzZB32DnVRAtL0wyjmraGQZliarp7C
 AdUNQmtWFWInjPK/6pUa8BRklwgenFK93sIk8QdS5BBMQ4v1QqdAotRNQ
 /C5DXZJYkDwZ9zskzTVmnV3dMOUPuXBsIWaz0WAfHvOdYKU31meEnuKAX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="317177064"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="317177064"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 23:54:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="705178434"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="705178434"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 23 Feb 2023 23:54:46 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 23:54:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 23:54:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 23:54:44 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 23:54:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAAmI3e//QzKftUW3UkEIZvxOuAWKeQs1gZpOZWILH+EBUkIML53oFRD/lqhGvFvcJUWd7BHio49BzFa74JR6nK03PglX5Ll9WdUrsIk6VFZQvbExc+EZM9tVxEu4UBbmwkz1UkliTtaRv4XUQIgxfh/MZGuXZGFGYtTvd/lf9Atr5FRoRzFDUrI3m8Pee1kIpM6LdrptWId5QP2r6gald9WaMUWDqA8WZHqVRncRgoz8jdjkQYYHfXr2fQWxy0fB6l5O4bfKmlLENygZ/MhxUAgpIybdoC6paU4JtPujyhqulMCjxoJHglWlTjRsPAxJNfdWud/Ld+czpJs+vzcDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXnkS1S3R/Ubd+ESgTP/4l72F9atB3FR+suZRuj84JQ=;
 b=ZsuYxJw8/ONOziORUwICTRH05tcUQWAHpY7atjt8JJCsXIsDFfsk5VKlAqKYIUmyHyNazaU3pfgf78HsTzfN9fazfY19GASgJVT2KtJZ8UiPjlq7ahqshtGg+owZ29OGofzVEegVhJm3K49zvO5i8AJgo4oIejJVUFxz5mWeWhRSdwLkI7hgssQd/9nRE8IAicjRBg+aH5W4bTrz1ifeZT+369kIX1IYLp3UHfMrORHbU6SpWwVTqShL8yXJcPTGxF5I3rhK0gHD5Z8ciGxw6j0lrawwVKxnnmjGKBTUSoBczX7bSOvSOUTGTAjzlWq4YRIGLk+wtPiMXPDdP9NJig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 07:54:36 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3430:99a9:fa2b:9ccf]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3430:99a9:fa2b:9ccf%9]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 07:54:36 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/mtl: Apply Wa_14017073508 for MTL SoC Step
Thread-Topic: [PATCH] drm/i915/mtl: Apply Wa_14017073508 for MTL SoC Step
Thread-Index: AQHZR7ZzdMsAyAgchE2Kkc4jEze0Xa7duZ/A
Date: Fri, 24 Feb 2023 07:54:35 +0000
Message-ID: <CY5PR11MB6211F72B70FD73AC381D1A4295A89@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230223184140.3452853-1-badal.nilawar@intel.com>
In-Reply-To: <20230223184140.3452853-1-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM4PR11MB6117:EE_
x-ms-office365-filtering-correlation-id: 528757eb-0e14-4620-73c5-08db163c5f68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q6H1uzLxxD6mUC5QU1ywm+wudAldO5qmNymmd3JHlaWHWrFs+jKKwJagPieTQIFUgtw58LQ1dnW+2Skmtt+D2fDW1U7QZisivQ4EYo/zuSI+M5Zu8RaMx4xE4FYZxpd7rZx0N6Dmf6YS5Ayxuma13JYGbsdzx9h9x91Uzi2VS46eRbRkjWFeeoIn6BQlphOTluVZ+LG1W5ojo3rhmSXzo6bre9i1QDTw2vfmyM0Mp+Jkmjunehw5yBVtrsnhSQfnnK5zEEDIdCllu325TCnpTCsIGRWaA8rfDIt+q+KZY9EzGwfhpT4pFJBVFCTeumJAyNwsFR26Q+TcpYYal99bs2RR7gTArq1fF+B4M0ozmtUIDsbgKfW/6WtAhXeTTgW1eV29dTHvw6TLfoGs4zcXoVMvZjKhu6PBxEBoJi1zkC5RK/L+bhGReJKPmNEufj3fDVipOokkm1wkOkML72P8d3yKBvrr/Gjj4EKMlzQ93LCHkCP2GCQ+Tm1R9WTUXgvi2cK+ZuLMvuProqVYG3hALUS/o4tY2mUeALNcNicv+oX4YIoWsnSwKilhC/9y6rusRF8QaEuhinTeC31Wk9RE1ueWuSFgdUOAqbrOwz183VHnQDBseb2ERRJdnSXH5F5vQziBm/Bz+2T64bC/WPNHJfgqU397TntduS1i/ZT7cMJ5zHNFv2/Mvh5vjXd2uodVJyshpdksDFIefBAlChq2Ig==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199018)(2906002)(83380400001)(38070700005)(8936002)(76116006)(33656002)(54906003)(52536014)(5660300002)(110136005)(4326008)(8676002)(41300700001)(316002)(86362001)(66476007)(66946007)(66446008)(64756008)(66556008)(450100002)(7696005)(82960400001)(38100700002)(478600001)(71200400001)(122000001)(55016003)(26005)(9686003)(6506007)(186003)(55236004)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vK7qrwzbGSL/fkbh2jjkrdqu8kF84tNS380Qkh8dbklA9/MqEV6Lk/NV5kA/?=
 =?us-ascii?Q?9OFUgeoX+NFJh7nGPg9n89MJZd7tUQkGsczUKokvGHk6mPZTK83SdufO3kpG?=
 =?us-ascii?Q?dbb00Hm1gEFzOsrk9lqAMI7iknX6vlkhpFwSx5MHN/H2BGhGX+0DfJxycp/7?=
 =?us-ascii?Q?6iQg3XfhJjC09pX+PYtNGzOd39kOKOf1xKmY4SRpVto6kW11yP/wzUclDlmG?=
 =?us-ascii?Q?LixNCk7iYL1IJlJkoBVNMj+5ZyLMBPy1+0atiSAgeFEjh95YsQKi7pOQfpG3?=
 =?us-ascii?Q?O4b164m0Xjk26qoRrKYK+MGNB010xVqKYldkAgt66GREDj3KVBBZwuzddh+C?=
 =?us-ascii?Q?C1kvze1+7fHc1BzT65uooo3cgbGeA/uJipNPqIZlVrSFQD7wffxEIWtJNA7U?=
 =?us-ascii?Q?imcWkBdDL58j9VSbFzWUZNIuBJZS8uHKwbFcz1lmabBurOpiKWWhG4Xem1RV?=
 =?us-ascii?Q?pqlmLNprYxljyacliuXC9vdrfBtIcyLxZaLQNXZ1dEfuYD1qSTVlMYd8tf4D?=
 =?us-ascii?Q?ZRI1d8UWoaEMHWnknywJQX9xAkipDbCbPnRuH7FNnW+0N6qqNf0dogXjVsLZ?=
 =?us-ascii?Q?GL8XSaSvAqS/pmOHzqvyRjkYXisdlLnIY1TlnWmvDpdIY/QllKhYeVpduMBl?=
 =?us-ascii?Q?YQPIBwQR7YyVZWezFbjc7Xcnc19AtBeyxzb1Z0lXSQP7rRt+rzvNW1HCGaly?=
 =?us-ascii?Q?NmxDQNIuEfU/Z39k6/fJE1iulLRDosoSW8lKcAONbmx2kIKbY9J4gC9mCVhs?=
 =?us-ascii?Q?ndCaqY64st5uUNNV0J0WKhFICZoDJC7Wf+kyyX40EqiR2UGmJ2dU8ARy+Muw?=
 =?us-ascii?Q?n1n4pEmBCth3gxTy4cWG2LZmtQqqPnfkFlPH/RH6SZaFogqMXN/17/uVD5Qp?=
 =?us-ascii?Q?hGBMQljZO0I4V2uOYvzC5NSd+NLY3mnVpd06KBT7ZNZKLD3jSCia322xrt47?=
 =?us-ascii?Q?4QRLhThjVNhw38/54tI/v3kLOoCXCNoc10e/aqlkY4JAYL/KKe/SewoeUzqL?=
 =?us-ascii?Q?18M4crehSW0rTtvNhtrMmAKNcP7fd5DK86Rq6kuu88YjxJTaRDNLjoQBdW8I?=
 =?us-ascii?Q?6Hk0HZ7NFE6sLDEuq7m666BtE92bOvPoukFSZRbOhZTEw3Gd6gn358lS0JJ7?=
 =?us-ascii?Q?uzEN4mWo/E9hKA5ga7jYjSLQLIgzOmyqP52dRxpxg6RONMXCS0AmdvJ1E0J1?=
 =?us-ascii?Q?xsXJ57wkHG90QTxCKq3GBXFrL9gkEYThEceg5GrUpn8cM4YiQJIH2zmhKN+s?=
 =?us-ascii?Q?NpRoTfe5lCJu7DSvnfDmR5qofPhKx/CF6+1ETgNXcaPWDkIK+1++RIM5WAIY?=
 =?us-ascii?Q?/mNph7zyrKKNQ8juEk4ZakrJWEcXwFFcm50eRKyhpi3FBkXb3be8fIs9FUCB?=
 =?us-ascii?Q?I0u5cbLx21BXLQZSv39cCD6GE+VJl4tQk8RVqasy50aIwC3e+nasiZVGRg/Q?=
 =?us-ascii?Q?TsPvsmok9fdMWVsRz8Fatljn2IWAoyncCtRMdxaA2RmXtH/BVfkyV+d9Ruff?=
 =?us-ascii?Q?nfG/mTSgzBf+x6HpK1LG1C0TJ2+kUXA/nd3X8pwrP9IIFZnSIx1IzEkIEuot?=
 =?us-ascii?Q?VtEped0HmEHck92ZwAB3+nsQPbC4V0vuNFcJr6wm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528757eb-0e14-4620-73c5-08db163c5f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 07:54:35.6806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/WBwaugA2hNFS6lOFuR1KN8PFm+nAtlzt4tf9XmVwFcQsZcG+WXJryhYJ5eLYIx8Aptyz6Xr37CDB/Bcb1smT1rNpgEZMxujbu9O/cMFWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6117
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
Cc: "Ewins, Jon" <jon.ewins@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Friday, February 24, 2023 12:12 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Ewins, Jon
> <jon.ewins@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; dri-devel@lists.freedesktop.org
> Subject: [PATCH] drm/i915/mtl: Apply Wa_14017073508 for MTL SoC Step
>=20
> Apply Wa_14017073508 for MTL SoC die A step instead of graphics step.
> To get the SoC die stepping there is no direct interface so using revid a=
s revid 0
> aligns with SoC die A step.
Bspec: 55413 has mapping of SoC die stepping with revid.
Please add that index well. =20
>=20
> Bspec: 55420
>=20
> Fixes: 8f70f1ec587d ("drm/i915/mtl: Add Wa_14017073508 for SAMedia")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index cef3d6f5c34e..4ba3c8c97ccc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -29,7 +29,7 @@
>  static void mtl_media_busy(struct intel_gt *gt)  {
>  	/* Wa_14017073508: mtl */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) =3D=3D 0 &&
A code comment to explain using revid would be better.
With that.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>  	    gt->type =3D=3D GT_MEDIA)
>  		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>  				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
> @@ -39,7 +39,7 @@ static void mtl_media_busy(struct intel_gt *gt)  static=
 void
> mtl_media_idle(struct intel_gt *gt)  {
>  	/* Wa_14017073508: mtl */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) =3D=3D 0 &&
>  	    gt->type =3D=3D GT_MEDIA)
>  		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>=20
> PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> index fcf51614f9a4..7429c233ad45 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> @@ -19,7 +19,7 @@ static bool __guc_rc_supported(struct intel_guc *guc)
>  	 * Do not enable gucrc to avoid additional interrupts which
>  	 * may disrupt pcode wa.
>  	 */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) =3D=3D 0 &&
>  	    gt->type =3D=3D GT_MEDIA)
>  		return false;
>=20
> --
> 2.25.1

