Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46B13D9962
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 01:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABBF6E982;
	Wed, 28 Jul 2021 23:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EB96E982
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 23:23:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="273846441"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="273846441"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 16:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="499061886"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 28 Jul 2021 16:23:56 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 28 Jul 2021 16:23:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 28 Jul 2021 16:23:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 28 Jul 2021 16:23:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 28 Jul 2021 16:23:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6HTx5C6sZt4pAT8Cm3u5oQCyhg4Eeks0POoMyMMvs9ARY9REiRdogHt9DLBtgFNzuBJyONmdbQuv3M3SVpsBDuSWD4+GveOg6v4sw63KkDPBNbzPKiuROlRpI7AeRyQDYP0ORAdp7ZPNC5dYQCvVqNYvudMv25e/rti+xT2XmV4rDS8xgt9twbhEeW5HHqfvRaEfKCUgepYlByo40uzzI7VhG/MD8MK1aK3cMUPVx1hgDeIr/683IqSW6AeJGnMDv65fGU3YcfPydrlcaN3DdJ8GbR3Xz42m3KoxOYi5EfpFB61V9RUFmOxmjzegIVob1wjt7y1fuGn8nfZy77HLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIlQOFzLlH7Q1QXmjNxiremDkes2MVVWnX+zABwYt3s=;
 b=CGHmOuW7ZuaISHFIEA84phvSkzrpiURDarGSKOrnwgSf7hgaPQ8zjONLwYP87rK+UsGxvj7ZuDRM6nNhjCEGkHIzj/s7GptMdtg3nxWDHyTzBv12jBmc2hDWdpdOR3T5EzbLvxOWrkkWT7bB11E2bkD4HioluY/4/GvM2fSutR2BGcWh/WlNWATQWmx7pL/LtuTZfB0UfNIp2xOZi4v7hU37v7SvEdoCV1SCKfSN9YofsGWhiQL4gWV5U7NRKTtbWXFdoOZBgHeJz7iCrTU86telrvvuIi8hwmpflwyDwYZ5WQOLUqa0x1jspSGRYBd/ZbO6vHPvZ118XRW0lJkDhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIlQOFzLlH7Q1QXmjNxiremDkes2MVVWnX+zABwYt3s=;
 b=DzmYSzY10buWSemgiW2C8IweR/JI19Z/fhA4pxXOTZi0gtf4IhFk8pRHGnuSA447ip1Vi8eLWs0ru5ccqFMLCG2XJs+KvNEiHYQLvStVejalss0UnJnJiwB0e7kWoO+sbix8OmMNWSzSvxXbdUqIhhfNW2h+fSsP2a5HGkyl2OU=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Wed, 28 Jul
 2021 23:23:53 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::cd49:4031:91e6:ec6e]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::cd49:4031:91e6:ec6e%7]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 23:23:53 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH 12/14] drm/kmb: Fix possible oops in error handling
Thread-Topic: [PATCH 12/14] drm/kmb: Fix possible oops in error handling
Thread-Index: AQHXg0gRXskCn8Fmrk6zqRTHJpkDqKtX/WCAgAEJJRA=
Date: Wed, 28 Jul 2021 23:23:53 +0000
Message-ID: <BY5PR11MB4182DC2501AF9E3841B8147B8CEA9@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-12-anitha.chrisanthus@intel.com>
 <YQEGy7LvaR3x1nHz@ravnborg.org>
