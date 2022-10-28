Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83557611A11
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 20:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122C410E8A2;
	Fri, 28 Oct 2022 18:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF40410E8A1;
 Fri, 28 Oct 2022 18:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666981362; x=1698517362;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=rfXrHP164tSbHGxfMghBpmo/nJ0qEcwP4UFjLuRoBtA=;
 b=FJAsosHR76uRPuOybLUJaFIP2K0H7UB7Aj31QEwlHgt0KqwRdpNMZL7W
 0Zak8iy7Dh2xlw+wat5St4ip7vDaafTXsph14QPU973/NjQErocjufXxl
 tHd5PjFYo4nij2YInvcJ3DNGQyN+DYKtDSsyhIyufIWG4SskyTcPRwhOo
 dRbtmS894PIBDBI8RGVfyxNgLsfJMFBHgvZNbD86OOfD+SAPmfvu809sf
 fMELXphVLC4kGH2iqDiGuWtzVcjlmmi/A9n3NC4A6y29JW3y+VcdVTiKP
 k/zizz5Vzo1zaXk1gm3MGugzSAoCR5CfTFoiBj1veNnaQpl7uk7qDc5i3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="295970348"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="295970348"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 11:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="722145904"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="722145904"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Oct 2022 11:22:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 11:22:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 28 Oct 2022 11:22:41 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 28 Oct 2022 11:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIm/wrLsiU1+DoqVoG7GGYClwl1WPvP5V+iGiKepkXJ2EcdkXwGRWAGA70Kcaai4ez8hwqAoCJu956LulxUU+w7MSqY1GDORDnT5cedbrtFqCDhR/XI61llAQ0tUVt8cMM7Z1tmv2KQC53Id+NMTuX9nDPrQGy+03fIbYfFu9a5kwmdzGE+SbBBtuaz+3rTH5MlCzpcaLR7oTx00+iQfcC3rbJZa8+a28DrwJfRSBEpGUhc56rxIMpnWSjxpv2ceK4Z1x1GJzejfUyp6tRj3RMB8FKxBGdPsThf+CSJhwGTJAfywdkrSVaZvyVoH1akbwNjx1zkixnRTjlOIs5488g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU6V0stVjnetNcv8ms0rD5w3s8Ua6KTeF14fA42G+Ws=;
 b=Yub3YeSt8Q2/Vx1HsJcWhy9fVO+W6eDlE1AvvnYFVV9+CrAjr+I8PX0tWfEgF9t/1LZX0SIaRfpjg18nlzPBCQEjVPeNvJQRMtZ33kG7T6bVKnUCxRvJxHnK5FZc8A9gTg3/TSu9wow7xU3I0+I+GaiMhk5sXd8AElXY1vbZuZxTX2V055pyEfIW3b6SYFpNFAElVTTvToGw/CFXF889MmQzjoWnN/nOSGnyfr7DS88kt0jpJZUi3vaYvHj5/BNeos51mPHhp1IG9wbIUaq66jV+gE2f6ShSHAO/764l5UFGSaWNz95/d91ToBZNfXRDRimh5eUt3eSi/sPcZ7yUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6782.namprd11.prod.outlook.com (2603:10b6:806:25e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 18:22:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::29e1:56c3:823b:45d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::29e1:56c3:823b:45d%4]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 18:22:38 +0000
