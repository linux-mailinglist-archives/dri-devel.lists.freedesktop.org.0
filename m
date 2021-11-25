Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1422245D64F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 09:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BD56EDE2;
	Thu, 25 Nov 2021 08:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69E76EDE1;
 Thu, 25 Nov 2021 08:37:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="222697577"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="222697577"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 00:37:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="538915310"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 25 Nov 2021 00:37:29 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 25 Nov 2021 00:37:29 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 25 Nov 2021 00:37:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 25 Nov 2021 00:37:28 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 25 Nov 2021 00:37:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcK3CgjiUcImUkfzGk+DfEUUu2dGUfyTjyOiOcKgjTQug0QV7Zve4rro6otcmYxd8YxyJXixOko4t/PDPXJ/KKv6soomY2hTg1Rpw4aJnh9q1rKLbIu0R2730562D7jLAB9JFIkpRiebQ02+BCRqrT1ZU67K+4xjzWU5qcC1isClXXKE9HdY5Xi7/lhivn/5UphEwD0wj0Z2CrxDz1VleBXBAG8h32Ie0vy7IMuAC0gh1dXFcb8ozOMG/tMn/u0DWWRjfgbHT8H1wE/U3tKxaUdlWlBVlF7VXMEXWHXebr/dwJnhHV5dd3W0OAumPOqksXnhprfiE+OLyStwZXVZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Finf8y0I898IfH08NrdyXOul66Gn//p/KbFbH161PEU=;
 b=kX1cnLiYhuT9CHx0v2SzSS3TWvInjjSHEZgJ3x4D90Z7iOqMhXxtEh0AsKZngZWDVHa+TBZa2jaLv4f0YOnaltL2nYVc3YeVANBOvKBuWnbVB0gKbxasURbl7XHA+qluF8ISLztXqA1oKAsRcmD0glHeEJe6OR+/UnSUf3zyVHV7LPL3Wdk56Pifemtp13z92cKv5ET3CltS6UEPbsOa2TqE/EkBMIXTMlgBOmjv6uyd52jPxVo6am+HHkT6gCrIRn9Uztvd4NrUW9ctnd3ORavB1A5+RYauXqWwE626g9gNSw2SeRI6ANvr+cBed/iIwZPX1uu/Vk65pYEe4JtpMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Finf8y0I898IfH08NrdyXOul66Gn//p/KbFbH161PEU=;
 b=Ykqwwsxnc2KxfMAN13GjEWld85hbnaQXmtGJw6KHE4ytEnjy1DikoDqO6fT6mICwRfrdTInGD2o/xhB/1oz29w+o7gK4IIu9MhRMKfhoYHZTpiG4S1DhuMPB4K9p//fNDRp1KEMyYX1ueQC23Dp4w/9dYLqrkNx8mOLsYONHcDU=
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by BN9PR11MB5274.namprd11.prod.outlook.com (2603:10b6:408:133::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 25 Nov
 2021 08:37:18 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd%7]) with mapi id 15.20.4713.024; Thu, 25 Nov 2021
 08:37:18 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] i915/gvt: Introduce the mmio_info_table.c to support
 VFIO new mdev API
Thread-Topic: [PATCH 1/2] i915/gvt: Introduce the mmio_info_table.c to support
 VFIO new mdev API
Thread-Index: AQHX3UXbzcW7xg+3D0OInj7qmxFbu6wT9IKg
Date: Thu, 25 Nov 2021 08:37:18 +0000
Message-ID: <BN9PR11MB554561A3EF0D81CEE57E1A73CA629@BN9PR11MB5545.namprd11.prod.outlook.com>
References: <20211119130307.21098-1-zhi.a.wang@intel.com>
In-Reply-To: <20211119130307.21098-1-zhi.a.wang@intel.com>
Accept-Language: en-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df2b458c-6f38-4480-0dd3-08d9afeecab9
x-ms-traffictypediagnostic: BN9PR11MB5274:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB5274DEA0B40A5ACEC47263B6CA629@BN9PR11MB5274.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:121;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G17kt4DmQNc+nlVHEtl1ZcSjtM5nYhHiGxUMzWLByWHFqyf0WWozKVLHUpHuRpBIq9w7zBg4YHcUOc+VjVHqm9+LW7m3TQ3MPtQ7dVDAYNkcx+r0CRztuXRdlNovn1RL0kyy2bWfxR2d9c4ttb58E8MKLtCtK6lQJ2YlrvwOdVQKSxHlYggipvEv85F4AOEGvKkHcK/1wnlj2HnCvd56hMTQNF0ONxlSPUUCoygblIt4iOR56yeNTbCTAzala/2KLC65vYEzflJWQyz22QZ+PuZTZdSM1945I4NCEg6AwThcQ5geiRcH7RTmSuuctnXSqH+tv/ZmHXB5boY8HIplag0/xly+SZmIedcSOASUqQRHmIPobTLezRpHzEAtW+XdgBc9CzvBsUyWKsUIlqnvEndiWHbDkIhwI9dlaxKzi8q+a+qnpBPD8F6k44wgWkFjfbj01NKa66O2qS9iJOlrMpGH/6noLCfI6q6ZcCRwcTE6HfXdB/CbhhzXD/mGweOQeN9DK0AJanvH9edq00AH0WFvLf+8pjx2UvMhKsRU6Py6apq9fxQZQVjZwcFWzRVFGJTg6/Bf1xAU00F/fBMVhyK5sm4j1EazTfnJrr0r+wVXJ3y3nqJvTSGdAMge61bDkRKgYzRgNy1rOINMPJ2oH6BZFeWzXkaKqLMmNNSMnINkJXw1yOQQHbDNuY3jEQq1zg7HqoATUvEEh/D0ktDdUPjh/xG3fOnmrt7LV8NeT5g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(55016003)(316002)(7416002)(38070700005)(30864003)(26005)(508600001)(54906003)(82960400001)(186003)(38100700002)(9686003)(76116006)(86362001)(8936002)(66946007)(33656002)(2906002)(83380400001)(5660300002)(64756008)(8676002)(6506007)(53546011)(7696005)(110136005)(4326008)(66556008)(66476007)(71200400001)(66446008)(52536014)(21314003)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5wqGIG3wZ+EAd7jhOrC+yqckd0MQXLPwztLFtMoKc3kofSYox24hsy41Uzy6?=
 =?us-ascii?Q?f6WLdj7RVoDbJ/CPnPHYn2MbQarXBOaTQDowP9mNBPSr9A+i0fjBDwR0HClt?=
 =?us-ascii?Q?Z+u3sndZdTmn9cYyRHXURcbIZ1Z5g+/AaT/Ziwt7lFS+fCcU8OK+DsE+DUCA?=
 =?us-ascii?Q?KKcVRg0KwOdfN0hwKFVWdgNDD871mSuhrqMbflq5gfYZ5LjhPSe+Ikkr1tVp?=
 =?us-ascii?Q?/SPzHHfKLBOq2iaeq9FdZoJfpjt1v9Sp3rbDh7YkA78WoYeD+uOBTL4MEu+8?=
 =?us-ascii?Q?IojtPNHwBVmLd2q/EPewHgXAKXje0gk3nLaQRzv28kGY5r4kWDgixC0VL3U0?=
 =?us-ascii?Q?Dss59pon7pcSvjZwBmJ5Z5C9w35SVbCKp65GIdWUC9vrD2SHstyNG+I6kved?=
 =?us-ascii?Q?vuVjGcZIQ8Vwhd6LIuHkROImfxvzFxtCbGgNpPi9jLPj57Wkdo6t2vTlDClp?=
 =?us-ascii?Q?pcx2yYGEDrr3X7HnEsZUTk/zoqVA1lh9i9zVW0hfZQvzno6lTSa/ZZzOI7Q/?=
 =?us-ascii?Q?tiS3z4kicXRk6AVIsTt6H01+3ijaIirUij4xkcQXnIECxHK3BGF8ixHOYs8V?=
 =?us-ascii?Q?9gbZRJZW/elgOEHrTNnUcAVp07z/lF3vv5bZU7hevfFm8R/iBCvG2j4egV16?=
 =?us-ascii?Q?pUBLaGsTZx1bovPGgnBnoC09qNMUsr7NWOaphg0l0Uz+0WqCjFoZeON/wgUD?=
 =?us-ascii?Q?TbZ7ccNLTcUzXixi9cZjVB/FXAqQ+1xsFi8wNEL3OWjVRAVhWd7fPBmtWVbp?=
 =?us-ascii?Q?9H25ex+Q/bU01u9cQeEBo2Uk7LwDvQCn1sSIlr0NHThJmnRuWVWZbg5K89sv?=
 =?us-ascii?Q?akVgMhm0SnI6ALYdC7Q4qMZi8On4OHbd3YdalsWRr/eVvnYePgpd9AAsRopj?=
 =?us-ascii?Q?MfcEAlknPh3J9+9Pcj7cE9liUFic2YOCM7qQhDima+jTfe1lCI0bUFssrpQy?=
 =?us-ascii?Q?Ra4dBkKJ6iBK+lfJVazf6bjzWhe4Y5+JXwlvf+57eNekTFsF7mrXmRhHQ1pb?=
 =?us-ascii?Q?KEwHo10Eez+3U7ceXqt+ug8wsdaxHWPylsuz050Rcj0il6GgG5dHew/8PZnM?=
 =?us-ascii?Q?4Eu6CqOqo7LbwSmZPy4QkOOX7HTJ1seNAehcn7lrOWUEbkxxvHrsBDfbdVNB?=
 =?us-ascii?Q?xPCizrS8J1AEuQNFOhWMIVley0c7PWu86Aqf8lFt+8jtWnJSsGZIeGNFQ137?=
 =?us-ascii?Q?QvODQqnnuQeJc4rHqrMCZLe7FYjwgBaQxPDAF908997K919yaJVA6D8f9znF?=
 =?us-ascii?Q?cNJChIcD036yQdzyTkIg+RTxgWsER9tmz6DdxJwdOdyaqc+rh0hsVHuKfXAw?=
 =?us-ascii?Q?iF2HS7GuctMx9IY2HQ9TxFoIwbWN6KTDq5kIZ89TyeFoet/bh+44ZGRLgZTg?=
 =?us-ascii?Q?zaAKuskDGYNElBbuIjGceWfLFXrCWO6Raq1jzi8LGcK3jjIW4uOv0//11a3j?=
 =?us-ascii?Q?BoZcjrhob3thQw8nfamWagwkoR2L6IPrs5I8xhlZh1LbWTRpq1vcp5Y6J64S?=
 =?us-ascii?Q?Bxl1roQSXa4GYkSo7MQKAXTh96SWmyZmkkzpmT4AStbJ1oZUaEsLXrVPn3GE?=
 =?us-ascii?Q?ysZWNbN30+ayxPz8rkIZpBT1gaq8Ax744OagOmneggAKevZoxcdSSJpwRXrQ?=
 =?us-ascii?Q?RQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2b458c-6f38-4480-0dd3-08d9afeecab9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 08:37:18.6295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yu9f3dWmNkW5UHh9OxW5EBHtUx87984tpDJh7OlX5ol99uZtWb63niVV0WSUvqe4QbPEx4FeztnYNG4npXSyTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5274
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping for review.:)

-----Original Message-----
From: Zhi Wang <zhi.wang.linux@gmail.com>=20
Sent: Friday, November 19, 2021 3:03 PM
To: intel-gfx@lists.freedesktop.org; intel-gvt-dev@lists.freedesktop.org; d=
ri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
Cc: Zhi Wang <zhi.wang.linux@gmail.com>; Christoph Hellwig <hch@lst.de>; Ja=
son Gunthorpe <jgg@nvidia.com>; Jani Nikula <jani.nikula@linux.intel.com>; =
Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.v=
ivi@intel.com>; Zhenyu Wang <zhenyuw@linux.intel.com>; Wang, Zhi A <zhi.a.w=
ang@intel.com>; Xu, Terrence <terrence.xu@intel.com>
Subject: [PATCH 1/2] i915/gvt: Introduce the mmio_info_table.c to support V=
FIO new mdev API

From: Zhi Wang <zhi.wang.linux@gmail.com>

To support the new mdev interfaces and the re-factor patches from
Christoph, which moves the GVT-g code into a dedicated module, the GVT-g
initialization path has to be seperated into two phases:

a) Early initialization.

The early initialization of GVT requires to be done when loading i915.
Mostly it's because the inital clean HW state needs to be saved before
i915 touches the HW.

b) Late initalization.

This phases of initalization will setup the rest components of GVT-g,
which can be done later when the dedicated module is being loaded.

v2:

- Implement a mmio table instead of generating it by marco in i915. (Jani)

Cc: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Vivi Rodrigo <rodrigo.vivi@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Zhi Wang <zhi.wang.linux@gmail.com>
---
 drivers/gpu/drm/i915/Makefile              |    2 +-
 drivers/gpu/drm/i915/gvt/gvt.c             |   38 +-
 drivers/gpu/drm/i915/gvt/gvt.h             |    1 +
 drivers/gpu/drm/i915/gvt/handlers.c        | 1780 +++-----------------
 drivers/gpu/drm/i915/gvt/mmio.h            |    5 +-
 drivers/gpu/drm/i915/gvt/mmio_info_table.c | 1461 ++++++++++++++++
 drivers/gpu/drm/i915/gvt/mmio_info_table.h |   35 +
 drivers/gpu/drm/i915/gvt/reg.h             |    9 +-
 drivers/gpu/drm/i915/intel_gvt.c           |   42 +-
 9 files changed, 1775 insertions(+), 1598 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gvt/mmio_info_table.c
 create mode 100644 drivers/gpu/drm/i915/gvt/mmio_info_table.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index cdc244bbbfc1..55603aebe3e4 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -309,7 +309,7 @@ i915-$(CONFIG_DRM_I915_SELFTEST) +=3D \
 i915-y +=3D i915_vgpu.o
=20
 ifeq ($(CONFIG_DRM_I915_GVT),y)
-i915-y +=3D intel_gvt.o
+i915-y +=3D intel_gvt.o gvt/mmio_info_table.o
 include $(src)/gvt/Makefile
 endif
=20
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.=
c
index cbac409f6c8a..c7580db355c0 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -63,23 +63,6 @@ static const struct intel_gvt_ops intel_gvt_ops =3D {
 	.emulate_hotplug =3D intel_vgpu_emulate_hotplug,
 };
