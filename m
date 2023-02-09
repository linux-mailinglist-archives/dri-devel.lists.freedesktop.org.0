Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08513690E02
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 17:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D093C10E0E7;
	Thu,  9 Feb 2023 16:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1DA10E00E;
 Thu,  9 Feb 2023 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675959107; x=1707495107;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=8qZW5XnjTfH2euCqC4xFk82pJ6vHqmS1Xl8D+pUWYes=;
 b=YP/8B4MgssbKgNdB1xTmc06LJUo64suHCAZ9fHZNJnERVEt2WoZei5Ph
 0VsgRYaQfqYCKA63ni2tF/ls66SdzvErFpVjS+cSAkrxKw4LM8f0QFt0L
 NCe20STCkih2XfkfDa4xUV0wdalJcPqO/lBwFM1mc5xM3JUp7OJmOt2Tw
 YmGEyjivLMuPF3jWCvZ6/XLMtG/lK9xqo6ofIP1K/w9+KhMSW8bQqRXLi
 mu8Ixg9WILq/A0Ni5Nb0kX+b7PsYR8TRpwW0MBMxkq4zTVhtZRxDaZjCo
 hHzvv94UBuUlhbG/2WAy3bZL+WLVaJIxQcV6gg7khEWRV1l6cOhyzGkYP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310503741"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="310503741"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 08:05:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="996573738"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="996573738"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 09 Feb 2023 08:05:47 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 08:05:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 9 Feb 2023 08:05:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 9 Feb 2023 08:05:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRVwV4grSHUVf5uTzOdKgeRz+6waCHFnvhNr4cz73d3r8pzdAakw7CxXhun8uOjsuh0ag6scZTCjZjG0gqcIHTiB96lGpfPH3HrR2EJxDwvzOyTNVVQtVIGG2EGc6CCgUTmeh2IEjUIgra2MtsdItf3ODsZweapzPaE+NZ/gnYPxnHfkzkuyQDni1kBtUlmLYy5WT6VhEUkEBKYOADWTwyUsv+iBvT4HBXrDeb2LPqEne/rtDlLkn8rdIg5bNNIQgCzl9EQz1k9TiDOGhZxXW3iqu8CURrwYtLxfZOsPtBkk7fa2A+QflTp/LV3yLREuswAmaYWgZO+7VaKHO9kAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QyEi0ZvHrl6PlU7nmQXD2oqpCtfqzTsWPwBQe2U3is=;
 b=LRl0+X9e82n2P9yMESv4M4fpIw2IrJQi7s8j30qnY7LCWent8a0JMehlVpMDkZ2csXUaQX8WgNlJR3RxzLtaxk+E2kiFhFhXEbtcStsuq++D0Lnt6pINEev5pWKHOrma00akalKDwcx0QlyQ8WIZkoGwU6zsGXGOx9nX57mS87TkHKKc4qJzHC50roKKYfoJB1VoHT6+gCkZmX3UDgXmDVfmgLfxUDfOuD8m7EqfQHj1Kt7rWrAvTbpoYQ1nTGkhhLWzXazEhKY6wGGm7WO5PTZrcYqyWWLqYWhySUNdj6V0OL+JfOqVmRj+goJFVQYFMpQSk7SKq+dY1AuKCFLfGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6433.namprd11.prod.outlook.com (2603:10b6:208:3b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 16:05:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.019; Thu, 9 Feb 2023
 16:05:45 +0000
Date: Thu, 9 Feb 2023 11:05:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y+UZ0rh2YlhTrE4t@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c21da86-89c6-469f-27a2-08db0ab77fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: COBZuiJ1s+9P+RoIpHvRkcHblNNylckDwJpDiG9EXaDMUdokSORv2vclKPkclkRWuMDbPnVBToMHbzPGvYkbbnMZ6nN1nbHBNtUiODDH2YMLKz7Zi/2CArEv39xzlnT4JIA3306fOLz5naRdoUCpsWhyiT2QuTU+dMK3TTCobeUPzZ6CpCf0zOwo08ypnuMcLgdLT9wm/Yf9jIioO7VpDjTt9dCbI9npA64HrEPvWGUhBbaPH3YrvmZaMBrI9e8aXcsYla8dBWU2meo/hgtzF+LnInycRPWY4qDRbcTICOqpSQQrxxXCMFnx2ENGApjd/bsPRWwPbKQP7Q7sp3i01Hz0z1oAhadHoXVUy+sSWjWYuAAG4oz2Vli8zxtpxBy5s7xSRWE20n5zOO80ATwSFvcBbAedW8Vc3nSe8m5ryqLOL0AiCFlQlw3cIfJD324jRu1cjUeLjKt+8YcMgTL7qlcsuHUHz5s7I+ebHRo1aISa8Ta2QCopLN0QyxiRbk0uoGxmZ+cTJq1ruYHVndkLFnxz7IbJ7wOBBJTjRDHXxPHT74VHS+lQBIxJlKHfc7JbkmM8etdilWqiWtU7SXSQng7MLtiqk7BCUXiL/81xiJ2W2YP0cYj430CyeG54qucyNYiwOcRCGfiDU7LxjCSwOjj63FYpKbZMOAWzxcupl2TiWsquGBGc3zAn2e3ooiP2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199018)(36756003)(82960400001)(6666004)(6506007)(26005)(186003)(86362001)(6512007)(478600001)(83380400001)(2616005)(8936002)(5660300002)(4326008)(41300700001)(2906002)(7416002)(54906003)(8676002)(44832011)(110136005)(66946007)(6486002)(66556008)(66476007)(38100700002)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rdoXWPyC+ZC8KBIrK9fw7R/tHe2ACxaMsn6rVeVCu6mFRCyfsuWyXvcb+c?=
 =?iso-8859-1?Q?Ll1oetXtgFM4s0DDOB/6p8eO+GvnTUv2Qvl+lPkRn7i/Bb/0qu+YpI8evl?=
 =?iso-8859-1?Q?1mP7eBasf4HPrU0Ul20eRT4yanBU+DGYwAVJnwDKcjMzuikn9+S9eeVUov?=
 =?iso-8859-1?Q?OyPBp93x7Tbzo3G1FtlR01xlwV+9003VoC1Yy+DFpWVinROgZ7R1emWK+b?=
 =?iso-8859-1?Q?fS2+BqsmmNFnyDfPDM5yZFHkCk9i21/eHhCZwQFemUkkNo8ttQsvogKAjZ?=
 =?iso-8859-1?Q?MkWCLwfXWWy9+YegkSocuL06WbmmBzUhOuzvM+2hu0sCNiIHN9rIaJ8JI4?=
 =?iso-8859-1?Q?ZNhMbBfeeOMcgBugQgSlHjuWnyvPkGSjGEdvo8T08evHAEVvzd1YLh/RwN?=
 =?iso-8859-1?Q?fsth/LzX9Fl8Asuy7HvjEmWoFsLPQqfQtGOn/WdS0n1nqORkfw3nZWJPo5?=
 =?iso-8859-1?Q?7VjdWGHR2h/yYsycLnxFCN0Zm0GhQc4Co5EuPIPlhMqyu9+6sQeDOzObyv?=
 =?iso-8859-1?Q?80GDD4cRluXwP8uCFHGeSt8QPkcR2C6vaixt9vLDX3bikJ04X2ri8/jeeQ?=
 =?iso-8859-1?Q?RYi32BZKXIHMzu5q9GCLOqneMT6nyAYiIplup5G/q+vFVQqIlo45tdR4rO?=
 =?iso-8859-1?Q?7pS+Z9yNwvfGJQEk6lUamRv8NOfCgjJ80PycByW/x4CIJfl5OQ/vZO7KaQ?=
 =?iso-8859-1?Q?mVuzAebO1iQSkyyFEgPi084RsyaHZgzqFJkJro/Q7k/U70HHnW05jF61jK?=
 =?iso-8859-1?Q?XBrTVmansVtZhFd4LWTFIq+vs4R7o5qWkx6P8vCaFu6UEMVGIM0DT82eDL?=
 =?iso-8859-1?Q?Aues1Y7CNRR7k9p35OukzBmwBT56z36dtPnjSJYQG9b447xcG+yT2SVgJp?=
 =?iso-8859-1?Q?UbB+zRQVJDBFSidyJa7cDrSgeBYq+e/UO4zkaH82i99+J4Y9vj9mdejqUA?=
 =?iso-8859-1?Q?46Grf7i5ACMsAA0l3QZrwjFTvpE0nhbAL8AWCy3EmxOtjqe3KlqTXsU1Xv?=
 =?iso-8859-1?Q?RrT9SO5fFhnKZU3ijG1oS3PEQZqmghGXcFz/4tFEpsTY75otLU04lhSaIl?=
 =?iso-8859-1?Q?frPwfAtsbAEawWEdtpq4TudSCadQ+bivWDFbTrVYzcA6aHwHMi/ziZf70O?=
 =?iso-8859-1?Q?r+5h0PH2fOLSMpNPK70woyJl5NpJGpLG5QcLUJKgd6NcOg34gFSHobtnpm?=
 =?iso-8859-1?Q?HrYHHOPaJizz3aJL7sSfTfWIegxmlfkicf2XW0MlsGLaJvHm/v40BilBt5?=
 =?iso-8859-1?Q?RehbOus9N7pKJLJM0HkTNGpxzn5z4zRVwsuWZ8+lXSS41M7EOf/J8kObTF?=
 =?iso-8859-1?Q?jRfmVTm8MJlmCQG2lODvjdtJ6fcRUPfUNyJew/tGgiUVgNI2zeH36mbTJe?=
 =?iso-8859-1?Q?Fh85rOKcubEBR4ojObWs7W4RIdFPhQD+nwToP5RU8soHx/7a8JJnQ2k+Wp?=
 =?iso-8859-1?Q?Od4xu1ZfDXSFrNr/YMwibCh2KrE47XgbVQT6kDXc2Ct56p6TQY6BnlqRuV?=
 =?iso-8859-1?Q?n4E65x76mjX5h53BQaIxrC/K2sa3rTrAwbPdo3yQYgWhoYi1Ie4Qi3NC87?=
 =?iso-8859-1?Q?OmmUuzQay/MfQKM3GUlZZqGolbWfGrLxu+IgF90EwZZbGVjgeoNjBMazY3?=
 =?iso-8859-1?Q?4HY05CwLDhtfJPp6ACvgrUMy+yNvXYcyBLny1d5PrIAaWJpaUtJ1MwYw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c21da86-89c6-469f-27a2-08db0ab77fcb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 16:05:45.1287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6iCP7nOD5AiSRH6EfYM3KNDvlrcFBJFlNNNil5bdpzZeBaOttg9Nks+X0McfxCDZ+gVcMjDThlIe5r9umKXiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6433
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

