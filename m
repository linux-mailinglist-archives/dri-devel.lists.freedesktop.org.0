Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661FF3D9937
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 01:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB3B6E54C;
	Wed, 28 Jul 2021 23:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBBB6E54C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 23:03:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="199944896"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="199944896"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 16:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="581029303"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2021 16:03:10 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 28 Jul 2021 16:03:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 28 Jul 2021 16:03:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 28 Jul 2021 16:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1xlaIL6SQpwDQDY6whdTTiS/yxl0cNwXdSk/LogWbu7T+I3OagjfarLxoXkAeBpYqADQwwvYG5EAH68yPdqMtJe9WZsn5KEAZ31FMPf2iw6LqSw8XpjDWee7a51G7S55zc6XHV3g7Kiegvg/xN/RnNsO4z+T29/u5cVOsy/KMulJST013zru0MKT79mv4iDTkUpQIrb0KfbYVZC2RHw45VMgG1oPLQtILUhHWRYkWP4wk95Z0pXjkF6Lun3BSxwP2Rti6AMP4kduKmAST/P2wca20KwRLevq1/b6OJGgm3vU7XQYjsB8TbxMbHjUJrDcX0hBPeahoki/PK3DJflKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVLTabhloPvEH+VCM7MiSWjSh5lBxkgyvYNPoJo2Cy8=;
 b=HJiurAq1ezqLSZTNPetBQfi8NHwBnWCis6swDMpJmUcKBtcOBuVtuCQvbSRL5AFKQtg8ZODVXOc08EwSx85Bx/nQqXFcCDzHY9e2ujN6HYkrPP+HNkIeAGx5X6rE/CnkBOhfOCRDDLTiVOMhv2TKjXG4x2AdtI1Q2mD7oJlL35UHxSCzK7TsWhU4p+ej/UcGahG9suq8FIUkfe+UHhNSXCCK4NXc6P9Yv7mduvfnZDeE5tjbcDMsNh6VGm4C3uwVXo//oqE2Ha0NGscjxe1vo3N4vSkFjhdbcP7q7x1bAR/PuhkYPMsOgIveQ5AdeD/ooifIshgq7Y99DR2/Uhkb1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVLTabhloPvEH+VCM7MiSWjSh5lBxkgyvYNPoJo2Cy8=;
 b=GR2k47VscRv2mG2Ewz1cL2xqwgwgSdm/O6+T6QtXTy/qCxG8+fYU7A+Ufyc3yzIS2eZDbwFSGf3I2+9EPyu66ev27oxnIDa+Pkwky0PLLR75OTvWlPzri9e0W3qnMqeEoTeR9UuaifMzqWTxeh3O2A/dz2VR3Jj4X8H9bTiKTAY=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB2901.namprd11.prod.outlook.com (2603:10b6:a03:91::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 23:03:09 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::cd49:4031:91e6:ec6e]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::cd49:4031:91e6:ec6e%7]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 23:03:09 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH 14/14] drm/kmb: Enable support for fbcon (framebuffer
 console)
Thread-Topic: [PATCH 14/14] drm/kmb: Enable support for fbcon (framebuffer
 console)
Thread-Index: AQHXg0gUY/JKV7H8GE+Fie8LkIGchKtX/oIAgAEDp5A=
Date: Wed, 28 Jul 2021 23:03:08 +0000
Message-ID: <BY5PR11MB4182D1BB1887366E8FB8CD718CEA9@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-14-anitha.chrisanthus@intel.com>
 <YQEHvqSrvySUTCaE@ravnborg.org>
