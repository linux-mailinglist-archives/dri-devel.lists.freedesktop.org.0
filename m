Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0B7265530
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 00:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CD06E25A;
	Thu, 10 Sep 2020 22:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F2A6E25A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 22:46:10 +0000 (UTC)
IronPort-SDR: 0Pnmi4MuFvm1xlIlpYVIwINd7K4/RjrmJL3TqIFIlRqgkELaciGYw1JtaPar/PpH1K75vBW3Kk
 WbdEZX4ib65Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="176711745"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="176711745"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 15:46:07 -0700
IronPort-SDR: tqnxmz6iToFqdUwiELOHsouRrcArnu50xBfuysgkrhEFxoSJrWYCSBWurxDRFcPrgDMnP/utaN
 qnD7QUEQSZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="342094044"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Sep 2020 15:46:06 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Sep 2020 15:46:06 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Sep 2020 15:46:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 10 Sep 2020 15:46:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 10 Sep 2020 15:46:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwJ91uuRgXVKsYL0OhIhwQmfZgW09UQrZoxEFiUBbsY4SsC6MjielTeZJkufFWaaXnJAY+g0QYGhuLYR1cK0SG2nHRjxfZFPtrgHZ6jfdoc8rRmO6Lo9MBoX5FEn+V+iBLdgnu+5itOT5GXcwdqKdZdQgv0mB/KUm+dfRXf4b7ijTkXj95z7vfSsHKKzae+qwZ9u/rBD6eMmsbGrVySYxc0stVdlScY0/U39CYtttTOO6kN80mMAcqCIY57KuavRa2c+52Ql8pc3cJ6MDSazNOUk0tBuI+tQLgKcR8qEO95lu0c2frm2R22kpZ2PMdWmqS7ArNgGkTeeQASL6nipgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xURW3piypc9Gsk4bv/C5E0Ati/VKupMj+QtT1j9qFLg=;
 b=BuqUKs7y4BOLWFtNjb8h0CAyDsY3VXbUWEjrKB4EZe6PGss1YQUoInhpRlshXuakJnN0ywxOsILVCdwNReUIzgd8nl5EmzhLv/U294dXgTow768N7FMc2VtVWe04eqyjyUJ+QGEd1RtodKc8Zf3Aqs1ZKa+oQDU3yL7rGEaX1aIKdaTSWwg6UR485MaWpLUPRtL05Sy6QiKuFE82kQv6hah1uciamYaIb6I83U90FbCJ85n19UsoRgBB0PkZgwB8EbSIWZ/88w8FJbI8seMd5j24TmUCVb8ZvAI9x7lBUKAEKGklpcHdIF4FbCV9wnd+nT/ICHkJdHy/yt5XBYqysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xURW3piypc9Gsk4bv/C5E0Ati/VKupMj+QtT1j9qFLg=;
 b=nz0bjz1wnjbYBxOLg9j0Hvopm0AFGB1s0Lxmf9ABUA996RFtow8N0MzKneyPsPxL406hbAx0FEtbFAPUcj8Ss2eKp2ekeSJoosIfa6D3HCmuS0vqXk2D9NauvAkKzxTCsAXcg1408Yd2QLZBiv/xA3TclRyIJqZep9cO9yd/4ZU=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB2806.namprd11.prod.outlook.com (2603:10b6:a02:c7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 22:45:58 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::1d4e:2269:63d7:f2d6]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::1d4e:2269:63d7:f2d6%6]) with mapi id 15.20.3348.019; Thu, 10 Sep 2020
 22:45:58 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v7 0/4] Add support for KeemBay DRM driver
Thread-Topic: [PATCH v7 0/4] Add support for KeemBay DRM driver
Thread-Index: AQHWf9HEB2dLPDnzgkWpFe71VUTmeKlhnO2AgADrRKA=
Date: Thu, 10 Sep 2020 22:45:58 +0000
Message-ID: <BY5PR11MB418220255C317C4EE682D8FC8C270@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
 <20200910084215.GK438822@phenom.ffwll.local>
