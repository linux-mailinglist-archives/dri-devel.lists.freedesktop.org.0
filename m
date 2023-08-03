Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C776C76F30C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 20:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30C910E0F8;
	Thu,  3 Aug 2023 18:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63ACA10E049;
 Thu,  3 Aug 2023 18:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691089000; x=1722625000;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=Jk7JjQQAZXm7zEcxSUug5w1XINfB+gKDFbMFlnd5azk=;
 b=dwY6T8y1sWr2e13R2oaG5zQa9ITq0x3yAQV8tRrxBcD2i9qep0DUf/R2
 rIzbwphPps3MEKSoB2MBt+rm0KQ3ohlGMy163/Fmp18rOy6rjUHFXxbYB
 MC4Y/1mPranf4Yv/ulMqlty8rbCXCLB4IUljc47vHs4AUCOPA7/yXV2c0
 eVcOVAZihzQtUvclFAfQpkTdSaJr2DXWAr3Dwy62pSvgHp1y14JC6kXQq
 P4Obfgh5db101EKy18inMz+E2lziwsHicooWDzo/Evn82IBZHj6tWbatA
 Ho5rRY6EfyyPTPzltxZGjxBa0M1bEMWznMFH7revytXC5dNt3bjFkBoNd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="400928201"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="400928201"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 11:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="706685451"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="706685451"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 03 Aug 2023 11:56:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 11:56:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 11:56:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 11:56:16 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 11:56:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHgmxcQd9sS7EwxPqrhacvL4NLgkxJICsRLrSZcbj9I++DxqtImkbLNbX6NZ9ZpOMGdil3rrBluSGjp5osr0IS0j/srrNoMi//sxvWM5W0ZSYWuOjYAmobdjX+saK/XeMRJH7MNKfCHClKj8KkIhznEKzdI4tbrl1DagdzkjKCqmNjfOM77bBXJ9eocQ/fkTiNmjEzzVxOYDAdop+HU+/pWWKlzCDvGMF2569MsLxS/HWTREExe1kCeb60bzTknkY6CqkncXgAcnDtPkedioXiiL80IyH9vk95THzNQATmxXYONBi/xZL1mtFPUKJg0VaWsjMZUyZ46ms90tma++GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JRJzLFxk6rgSgo+34jdDEo5cN/knVzDC/SglsV4u4w=;
 b=QrW8q37pxBIvIm5hcwT9tL4MgnNfmRA+s4920o12aaC8muiKYAE13KBVuMXseMRZRsxZf7wfzrdFfp7ceyObO8fzkNZyjtMBNi/zg982xGJBtKd/AOrbt6OACo32pOKMO5RRq02i1BnlVmtyF3T8UTpNTWInBr+HZnhlA4F5SelssxnTyPkITQCGMgABNLkC5MZ68mxXbC9W3xPJbQOINGqiEv0VD2X1eoyLxL0QnDCkL3Wal1zStjfKCEUfcIyc49ucuPSXva1GvPc18i2/pj7dHFrPPWWIDbntlwlGJ2hWuPyrRayWTOpqgX8gNJVLUiRlpUUIJj+ceVariS5fqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6404.namprd11.prod.outlook.com (2603:10b6:510:1f8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 18:56:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Thu, 3 Aug 2023
 18:56:10 +0000
Date: Thu, 3 Aug 2023 14:56:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <ZMv4RCzGyCmG/BDe@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b7c653-5171-46c6-4a3b-08db94534d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QZn8qQ/sLKIrn7GSvUhsUUb/Gj888vwq6WOE3KtiQvve9WYGHdH1xQm+ZwBZTXgzZb5begJW+L0+ANNlEcPYyKCxuZebCK3/7k4EQHXihzlssDf2j70GUnj5i5QnSziStKssP7AD5xy0hswDxYgpU/oTMHXlXdyVqMC9RccGTx22NoLDukEv5AtkDI0eltbOLWV1HymfgOKcqpFx8m40FpZ/CEHet72H17QVpapdR9GPLwZIYZcd/JwjYo0mL9d8CaJtf621EbsPYwSbwwkVKlJwK030A1uWU+6Z7CogeMGMX6xhYwOKvcKB0vPm4AiXLv26Cfhbj5LSEgE0RYglJRFnUsuw2u7A3ZZVc1xlwY4HuIdqIGoUogUa47JFOfpCijkTTqW7JQZTn5tNs3a3HrdG4m4qG9stjfTN/pkxs33qJdkfKtiHZmtlvi+mk9vVWSEw/yMn7bNrJIig1VYe98srw6q9a85q7yED7EHH4tkGoSr45GjG89dcR92FbLxDkitDtuG+h3kD8mSzppk9oDJXfVB6ClC1M/YZbDFQ2BQWRQOrsr2sKS9kQnGjoww9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(66574015)(2616005)(6506007)(83380400001)(186003)(26005)(8676002)(316002)(66556008)(2906002)(4326008)(66946007)(5660300002)(30864003)(66476007)(41300700001)(7416002)(44832011)(8936002)(6486002)(6666004)(6512007)(54906003)(110136005)(478600001)(38100700002)(82960400001)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3GXAXfuyDLVMkDW4GdCaswLokt7A8qXGGgnBaupGxx243rP4Sw1WhpeRiS?=
 =?iso-8859-1?Q?rrlF1Y3+GTAbchiJuud5P7EqDhCH6QFtuC/u89bltP72iwYBzGZywGGvFL?=
 =?iso-8859-1?Q?ai+SH9xmt2qd9hgFa6Pp/pu1t/E3qpuOHyCPWFoe3KQVIAbo40BiAal5KG?=
 =?iso-8859-1?Q?89V4+9R0qxUKgYZ5ItVqPrAVFCzQUjKTT6WA6VFbf6+7qJBJnLosOWbrgm?=
 =?iso-8859-1?Q?iBuaSBXV0OjhwMsqx/L1931Q+m5VZvU9zp135gxCcMRBbVDaPY4oQUfqhA?=
 =?iso-8859-1?Q?ffxaSGVvwaXXQa6ggUIf+pndKOxwF2hGqcpAmZVGjnOzoKNxGFlzWgIiMc?=
 =?iso-8859-1?Q?fSiKJ0L5U727yuFc7t36/sIgHoLCVvjj9lOCJmXIyx1BNsXgH9Hz69A31T?=
 =?iso-8859-1?Q?lLef9CiWIvkalLw5M/qoLBdHWcVIrvezy8zrhQ6uBYOTAKr+TMGHESC50J?=
 =?iso-8859-1?Q?BhRj91Q4rrq7HNSPOT8aPD16JwlfXoxA+WzgBjoLF+bahNInq4FQrY1OBm?=
 =?iso-8859-1?Q?lIeJr2Qaz1lgmg6wd1PaTc40flwb8ThouWW0AeQAtnMeRfR6Hh0WmnQIyb?=
 =?iso-8859-1?Q?bt8LQfA/xOQbAEDd9V8NvYpER/pW6Efcf3YZ9g27CDEtOHtctdq5e3Q0VS?=
 =?iso-8859-1?Q?rGRi0W7/DgvSMVIlDc39MhGLiYxJ09Mp7YXampRG+e/GRRLBklYQWX7/kd?=
 =?iso-8859-1?Q?jdORt+atNICyxukKxUp5o/JUNrt+XoG0VAIrn4PfHndYDeGmWa6U5+p2UE?=
 =?iso-8859-1?Q?9VHSGKiRa8UACY3uSokRRcjzyghsCA9I+Q+liM5zCdR9QmupQpvIfUQDeY?=
 =?iso-8859-1?Q?Bdh+/w4fVmsLtwnpdu9SmiNeml8FW8i76+3t745Mw9n9LbxKf5Y1gKMnK1?=
 =?iso-8859-1?Q?jWEYG94Z0oL6PyIgH4557SqyLQVk8zxlF82CKQNP8v5KEX+mq8+OfJ2pVy?=
 =?iso-8859-1?Q?vW/npTu+dBgpVf2L9Ae9aEwyXtaSugRdVO5E/JmXHzkfvGpFGBUtni2dmJ?=
 =?iso-8859-1?Q?1bWddZ98s1aXocNVkhbhccoM1eqb32diLU/lC6+uJeo63SLNC7fopnX84+?=
 =?iso-8859-1?Q?ZSFb5Vr5aHnUCiFwePFgwip6HBtir+CbleR0OlBvuKynir+/zRNHoLRhcR?=
 =?iso-8859-1?Q?GO5rvp+s4xP7/AVhd96WTyqANIFum/m1grgvLoKVbuxGuNFTLhMiS03zqX?=
 =?iso-8859-1?Q?2qw4vUzDSlpNMMeMSo3MXkC7fd5AfvYl+eRz/zTjc6SOIvZIrcDq52D5VY?=
 =?iso-8859-1?Q?tl2BfA9/X+Nq+S9X5L8heUteKHntRV12TuB+xGPmT3NzUJqiwD0nBOczoo?=
 =?iso-8859-1?Q?U/5Xb3ICM+8DjnnunQ3xbRUMezV4rORaxzzNJEXkGhGum9OJMzUN57MBJT?=
 =?iso-8859-1?Q?8msc9fn1oNXwdPS2jAzcnMB6HsAIi3Kh0Am/cWDuzRDP5MZIVzqlVcXSvS?=
 =?iso-8859-1?Q?+zeAsrKS6GogPuCD4bl0djkWA0KUVB+hBNP3wEKx+1HxqkjmMUcOfI9ijZ?=
 =?iso-8859-1?Q?76qM0KJJB7tawCa3edN49HxDq9yttKjaCW1eTtObZifD3AE3n7RQMUbFch?=
 =?iso-8859-1?Q?YZsFzIBKigJgdO6kcGH0rVBf1jP7XxNFEefpBMhGfPKTQsOUrlaIr1Oymx?=
 =?iso-8859-1?Q?SrHSkbrOO1PlOrOh9CZPFukKlpGWbTpfpP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b7c653-5171-46c6-4a3b-08db94534d20
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 18:56:10.3208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQx75guyWEzZxbdVoOSFtAz2SXcYTrPn97KwVJFQtSGx3BcOeEapvwSjKX3IN4bKTBrrfb4YvxX/hpwPlyLoYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6404
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

Here goes our first pull request of this round.

drm-intel-next-2023-08-03:

- Removing unused declarations (Arnd, Gustavo)
- ICL+ DSI modeset sequence fixes (Ville)
- Improvements on HDCP (Suraj)
- Fixes and clean up on MTL Display (Mika Kahola, Lee, RK, Nirmoy, Chaitanya)
- Restore HSW/BDW PSR1 (Ville)
- Other PSR Fixes (Jouni)
- Fixes around DC states and other Display Power (Imre)
- Init DDI ports in VBT order (Ville)
- General documentation fixes (Jani)
- General refactor for better organization (Jani)
- Bigjoiner fix (Stanislav)
- VDSC Fixes and improvements (Stanialav, Suraj)
- Hotplug fixes and improvements (Simon, Suraj)
- Start using plane scale factor for relative data rate (Stanislav)
- Use shmem for dpt objects (RK)
- Simplify expression &to_i915(dev)->drm (Uwe)
- Do not access i915_gem_object members from frontbuffer tracking (Jouni)
- Fix uncore race around i915->params.mmio_debug (Jani)

Thanks,
Rodrigo.

The following changes since commit 69f06e4fa098420e94f6970332e84f0ed493271c:

  Merge drm/drm-next into drm-intel-next (2023-06-10 10:04:00 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-08-03

for you to fetch changes up to d823445b09a2f1c43877b87a55fc699c3a836fc2:

  drm/i915/uncore: fix race around i915->params.mmio_debug (2023-08-01 19:39:17 +0300)

----------------------------------------------------------------
- Removing unused declarations (Arnd, Gustavo)
- ICL+ DSI modeset sequence fixes (Ville)
- Improvements on HDCP (Suraj)
- Fixes and clean up on MTL Display (Mika Kahola, Lee, RK, Nirmoy, Chaitanya)
- Restore HSW/BDW PSR1 (Ville)
- Other PSR Fixes (Jouni)
- Fixes around DC states and other Display Power (Imre)
- Init DDI ports in VBT order (Ville)
- General documentation fixes (Jani)
- General refactor for better organization (Jani)
- Bigjoiner fix (Stanislav)
- VDSC Fixes and improvements (Stanialav, Suraj)
- Hotplug fixes and improvements (Simon, Suraj)
- Start using plane scale factor for relative data rate (Stanislav)
- Use shmem for dpt objects (RK)
- Simplify expression &to_i915(dev)->drm (Uwe)
- Do not access i915_gem_object members from frontbuffer tracking (Jouni)
- Fix uncore race around i915->params.mmio_debug (Jani)

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/i915/gmch: avoid unused variable warning

Chaitanya Kumar Borah (2):
      drm/i915/color: Upscale degamma values for MTL
      drm/i915/color: Downscale degamma lut values read from hardware

Gustavo Sousa (1):
      drm/i915: Remove prototype for intel_cx0_phy_ddi_vswing_sequence()

Imre Deak (5):
      drm/i915/adlp+: Allow DC states along with PW2 only for PWB functionality
      drm/i915: Add missing forward declarations/includes to display power headers
      drm/i915: Remove redundant forward declarations from display power headers
      drm/i915: Add way to specify the power-off delay of a display power domain
      drm/i915: Prevent needless toggling of DC states during modesets

Jani Nikula (13):
      drm/doc: fix duplicate declaration warning
      drm/i915: fix Sphinx indentation warning
      drm/i915: use mock device info for creating mock device
      drm/i915: move platform_engine_mask and memory_regions to device info
      drm/i915: separate display info printing from the rest
      drm/i915: fix display info usage
      drm/i915: move display device and runtime info to struct intel_display
      drm/i915: make device info a const pointer to rodata
      drm/i915/uncore: add intel_uncore_regs() helper
      drm/i915/dram: replace __raw_uncore_read32() with intel_uncore_read_fw()
      Revert "drm/i915: use localized __diag_ignore_all() instead of per file"
      drm/i915/uncore: split unclaimed_reg_debug() to header and footer
      drm/i915/uncore: fix race around i915->params.mmio_debug

Jouni Högander (5):
      drm/i915/psr: Use hw.adjusted mode when calculating io/fast wake times
      drm/i915: Add macros to get i915 device from i915_gem_object
      drm/i915: Add getter/setter for i915_gem_object->frontbuffer
      drm/i915/display: Remove i915_gem_object_types.h from intel_frontbuffer.h
      drm/i915: Add function to clear scanout flag for vmas

Lee Shawn C (2):
      drm/i915/mtl: update DP 2.0 vswing table for C20 phy
      drm/i915/mtl: Add new vswing table for C20 phy to support DP 1.4

Mika Kahola (1):
      drm/i915/mtl: Cleanup usage of phy lane reset

Nirmoy Das (1):
      drm/i915/display: Do not use stolen on MTL

Radhakrishna Sripada (3):
      drm/i915/mtl: Fix SSC selection for MPLLA
      drm/i915/mtl: Skip using vbt hdmi_level_shifter selection on MTL
      drm/i915/dpt: Use shmem for dpt objects

Simon Ser (1):
      i915/display/hotplug: use drm_kms_helper_connector_hotplug_event()

Stanislav Lisovskiy (5):
      drm/i915: Don't preserve dpll_hw_state for slave crtc in Bigjoiner
      drm/i915: Fail if DSC compression requirement is less than platform supports
      drm/i915: Add helper function for getting number of VDSC engines
      drm/i915: Don't rely that 2 VDSC engines are always enough for pixel rate
      drm/i915: Start using plane scale factor for relative data rate

Suraj Kandpal (8):
      drm/i915/hdcp: Modify hdcp_gsc_message msg sending mechanism
      drm/i915/hdcp: Assign correct hdcp content type
      drm/i915/hdcp: Add a debug statement at hdcp2 capability check
      drm/i915/dsc: Move rc param calculation for native_420
      drm/i915/drm: Fix comment for YCbCr20 qp table declaration
      drm/i915/dsc: Add rc_range_parameter calculation for YCbCr420
      drm/i915/vdsc: Remove FIXME in intel_dsc_compute_config
      drm/i915/hotplug: Reduce SHPD_FILTER to 250us

Uwe Kleine-König (1):
      drm/i915: Simplify expression &to_i915(dev)->drm

Ville Syrjälä (39):
      drm/i915/dsi: Do panel power on + reset deassert earlier on icl+
      drm/i915/dsi: Do display on sequence later on icl+
      drm/i915/dsi: Print the VBT MIPI sequence delay duration
      drm/i915/dsi: Split icl+ D-PHY vs. DSI timing steps
      drm/i915/dsi: Gate DSI clocks earlier
      drm/i915/dsi: Respect power cycle delay on icl+
      drm/i915/dsi: Implement encoder->shutdown() for icl+
      drm/i915/dsi: Move most things from .disable() into .post_disable() on icl+
      drm/i915/dsi: Do DSC/scaler disable earlier on icl+
      drm/i915/dsi: Respect power_off_delay on icl+
      drm/i915/dsi: Move panel reset+power off to be the last thing
      drm/i915/dsi: Grab the crtc from the customary place
      drm/i915/dsi: Remove weird has_pch_encoder asserts
      drm/i915: Re-init clock gating on coming out of PC8+
      drm/i915/psr: Fix BDW PSR AUX CH data register offsets
      drm/i915/psr: Wrap PSR1 register with functions
      drm/i915/psr: Reintroduce HSW PSR1 registers
      drm/i915/psr: Bring back HSW/BDW PSR AUX CH registers/setup
      drm/i915/psr: HSW/BDW have no PSR2
      drm/i915/psr: Restore PSR interrupt handler for HSW
      drm/i915/psr: Implement WaPsrDPAMaskVBlankInSRD:hsw
      drm/i915/psr: Implement WaPsrDPRSUnmaskVBlankInSRD:hsw
      drm/i915/psr: Do no mask display register writes on hsw/bdw
      drm/i915/psr: Don't skip both TP1 and TP2/3 on hsw/bdw
      drm/i915/psr: Allow PSR with sprite enabled on hsw/bdw
      drm/i915/psr: Re-enable PSR1 on hsw/bdw
      drm/i915: Remove bogus DDI-F from hsw/bdw output init
      drm/i915: Introduce device info port_mask
      drm/i915: Assert that device info bitmasks have enough bits
      drm/i915: Assert that the port being initialized is valid
      drm/i915: Beef up SDVO/HDMI port checks
      drm/i915: Init DDI outputs based on port_mask on skl+
      drm/i915: Convert HSW/BDW to use port_mask for DDI probe
      drm/i915: Initialize dig_port->aux_ch to NONE to be sure
      drm/i915: Only populate aux_ch if really needed
      drm/i915: Remove DDC pin sanitation
      drm/i915: Remove AUX CH sanitation
      drm/i915/bios: Extract intel_bios_encoder_port()
      drm/i915: Try to initialize DDI/ICL+ DSI ports for every VBT child device

 Documentation/gpu/rfc/i915_scheduler.rst           |   4 +
 drivers/gpu/drm/i915/Makefile                      |   5 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |   8 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |  23 ++-
 drivers/gpu/drm/i915/display/icl_dsi.c             | 134 ++++++++-----
 drivers/gpu/drm/i915/display/icl_dsi.h             |   4 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   7 +-
 drivers/gpu/drm/i915/display/intel_bios.c          | 188 +++++-------------
 drivers/gpu/drm/i915/display/intel_bios.h          |   6 +
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  12 +-
 drivers/gpu/drm/i915/display/intel_color.c         |  27 ++-
 drivers/gpu/drm/i915/display/intel_crt.c           |   2 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  16 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |   3 -
 drivers/gpu/drm/i915/display/intel_ddi.c           | 106 ++++++++--
 drivers/gpu/drm/i915/display/intel_ddi.h           |   4 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |  28 ++-
 drivers/gpu/drm/i915/display/intel_display.c       | 107 ++---------
 drivers/gpu/drm/i915/display/intel_display.h       |   4 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |  11 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   6 +-
 .../gpu/drm/i915/display/intel_display_device.c    | 192 ++++++++++++------
 .../gpu/drm/i915/display/intel_display_device.h    |   6 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  18 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  47 +++--
 drivers/gpu/drm/i915/display/intel_display_power.h |  33 +++-
 .../gpu/drm/i915/display/intel_display_power_map.c |  16 +-
 .../drm/i915/display/intel_display_power_well.h    |   3 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  13 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  53 ++++-
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |   3 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_dsi.c           |  20 ++
 drivers/gpu/drm/i915/display/intel_dsi.h           |   2 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |   2 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   9 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |  46 ++---
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |  28 ---
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   7 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |  80 ++++----
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |   3 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  72 +++++--
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  14 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |   4 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   5 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 200 +++++++++++++++----
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |  18 +-
 drivers/gpu/drm/i915/display/intel_qp_tables.c     |  10 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  20 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          | 214 +++++++++++++--------
 drivers/gpu/drm/i915/display/intel_vdsc.h          |   1 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  23 ---
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  67 +++++++
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   3 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   6 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |   8 +-
 drivers/gpu/drm/i915/gt/intel_sa_media.c           |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   4 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   1 +
 drivers/gpu/drm/i915/i915_driver.c                 |   2 +
 drivers/gpu/drm/i915/i915_drv.h                    |  11 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   6 +
 drivers/gpu/drm/i915/i915_gpu_error.h              |   3 +
 drivers/gpu/drm/i915/i915_irq.c                    |  20 +-
 drivers/gpu/drm/i915/i915_pci.c                    |  69 +++----
 drivers/gpu/drm/i915/i915_reg.h                    |   1 +
 drivers/gpu/drm/i915/i915_vma.c                    |  28 ++-
 drivers/gpu/drm/i915/i915_vma.h                    |   2 +
 drivers/gpu/drm/i915/intel_clock_gating.c          |  11 ++
 drivers/gpu/drm/i915/intel_device_info.c           |  48 ++---
 drivers/gpu/drm/i915/intel_device_info.h           |  11 +-
 drivers/gpu/drm/i915/intel_uncore.c                |  44 +++--
 drivers/gpu/drm/i915/intel_uncore.h                |   5 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |   2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |  45 +++--
 drivers/gpu/drm/i915/soc/intel_dram.c              |   2 +-
 drivers/gpu/drm/i915/soc/intel_gmch.c              |   4 +-
 82 files changed, 1447 insertions(+), 841 deletions(-)