Date: Fri, 28 Oct 2022 14:22:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <Y1wd6ZJ8LdJpCfZL@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5f0c59-fa03-41e2-3d8c-08dab91164c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6joeTdW/husIgeTyUkOjHZY/bQWhDBdUK8v4PDylpjw01+Q6UULUpDf74XgZ5NyD29FRvfC8Y/Q1YGlYuefWb6CCMC6qMINY7cR/nMroWlrwoYlF3+JdxjkmXtJ+Ncr9nKPX7v7MEH+Dwov5mSYd9AVT98NHHyRDPpI2BQH9zBVscKm7/ZS8cTM7J+BvIbe+42XuYxlu3E50VFWBXCmJRqXbpQDrnuINq3W1ZUQHAE6uarxC8jdIPqCaP7VgslvPGbhklO9xol8S6R0MosIGRIic9zVENC/C4VyfkRgExySAz8UZB1l8EKC7EC+yxTtKtEpW1FhTQov/Igva+uht1PxBuW6zHkcAA11VZOnP3ihIFFbraHwm2WupaBJp2AXBC2LgEJy3OfMQXlmjIFdg/3XVll7V2ftLBoDUzNuOE3F9kUNJRUmM1Kbi9QRg8KR8dHWGEtcuXMrKer9M1oKNuuXBV/C2D5A2VwZ9JQaBLgKu443ug1ywSDNh1tD+ZA+2mNxIj++GgQ0wiMfHML+IweD7XTf3EKbFzDF3Gfqr5ZspLdU87LsnsUbt+pSvI94qfx3wOOXok1rFjmmag3p3aszwqte22L6ImxWP18utbeqLRD+7+eZSGQOD4Pa5cD57B53D3ZQ55RBQwXVEVRaKPXnWs8A/JXK6B0gkyB5FFre/G5waqquLDacDvBfyS/U5qSgl+FigPs7uO2lkC5GkJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(66899015)(38100700002)(86362001)(36756003)(82960400001)(83380400001)(44832011)(6512007)(7416002)(26005)(2906002)(6506007)(54906003)(66574015)(6666004)(2616005)(186003)(4001150100001)(110136005)(4326008)(30864003)(478600001)(316002)(66946007)(6486002)(66476007)(8936002)(5660300002)(41300700001)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uuroOrMbjWX/MT8aYKKhIfTstbYCfy+/CZO4geI6zp7pAMhWQnw9Lb1J7T?=
 =?iso-8859-1?Q?t+BpkI1xM0G9ROPl5LQ+885OibBYTBfyid8vLVxUbOKtub2xWLr9c/doBj?=
 =?iso-8859-1?Q?0450xrliwRJnX1gD7XJKbhawXwsutZQ63/tGGKc4itkH0QDLBFeqWTCua6?=
 =?iso-8859-1?Q?lCa4E8+U3BJ5E8hwxpbbqx9lGYeZQiT4CODTy1nroCfHzyE2cQGchYyPOu?=
 =?iso-8859-1?Q?Lws9T7Hs2SxHwmy3tFHZH2xwkzbFeSXxv7LPaWOimapxjfAPUw1jWPJE+x?=
 =?iso-8859-1?Q?+wPF5MMSsM9rMet7erlR66sT6Zue6jg93qGSPjluf8cCPw7ACALYJl3ovV?=
 =?iso-8859-1?Q?L5lZ5vFVQAbK0HtDljY8lJMWZDvrq0a8hqD2g9yBH82m2bwqWURS4QEeux?=
 =?iso-8859-1?Q?/UPM8l7uTwg4gIWE8KndfPlGuhAJ9HADXQoPhHHBXpaEccPNRaXKwuB16Z?=
 =?iso-8859-1?Q?zA48cZ3HKGm3QDLt9ZgW3q5F0hfFDhrhgID1Ck47Ri5Bhp5Yw7TgY2GjwH?=
 =?iso-8859-1?Q?tg60JB8l2woY/8yKfjD+8SeEC7e+AyMJXeb4Hy4WEovUKFgTQfbiAfMALv?=
 =?iso-8859-1?Q?j1DZExjXmWOcXlJCQM620BC2obV4lHzBlFciqvZaI6TSG1Pwt7Rz/SECAb?=
 =?iso-8859-1?Q?2xYlgsfaiA9jcoQ/2Z0vAzRwhRc2USddCTQ8X5P9Mj/I3BalfpcCplkno/?=
 =?iso-8859-1?Q?u3waieIRt1yioEoWpQJL9YueCjMjqd2vfeqYn9y0k14uH8ShCzvqSwZMpF?=
 =?iso-8859-1?Q?aFtmvW3uv6u/FtRAG0H8Nw1bY1EJclocXWNhI5I1voJFh73GjyelU74bp2?=
 =?iso-8859-1?Q?cCvA59l8p1pgFCh49oWs9DSbi/PHcNYn/1HgLyBbuLtIP3wTHAjnsHP32o?=
 =?iso-8859-1?Q?YCD/lMeWqz+YyoEjV72ZAXp90DjKqrpO6rbKD4VIIUAWdgy/djs+rGWaiH?=
 =?iso-8859-1?Q?Qk4uycp/S+0e0MyWggeUla/t1hxMbRtx9XnEf7PbDrDLIuWMAOhv5rspST?=
 =?iso-8859-1?Q?zFJABVkXssH2MavFw4K0e+aoEHdPsZP/FSaHXvJYfugsPSCDvW+4q/AbAU?=
 =?iso-8859-1?Q?+4qagq4IXsgePa3jtCYk9fyp7RnR7mCHNaoAOyMc0OT98YMVTl3/3UdGrp?=
 =?iso-8859-1?Q?shZt9uFgr6plJmQJo2/p3xuwlT3GAXqknmmoq9W5eJU4ctQcbF3hTvv6aD?=
 =?iso-8859-1?Q?zHAr6C48XywCkrLmscagwiYnbB1Xqt7ukox+jN2PGWN+7Vk+od1LJ/LSCB?=
 =?iso-8859-1?Q?jm8QfjD1IFwiRlRKSfeugbIwEjq+b3CVIHzzOzJHGlQlF9Uku5ZJcdMZY6?=
 =?iso-8859-1?Q?U3ZnKA2BTdsdKMMnjBLPUQLfBPapgRJ/yRHv4eANJFwAmyw8ZdCefUeyYI?=
 =?iso-8859-1?Q?trukxXajsqpkr9LQbnNrQCxd2lbWf4Qei3EPy/EpqS8wuGyXIO5V/y57YO?=
 =?iso-8859-1?Q?UWk2udsXB6QjKMwlxflVF3G+RmS3Kl79GLDQUNDd7SoaS7R3VaQavIadgG?=
 =?iso-8859-1?Q?T3Tx4mDf2cXhsK/c59EfqJe5hcoAs2HJ0UbaFOEX+X9aKuwQPQDZoFaHag?=
 =?iso-8859-1?Q?rX2nWpZVTT6UbAM8C2W3jUGheHKE6Mo7x2QPTbN9Zosf3Ac3YBdUSewAnS?=
 =?iso-8859-1?Q?B/b+rIuOeW3ldfmX9FGUgdcbS85tPdPfful+7wAk72i/AON25SViVsrw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5f0c59-fa03-41e2-3d8c-08dab91164c8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 18:22:38.5585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XY0Yq5utKD85A34kpAtDneblHD0kO91DfQVt5nOTFoRT98wv1cVPwIBI1/3w9STbDvi4EPaCVokD3KxNuPC0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6782
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