=20
-static void init_device_info(struct intel_gvt *gvt)
-{
-	struct intel_gvt_device_info *info =3D &gvt->device_info;
-	struct pci_dev *pdev =3D to_pci_dev(gvt->gt->i915->drm.dev);
-
-	info->max_support_vgpus =3D 8;
-	info->cfg_space_size =3D PCI_CFG_SPACE_EXP_SIZE;
-	info->mmio_size =3D 2 * 1024 * 1024;
-	info->mmio_bar =3D 0;
-	info->gtt_start_offset =3D 8 * 1024 * 1024;
-	info->gtt_entry_size =3D 8;
-	info->gtt_entry_size_shift =3D 3;
-	info->gmadr_bytes_in_cmd =3D 8;
-	info->max_surface_size =3D 36 * 1024 * 1024;
-	info->msi_cap_offset =3D pdev->msi_cap;
-}
-
 static void intel_gvt_test_and_emulate_vblank(struct intel_gvt *gvt)
 {
 	struct intel_vgpu *vgpu;
@@ -169,7 +152,6 @@ void intel_gvt_clean_device(struct drm_i915_private *i9=
15)
 	intel_gvt_clean_workload_scheduler(gvt);
 	intel_gvt_clean_gtt(gvt);
 	intel_gvt_free_firmware(gvt);
-	intel_gvt_clean_mmio_info(gvt);
 	idr_destroy(&gvt->vgpu_idr);
=20
 	kfree(i915->gvt);
@@ -188,16 +170,12 @@ void intel_gvt_clean_device(struct drm_i915_private *=
i915)
  */
 int intel_gvt_init_device(struct drm_i915_private *i915)
 {
-	struct intel_gvt *gvt;
+	struct intel_gvt *gvt =3D i915->gvt;
 	struct intel_vgpu *vgpu;
 	int ret;
=20
-	if (drm_WARN_ON(&i915->drm, i915->gvt))
-		return -EEXIST;
-
-	gvt =3D kzalloc(sizeof(struct intel_gvt), GFP_KERNEL);
-	if (!gvt)
-		return -ENOMEM;
+	if (drm_WARN_ON(&i915->drm, !i915->gvt))
+		return -ENODEV;
=20
 	gvt_dbg_core("init gvt device\n");
=20
@@ -205,12 +183,8 @@ int intel_gvt_init_device(struct drm_i915_private *i91=
5)
 	spin_lock_init(&gvt->scheduler.mmio_context_lock);
 	mutex_init(&gvt->lock);
 	mutex_init(&gvt->sched_lock);
-	gvt->gt =3D &i915->gt;
-	i915->gvt =3D gvt;
-
-	init_device_info(gvt);
=20
-	ret =3D intel_gvt_setup_mmio_info(gvt);
+	ret =3D intel_gvt_setup_mmio_handlers(gvt);
 	if (ret)
 		goto out_clean_idr;
=20
@@ -218,7 +192,7 @@ int intel_gvt_init_device(struct drm_i915_private *i915=
)
=20
 	ret =3D intel_gvt_load_firmware(gvt);
 	if (ret)
-		goto out_clean_mmio_info;
+		goto out_clean_idr;
=20
 	ret =3D intel_gvt_init_irq(gvt);
 	if (ret)
@@ -277,8 +251,6 @@ int intel_gvt_init_device(struct drm_i915_private *i915=
)
 	intel_gvt_clean_gtt(gvt);
 out_free_firmware:
 	intel_gvt_free_firmware(gvt);
-out_clean_mmio_info:
-	intel_gvt_clean_mmio_info(gvt);
 out_clean_idr:
 	idr_destroy(&gvt->vgpu_idr);
 	kfree(gvt);
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.=
h
index 0c0615602343..76b192563212 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -40,6 +40,7 @@
 #include "debug.h"
 #include "hypercall.h"
 #include "mmio.h"
+#include "mmio_info_table.h"
 #include "reg.h"
 #include "interrupt.h"
 #include "gtt.h"
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt=
/handlers.c
index cde0a477fb49..2c064da3db6d 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -41,37 +41,6 @@
 #include "i915_pvinfo.h"
 #include "display/intel_display_types.h"
=20
-/* XXX FIXME i915 has changed PP_XXX definition */
-#define PCH_PP_STATUS  _MMIO(0xc7200)
-#define PCH_PP_CONTROL _MMIO(0xc7204)
-#define PCH_PP_ON_DELAYS _MMIO(0xc7208)
-#define PCH_PP_OFF_DELAYS _MMIO(0xc720c)
-#define PCH_PP_DIVISOR _MMIO(0xc7210)
-
-unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt)
-{
-	struct drm_i915_private *i915 =3D gvt->gt->i915;
-
-	if (IS_BROADWELL(i915))
-		return D_BDW;
-	else if (IS_SKYLAKE(i915))
-		return D_SKL;
-	else if (IS_KABYLAKE(i915))
-		return D_KBL;
-	else if (IS_BROXTON(i915))
-		return D_BXT;
-	else if (IS_COFFEELAKE(i915) || IS_COMETLAKE(i915))
-		return D_CFL;
-
-	return 0;
-}
-
-bool intel_gvt_match_device(struct intel_gvt *gvt,
-		unsigned long device)
-{
-	return intel_gvt_get_device_type(gvt) & device;
-}
-
 static void read_vreg(struct intel_vgpu *vgpu, unsigned int offset,
 	void *p_data, unsigned int bytes)
 {
@@ -84,24 +53,11 @@ static void write_vreg(struct intel_vgpu *vgpu, unsigne=
d int offset,
 	memcpy(&vgpu_vreg(vgpu, offset), p_data, bytes);
 }
=20
-struct intel_gvt_mmio_info *intel_gvt_find_mmio_info(struct intel_gvt *gvt=
,
-						  unsigned int offset)
-{
-	struct intel_gvt_mmio_info *e;
-
-	hash_for_each_possible(gvt->mmio.mmio_info_table, e, node, offset) {
-		if (e->offset =3D=3D offset)
-			return e;
-	}
-	return NULL;
-}
-
-static int new_mmio_info(struct intel_gvt *gvt,
-		u32 offset, u16 flags, u32 size,
-		u32 addr_mask, u32 ro_mask, u32 device,
+static int setup_mmio_handler(struct intel_gvt *gvt,
+		u32 offset, u32 size, u32 device,
 		gvt_mmio_func read, gvt_mmio_func write)
 {
-	struct intel_gvt_mmio_info *info, *p;
+	struct intel_gvt_mmio_info *p;
 	u32 start, end, i;
=20
 	if (!intel_gvt_match_device(gvt, device))
@@ -114,32 +70,14 @@ static int new_mmio_info(struct intel_gvt *gvt,
 	end =3D offset + size;
=20
 	for (i =3D start; i < end; i +=3D 4) {
-		info =3D kzalloc(sizeof(*info), GFP_KERNEL);
-		if (!info)
-			return -ENOMEM;
-
-		info->offset =3D i;
-		p =3D intel_gvt_find_mmio_info(gvt, info->offset);
-		if (p) {
-			WARN(1, "dup mmio definition offset %x\n",
-				info->offset);
-			kfree(info);
-
-			/* We return -EEXIST here to make GVT-g load fail.
-			 * So duplicated MMIO can be found as soon as
-			 * possible.
-			 */
-			return -EEXIST;
+		p =3D intel_gvt_find_mmio_info(gvt, i);
+		if (!p) {
+			WARN(1, "assign a handler to a non-tracked mmio %x\n",
+				i);
+			return -ENODEV;
 		}
-
-		info->ro_mask =3D ro_mask;
-		info->device =3D device;
-		info->read =3D read ? read : intel_vgpu_default_mmio_read;
-		info->write =3D write ? write : intel_vgpu_default_mmio_write;
-		gvt->mmio.mmio_attribute[info->offset / 4] =3D flags;
-		INIT_HLIST_NODE(&info->node);
-		hash_add(gvt->mmio.mmio_info_table, &info->node, info->offset);
-		gvt->mmio.num_tracked_mmio++;
+		p->read =3D read ? read : intel_vgpu_default_mmio_read;
+		p->write =3D write ? write : intel_vgpu_default_mmio_write;
 	}
 	return 0;
 }
@@ -2131,1498 +2069,249 @@ static int csfe_chicken1_mmio_write(struct intel=
_vgpu *vgpu,
 	return 0;
 }
=20
-#define MMIO_F(reg, s, f, am, rm, d, r, w) do { \
-	ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
-		f, s, am, rm, d, r, w); \
+#define MMIO_F(reg, s, d, r, w) do { \
+	ret =3D setup_mmio_handler(gvt, i915_mmio_reg_offset(reg), \
+		s, d, r, w); \
 	if (ret) \
 		return ret; \
 } while (0)
=20
-#define MMIO_D(reg, d) \
-	MMIO_F(reg, 4, 0, 0, 0, d, NULL, NULL)
-
-#define MMIO_DH(reg, d, r, w) \
-	MMIO_F(reg, 4, 0, 0, 0, d, r, w)
-
-#define MMIO_DFH(reg, d, f, r, w) \
-	MMIO_F(reg, 4, f, 0, 0, d, r, w)
+#define MMIO_H(reg, d, r, w) \
+	MMIO_F(reg, 4, d, r, w)
=20
-#define MMIO_GM(reg, d, r, w) \
-	MMIO_F(reg, 4, F_GMADR, 0xFFFFF000, 0, d, r, w)
-
-#define MMIO_GM_RDR(reg, d, r, w) \
-	MMIO_F(reg, 4, F_GMADR | F_CMD_ACCESS, 0xFFFFF000, 0, d, r, w)
-
-#define MMIO_RO(reg, d, f, rm, r, w) \
-	MMIO_F(reg, 4, F_RO | f, 0, rm, d, r, w)
-
-#define MMIO_RING_F(prefix, s, f, am, rm, d, r, w) do { \
-	MMIO_F(prefix(RENDER_RING_BASE), s, f, am, rm, d, r, w); \
-	MMIO_F(prefix(BLT_RING_BASE), s, f, am, rm, d, r, w); \
-	MMIO_F(prefix(GEN6_BSD_RING_BASE), s, f, am, rm, d, r, w); \
-	MMIO_F(prefix(VEBOX_RING_BASE), s, f, am, rm, d, r, w); \
+#define MMIO_RING_F(prefix, s, d, r, w) do { \
+	MMIO_F(prefix(RENDER_RING_BASE), s, d, r, w); \
+	MMIO_F(prefix(BLT_RING_BASE), s, d, r, w); \
+	MMIO_F(prefix(GEN6_BSD_RING_BASE), s, d, r, w); \
+	MMIO_F(prefix(VEBOX_RING_BASE), s, d, r, w); \
 	if (HAS_ENGINE(gvt->gt, VCS1)) \
-		MMIO_F(prefix(GEN8_BSD2_RING_BASE), s, f, am, rm, d, r, w); \
+		MMIO_F(prefix(GEN8_BSD2_RING_BASE), s, d, r, w); \
 } while (0)
=20
-#define MMIO_RING_D(prefix, d) \
-	MMIO_RING_F(prefix, 4, 0, 0, 0, d, NULL, NULL)
-
-#define MMIO_RING_DFH(prefix, d, f, r, w) \
-	MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
-
-#define MMIO_RING_GM(prefix, d, r, w) \
-	MMIO_RING_F(prefix, 4, F_GMADR, 0xFFFF0000, 0, d, r, w)
-
-#define MMIO_RING_GM_RDR(prefix, d, r, w) \
-	MMIO_RING_F(prefix, 4, F_GMADR | F_CMD_ACCESS, 0xFFFF0000, 0, d, r, w)
+#define MMIO_RING_H(prefix, d, r, w) \
+	MMIO_RING_F(prefix, 4, d, r, w)
=20
-#define MMIO_RING_RO(prefix, d, f, rm, r, w) \
-	MMIO_RING_F(prefix, 4, F_RO | f, 0, rm, d, r, w)
-
-static int init_generic_mmio_info(struct intel_gvt *gvt)
+static int init_generic_mmio_handlers(struct intel_gvt *gvt)
 {
 	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
 	int ret;
=20
-	MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
-		intel_vgpu_reg_imr_handler);
-
-	MMIO_DFH(SDEIMR, D_ALL, 0, NULL, intel_vgpu_reg_imr_handler);
-	MMIO_DFH(SDEIER, D_ALL, 0, NULL, intel_vgpu_reg_ier_handler);
-	MMIO_DFH(SDEIIR, D_ALL, 0, NULL, intel_vgpu_reg_iir_handler);
-	MMIO_D(SDEISR, D_ALL);
-
-	MMIO_RING_DFH(RING_HWSTAM, D_ALL, 0, NULL, NULL);
-
-
-	MMIO_DH(GEN8_GAMW_ECO_DEV_RW_IA, D_BDW_PLUS, NULL,
-		gamw_echo_dev_rw_ia_write);
-
-	MMIO_GM_RDR(BSD_HWS_PGA_GEN7, D_ALL, NULL, NULL);
-	MMIO_GM_RDR(BLT_HWS_PGA_GEN7, D_ALL, NULL, NULL);
-	MMIO_GM_RDR(VEBOX_HWS_PGA_GEN7, D_ALL, NULL, NULL);
-
-#define RING_REG(base) _MMIO((base) + 0x28)
-	MMIO_RING_DFH(RING_REG, D_ALL, F_CMD_ACCESS, NULL, NULL);
-#undef RING_REG
-
-#define RING_REG(base) _MMIO((base) + 0x134)
-	MMIO_RING_DFH(RING_REG, D_ALL, F_CMD_ACCESS, NULL, NULL);
-#undef RING_REG
+	MMIO_RING_H(RING_IMR, D_ALL, NULL, intel_vgpu_reg_imr_handler);
+	MMIO_H(SDEIMR, D_ALL, NULL, intel_vgpu_reg_imr_handler);
+	MMIO_H(SDEIER, D_ALL, NULL, intel_vgpu_reg_ier_handler);
+	MMIO_H(SDEIIR, D_ALL, NULL, intel_vgpu_reg_iir_handler);
+	MMIO_H(GEN8_GAMW_ECO_DEV_RW_IA, D_BDW_PLUS, NULL, gamw_echo_dev_rw_ia_wri=
te);
=20
 #define RING_REG(base) _MMIO((base) + 0x6c)
-	MMIO_RING_DFH(RING_REG, D_ALL, 0, mmio_read_from_hw, NULL);
+	MMIO_RING_H(RING_REG, D_ALL, mmio_read_from_hw, NULL);
 #undef RING_REG
-	MMIO_DH(GEN7_SC_INSTDONE, D_BDW_PLUS, mmio_read_from_hw, NULL);
-
-	MMIO_GM_RDR(_MMIO(0x2148), D_ALL, NULL, NULL);
-	MMIO_GM_RDR(CCID(RENDER_RING_BASE), D_ALL, NULL, NULL);
-	MMIO_GM_RDR(_MMIO(0x12198), D_ALL, NULL, NULL);
-	MMIO_D(GEN7_CXT_SIZE, D_ALL);
=20
-	MMIO_RING_DFH(RING_TAIL, D_ALL, 0, NULL, NULL);
-	MMIO_RING_DFH(RING_HEAD, D_ALL, 0, NULL, NULL);
-	MMIO_RING_DFH(RING_CTL, D_ALL, 0, NULL, NULL);
-	MMIO_RING_DFH(RING_ACTHD, D_ALL, 0, mmio_read_from_hw, NULL);
-	MMIO_RING_GM(RING_START, D_ALL, NULL, NULL);
+	MMIO_H(GEN7_SC_INSTDONE, D_BDW_PLUS, mmio_read_from_hw, NULL);
+	MMIO_RING_H(RING_ACTHD, D_ALL, mmio_read_from_hw, NULL);
=20
 	/* RING MODE */
 #define RING_REG(base) _MMIO((base) + 0x29c)
-	MMIO_RING_DFH(RING_REG, D_ALL,
-		F_MODE_MASK | F_CMD_ACCESS | F_CMD_WRITE_PATCH, NULL,
-		ring_mode_mmio_write);
+	MMIO_RING_H(RING_REG, D_ALL, NULL, ring_mode_mmio_write);
 #undef RING_REG
=20
-	MMIO_RING_DFH(RING_MI_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
-		NULL, NULL);
-	MMIO_RING_DFH(RING_INSTPM, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
-			NULL, NULL);
-	MMIO_RING_DFH(RING_TIMESTAMP, D_ALL, F_CMD_ACCESS,
-			mmio_read_from_hw, NULL);
-	MMIO_RING_DFH(RING_TIMESTAMP_UDW, D_ALL, F_CMD_ACCESS,
-			mmio_read_from_hw, NULL);
-
-	MMIO_DFH(GEN7_GT_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(CACHE_MODE_0_GEN7, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
-		NULL, NULL);
-	MMIO_DFH(CACHE_MODE_1, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(CACHE_MODE_0, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x2124), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-
-	MMIO_DFH(_MMIO(0x20dc), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_3D_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x2088), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(FF_SLICE_CS_CHICKEN2, D_ALL,
-		 F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x2470), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(GAM_ECOCHK, D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(GEN7_COMMON_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
-		NULL, NULL);
-	MMIO_DFH(COMMON_SLICE_CHICKEN2, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
-		 NULL, NULL);
-	MMIO_DFH(_MMIO(0x9030), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x20a0), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x2420), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x2430), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x2434), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x2438), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x243c), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x7018), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NU=
LL);
-	MMIO_DFH(GEN7_HALF_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NUL=
L, NULL);
-
-	/* display */
-	MMIO_F(_MMIO(0x60220), 0x20, 0, 0, 0, D_ALL, NULL, NULL);
-	MMIO_D(_MMIO(0x602a0), D_ALL);
-
-	MMIO_D(_MMIO(0x65050), D_ALL);
-	MMIO_D(_MMIO(0x650b4), D_ALL);
-
-	MMIO_D(_MMIO(0xc4040), D_ALL);
-	MMIO_D(DERRMR, D_ALL);
-
-	MMIO_D(PIPEDSL(PIPE_A), D_ALL);
-	MMIO_D(PIPEDSL(PIPE_B), D_ALL);
-	MMIO_D(PIPEDSL(PIPE_C), D_ALL);
-	MMIO_D(PIPEDSL(_PIPE_EDP), D_ALL);
-
-	MMIO_DH(PIPECONF(PIPE_A), D_ALL, NULL, pipeconf_mmio_write);
-	MMIO_DH(PIPECONF(PIPE_B), D_ALL, NULL, pipeconf_mmio_write);
-	MMIO_DH(PIPECONF(PIPE_C), D_ALL, NULL, pipeconf_mmio_write);
-	MMIO_DH(PIPECONF(_PIPE_EDP), D_ALL, NULL, pipeconf_mmio_write);
-
-	MMIO_D(PIPESTAT(PIPE_A), D_ALL);
-	MMIO_D(PIPESTAT(PIPE_B), D_ALL);
-	MMIO_D(PIPESTAT(PIPE_C), D_ALL);
-	MMIO_D(PIPESTAT(_PIPE_EDP), D_ALL);
-
-	MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_A), D_ALL);
-	MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_B), D_ALL);
-	MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_C), D_ALL);
-	MMIO_D(PIPE_FLIPCOUNT_G4X(_PIPE_EDP), D_ALL);
-
-	MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_A), D_ALL);
-	MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_B), D_ALL);
-	MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_C), D_ALL);
-	MMIO_D(PIPE_FRMCOUNT_G4X(_PIPE_EDP), D_ALL);
-
-	MMIO_D(CURCNTR(PIPE_A), D_ALL);
-	MMIO_D(CURCNTR(PIPE_B), D_ALL);
-	MMIO_D(CURCNTR(PIPE_C), D_ALL);
-
-	MMIO_D(CURPOS(PIPE_A), D_ALL);
-	MMIO_D(CURPOS(PIPE_B), D_ALL);
-	MMIO_D(CURPOS(PIPE_C), D_ALL);
-
-	MMIO_D(CURBASE(PIPE_A), D_ALL);
-	MMIO_D(CURBASE(PIPE_B), D_ALL);
-	MMIO_D(CURBASE(PIPE_C), D_ALL);
-
-	MMIO_D(CUR_FBC_CTL(PIPE_A), D_ALL);
-	MMIO_D(CUR_FBC_CTL(PIPE_B), D_ALL);
-	MMIO_D(CUR_FBC_CTL(PIPE_C), D_ALL);
-
-	MMIO_D(_MMIO(0x700ac), D_ALL);
-	MMIO_D(_MMIO(0x710ac), D_ALL);
-	MMIO_D(_MMIO(0x720ac), D_ALL);
-
-	MMIO_D(_MMIO(0x70090), D_ALL);
-	MMIO_D(_MMIO(0x70094), D_ALL);
-	MMIO_D(_MMIO(0x70098), D_ALL);
-	MMIO_D(_MMIO(0x7009c), D_ALL);
-
-	MMIO_D(DSPCNTR(PIPE_A), D_ALL);
-	MMIO_D(DSPADDR(PIPE_A), D_ALL);
-	MMIO_D(DSPSTRIDE(PIPE_A), D_ALL);
-	MMIO_D(DSPPOS(PIPE_A), D_ALL);
-	MMIO_D(DSPSIZE(PIPE_A), D_ALL);
-	MMIO_DH(DSPSURF(PIPE_A), D_ALL, NULL, pri_surf_mmio_write);
-	MMIO_D(DSPOFFSET(PIPE_A), D_ALL);
-	MMIO_D(DSPSURFLIVE(PIPE_A), D_ALL);
-	MMIO_DH(REG_50080(PIPE_A, PLANE_PRIMARY), D_ALL, NULL,
-		reg50080_mmio_write);
-
-	MMIO_D(DSPCNTR(PIPE_B), D_ALL);
-	MMIO_D(DSPADDR(PIPE_B), D_ALL);
-	MMIO_D(DSPSTRIDE(PIPE_B), D_ALL);
-	MMIO_D(DSPPOS(PIPE_B), D_ALL);
-	MMIO_D(DSPSIZE(PIPE_B), D_ALL);
-	MMIO_DH(DSPSURF(PIPE_B), D_ALL, NULL, pri_surf_mmio_write);
-	MMIO_D(DSPOFFSET(PIPE_B), D_ALL);
-	MMIO_D(DSPSURFLIVE(PIPE_B), D_ALL);
-	MMIO_DH(REG_50080(PIPE_B, PLANE_PRIMARY), D_ALL, NULL,
-		reg50080_mmio_write);
-
-	MMIO_D(DSPCNTR(PIPE_C), D_ALL);
-	MMIO_D(DSPADDR(PIPE_C), D_ALL);
-	MMIO_D(DSPSTRIDE(PIPE_C), D_ALL);
-	MMIO_D(DSPPOS(PIPE_C), D_ALL);
-	MMIO_D(DSPSIZE(PIPE_C), D_ALL);
-	MMIO_DH(DSPSURF(PIPE_C), D_ALL, NULL, pri_surf_mmio_write);
-	MMIO_D(DSPOFFSET(PIPE_C), D_ALL);
-	MMIO_D(DSPSURFLIVE(PIPE_C), D_ALL);
-	MMIO_DH(REG_50080(PIPE_C, PLANE_PRIMARY), D_ALL, NULL,
-		reg50080_mmio_write);
-
-	MMIO_D(SPRCTL(PIPE_A), D_ALL);
-	MMIO_D(SPRLINOFF(PIPE_A), D_ALL);
-	MMIO_D(SPRSTRIDE(PIPE_A), D_ALL);
-	MMIO_D(SPRPOS(PIPE_A), D_ALL);
-	MMIO_D(SPRSIZE(PIPE_A), D_ALL);
-	MMIO_D(SPRKEYVAL(PIPE_A), D_ALL);
-	MMIO_D(SPRKEYMSK(PIPE_A), D_ALL);
-	MMIO_DH(SPRSURF(PIPE_A), D_ALL, NULL, spr_surf_mmio_write);
-	MMIO_D(SPRKEYMAX(PIPE_A), D_ALL);
-	MMIO_D(SPROFFSET(PIPE_A), D_ALL);
-	MMIO_D(SPRSCALE(PIPE_A), D_ALL);
-	MMIO_D(SPRSURFLIVE(PIPE_A), D_ALL);
-	MMIO_DH(REG_50080(PIPE_A, PLANE_SPRITE0), D_ALL, NULL,
-		reg50080_mmio_write);
-
-	MMIO_D(SPRCTL(PIPE_B), D_ALL);
-	MMIO_D(SPRLINOFF(PIPE_B), D_ALL);
-	MMIO_D(SPRSTRIDE(PIPE_B), D_ALL);
-	MMIO_D(SPRPOS(PIPE_B), D_ALL);
-	MMIO_D(SPRSIZE(PIPE_B), D_ALL);
-	MMIO_D(SPRKEYVAL(PIPE_B), D_ALL);
-	MMIO_D(SPRKEYMSK(PIPE_B), D_ALL);
-	MMIO_DH(SPRSURF(PIPE_B), D_ALL, NULL, spr_surf_mmio_write);
-	MMIO_D(SPRKEYMAX(PIPE_B), D_ALL);
-	MMIO_D(SPROFFSET(PIPE_B), D_ALL);
-	MMIO_D(SPRSCALE(PIPE_B), D_ALL);
-	MMIO_D(SPRSURFLIVE(PIPE_B), D_ALL);
-	MMIO_DH(REG_50080(PIPE_B, PLANE_SPRITE0), D_ALL, NULL,
-		reg50080_mmio_write);
-
-	MMIO_D(SPRCTL(PIPE_C), D_ALL);
-	MMIO_D(SPRLINOFF(PIPE_C), D_ALL);
-	MMIO_D(SPRSTRIDE(PIPE_C), D_ALL);
-	MMIO_D(SPRPOS(PIPE_C), D_ALL);
-	MMIO_D(SPRSIZE(PIPE_C), D_ALL);
-	MMIO_D(SPRKEYVAL(PIPE_C), D_ALL);
-	MMIO_D(SPRKEYMSK(PIPE_C), D_ALL);
-	MMIO_DH(SPRSURF(PIPE_C), D_ALL, NULL, spr_surf_mmio_write);
-	MMIO_D(SPRKEYMAX(PIPE_C), D_ALL);
-	MMIO_D(SPROFFSET(PIPE_C), D_ALL);
-	MMIO_D(SPRSCALE(PIPE_C), D_ALL);
-	MMIO_D(SPRSURFLIVE(PIPE_C), D_ALL);
-	MMIO_DH(REG_50080(PIPE_C, PLANE_SPRITE0), D_ALL, NULL,
-		reg50080_mmio_write);
-
-	MMIO_D(HTOTAL(TRANSCODER_A), D_ALL);
-	MMIO_D(HBLANK(TRANSCODER_A), D_ALL);
-	MMIO_D(HSYNC(TRANSCODER_A), D_ALL);
-	MMIO_D(VTOTAL(TRANSCODER_A), D_ALL);
-	MMIO_D(VBLANK(TRANSCODER_A), D_ALL);
-	MMIO_D(VSYNC(TRANSCODER_A), D_ALL);
-	MMIO_D(BCLRPAT(TRANSCODER_A), D_ALL);
-	MMIO_D(VSYNCSHIFT(TRANSCODER_A), D_ALL);
-	MMIO_D(PIPESRC(TRANSCODER_A), D_ALL);
-
-	MMIO_D(HTOTAL(TRANSCODER_B), D_ALL);
-	MMIO_D(HBLANK(TRANSCODER_B), D_ALL);
-	MMIO_D(HSYNC(TRANSCODER_B), D_ALL);
-	MMIO_D(VTOTAL(TRANSCODER_B), D_ALL);
-	MMIO_D(VBLANK(TRANSCODER_B), D_ALL);
-	MMIO_D(VSYNC(TRANSCODER_B), D_ALL);
-	MMIO_D(BCLRPAT(TRANSCODER_B), D_ALL);
-	MMIO_D(VSYNCSHIFT(TRANSCODER_B), D_ALL);
-	MMIO_D(PIPESRC(TRANSCODER_B), D_ALL);
-
-	MMIO_D(HTOTAL(TRANSCODER_C), D_ALL);
-	MMIO_D(HBLANK(TRANSCODER_C), D_ALL);
-	MMIO_D(HSYNC(TRANSCODER_C), D_ALL);
-	MMIO_D(VTOTAL(TRANSCODER_C), D_ALL);
-	MMIO_D(VBLANK(TRANSCODER_C), D_ALL);
-	MMIO_D(VSYNC(TRANSCODER_C), D_ALL);
-	MMIO_D(BCLRPAT(TRANSCODER_C), D_ALL);
-	MMIO_D(VSYNCSHIFT(TRANSCODER_C), D_ALL);
-	MMIO_D(PIPESRC(TRANSCODER_C), D_ALL);
-
-	MMIO_D(HTOTAL(TRANSCODER_EDP), D_ALL);
-	MMIO_D(HBLANK(TRANSCODER_EDP), D_ALL);
-	MMIO_D(HSYNC(TRANSCODER_EDP), D_ALL);
-	MMIO_D(VTOTAL(TRANSCODER_EDP), D_ALL);
-	MMIO_D(VBLANK(TRANSCODER_EDP), D_ALL);
-	MMIO_D(VSYNC(TRANSCODER_EDP), D_ALL);
-	MMIO_D(BCLRPAT(TRANSCODER_EDP), D_ALL);
-	MMIO_D(VSYNCSHIFT(TRANSCODER_EDP), D_ALL);
-
-	MMIO_D(PIPE_DATA_M1(TRANSCODER_A), D_ALL);
-	MMIO_D(PIPE_DATA_N1(TRANSCODER_A), D_ALL);
-	MMIO_D(PIPE_DATA_M2(TRANSCODER_A), D_ALL);
-	MMIO_D(PIPE_DATA_N2(TRANSCODER_A), D_ALL);
-	MMIO_D(PIPE_LINK_M1(TRANSCODER_A), D_ALL);
-	MMIO_D(PIPE_LINK_N1(TRANSCODER_A), D_ALL);
-	MMIO_D(PIPE_LINK_M2(TRANSCODER_A), D_ALL);
-	MMIO_D(PIPE_LINK_N2(TRANSCODER_A), D_ALL);
-
-	MMIO_D(PIPE_DATA_M1(TRANSCODER_B), D_ALL);
-	MMIO_D(PIPE_DATA_N1(TRANSCODER_B), D_ALL);
-	MMIO_D(PIPE_DATA_M2(TRANSCODER_B), D_ALL);
-	MMIO_D(PIPE_DATA_N2(TRANSCODER_B), D_ALL);
-	MMIO_D(PIPE_LINK_M1(TRANSCODER_B), D_ALL);
-	MMIO_D(PIPE_LINK_N1(TRANSCODER_B), D_ALL);
-	MMIO_D(PIPE_LINK_M2(TRANSCODER_B), D_ALL);
-	MMIO_D(PIPE_LINK_N2(TRANSCODER_B), D_ALL);
-
-	MMIO_D(PIPE_DATA_M1(TRANSCODER_C), D_ALL);
-	MMIO_D(PIPE_DATA_N1(TRANSCODER_C), D_ALL);
-	MMIO_D(PIPE_DATA_M2(TRANSCODER_C), D_ALL);
-	MMIO_D(PIPE_DATA_N2(TRANSCODER_C), D_ALL);
-	MMIO_D(PIPE_LINK_M1(TRANSCODER_C), D_ALL);
-	MMIO_D(PIPE_LINK_N1(TRANSCODER_C), D_ALL);
-	MMIO_D(PIPE_LINK_M2(TRANSCODER_C), D_ALL);
-	MMIO_D(PIPE_LINK_N2(TRANSCODER_C), D_ALL);
-
-	MMIO_D(PIPE_DATA_M1(TRANSCODER_EDP), D_ALL);
-	MMIO_D(PIPE_DATA_N1(TRANSCODER_EDP), D_ALL);
-	MMIO_D(PIPE_DATA_M2(TRANSCODER_EDP), D_ALL);
-	MMIO_D(PIPE_DATA_N2(TRANSCODER_EDP), D_ALL);
-	MMIO_D(PIPE_LINK_M1(TRANSCODER_EDP), D_ALL);
-	MMIO_D(PIPE_LINK_N1(TRANSCODER_EDP), D_ALL);
-	MMIO_D(PIPE_LINK_M2(TRANSCODER_EDP), D_ALL);
-	MMIO_D(PIPE_LINK_N2(TRANSCODER_EDP), D_ALL);
-
-	MMIO_D(PF_CTL(PIPE_A), D_ALL);
-	MMIO_D(PF_WIN_SZ(PIPE_A), D_ALL);
-	MMIO_D(PF_WIN_POS(PIPE_A), D_ALL);
-	MMIO_D(PF_VSCALE(PIPE_A), D_ALL);
-	MMIO_D(PF_HSCALE(PIPE_A), D_ALL);
-
-	MMIO_D(PF_CTL(PIPE_B), D_ALL);
-	MMIO_D(PF_WIN_SZ(PIPE_B), D_ALL);
-	MMIO_D(PF_WIN_POS(PIPE_B), D_ALL);
-	MMIO_D(PF_VSCALE(PIPE_B), D_ALL);
-	MMIO_D(PF_HSCALE(PIPE_B), D_ALL);
-
-	MMIO_D(PF_CTL(PIPE_C), D_ALL);
-	MMIO_D(PF_WIN_SZ(PIPE_C), D_ALL);
-	MMIO_D(PF_WIN_POS(PIPE_C), D_ALL);
-	MMIO_D(PF_VSCALE(PIPE_C), D_ALL);
-	MMIO_D(PF_HSCALE(PIPE_C), D_ALL);
-
-	MMIO_D(WM0_PIPE_ILK(PIPE_A), D_ALL);
-	MMIO_D(WM0_PIPE_ILK(PIPE_B), D_ALL);
-	MMIO_D(WM0_PIPE_ILK(PIPE_C), D_ALL);
-	MMIO_D(WM1_LP_ILK, D_ALL);
-	MMIO_D(WM2_LP_ILK, D_ALL);
-	MMIO_D(WM3_LP_ILK, D_ALL);
-	MMIO_D(WM1S_LP_ILK, D_ALL);
-	MMIO_D(WM2S_LP_IVB, D_ALL);
-	MMIO_D(WM3S_LP_IVB, D_ALL);
-
-	MMIO_D(BLC_PWM_CPU_CTL2, D_ALL);
-	MMIO_D(BLC_PWM_CPU_CTL, D_ALL);
-	MMIO_D(BLC_PWM_PCH_CTL1, D_ALL);
-	MMIO_D(BLC_PWM_PCH_CTL2, D_ALL);
-
-	MMIO_D(_MMIO(0x48268), D_ALL);
-
-	MMIO_F(PCH_GMBUS0, 4 * 4, 0, 0, 0, D_ALL, gmbus_mmio_read,
-		gmbus_mmio_write);
-	MMIO_F(PCH_GPIO_BASE, 6 * 4, F_UNALIGN, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(_MMIO(0xe4f00), 0x28, 0, 0, 0, D_ALL, NULL, NULL);
-
-	MMIO_F(_MMIO(_PCH_DPB_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL, NULL,
-		dp_aux_ch_ctl_mmio_write);
-	MMIO_F(_MMIO(_PCH_DPC_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL, NULL,
-		dp_aux_ch_ctl_mmio_write);
-	MMIO_F(_MMIO(_PCH_DPD_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL, NULL,
-		dp_aux_ch_ctl_mmio_write);
-
-	MMIO_DH(PCH_ADPA, D_PRE_SKL, NULL, pch_adpa_mmio_write);
-
-	MMIO_DH(_MMIO(_PCH_TRANSACONF), D_ALL, NULL, transconf_mmio_write);
-	MMIO_DH(_MMIO(_PCH_TRANSBCONF), D_ALL, NULL, transconf_mmio_write);
-
-	MMIO_DH(FDI_RX_IIR(PIPE_A), D_ALL, NULL, fdi_rx_iir_mmio_write);
-	MMIO_DH(FDI_RX_IIR(PIPE_B), D_ALL, NULL, fdi_rx_iir_mmio_write);
-	MMIO_DH(FDI_RX_IIR(PIPE_C), D_ALL, NULL, fdi_rx_iir_mmio_write);
-	MMIO_DH(FDI_RX_IMR(PIPE_A), D_ALL, NULL, update_fdi_rx_iir_status);
-	MMIO_DH(FDI_RX_IMR(PIPE_B), D_ALL, NULL, update_fdi_rx_iir_status);
-	MMIO_DH(FDI_RX_IMR(PIPE_C), D_ALL, NULL, update_fdi_rx_iir_status);
-	MMIO_DH(FDI_RX_CTL(PIPE_A), D_ALL, NULL, update_fdi_rx_iir_status);
-	MMIO_DH(FDI_RX_CTL(PIPE_B), D_ALL, NULL, update_fdi_rx_iir_status);
-	MMIO_DH(FDI_RX_CTL(PIPE_C), D_ALL, NULL, update_fdi_rx_iir_status);
-
-	MMIO_D(_MMIO(_PCH_TRANS_HTOTAL_A), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANS_HBLANK_A), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANS_HSYNC_A), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANS_VTOTAL_A), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANS_VBLANK_A), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANS_VSYNC_A), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANS_VSYNCSHIFT_A), D_ALL);
-
-	MMIO_D(_MMIO(_PCH_TRANS_HTOTAL_B), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANS_HBLANK_B), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANS_HSYNC_B), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANS_VTOTAL_B), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANS_VBLANK_B), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANS_VSYNC_B), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANS_VSYNCSHIFT_B), D_ALL);
-
-	MMIO_D(_MMIO(_PCH_TRANSA_DATA_M1), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANSA_DATA_N1), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANSA_DATA_M2), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANSA_DATA_N2), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANSA_LINK_M1), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANSA_LINK_N1), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANSA_LINK_M2), D_ALL);
-	MMIO_D(_MMIO(_PCH_TRANSA_LINK_N2), D_ALL);
-
-	MMIO_D(TRANS_DP_CTL(PIPE_A), D_ALL);
-	MMIO_D(TRANS_DP_CTL(PIPE_B), D_ALL);
-	MMIO_D(TRANS_DP_CTL(PIPE_C), D_ALL);
-
-	MMIO_D(TVIDEO_DIP_CTL(PIPE_A), D_ALL);
-	MMIO_D(TVIDEO_DIP_DATA(PIPE_A), D_ALL);
-	MMIO_D(TVIDEO_DIP_GCP(PIPE_A), D_ALL);
-
-	MMIO_D(TVIDEO_DIP_CTL(PIPE_B), D_ALL);
-	MMIO_D(TVIDEO_DIP_DATA(PIPE_B), D_ALL);
-	MMIO_D(TVIDEO_DIP_GCP(PIPE_B), D_ALL);
-
-	MMIO_D(TVIDEO_DIP_CTL(PIPE_C), D_ALL);
-	MMIO_D(TVIDEO_DIP_DATA(PIPE_C), D_ALL);
-	MMIO_D(TVIDEO_DIP_GCP(PIPE_C), D_ALL);
-
-	MMIO_D(_MMIO(_FDI_RXA_MISC), D_ALL);
-	MMIO_D(_MMIO(_FDI_RXB_MISC), D_ALL);
-	MMIO_D(_MMIO(_FDI_RXA_TUSIZE1), D_ALL);
-	MMIO_D(_MMIO(_FDI_RXA_TUSIZE2), D_ALL);
-	MMIO_D(_MMIO(_FDI_RXB_TUSIZE1), D_ALL);
-	MMIO_D(_MMIO(_FDI_RXB_TUSIZE2), D_ALL);
-
-	MMIO_DH(PCH_PP_CONTROL, D_ALL, NULL, pch_pp_control_mmio_write);
-	MMIO_D(PCH_PP_DIVISOR, D_ALL);
-	MMIO_D(PCH_PP_STATUS,  D_ALL);
-	MMIO_D(PCH_LVDS, D_ALL);
-	MMIO_D(_MMIO(_PCH_DPLL_A), D_ALL);
-	MMIO_D(_MMIO(_PCH_DPLL_B), D_ALL);
-	MMIO_D(_MMIO(_PCH_FPA0), D_ALL);
-	MMIO_D(_MMIO(_PCH_FPA1), D_ALL);
-	MMIO_D(_MMIO(_PCH_FPB0), D_ALL);
-	MMIO_D(_MMIO(_PCH_FPB1), D_ALL);
-	MMIO_D(PCH_DREF_CONTROL, D_ALL);
-	MMIO_D(PCH_RAWCLK_FREQ, D_ALL);
-	MMIO_D(PCH_DPLL_SEL, D_ALL);
-
-	MMIO_D(_MMIO(0x61208), D_ALL);
-	MMIO_D(_MMIO(0x6120c), D_ALL);
-	MMIO_D(PCH_PP_ON_DELAYS, D_ALL);
-	MMIO_D(PCH_PP_OFF_DELAYS, D_ALL);
-
-	MMIO_DH(_MMIO(0xe651c), D_ALL, dpy_reg_mmio_read, NULL);
-	MMIO_DH(_MMIO(0xe661c), D_ALL, dpy_reg_mmio_read, NULL);
-	MMIO_DH(_MMIO(0xe671c), D_ALL, dpy_reg_mmio_read, NULL);
-	MMIO_DH(_MMIO(0xe681c), D_ALL, dpy_reg_mmio_read, NULL);
-	MMIO_DH(_MMIO(0xe6c04), D_ALL, dpy_reg_mmio_read, NULL);
-	MMIO_DH(_MMIO(0xe6e1c), D_ALL, dpy_reg_mmio_read, NULL);
-
-	MMIO_RO(PCH_PORT_HOTPLUG, D_ALL, 0,
-		PORTA_HOTPLUG_STATUS_MASK
-		| PORTB_HOTPLUG_STATUS_MASK
-		| PORTC_HOTPLUG_STATUS_MASK
-		| PORTD_HOTPLUG_STATUS_MASK,
-		NULL, NULL);
-
-	MMIO_DH(LCPLL_CTL, D_ALL, NULL, lcpll_ctl_mmio_write);
-	MMIO_D(FUSE_STRAP, D_ALL);
-	MMIO_D(DIGITAL_PORT_HOTPLUG_CNTRL, D_ALL);
-
-	MMIO_D(DISP_ARB_CTL, D_ALL);
-	MMIO_D(DISP_ARB_CTL2, D_ALL);
-
-	MMIO_D(ILK_DISPLAY_CHICKEN1, D_ALL);
-	MMIO_D(ILK_DISPLAY_CHICKEN2, D_ALL);
-	MMIO_D(ILK_DSPCLK_GATE_D, D_ALL);
-
-	MMIO_D(SOUTH_CHICKEN1, D_ALL);
-	MMIO_DH(SOUTH_CHICKEN2, D_ALL, NULL, south_chicken2_mmio_write);
-	MMIO_D(_MMIO(_TRANSA_CHICKEN1), D_ALL);
-	MMIO_D(_MMIO(_TRANSB_CHICKEN1), D_ALL);
-	MMIO_D(SOUTH_DSPCLK_GATE_D, D_ALL);
-	MMIO_D(_MMIO(_TRANSA_CHICKEN2), D_ALL);
-	MMIO_D(_MMIO(_TRANSB_CHICKEN2), D_ALL);
-
-	MMIO_D(ILK_DPFC_CB_BASE, D_ALL);
-	MMIO_D(ILK_DPFC_CONTROL, D_ALL);
-	MMIO_D(ILK_DPFC_RECOMP_CTL, D_ALL);
-	MMIO_D(ILK_DPFC_STATUS, D_ALL);
-	MMIO_D(ILK_DPFC_FENCE_YOFF, D_ALL);
-	MMIO_D(ILK_DPFC_CHICKEN, D_ALL);
-	MMIO_D(ILK_FBC_RT_BASE, D_ALL);
-
-	MMIO_D(IPS_CTL, D_ALL);
-
-	MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_A), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_BY(PIPE_A), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_A), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_BU(PIPE_A), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_A), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_BV(PIPE_A), D_ALL);
-	MMIO_D(PIPE_CSC_MODE(PIPE_A), D_ALL);
-	MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_A), D_ALL);
-	MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_A), D_ALL);
-	MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_A), D_ALL);
-	MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_A), D_ALL);
-	MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_A), D_ALL);
-	MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_A), D_ALL);
-
-	MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_B), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_BY(PIPE_B), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_B), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_BU(PIPE_B), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_B), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_BV(PIPE_B), D_ALL);
-	MMIO_D(PIPE_CSC_MODE(PIPE_B), D_ALL);
-	MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_B), D_ALL);
-	MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_B), D_ALL);
-	MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_B), D_ALL);
-	MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_B), D_ALL);
-	MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_B), D_ALL);
-	MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_B), D_ALL);
-
-	MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_C), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_BY(PIPE_C), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_C), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_BU(PIPE_C), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_C), D_ALL);
-	MMIO_D(PIPE_CSC_COEFF_BV(PIPE_C), D_ALL);
-	MMIO_D(PIPE_CSC_MODE(PIPE_C), D_ALL);
-	MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_C), D_ALL);
-	MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_C), D_ALL);
-	MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_C), D_ALL);
-	MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_C), D_ALL);
-	MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_C), D_ALL);
-	MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_C), D_ALL);
-
-	MMIO_D(PREC_PAL_INDEX(PIPE_A), D_ALL);
-	MMIO_D(PREC_PAL_DATA(PIPE_A), D_ALL);
-	MMIO_F(PREC_PAL_GC_MAX(PIPE_A, 0), 4 * 3, 0, 0, 0, D_ALL, NULL, NULL);
-
-	MMIO_D(PREC_PAL_INDEX(PIPE_B), D_ALL);
-	MMIO_D(PREC_PAL_DATA(PIPE_B), D_ALL);
-	MMIO_F(PREC_PAL_GC_MAX(PIPE_B, 0), 4 * 3, 0, 0, 0, D_ALL, NULL, NULL);
-
-	MMIO_D(PREC_PAL_INDEX(PIPE_C), D_ALL);
-	MMIO_D(PREC_PAL_DATA(PIPE_C), D_ALL);
-	MMIO_F(PREC_PAL_GC_MAX(PIPE_C, 0), 4 * 3, 0, 0, 0, D_ALL, NULL, NULL);
-
-	MMIO_D(_MMIO(0x60110), D_ALL);
-	MMIO_D(_MMIO(0x61110), D_ALL);
-	MMIO_F(_MMIO(0x70400), 0x40, 0, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(_MMIO(0x71400), 0x40, 0, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(_MMIO(0x72400), 0x40, 0, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(_MMIO(0x70440), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
-	MMIO_F(_MMIO(0x71440), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
-	MMIO_F(_MMIO(0x72440), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
-	MMIO_F(_MMIO(0x7044c), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
-	MMIO_F(_MMIO(0x7144c), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
-	MMIO_F(_MMIO(0x7244c), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
-
-	MMIO_D(WM_LINETIME(PIPE_A), D_ALL);
-	MMIO_D(WM_LINETIME(PIPE_B), D_ALL);
-	MMIO_D(WM_LINETIME(PIPE_C), D_ALL);
-	MMIO_D(SPLL_CTL, D_ALL);
-	MMIO_D(_MMIO(_WRPLL_CTL1), D_ALL);
-	MMIO_D(_MMIO(_WRPLL_CTL2), D_ALL);
-	MMIO_D(PORT_CLK_SEL(PORT_A), D_ALL);
-	MMIO_D(PORT_CLK_SEL(PORT_B), D_ALL);
-	MMIO_D(PORT_CLK_SEL(PORT_C), D_ALL);
-	MMIO_D(PORT_CLK_SEL(PORT_D), D_ALL);
-	MMIO_D(PORT_CLK_SEL(PORT_E), D_ALL);
-	MMIO_D(TRANS_CLK_SEL(TRANSCODER_A), D_ALL);
-	MMIO_D(TRANS_CLK_SEL(TRANSCODER_B), D_ALL);
-	MMIO_D(TRANS_CLK_SEL(TRANSCODER_C), D_ALL);
-
-	MMIO_D(HSW_NDE_RSTWRN_OPT, D_ALL);
-	MMIO_D(_MMIO(0x46508), D_ALL);
-
-	MMIO_D(_MMIO(0x49080), D_ALL);
-	MMIO_D(_MMIO(0x49180), D_ALL);
-	MMIO_D(_MMIO(0x49280), D_ALL);
-
-	MMIO_F(_MMIO(0x49090), 0x14, 0, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(_MMIO(0x49190), 0x14, 0, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(_MMIO(0x49290), 0x14, 0, 0, 0, D_ALL, NULL, NULL);
-
-	MMIO_D(GAMMA_MODE(PIPE_A), D_ALL);
-	MMIO_D(GAMMA_MODE(PIPE_B), D_ALL);
-	MMIO_D(GAMMA_MODE(PIPE_C), D_ALL);
-
-	MMIO_D(PIPE_MULT(PIPE_A), D_ALL);
-	MMIO_D(PIPE_MULT(PIPE_B), D_ALL);
-	MMIO_D(PIPE_MULT(PIPE_C), D_ALL);
-
-	MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_A), D_ALL);
-	MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_B), D_ALL);
-	MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_C), D_ALL);
-
-	MMIO_DH(SFUSE_STRAP, D_ALL, NULL, NULL);
-	MMIO_D(SBI_ADDR, D_ALL);
-	MMIO_DH(SBI_DATA, D_ALL, sbi_data_mmio_read, NULL);
-	MMIO_DH(SBI_CTL_STAT, D_ALL, NULL, sbi_ctl_mmio_write);
-	MMIO_D(PIXCLK_GATE, D_ALL);
-
-	MMIO_F(_MMIO(_DPA_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_ALL, NULL,
-		dp_aux_ch_ctl_mmio_write);
-
-	MMIO_DH(DDI_BUF_CTL(PORT_A), D_ALL, NULL, ddi_buf_ctl_mmio_write);
-	MMIO_DH(DDI_BUF_CTL(PORT_B), D_ALL, NULL, ddi_buf_ctl_mmio_write);
-	MMIO_DH(DDI_BUF_CTL(PORT_C), D_ALL, NULL, ddi_buf_ctl_mmio_write);
-	MMIO_DH(DDI_BUF_CTL(PORT_D), D_ALL, NULL, ddi_buf_ctl_mmio_write);
-	MMIO_DH(DDI_BUF_CTL(PORT_E), D_ALL, NULL, ddi_buf_ctl_mmio_write);
-
-	MMIO_DH(DP_TP_CTL(PORT_A), D_ALL, NULL, dp_tp_ctl_mmio_write);
-	MMIO_DH(DP_TP_CTL(PORT_B), D_ALL, NULL, dp_tp_ctl_mmio_write);
-	MMIO_DH(DP_TP_CTL(PORT_C), D_ALL, NULL, dp_tp_ctl_mmio_write);
-	MMIO_DH(DP_TP_CTL(PORT_D), D_ALL, NULL, dp_tp_ctl_mmio_write);
-	MMIO_DH(DP_TP_CTL(PORT_E), D_ALL, NULL, dp_tp_ctl_mmio_write);
-
-	MMIO_DH(DP_TP_STATUS(PORT_A), D_ALL, NULL, dp_tp_status_mmio_write);
-	MMIO_DH(DP_TP_STATUS(PORT_B), D_ALL, NULL, dp_tp_status_mmio_write);
-	MMIO_DH(DP_TP_STATUS(PORT_C), D_ALL, NULL, dp_tp_status_mmio_write);
-	MMIO_DH(DP_TP_STATUS(PORT_D), D_ALL, NULL, dp_tp_status_mmio_write);
-	MMIO_DH(DP_TP_STATUS(PORT_E), D_ALL, NULL, NULL);
-
-	MMIO_F(_MMIO(_DDI_BUF_TRANS_A), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(_MMIO(0x64e60), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(_MMIO(0x64eC0), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(_MMIO(0x64f20), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(_MMIO(0x64f80), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
-
-	MMIO_D(HSW_AUD_CFG(PIPE_A), D_ALL);
-	MMIO_D(HSW_AUD_PIN_ELD_CP_VLD, D_ALL);
-	MMIO_D(HSW_AUD_MISC_CTRL(PIPE_A), D_ALL);
-
-	MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_A), D_ALL, NULL, NULL);
-	MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_B), D_ALL, NULL, NULL);
-	MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_C), D_ALL, NULL, NULL);
-	MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_EDP), D_ALL, NULL, NULL);
-
-	MMIO_D(_MMIO(_TRANSA_MSA_MISC), D_ALL);
-	MMIO_D(_MMIO(_TRANSB_MSA_MISC), D_ALL);
-	MMIO_D(_MMIO(_TRANSC_MSA_MISC), D_ALL);
-	MMIO_D(_MMIO(_TRANS_EDP_MSA_MISC), D_ALL);
-
-	MMIO_DH(FORCEWAKE, D_ALL, NULL, NULL);
-	MMIO_D(FORCEWAKE_ACK, D_ALL);
-	MMIO_D(GEN6_GT_CORE_STATUS, D_ALL);
-	MMIO_D(GEN6_GT_THREAD_STATUS_REG, D_ALL);
-	MMIO_DFH(GTFIFODBG, D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(GTFIFOCTL, D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DH(FORCEWAKE_MT, D_PRE_SKL, NULL, mul_force_wake_write);
-	MMIO_DH(FORCEWAKE_ACK_HSW, D_BDW, NULL, NULL);
-	MMIO_D(ECOBUS, D_ALL);
-	MMIO_DH(GEN6_RC_CONTROL, D_ALL, NULL, NULL);
-	MMIO_DH(GEN6_RC_STATE, D_ALL, NULL, NULL);
-	MMIO_D(GEN6_RPNSWREQ, D_ALL);
-	MMIO_D(GEN6_RC_VIDEO_FREQ, D_ALL);
-	MMIO_D(GEN6_RP_DOWN_TIMEOUT, D_ALL);
-	MMIO_D(GEN6_RP_INTERRUPT_LIMITS, D_ALL);
-	MMIO_D(GEN6_RPSTAT1, D_ALL);
-	MMIO_D(GEN6_RP_CONTROL, D_ALL);
-	MMIO_D(GEN6_RP_UP_THRESHOLD, D_ALL);
-	MMIO_D(GEN6_RP_DOWN_THRESHOLD, D_ALL);
-	MMIO_D(GEN6_RP_CUR_UP_EI, D_ALL);
-	MMIO_D(GEN6_RP_CUR_UP, D_ALL);
-	MMIO_D(GEN6_RP_PREV_UP, D_ALL);
-	MMIO_D(GEN6_RP_CUR_DOWN_EI, D_ALL);
-	MMIO_D(GEN6_RP_CUR_DOWN, D_ALL);
-	MMIO_D(GEN6_RP_PREV_DOWN, D_ALL);
-	MMIO_D(GEN6_RP_UP_EI, D_ALL);
-	MMIO_D(GEN6_RP_DOWN_EI, D_ALL);
-	MMIO_D(GEN6_RP_IDLE_HYSTERSIS, D_ALL);
-	MMIO_D(GEN6_RC1_WAKE_RATE_LIMIT, D_ALL);
-	MMIO_D(GEN6_RC6_WAKE_RATE_LIMIT, D_ALL);
-	MMIO_D(GEN6_RC6pp_WAKE_RATE_LIMIT, D_ALL);
-	MMIO_D(GEN6_RC_EVALUATION_INTERVAL, D_ALL);
-	MMIO_D(GEN6_RC_IDLE_HYSTERSIS, D_ALL);
-	MMIO_D(GEN6_RC_SLEEP, D_ALL);
-	MMIO_D(GEN6_RC1e_THRESHOLD, D_ALL);
-	MMIO_D(GEN6_RC6_THRESHOLD, D_ALL);
-	MMIO_D(GEN6_RC6p_THRESHOLD, D_ALL);
-	MMIO_D(GEN6_RC6pp_THRESHOLD, D_ALL);
-	MMIO_D(GEN6_PMINTRMSK, D_ALL);
-	MMIO_DH(HSW_PWR_WELL_CTL1, D_BDW, NULL, power_well_ctl_mmio_write);
-	MMIO_DH(HSW_PWR_WELL_CTL2, D_BDW, NULL, power_well_ctl_mmio_write);
-	MMIO_DH(HSW_PWR_WELL_CTL3, D_BDW, NULL, power_well_ctl_mmio_write);
-	MMIO_DH(HSW_PWR_WELL_CTL4, D_BDW, NULL, power_well_ctl_mmio_write);
-	MMIO_DH(HSW_PWR_WELL_CTL5, D_BDW, NULL, power_well_ctl_mmio_write);
-	MMIO_DH(HSW_PWR_WELL_CTL6, D_BDW, NULL, power_well_ctl_mmio_write);
-
-	MMIO_D(RSTDBYCTL, D_ALL);
-
-	MMIO_DH(GEN6_GDRST, D_ALL, NULL, gdrst_mmio_write);
-	MMIO_F(FENCE_REG_GEN6_LO(0), 0x80, 0, 0, 0, D_ALL, fence_mmio_read, fence=
_mmio_write);
-	MMIO_DH(CPU_VGACNTRL, D_ALL, NULL, vga_control_mmio_write);
-
-	MMIO_D(TILECTL, D_ALL);
-
-	MMIO_D(GEN6_UCGCTL1, D_ALL);
-	MMIO_D(GEN6_UCGCTL2, D_ALL);
-
-	MMIO_F(_MMIO(0x4f000), 0x90, 0, 0, 0, D_ALL, NULL, NULL);
-
-	MMIO_D(GEN6_PCODE_DATA, D_ALL);
-	MMIO_D(_MMIO(0x13812c), D_ALL);
-	MMIO_DH(GEN7_ERR_INT, D_ALL, NULL, NULL);
-	MMIO_D(HSW_EDRAM_CAP, D_ALL);
-	MMIO_D(HSW_IDICR, D_ALL);
-	MMIO_DH(GFX_FLSH_CNTL_GEN6, D_ALL, NULL, NULL);
-
-	MMIO_D(_MMIO(0x3c), D_ALL);
-	MMIO_D(_MMIO(0x860), D_ALL);
-	MMIO_D(ECOSKPD, D_ALL);
-	MMIO_D(_MMIO(0x121d0), D_ALL);
-	MMIO_D(GEN6_BLITTER_ECOSKPD, D_ALL);
-	MMIO_D(_MMIO(0x41d0), D_ALL);
-	MMIO_D(GAC_ECO_BITS, D_ALL);
-	MMIO_D(_MMIO(0x6200), D_ALL);
-	MMIO_D(_MMIO(0x6204), D_ALL);
-	MMIO_D(_MMIO(0x6208), D_ALL);
-	MMIO_D(_MMIO(0x7118), D_ALL);
-	MMIO_D(_MMIO(0x7180), D_ALL);
-	MMIO_D(_MMIO(0x7408), D_ALL);
-	MMIO_D(_MMIO(0x7c00), D_ALL);
-	MMIO_DH(GEN6_MBCTL, D_ALL, NULL, mbctl_write);
-	MMIO_D(_MMIO(0x911c), D_ALL);
-	MMIO_D(_MMIO(0x9120), D_ALL);
-	MMIO_DFH(GEN7_UCGCTL4, D_ALL, F_CMD_ACCESS, NULL, NULL);
-
-	MMIO_D(GAB_CTL, D_ALL);
-	MMIO_D(_MMIO(0x48800), D_ALL);
-	MMIO_D(_MMIO(0xce044), D_ALL);
-	MMIO_D(_MMIO(0xe6500), D_ALL);
-	MMIO_D(_MMIO(0xe6504), D_ALL);
-	MMIO_D(_MMIO(0xe6600), D_ALL);
-	MMIO_D(_MMIO(0xe6604), D_ALL);
-	MMIO_D(_MMIO(0xe6700), D_ALL);
-	MMIO_D(_MMIO(0xe6704), D_ALL);
-	MMIO_D(_MMIO(0xe6800), D_ALL);
-	MMIO_D(_MMIO(0xe6804), D_ALL);
-	MMIO_D(PCH_GMBUS4, D_ALL);
-	MMIO_D(PCH_GMBUS5, D_ALL);
-
-	MMIO_D(_MMIO(0x902c), D_ALL);
-	MMIO_D(_MMIO(0xec008), D_ALL);
-	MMIO_D(_MMIO(0xec00c), D_ALL);
-	MMIO_D(_MMIO(0xec008 + 0x18), D_ALL);
-	MMIO_D(_MMIO(0xec00c + 0x18), D_ALL);
-	MMIO_D(_MMIO(0xec008 + 0x18 * 2), D_ALL);
-	MMIO_D(_MMIO(0xec00c + 0x18 * 2), D_ALL);
-	MMIO_D(_MMIO(0xec008 + 0x18 * 3), D_ALL);
-	MMIO_D(_MMIO(0xec00c + 0x18 * 3), D_ALL);
-	MMIO_D(_MMIO(0xec408), D_ALL);
-	MMIO_D(_MMIO(0xec40c), D_ALL);
-	MMIO_D(_MMIO(0xec408 + 0x18), D_ALL);
-	MMIO_D(_MMIO(0xec40c + 0x18), D_ALL);
-	MMIO_D(_MMIO(0xec408 + 0x18 * 2), D_ALL);
-	MMIO_D(_MMIO(0xec40c + 0x18 * 2), D_ALL);
-	MMIO_D(_MMIO(0xec408 + 0x18 * 3), D_ALL);
-	MMIO_D(_MMIO(0xec40c + 0x18 * 3), D_ALL);
-	MMIO_D(_MMIO(0xfc810), D_ALL);
-	MMIO_D(_MMIO(0xfc81c), D_ALL);
-	MMIO_D(_MMIO(0xfc828), D_ALL);
-	MMIO_D(_MMIO(0xfc834), D_ALL);
-	MMIO_D(_MMIO(0xfcc00), D_ALL);
-	MMIO_D(_MMIO(0xfcc0c), D_ALL);
-	MMIO_D(_MMIO(0xfcc18), D_ALL);
-	MMIO_D(_MMIO(0xfcc24), D_ALL);
-	MMIO_D(_MMIO(0xfd000), D_ALL);
-	MMIO_D(_MMIO(0xfd00c), D_ALL);
-	MMIO_D(_MMIO(0xfd018), D_ALL);
-	MMIO_D(_MMIO(0xfd024), D_ALL);
-	MMIO_D(_MMIO(0xfd034), D_ALL);
-
-	MMIO_DH(FPGA_DBG, D_ALL, NULL, fpga_dbg_mmio_write);
-	MMIO_D(_MMIO(0x2054), D_ALL);
-	MMIO_D(_MMIO(0x12054), D_ALL);
-	MMIO_D(_MMIO(0x22054), D_ALL);
-	MMIO_D(_MMIO(0x1a054), D_ALL);
-
-	MMIO_D(_MMIO(0x44070), D_ALL);
-	MMIO_DFH(_MMIO(0x215c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x2178), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x217c), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x12178), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x1217c), D_ALL, F_CMD_ACCESS, NULL, NULL);
-
-	MMIO_F(_MMIO(0x2290), 8, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL, NULL);
-	MMIO_D(_MMIO(0x2b00), D_BDW_PLUS);
-	MMIO_D(_MMIO(0x2360), D_BDW_PLUS);
-	MMIO_F(_MMIO(0x5200), 32, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(_MMIO(0x5240), 32, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(_MMIO(0x5280), 16, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-
-	MMIO_DFH(_MMIO(0x1c17c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x1c178), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(BCS_SWCTRL, D_ALL, F_CMD_ACCESS, NULL, NULL);
-
-	MMIO_F(HS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(DS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(IA_VERTICES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(IA_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(VS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(GS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(GS_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(CL_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(CL_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(PS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_F(PS_DEPTH_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
-	MMIO_DH(_MMIO(0x4260), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
-	MMIO_DH(_MMIO(0x4264), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
-	MMIO_DH(_MMIO(0x4268), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
-	MMIO_DH(_MMIO(0x426c), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
-	MMIO_DH(_MMIO(0x4270), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
-	MMIO_DFH(_MMIO(0x4094), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-
-	MMIO_DFH(ARB_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_RING_GM(RING_BBADDR, D_ALL, NULL, NULL);
-	MMIO_DFH(_MMIO(0x2220), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x12220), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x22220), D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_RING_DFH(RING_SYNC_1, D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_RING_DFH(RING_SYNC_0, D_ALL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x22178), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x1a178), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x1a17c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x2217c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-
-	MMIO_DH(EDP_PSR_IMR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
-	MMIO_DH(EDP_PSR_IIR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
-	MMIO_DH(GUC_STATUS, D_ALL, guc_status_read, NULL);
+	MMIO_RING_H(RING_TIMESTAMP, D_ALL, mmio_read_from_hw, NULL);
+	MMIO_RING_H(RING_TIMESTAMP_UDW, D_ALL, mmio_read_from_hw, NULL);
+	MMIO_H(PIPECONF(PIPE_A), D_ALL, NULL, pipeconf_mmio_write);
+	MMIO_H(PIPECONF(PIPE_B), D_ALL, NULL, pipeconf_mmio_write);
+	MMIO_H(PIPECONF(PIPE_C), D_ALL, NULL, pipeconf_mmio_write);
+	MMIO_H(PIPECONF(_PIPE_EDP), D_ALL, NULL, pipeconf_mmio_write);
+	MMIO_H(DSPSURF(PIPE_A), D_ALL, NULL, pri_surf_mmio_write);
+	MMIO_H(REG_50080(PIPE_A, PLANE_PRIMARY), D_ALL, NULL, reg50080_mmio_write=
);
+	MMIO_H(DSPSURF(PIPE_B), D_ALL, NULL, pri_surf_mmio_write);
+	MMIO_H(REG_50080(PIPE_B, PLANE_PRIMARY), D_ALL, NULL, reg50080_mmio_write=
);
+	MMIO_H(DSPSURF(PIPE_C), D_ALL, NULL, pri_surf_mmio_write);
+	MMIO_H(REG_50080(PIPE_C, PLANE_PRIMARY), D_ALL, NULL, reg50080_mmio_write=
);
+	MMIO_H(SPRSURF(PIPE_A), D_ALL, NULL, spr_surf_mmio_write);
+	MMIO_H(REG_50080(PIPE_A, PLANE_SPRITE0), D_ALL, NULL, reg50080_mmio_write=
);
+	MMIO_H(SPRSURF(PIPE_B), D_ALL, NULL, spr_surf_mmio_write);
+	MMIO_H(REG_50080(PIPE_B, PLANE_SPRITE0), D_ALL, NULL, reg50080_mmio_write=
);
+	MMIO_H(SPRSURF(PIPE_C), D_ALL, NULL, spr_surf_mmio_write);
+	MMIO_H(REG_50080(PIPE_C, PLANE_SPRITE0), D_ALL, NULL, reg50080_mmio_write=
);
+	MMIO_F(PCH_GMBUS0, 4 * 4, D_ALL, gmbus_mmio_read, gmbus_mmio_write);
+	MMIO_F(_MMIO(_PCH_DPB_AUX_CH_CTL), 6 * 4, D_PRE_SKL, NULL, dp_aux_ch_ctl_=
mmio_write);
+	MMIO_F(_MMIO(_PCH_DPC_AUX_CH_CTL), 6 * 4, D_PRE_SKL, NULL, dp_aux_ch_ctl_=
mmio_write);
+	MMIO_F(_MMIO(_PCH_DPD_AUX_CH_CTL), 6 * 4, D_PRE_SKL, NULL, dp_aux_ch_ctl_=
mmio_write);
+	MMIO_H(PCH_ADPA, D_PRE_SKL, NULL, pch_adpa_mmio_write);
+	MMIO_H(_MMIO(_PCH_TRANSACONF), D_ALL, NULL, transconf_mmio_write);
+	MMIO_H(_MMIO(_PCH_TRANSBCONF), D_ALL, NULL, transconf_mmio_write);
+	MMIO_H(FDI_RX_IIR(PIPE_A), D_ALL, NULL, fdi_rx_iir_mmio_write);
+	MMIO_H(FDI_RX_IIR(PIPE_B), D_ALL, NULL, fdi_rx_iir_mmio_write);
+	MMIO_H(FDI_RX_IIR(PIPE_C), D_ALL, NULL, fdi_rx_iir_mmio_write);
+	MMIO_H(FDI_RX_IMR(PIPE_A), D_ALL, NULL, update_fdi_rx_iir_status);
+	MMIO_H(FDI_RX_IMR(PIPE_B), D_ALL, NULL, update_fdi_rx_iir_status);
+	MMIO_H(FDI_RX_IMR(PIPE_C), D_ALL, NULL, update_fdi_rx_iir_status);
+	MMIO_H(FDI_RX_CTL(PIPE_A), D_ALL, NULL, update_fdi_rx_iir_status);
+	MMIO_H(FDI_RX_CTL(PIPE_B), D_ALL, NULL, update_fdi_rx_iir_status);
+	MMIO_H(FDI_RX_CTL(PIPE_C), D_ALL, NULL, update_fdi_rx_iir_status);
+	MMIO_H(PCH_PP_CONTROL, D_ALL, NULL, pch_pp_control_mmio_write);
+	MMIO_H(_MMIO(0xe651c), D_ALL, dpy_reg_mmio_read, NULL);
+	MMIO_H(_MMIO(0xe661c), D_ALL, dpy_reg_mmio_read, NULL);
+	MMIO_H(_MMIO(0xe671c), D_ALL, dpy_reg_mmio_read, NULL);
+	MMIO_H(_MMIO(0xe681c), D_ALL, dpy_reg_mmio_read, NULL);
+	MMIO_H(_MMIO(0xe6c04), D_ALL, dpy_reg_mmio_read, NULL);
+	MMIO_H(_MMIO(0xe6e1c), D_ALL, dpy_reg_mmio_read, NULL);
+	MMIO_H(LCPLL_CTL, D_ALL, NULL, lcpll_ctl_mmio_write);
+	MMIO_H(SOUTH_CHICKEN2, D_ALL, NULL, south_chicken2_mmio_write);
+	MMIO_H(SBI_DATA, D_ALL, sbi_data_mmio_read, NULL);
+	MMIO_H(SBI_CTL_STAT, D_ALL, NULL, sbi_ctl_mmio_write);
+	MMIO_F(_MMIO(_DPA_AUX_CH_CTL), 6 * 4, D_ALL, NULL, dp_aux_ch_ctl_mmio_wri=
te);
+	MMIO_H(DDI_BUF_CTL(PORT_A), D_ALL, NULL, ddi_buf_ctl_mmio_write);
+	MMIO_H(DDI_BUF_CTL(PORT_B), D_ALL, NULL, ddi_buf_ctl_mmio_write);
+	MMIO_H(DDI_BUF_CTL(PORT_C), D_ALL, NULL, ddi_buf_ctl_mmio_write);
+	MMIO_H(DDI_BUF_CTL(PORT_D), D_ALL, NULL, ddi_buf_ctl_mmio_write);
+	MMIO_H(DDI_BUF_CTL(PORT_E), D_ALL, NULL, ddi_buf_ctl_mmio_write);
+	MMIO_H(DP_TP_CTL(PORT_A), D_ALL, NULL, dp_tp_ctl_mmio_write);
+	MMIO_H(DP_TP_CTL(PORT_B), D_ALL, NULL, dp_tp_ctl_mmio_write);
+	MMIO_H(DP_TP_CTL(PORT_C), D_ALL, NULL, dp_tp_ctl_mmio_write);
+	MMIO_H(DP_TP_CTL(PORT_D), D_ALL, NULL, dp_tp_ctl_mmio_write);
+	MMIO_H(DP_TP_CTL(PORT_E), D_ALL, NULL, dp_tp_ctl_mmio_write);
+	MMIO_H(DP_TP_STATUS(PORT_A), D_ALL, NULL, dp_tp_status_mmio_write);
+	MMIO_H(DP_TP_STATUS(PORT_B), D_ALL, NULL, dp_tp_status_mmio_write);
+	MMIO_H(DP_TP_STATUS(PORT_C), D_ALL, NULL, dp_tp_status_mmio_write);
+	MMIO_H(DP_TP_STATUS(PORT_D), D_ALL, NULL, dp_tp_status_mmio_write);
+	MMIO_H(FORCEWAKE_MT, D_PRE_SKL, NULL, mul_force_wake_write);
+	MMIO_H(HSW_PWR_WELL_CTL1, D_BDW, NULL, power_well_ctl_mmio_write);
+	MMIO_H(HSW_PWR_WELL_CTL2, D_BDW, NULL, power_well_ctl_mmio_write);
+	MMIO_H(HSW_PWR_WELL_CTL3, D_BDW, NULL, power_well_ctl_mmio_write);
+	MMIO_H(HSW_PWR_WELL_CTL4, D_BDW, NULL, power_well_ctl_mmio_write);
+	MMIO_H(HSW_PWR_WELL_CTL5, D_BDW, NULL, power_well_ctl_mmio_write);
+	MMIO_H(HSW_PWR_WELL_CTL6, D_BDW, NULL, power_well_ctl_mmio_write);
+	MMIO_H(GEN6_GDRST, D_ALL, NULL, gdrst_mmio_write);
+	MMIO_F(FENCE_REG_GEN6_LO(0), 0x80, D_ALL, fence_mmio_read, fence_mmio_wri=
te);
+	MMIO_H(CPU_VGACNTRL, D_ALL, NULL, vga_control_mmio_write);
+	MMIO_H(GEN6_MBCTL, D_ALL, NULL, mbctl_write);
+	MMIO_H(FPGA_DBG, D_ALL, NULL, fpga_dbg_mmio_write);
+	MMIO_H(_MMIO(0x4260), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
+	MMIO_H(_MMIO(0x4264), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
+	MMIO_H(_MMIO(0x4268), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
+	MMIO_H(_MMIO(0x426c), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
+	MMIO_H(_MMIO(0x4270), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
+	MMIO_H(EDP_PSR_IMR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
+	MMIO_H(EDP_PSR_IIR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
+	MMIO_H(GUC_STATUS, D_ALL, guc_status_read, NULL);
=20
 	return 0;
 }
=20
-static int init_bdw_mmio_info(struct intel_gvt *gvt)
+static int init_bdw_mmio_handlers(struct intel_gvt *gvt)
 {
-	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
 	int ret;
=20
-	MMIO_DH(GEN8_GT_IMR(0), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
-	MMIO_DH(GEN8_GT_IER(0), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
-	MMIO_DH(GEN8_GT_IIR(0), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
-	MMIO_D(GEN8_GT_ISR(0), D_BDW_PLUS);
-
-	MMIO_DH(GEN8_GT_IMR(1), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
-	MMIO_DH(GEN8_GT_IER(1), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
-	MMIO_DH(GEN8_GT_IIR(1), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
-	MMIO_D(GEN8_GT_ISR(1), D_BDW_PLUS);
-
-	MMIO_DH(GEN8_GT_IMR(2), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
-	MMIO_DH(GEN8_GT_IER(2), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
-	MMIO_DH(GEN8_GT_IIR(2), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
-	MMIO_D(GEN8_GT_ISR(2), D_BDW_PLUS);
-
-	MMIO_DH(GEN8_GT_IMR(3), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
-	MMIO_DH(GEN8_GT_IER(3), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
-	MMIO_DH(GEN8_GT_IIR(3), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
-	MMIO_D(GEN8_GT_ISR(3), D_BDW_PLUS);
-
-	MMIO_DH(GEN8_DE_PIPE_IMR(PIPE_A), D_BDW_PLUS, NULL,
-		intel_vgpu_reg_imr_handler);
-	MMIO_DH(GEN8_DE_PIPE_IER(PIPE_A), D_BDW_PLUS, NULL,
-		intel_vgpu_reg_ier_handler);
-	MMIO_DH(GEN8_DE_PIPE_IIR(PIPE_A), D_BDW_PLUS, NULL,
-		intel_vgpu_reg_iir_handler);
-	MMIO_D(GEN8_DE_PIPE_ISR(PIPE_A), D_BDW_PLUS);
-
-	MMIO_DH(GEN8_DE_PIPE_IMR(PIPE_B), D_BDW_PLUS, NULL,
-		intel_vgpu_reg_imr_handler);
-	MMIO_DH(GEN8_DE_PIPE_IER(PIPE_B), D_BDW_PLUS, NULL,
-		intel_vgpu_reg_ier_handler);
-	MMIO_DH(GEN8_DE_PIPE_IIR(PIPE_B), D_BDW_PLUS, NULL,
-		intel_vgpu_reg_iir_handler);
-	MMIO_D(GEN8_DE_PIPE_ISR(PIPE_B), D_BDW_PLUS);
-
-	MMIO_DH(GEN8_DE_PIPE_IMR(PIPE_C), D_BDW_PLUS, NULL,
-		intel_vgpu_reg_imr_handler);
-	MMIO_DH(GEN8_DE_PIPE_IER(PIPE_C), D_BDW_PLUS, NULL,
-		intel_vgpu_reg_ier_handler);
-	MMIO_DH(GEN8_DE_PIPE_IIR(PIPE_C), D_BDW_PLUS, NULL,
-		intel_vgpu_reg_iir_handler);
-	MMIO_D(GEN8_DE_PIPE_ISR(PIPE_C), D_BDW_PLUS);
-
-	MMIO_DH(GEN8_DE_PORT_IMR, D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
-	MMIO_DH(GEN8_DE_PORT_IER, D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
-	MMIO_DH(GEN8_DE_PORT_IIR, D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
-	MMIO_D(GEN8_DE_PORT_ISR, D_BDW_PLUS);
-
-	MMIO_DH(GEN8_DE_MISC_IMR, D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
-	MMIO_DH(GEN8_DE_MISC_IER, D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
-	MMIO_DH(GEN8_DE_MISC_IIR, D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
-	MMIO_D(GEN8_DE_MISC_ISR, D_BDW_PLUS);
-
-	MMIO_DH(GEN8_PCU_IMR, D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
-	MMIO_DH(GEN8_PCU_IER, D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
-	MMIO_DH(GEN8_PCU_IIR, D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
-	MMIO_D(GEN8_PCU_ISR, D_BDW_PLUS);
-
-	MMIO_DH(GEN8_MASTER_IRQ, D_BDW_PLUS, NULL,
-		intel_vgpu_reg_master_irq_handler);
-
-	MMIO_RING_DFH(RING_ACTHD_UDW, D_BDW_PLUS, 0,
-		mmio_read_from_hw, NULL);
+	MMIO_H(GEN8_GT_IMR(0), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
+	MMIO_H(GEN8_GT_IER(0), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
+	MMIO_H(GEN8_GT_IIR(0), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
+	MMIO_H(GEN8_GT_IMR(1), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
+	MMIO_H(GEN8_GT_IER(1), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
+	MMIO_H(GEN8_GT_IIR(1), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
+	MMIO_H(GEN8_GT_IMR(2), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
+	MMIO_H(GEN8_GT_IER(2), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
+	MMIO_H(GEN8_GT_IIR(2), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
+	MMIO_H(GEN8_GT_IMR(3), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
+	MMIO_H(GEN8_GT_IER(3), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
+	MMIO_H(GEN8_GT_IIR(3), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
+	MMIO_H(GEN8_DE_PIPE_IMR(PIPE_A), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_han=
dler);
+	MMIO_H(GEN8_DE_PIPE_IER(PIPE_A), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_han=
dler);
+	MMIO_H(GEN8_DE_PIPE_IIR(PIPE_A), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_han=
dler);
+	MMIO_H(GEN8_DE_PIPE_IMR(PIPE_B), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_han=
dler);
+	MMIO_H(GEN8_DE_PIPE_IER(PIPE_B), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_han=
dler);
+	MMIO_H(GEN8_DE_PIPE_IIR(PIPE_B), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_han=
dler);
+	MMIO_H(GEN8_DE_PIPE_IMR(PIPE_C), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_han=
dler);
+	MMIO_H(GEN8_DE_PIPE_IER(PIPE_C), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_han=
dler);
+	MMIO_H(GEN8_DE_PIPE_IIR(PIPE_C), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_han=
dler);
+	MMIO_H(GEN8_DE_PORT_IMR, D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
+	MMIO_H(GEN8_DE_PORT_IER, D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
+	MMIO_H(GEN8_DE_PORT_IIR, D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
+	MMIO_H(GEN8_DE_MISC_IMR, D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
+	MMIO_H(GEN8_DE_MISC_IER, D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
+	MMIO_H(GEN8_DE_MISC_IIR, D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
+	MMIO_H(GEN8_PCU_IMR, D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
+	MMIO_H(GEN8_PCU_IER, D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
+	MMIO_H(GEN8_PCU_IIR, D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
+	MMIO_H(GEN8_MASTER_IRQ, D_BDW_PLUS, NULL, intel_vgpu_reg_master_irq_handl=
er);
+	MMIO_RING_H(RING_ACTHD_UDW, D_BDW_PLUS, mmio_read_from_hw, NULL);
=20
 #define RING_REG(base) _MMIO((base) + 0xd0)
-	MMIO_RING_F(RING_REG, 4, F_RO, 0,
-		~_MASKED_BIT_ENABLE(RESET_CTL_REQUEST_RESET), D_BDW_PLUS, NULL,
-		ring_reset_ctl_write);
+	MMIO_RING_F(RING_REG, 4, D_BDW_PLUS, NULL, ring_reset_ctl_write);
 #undef RING_REG
=20
 #define RING_REG(base) _MMIO((base) + 0x230)
-	MMIO_RING_DFH(RING_REG, D_BDW_PLUS, 0, NULL, elsp_mmio_write);
-#undef RING_REG
-
-#define RING_REG(base) _MMIO((base) + 0x234)
-	MMIO_RING_F(RING_REG, 8, F_RO, 0, ~0, D_BDW_PLUS,
-		NULL, NULL);
-#undef RING_REG
-
-#define RING_REG(base) _MMIO((base) + 0x244)
-	MMIO_RING_DFH(RING_REG, D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
+	MMIO_RING_H(RING_REG, D_BDW_PLUS, NULL, elsp_mmio_write);
 #undef RING_REG
=20
-#define RING_REG(base) _MMIO((base) + 0x370)
-	MMIO_RING_F(RING_REG, 48, F_RO, 0, ~0, D_BDW_PLUS, NULL, NULL);
-#undef RING_REG
-
-#define RING_REG(base) _MMIO((base) + 0x3a0)
-	MMIO_RING_DFH(RING_REG, D_BDW_PLUS, F_MODE_MASK, NULL, NULL);
-#undef RING_REG
-
-	MMIO_D(PIPEMISC(PIPE_A), D_BDW_PLUS);
-	MMIO_D(PIPEMISC(PIPE_B), D_BDW_PLUS);
-	MMIO_D(PIPEMISC(PIPE_C), D_BDW_PLUS);
-	MMIO_D(_MMIO(0x1c1d0), D_BDW_PLUS);
-	MMIO_D(GEN6_MBCUNIT_SNPCR, D_BDW_PLUS);
-	MMIO_D(GEN7_MISCCPCTL, D_BDW_PLUS);
-	MMIO_D(_MMIO(0x1c054), D_BDW_PLUS);
-
-	MMIO_DH(GEN6_PCODE_MAILBOX, D_BDW_PLUS, NULL, mailbox_write);
-
-	MMIO_D(GEN8_PRIVATE_PAT_LO, D_BDW_PLUS & ~D_BXT);
-	MMIO_D(GEN8_PRIVATE_PAT_HI, D_BDW_PLUS);
-
-	MMIO_D(GAMTARBMODE, D_BDW_PLUS);
-
-#define RING_REG(base) _MMIO((base) + 0x270)
-	MMIO_RING_F(RING_REG, 32, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL, NULL);
-#undef RING_REG
-
-	MMIO_RING_GM(RING_HWS_PGA, D_BDW_PLUS, NULL, hws_pga_write);
-
-	MMIO_DFH(HDC_CHICKEN0, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
-
-	MMIO_D(CHICKEN_PIPESL_1(PIPE_A), D_BDW_PLUS);
-	MMIO_D(CHICKEN_PIPESL_1(PIPE_B), D_BDW_PLUS);
-	MMIO_D(CHICKEN_PIPESL_1(PIPE_C), D_BDW_PLUS);
-
-	MMIO_D(WM_MISC, D_BDW);
-	MMIO_D(_MMIO(_SRD_CTL_EDP), D_BDW);
-
-	MMIO_D(_MMIO(0x6671c), D_BDW_PLUS);
-	MMIO_D(_MMIO(0x66c00), D_BDW_PLUS);
-	MMIO_D(_MMIO(0x66c04), D_BDW_PLUS);
-
-	MMIO_D(HSW_GTT_CACHE_EN, D_BDW_PLUS);
-
-	MMIO_D(GEN8_EU_DISABLE0, D_BDW_PLUS);
-	MMIO_D(GEN8_EU_DISABLE1, D_BDW_PLUS);
-	MMIO_D(GEN8_EU_DISABLE2, D_BDW_PLUS);
-
-	MMIO_D(_MMIO(0xfdc), D_BDW_PLUS);
-	MMIO_DFH(GEN8_ROW_CHICKEN, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS,
-		NULL, NULL);
-	MMIO_DFH(GEN7_ROW_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS,
-		NULL, NULL);
-	MMIO_DFH(GEN8_UCGCTL6, D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-
-	MMIO_DFH(_MMIO(0xb1f0), D_BDW, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0xb1c0), D_BDW, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(GEN8_L3SQCREG4, D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0xb100), D_BDW, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0xb10c), D_BDW, F_CMD_ACCESS, NULL, NULL);
-	MMIO_D(_MMIO(0xb110), D_BDW);
-	MMIO_D(GEN9_SCRATCH_LNCF1, D_BDW_PLUS);
-
-	MMIO_F(_MMIO(0x24d0), 48, F_CMD_ACCESS | F_CMD_WRITE_PATCH, 0, 0,
-		D_BDW_PLUS, NULL, force_nonpriv_write);
-
-	MMIO_D(_MMIO(0x44484), D_BDW_PLUS);
-	MMIO_D(_MMIO(0x4448c), D_BDW_PLUS);
-
-	MMIO_DFH(_MMIO(0x83a4), D_BDW, F_CMD_ACCESS, NULL, NULL);
-	MMIO_D(GEN8_L3_LRA_1_GPGPU, D_BDW_PLUS);
-
-	MMIO_DFH(_MMIO(0x8430), D_BDW, F_CMD_ACCESS, NULL, NULL);
+	MMIO_H(GEN6_PCODE_MAILBOX, D_BDW_PLUS, NULL, mailbox_write);
+	MMIO_RING_H(RING_HWS_PGA, D_BDW_PLUS, NULL, hws_pga_write);
+	MMIO_F(_MMIO(0x24d0), 48, D_BDW_PLUS, NULL, force_nonpriv_write);
=20
-	MMIO_D(_MMIO(0x110000), D_BDW_PLUS);
-
-	MMIO_D(_MMIO(0x48400), D_BDW_PLUS);
-
-	MMIO_D(_MMIO(0x6e570), D_BDW_PLUS);
-	MMIO_D(_MMIO(0x65f10), D_BDW_PLUS);
-
-	MMIO_DFH(_MMIO(0xe194), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NUL=
L);
-	MMIO_DFH(_MMIO(0xe188), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NUL=
L);
-	MMIO_DFH(HALF_SLICE_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NUL=
L, NULL);
-	MMIO_DFH(_MMIO(0x2580), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NUL=
L);
-
-	MMIO_DFH(_MMIO(0x2248), D_BDW, F_CMD_ACCESS, NULL, NULL);
-
-	MMIO_DFH(_MMIO(0xe220), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0xe230), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0xe240), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0xe260), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0xe270), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0xe280), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0xe2a0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0xe2b0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0xe2c0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x21f0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
 	return 0;
 }
=20
-static int init_skl_mmio_info(struct intel_gvt *gvt)
+static int init_skl_mmio_handlers(struct intel_gvt *gvt)
 {
 	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
 	int ret;
=20
-	MMIO_DH(FORCEWAKE_RENDER_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write);
-	MMIO_DH(FORCEWAKE_ACK_RENDER_GEN9, D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(FORCEWAKE_GT_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write);
-	MMIO_DH(FORCEWAKE_ACK_GT_GEN9, D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(FORCEWAKE_MEDIA_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write);
-	MMIO_DH(FORCEWAKE_ACK_MEDIA_GEN9, D_SKL_PLUS, NULL, NULL);
-
-	MMIO_F(DP_AUX_CH_CTL(AUX_CH_B), 6 * 4, 0, 0, 0, D_SKL_PLUS, NULL,
-						dp_aux_ch_ctl_mmio_write);
-	MMIO_F(DP_AUX_CH_CTL(AUX_CH_C), 6 * 4, 0, 0, 0, D_SKL_PLUS, NULL,
-						dp_aux_ch_ctl_mmio_write);
-	MMIO_F(DP_AUX_CH_CTL(AUX_CH_D), 6 * 4, 0, 0, 0, D_SKL_PLUS, NULL,
-						dp_aux_ch_ctl_mmio_write);
-
-	MMIO_D(HSW_PWR_WELL_CTL1, D_SKL_PLUS);
-	MMIO_DH(HSW_PWR_WELL_CTL2, D_SKL_PLUS, NULL, skl_power_well_ctl_write);
-
-	MMIO_DH(DBUF_CTL_S(0), D_SKL_PLUS, NULL, gen9_dbuf_ctl_mmio_write);
-
-	MMIO_D(GEN9_PG_ENABLE, D_SKL_PLUS);
-	MMIO_D(GEN9_MEDIA_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
-	MMIO_D(GEN9_RENDER_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
-	MMIO_DFH(GEN9_GAMT_ECO_REG_RW_IA, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(MMCD_MISC_CTRL, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DH(CHICKEN_PAR1_1, D_SKL_PLUS, NULL, NULL);
-	MMIO_D(DC_STATE_EN, D_SKL_PLUS);
-	MMIO_D(DC_STATE_DEBUG, D_SKL_PLUS);
-	MMIO_D(CDCLK_CTL, D_SKL_PLUS);
-	MMIO_DH(LCPLL1_CTL, D_SKL_PLUS, NULL, skl_lcpll_write);
-	MMIO_DH(LCPLL2_CTL, D_SKL_PLUS, NULL, skl_lcpll_write);
-	MMIO_D(_MMIO(_DPLL1_CFGCR1), D_SKL_PLUS);
-	MMIO_D(_MMIO(_DPLL2_CFGCR1), D_SKL_PLUS);
-	MMIO_D(_MMIO(_DPLL3_CFGCR1), D_SKL_PLUS);
-	MMIO_D(_MMIO(_DPLL1_CFGCR2), D_SKL_PLUS);
-	MMIO_D(_MMIO(_DPLL2_CFGCR2), D_SKL_PLUS);
-	MMIO_D(_MMIO(_DPLL3_CFGCR2), D_SKL_PLUS);
-	MMIO_D(DPLL_CTRL1, D_SKL_PLUS);
-	MMIO_D(DPLL_CTRL2, D_SKL_PLUS);
-	MMIO_DH(DPLL_STATUS, D_SKL_PLUS, dpll_status_read, NULL);
-
-	MMIO_DH(SKL_PS_WIN_POS(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_WIN_POS(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_WIN_POS(PIPE_B, 0), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_WIN_POS(PIPE_B, 1), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_WIN_POS(PIPE_C, 0), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_WIN_POS(PIPE_C, 1), D_SKL_PLUS, NULL, pf_write);
-
-	MMIO_DH(SKL_PS_WIN_SZ(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_WIN_SZ(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_WIN_SZ(PIPE_B, 0), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_WIN_SZ(PIPE_B, 1), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_WIN_SZ(PIPE_C, 0), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_WIN_SZ(PIPE_C, 1), D_SKL_PLUS, NULL, pf_write);
-
-	MMIO_DH(SKL_PS_CTRL(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_CTRL(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_CTRL(PIPE_B, 0), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_CTRL(PIPE_B, 1), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_CTRL(PIPE_C, 0), D_SKL_PLUS, NULL, pf_write);
-	MMIO_DH(SKL_PS_CTRL(PIPE_C, 1), D_SKL_PLUS, NULL, pf_write);
-
-	MMIO_DH(PLANE_BUF_CFG(PIPE_A, 0), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_BUF_CFG(PIPE_A, 1), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_BUF_CFG(PIPE_A, 2), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_BUF_CFG(PIPE_A, 3), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(PLANE_BUF_CFG(PIPE_B, 0), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_BUF_CFG(PIPE_B, 1), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_BUF_CFG(PIPE_B, 2), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_BUF_CFG(PIPE_B, 3), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(PLANE_BUF_CFG(PIPE_C, 0), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_BUF_CFG(PIPE_C, 1), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_BUF_CFG(PIPE_C, 2), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_BUF_CFG(PIPE_C, 3), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(CUR_BUF_CFG(PIPE_A), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(CUR_BUF_CFG(PIPE_B), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(CUR_BUF_CFG(PIPE_C), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_F(PLANE_WM(PIPE_A, 0, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
-	MMIO_F(PLANE_WM(PIPE_A, 1, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
-	MMIO_F(PLANE_WM(PIPE_A, 2, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
-
-	MMIO_F(PLANE_WM(PIPE_B, 0, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
-	MMIO_F(PLANE_WM(PIPE_B, 1, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
-	MMIO_F(PLANE_WM(PIPE_B, 2, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
-
-	MMIO_F(PLANE_WM(PIPE_C, 0, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
-	MMIO_F(PLANE_WM(PIPE_C, 1, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
-	MMIO_F(PLANE_WM(PIPE_C, 2, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
-
-	MMIO_F(CUR_WM(PIPE_A, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
-	MMIO_F(CUR_WM(PIPE_B, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
-	MMIO_F(CUR_WM(PIPE_C, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(PLANE_WM_TRANS(PIPE_A, 0), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_WM_TRANS(PIPE_A, 1), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_WM_TRANS(PIPE_A, 2), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(PLANE_WM_TRANS(PIPE_B, 0), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_WM_TRANS(PIPE_B, 1), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_WM_TRANS(PIPE_B, 2), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(PLANE_WM_TRANS(PIPE_C, 0), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_WM_TRANS(PIPE_C, 1), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_WM_TRANS(PIPE_C, 2), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(CUR_WM_TRANS(PIPE_A), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(CUR_WM_TRANS(PIPE_B), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(CUR_WM_TRANS(PIPE_C), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_A, 0), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_A, 1), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_A, 2), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_A, 3), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_B, 0), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_B, 1), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_B, 2), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_B, 3), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_C, 0), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_C, 1), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_C, 2), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_C, 3), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(_MMIO(_REG_701C0(PIPE_A, 1)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C0(PIPE_A, 2)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C0(PIPE_A, 3)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C0(PIPE_A, 4)), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(_MMIO(_REG_701C0(PIPE_B, 1)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C0(PIPE_B, 2)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C0(PIPE_B, 3)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C0(PIPE_B, 4)), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(_MMIO(_REG_701C0(PIPE_C, 1)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C0(PIPE_C, 2)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C0(PIPE_C, 3)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C0(PIPE_C, 4)), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(_MMIO(_REG_701C4(PIPE_A, 1)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C4(PIPE_A, 2)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C4(PIPE_A, 3)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C4(PIPE_A, 4)), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(_MMIO(_REG_701C4(PIPE_B, 1)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C4(PIPE_B, 2)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C4(PIPE_B, 3)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C4(PIPE_B, 4)), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 1)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 2)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 3)), D_SKL_PLUS, NULL, NULL);
-	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 4)), D_SKL_PLUS, NULL, NULL);
-
-	MMIO_D(_MMIO(_PLANE_CTL_3_A), D_SKL_PLUS);
-	MMIO_D(_MMIO(_PLANE_CTL_3_B), D_SKL_PLUS);
-	MMIO_D(_MMIO(0x72380), D_SKL_PLUS);
-	MMIO_D(_MMIO(0x7239c), D_SKL_PLUS);
-	MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
-	MMIO_D(_MMIO(_PLANE_SURF_3_B), D_SKL_PLUS);
-
-	MMIO_D(DMC_SSP_BASE, D_SKL_PLUS);
-	MMIO_D(DMC_HTP_SKL, D_SKL_PLUS);
-	MMIO_D(DMC_LAST_WRITE, D_SKL_PLUS);
-
-	MMIO_DFH(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
-
-	MMIO_D(SKL_DFSM, D_SKL_PLUS);
-	MMIO_D(DISPIO_CR_TX_BMU_CR0, D_SKL_PLUS);
-
-	MMIO_F(GEN9_GFX_MOCS(0), 0x7f8, F_CMD_ACCESS, 0, 0, D_SKL_PLUS,
-		NULL, NULL);
-	MMIO_F(GEN7_L3CNTLREG2, 0x80, F_CMD_ACCESS, 0, 0, D_SKL_PLUS,
-		NULL, NULL);
-
-	MMIO_D(RPM_CONFIG0, D_SKL_PLUS);
-	MMIO_D(_MMIO(0xd08), D_SKL_PLUS);
-	MMIO_D(RC6_LOCATION, D_SKL_PLUS);
-	MMIO_DFH(GEN7_FF_SLICE_CS_CHICKEN1, D_SKL_PLUS,
-		 F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(GEN9_CS_DEBUG_MODE1, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
-		NULL, NULL);
-
-	/* TRTT */
-	MMIO_DFH(TRVATTL3PTRDW(0), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(TRVATTL3PTRDW(1), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(TRVATTL3PTRDW(2), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(TRVATTL3PTRDW(3), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(TRVADR, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(TRTTE, D_SKL_PLUS, F_CMD_ACCESS | F_PM_SAVE,
-		 NULL, gen9_trtte_write);
-	MMIO_DFH(_MMIO(0x4dfc), D_SKL_PLUS, F_PM_SAVE,
-		 NULL, gen9_trtt_chicken_write);
-
-	MMIO_D(_MMIO(0x46430), D_SKL_PLUS);
-
-	MMIO_D(_MMIO(0x46520), D_SKL_PLUS);
-
-	MMIO_D(_MMIO(0xc403c), D_SKL_PLUS);
-	MMIO_DFH(GEN8_GARBCNTL, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DH(DMA_CTRL, D_SKL_PLUS, NULL, dma_ctrl_write);
-
-	MMIO_D(_MMIO(0x65900), D_SKL_PLUS);
-	MMIO_D(GEN6_STOLEN_RESERVED, D_SKL_PLUS);
-	MMIO_D(_MMIO(0x4068), D_SKL_PLUS);
-	MMIO_D(_MMIO(0x67054), D_SKL_PLUS);
-	MMIO_D(_MMIO(0x6e560), D_SKL_PLUS);
-	MMIO_D(_MMIO(0x6e554), D_SKL_PLUS);
-	MMIO_D(_MMIO(0x2b20), D_SKL_PLUS);
-	MMIO_D(_MMIO(0x65f00), D_SKL_PLUS);
-	MMIO_D(_MMIO(0x65f08), D_SKL_PLUS);
-	MMIO_D(_MMIO(0x320f0), D_SKL_PLUS);
-
-	MMIO_D(_MMIO(0x70034), D_SKL_PLUS);
-	MMIO_D(_MMIO(0x71034), D_SKL_PLUS);
-	MMIO_D(_MMIO(0x72034), D_SKL_PLUS);
-
-	MMIO_D(_MMIO(_PLANE_KEYVAL_1(PIPE_A)), D_SKL_PLUS);
-	MMIO_D(_MMIO(_PLANE_KEYVAL_1(PIPE_B)), D_SKL_PLUS);
-	MMIO_D(_MMIO(_PLANE_KEYVAL_1(PIPE_C)), D_SKL_PLUS);
-	MMIO_D(_MMIO(_PLANE_KEYMAX_1(PIPE_A)), D_SKL_PLUS);
-	MMIO_D(_MMIO(_PLANE_KEYMAX_1(PIPE_B)), D_SKL_PLUS);
-	MMIO_D(_MMIO(_PLANE_KEYMAX_1(PIPE_C)), D_SKL_PLUS);
-	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_A)), D_SKL_PLUS);
-	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_B)), D_SKL_PLUS);
-	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_C)), D_SKL_PLUS);
-
-	MMIO_D(_MMIO(0x44500), D_SKL_PLUS);
+	MMIO_H(FORCEWAKE_RENDER_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write);
+	MMIO_H(FORCEWAKE_GT_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write);
+	MMIO_H(FORCEWAKE_MEDIA_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write);
+	MMIO_F(DP_AUX_CH_CTL(AUX_CH_B), 6 * 4, D_SKL_PLUS, NULL, dp_aux_ch_ctl_mm=
io_write);
+	MMIO_F(DP_AUX_CH_CTL(AUX_CH_C), 6 * 4, D_SKL_PLUS, NULL, dp_aux_ch_ctl_mm=
io_write);
+	MMIO_F(DP_AUX_CH_CTL(AUX_CH_D), 6 * 4, D_SKL_PLUS, NULL, dp_aux_ch_ctl_mm=
io_write);
+	MMIO_H(HSW_PWR_WELL_CTL2, D_SKL_PLUS, NULL, skl_power_well_ctl_write);
+	MMIO_H(DBUF_CTL_S(0), D_SKL_PLUS, NULL, gen9_dbuf_ctl_mmio_write);
+	MMIO_H(LCPLL1_CTL, D_SKL_PLUS, NULL, skl_lcpll_write);
+	MMIO_H(LCPLL2_CTL, D_SKL_PLUS, NULL, skl_lcpll_write);
+	MMIO_H(DPLL_STATUS, D_SKL_PLUS, dpll_status_read, NULL);
+	MMIO_H(SKL_PS_WIN_POS(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_WIN_POS(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_WIN_POS(PIPE_B, 0), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_WIN_POS(PIPE_B, 1), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_WIN_POS(PIPE_C, 0), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_WIN_POS(PIPE_C, 1), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_WIN_SZ(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_WIN_SZ(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_WIN_SZ(PIPE_B, 0), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_WIN_SZ(PIPE_B, 1), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_WIN_SZ(PIPE_C, 0), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_WIN_SZ(PIPE_C, 1), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_CTRL(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_CTRL(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_CTRL(PIPE_B, 0), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_CTRL(PIPE_B, 1), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_CTRL(PIPE_C, 0), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(SKL_PS_CTRL(PIPE_C, 1), D_SKL_PLUS, NULL, pf_write);
+	MMIO_H(TRTTE, D_SKL_PLUS, NULL, gen9_trtte_write);
+	MMIO_H(_MMIO(0x4dfc), D_SKL_PLUS, NULL, gen9_trtt_chicken_write);
+	MMIO_H(DMA_CTRL, D_SKL_PLUS, NULL, dma_ctrl_write);
 #define CSFE_CHICKEN1_REG(base) _MMIO((base) + 0xD4)
-	MMIO_RING_DFH(CSFE_CHICKEN1_REG, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
-		      NULL, csfe_chicken1_mmio_write);
+	MMIO_RING_H(CSFE_CHICKEN1_REG, D_SKL_PLUS, NULL, csfe_chicken1_mmio_write=
);
 #undef CSFE_CHICKEN1_REG
-	MMIO_DFH(GEN8_HDC_CHICKEN1, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
-		 NULL, NULL);
-	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
-		 NULL, NULL);
-
-	MMIO_DFH(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS, NULL, NULL);
-	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS & ~D_BXT);
=20
 	return 0;
 }
=20
-static int init_bxt_mmio_info(struct intel_gvt *gvt)
+static int init_bxt_mmio_handlers(struct intel_gvt *gvt)
 {
-	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
 	int ret;
=20
-	MMIO_F(_MMIO(0x80000), 0x3000, 0, 0, 0, D_BXT, NULL, NULL);
-
-	MMIO_D(GEN7_SAMPLER_INSTDONE, D_BXT);
-	MMIO_D(GEN7_ROW_INSTDONE, D_BXT);
-	MMIO_D(GEN8_FAULT_TLB_DATA0, D_BXT);
-	MMIO_D(GEN8_FAULT_TLB_DATA1, D_BXT);
-	MMIO_D(ERROR_GEN6, D_BXT);
-	MMIO_D(DONE_REG, D_BXT);
-	MMIO_D(EIR, D_BXT);
-	MMIO_D(PGTBL_ER, D_BXT);
-	MMIO_D(_MMIO(0x4194), D_BXT);
-	MMIO_D(_MMIO(0x4294), D_BXT);
-	MMIO_D(_MMIO(0x4494), D_BXT);
-
-	MMIO_RING_D(RING_PSMI_CTL, D_BXT);
-	MMIO_RING_D(RING_DMA_FADD, D_BXT);
-	MMIO_RING_D(RING_DMA_FADD_UDW, D_BXT);
-	MMIO_RING_D(RING_IPEHR, D_BXT);
-	MMIO_RING_D(RING_INSTPS, D_BXT);
-	MMIO_RING_D(RING_BBADDR_UDW, D_BXT);
-	MMIO_RING_D(RING_BBSTATE, D_BXT);
-	MMIO_RING_D(RING_IPEIR, D_BXT);
-
-	MMIO_F(SOFT_SCRATCH(0), 16 * 4, 0, 0, 0, D_BXT, NULL, NULL);
-
-	MMIO_DH(BXT_P_CR_GT_DISP_PWRON, D_BXT, NULL, bxt_gt_disp_pwron_write);
-	MMIO_D(BXT_RP_STATE_CAP, D_BXT);
-	MMIO_DH(BXT_PHY_CTL_FAMILY(DPIO_PHY0), D_BXT,
-		NULL, bxt_phy_ctl_family_write);
-	MMIO_DH(BXT_PHY_CTL_FAMILY(DPIO_PHY1), D_BXT,
-		NULL, bxt_phy_ctl_family_write);
-	MMIO_D(BXT_PHY_CTL(PORT_A), D_BXT);
-	MMIO_D(BXT_PHY_CTL(PORT_B), D_BXT);
-	MMIO_D(BXT_PHY_CTL(PORT_C), D_BXT);
-	MMIO_DH(BXT_PORT_PLL_ENABLE(PORT_A), D_BXT,
-		NULL, bxt_port_pll_enable_write);
-	MMIO_DH(BXT_PORT_PLL_ENABLE(PORT_B), D_BXT,
-		NULL, bxt_port_pll_enable_write);
-	MMIO_DH(BXT_PORT_PLL_ENABLE(PORT_C), D_BXT, NULL,
-		bxt_port_pll_enable_write);
-
-	MMIO_D(BXT_PORT_CL1CM_DW0(DPIO_PHY0), D_BXT);
-	MMIO_D(BXT_PORT_CL1CM_DW9(DPIO_PHY0), D_BXT);
-	MMIO_D(BXT_PORT_CL1CM_DW10(DPIO_PHY0), D_BXT);
-	MMIO_D(BXT_PORT_CL1CM_DW28(DPIO_PHY0), D_BXT);
-	MMIO_D(BXT_PORT_CL1CM_DW30(DPIO_PHY0), D_BXT);
-	MMIO_D(BXT_PORT_CL2CM_DW6(DPIO_PHY0), D_BXT);
-	MMIO_D(BXT_PORT_REF_DW3(DPIO_PHY0), D_BXT);
-	MMIO_D(BXT_PORT_REF_DW6(DPIO_PHY0), D_BXT);
-	MMIO_D(BXT_PORT_REF_DW8(DPIO_PHY0), D_BXT);
-
-	MMIO_D(BXT_PORT_CL1CM_DW0(DPIO_PHY1), D_BXT);
-	MMIO_D(BXT_PORT_CL1CM_DW9(DPIO_PHY1), D_BXT);
-	MMIO_D(BXT_PORT_CL1CM_DW10(DPIO_PHY1), D_BXT);
-	MMIO_D(BXT_PORT_CL1CM_DW28(DPIO_PHY1), D_BXT);
-	MMIO_D(BXT_PORT_CL1CM_DW30(DPIO_PHY1), D_BXT);
-	MMIO_D(BXT_PORT_CL2CM_DW6(DPIO_PHY1), D_BXT);
-	MMIO_D(BXT_PORT_REF_DW3(DPIO_PHY1), D_BXT);
-	MMIO_D(BXT_PORT_REF_DW6(DPIO_PHY1), D_BXT);
-	MMIO_D(BXT_PORT_REF_DW8(DPIO_PHY1), D_BXT);
-
-	MMIO_D(BXT_PORT_PLL_EBB_0(DPIO_PHY0, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_PLL_EBB_4(DPIO_PHY0, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_PCS_DW10_LN01(DPIO_PHY0, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_PCS_DW10_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_PCS_DW12_LN01(DPIO_PHY0, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_PCS_DW12_LN23(DPIO_PHY0, DPIO_CH0), D_BXT);
-	MMIO_DH(BXT_PORT_PCS_DW12_GRP(DPIO_PHY0, DPIO_CH0), D_BXT,
-		NULL, bxt_pcs_dw12_grp_write);
-	MMIO_D(BXT_PORT_TX_DW2_LN0(DPIO_PHY0, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW2_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
-	MMIO_DH(BXT_PORT_TX_DW3_LN0(DPIO_PHY0, DPIO_CH0), D_BXT,
-		bxt_port_tx_dw3_read, NULL);
-	MMIO_D(BXT_PORT_TX_DW3_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW4_LN0(DPIO_PHY0, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW4_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 0), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 1), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 2), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 3), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 0), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 1), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 2), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 3), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 6), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 8), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 9), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 10), D_BXT);
-
-	MMIO_D(BXT_PORT_PLL_EBB_0(DPIO_PHY0, DPIO_CH1), D_BXT);
-	MMIO_D(BXT_PORT_PLL_EBB_4(DPIO_PHY0, DPIO_CH1), D_BXT);
-	MMIO_D(BXT_PORT_PCS_DW10_LN01(DPIO_PHY0, DPIO_CH1), D_BXT);
-	MMIO_D(BXT_PORT_PCS_DW10_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
-	MMIO_D(BXT_PORT_PCS_DW12_LN01(DPIO_PHY0, DPIO_CH1), D_BXT);
-	MMIO_D(BXT_PORT_PCS_DW12_LN23(DPIO_PHY0, DPIO_CH1), D_BXT);
-	MMIO_DH(BXT_PORT_PCS_DW12_GRP(DPIO_PHY0, DPIO_CH1), D_BXT,
-		NULL, bxt_pcs_dw12_grp_write);
-	MMIO_D(BXT_PORT_TX_DW2_LN0(DPIO_PHY0, DPIO_CH1), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW2_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
-	MMIO_DH(BXT_PORT_TX_DW3_LN0(DPIO_PHY0, DPIO_CH1), D_BXT,
-		bxt_port_tx_dw3_read, NULL);
-	MMIO_D(BXT_PORT_TX_DW3_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW4_LN0(DPIO_PHY0, DPIO_CH1), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW4_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 0), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 1), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 2), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 3), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 0), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 1), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 2), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 3), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 6), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 8), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 9), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 10), D_BXT);
-
-	MMIO_D(BXT_PORT_PLL_EBB_0(DPIO_PHY1, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_PLL_EBB_4(DPIO_PHY1, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_PCS_DW10_LN01(DPIO_PHY1, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_PCS_DW10_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_PCS_DW12_LN01(DPIO_PHY1, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_PCS_DW12_LN23(DPIO_PHY1, DPIO_CH0), D_BXT);
-	MMIO_DH(BXT_PORT_PCS_DW12_GRP(DPIO_PHY1, DPIO_CH0), D_BXT,
-		NULL, bxt_pcs_dw12_grp_write);
-	MMIO_D(BXT_PORT_TX_DW2_LN0(DPIO_PHY1, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW2_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
-	MMIO_DH(BXT_PORT_TX_DW3_LN0(DPIO_PHY1, DPIO_CH0), D_BXT,
-		bxt_port_tx_dw3_read, NULL);
-	MMIO_D(BXT_PORT_TX_DW3_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW4_LN0(DPIO_PHY1, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW4_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 0), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 1), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 2), D_BXT);
-	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 3), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 0), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 1), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 2), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 3), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 6), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 8), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 9), D_BXT);
-	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 10), D_BXT);
-
-	MMIO_D(BXT_DE_PLL_CTL, D_BXT);
-	MMIO_DH(BXT_DE_PLL_ENABLE, D_BXT, NULL, bxt_de_pll_enable_write);
-	MMIO_D(BXT_DSI_PLL_CTL, D_BXT);
-	MMIO_D(BXT_DSI_PLL_ENABLE, D_BXT);
-
-	MMIO_D(GEN9_CLKGATE_DIS_0, D_BXT);
-	MMIO_D(GEN9_CLKGATE_DIS_4, D_BXT);
-
-	MMIO_D(HSW_TVIDEO_DIP_GCP(TRANSCODER_A), D_BXT);
-	MMIO_D(HSW_TVIDEO_DIP_GCP(TRANSCODER_B), D_BXT);
-	MMIO_D(HSW_TVIDEO_DIP_GCP(TRANSCODER_C), D_BXT);
-
-	MMIO_D(RC6_CTX_BASE, D_BXT);
-
-	MMIO_D(GEN8_PUSHBUS_CONTROL, D_BXT);
-	MMIO_D(GEN8_PUSHBUS_ENABLE, D_BXT);
-	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
-	MMIO_D(GEN6_GFXPAUSE, D_BXT);
-	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
-	MMIO_F(GEN8_RING_CS_GPR(RENDER_RING_BASE, 0), 0x40, F_CMD_ACCESS,
-	       0, 0, D_BXT, NULL, NULL);
-	MMIO_F(GEN8_RING_CS_GPR(GEN6_BSD_RING_BASE, 0), 0x40, F_CMD_ACCESS,
-	       0, 0, D_BXT, NULL, NULL);
-	MMIO_F(GEN8_RING_CS_GPR(BLT_RING_BASE, 0), 0x40, F_CMD_ACCESS,
-	       0, 0, D_BXT, NULL, NULL);
-	MMIO_F(GEN8_RING_CS_GPR(VEBOX_RING_BASE, 0), 0x40, F_CMD_ACCESS,
-	       0, 0, D_BXT, NULL, NULL);
-
-	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
-
-	MMIO_DH(GEN8_PRIVATE_PAT_LO, D_BXT, NULL, bxt_ppat_low_write);
+	MMIO_H(BXT_P_CR_GT_DISP_PWRON, D_BXT, NULL, bxt_gt_disp_pwron_write);
+	MMIO_H(BXT_PHY_CTL_FAMILY(DPIO_PHY0), D_BXT, NULL, bxt_phy_ctl_family_wri=
te);
+	MMIO_H(BXT_PHY_CTL_FAMILY(DPIO_PHY1), D_BXT, NULL, bxt_phy_ctl_family_wri=
te);
+	MMIO_H(BXT_PORT_PLL_ENABLE(PORT_A), D_BXT, NULL, bxt_port_pll_enable_writ=
e);
+	MMIO_H(BXT_PORT_PLL_ENABLE(PORT_B), D_BXT, NULL, bxt_port_pll_enable_writ=
e);
+	MMIO_H(BXT_PORT_PLL_ENABLE(PORT_C), D_BXT, NULL, bxt_port_pll_enable_writ=
e);
+	MMIO_H(BXT_PORT_PCS_DW12_GRP(DPIO_PHY0, DPIO_CH0), D_BXT, NULL, bxt_pcs_d=
w12_grp_write);
+	MMIO_H(BXT_PORT_TX_DW3_LN0(DPIO_PHY0, DPIO_CH0), D_BXT, bxt_port_tx_dw3_r=
ead, NULL);
+	MMIO_H(BXT_PORT_PCS_DW12_GRP(DPIO_PHY0, DPIO_CH1), D_BXT, NULL, bxt_pcs_d=
w12_grp_write);
+	MMIO_H(BXT_PORT_TX_DW3_LN0(DPIO_PHY0, DPIO_CH1), D_BXT, bxt_port_tx_dw3_r=
ead, NULL);
+	MMIO_H(BXT_PORT_PCS_DW12_GRP(DPIO_PHY1, DPIO_CH0), D_BXT, NULL, bxt_pcs_d=
w12_grp_write);
+	MMIO_H(BXT_PORT_TX_DW3_LN0(DPIO_PHY1, DPIO_CH0), D_BXT, bxt_port_tx_dw3_r=
ead, NULL);
+	MMIO_H(BXT_DE_PLL_ENABLE, D_BXT, NULL, bxt_de_pll_enable_write);
+	MMIO_H(GEN8_PRIVATE_PAT_LO, D_BXT, NULL, bxt_ppat_low_write);
=20
 	return 0;
 }
@@ -3645,43 +2334,26 @@ static struct gvt_mmio_block *find_mmio_block(struc=
t intel_gvt *gvt,
 	return NULL;
 }
=20
-/**
- * intel_gvt_clean_mmio_info - clean up MMIO information table for GVT dev=
ice
- * @gvt: GVT device
- *
- * This function is called at the driver unloading stage, to clean up the =
MMIO
- * information table of GVT device
- *
- */
-void intel_gvt_clean_mmio_info(struct intel_gvt *gvt)
+static int init_default_handlers(struct intel_gvt *gvt)
 {
-	struct hlist_node *tmp;
 	struct intel_gvt_mmio_info *e;
+	struct gvt_mmio_block *block;
 	int i;
=20
-	hash_for_each_safe(gvt->mmio.mmio_info_table, i, tmp, e, node)
-		kfree(e);
+	hash_for_each(gvt->mmio.mmio_info_table, i, e, node) {
+		e->read =3D intel_vgpu_default_mmio_read;
+		e->write =3D intel_vgpu_default_mmio_write;
+	}
=20
-	vfree(gvt->mmio.mmio_attribute);
-	gvt->mmio.mmio_attribute =3D NULL;
-}
+	block =3D find_mmio_block(gvt, VGT_PVINFO_PAGE);
+	block->read =3D pvinfo_mmio_read;
+	block->write =3D pvinfo_mmio_write;
=20
-/* Special MMIO blocks. registers in MMIO block ranges should not be comma=
nd
- * accessible (should have no F_CMD_ACCESS flag).
- * otherwise, need to update cmd_reg_handler in cmd_parser.c
- */
-static struct gvt_mmio_block mmio_blocks[] =3D {
-	{D_SKL_PLUS, _MMIO(DMC_MMIO_START_RANGE), 0x3000, NULL, NULL},
-	{D_ALL, _MMIO(MCHBAR_MIRROR_BASE_SNB), 0x40000, NULL, NULL},
-	{D_ALL, _MMIO(VGT_PVINFO_PAGE), VGT_PVINFO_SIZE,
-		pvinfo_mmio_read, pvinfo_mmio_write},
-	{D_ALL, LGC_PALETTE(PIPE_A, 0), 1024, NULL, NULL},
-	{D_ALL, LGC_PALETTE(PIPE_B, 0), 1024, NULL, NULL},
-	{D_ALL, LGC_PALETTE(PIPE_C, 0), 1024, NULL, NULL},
-};
+	return 0;
+}
=20
 /**
- * intel_gvt_setup_mmio_info - setup MMIO information table for GVT device
+ * intel_gvt_setup_mmio_handlers - setup MMIO handlers for GVT device
  * @gvt: GVT device
  *
  * This function is called at the initialization stage, to setup the MMIO
@@ -3690,53 +2362,47 @@ static struct gvt_mmio_block mmio_blocks[] =3D {
  * Returns:
  * zero on success, negative if failed.
  */
-int intel_gvt_setup_mmio_info(struct intel_gvt *gvt)
+int intel_gvt_setup_mmio_handlers(struct intel_gvt *gvt)
 {
-	struct intel_gvt_device_info *info =3D &gvt->device_info;
 	struct drm_i915_private *i915 =3D gvt->gt->i915;
-	int size =3D info->mmio_size / 4 * sizeof(*gvt->mmio.mmio_attribute);
 	int ret;
=20
-	gvt->mmio.mmio_attribute =3D vzalloc(size);
-	if (!gvt->mmio.mmio_attribute)
-		return -ENOMEM;
+	ret =3D init_default_handlers(gvt);
+	if (ret)
+		goto err;
=20
-	ret =3D init_generic_mmio_info(gvt);
+	ret =3D init_generic_mmio_handlers(gvt);
 	if (ret)
 		goto err;
=20
 	if (IS_BROADWELL(i915)) {
-		ret =3D init_bdw_mmio_info(gvt);
+		ret =3D init_bdw_mmio_handlers(gvt);
 		if (ret)
 			goto err;
 	} else if (IS_SKYLAKE(i915) ||
 		   IS_KABYLAKE(i915) ||
 		   IS_COFFEELAKE(i915) ||
 		   IS_COMETLAKE(i915)) {
-		ret =3D init_bdw_mmio_info(gvt);
+		ret =3D init_bdw_mmio_handlers(gvt);
 		if (ret)
 			goto err;
-		ret =3D init_skl_mmio_info(gvt);
+		ret =3D init_skl_mmio_handlers(gvt);
 		if (ret)
 			goto err;
 	} else if (IS_BROXTON(i915)) {
-		ret =3D init_bdw_mmio_info(gvt);
+		ret =3D init_bdw_mmio_handlers(gvt);
 		if (ret)
 			goto err;
-		ret =3D init_skl_mmio_info(gvt);
+		ret =3D init_skl_mmio_handlers(gvt);
 		if (ret)
 			goto err;
-		ret =3D init_bxt_mmio_info(gvt);
+		ret =3D init_bxt_mmio_handlers(gvt);
 		if (ret)
 			goto err;
 	}
=20
-	gvt->mmio.mmio_block =3D mmio_blocks;
-	gvt->mmio.num_mmio_block =3D ARRAY_SIZE(mmio_blocks);
-
 	return 0;
 err:
-	intel_gvt_clean_mmio_info(gvt);
 	return ret;
 }
=20
diff --git a/drivers/gpu/drm/i915/gvt/mmio.h b/drivers/gpu/drm/i915/gvt/mmi=
o.h
index 7c26af39fbfc..48670f551f55 100644
--- a/drivers/gpu/drm/i915/gvt/mmio.h
+++ b/drivers/gpu/drm/i915/gvt/mmio.h
@@ -71,11 +71,8 @@ struct intel_gvt_mmio_info {
=20
 const struct intel_engine_cs *
 intel_gvt_render_mmio_to_engine(struct intel_gvt *gvt, unsigned int reg);
-unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt);
-bool intel_gvt_match_device(struct intel_gvt *gvt, unsigned long device);
=20
-int intel_gvt_setup_mmio_info(struct intel_gvt *gvt);
-void intel_gvt_clean_mmio_info(struct intel_gvt *gvt);
+int intel_gvt_setup_mmio_handlers(struct intel_gvt *gvt);
 int intel_gvt_for_each_tracked_mmio(struct intel_gvt *gvt,
 	int (*handler)(struct intel_gvt *gvt, u32 offset, void *data),
 	void *data);
diff --git a/drivers/gpu/drm/i915/gvt/mmio_info_table.c b/drivers/gpu/drm/i=
915/gvt/mmio_info_table.c
new file mode 100644
index 000000000000..723190c25313
--- /dev/null
+++ b/drivers/gpu/drm/i915/gvt/mmio_info_table.c
@@ -0,0 +1,1461 @@
+/*
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software=
"),
+ * to deal in the Software without restriction, including without limitati=
on
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the ne=
xt
+ * paragraph) shall be included in all copies or substantial portions of t=
he
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHAL=
L
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN THE
+ * SOFTWARE.
+ *
+ */
+
+#include "i915_drv.h"
+#include "i915_pvinfo.h"
+#include "gvt.h"
+
+/**
+ * intel_gvt_get_device_type - return the device flag of a GVT device
+ * @gvt: GVT device
+ *
+ * This function will return the device flag of a GVT device.
+ *
+ */
+unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt)
+{
+	struct drm_i915_private *i915 =3D gvt->gt->i915;
+
+	if (IS_BROADWELL(i915))
+		return D_BDW;
+	else if (IS_SKYLAKE(i915))
+		return D_SKL;
+	else if (IS_KABYLAKE(i915))
+		return D_KBL;
+	else if (IS_BROXTON(i915))
+		return D_BXT;
+	else if (IS_COFFEELAKE(i915) || IS_COMETLAKE(i915))
+		return D_CFL;
+
+	return 0;
+}
+
+/**
+ * intel_gvt_match_device - check if a device flag matches or not
+ * @gvt: a GVT device
+ * @device: the device flag
+ *
+ * Check if the given device flag matches with a GVT device.
+ *
+ */
+bool intel_gvt_match_device(struct intel_gvt *gvt,
+		unsigned long device)
+{
+	return intel_gvt_get_device_type(gvt) & device;
+}
+
+/**
+ * intel_gvt_find_mmio_info - find a mmio info entry
+ * @gvt: a GVT device
+ * @offset: a MMIO offset
+ *
+ * Finad a mmio info entry according to an offset.
+ *
+ * Returns:
+ * NULL if not found.
+ *
+ */
+struct intel_gvt_mmio_info *intel_gvt_find_mmio_info(struct intel_gvt *gvt=
,
+						  unsigned int offset)
+{
+	struct intel_gvt_mmio_info *e;
+
+	hash_for_each_possible(gvt->mmio.mmio_info_table, e, node, offset) {
+		if (e->offset =3D=3D offset)
+			return e;
+	}
+	return NULL;
+}
+
+static int new_mmio_info(struct intel_gvt *gvt,
+		u32 offset, u16 flags, u32 size,
+		u32 addr_mask, u32 ro_mask, u32 device)
+{
+	struct intel_gvt_mmio_info *info, *p;
+	u32 start, end, i;
+
+	if (!intel_gvt_match_device(gvt, device))
+		return 0;
+
+	if (WARN_ON(!IS_ALIGNED(offset, 4)))
+		return -EINVAL;
+
+	start =3D offset;
+	end =3D offset + size;
+
+	for (i =3D start; i < end; i +=3D 4) {
+		info =3D kzalloc(sizeof(*info), GFP_KERNEL);
+		if (!info)
+			return -ENOMEM;
+
+		info->offset =3D i;
+		p =3D intel_gvt_find_mmio_info(gvt, info->offset);
+		if (p) {
+			WARN(1, "dup mmio definition offset %x\n",
+				info->offset);
+			kfree(info);
+
+			/* We return -EEXIST here to make GVT-g load fail.
+			 * So duplicated MMIO can be found as soon as
+			 * possible.
+			 */
+			return -EEXIST;
+		}
+
+		info->ro_mask =3D ro_mask;
+		info->device =3D device;
+		gvt->mmio.mmio_attribute[info->offset / 4] =3D flags;
+		INIT_HLIST_NODE(&info->node);
+		hash_add(gvt->mmio.mmio_info_table, &info->node, info->offset);
+		gvt->mmio.num_tracked_mmio++;
+	}
+	return 0;
+}
+
+#define MMIO_F(reg, s, f, am, rm, d) do { \
+	ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
+		f, s, am, rm, d); \
+	if (ret) \
+		return ret; \
+} while (0)
+
+#define MMIO_D(reg, d) \
+	MMIO_F(reg, 4, 0, 0, 0, d)
+
+#define MMIO_DF(reg, d, f) \
+	MMIO_F(reg, 4, f, 0, 0, d)
+
+#define MMIO_GM_RDR(reg, d) \
+	MMIO_F(reg, 4, F_GMADR | F_CMD_ACCESS, 0xFFFFF000, 0, d)
+
+#define MMIO_RO(reg, d, f, rm) \
+	MMIO_F(reg, 4, F_RO | f, 0, rm, d)
+
+#define MMIO_RING_F(prefix, s, f, am, rm, d) do { \
+	MMIO_F(prefix(RENDER_RING_BASE), s, f, am, rm, d); \
+	MMIO_F(prefix(BLT_RING_BASE), s, f, am, rm, d); \
+	MMIO_F(prefix(GEN6_BSD_RING_BASE), s, f, am, rm, d); \
+	MMIO_F(prefix(VEBOX_RING_BASE), s, f, am, rm, d); \
+	if (HAS_ENGINE(gvt->gt, VCS1)) \
+		MMIO_F(prefix(GEN8_BSD2_RING_BASE), s, f, am, rm, d); \
+} while (0)
+
+#define MMIO_RING_D(prefix, d) \
+	MMIO_RING_F(prefix, 4, 0, 0, 0, d)
+
+#define MMIO_RING_DF(prefix, d, f) \
+	MMIO_RING_F(prefix, 4, f, 0, 0, d)
+
+#define MMIO_RING_GM(prefix, d) \
+	MMIO_RING_F(prefix, 4, F_GMADR, 0xFFFF0000, 0, d)
+
+#define MMIO_RING_GM_RDR(prefix, d) \
+	MMIO_RING_F(prefix, 4, F_GMADR | F_CMD_ACCESS, 0xFFFF0000, 0, d)
+
+#define MMIO_RING_RO(prefix, d, f, rm) \
+	MMIO_RING_F(prefix, 4, F_RO | f, 0, rm, d)
+
+static int init_generic_mmio_info(struct intel_gvt *gvt)
+{
+	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
+	int ret;
+
+	MMIO_RING_D(RING_IMR, D_ALL);
+	MMIO_D(SDEIMR, D_ALL);
+	MMIO_D(SDEIER, D_ALL);
+	MMIO_D(SDEIIR, D_ALL);
+	MMIO_D(SDEISR, D_ALL);
+	MMIO_RING_D(RING_HWSTAM, D_ALL);
+	MMIO_D(GEN8_GAMW_ECO_DEV_RW_IA, D_BDW_PLUS);
+	MMIO_GM_RDR(BSD_HWS_PGA_GEN7, D_ALL);
+	MMIO_GM_RDR(BLT_HWS_PGA_GEN7, D_ALL);
+	MMIO_GM_RDR(VEBOX_HWS_PGA_GEN7, D_ALL);
+
+#define RING_REG(base) _MMIO((base) + 0x28)
+	MMIO_RING_DF(RING_REG, D_ALL, F_CMD_ACCESS);
+#undef RING_REG
+
+#define RING_REG(base) _MMIO((base) + 0x134)
+	MMIO_RING_DF(RING_REG, D_ALL, F_CMD_ACCESS);
+#undef RING_REG
+
+#define RING_REG(base) _MMIO((base) + 0x6c)
+	MMIO_RING_D(RING_REG, D_ALL);
+#undef RING_REG
+	MMIO_D(GEN7_SC_INSTDONE, D_BDW_PLUS);
+	MMIO_GM_RDR(_MMIO(0x2148), D_ALL);
+	MMIO_GM_RDR(CCID(RENDER_RING_BASE), D_ALL);
+	MMIO_GM_RDR(_MMIO(0x12198), D_ALL);
+	MMIO_D(GEN7_CXT_SIZE, D_ALL);
+	MMIO_RING_D(RING_TAIL, D_ALL);
+	MMIO_RING_D(RING_HEAD, D_ALL);
+	MMIO_RING_D(RING_CTL, D_ALL);
+	MMIO_RING_D(RING_ACTHD, D_ALL);
+	MMIO_RING_GM(RING_START, D_ALL);
+
+	/* RING MODE */
+#define RING_REG(base) _MMIO((base) + 0x29c)
+	MMIO_RING_DF(RING_REG, D_ALL,
+		F_MODE_MASK | F_CMD_ACCESS | F_CMD_WRITE_PATCH);
+#undef RING_REG
+
+	MMIO_RING_DF(RING_MI_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_RING_DF(RING_INSTPM, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_RING_DF(RING_TIMESTAMP, D_ALL, F_CMD_ACCESS);
+	MMIO_RING_DF(RING_TIMESTAMP_UDW, D_ALL, F_CMD_ACCESS);
+	MMIO_DF(GEN7_GT_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(CACHE_MODE_0_GEN7, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(CACHE_MODE_1, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(CACHE_MODE_0, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x2124), D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x20dc), D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(_3D_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x2088), D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(FF_SLICE_CS_CHICKEN2, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x2470), D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(GAM_ECOCHK, D_ALL, F_CMD_ACCESS);
+	MMIO_DF(GEN7_COMMON_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(COMMON_SLICE_CHICKEN2, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x9030), D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x20a0), D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x2420), D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x2430), D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x2434), D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x2438), D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x243c), D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x7018), D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(GEN7_HALF_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	/* display */
+	MMIO_F(_MMIO(0x60220), 0x20, 0, 0, 0, D_ALL);
+	MMIO_D(_MMIO(0x602a0), D_ALL);
+	MMIO_D(_MMIO(0x65050), D_ALL);
+	MMIO_D(_MMIO(0x650b4), D_ALL);
+	MMIO_D(_MMIO(0xc4040), D_ALL);
+	MMIO_D(DERRMR, D_ALL);
+	MMIO_D(PIPEDSL(PIPE_A), D_ALL);
+	MMIO_D(PIPEDSL(PIPE_B), D_ALL);
+	MMIO_D(PIPEDSL(PIPE_C), D_ALL);
+	MMIO_D(PIPEDSL(_PIPE_EDP), D_ALL);
+	MMIO_D(PIPECONF(PIPE_A), D_ALL);
+	MMIO_D(PIPECONF(PIPE_B), D_ALL);
+	MMIO_D(PIPECONF(PIPE_C), D_ALL);
+	MMIO_D(PIPECONF(_PIPE_EDP), D_ALL);
+	MMIO_D(PIPESTAT(PIPE_A), D_ALL);
+	MMIO_D(PIPESTAT(PIPE_B), D_ALL);
+	MMIO_D(PIPESTAT(PIPE_C), D_ALL);
+	MMIO_D(PIPESTAT(_PIPE_EDP), D_ALL);
+	MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_A), D_ALL);
+	MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_B), D_ALL);
+	MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_C), D_ALL);
+	MMIO_D(PIPE_FLIPCOUNT_G4X(_PIPE_EDP), D_ALL);
+	MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_A), D_ALL);
+	MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_B), D_ALL);
+	MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_C), D_ALL);
+	MMIO_D(PIPE_FRMCOUNT_G4X(_PIPE_EDP), D_ALL);
+	MMIO_D(CURCNTR(PIPE_A), D_ALL);
+	MMIO_D(CURCNTR(PIPE_B), D_ALL);
+	MMIO_D(CURCNTR(PIPE_C), D_ALL);
+	MMIO_D(CURPOS(PIPE_A), D_ALL);
+	MMIO_D(CURPOS(PIPE_B), D_ALL);
+	MMIO_D(CURPOS(PIPE_C), D_ALL);
+	MMIO_D(CURBASE(PIPE_A), D_ALL);
+	MMIO_D(CURBASE(PIPE_B), D_ALL);
+	MMIO_D(CURBASE(PIPE_C), D_ALL);
+	MMIO_D(CUR_FBC_CTL(PIPE_A), D_ALL);
+	MMIO_D(CUR_FBC_CTL(PIPE_B), D_ALL);
+	MMIO_D(CUR_FBC_CTL(PIPE_C), D_ALL);
+	MMIO_D(_MMIO(0x700ac), D_ALL);
+	MMIO_D(_MMIO(0x710ac), D_ALL);
+	MMIO_D(_MMIO(0x720ac), D_ALL);
+	MMIO_D(_MMIO(0x70090), D_ALL);
+	MMIO_D(_MMIO(0x70094), D_ALL);
+	MMIO_D(_MMIO(0x70098), D_ALL);
+	MMIO_D(_MMIO(0x7009c), D_ALL);
+	MMIO_D(DSPCNTR(PIPE_A), D_ALL);
+	MMIO_D(DSPADDR(PIPE_A), D_ALL);
+	MMIO_D(DSPSTRIDE(PIPE_A), D_ALL);
+	MMIO_D(DSPPOS(PIPE_A), D_ALL);
+	MMIO_D(DSPSIZE(PIPE_A), D_ALL);
+	MMIO_D(DSPSURF(PIPE_A), D_ALL);
+	MMIO_D(DSPOFFSET(PIPE_A), D_ALL);
+	MMIO_D(DSPSURFLIVE(PIPE_A), D_ALL);
+	MMIO_D(REG_50080(PIPE_A, PLANE_PRIMARY), D_ALL);
+	MMIO_D(DSPCNTR(PIPE_B), D_ALL);
+	MMIO_D(DSPADDR(PIPE_B), D_ALL);
+	MMIO_D(DSPSTRIDE(PIPE_B), D_ALL);
+	MMIO_D(DSPPOS(PIPE_B), D_ALL);
+	MMIO_D(DSPSIZE(PIPE_B), D_ALL);
+	MMIO_D(DSPSURF(PIPE_B), D_ALL);
+	MMIO_D(DSPOFFSET(PIPE_B), D_ALL);
+	MMIO_D(DSPSURFLIVE(PIPE_B), D_ALL);
+	MMIO_D(REG_50080(PIPE_B, PLANE_PRIMARY), D_ALL);
+	MMIO_D(DSPCNTR(PIPE_C), D_ALL);
+	MMIO_D(DSPADDR(PIPE_C), D_ALL);
+	MMIO_D(DSPSTRIDE(PIPE_C), D_ALL);
+	MMIO_D(DSPPOS(PIPE_C), D_ALL);
+	MMIO_D(DSPSIZE(PIPE_C), D_ALL);
+	MMIO_D(DSPSURF(PIPE_C), D_ALL);
+	MMIO_D(DSPOFFSET(PIPE_C), D_ALL);
+	MMIO_D(DSPSURFLIVE(PIPE_C), D_ALL);
+	MMIO_D(REG_50080(PIPE_C, PLANE_PRIMARY), D_ALL);
+	MMIO_D(SPRCTL(PIPE_A), D_ALL);
+	MMIO_D(SPRLINOFF(PIPE_A), D_ALL);
+	MMIO_D(SPRSTRIDE(PIPE_A), D_ALL);
+	MMIO_D(SPRPOS(PIPE_A), D_ALL);
+	MMIO_D(SPRSIZE(PIPE_A), D_ALL);
+	MMIO_D(SPRKEYVAL(PIPE_A), D_ALL);
+	MMIO_D(SPRKEYMSK(PIPE_A), D_ALL);
+	MMIO_D(SPRSURF(PIPE_A), D_ALL);
+	MMIO_D(SPRKEYMAX(PIPE_A), D_ALL);
+	MMIO_D(SPROFFSET(PIPE_A), D_ALL);
+	MMIO_D(SPRSCALE(PIPE_A), D_ALL);
+	MMIO_D(SPRSURFLIVE(PIPE_A), D_ALL);
+	MMIO_D(REG_50080(PIPE_A, PLANE_SPRITE0), D_ALL);
+	MMIO_D(SPRCTL(PIPE_B), D_ALL);
+	MMIO_D(SPRLINOFF(PIPE_B), D_ALL);
+	MMIO_D(SPRSTRIDE(PIPE_B), D_ALL);
+	MMIO_D(SPRPOS(PIPE_B), D_ALL);
+	MMIO_D(SPRSIZE(PIPE_B), D_ALL);
+	MMIO_D(SPRKEYVAL(PIPE_B), D_ALL);
+	MMIO_D(SPRKEYMSK(PIPE_B), D_ALL);
+	MMIO_D(SPRSURF(PIPE_B), D_ALL);
+	MMIO_D(SPRKEYMAX(PIPE_B), D_ALL);
+	MMIO_D(SPROFFSET(PIPE_B), D_ALL);
+	MMIO_D(SPRSCALE(PIPE_B), D_ALL);
+	MMIO_D(SPRSURFLIVE(PIPE_B), D_ALL);
+	MMIO_D(REG_50080(PIPE_B, PLANE_SPRITE0), D_ALL);
+	MMIO_D(SPRCTL(PIPE_C), D_ALL);
+	MMIO_D(SPRLINOFF(PIPE_C), D_ALL);
+	MMIO_D(SPRSTRIDE(PIPE_C), D_ALL);
+	MMIO_D(SPRPOS(PIPE_C), D_ALL);
+	MMIO_D(SPRSIZE(PIPE_C), D_ALL);
+	MMIO_D(SPRKEYVAL(PIPE_C), D_ALL);
+	MMIO_D(SPRKEYMSK(PIPE_C), D_ALL);
+	MMIO_D(SPRSURF(PIPE_C), D_ALL);
+	MMIO_D(SPRKEYMAX(PIPE_C), D_ALL);
+	MMIO_D(SPROFFSET(PIPE_C), D_ALL);
+	MMIO_D(SPRSCALE(PIPE_C), D_ALL);
+	MMIO_D(SPRSURFLIVE(PIPE_C), D_ALL);
+	MMIO_D(REG_50080(PIPE_C, PLANE_SPRITE0), D_ALL);
+	MMIO_D(HTOTAL(TRANSCODER_A), D_ALL);
+	MMIO_D(HBLANK(TRANSCODER_A), D_ALL);
+	MMIO_D(HSYNC(TRANSCODER_A), D_ALL);
+	MMIO_D(VTOTAL(TRANSCODER_A), D_ALL);
+	MMIO_D(VBLANK(TRANSCODER_A), D_ALL);
+	MMIO_D(VSYNC(TRANSCODER_A), D_ALL);
+	MMIO_D(BCLRPAT(TRANSCODER_A), D_ALL);
+	MMIO_D(VSYNCSHIFT(TRANSCODER_A), D_ALL);
+	MMIO_D(PIPESRC(TRANSCODER_A), D_ALL);
+	MMIO_D(HTOTAL(TRANSCODER_B), D_ALL);
+	MMIO_D(HBLANK(TRANSCODER_B), D_ALL);
+	MMIO_D(HSYNC(TRANSCODER_B), D_ALL);
+	MMIO_D(VTOTAL(TRANSCODER_B), D_ALL);
+	MMIO_D(VBLANK(TRANSCODER_B), D_ALL);
+	MMIO_D(VSYNC(TRANSCODER_B), D_ALL);
+	MMIO_D(BCLRPAT(TRANSCODER_B), D_ALL);
+	MMIO_D(VSYNCSHIFT(TRANSCODER_B), D_ALL);
+	MMIO_D(PIPESRC(TRANSCODER_B), D_ALL);
+	MMIO_D(HTOTAL(TRANSCODER_C), D_ALL);
+	MMIO_D(HBLANK(TRANSCODER_C), D_ALL);
+	MMIO_D(HSYNC(TRANSCODER_C), D_ALL);
+	MMIO_D(VTOTAL(TRANSCODER_C), D_ALL);
+	MMIO_D(VBLANK(TRANSCODER_C), D_ALL);
+	MMIO_D(VSYNC(TRANSCODER_C), D_ALL);
+	MMIO_D(BCLRPAT(TRANSCODER_C), D_ALL);
+	MMIO_D(VSYNCSHIFT(TRANSCODER_C), D_ALL);
+	MMIO_D(PIPESRC(TRANSCODER_C), D_ALL);
+	MMIO_D(HTOTAL(TRANSCODER_EDP), D_ALL);
+	MMIO_D(HBLANK(TRANSCODER_EDP), D_ALL);
+	MMIO_D(HSYNC(TRANSCODER_EDP), D_ALL);
+	MMIO_D(VTOTAL(TRANSCODER_EDP), D_ALL);
+	MMIO_D(VBLANK(TRANSCODER_EDP), D_ALL);
+	MMIO_D(VSYNC(TRANSCODER_EDP), D_ALL);
+	MMIO_D(BCLRPAT(TRANSCODER_EDP), D_ALL);
+	MMIO_D(VSYNCSHIFT(TRANSCODER_EDP), D_ALL);
+	MMIO_D(PIPE_DATA_M1(TRANSCODER_A), D_ALL);
+	MMIO_D(PIPE_DATA_N1(TRANSCODER_A), D_ALL);
+	MMIO_D(PIPE_DATA_M2(TRANSCODER_A), D_ALL);
+	MMIO_D(PIPE_DATA_N2(TRANSCODER_A), D_ALL);
+	MMIO_D(PIPE_LINK_M1(TRANSCODER_A), D_ALL);
+	MMIO_D(PIPE_LINK_N1(TRANSCODER_A), D_ALL);
+	MMIO_D(PIPE_LINK_M2(TRANSCODER_A), D_ALL);
+	MMIO_D(PIPE_LINK_N2(TRANSCODER_A), D_ALL);
+	MMIO_D(PIPE_DATA_M1(TRANSCODER_B), D_ALL);
+	MMIO_D(PIPE_DATA_N1(TRANSCODER_B), D_ALL);
+	MMIO_D(PIPE_DATA_M2(TRANSCODER_B), D_ALL);
+	MMIO_D(PIPE_DATA_N2(TRANSCODER_B), D_ALL);
+	MMIO_D(PIPE_LINK_M1(TRANSCODER_B), D_ALL);
+	MMIO_D(PIPE_LINK_N1(TRANSCODER_B), D_ALL);
+	MMIO_D(PIPE_LINK_M2(TRANSCODER_B), D_ALL);
+	MMIO_D(PIPE_LINK_N2(TRANSCODER_B), D_ALL);
+	MMIO_D(PIPE_DATA_M1(TRANSCODER_C), D_ALL);
+	MMIO_D(PIPE_DATA_N1(TRANSCODER_C), D_ALL);
+	MMIO_D(PIPE_DATA_M2(TRANSCODER_C), D_ALL);
+	MMIO_D(PIPE_DATA_N2(TRANSCODER_C), D_ALL);
+	MMIO_D(PIPE_LINK_M1(TRANSCODER_C), D_ALL);
+	MMIO_D(PIPE_LINK_N1(TRANSCODER_C), D_ALL);
+	MMIO_D(PIPE_LINK_M2(TRANSCODER_C), D_ALL);
+	MMIO_D(PIPE_LINK_N2(TRANSCODER_C), D_ALL);
+	MMIO_D(PIPE_DATA_M1(TRANSCODER_EDP), D_ALL);
+	MMIO_D(PIPE_DATA_N1(TRANSCODER_EDP), D_ALL);
+	MMIO_D(PIPE_DATA_M2(TRANSCODER_EDP), D_ALL);
+	MMIO_D(PIPE_DATA_N2(TRANSCODER_EDP), D_ALL);
+	MMIO_D(PIPE_LINK_M1(TRANSCODER_EDP), D_ALL);
+	MMIO_D(PIPE_LINK_N1(TRANSCODER_EDP), D_ALL);
+	MMIO_D(PIPE_LINK_M2(TRANSCODER_EDP), D_ALL);
+	MMIO_D(PIPE_LINK_N2(TRANSCODER_EDP), D_ALL);
+	MMIO_D(PF_CTL(PIPE_A), D_ALL);
+	MMIO_D(PF_WIN_SZ(PIPE_A), D_ALL);
+	MMIO_D(PF_WIN_POS(PIPE_A), D_ALL);
+	MMIO_D(PF_VSCALE(PIPE_A), D_ALL);
+	MMIO_D(PF_HSCALE(PIPE_A), D_ALL);
+	MMIO_D(PF_CTL(PIPE_B), D_ALL);
+	MMIO_D(PF_WIN_SZ(PIPE_B), D_ALL);
+	MMIO_D(PF_WIN_POS(PIPE_B), D_ALL);
+	MMIO_D(PF_VSCALE(PIPE_B), D_ALL);
+	MMIO_D(PF_HSCALE(PIPE_B), D_ALL);
+	MMIO_D(PF_CTL(PIPE_C), D_ALL);
+	MMIO_D(PF_WIN_SZ(PIPE_C), D_ALL);
+	MMIO_D(PF_WIN_POS(PIPE_C), D_ALL);
+	MMIO_D(PF_VSCALE(PIPE_C), D_ALL);
+	MMIO_D(PF_HSCALE(PIPE_C), D_ALL);
+	MMIO_D(WM0_PIPE_ILK(PIPE_A), D_ALL);
+	MMIO_D(WM0_PIPE_ILK(PIPE_B), D_ALL);
+	MMIO_D(WM0_PIPE_ILK(PIPE_C), D_ALL);
+	MMIO_D(WM1_LP_ILK, D_ALL);
+	MMIO_D(WM2_LP_ILK, D_ALL);
+	MMIO_D(WM3_LP_ILK, D_ALL);
+	MMIO_D(WM1S_LP_ILK, D_ALL);
+	MMIO_D(WM2S_LP_IVB, D_ALL);
+	MMIO_D(WM3S_LP_IVB, D_ALL);
+	MMIO_D(BLC_PWM_CPU_CTL2, D_ALL);
+	MMIO_D(BLC_PWM_CPU_CTL, D_ALL);
+	MMIO_D(BLC_PWM_PCH_CTL1, D_ALL);
+	MMIO_D(BLC_PWM_PCH_CTL2, D_ALL);
+	MMIO_D(_MMIO(0x48268), D_ALL);
+	MMIO_F(PCH_GMBUS0, 4 * 4, 0, 0, 0, D_ALL);
+	MMIO_F(PCH_GPIO_BASE, 6 * 4, F_UNALIGN, 0, 0, D_ALL);
+	MMIO_F(_MMIO(0xe4f00), 0x28, 0, 0, 0, D_ALL);
+	MMIO_F(_MMIO(_PCH_DPB_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL);
+	MMIO_F(_MMIO(_PCH_DPC_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL);
+	MMIO_F(_MMIO(_PCH_DPD_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL);
+	MMIO_D(PCH_ADPA, D_PRE_SKL);
+	MMIO_D(_MMIO(_PCH_TRANSACONF), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANSBCONF), D_ALL);
+	MMIO_D(FDI_RX_IIR(PIPE_A), D_ALL);
+	MMIO_D(FDI_RX_IIR(PIPE_B), D_ALL);
+	MMIO_D(FDI_RX_IIR(PIPE_C), D_ALL);
+	MMIO_D(FDI_RX_IMR(PIPE_A), D_ALL);
+	MMIO_D(FDI_RX_IMR(PIPE_B), D_ALL);
+	MMIO_D(FDI_RX_IMR(PIPE_C), D_ALL);
+	MMIO_D(FDI_RX_CTL(PIPE_A), D_ALL);
+	MMIO_D(FDI_RX_CTL(PIPE_B), D_ALL);
+	MMIO_D(FDI_RX_CTL(PIPE_C), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_HTOTAL_A), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_HBLANK_A), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_HSYNC_A), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_VTOTAL_A), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_VBLANK_A), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_VSYNC_A), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_VSYNCSHIFT_A), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_HTOTAL_B), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_HBLANK_B), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_HSYNC_B), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_VTOTAL_B), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_VBLANK_B), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_VSYNC_B), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANS_VSYNCSHIFT_B), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANSA_DATA_M1), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANSA_DATA_N1), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANSA_DATA_M2), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANSA_DATA_N2), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANSA_LINK_M1), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANSA_LINK_N1), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANSA_LINK_M2), D_ALL);
+	MMIO_D(_MMIO(_PCH_TRANSA_LINK_N2), D_ALL);
+	MMIO_D(TRANS_DP_CTL(PIPE_A), D_ALL);
+	MMIO_D(TRANS_DP_CTL(PIPE_B), D_ALL);
+	MMIO_D(TRANS_DP_CTL(PIPE_C), D_ALL);
+	MMIO_D(TVIDEO_DIP_CTL(PIPE_A), D_ALL);
+	MMIO_D(TVIDEO_DIP_DATA(PIPE_A), D_ALL);
+	MMIO_D(TVIDEO_DIP_GCP(PIPE_A), D_ALL);
+	MMIO_D(TVIDEO_DIP_CTL(PIPE_B), D_ALL);
+	MMIO_D(TVIDEO_DIP_DATA(PIPE_B), D_ALL);
+	MMIO_D(TVIDEO_DIP_GCP(PIPE_B), D_ALL);
+	MMIO_D(TVIDEO_DIP_CTL(PIPE_C), D_ALL);
+	MMIO_D(TVIDEO_DIP_DATA(PIPE_C), D_ALL);
+	MMIO_D(TVIDEO_DIP_GCP(PIPE_C), D_ALL);
+	MMIO_D(_MMIO(_FDI_RXA_MISC), D_ALL);
+	MMIO_D(_MMIO(_FDI_RXB_MISC), D_ALL);
+	MMIO_D(_MMIO(_FDI_RXA_TUSIZE1), D_ALL);
+	MMIO_D(_MMIO(_FDI_RXA_TUSIZE2), D_ALL);
+	MMIO_D(_MMIO(_FDI_RXB_TUSIZE1), D_ALL);
+	MMIO_D(_MMIO(_FDI_RXB_TUSIZE2), D_ALL);
+	MMIO_D(PCH_PP_CONTROL, D_ALL);
+	MMIO_D(PCH_PP_DIVISOR, D_ALL);
+	MMIO_D(PCH_PP_STATUS,  D_ALL);
+	MMIO_D(PCH_LVDS, D_ALL);
+	MMIO_D(_MMIO(_PCH_DPLL_A), D_ALL);
+	MMIO_D(_MMIO(_PCH_DPLL_B), D_ALL);
+	MMIO_D(_MMIO(_PCH_FPA0), D_ALL);
+	MMIO_D(_MMIO(_PCH_FPA1), D_ALL);
+	MMIO_D(_MMIO(_PCH_FPB0), D_ALL);
+	MMIO_D(_MMIO(_PCH_FPB1), D_ALL);
+	MMIO_D(PCH_DREF_CONTROL, D_ALL);
+	MMIO_D(PCH_RAWCLK_FREQ, D_ALL);
+	MMIO_D(PCH_DPLL_SEL, D_ALL);
+	MMIO_D(_MMIO(0x61208), D_ALL);
+	MMIO_D(_MMIO(0x6120c), D_ALL);
+	MMIO_D(PCH_PP_ON_DELAYS, D_ALL);
+	MMIO_D(PCH_PP_OFF_DELAYS, D_ALL);
+	MMIO_D(_MMIO(0xe651c), D_ALL);
+	MMIO_D(_MMIO(0xe661c), D_ALL);
+	MMIO_D(_MMIO(0xe671c), D_ALL);
+	MMIO_D(_MMIO(0xe681c), D_ALL);
+	MMIO_D(_MMIO(0xe6c04), D_ALL);
+	MMIO_D(_MMIO(0xe6e1c), D_ALL);
+	MMIO_RO(PCH_PORT_HOTPLUG, D_ALL, 0,
+		PORTA_HOTPLUG_STATUS_MASK
+		| PORTB_HOTPLUG_STATUS_MASK
+		| PORTC_HOTPLUG_STATUS_MASK
+		| PORTD_HOTPLUG_STATUS_MASK);
+	MMIO_D(LCPLL_CTL, D_ALL);
+	MMIO_D(FUSE_STRAP, D_ALL);
+	MMIO_D(DIGITAL_PORT_HOTPLUG_CNTRL, D_ALL);
+	MMIO_D(DISP_ARB_CTL, D_ALL);
+	MMIO_D(DISP_ARB_CTL2, D_ALL);
+	MMIO_D(ILK_DISPLAY_CHICKEN1, D_ALL);
+	MMIO_D(ILK_DISPLAY_CHICKEN2, D_ALL);
+	MMIO_D(ILK_DSPCLK_GATE_D, D_ALL);
+	MMIO_D(SOUTH_CHICKEN1, D_ALL);
+	MMIO_D(SOUTH_CHICKEN2, D_ALL);
+	MMIO_D(_MMIO(_TRANSA_CHICKEN1), D_ALL);
+	MMIO_D(_MMIO(_TRANSB_CHICKEN1), D_ALL);
+	MMIO_D(SOUTH_DSPCLK_GATE_D, D_ALL);
+	MMIO_D(_MMIO(_TRANSA_CHICKEN2), D_ALL);
+	MMIO_D(_MMIO(_TRANSB_CHICKEN2), D_ALL);
+	MMIO_D(ILK_DPFC_CB_BASE, D_ALL);
+	MMIO_D(ILK_DPFC_CONTROL, D_ALL);
+	MMIO_D(ILK_DPFC_RECOMP_CTL, D_ALL);
+	MMIO_D(ILK_DPFC_STATUS, D_ALL);
+	MMIO_D(ILK_DPFC_FENCE_YOFF, D_ALL);
+	MMIO_D(ILK_DPFC_CHICKEN, D_ALL);
+	MMIO_D(ILK_FBC_RT_BASE, D_ALL);
+	MMIO_D(IPS_CTL, D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_BY(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_BU(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_BV(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_MODE(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_A), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_BY(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_BU(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_BV(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_MODE(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_B), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_C), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_BY(PIPE_C), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_C), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_BU(PIPE_C), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_C), D_ALL);
+	MMIO_D(PIPE_CSC_COEFF_BV(PIPE_C), D_ALL);
+	MMIO_D(PIPE_CSC_MODE(PIPE_C), D_ALL);
+	MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_C), D_ALL);
+	MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_C), D_ALL);
+	MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_C), D_ALL);
+	MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_C), D_ALL);
+	MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_C), D_ALL);
+	MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_C), D_ALL);
+	MMIO_D(PREC_PAL_INDEX(PIPE_A), D_ALL);
+	MMIO_D(PREC_PAL_DATA(PIPE_A), D_ALL);
+	MMIO_F(PREC_PAL_GC_MAX(PIPE_A, 0), 4 * 3, 0, 0, 0, D_ALL);
+	MMIO_D(PREC_PAL_INDEX(PIPE_B), D_ALL);
+	MMIO_D(PREC_PAL_DATA(PIPE_B), D_ALL);
+	MMIO_F(PREC_PAL_GC_MAX(PIPE_B, 0), 4 * 3, 0, 0, 0, D_ALL);
+	MMIO_D(PREC_PAL_INDEX(PIPE_C), D_ALL);
+	MMIO_D(PREC_PAL_DATA(PIPE_C), D_ALL);
+	MMIO_F(PREC_PAL_GC_MAX(PIPE_C, 0), 4 * 3, 0, 0, 0, D_ALL);
+	MMIO_D(_MMIO(0x60110), D_ALL);
+	MMIO_D(_MMIO(0x61110), D_ALL);
+	MMIO_F(_MMIO(0x70400), 0x40, 0, 0, 0, D_ALL);
+	MMIO_F(_MMIO(0x71400), 0x40, 0, 0, 0, D_ALL);
+	MMIO_F(_MMIO(0x72400), 0x40, 0, 0, 0, D_ALL);
+	MMIO_F(_MMIO(0x70440), 0xc, 0, 0, 0, D_PRE_SKL);
+	MMIO_F(_MMIO(0x71440), 0xc, 0, 0, 0, D_PRE_SKL);
+	MMIO_F(_MMIO(0x72440), 0xc, 0, 0, 0, D_PRE_SKL);
+	MMIO_F(_MMIO(0x7044c), 0xc, 0, 0, 0, D_PRE_SKL);
+	MMIO_F(_MMIO(0x7144c), 0xc, 0, 0, 0, D_PRE_SKL);
+	MMIO_F(_MMIO(0x7244c), 0xc, 0, 0, 0, D_PRE_SKL);
+	MMIO_D(WM_LINETIME(PIPE_A), D_ALL);
+	MMIO_D(WM_LINETIME(PIPE_B), D_ALL);
+	MMIO_D(WM_LINETIME(PIPE_C), D_ALL);
+	MMIO_D(SPLL_CTL, D_ALL);
+	MMIO_D(_MMIO(_WRPLL_CTL1), D_ALL);
+	MMIO_D(_MMIO(_WRPLL_CTL2), D_ALL);
+	MMIO_D(PORT_CLK_SEL(PORT_A), D_ALL);
+	MMIO_D(PORT_CLK_SEL(PORT_B), D_ALL);
+	MMIO_D(PORT_CLK_SEL(PORT_C), D_ALL);
+	MMIO_D(PORT_CLK_SEL(PORT_D), D_ALL);
+	MMIO_D(PORT_CLK_SEL(PORT_E), D_ALL);
+	MMIO_D(TRANS_CLK_SEL(TRANSCODER_A), D_ALL);
+	MMIO_D(TRANS_CLK_SEL(TRANSCODER_B), D_ALL);
+	MMIO_D(TRANS_CLK_SEL(TRANSCODER_C), D_ALL);
+	MMIO_D(HSW_NDE_RSTWRN_OPT, D_ALL);
+	MMIO_D(_MMIO(0x46508), D_ALL);
+	MMIO_D(_MMIO(0x49080), D_ALL);
+	MMIO_D(_MMIO(0x49180), D_ALL);
+	MMIO_D(_MMIO(0x49280), D_ALL);
+	MMIO_F(_MMIO(0x49090), 0x14, 0, 0, 0, D_ALL);
+	MMIO_F(_MMIO(0x49190), 0x14, 0, 0, 0, D_ALL);
+	MMIO_F(_MMIO(0x49290), 0x14, 0, 0, 0, D_ALL);
+	MMIO_D(GAMMA_MODE(PIPE_A), D_ALL);
+	MMIO_D(GAMMA_MODE(PIPE_B), D_ALL);
+	MMIO_D(GAMMA_MODE(PIPE_C), D_ALL);
+	MMIO_D(PIPE_MULT(PIPE_A), D_ALL);
+	MMIO_D(PIPE_MULT(PIPE_B), D_ALL);
+	MMIO_D(PIPE_MULT(PIPE_C), D_ALL);
+	MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_A), D_ALL);
+	MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_B), D_ALL);
+	MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_C), D_ALL);
+	MMIO_D(SFUSE_STRAP, D_ALL);
+	MMIO_D(SBI_ADDR, D_ALL);
+	MMIO_D(SBI_DATA, D_ALL);
+	MMIO_D(SBI_CTL_STAT, D_ALL);
+	MMIO_D(PIXCLK_GATE, D_ALL);
+	MMIO_F(_MMIO(_DPA_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_ALL);
+	MMIO_D(DDI_BUF_CTL(PORT_A), D_ALL);
+	MMIO_D(DDI_BUF_CTL(PORT_B), D_ALL);
+	MMIO_D(DDI_BUF_CTL(PORT_C), D_ALL);
+	MMIO_D(DDI_BUF_CTL(PORT_D), D_ALL);
+	MMIO_D(DDI_BUF_CTL(PORT_E), D_ALL);
+	MMIO_D(DP_TP_CTL(PORT_A), D_ALL);
+	MMIO_D(DP_TP_CTL(PORT_B), D_ALL);
+	MMIO_D(DP_TP_CTL(PORT_C), D_ALL);
+	MMIO_D(DP_TP_CTL(PORT_D), D_ALL);
+	MMIO_D(DP_TP_CTL(PORT_E), D_ALL);
+	MMIO_D(DP_TP_STATUS(PORT_A), D_ALL);
+	MMIO_D(DP_TP_STATUS(PORT_B), D_ALL);
+	MMIO_D(DP_TP_STATUS(PORT_C), D_ALL);
+	MMIO_D(DP_TP_STATUS(PORT_D), D_ALL);
+	MMIO_D(DP_TP_STATUS(PORT_E), D_ALL);
+	MMIO_F(_MMIO(_DDI_BUF_TRANS_A), 0x50, 0, 0, 0, D_ALL);
+	MMIO_F(_MMIO(0x64e60), 0x50, 0, 0, 0, D_ALL);
+	MMIO_F(_MMIO(0x64eC0), 0x50, 0, 0, 0, D_ALL);
+	MMIO_F(_MMIO(0x64f20), 0x50, 0, 0, 0, D_ALL);
+	MMIO_F(_MMIO(0x64f80), 0x50, 0, 0, 0, D_ALL);
+	MMIO_D(HSW_AUD_CFG(PIPE_A), D_ALL);
+	MMIO_D(HSW_AUD_PIN_ELD_CP_VLD, D_ALL);
+	MMIO_D(HSW_AUD_MISC_CTRL(PIPE_A), D_ALL);
+	MMIO_D(_MMIO(_TRANS_DDI_FUNC_CTL_A), D_ALL);
+	MMIO_D(_MMIO(_TRANS_DDI_FUNC_CTL_B), D_ALL);
+	MMIO_D(_MMIO(_TRANS_DDI_FUNC_CTL_C), D_ALL);
+	MMIO_D(_MMIO(_TRANS_DDI_FUNC_CTL_EDP), D_ALL);
+	MMIO_D(_MMIO(_TRANSA_MSA_MISC), D_ALL);
+	MMIO_D(_MMIO(_TRANSB_MSA_MISC), D_ALL);
+	MMIO_D(_MMIO(_TRANSC_MSA_MISC), D_ALL);
+	MMIO_D(_MMIO(_TRANS_EDP_MSA_MISC), D_ALL);
+	MMIO_D(FORCEWAKE, D_ALL);
+	MMIO_D(FORCEWAKE_ACK, D_ALL);
+	MMIO_D(GEN6_GT_CORE_STATUS, D_ALL);
+	MMIO_D(GEN6_GT_THREAD_STATUS_REG, D_ALL);
+	MMIO_DF(GTFIFODBG, D_ALL, F_CMD_ACCESS);
+	MMIO_DF(GTFIFOCTL, D_ALL, F_CMD_ACCESS);
+	MMIO_D(FORCEWAKE_MT, D_PRE_SKL);
+	MMIO_D(FORCEWAKE_ACK_HSW, D_BDW);
+	MMIO_D(ECOBUS, D_ALL);
+	MMIO_D(GEN6_RC_CONTROL, D_ALL);
+	MMIO_D(GEN6_RC_STATE, D_ALL);
+	MMIO_D(GEN6_RPNSWREQ, D_ALL);
+	MMIO_D(GEN6_RC_VIDEO_FREQ, D_ALL);
+	MMIO_D(GEN6_RP_DOWN_TIMEOUT, D_ALL);
+	MMIO_D(GEN6_RP_INTERRUPT_LIMITS, D_ALL);
+	MMIO_D(GEN6_RPSTAT1, D_ALL);
+	MMIO_D(GEN6_RP_CONTROL, D_ALL);
+	MMIO_D(GEN6_RP_UP_THRESHOLD, D_ALL);
+	MMIO_D(GEN6_RP_DOWN_THRESHOLD, D_ALL);
+	MMIO_D(GEN6_RP_CUR_UP_EI, D_ALL);
+	MMIO_D(GEN6_RP_CUR_UP, D_ALL);
+	MMIO_D(GEN6_RP_PREV_UP, D_ALL);
+	MMIO_D(GEN6_RP_CUR_DOWN_EI, D_ALL);
+	MMIO_D(GEN6_RP_CUR_DOWN, D_ALL);
+	MMIO_D(GEN6_RP_PREV_DOWN, D_ALL);
+	MMIO_D(GEN6_RP_UP_EI, D_ALL);
+	MMIO_D(GEN6_RP_DOWN_EI, D_ALL);
+	MMIO_D(GEN6_RP_IDLE_HYSTERSIS, D_ALL);
+	MMIO_D(GEN6_RC1_WAKE_RATE_LIMIT, D_ALL);
+	MMIO_D(GEN6_RC6_WAKE_RATE_LIMIT, D_ALL);
+	MMIO_D(GEN6_RC6pp_WAKE_RATE_LIMIT, D_ALL);
+	MMIO_D(GEN6_RC_EVALUATION_INTERVAL, D_ALL);
+	MMIO_D(GEN6_RC_IDLE_HYSTERSIS, D_ALL);
+	MMIO_D(GEN6_RC_SLEEP, D_ALL);
+	MMIO_D(GEN6_RC1e_THRESHOLD, D_ALL);
+	MMIO_D(GEN6_RC6_THRESHOLD, D_ALL);
+	MMIO_D(GEN6_RC6p_THRESHOLD, D_ALL);
+	MMIO_D(GEN6_RC6pp_THRESHOLD, D_ALL);
+	MMIO_D(GEN6_PMINTRMSK, D_ALL);
+	MMIO_D(HSW_PWR_WELL_CTL1, D_BDW);
+	MMIO_D(HSW_PWR_WELL_CTL2, D_BDW);
+	MMIO_D(HSW_PWR_WELL_CTL3, D_BDW);
+	MMIO_D(HSW_PWR_WELL_CTL4, D_BDW);
+	MMIO_D(HSW_PWR_WELL_CTL5, D_BDW);
+	MMIO_D(HSW_PWR_WELL_CTL6, D_BDW);
+	MMIO_D(RSTDBYCTL, D_ALL);
+	MMIO_D(GEN6_GDRST, D_ALL);
+	MMIO_F(FENCE_REG_GEN6_LO(0), 0x80, 0, 0, 0, D_ALL);
+	MMIO_D(CPU_VGACNTRL, D_ALL);
+	MMIO_D(TILECTL, D_ALL);
+	MMIO_D(GEN6_UCGCTL1, D_ALL);
+	MMIO_D(GEN6_UCGCTL2, D_ALL);
+	MMIO_F(_MMIO(0x4f000), 0x90, 0, 0, 0, D_ALL);
+	MMIO_D(GEN6_PCODE_DATA, D_ALL);
+	MMIO_D(_MMIO(0x13812c), D_ALL);
+	MMIO_D(GEN7_ERR_INT, D_ALL);
+	MMIO_D(HSW_EDRAM_CAP, D_ALL);
+	MMIO_D(HSW_IDICR, D_ALL);
+	MMIO_D(GFX_FLSH_CNTL_GEN6, D_ALL);
+	MMIO_D(_MMIO(0x3c), D_ALL);
+	MMIO_D(_MMIO(0x860), D_ALL);
+	MMIO_D(ECOSKPD, D_ALL);
+	MMIO_D(_MMIO(0x121d0), D_ALL);
+	MMIO_D(GEN6_BLITTER_ECOSKPD, D_ALL);
+	MMIO_D(_MMIO(0x41d0), D_ALL);
+	MMIO_D(GAC_ECO_BITS, D_ALL);
+	MMIO_D(_MMIO(0x6200), D_ALL);
+	MMIO_D(_MMIO(0x6204), D_ALL);
+	MMIO_D(_MMIO(0x6208), D_ALL);
+	MMIO_D(_MMIO(0x7118), D_ALL);
+	MMIO_D(_MMIO(0x7180), D_ALL);
+	MMIO_D(_MMIO(0x7408), D_ALL);
+	MMIO_D(_MMIO(0x7c00), D_ALL);
+	MMIO_D(GEN6_MBCTL, D_ALL);
+	MMIO_D(_MMIO(0x911c), D_ALL);
+	MMIO_D(_MMIO(0x9120), D_ALL);
+	MMIO_DF(GEN7_UCGCTL4, D_ALL, F_CMD_ACCESS);
+	MMIO_D(GAB_CTL, D_ALL);
+	MMIO_D(_MMIO(0x48800), D_ALL);
+	MMIO_D(_MMIO(0xce044), D_ALL);
+	MMIO_D(_MMIO(0xe6500), D_ALL);
+	MMIO_D(_MMIO(0xe6504), D_ALL);
+	MMIO_D(_MMIO(0xe6600), D_ALL);
+	MMIO_D(_MMIO(0xe6604), D_ALL);
+	MMIO_D(_MMIO(0xe6700), D_ALL);
+	MMIO_D(_MMIO(0xe6704), D_ALL);
+	MMIO_D(_MMIO(0xe6800), D_ALL);
+	MMIO_D(_MMIO(0xe6804), D_ALL);
+	MMIO_D(PCH_GMBUS4, D_ALL);
+	MMIO_D(PCH_GMBUS5, D_ALL);
+	MMIO_D(_MMIO(0x902c), D_ALL);
+	MMIO_D(_MMIO(0xec008), D_ALL);
+	MMIO_D(_MMIO(0xec00c), D_ALL);
+	MMIO_D(_MMIO(0xec008 + 0x18), D_ALL);
+	MMIO_D(_MMIO(0xec00c + 0x18), D_ALL);
+	MMIO_D(_MMIO(0xec008 + 0x18 * 2), D_ALL);
+	MMIO_D(_MMIO(0xec00c + 0x18 * 2), D_ALL);
+	MMIO_D(_MMIO(0xec008 + 0x18 * 3), D_ALL);
+	MMIO_D(_MMIO(0xec00c + 0x18 * 3), D_ALL);
+	MMIO_D(_MMIO(0xec408), D_ALL);
+	MMIO_D(_MMIO(0xec40c), D_ALL);
+	MMIO_D(_MMIO(0xec408 + 0x18), D_ALL);
+	MMIO_D(_MMIO(0xec40c + 0x18), D_ALL);
+	MMIO_D(_MMIO(0xec408 + 0x18 * 2), D_ALL);
+	MMIO_D(_MMIO(0xec40c + 0x18 * 2), D_ALL);
+	MMIO_D(_MMIO(0xec408 + 0x18 * 3), D_ALL);
+	MMIO_D(_MMIO(0xec40c + 0x18 * 3), D_ALL);
+	MMIO_D(_MMIO(0xfc810), D_ALL);
+	MMIO_D(_MMIO(0xfc81c), D_ALL);
+	MMIO_D(_MMIO(0xfc828), D_ALL);
+	MMIO_D(_MMIO(0xfc834), D_ALL);
+	MMIO_D(_MMIO(0xfcc00), D_ALL);
+	MMIO_D(_MMIO(0xfcc0c), D_ALL);
+	MMIO_D(_MMIO(0xfcc18), D_ALL);
+	MMIO_D(_MMIO(0xfcc24), D_ALL);
+	MMIO_D(_MMIO(0xfd000), D_ALL);
+	MMIO_D(_MMIO(0xfd00c), D_ALL);
+	MMIO_D(_MMIO(0xfd018), D_ALL);
+	MMIO_D(_MMIO(0xfd024), D_ALL);
+	MMIO_D(_MMIO(0xfd034), D_ALL);
+	MMIO_D(FPGA_DBG, D_ALL);
+	MMIO_D(_MMIO(0x2054), D_ALL);
+	MMIO_D(_MMIO(0x12054), D_ALL);
+	MMIO_D(_MMIO(0x22054), D_ALL);
+	MMIO_D(_MMIO(0x1a054), D_ALL);
+	MMIO_D(_MMIO(0x44070), D_ALL);
+	MMIO_DF(_MMIO(0x215c), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x2178), D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x217c), D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x12178), D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x1217c), D_ALL, F_CMD_ACCESS);
+	MMIO_F(_MMIO(0x2290), 8, F_CMD_ACCESS, 0, 0, D_BDW_PLUS);
+	MMIO_D(_MMIO(0x2b00), D_BDW_PLUS);
+	MMIO_D(_MMIO(0x2360), D_BDW_PLUS);
+	MMIO_F(_MMIO(0x5200), 32, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_F(_MMIO(0x5240), 32, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_F(_MMIO(0x5280), 16, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_DF(_MMIO(0x1c17c), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x1c178), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(BCS_SWCTRL, D_ALL, F_CMD_ACCESS);
+	MMIO_F(HS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_F(DS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_F(IA_VERTICES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_F(IA_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_F(VS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_F(GS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_F(GS_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_F(CL_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_F(CL_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_F(PS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_F(PS_DEPTH_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL);
+	MMIO_D(_MMIO(0x4260), D_BDW_PLUS);
+	MMIO_D(_MMIO(0x4264), D_BDW_PLUS);
+	MMIO_D(_MMIO(0x4268), D_BDW_PLUS);
+	MMIO_D(_MMIO(0x426c), D_BDW_PLUS);
+	MMIO_D(_MMIO(0x4270), D_BDW_PLUS);
+	MMIO_DF(_MMIO(0x4094), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(ARB_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_RING_GM(RING_BBADDR, D_ALL);
+	MMIO_DF(_MMIO(0x2220), D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x12220), D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x22220), D_ALL, F_CMD_ACCESS);
+	MMIO_RING_DF(RING_SYNC_1, D_ALL, F_CMD_ACCESS);
+	MMIO_RING_DF(RING_SYNC_0, D_ALL, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x22178), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x1a178), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x1a17c), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x2217c), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_D(EDP_PSR_IMR, D_BDW_PLUS);
+	MMIO_D(EDP_PSR_IIR, D_BDW_PLUS);
+	MMIO_D(GUC_STATUS, D_ALL);
+
+	return 0;
+}
+
+static int init_bdw_mmio_info(struct intel_gvt *gvt)
+{
+	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
+	int ret;
+
+	MMIO_D(GEN8_GT_IMR(0), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_IER(0), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_IIR(0), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_ISR(0), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_IMR(1), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_IER(1), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_IIR(1), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_ISR(1), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_IMR(2), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_IER(2), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_IIR(2), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_ISR(2), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_IMR(3), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_IER(3), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_IIR(3), D_BDW_PLUS);
+	MMIO_D(GEN8_GT_ISR(3), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PIPE_IMR(PIPE_A), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PIPE_IER(PIPE_A), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PIPE_IIR(PIPE_A), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PIPE_ISR(PIPE_A), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PIPE_IMR(PIPE_B), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PIPE_IER(PIPE_B), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PIPE_IIR(PIPE_B), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PIPE_ISR(PIPE_B), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PIPE_IMR(PIPE_C), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PIPE_IER(PIPE_C), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PIPE_IIR(PIPE_C), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PIPE_ISR(PIPE_C), D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PORT_IMR, D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PORT_IER, D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PORT_IIR, D_BDW_PLUS);
+	MMIO_D(GEN8_DE_PORT_ISR, D_BDW_PLUS);
+	MMIO_D(GEN8_DE_MISC_IMR, D_BDW_PLUS);
+	MMIO_D(GEN8_DE_MISC_IER, D_BDW_PLUS);
+	MMIO_D(GEN8_DE_MISC_IIR, D_BDW_PLUS);
+	MMIO_D(GEN8_DE_MISC_ISR, D_BDW_PLUS);
+	MMIO_D(GEN8_PCU_IMR, D_BDW_PLUS);
+	MMIO_D(GEN8_PCU_IER, D_BDW_PLUS);
+	MMIO_D(GEN8_PCU_IIR, D_BDW_PLUS);
+	MMIO_D(GEN8_PCU_ISR, D_BDW_PLUS);
+	MMIO_D(GEN8_MASTER_IRQ, D_BDW_PLUS);
+	MMIO_RING_D(RING_ACTHD_UDW, D_BDW_PLUS);
+
+#define RING_REG(base) _MMIO((base) + 0xd0)
+	MMIO_RING_F(RING_REG, 4, F_RO, 0,
+		~_MASKED_BIT_ENABLE(RESET_CTL_REQUEST_RESET), D_BDW_PLUS);
+#undef RING_REG
+
+#define RING_REG(base) _MMIO((base) + 0x230)
+	MMIO_RING_D(RING_REG, D_BDW_PLUS);
+#undef RING_REG
+
+#define RING_REG(base) _MMIO((base) + 0x234)
+	MMIO_RING_F(RING_REG, 8, F_RO, 0, ~0, D_BDW_PLUS);
+#undef RING_REG
+
+#define RING_REG(base) _MMIO((base) + 0x244)
+	MMIO_RING_DF(RING_REG, D_BDW_PLUS, F_CMD_ACCESS);
+#undef RING_REG
+
+#define RING_REG(base) _MMIO((base) + 0x370)
+	MMIO_RING_F(RING_REG, 48, F_RO, 0, ~0, D_BDW_PLUS);
+#undef RING_REG
+
+#define RING_REG(base) _MMIO((base) + 0x3a0)
+	MMIO_RING_DF(RING_REG, D_BDW_PLUS, F_MODE_MASK);
+#undef RING_REG
+
+	MMIO_D(PIPEMISC(PIPE_A), D_BDW_PLUS);
+	MMIO_D(PIPEMISC(PIPE_B), D_BDW_PLUS);
+	MMIO_D(PIPEMISC(PIPE_C), D_BDW_PLUS);
+	MMIO_D(_MMIO(0x1c1d0), D_BDW_PLUS);
+	MMIO_D(GEN6_MBCUNIT_SNPCR, D_BDW_PLUS);
+	MMIO_D(GEN7_MISCCPCTL, D_BDW_PLUS);
+	MMIO_D(_MMIO(0x1c054), D_BDW_PLUS);
+	MMIO_D(GEN6_PCODE_MAILBOX, D_BDW_PLUS);
+	MMIO_D(GEN8_PRIVATE_PAT_LO, D_BDW_PLUS & ~D_BXT);
+	MMIO_D(GEN8_PRIVATE_PAT_HI, D_BDW_PLUS);
+	MMIO_D(GAMTARBMODE, D_BDW_PLUS);
+
+#define RING_REG(base) _MMIO((base) + 0x270)
+	MMIO_RING_F(RING_REG, 32, F_CMD_ACCESS, 0, 0, D_BDW_PLUS);
+#undef RING_REG
+
+	MMIO_RING_GM(RING_HWS_PGA, D_BDW_PLUS);
+	MMIO_DF(HDC_CHICKEN0, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_D(CHICKEN_PIPESL_1(PIPE_A), D_BDW_PLUS);
+	MMIO_D(CHICKEN_PIPESL_1(PIPE_B), D_BDW_PLUS);
+	MMIO_D(CHICKEN_PIPESL_1(PIPE_C), D_BDW_PLUS);
+	MMIO_D(WM_MISC, D_BDW);
+	MMIO_D(_MMIO(_SRD_CTL_EDP), D_BDW);
+	MMIO_D(_MMIO(0x6671c), D_BDW_PLUS);
+	MMIO_D(_MMIO(0x66c00), D_BDW_PLUS);
+	MMIO_D(_MMIO(0x66c04), D_BDW_PLUS);
+	MMIO_D(HSW_GTT_CACHE_EN, D_BDW_PLUS);
+	MMIO_D(GEN8_EU_DISABLE0, D_BDW_PLUS);
+	MMIO_D(GEN8_EU_DISABLE1, D_BDW_PLUS);
+	MMIO_D(GEN8_EU_DISABLE2, D_BDW_PLUS);
+	MMIO_D(_MMIO(0xfdc), D_BDW_PLUS);
+	MMIO_DF(GEN8_ROW_CHICKEN, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(GEN7_ROW_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(GEN8_UCGCTL6, D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xb1f0), D_BDW, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xb1c0), D_BDW, F_CMD_ACCESS);
+	MMIO_DF(GEN8_L3SQCREG4, D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xb100), D_BDW, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xb10c), D_BDW, F_CMD_ACCESS);
+	MMIO_D(_MMIO(0xb110), D_BDW);
+	MMIO_D(GEN9_SCRATCH_LNCF1, D_BDW_PLUS);
+	MMIO_F(_MMIO(0x24d0), 48, F_CMD_ACCESS | F_CMD_WRITE_PATCH, 0, 0,
+		D_BDW_PLUS);
+	MMIO_D(_MMIO(0x44484), D_BDW_PLUS);
+	MMIO_D(_MMIO(0x4448c), D_BDW_PLUS);
+	MMIO_DF(_MMIO(0x83a4), D_BDW, F_CMD_ACCESS);
+	MMIO_D(GEN8_L3_LRA_1_GPGPU, D_BDW_PLUS);
+	MMIO_DF(_MMIO(0x8430), D_BDW, F_CMD_ACCESS);
+	MMIO_D(_MMIO(0x110000), D_BDW_PLUS);
+	MMIO_D(_MMIO(0x48400), D_BDW_PLUS);
+	MMIO_D(_MMIO(0x6e570), D_BDW_PLUS);
+	MMIO_D(_MMIO(0x65f10), D_BDW_PLUS);
+	MMIO_DF(_MMIO(0xe194), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xe188), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(HALF_SLICE_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x2580), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x2248), D_BDW, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xe220), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xe230), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xe240), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xe260), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xe270), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xe280), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xe2a0), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xe2b0), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0xe2c0), D_BDW_PLUS, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x21f0), D_BDW_PLUS, F_CMD_ACCESS);
+
+	return 0;
+}
+
+static int init_skl_mmio_info(struct intel_gvt *gvt)
+{
+	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
+	int ret;
+
+	MMIO_D(FORCEWAKE_RENDER_GEN9, D_SKL_PLUS);
+	MMIO_D(FORCEWAKE_ACK_RENDER_GEN9, D_SKL_PLUS);
+	MMIO_D(FORCEWAKE_GT_GEN9, D_SKL_PLUS);
+	MMIO_D(FORCEWAKE_ACK_GT_GEN9, D_SKL_PLUS);
+	MMIO_D(FORCEWAKE_MEDIA_GEN9, D_SKL_PLUS);
+	MMIO_D(FORCEWAKE_ACK_MEDIA_GEN9, D_SKL_PLUS);
+	MMIO_F(DP_AUX_CH_CTL(AUX_CH_B), 6 * 4, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(DP_AUX_CH_CTL(AUX_CH_C), 6 * 4, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(DP_AUX_CH_CTL(AUX_CH_D), 6 * 4, 0, 0, 0, D_SKL_PLUS);
+	MMIO_D(HSW_PWR_WELL_CTL1, D_SKL_PLUS);
+	MMIO_D(HSW_PWR_WELL_CTL2, D_SKL_PLUS);
+	MMIO_D(DBUF_CTL_S(0), D_SKL_PLUS);
+	MMIO_D(GEN9_PG_ENABLE, D_SKL_PLUS);
+	MMIO_D(GEN9_MEDIA_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
+	MMIO_D(GEN9_RENDER_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
+	MMIO_DF(GEN9_GAMT_ECO_REG_RW_IA, D_SKL_PLUS, F_CMD_ACCESS);
+	MMIO_DF(MMCD_MISC_CTRL, D_SKL_PLUS, F_CMD_ACCESS);
+	MMIO_D(CHICKEN_PAR1_1, D_SKL_PLUS);
+	MMIO_D(DC_STATE_EN, D_SKL_PLUS);
+	MMIO_D(DC_STATE_DEBUG, D_SKL_PLUS);
+	MMIO_D(CDCLK_CTL, D_SKL_PLUS);
+	MMIO_D(LCPLL1_CTL, D_SKL_PLUS);
+	MMIO_D(LCPLL2_CTL, D_SKL_PLUS);
+	MMIO_D(_MMIO(_DPLL1_CFGCR1), D_SKL_PLUS);
+	MMIO_D(_MMIO(_DPLL2_CFGCR1), D_SKL_PLUS);
+	MMIO_D(_MMIO(_DPLL3_CFGCR1), D_SKL_PLUS);
+	MMIO_D(_MMIO(_DPLL1_CFGCR2), D_SKL_PLUS);
+	MMIO_D(_MMIO(_DPLL2_CFGCR2), D_SKL_PLUS);
+	MMIO_D(_MMIO(_DPLL3_CFGCR2), D_SKL_PLUS);
+	MMIO_D(DPLL_CTRL1, D_SKL_PLUS);
+	MMIO_D(DPLL_CTRL2, D_SKL_PLUS);
+	MMIO_D(DPLL_STATUS, D_SKL_PLUS);
+	MMIO_D(SKL_PS_WIN_POS(PIPE_A, 0), D_SKL_PLUS);
+	MMIO_D(SKL_PS_WIN_POS(PIPE_A, 1), D_SKL_PLUS);
+	MMIO_D(SKL_PS_WIN_POS(PIPE_B, 0), D_SKL_PLUS);
+	MMIO_D(SKL_PS_WIN_POS(PIPE_B, 1), D_SKL_PLUS);
+	MMIO_D(SKL_PS_WIN_POS(PIPE_C, 0), D_SKL_PLUS);
+	MMIO_D(SKL_PS_WIN_POS(PIPE_C, 1), D_SKL_PLUS);
+	MMIO_D(SKL_PS_WIN_SZ(PIPE_A, 0), D_SKL_PLUS);
+	MMIO_D(SKL_PS_WIN_SZ(PIPE_A, 1), D_SKL_PLUS);
+	MMIO_D(SKL_PS_WIN_SZ(PIPE_B, 0), D_SKL_PLUS);
+	MMIO_D(SKL_PS_WIN_SZ(PIPE_B, 1), D_SKL_PLUS);
+	MMIO_D(SKL_PS_WIN_SZ(PIPE_C, 0), D_SKL_PLUS);
+	MMIO_D(SKL_PS_WIN_SZ(PIPE_C, 1), D_SKL_PLUS);
+	MMIO_D(SKL_PS_CTRL(PIPE_A, 0), D_SKL_PLUS);
+	MMIO_D(SKL_PS_CTRL(PIPE_A, 1), D_SKL_PLUS);
+	MMIO_D(SKL_PS_CTRL(PIPE_B, 0), D_SKL_PLUS);
+	MMIO_D(SKL_PS_CTRL(PIPE_B, 1), D_SKL_PLUS);
+	MMIO_D(SKL_PS_CTRL(PIPE_C, 0), D_SKL_PLUS);
+	MMIO_D(SKL_PS_CTRL(PIPE_C, 1), D_SKL_PLUS);
+	MMIO_D(PLANE_BUF_CFG(PIPE_A, 0), D_SKL_PLUS);
+	MMIO_D(PLANE_BUF_CFG(PIPE_A, 1), D_SKL_PLUS);
+	MMIO_D(PLANE_BUF_CFG(PIPE_A, 2), D_SKL_PLUS);
+	MMIO_D(PLANE_BUF_CFG(PIPE_A, 3), D_SKL_PLUS);
+	MMIO_D(PLANE_BUF_CFG(PIPE_B, 0), D_SKL_PLUS);
+	MMIO_D(PLANE_BUF_CFG(PIPE_B, 1), D_SKL_PLUS);
+	MMIO_D(PLANE_BUF_CFG(PIPE_B, 2), D_SKL_PLUS);
+	MMIO_D(PLANE_BUF_CFG(PIPE_B, 3), D_SKL_PLUS);
+	MMIO_D(PLANE_BUF_CFG(PIPE_C, 0), D_SKL_PLUS);
+	MMIO_D(PLANE_BUF_CFG(PIPE_C, 1), D_SKL_PLUS);
+	MMIO_D(PLANE_BUF_CFG(PIPE_C, 2), D_SKL_PLUS);
+	MMIO_D(PLANE_BUF_CFG(PIPE_C, 3), D_SKL_PLUS);
+	MMIO_D(CUR_BUF_CFG(PIPE_A), D_SKL_PLUS);
+	MMIO_D(CUR_BUF_CFG(PIPE_B), D_SKL_PLUS);
+	MMIO_D(CUR_BUF_CFG(PIPE_C), D_SKL_PLUS);
+	MMIO_F(PLANE_WM(PIPE_A, 0, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(PLANE_WM(PIPE_A, 1, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(PLANE_WM(PIPE_A, 2, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(PLANE_WM(PIPE_B, 0, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(PLANE_WM(PIPE_B, 1, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(PLANE_WM(PIPE_B, 2, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(PLANE_WM(PIPE_C, 0, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(PLANE_WM(PIPE_C, 1, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(PLANE_WM(PIPE_C, 2, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(CUR_WM(PIPE_A, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(CUR_WM(PIPE_B, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS);
+	MMIO_F(CUR_WM(PIPE_C, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS);
+	MMIO_D(PLANE_WM_TRANS(PIPE_A, 0), D_SKL_PLUS);
+	MMIO_D(PLANE_WM_TRANS(PIPE_A, 1), D_SKL_PLUS);
+	MMIO_D(PLANE_WM_TRANS(PIPE_A, 2), D_SKL_PLUS);
+	MMIO_D(PLANE_WM_TRANS(PIPE_B, 0), D_SKL_PLUS);
+	MMIO_D(PLANE_WM_TRANS(PIPE_B, 1), D_SKL_PLUS);
+	MMIO_D(PLANE_WM_TRANS(PIPE_B, 2), D_SKL_PLUS);
+	MMIO_D(PLANE_WM_TRANS(PIPE_C, 0), D_SKL_PLUS);
+	MMIO_D(PLANE_WM_TRANS(PIPE_C, 1), D_SKL_PLUS);
+	MMIO_D(PLANE_WM_TRANS(PIPE_C, 2), D_SKL_PLUS);
+	MMIO_D(CUR_WM_TRANS(PIPE_A), D_SKL_PLUS);
+	MMIO_D(CUR_WM_TRANS(PIPE_B), D_SKL_PLUS);
+	MMIO_D(CUR_WM_TRANS(PIPE_C), D_SKL_PLUS);
+	MMIO_D(PLANE_NV12_BUF_CFG(PIPE_A, 0), D_SKL_PLUS);
+	MMIO_D(PLANE_NV12_BUF_CFG(PIPE_A, 1), D_SKL_PLUS);
+	MMIO_D(PLANE_NV12_BUF_CFG(PIPE_A, 2), D_SKL_PLUS);
+	MMIO_D(PLANE_NV12_BUF_CFG(PIPE_A, 3), D_SKL_PLUS);
+	MMIO_D(PLANE_NV12_BUF_CFG(PIPE_B, 0), D_SKL_PLUS);
+	MMIO_D(PLANE_NV12_BUF_CFG(PIPE_B, 1), D_SKL_PLUS);
+	MMIO_D(PLANE_NV12_BUF_CFG(PIPE_B, 2), D_SKL_PLUS);
+	MMIO_D(PLANE_NV12_BUF_CFG(PIPE_B, 3), D_SKL_PLUS);
+	MMIO_D(PLANE_NV12_BUF_CFG(PIPE_C, 0), D_SKL_PLUS);
+	MMIO_D(PLANE_NV12_BUF_CFG(PIPE_C, 1), D_SKL_PLUS);
+	MMIO_D(PLANE_NV12_BUF_CFG(PIPE_C, 2), D_SKL_PLUS);
+	MMIO_D(PLANE_NV12_BUF_CFG(PIPE_C, 3), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C0(PIPE_A, 1)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C0(PIPE_A, 2)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C0(PIPE_A, 3)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C0(PIPE_A, 4)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C0(PIPE_B, 1)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C0(PIPE_B, 2)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C0(PIPE_B, 3)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C0(PIPE_B, 4)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C0(PIPE_C, 1)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C0(PIPE_C, 2)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C0(PIPE_C, 3)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C0(PIPE_C, 4)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C4(PIPE_A, 1)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C4(PIPE_A, 2)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C4(PIPE_A, 3)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C4(PIPE_A, 4)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C4(PIPE_B, 1)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C4(PIPE_B, 2)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C4(PIPE_B, 3)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C4(PIPE_B, 4)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C4(PIPE_C, 1)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C4(PIPE_C, 2)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C4(PIPE_C, 3)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_REG_701C4(PIPE_C, 4)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_CTL_3_A), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_CTL_3_B), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x72380), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x7239c), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_SURF_3_B), D_SKL_PLUS);
+	MMIO_D(DMC_SSP_BASE, D_SKL_PLUS);
+	MMIO_D(DMC_HTP_SKL, D_SKL_PLUS);
+	MMIO_D(DMC_LAST_WRITE, D_SKL_PLUS);
+	MMIO_DF(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS);
+	MMIO_D(SKL_DFSM, D_SKL_PLUS);
+	MMIO_D(DISPIO_CR_TX_BMU_CR0, D_SKL_PLUS);
+	MMIO_F(GEN9_GFX_MOCS(0), 0x7f8, F_CMD_ACCESS, 0, 0, D_SKL_PLUS);
+	MMIO_F(GEN7_L3CNTLREG2, 0x80, F_CMD_ACCESS, 0, 0, D_SKL_PLUS);
+	MMIO_D(RPM_CONFIG0, D_SKL_PLUS);
+	MMIO_D(_MMIO(0xd08), D_SKL_PLUS);
+	MMIO_D(RC6_LOCATION, D_SKL_PLUS);
+	MMIO_DF(GEN7_FF_SLICE_CS_CHICKEN1, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS=
);
+	MMIO_DF(GEN9_CS_DEBUG_MODE1, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS);
+	/* TRTT */
+	MMIO_DF(TRVATTL3PTRDW(0), D_SKL_PLUS, F_CMD_ACCESS);
+	MMIO_DF(TRVATTL3PTRDW(1), D_SKL_PLUS, F_CMD_ACCESS);
+	MMIO_DF(TRVATTL3PTRDW(2), D_SKL_PLUS, F_CMD_ACCESS);
+	MMIO_DF(TRVATTL3PTRDW(3), D_SKL_PLUS, F_CMD_ACCESS);
+	MMIO_DF(TRVADR, D_SKL_PLUS, F_CMD_ACCESS);
+	MMIO_DF(TRTTE, D_SKL_PLUS, F_CMD_ACCESS | F_PM_SAVE);
+	MMIO_DF(_MMIO(0x4dfc), D_SKL_PLUS, F_PM_SAVE);
+	MMIO_D(_MMIO(0x46430), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x46520), D_SKL_PLUS);
+	MMIO_D(_MMIO(0xc403c), D_SKL_PLUS);
+	MMIO_DF(GEN8_GARBCNTL, D_SKL_PLUS, F_CMD_ACCESS);
+	MMIO_D(DMA_CTRL, D_SKL_PLUS);
+	MMIO_D(_MMIO(0x65900), D_SKL_PLUS);
+	MMIO_D(GEN6_STOLEN_RESERVED, D_SKL_PLUS);
+	MMIO_D(_MMIO(0x4068), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x67054), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x6e560), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x6e554), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x2b20), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x65f00), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x65f08), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x320f0), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x70034), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x71034), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x72034), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_KEYVAL_1(PIPE_A)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_KEYVAL_1(PIPE_B)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_KEYVAL_1(PIPE_C)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_KEYMAX_1(PIPE_A)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_KEYMAX_1(PIPE_B)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_KEYMAX_1(PIPE_C)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_A)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_B)), D_SKL_PLUS);
+	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_C)), D_SKL_PLUS);
+	MMIO_D(_MMIO(0x44500), D_SKL_PLUS);
+#define CSFE_CHICKEN1_REG(base) _MMIO((base) + 0xD4)
+	MMIO_RING_DF(CSFE_CHICKEN1_REG, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS);
+#undef CSFE_CHICKEN1_REG
+	MMIO_DF(GEN8_HDC_CHICKEN1, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS);
+	MMIO_DF(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS);
+	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS & ~D_BXT);
+
+	return 0;
+}
+
+static int init_bxt_mmio_info(struct intel_gvt *gvt)
+{
+	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
+	int ret;
+
+	MMIO_F(_MMIO(0x80000), 0x3000, 0, 0, 0, D_BXT);
+	MMIO_D(GEN7_SAMPLER_INSTDONE, D_BXT);
+	MMIO_D(GEN7_ROW_INSTDONE, D_BXT);
+	MMIO_D(GEN8_FAULT_TLB_DATA0, D_BXT);
+	MMIO_D(GEN8_FAULT_TLB_DATA1, D_BXT);
+	MMIO_D(ERROR_GEN6, D_BXT);
+	MMIO_D(DONE_REG, D_BXT);
+	MMIO_D(EIR, D_BXT);
+	MMIO_D(PGTBL_ER, D_BXT);
+	MMIO_D(_MMIO(0x4194), D_BXT);
+	MMIO_D(_MMIO(0x4294), D_BXT);
+	MMIO_D(_MMIO(0x4494), D_BXT);
+	MMIO_RING_D(RING_PSMI_CTL, D_BXT);
+	MMIO_RING_D(RING_DMA_FADD, D_BXT);
+	MMIO_RING_D(RING_DMA_FADD_UDW, D_BXT);
+	MMIO_RING_D(RING_IPEHR, D_BXT);
+	MMIO_RING_D(RING_INSTPS, D_BXT);
+	MMIO_RING_D(RING_BBADDR_UDW, D_BXT);
+	MMIO_RING_D(RING_BBSTATE, D_BXT);
+	MMIO_RING_D(RING_IPEIR, D_BXT);
+	MMIO_F(SOFT_SCRATCH(0), 16 * 4, 0, 0, 0, D_BXT);
+	MMIO_D(BXT_P_CR_GT_DISP_PWRON, D_BXT);
+	MMIO_D(BXT_RP_STATE_CAP, D_BXT);
+	MMIO_D(BXT_PHY_CTL_FAMILY(DPIO_PHY0), D_BXT);
+	MMIO_D(BXT_PHY_CTL_FAMILY(DPIO_PHY1), D_BXT);
+	MMIO_D(BXT_PHY_CTL(PORT_A), D_BXT);
+	MMIO_D(BXT_PHY_CTL(PORT_B), D_BXT);
+	MMIO_D(BXT_PHY_CTL(PORT_C), D_BXT);
+	MMIO_D(BXT_PORT_PLL_ENABLE(PORT_A), D_BXT);
+	MMIO_D(BXT_PORT_PLL_ENABLE(PORT_B), D_BXT);
+	MMIO_D(BXT_PORT_PLL_ENABLE(PORT_C), D_BXT);
+	MMIO_D(BXT_PORT_CL1CM_DW0(DPIO_PHY0), D_BXT);
+	MMIO_D(BXT_PORT_CL1CM_DW9(DPIO_PHY0), D_BXT);
+	MMIO_D(BXT_PORT_CL1CM_DW10(DPIO_PHY0), D_BXT);
+	MMIO_D(BXT_PORT_CL1CM_DW28(DPIO_PHY0), D_BXT);
+	MMIO_D(BXT_PORT_CL1CM_DW30(DPIO_PHY0), D_BXT);
+	MMIO_D(BXT_PORT_CL2CM_DW6(DPIO_PHY0), D_BXT);
+	MMIO_D(BXT_PORT_REF_DW3(DPIO_PHY0), D_BXT);
+	MMIO_D(BXT_PORT_REF_DW6(DPIO_PHY0), D_BXT);
+	MMIO_D(BXT_PORT_REF_DW8(DPIO_PHY0), D_BXT);
+	MMIO_D(BXT_PORT_CL1CM_DW0(DPIO_PHY1), D_BXT);
+	MMIO_D(BXT_PORT_CL1CM_DW9(DPIO_PHY1), D_BXT);
+	MMIO_D(BXT_PORT_CL1CM_DW10(DPIO_PHY1), D_BXT);
+	MMIO_D(BXT_PORT_CL1CM_DW28(DPIO_PHY1), D_BXT);
+	MMIO_D(BXT_PORT_CL1CM_DW30(DPIO_PHY1), D_BXT);
+	MMIO_D(BXT_PORT_CL2CM_DW6(DPIO_PHY1), D_BXT);
+	MMIO_D(BXT_PORT_REF_DW3(DPIO_PHY1), D_BXT);
+	MMIO_D(BXT_PORT_REF_DW6(DPIO_PHY1), D_BXT);
+	MMIO_D(BXT_PORT_REF_DW8(DPIO_PHY1), D_BXT);
+	MMIO_D(BXT_PORT_PLL_EBB_0(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_PLL_EBB_4(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW10_LN01(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW10_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW12_LN01(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW12_LN23(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW12_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW2_LN0(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW2_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW3_LN0(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW3_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW4_LN0(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW4_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 1), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 2), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 3), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 0), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 1), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 2), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 3), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 6), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 8), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 9), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 10), D_BXT);
+	MMIO_D(BXT_PORT_PLL_EBB_0(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_PLL_EBB_4(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW10_LN01(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW10_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW12_LN01(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW12_LN23(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW12_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW2_LN0(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW2_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW3_LN0(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW3_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW4_LN0(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW4_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 1), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 2), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 3), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 0), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 1), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 2), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 3), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 6), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 8), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 9), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 10), D_BXT);
+	MMIO_D(BXT_PORT_PLL_EBB_0(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_PLL_EBB_4(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW10_LN01(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW10_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW12_LN01(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW12_LN23(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_PCS_DW12_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW2_LN0(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW2_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW3_LN0(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW3_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW4_LN0(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW4_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 0), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 1), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 2), D_BXT);
+	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 3), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 0), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 1), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 2), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 3), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 6), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 8), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 9), D_BXT);
+	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 10), D_BXT);
+	MMIO_D(BXT_DE_PLL_CTL, D_BXT);
+	MMIO_D(BXT_DE_PLL_ENABLE, D_BXT);
+	MMIO_D(BXT_DSI_PLL_CTL, D_BXT);
+	MMIO_D(BXT_DSI_PLL_ENABLE, D_BXT);
+	MMIO_D(GEN9_CLKGATE_DIS_0, D_BXT);
+	MMIO_D(GEN9_CLKGATE_DIS_4, D_BXT);
+	MMIO_D(HSW_TVIDEO_DIP_GCP(TRANSCODER_A), D_BXT);
+	MMIO_D(HSW_TVIDEO_DIP_GCP(TRANSCODER_B), D_BXT);
+	MMIO_D(HSW_TVIDEO_DIP_GCP(TRANSCODER_C), D_BXT);
+	MMIO_D(RC6_CTX_BASE, D_BXT);
+	MMIO_D(GEN8_PUSHBUS_CONTROL, D_BXT);
+	MMIO_D(GEN8_PUSHBUS_ENABLE, D_BXT);
+	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
+	MMIO_D(GEN6_GFXPAUSE, D_BXT);
+	MMIO_DF(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS);
+	MMIO_DF(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS);
+	MMIO_DF(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS);
+	MMIO_F(GEN8_RING_CS_GPR(RENDER_RING_BASE, 0), 0x40, F_CMD_ACCESS,
+	       0, 0, D_BXT);
+	MMIO_F(GEN8_RING_CS_GPR(GEN6_BSD_RING_BASE, 0), 0x40, F_CMD_ACCESS,
+	       0, 0, D_BXT);
+	MMIO_F(GEN8_RING_CS_GPR(BLT_RING_BASE, 0), 0x40, F_CMD_ACCESS,
+	       0, 0, D_BXT);
+	MMIO_F(GEN8_RING_CS_GPR(VEBOX_RING_BASE, 0), 0x40, F_CMD_ACCESS,
+	       0, 0, D_BXT);
+	MMIO_DF(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS);
+	MMIO_D(GEN8_PRIVATE_PAT_LO, D_BXT);
+
+	return 0;
+}
+
+/* Special MMIO blocks. registers in MMIO block ranges should not be comma=
nd
+ * accessible (should have no F_CMD_ACCESS flag).
+ * otherwise, need to update cmd_reg_handler in cmd_parser.c
+ */
+static struct gvt_mmio_block mmio_blocks[] =3D {
+	{D_SKL_PLUS, _MMIO(DMC_MMIO_START_RANGE), 0x3000, NULL, NULL},
+	{D_ALL, _MMIO(MCHBAR_MIRROR_BASE_SNB), 0x40000, NULL, NULL},
+	{D_ALL, _MMIO(VGT_PVINFO_PAGE), VGT_PVINFO_SIZE, NULL, NULL},
+	{D_ALL, LGC_PALETTE(PIPE_A, 0), 1024, NULL, NULL},
+	{D_ALL, LGC_PALETTE(PIPE_B, 0), 1024, NULL, NULL},
+	{D_ALL, LGC_PALETTE(PIPE_C, 0), 1024, NULL, NULL},
+};
+
+/**
+ * intel_gvt_clean_mmio_info - clean up MMIO information table for GVT dev=
ice
+ * @gvt: GVT device
+ *
+ * This function is called at the driver unloading stage, to clean up the =
MMIO
+ * information table of GVT device
+ *
+ */
+void intel_gvt_clean_mmio_info(struct intel_gvt *gvt)
+{
+	struct hlist_node *tmp;
+	struct intel_gvt_mmio_info *e;
+	int i;
+
+	hash_for_each_safe(gvt->mmio.mmio_info_table, i, tmp, e, node)
+		kfree(e);
+
+	vfree(gvt->mmio.mmio_attribute);
+	gvt->mmio.mmio_attribute =3D NULL;
+}
+
+/**
+ * intel_gvt_setup_mmio_table - setup MMIO information table for GVT devic=
e
+ * @gvt: GVT device
+ *
+ * This function is called at the initialization stage, to setup the MMIO
+ * information table for GVT device
+ *
+ * Returns:
+ * zero on success, negative if failed.
+ */
+int intel_gvt_setup_mmio_info(struct intel_gvt *gvt)
+{
+	struct intel_gvt_device_info *info =3D &gvt->device_info;
+	struct drm_i915_private *i915 =3D gvt->gt->i915;
+	int size =3D info->mmio_size / 4 * sizeof(*gvt->mmio.mmio_attribute);
+	int ret;
+
+	gvt->mmio.mmio_attribute =3D vzalloc(size);
+	if (!gvt->mmio.mmio_attribute)
+		return -ENOMEM;
+
+	ret =3D init_generic_mmio_info(gvt);
+	if (ret)
+		goto err;
+
+	if (IS_BROADWELL(i915)) {
+		ret =3D init_bdw_mmio_info(gvt);
+		if (ret)
+			goto err;
+	} else if (IS_SKYLAKE(i915) ||
+		   IS_KABYLAKE(i915) ||
+		   IS_COFFEELAKE(i915) ||
+		   IS_COMETLAKE(i915)) {
+		ret =3D init_bdw_mmio_info(gvt);
+		if (ret)
+			goto err;
+		ret =3D init_skl_mmio_info(gvt);
+		if (ret)
+			goto err;
+	} else if (IS_BROXTON(i915)) {
+		ret =3D init_bdw_mmio_info(gvt);
+		if (ret)
+			goto err;
+		ret =3D init_skl_mmio_info(gvt);
+		if (ret)
+			goto err;
+		ret =3D init_bxt_mmio_info(gvt);
+		if (ret)
+			goto err;
+	}
+
+	gvt->mmio.mmio_block =3D mmio_blocks;
+	gvt->mmio.num_mmio_block =3D ARRAY_SIZE(mmio_blocks);
+
+	return 0;
+err:
+	intel_gvt_clean_mmio_info(gvt);
+	return ret;
+}
diff --git a/drivers/gpu/drm/i915/gvt/mmio_info_table.h b/drivers/gpu/drm/i=
915/gvt/mmio_info_table.h
new file mode 100644
index 000000000000..1c78ab1906c4
--- /dev/null
+++ b/drivers/gpu/drm/i915/gvt/mmio_info_table.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software=
"),
+ * to deal in the Software without restriction, including without limitati=
on
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the ne=
xt
+ * paragraph) shall be included in all copies or substantial portions of t=
he
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHAL=
L
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN THE
+ * SOFTWARE.
+ *
+ */
+
+#ifndef _GVT_MMIO_INFO_TABLE_H_
+#define _GVT_MMIO_INFO_TABLE_H_
+
+unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt);
+bool intel_gvt_match_device(struct intel_gvt *gvt, unsigned long device);
+struct intel_gvt_mmio_info *intel_gvt_find_mmio_info(struct intel_gvt *gvt=
,
+						     unsigned int offset);
+int intel_gvt_setup_mmio_info(struct intel_gvt *gvt);
+void intel_gvt_clean_mmio_info(struct intel_gvt *gvt);
+
+#endif
diff --git a/drivers/gpu/drm/i915/gvt/reg.h b/drivers/gpu/drm/i915/gvt/reg.=
h
index 244cc7320b54..cfa060c22e6d 100644
--- a/drivers/gpu/drm/i915/gvt/reg.h
+++ b/drivers/gpu/drm/i915/gvt/reg.h
@@ -133,6 +133,13 @@
 #define RING_GFX_MODE(base)	_MMIO((base) + 0x29c)
 #define VF_GUARDBAND		_MMIO(0x83a4)
=20
-
 #define BCS_TILE_REGISTER_VAL_OFFSET (0x43*4)
+
+/* XXX FIXME i915 has changed PP_XXX definition */
+#define PCH_PP_STATUS  _MMIO(0xc7200)
+#define PCH_PP_CONTROL _MMIO(0xc7204)
+#define PCH_PP_ON_DELAYS _MMIO(0xc7208)
+#define PCH_PP_OFF_DELAYS _MMIO(0xc720c)
+#define PCH_PP_DIVISOR _MMIO(0xc7210)
+
 #endif
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_=
gvt.c
index 4e70c1a9ef2e..008a59298a7c 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -86,6 +86,23 @@ void intel_gvt_sanitize_options(struct drm_i915_private =
*dev_priv)
 	dev_priv->params.enable_gvt =3D 0;
 }
=20
+static void init_device_info(struct intel_gvt *gvt)
+{
+	struct intel_gvt_device_info *info =3D &gvt->device_info;
+	struct pci_dev *pdev =3D to_pci_dev(gvt->gt->i915->drm.dev);
+
+	info->max_support_vgpus =3D 8;
+	info->cfg_space_size =3D PCI_CFG_SPACE_EXP_SIZE;
+	info->mmio_size =3D 2 * 1024 * 1024;
+	info->mmio_bar =3D 0;
+	info->gtt_start_offset =3D 8 * 1024 * 1024;
+	info->gtt_entry_size =3D 8;
+	info->gtt_entry_size_shift =3D 3;
+	info->gmadr_bytes_in_cmd =3D 8;
+	info->max_surface_size =3D 36 * 1024 * 1024;
+	info->msi_cap_offset =3D pdev->msi_cap;
+}
+
 /**
  * intel_gvt_init - initialize GVT components
  * @dev_priv: drm i915 private data
@@ -98,6 +115,7 @@ void intel_gvt_sanitize_options(struct drm_i915_private =
*dev_priv)
  */
 int intel_gvt_init(struct drm_i915_private *dev_priv)
 {
+	struct intel_gvt *gvt =3D NULL;
 	int ret;
=20
 	if (i915_inject_probe_failure(dev_priv))
@@ -115,15 +133,32 @@ int intel_gvt_init(struct drm_i915_private *dev_priv)
 		return -EIO;
 	}
=20
+	gvt =3D kzalloc(sizeof(struct intel_gvt), GFP_KERNEL);
+	if (!gvt)
+		return -ENOMEM;
+
+	gvt->gt =3D &dev_priv->gt;
+
+	init_device_info(gvt);
+
+	ret =3D intel_gvt_setup_mmio_info(gvt);
+	if (ret)
+		goto err_setup_mmio_info;
+
+	dev_priv->gvt =3D gvt;
+
 	ret =3D intel_gvt_init_device(dev_priv);
 	if (ret) {
 		drm_dbg(&dev_priv->drm, "Fail to init GVT device\n");
-		goto bail;
+		goto err_init_device;
 	}
=20
 	return 0;
=20
-bail:
+err_init_device:
+	intel_gvt_clean_mmio_info(gvt);
+err_setup_mmio_info:
+	kfree(gvt);
 	dev_priv->params.enable_gvt =3D 0;
 	return 0;
 }
@@ -147,6 +182,9 @@ void intel_gvt_driver_remove(struct drm_i915_private *d=
ev_priv)
 		return;
=20
 	intel_gvt_clean_device(dev_priv);
+	intel_gvt_clean_mmio_info(dev_priv->gvt);
+	kfree(dev_priv->gvt);
+	dev_priv->gvt =3D NULL;
 }
=20
 /**
--=20
2.25.1

