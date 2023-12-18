Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B42817A76
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AD110E3F6;
	Mon, 18 Dec 2023 19:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2444A10E3AE;
 Mon, 18 Dec 2023 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926048; x=1734462048;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=2hBOenA8ZZXNLKXWENRK6XZuQiE/+26ajbXZ+SAsS8I=;
 b=JQu8B/kt96TNjQKzIiYmA1NrIJUax2//sgBeV/OrCL/rIWwW+XfMPbKp
 gDVA/hIBdK41jeEZs1BxRTD/e/N5LzdCCbsO4wv12Zv+jMpjHe1V7A4Tb
 1sUOfzjecU3sWVidANeOSwehbqNj0fQuIvXYVjDpIr6B8tgYn/2eD1ruR
 bESdZM6vhT3dupkVjI58qZArOYcuUBmIPONChn3CvhCTee93hC33/7wvt
 IYuknVfL2G0vmsOgVM3I2ejoIsK9rAL7JAOesXp9ncVYYdNxC0WZzkXQ5
 YiEhAQnbSxVeoOfmMxI39tx0Ukq0j8FKsPJP3ZuWKQMpOkv+0DUb17KZT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="461984498"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="461984498"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:55:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="17255146"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2023 08:55:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 08:54:59 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 08:54:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 08:54:59 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 08:54:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcdUL8Tpzk4gpBtvvGD8dooFV2SKnC63SqIgtdHzaLRr4q6G0GTFMmQBRiBzbJQwkAlYfsd0kKgUIBB4L8FLtM7cKVJ4wzjAtbMQKz12prbe6bxe2FNkvGQXcLp+NufBWWewLnMGS0JcqAMwGXa4WPvaw5xc1HuMB7/e+9eHuEAYuQK1RZ5l0O5oytPnu1w0ehhK7ouGGSvcmEHE7TZkqRXiKQo2yeS/Hknj2lhM2W1j7R/mlUNbFEGY8l4N30Z9t1K4jhUfuGiEvLhzBU+5RY4LWixTGCqBeFCBjgGAZR7ZTTOexV23nKxzvzEQ+p4zUjobRk7hyvywDL44gnP+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Roh5ls446B/6GqQ5ya4TsPYM9URbbPub7K0Ng/GIhvI=;
 b=Lb4sj+l8V9ebOiw+jCcIEgrun8fovk00WHMo/W+QqjjqkWdxB+/ZrgCouKSYm4A3LSEkDerMf5hE28Pq7djQt+Acy06XGmUcskRGFiz1gi0hIhb/Ltb2SKvkPq+ADTS4tCjfWwg7aFOEDzS6UxTOjKLefkYzdOy+FkxEudXuGCWv+UjlsqVbZqm29aoEX3MyczTB6iJXOUuTRuKbfNqgjwVzrJkI49sKpQ6lIoLdU76yZyoVpNPgav8/TglOFhwa2Hs+bgEenNuFH8FzfQjReOhIaP/LDXRzI+Yo6+IanN2qVS5b9h4f/mEARVfS+ywXvkRPb7/E6QzAOletzcL1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Mon, 18 Dec
 2023 16:54:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 16:54:57 +0000