Here goes the first chunk of drm-intel-next targeting 6.2

The highlight goes to Ville with many display related clean-up
and improvement, some other MTL enabling work and many other
fixes and small clean-ups.

drm-intel-next-2022-10-28:
- Hotplug code clean-up and organization (Jani, Gustavo)
- More VBT specific code clean-up, doc, organization,
  and improvements (Ville)
- More MTL enabling work (Matt, RK, Anusha, Jose)
- FBC related clean-ups and improvements (Ville)
- Removing unused sw_fence_await_reservation (Niranjana)
- Big chunch of display house clean-up (Ville)
- Many Watermark fixes and clean-ups (Ville)
- Fix device info for devices without display (Jani)
- Fix TC port PLLs after readout (Ville)
- DPLL ID clean-ups (Ville)
- Prep work for finishing (de)gamma readout (Ville)
- PSR fixes and improvements (Jouni, Jose)
- Reject excessive dotclocks early (Ville)
- DRRS related improvements (Ville)
- Simplify uncore register updates (Andrzej)
- Fix simulated GPU reset wrt. encoder HW readout (Imre)
- Add a ADL-P workaround (Jose)
- Fix clear mask in GEN7_MISCCPCTL update (Andrzej)
- Temporarily disable runtime_pm for discrete (Anshuman)
- Improve fbdev debugs (Nirmoy)
- Fix DP FRL link training status (Ankit)
- Other small display fixes (Ankit, Suraj)
- Allow panel fixed modes to have differing sync
  polarities (Ville)
