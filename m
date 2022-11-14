Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8031A627CA0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 12:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B72810E034;
	Mon, 14 Nov 2022 11:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C3110E034;
 Mon, 14 Nov 2022 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668426274; x=1699962274;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=opNL3psLcdWSwx9lea/TpujjO3yTGnXG9b63JEd42wg=;
 b=RxqaVElqZxRS4Ry6mVn1xh0w7bweMxbyA647TadH96HWEwrY/TvZ33Qj
 I3B2eDP8DVDIXroHI5bxBFSxvnL7dqpIJvoWdAQQIXk8EbGs6EtPG7uEo
 +WBdmylUey2e9iwEJhE6z4ZXgZHQ2nVA/ejeRw6UHLzvACJecOxEA3T9W
 I2OOuoJlJickYGAYFmeCSz3aWMeIPIyjV/lwDzGoIyJ0Vmf233NGqchW8
 kaPqlzRqOG8rylYbvSLmnTzIktV8kmdECcme0+dxxX7D7P5INOA7Rq/S/
 z5Yi86TGgx9ff3/ReUk2D0drjPCbGg3m+isHeOlQ9eP+BB54ZEd0xzDfY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="313094618"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="313094618"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 03:44:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="669620313"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="669620313"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 14 Nov 2022 03:44:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 03:44:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 03:44:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 03:44:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzdnQU1+aH61q+HzZiXb75X0OykWc9gxacTxZcJxHjzUjDR7J2EeTPyb4bTKJAElKjTJ/nOx8oJw1+NkKZMnri3+MN8llOeIjzoT67tU9jvQtHbsEBoXwwM/xZEOlAvOIbXUbNpfF9AWpLq+fQQ4FOA+ADZLV2tGFHOJyTVGKhfAOWGOmIj9N0/iSILj+PwXZss2emqlPlK9b33iYc3T8gCwWSh5F1zJ0PSKribdqFJp/T5wYRH+d7pL6XaK70S84Y9YjYC0SxXsKUfbDJPN9KSuHy+RR2fzwexDxA3edubwguiK3Wi4DFQD+Ud55CbfW8bh6BRiiPj966NjGfIapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/B1fjQWV13gkCpyAQNHzlF2NjCm61qbxpl3PedpmnU=;
 b=aewsq3H406IbBoUlxOaJNj5ilz5Za8UeKw46dKAr/R+BBDPOnSFrBIOLK3dT0UHoInQtxw2+JdMAIMi/ewsHbZLVFo56gYqpppsVgIPjqmMeYvrALeoB3/QMudyn+OyGwWBeZKkf0B8FWJ1t10rVemCshQXsJ5HOcAm76khP8RKepS0qxtnfFUiPjmnsuuXe5/ndhu+ieFN7xnuIlhe5NnEgEv0NxXSyFNGotLqGU+JAkDd5kEWtt5S1CPN/wHddStFmTchs7/q67x27mH/3iw2rlUY5nhHXqEAP7ZZYrEPBUq6DpchBNbTzbU9r0wlZu7KKeC45M66B8S81jzWsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS7PR11MB6200.namprd11.prod.outlook.com (2603:10b6:8:98::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 14 Nov
 2022 11:44:31 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::7d38:853:2b5c:92ae]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::7d38:853:2b5c:92ae%8]) with mapi id 15.20.5813.013; Mon, 14 Nov 2022
 11:44:31 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
Subject: RE: [PATCH v2] drm/i915/mtl: Add Wa_14017073508 for SAMedia
Thread-Topic: [PATCH v2] drm/i915/mtl: Add Wa_14017073508 for SAMedia
Thread-Index: AQHY77QPqE8LI2SU/EmDlrcawlvt0K4vDMsAgA9QZbA=
Date: Mon, 14 Nov 2022 11:44:31 +0000
Message-ID: <CY5PR11MB6211481B3D07AB1DC696FA9195059@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20221103184559.2306481-1-badal.nilawar@intel.com>
 <Y2VRMD+OZ7GQvP7C@intel.com>