Date: Mon, 18 Dec 2023 11:54:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <ZYB5XBRdWWgWoMKc@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0201.namprd05.prod.outlook.com
 (2603:10b6:a03:330::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d841c5-52a0-4c13-cfa4-08dbffea10b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ru9eyKKKdgJtf61jlWw4z05gCMU3af3URpb6pwjWFRuVEZ+qc8OiQSYTempLwkTnZd/V9iDRLIaerhytA2gsKW4GbG/ORAdJuLUtRjCybk0u2Q781BTLdH6FyeqNHoBQhuZiCrFUwE3ZaHFcHDsUbhUqj9+suj6jKwrUnghKSleXAEU764P8PuESMMGApWUCZ0Gecb962G+Mbc96DAQ8xuTuQpacN7t5S3YmtuGCqTOdk7FHZ0Afr9w9TPJJ/Hpz940HTp4u/JPkB3jhUNvaRZkwWTVAiY0x0sEMRRkcqaAW3WHhlijfqqqG+GX5A4nwZr2VUIEbSVQlpVuriV8KyWMbayl9kPuAistaKX/LXiSF7UYei6jCLl9lzVXufrNWMKZlOXJs8XXBDOTl2L7om+cbcCXXw9P3vYbkti7i3jRS5HRa00miERo0GB2ZhuYp3sS9Gfz3ZPVTbRVHjVoIPlSIyrmZYCIv3bxIHDbFBUWMHwSq56X81Kw2Bw1MxHhcpNCSfg4xhjaLTXjZGsvF07AmZjcV1xENgbEbKU9uGFP6C5/QLH3TkVGEMXlIHus6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66574015)(2616005)(26005)(6666004)(6512007)(6506007)(8676002)(83380400001)(44832011)(5660300002)(7416002)(2906002)(4001150100001)(41300700001)(478600001)(6486002)(316002)(54906003)(8936002)(4326008)(66556008)(66946007)(66476007)(110136005)(82960400001)(36756003)(86362001)(38100700002)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vylC7mKki4WIZugva+MblLk2N7Yqn2OeeFozUz0KAHDZ5Bh+8kJnsoZcw1?=
 =?iso-8859-1?Q?9WTEXD8DSiiaKyHBp1FFBs2IkZvah+Z8w7dSWbltNYQMy9pxfKUpotYpvf?=
 =?iso-8859-1?Q?Ap0TK1VK7uY6xdNKCx93BWvFxGqIaCliuxmwL2KsIOfwV7qhcooMXvQ2n7?=
 =?iso-8859-1?Q?ytRgLRsqId5iD9XJzDzgsy+j3wCG3HCDhq71qvsPz7LFpQJFS1jjtvAb0y?=
 =?iso-8859-1?Q?kN0LGFab6KGYdFbFHap8h2am0/G1czWC1nMRDrZu3PCdiLKL4kuye1cmmz?=
 =?iso-8859-1?Q?x0+PzJpUbDUavC35dZRXqrpWkDD6VmYtKwp5cmaJ2yiBoMA5ojTErOnn4J?=
 =?iso-8859-1?Q?Qm1oCnbEdEkB0hOvJapokhcq5bw7J3eeJ+5At3+bjo+gvmo9Aj2ncJCU0x?=
 =?iso-8859-1?Q?+CaJwR3YAP7XlZ28QczINbzuEC97oSN+aquohDQeoTPE2yTOfYXXjkJF8C?=
 =?iso-8859-1?Q?3Bf0NODp/lDVkKAxbOId5rcWGKaiElbzRoyK34U+47ZF96F6UIHO69hbxv?=
 =?iso-8859-1?Q?mEO+b9z4SgagfP4AhPbBQPgaBijF4gDJimU1yjOtd2AU+wIPIl9qoDytsI?=
 =?iso-8859-1?Q?Q9BbaMfNLbM3jlBa0IsLcOqlNchFWBYghq6t8N2f/9FBOnNT+skkrpm6j7?=
 =?iso-8859-1?Q?e2o70SNZ5BHP1VhQ5fedCEwjcL9akoUXL0q78GaKIl6P4Imhw0EZxUZNkW?=
 =?iso-8859-1?Q?+t5iHzmhaVNeLkDcCIA6X/oAqIM2/Af8EjFz8/pEMn6f+EzuhrsyDZcjzm?=
 =?iso-8859-1?Q?8hpeA/gQja9cFzHNcLo5cSOMfaSlT5wo91H0CfMYvW5MxBggJJi286nlHd?=
 =?iso-8859-1?Q?swIIUqFEWZNu7kZOjHUZ57mRCvl/Zs0X+N07EG8De2/7XcDrVmiOBVRcOA?=
 =?iso-8859-1?Q?ky0KBFp7ldf9hyrembOBe9tnsmBQDFzWavtqH2QgrE4xYdJ/0TuXJ60u6Y?=
 =?iso-8859-1?Q?6F0axYaeqoImdHwDnQsT0i98QaiPLyFaS3wQ6Q0m+x2sZCM/dzrYWazpwn?=
 =?iso-8859-1?Q?Iq7QYrJbAItxpbQG9SB5dr1TCDLvrug0sxq0Kl1lLuWj4lEZ0xpCuQp7CK?=
 =?iso-8859-1?Q?nfIn+1WLITCPR4mbWPydrCYnVHimw9usy2FQFqE2Cfv40U4iJlQT6xzsVq?=
 =?iso-8859-1?Q?5zjMDgfyF7oQWytoIEcDxtNogKfcZI3xAfG1jkPMkZQ7t6mBdDBmQ0YwzB?=
 =?iso-8859-1?Q?KPXl5RsA6xwOxmKtL5RpuIngsrRb5oUafH3wgXN96E/4YTsZGqx5f5I6k4?=
 =?iso-8859-1?Q?Yd57vLWfkDZXhALrscOl/3c9HP01dPM7uzX5/g1q2Nd85bhmPWSosYaOBy?=
 =?iso-8859-1?Q?JdTEHnQAd+ju2fofsQe90k1hCQaN0gy1t46M22HEuX7cquR1q+MAkpM18N?=
 =?iso-8859-1?Q?UDQKDz6djNTKyt44VRN3o1O6roj2m6NCFuur8Pcm7kqvd0+7aAawp+Kob7?=
 =?iso-8859-1?Q?G5WaXbzYArRFCuRQ1/zLG3xsVBjc3oeb4HvhxuUb9dNWQ6fXAxLOASo71G?=
 =?iso-8859-1?Q?K3JTlvQMyc/VEORp+H7F2Ae2QMLLVQgUpycH80+3vysjps6ip+YUXoKu2v?=
 =?iso-8859-1?Q?wVE/fUlDXNgRiAvlLivM6ysJvtdCs14sdU0IMevkdbsibbgP/ua5JXHBtG?=
 =?iso-8859-1?Q?o0FuwKesC/Y+AqOPFNlmmLmf5UYcmG4TAHbri4Sm/a1FlHoy0TfvwwBw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d841c5-52a0-4c13-cfa4-08dbffea10b3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 16:54:57.3677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0Vq6O3ndNufNxjKF0lQiQmIp8ovb2OxQBVB56WqSmfy5eKgB44tvZgTFMDOcRuoI2G60KSlShkAct06NcMRJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