In-Reply-To: <YQEGy7LvaR3x1nHz@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3957eb9-3f1e-43ce-4f0f-08d9521ec3ae
x-ms-traffictypediagnostic: SJ0PR11MB4976:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB4976C4AF8A805637CAEC2F1A8CEA9@SJ0PR11MB4976.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jos7Kfd0SqjqLkeu1GylpvZISh5fqu2Kb2EzP7S+vDatqefSKjZzFm6+Hwxib3UZUOXsy0wNti/5Ebaarug5teRszcXzATe2ectsPXgM8zsEp8wkxLTNSn3j/zn3q6DGZ4ZMQNhR/edCxYiPzdWXgkx0RQnNGgsBAfjnvuCmJWhJysK5qLZQ3LyUpi1TRJSaMVA55yuwHCGcJYDqahfTEL6Dktaf0E4DzWc/Jcrc6wU/eUaagcR17kB0k7MQGBMR0PAlqnnWG+SF2NRdFSABwz5ZytW783Mw/DWapGNtMlmSHOs/LZDNoEkT9GRXirhOlSjCmdpZOr93PfYWYDECrU3xGCE/sBDg6usMSXWrs1quqpeN/qiPu3Jc5tiTMuHvAnJQ748iJNmnBnqVfYfA4X5dtPEuEYmXRMhEHCC6JEPlZgdZCE2cpiZ9nTftuOaTtsz3h0CawoNChpwVO1V/tc0TZJN39oRkxM07FPASTM5f07eXwbMCwapw2OFaHtLgGHuyxxsCAsGL/c2TxJr3ig42OkET8geZxYUf7Gvv1BqGGXZiRiderBb6wyhIgd2ny/ItsaG3QfDuV1IpTdgeYvUVr7cLVTqkwRCAOWm/VRDmjE8FdEEj51z0WBRF7U8Ve+y4SOlE0Ch3iHwVv1/b8tO7a0Zs+MiZ1nCL3or4xoPZSkiFwtyPkQ6j8kIg+t7GwLj370KFZBXf5YvPv/Q1jQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(9686003)(83380400001)(86362001)(6916009)(55016002)(6506007)(53546011)(33656002)(8676002)(5660300002)(26005)(71200400001)(2906002)(4326008)(122000001)(66946007)(76116006)(8936002)(66446008)(52536014)(478600001)(186003)(64756008)(66556008)(66476007)(38070700005)(38100700002)(7696005)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1+ulU7XR9UNUlQxHVY6AWJpNklIzwqPL3zlAmTafgWd0bzFBIV8xaoCump/6?=
 =?us-ascii?Q?jkkbolMcYXmjXJFklcJCJNx023PIJ57ZXauTORz+VHPPNbn2QNBaqDMUWhoV?=
 =?us-ascii?Q?2p4WN8DIosZxiZazwdCES1fS+o0tGnXCE+zN5dI2rcvQ8fxNzS6rjJfvbzQJ?=
 =?us-ascii?Q?EQ9PaLMt6/4I0HwnnEt2sJfridv2UuLbouZGK/fvhlvEU5eGzd4AOtUQMx30?=
 =?us-ascii?Q?ERdOnC2aOeMiZL3PE+h/mFPUyM+LYRcLSClDweM1R1v8M/FEcc/v2nxaor/z?=
 =?us-ascii?Q?+gC3Wxuhj3jo+MWk+JyMOWxkTWArroc3UZxuAAjnJKuzpzfNv77Rq/pYjQKv?=
 =?us-ascii?Q?ShIS6ZqTTVz/fINNy2mR6qgO07OYVWzb0TzYRCJn+7ugeS81M6lO0UPWEFu/?=
 =?us-ascii?Q?oUcAKK4HtCSjNirndbt2vhn1fZvl9zIbHGGRzTgOo9Izz/uZ5QhRgMqK7mAA?=
 =?us-ascii?Q?HIFW+9hmoQXZrJ48WX9d0/I/+TSZSrO0Q1uy5KG1Zg/0LiP9gcfZjK+fiKn3?=
 =?us-ascii?Q?iqmfmft+Bx1fw+x1wFGzwwG5yfWzWtZTvOklPeAF22zxyTl6UvkORIkCO3Tx?=
 =?us-ascii?Q?nDvK/XumHrokDiUIUGdrD3KzL04NGgQCiCl0TTt+Svpsgnxfq9plNOlQMjR5?=
 =?us-ascii?Q?JYLc1iTYRjyscpl7zC+OPagg3XteC8w71CwqPL/p/Ub/VQw9yKjFlxYy9l3D?=
 =?us-ascii?Q?ElvNOMuk2toKi/Nbw5V6NEMAi2T8mNUBb8s1W68MdF9Hv601Wr2V7c+oGspy?=
 =?us-ascii?Q?JEG2NlqfxlUUijUOY4era5EfDCXhO8g0M9JCmX1zKPCNqmQEAOIuDC6g/bji?=
 =?us-ascii?Q?Z1BVZdi5Fv0C+h7UbaJfpWbDbZlwMzQOUHyJERs8GPJXSEEuVh/0BwIYyEOm?=
 =?us-ascii?Q?1vuX8qb/NgkBDk2Zz8CtGFIJjoHeTi3D67l9DoawdHKQdsDBGKlU0dfi4snj?=
 =?us-ascii?Q?/EQ4bHcX7nPASQHrQQofqdkg1AA2LZIia/ViwmqKgP6XYckSmcJtcd1VMj4M?=
 =?us-ascii?Q?2IDbFZx5S6ViEy5J62uuwn1sGOb60quTCNW3mD5K9uR9xDFnInGf2TftirkU?=
 =?us-ascii?Q?Q8MndIbhoc5fWzj4S1fnbzjdImmAJpBqSrxQT7bPRQRrZAqJ7nLirns4tnv2?=
 =?us-ascii?Q?PuChUVlnD2SwhSnBd7cHJeHZgWAMJREjB0X+HJDxDHjQk8S3IzKt9xp7Wga2?=
 =?us-ascii?Q?spTTx9uAuR4l+Appi/hdP8gWvx6S3pOHM2VQUi2L+3IndHB8EBDGDEVo4wwA?=
 =?us-ascii?Q?wDtVGSRlKiG9PB17OVQ2d0Sz/Rwak9n1ZDw5VXSJqHXUzinQ5xJY33OPuAHZ?=
 =?us-ascii?Q?rEI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3957eb9-3f1e-43ce-4f0f-08d9521ec3ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 23:23:53.4303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HTsqpd/nA26lxTyaQe8h5btwtG/q0VyAERjSRK77KTSL/3k44qz1RiO3t8zmXq44U7IDXA7u00GoWaYOEGbB44snjA4R0YNdTjOC6hWgRNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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
