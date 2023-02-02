Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C103B687E89
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 14:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6A210E512;
	Thu,  2 Feb 2023 13:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9615910E512;
 Thu,  2 Feb 2023 13:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675344307; x=1706880307;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Hg154W50V3PgZma7ombt50DTOzcrE1Dm4wt+S+eG6c4=;
 b=ceiEJOTo0+Gf7elZgZjHCLChi9HLfL3aAN258bMyn8+Pw1DoATMC3I77
 AKbGx2WjMnrFYJ4QlyGiYN7YBjEMFwm1IkPyfeKjvj4warfD4hgvRwOQm
 c/YRxzhEcp4psttXpJQrm64XTdmehyn8ZdYudwfoELEjPnj8VlW/yyHoI
 Fi+TvhNARB11WKbcz+XqmcoRdf7Pb9L/RsBHD7ZBaLKLudRWtGX+ByDcC
 fMoC/TJf4rGIpwOw54/J7zYi2ngeF0vQR3U4DvCm3FS3nv64+9bNQ2Lil
 ntJZw1vkVQe7rt6yXhTh7QIsAlyp3+7BVfLS4leMzsWSqZ39S5Ko6qJK6 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355783805"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="355783805"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 05:25:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="994102298"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="994102298"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2023 05:25:02 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 05:25:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 05:25:01 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Feb 2023 05:25:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqjyqpXGwD3NGAIG5YPhN2S4bnjmamxqH6E59sxv70w69w9BWxfi87NOjMY0Nnb/QO4kivqBYInUzfQ5DZUfDE3kAzlL4VyR//eM60izOHcGruDlLjHO61/2MqkTZh0AP7KIKgD7Ot55ENKHjGn4d6lB1XFuAzev2qYY4xBIPQku+LxWDckEx8KmVJMsSrdZ/8V3Val+XLaS2/6D8eF5KcjEmBkMkUaHiJOlxfuuzpl3LLJytPpYvle1MqvzVyuarlpc0ADYmJC4QOyHm+u/icPdvOEGgN1bhbkaPKXMrJaokwY7d1bB8BlhtplSDHJbbloVLsfJoPcNyUUHU3ySdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yt6yTKR6GECJHyFJKlla5TigutQ5Dr/wHZSW16KlPg=;
 b=ffuxKofVrNk4hccAYdXm0Itlux/+GRTc6Jv7ikxWKq6Po4qrRVNp2ZNcg0BlQ+NAhTq9XEvgQ9iHktRjtY4tPYZsFZCwruO1tg9KWkRHI9ciODRo4gVffqdX1m92e5pytSWZlM+fe586ZPkKvDPD7bZVR8daufMOyLZpOJyZ+MrDKRcsDGsvaATv7qKZ1/8L2ZxL7Vj15pts8cKJn2VpicbzPV1uc4QH8m0dedvF5EOuA331V8uvtqy4F0Rls5nna8GlHNa8LJIrnemq6ooJJXt3bf2IbiqSavGpL5n8388/Me9P8JV4nN4vIbLUvWJoMaDnJ0NifTygA3GQV8wSaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 13:24:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 13:24:58 +0000
