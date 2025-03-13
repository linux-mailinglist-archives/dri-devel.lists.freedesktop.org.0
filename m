Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A64A5EAB5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 05:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C153810E7F4;
	Thu, 13 Mar 2025 04:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4gyV0ba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CA510E7F6;
 Thu, 13 Mar 2025 04:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741840939; x=1773376939;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=rQtb09bM4+u9bjF7dZJ9c8/BfP+noGkmkK9Z6AJxTio=;
 b=g4gyV0baeKp3KtRIV3lUX6mkkbUGg2VXlTt/R2HARMJEt2kKDWhxchln
 Et41b36W/h+yM66O7QUXKCfqGZWI9rxqJ5it7mRPCBldg9MgfvtzvAsjp
 Zgg/Que1OJrrHcC3JNhMOJKd/Pmxd0FAef5ZbB1TVmwXV2qFDeMyJgh1S
 XkhHX2h3Rhl/cUMxjXb+K9EjuBoxpvdbbUb9iuCryNuCxxvjfUU2ydEzo
 dulgh4VaylNYXKMz3N5RG2EpJ5erftyhPq1+EqVdjSiMX9puYPbu340CI
 fyzPLxisz1NxyVcXsES+slBAT1K4/JA6O0AclElsGKGoBFtFMjZNEI60w g==;
X-CSE-ConnectionGUID: MbGAmu+sSTa6rnrLtd2NbA==
X-CSE-MsgGUID: TgMhyzFgQd6/Utfsy2JATg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43046016"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="43046016"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 21:42:19 -0700
X-CSE-ConnectionGUID: oz3nrnkWSCytJAvu68UrvQ==
X-CSE-MsgGUID: iJuDgQiDS4KKUx5LF3PMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="126018432"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 21:42:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 21:42:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 21:42:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 21:42:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxmIRbuodWJaaGX87B+FTqZTNiAVUtBYjIjR7Y9uE1A9lt+av/djv20gafRC1Kv/szRuXJUjiVAKVWr95/fOd+AiFsbTRNjYfOPDZAIych+TQqt9PINb7V2IVKMy+d1IJKFw7XdpLgkJEmHmRcCOTmgVz0Mfc3HR0hqvfOvbYwcRtvGT88VpQ9DQ7m3mmolXrB1y3/ndXoyYDYgcjC3eJmyGXHJziK+3wWAHhuP7SOgkjyNCyMi5nkXcmBjSRuMaXYWt9HDb8YTaYVKG4HjR4bRm1p9M87Dotp2gaGsUvQNxQIcxvsJ0+gjClvTIcHacCFMcp6wO0iuVZka50Kbopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N57Rqn/FU8EdHWwCwjH5SblTYk0RX9NhYiIlmi9yIvc=;
 b=y+52cIvoHJA1sH43wT/huBsJsLtXlNXAFItDcf07hOW4/Yms5B4HjSg/kyZ2AzQ+rq55mpagJFBKktQTWtRJoRBur3ICfY6ZdaqsDlgKF/dgsB4WmuGFJ/XgBCNwNHKiNwpgkYB04C6A1TpE6hh8cyy/NyvH/HxvrDU0FXLj6nqphzFZPN5oxZkaFWEr0iZUnNaBK6Ch5+vFmgCkQ6yGqgig90FfaQTVZVeua7vXUXUVCHHkYEFVV3Iaq7Aqh/IT3KT/1ycwegaquSYUVs7D5Ph20o1I0I1BmnFGK+SR2MeZoySlqspGldUV5n+qCuosEnXsVN/3weUyJxRLz55Ang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 04:41:44 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 04:41:44 +0000
