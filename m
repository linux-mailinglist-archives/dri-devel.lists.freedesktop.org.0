Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C32786F3F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 14:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9E510E041;
	Thu, 24 Aug 2023 12:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D4510E041;
 Thu, 24 Aug 2023 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692880724; x=1724416724;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=K/gHIjw2CKS2fYfkJaomoz8+1bjS+ysNr3m3jkXOLJg=;
 b=XPQhNUbprWKc1hS8nivXJN2Dv/Ew1MDRofaJ6IhUoK5bvaauvbQsRq2+
 +oiJR/jSiibQBTuxOmaOJFxgVHEZ8K206txy0PZtcCdSkDu56KILKgEX2
 Y1i6auvzzfhAhBmhI6ErGOGxfWlGq9KZzU0Zph+oYAHNIsFo+hfzHOmXC
 0qE+GntD0K3SfaDq7Y00fuH0piWqPP8dx8FvSYbmIkZ4oVJ0JcF5a9xJ6
 JMw4w3sfk1RDyTNvAvtwvTCDihGs/Y1wzmI2YG+ucHbiNdYbl3X05fIDY
 ZjAxvOpIfYSBgQPALbP5aLhJA9sy4771xQSipU9y1fgDphbmT4i6de345 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="460783507"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="460783507"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 05:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="740160356"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="740160356"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 24 Aug 2023 05:38:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 05:38:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 05:38:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 05:38:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 05:38:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dbxx6/mqbRx3lM+OMV250LTqeUDAOjwkVHzjEPobHtpeAfHlwFM9Fb/WzYKGrz0davYbnVlCo5jesHSR02ralzhrSKDvHZue9LUiNtEzJzCU77JeaLhtsl0NDTr5oGkqZQNgtYxkFfNYOZd+oiqoUF3JO8qAXWZsW6wRfIeQgZLTImKgq4JszBtO4Yr0oLBkM/1rRmM42Vn3ZlN3fjA9pBZb5WbdE7S5mVrZNuLfLOwXK3YwBKCem6DhbH94HWKCDvB0ke2Ps2AgHm32VSEnsJchWn9Ib2+u5RSNlsMEczanUH29CNP5tTfJRx2Nb3B2nvhFFI3g2btQQLwG75xvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNs9A6HNo6Pj5RX5zgHVeQ84IR9sLNzQD7NbrJKOR0A=;
 b=IdnIfp67VUUm5HD4Gb+eCXooNESpd32rdpBXnhCl+vnVB6vLyoUxqhKINtzGtFZuj4T55N+Ufxz6Zc/OQecCMOKcDO8YeiKeZYH/7TtPIRZVOtggfarlnBVG9L3dOhITioaNtY4PVWtOUBfpTKGUZEQMFQ3awlBn84oRbOE5X93NyzhF3b2euTB97XGxBx8yeWJorCkvg4BVJ0VBSjPbb0vR2nndCZsvW2bdUh8+wA0oi1kAFLZ1su1Bh9mBrBOF4i1INrZrUaCFxOsnfnmwgYnpUhZMKGyj1fHbGdN1CnUcwgK0VxZ5BGy6ZjpwO7uhn29RXhsfKQAoypEQhZXZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB4922.namprd11.prod.outlook.com (2603:10b6:806:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 12:38:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.026; Thu, 24 Aug 2023
 12:38:33 +0000
Date: Thu, 24 Aug 2023 08:38:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZOdPRFSJpo0ErPX/@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a98292d-d30a-4d39-42b1-08dba49f0768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2FKuY2wkImwjMsvlaZHeOTPQuStc5aQIjSnfagvdXZE6rXmQLNU8Y1OufdpwjiPCWEEw7OvnDIqjDC4Y2FIu/l3H4HGsUeGclk5jMoFAkUmDdm/cXcx+iKBjNeoCwYNrSXFos+rXjWyQWMPuAvFCrvhgJyJc59J6lNQZbWgTwk2T+IYDYlLMPyMD8zaIzRP/0w3aw6kYSHDpCrwyvLyV9hSacAr20f7HBbsHsphJtEtFE5X37Jj30qtGS6E4yTtcl785Ys9XnhCdrAYRFYrvreMcSblBPrWHwguukov5fZLhmsck/aR3DXwUWufv81GeEF2sd+s6rWVzoZbSd78/y4Ld5avzHM0dS1u2gkIUg4+MDzU1wYbqjgwgxYt9ysullDf/bTk/RS2jhsrYt8FforEHshQXUyydNH7JSYDZbBJ6dqpWUApeZ8obJlLAhXMgf1Tlq9f3o93pAJhsSyeSG40buqKKAdJqFhy704rDpxrUnnvptQhTjI9mwqoKbSE3UcqVgj6kEjWf9vWY4UlWPgGvaFGbjiZ7FSPjiZwYWl3Ttfjaxq+GO99SiWM4E/C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199024)(186009)(1800799009)(54906003)(66476007)(66946007)(66556008)(316002)(82960400001)(478600001)(110136005)(26005)(44832011)(38100700002)(6666004)(41300700001)(86362001)(6486002)(2906002)(6506007)(6512007)(8676002)(8936002)(4326008)(2616005)(5660300002)(7416002)(83380400001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VUNAIiMTplR1AUTt/yLjqFUhI3bsH6jvm9CLteWgs4EqbDJHRSh9ROgCEOqL?=
 =?us-ascii?Q?vMpeS4WkIxswut5ZvrY7T9tA1Wv4fN6gClwntdcvUJ58xDNhJuNOcWu+H9W/?=
 =?us-ascii?Q?bdzvn4U17Wq9e+81YDaHax7pQM3bZw4kFF6nHdyxeMZCb06i6L5jbbgoe92Y?=
 =?us-ascii?Q?WpOaAn16U6NkUFJALH7+T9+aNYQyyA44DO1ZZBuBUGFL/8om1fbfqcMPP/G0?=
 =?us-ascii?Q?zcjorkIUR2sBtWa/37FHei6jVt1b0HJwyUcEtp14FJZuiWfOsyba9ely/fmE?=
 =?us-ascii?Q?E5AMhXh5gKLCAoK5zBSDpSYNN17WhQTGmDFZsBUcrUFT3rYZIPDT37R2OTIc?=
 =?us-ascii?Q?MD9h9M8ZFZEDq0jya0uxFGS3WC8/E+qHz4aTLJNPtN67DfZErCtGRBBoKeyk?=
 =?us-ascii?Q?qUynM2ZqmN4Sbv/UncC5OJlXmqY73Bb4K7Bzw30017vdfbVYIU5huUdTp+/P?=
 =?us-ascii?Q?SuYn9C45UbiLQMpGiM/CfjHhc19fpccmWobI2ys+PmLIcaJh3kSf4IKXfNQ6?=
 =?us-ascii?Q?Neh2oCuPIrwybAHDI7xL0TnuVIqZm05q+8mCT0JELt+jBfcCGGTc5f1QCUYK?=
 =?us-ascii?Q?yuuC0XFJFBOU6sa1AGwmgreEjizGZjJv5TpF8scQU8SQNYVSGEckhENn/BrG?=
 =?us-ascii?Q?DNz7qKfoSiWW5Bele/0cYvaXJpMc7F2d1KF6J2w06shbtxg6MJyD9WEnKUB2?=
 =?us-ascii?Q?vNbAuz6stNGZaJbZl9P0ZHdTRKJPke1HkS8nybiH7eYduaGZfRClhMQ605HD?=
 =?us-ascii?Q?W8cKXQMb75wWFCXjKIwnW5I2ETMyensVz3FZYQExizh7208Lok4s5JwHC/gx?=
 =?us-ascii?Q?RexvK8wXZsD3w9fTG93UijRQuqu2oabeS7hOlljvnLZVF7SZ4myIWCkdxVot?=
 =?us-ascii?Q?KcPTD0g+tAeTl3rD0bpITufvvmu56mFDUvR78jRnjRKsRiLvwsD81qkoxj93?=
 =?us-ascii?Q?xoadBnaCzJ5YxbJ77O8a+pPj++FNwAsneKpMBt14uXbKt1n9YiW2S1ilAefN?=
 =?us-ascii?Q?gOqAyRRVOvw6yKtM/syRKkhv8NLhupAxToSfdM5qDSK5yQ1gWMYOoN1lh+kX?=
 =?us-ascii?Q?t2AJveZiqbTSG6r4B9Vfi/U4xuJVSl0an+joBFpncaOpC2FDf73vxZP6RGME?=
 =?us-ascii?Q?lXlh4PcjCGgRyZ9rLIUScCM0Wpcv6heiqPK58FXeVari1CGzR4k9SI6oi0Se?=
 =?us-ascii?Q?A0kRR/ihhqqgZI/zNl65qZW4Jjr+UING9m0UxbsOquXnm9FAjJmH2RTnoIjU?=
 =?us-ascii?Q?I8bTsSPaZWx9y6D3Vv/EpJSDH8f7wKHKDLbp9TMTfyXS9whfh6J0ws/HWj/+?=
 =?us-ascii?Q?HZZ38WvFB9+4B3EDGEx6qfx/l5uJvQrEFjMHhOEmWn2bWrxQcflwIP7sm9Pr?=
 =?us-ascii?Q?ikp04WqLfiADtWd5KdJ/CRTWVv4+aWkYkerYZs3Y4GaqIe7WEO4vswpWd8Ju?=
 =?us-ascii?Q?Y/F2uYXLEwpwGNcD4aGBT03K85gJ78P0jL4jrFte1jAh0cuu/LNj5ccsM8jf?=
 =?us-ascii?Q?RJXqRURcRXoHgnuCUmELf5mbfKCJs5J0W78j67SIdev0u12SJ+ijfAt3zVZg?=
 =?us-ascii?Q?IyRjJJhoFywnpbMYRVhpYkK1fgH0TkLR1Ez0NgI518mmRTk0ZiB3jea6Ceob?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a98292d-d30a-4d39-42b1-08dba49f0768
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 12:38:33.6162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FOcgVklKM7d/esu4P3awE3XOpLRyAiK8Z5vhV0rB5QwfXmqPcfJMwTJxrpu1qOOK3t797J7RroL1B3xUMzDtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4922
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

And this is our fixes targeting 6.5 (rc8?).
I'm again covering for Tvrtko at this round.

Please also notice that here we also have the drm
patches fixing the HPD polling that I had mentioned
in our next-fixes.

One is the fix itself and the other is a dependency
to add the helper to reschedule the poll work.
Both patches also targeting stable 6.4+.

drm-intel-fixes-2023-08-24:
- Fix power consumption at s2idle on DG2 (Anshuman)
- Fix documentation build warning (Jani)
- Fix Display HPD (Imre)

Thanks,
Rodrigo.

The following changes since commit 706a741595047797872e669b3101429ab8d378ef:

  Linux 6.5-rc7 (2023-08-20 15:02:52 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-08-24

for you to fetch changes up to 1dcc437427bbcebc8381226352f7ade08a271191:

  drm/i915: Fix HPD polling, reenabling the output poll work as needed (2023-08-23 17:10:57 -0400)

----------------------------------------------------------------
- Fix power consumption at s2idle on DG2 (Anshuman)
- Fix documentation build warning (Jani)
- Fix Display HPD (Imre)

----------------------------------------------------------------
Anshuman Gupta (1):
      drm/i915/dgfx: Enable d3cold at s2idle

Imre Deak (2):
      drm: Add an HPD poll helper to reschedule the poll work
      drm/i915: Fix HPD polling, reenabling the output poll work as needed

Jani Nikula (1):
      drm/i915: fix Sphinx indentation warning

 drivers/gpu/drm/drm_probe_helper.c           | 68 +++++++++++++++++++---------
 drivers/gpu/drm/i915/display/intel_hotplug.c |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c       |  2 +
 drivers/gpu/drm/i915/i915_driver.c           | 33 ++++++++------
 include/drm/drm_probe_helper.h               |  1 +
 5 files changed, 69 insertions(+), 39 deletions(-)
