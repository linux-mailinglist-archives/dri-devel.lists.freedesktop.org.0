Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6E85B411E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BA810EAEE;
	Fri,  9 Sep 2022 20:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1528010EAEE;
 Fri,  9 Sep 2022 20:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662757033; x=1694293033;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9yjEb4Q/v2w48/8UvmVAVyUaQ5hl3DAMWZNo8Fz5C48=;
 b=GPwb15PHHzCa3ZGtAM+Tmp0XopgYORfzqYGGlfPS4HSZ4mAXYNcpZa0/
 27MvzWWfbl+2ZJ1ROfDpeGhmBB/YWvAxZZkaPBtmBuRhmmpzZgLETRXkd
 dXLDtQbGPfs8gNEerqauXGvp5p966gNBTICYuhCJrh4mMWB/+JEYC2bJb
 6OjbqdLJtK1iLBYhLG2tdzsJrPk+ovi4Vh6W7Qwy9YQC8o9vbTtrK1Cuv
 zG9Upikcc3BXki7d6fDyOMJH6/xHO0tAJqcaF7oasFwL/ADzhumpj9Y1x
 9huPRthFekc9lSFgXRi0/HOzI0QjsqDNJt1XYjAXFSKw2xQmR4ppoUqmz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="383864687"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="383864687"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 13:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="677314025"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2022 13:57:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 13:57:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 13:57:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 13:57:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWAd0Igd2goEtZSBCF4LU3JC6Kc0JDFL+VWkXXDcPmhwSZG84MJqDjGT82beWBymT27f3wJ2k5haRgSO6MXPt4OGlbBgzb1x8oP+rozWhQXG8ZRubIxv2+5IS2nz7eZYqCHsMNEJGW0lA8GD9jmm4zJa8zRVcsweG4Suufu7pKauhFhSle70aGU+mYwVoluiiSnwhtoF316W0fB9fkJqs9dxlrDe1qBmuaFpEr+EU242cxRKwC2TWXsltagK7CJRNLbnFsCOi7/LZfiTPqo1RNQgJQNKdcWvOII542ZHyCKfuLmzqx6gjSPZ1b4tviuUKCk1orB7Uo8PfjAeAfnUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqL+g+S7GOiPj7l0m/vX7zXz7DuBYvgCMamAt/Dg+5w=;
 b=LGBZ8WtUvBXsGYSjx6X9PkwetplOOq2OC6Arjl6RJZ4dKmNINoicyKE381ZkMAbkKA5Sv9pLegLcO73yHrapw2X3b0g4So41hgkhFK6BYxtFQ/+iOQM3gxShLvtoVd8kcSGzltsiYZRgD+i3mtsuz6yA80PJVuG5LaP5OqG5Rs8BhLh9IFo8qzY1DE1xjO/iXxIs1EMBYFYioIMLTUNJJKkJoxpSEXEtt60x8sirAa3SXrI9uMOsL5/uIey8EqfZvNhNLUXJ4oXc0LVWXJzeaxuDyKB+kD7M/9unu3Nk2BLvolhljMbH9mFm1RS/B9PbPdOPftDwBV8SpLS0WjL8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Fri, 9 Sep 2022 20:57:10 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa%7]) with mapi id 15.20.5588.015; Fri, 9 Sep 2022
 20:57:10 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3 07/14] drm/i915: Use a DRM-managed action to release
 the PCI bridge device
Thread-Topic: [PATCH v3 07/14] drm/i915: Use a DRM-managed action to release
 the PCI bridge device
Thread-Index: AQHYwkt1O+pC1+y7HE2y74SINCzkg63XmKxg
Date: Fri, 9 Sep 2022 20:57:10 +0000
Message-ID: <DM4PR11MB597182C92B58DAECAC44FCE387439@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
 <20220906234934.3655440-8-matthew.d.roper@intel.com>
