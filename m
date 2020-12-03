Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E027A2CCB70
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 02:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED1C6EB23;
	Thu,  3 Dec 2020 01:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB49B6EB23
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 01:11:13 +0000 (UTC)
IronPort-SDR: KVoTW+3UNlcY3bogM6bid0p3wChqQujgHBYmBrug+d74KHJQ3k8HYKJIuNnXUS1cW8EVvLtlVm
 Q4LgBj1siwVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="170548075"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="170548075"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 17:11:12 -0800
IronPort-SDR: jrquowGmL/YG0yBVo2K7IjJi1jD5GicGSwhpPLOrYevF2OMXxQS/gOPzZ22fK3AczHn95lm2N9
 mjYCBMHvuOow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="361616728"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 02 Dec 2020 17:11:12 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Dec 2020 17:11:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 2 Dec 2020 17:11:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 2 Dec 2020 17:11:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE2NpcCBP4QBSD4D4UOXoILmbS1m589ufEmE7Juml7N92YjTwWb/UDYDYk4RW5EpaqCBxF9MEthU/Duj4VJebPaQs+f5PYyXVfqNwJ/nINU4Q5BBoHnP5gGm7BP1zJuKSysqBhX4ZkQHba/pb99+wYSY90ZqZl4W7PQKuVaz0d2nNflGY1D5hbEsJeQZRWg1GQf4L2cpMi2t62CnsM64f9Z2zIdmSA9NgRnkH7azyAcs5vzlgzhsnqKX1j+cKstVXPhEQWNGTQWo9UFDROfdgH1pBOjCCuqAsnKCBtr/Bsy1krjkhL3XShdPNgyKZrn22itMhIqjeQbvjhSQlcRsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjuLVl+TcRKpUQEr7pGBqZwR7QCRkPbgCmv+iPt35q8=;
 b=nS07tUsljri9pNib/jflse3oZ9SfQyLpE8J2ryHDc2oqzNacw38r1iBbbDlirRHuWblBJjFg6Ge4T0jEZNe+s2CjaSJ6IqMXMF2yJQSU9hebifOMla7fl/c4k670x5FX3gYJNWAdiagKkUH8lYdBIxrF8R7loNGIXglj2PazQj4RJaoz4OfBP1q782UOoc+mUCAgiyZvIBMfgSe6OiEnNQVbevJvXoFBEg/QngyjSNA5Nrp4WIW4kcQYewrloWwQZ549eEV2Fj5ZSfuej7hknkuBSQgfI+aBPCcK9Dh+ZehbLBX4i0l0cVOwClaB1drJNbonCfZoEXszUjJRGE9PTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjuLVl+TcRKpUQEr7pGBqZwR7QCRkPbgCmv+iPt35q8=;
 b=S0BuGRphS916qWHnm/2IZCZce0pPC5FiLsvFsSsveUOIjKJwSv9i2/GpJyn9Slu6O+Nhwshlvf68PbI7j2rKXdRzkTw4PvEpjMdKqbnr1pXzsSulbAF/zqstvESdaElYGzO5yCkyD3FxBxixE9HNdG3eBtmLUZe8xBszqjVIt0M=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB3719.namprd11.prod.outlook.com (2603:10b6:a03:fa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Thu, 3 Dec
 2020 01:11:10 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394%5]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 01:11:10 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
Thread-Topic: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
Thread-Index: AQHWvxTE9qkNihoFXEWyzr7cwy2qgKnRlOEggA7HV4CABEeXsA==
Date: Thu, 3 Dec 2020 01:11:10 +0000
Message-ID: <BY5PR11MB418203A5451498557B1EA0458CF20@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20201117072103.GA1111239@mwanda> <20201120081113.GL18329@kadam>
 <BY5PR11MB41823E214598EC70A9EAEEA08CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
 <20201130074829.GA2767@kadam>
