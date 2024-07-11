Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4460192EB83
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 17:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B2010EAB7;
	Thu, 11 Jul 2024 15:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpouVRY/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E29510EAB8;
 Thu, 11 Jul 2024 15:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720711129; x=1752247129;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=5D4NhcZXUs53BNw1QHKXQD1QcnU4MvWU6YCdcqzCg5E=;
 b=SpouVRY/YCAxX5yKCisIYzi94ySRD06EeAky6WGxnBmAa9na+uZTHni4
 OlWQw4oVtiXUi7dSCjxhrglNYcHkFO9BIlp4Mgehfd41LdmU9m/VvBPpo
 okuqokq6dgDjtHowmavOeKtQpq5pOQD2rgMRKgS2HOi0cAxt5+18Tm4Cs
 i8mTb0LdyKUecjunkcNJVfoX8bdd12RoJR7ETrwKb+ttUgsJIiYbSysJw
 DvCoYlDarZyCtlILKpCr0RFdAw9J8xoSYuBG09XUx40lqmZO0OnPxpI9d
 CvLIsJ2ceNZCC0sMD8y98G8ADmkBIk5OsEl1Id6BSDfXpLxp9LYGNAxaR Q==;
X-CSE-ConnectionGUID: uqID+KxBSci/a2DZZpB5WQ==
X-CSE-MsgGUID: I+JsXYAPQZ6y1Jp7+VUoSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="12502398"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="12502398"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 08:18:48 -0700
X-CSE-ConnectionGUID: fH5trbNsT3+gSziW9lx0OA==
X-CSE-MsgGUID: ILwNOIvyQYeLer91aj20iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48660872"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 08:18:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 08:18:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 08:18:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 08:18:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2i1xuzRK5FzDstd4nnMK+KAAb4R6OQphG7V5el7rWD+Hv9UgLsPXUCc8c8t7cZBKKHh7le4XnLteT4iiM7bQZqAqdNjRNdGHrJePakqD7xp3jamEaabi0UpaiHma00/ilt/vIYFmV/YpKe1num67VPRvH4aJzGu0ZyBeCP/lk62elIdXjfMDxmJhMhX5+GosvM8s8TGg7P8yORrPsJttIzyK69t9eCQCrXT47TvddA6qnG7a4SX0J+3ZdBRd2pcYV6oMDSl/NApYGdZDEFZYfk1wRH5/eCDIcdYQLVE5pKzJ+kUGYbHlvEFEd1Fi4UpwMWb43gS0SRn6bU175NX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F74aQVSExUyerXtFJLlIo4O6jepr4CcU1O5bi8fuIvE=;
 b=Y7G6QJY7UPnZju1EwO9r6mk6suQSh2W/XqA+RK5Fxj+tQstRCHxzdTWKtGbUQif7Rdvq4QTgi5Q6d6GECswBdINc6iRolMXnnryLOVmHPlng+RAcDLm7xNkNeevSuJUjGqIwMbdYX1PSquX8GOHPFxj003s5GUdozpnICMMHiqRMhAoMy7a09e5/h+5ruFqWNjdR5rugXbdgLBG4F3rys08JTrg97p2Zeq1Cr6Gxh5A9kC23GFCZBqr62pBgcbg9wi/JwGOnnF9/eN3WBtijIpv/r+jetUbGl8tE2NIDr+BuD20v6qh34kjJsFCg7FxAXrZ3iJ8F3eotpg2wDO4uqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 LV3PR11MB8675.namprd11.prod.outlook.com (2603:10b6:408:219::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.41; Thu, 11 Jul
 2024 15:18:23 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 15:18:23 +0000
Date: Thu, 11 Jul 2024 11:18:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next-fixes v2
Message-ID: <Zo_3ustogPDVKZwu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR01CA0050.prod.exchangelabs.com (2603:10b6:a03:94::27)
 To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|LV3PR11MB8675:EE_
X-MS-Office365-Filtering-Correlation-Id: 8908e141-9ce0-42d7-ac96-08dca1bcb469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qq3jGDAxkk97o8jG/Hte44zVAoVI+bJ5M5WIUuXVOsL0i4OZw4/w9EAL8SmC?=
 =?us-ascii?Q?BqSCjAUa6YL/mV5O/Oxa5z91tV3aSd6fRRKDf+d+YV8uFiEv3hWue4iS8Jgx?=
 =?us-ascii?Q?f9rUK0NUH3R6irY6ATp6HrOmONTtcoyCWE78KkHuKNWcGq8sILSS7cykLngT?=
 =?us-ascii?Q?KvYvJHqn/zWjWIgjG/hk7Y0vA7ILdUbhRWETMcalwmhJmmdHZ7V5wFNH+fud?=
 =?us-ascii?Q?mp44qPiSYZGT3VjgyLPySwUFB8iHA6932/2dXkz6Y3RJOleRWBGyzWI5vjPr?=
 =?us-ascii?Q?7z92hq90uylhqzFDIBW1IjY1lJA1m/IFYGk/xcfIhrBnPxRPcLg558WPAGbN?=
 =?us-ascii?Q?RF1rJieAx2FOo8KN9omuVs9aXJHL9v9GJJe161B+jWHkjFKJ1X2jVpRpPohd?=
 =?us-ascii?Q?Rqp8FaZQHdp5smdSsS1cxcfhjudvXD4lKfv2bp+LswHaYbo+HxhkVLwH2x6c?=
 =?us-ascii?Q?++aT9Xsnu+sfoRp6QyZL03c7erncUXorONJWHItB5f97+RZSQx9QnWxWRnge?=
 =?us-ascii?Q?s9VTfkcEiRpX/91F6HwCWR5pnBo119Q8aiqva8l1DHAF0CmUuO5iZZwPGDmT?=
 =?us-ascii?Q?EMLu4Lii/C+MMalSXyB9OZD+3NyOkH41unTh/CzYf9OTZpLVpArJiC89ztGS?=
 =?us-ascii?Q?6h5tSoaVydei/0OgE425g3QN8z+F2p/hJujLjpI9oPGgtXQPQmE8XOO2l7AW?=
 =?us-ascii?Q?mATYSXfERUnCFMT/ztU0eunRrFoaaeWOJ/aBbfC2uA9/abh4wN86V/MJsNnK?=
 =?us-ascii?Q?zar8OC81V/PMYinHKAeAALvCUiXHiciR+vlWJoExYtdTMy8L1nJ6KhfMhqBF?=
 =?us-ascii?Q?+7LUN32+6+6dsuIsSY9KWygpGD98QXlLOM1fIRsPcghamsLVnW4RJZm95Izx?=
 =?us-ascii?Q?R/zoOhTn6f3r45Cqfr96PHXnG1CqhdPRppDH6qNGRjZ4S0Cxw/ToDj0uxWyb?=
 =?us-ascii?Q?Bj+LwBSb8obGtzRtt83Kf09Uq+CXxc/YklGLIRmnO9sFnWIQ7fIaw9kiFx/x?=
 =?us-ascii?Q?7WB/hA1XX6VEzuOCAK193lxV+AmaK5Vc2/7Vsxtoa/BzyDMzsouy3cU1NOrS?=
 =?us-ascii?Q?d5B31kqaZQ5mAVNxG8eVDSAehjcOfqaZ27jiwp8D39t/am4dPzo3HJmOzLF1?=
 =?us-ascii?Q?f4Nz0CCXpnYi6E6GEZWj5UbZVJ03lrXRDbPOlgf3OPgcXI2Uotj5cAQXuf39?=
 =?us-ascii?Q?VplgYM1v5lTn39MyFRJa4E8Lx0TYk0HA+sVXuYpiCxs5MmGTV0UQr9UxGNTq?=
 =?us-ascii?Q?Cmp48lJ51yZovSw17pS5Xjmco2siIM4/b4bQ/LXfXZAvhOwMhUI3AUKAW1aG?=
 =?us-ascii?Q?XX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?265ApjJZ4Zm/Sc0FpZIEQ8OsbafO8d2cYufxo7OIVWiy4SbHoBLwvZVTKeX6?=
 =?us-ascii?Q?epSvAHbUqkeTNSJwz70RRfFmC97XdtCMWEKziKF8PSJgWDopI6fTAaOY+Zqo?=
 =?us-ascii?Q?17nldRwM8u2MUm06/sHsCMIaFpeAq4Q0FEbX2gDB2itpV18TOdqE0uCTFBBU?=
 =?us-ascii?Q?9kxcBSoOcNV2eXjImxRbEYMc5ZtKNCHRLoJe7gXtxLemqMn3Sms4ZWdtAVdM?=
 =?us-ascii?Q?74OiAoTsuD0VkUhvulaCVDz7dqzcJpom6y3sFYXqNWV66Pnhh1YsBOULmO9/?=
 =?us-ascii?Q?jIbneAGpJQUDHgk1tQVRCFe+UyFWe3mcRacDiciCHv58vB77E1UggsXVzyYO?=
 =?us-ascii?Q?zKNfqlGUQUW9+gVNNM0OTYtQlOPGUQu6MXpLsv2qNJdJOPUg70vDkT4sBL4Y?=
 =?us-ascii?Q?hqGc6D8zqF9xg4f6Rf6NB4JpejhpeE3B0xQbkyepKo09VP4H1aahe1cOSTQf?=
 =?us-ascii?Q?DKw7uzKXIm5wr/3txFWeLCYPl/xHJFWOjoSNQmIoaokNnbJWJ55Um+oxMpRc?=
 =?us-ascii?Q?ME2A1Jkoj6e7njpQefyGfv23mwSOFHtY2qgJ7wavuS20IOgG9uh5F28HGrWP?=
 =?us-ascii?Q?oa+GKYC7H8LgpmMhogJkJhkj/Toca5v/wESzO0rsJvuEEyIzu0ZqQGtoO1Sx?=
 =?us-ascii?Q?+14Qtt/bbRjybe1GhfFR6t2mYSZE1khJ2SUoPnx3ifeuJbKk5Ill1TtvIm2X?=
 =?us-ascii?Q?5+pu7ipzFwt7aFTl6GBTZo7+4eQHJFDrBDXtOcadXQyUsDaGZwcfN0QRyIio?=
 =?us-ascii?Q?Hb+2V8D5s/Oup7SP0Jq7X1udQqKLzCU4AZny96ruuXV2RRdlXmgx5wVIiIN8?=
 =?us-ascii?Q?F4xb2x6HHyIzU9rADpI7Hj1nrm1iZMxFenvC48ehe7PKFahV+j1JChczyNpR?=
 =?us-ascii?Q?o6EB3jLztvYoi9G9xjCtyUWQYpCV1mG22GJaH1fAxzmeMPl4UG6qDgW3Qg58?=
 =?us-ascii?Q?4OtD/PumqLQmxkdOzc8yLGxCBndbEcEET3k52UOIENRaRERQcHqDThf/2I1v?=
 =?us-ascii?Q?kfgl/vTV0GpgriTs1mrn48xPu3U9mFsSRXAJSsoEPycPJhnmnJ53ZJc22qJt?=
 =?us-ascii?Q?Um7zEQ/IGpGB+tKBPiLKJgBxTwMXCVSVMoz8H82TXDeWCvJqoERmusOzgT4S?=
 =?us-ascii?Q?L9uo8OA7YoPQP9CutBL65SNaI+X6X+DmdtpN/dt/hfp/hHbZN4770uhMNlQU?=
 =?us-ascii?Q?XbFP5LwD7hvaANy7IzZS7+rU5/qYYaodkWa1yw6nn0LHwGzVB8x8R77Mduqy?=
 =?us-ascii?Q?SnhOolBC1AUrP2G7Jhuq4L18TQNVxjWs+U7Mxc3145w0+yLkgHFjSMon3Azk?=
 =?us-ascii?Q?w6Egb/HtBDLDOnOGUTWP8Gq7jaTHtTUaG4ylQfXZwrXzscNmt5+pKIH3dI0/?=
 =?us-ascii?Q?sOaWRRaYLg1wp96ZXQpJINSo+WzfIASosDqeYmtZeAKqEo2PyA46VQ3tkm1X?=
 =?us-ascii?Q?uVrYbsuk1a37gxl28YpQeom4AetGTg+ohxfCRLrx00P+J3jlj0UWRdxi/z7z?=
 =?us-ascii?Q?RWj3rWt6bSemejdIhkrHRYXTVQXgz3p+usBiVzlPiERRKSXFMcO1rpP9cFfI?=
 =?us-ascii?Q?e0QW7HpoVC4V6XN8cHqatqIHllZZgL6wEYTl08uOZ8VdBvPYuuJKgBRBf6Xl?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8908e141-9ce0-42d7-ac96-08dca1bcb469
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 15:18:23.4380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4sQ4gvP2cJGYp6nd+glGTGtdj3MOrTGFC894n7M68q6VqG6qIYfs3WqOXn9aF10o/qtzSacfd+FQVsd1PDNiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8675
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

This is a v2 of https://lore.kernel.org/intel-xe/Zo2sO4t32dxqy6Q7@intel.com/

v2 - Removed Thomas' write-back caching mode patch since Lucas will propagete
that through drm-xe-fixes towards 6.10. So we remove the amount of patch
duplication.

Again, it is important to highlight the uapi rename present in this
pull-request.
Mesa is aligned and waiting to merge their side:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30027

Since this uapi was recently merged, after we get both sides propagate
there won't be any kernel or mesa releases with the old bad naming.
So we should be good.

Thanks,
Rodrigo.

drm-xe-next-fixes-2024-07-11:
UAPI Changes:
- Rename xe perf layer as xe observation layer (Ashutosh)

Driver Changes:
- Drop trace_xe_hw_fence_free (Brost)
The following changes since commit dbf35b4deabb5706e739cec7ce35c12631bb8c87:

  Merge tag 'drm-intel-next-2024-06-28' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2024-07-10 10:36:47 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-07-11

for you to fetch changes up to 26d289158e491d5ae34b10eab40b093a40fab7d7:

  drm/xe: Drop trace_xe_hw_fence_free (2024-07-11 09:54:24 -0400)

----------------------------------------------------------------
UAPI Changes:
- Rename xe perf layer as xe observation layer (Ashutosh)

Driver Changes:
- Drop trace_xe_hw_fence_free (Brost)

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/xe/uapi: Rename xe perf layer as xe observation layer

Matthew Brost (1):
      drm/xe: Drop trace_xe_hw_fence_free

 drivers/gpu/drm/xe/Makefile          |   2 +-
 drivers/gpu/drm/xe/xe_device.c       |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h |   2 +-
 drivers/gpu/drm/xe/xe_gt_types.h     |   2 +-
 drivers/gpu/drm/xe/xe_hw_fence.c     |   1 -
 drivers/gpu/drm/xe/xe_module.c       |   6 +--
 drivers/gpu/drm/xe/xe_oa.c           |  34 ++++++------
 drivers/gpu/drm/xe/xe_observation.c  |  93 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_observation.h  |  20 +++++++
 drivers/gpu/drm/xe/xe_perf.c         |  92 -------------------------------
 drivers/gpu/drm/xe/xe_perf.h         |  20 -------
 drivers/gpu/drm/xe/xe_trace.h        |   5 --
 include/uapi/drm/xe_drm.h            | 102 ++++++++++++++++++-----------------
 13 files changed, 190 insertions(+), 193 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_observation.c
 create mode 100644 drivers/gpu/drm/xe/xe_observation.h
 delete mode 100644 drivers/gpu/drm/xe/xe_perf.c
 delete mode 100644 drivers/gpu/drm/xe/xe_perf.h