In-Reply-To: <YQEHvqSrvySUTCaE@ravnborg.org>
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
x-ms-office365-filtering-correlation-id: c5211a5d-9642-42b7-a613-08d9521bdde7
x-ms-traffictypediagnostic: BYAPR11MB2901:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2901BFB01CF0D4CADAB4E46F8CEA9@BYAPR11MB2901.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nXG3BOIuS5NPNc5KwmoFbOeCINoAHnn7y0K/mW8UyVxmr4nMD1F+NW6ld7Jj+rGtBZG0V/ojocrHeGvrmiwIL7oVmx4WDcsGhCfT8jsBHLUFx0rDypgCrRhFiDuQjkwZHi4PzUgY1Oy0zgmNjnGeLAP+PvsZfRLjCq12KQjunE2QjrON+gjqswMVwYsKZkG46VQPOP942+RfPBDroJZD6K2AefD/hAXq2nVxR/ig2kiqkdpE+xalEfu0HUgdFqQ1icIkiP8ZamaPaDAs5K5quAQ9W0eLz31Mvb/yF2s+X50FscTg8fp1ck2x7zbryc3fQHTDrqXk6QCB7O5q+grRoIhE9ZljjckKCc8BzjQ3Taoyhkl+BJrNg3i8yHL2Mrz+cVJgGm/8BQpmIG99W9QkB35hVNDbQwAqzqLLeuNyaE5vUFshLr9yMv1QsJ/KR8M4bOQTeazmTGYw5lkJFG16f+xphSwCulg82vDB4/sFXl8Sr+ZSn8pi/qeNAqyVPiaK2yUIQ6E8p6ygNoVB3uzrE2grinbthggUOT0wwwXtl52mKVXiieDbxf0Qd1eD7N4YhiYaraXVlVj9PbNGvofZJ+nHA9AYuZfWjH7LdQz9olHsZK+3VgebrCpM1TAuMxTt9NcPc+29CR0Foum1F4/luhNsSj4FoKu+LnINdFGzUScDQFX4KjlknnXNErks2/RbDIzrNR13aYhA0gtY8vY7yQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(66446008)(66556008)(64756008)(186003)(8676002)(54906003)(66946007)(4326008)(66476007)(316002)(8936002)(6916009)(478600001)(38070700005)(33656002)(5660300002)(71200400001)(26005)(52536014)(38100700002)(122000001)(6506007)(107886003)(53546011)(7696005)(76116006)(55016002)(83380400001)(86362001)(2906002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YnNfd0PNi6j+oQz2o7+lW0bdnMURdGbzVGqkbubU+XwdcW3u9h8e/w5582oU?=
 =?us-ascii?Q?KZzBhHKEPsCRj4YNLBBX7x21l/oTa8B+VVe2qdrljtJLqlAAk4YM2pHu2/LZ?=
 =?us-ascii?Q?0LhUHsVeZuDryWjl1nJF9vdimRG2OCdHHWJPWpuSKd1Z29AB/ZWdGcGXMfxI?=
 =?us-ascii?Q?LFL4QB4DfTezKmz/jaVvlnmut8jZ1q1zBXW9bAV/7H5wzDd/C1PMt9JBu9ZP?=
 =?us-ascii?Q?ywyWsV6A0umcgDqOqBuYxtb6KCBmy5QEAJMQKjXm1Xyh3R7OHh8I71lgu74A?=
 =?us-ascii?Q?HZQttmlbesmAXREZNvPgJrQwyGKeC6Ln9ANJybbE7iCqDH7OJArhoXM/jC1h?=
 =?us-ascii?Q?JCk0d4L16kpiwKLkNogC9+cr/xP9WlltKuIveY2UolNz1imrlRKDvsGdAnXu?=
 =?us-ascii?Q?ONkAKha32fHschzUlF7nzP14ZRZr8V0bX9d1pWf0wEbIZuxhUUzMrPpv2iGK?=
 =?us-ascii?Q?dp/9noFMzgyYWWFTswz1naks/gL3Z1Ds0Q2kMgTJAaucPqvUlVZBF7MOckoQ?=
 =?us-ascii?Q?m+3u3hCvIly6vpOoj9JNHLsgozeGTArkgOoeMuArSYQdLSliz5Ce0wjmfI/q?=
 =?us-ascii?Q?bWrz5uxmoIMp5+SMzmb8iRtEhsRg9v1EPhZHkniqQPmhlkptBIlNzHSzGUuW?=
 =?us-ascii?Q?f+m65Gwr3usEnbuVjXaO/Bi6WOMzhIw2fUTBfu3KPLsTH+rLVhr0P0dG77MU?=
 =?us-ascii?Q?hzNn0+ZVbZiaq8TmA+cu03mgobCPjkWW7btNldSpIopJx5/m/8+5AtJnIOkL?=
 =?us-ascii?Q?Pr8F+i6ExmEI1j6GTN0LT7hd6gObpZnQPm2qnqO2btGdbmIXpSrUZ1VSKC6C?=
 =?us-ascii?Q?s4iXrZVZQeePXb0k0M35kaPmXIF2acZyz9huTABLxoaEWEq0EhNpCulvddFr?=
 =?us-ascii?Q?wdFYwDFFddTUEOdmSxqcp0YKuuDQ/zBXBmAp+WNkyz11nPH1+FWmo7yYUWWr?=
 =?us-ascii?Q?Dhadnxua5AsurHJo3e4KXIUS9oQllc94OPlInZzKaY+jT7WFJwFR15s/2Zo3?=
 =?us-ascii?Q?TCrB5as19SUGRjiKgUcVx80Vf3r/EfYJ+2gj/opKfE1S6ab1c/peKyByXQ0Q?=
 =?us-ascii?Q?VdnOS8wF8WwEt78TtUXE0M4A+CM4GFXLdX3mez3IiX0iuTMH71KUu0H0XJUU?=
 =?us-ascii?Q?t+JwcTId9J7pzpRNypLB9iMup/s64LOZbFYnjCMR/Ie0sUrKuHucRbO5pQ6Y?=
 =?us-ascii?Q?duddgv1ehArIcg9WNRWsmit4y9NccC/CC9uLeix3+l9C8jEARbJOKcGid7y6?=
 =?us-ascii?Q?NtvvVEEB415FYBY/vccobNPle711YJFHQQy16EoNVBSZL3D4pkEWanIbGeNj?=
 =?us-ascii?Q?27s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5211a5d-9642-42b7-a613-08d9521bdde7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 23:03:08.9257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kw8F/6Xo5ktVdfiUW6DVaTmvZarX2W0dKwtyvWCP6x7+wP2bwawOLl6y2eULC+Jy++lnTDGC3xO5Q86mWK8zFLXWFmerQNpduHBkyTpUsrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2901
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
Cc: "Dea, Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,
Thanks for the review.

> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: Wednesday, July 28, 2021 12:31 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: dri-devel@lists.freedesktop.org; Dea, Edmund J
> <edmund.j.dea@intel.com>
> Subject: Re: [PATCH 14/14] drm/kmb: Enable support for fbcon (framebuffer
> console)
>=20
> Hi Anitha,
>=20
> On Tue, Jul 27, 2021 at 05:31:26PM -0700, Anitha Chrisanthus wrote:
> > From: Edmund Dea <edmund.j.dea@intel.com>
> >
> > Enable support for fbcon (framebuffer console).
> > The user can initialize fbcon by loading kmb-drm with the parameter
> > console=3D1.
>=20
> I do not see the poit of the boot parameter??
> Why is it needed here but not in other drivers?
By default, console is not enabled in this driver, customer only needs it w=
hen they are doing initial setups
and then want it disabled after.
>=20
> >
> > Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
> > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > ---
> >  drivers/gpu/drm/kmb/kmb_drv.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> > index d0de1db03493..d39d004f513a 100644
> > --- a/drivers/gpu/drm/kmb/kmb_drv.c
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > @@ -5,6 +5,7 @@
> >
> >  #include <linux/clk.h>
> >  #include <linux/module.h>
> > +#include <linux/moduleparam.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/of_reserved_mem.h>
> > @@ -15,6 +16,7 @@
> >
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_drv.h>
> > +#include <drm/drm_fb_helper.h>
> >  #include <drm/drm_gem_cma_helper.h>
> >  #include <drm/drm_gem_framebuffer_helper.h>
> >  #include <drm/drm_irq.h>
> > @@ -25,7 +27,13 @@
> >  #include "kmb_dsi.h"
> >  #include "kmb_regs.h"
> >
> > -static int kmb_display_clk_enable(struct kmb_drm_private *kmb)
> > +/* Module Parameters */
> > +static bool console;
> > +module_param(console, bool, 0400);
> > +MODULE_PARM_DESC(console,
> > +		 "Enable framebuffer console support (0=3Ddisable [default],
> 1=3Don)");
> > +
> > +int kmb_display_clk_enable(struct kmb_drm_private *kmb)
> kmb_display_clk_enable lost a "static" - it will result in a warning if
> you build with W=3D1
Will fix it in v2
>=20
> >  {
> >  	int ret =3D 0;
> >
> > @@ -546,6 +554,9 @@ static int kmb_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		goto err_register;
> >
> > +	if (console)
> > +		drm_fbdev_generic_setup(&kmb->drm, 32);
> > +
> >  	return 0;
> >
> >   err_register:
> > --
> > 2.25.1