In-Reply-To: <20201130074829.GA2767@kadam>
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
x-ms-office365-filtering-correlation-id: 941cbfc4-a6d8-4bbb-ca68-08d8972851f4
x-ms-traffictypediagnostic: BYAPR11MB3719:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3719C38E6A6A82C3F2F66FB28CF20@BYAPR11MB3719.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H3TPSs7KRmiflOia6zsL/dF2h/Pga9lT9iOiVHxMkNcMwY/MqPvDnFRxd1P+j9+trUdznQIIlSptgkWG/HJU5an4IvRH9mTENt4XLCtM3kiVQ5wVqef8JiLtYogR3+iUwFUDZRCmpXTCa2iH1Z5b5UqZdSUbje7Eu88B4yh/r8sCdOUWKPwMR+oUctZWPFho0n/viGsZjWykvauz99pcaeLzAdop8zymqk4U3quegED0XXGvVaKH2b63tOnsqEjsGaVBw0F3DuPlCmtfVxGdVmmVigeXbFzS7thIIPk4UaA5AQqcjxppq7G6M4wR2pk+yns18j0rVkKllPKE3XGnjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(71200400001)(6506007)(52536014)(55016002)(8936002)(478600001)(9686003)(8676002)(6916009)(53546011)(83380400001)(54906003)(33656002)(2906002)(66476007)(316002)(186003)(66556008)(66446008)(86362001)(5660300002)(7696005)(66946007)(4326008)(76116006)(26005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?cwfPO+HxanJzVBtAEQ5subSj56WOYgMh5/KP/FQxyPs2KpmfTNmMw6LwN3sg?=
 =?us-ascii?Q?Bi0D7zQIiAIopDzPHhkGntwIk4BCd5gYAKRRpdkKH5ZK2EMFBpNMYVHHpXuW?=
 =?us-ascii?Q?/wHf0o+MVlsVZ9dYhsLXWc+tL0eUNhLHsOJID3panYIRdz8J2tqkEHtRn+zH?=
 =?us-ascii?Q?lX2LKFp3eVRM8tPxIidrt8vuxUYL8SkcQP8vi68XtQExt23fPgsfv/Yldul+?=
 =?us-ascii?Q?FxxdwV0eHj4psxozXgdVbqrgjz3ZdEDyld7mpPusc/tcrU/tJLr3xHyjKSkY?=
 =?us-ascii?Q?cjgp/2di/gn2HhO2EhFEUkfKBK+gge3vzLzGQiO+ys58qcNijyFFhlBevmJt?=
 =?us-ascii?Q?yPNR8K9IbAt3LPic5zqYU2fDbJ/ts48Wv8dvZMBVwqHRCrTOqMItJFJlb+Zc?=
 =?us-ascii?Q?Dq7A2lPqx3oog1/HbuBO1ApL39DWZwC6Ip+k5EFrfuq3Lp68sGKAEi2DjZH7?=
 =?us-ascii?Q?L3S60N63UQc23YNHvGIINDnWAoTvRylgkDwn1VxHQQwm2+nlP7digujvdlg9?=
 =?us-ascii?Q?Mp009leLFPvLxdSUITj6OuZ6h4ICM/acRZWFoBh0bFS0lwubmUT694CBz0EW?=
 =?us-ascii?Q?Hm13lp7fXydnPDzeA6GWJAne4yYI5zx2deeaNZywWM9GC6MJn7SnmDk0I2lB?=
 =?us-ascii?Q?8dyp07iX/ucTKJDuoi3IMhvg+HDZ2Bw1g1BBPH9O+9QU4cxqnrnbMLxTXpEl?=
 =?us-ascii?Q?9QWt7q09xQHkaJ0TFwUPQmoY22OWTBG8BLvJYMoAYThXqJqT1uy54TMnzcB0?=
 =?us-ascii?Q?SBtaKxR5Mi+TmniqHrWgE8jFaZoOH4BpmiVOkJWkTJP5UKOPJfcYP/V6tqeG?=
 =?us-ascii?Q?6juXeaSOkR3J6kjVhhNcT6l6CbYJluXxMrZLT37weTOT0IrTm7Mn6srPJEpJ?=
 =?us-ascii?Q?h+1vSuhsCVdhkuh+u7wf+2af8b/TBrMb4djwAuUAfrL2RtAsn9Zn5BpG+P3+?=
 =?us-ascii?Q?qf5ULmzbWIidqRagBNz44XmSaMXoJ2/ihZegQXxDlb8=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941cbfc4-a6d8-4bbb-ca68-08d8972851f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 01:11:10.1109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KFIi0pcUo7bX7V9H56mbBlh13gpxTE57CohUXHYoiEAAGfC3GX5pJy5QmUYAiqWhxPKVmW1Ks9Lohmc/8+GjTSR7MnQqaPc5mrb+pPAoJq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3719
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

Thanks Dan.

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Sunday, November 29, 2020 11:48 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>;
> Daniel Vetter <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; dri-
> devel@lists.freedesktop.org; kernel-janitors@vger.kernel.org
> Subject: Re: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
> 
> On Fri, Nov 20, 2020 at 10:15:57PM +0000, Chrisanthus, Anitha wrote:
> > Hi Dan,
> > I see the problem now, thanks for the patch.
> >
> > > -----Original Message-----
> > > From: Dan Carpenter <dan.carpenter@oracle.com>
> > > Sent: Friday, November 20, 2020 12:11 AM
> > > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> > > Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie
> <airlied@linux.ie>;
> > > Daniel Vetter <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; dri-
> > > devel@lists.freedesktop.org; kernel-janitors@vger.kernel.org
> > > Subject: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
> > >
> > > If kmb_dsi_init() fails the "kmb->kmb_dsi" variable is an error pointer.
> > > The kernel will Oops when we pass it to kmb_dsi_host_unregister().
> > >
> > > Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > v2: write a better commit message
> > >
> > >  drivers/gpu/drm/kmb/kmb_drv.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> > > b/drivers/gpu/drm/kmb/kmb_drv.c
> > > index a31a840ce634..8c43b136765c 100644
> > > --- a/drivers/gpu/drm/kmb/kmb_drv.c
> > > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > > @@ -504,7 +504,7 @@ static int kmb_probe(struct platform_device
> *pdev)
> > >  	if (IS_ERR(kmb->kmb_dsi)) {
> > >  		drm_err(&kmb->drm, "failed to initialize DSI\n");
> > >  		ret = PTR_ERR(kmb->kmb_dsi);
> > > -		goto err_free1;
> > > +		goto err_clear_drvdata;
> > >  	}
> > >
> > >  	kmb->kmb_dsi->dev = &dsi_pdev->dev;
> > > @@ -540,8 +540,9 @@ static int kmb_probe(struct platform_device
> *pdev)
> > >  	drm_crtc_cleanup(&kmb->crtc);
> > >  	drm_mode_config_cleanup(&kmb->drm);
> > >   err_free1:
> > > -	dev_set_drvdata(dev, NULL);
> > >  	kmb_dsi_host_unregister(kmb->kmb_dsi);
> > > + err_clear_drvdata:
> > We still need to unregister the dsi_host that was registered in this call
> kmb_dsi_host_bridge_init.
> > This will require more changes in kmb_dsi_host_unregister and/or separate
> out mipi_dsi_host_unregister.
> > FYI - I will be out all of next week, will be back the next Monday.
> 
> Hm...  Yes.  Now that you point it out, there are several bugs related
> to kmb_dsi_host_bridge_init()...
> 
>    182  void kmb_dsi_host_unregister(struct kmb_dsi *kmb_dsi)
>    183  {
>    184          kmb_dsi_clk_disable(kmb_dsi);
>    185          mipi_dsi_host_unregister(kmb_dsi->host);
>                                          ^^^^^^^^^^^^^
> kmb_dsi->host is dsi_host.
> 
> Every user unregisters it, but only the first user registers it.  So
> if there are multiple users it will be unregistered prematurely.  Should
> there be a kfree to prevent a leak?
> 
> 		kfree(kmb_dsi->host);
> 		dsi_host = NULL;
> 
>    186  }
> 
> [ snip ]
> 
>    216  int kmb_dsi_host_bridge_init(struct device *dev)
>    217  {
>    218          struct device_node *encoder_node, *dsi_out;
>    219
>    220          /* Create and register MIPI DSI host */
>    221          if (!dsi_host) {
>                      ^^^^^^^^
> This is only allocated for the first user.
> 
>    222                  dsi_host = kzalloc(sizeof(*dsi_host), GFP_KERNEL);
>    223                  if (!dsi_host)
>    224                          return -ENOMEM;
>    225
>    226                  dsi_host->ops = &kmb_dsi_host_ops;
>    227
>    228                  if (!dsi_device) {
>    229                          dsi_device = kzalloc(sizeof(*dsi_device), GFP_KERNEL);
>    230                          if (!dsi_device) {
>    231                                  kfree(dsi_host);
>                                         ^^^^^^^^^^^^^^^
> But now it is non-NULL but it is a freed pointer.  dsi_host = NULL;
> 
>    232                                  return -ENOMEM;
>    233                          }
>    234                  }
>    235
>    236                  dsi_host->dev = dev;
>    237                  mipi_dsi_host_register(dsi_host);
>    238          }
>    239
> 
> [ snip ]
> 
>    482
>    483          of_node_put(dsi_in);
>    484          of_node_put(dsi_node);
>    485          ret = kmb_dsi_host_bridge_init(get_device(&dsi_pdev->dev));
>                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^
> This get_device() needs a matching put_device().  I kind of like to put
> the kref_get() calls on their own line so that they're more obvious to
> the reader.
> 
> 	get_device(&dsi_pdev->dev);
> 	kmb_dsi_host_bridge_init(&dsi_pdev->dev);
> 
>    486
>    487          if (ret == -EPROBE_DEFER) {
>    488                  return -EPROBE_DEFER;
>    489          } else if (ret) {
>    490                  DRM_ERROR("probe failed to initialize DSI host bridge\n");
>    491                  return ret;
>    492          }
>    493
>    494          /* Create DRM device */
>    495          kmb = devm_drm_dev_alloc(dev, &kmb_driver,
>    496                                   struct kmb_drm_private, drm);
>    497          if (IS_ERR(kmb))
>    498                  return PTR_ERR(kmb);
> 
> On these error paths we would want to unwind using a call to
> kmb_dsi_host_unregister().
> 
>    499
>    500          dev_set_drvdata(dev, &kmb->drm);
>    501
>    502          /* Initialize MIPI DSI */
>    503          kmb->kmb_dsi = kmb_dsi_init(dsi_pdev);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This is the call where the "kmb_dsi->host = dsi_host;" assignment
> actually happens.
> 
>    504          if (IS_ERR(kmb->kmb_dsi)) {
>    505                  drm_err(&kmb->drm, "failed to initialize DSI\n");
>    506                  ret = PTR_ERR(kmb->kmb_dsi);
>    507                  goto err_free1;
>    508          }
>    509
>    510          kmb->kmb_dsi->dev = &dsi_pdev->dev;
>    511          kmb->kmb_dsi->pdev = dsi_pdev;
>    512          ret = kmb_hw_init(&kmb->drm, 0);
> 
> It feels like it would be a lot easier if the kmb_dsi_init() and
> kmb_dsi_host_bridge_init() functions were combined.  Probably the
> dsi_host and dsi_device stuff needs to be refcounted?
> 
> Anyway, I can't test this stuff and I'm not really familiar with the
> driver.  Could you fix it and CC me on the fix?
I will work on the fix later and will CC you, very busy with other stuff right now.
> 
> regards,
> dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
