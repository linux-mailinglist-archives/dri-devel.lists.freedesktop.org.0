Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9FFA252D8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AA910E361;
	Mon,  3 Feb 2025 07:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxEzi+PR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E4C10E03A;
 Mon,  3 Feb 2025 07:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738566772; x=1770102772;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=QxEzi+PRIqhMlJs1VlQXnTqyvoNTlom2Q+0MOAzbioPGopXOuhmquLBK
 0sSR2TqxBn5om2RQfenM0I0VwiUuNyHMzlFbwjyEHxUeFNRdkNsLtyans
 T1jxK/oiPo6YEgt2b2QWQxBUJndqPz96yRzLvPl5qDfgA17bMun7R42k9
 dlD+GLYsbbFOE0g2KcvPOpcqrcztaWb8O1Dx/S1GbN7CZjDbXvc7EfvF4
 HaPWkFfO7b/XtU0PPuIgIohBnj3iam1rvCD2hLd/lchMnC4InAARBYZ7l
 Kbn3saLm4Q/P8d50eMoFmTZqLPpfFgySfNeiOvncaztFVLALCE9+uNW9N g==;
X-CSE-ConnectionGUID: NnEJ7/3FQm2FJi9EnaE3fg==
X-CSE-MsgGUID: qswyQ8QgSTKJyyXoICTr5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49306396"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49306396"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 23:12:52 -0800
X-CSE-ConnectionGUID: mPQvpCqkT+WFS6nHeZpxHA==
X-CSE-MsgGUID: 9E7QRmZgQqifAG1GAA/MBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115188366"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 23:12:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 23:12:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 23:12:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 23:12:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NR0HyScYi3nt3xnA1KKjZ8HvIUOv9uNOSRPqol3VPL8qL0upwUqSBZ8O3mFUpqo2iQl7VMgM0OwAKlMlw3knQqQX2fvmd1J3IUIwnDRf3in2pa7I9FLu6dtkrJ028j/1vDpsYGlX6qthhMCrfdsT4FLIF64tvHixrksGAkok6g1K7zMjqa2+X9A1E8yDyloCDfYb+5Yv8m6iZd2OkFD2IbixYdEv5nqkI+gasFww1WrNMbmfrEb3A9VBe9zBsToL24IHpuTntj/d4ecF9PpxKKyh7h7MU6OTirtk3eeuTmRx+7wY5BK+fJqUwU7MfNlRwKgeJGYcbGMIQuczSR+4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=XoNfXroyTMqJoi5WZ0kel7qlRzeRJw3+6ht7DSPvnW5DfZmJAd7oS8KiG5bD3+Y8mXTQeyDXxEDObI05zqwdH9eNsakeHdqnyyN2CBuaLp2aWNUyQecG9mokheYqU+2S0oq/SOu357GNdOYNfLLe1KdigmEv7Fn4sO6u+SBQgU8gvd/Bnt2NdH4+56GOcdpL5lZwL1+DyQ8n2fIupFd0KyS+/QJoL48CuaJNCvCJldz4qdY1pxvLxWj3pAKm90F5P22h/nItVVA93K4WaB32mZ1pnBvxEvXLElBvVm/upoywMbKOHGPy0oh4qxRrrwN4zAq0e4PbWH5qTP0F5MzwOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 07:12:29 +0000
Received: from IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b]) by IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b%6]) with mapi id 15.20.8398.018; Mon, 3 Feb 2025
 07:12:29 +0000
From: "Kao, Ben" <ben.kao@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 5/7] drm/i915/backlight: Add function to change brightness
 in NITS for VESA
Thread-Topic: [PATCH 5/7] drm/i915/backlight: Add function to change
 brightness in NITS for VESA
Thread-Index: AQHbbiN4YKbirKnq40+49Z/x3+VuIrM1OZLQ
Date: Mon, 3 Feb 2025 07:12:29 +0000
Message-ID: <IA1PR11MB7343C34D6765D20553EC4E77EDF52@IA1PR11MB7343.namprd11.prod.outlook.com>
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
 <20250124054631.1796456-6-suraj.kandpal@intel.com>