In-Reply-To: <Y2VRMD+OZ7GQvP7C@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DS7PR11MB6200:EE_
x-ms-office365-filtering-correlation-id: c7d16a02-c096-46bf-ee7e-08dac635983f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iyY+IjLyK0s335ASgF0ZFVzHjoNqIpiEiCmIoAX8FV9F2fwif9mfRAff6I+DoF89uyBiS8Nf0ga8UEzOxNUspFbQFd9vVRFqlP2aF7bvohcZERhDTC84cIHuAL1JcZ9NDIGdqnKhE+hYnWamc0X9RpPgKvfyo7PLEg6ycOKsb6v5VhuubCVzznh6hsO1A9jba8KAUOIoiXC8U5cXuNH3+HAYFPXEMS5XUTc13WjYVJV+XOvpcDhAetmFN74Yiujk/R3hN/GpX/8Vm6JCm76wkB9p4UykzGf9a4f6DPMN6CwQ8OA/srsDgd7DIwVhg+WkYYkui/SHOfSX6Fywv9dZWGJJoXKE6VMWC86QCmf5HqRziJnT/hBmz1Re9m66a1+B+QI5tlZwDXcO3ZaUOuuB9rnaaKqRk/n4m2hs+SdmRdtJH0trfB5X9CzLxk7LSrAp2Q0UBjcgcNwTSKbl5dApRgwxSSanZnGxZOf7J5xeEM4jchrEHRqKhpPgwiN/wEnSuS0rQLH4YCggNQ+4OPWi6D10iFeiFXLzhf/T45uPrMEY0LvLCnF8Cp2bbX6PDMHhf/R/k4WNsedK07zwTP0aw0rn9+VMQObO72d8P7YzFCGz72//PjUi+/6BXDLy+QGaKEsPf2UtEM+/1gxanXg7cjRddNzLEOmmeyNNbWdIWlPQZx2OyV4V/OWP050t6hAWNOANoO3+ZJrXh+MJvJnu59KVa4LcqBAaDwKuOzaUMHDB/2dgzZDNhsj1Zh/sh6ZaXZ+Nu5IXR74g1FRAWlIWkw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199015)(316002)(186003)(86362001)(8936002)(2906002)(7696005)(6506007)(122000001)(38100700002)(8676002)(478600001)(71200400001)(5660300002)(38070700005)(52536014)(41300700001)(83380400001)(82960400001)(6636002)(54906003)(110136005)(55016003)(76116006)(26005)(55236004)(450100002)(9686003)(4326008)(66946007)(66556008)(66476007)(66446008)(64756008)(33656002)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WmRPENhIRT930vxCjMu1tukzKp5vm31OLN3MAS9UlKrwts+XzC5NPFKZ2EdG?=
 =?us-ascii?Q?6Sf2JLsgv8RUryk9govLmBZcs/UtiR8UvZebWob6P1JmKm9fbTZG7EMJhMKr?=
 =?us-ascii?Q?Svfl/oj+zm0TtfasyQ7PvKBm2K3WXiRkF3HP4Y2F9MAYb8qbl0EM2pxJTTJh?=
 =?us-ascii?Q?9jt74zVbG4JptXge1TYJaVSQlHUnzL5HZEL2XL5T8PzhTPJBYk20FtWoFSQo?=
 =?us-ascii?Q?bwDoN0qBSCGozuv94q/sYHwtL57/HW+QE4DFpk4tH+Ea8S8NzH62W9MIgpEx?=
 =?us-ascii?Q?wONz9sobE1ksHL3STD7OzrZVm2v45wiLV5/Vy7gUpHPUan8OQCCCZDrPH6IO?=
 =?us-ascii?Q?0Avc/TjetkkRdOIH3/rbHjgw/tdMKmld739USapJJd4oJ4Gzjw53rXTwCLr4?=
 =?us-ascii?Q?FS7ml0EncmPMThueAGFI/7bAa/m5FtQ/ouxU8e16+BcyRYT1wkiTC5SssXQl?=
 =?us-ascii?Q?ocLYhFsWbJk9+dqWjeHWFpLt2wdNJ41gXsXhstJuwBWOLkWHz0gxwaDVhq1D?=
 =?us-ascii?Q?eSetYV5EXIIWd2081137R+Mm5exi9QdnUEAXZJb0POIUHjTwwa81OgnDL5pB?=
 =?us-ascii?Q?YvQqGoNVvnJ+oJpvyYBow+hSyrigFY87cVQ29oM42bHMVzRl6c88UDmzJ+jY?=
 =?us-ascii?Q?Ur50IFMsKRmRJ1pnwT0N92HAYdObdq4MrVW8PgZ4JXGy8PEFHFjk/M3LtEEf?=
 =?us-ascii?Q?4ATETd9/bmCia6P2K3P4XgOychDqwZTWiEZnst0rtcuaHRQxXerfwpp8FJUR?=
 =?us-ascii?Q?/lDikkqF0BV57MReSxkvUICp15WJEZZppRb7Vd5zdsWrjnQegofYL09D3mzm?=
 =?us-ascii?Q?qHkit8A/9N8m+PU4vBuaVUFnanzVN1n/TJdfp+AROJy6IrTkhpddMXevM1a9?=
 =?us-ascii?Q?tJUSmFYTcNzMXvogDnxW9TPzgrB/8vlanqwAY0EnZEX7PSi+nqEji6aquHP5?=
 =?us-ascii?Q?yIYhVt/9+u0ThuEAefQcCu3xMa+3iS3iiRw+FKrf2LSMndYW0firIw6UWouC?=
 =?us-ascii?Q?2UhNAEsN5DJC7d/Hh7pvk/0OVsGjWY/vWC41qX9Kjlw25MxuLJNr6U95I2uy?=
 =?us-ascii?Q?le9evTtjOv0fSYxWwedc0A8JbZTU/UFMcoScGmUrnPGHhQIoeZOlmy/r0kFy?=
 =?us-ascii?Q?6BjtDIwcHJCE3+/pq2lFVJdedfBkkScydFKce0ZOx+1BpW2/1Tc23oU6Aers?=
 =?us-ascii?Q?+hxMiflB0jwtXf9syckeVdP43C3p5QoISE0FAgUAwkBXSMrIX5S+tXcDvdVK?=
 =?us-ascii?Q?iB5BY+lD5cj3WDK1YnDft00pY9GaYU+y9WZDJsG0cMw1cgmg8vaQolQ7Nosx?=
 =?us-ascii?Q?WyELmUUoCj1CDwV5TF2mrkSiuwyF0n5/MGdLRMT/Ho5yZWybCatgWpztsSsr?=
 =?us-ascii?Q?mLVgb2gA5BGfvDLSq5JekvEDgJX0ThOVpLqf2q7oyVLFxnUYvt2bKzkIcNhj?=
 =?us-ascii?Q?8EWjmINY6ounPhvLTrWbTu0wxLuU8iAHH52sio06coJiqVX7IYi93At0EW3V?=
 =?us-ascii?Q?K2m1HyBkRAIgALMB5UibjeF4hrOjTMr/GCt9YoGC5eSoBZNaKEq8tiIeDCCk?=
 =?us-ascii?Q?9bO8O/9k0ujDQX23FYzJU58TEBweGQdSzKvEV3bu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d16a02-c096-46bf-ee7e-08dac635983f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 11:44:31.6083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nq5MIjYpfGENs9eJv3pYJGGddxefti4awB8dABg2NLNRDaRuOmSU754B5JpWAAhylOzmFra2AT4/MlMWwvYbHdnFH9QB8wyyuoWTsxuMUfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6200
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
Cc: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>, "Ewins, Jon" <jon.ewins@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Friday, November 4, 2022 11:22 PM
> To: Nilawar, Badal <badal.nilawar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Ewins, Jon <jon.ewins@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; Sripada, Radhakrishna
> <radhakrishna.sripada@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH v2] drm/i915/mtl: Add Wa_14017073508 for SAMedia
>=20
>=20
> On Fri, Nov 04, 2022 at 12:15:59AM +0530, Badal Nilawar wrote:
> > This workaround is added for Media tile of MTL A step. It is to help
> > pcode workaround which handles the hardware issue seen during package
> > C2/C3 transitions due to RC6 entry/exit transitions on Media tile. As
> > a part of workaround pcode expect kmd to send mailbox message "media
> > busy" when components of Media tile are in use and "media idle"
> otherwise.
> > As per workaround description gucrc need to be disabled so enabled
> > host based RC for Media tile.
> >
> > v2:
> >  - Correct workaround id (Matt)
> >  - Fix review comments (Rodrigo)
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
CI is green,=20
Pushed to drm-intel-gt-next.

