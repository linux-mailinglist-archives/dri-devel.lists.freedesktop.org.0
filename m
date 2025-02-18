Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA78A3A0D2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 16:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B1910E3CF;
	Tue, 18 Feb 2025 15:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktZakLAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC96310E3B9;
 Tue, 18 Feb 2025 15:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739891517; x=1771427517;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=joGUAr4ukTEVpW+WvILyPJr+O+wdMzAldHkpWT3Ijfc=;
 b=ktZakLAo0MSJh0Mje0XhdR/3CmtcJufjyLgiPfS+62wszA6/rPXlgezV
 zt+2QULtBDt6q9ET3A4zqLTa2RhlB0LpmMUyAlTgEZRqAhrqQlSkQNj64
 5wxIOABm/SrRAWKlqgS16kiHE6b+Y1Al6OpfvI4TCuSlimapJWKRj2no2
 j7BXWEybuQUaLmcfG+pWEAIVh4AF7mWK+qjjlZBNu0LNhqT+z1LJfogEr
 eqhGajtbSkJq+/IFHwgdEgAQk3pTL9QE4CgHhgR1b90HEhUw5klfak+6+
 B9Ql33dpMdeNCrVnavFgzvL5WZAGvgJxIXCFthdiBDxfcrO0mmoxBBHpu w==;
