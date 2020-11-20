Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36CC2B9FB3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 02:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FAD6E84E;
	Fri, 20 Nov 2020 01:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CA46E84E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 01:29:49 +0000 (UTC)
IronPort-SDR: PLqVyFFVJxK9q0isjCq6dLWxY4hxrLSGf64xEgVfSknmc4jKBXBPYDVsm1wDI6XC8hFgqygjMB
 F8XGH2v4GVFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="151244183"
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="151244183"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 17:29:48 -0800
IronPort-SDR: 8pD3qK3qKVYc1torl9UC65nz8Ym4NDQlS5mbLBlS/VJeTSi9E2400k0tj4p6nWcu5oYK8Jh3ZM
 9iTG7lr9IT/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="369055661"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 19 Nov 2020 17:29:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 17:29:47 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 17:29:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 19 Nov 2020 17:29:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 19 Nov 2020 17:29:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1D+XIvrHPtZSvxHBqkW53RD/K1Sm5e5kyPDC3gMFn66WHIndZZlXqiMwulvGY0jF7sOQbj+fBpn4+KGiZGT2cv8TosMxviEMM5a5ui1B7fV+dblbXTMYSVJXL8lnaSAtARWd837VgJbbE2dVx4aD2z/yw06tGwwHZHFoZa/3odUdGYT8Jy2PQmRdlGXzr84eduCQr+7nWHQ2Zk9RG4zFiidOvUYBXyA4HPyGau1ljzEZ7ZPNpA6mCZfsMq2m2jBsbOburi+iTjEb8SfDsXYZH/CHJspfNSHedFGLkBXKq0Venx7k4C9rYuk9PI8nAL9CsspAHMx+g0cgTsxU8V94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8bLmBQoKPtzK3n0jZaDCB69MvwtGdqYV/jQ9/vtyw0=;
 b=INBTkWzuLIEAB3Oq/1GO1roe/U8NJVwwhMWKUQ6RCCW8eq0aTrKYLe1sxraT2713QUTr6h+Sm/iv0pWxw8epMRLXoWteO1OZDjPvgvNj67uZ91GPO98iojkZSVTtGr8y3iOWXTDvO0+1+xi+VpqmDoKFR/77g3yw5asD1zkN2eeVcGboD8olwa0ZQq7/cxx1fC+L1DaRav6mglSBAhiVAHq5370qN78GNYIOeM8YsJPwHvGNwe7OX6yXkFd9r2UivCWiME0DjI5/kOlUNGiLTFaoaOXMkHWHTnhlwVI3dSORVqdgYiw3nYXGNkT7EBXq1Uerm5ywhfGj0NjK7A9dpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8bLmBQoKPtzK3n0jZaDCB69MvwtGdqYV/jQ9/vtyw0=;
 b=Q/VveHUpylq+Vl/OFFY+4R12ATnqQJYhPy7V47DDf9/XvgO3R8vyr2jmA7q3S9eL8uljU5iYVJqbhHas1+OloKDp2bWCSPqBO7NglYC7kHRKtmBDH2vWJNShBsLFTLAXYYCKXARE54zCSYuNGdw3E6/XvPFlSY+ObQ9L5fhmO8w=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Fri, 20 Nov
 2020 01:29:45 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394%5]) with mapi id 15.20.3589.025; Fri, 20 Nov 2020
 01:29:45 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [PATCH] drm/kmb: Fix possible oops in probe error handling
