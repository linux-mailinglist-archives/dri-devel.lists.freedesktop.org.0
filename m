Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E86F5A2810
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 14:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3124510E8D5;
	Fri, 26 Aug 2022 12:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC7710E47D;
 Fri, 26 Aug 2022 12:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661518422; x=1693054422;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=WfG/YdV8n94xkof9HBOebzLlbFL+YMgmx34gYGabTNw=;
 b=Eih0VEb9zneVA9UptHlPGUVOI1ie37GaRxauAcEybMsLLPkjKGPzNwM/
 YpYnp6+RrVLSWQLBay2n1VDb3q4DQ/QFs2/7hMxUKCRdt3nfH8sOIh3Ay
 9zWBvQDhkHTJqVc57yYIl7Gv5gk/kSQNtRb1m4vCor4G7aUoYWy67SLPV
 Qxn3ZgLc4U3EwTwKdfL2OojFa8f1Xm0U8sOBDM+vpd5kJ2oiIBMqZehDC
 61IWYCZtg2duVVxBbseV2sRyWaypiNytVtbwS5TGsvA6RtUar5037bX0K
 EZ9Gva8vTN4BypXabAFYfXRU+KkCsOsl01obUOHduexfakvJVaILWjtGb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="277510373"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="277510373"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 05:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="699832522"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2022 05:53:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 05:53:40 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 05:53:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 26 Aug 2022 05:53:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 26 Aug 2022 05:53:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIicHspR0zVignQWVZSNipKHH0uZZ+74ZE4PghE+M5LUUyBaa5nsW18NY1Zx05ObEhJOjkFIqiPqs3/QlJGlG3qg8zzuPXDSfjjqGYER2ADoTjtobojvnuGfMe2eq3N6z0rW9pQOVajTjovLpW6IOHdKxWXs+szfc3Y+VjzDNn2gRMJOwkFHuAXJSAuKb+m2JMr/ZP/6q9B6dExpMjID7+4X2mmu1mVFgj/T+iL71RnMtMLOzpOf3ZRowhdplMTJuP9qXb8DZYS1mV/y+etky1pQc5tAefB3uaLDQXoGiN+Z50b9XYBAD2UTMde8obK+ERR5X+qFtLmcnLoJegAHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xUtsaQtXoE55bF9yXhk2HPfkFTmgSQK787axq9HHgY=;
 b=CvUOQbHjbS+koQfJanNbRN3covJF6Uv/W87ZFFM+aJPjplKdf3h1dNYNSLYOgISwXkGWR4MQzJwNUAsS01DcqEWfYzSm6T1mr/G62Mpttv7P4dR1O/kx+dbSg0A0N/TARqI1u+pIVDeA1QXdXfIKlhdNIUvkvmqGQq/WubdFg0yMAaGigjTX1pY6YopRjMx1opFwMmS+6pJAwume6T4CDO/qzLoBT1g29yK4Pzby/SgytBmjQngCd+5L/iZqKAa9W5PzHVZTmxslgFnBifyJB4p2n3hOExvgn7CQ0FVb9GrhonN0jauowid1KVIiXVescIp9f2BzDWX/5EW+f+hgTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Fri, 26 Aug
 2022 12:53:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4%7]) with mapi id 15.20.5546.023; Fri, 26 Aug 2022
 12:53:37 +0000