Cc: "Dea,
 Edmund J" <edmund.j.dea@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: Wednesday, July 28, 2021 12:27 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: dri-devel@lists.freedesktop.org; Dea, Edmund J
> <edmund.j.dea@intel.com>; Dan Carpenter <dan.carpenter@oracle.com>
> Subject: Re: [PATCH 12/14] drm/kmb: Fix possible oops in error handling
>=20
> Hi Anitha,
>=20
> On Tue, Jul 27, 2021 at 05:31:24PM -0700, Anitha Chrisanthus wrote:
> > If kmb_dsi_init() fails the "kmb->kmb_dsi" variable is an error pointer=
.
> > This can potentially result in kernel panic when kmb_dsi_host_unregiste=
r is
> > called.
> >
> > Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > ---
> >  drivers/gpu/drm/kmb/kmb_drv.c | 9 ++++++---
> >  drivers/gpu/drm/kmb/kmb_dsi.c | 9 +++++----
> >  drivers/gpu/drm/kmb/kmb_dsi.h | 3 ++-
> >  3 files changed, 13 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> > index bb7eca9e13ae..12f35c43d838 100644
> > --- a/drivers/gpu/drm/kmb/kmb_drv.c
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > @@ -454,8 +454,9 @@ static int kmb_remove(struct platform_device
> *pdev)
> >  	dev_set_drvdata(dev, NULL);
> >
> >  	/* Unregister DSI host */
> > -	kmb_dsi_host_unregister(kmb->kmb_dsi);
> > +	kmb_dsi_host_unregister();
> >  	drm_atomic_helper_shutdown(drm);
> > +	drm_dev_put(drm);
> >  	return 0;
> >  }
> >
> > @@ -519,7 +520,7 @@ static int kmb_probe(struct platform_device *pdev)
> >  	if (IS_ERR(kmb->kmb_dsi)) {
> >  		drm_err(&kmb->drm, "failed to initialize DSI\n");
> >  		ret =3D PTR_ERR(kmb->kmb_dsi);
> > -		goto err_free1;
> > +		goto err_free2;
> >  	}
> >
> >  	kmb->kmb_dsi->dev =3D &dsi_pdev->dev;
> > @@ -555,8 +556,10 @@ static int kmb_probe(struct platform_device *pdev)
> >  	drm_crtc_cleanup(&kmb->crtc);
> >  	drm_mode_config_cleanup(&kmb->drm);
> >   err_free1:
> > +	kmb_dsi_clk_disable(kmb->kmb_dsi);
> > + err_free2:
> >  	dev_set_drvdata(dev, NULL);
> > -	kmb_dsi_host_unregister(kmb->kmb_dsi);
> > +	kmb_dsi_host_unregister();
> >
>=20
> This really looks like a step backward. There should not be a eed to
> call unregister if kmb_dsi is not a valid pointer in the first place.
> Also drn_dev_put() should not be needed with the use of drmm
> infrastructure.
Agree, I was trying to address issues with Dan's original patch.
I will keep the original code, with only this change
        if (IS_ERR(kmb->kmb_dsi)) {
                drm_err(&kmb->drm, "failed to initialize DSI\n");
-               ret =3D PTR_ERR(kmb->kmb_dsi);
-               goto err_free2;
+               dev_set_drvdata(dev, NULL);
+               return PTR_ERR(kmb->kmb_dsi);
Will send v2
>=20
>=20
>=20
> >  	return ret;
> >  }
> > diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c
> b/drivers/gpu/drm/kmb/kmb_dsi.c
> > index 1cca0fe6f35f..a500172ada87 100644
> > --- a/drivers/gpu/drm/kmb/kmb_dsi.c
> > +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> > @@ -172,17 +172,17 @@
> mipi_hs_freq_range[MIPI_DPHY_DEFAULT_BIT_RATES] =3D {
> >  	{.default_bit_rate_mbps =3D 2500, .hsfreqrange_code =3D 0x49}
> >  };
> >
> > -static void kmb_dsi_clk_disable(struct kmb_dsi *kmb_dsi)
> > +void kmb_dsi_clk_disable(struct kmb_dsi *kmb_dsi)
> >  {
> >  	clk_disable_unprepare(kmb_dsi->clk_mipi);
> >  	clk_disable_unprepare(kmb_dsi->clk_mipi_ecfg);
> >  	clk_disable_unprepare(kmb_dsi->clk_mipi_cfg);
> >  }
> >
> > -void kmb_dsi_host_unregister(struct kmb_dsi *kmb_dsi)
> > +void kmb_dsi_host_unregister(void)
> >  {
> > -	kmb_dsi_clk_disable(kmb_dsi);
> > -	mipi_dsi_host_unregister(kmb_dsi->host);
> > +	if (dsi_host)
> > +		mipi_dsi_host_unregister(dsi_host);
> >  }
> I thought we had killed the global dsi_host variable??
> Seems some cleanup is till needed here.
>=20
> 	Sam