In-Reply-To: <20200910084215.GK438822@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e6f35f2-0c36-4040-8129-08d855db491d
x-ms-traffictypediagnostic: BYAPR11MB2806:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2806C787DE4DDF5D687E330C8C270@BYAPR11MB2806.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: my6h2Bdr/hfhdm88zkM+yV69KNNC7bKEjZU1iIaqplE7GpVb6pzu73xuow+3vYYmDRCkYjHSqOXp7wG4Exbi9L97iOxAvZwtWU20KarM+YzlxCm1GEsMo99NOnMhWDJ5r1LWsWq9SIslCta2WchLvRTXDvUhTFXd/ZoOEK0bW9Nfi0bLvCaP0PuJz/ZJ9zI82JsT5WLO82600778GooFLR9aZCJwgxtVaWCAYePAW8Lw3lTfXZNb/rG9JNSfPCaFPlIwH9U3+WQhdWTZJAmjjfgeHYmZ3fkOdk2lgDWvDQ7U7fwuOYl0WhmUy1WeOox1w0gCw4cxWIIiaiimJTr7eI1i2qCH4aKaqzYadd7sdchxVVh7orEltBtvBQJSWghk0qLkijuJIb9HCHERpknAdg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(6916009)(2906002)(186003)(53546011)(54906003)(9686003)(6506007)(107886003)(4326008)(86362001)(55016002)(8676002)(478600001)(66556008)(966005)(33656002)(52536014)(66476007)(66446008)(26005)(66946007)(8936002)(316002)(76116006)(71200400001)(83080400001)(5660300002)(64756008)(7696005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /n3v6DfGpBXyh5RF6A3U5h+OWlIdr0FBHbRw5WZrnW3cVtReW3/mGeLWCNE9xNTydADoJwYRxBZaPixBUENMV7bGd6O3Ta/2r8cS0zmkwa8ncx/XyQCd+3vk7+XrDfJ069N0zpHcHuarVl0i6Hg5m5zDVFmMK1US2BtoDCdPPYD+F5ex6qqtioLw7Aga4Mzt0vyxbYr5vkSZsR8LWJz7go1XltxmxW/j1L9fHyVPZGhKDnCUVZZFWzBIkgX99ijsIfezYrVEUznb62Qv+i4cdDh/csPUJ3ufmZYov/u3PAY9FluXqAsSZbxvuL6VsJx7AOJ/OUk1Yaxzk0NDPFoX3+FLw5+iQpSU4fvQGI/B/6nHFgSxLfxNy1yG48KU8FkV1b0h6jUhrD4y/7/FyJt5K998uDnSUv9QUPJFO2cvrKWgprCFEsupPzoNe76hBa+JzeauFqaAv3foD+uDyeEbL1q71AJFo1KbYapBhys6DcvgqZb8fQpLab7tDTNeqNhYjc5yc4smYmi7xO2F7ks+NoZo8CJ/0L18XCEAVz08Nh2PpaHfwpc/0yM71ZZzK5qe6/0XeHLvqtlUTdbUGz9gmqjs0Ui3qTB9jDQNEM9u8iJVd6aD8KbX03xiyI6Lfu2nSrJITW6gZ4sX9dpxD+t4RA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6f35f2-0c36-4040-8129-08d855db491d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 22:45:58.4045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: doLB0i/HHipTRil2gtnqzEkAB/MWynXRzGZ+gWl/k12wF4Dr96lrVFsTLWMmtqg8cjCysd9AxGQFuy3ugUzNIrVlJgiz/oZx8DCUlccp3So=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2806
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,
Thanks for your review. I have requested drm-next access here
https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/291

Will address your comments in next emails.

thanks,
Anitha

> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Thursday, September 10, 2020 1:42 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: dri-devel@lists.freedesktop.org; Paauwe, Bob J
> <bob.j.paauwe@intel.com>; Dea, Edmund J <edmund.j.dea@intel.com>;
> Vetter, Daniel <daniel.vetter@intel.com>
> Subject: Re: [PATCH v7 0/4] Add support for KeemBay DRM driver
> 
> On Mon, Aug 31, 2020 at 01:02:48PM -0700, Anitha Chrisanthus wrote:
> > This is a new DRM driver for Intel's KeemBay SOC.
> > The SoC couples an ARM Cortex A53 CPU with an Intel
> > Movidius VPU.
> >
> > This driver is tested with the KMB EVM board which is the refernce baord
> > for Keem Bay SOC. The SOC's display pipeline is as follows
> >
> > +--------------+    +---------+    +-----------------------+
> > |LCD controller| -> |Mipi DSI | -> |Mipi to HDMI Converter |
> > +--------------+    +---------+    +-----------------------+
> >
> > LCD controller and Mipi DSI transmitter are part of the SOC and
> > mipi to HDMI converter is ADV7535 for KMB EVM board.
> >
> > The DRM driver is a basic KMS atomic modesetting display driver and
> > has no 2D or 3D graphics.It calls into the ADV bridge driver at
> > the connector level.
> >
> > Only 1080p resolution and single plane is supported at this time.
> > The usecase is for debugging video and camera outputs.
> >
> > Device tree patches are under review here
> > https://lore.kernel.org/linux-arm-kernel/20200708175020.194436-1-
> daniele.alessandrelli@linux.intel.com/T/
> 
> I've looked at the code, and imo looks fairly reasonable. I think the
> remaining things can also be polished in-tree, and we could start merging
> the code already. For that 2 things are missing:
> 
> - Need a MAINTAINERS entry for this (I'm assuming you're volunteering)
> - You need drm-misc commit rights set up so you can push patches, see
> 
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#validating-
> changes-with-igt
> 
> The docs there also have howto and everything.
> 
> Cheers, Daniel
> 
> >
> > Changes since v1:
> > - Removed redundant license text, updated license
> > - Rearranged include blocks
> > - renamed global vars and removed extern in c
> > - Used upclassing for dev_private
> > - Used drm_dev_init in drm device create
> > - minor cleanups
> >
> > Changes since v2:
> > - squashed all commits to a single commit
> > - logging changed to drm_info, drm_dbg etc.
> > - used devm_drm_dev_alloc()
> > - removed commented out sections and general cleanup
> >
> > Changes since v3:
> > - renamed dev_p to kmb
> > - moved clocks under kmb_clock, consolidated clk initializations
> > - use drmm functions
> > - use DRM_GEM_CMA_DRIVER_OPS_VMAP
> > - more cleanups
> >
> > Changes since v4:
> > - corrected spellings
> >
> > Changes since v5:
> > - corrected checkpatch warnings/checks
> >    -Please ignore checkpatch checks on Camelcase - this is how it is
> >    named in the databook
> >    - Please ignore checkpatch warnings on misspelled for hsa, dout,
> >    widthn etc. - they are spelled as in the databook
> >    - Please ignore checkpatch checks on macro arguments reuse -
> >    its confirmed ok
> >
> > Changes since v6:
> > - review changes Sam Ravnborg and Thomas Zimmerman
> > 	split patch into 4 parts, part1 register definitions, part2 display
> > 	driver files, part3 mipi dsi, part4 build files (Sam)
> > 	removed kmb_crtc.h kmb_crtc_cleanup (Thomas)
> > 	renamed mode_set, kmb_load, inlined unload (Thomas)
> > 	moved remaining logging to drm_*(Thomas)
> > 	re-orged driver initialization (Thomas)
> > 	moved plane_status to drm_private (Sam)
> > 	removed unnecessary logs and defines and ifdef codes (Sam)
> > 	split dphy_init_sequence smaller (Sam)
> > 	removed redundant checks in kmb_dsi (Sam)
> > 	changed kmb_dsi_init to drm_bridge_connector_init and
> > 	drm_connector_attach_encoder to bridge's connector (Sam)
> > 	call helper_check in plane_atomic_check (Sam)
> > 	renamed set to get for bpp and format functions(Sam)
> > 	use drm helper functions for reset, duplicate/destroy state instead
> > 	of kmb functions (Sam)
> > 	removed kmb_priv from kmb_plane and removed kmb_plane_state
> (Sam)
> >
> > Anitha Chrisanthus (4):
> >   drm/kmb: Keem Bay driver register definition
> >   drm/kmb: Add support for KeemBay Display
> >   drm/kmb: Mipi DSI part of the display driver
> >   drm/kmb: Build files for KeemBay Display driver
> >
> >  drivers/gpu/drm/Kconfig         |    2 +
> >  drivers/gpu/drm/Makefile        |    1 +
> >  drivers/gpu/drm/kmb/Kconfig     |   13 +
> >  drivers/gpu/drm/kmb/Makefile    |    2 +
> >  drivers/gpu/drm/kmb/kmb_crtc.c  |  224 ++++++
> >  drivers/gpu/drm/kmb/kmb_drv.c   |  676 +++++++++++++++++
> >  drivers/gpu/drm/kmb/kmb_drv.h   |  170 +++++
> >  drivers/gpu/drm/kmb/kmb_dsi.c   | 1523
> +++++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/kmb/kmb_dsi.h   |  350 +++++++++
> >  drivers/gpu/drm/kmb/kmb_plane.c |  480 ++++++++++++
> >  drivers/gpu/drm/kmb/kmb_plane.h |  110 +++
> >  drivers/gpu/drm/kmb/kmb_regs.h  |  748 +++++++++++++++++++
> >  12 files changed, 4299 insertions(+)
> >  create mode 100644 drivers/gpu/drm/kmb/Kconfig
> >  create mode 100644 drivers/gpu/drm/kmb/Makefile
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.h
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_dsi.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_dsi.h
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.h
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_regs.h
> >
> > --
> > 2.7.4
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