Date: Wed, 12 Mar 2025 23:41:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next-fixes
Message-ID: <fsztfqcddrarwjlxjwm2k4wvc6u5vntceh6b7nsnxjmwzgtunj@sbkshjow65rf>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW4PR04CA0373.namprd04.prod.outlook.com
 (2603:10b6:303:81::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f8f1c62-29a1-4ae0-8613-08dd61e95af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NJ248LDGuezrU26b+sKWO2WWxVIE7WFVOIb9+5k0Bo9VUWh0OhZK6Tq8yO9i?=
 =?us-ascii?Q?r5Ftv6uMO1zwgmssuOLZZxwqoY1m6jabGYrWQTP1Se3D1z8b68yatoW6jzzU?=
 =?us-ascii?Q?v7d7fGmSiKe84JbXhitr+toBxgcq8k01lambmPXddkVl/Aonu0EWpxK3dX71?=
 =?us-ascii?Q?NAul4idI7LZUqPViOwB57C+7vGPk2DRT8R7VmjEBLy3ylLLC6bklEj02EVne?=
 =?us-ascii?Q?oE3Mfj1LhUHPXmsX8v38I/0tfEgDcWt/d+S+ARMpdXq57mTn4zrF+RfjeGuZ?=
 =?us-ascii?Q?jkbNSwB07M5Baxwc3XwQNmzvyzUKyWKlvbaO9V/taOi9AsuOElGpAC7mRWru?=
 =?us-ascii?Q?wQ7O+rWcabNhLhYVSVg7/0mDW31/sY8c+gRogvOeB5rII0Auya0iW5bCQ88m?=
 =?us-ascii?Q?bJjNrqZQG9qRoJI5DItcAiaN3zrGl2K2pSYxyqihF+qfZbrtokH/tuuA13qF?=
 =?us-ascii?Q?hXNQ1dKRwWF/ItZYwnlzPfjKJewiwk87O4pk9XwdUOrQBHKpXEbsuVZvKBi7?=
 =?us-ascii?Q?xD7ZOpJFyQxuUDlubqrOWZz0hK9uJnVKvkXsN1EgPB9plWSD2AI3mdR75UXu?=
 =?us-ascii?Q?6w9GEoZ7YMgIuOA8gfJsOPIzL+60bgZSGkFXygXMTmp0tjTaGOMT133j9EzQ?=
 =?us-ascii?Q?fAf25+GDTnUVS1ptefnnb6JFlp02meWU3V/74hLrPEH8aUMETcvL3Elp8Ell?=
 =?us-ascii?Q?mI4il4umqcAmV/GLFcHtwWnWEtrAG6vvaEB8ff2QIkprOx7WPOX0YDrwuyBi?=
 =?us-ascii?Q?5L/r4HGgiv8RRaSSx80bbUDXbS9AYT8t/OTGTLxUEfJbqSNzjewFcABvNp7+?=
 =?us-ascii?Q?a3cckk1HCTbTuLB2gJk7lQwubofHb2dLmoAj47UbPxSJw7ntdb5BrN54bWvx?=
 =?us-ascii?Q?WeuARY3WCw572yWiwXYDpvRlVPZEp+c7K8O+eqVQxpqR+R35aUxgmB73i84q?=
 =?us-ascii?Q?uA5mb919cXhwYQupr3ivgmTm08tjwv6uejivQFBAE9d7zeQFsG/yGp1oPAjX?=
 =?us-ascii?Q?uaHBBr3xxDBXr8gslUIKgIlBVXbL1OPcvZGRbV8/t19IB5tfwKvMY91vyMy9?=
 =?us-ascii?Q?k3oMNZlbzl5Jxd2TmjFnkaV2TxYlixMQeWdvBNRex13k0iG+4C0A0ie4m34W?=
 =?us-ascii?Q?GEJPv9leoMGeDftmDQAWn7m9MY/e0fCmVrQZFp/RBXTRbb4DSFLUWxlSdHk5?=
 =?us-ascii?Q?gFtzabU3+Obpq4tWCj2iB4AK6J+W2M502jYazenwPpASH8M9jmgxqfRrrRRx?=
 =?us-ascii?Q?u7ljyeXXUxrjLYu/naSNSxyHbricIsZ4BWBq8YdhAuU5jv34eqXvZPgCnfEg?=
 =?us-ascii?Q?hfwDjgnQQ5gPR5U+0AD1TQxg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VVWeFs5ydTN5npvn26IXsF6M78EdKlT/1DEmA32NxL1DrazzEjsgz4RCytWb?=
 =?us-ascii?Q?12RJl8ABwpfIu0GBm5vHb4jkneElq2owuqT9Q1WNNtv2dJSRkH90mcNU9tQ+?=
 =?us-ascii?Q?s+GnXBwM4faXf8AyOQVQg/MX5OQHsHRWEwKE/3ZEKXK+ytYd5vWbdp2MVAfr?=
 =?us-ascii?Q?dXbGWU/KwUpoF8SjUlS64E4XCpZDtJvGKkAgqh5XWzJJcvYkgOWAb2IxRYQ3?=
 =?us-ascii?Q?4F2MOGQEwOy159cBHeHatv47/p+vPKWxilk50KJvM92wpnrbZB1UfLcK/2go?=
 =?us-ascii?Q?dBZ+UMgoiTvm8GUqlv6lrSiFFTHHJ7vyoopMuRounMxnrkZjqwrO4u8T36sf?=
 =?us-ascii?Q?1izCg5Qpt7w5joTNxiCiJSEw7VTELQbD7GxUs2JQKVSt98VnElXzOFCmjvpy?=
 =?us-ascii?Q?SaRG6pjvbJZ9VSgg9rRMnJHSCKeBPB7L3KPXSIhl6OaQO6TKJXFbHkl17pK9?=
 =?us-ascii?Q?nVrIOmxPGpHfW+882U9EAH/ZcJ8YopT+Uapd3KbaRbs4thsYOpznft8mmdbo?=
 =?us-ascii?Q?7OoNWwGCtxu3m69lYomCILeT7zINd3pL6HqVTyvuSK3HzDSAZDro/q0UAtdP?=
 =?us-ascii?Q?sDpH5Lf1a1lwGVvKXTBb3hAKWvhOYRVGKkmvEeR4kQLomZb0o/+z2CAiMqYB?=
 =?us-ascii?Q?2BPBZ560yQiwDnUln3wZz7jy4Xx+dSJTm3qiXT0aGLWl95nGKpAMXvcBHa/U?=
 =?us-ascii?Q?kfmpFJT9Bb6B2CuvGz8tzxGcW/W7w8FGbrmLv89v6J44L4pvX4q0mPdXCgt0?=
 =?us-ascii?Q?pjRxZKNl3Ulbo1AqYNSgDijDMzw6XWtjKyZ/a8cPpUppF8iVJnWdGEgaj4bY?=
 =?us-ascii?Q?2IhhqRL7UrDzw8UxX84HR1GES9tSxZKJL9KYYDildeuQIivSwLviGwLrVb7B?=
 =?us-ascii?Q?RKArN+BjAeE+xGwtzUNLABL1JtQ0OwLIZJiQwJh4bqw6AaBbsVpERbjA0LeV?=
 =?us-ascii?Q?qKM0MuhMZxztpFnTxHrNKXJYKm313/7nqY5wJ5aMu+hBl6sVU0QfGUwpSL2E?=
 =?us-ascii?Q?rlerCNDNkXb4pJJQov3lJpzQiGJ4XgRNlWXsKoyzHAGYEhLlYZnyqd4f/340?=
 =?us-ascii?Q?gvQRz0qQ50zxVYtqm9q+5pGK3x4jSN2WPuhpiiJuqI4Aodi9x+x3Cdf19NKQ?=
 =?us-ascii?Q?KihVloQWHSNmqhRJ2rUmTPyckxQPvszCOtF6uTq9hMKF6YT7SfURhx6w7Yzq?=
 =?us-ascii?Q?DS/oBqs20mu0JIr+v0mGJTuZwf+tEqu+RIbAStapQLRNJJHlMJuQNqsM4oDP?=
 =?us-ascii?Q?Pj+1YOiy6eSeGuPi4GaKxrFLk5n49j8uenl8uBoh4geNaaKaaYxumhz8tx5h?=
 =?us-ascii?Q?qNO4Xx/V4WQCeFrzYVpcQAPxUVdbld6cq0DGE4VBbcXYJP8pgwGZ49A/b0Ir?=
 =?us-ascii?Q?YyQIBbE1V2FaomETtccJM7hPqS+7asftDaktILEF1VXYxg3STv8/YM1vtEeN?=
 =?us-ascii?Q?JgtcgUWICgVsXkCwiSrMUkv7/w1Lsag3EwANnqDjiWf9Kr+Et9Ob4QxFJ8AJ?=
 =?us-ascii?Q?QEKje8GNNRQrTMUDRDbK1APVR29XoJnfvGpcILsibj++N0MzN44onLAg+w/Q?=
 =?us-ascii?Q?HnCjxwLMvaeEV38TB9ap1tLM+8BnW3y9qeRTPkzW5B0uv+7695wpO7qs2CCR?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8f1c62-29a1-4ae0-8613-08dd61e95af3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 04:41:43.9356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OL09RLcG70rDtVufwC9Rtrq5woWkByHRQFZf99GD6qEzW0H5Ccq0rIpBsiZn7SkEs4/gTL/9YdnRBczxS954q8sdOg2Ir/R8UwWSU+5vnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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

Hi Dave and Sima,

Here's the drm-xe-next-fixes for this week targeting 6.15. Without the
kernel-doc fix, building the docs was broken and there is also a warning
fix microblaze arch. Others are "normal driver fixes".

thanks
Lucas De Marchi

drm-xe-next-fixes-2025-03-12:
Core Changes:
  - Fix kernel-doc for gpusvm (Lucas)

Driver Changes:
  - Drop duplicated pc_start call (Rodrigo)
  - Drop sentinels from rtp (Lucas)
  - Fix MOCS debugfs missing forcewake (Tvrtko)
  - Ring flush invalitation (Tvrtko)
  - Fix type for width alignement (Tvrtko)
The following changes since commit 626fb115662c9fd44fcbdd744d96a45b0427b504:

   Backmerge tag 'v6.14-rc6' into drm-next (2025-03-12 09:43:12 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2025-03-12

for you to fetch changes up to 7b7b07c285c304317d00ea21c2a659167d4d4d12:

   drm/xe: Use correct type width for alignment in fb pinning code (2025-03-12 20:56:58 -0700)

----------------------------------------------------------------
Core Changes:
  - Fix kernel-doc for gpusvm (Lucas)

Driver Changes:
  - Drop duplicated pc_start call (Rodrigo)
  - Drop sentinels from rtp (Lucas)
  - Fix MOCS debugfs missing forcewake (Tvrtko)
  - Ring flush invalitation (Tvrtko)
  - Fix type for width alignement (Tvrtko)

----------------------------------------------------------------
Lucas De Marchi (2):
       drm/gpusvm: Fix kernel-doc
       drm/xe/rtp: Drop sentinels from arg to xe_rtp_process_to_sr()

Rodrigo Vivi (1):
       drm/xe/guc_pc: Remove duplicated pc_start call

Tvrtko Ursulin (4):
       drm/xe: Fix MOCS debugfs LNCF readout
       drm/xe: Fix ring flush invalidation
       drm/xe: Pass flags directly to emit_flush_imm_ggtt
       drm/xe: Use correct type width for alignment in fb pinning code

  Documentation/gpu/rfc/gpusvm.rst       |  15 ++--
  drivers/gpu/drm/drm_gpusvm.c           | 124 ++++++++++++++++++---------------
  drivers/gpu/drm/xe/display/xe_fb_pin.c |  20 +++---
  drivers/gpu/drm/xe/tests/xe_rtp_test.c |   2 +-
  drivers/gpu/drm/xe/xe_guc.c            |   8 ---
  drivers/gpu/drm/xe/xe_hw_engine.c      |   6 +-
  drivers/gpu/drm/xe/xe_mocs.c           |   4 +-
  drivers/gpu/drm/xe/xe_reg_whitelist.c  |   4 +-
  drivers/gpu/drm/xe/xe_ring_ops.c       |  28 ++++----
  drivers/gpu/drm/xe/xe_rtp.c            |   6 +-
  drivers/gpu/drm/xe/xe_rtp.h            |   2 +-
  drivers/gpu/drm/xe/xe_tuning.c         |  12 ++--
  drivers/gpu/drm/xe/xe_wa.c             |  12 +---
  13 files changed, 122 insertions(+), 121 deletions(-)