Here goes our fixes for this week with a few patches targeting stable.

drm-intel-fixes-2023-02-09:
- Display watermark fix (Ville)
- fbdev fix for PSR, FBC, DRRS (Jouni)
- Move fd_install after last use of fence (Rob)
- Initialize the obj flags for shmem objects (Aravind)
- Fix VBT DSI DVO port handling (Ville)

Thanks,
Rodrigo.

The following changes since commit 4ec5183ec48656cec489c49f989c508b68b518e3:

  Linux 6.2-rc7 (2023-02-05 13:13:28 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-02-09

for you to fetch changes up to 6a7ff131f17f44c593173c5ee30e2c03ef211685:

  drm/i915: Fix VBT DSI DVO port handling (2023-02-08 08:39:44 -0500)

----------------------------------------------------------------
- Display watermark fix (Ville)
- fbdev fix for PSR, FBC, DRRS (Jouni)
- Move fd_install after last use of fence (Rob)
- Initialize the obj flags for shmem objects (Aravind)
- Fix VBT DSI DVO port handling (Ville)

----------------------------------------------------------------
Aravind Iddamsetty (1):
      drm/i915: Initialize the obj flags for shmem objects

Jouni Högander (1):
      drm/i915/fbdev: Implement fb_dirty for intel custom fb helper

Rob Clark (1):
      drm/i915: Move fd_install after last use of fence

Ville Syrjälä (2):
      drm/i915: Don't do the WM0->WM1 copy w/a if WM1 is already enabled
      drm/i915: Fix VBT DSI DVO port handling

 drivers/gpu/drm/i915/display/intel_bios.c      | 33 ++++++++++++++++++--------
 drivers/gpu/drm/i915/display/intel_fbdev.c     | 12 ++++++++++
 drivers/gpu/drm/i915/display/skl_watermark.c   |  3 ++-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 14 +++++------
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c      |  2 +-
 5 files changed, 45 insertions(+), 19 deletions(-)
