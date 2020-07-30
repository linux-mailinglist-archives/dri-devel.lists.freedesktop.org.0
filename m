Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484C82339B1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 22:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C4E6E03E;
	Thu, 30 Jul 2020 20:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DE36E039;
 Thu, 30 Jul 2020 20:36:46 +0000 (UTC)
IronPort-SDR: mftc0ojpPgN2Fe4x6jxk/PQGnTZlNMZ9kTrFZH8dae/MjhrpEnt1TA1BiNV6u+XUzBzNRW4Cub
 bVZSofq1jpvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="236554723"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="236554723"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 13:36:45 -0700
IronPort-SDR: +FxJDvOE4Pux0YW4vdfoectzTosCYw8yI7EgfmAQtOqGmMRwzSfItCDU99K/vZiyC68jd4KdD6
 7vtIaUE7CPXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="291004978"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by orsmga006.jf.intel.com with ESMTP; 30 Jul 2020 13:36:45 -0700
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 13:36:45 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX111.amr.corp.intel.com (10.22.240.12) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 13:36:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 13:36:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpRdaDiwMb8NBGrITebya1yk0idFxvJU8jBAEz73BAlLdqW7tTU4TTHLyPkV26fGTn/tiozufsI0eMa8omPkXskV7W67pHcDes/WHYhtgv0Gwyr9yVOQa1EuyPuiCn+YRzYAfQM/N1IGNVFWDmOTfpiaZqr0RzsX8mi0xyKUVwqTtxy60vvGutvqjTWuE8gZ25siIT7p2OxmcWzyQRBTURXG8CRVLI4JPjVmi+bFsp90ev51X/Den3fEZ24a1wOPhJLKSjw8X+f7Fp2eq0ySZK7ElV4cXSXXnvh0QVI2kL/2Xr1DKR1ak6uKeVu06xqnliAig+b3LKswCbB+ByfZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znWOhNUag8fuUPAZAoVEdoF+hYS4Zdhjmz9WyeoS2AI=;
 b=EkyNAGE8jLSiAOeinmFs5BEheBISFUm6/Im0x0wpDJiRNpAJEDCfcQleBga3Cv2MCjoFdsA13ymBIHtBTYTfhT7m3a91lzkIOWzT9Wvx0rirZ2Jw6LUgOWbJHiMoHcQWf6k0kyG5uEEIq9XPTvh4GaTP+NUrd8MmDtAKcZ5l+Ouv/LusjNc7aqFmvdu1hxenbgeULjR3zznmwBb6OZtBToQ9Stlcm5ZZazfXpzU9DEC9b1XSfgRmaOs6AeywdPawlHpaczaeutzfI3CY60j5Sg+87i21aMxCC4mxaJSUvUS6jMGEweDn9nv6yUYt+qX5JvK3r18F7bXF2M4/EmXbng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znWOhNUag8fuUPAZAoVEdoF+hYS4Zdhjmz9WyeoS2AI=;
 b=Jjb7NrU1R1swk1dcXaoFmwoZbBGexSaQfTVopXY6aSVHkIrDVx/nhH5dRWvi6MWhWs/7ukL4PXiIu7g+BBN/MzkVDGlIwayE+dxwpboUX6tCLKkY4CUwQeinc9MlnD9ImHcfFxPkgKiaydaUG9ROeunXTd/FTogrwjdWWEHLKoU=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB3109.namprd11.prod.outlook.com (2603:10b6:a03:8c::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Thu, 30 Jul
 2020 20:36:26 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::182e:91a7:1007:7dc6]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::182e:91a7:1007:7dc6%7]) with mapi id 15.20.3216.034; Thu, 30 Jul 2020
 20:36:26 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH v3] drm/kmb: Add support for KeemBay Display
Thread-Topic: [PATCH v3] drm/kmb: Add support for KeemBay Display
Thread-Index: AQHWXH+OvghU8DJVW06F4MEjAgxmG6kNUASAgAOhiqA=
Date: Thu, 30 Jul 2020 20:36:25 +0000
Message-ID: <BY5PR11MB4182176D555AECDCC37165298C710@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <1595020551-30768-1-git-send-email-anitha.chrisanthus@intel.com>
 <1595020551-30768-2-git-send-email-anitha.chrisanthus@intel.com>
 <20200718130819.GA2990383@ravnborg.org>