Thanks,
Anshuman Gupta.
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 27
> +++++++++++++++++++++++
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 13 ++++++++++-
> >  drivers/gpu/drm/i915/i915_drv.h           |  4 ++++
> >  drivers/gpu/drm/i915/i915_reg.h           |  9 ++++++++
> >  4 files changed, 52 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > index f553e2173bda..833b7682643f 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > @@ -19,10 +19,31 @@
> >  #include "intel_rc6.h"
> >  #include "intel_rps.h"
> >  #include "intel_wakeref.h"
> > +#include "intel_pcode.h"
> >  #include "pxp/intel_pxp_pm.h"
> >
> >  #define I915_GT_SUSPEND_IDLE_TIMEOUT (HZ / 2)
> >
> > +static void mtl_media_busy(struct intel_gt *gt) {
> > +	/* Wa_14017073508: mtl */
> > +	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> > +	    gt->type =3D=3D GT_MEDIA)
> > +		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
> > +				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
> > +
> PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0); }
> > +
> > +static void mtl_media_idle(struct intel_gt *gt) {
> > +	/* Wa_14017073508: mtl */
> > +	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> > +	    gt->type =3D=3D GT_MEDIA)
> > +		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
> > +
> PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
> > +
> PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0); }
> > +
> >  static void user_forcewake(struct intel_gt *gt, bool suspend)  {
> >  	int count =3D atomic_read(&gt->user_wakeref); @@ -70,6 +91,9 @@
> static
> > int __gt_unpark(struct intel_wakeref *wf)
> >
> >  	GT_TRACE(gt, "\n");
> >
> > +	/* Wa_14017073508: mtl */
> > +	mtl_media_busy(gt);
> > +
> >  	/*
> >  	 * It seems that the DMC likes to transition between the DC states a
> lot
> >  	 * when there are no connected displays (no active power domains)
> > during @@ -119,6 +143,9 @@ static int __gt_park(struct intel_wakeref
> *wf)
> >  	GEM_BUG_ON(!wakeref);
> >  	intel_display_power_put_async(i915, POWER_DOMAIN_GT_IRQ,
> wakeref);
> >
> > +	/* Wa_14017073508: mtl */
> > +	mtl_media_idle(gt);
> > +
> >  	return 0;
> >  }
> >
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> > b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> > index 8f8dd05835c5..b5855091cf6a 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> > @@ -11,9 +11,20 @@
> >
> >  static bool __guc_rc_supported(struct intel_guc *guc)  {
> > +	struct intel_gt *gt =3D guc_to_gt(guc);
> > +
> > +	/*
> > +	 * Wa_14017073508: mtl
> > +	 * Do not enable gucrc to avoid additional interrupts which
> > +	 * may disrupt pcode wa.
> > +	 */
> > +	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> > +	    gt->type =3D=3D GT_MEDIA)
> > +		return false;
> > +
> >  	/* GuC RC is unavailable for pre-Gen12 */
> >  	return guc->submission_supported &&
> > -		GRAPHICS_VER(guc_to_gt(guc)->i915) >=3D 12;
> > +		GRAPHICS_VER(gt->i915) >=3D 12;
> >  }
> >
> >  static bool __guc_rc_selected(struct intel_guc *guc) diff --git
> > a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 05b3300cc4ed..659b92382ff2 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -740,6 +740,10 @@ IS_SUBPLATFORM(const struct drm_i915_private
> > *i915,  #define IS_XEHPSDV_GRAPHICS_STEP(__i915, since, until) \
> >  	(IS_XEHPSDV(__i915) && IS_GRAPHICS_STEP(__i915, since, until))
> >
> > +#define IS_MTL_GRAPHICS_STEP(__i915, variant, since, until) \
> > +	(IS_SUBPLATFORM(__i915, INTEL_METEORLAKE,
> INTEL_SUBPLATFORM_##variant) && \
> > +	 IS_GRAPHICS_STEP(__i915, since, until))
> > +
> >  /*
> >   * DG2 hardware steppings are a bit unusual.  The hardware design was
> forked to
> >   * create three variants (G10, G11, and G12) which each have distinct
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> > b/drivers/gpu/drm/i915/i915_reg.h index 765a10e0de88..23d732413919
> > 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -6679,6 +6679,15 @@
> >  /*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
> >  #define     PCODE_MBOX_DOMAIN_NONE		0x0
> >  #define     PCODE_MBOX_DOMAIN_MEDIAFF		0x3
> > +
> > +/* Wa_14017210380: mtl */
> > +#define   PCODE_MBOX_GT_STATE			0x50
> > +/* sub-commands (param1) */
> > +#define     PCODE_MBOX_GT_STATE_MEDIA_BUSY	0x1
> > +#define     PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY	0x2
> > +/* param2 */
> > +#define     PCODE_MBOX_GT_STATE_DOMAIN_MEDIA	0x1
> > +
> >  #define GEN6_PCODE_DATA
> 	_MMIO(0x138128)
> >  #define   GEN6_PCODE_FREQ_IA_RATIO_SHIFT	8
> >  #define   GEN6_PCODE_FREQ_RING_RATIO_SHIFT	16
> > --
> > 2.25.1
> >