X-CSE-ConnectionGUID: GxEDMMh4T/qyw4jhuxKSQg==
X-CSE-MsgGUID: poKwTcssQ1azKfFq5u6ZXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51231741"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="51231741"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 07:11:56 -0800
X-CSE-ConnectionGUID: mnVa8EP3R8SeN9RfaUXfcA==
X-CSE-MsgGUID: 0avoiSupQ0a0XYnqtzNN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114893569"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 07:11:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 07:11:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 07:11:55 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 07:11:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UF7DOyVdKJOtsE9qGy6kDN3qKZ2Ql7L/VCZMCzQoDclrv9L/pjFm/gIAA7a4wbEuN8HrL8aqdQesO2OTvsuB+EHobuiBJWFDRNMlQjfDUqfXXzkmF/CU8rG7238SYr17/TEZmEIqGWcGVLxuQJF8u9cgToIcyYU9DVd7Cq4UVYceQW8iEB2aCoznix9pzg2uAI7Z52VPFELXKAaX/HPpSD/jLplDTl9uzP2q0hnpX4oPTmVtSxdGPZ9kGNmTglzOM/7JbV3neCEoab9WA1YMewbTN+0VlAie6VvwuffgE/LK+9AT701qtz8cvRN0RMThIHer463JOep57S3MZMt5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TTi+ojxBXJNsIZex2j4EyuUzN3viS68WZQwf8rgJZE=;
 b=AtzNX8/fA5sMhrht7vBWTp4rh68dk7JALzhytCgErpOcfVUE4XAuloFxB/IQ5iXV5abO0IdR9KFSOzSXlXzQXjMvzEjsgbSulHXM2YkxzbKJGCQSJp6anAt+Y9Hq5ptsZHZg1+GS8/ea2oVWtq7+1LgMAfNTbdzUjgPdrEm72JMHIWZV+ljcjRxkpkBrmlpWNA6aDAv/lyhRnQhtMr2cggF5OWz0aHr4TdGzagMb2crATXFTztYEcaRJlJEITeKSVtVyae8A5pkj3Yesp4eaMA5N3rAbZ53NkAfPlCFYJ8FcMnbiu77OM86A3O8IE7or+SBCAExxU61vbENE5EPVPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN2PR11MB4582.namprd11.prod.outlook.com (2603:10b6:208:265::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Tue, 18 Feb
 2025 15:11:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 15:11:23 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Lahtinen, Joonas" <joonas.lahtinen@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>
Subject: RE: [PATCH 3/4] FIXME: drm/xe/xe_drm_client: Add per drm client
 pagefault info
Thread-Topic: [PATCH 3/4] FIXME: drm/xe/xe_drm_client: Add per drm client
 pagefault info
Thread-Index: AQHbfyBc/9UysHzYoE2YrFXxmqnAwrNLvOaAgAFyYIA=
Date: Tue, 18 Feb 2025 15:11:23 +0000
Message-ID: <CH0PR11MB5444E16E1CEB0E24AB91671AE5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
 <20250214203757.27895-4-jonathan.cavitt@intel.com>
 <Z7NrZYE0lYBgXjJ-@phenom.ffwll.local>
In-Reply-To: <Z7NrZYE0lYBgXjJ-@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN2PR11MB4582:EE_
x-ms-office365-filtering-correlation-id: 9f12b011-a1b4-4e86-5083-08dd502e8222
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BaBHxDe5MDgqYQs03MPG5Hwf1B73VcryweD5hPgsJkSwtxzgJt0P5pARYMVB?=
 =?us-ascii?Q?wM/cennLnuOvpSHK+mUAGnuFNQPK35BGmxbW9B1QJZxFHh6ZTjRwNbA4QtTM?=
 =?us-ascii?Q?jFD5QA92K6DxX4eFw1SMWAPshv2WovO/gjfn9k7vragwsMwIbbUJtPk9domB?=
 =?us-ascii?Q?BLBZpNgMiC/dX00EJQCkllDq3JJoiDbTtLTLypvE15Lxcuq3agMNfYSzfeYw?=
 =?us-ascii?Q?lPoUCjZoPX7uYz/agbxKKnpNs8rlMtu6edVYnpWfCnWGnA8jDGwIzUjtPIRE?=
 =?us-ascii?Q?NyUirQoNPv1cjjO9AT65az3tGPwun1xYFi4Ag2edfOktubx/bzb+rm2ERPiS?=
 =?us-ascii?Q?wgdjrs147udv7NmoCby13gTbspLMOU4iyNRBNj2154dH0qLhYDiHiSDC+3eQ?=
 =?us-ascii?Q?EiF9ifOUvR8tGiX3W0Yycke0tBx/jGBSMmyTM/bqQab/+XtL7zHdQNjnNSdt?=
 =?us-ascii?Q?2wnj6tm/c0W4Mg92FvH7JsjLhaj0AteP4ZFDSmrXEiN2kuY3o7SgsEOPov9H?=
 =?us-ascii?Q?O7P+10kQtkfDfr7WO5akJWoWkV4qPpDeROt/EYB08PQxPRgszfh4kmZpA/7f?=
 =?us-ascii?Q?ZXf2S5yPpv02LO1lnJ09vtz0fTST/atXYhy72Vmn6L7+ctqs9crE+/4VXExG?=
 =?us-ascii?Q?qaLAGOxFgDg4eb6e6mkPE2jTqC12g7cB0It8dJc8tDpnTswQPxSr0hjJonbd?=
 =?us-ascii?Q?/M69gAO6SjRDgvPOwgKeLTtxxCwkCmEQjMtPtqxIxnIdIA1uJ95b/JBXS1a0?=
 =?us-ascii?Q?dyZ/h6qDiJEWQWwgezvpnvPxs9LAc57Ur8meiAwztrRd0eHT25vCVyV86E+K?=
 =?us-ascii?Q?Fv0wtF37ejdgUOW3k73VQGD1WhUwZcFBrHbOKo+x/v6FE+W2OwrtOz6pcZp/?=
 =?us-ascii?Q?EgnF5PC69/d5/atKJuY2zJWZtPgEEjkotfTWx6Cf0rRA0QI1ihmAS28w7nFi?=
 =?us-ascii?Q?PDw/uoSP107w2zT4vwygkcZpuAcFMDHu9NllqrQ3doVMXm7boIAgzIYCKg2I?=
 =?us-ascii?Q?aIjxNShPdbYJMli8d3EYJJMFBdUoJZKmPHFXVp7snKvpeuTSunYpgSD9bOYh?=
 =?us-ascii?Q?tJTVX8Z0RLMVS78Ugt7N8WNu/x/sCShof8skyEPHtKuWNqVPXIsupPQ3qWl1?=
 =?us-ascii?Q?HVSotaJCa8MKgmvkLdGyPPP5yjolD1UxdNXOPjtPbuwvXt3UMjVF03i1q06F?=
 =?us-ascii?Q?KSelQNo9/pkYgF7EZ20IKvOKtKXdRMSXibvGUqbUCAs/dE4cooMdeM5lNXtC?=
 =?us-ascii?Q?t+XdMKD5jyBU9kgi4oo2iTs4dg+IHEIInDDncFWwpu1fJElkv0wITpE9TujV?=
 =?us-ascii?Q?ktRWUgORC0XbIgT6Z04exLNqJjjYIuWPi4P418YtUpXaMcUJeiJSEXcB+2B7?=
 =?us-ascii?Q?v4q/zVa5IV5dK07dvRShEY3+NRB/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eAzhp0qqTi5aTjZckzpCzMfa5N5XM5JtrkKzPOUsYpG+LamLmQuOSVrWmQeA?=
 =?us-ascii?Q?2ubMPKsC8ACEQxz3JGU9yCpXymKnM8iISA3KNR4uDI14n1rv6ccF1dI81Kkx?=
 =?us-ascii?Q?0RWs5sJ230hsHxNEYY9rTrtKpmgdpJbH2AkxqcDYomqxoNhOELtz4juDRWtW?=
 =?us-ascii?Q?NQ3dauZGWHxwnQVfGg6MHvnd6yiXqvxyQMImSKNQSBrpVtNHLzOBmKE494v3?=
 =?us-ascii?Q?taftQVwVpZIL6GkkhMeFO/G/rDVEioGoBitQOlQEhU01uf3l90GtYiq8y5e6?=
 =?us-ascii?Q?fgMbiqbC3Iy0/AbE7t4kzkW9xmOCICod7jVJh0nFNDtIhbA7dhWr93+QfX7D?=
 =?us-ascii?Q?7Ss8ZFNf8WTXNUNiIONW6WszAsz/WbfuCntiAhtwtuyFExFuSPnwzlw2TqYF?=
 =?us-ascii?Q?fwpPa4XHNWff4+NAFVbYU4cYucJvmX9iK0CbbJ8ZP52IcRX0tt8NXtUFqFwP?=
 =?us-ascii?Q?PH6m00BbCH397i+OkOW4QpXp6/QfvMhL1OeKl/z5atcd43D5bcHkKONor2tT?=
 =?us-ascii?Q?Np69qpdjI8MD1dMaUG1+9p8aEOdyIGYLFK/xqVHRoV7vXDxfJaS53IPaHlXw?=
 =?us-ascii?Q?8TAWiuHhy4GzgNBvNSeso0+JI0gEvKlg34fouEBYcnXoryU5Fs2HWxwK543M?=
 =?us-ascii?Q?/8FdUS94uxb0gYcM34qF7qQMue/oViCxhoHpcG6mPchY/BChfYyT79cXnAEe?=
 =?us-ascii?Q?QJgQaQT3K//6699hBMGMLFUXr17z+bCfg/XGIoycEyv32NvrCRepN5eyLm0t?=
 =?us-ascii?Q?Y08fT44h/Een1TJwLRbc4uttmkpiYTrAKNx14OxeGfI663XijaAoA36zjIYx?=
 =?us-ascii?Q?YGhOI/YBGATE48b7odrodbLb9eUpu+9LeFIXwB99M0KUCorrkMybK4CcDIVO?=
 =?us-ascii?Q?lwalVOVnKsJgGXWM/y6niKTxfGnoHqXwTDUj+VLO2+tEMeeAC1XeB3vwyBE3?=
 =?us-ascii?Q?YgVdctoHX4KfxhY64siU8huwDkgOsKlqVmTTY4CpnbUd/RXUdFAMv4NyfJ3l?=
 =?us-ascii?Q?aUgQL3Y2t5IzWPWNXGCyXCWntAC+Ft/AYexIJfIJMrezfMgqdYF9+236rLzo?=
 =?us-ascii?Q?cNEzwjwm4ap2BWL2wzbHdw89pEuhcZ7kluHCcyvYTYYBuJLDrZOxnkwqewkW?=
 =?us-ascii?Q?NfV3b0OH/qKaqNKvJXxpSNoPsRy494aqERFjTC+tbkeuymgjhn62ja+Fn3AC?=
 =?us-ascii?Q?J9tW0fRwNSj6JVCidoTYvIBzcjD8Bjmmq1fBQpwoZvmxL7pezRGvhu1p9Pnb?=
 =?us-ascii?Q?jdCKOpNoGAjn0ezrpO6kP2WkHnAJ738RcRrUCzObewv03tEK3klJLYsFk6a7?=
 =?us-ascii?Q?ondwkaP4IqUM+oopOut34MhmAThX+ZYV1RRJWb/YhUytQmJ9KFAisB6/CfJ9?=
 =?us-ascii?Q?d4jlKjgv40jeOvqr7Carf753//Oq2SIikGEsI7ECIarBrosAyZUNOz/c5ChD?=
 =?us-ascii?Q?DbEGXvbIbx3EeCTqdNtmAtCgnCPJNJqQGoTem59UJJCiUKELSXRaiBAUcDaD?=
 =?us-ascii?Q?QuTWYYSTWek2nPZwe0VIJOMJSOjQ+hEmzOMJulH/fewuYxciSH+OPb/scCq5?=
 =?us-ascii?Q?szXi7X55Iqxmh30dxM+yRTll5mPzDJdd3bMrYAtw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f12b011-a1b4-4e86-5083-08dd502e8222
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 15:11:23.7879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2k/qhsAnHPfX679K1KJwoxJsYRuD1OnBFarcZHHMqxEnojh84jrbsy6lzIE1bNHjWFD62a5VI0m0yqahiZ7W71uS5eBkjH133kGCa9rlXWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4582
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

-----Original Message-----
From: Simona Vetter <simona.vetter@ffwll.ch>=20
Sent: Monday, February 17, 2025 9:01 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Gupta,=
 saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Lahti=
nen, Joonas <joonas.lahtinen@intel.com>; De Marchi, Lucas <lucas.demarchi@i=
ntel.com>; Brost, Matthew <matthew.brost@intel.com>; tvrtko.ursulin@igalia.=
com
Subject: Re: [PATCH 3/4] FIXME: drm/xe/xe_drm_client: Add per drm client pa=
gefault info
>=20
> On Fri, Feb 14, 2025 at 08:37:56PM +0000, Jonathan Cavitt wrote:
> > Add additional information to drm client so it can report the last 50
> > exec queues to have been banned on it, as well as the last pagefault
> > seen when said exec queues were banned.  Since we cannot reasonably
> > associate a pagefault to a specific exec queue, we currently report the
> > last seen pagefault on the associated hw engine instead.
> >=20
> > The last pagefault seen per exec queue is saved to the hw engine, and t=
he
> > pagefault is updated during the pagefault handling process in
> > xe_gt_pagefault.  The last seen pagefault is reset when the engine is
> > reset because any future exec queue bans likely were not caused by said
> > pagefault after the reset.
> >=20
> > v2: Remove exec queue from blame list on destroy and recreate (Joonas)
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_drm_client.c      | 128 ++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_drm_client.h      |  36 +++++++
> >  drivers/gpu/drm/xe/xe_exec_queue.c      |   7 ++
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c    |  19 ++++
> >  drivers/gpu/drm/xe/xe_guc_submit.c      |  17 ++++
> >  drivers/gpu/drm/xe/xe_hw_engine.c       |   4 +
> >  drivers/gpu/drm/xe/xe_hw_engine_types.h |   8 ++
> >  7 files changed, 219 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe=
_drm_client.c
> > index 2d4874d2b922..f15560d0b6ff 100644
> > --- a/drivers/gpu/drm/xe/xe_drm_client.c
> > +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> > @@ -17,6 +17,7 @@
> >  #include "xe_exec_queue.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_gt.h"
> > +#include "xe_gt_pagefault.h"
> >  #include "xe_hw_engine.h"
> >  #include "xe_pm.h"
> >  #include "xe_trace.h"
> > @@ -70,6 +71,21 @@
> >   * 	drm-total-cycles-ccs:   7655183225
> >   * 	drm-engine-capacity-ccs:        4
> >   *
> > + * 	- Exec queue ban list -
>=20
> This looks like you're just totally tossing the drm fdinfo format and
> going with something no one else can even parse.
>=20
> I think it's time for some proper helper functions/macros and not
> open-coded drm_printf for this stuff.

Understood.  I'll see what I can do about aligning the output with
what currently exists.
-Jonathan Cavitt

>=20
> Also for sure needs an ack from Tvrtko.
>=20
> Cheers, Sima
>=20
> > + *
> > + * 		Exec queue 1 banned:
> > + * 			Associated pagefault:
> > + * 			ASID: 9
> > + * 			VFID: 0
> > + * 			PDATA: 0x0450
> > + * 			Faulted Address: 0x000001fff86a9000
> > + * 			FaultType: NOT_PRESENT
> > + * 			AccessType: ACCESS_TYPE_WRITE
> > + * 			FaultLevel: 0
> > + * 			EngineClass: 1 vcs
> > + * 			EngineInstance: 0
> > + *	=09
> > + *
> >   * Possible `drm-cycles-` key names are: `rcs`, `ccs`, `bcs`, `vcs`, `=
vecs` and
> >   * "other".
> >   */
> > @@ -97,6 +113,8 @@ struct xe_drm_client *xe_drm_client_alloc(void)
> >  #ifdef CONFIG_PROC_FS
> >  	spin_lock_init(&client->bos_lock);
> >  	INIT_LIST_HEAD(&client->bos_list);
> > +	spin_lock_init(&client->blame_lock);
> > +	INIT_LIST_HEAD(&client->blame_list);
> >  #endif
> >  	return client;
> >  }
> > @@ -164,6 +182,72 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
> >  	xe_drm_client_put(client);
> >  }
> > =20
> > +static void free_blame(struct blame *b)
> > +{
> > +	list_del(&b->list);
> > +	kfree(b->pf);
> > +	kfree(b);
> > +}
> > +
> > +void xe_drm_client_add_blame(struct xe_drm_client *client,
> > +			     struct xe_exec_queue *q)
> > +{
> > +	struct blame *b =3D NULL;
> > +	struct list_head *h;
> > +	struct pagefault *pf =3D NULL;
> > +	struct xe_file *xef =3D q->xef;
> > +	struct xe_hw_engine *hwe =3D q->hwe;
> > +	unsigned long count;
> > +
> > +	b =3D kzalloc(sizeof(struct blame), GFP_KERNEL);
> > +	xe_assert(xef->xe, b);
> > +
> > +	spin_lock(&client->blame_lock);
> > +	list_add_tail(&b->list, &client->blame_list);
> > +	/**
> > +	 * Limit the number of blames in the blame list to prevent memory ove=
ruse.
> > +	 *
> > +	 * TODO: Parameterize max blame list size.
> > +	 */
> > +	count =3D 0;
> > +	list_for_each(h, &client->blame_list)
> > +		count++;
> > +	if (count >=3D 50) {
> > +		struct blame *rem =3D list_first_entry(&client->blame_list, struct b=
lame, list);
> > +		free_blame(rem);
> > +	}
> > +	spin_unlock(&client->blame_lock);
> > +
> > +	/**
> > +	 * Duplicate pagefault on engine to blame, if one may have caused the
> > +	 * exec queue to be banned.
> > +	 */
> > +	b->pf =3D NULL;
> > +	spin_lock(&hwe->pf.lock);
> > +	if (hwe->pf.info) {
> > +		pf =3D kzalloc(sizeof(struct pagefault), GFP_KERNEL);
> > +		memcpy(pf, hwe->pf.info, sizeof(struct pagefault));
> > +	}
> > +	spin_unlock(&hwe->pf.lock);
> > +
> > +	/** Save blame data to list element */
> > +	b->exec_queue_id =3D q->id;
> > +	b->pf =3D pf;
> > +}
> > +
> > +void xe_drm_client_remove_blame(struct xe_drm_client *client,
> > +				struct xe_exec_queue *q)
> > +{
> > +	struct blame *b, *tmp;
> > +
> > +	spin_lock(&client->blame_lock);
> > +	list_for_each_entry_safe(b, tmp, &client->blame_list, list)
> > +		if (b->exec_queue_id =3D=3D q->id)
> > +			free_blame(b);
> > +	spin_unlock(&client->blame_lock);
> > +
> > +}
> > +
> >  static void bo_meminfo(struct xe_bo *bo,
> >  		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
> >  {
> > @@ -380,6 +464,49 @@ static void show_run_ticks(struct drm_printer *p, =
struct drm_file *file)
> >  	}
> >  }
> > =20
> > +static void print_pagefault(struct drm_printer *p, struct pagefault *p=
f)
> > +{
> > +	drm_printf(p, "\n\t\tASID: %d\n"
> > +	 "\t\tVFID: %d\n"
> > +	 "\t\tPDATA: 0x%04x\n"
> > +	 "\t\tFaulted Address: 0x%08x%08x\n"
> > +	 "\t\tFaultType: %s\n"
> > +	 "\t\tAccessType: %s\n"
> > +	 "\t\tFaultLevel: %d\n"
> > +	 "\t\tEngineClass: %d %s\n"
> > +	 "\t\tEngineInstance: %d\n",
> > +	 pf->asid, pf->vfid, pf->pdata, upper_32_bits(pf->page_addr),
> > +	 lower_32_bits(pf->page_addr),
> > +	 fault_type_to_str(pf->fault_type),
> > +	 access_type_to_str(pf->access_type),
> > +	 pf->fault_level, pf->engine_class,
> > +	 xe_hw_engine_class_to_str(pf->engine_class),
> > +	 pf->engine_instance);
> > +}
> > +
> > +static void show_blames(struct drm_printer *p, struct drm_file *file)
> > +{
> > +	struct xe_file *xef =3D file->driver_priv;
> > +	struct xe_drm_client *client;
> > +	struct blame *b;
> > +
> > +	client =3D xef->client;
> > +
> > +	drm_printf(p, "\n");
> > +	drm_printf(p, "- Exec queue ban list -\n");
> > +	spin_lock(&client->blame_lock);
> > +	list_for_each_entry(b, &client->blame_list, list) {
> > +		struct pagefault *pf =3D b->pf;
> > +		drm_printf(p, "\n\tExec queue %u banned:\n", b->exec_queue_id);
> > +		drm_printf(p, "\t\tAssociated pagefault:\n");
> > +		if (pf)
> > +			print_pagefault(p, pf);
> > +		else
> > +			drm_printf(p, "\t\t- No associated pagefault -\n");
> > +	}
> > +	spin_unlock(&client->blame_lock);
> > +}
> > +
> >  /**
> >   * xe_drm_client_fdinfo() - Callback for fdinfo interface
> >   * @p: The drm_printer ptr
> > @@ -394,5 +521,6 @@ void xe_drm_client_fdinfo(struct drm_printer *p, st=
ruct drm_file *file)
> >  {
> >  	show_meminfo(p, file);
> >  	show_run_ticks(p, file);
> > +	show_blames(p, file);
> >  }
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe=
_drm_client.h
> > index a9649aa36011..d21fd0b90742 100644
> > --- a/drivers/gpu/drm/xe/xe_drm_client.h
> > +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> > @@ -15,7 +15,18 @@
> > =20
> >  struct drm_file;
> >  struct drm_printer;
> > +struct pagefault;
> >  struct xe_bo;
> > +struct xe_exec_queue;
> > +
> > +struct blame {
> > +	/** @exec_queue_id: ID number of banned exec queue */
> > +	u32 exec_queue_id;
> > +	/** @pf: pagefault on engine of banned exec queue, if any at time */
> > +	struct pagefault *pf;
> > +	/** @list: link into @xe_drm_client.blame_list */
> > +	struct list_head list;
> > +};
> > =20
> >  struct xe_drm_client {
> >  	struct kref kref;
> > @@ -31,6 +42,17 @@ struct xe_drm_client {
> >  	 * Protected by @bos_lock.
> >  	 */
> >  	struct list_head bos_list;
> > +	/**
> > +	 * @blame_lock: lock protecting @blame_list
> > +	 */
> > +	spinlock_t blame_lock;
> > +	/**
> > +	 * @blame_list: list of banned exec queues associated with this drm
> > +	 *		client, as well as any pagefaults at time of ban.
> > +	 *
> > +	 * Protected by @blame_lock;
> > +	 */
> > +	struct list_head blame_list;
> >  #endif
> >  };
> > =20
> > @@ -57,6 +79,10 @@ void xe_drm_client_fdinfo(struct drm_printer *p, str=
uct drm_file *file);
> >  void xe_drm_client_add_bo(struct xe_drm_client *client,
> >  			  struct xe_bo *bo);
> >  void xe_drm_client_remove_bo(struct xe_bo *bo);
> > +void xe_drm_client_add_blame(struct xe_drm_client *client,
> > +			     struct xe_exec_queue *q);
> > +void xe_drm_client_remove_blame(struct xe_drm_client *client,
> > +				struct xe_exec_queue *q);
> >  #else
> >  static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
> >  					struct xe_bo *bo)
> > @@ -66,5 +92,15 @@ static inline void xe_drm_client_add_bo(struct xe_dr=
m_client *client,
> >  static inline void xe_drm_client_remove_bo(struct xe_bo *bo)
> >  {
> >  }
> > +
> > +static inline void xe_drm_client_add_blame(struct xe_drm_client *clien=
t,
> > +					   struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void xe_drm_client_remove_blame(struct xe_drm_client *cl=
ient,
> > +					      struct xe_exec_queue *q)
> > +{
> > +}
> >  #endif
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe=
_exec_queue.c
> > index a02e62465e01..9c9bc617020c 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -13,6 +13,7 @@
> >  #include <uapi/drm/xe_drm.h>
> > =20
> >  #include "xe_device.h"
> > +#include "xe_drm_client.h"
> >  #include "xe_gt.h"
> >  #include "xe_hw_engine_class_sysfs.h"
> >  #include "xe_hw_engine_group.h"
> > @@ -714,6 +715,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *=
dev, void *data,
> >  	q->id =3D id;
> >  	args->exec_queue_id =3D id;
> > =20
> > +	/**
> > +	 * If an exec queue in the blame list shares the same exec queue
> > +	 * ID, remove it from the blame list to avoid confusion.
> > +	 */
> > +	xe_drm_client_remove_blame(q->xef->client, q);
> > +
> >  	return 0;
> > =20
> >  kill_exec_queue:
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/=
xe_gt_pagefault.c
> > index fe18e3ec488a..a0e6f2281e37 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -330,6 +330,23 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u=
32 *msg, u32 len)
> >  	return full ? -ENOSPC : 0;
> >  }
> > =20
> > +static void save_pagefault_to_engine(struct xe_gt *gt, struct pagefaul=
t *pf)
> > +{
> > +	struct xe_hw_engine *hwe;
> > +
> > +	hwe =3D xe_gt_hw_engine(gt, pf->engine_class, pf->engine_instance, fa=
lse);
> > +	if (hwe) {
> > +		spin_lock(&hwe->pf.lock);
> > +		/** The latest pagefault is pf, so remove old pf info from engine */
> > +		if (hwe->pf.info)
> > +			kfree(hwe->pf.info);
> > +		hwe->pf.info =3D kzalloc(sizeof(struct pagefault), GFP_KERNEL);
> > +		if (hwe->pf.info)
> > +			memcpy(hwe->pf.info, pf, sizeof(struct pagefault));
> > +		spin_unlock(&hwe->pf.lock);
> > +	}
> > +}
> > +
> >  #define USM_QUEUE_MAX_RUNTIME_MS	20
> > =20
> >  static void pf_queue_work_func(struct work_struct *w)
> > @@ -352,6 +369,8 @@ static void pf_queue_work_func(struct work_struct *=
w)
> >  			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
> >  		}
> > =20
> > +		save_pagefault_to_engine(gt, &pf);
> > +
> >  		reply.dw0 =3D FIELD_PREP(PFR_VALID, 1) |
> >  			FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
> >  			FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe=
_guc_submit.c
> > index 913c74d6e2ae..d9da5c89429e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -20,11 +20,13 @@
> >  #include "xe_assert.h"
> >  #include "xe_devcoredump.h"
> >  #include "xe_device.h"
> > +#include "xe_drm_client.h"
> >  #include "xe_exec_queue.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_gpu_scheduler.h"
> >  #include "xe_gt.h"
> >  #include "xe_gt_clock.h"
> > +#include "xe_gt_pagefault.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_capture.h"
> > @@ -146,6 +148,7 @@ static bool exec_queue_banned(struct xe_exec_queue =
*q)
> >  static void set_exec_queue_banned(struct xe_exec_queue *q)
> >  {
> >  	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> > +	xe_drm_client_add_blame(q->xef->client, q);
> >  }
> > =20
> >  static bool exec_queue_suspended(struct xe_exec_queue *q)
> > @@ -1971,6 +1974,7 @@ int xe_guc_deregister_done_handler(struct xe_guc =
*guc, u32 *msg, u32 len)
> >  int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 =
len)
> >  {
> >  	struct xe_gt *gt =3D guc_to_gt(guc);
> > +	struct xe_hw_engine *hwe;
> >  	struct xe_exec_queue *q;
> >  	u32 guc_id;
> > =20
> > @@ -1983,11 +1987,24 @@ int xe_guc_exec_queue_reset_handler(struct xe_g=
uc *guc, u32 *msg, u32 len)
> >  	if (unlikely(!q))
> >  		return -EPROTO;
> > =20
> > +	hwe =3D q->hwe;
> > +
> >  	xe_gt_info(gt, "Engine reset: engine_class=3D%s, logical_mask: 0x%x, =
guc_id=3D%d",
> >  		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > =20
> >  	trace_xe_exec_queue_reset(q);
> > =20
> > +	/**
> > +	 * Clear last pagefault from engine.  Any future exec queue bans like=
ly were
> > +	 * not caused by said pagefault now that the engine has reset.
> > +	 */
> > +	spin_lock(&hwe->pf.lock);
> > +	if (hwe->pf.info) {
> > +		kfree(hwe->pf.info);
> > +		hwe->pf.info =3D kzalloc(sizeof(struct pagefault), GFP_KERNEL);
> > +	}
> > +	spin_unlock(&hwe->pf.lock);
> > +
> >  	/*
> >  	 * A banned engine is a NOP at this point (came from
> >  	 * guc_exec_queue_timedout_job). Otherwise, kick drm scheduler to can=
cel
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_=
hw_engine.c
> > index fc447751fe78..69f61e4905e2 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -21,6 +21,7 @@
> >  #include "xe_gsc.h"
> >  #include "xe_gt.h"
> >  #include "xe_gt_ccs_mode.h"
> > +#include "xe_gt_pagefault.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_mcr.h"
> >  #include "xe_gt_topology.h"
> > @@ -557,6 +558,9 @@ static void hw_engine_init_early(struct xe_gt *gt, =
struct xe_hw_engine *hwe,
> >  		hwe->eclass->defaults =3D hwe->eclass->sched_props;
> >  	}
> > =20
> > +	hwe->pf.info =3D NULL;
> > +	spin_lock_init(&hwe->pf.lock);
> > +
> >  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> >  	xe_tuning_process_engine(hwe);
> >  	xe_wa_process_engine(hwe);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/=
xe/xe_hw_engine_types.h
> > index e4191a7a2c31..2e1be9481d9b 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > @@ -64,6 +64,7 @@ enum xe_hw_engine_id {
> >  struct xe_bo;
> >  struct xe_execlist_port;
> >  struct xe_gt;
> > +struct pagefault;
> > =20
> >  /**
> >   * struct xe_hw_engine_class_intf - per hw engine class struct interfa=
ce
> > @@ -150,6 +151,13 @@ struct xe_hw_engine {
> >  	struct xe_oa_unit *oa_unit;
> >  	/** @hw_engine_group: the group of hw engines this one belongs to */
> >  	struct xe_hw_engine_group *hw_engine_group;
> > +	/** @pf: the last pagefault seen on this engine */
> > +	struct {
> > +		/** @pf.info: info containing last seen pagefault details */
> > +		struct pagefault *info;
> > +		/** @pf.lock: lock protecting @pf.info */
> > +		spinlock_t lock;
> > +	} pf;
> >  };
> > =20
> >  enum xe_hw_engine_snapshot_source_id {
> > --=20
> > 2.43.0
> >=20
>=20
> --=20
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>=20