In-Reply-To: <20220906234934.3655440-8-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3601908a-76b9-44fa-80a1-08da92a5dd51
x-ms-traffictypediagnostic: SA2PR11MB4793:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZaYwnSPoOFUCd4Lm4IIpMBQB4NTz16FU43h811yoWOrWRfdjtGAW+JNUfTg44Uey6QPDTF3wqjamDkZ4Kx0rSTW/WtqEXxIK7E2+N+uOJnEwE3Js5bk1CZ76Te4L6Y97JqKt+5fo0BXleVs1OW/LbFbcD/CYWFdvY2BY7bzohrq6xeskjBBPllooBaT5gpvdyFc0es/GOZlFW6RkmkINH9TwseBOfKPgGv6zaMc+03YKRB6afipVpuLvfjcL5mwNe4gDe/SEfKgAZ5PDptfJWolzOPz/cGEj7gifibHIcRKQVenuWxvyv070lRCiGL4uPcNlXlA4gFIJsEbcP7/vQsRUSklGulj7AoFscCotvwfYqE+E3OJLtsreEkbXy3sxf26HqTGgZVqgrpb/Do47tOBpFpdHduHG4xZF88lBnS7uFMk9G95fLSBaOA4HL5wmiHrWrLTJuWFT++LILyz5UtsbKblMW+PyMVZF4c7DD+60VjwdCx33kOSIxtrsX8N7wVWRjpg9bZtvXI6at6GlxFJOZRSXYKvkPEZwjuHR2wxdeAG2NIs5SYGOf2NdHd5yPlZVvaRWinLzzoVeZg0AySKfOgs9xY82ctQRkIhFBuDEO1Nh+AjayGAX8IpB+URjGjUnj7PNlM2wMCbJbW5sAN+nkCXqos7qNwj9dSujQjSOEawAWh5qbx/MNl9nOiUkjSTqmim3LuIHT8ffrW9XNYNIQJdFTcDZxH5xZxs761//Je4rhYYlgssVMgWFoPw2KvwR2pPogK/m07zsh3/4dw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(366004)(136003)(376002)(396003)(122000001)(38070700005)(33656002)(66476007)(66556008)(76116006)(66946007)(4326008)(450100002)(64756008)(66446008)(8676002)(38100700002)(86362001)(82960400001)(83380400001)(26005)(6506007)(9686003)(478600001)(7696005)(41300700001)(71200400001)(53546011)(110136005)(316002)(55016003)(8936002)(2906002)(186003)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oZVeOFq8p9TXJanWRFosoXGXLpSwOMAFSSTooZKkv0xfZSsdp1Dg5+vCnZad?=
 =?us-ascii?Q?gL1ublAAappzFsmSr2pdfWWW4dZcUSoVQ6IhY4i5lEt4HSvMseRlh6wKXyL1?=
 =?us-ascii?Q?7nvoGkbI8WJKvQHeM/xtKjD3UAdXqWEdl9bczkE7xRXjoQm7ZY09leU7mxVK?=
 =?us-ascii?Q?1vu4HUU3HY2u9IsTo4cnR89/a+vRxZPyZAWPOJXDHPXqy+ncq9yoR7Xj0ZA0?=
 =?us-ascii?Q?B8Lg/e2nCtx9dJPjQor5mQOQ7mNbaoU6yFMmoPtmoZFV0I7VpBElC+n67BMK?=
 =?us-ascii?Q?QTfTi3sZ+2pi76MkJVYQWJf7Smvf1YU6aV4yYOx1e4v7yXckpCf0wijomMxl?=
 =?us-ascii?Q?0bFLNkxENAucujmtCW2QxN+bHP3jQLQVSP+he5nCtE6igEFoHlSzZu2kflRz?=
 =?us-ascii?Q?HOHoF1VHC0sfVfzV26Xiyj3BISR1poczIiqzM+xxnbHEbHx2TWBmSaBgVxxQ?=
 =?us-ascii?Q?QUzXFVu7hT6Tgpzw3OCi+ctwx74IQuEoLKoBi0ZRK+rHhHUp0/ioNRUeHrZ3?=
 =?us-ascii?Q?FPOL1QDjTtlblbh3phB7rL74bPgh6HKt4cws9vFKu8RqiQxe32Porx4NflFI?=
 =?us-ascii?Q?Imnyld+i7TzyY1rfYtKnOzXc7N9wdR5XDlWy3qJlVRFrRnhKpCMB6HuJNmSN?=
 =?us-ascii?Q?cbtf92OofUMtQlwGbEaCDmqdL87qfGdiDvgXLJ9S3uq2A/6npn48RbR6qqpY?=
 =?us-ascii?Q?fqPwfQhxm6IdfHZhevlR+ZCnK3SZfej1vLtfVEVLoUF8U0szaBIw9+BBHmt2?=
 =?us-ascii?Q?U/6afm8va0xm1c8VKuaHA+6H7UpsGnE05rg4JXQXFw2la6c3hzReSvOAvBTe?=
 =?us-ascii?Q?xXZ8QYfITy5YCBuSN3UcV/JKJS9D/pAvWMneB+EqdtuYYxm0R3pFbMRwcILb?=
 =?us-ascii?Q?TzZk0X94aqG9PhnQNmzSv2C5fxapCIGbmEsgSy6geipVw9rpGdwyNEgGaIjs?=
 =?us-ascii?Q?AVNwS3GkNb+DTnEiS9FM8TSW3kl5WmOnKjb3E/9xZ3IozMaK4zVAyD7PD/bs?=
 =?us-ascii?Q?hWKrpL5/rbRd5BiJSePWVu0x3IejFDolUbSbsPg8vXpm75IfOJtPF+SjqxJJ?=
 =?us-ascii?Q?8IdbxDywUxtE6UQa7cLqOLqBygZURaT7inzNzNFg6YRia6cIOMCsGgeKppq7?=
 =?us-ascii?Q?1cjx0g4mSYLspBsDUqp8di2g7CWmnn5jyAjWl0ACs3+Zu/EON5TWXTIHetER?=
 =?us-ascii?Q?KIyQF00BJKpTA158M4DY1NqGui42QWywtVP3B2GLcEwSVd3LvKIeeSWZuEPg?=
 =?us-ascii?Q?HmKiDiB9lX/5frFw70A+lOTEWhTkIIftTSn7da4T5ulotWeiISKR1IYvFotn?=
 =?us-ascii?Q?QRXQ4l8tR7GvUCRPPYJt7mKVM/oMR45LXTjJNG9DgdcYVUHfcsB9TxDDhc2N?=
 =?us-ascii?Q?m9LkE9z6pQ8RKpndYXtaLtsm91IqqHjpJyyMX/vw6R06H9/gAVDvLv9VMV3r?=
 =?us-ascii?Q?t1UEnI26b2ijlWeqS9SasXnYNVGcnJwRAkvgY06BSLFoG5BYyomLFPbl3JaX?=
 =?us-ascii?Q?JKgBFHi9YWSf1o8q0pGNFyS55HE7HCzwicvUD1rYhPuqNCdMtR/C6V9zM3ZU?=
 =?us-ascii?Q?BggUQ/PiNbvf2KlIXeMitwNtZqtqeYYbueemzdSKfvDjTXVLwgtOx4iu+u4K?=
 =?us-ascii?Q?OQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3601908a-76b9-44fa-80a1-08da92a5dd51
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 20:57:10.6243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SbwMyGQWI39ZrUlnr4a2A86seq0PiTPzpbb4SphKdw7C7ezVMdKImXwpSxllNvjoYYhYlabczcq+VAw8onk3qnDkHt+OL7tVTDWTEWP1Ruk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4793
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ma=
tt
> Roper
> Sent: Tuesday, September 6, 2022 4:49 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: [PATCH v3 07/14] drm/i915: Use a DRM-managed action to release t=
he
> PCI bridge device
>=20
> As we start supporting multiple uncore structures in future patches, the
> MMIO cleanup (which make also get called mid-init if there's a failure)
> will become more complicated.  Moving to DRM-managed actions will help
> keep things simple.
>=20
LGTM,
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_driver.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_driver.c
> b/drivers/gpu/drm/i915/i915_driver.c
> index 18acba1bc3b0..1f46dd1ffaf7 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -105,6 +105,12 @@ static const char irst_name[] =3D "INT3392";
>=20
>  static const struct drm_driver i915_drm_driver;
>=20
> +static void i915_release_bridge_dev(struct drm_device *dev,
> +				    void *bridge)
> +{
> +	pci_dev_put(bridge);
> +}
> +
>  static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
>  {
>  	int domain =3D pci_domain_nr(to_pci_dev(dev_priv->drm.dev)->bus);
> @@ -115,7 +121,9 @@ static int i915_get_bridge_dev(struct drm_i915_privat=
e
> *dev_priv)
>  		drm_err(&dev_priv->drm, "bridge device not found\n");
>  		return -EIO;
>  	}
> -	return 0;
> +
> +	return drmm_add_action_or_reset(&dev_priv->drm,
> i915_release_bridge_dev,
> +					dev_priv->bridge_dev);
>  }
>=20
>  /* Allocate space for the MCH regs if needed, return nonzero on error */
> @@ -452,7 +460,6 @@ static int i915_driver_mmio_probe(struct
> drm_i915_private *dev_priv)
>  err_uncore:
>  	intel_teardown_mchbar(dev_priv);
>  	intel_uncore_fini_mmio(&dev_priv->uncore);
> -	pci_dev_put(dev_priv->bridge_dev);
>=20
>  	return ret;
>  }
> @@ -465,7 +472,6 @@ static void i915_driver_mmio_release(struct
> drm_i915_private *dev_priv)
>  {
>  	intel_teardown_mchbar(dev_priv);
>  	intel_uncore_fini_mmio(&dev_priv->uncore);
> -	pci_dev_put(dev_priv->bridge_dev);
>  }
>=20
>  /**
> --
> 2.37.2