Thread-Topic: [PATCH] drm/kmb: Fix possible oops in probe error handling
Thread-Index: AQHWvLKPwOU4vLrD1UWijEXQ+HUtyqnQPvpw
Date: Fri, 20 Nov 2020 01:29:45 +0000
Message-ID: <BY5PR11MB41823C768894561BEE8567888CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20201117072103.GA1111239@mwanda>
In-Reply-To: <20201117072103.GA1111239@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 738c8d13-29d0-4e4a-66e1-08d88cf3c382
x-ms-traffictypediagnostic: BYAPR11MB3397:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB339785CB179D6C5EAE621E188CFF0@BYAPR11MB3397.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f7cOtlLm0rAUL4Jw8X49baC463rU2V0PKCqLXELWVLNUS6gWJxEQ9AU5HXgg39WD0wlMCHLyQmwSiDmD6FwH9sz4eDqyrqofSJMf+ZdtDViSt48tfoDKD1BVhiS61vUT0RAQyCgzjiJUuPxg27ksnCJcMMigs84o4YVqUOLV9LvC0SRyBjBKVNgddqxXdUYEH7+yG24iZF16XlMytgjMjUkgswwO1isFLx9JqxL8ulzXgUUv7wJHXQncbQQd8IRUOzjztE1tLIJd74OWbF34dLMBqMdl+UXXVm8BpjkFE9GmvpjFGf6YcnypS4n2Yyb/MZR66Ec1c2k+wV778UHHLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(52536014)(316002)(26005)(83380400001)(186003)(64756008)(66446008)(8676002)(5660300002)(6506007)(86362001)(53546011)(7696005)(478600001)(8936002)(6916009)(66946007)(76116006)(9686003)(33656002)(66556008)(4326008)(66476007)(71200400001)(55016002)(2906002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: H7/w18k/i48+qO8ak8wo96YWEEbEx61AAzQuC7mvGQEW4wNYnuMYdrpa+uAEd3YzBtO6/Cwr1T2BKZ2pjIC+OuBNcipLWjsraYSvKQdl4slTLBHdVz0+FTDJ6eeOqSVQKf7ZhLs5jlq7Dk5iqembK0RuUWNm6babIm4IUXRs72lZ0RlPrwaoWyuZIEDd6jZNExPs0WJEST18sj8iPEJ1Qz+1GSxOSsY3UIjYP+UsbK6xHEcudoS7Lxek6L6JyCS/L1Lm2yp8jbRlB833i6+uhwMCd96+K9ud+Zat9mVeq4IgVwLQfb0Wbb3vNvKsKwHRP5X7rezgSZsBPAHV6/+Jw+2Zcjr7LJyvo/ktLW43K3OKpVc0wCxAcLX06QKVFkoO4pJ6d3iB/8GPlML9NHnZCBpy4x3gJ8/OURPM+B/1O4neQWXhtw6RJJeoSmN1R05M9bXRl2HlTMnGI7725goEF3wDZN4tkuhTLdIqNrOwhtppQSvkS1U3fmh3R/CFSEXh9wyDnMwlQjnclZSUtfKGYvQV10Gh2uIBJGLyDeH+tJU0gr7/RqAybGi+ANiNc1PI0XbjL4PQU7xbYmHjHVxVuytzGo7EYUyCC3KzHU6BeTrYwW3IMWmk0x9dPDSMpHHKFHGdqj2ElJw/EFJyxE399w==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738c8d13-29d0-4e4a-66e1-08d88cf3c382
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 01:29:45.6550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ke93LPvAk++qj7r/PsekypvM66TGMSH+tYnPUN3LUENWHj2iqNEPj62NV0/TriI94w1bc+NIm5miZ/YYB9r8ROuFcdc2dtT9XCI7iTYTVcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3397
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
Cc: David Airlie <airlied@linux.ie>, "Dea, Edmund J" <edmund.j.dea@intel.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Monday, November 16, 2020 11:21 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>;
> Daniel Vetter <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; dri-
> devel@lists.freedesktop.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH] drm/kmb: Fix possible oops in probe error handling
> 
> If kmb_dsi_init() fails the error handling will dereference an error
> pointer which will cause an Oops.
> 
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> index a31a840ce634..8c43b136765c 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -504,7 +504,7 @@ static int kmb_probe(struct platform_device *pdev)
>  	if (IS_ERR(kmb->kmb_dsi)) {
>  		drm_err(&kmb->drm, "failed to initialize DSI\n");
>  		ret = PTR_ERR(kmb->kmb_dsi);
> -		goto err_free1;
> +		goto err_clear_drvdata;
>  	}
 dsi host is registered earlier, it needs to be unregistered, original code is correct.

Anitha
> 
>  	kmb->kmb_dsi->dev = &dsi_pdev->dev;
> @@ -540,8 +540,9 @@ static int kmb_probe(struct platform_device *pdev)
>  	drm_crtc_cleanup(&kmb->crtc);
>  	drm_mode_config_cleanup(&kmb->drm);
>   err_free1:
> -	dev_set_drvdata(dev, NULL);
>  	kmb_dsi_host_unregister(kmb->kmb_dsi);
> + err_clear_drvdata:
> +	dev_set_drvdata(dev, NULL);
> 
>  	return ret;
>  }
> --
> 2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