Date: Fri, 26 Aug 2022 08:53:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YwjCTDFm7clXPgEu@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0118.namprd05.prod.outlook.com
 (2603:10b6:a03:334::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70b4b397-4714-4cce-c286-08da8761fe0b
X-MS-TrafficTypeDiagnostic: SJ0PR11MB6696:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gPgRCJygM1eFmNv007QF05NcI6iA/MTlEGuvs/WG4EF8VXKUp3RShL654jVA0W1/kdj+2zGHsYccDqqq5JqDz+PSat4XPU/yfwRkWskPwju82TdNKdImrT/uFJntD12DdC6PZpcvK8Z0wGjBq4IA8vDvGx8HrDE1SeIGvtd0abUPiku3D8DrmWytHa6wjqdHDYJsm8l1VlKGsCPfmvwWhNLvBn1lXF37nEQ0M7yYJeoddY5iIXFRw3L4G4Kiu1iix9iudC8kiMmdwrN74w82Drv0QB74LeakjSFRWPs8Fcqp72JIrYIbegHbbEF+3ja0l59lAL/l+R4TFxNYjd516Xt3ZYhNV9TxFLLvGLD7Y0LQdbU94wflwvkruyHf0fdi8WKDKKTxH3n6LoWUN+PDth2nmf3aqJUdtQKStkQRx/bHCFPwNmsnzMWVF1M8/BU301ydCAyaeBUyLbWPw9vr8tMBGGAxPme6Hj1d4eGBu7ON9yaRcji1GeLU6DCSznFfzwGoNJQW6ca/OdSGuZuuGWBUY4K6MuZYwO7wH28/9ZH8+YkeF/MsC4AYtyiGNjdQYPrgS3nU7mhalo2UWYp0B1GrFzrB4miz4Uw0VR0bUApkdswX5X9FS7EdYsf03eOw0V1OLNPZv3aiV6ekmnGT0c1fRFf7EbcQbLrQ6+zKOgEOLIg3AvzmBCYXlJ2ktsOmD5yEnXaYTpVMa4ZBb0MDK4eK7bsJa9Ttob9vME9t9vY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(396003)(366004)(39860400002)(6506007)(41300700001)(66946007)(36756003)(38100700002)(6512007)(478600001)(8676002)(66556008)(4326008)(186003)(26005)(66476007)(6666004)(6486002)(316002)(110136005)(86362001)(5660300002)(2906002)(83380400001)(54906003)(82960400001)(966005)(44832011)(2616005)(8936002)(7416002)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8QhL3UX+PdhyIjflHimc0OSL4Jd2klyTARw1ihKODE7Wukz13gF9GoCqm+?=
 =?iso-8859-1?Q?f2D0riHk7JN7yQKJ1BS+rufaNSU/4iEF3yXSC0992LFIs/2MrlJWFYLcny?=
 =?iso-8859-1?Q?DM7UsOrb5ph33ueOjZVc3iPSs3q06mHNUSqeAYowvj0ImR4HOsPjOE2Q1w?=
 =?iso-8859-1?Q?VfgMXyLoVwROWsu7DK06+HNrsS6E+g3OXFEVtop0BncAL9rDkev6/Rd1Zo?=
 =?iso-8859-1?Q?19bZaf32rhGBz/4kVQqUd7sGXE+5MZ28Wg1Gcp5iWWjGJ9JPqKBVxmjbPr?=
 =?iso-8859-1?Q?DCRkziT+Dwc4HF0rZTNukPQy9oGPehJ2TNaTGkqwcMh4MjuZj5+FFmZvvS?=
 =?iso-8859-1?Q?Tt7EvbwES09XU99i/d/pnHV6ftsIGqiuHX+hiDAhHCfkmu0/7NpLKRnlpt?=
 =?iso-8859-1?Q?C1/84kgrhsdw+hyYL3yzTtRNLbKt5EQnce4Sm5DQHo7Rt9IrM50kuPHvym?=
 =?iso-8859-1?Q?6OZWfCl/NHi7Fu/xXspSqbukOe87zFgJRxTXIAP08MueK9FEjKpl4KcNtZ?=
 =?iso-8859-1?Q?QYHqD4w8e3u5gHW5fmucKDgrMvj0SUddSCnEE9pYK+kWjcqp1M461kmzax?=
 =?iso-8859-1?Q?7KbxguLsGWHU3VFh88XBhiuODHuZLPFvlWTFiyztpiv5ACEZv3wZBJTXC3?=
 =?iso-8859-1?Q?7MkpJRzmvAHNRn/22UcZ2b8R9tLYr6WNgdbwoTVTH78KuZXzdw+TTsR05Z?=
 =?iso-8859-1?Q?gAEKgVHmqnA4JFo8kC7W1plZ1LBUXHFb524wAgZNAYVzY03Tzkuf8nRkFy?=
 =?iso-8859-1?Q?cIzkBJvKQou+TmkqCM+QEfmrXEd0aFE+mL+azexafizvK5YOStd8Vslzku?=
 =?iso-8859-1?Q?qVpPndQmv/dcYdgsCLj0osWKxbDEmGsQNCxQqIcWri2vG4TNH3FlkzFCXA?=
 =?iso-8859-1?Q?ovmYver+yz1gkUYEk+mQ3ydVkzr2uhUS/bigMT0X56K3T7pHkvA6jc5/we?=
 =?iso-8859-1?Q?ec0Wr2wChxgPOciXKOXyfonawy3IvnLDVIDGcSs/U6alem6xVZEZDwoABq?=
 =?iso-8859-1?Q?1Ebw/SXQJ4AZ4TyP3DfK+pRe6P0gUH52yl1kFpss8moTVpR17JSi5aYfyS?=
 =?iso-8859-1?Q?9ZjPOG5mErcFeSuyrex1U5+/FL0+7UvClwDwyQCgg5GMHVEfohL8WdRanv?=
 =?iso-8859-1?Q?LjzNYh6Gl+YFfdKLW0WZfVchuJh9glD94X5gq7UW5Uc6gX7tOyVu7tm6wq?=
 =?iso-8859-1?Q?fWImBvIi6QmsShjsDWF1SCVzoAXatpksKLsKuypwYldwGgz5+jyAy/ZTDe?=
 =?iso-8859-1?Q?SvWU9wVM34ifvQJ9ynk+2zCXLjn+gWehR5cb5bmbD8QjwzH8Bwv4XsafnW?=
 =?iso-8859-1?Q?Tg0r4pUti7UfK120g9Re2hNBcS7IHDdq7+hSUk9LtIEp6ULE2PiypuykUE?=
 =?iso-8859-1?Q?D90sB7u+hFsFJtriRceGbCi13jdYqBBaca0/xMAnbX0umgeBwh5bTEYskU?=
 =?iso-8859-1?Q?B+oghsEzKYy/whBzdiLcJs7mlzXpJ3lFT8FyEPyJMfsDfgvmNDebiuSsCP?=
 =?iso-8859-1?Q?3vdoSd5QEXSQAHEOt2ba1t/gzq2bhdjVlkMe7HCy8EoBJSH1Di2I0ZGdaA?=
 =?iso-8859-1?Q?8X2Hzly8LWU1xlZHltt30UruezUCFTFR6wy/OyQaHZx5a4TrKBvm3KmvhX?=
 =?iso-8859-1?Q?oR4wuEj84LZKkluxXUAUg+2sild6yWPFSY4MOf8urghNVXTQvv8YyQ8A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b4b397-4714-4cce-c286-08da8761fe0b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 12:53:37.3402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qhBW6lmKddwbEHZgfzyqS+LTnBE1YBogWxkngbfRCOfWwEPyFbVOwHq1Fj/YhLnyAaG9nArxyCNI6mDZd1Bqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6696
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

Sorry for the delay here.
I hope we still have time for these.
But no big deal if this needs to wait until next week.

Here goes drm-intel-fixes-2022-08-26:
- GVT fixes including fix for a CommetLake regression in mmio table
  and misc doc and typo fixes
- Fix CCS handling (Matt)
- Fix for guc requests after reset (Daniele)
- Display DSI related fixes (Jani)
- Display backlight related fixes (Arun, Jouni)

Thanks,
Rodrigo.

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-08-26

for you to fetch changes up to 6067c82c576af13a6b1c892b42ac4a189aced8ee:

  drm/i915/backlight: Disable pps power hook for aux based backlight (2022-08-23 21:27:25 -0400)

----------------------------------------------------------------
- GVT fixes including fix for a CommetLake regression in mmio table
  and misc doc and typo fixes
- Fix CCS handling (Matt)
- Fix for guc requests after reset (Daniele)
- Display DSI related fixes (Jani)
- Display backlight related fixes (Arun, Jouni)

----------------------------------------------------------------
Alex Williamson (1):
      drm/i915/gvt: Fix Comet Lake

Arun R Murthy (1):
      drm/i915/display: avoid warnings when registering dual panel backlight

Colin Ian King (1):
      drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"

Daniele Ceraolo Spurio (1):
      drm/i915/guc: clear stalled request after a reset

Jani Nikula (2):
      drm/i915/dsi: filter invalid backlight and CABC ports
      drm/i915/dsi: fix dual-link DSI backlight and CABC ports for display 11+

Jiapeng Chong (3):
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc

Jouni Högander (1):
      drm/i915/backlight: Disable pps power hook for aux based backlight

Julia Lawall (1):
      drm/i915/gvt: fix typo in comment

Matthew Auld (1):
      drm/i915/ttm: fix CCS handling

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2022-08-22' of https://github.com/intel/gvt-linux into drm-intel-fixes

 drivers/gpu/drm/i915/display/icl_dsi.c            |  7 ++++
 drivers/gpu/drm/i915/display/intel_backlight.c    | 37 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_bios.c         | 10 +++---
 drivers/gpu/drm/i915/display/intel_dp.c           |  2 --
 drivers/gpu/drm/i915/display/vlv_dsi.c            |  7 ++++
 drivers/gpu/drm/i915/gt/intel_migrate.c           | 44 +++++++++++------------
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 ++++
 drivers/gpu/drm/i915/gvt/aperture_gm.c            |  4 +--
 drivers/gpu/drm/i915/gvt/gtt.c                    |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c               |  4 +--
 drivers/gpu/drm/i915/gvt/mmio_context.c           |  2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c       |  3 +-
 12 files changed, 76 insertions(+), 53 deletions(-)