Date: Thu, 2 Feb 2023 08:24:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y9u5pHjOYcxzS5Z7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a5407f3-44bb-4d77-7603-08db0520e14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MxJhHroK9o7vRhLNy0rx9yvN0tbcpnqVX9+yehi9eN+yqeFf4i+qIUK+Nm0elD/JxiYTOIW0haxO5Z2UJYt5ntqyWp2qAEsGtWuKYLLfWQwK4ZVXm3aWCo16XjhMLoY1xmBkOsPPJfLjZdhTNIYmlr3edOqoWVft095Y+qlUZ3RkVWIckltuGYnG2Aokr0yRnNSoqqVt0d1EK8uCpjA4mVFfJatUpYK5FLeLUpGjucBhAgMcFM+gwrDHuMz0O6uplyeMd9m6j7Eqo0H2c1p1E0wm4R5pIDdb1zuIDl9yB4g7+6eoj+I0974UONVFbZAq5cF0HD9zpPzJ5nc+YScKce4iKEGYAjt6VjD6u6dgXhg0Wg4XgSdvQ76S/xHFt72+Q9xf+3clfWCM6aNOBpm/uTcRCveWadW9F+6C4mGsoOq/nbtd4NLnBYYYPGxBGIic1ELBS6fK/gocYyYuExH4pfLN2fSZnnSnh8+sRF1ECyQlIPaUqxD3esTX3nNmie6RQXW6pAnoNraua5PzuFj4ZBqxY8PTSwVdkNFbuEEzTDAJT5K/T7wTnEbcqh1wf+NJJYBERRLw5FgyrpM+Ax00LB9FqwauxkjXuZUIOjFdrwGFUkLmq4KxGQhDvmsuisBd2AGl0mvvLiXOnYEMo9mv6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199018)(2906002)(44832011)(38100700002)(36756003)(54906003)(83380400001)(6666004)(316002)(6506007)(186003)(478600001)(26005)(6486002)(6512007)(66556008)(8936002)(4326008)(8676002)(41300700001)(86362001)(7416002)(5660300002)(82960400001)(110136005)(66476007)(66946007)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rRfeu3i6jEZXr6PveEFEgCZ3w5idjVOelcZwiESZ7Jw6ojxn92jkz09i0gdM?=
 =?us-ascii?Q?4rH6tVFVEJmbwqNdom9T+w6xYqdvi/YVDVgCpq3fRaQQTa6kEx3Sx7RxCT7H?=
 =?us-ascii?Q?2QaM7ybPXjtKNJnJmQJDAKm0FrLLsrlhs2PBb6dv8aeH8ksHwheYbagxQpPC?=
 =?us-ascii?Q?xVt9zUFCCURLvwO2I1rNFNLaWE/lDkcYkfnw+KfiyVCKnyqmpPWXghKUuIaD?=
 =?us-ascii?Q?uqY8Yynt7cEAS6EB46jDRZi6SJN8gja6AZrujSeXIbtlL3ZDHTwFsCgd+iRM?=
 =?us-ascii?Q?/1CPSpKhrYcn4ro+RAT+VlVmdqmB17yDc3jVd2Bq+GDqC16GIWetkGaAWbKA?=
 =?us-ascii?Q?8wNT9ASW0dIhPefOIjYIMbKW/yxd4Z26cqtWj8/pPac8Meb9fLzQCLu2z7at?=
 =?us-ascii?Q?rvpWH9qLRQpgrSL0NDcj14uwVqxTGbEimudR7JcYGCNv4hKPNOiV40TJaFbI?=
 =?us-ascii?Q?VNrdsPBzs3+H7qZ58eLT/uSxU9AyTNVKGh+yDJush60Oh3EazPkJ+2FjuE7O?=
 =?us-ascii?Q?07csytHH6As9cWnCQM3aB0Sfr1N0yi0lytnJjUG4+AelQAUB7PVJ2XTSzNJd?=
 =?us-ascii?Q?rpXrfqTiC2YNBY4O2XwwkL/yRqCoaF+wwn7v7D+MS1xQLyhAJTb5OtE9MVkW?=
 =?us-ascii?Q?G9kqPZAHoQV4G7vsBiAEf1buc8rBVasPlO3osQ1SOpsib8zaRP2faZ93Z/Di?=
 =?us-ascii?Q?zZn7XNsgUhwgxE4Bx/mhRIKe2POfvy86ljpj/FU9/t78+awN5KODkynJkmU7?=
 =?us-ascii?Q?GPAMWXhbE0cdpEIp3b87XE0ygYs4H8y0ykYxk99kGhRWaGRrSBzQ5hBH3xPu?=
 =?us-ascii?Q?e/4DHOrXXV2xos2nWygjONFUf+QHmYmiK87V8VGTw9ajugqo6bGRu9+cYtww?=
 =?us-ascii?Q?vhVyI1enB4w1QzoWOnrkgtup5S2l+i3x9zguyQQElo+yYgn+Y9+jWzyxpEOB?=
 =?us-ascii?Q?aCw5H5y/0rHNL9o08TxkOcuUF8kRQ61Wqz/NEcMKuI0ceWw8wMEGysqFBUY3?=
 =?us-ascii?Q?el+6uyxfZxaVGgHFiv4+VL/+X0vMdZ8ZOtG/+ICxBF6TPvC+4y/rs4m62Ofi?=
 =?us-ascii?Q?7ie6523NXw6bNqp8LuXwGxssXg9CEryZUqXAGQf8nvDJAaxISiwN+erBN3O3?=
 =?us-ascii?Q?TBatFkCRtRSofHjkZWLoqUkRFT/T2AU/DpPsX6y3DYnZdmkfFilEN0THQc1H?=
 =?us-ascii?Q?2MEIyLyqdSehjAKhH92HrlaSezl4I7jywh1HsTOTHVJ50hzYC+O7n2bHHuh9?=
 =?us-ascii?Q?W7Kh36VdlV0iwg8lJIWyvGs596KT7P2er+pg/cvsmQj7OaKnqaIJkvPtBnuG?=
 =?us-ascii?Q?C2Edv6R015n5C+igQxAehOt2t3MJljneF6YE2obyUb7/J8/gYfG0ae5vsCwr?=
 =?us-ascii?Q?pBi/u87mA3FHg7PdvC60jFxUjHfkIeHSa39swEHNYTqLFAcLfYVxDlIkf+MW?=
 =?us-ascii?Q?KS1+RYlR5v7ZUR3ybm4hUKqBE42mc3cjOeQBmrCG1cbehCbsPl+2jWYJ9KNi?=
 =?us-ascii?Q?7oR2pgkIcKoFPB+IxF/zvA3tXw2Sr7ZKLLSKHl9iSt8vuIoMSx1DTGL4MOc5?=
 =?us-ascii?Q?CH01iQG+CyOVbHM4ZuCtf0MmGqgb/jdJTKRq+N3OH9SicLMt8x/zQsrn1JkO?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5407f3-44bb-4d77-7603-08db0520e14a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 13:24:58.3496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcV3BB4eQq3IQQfXbs1D0tRPhreyvcT0GsgvExTgsZYWg2ekB/f/mFetU3wA/mhhYdpaazcv2R2pSTrpRISHgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes this week's fixes with couple targeting stable.

