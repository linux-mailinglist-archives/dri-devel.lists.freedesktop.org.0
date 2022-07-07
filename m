Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627BF569892
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 05:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A996C112753;
	Thu,  7 Jul 2022 03:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DD1112752;
 Thu,  7 Jul 2022 03:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657163057; x=1688699057;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=/iRjj30cqEIH1tF3JWvdt+n5vC56B5zdYr0SMD56csQ=;
 b=f6Q/xeUoViGdbJGaeju/PlgAd9C9YZCMep8SqY5b8MLhE4ymBlmqsWAc
 0ytezeDhG6M8uRthRD3Lm78xxW99PspfVoFx4z/RDtBPkSso4/WzF+tYt
 bD6KgdlVXaBV2ZlA5OMm6/BZWsveSbm2tx6BvbAH7JAMivcH+3fMznJHc
 MHaPqqyKntzaOJBP7hEA3ogT41YZnspGfbbRX56iqrUmwDHhfJ2xsW+PD
 mKSYPmH7j2UWLN0GFpbcwps10pjx9Ll7xBtbRuOfzU9Mm2r6uC4+EGiiH
 glujC9LkGX0RBmpo7crBi94vyqce93Dj0hWq0HXMecDWP1nEQMOc+S7sk A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="263702665"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="263702665"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 20:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="620595403"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 06 Jul 2022 20:04:16 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 6 Jul 2022 20:04:15 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 6 Jul 2022 20:04:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 6 Jul 2022 20:04:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 6 Jul 2022 20:04:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glFIIVIdYIXj75TJu++Q6lntoucPcdyr4djqqfF9cQ2s01kWopuehbOtPet2VYFcLKh5RSaWmJIkWT6GGt0C4OTiBEy+abG1gwBhj4X61bwtgC+5ZAmnAl+XgFNgxsUwtau3xkZIxvtwr7noO7rJN1xHO/itMtqegux6gDvPb1IuBG2NfQT+2J0KV+qTg+dYj4ni1+pXwQmi78EhiHL6izvRng39NF5m3VpB33WZ4Qe8aUmjMnDtT8eMihrPn03Ig2L9nTOF0iFuch5uStl8wlmtGaBKYe3ergz9ULYnwTuuHrtjjG78Y+IWinPfojwR7JSkC/z0hjinQL4dogsDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4wGstYNz81fJpmGWM1a/raHPdqgFmggK6gw3WmpUqw=;
 b=mXV014uj9rGmMKkIq2YIEuceipg7VD0ngzjY4c0Fye8J9DyysU7srzhc6qVTSPd07nN2QjIrXpX0+/f35+xOt3pMhBp2iN1T0GiDSuriLGdaG1WayTWM2N4uX/a92AfBJgyZ5TmPzcmOGo+ETtClbJhMG74QUB0capRePUDKvcmhh+3jS2/1PpNZe7podg6iu8LZavjBB/7Ux8C+2Av13hdNcjBUT0lBvoDRo/l8vuKFY2z3yhFk1ehZQ+f+PpJbOJFwUAvuqdDvyb3AvxlNqNl8qGPf0R2ylzcToZBdkPpvGP8QslHFsV/lFQkYxJY9CP+d6+RPp0C4tiSi8KOlqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN6PR11MB2829.namprd11.prod.outlook.com (2603:10b6:805:62::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 03:04:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 03:04:11 +0000
Date: Wed, 6 Jul 2022 23:04:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <YsZNJUVh0iHOtORz@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75b449ee-ec03-4ad5-8035-08da5fc55de0
X-MS-TrafficTypeDiagnostic: SN6PR11MB2829:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IIdmnnuxPbSkstmqyJk8WxJQdWrX1s7M6qCY19GXiSbYzdW9pavlfImYIocszQu8a969Yu/GZi6miVROmkOsfO6116WL/xnUy8O+CokWSqNhnNu+YGqjk6hRz5qtwH7l0Bbi83sPYmYnM1ZOy7DpDvYCgYOY8Y7x6lSnDZwzsm+eRkXg0t2tRTA5b9W2CFMhgQ3iahGUNzphB0+PKro4Urtu4OL+tN4KeuPDgRi4ns5wmHPj/nX4yn3JBDBtge0AAY+5eWMg3kp5hPAYWVirWGne9M/gWdUIX3LKC4EEhHbbjZdrJhdRNs9W00U03dstr/oDMV2g8x7yZXKfyIrIm84JJfI2ZJUsxbCte8bDdg5KcqPUKkJVcuW+81rhOhy0umNqDnaCYwtYu4lGIvCTccJEnfjRLpigjhFIYsLxKz0h0nUepjxtD5pKJJe9C2l8sD2MH1F6WuXPG1EVJ7gxntyREIldL9y7YXTRowbQAB2HFsb4VPBiylfyeWZhb1ZEnFwXcYmN1N+p0FM8qZ3NtQhw1UgX0YRGMb3YCEImzOk9qjl5qv3/Y0vWx9ZQ0A9g0JeJk+EBaeuldr9r8A6PlbVw1+SfU/qPiBtheieU5kB2MB70shksKMzOTvHYj8k2OW1A3P157X1tzQ44Hy3y1NJEof+rIXX1KGrWPU3xFP/+cKSiT3Sa5ncEQPQ6HjA++wL3+0NX8kCLMhlOyB+EaHQCpMm1e5OqbhbLmhKweBSRqzrYrna22Be11wsNT9D0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(366004)(376002)(346002)(136003)(8676002)(83380400001)(4326008)(478600001)(66556008)(6486002)(2616005)(66476007)(6506007)(41300700001)(186003)(82960400001)(54906003)(66946007)(316002)(6666004)(86362001)(110136005)(66574015)(26005)(6512007)(2906002)(38100700002)(7416002)(36756003)(8936002)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qKrPE8dILlr9WcC5fIZ8QjLcLnZgYcB9JPBFr2Zoace0VMLFlIF4J/wn4p?=
 =?iso-8859-1?Q?Cmym+azpLEawez99E4OyzhM8PX7jpaoQ9NePVxpsvBv8JwiGKlCp31hZSJ?=
 =?iso-8859-1?Q?ojwv6uWSDTDYSwNOu+uGQmPiF5MAgYKw07/7dmAmnlse+D9+JLfQduU3sU?=
 =?iso-8859-1?Q?y1un19IN63OnLY/jLsc39UzxvJRxtKqCZb8aIF5kZTjcCqBgzsoAWTeHWN?=
 =?iso-8859-1?Q?xMfvyxGksEAHQkzbBLJMdplLpqg0L+MjOQ/2ZOykbdfMWTn8/wXggtcqbX?=
 =?iso-8859-1?Q?RFOW7fB80bhF0bqy8O9PLIuS6/AquWAR11y7EjGS9jjvjvPeTDc4L34xwB?=
 =?iso-8859-1?Q?DAzwZzZZZedQ4FT4S9KHtRvgeZbWNGTY6P5T3CYFdvlcOB4ONcl9lMpM3s?=
 =?iso-8859-1?Q?MLM+y5AHLhDELxgHNfm7FVtJMNcIZf97EXsEGLdh0MJGfpVLZe1V/DiL8S?=
 =?iso-8859-1?Q?bFXdGcoHd2JeRA2rVxCTElsf/rHIq2dm0xd3o39fkHvtbIJfhQ3ogn9KKl?=
 =?iso-8859-1?Q?X27cCMGmA1i/xrVRxnUZc1p8KkkLqkLLgw62mKRWVxroY6k9/oq4q1Zo4t?=
 =?iso-8859-1?Q?iHxdkc/cIVDahu42JX42gGhjqrsMeuLPTNTfYgqbW2JM8yhckCZlNTdR7J?=
 =?iso-8859-1?Q?Drg4l7mZ/BMHCqqpUAPWOj71IWlPVLj4xTGBgvC9/TlDqsrn8kUkkzN1BP?=
 =?iso-8859-1?Q?SKvtYO+fxIoPLRJakkSx4D2FZrYp0Yyq274gRq4PiGgOEpg+R5rKetvz9L?=
 =?iso-8859-1?Q?H85tv7txZXUtzbEW2uIbIThog45ANz9D7UmgJ9OkslrCTT/9RPogieKlEs?=
 =?iso-8859-1?Q?x+SqZ9HxPNcbNs5/Jn6A+6wp10gl2vAsC8IudSGuHU9K3/+WxteNnEP74k?=
 =?iso-8859-1?Q?RaEDKMip3vvI8jjqVmgmdiLC3maaufrwLi6kevLPJje44cABCb5day0UB9?=
 =?iso-8859-1?Q?PdGArJyfIdMF01wnW/96QMHAb+bU4y9pLmcPbN6qJDY6ERw48NMY+gFJ0N?=
 =?iso-8859-1?Q?Yex+T4BvFX7ylMQZ+tED/8A3itWWZR6F716C5LWyRzBoDCj9+P+HDQWXd9?=
 =?iso-8859-1?Q?PhMzV3/+iSqD/onfZqRA/khKF8m20Cg821bLsBR3GaqDTHtVaYfrtJK5Jg?=
 =?iso-8859-1?Q?Ti2O4qmJpcCUMNtqp/vxNs5rGsFd0nffWnNyEGpRvXitxTUiwRcnJB/SON?=
 =?iso-8859-1?Q?iiCTM5Dahqp1BGrUrfbUPDxkvSstD0DtUELdDPdxb3PZI3BcPQ95bzc4LH?=
 =?iso-8859-1?Q?ufvR/eITSGUhMh1e/ox2+WVBbJZhiwXEwPMGYPa/PGsjyh41Fuuy5MEKRK?=
 =?iso-8859-1?Q?cfk9ffa9cm54+jYjD4eQW9W9QJamDfW8rtI/dF67z+pQVJaQx72IISMyI1?=
 =?iso-8859-1?Q?NrtN2ODQEKseXhZ0cZOChBgLLycuoOPgdMmVt4dNGwR8zCD8ay3abHK4vr?=
 =?iso-8859-1?Q?W2z0AqN4UIvItLoI0EYsXAGxOzxnk/bIw2+mrYtHdrQCv5tFSMKZ07kDaT?=
 =?iso-8859-1?Q?FfbLNX5YATMeX7I8/WB+QGkEyOE1FaKrgAuI566NJwlPKDK5knXt8LGoSI?=
 =?iso-8859-1?Q?6NZWQdFq6wI7NI3ADl6SsdGm4QJALBkWJz+qUwF3yikWbfpQzV7Iz7mrDC?=
 =?iso-8859-1?Q?x3RETOsohw7WYK7x4dH2UDFXQ41UoW6WBw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b449ee-ec03-4ad5-8035-08da5fc55de0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 03:04:11.6891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mmgZPpD3vvn1P9goLEL1AGKm0R44mv8/I+S8OQj8otjrfutqk9tDad8CxKNIjnN6wRfRaqD7jfniXcinokDYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2829
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

Here goes drm-intel-next-2022-07-06 that shall be our last one
towards 5.20, containing only a few things:

- Suspend fixes for Display (Jose)
- Properly block D3Cold for now (Anshuman)
- Eliminate PIPECONF RMWs from .color_commit()(Ville)
- Display info clean-up (Ville)
- Fix error code (Dan)
- Fix possible refcount leak on DP MST (Hangyu)
- Other general display clean-ups (Jani, Tom)
- Add bios debug logs (Jani)
- PCH type clean-up (Ville)

Thanks,
Rodrigo.

The following changes since commit 6434cf630086eea2d091f122f5802582a05d9d1c:

  drm/i915/bios: calculate panel type as per child device index in VBT (2022-06-20 19:56:06 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2022-07-06

for you to fetch changes up to 3d9c653cf635849d0c24a1ab17c2752a19f4ded8:

  drm/i915: Nuke PCH_JSP (2022-07-06 20:33:47 +0300)

----------------------------------------------------------------
- Suspend fixes for Display (Jose)
- Properly block D3Cold for now (Anshuman)
- Eliminate PIPECONF RMWs from .color_commit()(Ville)
- Display info clean-up (Ville)
- Fix error code (Dan)
- Fix possible refcount leak on DP MST (Hangyu)
- Other general display clean-ups (Jani, Tom)
- Add bios debug logs (Jani)
- PCH type clean-up (Ville)

----------------------------------------------------------------
Anshuman Gupta (1):
      drm/i915/dgfx: Disable d3cold at gfx root port

Dan Carpenter (1):
      drm/i915: Fix error code in icl_compute_combo_phy_dpll()

Hangyu Hua (1):
      drm/i915: fix a possible refcount leak in intel_dp_add_mst_connector()

Jani Nikula (2):
      drm/i915/bios: debug log ddi port info after parsing
      drm/i915: use DISPLAY_VER() instead of accessing match_info directly

José Roberto de Souza (2):
      drm/i915: Call i915_gem_suspend() only after display is turned off
      drm/i915: Drain freed object after suspend display

Tom Rix (1):
      drm/i915/display: clean up comments

Ville Syrjälä (13):
      drm/i915: Eliminate PIPECONF RMWs from .color_commit()
      drm/i915: Move dbuf details to INTEL_INFO->display
      drm/i915: Move pipe_offsets[] & co. to INTEL_INFO->display
      drm/i915: Move display_mmio_offset under INTEL_INFO->display
      drm/i915: Make pipe_offsets[] & co. u32
      drm/i915: s/_CURSOR2/_MMIO_CURSOR2//
      drm/i915: Use _MMIO_TRANS2() where appropriate
      drm/i915: Use _MMIO_PIPE2() where appropriate
      drm/i915: Get rid of XE_LPD_CURSOR_OFFSETS
      drm/i915: Move the color stuff under INTEL_INFO->display
      drm/i915: Use short PCH names consistently
      drm/i915: Nuke PCH_MCC
      drm/i915: Nuke PCH_JSP

 drivers/gpu/drm/i915/display/intel_bios.c          |   8 +-
 drivers/gpu/drm/i915/display/intel_color.c         |  49 ++++-----
 drivers/gpu/drm/i915/display/intel_ddi.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  30 ++++--
 drivers/gpu/drm/i915/display/intel_display.h       |   4 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   4 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   8 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  44 ++++----
 drivers/gpu/drm/i915/i915_pci.c                    | 112 ++++++++++-----------
 drivers/gpu/drm/i915/i915_reg.h                    |  47 +++++----
 drivers/gpu/drm/i915/intel_device_info.h           |  39 +++----
 drivers/gpu/drm/i915/intel_pch.c                   |  16 +--
 drivers/gpu/drm/i915/intel_pch.h                   |   8 +-
 drivers/gpu/drm/i915/intel_pm.c                    |   8 +-
 17 files changed, 192 insertions(+), 192 deletions(-)
