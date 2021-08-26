Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C153F8DF3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 20:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8E36E89A;
	Thu, 26 Aug 2021 18:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33596E8A9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 18:39:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="198054022"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="198054022"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 11:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="687082294"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2021 11:39:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 26 Aug 2021 11:39:09 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 26 Aug 2021 11:39:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 26 Aug 2021 11:39:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 26 Aug 2021 11:39:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+UCYScpsznnQ8a5ci6pjTRBU7v0EgW272JozmnqmdzBMOj/LbwCOKDV0SAqo8iEnGEMqNowGoPe9zGj1ZV335QQ0m69NzOWroCy7IyMHVw82Z8u7k1k6Jy3Bp/zJoKw9H86TE/3wXSWeDMLTvoebLhktMTlJU8yFwcW+yZ4S3ZUDaBzeNQEDT/BqCRppN8/qfc8LzjAiyjRwfl87iRUw8E4mMSv/XV1xzMVC526+vIhd3CQxHBstphTsk5qKne/kHPM/A2P3JWH1Tkl43XLs5GDOlQBvF4eN+N1z+li/K1B8bAJjwLVNsoCN0KZZMAuRbZYl3SxbIxtg2tAuHpgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QW7hNjAgA7SmRP2ZILc5ZMApZXXVAMyxlrJ4Ev+I3pc=;
 b=Q22clx6gmwmqL7rVtRBSP0tHSjbZKXazO+w8WPCH5okIhlgYUM3N9Ry1SKmBLii/7+vYS9cyijGBvIIqD9ymSMxGRiXRfFHMaRXPoL+OaB5+tQccbCy9mRNQivj605SBeZr3yGh5G1EkZ9jLEDXkN0ZzwUlfZfV1beocXrSb4JDm1KhnwZB3N1sSFgl2O6o8Kknzy92raDf4FWwDFB3isS5bN/xIB9n5M2AdwkItiVlwTWMwmzZ5ltCr89uXKNpHxUzKIP+zmcfLh+i10odeoUqSLtNbpOVU+sMH6s1BIFYoGmrs3HftmscCmQ8UlbbfXECqQy6pLkajOBJK9XivZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QW7hNjAgA7SmRP2ZILc5ZMApZXXVAMyxlrJ4Ev+I3pc=;
 b=HiAbAuuO1GpjjAFnjlq49x9PHFciMiMpTOzUCIy19a/pPZ6vMdaWDArllIDhFJ2l+3CeLmiAdobM5RylbozribVVrbKo9cfpmXeWpgIiEKiMcWrcIcn6P0AOx2/n0r/vaEFc0AATwaSY85IiGMRrVo0K2YjvpUYM/X2HiXIG/VE=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB3192.namprd11.prod.outlook.com (2603:10b6:a03:7a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Thu, 26 Aug
 2021 18:39:08 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::e189:6f03:9fde:2062]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::e189:6f03:9fde:2062%5]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 18:39:08 +0000
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
Thread-Index: AQHXlWijNuCVLSkwqE+rSAtXsowutauBv3OwgARoQ1A=
Date: Thu, 26 Aug 2021 18:39:07 +0000
Message-ID: <BY5PR11MB4182FDE1DD886B6DD59915B98CC79@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210820021029.10770-1-jing.yangyang@zte.com.cn>
 <BY5PR11MB4182B03BCF3FE98A5B0054D78CC49@BY5PR11MB4182.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB4182B03BCF3FE98A5B0054D78CC49@BY5PR11MB4182.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 01218ac5-1749-460e-4b98-08d968c0c9eb
