Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17307280625
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 20:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF066E8BD;
	Thu,  1 Oct 2020 18:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890B56E8D3
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 18:02:20 +0000 (UTC)
IronPort-SDR: V9XtND9osSB1vIjlmDgHd7XbgLuJsHV5ZqbgXBHgVrXGZADBEO9F48ELBXARrHgHQKsfdlNIpd
 KUuMduhUTkEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="160131445"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; 
 d="txt'?scan'208";a="160131445"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 11:02:11 -0700
IronPort-SDR: +o7prRt8/NlnQc+6pWr2d1Uy38U6ADbgLJnMqQO9uim34hFs3SonbtJD+FGarSmUs1zO35Eazv
 DWfvSpM1l2wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; 
 d="txt'?scan'208";a="346165222"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2020 11:02:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 11:02:11 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 11:02:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 11:02:10 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.56) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 11:02:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pa0iwro3cVCK/YYrPWLo2yOADuPS0rLJzkDLhj39T4hsUZac5IExv6Av0jdYsLYPXjNjUVVaz44hoXcDApryMm1Io967k0TXrX85D0VSxM5NSfBKXWl063h51ZARjqsMWE/h7x+lBEuH7Y+DQbkKvmKMHkkQe4fWu0Yp2VXy8Lm4Dj9WG9WLDbdyDP2vUJKHzDfAF3g3wk2v0mE+vWDapFtWewu+fXBCC41H5UMDhT8Xktl03QdgYSxFN0zTU31aLrMHBQOiBDq7GeGM4U7FR9KhlNeLPOoOq8C1L4QniCrsZZ/zm4u9GHZVemtLqhoJ0UYxtzsuS3HzAoIVPo+uOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKDu2v3Jv22qEU+YcAAueGKLhSv5unbCfE0+A92Er2I=;
 b=SblGNHsJJmc1uDI/iRJ7/7Cb6r5BHq3vHsuzp1BxdZVgNbeyrSsTHfpuXiOHeVFOuXsJ/jOl8DzYMM3wzWZ218HgYV2Cisjc7sQvRfAy1gWSc0yb4ivAvKtqCMYwfTvj5gx/ehi3R5RBYeObhMpBtDVHbGimVmcehYDjoRl8j2rt8hA5kaJoASkmYezNK5RkI/LvO0vCRJdaEZIxxCTpoAzF8NE0tqMvF1u1L7HhbtL/Ep8+JWj0bOkx7lUCD07pmp8V+XJggnyvRNynJzucQQXOiPP8WV6U0TYYDz1CO6wCEBm8Zb/YllPWLtrCrTzKzgr1IxPzBbM3sCwmAQG/ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKDu2v3Jv22qEU+YcAAueGKLhSv5unbCfE0+A92Er2I=;
 b=Dn3h2ZdQjV/ctLfpkjblCm+7uMiwWiGpR5LeALqPE57JlFsTvMx7hlTtXhD2LreB612qLmPm21+Rg9WXar+spkZ6TacSuO/0+PBGU/TwHyMN4S2/dvbTa1YfKOVPj0g7WQP9phWzbpvbm5PZa+/1II+oG0h55Dbow0oOwIJ5IGw=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Thu, 1 Oct
 2020 18:02:05 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::1d4e:2269:63d7:f2d6]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::1d4e:2269:63d7:f2d6%6]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 18:02:05 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
Thread-Topic: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
Thread-Index: AQHWf9HFmAm5AcKirkeVCqcGep3UralhmbMAgCGUtgA=
Date: Thu, 1 Oct 2020 18:02:05 +0000
Message-ID: <BY5PR11MB41825BA878A60FBCFF8655E78C300@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
 <1598904172-30865-3-git-send-email-anitha.chrisanthus@intel.com>
 <20200910083042.GH438822@phenom.ffwll.local>
In-Reply-To: <20200910083042.GH438822@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bccec7e4-0f68-4e40-273c-08d866341b3f
x-ms-traffictypediagnostic: BY5PR11MB4243:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB42433C027695EEBA7B91F1198C300@BY5PR11MB4243.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A5fkrySjWKHnFc0O5jyM30q75vJF+CD04UKMmWm87jHFtU2TMxNoyBo799CuegtHppoWMaq05XJzhF96D+dXkcRpLCi5hutIyjIvJ6b6ZfXE0Dg2+TVT95yo5ruhFPHkN/bVXY7hNB7ajieZIylCtcyG9pzP58q30oohy++d06cvAAWMbSh8cix3QkPUgCtqcxMuQCvZX3YD4zoqGJAsgknr/cVpEN34UTxZRSNWMzI671ZG3Zp/wqlYEbUD/eoBnYvJ4J+oDI2nWW1aBMopBJzfpGxsAH3NKBAk9E3VgMnDDGBr+QHSg+JAUalfxu1e3ZEdPGHgq69nxQq8NEo8y2sWGEg5nyL+UPSdoJfHPIaaUxUkNNaUvXVW/TE0+A7AWxOudGQtOi3QjMpeuWmb9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(4326008)(9686003)(2906002)(83380400001)(83080400001)(107886003)(55016002)(99936003)(8936002)(478600001)(66616009)(76116006)(8676002)(966005)(86362001)(54906003)(316002)(52536014)(6916009)(7696005)(26005)(6506007)(186003)(33656002)(66946007)(71200400001)(5660300002)(53546011)(64756008)(30864003)(66446008)(66556008)(66476007)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /1wVFN9dq7q+hSZh2DstTImjfdoy3vuB/gvWe0inMHJ/3Np/NMGRoerKCJj/Cp6llEw7t1+0Ql26YtA4Ig1iXI7ObU3GaRoAYoxH+DqHx2aQ3QSaVN3vanZenRME5nKRh4XGimsW4FOXJvmmqWNQKypD+U+RcJntqpgP5mvlmQicofXzwaHgbUTElI2ecIaKeQ4l8fOIgZMJMQCoFL3fGEnSGDsCSFcC7uW5+N3n0RNQyOc3DDLNP0pL+vhG6PYdqKI4x1x8YJa3irLZL2VkLfKZHWqYVMqAOa9q2VfeFSIuR4DJxa4cw2CV0LSzLkLKdfcOmRC4IH1h4r5UfRe+bWH/em7TKaGrtZAfrTtSWRGPzKqW0+/XF1Gj/WMvJluTbV/rG83TqtWXjhiXvjyPg8WhtWSsWthowtuhoEYkelYGYb1wtf+4Da3c49DiwP7LBI0VSL74eMDAOlzY/3gp6bLKhKQHdR3FX1UiCjO+Bjuc5j7D35fL+J2uId8GVpePqYu4tbOmN7J44qeGpWfJNbPgC+ivF4L1iccLmFauWDTM2ncxqpAoUGKF399JtUrJIJAdHL+AsUtTKVrpgkX0Wmg8uWtj93D66rFROJ2s+fg+IL6a0GEaN/7V1ELnTMJzdfakMSasVPukNwj/y6LqPg==
Content-Type: multipart/mixed;
 boundary="_002_BY5PR11MB41825BA878A60FBCFF8655E78C300BY5PR11MB4182namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccec7e4-0f68-4e40-273c-08d866341b3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 18:02:05.2152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: THy4Y4IwO07v92JwjzHCVRVsMsbCOAC1oaFcIY02w0MZ27Nk6+tBIYvSS5iYrmbunFYIes5EUvlIzFdT+dT0a+mu8Z4kebRimVzFhPOn9cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4243
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_002_BY5PR11MB41825BA878A60FBCFF8655E78C300BY5PR11MB4182namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,
I was finally able to test the driver with 5.9 kernel with minor changes in=
 the driver.=20
Ran the igt_vblank test and it passed/skipped all the subtests except the p=
ipe-A-accuracy-idle test.
Results are attached. Investigated the failing test and it seems like drm_h=
andle_vblank() is taking too long sometimes. I can work on this after we me=
rge.

Will send out V8 with the minor changes and device tree YAML binding file A=
SAP. Will work on the rest of the review comments after.

Thanks,
Anitha

> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Thursday, September 10, 2020 1:31 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: dri-devel@lists.freedesktop.org; Paauwe, Bob J
> <bob.j.paauwe@intel.com>; Dea, Edmund J <edmund.j.dea@intel.com>;
> Vetter, Daniel <daniel.vetter@intel.com>
> Subject: Re: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
>=20
> On Mon, Aug 31, 2020 at 01:02:50PM -0700, Anitha Chrisanthus wrote:
> > This is a basic KMS atomic modesetting display driver for KeemBay famil=
y
> of
> > SOCs. Driver has no 2D or 3D graphics.It calls into the ADV bridge
> > driver at the connector level.
> >
> > Single CRTC with LCD controller->mipi DSI-> ADV bridge
> >
> > Only 1080p resolution and single plane is supported at this time.
> >
> > v2: moved extern to .h, removed license text
> >     use drm_dev_init, upclassed dev_private, removed HAVE_IRQ.(Sam)
> >
> > v3: Squashed all 59 commits to one
> >
> > v4: review changes from Sam Ravnborg
> > 	renamed dev_p to kmb
> > 	moved clocks under kmb_clock, consolidated clk initializations
> > 	use drmm functions
> > 	use DRM_GEM_CMA_DRIVER_OPS_VMAP
> >
> > v5: corrected spellings
> > v6: corrected checkpatch warnings
> > v7: review changes Sam Ravnborg and Thomas Zimmerman
> > 	removed kmb_crtc.h kmb_crtc_cleanup (Thomas)
> > 	renamed mode_set, kmb_load, inlined unload (Thomas)
> > 	moved remaining logging to drm_*(Thomas)
> > 	re-orged driver initialization (Thomas)
> > 	moved plane_status to drm_private (Sam)
> > 	removed unnecessary logs and defines and ifdef codes (Sam)
> > 	call helper_check in plane_atomic_check (Sam)
> > 	renamed set to get for bpp and format functions(Sam)
> > 	use drm helper functions for reset, duplicate/destroy state instead
> > 	of kmb functions (Sam)
> > 	removed kmb_priv from kmb_plane and removed kmb_plane_state
> (Sam)
> >
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
>=20
> Sam asked me to take a look at this too, looks reasonable overall. I've
> spotted a few small things plus a potential functional issue around
> vblank/event handling. I strongly recommend running the igt test suite
> over the driver to see whether it all works reasonably ok. See below for
> details.
>=20
> > ---
> >  drivers/gpu/drm/kmb/kmb_crtc.c  | 224 +++++++++++++
> >  drivers/gpu/drm/kmb/kmb_drv.c   | 676
> ++++++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/kmb/kmb_drv.h   | 170 ++++++++++
> >  drivers/gpu/drm/kmb/kmb_plane.c | 480
> ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/kmb/kmb_plane.h | 110 +++++++
> >  5 files changed, 1660 insertions(+)
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.h
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.h
> >
> > diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c
> b/drivers/gpu/drm/kmb/kmb_crtc.c
> > new file mode 100644
> > index 0000000..a684331
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_crtc.c
> > @@ -0,0 +1,224 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2018-2020 Intel Corporation
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_data/simplefb.h>
> > +
> > +#include <video/videomode.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_debugfs.h>
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_plane_helper.h>
> > +#include <drm/drm_vblank.h>
> > +
> > +#include "kmb_drv.h"
> > +#include "kmb_dsi.h"
> > +#include "kmb_plane.h"
> > +#include "kmb_regs.h"
> > +
> > +struct kmb_crtc_timing {
> > +	u32 vfront_porch;
> > +	u32 vback_porch;
> > +	u32 vsync_len;
> > +	u32 hfront_porch;
> > +	u32 hback_porch;
> > +	u32 hsync_len;
> > +};
> > +
> > +static int kmb_crtc_enable_vblank(struct drm_crtc *crtc)
> > +{
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> > +
> > +	/* Clear interrupt */
> > +	kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> > +	/* Set which interval to generate vertical interrupt */
> > +	kmb_write_lcd(kmb, LCD_VSTATUS_COMPARE,
> > +		      LCD_VSTATUS_COMPARE_VSYNC);
> > +	/* Enable vertical interrupt */
> > +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > +			    LCD_INT_VERT_COMP);
> > +	return 0;
> > +}
> > +
> > +static void kmb_crtc_disable_vblank(struct drm_crtc *crtc)
> > +{
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> > +
> > +	/* Clear interrupt */
> > +	kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> > +	/* Disable vertical interrupt */
> > +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > +			    LCD_INT_VERT_COMP);
> > +}
> > +
> > +static const struct drm_crtc_funcs kmb_crtc_funcs =3D {
> > +	.destroy =3D drm_crtc_cleanup,
> > +	.set_config =3D drm_atomic_helper_set_config,
> > +	.page_flip =3D drm_atomic_helper_page_flip,
> > +	.reset =3D drm_atomic_helper_crtc_reset,
> > +	.atomic_duplicate_state =3D
> drm_atomic_helper_crtc_duplicate_state,
> > +	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
> > +	.enable_vblank =3D kmb_crtc_enable_vblank,
> > +	.disable_vblank =3D kmb_crtc_disable_vblank,
> > +};
> > +
> > +static void kmb_crtc_set_mode(struct drm_crtc *crtc)
> > +{
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct drm_display_mode *m =3D &crtc->state->adjusted_mode;
> > +	struct kmb_crtc_timing vm;
> > +	int vsync_start_offset;
> > +	int vsync_end_offset;
> > +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> > +	unsigned int val =3D 0;
> > +
> > +	/* Initialize mipi */
> > +	kmb_dsi_hw_init(dev, m);
> > +	drm_info(dev,
> > +		 "vfp=3D %d vbp=3D %d vsyc_len=3D%d hfp=3D%d hbp=3D%d
> hsync_len=3D%d\n",
> > +		 m->crtc_vsync_start - m->crtc_vdisplay,
> > +		 m->crtc_vtotal - m->crtc_vsync_end,
> > +		 m->crtc_vsync_end - m->crtc_vsync_start,
> > +		 m->crtc_hsync_start - m->crtc_hdisplay,
> > +		 m->crtc_htotal - m->crtc_hsync_end,
> > +		 m->crtc_hsync_end - m->crtc_hsync_start);
> > +	val =3D kmb_read_lcd(kmb, LCD_INT_ENABLE);
> > +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE, val);
> > +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, ~0x0);
> > +	vm.vfront_porch =3D 2;
> > +	vm.vback_porch =3D 2;
> > +	vm.vsync_len =3D 8;
> > +	vm.hfront_porch =3D 0;
> > +	vm.hback_porch =3D 0;
> > +	vm.hsync_len =3D 28;
> > +
> > +	vsync_start_offset =3D  m->crtc_vsync_start -  m->crtc_hsync_start;
> > +	vsync_end_offset =3D  m->crtc_vsync_end - m->crtc_hsync_end;
> > +
> > +	drm_dbg(dev, "%s : %dactive height=3D %d vbp=3D%d vfp=3D%d vsync-
> w=3D%d h-active=3D%d h-bp=3D%d h-fp=3D%d hysnc-l=3D%d",
> > +		__func__, __LINE__,
> > +			m->crtc_vdisplay, vm.vback_porch,
> vm.vfront_porch,
> > +			vm.vsync_len, m->crtc_hdisplay, vm.hback_porch,
> > +			vm.hfront_porch, vm.hsync_len);
> > +	kmb_write_lcd(kmb, LCD_V_ACTIVEHEIGHT,
> > +		      m->crtc_vdisplay - 1);
> > +	kmb_write_lcd(kmb, LCD_V_BACKPORCH, vm.vback_porch);
> > +	kmb_write_lcd(kmb, LCD_V_FRONTPORCH, vm.vfront_porch);
> > +	kmb_write_lcd(kmb, LCD_VSYNC_WIDTH, vm.vsync_len - 1);
> > +	kmb_write_lcd(kmb, LCD_H_ACTIVEWIDTH,
> > +		      m->crtc_hdisplay - 1);
> > +	kmb_write_lcd(kmb, LCD_H_BACKPORCH, vm.hback_porch);
> > +	kmb_write_lcd(kmb, LCD_H_FRONTPORCH, vm.hfront_porch);
> > +	kmb_write_lcd(kmb, LCD_HSYNC_WIDTH, vm.hsync_len - 1);
> > +	/* This is hardcoded as 0 in the Myriadx code */
> > +	kmb_write_lcd(kmb, LCD_VSYNC_START, 0);
> > +	kmb_write_lcd(kmb, LCD_VSYNC_END, 0);
> > +	/* Back ground color */
> > +	kmb_write_lcd(kmb, LCD_BG_COLOUR_LS, 0x4);
> > +	if (m->flags =3D=3D DRM_MODE_FLAG_INTERLACE) {
> > +		kmb_write_lcd(kmb,
> > +			      LCD_VSYNC_WIDTH_EVEN, vm.vsync_len - 1);
> > +		kmb_write_lcd(kmb,
> > +			      LCD_V_BACKPORCH_EVEN, vm.vback_porch);
> > +		kmb_write_lcd(kmb,
> > +			      LCD_V_FRONTPORCH_EVEN, vm.vfront_porch);
> > +		kmb_write_lcd(kmb, LCD_V_ACTIVEHEIGHT_EVEN,
> > +			      m->crtc_vdisplay - 1);
> > +		/* This is hardcoded as 10 in the Myriadx code */
> > +		kmb_write_lcd(kmb, LCD_VSYNC_START_EVEN, 10);
> > +		kmb_write_lcd(kmb, LCD_VSYNC_END_EVEN, 10);
> > +	}
> > +	kmb_write_lcd(kmb, LCD_TIMING_GEN_TRIG, ENABLE);
> > +	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, LCD_CTRL_ENABLE);
> > +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE, val);
> > +}
> > +
> > +static void kmb_crtc_atomic_enable(struct drm_crtc *crtc,
> > +				   struct drm_crtc_state *old_state)
> > +{
> > +	struct kmb_drm_private *lcd =3D crtc_to_kmb_priv(crtc);
> > +
> > +	clk_prepare_enable(lcd->clk);
> > +	kmb_crtc_set_mode(crtc);
> > +	drm_crtc_vblank_on(crtc);
> > +}
> > +
> > +static void kmb_crtc_atomic_disable(struct drm_crtc *crtc,
> > +				    struct drm_crtc_state *old_state)
> > +{
> > +	struct kmb_drm_private *lcd =3D crtc_to_kmb_priv(crtc);
> > +
> > +	/* due to hw limitations, planes need to be off when crtc is off */
> > +	drm_atomic_helper_disable_planes_on_crtc(old_state, false);
> > +
> > +	drm_crtc_vblank_off(crtc);
> > +	clk_disable_unprepare(lcd->clk);
> > +}
> > +
> > +static void kmb_crtc_atomic_begin(struct drm_crtc *crtc,
> > +				  struct drm_crtc_state *state)
> > +{
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> > +
> > +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > +			    LCD_INT_VERT_COMP);
> > +}
> > +
> > +static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
> > +				  struct drm_crtc_state *state)
> > +{
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> > +
> > +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > +			    LCD_INT_VERT_COMP);
> > +
> > +	spin_lock_irq(&crtc->dev->event_lock);
> > +	if (crtc->state->event)
> > +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
>=20
> Uh, you have vblank event support, but you immediately send out the
> vblank
> event. That breaks userspace assumptions. You probably want to use
> drm_crtc_arm_vblank_event here. Also there's tons of races that can
> possibly happen, so please read the kerneldoc comment for that function
> carefully - you probably need to validate that the vblank event arming,
> vblank process and re-enabling of LCD_INT_ENABLE cannot race against
> each
> another in bad ways.
>=20
> Also we have igt testcases for this, so please run them:


> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#validating-
> changes-with-igt
>=20
> > +	crtc->state->event =3D NULL;
> > +	spin_unlock_irq(&crtc->dev->event_lock);
> > +}
> > +
> > +static const struct drm_crtc_helper_funcs kmb_crtc_helper_funcs =3D {
> > +	.atomic_begin =3D kmb_crtc_atomic_begin,
> > +	.atomic_enable =3D kmb_crtc_atomic_enable,
> > +	.atomic_disable =3D kmb_crtc_atomic_disable,
> > +	.atomic_flush =3D kmb_crtc_atomic_flush,
> > +};
> > +
> > +int kmb_setup_crtc(struct drm_device *drm)
> > +{
> > +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> > +	struct kmb_plane *primary;
> > +	int ret;
> > +
> > +	primary =3D kmb_plane_init(drm);
> > +	if (IS_ERR(primary))
> > +		return PTR_ERR(primary);
> > +
> > +	ret =3D drm_crtc_init_with_planes(drm, &kmb->crtc, &primary-
> >base_plane,
> > +					NULL, &kmb_crtc_funcs, NULL);
> > +	if (ret) {
> > +		kmb_plane_destroy(&primary->base_plane);
> > +		return ret;
> > +	}
> > +
> > +	drm_crtc_helper_add(&kmb->crtc, &kmb_crtc_helper_funcs);
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> > new file mode 100644
> > index 0000000..e413099
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > @@ -0,0 +1,676 @@
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
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/spinlock.h>
> > +
> > +#include <drm/drm.h>
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_ioctl.h>
> > +#include <drm/drm_irq.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_vblank.h>
> > +
> > +#include "kmb_drv.h"
> > +#include "kmb_dsi.h"
> > +#include "kmb_regs.h"
> > +
> > +int kmb_under_flow =3D 0, kmb_flush_done =3D 0, layer_no =3D 0;
> > +static struct kmb_clock kmb_clk;
> > +
> > +static struct drm_bridge *adv_bridge;
> > +
> > +int kmb_display_clk_enable(struct kmb_drm_private *kmb)
> > +{
> > +	int ret =3D 0;
> > +
> > +	ret =3D clk_prepare_enable(kmb_clk.clk_lcd);
> > +	if (ret) {
> > +		drm_err(&kmb->drm, "Failed to enable LCD clock: %d\n",
> ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(kmb_clk.clk_mipi);
> > +	if (ret) {
> > +		drm_err(&kmb->drm, "Failed to enable MIPI clock: %d\n",
> ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(kmb_clk.clk_mipi_ecfg);
> > +	if (ret) {
> > +		drm_err(&kmb->drm,
> > +			"Failed to enable MIPI_ECFG clock: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(kmb_clk.clk_mipi_cfg);
> > +	if (ret) {
> > +		drm_err(&kmb->drm,
> > +			"Failed to enable MIPI_CFG clock: %d\n", ret);
> > +		return ret;
> > +	}
> > +	DRM_INFO("SUCCESS : enabled LCD MIPI clocks\n");
> > +	return 0;
> > +}
> > +
> > +int kmb_initialize_clocks(struct kmb_drm_private *kmb, struct device
> *dev)
> > +{
> > +	struct device_node *vpu_dev;
> > +	unsigned long clk;
> > +	int ret =3D 0;
> > +
> > +	kmb_clk.clk_lcd =3D clk_get(dev, "clk_lcd");
> > +	if (IS_ERR(kmb_clk.clk_lcd)) {
> > +		drm_err(&kmb->drm, "clk_get() failed clk_lcd\n");
> > +		return PTR_ERR(kmb_clk.clk_lcd);
> > +	}
> > +
> > +	kmb_clk.clk_mipi =3D clk_get(dev, "clk_mipi");
> > +	if (IS_ERR(kmb_clk.clk_mipi)) {
> > +		drm_err(&kmb->drm, "clk_get() failed clk_mipi\n");
> > +		return PTR_ERR(kmb_clk.clk_mipi);
> > +	}
> > +
> > +	kmb_clk.clk_mipi_ecfg =3D clk_get(dev, "clk_mipi_ecfg");
> > +	if (IS_ERR(kmb_clk.clk_mipi_ecfg)) {
> > +		drm_err(&kmb->drm, "clk_get() failed clk_mipi_ecfg\n");
> > +		return PTR_ERR(kmb_clk.clk_mipi_ecfg);
> > +	}
> > +
> > +	kmb_clk.clk_mipi_cfg =3D clk_get(dev, "clk_mipi_cfg");
> > +	if (IS_ERR(kmb_clk.clk_mipi_cfg)) {
> > +		drm_err(&kmb->drm, "clk_get() failed clk_mipi_cfg\n");
> > +		return PTR_ERR(kmb_clk.clk_mipi_cfg);
> > +	}
> > +	vpu_dev =3D of_find_node_by_path("/soc/vpu-ipc");
> > +	kmb_clk.clk_pll0 =3D of_clk_get_by_name(vpu_dev, "pll_0_out_0");
> > +	if (IS_ERR(kmb_clk.clk_pll0)) {
> > +		drm_err(&kmb->drm, "clk_get() failed clk_pll0 ");
> > +		return PTR_ERR(kmb_clk.clk_pll0);
> > +	}
> > +	kmb->sys_clk_mhz =3D clk_get_rate(kmb_clk.clk_pll0) / 1000000;
> > +	drm_info(&kmb->drm, "system clk =3D %d Mhz", kmb-
> >sys_clk_mhz);
> > +
> > +	/* Set LCD clock to 200 Mhz */
> > +	clk_set_rate(kmb_clk.clk_lcd, KMB_LCD_DEFAULT_CLK);
> > +	if (clk_get_rate(kmb_clk.clk_lcd) !=3D KMB_LCD_DEFAULT_CLK) {
> > +		drm_err(&kmb->drm, "failed to set to clk_lcd to %d\n",
> > +			KMB_LCD_DEFAULT_CLK);
> > +		return -1;
> > +	}
> > +	drm_dbg(&kmb->drm, "clk_lcd =3D %ld\n",
> clk_get_rate(kmb_clk.clk_lcd));
> > +
> > +	/* Set MIPI clock to 24 Mhz */
> > +	clk_set_rate(kmb_clk.clk_mipi, KMB_MIPI_DEFAULT_CLK);
> > +	if (clk_get_rate(kmb_clk.clk_mipi) !=3D KMB_MIPI_DEFAULT_CLK) {
> > +		drm_err(&kmb->drm, "failed to set to clk_mipi to %d\n",
> > +			KMB_MIPI_DEFAULT_CLK);
> > +		return -1;
> > +	}
> > +	drm_dbg(&kmb->drm, "clk_mipi =3D %ld\n",
> clk_get_rate(kmb_clk.clk_mipi));
> > +
> > +	clk =3D clk_get_rate(kmb_clk.clk_mipi_ecfg);
> > +	if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> > +		/* Set MIPI_ECFG clock to 24 Mhz */
> > +		clk_set_rate(kmb_clk.clk_mipi_ecfg,
> KMB_MIPI_DEFAULT_CFG_CLK);
> > +		clk =3D clk_get_rate(kmb_clk.clk_mipi_ecfg);
> > +		if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> > +			drm_err(&kmb->drm,
> > +				"failed to set to clk_mipi_ecfg to %d\n",
> > +				 KMB_MIPI_DEFAULT_CFG_CLK);
> > +			return -1;
> > +		}
> > +	}
> > +
> > +	clk =3D clk_get_rate(kmb_clk.clk_mipi_cfg);
> > +	if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> > +		/* Set MIPI_CFG clock to 24 Mhz */
> > +		clk_set_rate(kmb_clk.clk_mipi_cfg, 24000000);
> > +		clk =3D clk_get_rate(kmb_clk.clk_mipi_cfg);
> > +		if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> > +			drm_err(&kmb->drm,
> > +				"failed to set clk_mipi_cfg to %d\n",
> > +				  KMB_MIPI_DEFAULT_CFG_CLK);
> > +			return -1;
> > +		}
> > +	}
> > +
> > +	ret =3D kmb_display_clk_enable(kmb);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Enable MSS_CAM_CLK_CTRL for MIPI TX and LCD */
> > +	kmb_set_bitmask_msscam(kmb, MSS_CAM_CLK_CTRL, 0x1fff);
> > +	kmb_set_bitmask_msscam(kmb, MSS_CAM_RSTN_CTRL, 0xffffffff);
> > +	return 0;
> > +}
> > +
> > +static int kmb_display_clk_disable(void)
> > +{
> > +	if (kmb_clk.clk_lcd)
> > +		clk_disable_unprepare(kmb_clk.clk_lcd);
> > +	if (kmb_clk.clk_mipi)
> > +		clk_disable_unprepare(kmb_clk.clk_mipi);
> > +	if (kmb_clk.clk_mipi_ecfg)
> > +		clk_disable_unprepare(kmb_clk.clk_mipi_ecfg);
> > +	if (kmb_clk.clk_mipi_cfg)
> > +		clk_disable_unprepare(kmb_clk.clk_mipi_cfg);
> > +	return 0;
> > +}
> > +
> > +static void __iomem *kmb_map_mmio(struct drm_device *drm, char
> *name)
> > +{
> > +	struct resource *res;
> > +	struct platform_device *pdev =3D to_platform_device(drm->dev);
> > +	void __iomem *mem;
> > +
> > +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> name);
> > +	if (!res) {
> > +		drm_err(drm, "failed to get resource for %s", name);
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +	mem =3D devm_ioremap_resource(drm->dev, res);
> > +	if (IS_ERR(mem))
> > +		drm_err(drm, "failed to ioremap %s registers", name);
> > +	return mem;
> > +}
> > +
> > +static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
> > +{
> > +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> > +	struct platform_device *pdev =3D to_platform_device(drm->dev);
> > +	int irq_lcd;
> > +	int ret =3D 0;
> > +
> > +	/* Map LCD MMIO registers */
> > +	kmb->lcd_mmio =3D kmb_map_mmio(drm, "lcd_regs");
> > +	if (IS_ERR(kmb->lcd_mmio)) {
> > +		drm_err(&kmb->drm, "failed to map LCD registers\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	/* Map MIPI MMIO registers */
> > +	kmb->mipi_mmio =3D kmb_map_mmio(drm, "mipi_regs");
> > +	if (IS_ERR(kmb->mipi_mmio)) {
> > +		drm_err(&kmb->drm, "failed to map MIPI registers\n");
> > +		iounmap(kmb->lcd_mmio);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	/* This is only for MIPI_TX_MSS_LCD_MIPI_CFG and
> > +	 * MSS_CAM_CLK_CTRL register
> > +	 */
> > +	kmb->msscam_mmio =3D kmb_map_mmio(drm, "msscam_regs");
> > +	if (IS_ERR(kmb->msscam_mmio)) {
> > +		drm_err(&kmb->drm, "failed to map MSSCAM
> registers\n");
> > +		iounmap(kmb->lcd_mmio);
> > +		iounmap(kmb->mipi_mmio);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	if (IS_ERR(kmb->msscam_mmio)) {
> > +		drm_err(&kmb->drm, "failed to map MSSCAM
> registers\n");
> > +		iounmap(kmb->lcd_mmio);
> > +		iounmap(kmb->mipi_mmio);
> > +		return -ENOMEM;
> > +	}
> > +	/* Enable display clocks */
> > +	kmb_initialize_clocks(kmb, &pdev->dev);
> > +
> > +	/* Register irqs here - section 17.3 in databook
> > +	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
> > +	 * firmware has redirected 79 to A53 IRQ 33
> > +	 */
> > +
> > +	/* Allocate LCD interrupt resources */
> > +	irq_lcd =3D platform_get_irq_byname(pdev, "irq_lcd");
> > +	if (irq_lcd < 0) {
> > +		drm_err(&kmb->drm, "irq_lcd not found");
> > +		goto setup_fail;
> > +	}
> > +
> > +	/* Get the optional framebuffer memory resource */
> > +	ret =3D of_reserved_mem_device_init(drm->dev);
> > +	if (ret && ret !=3D -ENODEV)
> > +		return ret;
> > +
> > +	spin_lock_init(&kmb->irq_lock);
> > +
> > +	kmb->irq_lcd =3D irq_lcd;
> > +
> > +	return 0;
> > +
> > + setup_fail:
> > +	of_reserved_mem_device_release(drm->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct drm_mode_config_funcs kmb_mode_config_funcs =3D {
> > +	.fb_create =3D drm_gem_fb_create,
> > +	.atomic_check =3D drm_atomic_helper_check,
> > +	.atomic_commit =3D drm_atomic_helper_commit,
> > +};
> > +
> > +static int kmb_setup_mode_config(struct drm_device *drm)
> > +{
> > +	int ret;
> > +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> > +
> > +	ret =3D drmm_mode_config_init(drm);
> > +	if (ret)
> > +		return ret;
> > +	drm->mode_config.min_width =3D KMB_MIN_WIDTH;
> > +	drm->mode_config.min_height =3D KMB_MIN_HEIGHT;
> > +	drm->mode_config.max_width =3D KMB_MAX_WIDTH;
> > +	drm->mode_config.max_height =3D KMB_MAX_HEIGHT;
> > +	drm->mode_config.funcs =3D &kmb_mode_config_funcs;
> > +
> > +	ret =3D kmb_setup_crtc(drm);
> > +	if (ret < 0) {
> > +		drm_err(drm, "failed to create crtc\n");
> > +		return ret;
> > +	}
> > +
> > +	/* Initialize MIPI DSI */
> > +	ret =3D kmb_dsi_init(drm, adv_bridge);
>=20
> Split up isn't correct here, this won't compile since the dsi code isn't
> in this patch yet. So you need to have this ordered the other way round.
>=20
> > +	if (ret) {
> > +		drm_err(drm, "failed to initialize DSI\n");
> > +		return ret;
> > +	}
> > +
> > +	/* Set the CRTC's port so that the encoder component can find it */
> > +	kmb->crtc.port =3D of_graph_get_port_by_id(drm->dev->of_node, 0);
> > +	ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> > +	if (ret < 0) {
> > +		drm_err(drm, "failed to initialize vblank\n");
> > +		pm_runtime_disable(drm->dev);
> > +		return ret;
> > +	}
> > +
> > +	drm_mode_config_reset(drm);
> > +	return 0;
> > +}
> > +
> > +static irqreturn_t handle_lcd_irq(struct drm_device *dev)
> > +{
> > +	unsigned long status, val, val1;
> > +	int plane_id, dma0_state, dma1_state;
> > +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> > +
> > +	status =3D kmb_read_lcd(kmb, LCD_INT_STATUS);
> > +
> > +	if (status & LCD_INT_EOF) {
> > +		kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_EOF);
> > +
> > +		/* When disabling/enabling LCD layers, the change takes
> effect
> > +		 * immediately and does not wait for EOF (end of frame).
> > +		 * When kmb_plane_atomic_disable is called, mark the
> plane as
> > +		 * disabled but actually disable the plane when EOF irq is
> > +		 * being handled.
> > +		 */
> > +		for (plane_id =3D LAYER_0;
> > +				plane_id < KMB_MAX_PLANES; plane_id++)
> {
> > +			if (kmb->plane_status[plane_id].disable) {
> > +				kmb_clr_bitmask_lcd(kmb,
> > +						    LCD_LAYERn_DMA_CFG
> > +						    (plane_id),
> > +
> LCD_DMA_LAYER_ENABLE);
> > +
> > +				kmb_clr_bitmask_lcd(kmb, LCD_CONTROL,
> > +						    kmb-
> >plane_status[plane_id].ctrl);
> > +
> > +				kmb->plane_status[plane_id].disable =3D false;
> > +			}
> > +		}
> > +		if (kmb_under_flow) {
> > +			/* DMA Recovery after underflow */
> > +			dma0_state =3D (layer_no =3D=3D 0) ?
> > +			    LCD_VIDEO0_DMA0_STATE :
> LCD_VIDEO1_DMA0_STATE;
> > +			dma1_state =3D (layer_no =3D=3D 0) ?
> > +			    LCD_VIDEO0_DMA1_STATE :
> LCD_VIDEO1_DMA1_STATE;
> > +
> > +			do {
> > +				kmb_write_lcd(kmb, LCD_FIFO_FLUSH, 1);
> > +				val =3D kmb_read_lcd(kmb, dma0_state)
> > +				    & LCD_DMA_STATE_ACTIVE;
> > +				val1 =3D kmb_read_lcd(kmb, dma1_state)
> > +				    & LCD_DMA_STATE_ACTIVE;
> > +			} while ((val || val1));
> > +			/* disable dma */
> > +			kmb_clr_bitmask_lcd(kmb,
> LCD_LAYERn_DMA_CFG(layer_no),
> > +					    LCD_DMA_LAYER_ENABLE);
> > +			kmb_write_lcd(kmb, LCD_FIFO_FLUSH, 1);
> > +			kmb_flush_done =3D 1;
> > +			kmb_under_flow =3D 0;
> > +		}
> > +	}
> > +
> > +	if (status & LCD_INT_LINE_CMP) {
> > +		/* clear line compare interrupt */
> > +		kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_LINE_CMP);
> > +	}
> > +
> > +	if (status & LCD_INT_VERT_COMP) {
> > +		/* Read VSTATUS */
> > +		val =3D kmb_read_lcd(kmb, LCD_VSTATUS);
> > +		val =3D (val & LCD_VSTATUS_VERTICAL_STATUS_MASK);
> > +		switch (val) {
> > +		case LCD_VSTATUS_COMPARE_VSYNC:
> > +			/* Clear vertical compare interrupt */
> > +			kmb_write_lcd(kmb, LCD_INT_CLEAR,
> LCD_INT_VERT_COMP);
> > +			if (kmb_flush_done) {
> > +				kmb_set_bitmask_lcd(kmb,
> > +						    LCD_LAYERn_DMA_CFG
> > +						    (layer_no),
> > +
> LCD_DMA_LAYER_ENABLE);
> > +				kmb_flush_done =3D 0;
> > +			}
> > +			drm_handle_vblank(dev, 0);
>=20
> Would be nice to use the new-style drm_crtc_handle_vblank here.
>=20
> > +			break;
> > +		case LCD_VSTATUS_COMPARE_BACKPORCH:
> > +		case LCD_VSTATUS_COMPARE_ACTIVE:
> > +		case LCD_VSTATUS_COMPARE_FRONT_PORCH:
> > +			kmb_write_lcd(kmb, LCD_INT_CLEAR,
> LCD_INT_VERT_COMP);
> > +			break;
> > +		}
> > +	}
> > +	if (status & LCD_INT_DMA_ERR) {
> > +		val =3D
> > +		    (status & LCD_INT_DMA_ERR &
> > +		     kmb_read_lcd(kmb, LCD_INT_ENABLE));
> > +		/* LAYER0 - VL0 */
> > +		if (val & (LAYER0_DMA_FIFO_UNDERFLOW |
> > +			   LAYER0_DMA_CB_FIFO_UNDERFLOW |
> > +			   LAYER0_DMA_CR_FIFO_UNDERFLOW)) {
> > +			kmb_under_flow++;
> > +			drm_info(&kmb->drm,
> > +				 "!LAYER0:VL0 DMA UNDERFLOW val =3D
> 0x%lx,under_flow=3D%d",
> > +			     val, kmb_under_flow);
> > +			/* disable underflow interrupt */
> > +			kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > +					    LAYER0_DMA_FIFO_UNDERFLOW
> |
> > +
> LAYER0_DMA_CB_FIFO_UNDERFLOW |
> > +
> LAYER0_DMA_CR_FIFO_UNDERFLOW);
> > +			kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR,
> > +
> LAYER0_DMA_CB_FIFO_UNDERFLOW |
> > +					    LAYER0_DMA_FIFO_UNDERFLOW
> |
> > +
> LAYER0_DMA_CR_FIFO_UNDERFLOW);
> > +			/* disable auto restart mode */
> > +			kmb_clr_bitmask_lcd(kmb,
> LCD_LAYERn_DMA_CFG(0),
> > +
> LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
> > +			layer_no =3D 0;
> > +		}
> > +
> > +		if (val & LAYER0_DMA_FIFO_OVERFLOW)
> > +			drm_dbg(&kmb->drm,
> > +				"LAYER0:VL0 DMA OVERFLOW val =3D 0x%lx",
> val);
> > +		if (val & LAYER0_DMA_CB_FIFO_OVERFLOW)
> > +			drm_dbg(&kmb->drm,
> > +				"LAYER0:VL0 DMA CB OVERFLOW val =3D
> 0x%lx", val);
> > +		if (val & LAYER0_DMA_CR_FIFO_OVERFLOW)
> > +			drm_dbg(&kmb->drm,
> > +				"LAYER0:VL0 DMA CR OVERFLOW val =3D
> 0x%lx", val);
> > +
> > +		/* LAYER1 - VL1 */
> > +		if (val & (LAYER1_DMA_FIFO_UNDERFLOW |
> > +			   LAYER1_DMA_CB_FIFO_UNDERFLOW |
> > +			   LAYER1_DMA_CR_FIFO_UNDERFLOW)) {
> > +			kmb_under_flow++;
> > +			drm_info(&kmb->drm,
> > +				 "!LAYER1:VL1 DMA UNDERFLOW val =3D
> 0x%lx, under_flow=3D%d",
> > +			     val, kmb_under_flow);
> > +			/* disable underflow interrupt */
> > +			kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > +					    LAYER1_DMA_FIFO_UNDERFLOW
> |
> > +
> LAYER1_DMA_CB_FIFO_UNDERFLOW |
> > +
> LAYER1_DMA_CR_FIFO_UNDERFLOW);
> > +			kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR,
> > +
> LAYER1_DMA_CB_FIFO_UNDERFLOW |
> > +					    LAYER1_DMA_FIFO_UNDERFLOW
> |
> > +
> LAYER1_DMA_CR_FIFO_UNDERFLOW);
> > +			/* disable auto restart mode */
> > +			kmb_clr_bitmask_lcd(kmb,
> LCD_LAYERn_DMA_CFG(1),
> > +
> LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
> > +			layer_no =3D 1;
> > +		}
> > +
> > +		/* LAYER1 - VL1 */
> > +		if (val & LAYER1_DMA_FIFO_OVERFLOW)
> > +			drm_dbg(&kmb->drm,
> > +				"LAYER1:VL1 DMA OVERFLOW val =3D 0x%lx",
> val);
> > +		if (val & LAYER1_DMA_CB_FIFO_OVERFLOW)
> > +			drm_dbg(&kmb->drm,
> > +				"LAYER1:VL1 DMA CB OVERFLOW val =3D
> 0x%lx", val);
> > +		if (val & LAYER1_DMA_CR_FIFO_OVERFLOW)
> > +			drm_dbg(&kmb->drm,
> > +				"LAYER1:VL1 DMA CR OVERFLOW val =3D
> 0x%lx", val);
> > +
> > +		/* LAYER2 - GL0 */
> > +		if (val & LAYER2_DMA_FIFO_UNDERFLOW)
> > +			drm_dbg(&kmb->drm,
> > +				"LAYER2:GL0 DMA UNDERFLOW val =3D
> 0x%lx", val);
> > +		if (val & LAYER2_DMA_FIFO_OVERFLOW)
> > +			drm_dbg(&kmb->drm,
> > +				"LAYER2:GL0 DMA OVERFLOW val =3D 0x%lx",
> val);
> > +
> > +		/* LAYER3 - GL1 */
> > +		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
> > +			drm_dbg(&kmb->drm,
> > +				"LAYER3:GL1 DMA UNDERFLOW val =3D
> 0x%lx", val);
> > +		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
> > +			drm_dbg(&kmb->drm,
> > +				"LAYER3:GL1 DMA OVERFLOW val =3D 0x%lx",
> val);
> > +	}
> > +
> > +	if (status & LCD_INT_LAYER) {
> > +		/* Clear layer interrupts */
> > +		kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_LAYER);
> > +	}
> > +
> > +	/* Clear all interrupts */
> > +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, 1);
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +/* IRQ handler */
> > +static irqreturn_t kmb_isr(int irq, void *arg)
> > +{
> > +	struct drm_device *dev =3D (struct drm_device *)arg;
> > +
> > +	handle_lcd_irq(dev);
> > +	return IRQ_HANDLED;
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
> > +static struct drm_driver kmb_driver =3D {
> > +	.driver_features =3D DRIVER_GEM |
> > +	    DRIVER_MODESET | DRIVER_ATOMIC,
> > +	.irq_handler =3D kmb_isr,
> > +	.irq_preinstall =3D kmb_irq_reset,
> > +	.irq_uninstall =3D kmb_irq_reset,
> > +	/* GEM Operations */
> > +	.fops =3D &fops,
> > +	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> > +	.name =3D "kmb-drm",
> > +	.desc =3D "KEEMBAY DISPLAY DRIVER ",
> > +	.date =3D "20190122",
> > +	.major =3D 1,
> > +	.minor =3D 0,
> > +};
> > +
> > +static int kmb_remove(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct drm_device *drm =3D dev_get_drvdata(dev);
> > +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> > +
> > +	drm_dev_unregister(drm);
> > +	drm_kms_helper_poll_fini(drm);
> > +	of_node_put(kmb->crtc.port);
> > +	kmb->crtc.port =3D NULL;
> > +	pm_runtime_get_sync(drm->dev);
> > +	drm_irq_uninstall(drm);
> > +	pm_runtime_put_sync(drm->dev);
> > +	pm_runtime_disable(drm->dev);
> > +
> > +	of_reserved_mem_device_release(drm->dev);
> > +
> > +	/* Release clks */
> > +	kmb_display_clk_disable();
> > +	clk_put(kmb_clk.clk_lcd);
> > +	clk_put(kmb_clk.clk_mipi);
> > +
> > +	dev_set_drvdata(dev, NULL);
> > +
> > +	/* Unregister DSI host */
> > +	kmb_dsi_host_unregister();
> > +	return 0;
> > +}
> > +
> > +static int kmb_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D get_device(&pdev->dev);
> > +	struct kmb_drm_private *kmb;
> > +	int ret =3D 0;
> > +
> > +	/* The bridge (ADV 7535) will return -EPROBE_DEFER until it
> > +	 * has a mipi_dsi_host to register its device to. So, we
> > +	 * first register the DSI host during probe time, and then return
> > +	 * -EPROBE_DEFER until the bridge is loaded. Probe will be called
> again
> > +	 *  and then the rest of the driver initialization can proceed
> > +	 *  afterwards and the bridge can be successfully attached.
> > +	 */
> > +	adv_bridge =3D kmb_dsi_host_bridge_init(dev);
> > +
> > +	if (adv_bridge =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> > +		return -EPROBE_DEFER;
> > +	} else if (IS_ERR(adv_bridge)) {
> > +		DRM_ERROR("probe failed to initialize DSI host bridge\n");
> > +		return PTR_ERR(adv_bridge);
> > +	}
> > +
> > +	/* Create DRM device */
> > +	kmb =3D devm_drm_dev_alloc(dev, &kmb_driver,
> > +				 struct kmb_drm_private, drm);
> > +	if (IS_ERR(kmb))
> > +		return PTR_ERR(kmb);
> > +
> > +	dev_set_drvdata(dev, &kmb->drm);
> > +
> > +	ret =3D kmb_hw_init(&kmb->drm, 0);
> > +	if (ret)
> > +		goto err_free1;
> > +
> > +	ret =3D kmb_setup_mode_config(&kmb->drm);
> > +	if (ret)
> > +		goto err_free;
> > +
> > +	ret =3D drm_irq_install(&kmb->drm, kmb->irq_lcd);
> > +	if (ret < 0) {
> > +		drm_err(&kmb->drm, "failed to install IRQ handler\n");
> > +		goto err_irq;
> > +	}
> > +
> > +	drm_kms_helper_poll_init(&kmb->drm);
> > +
> > +	/* Register graphics device with the kernel */
> > +	ret =3D drm_dev_register(&kmb->drm, 0);
> > +	if (ret)
> > +		goto err_register;
> > +
> > +	return 0;
> > +
> > + err_register:
> > +	drm_kms_helper_poll_fini(&kmb->drm);
> > + err_irq:
> > +	pm_runtime_disable(kmb->drm.dev);
> > + err_free:
> > +	drm_crtc_cleanup(&kmb->crtc);
> > +	drm_mode_config_cleanup(&kmb->drm);
> > + err_free1:
> > +	dev_set_drvdata(dev, NULL);
> > +	kmb_dsi_host_unregister();
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct of_device_id kmb_of_match[] =3D {
> > +	{.compatible =3D "intel,kmb_display"},
> > +	{},
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, kmb_of_match);
> > +
> > +static int __maybe_unused kmb_pm_suspend(struct device *dev)
> > +{
> > +	struct drm_device *drm =3D dev_get_drvdata(dev);
> > +	struct kmb_drm_private *kmb =3D drm ? to_kmb(drm) : NULL;
> > +
> > +	drm_kms_helper_poll_disable(drm);
> > +
> > +	kmb->state =3D drm_atomic_helper_suspend(drm);
> > +	if (IS_ERR(kmb->state)) {
> > +		drm_kms_helper_poll_enable(drm);
> > +		return PTR_ERR(kmb->state);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused kmb_pm_resume(struct device *dev)
> > +{
> > +	struct drm_device *drm =3D dev_get_drvdata(dev);
> > +	struct kmb_drm_private *kmb =3D drm ? to_kmb(drm) : NULL;
> > +
> > +	if (!kmb)
> > +		return 0;
> > +
> > +	drm_atomic_helper_resume(drm, kmb->state);
> > +	drm_kms_helper_poll_enable(drm);
> > +
> > +	return 0;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(kmb_pm_ops, kmb_pm_suspend,
> kmb_pm_resume);
> > +
> > +static struct platform_driver kmb_platform_driver =3D {
> > +	.probe =3D kmb_probe,
> > +	.remove =3D kmb_remove,
> > +	.driver =3D {
> > +		.name =3D "kmb-drm",
> > +		.pm =3D &kmb_pm_ops,
> > +		.of_match_table =3D kmb_of_match,
> > +	},
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
> > index 0000000..352f2d2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.h
> > @@ -0,0 +1,170 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only
> > + *
> > + * Copyright (c) 2018-2020 Intel Corporation
> > + */
> > +
> > +#ifndef __KMB_DRV_H__
> > +#define __KMB_DRV_H__
> > +
> > +#include "kmb_plane.h"
> > +#include "kmb_regs.h"
> > +
> > +#define KMB_MAX_WIDTH			1920 /*max width in pixels
> */
> > +#define KMB_MAX_HEIGHT			1080 /*max height in
> pixels */
> > +#define KMB_MIN_WIDTH                   1920 /*max width in pixels */
> > +#define KMB_MIN_HEIGHT                  1080 /*max height in pixels */
> > +#define KMB_LCD_DEFAULT_CLK		200000000
> > +#define KMB_MIPI_DEFAULT_CLK		24000000
> > +#define KMB_MIPI_DEFAULT_CFG_CLK	24000000
> > +#define KMB_SYS_CLK_MHZ			500
> > +
> > +#define ICAM_MMIO		0x3b100000
> > +#define ICAM_LCD_OFFSET		0x1080
> > +#define ICAM_MMIO_SIZE		0x2000
> > +
> > +struct kmb_drm_private {
> > +	struct drm_device		drm;
> > +	void __iomem			*lcd_mmio;
> > +	void __iomem			*mipi_mmio;
> > +	void __iomem			*msscam_mmio;
> > +	struct clk			*clk;
> > +	struct drm_crtc			crtc;
> > +	struct kmb_plane		*plane;
> > +	struct drm_atomic_state		*state;
> > +	spinlock_t			irq_lock;
> > +	int				irq_lcd;
> > +	int				irq_mipi;
> > +	int				sys_clk_mhz;
> > +	dma_addr_t			fb_addr;
> > +	struct layer_status		plane_status[KMB_MAX_PLANES];
> > +};
> > +
> > +struct kmb_clock {
> > +	struct clk *clk_lcd;
> > +	struct clk *clk_mipi;
> > +	struct clk *clk_mipi_ecfg;
> > +	struct clk *clk_mipi_cfg;
> > +	struct clk *clk_pll0;
> > +};
> > +
> > +static inline struct kmb_drm_private *to_kmb(const struct drm_device
> *dev)
> > +{
> > +	return container_of(dev, struct kmb_drm_private, drm);
> > +}
> > +
> > +static inline struct kmb_drm_private *crtc_to_kmb_priv(const struct
> drm_crtc *x)
> > +{
> > +	return container_of(x, struct kmb_drm_private, crtc);
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
> > +static inline void kmb_set_bitmask_msscam(struct kmb_drm_private
> *dev_p,
> > +					  unsigned int reg, u32 mask)
> > +{
> > +	u32 reg_val =3D kmb_read_msscam(dev_p, reg);
> > +
> > +	kmb_write_msscam(dev_p, reg, (reg_val | mask));
> > +}
> > +
> > +static inline u32 kmb_read_lcd(struct kmb_drm_private *dev_p,
> unsigned int reg)
> > +{
> > +	return readl(dev_p->lcd_mmio + reg);
> > +}
> > +
> > +static inline void kmb_set_bitmask_lcd(struct kmb_drm_private
> *dev_p,
> > +				       unsigned int reg, u32 mask)
> > +{
> > +	u32 reg_val =3D kmb_read_lcd(dev_p, reg);
> > +
> > +	kmb_write_lcd(dev_p, reg, (reg_val | mask));
> > +}
> > +
> > +static inline void kmb_clr_bitmask_lcd(struct kmb_drm_private *dev_p,
> > +				       unsigned int reg, u32 mask)
> > +{
> > +	u32 reg_val =3D kmb_read_lcd(dev_p, reg);
> > +
> > +	kmb_write_lcd(dev_p, reg, (reg_val & (~mask)));
> > +}
> > +
> > +static inline u32 kmb_read_mipi(struct kmb_drm_private *dev_p,
> unsigned int reg)
> > +{
> > +	return readl(dev_p->mipi_mmio + reg);
> > +}
> > +
> > +static inline void kmb_write_bits_mipi(struct kmb_drm_private *dev_p,
> > +				       unsigned int reg, u32 offset,
> > +				       u32 num_bits, u32 value)
> > +{
> > +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> > +	u32 mask =3D (1 << num_bits) - 1;
> > +
> > +	value &=3D mask;
> > +	mask <<=3D offset;
> > +	reg_val &=3D (~mask);
> > +	reg_val |=3D (value << offset);
> > +	kmb_write_mipi(dev_p, reg, reg_val);
> > +}
> > +
> > +static inline void kmb_set_bit_mipi(struct kmb_drm_private *dev_p,
> > +				    unsigned int reg, u32 offset)
> > +{
> > +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> > +
> > +	kmb_write_mipi(dev_p, reg, reg_val | (1 << offset));
> > +}
> > +
> > +static inline void kmb_clr_bit_mipi(struct kmb_drm_private *dev_p,
> > +				    unsigned int reg, u32 offset)
> > +{
> > +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> > +
> > +	kmb_write_mipi(dev_p, reg, reg_val & (~(1 << offset)));
> > +}
> > +
> > +static inline void kmb_set_bitmask_mipi(struct kmb_drm_private
> *dev_p,
> > +					unsigned int reg, u32 mask)
> > +{
> > +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> > +
> > +	kmb_write_mipi(dev_p, reg, (reg_val | mask));
> > +}
> > +
> > +static inline void kmb_clr_bitmask_mipi(struct kmb_drm_private
> *dev_p,
> > +					unsigned int reg, u32 mask)
> > +{
> > +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> > +
> > +	kmb_write_mipi(dev_p, reg, (reg_val & (~mask)));
> > +}
> > +
> > +int kmb_setup_crtc(struct drm_device *dev);
> > +void kmb_set_scanout(struct kmb_drm_private *lcd);
> > +#endif /* __KMB_DRV_H__ */
> > diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> b/drivers/gpu/drm/kmb/kmb_plane.c
> > new file mode 100644
> > index 0000000..d1e7786
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> > @@ -0,0 +1,480 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2018-2020 Intel Corporation
> > + */
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_fourcc.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_managed.h>
> > +#include <drm/drm_plane_helper.h>
> > +
> > +#include "kmb_drv.h"
> > +#include "kmb_plane.h"
> > +#include "kmb_regs.h"
> > +
> > +const u32 layer_irqs[] =3D {
> > +	LCD_INT_VL0,
> > +	LCD_INT_VL1,
> > +	LCD_INT_GL0,
> > +	LCD_INT_GL1
> > +};
> > +
> > +static unsigned int check_pixel_format(struct drm_plane *plane, u32
> format)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < plane->format_count; i++) {
> > +		if (plane->format_types[i] =3D=3D format)
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
> > +	struct drm_crtc_state *crtc_state;
> > +	bool can_position;
> > +
> > +	fb =3D state->fb;
> > +	if (!fb || !state->crtc)
> > +		return 0;
> > +
> > +	ret =3D check_pixel_format(plane, fb->format->format);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (state->crtc_w > KMB_MAX_WIDTH || state->crtc_h >
> KMB_MAX_HEIGHT)
> > +		return -EINVAL;
> > +	if (state->crtc_w < KMB_MIN_WIDTH || state->crtc_h <
> KMB_MIN_HEIGHT)
> > +		return -EINVAL;
> > +	can_position =3D (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY);
> > +	crtc_state =3D
> > +		drm_atomic_get_existing_crtc_state(state->state, state-
> >crtc);
> > +	return drm_atomic_helper_check_plane_state(state, crtc_state,
> > +
> DRM_PLANE_HELPER_NO_SCALING,
> > +
> DRM_PLANE_HELPER_NO_SCALING,
> > +						 can_position, true);
> > +}
> > +
> > +static void kmb_plane_atomic_disable(struct drm_plane *plane,
> > +				     struct drm_plane_state *state)
> > +{
> > +	struct kmb_plane *kmb_plane =3D to_kmb_plane(plane);
> > +	int plane_id =3D kmb_plane->id;
> > +	struct kmb_drm_private *kmb;
> > +
> > +	kmb =3D to_kmb(plane->dev);
> > +
> > +	switch (plane_id) {
> > +	case LAYER_0:
> > +		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL1_ENABLE;
> > +		break;
> > +	case LAYER_1:
> > +		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL2_ENABLE;
> > +		break;
> > +	case LAYER_2:
> > +		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL1_ENABLE;
> > +		break;
> > +	case LAYER_3:
> > +		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL2_ENABLE;
> > +		break;
> > +	}
> > +
> > +	kmb->plane_status[plane_id].disable =3D true;
> > +}
> > +
> > +unsigned int get_pixel_format(u32 format)
> > +{
> > +	unsigned int val =3D 0;
> > +
> > +	switch (format) {
> > +		/* planar formats */
> > +	case DRM_FORMAT_YUV444:
> > +		val =3D LCD_LAYER_FORMAT_YCBCR444PLAN |
> LCD_LAYER_PLANAR_STORAGE;
> > +		break;
> > +	case DRM_FORMAT_YVU444:
> > +		val =3D LCD_LAYER_FORMAT_YCBCR444PLAN |
> LCD_LAYER_PLANAR_STORAGE
> > +		    | LCD_LAYER_CRCB_ORDER;
> > +		break;
> > +	case DRM_FORMAT_YUV422:
> > +		val =3D LCD_LAYER_FORMAT_YCBCR422PLAN |
> LCD_LAYER_PLANAR_STORAGE;
> > +		break;
> > +	case DRM_FORMAT_YVU422:
> > +		val =3D LCD_LAYER_FORMAT_YCBCR422PLAN |
> LCD_LAYER_PLANAR_STORAGE
> > +		    | LCD_LAYER_CRCB_ORDER;
> > +		break;
> > +	case DRM_FORMAT_YUV420:
> > +		val =3D LCD_LAYER_FORMAT_YCBCR420PLAN |
> LCD_LAYER_PLANAR_STORAGE;
> > +		break;
> > +	case DRM_FORMAT_YVU420:
> > +		val =3D LCD_LAYER_FORMAT_YCBCR420PLAN |
> LCD_LAYER_PLANAR_STORAGE
> > +		    | LCD_LAYER_CRCB_ORDER;
> > +		break;
> > +	case DRM_FORMAT_NV12:
> > +		val =3D LCD_LAYER_FORMAT_NV12 |
> LCD_LAYER_PLANAR_STORAGE;
> > +		break;
> > +	case DRM_FORMAT_NV21:
> > +		val =3D LCD_LAYER_FORMAT_NV12 |
> LCD_LAYER_PLANAR_STORAGE
> > +		    | LCD_LAYER_CRCB_ORDER;
> > +		break;
> > +		/* packed formats */
> > +		/* looks hw requires B & G to be swapped when RGB */
> > +	case DRM_FORMAT_RGB332:
> > +		val =3D LCD_LAYER_FORMAT_RGB332 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_XBGR4444:
> > +		val =3D LCD_LAYER_FORMAT_RGBX4444;
> > +		break;
> > +	case DRM_FORMAT_ARGB4444:
> > +		val =3D LCD_LAYER_FORMAT_RGBA4444 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_ABGR4444:
> > +		val =3D LCD_LAYER_FORMAT_RGBA4444;
> > +		break;
> > +	case DRM_FORMAT_XRGB1555:
> > +		val =3D LCD_LAYER_FORMAT_XRGB1555 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_XBGR1555:
> > +		val =3D LCD_LAYER_FORMAT_XRGB1555;
> > +		break;
> > +	case DRM_FORMAT_ARGB1555:
> > +		val =3D LCD_LAYER_FORMAT_RGBA1555 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_ABGR1555:
> > +		val =3D LCD_LAYER_FORMAT_RGBA1555;
> > +		break;
> > +	case DRM_FORMAT_RGB565:
> > +		val =3D LCD_LAYER_FORMAT_RGB565 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_BGR565:
> > +		val =3D LCD_LAYER_FORMAT_RGB565;
> > +		break;
> > +	case DRM_FORMAT_RGB888:
> > +		val =3D LCD_LAYER_FORMAT_RGB888 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_BGR888:
> > +		val =3D LCD_LAYER_FORMAT_RGB888;
> > +		break;
> > +	case DRM_FORMAT_XRGB8888:
> > +		val =3D LCD_LAYER_FORMAT_RGBX8888 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_XBGR8888:
> > +		val =3D LCD_LAYER_FORMAT_RGBX8888;
> > +		break;
> > +	case DRM_FORMAT_ARGB8888:
> > +		val =3D LCD_LAYER_FORMAT_RGBA8888 |
> LCD_LAYER_BGR_ORDER;
> > +		break;
> > +	case DRM_FORMAT_ABGR8888:
> > +		val =3D LCD_LAYER_FORMAT_RGBA8888;
> > +		break;
> > +	}
> > +	DRM_INFO_ONCE("%s : %d format=3D0x%x val=3D0x%x\n",
> > +		      __func__, __LINE__, format, val);
> > +	return val;
> > +}
> > +
> > +unsigned int get_bits_per_pixel(const struct drm_format_info *format)
> > +{
> > +	u32 bpp =3D 0;
> > +	unsigned int val =3D 0;
> > +
> > +	if (format->num_planes > 1) {
> > +		val =3D LCD_LAYER_8BPP;
> > +		return val;
> > +	}
> > +
> > +	bpp +=3D 8 * format->cpp[0];
> > +
> > +	switch (bpp) {
> > +	case 8:
> > +		val =3D LCD_LAYER_8BPP;
> > +		break;
> > +	case 16:
> > +		val =3D LCD_LAYER_16BPP;
> > +		break;
> > +	case 24:
> > +		val =3D LCD_LAYER_24BPP;
> > +		break;
> > +	case 32:
> > +		val =3D LCD_LAYER_32BPP;
> > +		break;
> > +	}
> > +
> > +	DRM_DEBUG("bpp=3D%d val=3D0x%x\n", bpp, val);
> > +	return val;
> > +}
> > +
> > +static void config_csc(struct kmb_drm_private *kmb, int plane_id)
> > +{
> > +	/* YUV to RGB conversion using the fixed matrix csc_coef_lcd */
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF11(plane_id),
> csc_coef_lcd[0]);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF12(plane_id),
> csc_coef_lcd[1]);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF13(plane_id),
> csc_coef_lcd[2]);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF21(plane_id),
> csc_coef_lcd[3]);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF22(plane_id),
> csc_coef_lcd[4]);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF23(plane_id),
> csc_coef_lcd[5]);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF31(plane_id),
> csc_coef_lcd[6]);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF32(plane_id),
> csc_coef_lcd[7]);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF33(plane_id),
> csc_coef_lcd[8]);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF1(plane_id),
> csc_coef_lcd[9]);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF2(plane_id),
> csc_coef_lcd[10]);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF3(plane_id),
> csc_coef_lcd[11]);
> > +}
> > +
> > +static void kmb_plane_atomic_update(struct drm_plane *plane,
> > +				    struct drm_plane_state *state)
> > +{
> > +	struct drm_framebuffer *fb;
> > +	struct kmb_drm_private *kmb;
> > +	unsigned int width;
> > +	unsigned int height;
> > +	unsigned int dma_len;
> > +	struct kmb_plane *kmb_plane;
> > +	unsigned int dma_cfg;
> > +	unsigned int ctrl =3D 0, val =3D 0, out_format =3D 0;
> > +	unsigned int src_w, src_h, crtc_x, crtc_y;
> > +	unsigned char plane_id;
> > +	int num_planes;
> > +	static dma_addr_t addr[MAX_SUB_PLANES];
> > +
> > +	if (!plane || !plane->state || !state)
> > +		return;
> > +
> > +	fb =3D plane->state->fb;
> > +	if (!fb)
> > +		return;
> > +	num_planes =3D fb->format->num_planes;
> > +	kmb_plane =3D to_kmb_plane(plane);
> > +	plane_id =3D kmb_plane->id;
> > +
> > +	kmb =3D to_kmb(plane->dev);
> > +
> > +	if (kmb_under_flow || kmb_flush_done) {
> > +		drm_dbg(&kmb->drm, "plane_update:underflow!!!!
> returning");
> > +		return;
> > +	}
> > +
> > +	src_w =3D (plane->state->src_w >> 16);
> > +	src_h =3D plane->state->src_h >> 16;
> > +	crtc_x =3D plane->state->crtc_x;
> > +	crtc_y =3D plane->state->crtc_y;
> > +
> > +	drm_dbg(&kmb->drm,
> > +		"src_w=3D%d src_h=3D%d, fb->format->format=3D0x%x fb-
> >flags=3D0x%x\n",
> > +		  src_w, src_h, fb->format->format, fb->flags);
> > +
> > +	width =3D fb->width;
> > +	height =3D fb->height;
> > +	dma_len =3D (width * height * fb->format->cpp[0]);
> > +	drm_dbg(&kmb->drm, "dma_len=3D%d ", dma_len);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN_SHADOW(plane_id),
> dma_len);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
> > +		      fb->pitches[0]);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
> > +		      (width * fb->format->cpp[0]));
> > +
> > +	addr[Y_PLANE] =3D drm_fb_cma_get_gem_addr(fb, plane->state, 0);
> > +	kmb->fb_addr =3D addr[Y_PLANE];
> > +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_START_ADDR(plane_id),
> > +		      addr[Y_PLANE] + fb->offsets[0]);
> > +	val =3D get_pixel_format(fb->format->format);
> > +	val |=3D get_bits_per_pixel(fb->format);
> > +	/* Program Cb/Cr for planar formats */
> > +	if (num_planes > 1) {
> > +		kmb_write_lcd(kmb,
> LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
> > +			      width * fb->format->cpp[0]);
> > +		kmb_write_lcd(kmb,
> LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
> > +			      (width * fb->format->cpp[0]));
> > +
> > +		addr[U_PLANE] =3D drm_fb_cma_get_gem_addr(fb, plane-
> >state,
> > +							U_PLANE);
> > +		/* check if Cb/Cr is swapped*/
> > +		if (num_planes =3D=3D 3 && (val & LCD_LAYER_CRCB_ORDER))
> > +			kmb_write_lcd(kmb,
> > +
> LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> > +					addr[U_PLANE]);
> > +		else
> > +			kmb_write_lcd(kmb,
> > +
> LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> > +					addr[U_PLANE]);
> > +
> > +		if (num_planes =3D=3D 3) {
> > +			kmb_write_lcd(kmb,
> > +
> LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
> > +				      ((width) * fb->format->cpp[0]));
> > +
> > +			kmb_write_lcd(kmb,
> > +
> LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
> > +				      ((width) * fb->format->cpp[0]));
> > +
> > +			addr[V_PLANE] =3D drm_fb_cma_get_gem_addr(fb,
> > +								plane->state,
> > +								V_PLANE);
> > +
> > +			/* check if Cb/Cr is swapped*/
> > +			if (val & LCD_LAYER_CRCB_ORDER)
> > +				kmb_write_lcd(kmb,
> > +
> LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> > +					      addr[V_PLANE]);
> > +			else
> > +				kmb_write_lcd(kmb,
> > +
> LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> > +					      addr[V_PLANE]);
> > +		}
> > +	}
> > +
> > +	kmb_write_lcd(kmb, LCD_LAYERn_WIDTH(plane_id), src_w - 1);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_HEIGHT(plane_id), src_h - 1);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_COL_START(plane_id), crtc_x);
> > +	kmb_write_lcd(kmb, LCD_LAYERn_ROW_START(plane_id), crtc_y);
> > +
> > +	val |=3D LCD_LAYER_FIFO_100;
> > +
> > +	if (val & LCD_LAYER_PLANAR_STORAGE) {
> > +		val |=3D LCD_LAYER_CSC_EN;
> > +
> > +		/* Enable CSC if input is planar and output is RGB */
> > +		config_csc(kmb, plane_id);
> > +	}
> > +
> > +	kmb_write_lcd(kmb, LCD_LAYERn_CFG(plane_id), val);
> > +
> > +	switch (plane_id) {
> > +	case LAYER_0:
> > +		ctrl =3D LCD_CTRL_VL1_ENABLE;
> > +		break;
> > +	case LAYER_1:
> > +		ctrl =3D LCD_CTRL_VL2_ENABLE;
> > +		break;
> > +	case LAYER_2:
> > +		ctrl =3D LCD_CTRL_GL1_ENABLE;
> > +		break;
> > +	case LAYER_3:
> > +		ctrl =3D LCD_CTRL_GL2_ENABLE;
> > +		break;
> > +	}
> > +
> > +	ctrl |=3D LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
> > +	    | LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
> > +
> > +	/* LCD is connected to MIPI on kmb
> > +	 * Therefore this bit is required for DSI Tx
> > +	 */
> > +	ctrl |=3D LCD_CTRL_VHSYNC_IDLE_LVL;
> > +
> > +	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, ctrl);
> > +
> > +	/* FIXME no doc on how to set output format,these values are
> > +	 * taken from the Myriadx tests
> > +	 */
> > +	out_format |=3D LCD_OUTF_FORMAT_RGB888;
> > +
> > +	/* Leave RGB order,conversion mode and clip mode to default */
> > +	/* do not interleave RGB channels for mipi Tx compatibility */
> > +	out_format |=3D LCD_OUTF_MIPI_RGB_MODE;
> > +	kmb_write_lcd(kmb, LCD_OUT_FORMAT_CFG, out_format);
> > +
> > +	dma_cfg =3D LCD_DMA_LAYER_ENABLE |
> LCD_DMA_LAYER_VSTRIDE_EN |
> > +	    LCD_DMA_LAYER_CONT_UPDATE |
> LCD_DMA_LAYER_AXI_BURST_16;
> > +
> > +	/* Enable DMA */
> > +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
> > +	drm_dbg(&kmb->drm, "dma_cfg=3D0x%x LCD_DMA_CFG=3D0x%x\n",
> dma_cfg,
> > +		kmb_read_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id)));
> > +
> > +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, LCD_INT_EOF |
> > +			LCD_INT_DMA_ERR);
> > +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE, LCD_INT_EOF |
> > +			LCD_INT_DMA_ERR);
> > +}
> > +
> > +static const struct drm_plane_helper_funcs kmb_plane_helper_funcs =3D =
{
> > +	.atomic_check =3D kmb_plane_atomic_check,
> > +	.atomic_update =3D kmb_plane_atomic_update,
> > +	.atomic_disable =3D kmb_plane_atomic_disable
> > +};
> > +
> > +void kmb_plane_destroy(struct drm_plane *plane)
> > +{
> > +	struct kmb_plane *kmb_plane =3D to_kmb_plane(plane);
> > +
> > +	drm_plane_cleanup(plane);
> > +	kfree(kmb_plane);
> > +}
> > +
> > +static const struct drm_plane_funcs kmb_plane_funcs =3D {
> > +	.update_plane =3D drm_atomic_helper_update_plane,
> > +	.disable_plane =3D drm_atomic_helper_disable_plane,
> > +	.destroy =3D kmb_plane_destroy,
> > +	.reset =3D drm_atomic_helper_plane_reset,
> > +	.atomic_duplicate_state =3D
> drm_atomic_helper_plane_duplicate_state,
> > +	.atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state,
> > +};
> > +
> > +struct kmb_plane *kmb_plane_init(struct drm_device *drm)
> > +{
> > +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> > +	struct kmb_plane *plane =3D NULL;
> > +	struct kmb_plane *primary =3D NULL;
> > +	int i =3D 0;
> > +	int ret =3D 0;
> > +	enum drm_plane_type plane_type;
> > +	const u32 *plane_formats;
> > +	int num_plane_formats;
> > +
> > +	for (i =3D 0; i < KMB_MAX_PLANES; i++) {
> > +		plane =3D drmm_kzalloc(drm, sizeof(*plane), GFP_KERNEL);
> > +
> > +		if (!plane) {
> > +			drm_err(drm, "Failed to allocate plane\n");
> > +			return ERR_PTR(-ENOMEM);
> > +		}
> > +
> > +		plane_type =3D (i =3D=3D 0) ? DRM_PLANE_TYPE_PRIMARY :
> > +		    DRM_PLANE_TYPE_OVERLAY;
> > +		if (i < 2) {
> > +			plane_formats =3D kmb_formats_v;
> > +			num_plane_formats =3D
> ARRAY_SIZE(kmb_formats_v);
> > +		} else {
> > +			plane_formats =3D kmb_formats_g;
> > +			num_plane_formats =3D
> ARRAY_SIZE(kmb_formats_g);
> > +		}
> > +
> > +		ret =3D drm_universal_plane_init(drm, &plane->base_plane,
> > +					       POSSIBLE_CRTCS,
> &kmb_plane_funcs,
> > +					       plane_formats,
> num_plane_formats,
> > +					       NULL, plane_type, "plane %d", i);
> > +		if (ret < 0) {
> > +			drm_err(drm, "drm_universal_plane_init failed
> (ret=3D%d)",
> > +				ret);
> > +			goto cleanup;
> > +		}
> > +		drm_dbg(drm, "%s : %d i=3D%d type=3D%d",
> > +			__func__, __LINE__,
> > +			  i, plane_type);
> > +		drm_plane_helper_add(&plane->base_plane,
> > +				     &kmb_plane_helper_funcs);
> > +		if (plane_type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> > +			primary =3D plane;
> > +			kmb->plane =3D plane;
> > +		}
> > +		drm_dbg(drm, "%s : %d primary=3D%p\n", __func__,
> __LINE__,
> > +			&primary->base_plane);
> > +		plane->id =3D i;
> > +	}
> > +
> > +	return primary;
> > +cleanup:
> > +	drmm_kfree(drm, plane);
> > +	return ERR_PTR(ret);
> > +}
> > diff --git a/drivers/gpu/drm/kmb/kmb_plane.h
> b/drivers/gpu/drm/kmb/kmb_plane.h
> > new file mode 100644
> > index 0000000..141cdaa
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_plane.h
> > @@ -0,0 +1,110 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only
> > + *
> > + * Copyright (c) 2018-2020 Intel Corporation
> > + */
> > +
> > +#ifndef __KMB_PLANE_H__
> > +#define __KMB_PLANE_H__
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
> > +#define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
> > +
> > +enum layer_id {
> > +	LAYER_0,
> > +	LAYER_1,
> > +	LAYER_2,
> > +	LAYER_3,
> > +	/* KMB_MAX_PLANES */
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
> > +	unsigned char id;
> > +};
> > +
> > +/* Graphics layer (layers 2 & 3) formats, only packed formats  are
> supported */
> > +static const u32 kmb_formats_g[] =3D {
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
> > +/* Video layer ( 0 & 1) formats, packed and planar formats are
> supported */
> > +static const u32 kmb_formats_v[] =3D {
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
> > +static const u32 csc_coef_lcd[] =3D {
> > +	1024, 0, 1436,
> > +	1024, -352, -731,
> > +	1024, 1814, 0,
> > +	-179, 125, -226
> > +};
>=20
> The static const arrays above look a bit strange in a header file (and
> could result in duplication in the driver .ko), please move to .c files.
> Headers should only contain definitions, not declarations of actual
> storage.
>=20
> Cheers, Daniel
>=20
> > +
> > +struct layer_status {
> > +	bool disable;
> > +	u32 ctrl;
> > +};
> > +
> > +struct kmb_plane *kmb_plane_init(struct drm_device *drm);
> > +void kmb_plane_destroy(struct drm_plane *plane);
> > +#endif /* __KMB_PLANE_H__ */
> > --
> > 2.7.4
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--_002_BY5PR11MB41825BA878A60FBCFF8655E78C300BY5PR11MB4182namp_
Content-Type: text/plain; name="5.9-igt-kms_vblank.txt"
Content-Description: 5.9-igt-kms_vblank.txt
Content-Disposition: attachment; filename="5.9-igt-kms_vblank.txt";
	size=14926; creation-date="Thu, 01 Oct 2020 18:01:16 GMT";
	modification-date="Thu, 01 Oct 2020 17:49:52 GMT"
Content-Transfer-Encoding: base64

cm9vdEBrZWVtYmF5On4vaWd0L3Rlc3RzIyAuL2ttc192YmxhbmsgLS1yIGludmFsaWQNCklHVC1W
ZXJzaW9uOiAxLjI1LWcwZWM5NjIwMSAoYWFyY2g2NCkgKExpbnV4OiA1LjkuMC1yYzctaW50ZWwt
c3RhbmRhcmQgYWFyY2g2NCkNClN0YXJ0aW5nIHN1YnRlc3Q6IGludmFsaWQNClN1YnRlc3QgaW52
YWxpZDogU1VDQ0VTUyAoMC4wMDBzKQ0KDQpyb290QGtlZW1iYXk6fi9pZ3QvdGVzdHMjIC4va21z
X3ZibGFuayAtLXIgY3J0Yy1pZA0KSUdULVZlcnNpb246IDEuMjUtZzBlYzk2MjAxIChhYXJjaDY0
KSAoTGludXg6IDUuOS4wLXJjNy1pbnRlbC1zdGFuZGFyZCBhYXJjaDY0KQ0KU3RhcnRpbmcgc3Vi
dGVzdDogY3J0Yy1pZA0KU3VidGVzdCBjcnRjLWlkOiBTVUNDRVNTICgwLjEwMnMpDQoNCnJvb3RA
a2VlbWJheTp+L2lndC90ZXN0cyMgLi9rbXNfdmJsYW5rIC0tciBwaXBlLUEtYWNjdXJhY3ktaWRs
ZQ0KSUdULVZlcnNpb246IDEuMjUtZzBlYzk2MjAxIChhYXJjaDY0KSAoTGludXg6IDUuOS4wLXJj
Ny1pbnRlbC1zdGFuZGFyZCBhYXJjaDY0KQ0KU3RhcnRpbmcgc3VidGVzdDogcGlwZS1BLWFjY3Vy
YWN5LWlkbGUNCkJlZ2lubmluZyBwaXBlLUEtYWNjdXJhY3ktaWRsZSBvbiBwaXBlIEEsIGNvbm5l
Y3RvciBIRE1JLUEtMQ0KKGttc192Ymxhbms6ODY5KSBDUklUSUNBTDogVGVzdCBhc3NlcnRpb24g
ZmFpbHVyZSBmdW5jdGlvbiBhY2N1cmFjeSwgZmlsZSBrbXNfdmJsYW5rLmM6MjU4Og0KKGttc192
Ymxhbms6ODY5KSBDUklUSUNBTDogRmFpbGVkIGFzc2VydGlvbjogdmJsLnJlcGx5LnNlcXVlbmNl
ID09IHRhcmdldA0KKGttc192Ymxhbms6ODY5KSBDUklUSUNBTDogTGFzdCBlcnJubzogMiwgTm8g
c3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KKGttc192Ymxhbms6ODY5KSBDUklUSUNBTDogZXJyb3I6
IDU4NzUgIT0gNTUxOQ0KU3RhY2sgdHJhY2U6DQogICMwIC9ob21lL3Jvb3QvaWd0L2xpYi9pZ3Rf
Y29yZS5jOjE3MjcgX19pZ3RfZmFpbF9hc3NlcnQoKQ0KICAjMSBbYWNjdXJhY3krMHgyODRdDQog
ICMyIC9ob21lL3Jvb3QvaWd0L3Rlc3RzL2ttc192YmxhbmsuYzoxNTYgcnVuX3Rlc3QoKQ0KICAj
MyAvaG9tZS9yb290L2lndC90ZXN0cy9rbXNfdmJsYW5rLmM6NDUwIHJ1bl9zdWJ0ZXN0c19mb3Jf
cGlwZSgpDQogICM0IC9ob21lL3Jvb3QvaWd0L3Rlc3RzL2ttc192YmxhbmsuYzo1MzUgX19yZWFs
X21haW41MTYoKQ0KICAjNSAvaG9tZS9yb290L2lndC90ZXN0cy9rbXNfdmJsYW5rLmM6NTE2IG1h
aW4oKQ0KICAjNiAuLi9jc3UvbGliYy1zdGFydC5jOjM0MiBfX2xpYmNfc3RhcnRfbWFpbigpDQog
ICM3IC4uL3N5c2RlcHMvYWFyY2g2NC9zdGFydC5TOjk3ICR4KCkNCiAgIzggLi4vc3lzZGVwcy9h
YXJjaDY0L3N0YXJ0LlM6OTcgJHgoKQ0KU3VidGVzdCBwaXBlLUEtYWNjdXJhY3ktaWRsZSBmYWls
ZWQuDQoqKioqIERFQlVHICoqKioNCihrbXNfdmJsYW5rOjg2OSkgaWd0LWttcy1ERUJVRzogZGlz
cGxheTogSERNSS1BLTE6IHNldF9waXBlKEEpDQooa21zX3ZibGFuazo4NjkpIGlndC1rbXMtREVC
VUc6IGRpc3BsYXk6IEhETUktQS0xOiBTZWxlY3RpbmcgcGlwZSBBDQooa21zX3ZibGFuazo4Njkp
IGlndC1mYi1ERUJVRzogaWd0X2NyZWF0ZV9mYl93aXRoX2JvX3NpemUod2lkdGg9MTkyMCwgaGVp
Z2h0PTEwODAsIGZvcm1hdD1YUjI0KDB4MzQzMjUyNTgpLCBtb2RpZmllcj0weDAsIHNpemU9MCkN
CihrbXNfdmJsYW5rOjg2OSkgaWd0LWZiLURFQlVHOiBpZ3RfY3JlYXRlX2ZiX3dpdGhfYm9fc2l6
ZShoYW5kbGU9MSwgcGl0Y2g9NzY4MCkNCihrbXNfdmJsYW5rOjg2OSkgaWd0LWZiLURFQlVHOiBU
ZXN0IHJlcXVpcmVtZW50IHBhc3NlZDogY2Fpcm9fc3VyZmFjZV9zdGF0dXMoZmItPmNhaXJvX3N1
cmZhY2UpID09IENBSVJPX1NUQVRVU19TVUNDRVNTDQooa21zX3ZibGFuazo4NjkpIGlndC1rbXMt
REVCVUc6IFRlc3QgcmVxdWlyZW1lbnQgcGFzc2VkOiBwbGFuZV9pZHggPj0gMCAmJiBwbGFuZV9p
ZHggPCBwaXBlLT5uX3BsYW5lcw0KKGttc192Ymxhbms6ODY5KSBpZ3Qta21zLURFQlVHOiBkaXNw
bGF5OiBBLjA6IHBsYW5lX3NldF9mYigzOCkNCihrbXNfdmJsYW5rOjg2OSkgaWd0LWttcy1ERUJV
RzogZGlzcGxheTogQS4wOiBwbGFuZV9zZXRfc2l6ZSAoMTkyMHgxMDgwKQ0KKGttc192Ymxhbms6
ODY5KSBpZ3Qta21zLURFQlVHOiBkaXNwbGF5OiBBLjA6IGZiX3NldF9wb3NpdGlvbigwLDApDQoo
a21zX3ZibGFuazo4NjkpIGlndC1rbXMtREVCVUc6IGRpc3BsYXk6IEEuMDogZmJfc2V0X3NpemUo
MTkyMHgxMDgwKQ0KKGttc192Ymxhbms6ODY5KSBpZ3Qta21zLURFQlVHOiBkaXNwbGF5OiBjb21t
aXQgew0KKGttc192Ymxhbms6ODY5KSBpZ3Qta21zLURFQlVHOiBkaXNwbGF5OiAgICAgSERNSS1B
LTE6IFNldENydGMgcGlwZSBBLCBmYiAzOCwgc3JjICgwLCAwKSwgbW9kZSAxOTIweDEwODANCihr
bXNfdmJsYW5rOjg2OSkgaWd0LWttcy1ERUJVRzogZGlzcGxheTogfQ0KKGttc192Ymxhbms6ODY5
KSBpZ3QtZGVidWdmcy1ERUJVRzogT3BlbmluZyBkZWJ1Z2ZzIGRpcmVjdG9yeSAnL3N5cy9rZXJu
ZWwvZGVidWcvZHJpLzEnDQooa21zX3ZibGFuazo4NjkpIElORk86IEJlZ2lubmluZyBwaXBlLUEt
YWNjdXJhY3ktaWRsZSBvbiBwaXBlIEEsIGNvbm5lY3RvciBIRE1JLUEtMQ0KKGttc192Ymxhbms6
ODY5KSBDUklUSUNBTDogVGVzdCBhc3NlcnRpb24gZmFpbHVyZSBmdW5jdGlvbiBhY2N1cmFjeSwg
ZmlsZSBrbXNfdmJsYW5rLmM6MjU4Og0KKGttc192Ymxhbms6ODY5KSBDUklUSUNBTDogRmFpbGVk
IGFzc2VydGlvbjogdmJsLnJlcGx5LnNlcXVlbmNlID09IHRhcmdldA0KKGttc192Ymxhbms6ODY5
KSBDUklUSUNBTDogTGFzdCBlcnJubzogMiwgTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KKGtt
c192Ymxhbms6ODY5KSBDUklUSUNBTDogZXJyb3I6IDU4NzUgIT0gNTUxOQ0KKGttc192Ymxhbms6
ODY5KSBpZ3QtY29yZS1JTkZPOiBTdGFjayB0cmFjZToNCihrbXNfdmJsYW5rOjg2OSkgaWd0LWNv
cmUtSU5GTzogICAjMCAvaG9tZS9yb290L2lndC9saWIvaWd0X2NvcmUuYzoxNzI3IF9faWd0X2Zh
aWxfYXNzZXJ0KCkNCihrbXNfdmJsYW5rOjg2OSkgaWd0LWNvcmUtSU5GTzogICAjMSBbYWNjdXJh
Y3krMHgyODRdDQooa21zX3ZibGFuazo4NjkpIGlndC1jb3JlLUlORk86ICAgIzIgL2hvbWUvcm9v
dC9pZ3QvdGVzdHMva21zX3ZibGFuay5jOjE1NiBydW5fdGVzdCgpDQooa21zX3ZibGFuazo4Njkp
IGlndC1jb3JlLUlORk86ICAgIzMgL2hvbWUvcm9vdC9pZ3QvdGVzdHMva21zX3ZibGFuay5jOjQ1
MCBydW5fc3VidGVzdHNfZm9yX3BpcGUoKQ0KKGttc192Ymxhbms6ODY5KSBpZ3QtY29yZS1JTkZP
OiAgICM0IC9ob21lL3Jvb3QvaWd0L3Rlc3RzL2ttc192YmxhbmsuYzo1MzUgX19yZWFsX21haW41
MTYoKQ0KKGttc192Ymxhbms6ODY5KSBpZ3QtY29yZS1JTkZPOiAgICM1IC9ob21lL3Jvb3QvaWd0
L3Rlc3RzL2ttc192YmxhbmsuYzo1MTYgbWFpbigpDQooa21zX3ZibGFuazo4NjkpIGlndC1jb3Jl
LUlORk86ICAgIzYgLi4vY3N1L2xpYmMtc3RhcnQuYzozNDIgX19saWJjX3N0YXJ0X21haW4oKQ0K
KGttc192Ymxhbms6ODY5KSBpZ3QtY29yZS1JTkZPOiAgICM3IC4uL3N5c2RlcHMvYWFyY2g2NC9z
dGFydC5TOjk3ICR4KCkNCihrbXNfdmJsYW5rOjg2OSkgaWd0LWNvcmUtSU5GTzogICAjOCAuLi9z
eXNkZXBzL2FhcmNoNjQvc3RhcnQuUzo5NyAkeCgpDQoqKioqICBFTkQgICoqKioNClN1YnRlc3Qg
cGlwZS1BLWFjY3VyYWN5LWlkbGU6IEZBSUwgKDIuMzI4cykNCg0Kcm9vdEBrZWVtYmF5On4vaWd0
L3Rlc3RzIyAuL2ttc192YmxhbmsgLS1yIHBpcGUtQS1xdWVyeS1pZGxlDQpJR1QtVmVyc2lvbjog
MS4yNS1nMGVjOTYyMDEgKGFhcmNoNjQpIChMaW51eDogNS45LjAtcmM3LWludGVsLXN0YW5kYXJk
IGFhcmNoNjQpDQpTdGFydGluZyBzdWJ0ZXN0OiBwaXBlLUEtcXVlcnktaWRsZQ0KQmVnaW5uaW5n
IHBpcGUtQS1xdWVyeS1pZGxlIG9uIHBpcGUgQSwgY29ubmVjdG9yIEhETUktQS0xDQpUaW1lIHRv
IHF1ZXJ5IGN1cnJlbnQgY291bnRlciAoaWRsZSk6ICAgICAgICAgICAgMTQuODk5wrVzDQoNCnBp
cGUtQS1xdWVyeS1pZGxlIG9uIHBpcGUgQSwgY29ubmVjdG9yIEhETUktQS0xOiBQQVNTRUQNCg0K
U3VidGVzdCBwaXBlLUEtcXVlcnktaWRsZTogU1VDQ0VTUyAoMC40NThzKQ0KDQpyb290QGtlZW1i
YXk6fi9pZ3QvdGVzdHMjIC4va21zX3ZibGFuayAtLXIgcGlwZS1BLXF1ZXJ5LWlkbGUtaGFuZw0K
SUdULVZlcnNpb246IDEuMjUtZzBlYzk2MjAxIChhYXJjaDY0KSAoTGludXg6IDUuOS4wLXJjNy1p
bnRlbC1zdGFuZGFyZCBhYXJjaDY0KQ0KU3RhcnRpbmcgc3VidGVzdDogcGlwZS1BLXF1ZXJ5LWlk
bGUtaGFuZw0KVGVzdCByZXF1aXJlbWVudCBub3QgbWV0IGluIGZ1bmN0aW9uIGdlbV9jb250ZXh0
X3JlcXVpcmVfYmFubmFibGUsIGZpbGUgaTkxNS9nZW1fY29udGV4dC5jOjI0OToNClRlc3QgcmVx
dWlyZW1lbnQ6IGhhc19iYW5fcGVyaW9kIHx8IGhhc19iYW5uYWJsZQ0KTGFzdCBlcnJubzogMjIs
IEludmFsaWQgYXJndW1lbnQNClN1YnRlc3QgcGlwZS1BLXF1ZXJ5LWlkbGUtaGFuZzogU0tJUCAo
MC4wMDBzKQ0KDQpyb290QGtlZW1iYXk6fi9pZ3QvdGVzdHMjIC4va21zX3ZibGFuayAtLXIgcGlw
ZS1BLXF1ZXJ5LWZvcmtlZA0KSUdULVZlcnNpb246IDEuMjUtZzBlYzk2MjAxIChhYXJjaDY0KSAo
TGludXg6IDUuOS4wLXJjNy1pbnRlbC1zdGFuZGFyZCBhYXJjaDY0KQ0KU3RhcnRpbmcgc3VidGVz
dDogcGlwZS1BLXF1ZXJ5LWZvcmtlZA0KQmVnaW5uaW5nIHBpcGUtQS1xdWVyeS1mb3JrZWQgb24g
cGlwZSBBLCBjb25uZWN0b3IgSERNSS1BLTENClRpbWUgdG8gcXVlcnkgY3VycmVudCBjb3VudGVy
IChpZGxlKTogICAgICAgICAgICAxNC43MzTCtXMNClRpbWUgdG8gcXVlcnkgY3VycmVudCBjb3Vu
dGVyIChpZGxlKTogICAgICAgICAgICAxNC44MDLCtXMNClRpbWUgdG8gcXVlcnkgY3VycmVudCBj
b3VudGVyIChpZGxlKTogICAgICAgICAgICAxNC43NzjCtXMNClRpbWUgdG8gcXVlcnkgY3VycmVu
dCBjb3VudGVyIChpZGxlKTogICAgICAgICAgICAxNC43NjbCtXMNCg0KcGlwZS1BLXF1ZXJ5LWZv
cmtlZCBvbiBwaXBlIEEsIGNvbm5lY3RvciBIRE1JLUEtMTogUEFTU0VEDQoNClN1YnRlc3QgcGlw
ZS1BLXF1ZXJ5LWZvcmtlZDogU1VDQ0VTUyAoMC41NDhzKQ0KDQpyb290QGtlZW1iYXk6fi9pZ3Qv
dGVzdHMjIC4va21zX3ZibGFuayAtLXIgcGlwZS1BLXF1ZXJ5LWZvcmtlZC1oYW5nDQpJR1QtVmVy
c2lvbjogMS4yNS1nMGVjOTYyMDEgKGFhcmNoNjQpIChMaW51eDogNS45LjAtcmM3LWludGVsLXN0
YW5kYXJkIGFhcmNoNjQpDQpTdGFydGluZyBzdWJ0ZXN0OiBwaXBlLUEtcXVlcnktZm9ya2VkLWhh
bmcNClRlc3QgcmVxdWlyZW1lbnQgbm90IG1ldCBpbiBmdW5jdGlvbiBnZW1fY29udGV4dF9yZXF1
aXJlX2Jhbm5hYmxlLCBmaWxlIGk5MTUvZ2VtX2NvbnRleHQuYzoyNDk6DQpUZXN0IHJlcXVpcmVt
ZW50OiBoYXNfYmFuX3BlcmlvZCB8fCBoYXNfYmFubmFibGUNCkxhc3QgZXJybm86IDIyLCBJbnZh
bGlkIGFyZ3VtZW50DQpTdWJ0ZXN0IHBpcGUtQS1xdWVyeS1mb3JrZWQtaGFuZzogU0tJUCAoMC4w
MDBzKQ0KDQpyb290QGtlZW1iYXk6fi9pZ3QvdGVzdHMjIC4va21zX3ZibGFuayAtLXIgcGlwZS1B
LXF1ZXJ5LWJ1c3kNCklHVC1WZXJzaW9uOiAxLjI1LWcwZWM5NjIwMSAoYWFyY2g2NCkgKExpbnV4
OiA1LjkuMC1yYzctaW50ZWwtc3RhbmRhcmQgYWFyY2g2NCkNClN0YXJ0aW5nIHN1YnRlc3Q6IHBp
cGUtQS1xdWVyeS1idXN5DQpCZWdpbm5pbmcgcGlwZS1BLXF1ZXJ5LWJ1c3kgb24gcGlwZSBBLCBj
b25uZWN0b3IgSERNSS1BLTENClRpbWUgdG8gcXVlcnkgY3VycmVudCBjb3VudGVyIChidXN5KTog
ICAgICAgICAgICAxMy41MjDCtXMNCg0KcGlwZS1BLXF1ZXJ5LWJ1c3kgb24gcGlwZSBBLCBjb25u
ZWN0b3IgSERNSS1BLTE6IFBBU1NFRA0KDQpTdWJ0ZXN0IHBpcGUtQS1xdWVyeS1idXN5OiBTVUND
RVNTICgwLjUyN3MpDQoNCnJvb3RAa2VlbWJheTp+L2lndC90ZXN0cyMgLi9rbXNfdmJsYW5rIC0t
ciBwaXBlLUEtcXVlcnktYnVzeS1oYW5nDQpJR1QtVmVyc2lvbjogMS4yNS1nMGVjOTYyMDEgKGFh
cmNoNjQpIChMaW51eDogNS45LjAtcmM3LWludGVsLXN0YW5kYXJkIGFhcmNoNjQpDQpTdGFydGlu
ZyBzdWJ0ZXN0OiBwaXBlLUEtcXVlcnktYnVzeS1oYW5nDQpUZXN0IHJlcXVpcmVtZW50IG5vdCBt
ZXQgaW4gZnVuY3Rpb24gZ2VtX2NvbnRleHRfcmVxdWlyZV9iYW5uYWJsZSwgZmlsZSBpOTE1L2dl
bV9jb250ZXh0LmM6MjQ5Og0KVGVzdCByZXF1aXJlbWVudDogaGFzX2Jhbl9wZXJpb2QgfHwgaGFz
X2Jhbm5hYmxlDQpMYXN0IGVycm5vOiAyMiwgSW52YWxpZCBhcmd1bWVudA0KU3VidGVzdCBwaXBl
LUEtcXVlcnktYnVzeS1oYW5nOiBTS0lQICgwLjAwMHMpDQoNCnJvb3RAa2VlbWJheTp+L2lndC90
ZXN0cyMgLi9rbXNfdmJsYW5rIC0tciBwaXBlLUEtcXVlcnktZm9ya2VkLWJ1c3kNCklHVC1WZXJz
aW9uOiAxLjI1LWcwZWM5NjIwMSAoYWFyY2g2NCkgKExpbnV4OiA1LjkuMC1yYzctaW50ZWwtc3Rh
bmRhcmQgYWFyY2g2NCkNClN0YXJ0aW5nIHN1YnRlc3Q6IHBpcGUtQS1xdWVyeS1mb3JrZWQtYnVz
eQ0KQmVnaW5uaW5nIHBpcGUtQS1xdWVyeS1mb3JrZWQtYnVzeSBvbiBwaXBlIEEsIGNvbm5lY3Rv
ciBIRE1JLUEtMQ0KVGltZSB0byBxdWVyeSBjdXJyZW50IGNvdW50ZXIgKGJ1c3kpOiAgICAgICAg
ICAgIDEzLjYwOcK1cw0KVGltZSB0byBxdWVyeSBjdXJyZW50IGNvdW50ZXIgKGJ1c3kpOiAgICAg
ICAgICAgIDEzLjU3MsK1cw0KVGltZSB0byBxdWVyeSBjdXJyZW50IGNvdW50ZXIgKGJ1c3kpOiAg
ICAgICAgICAgIDEzLjY3OMK1cw0KVGltZSB0byBxdWVyeSBjdXJyZW50IGNvdW50ZXIgKGJ1c3kp
OiAgICAgICAgICAgIDEzLjYwMcK1cw0KDQpwaXBlLUEtcXVlcnktZm9ya2VkLWJ1c3kgb24gcGlw
ZSBBLCBjb25uZWN0b3IgSERNSS1BLTE6IFBBU1NFRA0KDQpTdWJ0ZXN0IHBpcGUtQS1xdWVyeS1m
b3JrZWQtYnVzeTogU1VDQ0VTUyAoMC41MDNzKQ0KDQpyb290QGtlZW1iYXk6fi9pZ3QvdGVzdHMj
IC4va21zX3ZibGFuayAtLXIgcGlwZS1BLXF1ZXJ5LWZvcmtlZC1idXN5LWhhbmcNCklHVC1WZXJz
aW9uOiAxLjI1LWcwZWM5NjIwMSAoYWFyY2g2NCkgKExpbnV4OiA1LjkuMC1yYzctaW50ZWwtc3Rh
bmRhcmQgYWFyY2g2NCkNClN0YXJ0aW5nIHN1YnRlc3Q6IHBpcGUtQS1xdWVyeS1mb3JrZWQtYnVz
eS1oYW5nDQpUZXN0IHJlcXVpcmVtZW50IG5vdCBtZXQgaW4gZnVuY3Rpb24gZ2VtX2NvbnRleHRf
cmVxdWlyZV9iYW5uYWJsZSwgZmlsZSBpOTE1L2dlbV9jb250ZXh0LmM6MjQ5Og0KVGVzdCByZXF1
aXJlbWVudDogaGFzX2Jhbl9wZXJpb2QgfHwgaGFzX2Jhbm5hYmxlDQpMYXN0IGVycm5vOiAyMiwg
SW52YWxpZCBhcmd1bWVudA0KU3VidGVzdCBwaXBlLUEtcXVlcnktZm9ya2VkLWJ1c3ktaGFuZzog
U0tJUCAoMC4wMDBzKQ0KDQpyb290QGtlZW1iYXk6fi9pZ3QvdGVzdHMjIC4va21zX3ZibGFuayAt
LXIgcGlwZS1BLXdhaXQtaWRsZQ0KSUdULVZlcnNpb246IDEuMjUtZzBlYzk2MjAxIChhYXJjaDY0
KSAoTGludXg6IDUuOS4wLXJjNy1pbnRlbC1zdGFuZGFyZCBhYXJjaDY0KQ0KU3RhcnRpbmcgc3Vi
dGVzdDogcGlwZS1BLXdhaXQtaWRsZQ0KQmVnaW5uaW5nIHBpcGUtQS13YWl0LWlkbGUgb24gcGlw
ZSBBLCBjb25uZWN0b3IgSERNSS1BLTENClRpbWUgdG8gd2FpdCBmb3IgNjEvMTIyIHZibGFua3Mg
KGlkbGUpOiAgICAgICAgIDg0NjMuOTAywrVzDQoNCnBpcGUtQS13YWl0LWlkbGUgb24gcGlwZSBB
LCBjb25uZWN0b3IgSERNSS1BLTE6IFBBU1NFRA0KDQpTdWJ0ZXN0IHBpcGUtQS13YWl0LWlkbGU6
IFNVQ0NFU1MgKDAuNTg0cykNCg0Kcm9vdEBrZWVtYmF5On4vaWd0L3Rlc3RzIyAuL2ttc192Ymxh
bmsgLS1yIHBpcGUtQS13YWl0LWlkbGUtaGFuZw0KSUdULVZlcnNpb246IDEuMjUtZzBlYzk2MjAx
IChhYXJjaDY0KSAoTGludXg6IDUuOS4wLXJjNy1pbnRlbC1zdGFuZGFyZCBhYXJjaDY0KQ0KU3Rh
cnRpbmcgc3VidGVzdDogcGlwZS1BLXdhaXQtaWRsZS1oYW5nDQpUZXN0IHJlcXVpcmVtZW50IG5v
dCBtZXQgaW4gZnVuY3Rpb24gZ2VtX2NvbnRleHRfcmVxdWlyZV9iYW5uYWJsZSwgZmlsZSBpOTE1
L2dlbV9jb250ZXh0LmM6MjQ5Og0KVGVzdCByZXF1aXJlbWVudDogaGFzX2Jhbl9wZXJpb2QgfHwg
aGFzX2Jhbm5hYmxlDQpMYXN0IGVycm5vOiAyMiwgSW52YWxpZCBhcmd1bWVudA0KU3VidGVzdCBw
aXBlLUEtd2FpdC1pZGxlLWhhbmc6IFNLSVAgKDAuMDAwcykNCg0Kcm9vdEBrZWVtYmF5On4vaWd0
L3Rlc3RzIyAuL2ttc192YmxhbmsgLS1yIHBpcGUtQS13YWl0LWZvcmtlZA0KSUdULVZlcnNpb246
IDEuMjUtZzBlYzk2MjAxIChhYXJjaDY0KSAoTGludXg6IDUuOS4wLXJjNy1pbnRlbC1zdGFuZGFy
ZCBhYXJjaDY0KQ0KU3RhcnRpbmcgc3VidGVzdDogcGlwZS1BLXdhaXQtZm9ya2VkDQpCZWdpbm5p
bmcgcGlwZS1BLXdhaXQtZm9ya2VkIG9uIHBpcGUgQSwgY29ubmVjdG9yIEhETUktQS0xDQpUaW1l
IHRvIHdhaXQgZm9yIDYxLzEyMiB2YmxhbmtzIChpZGxlKTogICAgICAgICAxNjIzMC4yNjLCtXMN
ClRpbWUgdG8gd2FpdCBmb3IgNjIvMTIyIHZibGFua3MgKGlkbGUpOiAgICAgICAgIDE2MjQ1LjUz
MsK1cw0KVGltZSB0byB3YWl0IGZvciA2Mi8xMjIgdmJsYW5rcyAoaWRsZSk6ICAgICAgICAgMTYz
NzYuNTk3wrVzDQpUaW1lIHRvIHdhaXQgZm9yIDYzLzEyMiB2YmxhbmtzIChpZGxlKTogICAgICAg
ICAxNjEyNi4yNzDCtXMNCg0KcGlwZS1BLXdhaXQtZm9ya2VkIG9uIHBpcGUgQSwgY29ubmVjdG9y
IEhETUktQS0xOiBQQVNTRUQNCg0KU3VidGVzdCBwaXBlLUEtd2FpdC1mb3JrZWQ6IFNVQ0NFU1Mg
KDEuMTM1cykNCg0Kcm9vdEBrZWVtYmF5On4vaWd0L3Rlc3RzIyAuL2ttc192YmxhbmsgLS1yIHBp
cGUtQS13YWl0LWZvcmtlZC1oYW5nDQpJR1QtVmVyc2lvbjogMS4yNS1nMGVjOTYyMDEgKGFhcmNo
NjQpIChMaW51eDogNS45LjAtcmM3LWludGVsLXN0YW5kYXJkIGFhcmNoNjQpDQpTdGFydGluZyBz
dWJ0ZXN0OiBwaXBlLUEtd2FpdC1mb3JrZWQtaGFuZw0KVGVzdCByZXF1aXJlbWVudCBub3QgbWV0
IGluIGZ1bmN0aW9uIGdlbV9jb250ZXh0X3JlcXVpcmVfYmFubmFibGUsIGZpbGUgaTkxNS9nZW1f
Y29udGV4dC5jOjI0OToNClRlc3QgcmVxdWlyZW1lbnQ6IGhhc19iYW5fcGVyaW9kIHx8IGhhc19i
YW5uYWJsZQ0KTGFzdCBlcnJubzogMjIsIEludmFsaWQgYXJndW1lbnQNClN1YnRlc3QgcGlwZS1B
LXdhaXQtZm9ya2VkLWhhbmc6IFNLSVAgKDAuMDAwcykNCg0Kcm9vdEBrZWVtYmF5On4vaWd0L3Rl
c3RzIyAuL2ttc192YmxhbmsgLS1yIHBpcGUtQS13YWl0LWJ1c3kNCklHVC1WZXJzaW9uOiAxLjI1
LWcwZWM5NjIwMSAoYWFyY2g2NCkgKExpbnV4OiA1LjkuMC1yYzctaW50ZWwtc3RhbmRhcmQgYWFy
Y2g2NCkNClN0YXJ0aW5nIHN1YnRlc3Q6IHBpcGUtQS13YWl0LWJ1c3kNCkJlZ2lubmluZyBwaXBl
LUEtd2FpdC1idXN5IG9uIHBpcGUgQSwgY29ubmVjdG9yIEhETUktQS0xDQpUaW1lIHRvIHdhaXQg
Zm9yIDYxLzEyMiB2YmxhbmtzIChidXN5KTogICAgICAgICA4NDY0LjkzNMK1cw0KDQpwaXBlLUEt
d2FpdC1idXN5IG9uIHBpcGUgQSwgY29ubmVjdG9yIEhETUktQS0xOiBQQVNTRUQNCg0KU3VidGVz
dCBwaXBlLUEtd2FpdC1idXN5OiBTVUNDRVNTICgwLjY0M3MpDQoNCnJvb3RAa2VlbWJheTp+L2ln
dC90ZXN0cyMgLi9rbXNfdmJsYW5rIC0tciBwaXBlLUEtd2FpdC1idXN5LWhhbmcNCklHVC1WZXJz
aW9uOiAxLjI1LWcwZWM5NjIwMSAoYWFyY2g2NCkgKExpbnV4OiA1LjkuMC1yYzctaW50ZWwtc3Rh
bmRhcmQgYWFyY2g2NCkNClN0YXJ0aW5nIHN1YnRlc3Q6IHBpcGUtQS13YWl0LWJ1c3ktaGFuZw0K
VGVzdCByZXF1aXJlbWVudCBub3QgbWV0IGluIGZ1bmN0aW9uIGdlbV9jb250ZXh0X3JlcXVpcmVf
YmFubmFibGUsIGZpbGUgaTkxNS9nZW1fY29udGV4dC5jOjI0OToNClRlc3QgcmVxdWlyZW1lbnQ6
IGhhc19iYW5fcGVyaW9kIHx8IGhhc19iYW5uYWJsZQ0KTGFzdCBlcnJubzogMjIsIEludmFsaWQg
YXJndW1lbnQNClN1YnRlc3QgcGlwZS1BLXdhaXQtYnVzeS1oYW5nOiBTS0lQICgwLjAwMHMpDQoN
CnJvb3RAa2VlbWJheTp+L2lndC90ZXN0cyMgLi9rbXNfdmJsYW5rIC0tciBwaXBlLUEtd2FpdC1m
b3JrZWQtYnVzeQ0KSUdULVZlcnNpb246IDEuMjUtZzBlYzk2MjAxIChhYXJjaDY0KSAoTGludXg6
IDUuOS4wLXJjNy1pbnRlbC1zdGFuZGFyZCBhYXJjaDY0KQ0KU3RhcnRpbmcgc3VidGVzdDogcGlw
ZS1BLXdhaXQtZm9ya2VkLWJ1c3kNCkJlZ2lubmluZyBwaXBlLUEtd2FpdC1mb3JrZWQtYnVzeSBv
biBwaXBlIEEsIGNvbm5lY3RvciBIRE1JLUEtMQ0KVGltZSB0byB3YWl0IGZvciA2MC8xMjIgdmJs
YW5rcyAoYnVzeSk6ICAgICAgICAgMTY1MDQuMjgzwrVzDQpUaW1lIHRvIHdhaXQgZm9yIDYxLzEy
MiB2YmxhbmtzIChidXN5KTogICAgICAgICAxNjUxNC40MjbCtXMNClRpbWUgdG8gd2FpdCBmb3Ig
NjEvMTIyIHZibGFua3MgKGJ1c3kpOiAgICAgICAgIDE2NjQ3LjIxM8K1cw0KVGltZSB0byB3YWl0
IGZvciA2MC8xMjEgdmJsYW5rcyAoYnVzeSk6ICAgICAgICAgMTY2NTQuMjMzwrVzDQoNCnBpcGUt
QS13YWl0LWZvcmtlZC1idXN5IG9uIHBpcGUgQSwgY29ubmVjdG9yIEhETUktQS0xOiBQQVNTRUQN
Cg0KU3VidGVzdCBwaXBlLUEtd2FpdC1mb3JrZWQtYnVzeTogU1VDQ0VTUyAoMS4xNDJzKQ0KDQpy
b290QGtlZW1iYXk6fi9pZ3QvdGVzdHMjIC4va21zX3ZibGFuayAtLXIgcGlwZS1BLXdhaXQtZm9y
a2VkLWJ1c3ktaGFuZw0KSUdULVZlcnNpb246IDEuMjUtZzBlYzk2MjAxIChhYXJjaDY0KSAoTGlu
dXg6IDUuOS4wLXJjNy1pbnRlbC1zdGFuZGFyZCBhYXJjaDY0KQ0KU3RhcnRpbmcgc3VidGVzdDog
cGlwZS1BLXdhaXQtZm9ya2VkLWJ1c3ktaGFuZw0KVGVzdCByZXF1aXJlbWVudCBub3QgbWV0IGlu
IGZ1bmN0aW9uIGdlbV9jb250ZXh0X3JlcXVpcmVfYmFubmFibGUsIGZpbGUgaTkxNS9nZW1fY29u
dGV4dC5jOjI0OToNClRlc3QgcmVxdWlyZW1lbnQ6IGhhc19iYW5fcGVyaW9kIHx8IGhhc19iYW5u
YWJsZQ0KTGFzdCBlcnJubzogMjIsIEludmFsaWQgYXJndW1lbnQNClN1YnRlc3QgcGlwZS1BLXdh
aXQtZm9ya2VkLWJ1c3ktaGFuZzogU0tJUCAoMC4wMDBzKQ0KDQpyb290QGtlZW1iYXk6fi9pZ3Qv
dGVzdHMjIC4va21zX3ZibGFuayAtLXIgcGlwZS1BLXRzLWNvbnRpbnVhdGlvbi1pZGxlDQpJR1Qt
VmVyc2lvbjogMS4yNS1nMGVjOTYyMDEgKGFhcmNoNjQpIChMaW51eDogNS45LjAtcmM3LWludGVs
LXN0YW5kYXJkIGFhcmNoNjQpDQpTdGFydGluZyBzdWJ0ZXN0OiBwaXBlLUEtdHMtY29udGludWF0
aW9uLWlkbGUNCkJlZ2lubmluZyBwaXBlLUEtdHMtY29udGludWF0aW9uLWlkbGUgb24gcGlwZSBB
LCBjb25uZWN0b3IgSERNSS1BLTENCg0KcGlwZS1BLXRzLWNvbnRpbnVhdGlvbi1pZGxlIG9uIHBp
cGUgQSwgY29ubmVjdG9yIEhETUktQS0xOiBQQVNTRUQNCg0KU3VidGVzdCBwaXBlLUEtdHMtY29u
dGludWF0aW9uLWlkbGU6IFNVQ0NFU1MgKDAuMDcycykNCg0Kcm9vdEBrZWVtYmF5On4vaWd0L3Rl
c3RzIyAuL2ttc192YmxhbmsgLS1yIHBpcGUtQS10cy1jb250aW51YXRpb24taWRsZS1oYW5nDQpJ
R1QtVmVyc2lvbjogMS4yNS1nMGVjOTYyMDEgKGFhcmNoNjQpIChMaW51eDogNS45LjAtcmM3LWlu
dGVsLXN0YW5kYXJkIGFhcmNoNjQpDQpTdGFydGluZyBzdWJ0ZXN0OiBwaXBlLUEtdHMtY29udGlu
dWF0aW9uLWlkbGUtaGFuZw0KVGVzdCByZXF1aXJlbWVudCBub3QgbWV0IGluIGZ1bmN0aW9uIGdl
bV9jb250ZXh0X3JlcXVpcmVfYmFubmFibGUsIGZpbGUgaTkxNS9nZW1fY29udGV4dC5jOjI0OToN
ClRlc3QgcmVxdWlyZW1lbnQ6IGhhc19iYW5fcGVyaW9kIHx8IGhhc19iYW5uYWJsZQ0KTGFzdCBl
cnJubzogMjIsIEludmFsaWQgYXJndW1lbnQNClN1YnRlc3QgcGlwZS1BLXRzLWNvbnRpbnVhdGlv
bi1pZGxlLWhhbmc6IFNLSVAgKDAuMDAwcykNCg0Kcm9vdEBrZWVtYmF5On4vaWd0L3Rlc3RzIyAu
L2ttc192YmxhbmsgLS1yIHBpcGUtQS10cy1jb250aW51YXRpb24tZHBtcy1ycG0NCklHVC1WZXJz
aW9uOiAxLjI1LWcwZWM5NjIwMSAoYWFyY2g2NCkgKExpbnV4OiA1LjkuMC1yYzctaW50ZWwtc3Rh
bmRhcmQgYWFyY2g2NCkNClN0YXJ0aW5nIHN1YnRlc3Q6IHBpcGUtQS10cy1jb250aW51YXRpb24t
ZHBtcy1ycG0NClRlc3QgcmVxdWlyZW1lbnQgbm90IG1ldCBpbiBmdW5jdGlvbiBydW5fdGVzdCwg
ZmlsZSBrbXNfdmJsYW5rLmM6MTI1Og0KVGVzdCByZXF1aXJlbWVudDogaWd0X3NldHVwX3J1bnRp
bWVfcG0oZmQpDQpMYXN0IGVycm5vOiA1LCBJbnB1dC9vdXRwdXQgZXJyb3INClN1YnRlc3QgcGlw
ZS1BLXRzLWNvbnRpbnVhdGlvbi1kcG1zLXJwbTogU0tJUCAoMC4wNjJzKQ0KDQpyb290QGtlZW1i
YXk6fi9pZ3QvdGVzdHMjIC4va21zX3ZibGFuayAtLXIgcGlwZS1BLXRzLWNvbnRpbnVhdGlvbi1k
cG1zLXN1c3BlbmQNCklHVC1WZXJzaW9uOiAxLjI1LWcwZWM5NjIwMSAoYWFyY2g2NCkgKExpbnV4
OiA1LjkuMC1yYzctaW50ZWwtc3RhbmRhcmQgYWFyY2g2NCkNClN0YXJ0aW5nIHN1YnRlc3Q6IHBp
cGUtQS10cy1jb250aW51YXRpb24tZHBtcy1zdXNwZW5kDQpCZWdpbm5pbmcgcGlwZS1BLXRzLWNv
bnRpbnVhdGlvbi1kcG1zLXN1c3BlbmQgb24gcGlwZSBBLCBjb25uZWN0b3IgSERNSS1BLTENClRl
c3QgcmVxdWlyZW1lbnQgbm90IG1ldCBpbiBmdW5jdGlvbiBpZ3Rfc3lzdGVtX3N1c3BlbmRfYXV0
b3Jlc3VtZSwgZmlsZSBpZ3RfYXV4LmM6ODU3Og0KVGVzdCByZXF1aXJlbWVudDogZ2V0X3N1cHBv
cnRlZF9zdXNwZW5kX3N0YXRlcyhwb3dlcl9kaXIpICYgKDEgPDwgc3RhdGUpDQpMYXN0IGVycm5v
OiAyLCBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQpTdWJ0ZXN0IHBpcGUtQS10cy1jb250aW51
YXRpb24tZHBtcy1zdXNwZW5kOiBTS0lQICgwLjA2OHMpDQoNCnJvb3RAa2VlbWJheTp+L2lndC90
ZXN0cyMgLi9rbXNfdmJsYW5rIC0tciBwaXBlLUEtdHMtY29udGludWF0aW9uLXN1c3BlbmQNCklH
VC1WZXJzaW9uOiAxLjI1LWcwZWM5NjIwMSAoYWFyY2g2NCkgKExpbnV4OiA1LjkuMC1yYzctaW50
ZWwtc3RhbmRhcmQgYWFyY2g2NCkNClN0YXJ0aW5nIHN1YnRlc3Q6IHBpcGUtQS10cy1jb250aW51
YXRpb24tc3VzcGVuZA0KQmVnaW5uaW5nIHBpcGUtQS10cy1jb250aW51YXRpb24tc3VzcGVuZCBv
biBwaXBlIEEsIGNvbm5lY3RvciBIRE1JLUEtMQ0KVGVzdCByZXF1aXJlbWVudCBub3QgbWV0IGlu
IGZ1bmN0aW9uIGlndF9zeXN0ZW1fc3VzcGVuZF9hdXRvcmVzdW1lLCBmaWxlIGlndF9hdXguYzo4
NTc6DQpUZXN0IHJlcXVpcmVtZW50OiBnZXRfc3VwcG9ydGVkX3N1c3BlbmRfc3RhdGVzKHBvd2Vy
X2RpcikgJiAoMSA8PCBzdGF0ZSkNCkxhc3QgZXJybm86IDIsIE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkNClN1YnRlc3QgcGlwZS1BLXRzLWNvbnRpbnVhdGlvbi1zdXNwZW5kOiBTS0lQICgwLjA4
NXMpDQoNCnJvb3RAa2VlbWJheTp+L2lndC90ZXN0cyMgLi9rbXNfdmJsYW5rIC0tciBwaXBlLUEt
dHMtY29udGludWF0aW9uLW1vZGVzZXQNCklHVC1WZXJzaW9uOiAxLjI1LWcwZWM5NjIwMSAoYWFy
Y2g2NCkgKExpbnV4OiA1LjkuMC1yYzctaW50ZWwtc3RhbmRhcmQgYWFyY2g2NCkNClN0YXJ0aW5n
IHN1YnRlc3Q6IHBpcGUtQS10cy1jb250aW51YXRpb24tbW9kZXNldA0KQmVnaW5uaW5nIHBpcGUt
QS10cy1jb250aW51YXRpb24tbW9kZXNldCBvbiBwaXBlIEEsIGNvbm5lY3RvciBIRE1JLUEtMQ0K
DQpwaXBlLUEtdHMtY29udGludWF0aW9uLW1vZGVzZXQgb24gcGlwZSBBLCBjb25uZWN0b3IgSERN
SS1BLTE6IFBBU1NFRA0KDQpTdWJ0ZXN0IHBpcGUtQS10cy1jb250aW51YXRpb24tbW9kZXNldDog
U1VDQ0VTUyAoMC4xNDFzKQ0KDQpyb290QGtlZW1iYXk6fi9pZ3QvdGVzdHMjIC4va21zX3ZibGFu
ayAtLXIgcGlwZS1BLXRzLWNvbnRpbnVhdGlvbi1tb2Rlc2V0LWhhbmcNCklHVC1WZXJzaW9uOiAx
LjI1LWcwZWM5NjIwMSAoYWFyY2g2NCkgKExpbnV4OiA1LjkuMC1yYzctaW50ZWwtc3RhbmRhcmQg
YWFyY2g2NCkNClN0YXJ0aW5nIHN1YnRlc3Q6IHBpcGUtQS10cy1jb250aW51YXRpb24tbW9kZXNl
dC1oYW5nDQpUZXN0IHJlcXVpcmVtZW50IG5vdCBtZXQgaW4gZnVuY3Rpb24gZ2VtX2NvbnRleHRf
cmVxdWlyZV9iYW5uYWJsZSwgZmlsZSBpOTE1L2dlbV9jb250ZXh0LmM6MjQ5Og0KVGVzdCByZXF1
aXJlbWVudDogaGFzX2Jhbl9wZXJpb2QgfHwgaGFzX2Jhbm5hYmxlDQpMYXN0IGVycm5vOiAyMiwg
SW52YWxpZCBhcmd1bWVudA0KU3VidGVzdCBwaXBlLUEtdHMtY29udGludWF0aW9uLW1vZGVzZXQt
aGFuZzogU0tJUCAoMC4wMDBzKQ0KDQpyb290QGtlZW1iYXk6fi9pZ3QvdGVzdHMjIC4va21zX3Zi
bGFuayAtLXIgcGlwZS1BLXRzLWNvbnRpbnVhdGlvbi1tb2Rlc2V0LXJwbQ0KSUdULVZlcnNpb246
IDEuMjUtZzBlYzk2MjAxIChhYXJjaDY0KSAoTGludXg6IDUuOS4wLXJjNy1pbnRlbC1zdGFuZGFy
ZCBhYXJjaDY0KQ0KU3RhcnRpbmcgc3VidGVzdDogcGlwZS1BLXRzLWNvbnRpbnVhdGlvbi1tb2Rl
c2V0LXJwbQ0KVGVzdCByZXF1aXJlbWVudCBub3QgbWV0IGluIGZ1bmN0aW9uIHJ1bl90ZXN0LCBm
aWxlIGttc192YmxhbmsuYzoxMjU6DQpUZXN0IHJlcXVpcmVtZW50OiBpZ3Rfc2V0dXBfcnVudGlt
ZV9wbShmZCkNCkxhc3QgZXJybm86IDUsIElucHV0L291dHB1dCBlcnJvcg0KU3VidGVzdCBwaXBl
LUEtdHMtY29udGludWF0aW9uLW1vZGVzZXQtcnBtOiBTS0lQICgwLjA0OXMpDQoNCg==

--_002_BY5PR11MB41825BA878A60FBCFF8655E78C300BY5PR11MB4182namp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--_002_BY5PR11MB41825BA878A60FBCFF8655E78C300BY5PR11MB4182namp_--