Hi Dave and Sima,

Here goes our latest drm-intel-next pull-request towards 6.8.

drm-intel-next-2023-12-18:

- Drop pointless null checks and fix a scaler bug (Ville)
- Meteor Lake display fixes and clean-ups (RK, Jani, Andrzej, Mika, Imre)
- Clean-up around flip done IRQ (Ville)
- Fix eDP Meteor Lake bug (Jani)
- Bigjoiner fixes (Ankit, Ville)
- Cdclk/voltage_level cleanups and fixes (Ville)
- DMC event stuff (Ville)
- Remove dead code around intel_atomic_helper->free_list (Jouni)

Thanks,
Rodrigo.

The following changes since commit 10690b8a49bceafb1badf0ad91842a359e796d8b:

  drm/i915/display: Add intel_fb_bo_framebuffer_fini (2023-12-07 17:31:02 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-12-18

for you to fetch changes up to 716c3cf21784479a1934b670ec67f320cbb5d308:

  drm/i915/display: Remove dead code around intel_atomic_helper->free_list (2023-12-18 13:37:01 +0200)

----------------------------------------------------------------
- Drop pointless null checks and fix a scaler bug (Ville)
- Meteor Lake display fixes and clean-ups (RK, Jani, Andrzej, Mika, Imre)
- Clean-up around flip done IRQ (Ville)
- Fix eDP Meteor Lake bug (Jani)
- Bigjoiner fixes (Ankit, Ville)
- Cdclk/voltage_level cleanups and fixes (Ville)
- DMC event stuff (Ville)
- Remove dead code around intel_atomic_helper->free_list (Jouni)

----------------------------------------------------------------
Andrzej Hajda (1):
      drm/i915/display: do not use cursor size reduction on MTL

Ankit Nautiyal (1):
      drm/i915/display: Get bigjoiner config before dsc config during readout

Imre Deak (1):
      drm/i915/mtl: Fix HDMI/DP PLL clock selection

Jani Nikula (1):
      drm/i915/edp: don't write to DP_LINK_BW_SET when using rate select

Jouni Högander (1):
      drm/i915/display: Remove dead code around intel_atomic_helper->free_list

Mika Kahola (1):
      drm/i915/display: Wait for PHY readiness not needed for disabling sequence

Radhakrishna Sripada (3):
      drm/i915/mtl: Use port clock compatible numbers for C20 phy
      drm/i915/mtl: Remove misleading "clock" field from C20 pll_state
      drm/i915/mtl: Rename the link_bit_rate to clock in C20 pll_state

Ville Syrjälä (24):
      drm/i915: Fix remapped stride with CCS on ADL+
      drm/i915: Fix intel_atomic_setup_scalers() plane_state handling
      drm/i915: Streamline intel_dsc_pps_read()
      drm/i915: Drop redundant NULL check
      drm/i915: Drop crtc NULL check from intel_crtc_active()
      drm/i915: Drop NULL fb check from intel_fb_uses_dpt()
      drm/i915: Drop redunant null check from intel_get_frame_time_us()
      drm/i915: s/cstate/crtc_state/ in intel_get_frame_time_us()
      drm/i915/tv: Drop redundant null checks
      drm/i915: Stop accessing crtc->state from the flip done irq
      drm/i915: Drop irqsave/restore for flip_done_handler()
      drm/i915: Reject async flips with bigjoiner
      drm/i915/cdclk: s/-1/~0/ when dealing with unsigned values
      drm/i915/cdclk: Give the squash waveform length a name
      drm/i915/cdclk: Remove the assumption that cdclk divider==2 when using squashing
      drm/i915/cdclk: Rewrite cdclk->voltage_level selection to use tables
      drm/i915/mtl: Fix voltage_level for cdclk==480MHz
      drm/i915: Split intel_ddi_compute_min_voltage_level() into platform variants
      drm/i915/mtl: Calculate the correct voltage level from port_clock
      drm/i915: Simplify intel_ddi_compute_min_voltage_level()
      drm/i915/dmc: Don't enable any pipe DMC events
      drm/i915/dmc: Also disable the flip queue event on TGL main DMC
      drm/i915/dmc: Also disable HRR event on TGL/ADLS main DMC
      drm/i915/dmc: Print out the DMC mmio register list at fw load time

 drivers/gpu/drm/i915/display/i9xx_wm.c             |   2 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   3 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 111 ++++++++++------
 drivers/gpu/drm/i915/display/intel_crtc.c          |   9 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  82 +++++-------
 drivers/gpu/drm/i915/display/intel_ddi.c           |  48 +++++--
 drivers/gpu/drm/i915/display/intel_ddi.h           |   3 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  33 ++---
 drivers/gpu/drm/i915/display/intel_display_core.h  |   6 -
 .../gpu/drm/i915/display/intel_display_device.h    |   2 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   7 -
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  15 +--
 drivers/gpu/drm/i915/display/intel_display_types.h |   6 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           | 147 ++++++++++-----------
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |   1 +
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  31 +++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |  18 ++-
 drivers/gpu/drm/i915/display/intel_psr.c           |   6 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |  25 ++--
 drivers/gpu/drm/i915/display/intel_tv.c            |   6 -
 drivers/gpu/drm/i915/display/intel_vdsc.c          |  21 +--
 drivers/gpu/drm/i915/display/skl_scaler.c          |   2 +-
 23 files changed, 305 insertions(+), 281 deletions(-)