drm-intel-fixes-2023-02-02:

- Fixes for potential use-after-free and double-free (Rob)
- GuC locking and refcount fixes (John)
- Display's reference clock value fix (Chaitanya)

Thanks,
Rodrigo.

The following changes since commit 6d796c50f84ca79f1722bb131799e5a5710c4700:

  Linux 6.2-rc6 (2023-01-29 13:59:43 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-02-02

for you to fetch changes up to 47a2bd9d985bfdb55900f313603619fc9234f317:

  drm/i915/adlp: Fix typo for reference clock (2023-01-30 15:48:30 -0500)

----------------------------------------------------------------
- Fixes for potential use-after-free and double-free (Rob)
- GuC locking and refcount fixes (John)
- Display's reference clock value fix (Chaitanya)

----------------------------------------------------------------
Chaitanya Kumar Borah (1):
      drm/i915/adlp: Fix typo for reference clock

John Harrison (3):
      drm/i915/guc: Fix locking when searching for a hung request
      drm/i915: Fix request ref counting during error capture & debugfs dump
      drm/i915: Fix up locking around dumping requests lists

Rob Clark (2):
      drm/i915: Avoid potential vm use-after-free
      drm/i915: Fix potential bit_17 double-free

 drivers/gpu/drm/i915/display/intel_cdclk.c         |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        | 14 +++-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |  9 +--
 drivers/gpu/drm/i915/gt/intel_context.c            |  4 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |  3 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |  4 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          | 74 ++++++++++++----------
 .../gpu/drm/i915/gt/intel_execlists_submission.c   | 27 ++++++++
 .../gpu/drm/i915/gt/intel_execlists_submission.h   |  4 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 14 +++-
 drivers/gpu/drm/i915/i915_gpu_error.c              | 33 ++--------
 11 files changed, 112 insertions(+), 76 deletions(-)