In-Reply-To: <20200718130819.GA2990383@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd54f09e-28aa-4a64-dd14-08d834c83af8
x-ms-traffictypediagnostic: BYAPR11MB3109:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3109A34209079E5D837ED41F8C710@BYAPR11MB3109.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7sHTw1LEj/JvD4bEVvf0nfDXMEtL5wV9hrRA5WVsymxB8TzK+NxDbsABSmfdpKY7W0wNCUCkmfmRNtJ648zoEA6DURUiCCPUgVcHumUd/wYqwvKufkyC3Kn5AIIYuuGepFOj5JoTDFabUAxDDsoy2KTNliEOYYNQ9iTG+1B9DT7OpAjCoYOgx/GS3bZJ5V2kIdUIWXyGTEnUP0gri2EAe0c6TCECVxwmSbE438AMNC5oB5glaG6EosbwEBakj0SubEP66EVBy/OyhwjFVPuv/iXJFr8T0Xg5OsT/ARvIM9TABT9Rb0nzW/42TGRYrufnigwwcZLHYOqz5bPGogL87x1i4/bHqlonoPdMJU7pd0uVmAQEjrTNwEhJQeVmF3w0DrPeCRmDqCH7yPfoqJ3Ru2aNzPypC+lu0cGGELc+g0oZmYZyU2YLKF/qSk1ltoY6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(5660300002)(55016002)(6506007)(26005)(66476007)(86362001)(76116006)(64756008)(66946007)(9686003)(186003)(52536014)(53546011)(66556008)(7696005)(2906002)(66446008)(478600001)(8676002)(33656002)(83380400001)(45080400002)(30864003)(71200400001)(54906003)(316002)(8936002)(6916009)(966005)(4326008)(569008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Dz3gxxclXSumemHvnNzEM8x+UQhI46BSssK1vADeFVfOhub9zWS2Mo/7hs0oZFwyBYU7janyWrQGGFVlKwS7kABjIZtzJTTkcK/Ekpd6JGq+uPa4MQqxOS4KmqVe6IDHagFQR0NzYh+GWiZaEU8ZknTaG2xTJDSgl10/+fy1u5TQSKDUCt0+Z7dMXizis0LBoA486r2k+EBMz/G5K/TE69TWXSRcGpp5+NeZSz7ysucH8APOquB9bKjNYiHl5DVrkPHkrtcmWSFTM961Rk97VmWkMi/bIJcaUx8qPfFn/uh+IPH43jSBWMY4lth6gtDAK0cfj/D0BUq9UGoRLb+wiCEf8KLb5BtQGccsitcE2LYUIBoqzw3PQcEpw0rV41ZDMcTAFoSAxu1a4dywM2w4ebjJw/0s6DipaDzUfQ58lD9t+fIJZfmtE6WooKcwU7y4E6ERiyDSJzPZqZBMHN07ZtSkj3xMfgNod5IoSNhXXaYR+Aa69gvDaM0m678lRaKXutePf7431YD9TLwMcruve0yKkw4UUimMV2bKgXrJk7ZEHawQ3qBSdT2TawaDB7ExoaZ+ns4dAzOio+8gVz/dNMKDGMIJhPqeemQsZ4UMaDdElxH3f///a1rvnjg9sAPmtC6sDGhmxPyhcWJFZeiiWw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd54f09e-28aa-4a64-dd14-08d834c83af8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 20:36:25.7278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ghh5CnOdmEmyQGHXpvr0QkcWuQ9gIwg0bsoHaalA7uucrzVknT9BchAl6XaqVdBvhtFtfmy2hFpCbsJ0UJxmsylL9exYtnaQbtMHYMMpHCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3109
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,
Thanks for your detailed review, please see my comments/questions in line. I have made the review changes and I am sending v4 soon.

Thanks,
Anitha

> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: Saturday, July 18, 2020 6:08 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: dri-devel@lists.freedesktop.org; Paauwe, Bob J <bob.j.paauwe@intel.com>;
> Dea, Edmund J <edmund.j.dea@intel.com>; Vetter, Daniel
> <daniel.vetter@intel.com>; intel-gfx@lists.freedesktop.org; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: Re: [PATCH v3] drm/kmb: Add support for KeemBay Display
> 
> Hi Anitha.
> 
> 
> On Fri, Jul 17, 2020 at 02:15:51PM -0700, Anitha Chrisanthus wrote:
> > This is a basic KMS atomic modesetting display driver for KeemBay family of
> > SOCs. Driver has no 2D or 3D graphics.It calls into the ADV bridge
> > driver at the connector level.
> >
> > Single CRTC with LCD controller->mipi DSI-> ADV bridge
> >
> > Only 1080p resolution and single plane is supported at this time.
> >
> > v2: moved extern to .h, removed license text
> >     use drm_dev_init, upclassed dev_private, removed HAVE_IRQ.
> >
> > v3: Squashed all 59 commits to one
> >
> > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
> 
> This was much easier to look into with it all squashed together.
> See comments scattered in the following.
> 
> The only major feedback is that kmb_dsi really looks like something that
> should be implemented as a real bridge driver.
> Lots of small details to bring the driver up to the current standard.
> And other bits I noted while browsing the code.
> 
> 	Sam
> 
> > ---
> >  drivers/gpu/drm/Kconfig         |    2 +
> >  drivers/gpu/drm/Makefile        |    1 +
> >  drivers/gpu/drm/kmb/Kconfig     |   12 +
> >  drivers/gpu/drm/kmb/Makefile    |    2 +
> >  drivers/gpu/drm/kmb/kmb_crtc.c  |  219 +++++
> >  drivers/gpu/drm/kmb/kmb_crtc.h  |   41 +
> >  drivers/gpu/drm/kmb/kmb_drv.c   |  759 ++++++++++++++++
> >  drivers/gpu/drm/kmb/kmb_drv.h   |  165 ++++
> >  drivers/gpu/drm/kmb/kmb_dsi.c   | 1833
> +++++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/kmb/kmb_dsi.h   |  370 ++++++++
> >  drivers/gpu/drm/kmb/kmb_plane.c |  515 +++++++++++
> >  drivers/gpu/drm/kmb/kmb_plane.h |  124 +++
> >  drivers/gpu/drm/kmb/kmb_regs.h  |  738 ++++++++++++++++
> >  13 files changed, 4781 insertions(+)
> >  create mode 100644 drivers/gpu/drm/kmb/Kconfig
> >  create mode 100644 drivers/gpu/drm/kmb/Makefile
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.h
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.h
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_dsi.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_dsi.h
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.h
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_regs.h
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index c4fd57d..5292574 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -275,6 +275,8 @@ source "drivers/gpu/drm/nouveau/Kconfig"
> >
> >  source "drivers/gpu/drm/i915/Kconfig"
> >
> > +source "drivers/gpu/drm/kmb/Kconfig"
> > +
> >  config DRM_VGEM
> >  	tristate "Virtual GEM provider"
> >  	depends on DRM
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 2c0e5a7..bdbdc63 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -71,6 +71,7 @@ obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
> >  obj-$(CONFIG_DRM_MGA)	+= mga/
> >  obj-$(CONFIG_DRM_I810)	+= i810/
> >  obj-$(CONFIG_DRM_I915)	+= i915/
> > +obj-$(CONFIG_DRM_KMB_DISPLAY)  += kmb/
> >  obj-$(CONFIG_DRM_MGAG200) += mgag200/
> >  obj-$(CONFIG_DRM_V3D)  += v3d/
> >  obj-$(CONFIG_DRM_VC4)  += vc4/
> > diff --git a/drivers/gpu/drm/kmb/Kconfig b/drivers/gpu/drm/kmb/Kconfig
> > new file mode 100644
> > index 0000000..005a9962
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/Kconfig
> > @@ -0,0 +1,12 @@
> > +config DRM_KMB_DISPLAY
> > +	tristate "KEEMBAY DISPLAY"
> > +	depends on DRM && OF && (ARM || ARM64)
> > +	depends on COMMON_CLK
> > +	select DRM_KMS_HELPER
> > +	select DRM_KMS_CMA_HELPER
> > +	select DRM_GEM_CMA_HELPER
> > +	select VIDEOMODE_HELPERS
> > +	help
> > +	Choose this option if you have an KEEMBAY DISPLAY controller.
> > +
> > +	If M is selected the module will be called kmb-display.
> 
> It would be good if you could elaborate just a bit more here.
> Just so users knows a bit more what it is. For example I think most
> users will not know this is something from Intel.
> Also I think the module is not named kmb-display, so this needs to be
> addressed.
Will add more details
> 
> > diff --git a/drivers/gpu/drm/kmb/Makefile b/drivers/gpu/drm/kmb/Makefile
> > new file mode 100644
> > index 0000000..527d737
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/Makefile
> > @@ -0,0 +1,2 @@
> > +kmb-drm-y := kmb_crtc.o kmb_drv.o kmb_plane.o kmb_dsi.o
> > +obj-$(CONFIG_DRM_KMB_DISPLAY)	+= kmb-drm.o
> > diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c
> b/drivers/gpu/drm/kmb/kmb_crtc.c
> > new file mode 100644
> > index 0000000..570d46e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_crtc.c
> > @@ -0,0 +1,219 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2018-2020 Intel Corporation
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_data/simplefb.h>
> > +#include <video/videomode.h>
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_plane_helper.h>
> > +#include "kmb_crtc.h"
> > +#include "kmb_drv.h"
> > +#include "kmb_plane.h"
> > +#include "kmb_regs.h"
> > +#include "kmb_dsi.h"
> Almost OK - an empty line between each block would be appreciated.
Will do
> 
> > +
> > +static void kmb_crtc_cleanup(struct drm_crtc *crtc)
> > +{
> > +	struct kmb_crtc *l_crtc = to_kmb_crtc(crtc);
> > +
> > +	drm_crtc_cleanup(crtc);
> > +	kfree(l_crtc);
> > +}
> I cannot find where kmb_crtc is allocated - is this a left-over from
> some old code and it is no longer used/relevant?
You're right - will remove it.
> > +
> > +static int kmb_crtc_enable_vblank(struct drm_crtc *crtc)
> > +{
> > +	struct drm_device *dev = crtc->dev;
> > +	struct kmb_drm_private *dev_p = to_kmb(dev);
> bikeshedding...
> general comment.
> s/dev_p/kmb - it is a pointer to kmb_drm_private - so
> name it kmb to better reflect this.
> Bikeshedding - feel free to ignore.
Will change name to kmb
> 
> > +
> > +	/*clear interrupt */
> General comment. Include whitespace after "/*" and start with a capital
> letter.
> Not a big deal, but this steal focus when not followed.
Will change
> 
> > +	kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> > +	/*set which interval to generate vertical interrupt */
> > +	kmb_write_lcd(dev_p, LCD_VSTATUS_COMPARE,
> > +		      LCD_VSTATUS_COMPARE_VSYNC);
> > +	/* enable vertical interrupt */
> > +	kmb_set_bitmask_lcd(dev_p, LCD_INT_ENABLE,
> > +			    LCD_INT_VERT_COMP);
> > +	return 0;
> > +}
> > +
> > +static void kmb_crtc_disable_vblank(struct drm_crtc *crtc)
> > +{
> > +	struct drm_device *dev = crtc->dev;
> > +	struct kmb_drm_private *dev_p = to_kmb(dev);
> > +
> > +	/*clear interrupt */
> > +	kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> I had expected you should clear the interrupt _after_ disabling the
> interrupt. But I guess this is no big deal as interrupt may occur also
> just before the disable.
> 
> > +	/* disable vertical interrupt */
> > +	kmb_clr_bitmask_lcd(dev_p, LCD_INT_ENABLE,
> > +			LCD_INT_VERT_COMP);
> > +}
> > +
> > +static const struct drm_crtc_funcs kmb_crtc_funcs = {
> > +	.destroy = kmb_crtc_cleanup,
> > +	.set_config = drm_atomic_helper_set_config,
> > +	.page_flip = drm_atomic_helper_page_flip,
> > +	.reset = drm_atomic_helper_crtc_reset,
> > +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> > +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> > +	.enable_vblank = kmb_crtc_enable_vblank,
> > +	.disable_vblank = kmb_crtc_disable_vblank,
> > +};
> > +
> > +static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
> > +{
> > +	struct drm_device *dev = crtc->dev;
> > +	struct drm_display_mode *m = &crtc->state->adjusted_mode;
> > +	struct videomode vm;
> videomode should not be required here.
> > +	int vsync_start_offset;
> > +	int vsync_end_offset;
> > +	struct kmb_drm_private *dev_p = to_kmb(dev);
> > +	unsigned int val = 0;
> > +
> > +	/* initialize mipi */
> > +	kmb_dsi_hw_init(dev, m);
> > +	drm_info(dev,
> > +		"vfp= %d vbp= %d vsyc_len=%d hfp=%d hbp=%d
> hsync_len=%d\n",
> > +		 m->crtc_vsync_start - m->crtc_vdisplay,
> > +		 m->crtc_vtotal - m->crtc_vsync_end,
> > +		 m->crtc_vsync_end - m->crtc_vsync_start,
> > +		 m->crtc_hsync_start - m->crtc_hdisplay,
> > +		 m->crtc_htotal - m->crtc_hsync_end,
> > +		 m->crtc_hsync_end - m->crtc_hsync_start);
> > +	val = kmb_read_lcd(dev_p, LCD_INT_ENABLE);
> > +	kmb_clr_bitmask_lcd(dev_p, LCD_INT_ENABLE, val);
> > +	kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR, ~0x0);
> > +	vm.vfront_porch = 2;
> > +	vm.vback_porch = 2;
> > +	vm.vsync_len = 8;
> > +	vm.hfront_porch = 0;
> > +	vm.hback_porch = 0;
> > +	vm.hsync_len = 28;
> This looks like values that should come from the panel - and not values
> hardcoded in the driver.
The panel timings are used in the mipi dsi programming. The above values are the optimal values for LCD controller for 1080p resolution. 
Here the LCD controller reads the frame buffer through DMA transfer and passes it on to mipi dsi controller which adds the panel's exact timings.
I will add a comment in the code describing this.
> 
> The use of struct videomode should be avoid IMO.
> videomode balongs to fbdev time, use display_timing is you need
> something like it.
Will add a new struct for this. 
> 
> > +
> > +	vsync_start_offset =  m->crtc_vsync_start -  m->crtc_hsync_start;
> > +	vsync_end_offset =  m->crtc_vsync_end - m->crtc_hsync_end;
> > +
> > +	drm_dbg(dev, "%s : %dactive height= %d vbp=%d vfp=%d vsync-w=%d h-
> active=%d h-bp=%d h-fp=%d hysnc-l=%d",
> > +			__func__, __LINE__,
> > +			m->crtc_vdisplay, vm.vback_porch, vm.vfront_porch,
> > +			vm.vsync_len, m->crtc_hdisplay, vm.hback_porch,
> > +			vm.hfront_porch, vm.hsync_len);
> > +	kmb_write_lcd(dev_p, LCD_V_ACTIVEHEIGHT,
> > +			m->crtc_vdisplay - 1);
> > +	kmb_write_lcd(dev_p, LCD_V_BACKPORCH, vm.vback_porch);
> > +	kmb_write_lcd(dev_p, LCD_V_FRONTPORCH, vm.vfront_porch);
> > +	kmb_write_lcd(dev_p, LCD_VSYNC_WIDTH, vm.vsync_len - 1);
> > +	kmb_write_lcd(dev_p, LCD_H_ACTIVEWIDTH,
> > +			m->crtc_hdisplay - 1);
> > +	kmb_write_lcd(dev_p, LCD_H_BACKPORCH, vm.hback_porch);
> > +	kmb_write_lcd(dev_p, LCD_H_FRONTPORCH, vm.hfront_porch);
> > +	kmb_write_lcd(dev_p, LCD_HSYNC_WIDTH, vm.hsync_len - 1);
> > +	/*this is hardcoded as 0 in the Myriadx code */
> > +	kmb_write_lcd(dev_p, LCD_VSYNC_START, 0);
> > +	kmb_write_lcd(dev_p, LCD_VSYNC_END, 0);
> > +	/* back ground color */
> > +	kmb_write_lcd(dev_p, LCD_BG_COLOUR_LS, 0x4);
> > +	if (m->flags == DRM_MODE_FLAG_INTERLACE) {
> > +		kmb_write_lcd(dev_p,
> > +			      LCD_VSYNC_WIDTH_EVEN, vm.vsync_len - 1);
> > +		kmb_write_lcd(dev_p,
> > +				LCD_V_BACKPORCH_EVEN, vm.vback_porch);
> > +		kmb_write_lcd(dev_p,
> > +				LCD_V_FRONTPORCH_EVEN,
> vm.vfront_porch);
> > +		kmb_write_lcd(dev_p, LCD_V_ACTIVEHEIGHT_EVEN,
> > +			      m->crtc_vdisplay - 1);
> > +		/*this is hardcoded as 10 in the Myriadx code */
> > +		kmb_write_lcd(dev_p, LCD_VSYNC_START_EVEN, 10);
> > +		kmb_write_lcd(dev_p, LCD_VSYNC_END_EVEN, 10);
> > +	}
> > +	kmb_write_lcd(dev_p, LCD_TIMING_GEN_TRIG, ENABLE);
> > +	kmb_set_bitmask_lcd(dev_p, LCD_CONTROL, LCD_CTRL_ENABLE);
> 
> > +	kmb_set_bitmask_lcd(dev_p, LCD_INT_ENABLE, val);
> Is LCD_INT_ENABLE, really a readable register?
> val is assigned the value from LCD_INT_ENABLE, before.
Yes it's a readable register, val is saving its enabled bits - we disable the interrupts before programming the lcd timing and then enable it after.
> 
> 
> > +	/* TBD */
> > +	/* set clocks here */
> > +}
> > +
> > +static void kmb_crtc_atomic_enable(struct drm_crtc *crtc,
> > +				   struct drm_crtc_state *old_state)
> > +{
> > +	struct kmb_drm_private *lcd = crtc_to_kmb_priv(crtc);
> > +
> > +	clk_prepare_enable(lcd->clk);
> > +	kmb_crtc_mode_set_nofb(crtc);
> > +	drm_crtc_vblank_on(crtc);
> > +}
> > +
> > +static void kmb_crtc_atomic_disable(struct drm_crtc *crtc,
> > +				    struct drm_crtc_state *old_state)
> > +{
> > +	struct kmb_drm_private *lcd = crtc_to_kmb_priv(crtc);
> > +
> > +	/* always disable planes on the CRTC that is being turned off */
> > +	drm_atomic_helper_disable_planes_on_crtc(old_state, false);
> > +
> > +	drm_crtc_vblank_off(crtc);
> > +	clk_disable_unprepare(lcd->clk);
> > +}
> > +
> > +static void kmb_crtc_atomic_begin(struct drm_crtc *crtc,
> > +				  struct drm_crtc_state *state)
> > +{
> > +	struct drm_device *dev = crtc->dev;
> > +	struct kmb_drm_private *dev_p = to_kmb(dev);
> > +
> > +	kmb_clr_bitmask_lcd(dev_p, LCD_INT_ENABLE,
> > +			    LCD_INT_VERT_COMP);
> > +}
> > +
> > +static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
> > +				  struct drm_crtc_state *state)
> > +{
> > +	struct drm_device *dev = crtc->dev;
> > +	struct kmb_drm_private *dev_p = to_kmb(dev);
> > +
> > +	kmb_set_bitmask_lcd(dev_p, LCD_INT_ENABLE,
> > +			    LCD_INT_VERT_COMP);
> > +
> > +	spin_lock_irq(&crtc->dev->event_lock);
> > +	if (crtc->state->event)
> > +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +	crtc->state->event = NULL;
> > +	spin_unlock_irq(&crtc->dev->event_lock);
> > +}
> > +
> > +static const struct drm_crtc_helper_funcs kmb_crtc_helper_funcs = {
> > +	.atomic_begin = kmb_crtc_atomic_begin,
> > +	.atomic_enable = kmb_crtc_atomic_enable,
> > +	.atomic_disable = kmb_crtc_atomic_disable,
> > +	.atomic_flush = kmb_crtc_atomic_flush,
> > +};
> > +
> > +int kmb_setup_crtc(struct drm_device *drm)
> > +{
> > +	struct kmb_drm_private *lcd = to_kmb(drm);
> General comment.
> It makes code more read-able if the same local name is used all over.
> Right now there is lcd and dev_p (and then I went agead and suggested
> kmb as a third name - sigh).
Will change to kmb everywhere.
> 
> > +	struct kmb_plane *primary;
> > +	int ret;
> > +
> > +	primary = kmb_plane_init(drm);
> > +	if (IS_ERR(primary))
> > +		return PTR_ERR(primary);
> > +
> > +	ret = drm_crtc_init_with_planes(drm, &lcd->crtc, &primary-
> >base_plane,
> > +					NULL, &kmb_crtc_funcs, NULL);
> > +	if (ret) {
> > +		kmb_plane_destroy(&primary->base_plane);
> > +		return ret;
> > +	}
> > +
> > +	drm_crtc_helper_add(&lcd->crtc, &kmb_crtc_helper_funcs);
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/kmb/kmb_crtc.h
> b/drivers/gpu/drm/kmb/kmb_crtc.h
> > new file mode 100644
> > index 0000000..51a0a39
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_crtc.h
> > @@ -0,0 +1,41 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only
> > + *
> > + * Copyright (c) 2018-2020 Intel Corporation
> > + */
> > +
> > +#ifndef __KMB_CRTC_H__
> > +#define __KMB_CRTC_H__
> > +
> > +#include <linux/clk.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_data/simplefb.h>
> > +#include <video/videomode.h>
> > +#include <drm/drm_debugfs.h>
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_file.h>
> > +#include <drm/drm_fourcc.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_vblank.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/wait.h>
> > +#include "kmb_drv.h"
> > +
> > +#define to_kmb_crtc_state(x) container_of(x, struct kmb_crtc_state,
> crtc_base)
> > +#define to_kmb_crtc(x) container_of(x, struct kmb_crtc, crtc_base)
> > +
> > +struct kmb_crtc {
> > +	struct drm_crtc crtc_base;
> > +	struct kmb_drm_private kmb_dev;
> > +};
> This struct looks unused - delete it.
ok
> 
> > +
> > +struct kmb_crtc_state {
> > +	struct drm_crtc_state crtc_base;
> > +};
> This struct looks unused - delete it.
ok
> 
> > +
> > +extern void kmb_plane_destroy(struct drm_plane *plane);
> General comment - drop extern in fron of prototypes in .h files.
> kmb_plane_destroy is declared in another .h file - so drop this.
> 
> > +extern struct kmb_plane *kmb_plane_init(struct drm_device *drm);
> This is likewise decalred in another .h file - drop it.
> 
> > +#endif /* __KMB_CRTC_H__ */
> kmb_setup_crtc() is decalred in mkb_drv.h - so there i s no need for
> this header file anymore - delete it.
ok
> 
> > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> > new file mode 100644
> > index 0000000..159f36a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > @@ -0,0 +1,759 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2018-2020 Intel Corporation
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/console.h>
> > +#include <linux/list.h>
> > +#include <linux/module.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/spinlock.h>
> > +#include <drm/drm.h>
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_ioctl.h>
> > +#include <drm/drm_irq.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include "kmb_crtc.h"
> > +#include "kmb_drv.h"
> > +#include "kmb_dsi.h"
> > +#include "kmb_plane.h"
> > +#include "kmb_regs.h"
> > +
> > +//#define DEBUG
> No // comments (not may rule, but some people request them removed)
> 
> > +/* IRQ handler */
> > +static irqreturn_t kmb_isr(int irq, void *arg);
> No need for this prototype - drop it.
ok
> 
> > +
> > +int kmb_under_flow = 0, kmb_flush_done = 0, layer_no = 0;
> > +static struct clk *clk_lcd;
> > +static struct clk *clk_mipi;
> > +static struct clk *clk_mipi_ecfg;
> > +static struct clk *clk_mipi_cfg;
> > +static struct clk *clk_pll0;
> Why are they not all part of kmb_drm_private?
Its local to kmb_drv.c will create a struct for these.
> 
> > +
> > +struct drm_bridge *adv_bridge;
> Same here?
Its called before drm is allocated.
> 
> > +
> > +int kmb_display_clk_enable(void)
> pass kmb_drm_private so drm_* can be used for logging.
ok
> 
> > +{
> > +	int ret = 0;
> > +
> > +	ret = clk_prepare_enable(clk_lcd);
> > +	if (ret) {
> > +		DRM_ERROR("Failed to enable LCD clock: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = clk_prepare_enable(clk_mipi);
> > +	if (ret) {
> > +		DRM_ERROR("Failed to enable MIPI clock: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = clk_prepare_enable(clk_mipi_ecfg);
> > +	if (ret) {
> > +		DRM_ERROR("Failed to enable MIPI_ECFG clock: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = clk_prepare_enable(clk_mipi_cfg);
> > +	if (ret) {
> > +		DRM_ERROR("Failed to enable MIPI_CFG clock: %d\n", ret);
> > +		return ret;
> > +	}
> > +	DRM_INFO("SUCCESS : enabled LCD MIPI clocks\n");
> Consider using an array for the clocks - simpler code.
> 
> 
> > +	return 0;
> > +}
> > +
> > +static int kmb_display_clk_disable(void)
> > +{
> > +	if (clk_lcd)
> > +		clk_disable_unprepare(clk_lcd);
> > +	if (clk_mipi)
> > +		clk_disable_unprepare(clk_mipi);
> > +	if (clk_mipi_ecfg)
> > +		clk_disable_unprepare(clk_mipi_ecfg);
> > +	if (clk_mipi_cfg)
> > +		clk_disable_unprepare(clk_mipi_cfg);
> > +	return 0;
> > +}
> > +
> > +static void __iomem *kmb_map_mmio(struct platform_device *pdev, char
> *name)
> > +{
> > +	struct resource *res;
> > +	u32 size;
> > +	void __iomem *mem;
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> name);
> > +	if (!res) {
> > +		DRM_ERROR("failed to get resource for %s\n", name);
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +	size = resource_size(res);
> > +	if (!request_mem_region(res->start, size, name)) {
> > +		DRM_ERROR("failed to reserve %s registers\n", name);
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +	mem = ioremap(res->start, size);
> > +	if (!mem) {
> > +		DRM_ERROR("failed to ioremap %s registers\n", name);
> > +		release_mem_region(res->start, size);
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +	return mem;
> > +}
> Error handling when calling kmb_map_mmio() looks wrong.
> The best way to fix it up would be to introduce the devm_ variants
> so this gets cleaned up automatically.
> I think devm_ioremap_resource() will ct it - did not check it.
ok
> 
> 
> > +
> > +//#define ICAM_LCD_QOS
> Some debug left over that should be dropped?
ok
> 
> > +static int kmb_load(struct drm_device *drm, unsigned long flags)
> > +{
> > +	struct kmb_drm_private *dev_p = to_kmb(drm);
> > +	struct platform_device *pdev = to_platform_device(drm->dev);
> > +	int irq_lcd;
> > +	int ret = 0;
> > +	unsigned long clk;
> > +#ifdef ICAM_LCD_QOS
> > +	int val = 0;
> > +#endif
> > +	struct device_node *vpu_dev;
> > +
> > +	/* Map MIPI MMIO registers */
> > +	dev_p->mipi_mmio = kmb_map_mmio(pdev, "mipi_regs");
> > +	if (IS_ERR(dev_p->mipi_mmio)) {
> > +		drm_err(&dev_p->drm, "failed to map MIPI registers\n");
> > +		iounmap(dev_p->lcd_mmio);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	/* Map LCD MMIO registers */
> > +	dev_p->lcd_mmio = kmb_map_mmio(pdev, "lcd_regs");
> > +	if (IS_ERR(dev_p->lcd_mmio)) {
> > +		drm_err(&dev_p->drm, "failed to map LCD registers\n");
> > +		return -ENOMEM;
> > +	}
> Here is the broken error handling.
> Fails to iounmap dev_p->mipi_mmio when lcd_mmio fails.
> And a few lines up lcd_mmio is unmapped before it is mapped.
Good catch! Was introduced inadvertently during code cleanup.
> 
> > +
> > +	/* This is only for MIPI_TX_MSS_LCD_MIPI_CFG and
> > +	 * MSS_CAM_CLK_CTRL register
> > +	 */
> > +	dev_p->msscam_mmio = kmb_map_mmio(pdev, "msscam_regs");
> > +	if (IS_ERR(dev_p->msscam_mmio)) {
> > +		drm_err(&dev_p->drm, "failed to map MSSCAM registers\n");
> > +		iounmap(dev_p->lcd_mmio);
> > +		iounmap(dev_p->mipi_mmio);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	if (IS_ERR(dev_p->msscam_mmio)) {
> > +		drm_err(&dev_p->drm, "failed to map MSSCAM registers\n");
> > +		iounmap(dev_p->lcd_mmio);
> > +		iounmap(dev_p->mipi_mmio);
> > +		return -ENOMEM;
> > +	}
> > +#ifdef ICAM_LCD_QOS
> > +	dev_p->icamlcd_mmio = ioremap_nocache(ICAM_MMIO,
> ICAM_MMIO_SIZE);
> > +	if (IS_ERR(dev_p->icamlcd_mmio)) {
> > +		drm_err(&dev_p->drm, "failed to map ICAM registers\n");
> > +		return -ENOMEM;
> > +	}
> > +#endif
> 
> The function is already long enough.
> Consider pulling clock stuff out ini a helper function.
ok
> 
> > +	/* Enable display clocks */
> > +	clk_lcd = clk_get(&pdev->dev, "clk_lcd");
> > +	if (IS_ERR(clk_lcd)) {
> > +		drm_err(&dev_p->drm, "clk_get() failed clk_lcd\n");
> > +		goto setup_fail;
> > +	}
> > +
> > +	clk_mipi = clk_get(&pdev->dev, "clk_mipi");
> > +	if (IS_ERR(clk_mipi)) {
> > +		drm_err(&dev_p->drm, "clk_get() failed clk_mipi\n");
> > +		goto setup_fail;
> > +	}
> > +
> > +	clk_mipi_ecfg = clk_get(&pdev->dev, "clk_mipi_ecfg");
> > +	if (IS_ERR(clk_mipi_ecfg)) {
> > +		drm_err(&dev_p->drm, "clk_get() failed clk_mipi_ecfg\n");
> > +		goto setup_fail;
> > +	}
> > +
> > +	clk_mipi_cfg = clk_get(&pdev->dev, "clk_mipi_cfg");
> > +	if (IS_ERR(clk_mipi_cfg)) {
> > +		drm_err(&dev_p->drm, "clk_get() failed clk_mipi_cfg\n");
> > +		goto setup_fail;
> > +	}
> > +	vpu_dev = of_find_node_by_path("/soc/vpu-ipc");
> > +	clk_pll0 = of_clk_get_by_name(vpu_dev, "pll_0_out_0");
> > +	if (IS_ERR(clk_pll0)) {
> > +		drm_err(&dev_p->drm, "clk_get() failed clk_pll0 ");
> > +		goto setup_fail;
> > +	}
> > +	dev_p->sys_clk_mhz = clk_get_rate(clk_pll0)/1000000;
> > +	drm_info(&dev_p->drm, "system clk = %d Mhz", dev_p->sys_clk_mhz);
> > +
> > +	/* Set LCD clock to 200 Mhz */
> > +	ret = clk_set_rate(clk_lcd, KMB_LCD_DEFAULT_CLK);
> > +	if (clk_get_rate(clk_lcd) != KMB_LCD_DEFAULT_CLK) {
> > +		drm_err(&dev_p->drm, "failed to set to clk_lcd to %d\n",
> > +			  KMB_LCD_DEFAULT_CLK);
> > +	}
> > +	drm_info(&dev_p->drm, "clk_lcd = %ld\n", clk_get_rate(clk_lcd));
> > +
> > +	/* Set MIPI clock to 24 Mhz */
> > +	ret = clk_set_rate(clk_mipi, KMB_MIPI_DEFAULT_CLK);
> > +	if (clk_get_rate(clk_mipi) != KMB_MIPI_DEFAULT_CLK) {
> > +		drm_err(&dev_p->drm, "failed to set to clk_mipi to %d\n",
> > +			  KMB_MIPI_DEFAULT_CLK);
> > +		goto setup_fail;
> > +	}
> > +	drm_info(&dev_p->drm, "clk_mipi = %ld\n", clk_get_rate(clk_mipi));
> > +
> > +	clk = clk_get_rate(clk_mipi_ecfg);
> > +	if (clk != KMB_MIPI_DEFAULT_CFG_CLK) {
> > +		/* Set MIPI_ECFG clock to 24 Mhz */
> > +		ret = clk_set_rate(clk_mipi_ecfg,
> KMB_MIPI_DEFAULT_CFG_CLK);
> > +		clk = clk_get_rate(clk_mipi_ecfg);
> > +		if (clk != KMB_MIPI_DEFAULT_CFG_CLK) {
> > +			drm_err(&dev_p->drm,
> > +				"failed to set to clk_mipi_ecfg to %d\n",
> > +				 KMB_MIPI_DEFAULT_CFG_CLK);
> > +			goto setup_fail;
> > +		}
> > +
> > +		drm_info(&dev_p->drm, "clk_mipi_ecfg after set = %ld\n", clk);
> > +	}
> > +
> > +	clk = clk_get_rate(clk_mipi_cfg);
> > +	if (clk != KMB_MIPI_DEFAULT_CFG_CLK) {
> > +		/* Set MIPI_CFG clock to 24 Mhz */
> > +		ret = clk_set_rate(clk_mipi_cfg, 24000000);
> > +		clk = clk_get_rate(clk_mipi_cfg);
> > +		if (clk != KMB_MIPI_DEFAULT_CFG_CLK) {
> > +			drm_err(&dev_p->drm,
> > +					"failed to set clk_mipi_cfg to %d\n",
> > +				  KMB_MIPI_DEFAULT_CFG_CLK);
> > +			goto setup_fail;
> > +		}
> > +		drm_info(&dev_p->drm,
> > +				"Get clk_mipi_cfg after set = %ld\n", clk);
> > +	}
> > +
> > +	ret = kmb_display_clk_enable();
> > +
> > +	/* Enable MSS_CAM_CLK_CTRL for MIPI TX and LCD */
> > +	kmb_set_bitmask_msscam(dev_p, MSS_CAM_CLK_CTRL, 0x1fff);
> > +	kmb_set_bitmask_msscam(dev_p, MSS_CAM_RSTN_CTRL, 0xffffffff);
> > +
> > +	/* Register irqs here - section 17.3 in databook
> > +	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
> > +	 * firmware has redirected  79 to A53 IRQ 33
> extra space
> > +	 */
> > +
> > +	/* Allocate LCD interrupt resources, enable interrupt line,
> > +	 * and setup IRQ handling
> > +	 */
> > +	irq_lcd = platform_get_irq_byname(pdev, "irq_lcd");
> > +	if (irq_lcd < 0) {
> > +		drm_err(&dev_p->drm, "irq_lcd not found");
> > +		goto setup_fail;
> > +	}
> > +
> > +	/* Get the optional framebuffer memory resource */
> > +	ret = of_reserved_mem_device_init(drm->dev);
> > +	if (ret && ret != -ENODEV)
> > +		return ret;
> > +
> > +	spin_lock_init(&dev_p->irq_lock);
> > +
> > +	ret = kmb_setup_crtc(drm);
> > +	if (ret < 0) {
> > +		drm_err(&dev_p->drm, "failed to create crtc\n");
> > +		goto setup_fail;
> > +	}
> > +
> > +	/* Initialize MIPI DSI */
> > +	ret = kmb_dsi_init(drm, adv_bridge);
> > +	if (ret) {
> > +		drm_err(&dev_p->drm, "failed to initialize DSI\n");
> > +		goto setup_fail;
> > +	}
> > +
> > +	ret = drm_irq_install(drm, irq_lcd);
> > +	if (ret < 0) {
> > +		drm_err(&dev_p->drm, "failed to install IRQ handler\n");
> > +		goto irq_fail;
> > +	}
> > +
> > +	dev_p->irq_lcd = irq_lcd;
> > +
> > +	/* icam tests */
> > +#ifdef ICAM_LCD_QOS
> > +	/*generator mode = 0 fixed mode=1 limiter */
> > +	writel(1, (dev_p->icamlcd_mmio + ICAM_LCD_OFFSET +
> LCD_QOS_MODE));
> > +	/* b/w */
> > +	writel(0x60, (dev_p->icamlcd_mmio + ICAM_LCD_OFFSET +
> LCD_QOS_BW));
> > +
> > +	/* set priority.p1 */
> > +	val = readl(dev_p->icamlcd_mmio + ICAM_LCD_OFFSET +
> LCD_QOS_PRORITY);
> > +	val &= ~(0x700);
> > +	writel(val | 0x100,
> > +	       (dev_p->icamlcd_mmio + ICAM_LCD_OFFSET +
> LCD_QOS_PRORITY));
> > +
> > +	drm_info(&dev_p->drm,
> > +			"ICAM mode = 0x%x, priority = 0x%x bandwidth=0x%x",
> > +		 readl(dev_p->icamlcd_mmio + 0x1080 + LCD_QOS_MODE),
> > +		 readl(dev_p->icamlcd_mmio + 0x1080 + LCD_QOS_PRORITY),
> > +		 readl(dev_p->icamlcd_mmio + 0x1080 + LCD_QOS_BW));
> > +#endif
> > +	return 0;
> > +
> > + irq_fail:
> > +	drm_crtc_cleanup(&dev_p->crtc);
> > + setup_fail:
> > +	of_reserved_mem_device_release(drm->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +int kmb_atomic_helper_check(struct drm_device *dev,
> > +			    struct drm_atomic_state *state)
> > +{
> > +	if (!state)
> > +		return 0;
> > +
> > +	return drm_atomic_helper_check(dev, state);
> > +}
> I do not think this "if (!state)" gives us something extra - I think we are
> guranteed it is set here?
> Daniel?
> 
> > +
> > +static const struct drm_mode_config_funcs kmb_mode_config_funcs = {
> > +	.fb_create = drm_gem_fb_create,
> > +	.atomic_check = kmb_atomic_helper_check,
> > +	.atomic_commit = drm_atomic_helper_commit,
> > +};
> > +
> > +static void kmb_setup_mode_config(struct drm_device *drm)
> > +{
> > +	drm_mode_config_init(drm);
> Use drmm_mode_config - this will also simplify cleanup.
> 
> > +	drm->mode_config.min_width = KMB_MIN_WIDTH;
> > +	drm->mode_config.min_height = KMB_MIN_HEIGHT;
> > +	drm->mode_config.max_width = KMB_MAX_WIDTH;
> > +	drm->mode_config.max_height = KMB_MAX_HEIGHT;
> > +	drm->mode_config.funcs = &kmb_mode_config_funcs;
> > +}
> > +
> > +static irqreturn_t handle_lcd_irq(struct drm_device *dev)
> > +{
> > +	unsigned long status, val, val1;
> > +	int plane_id, dma0_state, dma1_state;
> > +	struct kmb_drm_private *dev_p = to_kmb(dev);
> > +
> > +	status = kmb_read_lcd(dev_p, LCD_INT_STATUS);
> > +
> > +	if (status & LCD_INT_EOF) {
> > +		/* TODO - handle EOF interrupt? */
> Is this TODO still valid?
> 
> > +
> > +		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_EOF);
> > +
> > +		/* When disabling/enabling LCD layers, the change takes effect
> > +		 * immediately and does not wait for EOF (end of frame).
> > +		 * When kmb_plane_atomic_disable is called, mark the plane as
> > +		 * disabled but actually disable the plane when EOF irq is
> > +		 * being handled.
> > +		 */
> > +		for (plane_id = LAYER_0;
> > +				plane_id < KMB_MAX_PLANES; plane_id++) {
> dev_p->n_layers and not KMB_MAX_PLANES?
Yeah - it's the same, but will change
> 
> > +			if (plane_status[plane_id].disable) {
> > +				kmb_clr_bitmask_lcd(dev_p,
> > +						    LCD_LAYERn_DMA_CFG
> > +						    (plane_id),
> > +						    LCD_DMA_LAYER_ENABLE);
> > +
> > +				kmb_clr_bitmask_lcd(dev_p, LCD_CONTROL,
> > +					    plane_status[plane_id].ctrl);
> > +
> > +				plane_status[plane_id].disable = false;
> > +			}
> > +		}
> > +		if (kmb_under_flow) {
> > +			/*DMA Recovery after underflow */
> > +			dma0_state = (layer_no == 0) ?
> > +			    LCD_VIDEO0_DMA0_STATE :
> LCD_VIDEO1_DMA0_STATE;
> > +			dma1_state = (layer_no == 0) ?
> > +			    LCD_VIDEO0_DMA1_STATE :
> LCD_VIDEO1_DMA1_STATE;
> > +
> > +			do {
> > +				kmb_write_lcd(dev_p, LCD_FIFO_FLUSH, 1);
> > +				val = kmb_read_lcd(dev_p, dma0_state)
> > +				    & LCD_DMA_STATE_ACTIVE;
> > +				val1 = kmb_read_lcd(dev_p, dma1_state)
> > +				    & LCD_DMA_STATE_ACTIVE;
> > +			} while ((val || val1));
> > +			/*disable dma */
> > +			kmb_clr_bitmask_lcd(dev_p,
> LCD_LAYERn_DMA_CFG(layer_no),
> > +					    LCD_DMA_LAYER_ENABLE);
> > +			kmb_write_lcd(dev_p, LCD_FIFO_FLUSH, 1);
> > +			kmb_flush_done = 1;
> > +			kmb_under_flow = 0;
> > +		}
> > +
> > +	}
> > +
> > +	if (status & LCD_INT_LINE_CMP) {
> > +		/* clear line compare interrupt */
> > +		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_LINE_CMP);
> > +	}
> > +
> > +	if (status & LCD_INT_VERT_COMP) {
> > +		/* Read VSTATUS */
> > +		val = kmb_read_lcd(dev_p, LCD_VSTATUS);
> > +		val = (val & LCD_VSTATUS_VERTICAL_STATUS_MASK);
> > +		switch (val) {
> > +		case LCD_VSTATUS_COMPARE_VSYNC:
> > +			/* Clear vertical compare interrupt */
> > +			kmb_write_lcd(dev_p, LCD_INT_CLEAR,
> LCD_INT_VERT_COMP);
> > +			if (kmb_flush_done) {
> > +				kmb_set_bitmask_lcd(dev_p,
> > +						    LCD_LAYERn_DMA_CFG
> > +						    (layer_no),
> > +						    LCD_DMA_LAYER_ENABLE);
> > +				kmb_flush_done = 0;
> > +			}
> > +			drm_handle_vblank(dev, 0);
> > +			break;
> > +		case LCD_VSTATUS_COMPARE_BACKPORCH:
> > +		case LCD_VSTATUS_COMPARE_ACTIVE:
> > +		case LCD_VSTATUS_COMPARE_FRONT_PORCH:
> > +			kmb_write_lcd(dev_p, LCD_INT_CLEAR,
> LCD_INT_VERT_COMP);
> > +			break;
> > +		}
> > +	}
> > +	if (status & LCD_INT_DMA_ERR) {
> > +		val =
> > +		    (status & LCD_INT_DMA_ERR &
> > +		     kmb_read_lcd(dev_p, LCD_INT_ENABLE));
> > +		/* LAYER0 - VL0 */
> > +		if (val & (LAYER0_DMA_FIFO_UNDERFLOW |
> > +			   LAYER0_DMA_CB_FIFO_UNDERFLOW |
> > +			   LAYER0_DMA_CR_FIFO_UNDERFLOW)) {
> > +			kmb_under_flow++;
> > +			drm_info(&dev_p->drm,
> > +			    "!LAYER0:VL0 DMA UNDERFLOW val =
> 0x%lx,under_flow=%d",
> > +			     val, kmb_under_flow);
> > +			/*disable underflow inerrupt */
> > +			kmb_clr_bitmask_lcd(dev_p, LCD_INT_ENABLE,
> > +					    LAYER0_DMA_FIFO_UNDERFLOW |
> > +
> LAYER0_DMA_CB_FIFO_UNDERFLOW |
> > +
> LAYER0_DMA_CR_FIFO_UNDERFLOW);
> > +			kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR,
> > +
> LAYER0_DMA_CB_FIFO_UNDERFLOW |
> > +					    LAYER0_DMA_FIFO_UNDERFLOW |
> > +
> LAYER0_DMA_CR_FIFO_UNDERFLOW);
> > +			/*disable auto restart mode */
> > +			kmb_clr_bitmask_lcd(dev_p,
> LCD_LAYERn_DMA_CFG(0),
> > +
> LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
> > +			layer_no = 0;
> > +		}
> > +
> > +		if (val & LAYER0_DMA_FIFO_OVERFLOW)
> > +			drm_info(&dev_p->drm,
> > +				"LAYER0:VL0 DMA OVERFLOW val = 0x%lx",
> val);
> > +		if (val & LAYER0_DMA_CB_FIFO_OVERFLOW)
> > +			drm_info(&dev_p->drm,
> > +				"LAYER0:VL0 DMA CB OVERFLOW val = 0x%lx",
> val);
> > +		if (val & LAYER0_DMA_CR_FIFO_OVERFLOW)
> > +			drm_info(&dev_p->drm,
> > +				"LAYER0:VL0 DMA CR OVERFLOW val = 0x%lx",
> val);
> > +
> > +		/* LAYER1 - VL1 */
> > +		if (val & (LAYER1_DMA_FIFO_UNDERFLOW |
> > +			   LAYER1_DMA_CB_FIFO_UNDERFLOW |
> > +			   LAYER1_DMA_CR_FIFO_UNDERFLOW)) {
> > +			kmb_under_flow++;
> > +			drm_info(&dev_p->drm,
> > +			    "!LAYER1:VL1 DMA UNDERFLOW val = 0x%lx,
> under_flow=%d",
> > +			     val, kmb_under_flow);
> > +			/*disable underflow inerrupt */
> > +			kmb_clr_bitmask_lcd(dev_p, LCD_INT_ENABLE,
> > +					    LAYER1_DMA_FIFO_UNDERFLOW |
> > +
> LAYER1_DMA_CB_FIFO_UNDERFLOW |
> > +
> LAYER1_DMA_CR_FIFO_UNDERFLOW);
> > +			kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR,
> > +
> LAYER1_DMA_CB_FIFO_UNDERFLOW |
> > +					    LAYER1_DMA_FIFO_UNDERFLOW |
> > +
> LAYER1_DMA_CR_FIFO_UNDERFLOW);
> > +			/*disable auto restart mode */
> > +			kmb_clr_bitmask_lcd(dev_p,
> LCD_LAYERn_DMA_CFG(1),
> > +
> LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
> > +			layer_no = 1;
> > +		}
> > +
> > +		/* LAYER1 - VL1 */
> > +		if (val & LAYER1_DMA_FIFO_OVERFLOW)
> > +			drm_info(&dev_p->drm,
> > +				"LAYER1:VL1 DMA OVERFLOW val = 0x%lx",
> val);
> > +		if (val & LAYER1_DMA_CB_FIFO_OVERFLOW)
> > +			drm_info(&dev_p->drm,
> > +				"LAYER1:VL1 DMA CB OVERFLOW val = 0x%lx",
> val);
> > +		if (val & LAYER1_DMA_CR_FIFO_OVERFLOW)
> > +			drm_info(&dev_p->drm,
> > +				"LAYER1:VL1 DMA CR OVERFLOW val = 0x%lx",
> val);
> > +
> > +		/* LAYER2 - GL0 */
> > +		if (val & LAYER2_DMA_FIFO_UNDERFLOW)
> > +			drm_info(&dev_p->drm,
> > +				"LAYER2:GL0 DMA UNDERFLOW val = 0x%lx",
> val);
> > +		if (val & LAYER2_DMA_FIFO_OVERFLOW)
> > +			drm_info(&dev_p->drm,
> > +				"LAYER2:GL0 DMA OVERFLOW val = 0x%lx",
> val);
> > +
> > +		/* LAYER3 - GL1 */
> > +		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
> > +			drm_info(&dev_p->drm,
> > +				"LAYER3:GL1 DMA UNDERFLOW val = 0x%lx",
> val);
> > +		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
> > +			drm_info(&dev_p->drm,
> > +				"LAYER3:GL1 DMA OVERFLOW val = 0x%lx",
> val);
> > +	}
> > +
> > +	if (status & LCD_INT_LAYER) {
> > +		/* Clear layer interrupts */
> > +		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_LAYER);
> > +	}
> > +
> > +	/* Clear all interrupts */
> > +	kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR, 1);
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static irqreturn_t kmb_isr(int irq, void *arg)
> > +{
> > +	struct drm_device *dev = (struct drm_device *)arg;
> > +	irqreturn_t ret = IRQ_NONE;
> > +
> > +	ret = handle_lcd_irq(dev);
> > +	return ret;
> > +}
> > +
> > +static void kmb_irq_reset(struct drm_device *drm)
> > +{
> > +	kmb_write_lcd(to_kmb(drm), LCD_INT_CLEAR, 0xFFFF);
> > +	kmb_write_lcd(to_kmb(drm), LCD_INT_ENABLE, 0);
> > +}
> > +
> > +DEFINE_DRM_GEM_CMA_FOPS(fops);
> > +
> > +static struct drm_driver kmb_driver = {
> > +	.driver_features = DRIVER_GEM |
> > +	    DRIVER_MODESET | DRIVER_ATOMIC,
> > +	.irq_handler = kmb_isr,
> > +	.irq_preinstall = kmb_irq_reset,
> > +	.irq_uninstall = kmb_irq_reset,
> > +	.gem_free_object_unlocked = drm_gem_cma_free_object,
> > +	.gem_vm_ops = &drm_gem_cma_vm_ops,
> > +	.dumb_create = drm_gem_cma_dumb_create,
> > +	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> > +	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> > +	.gem_prime_export = drm_gem_prime_export,
> > +	.gem_prime_import = drm_gem_prime_import,
> > +	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
> > +	.gem_prime_import_sg_table =
> drm_gem_cma_prime_import_sg_table,
> > +	.gem_prime_vmap = drm_gem_cma_prime_vmap,
> > +	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
> > +	.gem_prime_mmap = drm_gem_cma_prime_mmap,
> > +	.fops = &fops,
> > +	.name = "kmb-drm",
> > +	.desc = "KEEMBAY DISPLAY DRIVER ",
> > +	.date = "20190122",
> > +	.major = 1,
> > +	.minor = 0,
> > +};
> kmb_driver needs a diet.
> As a minimum introduce DRM_GEM_CMA_VMAP_DRIVER_OPS
> 
> gem_free_object_unlocked is deprecated - check drm_drv.h
> gem_prime_export likewise.
> Check them all.
Done
> 
> > +
> > +static void kmb_drm_unload(struct device *dev)
> > +{
> > +	struct drm_device *drm = dev_get_drvdata(dev);
> > +	struct kmb_drm_private *dev_p = to_kmb(drm);
> > +
> > +#ifdef DEBUG
> > +	dump_stack();
> > +#endif
> > +	drm_dev_unregister(drm);
> > +	drm_kms_helper_poll_fini(drm);
> > +	of_node_put(dev_p->crtc.port);
> > +	dev_p->crtc.port = NULL;
> > +	pm_runtime_get_sync(drm->dev);
> > +	drm_irq_uninstall(drm);
> > +	pm_runtime_put_sync(drm->dev);
> > +	pm_runtime_disable(drm->dev);
> > +
> > +	if (dev_p->lcd_mmio) {
> > +		iounmap(dev_p->lcd_mmio);
> > +		release_mem_region(LCD_BASE_ADDR, LCD_MMIO_SIZE);
> > +	}
> > +
> > +	if (dev_p->mipi_mmio) {
> > +		iounmap(dev_p->mipi_mmio);
> > +		release_mem_region(MIPI_BASE_ADDR, MIPI_MMIO_SIZE);
> > +	}
> > +
> > +	if (dev_p->msscam_mmio) {
> > +		iounmap(dev_p->msscam_mmio);
> > +		release_mem_region(MSS_CAM_BASE_ADDR,
> MSS_CAM_MMIO_SIZE);
> > +	}
> > +
> > +	of_reserved_mem_device_release(drm->dev);
> > +	drm_mode_config_cleanup(drm);
> > +
> > +	/* Release clks */
> > +	kmb_display_clk_disable();
> > +	clk_put(clk_lcd);
> > +	clk_put(clk_mipi);
> > +
> > +	dev_set_drvdata(dev, NULL);
> > +
> > +	/* Unregister DSI host */
> > +	kmb_dsi_host_unregister();
> > +}
> > +
> > +static int kmb_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = get_device(&pdev->dev);
> > +	struct kmb_drm_private *dev_p;
> > +	int ret = 0;
> > +
> > +	/* The bridge (ADV 7535) will return -EPROBE_DEFER until it
> > +	 * has a mipi_dsi_host to register its device to. So, we
> > +	 * first register the DSI host during probe time, and then return
> > +	 * -EPROBE_DEFER until the bridge is loaded. Probe will be called again
> > +	 *  and then the rest of the driver initialization can procees
> > +	 *  afterwards and the bridge can be successfully attached.
> > +	 */
> > +	adv_bridge = kmb_dsi_host_bridge_init(dev);
> > +
> > +	if (adv_bridge == ERR_PTR(-EPROBE_DEFER))
> > +		return -EPROBE_DEFER;
> > +	else if (IS_ERR(adv_bridge)) {
> > +		DRM_ERROR("probe failed to initialize DSI host bridge\n");
> > +		return PTR_ERR(adv_bridge);
> > +	}
> > +
> > +	/* Create DRM device */
> > +	dev_p = devm_drm_dev_alloc(dev, &kmb_driver,
> > +			struct kmb_drm_private, drm);
> Use devm_drm_dev_init()
> See example in drm_drv.c for more info.
Correct me if I am wrong, __devm_drm_dev_alloc() calls devm_drm_dev_init()
> 
> > +	if (IS_ERR(dev_p))
> > +		return PTR_ERR(dev_p);
> > +
> > +	dev_p->drm.dev_private = dev_p;
> dev_private is deprecated - drop it.
ok
> 
> > +	dev_set_drvdata(dev, &dev_p->drm);
> > +
> > +	kmb_setup_mode_config(&dev_p->drm);
> > +	dev_set_drvdata(dev, &dev_p->drm);
> > +
> > +	/* Load driver */
> > +	dev_p->n_layers = KMB_MAX_PLANES;
> > +	ret = kmb_load(&dev_p->drm, 0);
> > +	if (ret == -EPROBE_DEFER) {
> > +		drm_info(&dev_p->drm, "wait for external bridge driver DT\n");
> > +		return -EPROBE_DEFER;
> > +	} else if (ret)
> > +		goto err_free;
> > +
> > +	/* Set the CRTC's port so that the encoder component can find it */
> > +	dev_p->crtc.port = of_graph_get_port_by_id(dev->of_node, 0);
> > +	ret = drm_vblank_init(&dev_p->drm, dev_p-
> >drm.mode_config.num_crtc);
> > +	drm_info(&dev_p->drm, "mode_config.num_crtc=%d\n",
> > +			dev_p->drm.mode_config.num_crtc);
> > +	if (ret < 0) {
> > +		drm_err(&dev_p->drm, "failed to initialize vblank\n");
> > +		goto err_vblank;
> > +	}
> > +
> > +	drm_mode_config_reset(&dev_p->drm);
> > +	drm_kms_helper_poll_init(&dev_p->drm);
> > +
> > +	/* Register graphics device with the kernel */
> > +	ret = drm_dev_register(&dev_p->drm, 0);
> > +
> > +	if (ret)
> > +		goto err_register;
> > +
> > +	return 0;
> > +
> > + err_register:
> > +	drm_kms_helper_poll_fini(&dev_p->drm);
> > + err_vblank:
> > +	pm_runtime_disable(dev_p->drm.dev);
> > + err_free:
> > +	drm_mode_config_cleanup(&dev_p->drm);
> > +	dev_set_drvdata(dev, NULL);
> > +	kmb_dsi_host_unregister();
> > +
> > +	return ret;
> > +}
> > +
> > +static int kmb_remove(struct platform_device *pdev)
> > +{
> > +	kmb_drm_unload(&pdev->dev);
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id kmb_of_match[] = {
> > +	{.compatible = "intel,kmb_display"},
> > +	{},
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, kmb_of_match);
> > +
> > +static int __maybe_unused kmb_pm_suspend(struct device *dev)
> > +{
> > +	struct drm_device *drm = dev_get_drvdata(dev);
> > +	struct kmb_drm_private *lcd = drm ? drm->dev_private : NULL;
> Use of dev_private is deprecated - drop it.
> > +
> > +	if (!lcd)
> > +		return 0;
> > +
> > +	drm_kms_helper_poll_disable(drm);
> > +
> > +	lcd->state = drm_atomic_helper_suspend(drm);
> > +	if (IS_ERR(lcd->state)) {
> > +		drm_kms_helper_poll_enable(drm);
> > +		return PTR_ERR(lcd->state);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused kmb_pm_resume(struct device *dev)
> > +{
> > +	struct drm_device *drm = dev_get_drvdata(dev);
> > +	struct kmb_drm_private *lcd = drm ? drm->dev_private : NULL;
> Use of dev_private is deprecated - drop it.
> > +
> > +	if (!lcd)
> > +		return 0;
> > +
> > +	drm_atomic_helper_resume(drm, lcd->state);
> > +	drm_kms_helper_poll_enable(drm);
> > +
> > +	return 0;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(kmb_pm_ops, kmb_pm_suspend,
> kmb_pm_resume);
> > +
> > +static struct platform_driver kmb_platform_driver = {
> > +	.probe = kmb_probe,
> > +	.remove = kmb_remove,
> > +	.driver = {
> > +		   .name = "kmb-drm",
> > +		   .pm = &kmb_pm_ops,
> > +		   .of_match_table = kmb_of_match,
> > +		   },
> > +};
> > +
> > +module_platform_driver(kmb_platform_driver);
> > +
> > +MODULE_AUTHOR("Intel Corporation");
> > +MODULE_DESCRIPTION("Keembay Display driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/gpu/drm/kmb/kmb_drv.h
> b/drivers/gpu/drm/kmb/kmb_drv.h
> > new file mode 100644
> > index 0000000..3bc07bc
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.h
> > @@ -0,0 +1,165 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only
> > + *
> > + * Copyright (c) 2018-2020 Intel Corporation
> > + */
> > +
> > +#ifndef __KMB_DRV_H__
> > +#define __KMB_DRV_H__
> > +
> > +#include "kmb_regs.h"
> > +
> > +#define KMB_MAX_WIDTH			1920 /*max width in pixels */
> > +#define KMB_MAX_HEIGHT			1080 /*max height in pixels */
> > +#define KMB_MIN_WIDTH                   1920 /*max width in pixels */
> > +#define KMB_MIN_HEIGHT                  1080 /*max height in pixels */
> > +#define KMB_LCD_DEFAULT_CLK		200000000
> > +#define KMB_MIPI_DEFAULT_CLK		24000000
> > +#define KMB_MIPI_DEFAULT_CFG_CLK	24000000
> > +#define KMB_SYS_CLK_MHZ			500
> > +
> > +#define crtc_to_kmb_priv(x)	container_of(x, struct kmb_drm_private, crtc)
> > +
> > +#define ICAM_MMIO		0x3b100000
> > +#define ICAM_LCD_OFFSET		0x1080
> > +#define ICAM_MMIO_SIZE		0x2000
> > +struct kmb_drm_private {
> > +	struct drm_device		drm;
> > +	void __iomem			*lcd_mmio;
> > +	void __iomem			*mipi_mmio;
> > +	void __iomem			*msscam_mmio;
> > +	void __iomem                    *icamlcd_mmio;
> > +	unsigned char			n_layers;
> > +	struct clk			*clk;
> > +	struct drm_crtc			crtc;
> > +	struct kmb_plane		*plane;
> > +	struct drm_atomic_state		*state;
> > +	spinlock_t			irq_lock;
> > +	int				irq_lcd;
> > +	int				irq_mipi;
> > +	int				sys_clk_mhz;
> > +	dma_addr_t			fb_addr;
> > +};
> > +
> > +static inline struct kmb_drm_private *to_kmb(const struct drm_device *dev)
> > +{
> > +	return container_of(dev, struct kmb_drm_private, drm);
> > +}
> > +
> > +struct blt_layer_config {
> > +	unsigned char layer_format;
> > +};
> > +
> > +static inline void kmb_write_lcd(struct kmb_drm_private *dev_p,
> > +				 unsigned int reg, u32 value)
> > +{
> > +	writel(value, (dev_p->lcd_mmio + reg));
> > +}
> > +
> > +static inline void kmb_write_mipi(struct kmb_drm_private *dev_p,
> > +				  unsigned int reg, u32 value)
> > +{
> > +	writel(value, (dev_p->mipi_mmio + reg));
> > +}
> > +
> > +static inline void kmb_write_msscam(struct kmb_drm_private *dev_p,
> > +				    unsigned int reg, u32 value)
> > +{
> > +	writel(value, (dev_p->msscam_mmio + reg));
> > +}
> > +
> > +static inline u32 kmb_read_msscam(struct kmb_drm_private *dev_p,
> > +				  unsigned int reg)
> > +{
> > +	return readl(dev_p->msscam_mmio + reg);
> > +}
> > +
> > +static inline void kmb_set_bitmask_msscam(struct kmb_drm_private *dev_p,
> > +					  unsigned int reg, u32 mask)
> > +{
> > +	u32 reg_val = kmb_read_msscam(dev_p, reg);
> > +
> > +	kmb_write_msscam(dev_p, reg, (reg_val | mask));
> > +}
> > +
> > +static inline u32 kmb_read_lcd(struct kmb_drm_private *dev_p, unsigned int
> reg)
> > +{
> > +	return readl(dev_p->lcd_mmio + reg);
> > +}
> > +
> > +static inline void kmb_set_bitmask_lcd(struct kmb_drm_private *dev_p,
> > +				       unsigned int reg, u32 mask)
> > +{
> > +	u32 reg_val = kmb_read_lcd(dev_p, reg);
> > +
> > +	kmb_write_lcd(dev_p, reg, (reg_val | mask));
> > +}
> > +
> > +static inline void kmb_clr_bitmask_lcd(struct kmb_drm_private *dev_p,
> > +				       unsigned int reg, u32 mask)
> > +{
> > +	u32 reg_val = kmb_read_lcd(dev_p, reg);
> > +
> > +	kmb_write_lcd(dev_p, reg, (reg_val & (~mask)));
> > +}
> > +
> > +static inline u32 kmb_read_mipi(struct kmb_drm_private *dev_p, unsigned int
> reg)
> > +{
> > +	return readl(dev_p->mipi_mmio + reg);
> > +}
> > +
> > +static inline void kmb_write_bits_mipi(struct kmb_drm_private *dev_p,
> > +				       unsigned int reg, u32 offset,
> > +				       u32 num_bits, u32 value)
> > +{
> > +	u32 reg_val = kmb_read_mipi(dev_p, reg);
> > +	u32 mask = (1 << num_bits) - 1;
> > +
> > +	value &= mask;
> > +	mask <<= offset;
> > +	reg_val &= (~mask);
> > +	reg_val |= (value << offset);
> > +#ifdef DEBUG
> > +	if (reg == DPHY_FREQ_CTRL0_3 + 4) {
> > +		DRM_INFO("%s : %d  reg=0x%x offset=%d num_bits=%d
> val=0x%x\n",
> > +			 __func__, __LINE__, reg, offset, num_bits,
> > +			 reg_val);
> > +	}
> > +#endif
> > +	kmb_write_mipi(dev_p, reg, reg_val);
> > +}
> > +
> > +static inline void kmb_set_bit_mipi(struct kmb_drm_private *dev_p,
> > +				    unsigned int reg, u32 offset)
> > +{
> > +	u32 reg_val = kmb_read_mipi(dev_p, reg);
> > +
> > +	kmb_write_mipi(dev_p, reg, reg_val | (1 << offset));
> > +}
> > +
> > +static inline void kmb_clr_bit_mipi(struct kmb_drm_private *dev_p,
> > +				    unsigned int reg, u32 offset)
> > +{
> > +	u32 reg_val = kmb_read_mipi(dev_p, reg);
> > +
> > +	kmb_write_mipi(dev_p, reg, reg_val & (~(1 << offset)));
> > +}
> > +
> > +static inline void kmb_set_bitmask_mipi(struct kmb_drm_private *dev_p,
> > +					unsigned int reg, u32 mask)
> > +{
> > +	u32 reg_val = kmb_read_mipi(dev_p, reg);
> > +
> > +	kmb_write_mipi(dev_p, reg, (reg_val | mask));
> > +}
> > +
> > +static inline void kmb_clr_bitmask_mipi(struct kmb_drm_private *dev_p,
> > +					unsigned int reg, u32 mask)
> > +{
> > +	u32 reg_val = kmb_read_mipi(dev_p, reg);
> > +
> > +	kmb_write_mipi(dev_p, reg, (reg_val & (~mask)));
> > +}
> > +
> > +int kmb_setup_crtc(struct drm_device *dev);
> > +void kmb_set_scanout(struct kmb_drm_private *lcd);
> > +#endif /* __KMB_DRV_H__ */
> 
> 
> All the kmb_dsi looks like it should be implmented as a real bridge driver.
> And it should use the modern bridge interface - so the connectro
> creation should be part of the display driver and not the bridge.
> 
> See for example adv5511 for an example.
> 
> As I expect the parts where I can review will change I skipped this file
> for now.
> Like I had said in the beginning, mipi dsi is part of the soc and its programming is closely linked with that of the LCD controller(it's very timing sensitive). It cannot be a bridge driver.
Let's keep it as connector.
> > diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
> > new file mode 100644
> > index 0000000..eaddf20
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> > @@ -0,0 +1,1833 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2019-2020 Intel Corporation
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include "kmb_drv.h"
> > +#include "kmb_dsi.h"
> > +#include "kmb_regs.h"
> > +
> > +static int hw_initialized;
> > +//#define MIPI_TX_TEST_PATTERN_GENERATION
> > +//#define DPHY_GET_FSM
> > +//#define DPHY_READ_TESTCODE
> Debug stuff - delete?
> 
> > +
> > +static struct mipi_dsi_host *dsi_host;
> > +static struct mipi_dsi_device *dsi_device;
> Should be in an advxxxx struct that is allocated in the probe()
> function of the bridge driver.
> 
> > +
> > +/* Default setting is 1080p, 4 lanes */
> > +#define IMG_HEIGHT_LINES  1080
> > +#define IMG_WIDTH_PX      1920
> > +#define MIPI_TX_ACTIVE_LANES 4
> > +
> > +struct mipi_tx_frame_section_cfg mipi_tx_frame0_sect_cfg = {
> > +	.width_pixels = IMG_WIDTH_PX,
> > +	.height_lines = IMG_HEIGHT_LINES,
> > +	.data_type = DSI_LP_DT_PPS_RGB888_24B,
> > +	.data_mode = MIPI_DATA_MODE1,
> > +	.dma_packed = 0
> > +};
> > +
> > +struct mipi_tx_frame_cfg mipitx_frame0_cfg = {
> > +	.sections[0] = &mipi_tx_frame0_sect_cfg,
> > +	.sections[1] = NULL,
> > +	.sections[2] = NULL,
> > +	.sections[3] = NULL,
> > +	.vsync_width = 5,
> > +	.v_backporch = 36,
> > +	.v_frontporch = 4,
> > +	.hsync_width = 44,
> > +	.h_backporch = 148,
> > +	.h_frontporch = 88
> > +};
> > +
> > +struct mipi_tx_dsi_cfg mipitx_dsi_cfg = {
> > +	.hfp_blank_en = 0,
> > +	.eotp_en = 0,
> > +	.lpm_last_vfp_line = 0,
> > +	.lpm_first_vsa_line = 0,
> > +	.sync_pulse_eventn = DSI_VIDEO_MODE_NO_BURST_EVENT,
> > +	.hfp_blanking = SEND_BLANK_PACKET,
> > +	.hbp_blanking = SEND_BLANK_PACKET,
> > +	.hsa_blanking = SEND_BLANK_PACKET,
> > +	.v_blanking = SEND_BLANK_PACKET,
> > +};
> > +
> > +struct mipi_ctrl_cfg mipi_tx_init_cfg = {
> > +	.index = MIPI_CTRL6,
> > +	.type = MIPI_DSI,
> > +	.dir = MIPI_TX,
> > +	.active_lanes = MIPI_TX_ACTIVE_LANES,
> > +	.lane_rate_mbps = MIPI_TX_LANE_DATA_RATE_MBPS,
> > +	.ref_clk_khz = MIPI_TX_REF_CLK_KHZ,
> > +	.cfg_clk_khz = MIPI_TX_CFG_CLK_KHZ,
> > +	.data_if = MIPI_IF_PARALLEL,
> > +	.tx_ctrl_cfg = {
> > +			.frames[0] = &mipitx_frame0_cfg,
> > +			.frames[1] = NULL,
> > +			.frames[2] = NULL,
> > +			.frames[3] = NULL,
> > +			.tx_dsi_cfg = &mipitx_dsi_cfg,
> > +			.line_sync_pkt_en = 0,
> > +			.line_counter_active = 0,
> > +			.frame_counter_active = 0,
> > +			.tx_always_use_hact = 1,
> > +			.tx_hact_wait_stop = 1,
> > +			}
> > +};
> > +
> > +struct  mipi_hs_freq_range_cfg {
> > +	uint16_t default_bit_rate_mbps;
> > +	uint8_t hsfreqrange_code;
> > +};
> > +
> > +struct vco_params {
> > +	u32 freq;
> > +	u32 range;
> > +	u32 divider;
> > +};
> > +
> > +static struct vco_params vco_table[] = {
> > +	{52, 0x3f, 8},
> > +	{80, 0x39, 8},
> > +	{105, 0x2f, 4},
> > +	{160, 0x29, 4},
> > +	{210, 0x1f, 2},
> > +	{320, 0x19, 2},
> > +	{420, 0x0f, 1},
> > +	{630, 0x09, 1},
> > +	{1100, 0x03, 1},
> > +	{0xffff, 0x01, 1},
> > +};
> > +
> > +static struct mipi_hs_freq_range_cfg
> > +mipi_hs_freq_range[MIPI_DPHY_DEFAULT_BIT_RATES] = {
> > +	{.default_bit_rate_mbps = 80, .hsfreqrange_code = 0x00},
> > +	{.default_bit_rate_mbps = 90, .hsfreqrange_code = 0x10},
> > +	{.default_bit_rate_mbps = 100, .hsfreqrange_code = 0x20},
> > +	{.default_bit_rate_mbps = 110, .hsfreqrange_code = 0x30},
> > +	{.default_bit_rate_mbps = 120, .hsfreqrange_code = 0x01},
> > +	{.default_bit_rate_mbps = 130, .hsfreqrange_code = 0x11},
> > +	{.default_bit_rate_mbps = 140, .hsfreqrange_code = 0x21},
> > +	{.default_bit_rate_mbps = 150, .hsfreqrange_code = 0x31},
> > +	{.default_bit_rate_mbps = 160, .hsfreqrange_code = 0x02},
> > +	{.default_bit_rate_mbps = 170, .hsfreqrange_code = 0x12},
> > +	{.default_bit_rate_mbps = 180, .hsfreqrange_code = 0x22},
> > +	{.default_bit_rate_mbps = 190, .hsfreqrange_code = 0x32},
> > +	{.default_bit_rate_mbps = 205, .hsfreqrange_code = 0x03},
> > +	{.default_bit_rate_mbps = 220, .hsfreqrange_code = 0x13},
> > +	{.default_bit_rate_mbps = 235, .hsfreqrange_code = 0x23},
> > +	{.default_bit_rate_mbps = 250, .hsfreqrange_code = 0x33},
> > +	{.default_bit_rate_mbps = 275, .hsfreqrange_code = 0x04},
> > +	{.default_bit_rate_mbps = 300, .hsfreqrange_code = 0x14},
> > +	{.default_bit_rate_mbps = 325, .hsfreqrange_code = 0x25},
> > +	{.default_bit_rate_mbps = 350, .hsfreqrange_code = 0x35},
> > +	{.default_bit_rate_mbps = 400, .hsfreqrange_code = 0x05},
> > +	{.default_bit_rate_mbps = 450, .hsfreqrange_code = 0x16},
> > +	{.default_bit_rate_mbps = 500, .hsfreqrange_code = 0x26},
> > +	{.default_bit_rate_mbps = 550, .hsfreqrange_code = 0x37},
> > +	{.default_bit_rate_mbps = 600, .hsfreqrange_code = 0x07},
> > +	{.default_bit_rate_mbps = 650, .hsfreqrange_code = 0x18},
> > +	{.default_bit_rate_mbps = 700, .hsfreqrange_code = 0x28},
> > +	{.default_bit_rate_mbps = 750, .hsfreqrange_code = 0x39},
> > +	{.default_bit_rate_mbps = 800, .hsfreqrange_code = 0x09},
> > +	{.default_bit_rate_mbps = 850, .hsfreqrange_code = 0x19},
> > +	{.default_bit_rate_mbps = 900, .hsfreqrange_code = 0x29},
> > +	{.default_bit_rate_mbps = 1000, .hsfreqrange_code = 0x0A},
> > +	{.default_bit_rate_mbps = 1050, .hsfreqrange_code = 0x1A},
> > +	{.default_bit_rate_mbps = 1100, .hsfreqrange_code = 0x2A},
> > +	{.default_bit_rate_mbps = 1150, .hsfreqrange_code = 0x3B},
> > +	{.default_bit_rate_mbps = 1200, .hsfreqrange_code = 0x0B},
> > +	{.default_bit_rate_mbps = 1250, .hsfreqrange_code = 0x1B},
> > +	{.default_bit_rate_mbps = 1300, .hsfreqrange_code = 0x2B},
> > +	{.default_bit_rate_mbps = 1350, .hsfreqrange_code = 0x3C},
> > +	{.default_bit_rate_mbps = 1400, .hsfreqrange_code = 0x0C},
> > +	{.default_bit_rate_mbps = 1450, .hsfreqrange_code = 0x1C},
> > +	{.default_bit_rate_mbps = 1500, .hsfreqrange_code = 0x2C},
> > +	{.default_bit_rate_mbps = 1550, .hsfreqrange_code = 0x3D},
> > +	{.default_bit_rate_mbps = 1600, .hsfreqrange_code = 0x0D},
> > +	{.default_bit_rate_mbps = 1650, .hsfreqrange_code = 0x1D},
> > +	{.default_bit_rate_mbps = 1700, .hsfreqrange_code = 0x2E},
> > +	{.default_bit_rate_mbps = 1750, .hsfreqrange_code = 0x3E},
> > +	{.default_bit_rate_mbps = 1800, .hsfreqrange_code = 0x0E},
> > +	{.default_bit_rate_mbps = 1850, .hsfreqrange_code = 0x1E},
> > +	{.default_bit_rate_mbps = 1900, .hsfreqrange_code = 0x2F},
> > +	{.default_bit_rate_mbps = 1950, .hsfreqrange_code = 0x3F},
> > +	{.default_bit_rate_mbps = 2000, .hsfreqrange_code = 0x0F},
> > +	{.default_bit_rate_mbps = 2050, .hsfreqrange_code = 0x40},
> > +	{.default_bit_rate_mbps = 2100, .hsfreqrange_code = 0x41},
> > +	{.default_bit_rate_mbps = 2150, .hsfreqrange_code = 0x42},
> > +	{.default_bit_rate_mbps = 2200, .hsfreqrange_code = 0x43},
> > +	{.default_bit_rate_mbps = 2250, .hsfreqrange_code = 0x44},
> > +	{.default_bit_rate_mbps = 2300, .hsfreqrange_code = 0x45},
> > +	{.default_bit_rate_mbps = 2350, .hsfreqrange_code = 0x46},
> > +	{.default_bit_rate_mbps = 2400, .hsfreqrange_code = 0x47},
> > +	{.default_bit_rate_mbps = 2450, .hsfreqrange_code = 0x48},
> > +	{.default_bit_rate_mbps = 2500, .hsfreqrange_code = 0x49}
> > +};
> > +
> > +union mipi_irq_cfg int_cfg = {
> > +	.irq_cfg.frame_done = 1,
> > +	.irq_cfg.ctrl_error = 1,
> > +};
> > +
> > +static enum drm_mode_status
> > +kmb_dsi_mode_valid(struct drm_connector *connector,
> > +		   struct drm_display_mode *mode)
> > +{
> > +	struct drm_device *dev = connector->dev;
> > +	struct drm_mode_config *mode_config = &dev->mode_config;
> > +
> > +	if (mode->hdisplay < mode_config->min_width ||
> > +			mode->hdisplay > mode_config->max_width)
> > +		return MODE_BAD_HVALUE;
> > +
> > +	if (mode->vdisplay < mode_config->min_height ||
> > +			mode->vdisplay > mode_config->max_height)
> > +		return MODE_BAD_VVALUE;
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +static int kmb_dsi_get_modes(struct drm_connector *connector)
> > +{
> > +	int num_modes = 0;
> > +
> > +	num_modes = drm_add_modes_noedid(connector,
> > +			 connector->dev->mode_config.max_width,
> > +			 connector->dev->mode_config.max_height);
> > +
> > +	DRM_INFO("width=%d height=%d\n",
> > +		 connector->dev->mode_config.max_width,
> > +		 connector->dev->mode_config.max_height);
> > +	DRM_INFO("num modes=%d\n", num_modes);
> > +
> > +	return num_modes;
> > +}
> > +
> > +void kmb_dsi_host_unregister(void)
> > +{
> > +	mipi_dsi_host_unregister(dsi_host);
> > +	kfree(dsi_host);
> > +}
> > +
> > +static void kmb_dsi_connector_destroy(struct drm_connector *connector)
> > +{
> > +	struct kmb_connector *kmb_connector =
> to_kmb_connector(connector);
> > +
> > +	drm_connector_cleanup(connector);
> > +	kfree(kmb_connector);
> > +}
> > +
> > +static void kmb_dsi_encoder_destroy(struct drm_encoder *encoder)
> > +{
> > +	struct kmb_dsi *kmb_dsi = to_kmb_dsi(encoder);
> > +
> > +	if (!kmb_dsi)
> > +		return;
> > +
> > +	kfree(kmb_dsi->dsi_host);
> > +
> > +	drm_encoder_cleanup(encoder);
> > +
> > +	kmb_dsi_connector_destroy(&kmb_dsi->attached_connector->base);
> > +
> > +	kfree(kmb_dsi);
> > +	if (!dsi_device)
> > +		kfree(dsi_device);
> > +}
> > +
> > +static const struct drm_encoder_funcs kmb_dsi_funcs = {
> > +	.destroy = kmb_dsi_encoder_destroy,
> > +};
> > +
> > +static const struct
> > +drm_connector_helper_funcs kmb_dsi_connector_helper_funcs = {
> > +	.get_modes = kmb_dsi_get_modes,
> > +	.mode_valid = kmb_dsi_mode_valid,
> > +};
> > +
> > +static const struct drm_connector_funcs kmb_dsi_connector_funcs = {
> > +	.destroy = kmb_dsi_connector_destroy,
> > +	.fill_modes = drm_helper_probe_single_connector_modes,
> > +	.reset = drm_atomic_helper_connector_reset,
> > +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > +	.atomic_duplicate_state =
> drm_atomic_helper_connector_duplicate_state,
> > +};
> > +
> > +static ssize_t kmb_dsi_host_transfer(struct mipi_dsi_host *host,
> > +				     const struct mipi_dsi_msg *msg)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int kmb_dsi_host_attach(struct mipi_dsi_host *host,
> > +			       struct mipi_dsi_device *dev)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int kmb_dsi_host_detach(struct mipi_dsi_host *host,
> > +			       struct mipi_dsi_device *dev)
> > +{
> > +	return 0;
> > +}
> > +
> > +static const struct mipi_dsi_host_ops kmb_dsi_host_ops = {
> > +	.attach = kmb_dsi_host_attach,
> > +	.detach = kmb_dsi_host_detach,
> > +	.transfer = kmb_dsi_host_transfer,
> > +};
> > +
> > +static struct kmb_dsi_host *kmb_dsi_host_init(struct drm_device *drm,
> > +					      struct kmb_dsi *kmb_dsi)
> > +{
> > +	struct kmb_dsi_host *host;
> > +
> > +	host = kzalloc(sizeof(*host), GFP_KERNEL);
> > +	if (!host)
> > +		return NULL;
> > +
> > +	host->base = dsi_host;
> > +	host->base->ops = &kmb_dsi_host_ops;
> > +	host->kmb_dsi = kmb_dsi;
> > +
> > +	host->base->dev = drm->dev;
> > +
> > +	dsi_device->host = host->base;
> > +	host->device = dsi_device;
> > +	return host;
> > +}
> > +
> > +struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
> > +{
> > +	struct drm_bridge *bridge = NULL;
> > +	struct device_node *encoder_node;
> > +
> > +	/* Create and register MIPI DSI host */
> > +	if (!dsi_host) {
> > +		dsi_host = kzalloc(sizeof(*dsi_host), GFP_KERNEL);
> > +		if (!dsi_host)
> > +			return ERR_PTR(-ENOMEM);
> > +
> > +		dsi_host->ops = &kmb_dsi_host_ops;
> > +
> > +		if (!dsi_device) {
> > +			dsi_device = kzalloc(sizeof(*dsi_device), GFP_KERNEL);
> > +			if (!dsi_device) {
> > +				kfree(dsi_host);
> > +				return ERR_PTR(-ENOMEM);
> > +			}
> > +		}
> > +
> > +		dsi_host->dev = dev;
> > +		mipi_dsi_host_register(dsi_host);
> > +	}
> > +	/* Find ADV7535 node and initialize it */
> > +	encoder_node = of_parse_phandle(dev->of_node, "encoder-slave", 0);
> > +
> > +	if (!encoder_node) {
> > +		DRM_ERROR("Failed to get bridge info from DT\n");
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	/* Locate drm bridge from the hdmi encoder DT node */
> > +	bridge = of_drm_find_bridge(encoder_node);
> > +	of_node_put(encoder_node);
> > +	if (!bridge) {
> > +		DRM_INFO("Wait for external bridge driver DT\n");
> > +		return ERR_PTR(-EPROBE_DEFER);
> > +	}
> > +	return bridge;
> > +}
> > +
> > +u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
> > +			     struct mipi_data_type_params *params)
> > +{
> > +	struct mipi_data_type_params data_type_param;
> > +
> > +	switch (data_type) {
> > +	case DSI_LP_DT_PPS_YCBCR420_12B:
> > +		data_type_param.size_constraint_pixels = 2;
> > +		data_type_param.size_constraint_bytes = 3;
> > +		switch (data_mode) {
> > +			/* Case 0 not supported according to MDK */
> > +		case 1:
> > +		case 2:
> > +		case 3:
> > +			data_type_param.pixels_per_pclk = 2;
> > +			data_type_param.bits_per_pclk = 24;
> > +			break;
> > +		default:
> > +			DRM_ERROR("DSI: Invalid data_mode %d\n",
> data_mode);
> > +			return -EINVAL;
> > +		};
> > +		break;
> > +	case DSI_LP_DT_PPS_YCBCR422_16B:
> > +		data_type_param.size_constraint_pixels = 2;
> > +		data_type_param.size_constraint_bytes = 4;
> > +		switch (data_mode) {
> > +			/* Case 0 and 1 not supported according
> > +			 * to MDK
> > +			 */
> > +		case 2:
> > +			data_type_param.pixels_per_pclk = 1;
> > +			data_type_param.bits_per_pclk = 16;
> > +			break;
> > +		case 3:
> > +			data_type_param.pixels_per_pclk = 2;
> > +			data_type_param.bits_per_pclk = 32;
> > +			break;
> > +		default:
> > +			DRM_ERROR("DSI: Invalid data_mode %d\n",
> data_mode);
> > +			return -EINVAL;
> > +		};
> > +		break;
> > +	case DSI_LP_DT_LPPS_YCBCR422_20B:
> > +	case DSI_LP_DT_PPS_YCBCR422_24B:
> > +		data_type_param.size_constraint_pixels = 2;
> > +		data_type_param.size_constraint_bytes = 6;
> > +		switch (data_mode) {
> > +			/* Case 0 not supported according to MDK */
> > +		case 1:
> > +		case 2:
> > +		case 3:
> > +			data_type_param.pixels_per_pclk = 1;
> > +			data_type_param.bits_per_pclk = 24;
> > +			break;
> > +		default:
> > +			DRM_ERROR("DSI: Invalid data_mode %d\n",
> data_mode);
> > +			return -EINVAL;
> > +		};
> > +		break;
> > +	case DSI_LP_DT_PPS_RGB565_16B:
> > +		data_type_param.size_constraint_pixels = 1;
> > +		data_type_param.size_constraint_bytes = 2;
> > +		switch (data_mode) {
> > +		case 0:
> > +		case 1:
> > +			data_type_param.pixels_per_pclk = 1;
> > +			data_type_param.bits_per_pclk = 16;
> > +			break;
> > +		case 2:
> > +		case 3:
> > +			data_type_param.pixels_per_pclk = 2;
> > +			data_type_param.bits_per_pclk = 32;
> > +			break;
> > +		default:
> > +			DRM_ERROR("DSI: Invalid data_mode %d\n",
> data_mode);
> > +			return -EINVAL;
> > +		};
> > +		break;
> > +	case DSI_LP_DT_PPS_RGB666_18B:
> > +		data_type_param.size_constraint_pixels = 4;
> > +		data_type_param.size_constraint_bytes = 9;
> > +		data_type_param.bits_per_pclk = 18;
> > +		data_type_param.pixels_per_pclk = 1;
> > +		break;
> > +	case DSI_LP_DT_LPPS_RGB666_18B:
> > +	case DSI_LP_DT_PPS_RGB888_24B:
> > +		data_type_param.size_constraint_pixels = 1;
> > +		data_type_param.size_constraint_bytes = 3;
> > +		data_type_param.bits_per_pclk = 24;
> > +		data_type_param.pixels_per_pclk = 1;
> > +		break;
> > +	case DSI_LP_DT_PPS_RGB101010_30B:
> > +		data_type_param.size_constraint_pixels = 4;
> > +		data_type_param.size_constraint_bytes = 15;
> > +		data_type_param.bits_per_pclk = 30;
> > +		data_type_param.pixels_per_pclk = 1;
> > +		break;
> > +	default:
> > +		DRM_ERROR("DSI: Invalid data_type %d\n", data_type);
> > +		return -EINVAL;
> > +	};
> > +
> > +	*params = data_type_param;
> > +	return 0;
> > +}
> > +
> > +static u32 compute_wc(u32 width_px, u8 size_constr_p, u8 size_constr_b)
> > +{
> > +	/* Calculate the word count for each long packet */
> > +	return (((width_px / size_constr_p) * size_constr_b) & 0xffff);
> > +}
> > +
> > +static u32 compute_unpacked_bytes(u32 wc, u8 bits_per_pclk)
> > +{
> > +	/* Number of PCLK cycles needed to transfer a line
> > +	 * with each PCLK cycle, 4 Bytes are sent through the PPL module
> > +	 */
> > +	return ((wc * 8) / bits_per_pclk) * 4;
> > +}
> > +
> > +static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_p,
> > +				       u8 frame_id, u8 section,
> > +				       u32 height_lines, u32 unpacked_bytes,
> > +				       struct mipi_tx_frame_sect_phcfg *ph_cfg)
> > +{
> > +	u32 cfg = 0;
> > +	u32 ctrl_no = MIPI_CTRL6;
> > +	u32 reg_adr;
> > +
> > +	/* Frame section packet header */
> > +	/* Word count bits [15:0] */
> > +	cfg = (ph_cfg->wc & MIPI_TX_SECT_WC_MASK) << 0;
> > +
> > +	/* Data type (bits [21:16]) */
> > +	cfg |= ((ph_cfg->data_type & MIPI_TX_SECT_DT_MASK)
> > +		<< MIPI_TX_SECT_DT_SHIFT);
> > +
> > +	/* Virtual channel (bits [23:22]) */
> > +	cfg |= ((ph_cfg->vchannel & MIPI_TX_SECT_VC_MASK)
> > +		<< MIPI_TX_SECT_VC_SHIFT);
> > +
> > +	/* Data mode (bits [24:25]) */
> > +	cfg |= ((ph_cfg->data_mode & MIPI_TX_SECT_DM_MASK)
> > +		<< MIPI_TX_SECT_DM_SHIFT);
> > +	if (ph_cfg->dma_packed)
> > +		cfg |= MIPI_TX_SECT_DMA_PACKED;
> > +
> > +	drm_dbg(&dev_p->drm,
> > +		 "ctrl=%d frame_id=%d section=%d cfg=%x packed=%d\n",
> > +		  ctrl_no, frame_id, section, cfg, ph_cfg->dma_packed);
> > +	kmb_write_mipi(dev_p,
> > +		       (MIPI_TXm_HS_FGn_SECTo_PH(ctrl_no, frame_id, section)),
> > +		       cfg);
> > +
> > +	/* Unpacked bytes */
> > +
> > +	/* There are 4 frame generators and each fg has 4 sections
> > +	 * There are 2 registers for unpacked bytes (# bytes each
> > +	 * section occupies in memory)
> > +	 * REG_UNPACKED_BYTES0: [15:0]-BYTES0, [31:16]-BYTES1
> > +	 * REG_UNPACKED_BYTES1: [15:0]-BYTES2, [31:16]-BYTES3
> > +	 */
> > +	reg_adr =
> > +	    MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(ctrl_no,
> > +						 frame_id) + (section / 2) * 4;
> > +	kmb_write_bits_mipi(dev_p, reg_adr, (section % 2) * 16, 16,
> > +			    unpacked_bytes);
> > +	drm_dbg(&dev_p->drm,
> > +		 "unpacked_bytes = %d, wordcount = %d\n", unpacked_bytes,
> > +		  ph_cfg->wc);
> > +
> > +	/* Line config */
> > +	reg_adr = MIPI_TXm_HS_FGn_SECTo_LINE_CFG(ctrl_no, frame_id,
> section);
> > +	kmb_write_mipi(dev_p, reg_adr, height_lines);
> > +	return 0;
> > +}
> > +
> > +static u32 mipi_tx_fg_section_cfg(struct kmb_drm_private *dev_p,
> > +				  u8 frame_id, u8 section,
> > +				  struct mipi_tx_frame_section_cfg
> *frame_scfg,
> > +				  u32 *bits_per_pclk, u32 *wc)
> > +{
> > +	u32 ret = 0;
> > +	u32 unpacked_bytes;
> > +	struct mipi_data_type_params data_type_parameters;
> > +	struct mipi_tx_frame_sect_phcfg ph_cfg;
> > +
> > +	ret = mipi_get_datatype_params(frame_scfg->data_type,
> > +				       frame_scfg->data_mode,
> > +				       &data_type_parameters);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Packet width has to be a multiple of the minimum packet width
> > +	 * (in pixels) set for each data type
> > +	 */
> > +	if (frame_scfg->width_pixels %
> > +	    data_type_parameters.size_constraint_pixels != 0)
> > +		return -EINVAL;
> > +
> > +	*wc = compute_wc(frame_scfg->width_pixels,
> > +			 data_type_parameters.size_constraint_pixels,
> > +			 data_type_parameters.size_constraint_bytes);
> > +	unpacked_bytes = compute_unpacked_bytes(*wc,
> > +					data_type_parameters.bits_per_pclk);
> > +	ph_cfg.wc = *wc;
> > +	ph_cfg.data_mode = frame_scfg->data_mode;
> > +	ph_cfg.data_type = frame_scfg->data_type;
> > +	ph_cfg.dma_packed = frame_scfg->dma_packed;
> > +	ph_cfg.vchannel = frame_id;
> > +
> > +	mipi_tx_fg_section_cfg_regs(dev_p, frame_id, section,
> > +				    frame_scfg->height_lines,
> > +				    unpacked_bytes, &ph_cfg);
> > +
> > +	/* Caller needs bits_per_clk for additional caluclations */
> > +	*bits_per_pclk = data_type_parameters.bits_per_pclk;
> > +
> > +	return 0;
> > +}
> > +
> > +static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_p, u8
> frame_gen,
> > +				struct mipi_tx_frame_timing_cfg *fg_cfg)
> > +{
> > +	u32 sysclk;
> > +	u32 ppl_llp_ratio;
> > +	u32 ctrl_no = MIPI_CTRL6, reg_adr, val, offset;
> > +
> > +	/* 500 Mhz system clock minus 50 to account for the difference in
> > +	 * MIPI clock speed in RTL tests
> > +	 */
> > +	sysclk = dev_p->sys_clk_mhz - 50;
> > +
> > +	/* PPL-Pixel Packing Layer, LLP-Low Level Protocol
> > +	 * Frame genartor timing parameters are clocked on the system clock,
> > +	 * whereas as the equivalent parameters in the LLP blocks are clocked
> > +	 * on LLP Tx clock from the D-PHY - BYTE clock
> > +	 */
> > +
> > +	/* Multiply by 1000 to maintain precision */
> > +	ppl_llp_ratio = ((fg_cfg->bpp / 8) * sysclk * 1000) /
> > +	    ((fg_cfg->lane_rate_mbps / 8) * fg_cfg->active_lanes);
> > +
> > +	drm_dbg(&dev_p->drm, "ppl_llp_ratio=%d\n", ppl_llp_ratio);
> > +	drm_dbg(&dev_p->drm, "bpp=%d sysclk=%d lane-rate=%d activ-
> lanes=%d\n",
> > +		 fg_cfg->bpp, sysclk, fg_cfg->lane_rate_mbps,
> > +		 fg_cfg->active_lanes);
> > +
> > +	/* Frame generator number of lines */
> > +	reg_adr = MIPI_TXm_HS_FGn_NUM_LINES(ctrl_no, frame_gen);
> > +	kmb_write_mipi(dev_p, reg_adr, fg_cfg->v_active);
> > +
> > +	/* vsync width
> > +	 * There are 2 registers for vsync width (VSA in lines for
> > +	 * channels 0-3)
> > +	 * REG_VSYNC_WIDTH0: [15:0]-VSA for channel0, [31:16]-VSA for
> channel1
> > +	 * REG_VSYNC_WIDTH1: [15:0]-VSA for channel2, [31:16]-VSA for
> channel3
> > +	 */
> > +	offset = (frame_gen % 2) * 16;
> > +	reg_adr = MIPI_TXm_HS_VSYNC_WIDTHn(ctrl_no, frame_gen / 2);
> > +	kmb_write_bits_mipi(dev_p, reg_adr, offset, 16, fg_cfg->vsync_width);
> > +
> > +	/* vertical backporch (vbp) */
> > +	reg_adr = MIPI_TXm_HS_V_BACKPORCHESn(ctrl_no, frame_gen / 2);
> > +	kmb_write_bits_mipi(dev_p, reg_adr, offset, 16, fg_cfg->v_backporch);
> > +
> > +	/* vertical frontporch (vfp) */
> > +	reg_adr = MIPI_TXm_HS_V_FRONTPORCHESn(ctrl_no, frame_gen / 2);
> > +	kmb_write_bits_mipi(dev_p, reg_adr, offset, 16, fg_cfg->v_frontporch);
> > +
> > +	/* vertical active (vactive) */
> > +	reg_adr = MIPI_TXm_HS_V_ACTIVEn(ctrl_no, frame_gen / 2);
> > +	kmb_write_bits_mipi(dev_p, reg_adr, offset, 16, fg_cfg->v_active);
> > +
> > +	/* hsync width */
> > +	reg_adr = MIPI_TXm_HS_HSYNC_WIDTHn(ctrl_no, frame_gen);
> > +	kmb_write_mipi(dev_p, reg_adr,
> > +		       (fg_cfg->hsync_width * ppl_llp_ratio) / 1000);
> > +
> > +	/* horizontal backporch (hbp) */
> > +	reg_adr = MIPI_TXm_HS_H_BACKPORCHn(ctrl_no, frame_gen);
> > +	kmb_write_mipi(dev_p, reg_adr,
> > +		       (fg_cfg->h_backporch * ppl_llp_ratio) / 1000);
> > +
> > +	/* horizontal frontporch (hfp) */
> > +	reg_adr = MIPI_TXm_HS_H_FRONTPORCHn(ctrl_no, frame_gen);
> > +	kmb_write_mipi(dev_p, reg_adr,
> > +		       (fg_cfg->h_frontporch * ppl_llp_ratio) / 1000);
> > +
> > +	/* horizontal active (ha) */
> > +	reg_adr = MIPI_TXm_HS_H_ACTIVEn(ctrl_no, frame_gen);
> > +
> > +	/* convert h_active which is wc in bytes to cycles */
> > +	val = (fg_cfg->h_active * sysclk * 1000) /
> > +	    ((fg_cfg->lane_rate_mbps / 8) * fg_cfg->active_lanes);
> > +	val /= 1000;
> > +	kmb_write_mipi(dev_p, reg_adr, val);
> > +
> > +	/* llp hsync width */
> > +	reg_adr = MIPI_TXm_HS_LLP_HSYNC_WIDTHn(ctrl_no, frame_gen);
> > +	kmb_write_mipi(dev_p, reg_adr, fg_cfg->hsync_width * (fg_cfg->bpp /
> 8));
> > +
> > +	/* llp h backporch */
> > +	reg_adr = MIPI_TXm_HS_LLP_H_BACKPORCHn(ctrl_no, frame_gen);
> > +	kmb_write_mipi(dev_p, reg_adr, fg_cfg->h_backporch * (fg_cfg->bpp /
> 8));
> > +
> > +	/* llp h frontporch */
> > +	reg_adr = MIPI_TXm_HS_LLP_H_FRONTPORCHn(ctrl_no, frame_gen);
> > +	kmb_write_mipi(dev_p, reg_adr,
> > +		       fg_cfg->h_frontporch * (fg_cfg->bpp / 8));
> > +}
> > +
> > +static void mipi_tx_fg_cfg(struct kmb_drm_private *dev_p, u8 frame_gen,
> > +			   u8 active_lanes, u32 bpp, u32 wc,
> > +			   u32 lane_rate_mbps, struct mipi_tx_frame_cfg
> *fg_cfg)
> > +{
> > +	u32 i, fg_num_lines = 0;
> > +	struct mipi_tx_frame_timing_cfg fg_t_cfg;
> > +
> > +	/* Calculate the total frame generator number of
> > +	 * lines based on it's active sections
> > +	 */
> > +	for (i = 0; i < MIPI_TX_FRAME_GEN_SECTIONS; i++) {
> > +		if (fg_cfg->sections[i] != NULL)
> > +			fg_num_lines += fg_cfg->sections[i]->height_lines;
> > +	}
> > +
> > +	fg_t_cfg.bpp = bpp;
> > +	fg_t_cfg.lane_rate_mbps = lane_rate_mbps;
> > +	fg_t_cfg.hsync_width = fg_cfg->hsync_width;
> > +	fg_t_cfg.h_backporch = fg_cfg->h_backporch;
> > +	fg_t_cfg.h_frontporch = fg_cfg->h_frontporch;
> > +	fg_t_cfg.h_active = wc;
> > +	fg_t_cfg.vsync_width = fg_cfg->vsync_width;
> > +	fg_t_cfg.v_backporch = fg_cfg->v_backporch;
> > +	fg_t_cfg.v_frontporch = fg_cfg->v_frontporch;
> > +	fg_t_cfg.v_active = fg_num_lines;
> > +	fg_t_cfg.active_lanes = active_lanes;
> > +
> > +	/* Apply frame generator timing setting */
> > +	mipi_tx_fg_cfg_regs(dev_p, frame_gen, &fg_t_cfg);
> > +}
> > +
> > +static void mipi_tx_multichannel_fifo_cfg(struct kmb_drm_private *dev_p,
> > +					  u8 active_lanes, u8 vchannel_id)
> > +{
> > +	u32 fifo_size, fifo_rthreshold;
> > +	u32 ctrl_no = MIPI_CTRL6;
> > +
> > +	/* Clear all mc fifo channel sizes and thresholds */
> > +	kmb_write_mipi(dev_p, MIPI_TX_HS_MC_FIFO_CTRL_EN, 0);
> > +	kmb_write_mipi(dev_p, MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0, 0);
> > +	kmb_write_mipi(dev_p, MIPI_TX_HS_MC_FIFO_CHAN_ALLOC1, 0);
> > +	kmb_write_mipi(dev_p, MIPI_TX_HS_MC_FIFO_RTHRESHOLD0, 0);
> > +	kmb_write_mipi(dev_p, MIPI_TX_HS_MC_FIFO_RTHRESHOLD1, 0);
> > +
> > +	fifo_size = ((active_lanes > MIPI_D_LANES_PER_DPHY) ?
> > +		     MIPI_CTRL_4LANE_MAX_MC_FIFO_LOC :
> > +		     MIPI_CTRL_2LANE_MAX_MC_FIFO_LOC) - 1;
> > +
> > +	/* MC fifo size for virtual channels 0-3
> > +	 * REG_MC_FIFO_CHAN_ALLOC0: [8:0]-channel0, [24:16]-channel1
> > +	 * REG_MC_FIFO_CHAN_ALLOC1: [8:0]-2, [24:16]-channel3
> > +	 */
> > +	SET_MC_FIFO_CHAN_ALLOC(dev_p, ctrl_no, vchannel_id, fifo_size);
> > +
> > +	/* Set threshold to half the fifo size, actual size=size*16 */
> > +	fifo_rthreshold = ((fifo_size) * 8) & BIT_MASK_16;
> > +	SET_MC_FIFO_RTHRESHOLD(dev_p, ctrl_no, vchannel_id,
> fifo_rthreshold);
> > +
> > +	/* Enable the MC FIFO channel corresponding to the Virtual Channel */
> > +	kmb_set_bit_mipi(dev_p, MIPI_TXm_HS_MC_FIFO_CTRL_EN(ctrl_no),
> > +			 vchannel_id);
> > +}
> > +
> > +static void mipi_tx_ctrl_cfg(struct kmb_drm_private *dev_p, u8 fg_id,
> > +			     struct mipi_ctrl_cfg *ctrl_cfg)
> > +{
> > +	u32 sync_cfg = 0, ctrl = 0, fg_en;
> > +	u32 ctrl_no = MIPI_CTRL6;
> > +
> > +	/* MIPI_TX_HS_SYNC_CFG */
> > +	if (ctrl_cfg->tx_ctrl_cfg.line_sync_pkt_en)
> > +		sync_cfg |= LINE_SYNC_PKT_ENABLE;
> > +	if (ctrl_cfg->tx_ctrl_cfg.frame_counter_active)
> > +		sync_cfg |= FRAME_COUNTER_ACTIVE;
> > +	if (ctrl_cfg->tx_ctrl_cfg.line_counter_active)
> > +		sync_cfg |= LINE_COUNTER_ACTIVE;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->v_blanking)
> > +		sync_cfg |= DSI_V_BLANKING;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hsa_blanking)
> > +		sync_cfg |= DSI_HSA_BLANKING;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hbp_blanking)
> > +		sync_cfg |= DSI_HBP_BLANKING;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hfp_blanking)
> > +		sync_cfg |= DSI_HFP_BLANKING;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->sync_pulse_eventn)
> > +		sync_cfg |= DSI_SYNC_PULSE_EVENTN;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->lpm_first_vsa_line)
> > +		sync_cfg |= DSI_LPM_FIRST_VSA_LINE;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->lpm_last_vfp_line)
> > +		sync_cfg |= DSI_LPM_LAST_VFP_LINE;
> > +
> > +	/* Enable frame generator */
> > +	fg_en = 1 << fg_id;
> > +	sync_cfg |= FRAME_GEN_EN(fg_en);
> > +
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_always_use_hact)
> > +		sync_cfg |= ALWAYS_USE_HACT(fg_en);
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_hact_wait_stop)
> > +		sync_cfg |= HACT_WAIT_STOP(fg_en);
> > +
> > +	drm_dbg(&dev_p->drm, "sync_cfg=%d fg_en=%d\n", sync_cfg, fg_en);
> > +
> > +	/* MIPI_TX_HS_CTRL */
> > +
> > +	/* type:DSI, source:LCD */
> > +	ctrl = HS_CTRL_EN | TX_SOURCE;
> > +	ctrl |= LCD_VC(fg_id);
> > +	ctrl |= ACTIVE_LANES(ctrl_cfg->active_lanes - 1);
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->eotp_en)
> > +		ctrl |= DSI_EOTP_EN;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hfp_blank_en)
> > +		ctrl |= DSI_CMD_HFP_EN;
> > +
> > +	/*67 ns stop time */
> > +	ctrl |= HSEXIT_CNT(0x43);
> > +
> > +	kmb_write_mipi(dev_p, MIPI_TXm_HS_SYNC_CFG(ctrl_no), sync_cfg);
> > +	kmb_write_mipi(dev_p, MIPI_TXm_HS_CTRL(ctrl_no), ctrl);
> > +}
> > +
> > +#ifdef MIPI_TX_TEST_PATTERN_GENERATION
> > +static void mipi_tx_hs_tp_gen(struct kmb_drm_private *dev_p, int vc,
> > +			      int tp_sel, u32 stripe_width, u32 color0,
> > +			      u32 color1, u32 ctrl_no)
> > +{
> > +	int val = 0;
> > +
> > +	/* Select test pattern mode on the virtual channel */
> > +	val = TP_SEL_VCm(vc, tp_sel);
> > +
> > +	/* Configure test pattern colors */
> > +	kmb_write_mipi(dev_p, MIPI_TXm_HS_TEST_PAT_COLOR0(ctrl_no),
> color0);
> > +	kmb_write_mipi(dev_p, MIPI_TXm_HS_TEST_PAT_COLOR1(ctrl_no),
> color1);
> > +
> > +	/* Enable test pattern generation on the virtual channel */
> > +	val |= TP_EN_VCm(vc);
> > +	kmb_write_mipi(dev_p, MIPI_TXm_HS_TEST_PAT_CTRL(ctrl_no), val);
> > +
> > +}
> > +#endif
> > +
> > +static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_p,
> > +			      struct mipi_ctrl_cfg *ctrl_cfg)
> > +{
> > +	u32 ret = 0;
> > +	u8 active_vchannels = 0;
> > +	u8 frame_id, sect;
> > +	u32 bits_per_pclk = 0;
> > +	u32 word_count = 0;
> > +	struct mipi_tx_frame_cfg *frame;
> > +
> > +	/* This is the order to initialize MIPI TX:
> > +	 * 1. set frame section parameters
> > +	 * 2. set frame specific parameters
> > +	 * 3. connect lcd to mipi
> > +	 * 4. multi channel fifo cfg
> > +	 * 5. set mipitxcctrlcfg
> > +	 */
> > +
> > +	for (frame_id = 0; frame_id < 4; frame_id++) {
> > +		frame = ctrl_cfg->tx_ctrl_cfg.frames[frame_id];
> > +
> > +		/* Find valid frame, assume only one valid frame */
> > +		if (frame == NULL)
> > +			continue;
> > +
> > +		/* Frame Section configuration */
> > +		/* TODO - assume there is only one valid section in a frame,
> > +		 * so bits_per_pclk and word_count are only set once
> > +		 */
> > +		for (sect = 0; sect < MIPI_CTRL_VIRTUAL_CHANNELS; sect++) {
> > +			if (frame->sections[sect] == NULL)
> > +				continue;
> > +
> > +			ret = mipi_tx_fg_section_cfg(dev_p, frame_id, sect,
> > +						     frame->sections[sect],
> > +						     &bits_per_pclk,
> > +						     &word_count);
> > +			if (ret)
> > +				return ret;
> > +
> > +		}
> > +
> > +		/* Set frame specific parameters */
> > +		mipi_tx_fg_cfg(dev_p, frame_id, ctrl_cfg->active_lanes,
> > +			       bits_per_pclk, word_count,
> > +			       ctrl_cfg->lane_rate_mbps, frame);
> > +
> > +		active_vchannels++;
> > +
> > +		/* Stop iterating as only one virtual channel
> > +		 * shall be used for LCD connection
> > +		 */
> > +		break;
> > +	}
> > +
> > +	if (active_vchannels == 0)
> > +		return -EINVAL;
> > +	/* Multi-Channel FIFO Configuration */
> > +	mipi_tx_multichannel_fifo_cfg(dev_p, ctrl_cfg->active_lanes,
> frame_id);
> > +
> > +	/* Frame Generator Enable */
> > +	mipi_tx_ctrl_cfg(dev_p, frame_id, ctrl_cfg);
> > +
> > +#ifdef MIPI_TX_TEST_PATTERN_GENERATION
> > +	mipi_tx_hs_tp_gen(dev_p, 0, MIPI_TX_HS_TP_V_STRIPES,
> > +			  0x8, 0xff, 0xff00, MIPI_CTRL6);
> > +#endif
> > +
> > +	drm_dbg(&dev_p->drm, "IRQ_STATUS = 0x%x\n",
> > +		  GET_MIPI_TX_HS_IRQ_STATUS(dev_p, MIPI_CTRL6));
> > +
> > +	return ret;
> > +}
> > +
> > +#ifdef DPHY_READ_TESTCODE
> > +int dphy_read_testcode(struct kmb_drm_private *dev_p, int dphy_sel,
> > +		       int test_code)
> > +{
> > +	u32 reg_wr_data;
> > +	u32 reg_rd_data;
> > +	int data;
> > +
> > +	reg_wr_data = dphy_sel;
> > +	kmb_write_mipi(dev_p, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	data = 0;
> > +	reg_wr_data = 0;
> > +	reg_rd_data = 0;
> > +
> > +	if (((dphy_sel >> 0 & 0x1) == 1) | ((dphy_sel >> 4 & 0x1) == 1) |
> > +	    ((dphy_sel >> 8 & 0x1) == 1))
> > +		reg_wr_data |= data << 0;
> > +	if (((dphy_sel >> 1 & 0x1) == 1) | ((dphy_sel >> 5 & 0x1) == 1) |
> > +	    ((dphy_sel >> 9 & 0x1) == 1))
> > +		reg_wr_data |= data << 8;
> > +	if (((dphy_sel >> 2 & 0x1) == 1) | ((dphy_sel >> 6 & 0x1) == 1) |
> > +	    ((dphy_sel >> 10 & 0x1) == 1))
> > +		reg_wr_data |= data << 16;
> > +	if (((dphy_sel >> 3 & 0x1) == 1) | ((dphy_sel >> 7 & 0x1) == 1) |
> > +	    ((dphy_sel >> 11 & 0x1) == 1))
> > +		reg_wr_data |= data << 24;
> > +
> > +	if ((dphy_sel >> 0 & 0xf) > 0)
> > +		kmb_write_mipi(dev_p, DPHY_TEST_DIN0_3, reg_wr_data);
> > +	if ((dphy_sel >> 4 & 0xf) > 0)
> > +		kmb_write_mipi(dev_p, DPHY_TEST_DIN4_7, reg_wr_data);
> > +	if ((dphy_sel >> 8 & 0x3) > 0)
> > +		kmb_write_mipi(dev_p, DPHY_TEST_DIN8_9, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	reg_wr_data = (dphy_sel | dphy_sel << 12);
> > +	kmb_write_mipi(dev_p, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	reg_wr_data = dphy_sel << 12;
> > +	kmb_write_mipi(dev_p, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	kmb_write_mipi(dev_p, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	data = test_code >> 8 & 0xf;
> > +	reg_wr_data = 0;
> > +
> > +	if (((dphy_sel >> 0 & 0x1) == 1) | ((dphy_sel >> 4 & 0x1) == 1) |
> > +	    ((dphy_sel >> 8 & 0x1) == 1))
> > +		reg_wr_data |= data << 0;
> > +	if (((dphy_sel >> 1 & 0x1) == 1) | ((dphy_sel >> 5 & 0x1) == 1) |
> > +	    ((dphy_sel >> 9 & 0x1) == 1))
> > +		reg_wr_data |= data << 8;
> > +	if (((dphy_sel >> 2 & 0x1) == 1) | ((dphy_sel >> 6 & 0x1) == 1) |
> > +	    ((dphy_sel >> 10 & 0x1) == 1))
> > +		reg_wr_data |= data << 16;
> > +	if (((dphy_sel >> 3 & 0x1) == 1) | ((dphy_sel >> 7 & 0x1) == 1) |
> > +	    ((dphy_sel >> 11 & 0x1) == 1))
> > +		reg_wr_data |= data << 24;
> > +
> > +	if ((dphy_sel >> 0 & 0xf) > 0)
> > +		kmb_write_mipi(dev_p, DPHY_TEST_DIN0_3, reg_wr_data);
> > +	if ((dphy_sel >> 4 & 0xf) > 0)
> > +		kmb_write_mipi(dev_p, DPHY_TEST_DIN4_7, reg_wr_data);
> > +	if ((dphy_sel >> 8 & 0x3) > 0)
> > +		kmb_write_mipi(dev_p, DPHY_TEST_DIN8_9, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	reg_wr_data = dphy_sel;
> > +	kmb_write_mipi(dev_p, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	data = test_code & 0xff;
> > +	reg_wr_data = 0;
> > +
> > +	if (((dphy_sel >> 0 & 0x1) == 1) | ((dphy_sel >> 4 & 0x1) == 1) |
> > +	    ((dphy_sel >> 8 & 0x1) == 1))
> > +		reg_wr_data |= data << 0;
> > +	if (((dphy_sel >> 1 & 0x1) == 1) | ((dphy_sel >> 5 & 0x1) == 1) |
> > +	    ((dphy_sel >> 9 & 0x1) == 1))
> > +		reg_wr_data |= data << 8;
> > +	if (((dphy_sel >> 2 & 0x1) == 1) | ((dphy_sel >> 6 & 0x1) == 1) |
> > +	    ((dphy_sel >> 10 & 0x1) == 1))
> > +		reg_wr_data |= data << 16;
> > +	if (((dphy_sel >> 3 & 0x1) == 1) | ((dphy_sel >> 7 & 0x1) == 1) |
> > +	    ((dphy_sel >> 11 & 0x1) == 1))
> > +		reg_wr_data |= data << 24;
> > +
> > +	if ((dphy_sel >> 0 & 0xf) > 0)
> > +		kmb_write_mipi(dev_p, DPHY_TEST_DIN0_3, reg_wr_data);
> > +	if ((dphy_sel >> 4 & 0xf) > 0)
> > +		kmb_write_mipi(dev_p, DPHY_TEST_DIN4_7, reg_wr_data);
> > +	if ((dphy_sel >> 8 & 0x3) > 0)
> > +		kmb_write_mipi(dev_p, DPHY_TEST_DIN8_9, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	reg_wr_data = (dphy_sel | dphy_sel << 12);
> > +	kmb_write_mipi(dev_p, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	reg_wr_data = dphy_sel << 12;
> > +	kmb_write_mipi(dev_p, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	kmb_write_mipi(dev_p, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	if ((dphy_sel >> 0 & 0xf) > 0)
> > +		reg_rd_data = kmb_read_mipi(dev_p, DPHY_TEST_DOUT0_3);
> > +	if ((dphy_sel >> 4 & 0xf) > 0)
> > +		reg_rd_data = kmb_read_mipi(dev_p, DPHY_TEST_DOUT4_7);
> > +	if ((dphy_sel >> 8 & 0x3) > 0)
> > +		reg_rd_data = kmb_read_mipi(dev_p, DPHY_TEST_DOUT8_9);
> > +
> > +	if (((dphy_sel >> 0 & 0x1) == 1) | ((dphy_sel >> 4 & 0x1) == 1) |
> > +	    ((dphy_sel >> 8 & 0x1) == 1))
> > +		data = reg_rd_data >> 0;
> > +	if (((dphy_sel >> 1 & 0x1) == 1) | ((dphy_sel >> 5 & 0x1) == 1) |
> > +	    ((dphy_sel >> 9 & 0x1) == 1))
> > +		data = reg_rd_data >> 8;
> > +	if (((dphy_sel >> 2 & 0x1) == 1) | ((dphy_sel >> 6 & 0x1) == 1) |
> > +	    ((dphy_sel >> 10 & 0x1) == 1))
> > +		data = reg_rd_data >> 16;
> > +	if (((dphy_sel >> 3 & 0x1) == 1) | ((dphy_sel >> 7 & 0x1) == 1) |
> > +	    ((dphy_sel >> 11 & 0x1) == 1))
> > +		data = reg_rd_data >> 24;
> > +
> > +	return data;
> > +}
> > +#endif
> > +
> > +static void test_mode_send(struct kmb_drm_private *dev_p, u32 dphy_no,
> > +			   u32 test_code, u32 test_data)
> > +{
> > +	if (test_code != TEST_CODE_FSM_CONTROL)
> > +		drm_dbg(&dev_p->drm,
> > +			"test_code = %02x, test_data = %08x\n", test_code,
> > +			 test_data);
> > +	/* Steps to send test code:
> > +	 * - set testclk HIGH
> > +	 * - set testdin with test code
> > +	 * - set testen HIGH
> > +	 * - set testclk LOW
> > +	 * - set testen LOW
> > +	 */
> > +
> > +	/* Set testclk high */
> > +	SET_DPHY_TEST_CTRL1_CLK(dev_p, dphy_no);
> > +
> > +	/* Set testdin */
> > +	SET_TEST_DIN0_3(dev_p, dphy_no, test_code);
> > +
> > +	/* Set testen high */
> > +	SET_DPHY_TEST_CTRL1_EN(dev_p, dphy_no);
> > +
> > +	/* Set testclk low */
> > +	CLR_DPHY_TEST_CTRL1_CLK(dev_p, dphy_no);
> > +
> > +	/* Set testen low */
> > +	CLR_DPHY_TEST_CTRL1_EN(dev_p, dphy_no);
> > +
> > +	if (test_code) {
> > +		/*  Steps to send test data:
> > +		 * - set testen LOW
> > +		 * - set testclk LOW
> > +		 * - set testdin with data
> > +		 * - set testclk HIGH
> > +		 */
> > +
> > +		/* Set testen low */
> > +		CLR_DPHY_TEST_CTRL1_EN(dev_p, dphy_no);
> > +
> > +		/* Set testclk low */
> > +		CLR_DPHY_TEST_CTRL1_CLK(dev_p, dphy_no);
> > +
> > +		/* Set data in testdin */
> > +		kmb_write_mipi(dev_p,
> > +			       DPHY_TEST_DIN0_3 + ((dphy_no / 0x4) * 0x4),
> > +			       test_data << ((dphy_no % 4) * 8));
> > +
> > +		/* Set testclk high */
> > +		SET_DPHY_TEST_CTRL1_CLK(dev_p, dphy_no);
> > +	}
> > +}
> > +
> > +static inline void set_test_mode_src_osc_freq_target_low_bits(struct
> > +							      kmb_drm_private
> > +							      *dev_p,
> > +							      u32 dphy_no,
> > +							      u32 freq)
> > +{
> > +	/* Typical rise/fall time=166, refer Table 1207 databook,
> > +	 * sr_osc_freq_target[7:0]
> > +	 */
> > +	test_mode_send(dev_p, dphy_no,
> TEST_CODE_SLEW_RATE_DDL_CYCLES,
> > +		       (freq & 0x7f));
> > +}
> > +
> > +static inline void set_test_mode_src_osc_freq_target_hi_bits(struct
> > +							     kmb_drm_private
> > +							     *dev_p,
> > +							     u32 dphy_no,
> > +							     u32 freq)
> > +{
> > +	u32 data;
> > +
> > +	/* Flag this as high nibble */
> > +	data = ((freq >> 6) & 0x1f) | (1 << 7);
> > +
> > +	/* Typical rise/fall time=166, refer Table 1207 databook,
> > +	 * sr_osc_freq_target[11:7]
> > +	 */
> > +	test_mode_send(dev_p, dphy_no,
> TEST_CODE_SLEW_RATE_DDL_CYCLES, data);
> > +}
> > +
> > +static void mipi_tx_get_vco_params(struct vco_params *vco)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(vco_table); i++) {
> > +		if (vco->freq < vco_table[i].freq) {
> > +			*vco = vco_table[i];
> > +			return;
> > +		}
> > +	}
> > +
> > +	WARN_ONCE(1, "Invalid vco freq = %u for PLL setup\n", vco->freq);
> > +}
> > +
> > +static void mipi_tx_pll_setup(struct kmb_drm_private *dev_p, u32 dphy_no,
> > +			      u32 ref_clk_mhz, u32 target_freq_mhz)
> > +{
> > +	u32 best_n = 0, best_m = 0;
> > +	u32 n = 0, m = 0, div = 0, delta, freq = 0, t_freq;
> > +	u32 best_freq_delta = 3000;
> > +
> > +	/* pll_ref_clk: - valid range: 2~64 MHz; Typically 24 MHz
> > +	 * Fvco: - valid range: 320~1250 MHz (Gen3 D-PHY)
> > +	 * Fout: - valid range: 40~1250 MHz (Gen3 D-PHY)
> > +	 * n: - valid range [0 15]
> > +	 * N: - N = n + 1
> > +	 *      -valid range: [1 16]
> > +	 *      -conditions: - (pll_ref_clk / N) >= 2 MHz
> > +	 *              -(pll_ref_clk / N) <= 8 MHz
> > +	 * m: valid range [62 623]
> > +	 * M: - M = m + 2
> > +	 *      -valid range [64 625]
> > +	 *      -Fvco = (M/N) * pll_ref_clk
> > +	 */
> > +	struct vco_params vco_p = {
> > +		.range = 0,
> > +		.divider = 1,
> > +	};
> > +
> > +	vco_p.freq = target_freq_mhz;
> > +	mipi_tx_get_vco_params(&vco_p);
> > +
> > +	/* Search pll n parameter */
> > +	for (n = PLL_N_MIN; n <= PLL_N_MAX; n++) {
> > +		/* Calculate the pll input frequency division ratio
> > +		 * multiply by 1000 for precision -
> > +		 * no floating point, add n for rounding
> > +		 */
> > +		div = ((ref_clk_mhz * 1000) + n) / (n + 1);
> > +
> > +		/* Found a valid n parameter */
> > +		if ((div < 2000 || div > 8000))
> > +			continue;
> > +
> > +		/* Search pll m parameter */
> > +		for (m = PLL_M_MIN; m <= PLL_M_MAX; m++) {
> > +			/* Calculate the Fvco(DPHY PLL output frequency)
> > +			 * using the current n,m params
> > +			 */
> > +			freq = div * (m + 2);
> > +			freq /= 1000;
> > +
> > +			/* Trim the potential pll freq to max supported */
> > +			if (freq > PLL_FVCO_MAX)
> > +				continue;
> > +
> > +			delta = abs(freq - target_freq_mhz);
> > +
> > +			/* Select the best (closest to target pll freq)
> > +			 * n,m parameters so far
> > +			 */
> > +			if (delta < best_freq_delta) {
> > +				best_n = n;
> > +				best_m = m;
> > +				best_freq_delta = delta;
> > +			}
> > +		}
> > +	}
> > +
> > +	/* Program vco_cntrl parameter
> > +	 * PLL_VCO_Control[5:0] = pll_vco_cntrl_ovr,
> > +	 * PLL_VCO_Control[6]   = pll_vco_cntrl_ovr_en
> > +	 */
> > +	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_VCO_CTRL,
> (vco_p.range
> > +								| (1 << 6)));
> > +
> > +	/* Program m, n pll parameters */
> > +	drm_dbg(&dev_p->drm, "m = %d n = %d\n", best_m, best_n);
> > +
> > +	/* PLL_Input_Divider_Ratio[3:0] = pll_n_ovr */
> > +	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_INPUT_DIVIDER,
> > +		       (best_n & 0x0f));
> > +
> > +	/* m - low nibble PLL_Loop_Divider_Ratio[4:0]
> > +	 * pll_m_ovr[4:0]
> > +	 */
> > +	test_mode_send(dev_p, dphy_no,
> TEST_CODE_PLL_FEEDBACK_DIVIDER,
> > +		       (best_m & 0x1f));
> > +
> > +	/* m - high nibble PLL_Loop_Divider_Ratio[4:0]
> > +	 * pll_m_ovr[9:5]
> > +	 */
> > +	test_mode_send(dev_p, dphy_no,
> TEST_CODE_PLL_FEEDBACK_DIVIDER,
> > +		       ((best_m >> 5) & 0x1f) | PLL_FEEDBACK_DIVIDER_HIGH);
> > +
> > +	/* Enable overwrite of n,m parameters :pll_n_ovr_en, pll_m_ovr_en */
> > +	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_OUTPUT_CLK_SEL,
> > +		       (PLL_N_OVR_EN | PLL_M_OVR_EN));
> > +
> > +	/* Program Charge-Pump parameters */
> > +
> > +	/* pll_prop_cntrl-fixed values for prop_cntrl from DPHY doc */
> > +	t_freq = target_freq_mhz * vco_p.divider;
> > +	test_mode_send(dev_p, dphy_no,
> > +		       TEST_CODE_PLL_PROPORTIONAL_CHARGE_PUMP_CTRL,
> > +		       ((t_freq > 1150) ? 0x0C : 0x0B));
> > +
> > +	/* pll_int_cntrl-fixed value for int_cntrl from DPHY doc */
> > +	test_mode_send(dev_p, dphy_no,
> TEST_CODE_PLL_INTEGRAL_CHARGE_PUMP_CTRL,
> > +		       0x00);
> > +
> > +	/* pll_gmp_cntrl-fixed value for gmp_cntrl from DPHY doci */
> > +	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_GMP_CTRL, 0x10);
> > +
> > +	/* pll_cpbias_cntrl-fixed value for cpbias_cntrl from DPHY doc */
> > +	test_mode_send(dev_p, dphy_no,
> TEST_CODE_PLL_CHARGE_PUMP_BIAS, 0x10);
> > +
> > +	/* pll_th1 -Lock Detector Phase error threshold,
> > +	 * document gives fixed value
> > +	 */
> > +	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_PHASE_ERR_CTRL,
> 0x02);
> > +
> > +	/* PLL Lock Configuration */
> > +
> > +	/* pll_th2 - Lock Filter length, document gives fixed value */
> > +	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_LOCK_FILTER,
> 0x60);
> > +
> > +	/* pll_th3- PLL Unlocking filter, document gives fixed value */
> > +	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_UNLOCK_FILTER,
> 0x03);
> > +
> > +	/* pll_lock_sel-PLL Lock Detector Selection,
> > +	 * document gives fixed value
> > +	 */
> > +	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_LOCK_DETECTOR,
> 0x02);
> > +}
> > +
> > +#ifdef DPHY_GET_FSM
> > +static void dphy_get_fsm(struct kmb_drm_private *dev_p, u32 dphy_no)
> > +{
> > +	test_mode_send(dev_p, dphy_no, TEST_CODE_FSM_CONTROL, 0x80);
> > +
> > +	drm_dbg(&dev_p->drm, "dphy %d fsm_state = 0%x\n", dphy_no,
> > +		 kmb_read_mipi(dev_p, DPHY_TEST_DOUT4_7));
> > +}
> > +#endif
> > +
> > +static void dphy_init_sequence(struct kmb_drm_private *dev_p,
> > +			       struct mipi_ctrl_cfg *cfg, u32 dphy_no,
> > +			       int active_lanes, enum dphy_mode mode)
> > +{
> > +	u32 test_code = 0, test_data = 0, val;
> > +	int i = 0;
> > +
> > +	drm_info(&dev_p->drm,
> > +		"dphy=%d mode=%d active_lanes=%d\n", dphy_no, mode,
> > +		 active_lanes);
> > +	drm_dbg(&dev_p->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
> > +		  kmb_read_mipi(dev_p, MIPI_DPHY_STAT4_7));
> > +
> > +	/* Set D-PHY in shutdown mode */
> > +	/* Assert RSTZ signal */
> > +	CLR_DPHY_INIT_CTRL0(dev_p, dphy_no, RESETZ);
> > +
> > +	/* Assert SHUTDOWNZ signal */
> > +	CLR_DPHY_INIT_CTRL0(dev_p, dphy_no, SHUTDOWNZ);
> > +	val = kmb_read_mipi(dev_p, DPHY_INIT_CTRL0);
> > +
> > +	drm_dbg(&dev_p->drm, "DPHY_INIT_CTRL0 = 0x%x\n", val);
> > +
> > +	/* Init D-PHY_n
> > +	 * Pulse testclear signal to make sure the d-phy configuration
> > +	 * starts from a clean base
> > +	 */
> > +	CLR_DPHY_TEST_CTRL0(dev_p, dphy_no);
> > +	ndelay(15);
> > +	SET_DPHY_TEST_CTRL0(dev_p, dphy_no);
> > +	ndelay(15);
> > +	CLR_DPHY_TEST_CTRL0(dev_p, dphy_no);
> > +	ndelay(15);
> > +
> > +	drm_dbg(&dev_p->drm, "DPHY_TEST_CTRL0=0x%x\n",
> > +		  kmb_read_mipi(dev_p, DPHY_TEST_CTRL0));
> > +
> > +	/* Set mastermacro bit - Master or slave mode */
> > +	test_code = TEST_CODE_MULTIPLE_PHY_CTRL;
> > +
> > +	/* DPHY has its own clock lane enabled (master) */
> > +	if (mode == MIPI_DPHY_MASTER)
> > +		test_data = 0x01;
> > +	else
> > +		test_data = 0x00;
> > +
> > +	/* Send the test code and data */
> > +	test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +
> > +	/* Set the lane data rate */
> > +	for (i = 0; i < MIPI_DPHY_DEFAULT_BIT_RATES; i++) {
> > +		if (mipi_hs_freq_range[i].default_bit_rate_mbps <
> > +		    cfg->lane_rate_mbps)
> > +			continue;
> > +
> > +		/* Send the test code and data */
> > +		/* bit[6:0] = hsfreqrange_ovr bit[7] = hsfreqrange_ovr_en */
> > +		test_code = TEST_CODE_HS_FREQ_RANGE_CFG;
> > +		test_data = (mipi_hs_freq_range[i].hsfreqrange_code & 0x7f) |
> > +		    (1 << 7);
> > +		test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +		break;
> > +	}
> > +
> > +	/* High-Speed Tx Slew Rate Calibration
> > +	 * BitRate: > 1.5 Gbps && <= 2.5 Gbps: slew rate control OFF
> > +	 */
> > +	if (cfg->lane_rate_mbps > 1500) {
> > +		/* Bypass slew rate calibration algorithm
> > +		 * bits[1:0} srcal_en_ovr_en, srcal_en_ovr
> > +		 */
> > +		test_code = TEST_CODE_SLEW_RATE_OVERRIDE_CTRL;
> > +		test_data = 0x02;
> > +		test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +
> > +		/* Disable slew rate calibration */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL;
> > +		test_data = 0x00;
> > +		test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +	} else if (cfg->lane_rate_mbps > 1000) {
> > +		/* BitRate: > 1 Gbps && <= 1.5 Gbps: - slew rate control ON
> > +		 * typical rise/fall times: 166 ps
> > +		 */
> > +
> > +		/* Do not bypass slew rate calibration algorithm
> > +		 * bits[1:0}=srcal_en_ovr_en, srcal_en_ovr, bit[6]=sr_range
> > +		 */
> > +		test_code = TEST_CODE_SLEW_RATE_OVERRIDE_CTRL;
> > +		test_data = (0x03 | (1 << 6));
> > +		test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +
> > +		/* Enable slew rate calibration */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL;
> > +		test_data = 0x01;
> > +		test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +
> > +		/* Set sr_osc_freq_target[6:0] low nibble
> > +		 * typical rise/fall time=166, refer Table 1207 databook
> > +		 */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_CYCLES;
> > +		test_data = (0x72f & 0x7f);
> > +		test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +
> > +		/* Set sr_osc_freq_target[11:7] high nibble
> > +		 * Typical rise/fall time=166, refer Table 1207 databook
> > +		 */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_CYCLES;
> > +		test_data = ((0x72f >> 6) & 0x1f) | (1 << 7);
> > +		test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +	} else {
> > +		/* lane_rate_mbps <= 1000 Mbps
> > +		 * BitRate:  <= 1 Gbps:
> > +		 * - slew rate control ON
> > +		 * - typical rise/fall times: 225 ps
> > +		 */
> > +
> > +		/* Do not bypass slew rate calibration algorithm */
> > +		test_code = TEST_CODE_SLEW_RATE_OVERRIDE_CTRL;
> > +		test_data = (0x03 | (1 << 6));
> > +		test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +
> > +		/* Enable slew rate calibration */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL;
> > +		test_data = 0x01;
> > +		test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +
> > +		/* Typical rise/fall time=255, refer Table 1207 databook */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_CYCLES;
> > +		test_data = (0x523 & 0x7f);
> > +		test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +
> > +		/* Set sr_osc_freq_target[11:7] high nibble */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_CYCLES;
> > +		test_data = ((0x523 >> 6) & 0x1f) | (1 << 7);
> > +		test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +
> > +	}
> > +
> > +	/* Set cfgclkfreqrange */
> > +	val = (((cfg->cfg_clk_khz / 1000) - 17) * 4) & 0x3f;
> > +	SET_DPHY_FREQ_CTRL0_3(dev_p, dphy_no, val);
> > +
> > +	drm_dbg(&dev_p->drm, "DPHY_FREQ = 0x%x\n",
> > +		 kmb_read_mipi(dev_p, DPHY_FREQ_CTRL0_3 + 4));
> > +	drm_dbg(&dev_p->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
> > +		  kmb_read_mipi(dev_p, MIPI_DPHY_STAT4_7));
> > +
> > +	/* Enable config clk for the corresponding d-phy */
> > +	kmb_set_bit_mipi(dev_p, DPHY_CFG_CLK_EN, dphy_no);
> > +
> > +	drm_dbg(&dev_p->drm, "DPHY_CFG_CLK_EN = 0x%x\n",
> > +		 kmb_read_mipi(dev_p, DPHY_CFG_CLK_EN));
> > +
> > +	/* PLL setup */
> > +	if (mode == MIPI_DPHY_MASTER) {
> > +		/*Set PLL regulator in bypass */
> > +		test_code = TEST_CODE_PLL_ANALOG_PROG;
> > +		test_data = 0x01;
> > +		test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +
> > +		/* PLL Parameters Setup */
> > +		mipi_tx_pll_setup(dev_p, dphy_no, cfg->ref_clk_khz / 1000,
> > +				  cfg->lane_rate_mbps / 2);
> > +
> > +		/* Set clksel */
> > +		kmb_write_bits_mipi(dev_p, DPHY_INIT_CTRL1,
> > +				    PLL_CLKSEL_0, 2, 0x01);
> > +
> > +		/* Set pll_shadow_control */
> > +		kmb_set_bit_mipi(dev_p, DPHY_INIT_CTRL1,
> PLL_SHADOW_CTRL);
> > +
> > +		drm_dbg(&dev_p->drm, "DPHY_INIT_CTRL1 = 0x%x\n",
> > +			 kmb_read_mipi(dev_p, DPHY_INIT_CTRL1));
> > +	}
> > +
> > +	drm_dbg(&dev_p->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
> > +		  kmb_read_mipi(dev_p, MIPI_DPHY_STAT4_7));
> > +
> > +//#define MIPI_TX_FORCE_VOD
> > +#ifdef MIPI_TX_FORCE_VOD
> > +#define MIPI_TX_VOD_LVL	450
> > +#define TEST_CODE_BANDGAP 0x24
> > +	/* Set bandgap/VOD level */
> > +	switch (MIPI_TX_VOD_LVL) {
> > +	case 200:
> > +		test_data = 0x00;
> > +		break;
> > +	case 300:
> > +		test_data = 0x20;
> > +		break;
> > +	case 350:
> > +		test_data = 0x40;
> > +		break;
> > +	case 450:
> > +		test_data = 0x60;
> > +		break;
> > +	case 400:
> > +	default:
> > +		test_data = 0x70;
> > +		break;
> > +	}
> > +	test_mode_send(dev_p, dphy_no, TEST_CODE_BANDGAP, test_data);
> > +#endif
> > +
> > +	/*Send NORMAL OPERATION test code */
> > +	test_code = 0x0;
> > +	test_data = 0x0;
> > +	test_mode_send(dev_p, dphy_no, test_code, test_data);
> > +
> > +	/* Configure BASEDIR for data lanes
> > +	 * NOTE: basedir only applies to LANE_0 of each D-PHY.
> > +	 * The other lanes keep their direction based on the D-PHY type,
> > +	 * either Rx or Tx.
> > +	 * bits[5:0]  - BaseDir: 1 = Rx
> > +	 * bits[9:6] - BaseDir: 0 = Tx
> > +	 */
> > +	drm_dbg(&dev_p->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
> > +		  kmb_read_mipi(dev_p, MIPI_DPHY_STAT4_7));
> > +
> > +	kmb_write_bits_mipi(dev_p, DPHY_INIT_CTRL2, 0, 9, 0x03f);
> > +	ndelay(15);
> > +
> > +	/* Enable CLOCK LANE
> > +	 * Clock lane should be enabled regardless of the direction
> > +	 * set for the D-PHY (Rx/Tx)
> > +	 */
> > +	kmb_set_bit_mipi(dev_p, DPHY_INIT_CTRL2, 12 + dphy_no);
> > +
> > +	drm_dbg(&dev_p->drm, "DPHY_INIT_CTRL2 = 0x%x\n",
> > +		 kmb_read_mipi(dev_p, DPHY_INIT_CTRL2));
> > +
> > +	/* Enable DATA LANES */
> > +	kmb_write_bits_mipi(dev_p, DPHY_ENABLE, dphy_no * 2, 2,
> > +			    ((1 << active_lanes) - 1));
> > +
> > +	drm_dbg(&dev_p->drm,
> > +		"DPHY_ENABLE = 0x%x\n", kmb_read_mipi(dev_p,
> DPHY_ENABLE));
> > +	ndelay(15);
> > +
> > +	/* Take D-PHY out of shutdown mode */
> > +	/* Deassert SHUTDOWNZ signal */
> > +	drm_dbg(&dev_p->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
> > +		 kmb_read_mipi(dev_p, MIPI_DPHY_STAT4_7));
> > +	SET_DPHY_INIT_CTRL0(dev_p, dphy_no, SHUTDOWNZ);
> > +	ndelay(15);
> > +
> > +	/* Deassert RSTZ signal */
> > +	SET_DPHY_INIT_CTRL0(dev_p, dphy_no, RESETZ);
> > +	drm_dbg(&dev_p->drm, "DPHY_INIT_CTRL0 = 0x%x\n",
> > +		 kmb_read_mipi(dev_p, DPHY_INIT_CTRL0));
> > +}
> > +
> > +static void dphy_wait_fsm(struct kmb_drm_private *dev_p, u32 dphy_no,
> > +			  enum dphy_tx_fsm fsm_state)
> > +{
> > +	enum dphy_tx_fsm val = DPHY_TX_POWERDWN;
> > +	int i = 0;
> > +	int status = 1;
> > +
> > +	do {
> > +		test_mode_send(dev_p, dphy_no, TEST_CODE_FSM_CONTROL,
> 0x80);
> > +
> > +		val = GET_TEST_DOUT4_7(dev_p, dphy_no);
> > +		i++;
> > +		if (i > TIMEOUT) {
> > +			status = 0;
> > +			break;
> > +		}
> > +	} while (val != fsm_state);
> > +
> > +	drm_dbg(&dev_p->drm, "%s: dphy %d val = %x\n", __func__, dphy_no,
> val);
> > +	drm_info(&dev_p->drm, "********** DPHY %d WAIT_FSM %s
> **********\n",
> > +		 dphy_no, status ? "SUCCESS" : "FAILED");
> > +}
> > +
> > +static void wait_init_done(struct kmb_drm_private *dev_p, u32 dphy_no,
> > +			   u32 active_lanes)
> > +{
> > +	u32 stopstatedata = 0;
> > +	u32 data_lanes = (1 << active_lanes) - 1;
> > +	int i = 0, val;
> > +	int status = 1;
> > +
> > +	drm_dbg(&dev_p->drm, "dphy=%d active_lanes=%d data_lanes=%d\n",
> dphy_no,
> > +		 active_lanes, data_lanes);
> > +
> > +	do {
> > +		val = kmb_read_mipi(dev_p, MIPI_DPHY_STAT4_7);
> > +		stopstatedata = GET_STOPSTATE_DATA(dev_p, dphy_no) &
> data_lanes;
> > +
> > +		/* TODO-need to add a time out and return failure */
> > +		i++;
> > +
> > +		if (i > TIMEOUT) {
> > +			status = 0;
> > +
> > +			drm_info(&dev_p->drm,
> > +				"! WAIT_INIT_DONE: TIMING
> OUT!(err_stat=%d)",
> > +				 kmb_read_mipi(dev_p,
> MIPI_DPHY_ERR_STAT6_7));
> > +			drm_dbg(&dev_p->drm,
> > +				"MIPI_DPHY_STAT0_4_7 = 0x%x)\n", val);
> > +			drm_dbg(&dev_p->drm,
> > +				"stopdata = 0x%x data_lanes=0x%x\n",
> > +				 stopstatedata, data_lanes);
> > +
> > +			break;
> > +		}
> > +
> > +		if (i < 3) {
> > +			drm_dbg(&dev_p->drm,
> > +				"stopdata = 0x%x data_lanes=0x%x\n",
> > +				 stopstatedata, data_lanes);
> > +			drm_dbg(&dev_p->drm,
> > +				"MIPI_DPHY_STAT0_4_7 = 0x%x)\n", val);
> > +		}
> > +	} while (stopstatedata != data_lanes);
> > +
> > +	drm_info(&dev_p->drm, "********** DPHY %d INIT - %s
> **********\n",
> > +		 dphy_no, status ? "SUCCESS" : "FAILED");
> > +}
> > +
> > +static void wait_pll_lock(struct kmb_drm_private *dev_p, u32 dphy_no)
> > +{
> > +	int i = 0;
> > +	int status = 1;
> > +
> > +	do {
> > +		/* TODO-need to add a time out and return failure */
> > +		i++;
> > +		if (i > TIMEOUT) {
> > +			status = 0;
> > +
> > +			drm_info(&dev_p->drm, "%s: timing out", __func__);
> > +			drm_dbg(&dev_p->drm,
> > +				"%s : PLL_LOCK = 0x%x ", __func__,
> > +				kmb_read_mipi(dev_p, DPHY_PLL_LOCK));
> > +
> > +			break;
> > +		}
> > +
> > +		if ((i % 100) == 0)
> > +			drm_dbg(&dev_p->drm,
> > +				"%s : PLL_LOCK = 0x%x\n", __func__,
> > +				kmb_read_mipi(dev_p, DPHY_PLL_LOCK));
> > +	} while (!GET_PLL_LOCK(dev_p, dphy_no));
> > +
> > +	drm_info(&dev_p->drm, "***** PLL Locked for DPHY %d - %s *****\n",
> > +		 dphy_no, status ? "SUCCESS" : "FAILED");
> > +}
> > +
> > +static u32 mipi_tx_init_dphy(struct kmb_drm_private *dev_p,
> > +			     struct mipi_ctrl_cfg *cfg)
> > +{
> > +	u32 dphy_no = MIPI_DPHY6;
> > +
> > +	drm_info(&dev_p->drm,
> > +		"active_lanes=%d lane_rate=%d\n", cfg->active_lanes,
> > +		MIPI_TX_LANE_DATA_RATE_MBPS);
> > +
> > +	/* Multiple D-PHYs needed */
> > +	if (cfg->active_lanes > MIPI_DPHY_D_LANES) {
> > +		/*
> > +		 *Initialization for Tx aggregation mode is done according to
> > +
> *http://dub30.ir.intel.com/bugzilla/show_bug.cgi?id=27785#c12:
> > +		 *a. start init PHY1
> > +		 *b. poll for PHY1 FSM state LOCK
> > +		 *   b1. reg addr 0x03[3:0] - state_main[3:0] == 5 (LOCK)
> > +		 *c. poll for PHY1 calibrations done :
> > +		 *   c1. termination calibration lower section: addr 0x22[5]
> > +		 *   - rescal_done
> > +		 *   c2. slewrate calibration (if data rate < = 1500 Mbps):
> > +		 *     addr 0xA7[3:2] - srcal_done, sr_finished
> > +		 *d. start init PHY0
> > +		 *e. poll for PHY0 stopstate
> > +		 *f. poll for PHY1 stopstate
> > +		 */
> > +		/*PHY #N+1 ('slave') */
> > +
> > +		dphy_init_sequence(dev_p, cfg, dphy_no + 1,
> > +				   (cfg->active_lanes - MIPI_DPHY_D_LANES),
> > +				   MIPI_DPHY_SLAVE);
> > +		dphy_wait_fsm(dev_p, dphy_no + 1, DPHY_TX_LOCK);
> > +
> > +		/* PHY #N master */
> > +		dphy_init_sequence(dev_p, cfg, dphy_no,
> MIPI_DPHY_D_LANES,
> > +				   MIPI_DPHY_MASTER);
> > +
> > +		/* Wait for DPHY init to complete */
> > +		wait_init_done(dev_p, dphy_no, MIPI_DPHY_D_LANES);
> > +		wait_init_done(dev_p, dphy_no + 1,
> > +			       cfg->active_lanes - MIPI_DPHY_D_LANES);
> > +		wait_pll_lock(dev_p, dphy_no);
> > +		wait_pll_lock(dev_p, dphy_no + 1);
> > +		dphy_wait_fsm(dev_p, dphy_no, DPHY_TX_IDLE);
> > +	} else {		/* Single DPHY */
> > +		dphy_init_sequence(dev_p, cfg, dphy_no, cfg->active_lanes,
> > +				   MIPI_DPHY_MASTER);
> > +		dphy_wait_fsm(dev_p, dphy_no, DPHY_TX_IDLE);
> > +		wait_init_done(dev_p, dphy_no, cfg->active_lanes);
> > +		wait_pll_lock(dev_p, dphy_no);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +void connect_lcd_to_mipi(struct kmb_drm_private *dev_p)
> > +{
> > +	/* DISABLE MIPI->CIF CONNECTION */
> > +	kmb_write_msscam(dev_p, MSS_MIPI_CIF_CFG, 0);
> > +
> > +	/* ENABLE LCD->MIPI CONNECTION */
> > +	kmb_write_msscam(dev_p, MSS_LCD_MIPI_CFG, 1);
> > +
> > +	/* DISABLE LCD->CIF LOOPBACK */
> > +	kmb_write_msscam(dev_p, MSS_LOOPBACK_CFG, 0);
> > +}
> > +
> > +int kmb_dsi_hw_init(struct drm_device *dev, struct drm_display_mode
> *mode)
> > +{
> > +	struct kmb_drm_private *dev_p = to_kmb(dev);
> > +	u64 data_rate;
> > +
> > +	mipi_tx_init_cfg.active_lanes = MIPI_TX_ACTIVE_LANES;
> > +
> > +	if (mode != NULL) {
> > +		mipi_tx_frame0_sect_cfg.width_pixels = mode->crtc_hdisplay;
> > +		mipi_tx_frame0_sect_cfg.height_lines = mode->crtc_vdisplay;
> > +		mipitx_frame0_cfg.vsync_width =
> > +		    mode->crtc_vsync_end - mode->crtc_vsync_start;
> > +		mipitx_frame0_cfg.v_backporch =
> > +		    mode->crtc_vtotal - mode->crtc_vsync_end;
> > +		mipitx_frame0_cfg.v_frontporch =
> > +		    mode->crtc_vsync_start - mode->crtc_vdisplay;
> > +		mipitx_frame0_cfg.hsync_width =
> > +		    mode->crtc_hsync_end - mode->crtc_hsync_start;
> > +		mipitx_frame0_cfg.h_backporch =
> > +		    mode->crtc_htotal - mode->crtc_hsync_end;
> > +		mipitx_frame0_cfg.h_frontporch =
> > +		    mode->crtc_hsync_start - mode->crtc_hdisplay;
> > +
> > +		/* Lane rate = (vtotal*htotal*fps*bpp)/4 / 1000000
> > +		 * to convert to Mbps
> > +		 */
> > +		data_rate = ((((u32) mode->crtc_vtotal *
> > +				(u32) mode->crtc_htotal) *
> > +				(u32)(drm_mode_vrefresh(mode)) *
> > +			      MIPI_TX_BPP) / mipi_tx_init_cfg.active_lanes) /
> > +		    1000000;
> > +
> > +		drm_info(&dev_p->drm, "htotal=%d vtotal=%d refresh=%d\n",
> > +			 mode->crtc_htotal, mode->crtc_vtotal,
> > +			 drm_mode_vrefresh(mode));
> > +		drm_info(&dev_p->drm, "data_rate=%u active_lanes=%d\n",
> > +			 (u32) data_rate, mipi_tx_init_cfg.active_lanes);
> > +
> > +		/* When late rate < 800, modeset fails with 4 lanes,
> > +		 * so switch to 2 lanes
> > +		 */
> > +		if (data_rate < 800) {
> > +			mipi_tx_init_cfg.active_lanes = 2;
> > +			mipi_tx_init_cfg.lane_rate_mbps = data_rate * 2;
> > +		} else {
> > +			mipi_tx_init_cfg.lane_rate_mbps = data_rate;
> > +		}
> > +		drm_info(&dev_p->drm,
> > +			"lane rate=%d\n", mipi_tx_init_cfg.lane_rate_mbps);
> > +		drm_dbg(&dev_p->drm,
> > +		     "vfp= %d vbp= %d vsyc_len=%d hfp=%d hbp=%d
> hsync_len=%d lane-rate=%d",
> > +		     mipitx_frame0_cfg.v_frontporch,
> > +		     mipitx_frame0_cfg.v_backporch,
> > +		     mipitx_frame0_cfg.vsync_width,
> > +		     mipitx_frame0_cfg.h_frontporch,
> > +		     mipitx_frame0_cfg.h_backporch,
> > +		     mipitx_frame0_cfg.hsync_width,
> > +		     mipi_tx_init_cfg.lane_rate_mbps);
> > +
> > +	}
> > +
> > +	if (hw_initialized)
> > +		return 0;
> > +
> > +	kmb_write_mipi(dev_p, DPHY_ENABLE, 0);
> > +	kmb_write_mipi(dev_p, DPHY_INIT_CTRL0, 0);
> > +	kmb_write_mipi(dev_p, DPHY_INIT_CTRL1, 0);
> > +	kmb_write_mipi(dev_p, DPHY_INIT_CTRL2, 0);
> > +
> > +	/* Initialize mipi controller */
> > +	mipi_tx_init_cntrl(dev_p, &mipi_tx_init_cfg);
> > +
> > +	/* Dphy initialization */
> > +	mipi_tx_init_dphy(dev_p, &mipi_tx_init_cfg);
> > +	drm_dbg(&dev_p->drm, "IRQ_STATUS = 0x%x\n",
> > +		 GET_MIPI_TX_HS_IRQ_STATUS(dev_p, MIPI_CTRL6));
> > +
> > +	connect_lcd_to_mipi(dev_p);
> > +
> > +#ifdef MIPI_TX_TEST_PATTERN_GENERATION
> > +	mipi_tx_hs_tp_gen(dev_p, 0, MIPI_TX_HS_TP_V_STRIPES,
> > +			  0x15, 0xff, 0xff00, MIPI_CTRL6);
> > +
> > +	drm_dbg(&dev_p->drm, "IRQ_STATUS = 0x%x\n",
> > +		 GET_MIPI_TX_HS_IRQ_STATUS(dev_p, MIPI_CTRL6));
> > +#endif //MIPI_TX_TEST_PATTERN_GENERATION
> > +
> > +	hw_initialized = true;
> > +
> > +	drm_dbg(&dev_p->drm, "MIPI_TXm_HS_CTRL = 0x%x\n",
> > +		 kmb_read_mipi(dev_p, MIPI_TXm_HS_CTRL(6)));
> > +	drm_dbg(&dev_p->drm, "MIPI LOOP BACK = %x\n",
> > +		 kmb_read_mipi(dev_p, MIPI_CTRL_DIG_LOOPBACK));
> > +	drm_info(&dev_p->drm, "mipi hw_initialized = %d\n", hw_initialized);
> > +
> > +	return 0;
> > +}
> > +
> > +int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
> > +{
> > +	struct kmb_dsi *kmb_dsi;
> > +	struct drm_encoder *encoder;
> > +	struct kmb_connector *kmb_connector;
> > +	struct drm_connector *connector;
> > +	struct kmb_dsi_host *host;
> > +	int ret = 0;
> > +
> > +	kmb_dsi = kzalloc(sizeof(*kmb_dsi), GFP_KERNEL);
> > +	if (!kmb_dsi) {
> > +		DRM_ERROR("failed to allocate kmb_dsi\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	kmb_connector = kzalloc(sizeof(*kmb_connector), GFP_KERNEL);
> > +	if (!kmb_connector) {
> > +		kfree(kmb_dsi);
> > +		DRM_ERROR("failed to allocate kmb_connector\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	kmb_dsi->attached_connector = kmb_connector;
> > +
> > +	host = kmb_dsi_host_init(dev, kmb_dsi);
> > +	if (!host) {
> > +		DRM_ERROR("Failed to allocate host\n");
> > +		kfree(kmb_dsi);
> > +		kfree(kmb_connector);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	kmb_dsi->dsi_host = host;
> > +	connector = &kmb_connector->base;
> > +	encoder = &kmb_dsi->base;
> > +	encoder->possible_crtcs = 1;
> > +	encoder->possible_clones = 0;
> > +
> > +	drm_encoder_init(dev, encoder, &kmb_dsi_funcs,
> DRM_MODE_ENCODER_DSI,
> > +			 "MIPI-DSI");
> > +
> > +	drm_connector_init(dev, connector, &kmb_dsi_connector_funcs,
> > +			   DRM_MODE_CONNECTOR_DSI);
> > +
> > +	drm_connector_helper_add(connector,
> &kmb_dsi_connector_helper_funcs);
> > +
> > +	drm_info(dev, "connector = %s encoder = %s\n", connector->name,
> > +		 encoder->name);
> > +
> > +	ret = drm_connector_attach_encoder(connector, encoder);
> > +	drm_info(dev, "connector->encoder = 0x%p ret = %d\n",
> > +		 connector->encoder,
> > +		 ret);
> > +
> > +	/* Link drm_bridge to encoder */
> > +	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> > +	if (ret) {
> > +		DRM_ERROR("failed to attach bridge to MIPI\n");
> > +		drm_encoder_cleanup(encoder);
> > +		return ret;
> > +	}
> > +	drm_info(dev, "Bridge attached : SUCCESS\n");
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h
> b/drivers/gpu/drm/kmb/kmb_dsi.h
> > new file mode 100644
> > index 0000000..d2beaf4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_dsi.h
> > @@ -0,0 +1,370 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only
> > + *
> > + * Copyright (c) 2019-2020 Intel Corporation
> > + */
> > +
> > +#ifndef __KMB_DSI_H__
> > +#define __KMB_DSI_H__
> > +
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include "kmb_drv.h"
> > +
> > +/* MIPI TX CFG*/
> > +#define MIPI_TX_LANE_DATA_RATE_MBPS 891
> > +#define MIPI_TX_REF_CLK_KHZ         24000
> > +#define MIPI_TX_CFG_CLK_KHZ         24000
> > +#define MIPI_TX_BPP		    24
> > +
> > +/* DPHY Tx test codes*/
> > +#define TEST_CODE_FSM_CONTROL				0x03
> > +#define TEST_CODE_MULTIPLE_PHY_CTRL			0x0C
> > +#define TEST_CODE_PLL_PROPORTIONAL_CHARGE_PUMP_CTRL	0x0E
> > +#define TEST_CODE_PLL_INTEGRAL_CHARGE_PUMP_CTRL		0x0F
> > +#define TEST_CODE_PLL_VCO_CTRL				0x12
> > +#define TEST_CODE_PLL_GMP_CTRL				0x13
> > +#define TEST_CODE_PLL_PHASE_ERR_CTRL			0x14
> > +#define TEST_CODE_PLL_LOCK_FILTER			0x15
> > +#define TEST_CODE_PLL_UNLOCK_FILTER			0x16
> > +#define TEST_CODE_PLL_INPUT_DIVIDER			0x17
> > +#define TEST_CODE_PLL_FEEDBACK_DIVIDER			0x18
> > +#define   PLL_FEEDBACK_DIVIDER_HIGH			(1 << 7)
> > +#define TEST_CODE_PLL_OUTPUT_CLK_SEL			0x19
> > +#define   PLL_N_OVR_EN					(1 << 4)
> > +#define   PLL_M_OVR_EN					(1 << 5)
> > +#define TEST_CODE_VOD_LEVEL				0x24
> > +#define TEST_CODE_PLL_CHARGE_PUMP_BIAS			0x1C
> > +#define TEST_CODE_PLL_LOCK_DETECTOR			0x1D
> > +#define TEST_CODE_HS_FREQ_RANGE_CFG			0x44
> > +#define TEST_CODE_PLL_ANALOG_PROG			0x1F
> > +#define TEST_CODE_SLEW_RATE_OVERRIDE_CTRL		0xA0
> > +#define TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL		0xA3
> > +#define TEST_CODE_SLEW_RATE_DDL_CYCLES			0xA4
> > +
> > +/* DPHY params */
> > +#define PLL_N_MIN	0
> > +#define PLL_N_MAX	15
> > +#define PLL_M_MIN	62
> > +#define PLL_M_MAX	623
> > +#define PLL_FVCO_MAX	1250
> > +
> > +#define TIMEOUT		600
> > +
> > +#define MIPI_TX_FRAME_GEN				4
> > +#define MIPI_TX_FRAME_GEN_SECTIONS			4
> > +#define MIPI_CTRL_VIRTUAL_CHANNELS			4
> > +#define MIPI_D_LANES_PER_DPHY				2
> > +#define MIPI_CTRL_2LANE_MAX_MC_FIFO_LOC			255
> > +#define MIPI_CTRL_4LANE_MAX_MC_FIFO_LOC			511
> > +/* 2 Data Lanes per D-PHY */
> > +#define MIPI_DPHY_D_LANES				2
> > +#define MIPI_DPHY_DEFAULT_BIT_RATES			63
> > +
> > +#define to_kmb_connector(x) container_of(x, struct kmb_connector, base)
> > +#define to_kmb_host(x) container_of(x, struct kmb_dsi_host, base)
> > +#define to_kmb_dsi(x) container_of(x, struct kmb_dsi, base)
> > +
> > +struct kmb_connector;
> > +struct kmb_dsi_host;
> > +
> > +struct kmb_dsi {
> > +	struct drm_encoder base;
> > +	struct kmb_connector *attached_connector;
> > +	struct kmb_dsi_host *dsi_host;
> > +	struct drm_bridge *bridge;
> > +};
> > +
> > +struct kmb_dsi_host {
> > +	struct mipi_dsi_host *base;
> > +	struct kmb_dsi *kmb_dsi;
> > +	struct mipi_dsi_device *device;
> > +};
> > +
> > +struct kmb_connector {
> > +	struct drm_connector base;
> > +	struct drm_encoder *encoder;
> > +	struct drm_display_mode *fixed_mode;
> > +};
> > +
> > +/* DPHY Tx test codes */
> > +
> > +enum mipi_ctrl_num {
> > +	MIPI_CTRL0 = 0,
> > +	MIPI_CTRL1,
> > +	MIPI_CTRL2,
> > +	MIPI_CTRL3,
> > +	MIPI_CTRL4,
> > +	MIPI_CTRL5,
> > +	MIPI_CTRL6,
> > +	MIPI_CTRL7,
> > +	MIPI_CTRL8,
> > +	MIPI_CTRL9,
> > +	MIPI_CTRL_NA
> > +};
> > +
> > +enum mipi_dphy_num {
> > +	MIPI_DPHY0 = 0,
> > +	MIPI_DPHY1,
> > +	MIPI_DPHY2,
> > +	MIPI_DPHY3,
> > +	MIPI_DPHY4,
> > +	MIPI_DPHY5,
> > +	MIPI_DPHY6,
> > +	MIPI_DPHY7,
> > +	MIPI_DPHY8,
> > +	MIPI_DPHY9,
> > +	MIPI_DPHY_NA
> > +};
> > +
> > +enum mipi_dir {
> > +	MIPI_RX,
> > +	MIPI_TX
> > +};
> > +
> > +enum mipi_ctrl_type {
> > +	MIPI_DSI,
> > +	MIPI_CSI
> > +};
> > +
> > +enum mipi_data_if {
> > +	MIPI_IF_DMA,
> > +	MIPI_IF_PARALLEL
> > +};
> > +
> > +enum mipi_data_mode {
> > +	MIPI_DATA_MODE0,
> > +	MIPI_DATA_MODE1,
> > +	MIPI_DATA_MODE2,
> > +	MIPI_DATA_MODE3
> > +};
> > +
> > +enum mipi_dsi_video_mode {
> > +	DSI_VIDEO_MODE_NO_BURST_PULSE,
> > +	DSI_VIDEO_MODE_NO_BURST_EVENT,
> > +	DSI_VIDEO_MODE_BURST
> > +};
> > +
> > +enum mipi_dsi_blanking_mode {
> > +	TRANSITION_TO_LOW_POWER,
> > +	SEND_BLANK_PACKET
> > +};
> > +
> > +enum mipi_dsi_eotp {
> > +	DSI_EOTP_DISABLED,
> > +	DSI_EOTP_ENABLES
> > +};
> > +
> > +enum mipi_dsi_data_type {
> > +	DSI_SP_DT_RESERVED_00 = 0x00,
> > +	DSI_SP_DT_VSYNC_START = 0x01,
> > +	DSI_SP_DT_COLOR_MODE_OFF = 0x02,
> > +	DSI_SP_DT_GENERIC_SHORT_WR = 0x03,
> > +	DSI_SP_DT_GENERIC_RD = 0x04,
> > +	DSI_SP_DT_DCS_SHORT_WR = 0x05,
> > +	DSI_SP_DT_DCS_RD = 0x06,
> > +	DSI_SP_DT_EOTP = 0x08,
> > +	DSI_LP_DT_NULL = 0x09,
> > +	DSI_LP_DT_RESERVED_0A = 0x0a,
> > +	DSI_LP_DT_RESERVED_0B = 0x0b,
> > +	DSI_LP_DT_LPPS_YCBCR422_20B = 0x0c,
> > +	DSI_LP_DT_PPS_RGB101010_30B = 0x0d,
> > +	DSI_LP_DT_PPS_RGB565_16B = 0x0e,
> > +	DSI_LP_DT_RESERVED_0F = 0x0f,
> > +
> > +	DSI_SP_DT_RESERVED_10 = 0x10,
> > +	DSI_SP_DT_VSYNC_END = 0x11,
> > +	DSI_SP_DT_COLOR_MODE_ON = 0x12,
> > +	DSI_SP_DT_GENERIC_SHORT_WR_1PAR = 0x13,
> > +	DSI_SP_DT_GENERIC_RD_1PAR = 0x14,
> > +	DSI_SP_DT_DCS_SHORT_WR_1PAR = 0x15,
> > +	DSI_SP_DT_RESERVED_16 = 0x16,
> > +	DSI_SP_DT_RESERVED_17 = 0x17,
> > +	DSI_SP_DT_RESERVED_18 = 0x18,
> > +	DSI_LP_DT_BLANK = 0x19,
> > +	DSI_LP_DT_RESERVED_1A = 0x1a,
> > +	DSI_LP_DT_RESERVED_1B = 0x1b,
> > +	DSI_LP_DT_PPS_YCBCR422_24B = 0x1c,
> > +	DSI_LP_DT_PPS_RGB121212_36B = 0x1d,
> > +	DSI_LP_DT_PPS_RGB666_18B = 0x1e,
> > +	DSI_LP_DT_RESERVED_1F = 0x1f,
> > +
> > +	DSI_SP_DT_RESERVED_20 = 0x20,
> > +	DSI_SP_DT_HSYNC_START = 0x21,
> > +	DSI_SP_DT_SHUT_DOWN_PERIPH_CMD = 0x22,
> > +	DSI_SP_DT_GENERIC_SHORT_WR_2PAR = 0x23,
> > +	DSI_SP_DT_GENERIC_RD_2PAR = 0x24,
> > +	DSI_SP_DT_RESERVED_25 = 0x25,
> > +	DSI_SP_DT_RESERVED_26 = 0x26,
> > +	DSI_SP_DT_RESERVED_27 = 0x27,
> > +	DSI_SP_DT_RESERVED_28 = 0x28,
> > +	DSI_LP_DT_GENERIC_LONG_WR = 0x29,
> > +	DSI_LP_DT_RESERVED_2A = 0x2a,
> > +	DSI_LP_DT_RESERVED_2B = 0x2b,
> > +	DSI_LP_DT_PPS_YCBCR422_16B = 0x2c,
> > +	DSI_LP_DT_RESERVED_2D = 0x2d,
> > +	DSI_LP_DT_LPPS_RGB666_18B = 0x2e,
> > +	DSI_LP_DT_RESERVED_2F = 0x2f,
> > +
> > +	DSI_SP_DT_RESERVED_30 = 0x30,
> > +	DSI_SP_DT_HSYNC_END = 0x31,
> > +	DSI_SP_DT_TURN_ON_PERIPH_CMD = 0x32,
> > +	DSI_SP_DT_RESERVED_33 = 0x33,
> > +	DSI_SP_DT_RESERVED_34 = 0x34,
> > +	DSI_SP_DT_RESERVED_35 = 0x35,
> > +	DSI_SP_DT_RESERVED_36 = 0x36,
> > +	DSI_SP_DT_SET_MAX_RETURN_PKT_SIZE = 0x37,
> > +	DSI_SP_DT_RESERVED_38 = 0x38,
> > +	DSI_LP_DT_DSC_LONG_WR = 0x39,
> > +	DSI_LP_DT_RESERVED_3A = 0x3a,
> > +	DSI_LP_DT_RESERVED_3B = 0x3b,
> > +	DSI_LP_DT_RESERVED_3C = 0x3c,
> > +	DSI_LP_DT_PPS_YCBCR420_12B = 0x3d,
> > +	DSI_LP_DT_PPS_RGB888_24B = 0x3e,
> > +	DSI_LP_DT_RESERVED_3F = 0x3f
> > +};
> > +
> > +enum mipi_tx_hs_tp_sel {
> > +	MIPI_TX_HS_TP_WHOLE_FRAME_COLOR0 = 0,
> > +	MIPI_TX_HS_TP_WHOLE_FRAME_COLOR1,
> > +	MIPI_TX_HS_TP_V_STRIPES,
> > +	MIPI_TX_HS_TP_H_STRIPES,
> > +};
> > +
> > +enum dphy_mode {
> > +	MIPI_DPHY_SLAVE = 0,
> > +	MIPI_DPHY_MASTER
> > +};
> > +
> > +enum dphy_tx_fsm {
> > +	DPHY_TX_POWERDWN = 0,
> > +	DPHY_TX_BGPON,
> > +	DPHY_TX_TERMCAL,
> > +	DPHY_TX_TERMCALUP,
> > +	DPHY_TX_OFFSETCAL,
> > +	DPHY_TX_LOCK,
> > +	DPHY_TX_SRCAL,
> > +	DPHY_TX_IDLE,
> > +	DPHY_TX_ULP,
> > +	DPHY_TX_LANESTART,
> > +	DPHY_TX_CLKALIGN,
> > +	DPHY_TX_DDLTUNNING,
> > +	DPHY_TX_ULP_FORCE_PLL,
> > +	DPHY_TX_LOCK_LOSS
> > +};
> > +
> > +struct mipi_data_type_params {
> > +	uint8_t size_constraint_pixels;
> > +	uint8_t size_constraint_bytes;
> > +	uint8_t pixels_per_pclk;
> > +	uint8_t bits_per_pclk;
> > +};
> > +
> > +struct mipi_tx_dsi_cfg {
> > +	uint8_t hfp_blank_en;	/*horizontal front porch blanking enable */
> > +	uint8_t eotp_en;	/*End of transmission packet enable */
> > +	/*last vertical front porch blanking mode */
> > +	uint8_t lpm_last_vfp_line;
> > +	/*first vertical sync active blanking mode */
> > +	uint8_t lpm_first_vsa_line;
> > +	uint8_t sync_pulse_eventn;	/*sync type */
> > +	uint8_t hfp_blanking;	/*horizontal front porch blanking mode */
> > +	uint8_t hbp_blanking;	/*horizontal back porch blanking mode */
> > +	uint8_t hsa_blanking;	/*horizontal sync active blanking mode */
> > +	uint8_t v_blanking;	/*vertical timing blanking mode */
> > +};
> > +
> > +struct mipi_tx_frame_section_cfg {
> > +	uint32_t dma_v_stride;
> > +	uint16_t dma_v_scale_cfg;
> > +	uint16_t width_pixels;
> > +	uint16_t height_lines;
> > +	uint8_t dma_packed;
> > +	uint8_t bpp;
> > +	uint8_t bpp_unpacked;
> > +	uint8_t dma_h_stride;
> > +	uint8_t data_type;
> > +	uint8_t data_mode;
> > +	uint8_t dma_flip_rotate_sel;
> > +};
> > +
> > +struct mipi_tx_frame_timing_cfg {
> > +	uint32_t bpp;
> > +	uint32_t lane_rate_mbps;
> > +	uint32_t hsync_width;
> > +	uint32_t h_backporch;
> > +	uint32_t h_frontporch;
> > +	uint32_t h_active;
> > +	uint16_t vsync_width;
> > +	uint16_t v_backporch;
> > +	uint16_t v_frontporch;
> > +	uint16_t v_active;
> > +	uint8_t active_lanes;
> > +};
> > +
> > +struct mipi_tx_frame_sect_phcfg {
> > +	uint32_t wc;
> > +	enum mipi_data_mode data_mode;
> > +	enum mipi_dsi_data_type data_type;
> > +	uint8_t vchannel;
> > +	uint8_t dma_packed;
> > +};
> > +
> > +struct mipi_tx_frame_cfg {
> > +	struct mipi_tx_frame_section_cfg
> *sections[MIPI_TX_FRAME_GEN_SECTIONS];
> > +	uint32_t hsync_width;	/*in pixels */
> > +	uint32_t h_backporch;	/*in pixels */
> > +	uint32_t h_frontporch;	/*in pixels */
> > +	uint16_t vsync_width;	/*in lines */
> > +	uint16_t v_backporch;	/*in lines */
> > +	uint16_t v_frontporch;	/*in lines */
> > +};
> > +
> > +struct mipi_tx_ctrl_cfg {
> > +	struct mipi_tx_frame_cfg *frames[MIPI_TX_FRAME_GEN];
> > +	struct mipi_tx_dsi_cfg *tx_dsi_cfg;
> > +	uint8_t line_sync_pkt_en;
> > +	uint8_t line_counter_active;
> > +	uint8_t frame_counter_active;
> > +	uint8_t tx_hsclkkidle_cnt;
> > +	uint8_t tx_hsexit_cnt;
> > +	uint8_t tx_crc_en;
> > +	uint8_t tx_hact_wait_stop;
> > +	uint8_t tx_always_use_hact;
> > +	uint8_t tx_wait_trig;
> > +	uint8_t tx_wait_all_sect;
> > +};
> > +
> > +/*configuration structure for MIPI control */
> > +struct mipi_ctrl_cfg {
> > +	/* controller index : CTRL6 for connecting to LCD */
> > +	uint8_t index;
> > +	uint8_t type;		/* controller type : MIPI_DSI */
> > +	uint8_t dir;		/* controller direction : MIPI_TX */
> > +	uint8_t active_lanes;	/* # active lanes per controller 2/4 */
> > +	uint32_t lane_rate_mbps;	/*MBPS */
> > +	uint32_t ref_clk_khz;
> > +	uint32_t cfg_clk_khz;
> > +	uint32_t data_if;	/*MIPI_IF_DMA or MIPI_IF_PARALLEL */
> > +	struct mipi_tx_ctrl_cfg tx_ctrl_cfg;
> > +};
> > +
> > +/* Structure for storing user specified interrupts that are enabled */
> > +union mipi_irq_cfg {
> > +	uint8_t value;
> > +	struct {
> > +		uint8_t line_compare:1;
> > +		uint8_t dma_event:1;
> > +		uint8_t frame_done:1;
> > +		uint8_t ctrl_error:1;
> > +		uint8_t dphy_error:1;
> > +	} irq_cfg;
> > +};
> > +
> > +struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev);
> > +int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge);
> > +void kmb_plane_destroy(struct drm_plane *plane);
> > +void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p);
> > +void kmb_dsi_host_unregister(void);
> > +int kmb_dsi_hw_init(struct drm_device *dev, struct drm_display_mode
> *mode);
> > +#endif /* __KMB_DSI_H__ */
> > diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> b/drivers/gpu/drm/kmb/kmb_plane.c
> > new file mode 100644
> > index 0000000..55aef5c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> > @@ -0,0 +1,515 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2018-2020 Intel Corporation
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_data/simplefb.h>
> > +#include <video/videomode.h>
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_plane_helper.h>
> > +#include "kmb_crtc.h"
> > +#include "kmb_drv.h"
> > +#include "kmb_plane.h"
> > +#include "kmb_regs.h"
> > +
> > +struct layer_status plane_status[KMB_MAX_PLANES];
> > +const uint32_t layer_irqs[] = {
> > +	LCD_INT_VL0,
> > +	LCD_INT_VL1,
> > +	LCD_INT_GL0,
> > +	LCD_INT_GL1
> > +};
> > +
> > +static unsigned int check_pixel_format(struct drm_plane *plane, u32 format)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < plane->format_count; i++) {
> > +		if (plane->format_types[i] == format)
> > +			return 0;
> > +	}
> > +	return -EINVAL;
> > +}
> > +
> > +static int kmb_plane_atomic_check(struct drm_plane *plane,
> > +				  struct drm_plane_state *state)
> > +{
> > +	struct drm_framebuffer *fb;
> > +	int ret;
> > +
> > +	fb = state->fb;
> > +	if (!fb || !state->crtc)
> > +		return 0;
> > +
> > +	ret = check_pixel_format(plane, fb->format->format);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (state->crtc_w > KMB_MAX_WIDTH || state->crtc_h >
> KMB_MAX_HEIGHT)
> > +		return -EINVAL;
> > +	if (state->crtc_w < KMB_MIN_WIDTH || state->crtc_h <
> KMB_MIN_HEIGHT)
> > +		return -EINVAL;
> > +	return 0;
> > +}
> > +
> > +static void kmb_plane_atomic_disable(struct drm_plane *plane,
> > +				     struct drm_plane_state *state)
> > +{
> > +	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
> > +	int plane_id = kmb_plane->id;
> > +
> > +	switch (plane_id) {
> > +	case LAYER_0:
> > +		plane_status[plane_id].ctrl = LCD_CTRL_VL1_ENABLE;
> > +		break;
> > +	case LAYER_1:
> > +		plane_status[plane_id].ctrl = LCD_CTRL_VL2_ENABLE;
> > +		break;
> > +	case LAYER_2:
> > +		plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
> > +		break;
> > +	case LAYER_3:
> > +		plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
> > +		break;
> > +	}
> > +
> > +	plane_status[plane_id].disable = true;
> > +}
> > +
> > +unsigned int set_pixel_format(u32 format)
> > +{
> > +	unsigned int val = 0;
> > +
> > +	switch (format) {
> > +		/*planar formats */
> > +	case DRM_FORMAT_YUV444:
> > +		val = LCD_LAYER_FORMAT_YCBCR444PLAN |
> LCD_LAYER_PLANAR_STORAGE;
> > +		break;
> > +	case DRM_FORMAT_YVU444:
> > +		val = LCD_LAYER_FORMAT_YCBCR444PLAN |
> LCD_LAYER_PLANAR_STORAGE
> > +		    | LCD_LAYER_CRCB_ORDER;
> > +		break;
> > +	case DRM_FORMAT_YUV422:
> > +		val = LCD_LAYER_FORMAT_YCBCR422PLAN |
> LCD_LAYER_PLANAR_STORAGE;
> > +		break;
> > +	case DRM_FORMAT_YVU422:
> > +		val = LCD_LAYER_FORMAT_YCBCR422PLAN |
> LCD_LAYER_PLANAR_STORAGE
> > +		    | LCD_LAYER_CRCB_ORDER;
> > +		break;
> > +	case DRM_FORMAT_YUV420:
> > +		val = LCD_LAYER_FORMAT_YCBCR420PLAN |
> LCD_LAYER_PLANAR_STORAGE;
> > +		break;
> > +	case DRM_FORMAT_YVU420:
> > +		val = LCD_LAYER_FORMAT_YCBCR420PLAN |
> LCD_LAYER_PLANAR_STORAGE
> > +		    | LCD_LAYER_CRCB_ORDER;
> > +		break;
> > +	case DRM_FORMAT_NV12:
> > +		val = LCD_LAYER_FORMAT_NV12 |
> LCD_LAYER_PLANAR_STORAGE;
> > +		break;
> > +	case DRM_FORMAT_NV21:
> > +		val = LCD_LAYER_FORMAT_NV12 |
> LCD_LAYER_PLANAR_STORAGE
> > +		    | LCD_LAYER_CRCB_ORDER;
> > +		break;
> > +		/* packed formats */
> > +		/* looks hw requires B & G to be swapped when RGB */
> > +	case DRM_FORMAT_RGB332:
> > +		val = LCD_LAYER_FORMAT_RGB332 | LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_XBGR4444:
> > +		val = LCD_LAYER_FORMAT_RGBX4444;
> > +		break;
> > +	case DRM_FORMAT_ARGB4444:
> > +		val = LCD_LAYER_FORMAT_RGBA4444 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_ABGR4444:
> > +		val = LCD_LAYER_FORMAT_RGBA4444;
> > +		break;
> > +	case DRM_FORMAT_XRGB1555:
> > +		val = LCD_LAYER_FORMAT_XRGB1555 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_XBGR1555:
> > +		val = LCD_LAYER_FORMAT_XRGB1555;
> > +		break;
> > +	case DRM_FORMAT_ARGB1555:
> > +		val = LCD_LAYER_FORMAT_RGBA1555 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_ABGR1555:
> > +		val = LCD_LAYER_FORMAT_RGBA1555;
> > +		break;
> > +	case DRM_FORMAT_RGB565:
> > +		val = LCD_LAYER_FORMAT_RGB565 | LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_BGR565:
> > +		val = LCD_LAYER_FORMAT_RGB565;
> > +		break;
> > +	case DRM_FORMAT_RGB888:
> > +		val = LCD_LAYER_FORMAT_RGB888 | LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_BGR888:
> > +		val = LCD_LAYER_FORMAT_RGB888;
> > +		break;
> > +	case DRM_FORMAT_XRGB8888:
> > +		val = LCD_LAYER_FORMAT_RGBX8888 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_XBGR8888:
> > +		val = LCD_LAYER_FORMAT_RGBX8888;
> > +		break;
> > +	case DRM_FORMAT_ARGB8888:
> > +		val = LCD_LAYER_FORMAT_RGBA8888 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_ABGR8888:
> > +		val = LCD_LAYER_FORMAT_RGBA8888;
> > +		break;
> > +	}
> > +	DRM_INFO_ONCE("%s : %d format=0x%x val=0x%x\n",
> > +			 __func__, __LINE__, format, val);
> > +	return val;
> > +}
> > +
> > +unsigned int set_bits_per_pixel(const struct drm_format_info *format)
> > +{
> > +	u32 bpp = 0;
> > +	unsigned int val = 0;
> > +
> > +	if (format->num_planes > 1) {
> > +		val = LCD_LAYER_8BPP;
> > +		return val;
> > +	}
> > +
> > +	bpp += 8 * format->cpp[0];
> > +
> > +	switch (bpp) {
> > +	case 8:
> > +		val = LCD_LAYER_8BPP;
> > +		break;
> > +	case 16:
> > +		val = LCD_LAYER_16BPP;
> > +		break;
> > +	case 24:
> > +		val = LCD_LAYER_24BPP;
> > +		break;
> > +	case 32:
> > +		val = LCD_LAYER_32BPP;
> > +		break;
> > +	}
> > +
> > +	DRM_DEBUG("bpp=%d val=0x%x\n", bpp, val);
> > +	return val;
> > +}
> > +
> > +static void config_csc(struct kmb_drm_private *dev_p, int plane_id)
> > +{
> > +	/* YUV to RGB conversion using the fixed matrix csc_coef_lcd */
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_COEFF11(plane_id),
> csc_coef_lcd[0]);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_COEFF12(plane_id),
> csc_coef_lcd[1]);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_COEFF13(plane_id),
> csc_coef_lcd[2]);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_COEFF21(plane_id),
> csc_coef_lcd[3]);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_COEFF22(plane_id),
> csc_coef_lcd[4]);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_COEFF23(plane_id),
> csc_coef_lcd[5]);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_COEFF31(plane_id),
> csc_coef_lcd[6]);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_COEFF32(plane_id),
> csc_coef_lcd[7]);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_COEFF33(plane_id),
> csc_coef_lcd[8]);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_OFF1(plane_id),
> csc_coef_lcd[9]);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_OFF2(plane_id),
> csc_coef_lcd[10]);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_OFF3(plane_id),
> csc_coef_lcd[11]);
> > +}
> > +
> > +static void kmb_plane_atomic_update(struct drm_plane *plane,
> > +				    struct drm_plane_state *state)
> > +{
> > +	struct drm_framebuffer *fb;
> > +	struct kmb_drm_private *dev_p;
> > +	unsigned int width;
> > +	unsigned int height;
> > +	unsigned int dma_len;
> > +	struct kmb_plane *kmb_plane;
> > +	unsigned int dma_cfg;
> > +	unsigned int ctrl = 0, val = 0, out_format = 0;
> > +	unsigned int src_w, src_h, crtc_x, crtc_y;
> > +	unsigned char plane_id;
> > +	int num_planes;
> > +	static dma_addr_t addr[MAX_SUB_PLANES] = { 0, 0, 0 };
> > +
> > +	if (!plane || !plane->state || !state)
> > +		return;
> > +
> > +	fb = plane->state->fb;
> > +	if (!fb)
> > +		return;
> > +	num_planes = fb->format->num_planes;
> > +	kmb_plane = to_kmb_plane(plane);
> > +	plane_id = kmb_plane->id;
> > +
> > +	dev_p = to_kmb(plane->dev);
> > +
> > +	if (kmb_under_flow || kmb_flush_done) {
> > +		drm_dbg(&dev_p->drm, "plane_update:underflow!!!!
> returning");
> > +		return;
> > +	}
> > +
> > +	src_w = (plane->state->src_w >> 16);
> > +	src_h = plane->state->src_h >> 16;
> > +	crtc_x = plane->state->crtc_x;
> > +	crtc_y = plane->state->crtc_y;
> > +
> > +	drm_dbg(&dev_p->drm,
> > +		"src_w=%d src_h=%d, fb->format->format=0x%x fb-
> >flags=0x%x\n",
> > +		  src_w, src_h, fb->format->format, fb->flags);
> > +
> > +	width = fb->width;
> > +	height = fb->height;
> > +	dma_len = (width * height * fb->format->cpp[0]);
> > +	drm_dbg(&dev_p->drm, "dma_len=%d ", dma_len);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN_SHADOW(plane_id),
> dma_len);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
> > +		      fb->pitches[0]);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
> > +		      (width * fb->format->cpp[0]));
> > +
> > +	addr[Y_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state, 0);
> > +	dev_p->fb_addr = addr[Y_PLANE];
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_ADDR(plane_id),
> > +		      addr[Y_PLANE] + fb->offsets[0]);
> > +	val = set_pixel_format(fb->format->format);
> > +	val |= set_bits_per_pixel(fb->format);
> > +	/* Program Cb/Cr for planar formats */
> > +	if (num_planes > 1) {
> > +		kmb_write_lcd(dev_p,
> LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
> > +				width*fb->format->cpp[0]);
> > +		kmb_write_lcd(dev_p,
> LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
> > +			      (width * fb->format->cpp[0]));
> > +
> > +		addr[U_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state,
> > +				U_PLANE);
> > +		/* check if Cb/Cr is swapped*/
> > +		if ((num_planes == 3) && (val & LCD_LAYER_CRCB_ORDER))
> > +			kmb_write_lcd(dev_p,
> > +
> 	LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> > +					addr[U_PLANE]);
> > +		else
> > +			kmb_write_lcd(dev_p,
> > +
> 	LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> > +					addr[U_PLANE]);
> > +
> > +		if (num_planes == 3) {
> > +			kmb_write_lcd(dev_p,
> > +
> 	LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
> > +				((width)*fb->format->cpp[0]));
> > +
> > +			kmb_write_lcd(dev_p,
> > +				LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
> > +				((width)*fb->format->cpp[0]));
> > +
> > +			addr[V_PLANE] = drm_fb_cma_get_gem_addr(fb,
> > +					plane->state, V_PLANE);
> > +
> > +			/* check if Cb/Cr is swapped*/
> > +			if (val & LCD_LAYER_CRCB_ORDER)
> > +				kmb_write_lcd(dev_p,
> > +
> 	LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> > +					addr[V_PLANE]);
> > +			else
> > +				kmb_write_lcd(dev_p,
> > +
> 	LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> > +					addr[V_PLANE]);
> > +		}
> > +	}
> > +
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_WIDTH(plane_id), src_w - 1);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_HEIGHT(plane_id), src_h - 1);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_COL_START(plane_id), crtc_x);
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_ROW_START(plane_id), crtc_y);
> > +
> > +	val |= LCD_LAYER_FIFO_100;
> > +
> > +	if (val & LCD_LAYER_PLANAR_STORAGE) {
> > +		val |= LCD_LAYER_CSC_EN;
> > +
> > +		/* Enable CSC if input is planar and output is RGB */
> > +		config_csc(dev_p, plane_id);
> > +	}
> > +
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_CFG(plane_id), val);
> > +
> > +	switch (plane_id) {
> > +	case LAYER_0:
> > +		ctrl = LCD_CTRL_VL1_ENABLE;
> > +		break;
> > +	case LAYER_1:
> > +		ctrl = LCD_CTRL_VL2_ENABLE;
> > +		break;
> > +	case LAYER_2:
> > +		ctrl = LCD_CTRL_GL1_ENABLE;
> > +		break;
> > +	case LAYER_3:
> > +		ctrl = LCD_CTRL_GL2_ENABLE;
> > +		break;
> > +	}
> > +
> > +	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
> > +	    | LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
> > +
> > +	/*LCD is connected to MIPI on kmb
> > +	 * Therefore this bit is required for DSI Tx
> > +	 */
> > +	ctrl |= LCD_CTRL_VHSYNC_IDLE_LVL;
> > +
> > +	kmb_set_bitmask_lcd(dev_p, LCD_CONTROL, ctrl);
> > +
> > +	/* FIXME no doc on how to set output format,these values are
> > +	 * taken from the Myriadx tests
> > +	 */
> > +	out_format |= LCD_OUTF_FORMAT_RGB888;
> > +
> > +	/* Leave RGB order,conversion mode and clip mode to default */
> > +	/* do not interleave RGB channels for mipi Tx compatibility */
> > +	out_format |= LCD_OUTF_MIPI_RGB_MODE;
> > +	kmb_write_lcd(dev_p, LCD_OUT_FORMAT_CFG, out_format);
> > +
> > +	dma_cfg = LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_VSTRIDE_EN
> |
> > +	    LCD_DMA_LAYER_CONT_UPDATE |
> LCD_DMA_LAYER_AXI_BURST_16;
> > +
> > +	/* Enable DMA */
> > +	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
> > +	drm_dbg(&dev_p->drm, "dma_cfg=0x%x LCD_DMA_CFG=0x%x\n",
> dma_cfg,
> > +		  kmb_read_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id)));
> > +
> > +	kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_EOF |
> > +			LCD_INT_DMA_ERR);
> > +	kmb_set_bitmask_lcd(dev_p, LCD_INT_ENABLE, LCD_INT_EOF |
> > +			LCD_INT_DMA_ERR);
> > +}
> > +
> > +static const struct drm_plane_helper_funcs kmb_plane_helper_funcs = {
> > +	.atomic_check = kmb_plane_atomic_check,
> > +	.atomic_update = kmb_plane_atomic_update,
> > +	.atomic_disable = kmb_plane_atomic_disable
> > +};
> > +
> > +void kmb_plane_destroy(struct drm_plane *plane)
> > +{
> > +	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
> > +
> > +	drm_plane_cleanup(plane);
> > +	kfree(kmb_plane);
> > +}
> > +
> > +static void kmb_destroy_plane_state(struct drm_plane *plane,
> > +				    struct drm_plane_state *state)
> > +{
> > +	struct kmb_plane_state *kmb_state = to_kmb_plane_state(state);
> > +
> > +	__drm_atomic_helper_plane_destroy_state(state);
> > +	kfree(kmb_state);
> > +}
> > +
> > +struct drm_plane_state *kmb_plane_duplicate_state(struct drm_plane
> *plane)
> > +{
> > +	struct drm_plane_state *state;
> > +	struct kmb_plane_state *kmb_state;
> > +
> > +	kmb_state = kmemdup(plane->state, sizeof(*kmb_state), GFP_KERNEL);
> > +	if (!kmb_state)
> > +		return NULL;
> > +
> > +	state = &kmb_state->base_plane_state;
> > +	__drm_atomic_helper_plane_duplicate_state(plane, state);
> > +
> > +	return state;
> > +}
> > +
> > +static void kmb_plane_reset(struct drm_plane *plane)
> > +{
> > +	struct kmb_plane_state *kmb_state = to_kmb_plane_state(plane-
> >state);
> > +
> > +	if (kmb_state)
> > +		__drm_atomic_helper_plane_destroy_state
> > +		    (&kmb_state->base_plane_state);
> > +	kfree(kmb_state);
> > +
> > +	plane->state = NULL;
> > +	kmb_state = kzalloc(sizeof(*kmb_state), GFP_KERNEL);
> > +	if (kmb_state) {
> > +		kmb_state->base_plane_state.plane = plane;
> > +		kmb_state->base_plane_state.rotation =
> DRM_MODE_ROTATE_0;
> > +		plane->state = &kmb_state->base_plane_state;
> > +		kmb_state->no_planes = KMB_MAX_PLANES;
> > +	}
> > +}
> > +
> > +static const struct drm_plane_funcs kmb_plane_funcs = {
> > +	.update_plane = drm_atomic_helper_update_plane,
> > +	.disable_plane = drm_atomic_helper_disable_plane,
> > +	.destroy = kmb_plane_destroy,
> > +	.reset = kmb_plane_reset,
> > +	.atomic_duplicate_state = kmb_plane_duplicate_state,
> > +	.atomic_destroy_state = kmb_destroy_plane_state,
> > +};
> > +
> > +struct kmb_plane *kmb_plane_init(struct drm_device *drm)
> > +{
> > +	struct kmb_drm_private *lcd = to_kmb(drm);
> > +	struct kmb_plane *plane = NULL;
> > +	struct kmb_plane *primary = NULL;
> > +	int i = 0;
> > +	int ret = 0;
> > +	enum drm_plane_type plane_type;
> > +	const uint32_t *plane_formats;
> > +	int num_plane_formats;
> > +
> > +	for (i = 0; i < lcd->n_layers; i++) {
> > +		plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
> From a lifetime persepctive I *think* drmm_kzalloc() is the right choice
> here.
> 
> > +
> > +		if (!plane) {
> > +			drm_err(drm, "Failed to allocate plane\n");
> > +			return ERR_PTR(-ENOMEM);
> > +		}
> > +
> > +		plane_type = (i == 0) ? DRM_PLANE_TYPE_PRIMARY :
> > +		    DRM_PLANE_TYPE_OVERLAY;
> > +		if (i < 2) {
> > +			plane_formats = kmb_formats_v;
> > +			num_plane_formats = ARRAY_SIZE(kmb_formats_v);
> > +		} else {
> > +			plane_formats = kmb_formats_g;
> > +			num_plane_formats = ARRAY_SIZE(kmb_formats_g);
> > +		}
> > +
> > +		ret = drm_universal_plane_init(drm, &plane->base_plane,
> > +					       POSSIBLE_CRTCS,
> &kmb_plane_funcs,
> > +					       plane_formats,
> num_plane_formats,
> > +					       NULL, plane_type, "plane %d", i);
> > +		if (ret < 0) {
> > +			drm_err(drm, "drm_universal_plane_init failed
> (ret=%d)",
> > +				  ret);
> > +			goto cleanup;
> > +		}
> > +		drm_dbg(drm, "%s : %d i=%d type=%d",
> > +			  __func__, __LINE__,
> > +			  i, plane_type);
> > +		drm_plane_helper_add(&plane->base_plane,
> > +				     &kmb_plane_helper_funcs);
> > +		if (plane_type == DRM_PLANE_TYPE_PRIMARY) {
> > +			primary = plane;
> > +			lcd->plane = plane;
> > +		}
> > +		drm_dbg(drm, "%s : %d primary=%p\n", __func__, __LINE__,
> > +			  &primary->base_plane);
> > +		plane->id = i;
> > +	}
> > +
> > +	return primary;
> > +cleanup:
> > +	kfree(plane);
> > +	return ERR_PTR(ret);
> > +}
> > diff --git a/drivers/gpu/drm/kmb/kmb_plane.h
> b/drivers/gpu/drm/kmb/kmb_plane.h
> > new file mode 100644
> > index 0000000..48f237f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_plane.h
> > @@ -0,0 +1,124 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only
> > + *
> > + * Copyright (c) 2018-2020 Intel Corporation
> > + */
> > +
> > +#ifndef __KMB_PLANE_H__
> > +#define __KMB_PLANE_H__
> > +
> > +#include "kmb_drv.h"
> > +
> > +extern int kmb_under_flow;
> > +extern int kmb_flush_done;
> > +
> > +#define LCD_INT_VL0_ERR ((LAYER0_DMA_FIFO_UNDERFLOW) | \
> > +			(LAYER0_DMA_FIFO_OVERFLOW) | \
> > +			(LAYER0_DMA_CB_FIFO_OVERFLOW) | \
> > +			(LAYER0_DMA_CB_FIFO_UNDERFLOW) | \
> > +			(LAYER0_DMA_CR_FIFO_OVERFLOW) | \
> > +			(LAYER0_DMA_CR_FIFO_UNDERFLOW))
> > +
> > +#define LCD_INT_VL1_ERR ((LAYER1_DMA_FIFO_UNDERFLOW) | \
> > +			(LAYER1_DMA_FIFO_OVERFLOW) | \
> > +			(LAYER1_DMA_CB_FIFO_OVERFLOW) | \
> > +			(LAYER1_DMA_CB_FIFO_UNDERFLOW) | \
> > +			(LAYER1_DMA_CR_FIFO_OVERFLOW) | \
> > +			(LAYER1_DMA_CR_FIFO_UNDERFLOW))
> > +
> > +#define LCD_INT_GL0_ERR (LAYER2_DMA_FIFO_OVERFLOW |
> LAYER2_DMA_FIFO_UNDERFLOW)
> > +#define LCD_INT_GL1_ERR (LAYER3_DMA_FIFO_OVERFLOW |
> LAYER3_DMA_FIFO_UNDERFLOW)
> > +#define LCD_INT_VL0 (LAYER0_DMA_DONE | LAYER0_DMA_IDLE |
> LCD_INT_VL0_ERR)
> > +#define LCD_INT_VL1 (LAYER1_DMA_DONE | LAYER1_DMA_IDLE |
> LCD_INT_VL1_ERR)
> > +#define LCD_INT_GL0 (LAYER2_DMA_DONE | LAYER2_DMA_IDLE |
> LCD_INT_GL0_ERR)
> > +#define LCD_INT_GL1 (LAYER3_DMA_DONE | LAYER3_DMA_IDLE |
> LCD_INT_GL1_ERR)
> > +#define LCD_INT_DMA_ERR (LCD_INT_VL0_ERR | LCD_INT_VL1_ERR \
> > +		| LCD_INT_GL0_ERR | LCD_INT_GL1_ERR)
> > +
> > +#define POSSIBLE_CRTCS 1
> > +#define INITIALIZED 1
> > +#define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
> > +
> > +#define to_kmb_plane_state(x) \
> > +		container_of(x, struct kmb_plane_state, base_plane_state)
> > +
> > +enum layer_id {
> > +	LAYER_0,
> > +	LAYER_1,
> > +	LAYER_2,
> > +	LAYER_3,
> > +//	KMB_MAX_PLANES,
> > +};
> > +
> > +#define KMB_MAX_PLANES 1
> > +
> > +enum sub_plane_id {
> > +	Y_PLANE,
> > +	U_PLANE,
> > +	V_PLANE,
> > +	MAX_SUB_PLANES,
> > +};
> > +
> > +struct kmb_plane {
> > +	struct drm_plane base_plane;
> > +	struct kmb_drm_private kmb_dev;
> > +	unsigned char id;
> > +};
> > +
> > +struct kmb_plane_state {
> > +	struct drm_plane_state base_plane_state;
> > +	unsigned char no_planes;
> > +};
> > +
> > +/* Graphics layer (layers 2 & 3) formats, only packed formats  are supported
> */
> > +static const u32 kmb_formats_g[] = {
> > +	DRM_FORMAT_RGB332,
> > +	DRM_FORMAT_XRGB4444, DRM_FORMAT_XBGR4444,
> > +	DRM_FORMAT_ARGB4444, DRM_FORMAT_ABGR4444,
> > +	DRM_FORMAT_XRGB1555, DRM_FORMAT_XBGR1555,
> > +	DRM_FORMAT_ARGB1555, DRM_FORMAT_ABGR1555,
> > +	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> > +	DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
> > +	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> > +	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> > +};
> > +
> > +#define MAX_FORMAT_G	(ARRAY_SIZE(kmb_formats_g))
> > +#define MAX_FORMAT_V	(ARRAY_SIZE(kmb_formats_v))
> > +
> > +/* Video layer ( 0 & 1) formats, packed and planar formats are supported */
> > +static const u32 kmb_formats_v[] = {
> > +	/* packed formats */
> > +	DRM_FORMAT_RGB332,
> > +	DRM_FORMAT_XRGB4444, DRM_FORMAT_XBGR4444,
> > +	DRM_FORMAT_ARGB4444, DRM_FORMAT_ABGR4444,
> > +	DRM_FORMAT_XRGB1555, DRM_FORMAT_XBGR1555,
> > +	DRM_FORMAT_ARGB1555, DRM_FORMAT_ABGR1555,
> > +	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> > +	DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
> > +	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> > +	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> > +	/*planar formats */
> > +	DRM_FORMAT_YUV420, DRM_FORMAT_YVU420,
> > +	DRM_FORMAT_YUV422, DRM_FORMAT_YVU422,
> > +	DRM_FORMAT_YUV444, DRM_FORMAT_YVU444,
> > +	DRM_FORMAT_NV12, DRM_FORMAT_NV21,
> > +};
> > +
> > +/* Conversion (yuv->rgb) matrix from myriadx */
> > +static const u32 csc_coef_lcd[] = {
> > +	1024, 0, 1436,
> > +	1024, -352, -731,
> > +	1024, 1814, 0,
> > +	-179, 125, -226
> > +};
> > +
> > +struct layer_status {
> > +	bool disable;
> > +	u32 ctrl;
> > +};
> > +
> > +extern struct layer_status plane_status[KMB_MAX_PLANES];
> > +
> > +struct kmb_plane *kmb_plane_init(struct drm_device *drm);
> > +void kmb_plane_destroy(struct drm_plane *plane);
> > +#endif /* __KMB_PLANE_H__ */
> > diff --git a/drivers/gpu/drm/kmb/kmb_regs.h
> b/drivers/gpu/drm/kmb/kmb_regs.h
> > new file mode 100644
> > index 0000000..089e42d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_regs.h
> > @@ -0,0 +1,738 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only
> > + *
> > + * Copyright (c) 2018-2020 Intel Corporation
> > + */
> > +
> > +#ifndef __KMB_REGS_H__
> > +#define __KMB_REGS_H__
> > +
> > +#define ENABLE					 1
> > +#define DISABLE					 0
> > +/*from Data Book section 12.5.8.1 page 4322 */
> > +#define CPR_BASE_ADDR                           (0x20810000)
> > +#define MIPI_BASE_ADDR                          (0x20900000)
> > +/*from Data Book section 12.11.6.1 page 4972 */
> > +#define LCD_BASE_ADDR                           (0x20930000)
> > +#define MSS_CAM_BASE_ADDR			(MIPI_BASE_ADDR +
> 0x10000)
> > +#define LCD_MMIO_SIZE				(0x3000)
> > +#define MIPI_MMIO_SIZE				(0x4000)
> > +#define MSS_CAM_MMIO_SIZE			(0x30)
> > +
> >
> +/***************************************************************
> ************
> > + *		   LCD controller control register defines
> > +
> *****************************************************************
> **********/
> > +#define LCD_CONTROL				(0x4 * 0x000)
> > +#define LCD_CTRL_PROGRESSIVE			  (0<<0)
> > +#define LCD_CTRL_INTERLACED			  (1<<0)
> > +#define LCD_CTRL_ENABLE				  (1<<1)
> > +#define LCD_CTRL_VL1_ENABLE			  (1<<2)
> > +#define LCD_CTRL_VL2_ENABLE			  (1<<3)
> > +#define LCD_CTRL_GL1_ENABLE			  (1<<4)
> > +#define LCD_CTRL_GL2_ENABLE			  (1<<5)
> > +#define LCD_CTRL_ALPHA_BLEND_VL1		  (0<<6)
> > +#define LCD_CTRL_ALPHA_BLEND_VL2		  (1<<6)
> > +#define LCD_CTRL_ALPHA_BLEND_GL1		  (2<<6)
> > +#define LCD_CTRL_ALPHA_BLEND_GL2		  (3<<6)
> > +#define LCD_CTRL_ALPHA_TOP_VL1			  (0<<8)
> > +#define LCD_CTRL_ALPHA_TOP_VL2			  (1<<8)
> > +#define LCD_CTRL_ALPHA_TOP_GL1			  (2<<8)
> > +#define LCD_CTRL_ALPHA_TOP_GL2			  (3<<8)
> > +#define LCD_CTRL_ALPHA_MIDDLE_VL1		  (0<<10)
> > +#define LCD_CTRL_ALPHA_MIDDLE_VL2		  (1<<10)
> > +#define LCD_CTRL_ALPHA_MIDDLE_GL1		  (2<<10)
> > +#define LCD_CTRL_ALPHA_MIDDLE_GL2		  (3<<10)
> > +#define LCD_CTRL_ALPHA_BOTTOM_VL1		  (0<<12)
> > +#define LCD_CTRL_ALPHA_BOTTOM_VL2		  (1<<12)
> > +#define LCD_CTRL_ALPHA_BOTTOM_GL1		  (2<<12)
> > +#define LCD_CTRL_ALPHA_BOTTOM_GL2		  (3<<12)
> > +#define LCD_CTRL_TIM_GEN_ENABLE			  (1<<14)
> > +#define LCD_CTRL_CONTINUOUS			  (0<<15)
> > +#define LCD_CTRL_ONE_SHOT			  (1<<15)
> > +#define LCD_CTRL_PWM0_EN			  (1<<16)
> > +#define LCD_CTRL_PWM1_EN			  (1<<17)
> > +#define LCD_CTRL_PWM2_EN			  (1<<18)
> > +#define LCD_CTRL_OUTPUT_DISABLED		  (0<<19)
> > +#define LCD_CTRL_OUTPUT_ENABLED			  (1<<19)
> > +#define LCD_CTRL_BPORCH_ENABLE			  (1<<21)
> > +#define LCD_CTRL_FPORCH_ENABLE			  (1<<22)
> > +#define LCD_CTRL_PIPELINE_DMA			  (1<<28)
> > +#define LCD_CTRL_VHSYNC_IDLE_LVL		  (1<<31)
> > +
> > +/*interrupts */
> > +#define LCD_INT_STATUS				(0x4 * 0x001)
> > +#define LCD_INT_EOF				  (1<<0)
> > +#define LCD_INT_LINE_CMP			  (1<<1)
> > +#define LCD_INT_VERT_COMP			  (1<<2)
> > +#define LAYER0_DMA_DONE				  (1<<3)
> > +#define LAYER0_DMA_IDLE				  (1<<4)
> > +#define LAYER0_DMA_FIFO_OVERFLOW		  (1<<5)
> > +#define LAYER0_DMA_FIFO_UNDERFLOW		  (1<<6)
> > +#define LAYER0_DMA_CB_FIFO_OVERFLOW		  (1<<7)
> > +#define LAYER0_DMA_CB_FIFO_UNDERFLOW		  (1<<8)
> > +#define LAYER0_DMA_CR_FIFO_OVERFLOW		  (1<<9)
> > +#define LAYER0_DMA_CR_FIFO_UNDERFLOW		  (1<<10)
> > +#define LAYER1_DMA_DONE				  (1<<11)
> > +#define LAYER1_DMA_IDLE				  (1<<12)
> > +#define LAYER1_DMA_FIFO_OVERFLOW		  (1<<13)
> > +#define LAYER1_DMA_FIFO_UNDERFLOW		  (1<<14)
> > +#define LAYER1_DMA_CB_FIFO_OVERFLOW		  (1<<15)
> > +#define LAYER1_DMA_CB_FIFO_UNDERFLOW		  (1<<16)
> > +#define LAYER1_DMA_CR_FIFO_OVERFLOW		  (1<<17)
> > +#define LAYER1_DMA_CR_FIFO_UNDERFLOW		  (1<<18)
> > +#define LAYER2_DMA_DONE				  (1<<19)
> > +#define LAYER2_DMA_IDLE				  (1<<20)
> > +#define LAYER2_DMA_FIFO_OVERFLOW		  (1<<21)
> > +#define LAYER2_DMA_FIFO_UNDERFLOW		  (1<<22)
> > +#define LAYER3_DMA_DONE				  (1<<23)
> > +#define LAYER3_DMA_IDLE				  (1<<24)
> > +#define LAYER3_DMA_FIFO_OVERFLOW		  (1<<25)
> > +#define LAYER3_DMA_FIFO_UNDERFLOW		  (1<<26)
> > +#define LCD_INT_LAYER				  (0x07fffff8)
> > +#define LCD_INT_ENABLE				(0x4 * 0x002)
> > +#define LCD_INT_CLEAR				(0x4 * 0x003)
> > +#define LCD_LINE_COUNT				(0x4 * 0x004)
> > +#define LCD_LINE_COMPARE			(0x4 * 0x005)
> > +#define LCD_VSTATUS				(0x4 * 0x006)
> > +
> > +/*LCD_VSTATUS_COMPARE Vertcal interval in which to generate vertcal
> > + * interval interrupt
> > + */
> > +/* BITS 13 and 14 */
> > +#define LCD_VSTATUS_COMPARE			(0x4 * 0x007)
> > +#define LCD_VSTATUS_VERTICAL_STATUS_MASK	  (3<<13)
> > +#define LCD_VSTATUS_COMPARE_VSYNC		  (0<<13)
> > +#define LCD_VSTATUS_COMPARE_BACKPORCH		  (1<<13)
> > +#define LCD_VSTATUS_COMPARE_ACTIVE		  (2<<13)
> > +#define LCD_VSTATUS_COMPARE_FRONT_PORCH		  (3<<13)
> > +
> > +#define LCD_SCREEN_WIDTH			(0x4 * 0x008)
> > +#define LCD_SCREEN_HEIGHT			(0x4 * 0x009)
> > +#define LCD_FIELD_INT_CFG			(0x4 * 0x00a)
> > +#define LCD_FIFO_FLUSH				(0x4 * 0x00b)
> > +#define LCD_BG_COLOUR_LS			(0x4 * 0x00c)
> > +#define LCD_BG_COLOUR_MS			(0x4 * 0x00d)
> > +#define LCD_RAM_CFG			        (0x4 * 0x00e)
> > +
> >
> +/***************************************************************
> *************
> > + *		   LCD controller Layer config register
> > +
> *****************************************************************
> ***********
> > + */
> > +#define LCD_LAYER0_CFG		        (0x4 * 0x100)
> > +#define LCD_LAYERn_CFG(N)			(LCD_LAYER0_CFG +
> (0x400*N))
> > +#define LCD_LAYER_SCALE_H			  (1<<1)
> > +#define LCD_LAYER_SCALE_V			  (1<<2)
> > +#define LCD_LAYER_SCALE_H_V
> (LCD_LAYER_SCALE_H | \
> > +							LCD_LAYER_SCALE_V)
> > +#define LCD_LAYER_CSC_EN			  (1<<3)
> > +#define LCD_LAYER_ALPHA_STATIC			  (1<<4)
> > +#define LCD_LAYER_ALPHA_EMBED			  (1<<5)
> > +#define LCD_LAYER_ALPHA_COMBI
> (LCD_LAYER_ALPHA_STATIC | \
> > +
> 	LCD_LAYER_ALPHA_EMBED)
> > +/* RGB multiplied with alpha */
> > +#define LCD_LAYER_ALPHA_PREMULT			  (1<<6)
> > +#define LCD_LAYER_INVERT_COL			  (1<<7)
> > +#define LCD_LAYER_TRANSPARENT_EN		  (1<<8)
> > +#define LCD_LAYER_FORMAT_YCBCR444PLAN		  (0<<9)
> > +#define LCD_LAYER_FORMAT_YCBCR422PLAN		  (1<<9)
> > +#define LCD_LAYER_FORMAT_YCBCR420PLAN		  (2<<9)
> > +#define LCD_LAYER_FORMAT_RGB888PLAN		  (3<<9)
> > +#define LCD_LAYER_FORMAT_YCBCR444LIN		  (4<<9)
> > +#define LCD_LAYER_FORMAT_YCBCR422LIN		  (5<<9)
> > +#define LCD_LAYER_FORMAT_RGB888			  (6<<9)
> > +#define LCD_LAYER_FORMAT_RGBA8888		  (7<<9)
> > +#define LCD_LAYER_FORMAT_RGBX8888		  (8<<9)
> > +#define LCD_LAYER_FORMAT_RGB565			  (9<<9)
> > +#define LCD_LAYER_FORMAT_RGBA1555		  (0xa<<9)
> > +#define LCD_LAYER_FORMAT_XRGB1555		  (0xb<<9)
> > +#define LCD_LAYER_FORMAT_RGB444			  (0xc<<9)
> > +#define LCD_LAYER_FORMAT_RGBA4444		  (0xd<<9)
> > +#define LCD_LAYER_FORMAT_RGBX4444		  (0xe<<9)
> > +#define LCD_LAYER_FORMAT_RGB332			  (0xf<<9)
> > +#define LCD_LAYER_FORMAT_RGBA3328		  (0x10<<9)
> > +#define LCD_LAYER_FORMAT_RGBX3328		  (0x11<<9)
> > +#define LCD_LAYER_FORMAT_CLUT			  (0x12<<9)
> > +#define LCD_LAYER_FORMAT_NV12			  (0x1c<<9)
> > +#define LCD_LAYER_PLANAR_STORAGE		  (1<<14)
> > +#define LCD_LAYER_8BPP				  (0<<15)
> > +#define LCD_LAYER_16BPP				  (1<<15)
> > +#define LCD_LAYER_24BPP				  (2<<15)
> > +#define LCD_LAYER_32BPP				  (3<<15)
> > +#define LCD_LAYER_Y_ORDER			  (1<<17)
> > +#define LCD_LAYER_CRCB_ORDER			  (1<<18)
> > +#define LCD_LAYER_BGR_ORDER			  (1<<19)
> > +#define LCD_LAYER_LUT_2ENT			  (0<<20)
> > +#define LCD_LAYER_LUT_4ENT			  (1<<20)
> > +#define LCD_LAYER_LUT_16ENT			  (2<<20)
> > +#define LCD_LAYER_NO_FLIP			  (0<<22)
> > +#define LCD_LAYER_FLIP_V			  (1<<22)
> > +#define LCD_LAYER_FLIP_H			  (2<<22)
> > +#define LCD_LAYER_ROT_R90			  (3<<22)
> > +#define LCD_LAYER_ROT_L90			  (4<<22)
> > +#define LCD_LAYER_ROT_180			  (5<<22)
> > +#define LCD_LAYER_FIFO_00			  (0<<25)
> > +#define LCD_LAYER_FIFO_25			  (1<<25)
> > +#define LCD_LAYER_FIFO_50			  (2<<25)
> > +#define LCD_LAYER_FIFO_100			  (3<<25)
> > +#define LCD_LAYER_INTERLEAVE_DIS		  (0<<27)
> > +#define LCD_LAYER_INTERLEAVE_V			  (1<<27)
> > +#define LCD_LAYER_INTERLEAVE_H			  (2<<27)
> > +#define LCD_LAYER_INTERLEAVE_CH			  (3<<27)
> > +#define LCD_LAYER_INTERLEAVE_V_SUB		  (4<<27)
> > +#define LCD_LAYER_INTERLEAVE_H_SUB		  (5<<27)
> > +#define LCD_LAYER_INTERLEAVE_CH_SUB		  (6<<27)
> > +#define LCD_LAYER_INTER_POS_EVEN		  (0<<30)
> > +#define LCD_LAYER_INTER_POS_ODD			  (1<<30)
> > +
> > +#define LCD_LAYER0_COL_START		(0x4 * 0x101)
> > +#define LCD_LAYERn_COL_START(N)		(LCD_LAYER0_COL_START +
> (0x400*N))
> > +#define LCD_LAYER0_ROW_START		(0x4 * 0x102)
> > +#define LCD_LAYERn_ROW_START(N)		(LCD_LAYER0_ROW_START +
> (0x400*N))
> > +#define LCD_LAYER0_WIDTH		(0x4 * 0x103)
> > +#define LCD_LAYERn_WIDTH(N)		(LCD_LAYER0_WIDTH +
> (0x400*N))
> > +#define LCD_LAYER0_HEIGHT		(0x4 * 0x104)
> > +#define LCD_LAYERn_HEIGHT(N)		(LCD_LAYER0_HEIGHT +
> (0x400*N))
> > +#define LCD_LAYER0_SCALE_CFG		(0x4 * 0x105)
> > +#define LCD_LAYERn_SCALE_CFG(N)		(LCD_LAYER0_SCALE_CFG +
> (0x400*N))
> > +#define LCD_LAYER0_ALPHA		(0x4 * 0x106)
> > +#define LCD_LAYERn_ALPHA(N)		(LCD_LAYER0_ALPHA +
> (0x400*N))
> > +#define LCD_LAYER0_INV_COLOUR_LS	(0x4 * 0x107)
> > +#define LCD_LAYERn_INV_COLOUR_LS(N)
> 	(LCD_LAYER0_INV_COLOUR_LS + (0x400*N))
> > +#define LCD_LAYER0_INV_COLOUR_MS	(0x4 * 0x108)
> > +#define LCD_LAYERn_INV_COLOUR_MS(N)
> 	(LCD_LAYER0_INV_COLOUR_MS + (0x400*N))
> > +#define LCD_LAYER0_TRANS_COLOUR_LS	(0x4 * 0x109)
> > +#define LCD_LAYERn_TRANS_COLOUR_LS(N)
> 	(LCD_LAYER0_TRANS_COLOUR_LS + (0x400*N))
> > +#define LCD_LAYER0_TRANS_COLOUR_MS	(0x4 * 0x10a)
> > +#define LCD_LAYERn_TRANS_COLOUR_MS(N)
> 	(LCD_LAYER0_TRANS_COLOUR_MS + (0x400*N))
> > +#define LCD_LAYER0_CSC_COEFF11		(0x4 * 0x10b)
> > +#define LCD_LAYERn_CSC_COEFF11(N)	(LCD_LAYER0_CSC_COEFF11 +
> (0x400*N))
> > +#define LCD_LAYER0_CSC_COEFF12		(0x4 * 0x10c)
> > +#define LCD_LAYERn_CSC_COEFF12(N)	(LCD_LAYER0_CSC_COEFF12 +
> (0x400*N))
> > +#define LCD_LAYER0_CSC_COEFF13		(0x4 * 0x10d)
> > +#define LCD_LAYERn_CSC_COEFF13(N)	(LCD_LAYER0_CSC_COEFF13 +
> (0x400*N))
> > +#define LCD_LAYER0_CSC_COEFF21		(0x4 * 0x10e)
> > +#define LCD_LAYERn_CSC_COEFF21(N)	(LCD_LAYER0_CSC_COEFF21 +
> (0x400*N))
> > +#define LCD_LAYER0_CSC_COEFF22		(0x4 * 0x10f)
> > +#define LCD_LAYERn_CSC_COEFF22(N)	(LCD_LAYER0_CSC_COEFF22 +
> (0x400*N))
> > +#define LCD_LAYER0_CSC_COEFF23		(0x4 * 0x110)
> > +#define LCD_LAYERn_CSC_COEFF23(N)	(LCD_LAYER0_CSC_COEFF23 +
> (0x400*N))
> > +#define LCD_LAYER0_CSC_COEFF31		(0x4 * 0x111)
> > +#define LCD_LAYERn_CSC_COEFF31(N)	(LCD_LAYER0_CSC_COEFF31 +
> (0x400*N))
> > +#define LCD_LAYER0_CSC_COEFF32		(0x4 * 0x112)
> > +#define LCD_LAYERn_CSC_COEFF32(N)	  (LCD_LAYER0_CSC_COEFF32
> + (0x400*N))
> > +#define LCD_LAYER0_CSC_COEFF33		(0x4 * 0x113)
> > +#define LCD_LAYERn_CSC_COEFF33(N)	(LCD_LAYER0_CSC_COEFF33 +
> (0x400*N))
> > +#define LCD_LAYER0_CSC_OFF1		(0x4 * 0x114)
> > +#define LCD_LAYERn_CSC_OFF1(N)		(LCD_LAYER0_CSC_OFF1 +
> (0x400*N))
> > +#define LCD_LAYER0_CSC_OFF2		(0x4 * 0x115)
> > +#define LCD_LAYERn_CSC_OFF2(N)		(LCD_LAYER0_CSC_OFF2 +
> (0x400*N))
> > +#define LCD_LAYER0_CSC_OFF3		(0x4 * 0x116)
> > +#define LCD_LAYERn_CSC_OFF3(N)		(LCD_LAYER0_CSC_OFF3 +
> (0x400*N))
> > +
> > +/*  LCD controller Layer DMA config register */
> > +#define LCD_LAYER0_DMA_CFG			(0x4 * 0x117)
> > +#define LCD_LAYERn_DMA_CFG(N)
> 	(LCD_LAYER0_DMA_CFG + (0x400*N))
> > +#define LCD_DMA_LAYER_ENABLE			  (1<<0)
> > +#define LCD_DMA_LAYER_STATUS			  (1<<1)
> > +#define LCD_DMA_LAYER_AUTO_UPDATE		  (1<<2)
> > +#define LCD_DMA_LAYER_CONT_UPDATE		  (1<<3)
> > +#define LCD_DMA_LAYER_CONT_PING_PONG_UPDATE
> (LCD_DMA_LAYER_AUTO_UPDATE \
> > +						|
> LCD_DMA_LAYER_CONT_UPDATE)
> > +#define LCD_DMA_LAYER_FIFO_ADR_MODE		  (1<<4)
> > +#define LCD_DMA_LAYER_AXI_BURST_1		  (1<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_2		  (2<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_3		  (3<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_4		  (4<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_5		  (5<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_6		  (6<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_7		  (7<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_8		  (8<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_9		  (9<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_10		  (0xa<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_11		  (0xb<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_12		  (0xc<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_13		  (0xd<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_14		  (0xe<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_15		  (0xf<<5)
> > +#define LCD_DMA_LAYER_AXI_BURST_16		  (0x10<<5)
> > +#define LCD_DMA_LAYER_VSTRIDE_EN		  (1<<10)
> > +
> > +#define LCD_LAYER0_DMA_START_ADR		(0x4 * 0x118)
> > +#define LCD_LAYERn_DMA_START_ADDR(N)
> 	(LCD_LAYER0_DMA_START_ADR \
> > +						+ (0x400*N))
> > +#define LCD_LAYER0_DMA_START_SHADOW		(0x4 * 0x119)
> > +#define LCD_LAYERn_DMA_START_SHADOW(N)
> 	(LCD_LAYER0_DMA_START_SHADOW \
> > +						+ (0x400*N))
> > +#define LCD_LAYER0_DMA_LEN			(0x4 * 0x11a)
> > +#define LCD_LAYERn_DMA_LEN(N)
> 	(LCD_LAYER0_DMA_LEN + \
> > +						(0x400*N))
> > +#define LCD_LAYER0_DMA_LEN_SHADOW		(0x4 * 0x11b)
> > +#define LCD_LAYERn_DMA_LEN_SHADOW(N)
> 	(LCD_LAYER0_DMA_LEN_SHADOW + \
> > +						(0x400*N))
> > +#define LCD_LAYER0_DMA_STATUS			(0x4 * 0x11c)
> > +#define LCD_LAYERn_DMA_STATUS(N)
> 	(LCD_LAYER0_DMA_STATUS + \
> > +						(0x400*N))
> > +#define LCD_LAYER0_DMA_LINE_WIDTH		(0x4 * 0x11d)
> > +#define LCD_LAYERn_DMA_LINE_WIDTH(N)
> 	(LCD_LAYER0_DMA_LINE_WIDTH + \
> > +						(0x400*N))
> > +#define LCD_LAYER0_DMA_LINE_VSTRIDE		(0x4 * 0x11e)
> > +#define LCD_LAYERn_DMA_LINE_VSTRIDE(N)
> 	(LCD_LAYER0_DMA_LINE_VSTRIDE +\
> > +						(0x400*N))
> > +#define LCD_LAYER0_DMA_FIFO_STATUS		(0x4 * 0x11f)
> > +#define LCD_LAYERn_DMA_FIFO_STATUS(N)
> 	(LCD_LAYER0_DMA_FIFO_STATUS + \
> > +						(0x400*N))
> > +#define LCD_LAYER0_CFG2				(0x4 * 0x120)
> > +#define LCD_LAYERn_CFG2(N)			(LCD_LAYER0_CFG2 +
> (0x400*N))
> > +#define LCD_LAYER0_DMA_START_CB_ADR		(0x4 * 0x700)
> > +#define LCD_LAYERn_DMA_START_CB_ADR(N)
> 	(LCD_LAYER0_DMA_START_CB_ADR + \
> > +						(0x20*N))
> > +#define LCD_LAYER0_DMA_START_CB_SHADOW		(0x4 * 0x701)
> > +#define LCD_LAYERn_DMA_START_CB_SHADOW(N)
> 	(LCD_LAYER0_DMA_START_CB_SHADOW\
> > +						+ (0x20*N))
> > +#define LCD_LAYER0_DMA_CB_LINE_WIDTH		(0x4 * 0x702)
> > +#define LCD_LAYERn_DMA_CB_LINE_WIDTH(N)
> 	(LCD_LAYER0_DMA_CB_LINE_WIDTH +\
> > +						(0x20*N))
> > +#define LCD_LAYER0_DMA_CB_LINE_VSTRIDE		(0x4 * 0x703)
> > +#define LCD_LAYERn_DMA_CB_LINE_VSTRIDE(N)
> 	(LCD_LAYER0_DMA_CB_LINE_VSTRIDE\
> > +						+ (0x20*N))
> > +#define LCD_LAYER0_DMA_START_CR_ADR		(0x4 * 0x704)
> > +#define LCD_LAYERn_DMA_START_CR_ADR(N)
> 	(LCD_LAYER0_DMA_START_CR_ADR + \
> > +						(0x20*N))
> > +#define LCD_LAYER0_DMA_START_CR_SHADOW		(0x4 * 0x705)
> > +#define LCD_LAYERn_DMA_START_CR_SHADOW(N)	\
> > +
> 	(LCD_LAYER0_DMA_START_CR_SHADOW\
> > +						 + (0x20*N))
> > +#define LCD_LAYER0_DMA_CR_LINE_WIDTH		(0x4 * 0x706)
> > +#define LCD_LAYERn_DMA_CR_LINE_WIDTH(N)
> 	(LCD_LAYER0_DMA_CR_LINE_WIDTH +\
> > +						(0x20*N))
> > +#define LCD_LAYER0_DMA_CR_LINE_VSTRIDE		(0x4 * 0x707)
> > +#define LCD_LAYERn_DMA_CR_LINE_VSTRIDE(N)
> 	(LCD_LAYER0_DMA_CR_LINE_VSTRIDE\
> > +						+ (0x20*N))
> > +#define LCD_LAYER1_DMA_START_CB_ADR		(0x4 * 0x708)
> > +#define LCD_LAYER1_DMA_START_CB_SHADOW		(0x4 * 0x709)
> > +#define LCD_LAYER1_DMA_CB_LINE_WIDTH		(0x4 * 0x70a)
> > +#define LCD_LAYER1_DMA_CB_LINE_VSTRIDE		(0x4 * 0x70b)
> > +#define LCD_LAYER1_DMA_START_CR_ADR		(0x4 * 0x70c)
> > +#define LCD_LAYER1_DMA_START_CR_SHADOW		(0x4 * 0x70d)
> > +#define LCD_LAYER1_DMA_CR_LINE_WIDTH		(0x4 * 0x70e)
> > +#define LCD_LAYER1_DMA_CR_LINE_VSTRIDE		(0x4 * 0x70f)
> > +
> >
> +/***************************************************************
> *************
> > + *		   LCD controller output format register defines
> > +
> *****************************************************************
> ***********/
> > +#define LCD_OUT_FORMAT_CFG			(0x4 * 0x800)
> > +#define LCD_OUTF_FORMAT_RGB121212                 (0x00)
> > +#define LCD_OUTF_FORMAT_RGB101010                 (0x01)
> > +#define LCD_OUTF_FORMAT_RGB888                    (0x02)
> > +#define LCD_OUTF_FORMAT_RGB666                    (0x03)
> > +#define LCD_OUTF_FORMAT_RGB565                    (0x04)
> > +#define LCD_OUTF_FORMAT_RGB444                    (0x05)
> > +#define LCD_OUTF_FORMAT_MRGB121212                (0x10)
> > +#define LCD_OUTF_FORMAT_MRGB101010                (0x11)
> > +#define LCD_OUTF_FORMAT_MRGB888                   (0x12)
> > +#define LCD_OUTF_FORMAT_MRGB666                   (0x13)
> > +#define LCD_OUTF_FORMAT_MRGB565                   (0x14)
> > +#define LCD_OUTF_FORMAT_YCBCR420_8B_LEGACY        (0x08)
> > +#define LCD_OUTF_FORMAT_YCBCR420_8B_DCI           (0x09)
> > +#define LCD_OUTF_FORMAT_YCBCR420_8B               (0x0A)
> > +#define LCD_OUTF_FORMAT_YCBCR420_10B              (0x0B)
> > +#define LCD_OUTF_FORMAT_YCBCR420_12B              (0x0C)
> > +#define LCD_OUTF_FORMAT_YCBCR422_8B               (0x0D)
> > +#define LCD_OUTF_FORMAT_YCBCR422_10B              (0x0E)
> > +#define LCD_OUTF_FORMAT_YCBCR444                  (0x0F)
> > +#define LCD_OUTF_FORMAT_MYCBCR420_8B_LEGACY       (0x18)
> > +#define LCD_OUTF_FORMAT_MYCBCR420_8B_DCI          (0x19)
> > +#define LCD_OUTF_FORMAT_MYCBCR420_8B              (0x1A)
> > +#define LCD_OUTF_FORMAT_MYCBCR420_10B             (0x1B)
> > +#define LCD_OUTF_FORMAT_MYCBCR420_12B             (0x1C)
> > +#define LCD_OUTF_FORMAT_MYCBCR422_8B              (0x1D)
> > +#define LCD_OUTF_FORMAT_MYCBCR422_10B             (0x1E)
> > +#define LCD_OUTF_FORMAT_MYCBCR444                 (0x1F)
> > +#define LCD_OUTF_BGR_ORDER			  (1 << 5)
> > +#define LCD_OUTF_Y_ORDER			  (1 << 6)
> > +#define LCD_OUTF_CRCB_ORDER			  (1 << 7)
> > +#define LCD_OUTF_SYNC_MODE			  (1 << 11)
> > +#define LCD_OUTF_RGB_CONV_MODE			  (1 << 14)
> > +#define LCD_OUTF_MIPI_RGB_MODE			  (1 << 18)
> > +
> > +#define LCD_HSYNC_WIDTH				(0x4 * 0x801)
> > +#define LCD_H_BACKPORCH				(0x4 * 0x802)
> > +#define LCD_H_ACTIVEWIDTH			(0x4 * 0x803)
> > +#define LCD_H_FRONTPORCH			(0x4 * 0x804)
> > +#define LCD_VSYNC_WIDTH				(0x4 * 0x805)
> > +#define LCD_V_BACKPORCH				(0x4 * 0x806)
> > +#define LCD_V_ACTIVEHEIGHT			(0x4 * 0x807)
> > +#define LCD_V_FRONTPORCH			(0x4 * 0x808)
> > +#define LCD_VSYNC_START				(0x4 * 0x809)
> > +#define LCD_VSYNC_END				(0x4 * 0x80a)
> > +#define LCD_V_BACKPORCH_EVEN			(0x4 * 0x80b)
> > +#define LCD_VSYNC_WIDTH_EVEN			(0x4 * 0x80c)
> > +#define LCD_V_ACTIVEHEIGHT_EVEN			(0x4 * 0x80d)
> > +#define LCD_V_FRONTPORCH_EVEN			(0x4 * 0x80e)
> > +#define LCD_VSYNC_START_EVEN			(0x4 * 0x80f)
> > +#define LCD_VSYNC_END_EVEN			(0x4 * 0x810)
> > +#define LCD_TIMING_GEN_TRIG			(0x4 * 0x811)
> > +#define LCD_PWM0_CTRL				(0x4 * 0x812)
> > +#define LCD_PWM0_RPT_LEADIN			(0x4 * 0x813)
> > +#define LCD_PWM0_HIGH_LOW			(0x4 * 0x814)
> > +#define LCD_PWM1_CTRL				(0x4 * 0x815)
> > +#define LCD_PWM1_RPT_LEADIN			(0x4 * 0x816)
> > +#define LCD_PWM1_HIGH_LOW			(0x4 * 0x817)
> > +#define LCD_PWM2_CTRL				(0x4 * 0x818)
> > +#define LCD_PWM2_RPT_LEADIN			(0x4 * 0x819)
> > +#define LCD_PWM2_HIGH_LOW			(0x4 * 0x81a)
> > +#define LCD_VIDEO0_DMA0_BYTES			(0x4 * 0xb00)
> > +#define LCD_VIDEO0_DMA0_STATE			(0x4 * 0xb01)
> > +#define LCD_DMA_STATE_ACTIVE			  (1 << 3)
> > +#define LCD_VIDEO0_DMA1_BYTES			(0x4 * 0xb02)
> > +#define LCD_VIDEO0_DMA1_STATE			(0x4 * 0xb03)
> > +#define LCD_VIDEO0_DMA2_BYTES			(0x4 * 0xb04)
> > +#define LCD_VIDEO0_DMA2_STATE			(0x4 * 0xb05)
> > +#define LCD_VIDEO1_DMA0_BYTES			(0x4 * 0xb06)
> > +#define LCD_VIDEO1_DMA0_STATE			(0x4 * 0xb07)
> > +#define LCD_VIDEO1_DMA1_BYTES			(0x4 * 0xb08)
> > +#define LCD_VIDEO1_DMA1_STATE			(0x4 * 0xb09)
> > +#define LCD_VIDEO1_DMA2_BYTES			(0x4 * 0xb0a)
> > +#define LCD_VIDEO1_DMA2_STATE			(0x4 * 0xb0b)
> > +#define LCD_GRAPHIC0_DMA_BYTES			(0x4 * 0xb0c)
> > +#define LCD_GRAPHIC0_DMA_STATE			(0x4 * 0xb0d)
> > +#define LCD_GRAPHIC1_DMA_BYTES			(0x4 * 0xb0e)
> > +#define LCD_GRAPHIC1_DMA_STATE			(0x4 * 0xb0f)
> > +
> >
> +/***************************************************************
> ************
> > + *		   MIPI controller control register defines
> > +
> ***********************************************i*****************
> ***********/
> > +#define MIPI0_HS_BASE_ADDR			(MIPI_BASE_ADDR +
> 0x400)
> > +#define HS_OFFSET(M)				((M + 1) * 0x400)
> > +
> > +#define MIPI_TX_HS_CTRL				(0x0)
> > +#define   MIPI_TXm_HS_CTRL(M)			(MIPI_TX_HS_CTRL +
> HS_OFFSET(M))
> > +#define   HS_CTRL_EN				(1 << 0)
> > +/*1:CSI 0:DSI */
> > +#define   HS_CTRL_CSIDSIN			(1 << 2)
> > +/*1:LCD, 0:DMA */
> > +#define   TX_SOURCE				(1 << 3)
> > +#define   ACTIVE_LANES(n)			((n) << 4)
> > +#define   LCD_VC(ch)				((ch) << 8)
> > +#define   DSI_EOTP_EN				(1 << 11)
> > +#define   DSI_CMD_HFP_EN			(1 << 12)
> > +#define   CRC_EN				(1 << 14)
> > +#define   HSEXIT_CNT(n)				((n) << 16)
> > +#define   HSCLKIDLE_CNT				(1 << 24)
> > +#define MIPI_TX_HS_SYNC_CFG			(0x8)
> > +#define   MIPI_TXm_HS_SYNC_CFG(M)
> 	(MIPI_TX_HS_SYNC_CFG \
> > +						+ HS_OFFSET(M))
> > +#define   LINE_SYNC_PKT_ENABLE			(1 << 0)
> > +#define   FRAME_COUNTER_ACTIVE			(1 << 1)
> > +#define   LINE_COUNTER_ACTIVE			(1 << 2)
> > +#define   DSI_V_BLANKING			(1 << 4)
> > +#define   DSI_HSA_BLANKING			(1 << 5)
> > +#define   DSI_HBP_BLANKING			(1 << 6)
> > +#define   DSI_HFP_BLANKING			(1 << 7)
> > +#define   DSI_SYNC_PULSE_EVENTN			(1 << 8)
> > +#define   DSI_LPM_FIRST_VSA_LINE		(1 << 9)
> > +#define   DSI_LPM_LAST_VFP_LINE			(1 << 10)
> > +#define   WAIT_ALL_SECT				(1 << 11)
> > +#define   WAIT_TRIG_POS				(1 << 15)
> > +#define   ALWAYS_USE_HACT(f)			((f) << 19)
> > +#define   FRAME_GEN_EN(f)			((f) << 23)
> > +#define   HACT_WAIT_STOP(f)			((f) << 28)
> > +#define MIPI_TX0_HS_FG0_SECT0_PH		(0x40)
> > +#define   MIPI_TXm_HS_FGn_SECTo_PH(M, N, O)
> 	(MIPI_TX0_HS_FG0_SECT0_PH + \
> > +						HS_OFFSET(M) + (0x2C*N) +
> (8*O))
> > +#define   MIPI_TX_SECT_WC_MASK			(0xffff)
> > +#define	  MIPI_TX_SECT_VC_MASK			(3)
> > +#define   MIPI_TX_SECT_VC_SHIFT			(22)
> > +#define   MIPI_TX_SECT_DT_MASK			(0x3f)
> > +#define   MIPI_TX_SECT_DT_SHIFT			(16)
> > +#define   MIPI_TX_SECT_DM_MASK			(3)
> > +#define   MIPI_TX_SECT_DM_SHIFT			(24)
> > +#define   MIPI_TX_SECT_DMA_PACKED		(1<<26)
> > +#define MIPI_TX_HS_FG0_SECT_UNPACKED_BYTES0	(0x60)
> > +#define MIPI_TX_HS_FG0_SECT_UNPACKED_BYTES1	(0x64)
> > +#define   MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(M, N)	\
> > +
> 	(MIPI_TX_HS_FG0_SECT_UNPACKED_BYTES0 \
> > +					+ HS_OFFSET(M) + (0x2C*N))
> > +#define MIPI_TX_HS_FG0_SECT0_LINE_CFG		(0x44)
> > +#define   MIPI_TXm_HS_FGn_SECTo_LINE_CFG(M, N, O)	\
> > +				(MIPI_TX_HS_FG0_SECT0_LINE_CFG +
> HS_OFFSET(M) \
> > +				+ (0x2C*N) + (8*O))
> > +
> > +#define MIPI_TX_HS_FG0_NUM_LINES		(0x68)
> > +#define   MIPI_TXm_HS_FGn_NUM_LINES(M, N)	\
> > +				(MIPI_TX_HS_FG0_NUM_LINES +
> HS_OFFSET(M) \
> > +				+ (0x2C*N))
> > +#define MIPI_TX_HS_VSYNC_WIDTHS0		(0x104)
> > +#define   MIPI_TXm_HS_VSYNC_WIDTHn(M, N)		\
> > +				(MIPI_TX_HS_VSYNC_WIDTHS0 +
> HS_OFFSET(M) \
> > +				+ (0x4*N))
> > +#define MIPI_TX_HS_V_BACKPORCHES0		(0x16c)
> > +#define   MIPI_TXm_HS_V_BACKPORCHESn(M, N)	\
> > +				(MIPI_TX_HS_V_BACKPORCHES0 +
> HS_OFFSET(M) \
> > +				+ (0x4*N))
> > +#define MIPI_TX_HS_V_FRONTPORCHES0		(0x174)
> > +#define   MIPI_TXm_HS_V_FRONTPORCHESn(M, N)	\
> > +				(MIPI_TX_HS_V_FRONTPORCHES0 +
> HS_OFFSET(M) \
> > +				+ (0x4*N))
> > +#define MIPI_TX_HS_V_ACTIVE0			(0x17c)
> > +#define   MIPI_TXm_HS_V_ACTIVEn(M, N)		\
> > +				(MIPI_TX_HS_V_ACTIVE0 + HS_OFFSET(M) \
> > +				+ (0x4*N))
> > +#define MIPI_TX_HS_HSYNC_WIDTH0			(0x10c)
> > +#define   MIPI_TXm_HS_HSYNC_WIDTHn(M, N)		\
> > +				(MIPI_TX_HS_HSYNC_WIDTH0 + HS_OFFSET(M)
> \
> > +				+ (0x4*N))
> > +#define MIPI_TX_HS_H_BACKPORCH0			(0x11c)
> > +#define   MIPI_TXm_HS_H_BACKPORCHn(M, N)		\
> > +				(MIPI_TX_HS_H_BACKPORCH0 + HS_OFFSET(M)
> \
> > +				+ (0x4*N))
> > +#define MIPI_TX_HS_H_FRONTPORCH0		(0x12c)
> > +#define   MIPI_TXm_HS_H_FRONTPORCHn(M, N)	\
> > +				(MIPI_TX_HS_H_FRONTPORCH0 +
> HS_OFFSET(M) \
> > +				+ (0x4*N))
> > +#define MIPI_TX_HS_H_ACTIVE0			(0x184)
> > +#define   MIPI_TXm_HS_H_ACTIVEn(M, N)		\
> > +				(MIPI_TX_HS_H_ACTIVE0 + HS_OFFSET(M) \
> > +				+ (0x4*N))
> > +#define MIPI_TX_HS_LLP_HSYNC_WIDTH0		(0x13c)
> > +#define   MIPI_TXm_HS_LLP_HSYNC_WIDTHn(M, N)	\
> > +				(MIPI_TX_HS_LLP_HSYNC_WIDTH0 +
> HS_OFFSET(M) \
> > +				+ (0x4*N))
> > +#define MIPI_TX_HS_LLP_H_BACKPORCH0		(0x14c)
> > +#define   MIPI_TXm_HS_LLP_H_BACKPORCHn(M, N)	\
> > +				(MIPI_TX_HS_LLP_H_BACKPORCH0 +
> HS_OFFSET(M) \
> > +				+ (0x4*N))
> > +#define MIPI_TX_HS_LLP_H_FRONTPORCH0		(0x15c)
> > +#define   MIPI_TXm_HS_LLP_H_FRONTPORCHn(M, N)	\
> > +				(MIPI_TX_HS_LLP_H_FRONTPORCH0 +
> HS_OFFSET(M) \
> > +				+ (0x4*N))
> > +
> > +#define MIPI_TX_HS_MC_FIFO_CTRL_EN		(0x194)
> > +#define   MIPI_TXm_HS_MC_FIFO_CTRL_EN(M)	\
> > +				(MIPI_TX_HS_MC_FIFO_CTRL_EN +
> HS_OFFSET(M))
> > +
> > +#define MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0		(0x198)
> > +#define MIPI_TX_HS_MC_FIFO_CHAN_ALLOC1		(0x19c)
> > +#define   MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(M, N)	\
> > +			(MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0 +
> HS_OFFSET(M) \
> > +			+ (0x4*N))
> > +#define   SET_MC_FIFO_CHAN_ALLOC(dev, ctrl, vc, sz)	\
> > +		kmb_write_bits_mipi(dev, \
> > +				MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(ctrl, \
> > +				vc/2), (vc % 2)*16, 16, sz)
> > +#define MIPI_TX_HS_MC_FIFO_RTHRESHOLD0		(0x1a0)
> > +#define MIPI_TX_HS_MC_FIFO_RTHRESHOLD1		(0x1a4)
> > +#define   MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(M, N)	\
> > +				(MIPI_TX_HS_MC_FIFO_RTHRESHOLD0 +
> HS_OFFSET(M) \
> > +				+ (0x4*N))
> > +#define   SET_MC_FIFO_RTHRESHOLD(dev, ctrl, vc, th)	\
> > +	kmb_write_bits_mipi(dev, MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(ctrl,
> vc/2), \
> > +			(vc % 2)*16, 16, th)
> > +#define MIPI_TX_HS_DMA_CFG			(0x1a8)
> > +#define MIPI_TX_HS_DMA_START_ADR_CHAN0		(0x1ac)
> > +#define MIPI_TX_HS_DMA_LEN_CHAN0		(0x1b4)
> > +
> > +/* MIPI IRQ */
> > +#define MIPI_CTRL_IRQ_STATUS0				(0x00)
> > +#define   MIPI_DPHY_ERR_IRQ				1
> > +#define   MIPI_DPHY_ERR_MASK				0x7FE	/*bits
> 1-10 */
> > +#define   MIPI_HS_IRQ					13
> > +/*bits 13-22 */
> > +#define   MIPI_HS_IRQ_MASK				0x7FE000
> > +#define   MIPI_LP_EVENT_IRQ				25
> > +#define   MIPI_GET_IRQ_STAT0(dev)		kmb_read_mipi(dev, \
> > +						MIPI_CTRL_IRQ_STATUS0)
> > +#define MIPI_CTRL_IRQ_STATUS1				(0x04)
> > +#define   MIPI_HS_RX_EVENT_IRQ				0
> > +#define   MIPI_GET_IRQ_STAT1(dev)		kmb_read_mipi(dev, \
> > +						MIPI_CTRL_IRQ_STATUS1)
> > +#define MIPI_CTRL_IRQ_ENABLE0				(0x08)
> > +#define   SET_MIPI_CTRL_IRQ_ENABLE0(dev, M, N)	kmb_set_bit_mipi(dev,
> \
> > +						MIPI_CTRL_IRQ_ENABLE0,
> M+N)
> > +#define   MIPI_GET_IRQ_ENABLED0(dev)		kmb_read_mipi(dev, \
> > +						MIPI_CTRL_IRQ_ENABLE0)
> > +#define MIPI_CTRL_IRQ_ENABLE1				(0x0c)
> > +#define   MIPI_GET_IRQ_ENABLED1(dev)		kmb_read_mipi(dev, \
> > +						MIPI_CTRL_IRQ_ENABLE1)
> > +#define MIPI_CTRL_IRQ_CLEAR0				(0x010)
> > +#define   SET_MIPI_CTRL_IRQ_CLEAR0(dev, M, N)		\
> > +		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR0, M+N)
> > +#define MIPI_CTRL_IRQ_CLEAR1				(0x014)
> > +#define   SET_MIPI_CTRL_IRQ_CLEAR1(dev, M, N)		\
> > +		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR1, M+N)
> > +#define MIPI_CTRL_DIG_LOOPBACK				(0x018)
> > +#define MIPI_TX_HS_IRQ_STATUS				(0x01c)
> > +#define   MIPI_TX_HS_IRQ_STATUSm(M)
> 	(MIPI_TX_HS_IRQ_STATUS + \
> > +						HS_OFFSET(M))
> > +#define   GET_MIPI_TX_HS_IRQ_STATUS(dev, M)	kmb_read_mipi(dev, \
> > +
> 	MIPI_TX_HS_IRQ_STATUSm(M))
> > +#define   MIPI_TX_HS_IRQ_LINE_COMPARE			(1<<1)
> > +#define   MIPI_TX_HS_IRQ_FRAME_DONE_0			(1<<2)
> > +#define   MIPI_TX_HS_IRQ_FRAME_DONE_1			(1<<3)
> > +#define   MIPI_TX_HS_IRQ_FRAME_DONE_2			(1<<4)
> > +#define   MIPI_TX_HS_IRQ_FRAME_DONE_3			(1<<5)
> > +#define   MIPI_TX_HS_IRQ_DMA_DONE_0			(1<<6)
> > +#define   MIPI_TX_HS_IRQ_DMA_IDLE_0			(1<<7)
> > +#define   MIPI_TX_HS_IRQ_DMA_DONE_1			(1<<8)
> > +#define   MIPI_TX_HS_IRQ_DMA_IDLE_1			(1<<9)
> > +#define   MIPI_TX_HS_IRQ_DMA_DONE_2			(1<<10)
> > +#define   MIPI_TX_HS_IRQ_DMA_IDLE_2			(1<<11)
> > +#define   MIPI_TX_HS_IRQ_DMA_DONE_3			(1<<12)
> > +#define   MIPI_TX_HS_IRQ_DMA_IDLE_3			(1<<13)
> > +#define   MIPI_TX_HS_IRQ_MC_FIFO_UNDERFLOW		(1<<14)
> > +#define   MIPI_TX_HS_IRQ_MC_FIFO_OVERFLOW		(1<<15)
> > +#define   MIPI_TX_HS_IRQ_LLP_FIFO_EMPTY			(1<<16)
> > +#define   MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_FULL
> 	(1<<17)
> > +#define   MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_ERROR	(1<<18)
> > +#define   MIPI_TX_HS_IRQ_LLP_WORD_COUNT_ERROR
> 	(1<<20)
> > +#define   MIPI_TX_HS_IRQ_FRAME_DONE			\
> > +				(MIPI_TX_HS_IRQ_FRAME_DONE_0 | \
> > +				MIPI_TX_HS_IRQ_FRAME_DONE_1 | \
> > +				MIPI_TX_HS_IRQ_FRAME_DONE_2 | \
> > +				MIPI_TX_HS_IRQ_FRAME_DONE_3)
> > +
> > +#define MIPI_TX_HS_IRQ_DMA_DONE				\
> > +				(MIPI_TX_HS_IRQ_DMA_DONE_0 | \
> > +				MIPI_TX_HS_IRQ_DMA_DONE_1 | \
> > +				MIPI_TX_HS_IRQ_DMA_DONE_2 | \
> > +				MIPI_TX_HS_IRQ_DMA_DONE_3)
> > +
> > +#define MIPI_TX_HS_IRQ_DMA_IDLE				\
> > +				(MIPI_TX_HS_IRQ_DMA_IDLE_0 | \
> > +				MIPI_TX_HS_IRQ_DMA_IDLE_1 | \
> > +				MIPI_TX_HS_IRQ_DMA_IDLE_2 | \
> > +				MIPI_TX_HS_IRQ_DMA_IDLE_3)
> > +
> > +#define MIPI_TX_HS_IRQ_ERROR				\
> > +				(MIPI_TX_HS_IRQ_MC_FIFO_UNDERFLOW | \
> > +				MIPI_TX_HS_IRQ_MC_FIFO_OVERFLOW | \
> > +				MIPI_TX_HS_IRQ_LLP_FIFO_EMPTY | \
> > +				MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_FULL
> | \
> > +
> 	MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_ERROR | \
> > +				MIPI_TX_HS_IRQ_LLP_WORD_COUNT_ERROR)
> > +
> > +#define MIPI_TX_HS_IRQ_ALL				\
> > +				(MIPI_TX_HS_IRQ_FRAME_DONE | \
> > +				MIPI_TX_HS_IRQ_DMA_DONE | \
> > +				MIPI_TX_HS_IRQ_DMA_IDLE | \
> > +				MIPI_TX_HS_IRQ_LINE_COMPARE | \
> > +				MIPI_TX_HS_IRQ_ERROR)
> > +
> > +#define MIPI_TX_HS_IRQ_ENABLE				(0x020)
> > +#define   SET_HS_IRQ_ENABLE(dev, M, val)	kmb_set_bitmask_mipi(dev, \
> > +						MIPI_TX_HS_IRQ_ENABLE \
> > +						+ HS_OFFSET(M), val)
> > +#define   CLR_HS_IRQ_ENABLE(dev, M, val)	kmb_clr_bitmask_mipi(dev, \
> > +						MIPI_TX_HS_IRQ_ENABLE \
> > +						+ HS_OFFSET(M), val)
> > +#define	  GET_HS_IRQ_ENABLE(dev, M)		kmb_read_mipi(dev, \
> > +						MIPI_TX_HS_IRQ_ENABLE \
> > +						+ HS_OFFSET(M))
> > +#define MIPI_TX_HS_IRQ_CLEAR				(0x024)
> > +#define   SET_MIPI_TX_HS_IRQ_CLEAR(dev, M, val)		\
> > +			kmb_set_bitmask_mipi(dev, \
> > +			MIPI_TX_HS_IRQ_CLEAR \
> > +			+ HS_OFFSET(M), val)
> > +
> > +/* MIPI Test Pattern Generation */
> > +#define MIPI_TX_HS_TEST_PAT_CTRL			(0x230)
> > +#define   MIPI_TXm_HS_TEST_PAT_CTRL(M)			\
> > +				(MIPI_TX_HS_TEST_PAT_CTRL +
> HS_OFFSET(M))
> > +#define   TP_EN_VCm(M)					(1 << ((M) *
> 0x04))
> > +#define   TP_SEL_VCm(M, N)				\
> > +				(N << (((M) * 0x04) + 1))
> > +#define   TP_STRIPE_WIDTH(M)				((M) << 16)
> > +#define MIPI_TX_HS_TEST_PAT_COLOR0			(0x234)
> > +#define   MIPI_TXm_HS_TEST_PAT_COLOR0(M)		\
> > +				(MIPI_TX_HS_TEST_PAT_COLOR0 +
> HS_OFFSET(M))
> > +#define MIPI_TX_HS_TEST_PAT_COLOR1			(0x238)
> > +#define   MIPI_TXm_HS_TEST_PAT_COLOR1(M)		\
> > +				(MIPI_TX_HS_TEST_PAT_COLOR1 +
> HS_OFFSET(M))
> > +
> > +/* D-PHY regs */
> > +#define DPHY_ENABLE				(0x100)
> > +#define DPHY_INIT_CTRL0				(0x104)
> > +#define   SHUTDOWNZ				0
> > +#define   RESETZ				12
> > +#define DPHY_INIT_CTRL1				(0x108)
> > +#define   PLL_CLKSEL_0				18
> > +#define   PLL_SHADOW_CTRL			16
> > +#define DPHY_INIT_CTRL2				(0x10c)
> > +#define   SET_DPHY_INIT_CTRL0(dev, dphy, offset)	\
> > +			kmb_set_bit_mipi(dev, DPHY_INIT_CTRL0,
> (dphy+offset))
> > +#define   CLR_DPHY_INIT_CTRL0(dev, dphy, offset)	\
> > +			kmb_clr_bit_mipi(dev, DPHY_INIT_CTRL0,
> (dphy+offset))
> > +#define DPHY_INIT_CTRL2				(0x10c)
> > +#define DPHY_PLL_OBS0				(0x110)
> > +#define DPHY_PLL_OBS1				(0x114)
> > +#define DPHY_PLL_OBS2				(0x118)
> > +#define DPHY_FREQ_CTRL0_3			(0x11c)
> > +#define DPHY_FREQ_CTRL4_7			(0x120)
> > +#define   SET_DPHY_FREQ_CTRL0_3(dev, dphy, val)	\
> > +			kmb_write_bits_mipi(dev, DPHY_FREQ_CTRL0_3 \
> > +			+ ((dphy/4)*4), (dphy % 4) * 8, 6, val)
> > +
> > +#define DPHY_FORCE_CTRL0			(0x128)
> > +#define DPHY_FORCE_CTRL1			(0x12C)
> > +#define MIPI_DPHY_STAT0_3			(0x134)
> > +#define MIPI_DPHY_STAT4_7			(0x138)
> > +#define	  GET_STOPSTATE_DATA(dev, dphy)		\
> > +			(((kmb_read_mipi(dev, MIPI_DPHY_STAT0_3 +
> (dphy/4)*4)) \
> > +					>> (((dphy % 4)*8)+4)) & 0x03)
> > +
> > +#define MIPI_DPHY_ERR_STAT6_7			(0x14C)
> > +
> > +#define DPHY_TEST_CTRL0				(0x154)
> > +#define   SET_DPHY_TEST_CTRL0(dev, dphy)		\
> > +			kmb_set_bit_mipi(dev, DPHY_TEST_CTRL0, (dphy))
> > +#define   CLR_DPHY_TEST_CTRL0(dev, dphy)		\
> > +			kmb_clr_bit_mipi(dev, DPHY_TEST_CTRL0, \
> > +						(dphy))
> > +#define DPHY_TEST_CTRL1				(0x158)
> > +#define   SET_DPHY_TEST_CTRL1_CLK(dev, dphy)	\
> > +			kmb_set_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy))
> > +#define   CLR_DPHY_TEST_CTRL1_CLK(dev, dphy)	\
> > +			kmb_clr_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy))
> > +#define   SET_DPHY_TEST_CTRL1_EN(dev, dphy)	\
> > +			kmb_set_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy+12))
> > +#define   CLR_DPHY_TEST_CTRL1_EN(dev, dphy)	\
> > +			kmb_clr_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy+12))
> > +#define DPHY_TEST_DIN0_3			(0x15c)
> > +#define   SET_TEST_DIN0_3(dev, dphy, val)		\
> > +			kmb_write_mipi(dev, DPHY_TEST_DIN0_3 + \
> > +			4, ((val) << (((dphy)%4)*8)))
> > +#define DPHY_TEST_DOUT0_3			(0x168)
> > +#define   GET_TEST_DOUT0_3(dev, dphy)		\
> > +			(kmb_read_mipi(dev, DPHY_TEST_DOUT0_3) \
> > +			>> (((dphy)%4)*8) & 0xff)
> > +#define DPHY_TEST_DOUT4_7			(0x16C)
> > +#define   GET_TEST_DOUT4_7(dev, dphy)		\
> > +			(kmb_read_mipi(dev, DPHY_TEST_DOUT4_7) \
> > +			>> (((dphy)%4)*8) & 0xff)
> > +#define DPHY_TEST_DOUT8_9			(0x170)
> > +#define DPHY_TEST_DIN4_7			(0x160)
> > +#define DPHY_TEST_DIN8_9			(0x164)
> > +#define DPHY_PLL_LOCK				(0x188)
> > +#define   GET_PLL_LOCK(dev, dphy)		\
> > +			(kmb_read_mipi(dev, DPHY_PLL_LOCK) \
> > +			& (1 << (dphy - MIPI_DPHY6)))
> > +#define DPHY_CFG_CLK_EN				(0x18c)
> > +
> > +#define MSS_MIPI_CIF_CFG			(0x00)
> > +#define MSS_LCD_MIPI_CFG			(0x04)
> > +#define MSS_CAM_CLK_CTRL			(0x10)
> > +#define MSS_LOOPBACK_CFG			(0x0C)
> > +#define   LCD					(1<<1)
> > +#define   MIPI_COMMON				(1<<2)
> > +#define   MIPI_TX0				(1<<9)
> > +#define MSS_CAM_RSTN_CTRL			(0x14)
> > +#define MSS_CAM_RSTN_SET			(0x20)
> > +#define MSS_CAM_RSTN_CLR			(0x24)
> > +
> > +#define MSSCPU_CPR_CLK_EN			(0x0)
> > +#define MSSCPU_CPR_RST_EN			(0x10)
> > +#define BIT_MASK_16				(0xffff)
> > +/*icam lcd qos */
> > +#define LCD_QOS_PRORITY				(0x8)
> > +#define LCD_QOS_MODE				(0xC)
> > +#define LCD_QOS_BW				(0x10)
> > +#endif /* __KMB_REGS_H__ */
> > --
> > 2.7.4
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
