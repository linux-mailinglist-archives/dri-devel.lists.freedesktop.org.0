Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E28BA31E8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90DA10E341;
	Fri, 26 Sep 2025 09:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhAygpu0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8810E313;
 Fri, 26 Sep 2025 09:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758878625; x=1790414625;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XUvScUtEWa1903EYbBTbknG9j8cnm/3wx55G8sjhlMQ=;
 b=YhAygpu0iPITSCE2DtVl1+fnu6xLD6d7hV2MI+eWmifpqubEtSMtwS4B
 yiwA3QjNGqWHxmFpxleUzgKS8QohpCFFEdzTZPtKcG7Wa/Nx5Bq8OEM6J
 5jm7o5/5AueOkoMTsONJ+UwBEqUl+kPhNNH4Skbrdskhut+bf4dllbVf/
 LrVpWyaFf1yB4VNcTMI9VN233H+Ps+IN1jCGJ53un2/ANGznm9N9NQB9j
 I+3flEOLCSlmabWmiiLYLnSLyR7pzCfkIJK4Su7OmhabLYx8FgEP13/IQ
 cZvDELEOyner93yhhKvWRyM5iwBiKzuJojl2jtGWsAUAdxMCVOFNJLCZy A==;
X-CSE-ConnectionGUID: yWeZGetpS+CBWZWPpdywdg==
X-CSE-MsgGUID: ZtOikfZcRs6medwRWW4upg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72641914"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="72641914"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:23:44 -0700
X-CSE-ConnectionGUID: nGirqzH3QFCrnkL0dBTxgQ==
X-CSE-MsgGUID: EGGGAeeQTUeLx5QPww+i4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="182736476"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:23:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 02:23:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 02:23:43 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 02:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSyJpYlYqjEpXav63eIPXy5K7N7+HzowS1F+XLDSfe9/Uy+UD1dVe9PoHdjFOnR6QxZkIHfRXWSdWYfC4V9zeEsVBic1SNqrdAsQN3QMM4Cb3qgY7QQqDZYKmVPEJA2YKhiBpddy9cXa/pyVFBGedYzMDIDxQdjTZqOR07D5kGZpDrHBAU/q+X5UjmphBGxsilXwX8l6oKX+lqGGUdBXYOp6z6xTatT4PlVLN7VywxacdezPEp486UuODxOGCeLC71XJQPMf8f7fYl7/GZFHE3BLPRJyjEr5L9GKDLiqPyvPRvaNJiAUnh8wGIdrT8/o2LzdKjWQqS2QlmzxodYGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvviklSbE9C+VF9RNjVv70QQom4Sr2e62ranP+o2sME=;
 b=eLdlVXDnKEY2iMdEORfLtLhzspFHhvDGpEppOLZMFtjr0GPXxUKppKEDwGxzBl/8YZjg2YQNHfoVQUOlucj0FcqR0W+u+lPYeWtizRMzdKkfbyhaPAu6yUnof7k9a3z3beIkg7CQCBLS8Vism5s5xfGSoYpA+CBUXbEpBi2RlhKmuiggoUKysHfWbiXST1HJ/eX1MUEplAsC2zJ2CXr7GRaJXjWxZWmqX/U/NqTs3WvNlSMmzCFmo0JKO/fPsTa8WD78cr8EwwB4i1H2rTaSW/jbmmeRAdoLk3tKl3JNgsj3oMi28W7ASisBLWFMg3X+Uo2xch7rd4++bOb9SI5upw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW5PR11MB5786.namprd11.prod.outlook.com
 (2603:10b6:303:191::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 09:23:39 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9137.012; Fri, 26 Sep 2025
 09:23:39 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Aaron, Ma" <aaron.ma@canonical.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Deak, Imre" <imre.deak@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Aaron, Ma" <aaron.ma@canonical.com>
Subject: RE: [PATCH 1/2] drm/dp: Add drm_edp_backlight_get_level
Thread-Topic: [PATCH 1/2] drm/dp: Add drm_edp_backlight_get_level
Thread-Index: AQHcLsNcq/LsEblX9kWMgQpQhOaLmbSlMEpg
Date: Fri, 26 Sep 2025 09:23:39 +0000
Message-ID: <DM3PPF208195D8D72521EAAFDA64C84654FE31EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250926085401.2808634-1-aaron.ma@canonical.com>
In-Reply-To: <20250926085401.2808634-1-aaron.ma@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW5PR11MB5786:EE_
x-ms-office365-filtering-correlation-id: 7301b14f-1f7c-47e4-1a62-08ddfcde60c7
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?H5PUx/KIkN9n14SGN7thF1pvdNQqhJWnIhdyknvn0BpB9dNuQpE79uYTmKy7?=
 =?us-ascii?Q?LZiN8Kav0HLmWPTOm2AQIrcJUBYlC/bJw89zftKjMilXWSPipYM94whSRQTJ?=
 =?us-ascii?Q?bzbXSI+y7Jw7bbwNj742mZ0Q3bqcEIPjZLDIvziYvA3Im3s9UVxVpHGZEgwN?=
 =?us-ascii?Q?RThxSCcfbgqnXqsCzMmZwpxwkrnlAwUSOGUL0lGjgvO51ob2Mq5IJo/Y+Umx?=
 =?us-ascii?Q?g3/aS/utBTh3sJL28g+KQXNlCOXXP1km3Sonow9GQceTDuL5zz0h+/p3O6Qa?=
 =?us-ascii?Q?yp7szj+bYBVOa7360vuJtkjQJz56hELd+80Tj/yZ0sEZbc+x5NYSj2IHu4B5?=
 =?us-ascii?Q?XOZ1mHQhJQmy4RM2P2/VirOABNyIjy7Dk3B71Cr6xt9W2OBXmv/NlG07BB/d?=
 =?us-ascii?Q?qhoiFWsOuxDEMoqCxDO7rGbG3eFIR4DwfJ2JCPHhIKUM09+OtAVTIiVpU7QI?=
 =?us-ascii?Q?vZg67OMfvnjASKx837XiPLqDsDZP4Q40DvvJBakKPiSMQvgh+IHtUxV6yRT9?=
 =?us-ascii?Q?2Dza4b2inyL0g0JUU09Ip3rXBfIuTWcFP7kAaYirfem7GewarLDra+BA/Djy?=
 =?us-ascii?Q?U6TELnL4GCjkzFm+7109Jfdp/z4kfINaaXOJVvab1Ifk2BBqU2Dzklk/cNg9?=
 =?us-ascii?Q?MQTPdl8v6aBEBRG8r1NTqFXLQGzfoXAr6J87l6/MPmzx08OLjC4zHJ/O2qMh?=
 =?us-ascii?Q?O9uYvAWhgOb1pV8OkmNlz+fmU2Pa4YCb0bAk5VaytRoBQLX+1WTz/+a0FD5O?=
 =?us-ascii?Q?lczEcAg2df7jY7U4+2Y/SLgabduhFEgAJpn2zDavOHYnMXpag0GFqrGV/Kj5?=
 =?us-ascii?Q?NBtaQc2vfPYvBccYgY52GKgWMakI1aThoG6HO1DUNxgQza4BgG2ZXFlgbkE7?=
 =?us-ascii?Q?9gfK0yTj8L4Td02/2UpvrCugkHDOaebnsYdf+RuoHX36L9tTadhZmnyaucab?=
 =?us-ascii?Q?Q/TSiIrPDC/8U69SWO8B5nc1/2x8w3KgGJ/BCcEXgqs3wwX/0Z3JL7Q5iEcC?=
 =?us-ascii?Q?xK4iUAS0v2czD3qytSLfFLc3I8lhhByibJNEDfnB8VYexqtlVicsB9Ba2Wot?=
 =?us-ascii?Q?NgbaSmbXu/OFBn0re+hK/SNLfxe9yFymZTeNqhILpDtCoamqPYobhJ54KWkL?=
 =?us-ascii?Q?Ba7wCbEp/2i1LaJUMLDZ6hMv/LheEYiMReRu821oENGnOVNMIQeWwzS4i31j?=
 =?us-ascii?Q?zM1vtPPyOWkI9l9Gk7Axb6FCYOm7YHnYlDVOlYLO9d8IxLBA98qEM/QbY/GF?=
 =?us-ascii?Q?9gLxfcL6Ou53PKDOQIWOlrq4JnAN5fk8IypE2BNKBPrSOHkGS5YZNl0DjnbZ?=
 =?us-ascii?Q?ZowPZi8mdriH3Q5fKhIsBV0BWwzbUTdgk/vwt6veURCV7upvDryAKAuSg1fT?=
 =?us-ascii?Q?JNoXDixiY9kJUZi0v19uNqPd1cnmxTM6qaazZqQbMvwbi7EGfdloR8d1S1qc?=
 =?us-ascii?Q?isB4O0YxnmEcnUZFJT+4EHf99bx+2QbbXilc3Wsnlz882C9RmCpX+djmMdbK?=
 =?us-ascii?Q?FrOk9rWQlQXUDaCJ+mfiqiacKzyna0pXQASq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3Cg3po8zgeclmzgwgX2Wqmr4v+vi5UDdZvp35t5Hg1swnmNX4FTTYeewCQDI?=
 =?us-ascii?Q?APBJLLdAa6y4HdJa+OCNbBZrff0WtSdhtvdJin0wpTnvcqDSMHkcAnwhtJKp?=
 =?us-ascii?Q?Rst1apVtNiBh2nNWM70vX/6c4V2xOxhX+ldtT0+ys+vx+TDmTJMcySw69Dba?=
 =?us-ascii?Q?F+X9M6uyygrVK8ylj0Ig1n40V8di7latBCyhqQHl0Zvm77BsSzIKhI5Srtth?=
 =?us-ascii?Q?e6W881YW7Z0E7k2vh08UI+VVRebLWJ+yoAcntkkRTLhQU/2KBjyrhwkTlMPT?=
 =?us-ascii?Q?fSpGSA0MbAPWg/VHHf6KWT3y+9SVVJkMO2Om8c73bFVHtvVdgIy3Ix66OuS1?=
 =?us-ascii?Q?FcFn2CaeekWav/QJjdxp69hRJ23m1cc6uqMJdB/6QN37DCi+68gDZwfzrv35?=
 =?us-ascii?Q?j45KiPevbW6NMtm76a7CZFOifwqDQBnywgqTlaKs+vHHS9v5as/ht2e5/TTK?=
 =?us-ascii?Q?jeVWe/1m3dljGCz7b8eMxQKD/QUqE/Q6I/j2UKM7VSu0KdCHjF/UYepB7ByM?=
 =?us-ascii?Q?8FFpX7NwYSXmWa2QgIBq2iO47f+nJ/WucQ4L9u75rOSxfmmP4lHNGSYXrFbf?=
 =?us-ascii?Q?Nf6J9C8pOadRu87u9OJblU/q/pI4h4T2YdcwDPjRQlZjNA77AkaA8uj8Xbsu?=
 =?us-ascii?Q?L0XuaRCmg2flUj1VdYYbKYimdw34tcN0U7NgdRnv2xkkzFl40a1Rjhl68p8t?=
 =?us-ascii?Q?/HPQMUZ65W10iM/Mjbx2TLDFQ6JA/oLUhSAthbSfXhIdBbQoJ/ZfLBaL5Df5?=
 =?us-ascii?Q?VaUXo+ykaVD+diOQwpMqlDDjHXhoZuuZg6n561zT/QMoKhYUWAOqwjhmc4N1?=
 =?us-ascii?Q?HD51UbxcYumg47p2quIUIJPoSOsMAnaOF1eD+k+zpeeAHHO5o24Uw6g1Sm06?=
 =?us-ascii?Q?QTdv12Z5DXmNZOXSRdzHTWdCtb6fYmLbThkpCaiysOqcUEGyYkStaCJOXUCJ?=
 =?us-ascii?Q?DoPJ4KXteTRbruqRSbzNnIQ9I9v8UoDXqwLLpOWri+Cb3jDy8+TR6DBFdNU1?=
 =?us-ascii?Q?3BJrXy8J4mgP7MFWhTCsXU/K8q9V3IZLwzboRQTYE7zDOdyFEVtlIPcWYVWs?=
 =?us-ascii?Q?D/ASL41gWS+XN8YSYFaSqN7MAysQyGFwngD85vo3FE7UBeOYptq9R5RrmSJ5?=
 =?us-ascii?Q?5ufZvVIy3zsSdrdWYOdm5L+fFuSQaaPctNTbgNXku1eZR6YzppY42bt0X8u4?=
 =?us-ascii?Q?vMD+SQ60mQhQKfv09p1vi3eZn3NRNhp9LzbX5njsALc788rEFr/E9v3PFNv6?=
 =?us-ascii?Q?ieU9bu+fSqn2UvyXMcORSCKOAsohlHwFdtB46mT06eTlk+x5wdGTLo2FRf0M?=
 =?us-ascii?Q?kRmE1AzOkzLQnROV4AmwBz5+clI9KspO7YBGrn/dtqql30gDJp3D0iGraRg0?=
 =?us-ascii?Q?sA3PXz3YVNW9p9Cm7Erw+uHT/KtLC/0ZmK4qxArwbIUm8qJLznM661cM1iQh?=
 =?us-ascii?Q?dhY8PubCmrkpJAHYWA589Qhv7Fo+zut8s7zlpCDsPlQepMqzody41DfLroIa?=
 =?us-ascii?Q?NNDyGnsMxaO6zVHd8jz2qfOx0dHmi4XfJCXHIzFdcyDUiLBmOz+wPWRZPBtx?=
 =?us-ascii?Q?PmL4McwGn+w1UwWgp7pHcuOtZayF954WxUW2Imoo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7301b14f-1f7c-47e4-1a62-08ddfcde60c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 09:23:39.2460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KW4RvP0TbKZ6KjPAPk6km+j5d8Zg+vQCDYxf9x0h7QHdMlRGgDe/O5cvqmVgvraMJaBB/6EyfLoNNAW0GfK10g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5786
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

> Subject: [PATCH 1/2] drm/dp: Add drm_edp_backlight_get_level
>=20
> Implement drm_edp_backlight_get_level() to read the current backlight
> brightness level from eDP DPCD registers via AUX channel.
>=20
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 52 +++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 53 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 1ecc3df7e3167..0cfb357ebd9e2 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3945,6 +3945,58 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct
> drm_dp_aux *aux, u8 color_spc)  }
> EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
>=20
> +/**
> + * drm_edp_backlight_get_level - Get the backlight level of eDP DPCD
> +via AUX
> + * @aux: The DP aux device
> + * @bl: Backlight capability info from the panel
> + *
> + * Reads the current backlight brightness level from luminance mode
> + * (24-bit value in nits) or DPCD AUX mode(16-bit and 8-bit modes).
> + *
> + * Returns: Current backlight level.
> + */
> +u32 drm_edp_backlight_get_level(struct drm_dp_aux *aux, const struct
> +drm_edp_backlight_info *bl) {
> +	int ret;
> +	u8 buf[3] =3D { 0 };
> +	u32 level =3D 0;
> +
> +	if (!(bl->aux_set || bl->luminance_set))
> +		return 0;
> +
> +	if (bl->luminance_set) {
> +		ret =3D drm_dp_dpcd_read(aux,
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf, sizeof(buf));
> +		if (ret < 0) {
> +			DRM_DEV_ERROR(aux->drm_dev->dev,
> +				      "%s: Failed to read luminance value: %d\n",
> +				      aux->name, ret);
> +			return 0;
> +		}
> +		level =3D (buf[2] << 16 | buf[1] << 8 | buf[0]) / 1000;
> +	} else if (bl->lsb_reg_used) {
> +		ret =3D drm_dp_dpcd_read(aux,
> DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, 2);
> +		if (ret < 0) {
> +			DRM_DEV_ERROR(aux->drm_dev->dev,

Use drm_err here ditto for same where ever this has been used

Regards,
Suraj Kandpal

> +				      "%s: Failed to read backlight level: %d\n",
> +				      aux->name, ret);
> +			return 0;
> +		}
> +		level =3D buf[0] << 8 | buf[1];
> +	} else {
> +		ret =3D drm_dp_dpcd_read(aux,
> DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, 1);
> +		if (ret < 0) {
> +			DRM_DEV_ERROR(aux->drm_dev->dev,
> +				      "%s: Failed to read backlight level: %d\n",
> +				      aux->name, ret);
> +			return 0;
> +		}
> +		level =3D buf[0];
> +	}
> +
> +	return level;
> +}
> +EXPORT_SYMBOL(drm_edp_backlight_get_level);
> +
>  /**
>   * drm_edp_backlight_set_level() - Set the backlight level of an eDP pan=
el via
> AUX
>   * @aux: The DP AUX channel to use
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index 87caa4f1fdb86..0b045a47ae573 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -864,6 +864,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux,
> struct drm_edp_backlight_info *bl
>  		       u32 max_luminance,
>  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
>  		       u32 *current_level, u8 *current_mode, bool
> need_luminance);
> +u32 drm_edp_backlight_get_level(struct drm_dp_aux *aux, const struct
> +drm_edp_backlight_info *bl);
>  int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
>  				u32 level);
>  int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
> --
> 2.43.0