x-ms-traffictypediagnostic: BYAPR11MB3192:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3192B9921E0B69F1E13D6F808CC79@BYAPR11MB3192.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qojqmiLUiz2cXksnQNieTE2YY+a02BDQ3mCyZ0VDMJc4gldz21ePR0ab9yGgJHOqyEr7I8rrx/7NzWrsil0kPBKdhjTj7eROqqmoT7gZ8K60izSD5R5guloyiVE3/AFEU9BzKNgeOjH9Yi7J/ZKwkcw65N6eJDyoy9IOmNtM/yyRrbDAH2qlrw7nunP2Np1K2VSGx9pj0N28vVWh+i/h0iz/HANN6MTRx+6jUf2Iu3nBYh2NXeLPvIYX1hVZPPq09OIUAIzvXQQZ3gTQ6WVW2zGULjJxIXeTdRCyMnmSrqoaV7AH7fAw+EWYt/TfLhAYWhC4xx2/BirhkujRccECuijNU5jeQBCwY6FL51QmkkblsymI2za7GyMVGDtXuHZVsqxF4x9FUa/MBZ/pAx+8UQKrPSuRyIWQcdI/XszF5/l3P+SzR5iDMzLA4MEkMywiSGL7tODouCso/0pcytQI7b0Y1E8o+voY5upiq7m3F0tsPhhESRZ+nKcws/lnvUV9QkvfCPzTAzitvDY9KGLofeBbksKn08Ce2e0ofYl/K4VxuwqGpZOMj9imuxEAs6nSVgnW1LjIrcpXQaL1+lGteklVQk02Z0KBZfBkJnqCsvKFgfjmjys94JQ6O0U8Zt5ZsRjCuV1dCE68XdY98+CYde66q4bJp8sjZL6I5HyPPBhNF98J6ffsRNGXU/7fTV+Frqou7CrvSjaPpxPF5LE18w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(54906003)(86362001)(64756008)(186003)(6506007)(53546011)(5660300002)(508600001)(52536014)(26005)(71200400001)(316002)(8936002)(55016002)(6916009)(2906002)(66556008)(7696005)(33656002)(38070700005)(9686003)(66476007)(4326008)(8676002)(38100700002)(66446008)(76116006)(83380400001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qn9F0fVBqVcdPKr3jprk6ZFbaS1Or5MHm0ZHhk8WufaCesvBNriDdpmPURB3?=
 =?us-ascii?Q?1jpPC7CcQ8Qf92mvw2sH2KaLh2MLqMQNZ1418NW4Bzn+85wTprJi/LLR/eTH?=
 =?us-ascii?Q?CIknqNAWBnrLFZEJeM7t0PmsnkswX23tEC88QUJ37P2Tl3wL0l2f8JEmCDmI?=
 =?us-ascii?Q?acI4mj8Ghh3KzuYiarPJw7I5c8JYM7XyX0ORHVyTpfQ1/lzk3YM8X0FSo0Ht?=
 =?us-ascii?Q?smuQL+sjr5z66xMzrn6FtF2rDtaTGRkkAjtzVzO1ZbiYp2iHfCEg/k2sTs2I?=
 =?us-ascii?Q?PJqyOsLZSaKJq1j+MHZ/GAktqSwrfF5i8CY/qUw4D8dVJQNWxNaWx1W3mWOh?=
 =?us-ascii?Q?1umLhEPZE+Afok/ngZe6Oa1+J91oyU7VOo7FAsOsxAaXX7ysvhBTJN9VtmDL?=
 =?us-ascii?Q?/4RKBe76rbwpswlp4IWjwi6V0a3exfwlGWBztyvLY+G5E9GWxowQlJtQK/7M?=
 =?us-ascii?Q?FEe14HwtbOCBbjOItMj9yAGdX6ZvCMhsOs3PLgoK0uvU9thkMEoK/LYXeej4?=
 =?us-ascii?Q?NVAQ1ngUwXTiFqDbzqgjZNshv95KctwIbGJI/k+YMGsxEgRVuPgqzBRAo+nk?=
 =?us-ascii?Q?pbZkPak4PCYuv1i+xib40gaxBMGIh9tIEJCp7dh5B9GfP3TnZyk7w8t/0789?=
 =?us-ascii?Q?L5wDP6kVeGiSAXLdO3CrJI/QOytlVmWErSC0phuCzGmGJ26kgHhbDDKmblMj?=
 =?us-ascii?Q?4rUt0BSIDa3iByIE2NTblCpxnBO4EW7ZxtRwPStRrQiiH9HIPdpqCAOQTJPZ?=
 =?us-ascii?Q?E4JcWOBxFQxylX1tsSRpbPzPqKQ/i+ZOnhXESH54pvqxsXINbZ8fta90cZY2?=
 =?us-ascii?Q?MM+3EVfend5ie8KmY3UTV/0t7o5b12r+WDPuPj5/R5tWwiD59KWDr0suX00I?=
 =?us-ascii?Q?w1ZIiO9T13OVHJy8lXevGCw0rSxcPMVukhZWmsMPcZ0gjGU4iGLGqO1j1nXI?=
 =?us-ascii?Q?xdUj+BUh1dam0mfT9GQ9enms/7ygxxYNKz2L1ITfde0xHoBDahUOM3VTXQcK?=
 =?us-ascii?Q?K4PjhroZP0v8lz5tJMsvdPG3rDtwQONm8jEf3RC2uYsypEYN5rd72WUw6/As?=
 =?us-ascii?Q?JjCNrw754MjbmGuiarhE/vORHLRJHTSkEUG7wgcPN/qV9fA6pagmGVDjq3Fv?=
 =?us-ascii?Q?ISSf5DljwosXIRNaDHkpH24ZPxbwhqNLGxUo5Qqvk7zhj/tWy4Lt9UuOOo80?=
 =?us-ascii?Q?1U7DYC2SSzqRiimhrmk1J85wU/VAUeSRSAjXM8cyvumxP8icrhl2yWX4ouzV?=
 =?us-ascii?Q?PuLo564XaxJSicfCwqw6w8ZULWVSznAlt/b4vusqz/PMsv2/6JQBUOJclxZ6?=
 =?us-ascii?Q?D8Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01218ac5-1749-460e-4b98-08d968c0c9eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2021 18:39:07.9236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: efJNRw2uXqJayuxwctMqutLOEoUS7v6Mb5jYxsd6WqEPUpBytAZBsLovwAdD600PtVR8MEpYL2rH4wtdglAX6sau5Hb4ruPc6QpJRBgVBTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3192
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

Hi Jing,

> -----Original Message-----
> From: Chrisanthus, Anitha
> Sent: Monday, August 23, 2021 4:25 PM
> To: jing yangyang <cgel.zte@gmail.com>
> Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.i=
e>;
> Daniel Vetter <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; jing yangyang <jing.yangyang@zte.com.cn>; Zeal
> Robot <zealci@zte.com.cn>
> Subject: RE: [PATCH linux-next] : add put_device() after
> of_find_device_by_node()
>=20
Thanks for the patch. Please add drm/kmb: to the subject line and also corr=
ect the checkpatch warning.
With that ab.

> Acked-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>=20
> > -----Original Message-----
> > From: jing yangyang <cgel.zte@gmail.com>
> > Sent: Thursday, August 19, 2021 7:10 PM
> > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> > Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie
> <airlied@linux.ie>;
> > Daniel Vetter <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org; linux=
-
> > kernel@vger.kernel.org; jing yangyang <jing.yangyang@zte.com.cn>; Zeal
> > Robot <zealci@zte.com.cn>
> > Subject: [PATCH linux-next] : add put_device() after
> of_find_device_by_node()
> >
> > This was found by coccicheck:
> > ./drivers/gpu/drm/kmb/kmb_drv.c:503:2-8:
> > ERROR  missing put_device; call of_find_device_by_node on line 490,
> > but without a corresponding object release within this function.
> >
> > Reported-by: Zeal Robot <zealci@zte.com.cn>
> > Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
> > ---
> >  drivers/gpu/drm/kmb/kmb_drv.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> > b/drivers/gpu/drm/kmb/kmb_drv.c
> > index f54392e..58495a9 100644
> > --- a/drivers/gpu/drm/kmb/kmb_drv.c
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > @@ -500,8 +500,10 @@ static int kmb_probe(struct platform_device *pdev)
> >  	ret =3D kmb_dsi_host_bridge_init(get_device(&dsi_pdev->dev));
> >
> >  	if (ret =3D=3D -EPROBE_DEFER) {
> > +		put_device(&dsi_pdev->dev);
> >  		return -EPROBE_DEFER;
> >  	} else if (ret) {
> > +		put_device(&dsi_pdev->dev);
> >  		DRM_ERROR("probe failed to initialize DSI host bridge\n");
> >  		return ret;
> >  	}
> > @@ -509,9 +511,10 @@ static int kmb_probe(struct platform_device *pdev)
> >  	/* Create DRM device */
> >  	kmb =3D devm_drm_dev_alloc(dev, &kmb_driver,
> >  				 struct kmb_drm_private, drm);
> > -	if (IS_ERR(kmb))
> > +	if (IS_ERR(kmb)) {
> > +		put_device(&dsi_pdev->dev);
> >  		return PTR_ERR(kmb);
> > -
> > +	}
> >  	dev_set_drvdata(dev, &kmb->drm);
> >
> >  	/* Initialize MIPI DSI */
> > --
> > 1.8.3.1
> >