- Clean up crtc state flag checks (Ville)
- Fix race conditions during DKL PHY accesses (Imre)
- Prep-work for cdclock squash and crawl modes (Anusha)
- ELD precompute and readout (Ville)

Thanks,
Rodrigo.

The following changes since commit 21f0b7dabf9c358e75a539b5554c0375bf1abe0a:

  drm/i915: Fix return type of mode_valid function hook (2022-09-15 10:28:55 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2022-10-28

for you to fetch changes up to a6ebd538364b1e9e6048faaafbc0188172ed50c3:

  drm/i915/sdvo: Fix debug print (2022-10-28 14:46:21 +0300)

----------------------------------------------------------------
- Hotplug code clean-up and organization (Jani, Gustavo)
- More VBT specific code clean-up, doc, organization,
  and improvements (Ville)
- More MTL enabling work (Matt, RK, Anusha, Jose)
- FBC related clean-ups and improvements (Ville)
- Removing unused sw_fence_await_reservation (Niranjana)
- Big chunch of display house clean-up (Ville)
- Many Watermark fixes and clean-ups (Ville)
- Fix device info for devices without display (Jani)
- Fix TC port PLLs after readout (Ville)
- DPLL ID clean-ups (Ville)
- Prep work for finishing (de)gamma readout (Ville)
- PSR fixes and improvements (Jouni, Jose)
- Reject excessive dotclocks early (Ville)
- DRRS related improvements (Ville)
- Simplify uncore register updates (Andrzej)
- Fix simulated GPU reset wrt. encoder HW readout (Imre)
- Add a ADL-P workaround (Jose)
- Fix clear mask in GEN7_MISCCPCTL update (Andrzej)
- Temporarily disable runtime_pm for discrete (Anshuman)
- Improve fbdev debugs (Nirmoy)
- Fix DP FRL link training status (Ankit)
- Other small display fixes (Ankit, Suraj)
- Allow panel fixed modes to have differing sync
  polarities (Ville)
- Clean up crtc state flag checks (Ville)
- Fix race conditions during DKL PHY accesses (Imre)
- Prep-work for cdclock squash and crawl modes (Anusha)
- ELD precompute and readout (Ville)

----------------------------------------------------------------
Alan Previn (1):
      drm/i915/pxp: Add firmware status when ARB session fails

Andrzej Hajda (5):
      drm/i915/display: remove drm_device aliases
      drm/i915/display: Use intel_uncore alias if defined
      drm/i915: make intel_uncore_rmw() write unconditionally
      drm/i915: use proper helper for register updates
      drm/i915: fix clear mask in GEN7_MISCCPCTL update

Ankit Nautiyal (2):
      drm/i915/dp: Reset frl trained flag before restarting FRL training
      drm/i915/dp: Remove whitespace at the end of function.

Anshuman Gupta (1):
      drm/i915/dgfx: Keep PCI autosuspend control 'on' by default on all dGPU

Anusha Srivatsa (5):
      drm/i915/display: Add DC5 counter and DMC debugfs entries for MTL
      drm/i915/display: Change terminology for cdclk actions
      drm/i915/display: Introduce HAS_CDCLK_SQUASH macro
      drm/i915/display: Move chunks of code out of bxt_set_cdclk()
      drm/i915/display: Move squash_ctl register programming to its own function

Gustavo Sousa (1):
      drm/i915: Move hotplug inversion logic into separate helper

Imre Deak (6):
      drm/i915: Fix TypeC mode initialization during system resume
      drm/i915: Fix simulated GPU reset wrt. encoder HW readout
      drm/i915/tgl+: Add locking around DKL PHY register accesses
      drm/i915: Rename intel_tc_phy_regs.h to intel_mg_phy_regs.h
      drm/i915/tgl+: Move DKL PHY register definitions to intel_dkl_phy_regs.h
      drm/i915/tgl+: Sanitize DKL PHY register definitions

Jani Nikula (4):
      drm/i915/hotplug: move hotplug storm debugfs to intel_hotplug.c
      drm/i915/hotplug: refactor hotplug init slightly
      drm/i915/display: remove ipc_enabled from struct drm_i915_private
      drm/i915: fix device info for devices without display

José Roberto de Souza (3):
      drm/i915: Parse and set stepping for platforms with GMD
      drm/i915/mtl: Extend PSR support
      drm/i915: Extend Wa_1607297627 to Alderlake-P

Jouni Högander (1):
      drm/i915/psr: Fix PSR_IMR/IIR field handling

Matt Roper (1):
      drm/i915: Read graphics/media/display arch version from hw

Niranjana Vishwanathapura (1):
      drm/i915: Remove unused function parameter

Nirmoy Das (1):
      drm/i915: Print return value on error

Radhakrishna Sripada (3):
      drm/i915/mtl: Add MTP ddc pin configuration
      drm/i915: Add intel_ prefix to struct ip_version
      drm/i915: Use graphics ver, rel info for media on old platforms

Suraj Kandpal (1):
      drm/i915: Remove one use macro

Ville Syrjälä (92):
      drm/i915: WARN if a port should use VBT provided vswing tables
      drm/i915/fbc: Move flip_pending assignmnt
      drm/i915/fbc: Use lockdep_assert_held()
      drm/i915: Nuke stale plane cdclk ratio FIXMEs
      drm/i915/fbc: Remove stale FIXME
      drm/i915: Drop pointless middle man variable
      drm/i915: Clean up transcoder_to_stream_enc_status()
      drm/i915: Drop pointless 'budget' variable
      drm/i915: Use BIT() when dealing with output types
      drm/i915: Pass intel_encoder to to_lvds_encoder()
      drm/i915: Extract intel_edp_backlight_setup()
      drm/i915: Extract intel_tv_add_properties()
      drm/i915: Extract intel_dp_mst_add_properties()
      drm/i915: Extract intel_lvds_add_properties()
      drm/i915: Move eDP scaling_mode prop setup to the proper place
      drm/i915: Extract intel_attach_scaling_mode_property()
      drm/i915: Clean up connector->*_allowed setup
      drm/i915: Don't init eDP if we can't find a fixed mode
      drm/i915: Split g4x_compute_pipe_wm() into two
      drm/i915: Split vlv_compute_pipe_wm() into two
      drm/i915: Simplify up g4x watermark sanitation
      drm/i915: Simplify up vlv watermark sanitation
      drm/i915: Add missing invalidate to g4x wm readout
      drm/i915: Force DPLL calculation for TC ports after readout
      drm/i915: Don't bail early from intel_dp_initial_fastset_check()
      drm/i915: Pimp DPLL ref/unref debugs
      drm/i915: WARN if PLL ref/unref got messed up
      drm/i915: Always initialize dpll.lock
      drm/i915: Nuke intel_get_shared_dpll_id()
      drm/i915: Round to closest in g4x+ HDMI clock readout
      drm/i915: Simplify intel_panel_add_edid_alt_fixed_modes()
      drm/i915: Allow alternate fixed modes always for eDP
      drm/i915: Allow alternate fixed modes always for LVDS
      drm/i915: Remove PLL asserts from .load_luts()
      drm/i915: Split up intel_color_init()
      drm/i915: Simplify the intel_color_init_hooks() if ladder
      drm/i915: Clean up intel_color_init_hooks()
      drm/i915: Change glk_load_degamma_lut() calling convention
      drm/i915: Add some debug prints for intel_modeset_all_pipes()
      drm/i915: Fix watermark calculations for gen12+ RC CCS modifier
      drm/i915: Fix watermark calculations for gen12+ MC CCS modifier
      drm/i915: Fix watermark calculations for gen12+ CCS+CC modifier
      drm/i915: Fix watermark calculations for DG2 CCS modifiers
      drm/i915: Fix watermark calculations for DG2 CCS+CC modifier
      drm/i915: Simplify modifier lookup in watermark code
      drm/i915: Reject excessive dotclocks early
      drm/i915: Move DRRS debugfs next to the implementation
      drm/i915: Make the DRRS debugfs contents more consistent
      drm/i915: Make DRRS debugfs per-crtc/connector
      drm/i915: Fix locking in DRRS debugfs
      drm/i915: Tighten DRRS capability reporting
      drm/i915: Setup final panel drrs_type already during init
      drm/i915: Clean up some namespacing
      drm/i915: Fix g4x/vlv/chv CxSR vs. format/tiling/rotation changes
      drm/i915: Fix pipe gamma enable/disable vs. CxSR on gmch platforms
      drm/i915: Write watermarks for disabled pipes on gmch platforms
      drm/i915: Do the DRIVER_ATOMIC feature disable later
      drm/i915: Enable atomic by default on ctg/elk
      drm/i915: Allow panel fixed modes to have differing sync polarities
      drm/i915: Activate DRRS after state readout
      drm/i915: Introduce intel_crtc_needs_fastset()
      drm/i915: Remove some local 'mode_changed' bools
      drm/i915: Don't flag both full modeset and fastset at the same time
      drm/i915: Introduce intel_crtc_needs_color_update()
      drm/i915: Make ilk_load_luts() deal with degamma
      drm/i915: Introduce crtc_state->{pre,post}_csc_lut
      drm/i915: Assert {pre,post}_csc_lut were assigned sensibly
      drm/i915: Get rid of glk_load_degamma_lut_linear()
      drm/i915: Stop loading linear degamma LUT on glk needlessly
      drm/i915/audio: s/dev_priv/i915/
      drm/i915/audio: Nuke leftover ROUNDING_FACTOR
      drm/i915/audio: Remove CL/BLC audio stuff
      drm/i915/audio: Extract struct ilk_audio_regs
      drm/i915/audio: Use REG_BIT() & co.
      drm/i915/audio: Unify register bit naming
      drm/i915/audio: Protect singleton register with a lock
      drm/i915/audio: Nuke intel_eld_uptodate()
      drm/i915/audio: Read ELD buffer size from hardware
      drm/i915/audio: Make sure we write the whole ELD buffer
      drm/i915/audio: Use u32* for ELD
      drm/i915/audio: Use intel_de_rmw() for most audio registers
      drm/i915/audio: Split "ELD valid" vs. audio PD on hsw+
      drm/i915/audio: Do the vblank waits
      drm/i915/sdvo: Extract intel_sdvo_has_audio()
      drm/i915/sdvo: Filter out invalid outputs more sensibly
      drm/i915/sdvo: Setup DDC fully before output init
      drm/i915/sdvo: Grab mode_config.mutex during LVDS init to avoid WARNs
      drm/i915/sdvo: Simplify output setup debugs
      drm/i915/sdvo: Don't add DDC modes for LVDS
      drm/i915/sdvo: Get rid of the output type<->device index stuff
      drm/i915/sdvo: Reduce copy-pasta in output setup
      drm/i915/sdvo: Fix debug print

 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   6 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |   8 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  21 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |   8 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  58 +-
 drivers/gpu/drm/i915/display/intel_audio.c         | 656 ++++++++++-----------
 drivers/gpu/drm/i915/display/intel_audio_regs.h    |  87 ++-
 drivers/gpu/drm/i915/display/intel_bios.c          |  10 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  89 +--
 drivers/gpu/drm/i915/display/intel_color.c         | 360 ++++++-----
 drivers/gpu/drm/i915/display/intel_color.h         |   6 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |  18 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |  18 +
 drivers/gpu/drm/i915/display/intel_connector.h     |   1 +
 drivers/gpu/drm/i915/display/intel_crt.c           |   9 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   8 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |  12 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |   6 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           | 101 ++--
 drivers/gpu/drm/i915/display/intel_display.c       | 166 +++---
 drivers/gpu/drm/i915/display/intel_display.h       |   7 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |  13 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   | 309 +---------
 drivers/gpu/drm/i915/display/intel_display_power.c |   3 +-
 .../drm/i915/display/intel_display_power_well.c    |   8 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  27 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       | 106 ++++
 drivers/gpu/drm/i915/display/intel_dkl_phy.h       |  24 +
 drivers/gpu/drm/i915/display/intel_dkl_phy_regs.h  | 204 +++++++
 drivers/gpu/drm/i915/display/intel_dmc.c           |  22 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 106 ++--
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |  20 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  46 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      | 125 ++--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   3 -
 drivers/gpu/drm/i915/display/intel_drrs.c          | 112 +++-
 drivers/gpu/drm/i915/display/intel_drrs.h          |   4 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |   6 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |  13 +
 drivers/gpu/drm/i915/display/intel_fb.h            |   1 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |  33 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   6 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   5 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       | 216 ++++++-
 drivers/gpu/drm/i915/display/intel_hotplug.h       |   3 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |   5 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |  48 +-
 .../{intel_tc_phy_regs.h => intel_mg_phy_regs.h}   |   6 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |  22 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |   7 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  34 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |   2 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |   9 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 114 ++--
 drivers/gpu/drm/i915/display/intel_sdvo.c          | 198 ++++---
 drivers/gpu/drm/i915/display/intel_tc.c            |  78 ++-
 drivers/gpu/drm/i915/display/intel_tc.h            |   3 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |  87 +--
 drivers/gpu/drm/i915/display/skl_watermark.c       |  12 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  22 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   3 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   4 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  26 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   8 +-
 drivers/gpu/drm/i915/i915_irq.c                    | 270 ++++-----
 drivers/gpu/drm/i915/i915_pci.c                    |  13 +-
 drivers/gpu/drm/i915/i915_reg.h                    | 204 +------
 drivers/gpu/drm/i915/i915_sw_fence.c               |   1 -
 drivers/gpu/drm/i915/i915_sw_fence.h               |   1 -
 drivers/gpu/drm/i915/intel_device_info.c           |  86 ++-
 drivers/gpu/drm/i915/intel_device_info.h           |  17 +-
 drivers/gpu/drm/i915/intel_pm.c                    | 266 ++++-----
 drivers/gpu/drm/i915/intel_runtime_pm.c            |  11 +-
 drivers/gpu/drm/i915/intel_step.c                  |  25 +
 drivers/gpu/drm/i915/intel_step.h                  |  28 +-
 drivers/gpu/drm/i915/intel_uncore.h                |   8 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |   1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   3 +
 drivers/gpu/drm/i915/vlv_suspend.c                 |  28 +-
 82 files changed, 2600 insertions(+), 2126 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dkl_phy.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dkl_phy.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dkl_phy_regs.h
 rename drivers/gpu/drm/i915/display/{intel_tc_phy_regs.h => intel_mg_phy_regs.h} (99%)