In-Reply-To: <20250124054631.1796456-6-suraj.kandpal@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7343:EE_|SN7PR11MB6775:EE_
x-ms-office365-filtering-correlation-id: 9b0e125b-f4da-42d6-a7d4-08dd44221f1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?pTGWGVMFUkLq8SS7HgYxtUOd+3nKFXRLBBHMd5Py+eFgHJKPb7JlAsc9RgAP?=
 =?us-ascii?Q?4YmwFuLunoLKCczwtvM6RYxVaEsKWWtXItM3ztjJksyEMZ/+G3uU4o4S0mVq?=
 =?us-ascii?Q?mKlKjRWqXyGTltz/Ta0XaIKq8FUl25bSvywfx5c609Ijpg0kqQFl4jPOw50L?=
 =?us-ascii?Q?N/G8SV+rvBYu5VgADyT/HMq2WXHM2Z3DgZX/EWjr4hSYTOGZ9+mGjr08dG35?=
 =?us-ascii?Q?jW4gnpKw6rnVcjOx6ATZUE10756CGYi60NXm0ct/kpKPeBTUPNJFz07ylv2n?=
 =?us-ascii?Q?Y+hz5HWDt+uJrMwJ7Zyo/8jlhi9CWKP/OT7m1YSb0eZVgPJeghNYWU9BvXU6?=
 =?us-ascii?Q?6OdTsBm2MHnkg1Ecx/NOZSp2XFMjACWovLpvoY0uNk6QymE1Jml+IA296o11?=
 =?us-ascii?Q?UIDCS38sE1awBS3WF2BwSvP2KWH5SOH8ARvWrtU/OfRkoiUpw/CU3pldwgfo?=
 =?us-ascii?Q?NPehv+ZcMkrCxjZpIMu10UFy60N8G/3eCZjHtvOjVutSgkghZY4Ssj60WVvZ?=
 =?us-ascii?Q?SNYcCX0z/2u7OKbyWSzZHqqyrQRK1ZjZsEhNd+AiidewaSlZsS6H1aSLLjRK?=
 =?us-ascii?Q?vE6HbifzrhBTEV7hwVbtUNNUdjGlPXtY1CDxe1jfHS3EsmaPyHVzc7nY2ZvP?=
 =?us-ascii?Q?E9wRZkiqnmDUETHa/sUnbDVhU0q2mZ+dnifq6+rAD6I0yJSy2Giy1MGZNzLQ?=
 =?us-ascii?Q?aK4xZQdsIH9xXGP6q+XCh50Z31cA+DbsFV+hqJAIbRwxZVSE0yEWAXlwvITM?=
 =?us-ascii?Q?Faooeqlve/mViAtQXKdT+Po1eTa2VOnlEg1awaZs3ZsSofwA8079vtHKExWe?=
 =?us-ascii?Q?R1ilvjNuU4MSQBb5UNSaA7txxtn4bPGCJSFd87B6BXEEbMt8mpWxSIHG3Htz?=
 =?us-ascii?Q?/qo7UJ0OLjagtzE7nE4AoG9ivl34GphblCZ3V+e2mGksfpN404Pm2K4Jqwiw?=
 =?us-ascii?Q?Kp4BmxjwfShZjbtF0ClBDgfdKaRIOsSPmgE2gv0gWawM7W2M1VLcwxrOVmmY?=
 =?us-ascii?Q?Qn3WGXIdrmrpsdVpIiHat5HE94EnaW1BSulnSdgphR43u3I8Ql6b86jsXVgJ?=
 =?us-ascii?Q?2zX08Ec4X5aacjfww9VgzwqWc06M8serXGgUtbpB5nhBc82ue2TNFNq8Oa8D?=
 =?us-ascii?Q?GJCgTlynBRJq/PQ2f1Gb4oWwYsOrQ/cHyIjXq6+EPKq4RgifT8Cz3EiKQZuC?=
 =?us-ascii?Q?jjYeqdpuF0iNvPfqXtLbZSvxiuD6PhSfbgl0hmgTSsKHFOrn/iicU4U/rrUO?=
 =?us-ascii?Q?fqOvKjyxeOHwAMxmbeeM1ql5zIZ/yEqheb1y0A8UI0rBbqzfMCSfYBswyh+i?=
 =?us-ascii?Q?mk+L4Hz3m5uy+8HmcYI9eEttxSaKsPPwN82EsrBHpluwzaJqAV3sJXQAMhy0?=
 =?us-ascii?Q?rmKpc12FNLF5IEmLcvZCDoXVMb6OXkz/kS8Rq/uHXCD/GVJHLs/YWI7XVy6X?=
 =?us-ascii?Q?xXbv37Xxu0b9e+qfDN8Os3xxQKwSKFF9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7343.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K81e3og+F9sM9GSqTsPp6AwnTLPGWH+hoIOHBayveO7/wtojltCPtbQUFXNE?=
 =?us-ascii?Q?L2J5on8KgSdIWSpZKgFEEgybchwR9iytUVhC1V3usVu+PUb3nrstD2gHEn+o?=
 =?us-ascii?Q?4ls8Dqlk13AHlcpUrsji1GZtcB874mIQURNpUjFYGqnHhlL1zEsNud/ikhxC?=
 =?us-ascii?Q?a1cR3mLlFRt5/wXP0bwwMBr5i5LFPD8+ETjrrrYAh0fk8XGCoQ1+eLS0gQH+?=
 =?us-ascii?Q?bVyohFrP3kOCrxSeM8xcAUqGogJhI7G+g/BjRzh+NN88Kt8c3ELKc8XfDI5i?=
 =?us-ascii?Q?1MtTTFw8JI2MHf+cgdms1p3rWNxvB3SEZT9XLdIa8UINQeB2UlcCQSzGez6c?=
 =?us-ascii?Q?Kwxi2Z71V/l8H5oxWziE1ITWvxZAA1IvGBAY4z+765aT1qqO04a1XfCYfBZ5?=
 =?us-ascii?Q?CByeGh+zw6CgOqyJfh0RfL22uHDhuJU+mydvkI/3+FhSWzyutlG4TaKj6BeO?=
 =?us-ascii?Q?g1SPQOf7ueBsILOHk8AO7EykLyDa7o9O6XkgYfZNUFkMsVGmhxUAYIdCr6em?=
 =?us-ascii?Q?T+lzm3IkHShv1IRpwiFidxqCY652cwqdzaDTJU1+eRENcMOeQBYIEkadkZ2F?=
 =?us-ascii?Q?m0KQhN5HsO/3pbL58Ift9RCQPPcI761VXeBgdwI2rz9xUA4c6v9mAmUbguze?=
 =?us-ascii?Q?Z0kIXXaXayuPhBLylUQGevigXa5sDH19X/Sy1JoJPM7DlaJMa/0p9YRAE4xq?=
 =?us-ascii?Q?H/AlYf8sNa0Lb1H6sY6/N8OgjrgcKbQkvrk9BazgfJfljIYTJxtAkdj66Wil?=
 =?us-ascii?Q?CyY0jAQd/J1oHfYR3Sy7Y8tsLdmdNtBqSanqvJWY2pQxNxvnOLp7FDCe7xmQ?=
 =?us-ascii?Q?6k9MjVuonPL5szlY/tPjyiPHHEHgY8BKn19MPmsoVkopy1G/qJLYOmKWn02K?=
 =?us-ascii?Q?UMXB2D8agOvnsPDBkAz3hvt0KEVT+oEBX1E1HDV539HZZmTxVM9UragP/hV2?=
 =?us-ascii?Q?2SwkN0E2Ac4xzr/IjqDdUpT7xhv/vrLi55kSNJpOgbj6FCCqljAOAgmzUQVH?=
 =?us-ascii?Q?5urfOURnLfryTLDrBEI+hXVhbWIstyN9tUwS+S8zuZeWnQAvwMNJvNUw1BTA?=
 =?us-ascii?Q?BHXzjq8uI3wwHQE45hkJc5k/LHlVyblMxd8PFtSFYG8s4P9u5u1dNZKe0bKq?=
 =?us-ascii?Q?pPFVzRB8zkXc+V+AUm0HX9Y9JZczQmgg7E5MrATKdj3MmPDnbI6V9SrVbH6f?=
 =?us-ascii?Q?XnJ1E5UmOhoUbuS3rr1POk4ZCQXvHNeYB4D8TYWJ8As6C3qyRBVjzVII/Sht?=
 =?us-ascii?Q?wn/Qf0hOpY+8U4rX4ZDPqt2Mjs2OwQw/bfE8R1EL6od3StOV7yTCg2LgeW9A?=
 =?us-ascii?Q?bxrqg1lT+42V6+CB3R//l2UBCN+YkhRR45oE8k2Co76PjConGJUyHwCC1387?=
 =?us-ascii?Q?gFVbLunVYSLF6+hYAPLQCJipWbCSC0BHIxDaTF82MXjZWRaPmykmGxt7kEXv?=
 =?us-ascii?Q?t8Ol3AXZhPMKVwtzdYon/E6PfXBEZ++mqeWIoTElzKb3lwm1iP3NLICNY2rk?=
 =?us-ascii?Q?1DLKUGNui9tpFK/jSalEiqK32y7J2mMZRwCr3Lty+Nq8EuHbtayB3Y3S0G++?=
 =?us-ascii?Q?JDPcznhklv+xLByL/FE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7343.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0e125b-f4da-42d6-a7d4-08dd44221f1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 07:12:29.7821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tsd9qQFmPC9WXIjo2BYWs24UGvi1TNF0sYDt5lyG25iYpfwG4+uqTvHAJ+LaCMAnR9zj76JMtIEJ4a+YUCSc+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

This patch works as expected with 6.13.0-rc7 on Dell Bolan.

Tested-by: Ben Kao <ben.kao@intel.com>
