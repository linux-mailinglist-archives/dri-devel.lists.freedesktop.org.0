Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B279D4EC3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 15:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1D510E986;
	Thu, 21 Nov 2024 14:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLG59e60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C1110E979;
 Thu, 21 Nov 2024 14:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732199999; x=1763735999;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sr2cI1TqzTvRKzr0TPn7EgM8Ymz5FlZRZu0jJo6IHxA=;
 b=bLG59e60MEnRlAP7ZdWUJFt6O0tsGvF+ynkj/mamY7o59TZzn5YlTeTG
 Xwn+sw8Deq7t7OhkdauB0r1adOsWTAmxp0qCzzATa6NPyN9lJ3NRxh1Hd
 W8OT3IPGdeIYdWajvui5wD9qppeJc1bsMKODW8/mLumc7lyL3cbMKgK1f
 jcgG1ILg0Iw+IOTq8iEP+lGjdRJkxRezvp1J1JwG9jtNJbKdWSD4+4Kqk
 +Uia1RsMqFfnCImj+BQifMtcHxNBvfxak0iYEPxUu2iS3w6f76HWWrKiF
 ILPNCsC12ADde1npeHvbCNYkRv4L9zlkREDKLnYOYv8n8hDmO325xeW9R Q==;
X-CSE-ConnectionGUID: JOx7OL3PS0uSNBOWGnH6Aw==
X-CSE-MsgGUID: 0eDoXKe1TGOH91AH0IZAnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54816451"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="54816451"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 06:39:59 -0800
X-CSE-ConnectionGUID: sLkulF7ES9amIL0pZbRlUA==
X-CSE-MsgGUID: hwhDb96RSo6PO6tb3LTGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="89872411"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 06:39:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 06:39:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 06:39:58 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 06:39:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yu3iYx6o1jLC2BW9jU1D4aidsxWtlrDjLlTW2MO28u/0dL6+tznRoP5gpSkBLAME0ETuAzSvk4WXmP1PmH+N20bfX5dULtuOyl1pDiHxyv3QEtcXAX9nJXpMpnvwKF0BR6gME3ZvihWcsDmkUsUZn1It/kqQbWpOeaOhac2CHrvWO8g6cAu27JYS3ifiYEl0hac8PHDXufsXgrHwEzFvD5Py6emL1KZnQkfXZ2mtbi0dle1AiknLMZUArWPeR2/Mix0qNvgeWqMVGqK3pfnIhxOyQqrtEQOG6T13wXu7H5E+Nwi8nNm8al6q9o4Ku2UPVlsfTOPJYEUVyCZSxPe82Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8wevuT10adFUju+B70UtNb9fPtabica6y9Q9rfZEic=;
 b=wa9dhsjLw+bUpHrPhT1AGw7IASkF94+46KF2wjcVM0duM6OfPIW5q4X8cWSPib/5CBElWOzLT953r6SV7Y7rYfy7LIU6wnAsZqJezRYEgD2BpTuVaSkPuOX3gd1my597Jfm7YPr/wqtfvj/GcpOIJPutk4msxA7uTA3CAOyKynrER2eDaQIW04Jk0ZGRgQECGyzrs9wdilA+wv3Av3IXbWl97kWYGXzYkL4sTIUu4z9wER1YFvqBnadIF4l5jIVrSh5eQEPcggwgUqAOczUvYqAXR7fZggL8wKMvEPNB9eVtn247y4o91Ij/SFnoGr1ciC3D3IbhmFJ/caf1BanxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH8PR11MB6780.namprd11.prod.outlook.com (2603:10b6:510:1cb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 14:39:47 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Thu, 21 Nov 2024
 14:39:47 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Topic: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Index: AQHbPBHywHPyMdnFrkepojCcF/9znbLBxdGAgAAHdkA=
Date: Thu, 21 Nov 2024 14:39:47 +0000
Message-ID: <IA0PR11MB7307C889E2B558CFE2632588BA222@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <20241121122603.736267-8-arun.r.murthy@intel.com>
 <SN7PR11MB6750748F22B5F4C6B1949A88E3222@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB6750748F22B5F4C6B1949A88E3222@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH8PR11MB6780:EE_
x-ms-office365-filtering-correlation-id: c48d6d32-2991-45b7-e57f-08dd0a3a58f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zHkycjF19IEpn5/QNoY1m+/jsWhLN0y+XvK4C1XR6tzot+ZmLR+r7nqWGxaN?=
 =?us-ascii?Q?dken8mMkgK0r4bgMlcyGkPxj0M0rMqSO2kCoD/Cj8tCZvU/WwCyDIREkc25J?=
 =?us-ascii?Q?wlkU7uBV3CB/43qq141T6uhprIcaKWAm4ewacQ/OsiI/gOT/fvvDaOzzUbRi?=
 =?us-ascii?Q?PKQkNdtNSehh7nCIpB1KLkjXHS9A3cTcw64hxSUGucjvcX/6Lb1ht1e7AI9n?=
 =?us-ascii?Q?5v1t5EQJ+gHA48KR0I9qb86mXX0PJRXwhD2Z+rW41FEUeLW0WR0WOMSl5Mvh?=
 =?us-ascii?Q?5/UjDQ5p/tgYZ11Rb8hRHGLSk06KZEbWLFFkn4yfyAJhUGKopUohm3fRE+zf?=
 =?us-ascii?Q?nO1MC8fyucX7kCAvKsno3bpltJdgHiufEeclY7LJryaPCktyoTX2+hkf/KNZ?=
 =?us-ascii?Q?FqhSxCmWIy+GJkITIs+/ykO0WRwVMFl7WLeslMEESBTgTle62nqmvJO5WZK1?=
 =?us-ascii?Q?/QDG1B2G8iNTaY40vgDzZ2SyL1dBct/8y4R1iQjbTmSTUJ8qTMZPaUWU8fBc?=
 =?us-ascii?Q?3qIHo8V3eovAwHDt6U0hVwdZqsZt/kc/aivQMHnA4RXaLyNjt5cHg5oB9SBL?=
 =?us-ascii?Q?/kLfyVo4kdeEZTwEUNy7XMDuC+nVwT3+iYndvYX27wqw071k7X0l6QlwN+q4?=
 =?us-ascii?Q?xaXRi46HwphCsmPmqabspED42e8XWYrpdBhDbTqFLqLnrx2n8LCcT10TaLzy?=
 =?us-ascii?Q?Mj5PrIO20Xz1SGwaYVEegkfj5bNQzEqwlTSPjI0MQyxkfqwqy66+MjVXY+PC?=
 =?us-ascii?Q?9VeI4m46+xxROLzio3zghpzIocAoy1AUeRCai4VbsnKd/VA/qxcccwsbnG6n?=
 =?us-ascii?Q?5aB+WDYafGdQPymfMAYzzDeKUhnn5i+WNEi//O7U+vkWUwczJLw5ye54hOS4?=
 =?us-ascii?Q?7Q/e9ucjtkA5wQxGOXA7YqunY8HA+USpF6evNOptgLLU3UhJX/7TRcBb/o+8?=
 =?us-ascii?Q?xh4trs8wALCmm8BlDg/MrN10HFV/RpmiPhMU/EsujXGYR9l8+hW/cEXVxV4u?=
 =?us-ascii?Q?19H2qrEyAWg1ZK/qu3OFIATupradOCexXJpwDsKocvLOJElgDNZi6stltTOO?=
 =?us-ascii?Q?rK8CC/N5qS/IZXNCaLuxKms+Jv4Wxu9fdFarmvKkhlLGEA+s6dF+cXKW9KGO?=
 =?us-ascii?Q?p53Pkytnkz1zcUJiTDMicLQpWzyu0NWrllsbUadCUOAIIfboWaZWVHJ4Xatp?=
 =?us-ascii?Q?v6PuKj4Of+AKrjG97uk7QCx5h6MakKOatvbMak9GQxx6KUTjeute07NqT3uV?=
 =?us-ascii?Q?F9L7gRNJNM545dSwSCvTAe1qu7V7CTZGM/xwsxosrVl92eWVfje0bq3Ysrdl?=
 =?us-ascii?Q?vn27bcK4dE4pcZf8EKctBH0NOrO5KPAyhvWV270nb4VHfVz5Pg3nZcbIwfSH?=
 =?us-ascii?Q?MNr0Ohk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pa5RaVOQPydInPKTKOUzdnof0I6bZWU0Casm9TcME4KsmD8vQLdWQzHklImd?=
 =?us-ascii?Q?nHSmIRj7gpPjYXgc+7BaScAaIu5Ugc82cenVeIuOwULFudi13g6PVHlipQxL?=
 =?us-ascii?Q?lXn182PwGQtWk0Vkjgkq4UBoZJ352noj4pY8mqgLp7jga5bbkw7Q2MepcDZM?=
 =?us-ascii?Q?cJYagd2sIXFRNDxT2J2RFIx/OWXCtspSukBY6R+BJEBVfMIhmSJK6aBRsfKA?=
 =?us-ascii?Q?S+aDiSsz8+NJ6l3oBgcR2CQrFgEx9agEXVeqltBy0Nx6192jDb+D4zvcpHfx?=
 =?us-ascii?Q?dV1fNM8pYZw6cJGQtBp/FJHPeBTJZQ+1DKTh4PEUeYtqcy3ZfmzcVEII0Yjf?=
 =?us-ascii?Q?1lcAu1b9ssm3iPxYtQUHAQ6O8kAAEQvgAkb8LYLi8foXMAG5csl24efRmzB9?=
 =?us-ascii?Q?/fn7WDufEfTTLwWPyf3DeqI2V+L8ZvsECAM6EihQ7G+CPnVn7qioUQCYvO4A?=
 =?us-ascii?Q?4eAUBE3Pv7zKzADU6Zmoef+R+wYS64Mqkey4tIGV+MPLADkGPL1SmrVQGqz3?=
 =?us-ascii?Q?ymJYRIxzYf27vtg0Jq0s0j9HZDDUaeRlY6MD+aCEXtfjclQNZbACVm4izqiE?=
 =?us-ascii?Q?6xbqBXpdsklbqxqoQG72pDAPI/roDhxUpCH9fMEKsPMb1qHizSwDncX18Yox?=
 =?us-ascii?Q?HUvAszkEB6KaJwp79dr/n0cqGj93qElh31TOSDyTGYHXS+zDrWGUPROS99En?=
 =?us-ascii?Q?tSUFXYZOlVOLIFitn2kgeT4Q3whPkJL/eRE1dc85qlHFGaJ4reDnwZDMuc01?=
 =?us-ascii?Q?C7zwE+gOU/+TRgAwCRIB4lrtiENqwmV8ZwIcUzWYgNkAoorYds7TaLe6aQx4?=
 =?us-ascii?Q?0KdA5DxdJQjovVcXJg/EOw3RRkoapE41HM8d5x2fJ9J4VGC5a+1nQym6yxHO?=
 =?us-ascii?Q?3DeJP0kX3M7aE845LQEJvn+BTgu8uBBNdL1QTsm9i7QutInx1zX4ti8bMvry?=
 =?us-ascii?Q?6NzX5ads24kPjv+qvTuD2nriRE+Rmt+FYgH3usf4d8LEtSBQJd9R6wQ2z2xq?=
 =?us-ascii?Q?dis6C7GFN9iNO8I1iwtbzjZOh2w2gmY1L0A4m3auuPeLtrY7R7x3CmijVNCv?=
 =?us-ascii?Q?ilgHbMP3fkd1rSys8bbRxLGT+WcP7sl05NywIxn37a6kN9UlChqbHslZOqsd?=
 =?us-ascii?Q?W4A8N9OfHteS0cVrvCep5fFHfjf61F4IY2+g05+FlS1e1vECDpt6hXpi/O8Z?=
 =?us-ascii?Q?KV/l1Rv5Gl32kyptX0gJJmitKVt8NkWnFA9Og+QXZxcziEJ0GOVsBQbCOvWg?=
 =?us-ascii?Q?BA2MIcFZqjIadTZdfLOG2LgCfo6PhbxslgdAaELx187P+zkjbhFyuK87VK+a?=
 =?us-ascii?Q?krwgn0w7i+TchqA2bMvAgzbMCMflXtWwXP35FV1JQAuFiq71MCPBCtlVO65t?=
 =?us-ascii?Q?EvueUxlCw+Y7ykzcwUyn3oAnZGiNT5vSyBRv2zyk1xdt+3k7qj+Bsj+0kmmB?=
 =?us-ascii?Q?oOn51Z8KzhjSeNJLBaHqrBYOEnSNw5wcHNrzwqi/T2Qb3NF0fIIhawA1PFid?=
 =?us-ascii?Q?SGYL07AahUnaWyO5uWudvLOjfLyo7K7poeeYjgwZEGac7EdcDPZ03kYCa7Kc?=
 =?us-ascii?Q?0AJCoTvJgn/EtRQT5naFbgv2THGmX6uyA/OqU2foiR5LGP/Jd6EeknjNQXzi?=
 =?us-ascii?Q?8yw0zUT91lTpaD1+Yhi58ft308aBeSL/2yWzFeKEeP5t?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c48d6d32-2991-45b7-e57f-08dd0a3a58f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 14:39:47.3405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jZvOLZeb0V3rP4SACCwClZiEopt2nDqgpry7xVlg1yWd5boOvww8VfK5EORpMkbvCI3p0dMLIJH7JMirmtB+OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6780
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

> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > Arun R Murthy
> > Sent: Thursday, November 21, 2024 5:56 PM
> > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> > dri- devel@lists.freedesktop.org
> > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > Subject: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for
> > Display
> > 20+
> >
> > In Display 20+, new registers are added for setting index, reading
> > histogram and writing the IET.
> >
> > v2: Removed duplicate code (Jani)
> > v3: Moved histogram core changes to earlier patches (Jani/Suraj)
> > v4: Rebased after addressing comments on patch 1
> > v5: Added the retry logic from patch3 and rebased the patch series
> > v6: optimize wite_iet() (Suraj)
>=20
> I think you missed some comments from previous revision Add the bspec
> reference for registers added
>=20
Added

> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  .../gpu/drm/i915/display/intel_histogram.c    | 105 +++++++++++++-----
> >  .../drm/i915/display/intel_histogram_regs.h   |  25 +++++
> >  2 files changed, 103 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> > b/drivers/gpu/drm/i915/display/intel_histogram.c
> > index a64e778fface..db4bc60be557 100644
> > --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> > +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> > @@ -29,6 +29,37 @@ struct intel_histogram {
> >  	u32 bin_data[HISTOGRAM_BIN_COUNT];
> >  };
> >
> > +static void set_bin_index_0(struct intel_display *display, enum pipe
> > +pipe) {
> > +	if (DISPLAY_VER(display) >=3D 20)
> > +		intel_de_rmw(display, DPST_IE_INDEX(pipe),
> > +			     DPST_IE_BIN_INDEX_MASK,
> > DPST_IE_BIN_INDEX(0));
> > +	else
> > +		intel_de_rmw(display, DPST_CTL(pipe),
> > +			     DPST_CTL_BIN_REG_MASK,
> > +			     DPST_CTL_BIN_REG_CLEAR);
> > +}
> > +
> > +static void write_iet(struct intel_display *display, enum pipe pipe,
> > +			      u32 *data)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> > +		if (DISPLAY_VER(display) >=3D 20)
> > +			intel_de_rmw(display, DPST_IE_BIN(pipe),
> > +				     DPST_IE_BIN_DATA_MASK,
> > +				     DPST_IE_BIN_DATA(data[i]));
> > +		else
> > +			intel_de_rmw(display, DPST_BIN(pipe),
> > +				     DPST_BIN_DATA_MASK,
> > +				     DPST_BIN_DATA(data[i]));
> > +
> > +		drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n",
> > +			       i, data[i]);
> > +	}
>=20
> This looks more clean according to me
> if (DISPLAY_VER(display) >=3D 20) {
>     register_base =3D DPST_IE_BIN(pipe);
>     data_mask =3D DPST_IE_BIN_DATA_MASK;
>     data_temp =3D DPST_IE_BIN_DATA(data[i]); } else {
>     register_base =3D DPST_BIN(pipe);
>     data_mask =3D DPST_BIN_DATA_MASK;
>     data_temp =3D DPST_BIN_DATA(data[i]);
> }
>  intel_de_rmw(display, register_base, data_mask, data_temp);
>   drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n", i, data[i]);
>=20

With the above code snippet data_temp will have to be in the for loop so as=
 to get the bit mapped value of data[i]

Thanks and Regards,
Arun R Murthy
--------------------
