Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F169367B9C4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 19:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0A610E113;
	Wed, 25 Jan 2023 18:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C99510E113
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 18:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674672378; x=1706208378;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3mVTtVhI5uG/4BuilLAm3SaFnF7BbXk+AOZb165vPsA=;
 b=BjFdxHEvAuknGLuOI+W9nmC1snZXN6WG+Rz9rkzdrXSxLjHiB5+VyaKJ
 6VA418LJ5piH0nce1o19r2AR3cXCIW/v05T2gKEID49iVgdT0SUQEzBcg
 wKq5z0z6PcVeR4+8TUcpr4FJveP7FKdwdc+ZgNch7xUv2qUFokxZc8QsG
 oBiCsLzls9EQOXgl57yrcFO1Rbt21ExO88ZoCF9ry/jlijPenSeDCD7Aq
 RxkOhAImQsISrQE1ggF5ovFZKYqzownoENIce7JjA5MlBe5/w07CsXkRY
 8dLD0heKhjjM8KurKp4CJAJsCqgtgzsItXpvRE2dtqQ35H2AHIY/5IkXd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="326670187"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="326670187"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 10:46:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="655908434"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="655908434"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 25 Jan 2023 10:46:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 10:46:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 25 Jan 2023 10:46:16 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 25 Jan 2023 10:46:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCGHW6aC9fELX3KOCuQkib5WPMvaCL98LtT36ATI/4s5OmfqaNVjZBoHN8Vg6MYLlk9+wqZRHsTk1vD11oJGTVpsesQrPkbr7TR+vrI121yy8gUcSfF/sqg5sEgnszLEs0TNwoux98S/pPPGAq0gIdpr5xr0ak26erCnoiSufAxcN2KGvg4hpYYCaruM9dGvpVsyczLLqb+MneB9ZnPkzKOLxZyQ8WI/edCAb40d3NHFFspcopXBGlo6LVAijmWnknNqMXlCqt/VvG12aqBluSdsbDnjjDpSgucOpqhdTLVl5cSPG963ccpn69dlAEhVbKzdMoH66MV7GKv/QpP0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQiAKG7i7zL17KpNzUKqhET8G61+YlgEe/DgIqnxCuU=;
 b=J+FpwOytwCuZIaBy/S8NeHWd6cqgVFGyQ9la+7iGGvZC0fSddhrGhTyIR/D/Hdq8WtHCWSSlLza6vJtMGzaY8PZRdN3e9j2LGGmtNetpds7/dLBcXAqBwcRCI8hF2siw2IW1JkWQj58o+k+sz5uXZ+Hb8HbWAjEFHPM1iApzHMHh7tUjaLhdrSus8i+BQMJi7APxluLxSqUBgXiB7WdD/O2O3xWITQ+L+x5g9jmVYAXLdgzskda5xXvfV1jx0PwMxj679DN4WWNf1AC+XrPrmTaCDF/hYmYPiMpvPkGk1LEwKMz98pYR4FSkc7A+OTomNmQIPwRf6etugbRw6M1d4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 18:46:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 18:46:13 +0000
Date: Wed, 25 Jan 2023 13:46:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] xe: use Makefile/include_next magic to avoid need for
 symlinks.
Message-ID: <Y9F478HSozYVkTm3@intel.com>
References: <20230125042454.1219738-1-airlied@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230125042454.1219738-1-airlied@gmail.com>
X-ClientProxiedBy: PH0P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd7f684-da7b-4319-7e99-08daff046e3b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Kfmgo61TEs+DxaNtzCPcjqzh2PyY/wPgJW/WILHvnAZYs4nUvfSo/iFzDtAIJpFtDLUpTOmF8HDJ37mBvi6fe+spDWw1n3sbzzfojueWWO41CHHN3LpBCmlAiqCMSWV49s7XYFSqKRdpFj/eXttL+RTwsD7mlnOwuTBjSrAXY0Qh7i2c8DmOQBgKZHuLLwgoeOXtAFA4dleDKiS8Elcl6EMIBom42PUI7ZE6nKCESvYxWs/FBll5sqhyR4CiVs9FlU0YVw/m++bfNyEB8WI16wBACcNlxkiJy9NzVhVQatWkjDQrsTqQN2ZQZYTP5NJ2w24qNSjlPUjwbCt8tazx4zS0l+MvLb82B/1UIOtBTnaUprKkV5NEqd9ahEZLfemCVtQIYuyq0VLIhhvABYJvTv9wf7/nBXg5wCPfw1PrJ5E0693OYwzosBnRt87gD4xh1f+/da9/8Zn3VbTPK8EvTbnKII1/p1iV8xGW19/36Ser+J7SMcCxW7/VfV2oiF/nDfpxtGdqim9zPb+1NmaQYnvKggslt4GmF5tHCMs9+riJkD6sdxucdMDLtcz4JWT50rH1AEvoC3xeYeZqv1vMbJutiaYdcT8sR/hYFHcoORojmtcO7ukzBETe2pAQvwdLDxPGOLlD2OCg40RUjWsBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199018)(26005)(83380400001)(38100700002)(2616005)(54906003)(6916009)(478600001)(66556008)(8676002)(66476007)(186003)(107886003)(6486002)(66946007)(36756003)(30864003)(2906002)(86362001)(41300700001)(82960400001)(5660300002)(6666004)(6506007)(316002)(6512007)(4326008)(8936002)(44832011)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Mqp3wESOfCp6ycVrZMbUrMdxPVhPSwk+dE1WNbcBYnGH9YvCFY67iJptMU?=
 =?iso-8859-1?Q?XZQ5lA42fVTsqvHioo+6LhsjqyhVCe8MFFSwa6lrijIKk5d2k4ueKWy97T?=
 =?iso-8859-1?Q?9vsqVBvjfLmMIY6ZqlHGue1zBuPZI8ekjMymjtLXyGrJ58GzoQiyZ0fh5m?=
 =?iso-8859-1?Q?KVV7kBFRvk62/l03QgOxV0Y2Z/zrl3n/tpjf0UnMA2GgkndkYnA2WuHv6V?=
 =?iso-8859-1?Q?ConVRRTrsrk+xIjlongjm/zGFZIMK8xmNh1iopSH4SP8E1xFNeBw1sTc09?=
 =?iso-8859-1?Q?tw/8OjL2K2T1BuvWFE9t1wx11MRmSbTKEVOWyZUstFsRaYmEMmwh8IxWJ8?=
 =?iso-8859-1?Q?7WKxowZCHLuj6K2TbR4A20lIgHnWI2XF6ZXTQ+BZ+xEhhMVze9ZSTkXM7E?=
 =?iso-8859-1?Q?ijoYdldfySzj4bNBzsmuvvs3PQUa04KyS4Pwy/Ryuwxv/ElRHax9IdwP6T?=
 =?iso-8859-1?Q?fkjgE/vvNgCzLIMXzDHjsNpBviLpLbAek/NYaDpBMkDUha1TadMsvMpujJ?=
 =?iso-8859-1?Q?cp/WPmxXlB2s/mSmZSG2iDJkFI5yF2sfqLcuykPVUt+UzfVqXsk085oTc2?=
 =?iso-8859-1?Q?f2a3jcsiaolOXiAoSIJ+PMVtkwG/UqlwBMh1Pw/RvsNth6EDzIS30Vtsf8?=
 =?iso-8859-1?Q?Oh9InitHBuW80heEh4rCSwqzgqkcvfXioYnVjgmCmkNaZ55L3gc+hZNM/5?=
 =?iso-8859-1?Q?F6QuEYE9MmNKDRD7GjhIV8RF2XdlNaXpUCokLhgbM351dtjRmzkk+7N88e?=
 =?iso-8859-1?Q?caBTzQiC7O9lG+cHU3yzdJLYV+z9JUytULU3NWBSC0QZtHj1l5t4aSlKvI?=
 =?iso-8859-1?Q?PRi+1+OgfQvXGo9tcvhzrfdRr1VOtxNAehFOOdQLSiy9HB6LYjPq2LLJ5T?=
 =?iso-8859-1?Q?X0mVr5NginvV8jpQjacFMq59vdy2TTeDdZhPi702Tetjia8oRJOOl6rAbv?=
 =?iso-8859-1?Q?wp7bLXEG83G+83JIvMCFgDeLO6qZxcWrB4v1z66WtUSs0qF0K5QUPUKKSZ?=
 =?iso-8859-1?Q?v+qV79Td/KWZ8A9/4aDMIrOGY2jyGoKCe85lomzN+3L1r7qg4e/eb0/CE4?=
 =?iso-8859-1?Q?PSLP5BW32kEh4rlHBGV8TluQt9qCojuqMmehhRbUWzw+xYXtNvJdwo06Zu?=
 =?iso-8859-1?Q?0GEuHz8H28rvNPwAyl8FrzHv0W41tOdvCE1/VQtCo5gNEGiKnIKL4+3QdN?=
 =?iso-8859-1?Q?/OGyI4zSCO5G7wuZwwlr4dxWGIIVedI/FN8U/pgqpnBebd9sVb7fA2D6OV?=
 =?iso-8859-1?Q?sp73c2+yMqYFex8A9b4Jd98PyfZrZSCcFaFUsEhIIpRev54f7n3mXr3M9q?=
 =?iso-8859-1?Q?G/9QPrMfXq+S5NFIJA7k1qscCU+mFlIqeC6RK5crwLG3FnCi9NkrdAUDhF?=
 =?iso-8859-1?Q?VaWCntHFMI2cVRNQXTA/m/DSNvQ1jImbx+wdP7gtVbyldjjuFcX4JeKG/v?=
 =?iso-8859-1?Q?9ITxOu8cR/TploA3jRud2fafK20mzVGeHjyxzt98fYIRlornk9ZOtEkwkc?=
 =?iso-8859-1?Q?RQE5VCwAL0DwSKd0Pv8Qeyy5Q3IEyKiTy7/Q+RRV405ppoNWAYs+dFUR7e?=
 =?iso-8859-1?Q?WjGk/FEEvHKmgr8KLq8AzhDRt3lUirCTsNjis7zFHofwHiIDoR4IxjTg4w?=
 =?iso-8859-1?Q?kNK/SJV9qA9hbBMt/V7uqDM1jzlja8dx4WHYNMDuqk0uzUWkRiJA68uw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd7f684-da7b-4319-7e99-08daff046e3b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 18:46:12.9120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4pKD6i065FeTsfQBRMHy0WYNE4kNCHXoFb4hnppOMH0a8CTJS4UrrGNvUqKcr+jRc5jDdgH2TT++bhpVzpZpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7705
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
Cc: Matthew Brost <matthew.brost@intel.com>, Dave Airlie <airlied@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 02:24:54PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> I don't really like the symlinks, my other idea was creating new
> files which just include the original, but this idea seems to at
> least build.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Tested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I tested it here and It works. Even tested touching i915
files and checking the xe compilation and it seems pretty
reliable way.

This is indeed much better than symlinks.

I even went ahead and also removed the other 2 symlinks
that I hate: i915_utils.h and the i915_reg_defs.h

Can I just change the commit message to something like:

"Use Makefile include_next magic so we can include i915 files
directly instead of using symlinks"

then get your signed-off and already merge to our branches?

or do you prefer a version of this squashed to that initial
squashed patch?

> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_de.h          |  4 ++++
>  .../gpu/drm/i915/display/intel_display_trace.h   |  4 ----
>  drivers/gpu/drm/xe/Makefile                      | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/display/ext/intel_dram.c      |  2 +-
>  drivers/gpu/drm/xe/display/i915_reg.h            |  1 -
>  drivers/gpu/drm/xe/display/icl_dsi.c             |  1 -
>  drivers/gpu/drm/xe/display/icl_dsi.h             |  1 -
>  drivers/gpu/drm/xe/display/icl_dsi_regs.h        |  1 -
>  drivers/gpu/drm/xe/display/intel_acpi.c          |  1 -
>  drivers/gpu/drm/xe/display/intel_acpi.h          |  1 -
>  drivers/gpu/drm/xe/display/intel_atomic.c        |  1 -
>  drivers/gpu/drm/xe/display/intel_atomic.h        |  1 -
>  drivers/gpu/drm/xe/display/intel_atomic_plane.c  |  1 -
>  drivers/gpu/drm/xe/display/intel_atomic_plane.h  |  1 -
>  drivers/gpu/drm/xe/display/intel_audio.c         |  1 -
>  drivers/gpu/drm/xe/display/intel_audio.h         |  1 -
>  drivers/gpu/drm/xe/display/intel_audio_regs.h    |  1 -
>  drivers/gpu/drm/xe/display/intel_backlight.c     |  1 -
>  drivers/gpu/drm/xe/display/intel_backlight.h     |  1 -
>  .../gpu/drm/xe/display/intel_backlight_regs.h    |  1 -
>  drivers/gpu/drm/xe/display/intel_bios.c          |  1 -
>  drivers/gpu/drm/xe/display/intel_bios.h          |  1 -
>  drivers/gpu/drm/xe/display/intel_bw.c            |  1 -
>  drivers/gpu/drm/xe/display/intel_bw.h            |  1 -
>  drivers/gpu/drm/xe/display/intel_cdclk.c         |  1 -
>  drivers/gpu/drm/xe/display/intel_cdclk.h         |  1 -
>  drivers/gpu/drm/xe/display/intel_color.c         |  1 -
>  drivers/gpu/drm/xe/display/intel_color.h         |  1 -
>  drivers/gpu/drm/xe/display/intel_combo_phy.c     |  1 -
>  drivers/gpu/drm/xe/display/intel_combo_phy.h     |  1 -
>  .../gpu/drm/xe/display/intel_combo_phy_regs.h    |  1 -
>  drivers/gpu/drm/xe/display/intel_connector.c     |  1 -
>  drivers/gpu/drm/xe/display/intel_connector.h     |  1 -
>  drivers/gpu/drm/xe/display/intel_crtc.c          |  1 -
>  drivers/gpu/drm/xe/display/intel_crtc.h          |  1 -
>  .../gpu/drm/xe/display/intel_crtc_state_dump.c   |  1 -
>  .../gpu/drm/xe/display/intel_crtc_state_dump.h   |  1 -
>  drivers/gpu/drm/xe/display/intel_cursor.c        |  1 -
>  drivers/gpu/drm/xe/display/intel_cursor.h        |  1 -
>  drivers/gpu/drm/xe/display/intel_ddi.c           |  1 -
>  drivers/gpu/drm/xe/display/intel_ddi.h           |  1 -
>  drivers/gpu/drm/xe/display/intel_ddi_buf_trans.c |  1 -
>  drivers/gpu/drm/xe/display/intel_ddi_buf_trans.h |  1 -
>  drivers/gpu/drm/xe/display/intel_display.c       |  1 -
>  drivers/gpu/drm/xe/display/intel_display.h       |  1 -
>  drivers/gpu/drm/xe/display/intel_display_core.h  |  1 -
>  .../gpu/drm/xe/display/intel_display_debugfs.c   |  1 -
>  .../gpu/drm/xe/display/intel_display_debugfs.h   |  1 -
>  drivers/gpu/drm/xe/display/intel_display_power.c |  1 -
>  drivers/gpu/drm/xe/display/intel_display_power.h |  1 -
>  .../gpu/drm/xe/display/intel_display_power_map.c |  1 -
>  .../gpu/drm/xe/display/intel_display_power_map.h |  1 -
>  .../drm/xe/display/intel_display_power_well.c    |  1 -
>  .../drm/xe/display/intel_display_power_well.h    |  1 -
>  drivers/gpu/drm/xe/display/intel_display_trace.c |  1 -
>  drivers/gpu/drm/xe/display/intel_display_trace.h |  1 -
>  drivers/gpu/drm/xe/display/intel_display_types.h |  1 -
>  drivers/gpu/drm/xe/display/intel_dmc.c           |  1 -
>  drivers/gpu/drm/xe/display/intel_dmc.h           |  1 -
>  drivers/gpu/drm/xe/display/intel_dmc_regs.h      |  1 -
>  drivers/gpu/drm/xe/display/intel_dp.c            |  1 -
>  drivers/gpu/drm/xe/display/intel_dp.h            |  1 -
>  drivers/gpu/drm/xe/display/intel_dp_aux.c        |  1 -
>  drivers/gpu/drm/xe/display/intel_dp_aux.h        |  1 -
>  .../gpu/drm/xe/display/intel_dp_aux_backlight.c  |  1 -
>  .../gpu/drm/xe/display/intel_dp_aux_backlight.h  |  1 -
>  drivers/gpu/drm/xe/display/intel_dp_hdcp.c       |  1 -
>  drivers/gpu/drm/xe/display/intel_dp_hdcp.h       |  1 -
>  .../gpu/drm/xe/display/intel_dp_link_training.c  |  1 -
>  .../gpu/drm/xe/display/intel_dp_link_training.h  |  1 -
>  drivers/gpu/drm/xe/display/intel_dp_mst.c        |  1 -
>  drivers/gpu/drm/xe/display/intel_dp_mst.h        |  1 -
>  drivers/gpu/drm/xe/display/intel_dpio_phy.h      |  1 -
>  drivers/gpu/drm/xe/display/intel_dpll.c          |  1 -
>  drivers/gpu/drm/xe/display/intel_dpll.h          |  1 -
>  drivers/gpu/drm/xe/display/intel_dpll_mgr.c      |  1 -
>  drivers/gpu/drm/xe/display/intel_dpll_mgr.h      |  1 -
>  drivers/gpu/drm/xe/display/intel_dpt.h           |  1 -
>  drivers/gpu/drm/xe/display/intel_drrs.c          |  1 -
>  drivers/gpu/drm/xe/display/intel_drrs.h          |  1 -
>  drivers/gpu/drm/xe/display/intel_dsb.c           |  1 -
>  drivers/gpu/drm/xe/display/intel_dsb.h           |  1 -
>  drivers/gpu/drm/xe/display/intel_dsi.c           |  1 -
>  drivers/gpu/drm/xe/display/intel_dsi.h           |  1 -
>  .../gpu/drm/xe/display/intel_dsi_dcs_backlight.c |  1 -
>  .../gpu/drm/xe/display/intel_dsi_dcs_backlight.h |  1 -
>  drivers/gpu/drm/xe/display/intel_dsi_vbt.c       |  1 -
>  drivers/gpu/drm/xe/display/intel_dsi_vbt.h       |  1 -
>  drivers/gpu/drm/xe/display/intel_fb.c            |  1 -
>  drivers/gpu/drm/xe/display/intel_fb.h            |  1 -
>  drivers/gpu/drm/xe/display/intel_fb_pin.h        |  1 -
>  drivers/gpu/drm/xe/display/intel_fbc.c           |  1 -
>  drivers/gpu/drm/xe/display/intel_fbc.h           |  1 -
>  drivers/gpu/drm/xe/display/intel_fbdev.c         |  1 -
>  drivers/gpu/drm/xe/display/intel_fbdev.h         |  1 -
>  drivers/gpu/drm/xe/display/intel_fdi.c           |  1 -
>  drivers/gpu/drm/xe/display/intel_fdi.h           |  1 -
>  drivers/gpu/drm/xe/display/intel_fifo_underrun.c |  1 -
>  drivers/gpu/drm/xe/display/intel_fifo_underrun.h |  1 -
>  drivers/gpu/drm/xe/display/intel_frontbuffer.c   |  1 -
>  drivers/gpu/drm/xe/display/intel_frontbuffer.h   |  1 -
>  drivers/gpu/drm/xe/display/intel_global_state.c  |  1 -
>  drivers/gpu/drm/xe/display/intel_global_state.h  |  1 -
>  drivers/gpu/drm/xe/display/intel_gmbus.c         |  1 -
>  drivers/gpu/drm/xe/display/intel_gmbus.h         |  1 -
>  drivers/gpu/drm/xe/display/intel_hdcp.c          |  1 -
>  drivers/gpu/drm/xe/display/intel_hdcp.h          |  1 -
>  drivers/gpu/drm/xe/display/intel_hdcp_regs.h     |  1 -
>  drivers/gpu/drm/xe/display/intel_hdmi.c          |  1 -
>  drivers/gpu/drm/xe/display/intel_hdmi.h          |  1 -
>  drivers/gpu/drm/xe/display/intel_hotplug.c       |  1 -
>  drivers/gpu/drm/xe/display/intel_hotplug.h       |  1 -
>  drivers/gpu/drm/xe/display/intel_lpe_audio.h     |  1 -
>  drivers/gpu/drm/xe/display/intel_lspcon.c        |  1 -
>  drivers/gpu/drm/xe/display/intel_lspcon.h        |  1 -
>  drivers/gpu/drm/xe/display/intel_lvds.c          |  1 -
>  drivers/gpu/drm/xe/display/intel_lvds.h          |  1 -
>  drivers/gpu/drm/xe/display/intel_modeset_setup.c |  1 -
>  drivers/gpu/drm/xe/display/intel_modeset_setup.h |  1 -
>  .../gpu/drm/xe/display/intel_modeset_verify.c    |  1 -
>  .../gpu/drm/xe/display/intel_modeset_verify.h    |  1 -
>  drivers/gpu/drm/xe/display/intel_opregion.c      |  1 -
>  drivers/gpu/drm/xe/display/intel_opregion.h      |  1 -
>  drivers/gpu/drm/xe/display/intel_panel.c         |  1 -
>  drivers/gpu/drm/xe/display/intel_panel.h         |  1 -
>  drivers/gpu/drm/xe/display/intel_pch_display.h   |  1 -
>  drivers/gpu/drm/xe/display/intel_pch_refclk.h    |  1 -
>  drivers/gpu/drm/xe/display/intel_pipe_crc.c      |  1 -
>  drivers/gpu/drm/xe/display/intel_pipe_crc.h      |  1 -
>  drivers/gpu/drm/xe/display/intel_plane_initial.h |  1 -
>  drivers/gpu/drm/xe/display/intel_pps.c           |  1 -
>  drivers/gpu/drm/xe/display/intel_pps.h           |  1 -
>  drivers/gpu/drm/xe/display/intel_psr.c           |  1 -
>  drivers/gpu/drm/xe/display/intel_psr.h           |  1 -
>  drivers/gpu/drm/xe/display/intel_qp_tables.c     |  1 -
>  drivers/gpu/drm/xe/display/intel_qp_tables.h     |  1 -
>  drivers/gpu/drm/xe/display/intel_quirks.c        |  1 -
>  drivers/gpu/drm/xe/display/intel_quirks.h        |  1 -
>  drivers/gpu/drm/xe/display/intel_snps_phy.c      |  1 -
>  drivers/gpu/drm/xe/display/intel_snps_phy.h      |  1 -
>  drivers/gpu/drm/xe/display/intel_snps_phy_regs.h |  1 -
>  drivers/gpu/drm/xe/display/intel_sprite.c        |  1 -
>  drivers/gpu/drm/xe/display/intel_sprite.h        |  1 -
>  drivers/gpu/drm/xe/display/intel_tc.c            |  1 -
>  drivers/gpu/drm/xe/display/intel_tc.h            |  1 -
>  drivers/gpu/drm/xe/display/intel_tc_phy_regs.h   |  1 -
>  drivers/gpu/drm/xe/display/intel_vbt_defs.h      |  1 -
>  drivers/gpu/drm/xe/display/intel_vdsc.c          |  1 -
>  drivers/gpu/drm/xe/display/intel_vdsc.h          |  1 -
>  drivers/gpu/drm/xe/display/intel_vga.c           |  1 -
>  drivers/gpu/drm/xe/display/intel_vga.h           |  1 -
>  drivers/gpu/drm/xe/display/intel_vrr.c           |  1 -
>  drivers/gpu/drm/xe/display/intel_vrr.h           |  1 -
>  drivers/gpu/drm/xe/display/skl_scaler.c          |  1 -
>  drivers/gpu/drm/xe/display/skl_scaler.h          |  1 -
>  drivers/gpu/drm/xe/display/skl_universal_plane.c |  1 -
>  drivers/gpu/drm/xe/display/skl_universal_plane.h |  1 -
>  drivers/gpu/drm/xe/display/skl_watermark.c       |  1 -
>  drivers/gpu/drm/xe/display/skl_watermark.h       |  1 -
>  159 files changed, 21 insertions(+), 160 deletions(-)
>  delete mode 120000 drivers/gpu/drm/xe/display/i915_reg.h
>  delete mode 120000 drivers/gpu/drm/xe/display/icl_dsi.c
>  delete mode 120000 drivers/gpu/drm/xe/display/icl_dsi.h
>  delete mode 120000 drivers/gpu/drm/xe/display/icl_dsi_regs.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_acpi.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_acpi.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_atomic.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_atomic.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_atomic_plane.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_atomic_plane.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_audio.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_audio.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_audio_regs.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_backlight.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_backlight.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_backlight_regs.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_bios.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_bios.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_bw.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_bw.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_cdclk.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_cdclk.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_color.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_color.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_combo_phy.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_combo_phy.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_combo_phy_regs.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_connector.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_connector.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_crtc.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_crtc.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_crtc_state_dump.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_crtc_state_dump.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_cursor.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_cursor.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_ddi.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_ddi.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_ddi_buf_trans.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_ddi_buf_trans.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display_core.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display_debugfs.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display_debugfs.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display_power.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display_power.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display_power_map.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display_power_map.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display_power_well.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display_power_well.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display_trace.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display_trace.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_display_types.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dmc.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dmc.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dmc_regs.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dp.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dp.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_aux.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_aux.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_aux_backlight.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_aux_backlight.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_hdcp.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_hdcp.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_link_training.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_link_training.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_mst.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_mst.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dpio_phy.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dpll.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dpll.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dpll_mgr.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dpll_mgr.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dpt.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_drrs.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_drrs.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dsb.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dsb.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dsi.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dsi.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dsi_vbt.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_dsi_vbt.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_fb.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_fb.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_fb_pin.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_fbc.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_fbc.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_fbdev.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_fbdev.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_fdi.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_fdi.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_fifo_underrun.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_fifo_underrun.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_frontbuffer.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_frontbuffer.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_global_state.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_global_state.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_gmbus.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_gmbus.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_hdcp.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_hdcp.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_hdcp_regs.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_hdmi.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_hdmi.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_hotplug.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_hotplug.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_lpe_audio.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_lspcon.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_lspcon.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_lvds.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_lvds.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_modeset_setup.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_modeset_setup.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_modeset_verify.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_modeset_verify.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_opregion.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_opregion.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_panel.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_panel.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_pch_display.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_pch_refclk.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_pipe_crc.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_pipe_crc.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_plane_initial.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_pps.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_pps.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_psr.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_psr.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_qp_tables.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_qp_tables.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_quirks.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_quirks.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_snps_phy.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_snps_phy.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_snps_phy_regs.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_sprite.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_sprite.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_tc.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_tc.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_tc_phy_regs.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_vbt_defs.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_vdsc.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_vdsc.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_vga.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_vga.h
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_vrr.c
>  delete mode 120000 drivers/gpu/drm/xe/display/intel_vrr.h
>  delete mode 120000 drivers/gpu/drm/xe/display/skl_scaler.c
>  delete mode 120000 drivers/gpu/drm/xe/display/skl_scaler.h
>  delete mode 120000 drivers/gpu/drm/xe/display/skl_universal_plane.c
>  delete mode 120000 drivers/gpu/drm/xe/display/skl_universal_plane.h
>  delete mode 120000 drivers/gpu/drm/xe/display/skl_watermark.c
>  delete mode 120000 drivers/gpu/drm/xe/display/skl_watermark.h
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
> index da1b51b670e9..366be66b46d6 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -3,6 +3,9 @@
>   * Copyright © 2019 Intel Corporation
>   */
>  
> +#ifdef BUILD_FOR_XE
> +#include_next "intel_de.h"
> +#else
>  #ifndef __INTEL_DE_H__
>  #define __INTEL_DE_H__
>  
> @@ -155,3 +158,4 @@ static inline int intel_de_pcode_request(struct drm_i915_private *i915, u32 mbox
>  }
>  
>  #endif /* __INTEL_DE_H__ */
> +#endif
> diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
> index b4812bde3d54..d428c4f6a221 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_trace.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
> @@ -586,10 +586,6 @@ TRACE_EVENT(intel_frontbuffer_flush,
>  /* This part must be outside protection */
>  #undef TRACE_INCLUDE_PATH
>  #undef TRACE_INCLUDE_FILE
> -#ifdef I915
>  #define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/display
> -#else
> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe/display
> -#endif
>  #define TRACE_INCLUDE_FILE intel_display_trace
>  #include <trace/define_trace.h>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5d81a6cee56b..3abc306c333f 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -105,11 +105,27 @@ xe-y += xe_bb.o \
>  
>  # i915 compat #defines and #includes
>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += -I$(srctree)/$(src)/display/ext \
> +	-I$(srctree)/drivers/gpu/drm/xe/display/ \
> +	-I$(srctree)/drivers/gpu/drm/i915/display/ \
> +	-I$(srctree)/drivers/gpu/drm/i915/ \
> +	-DBUILD_FOR_XE=1 \
>  	-Ddrm_i915_gem_object=xe_bo \
>  	-Ddrm_i915_private=xe_device
>  
>  CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>  
> +$(obj)/display/i915_%.o: $(srctree)/drivers/gpu/drm/i915/display/i915_%.c FORCE
> +	$(call cmd,force_checksrc)
> +	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/display/skl_%.o: $(srctree)/drivers/gpu/drm/i915/display/skl_%.c FORCE
> +	$(call cmd,force_checksrc)
> +	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm/i915/display/intel_%.c FORCE
> +	$(call cmd,force_checksrc)
> +	$(call if_changed_rule,cc_o_c)
> +
>  # Display..
>  xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	display/icl_dsi.o \
> diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.c b/drivers/gpu/drm/xe/display/ext/intel_dram.c
> index f591d61d389a..e57457ceb8d8 100644
> --- a/drivers/gpu/drm/xe/display/ext/intel_dram.c
> +++ b/drivers/gpu/drm/xe/display/ext/intel_dram.c
> @@ -6,7 +6,7 @@
>  #include <linux/string_helpers.h>
>  
>  #include "../i915_drv.h"
> -#include "../i915_reg.h"
> +#include "i915_reg.h"
>  #include "../intel_de.h"
>  #include "intel_dram.h"
>  #include "../i915/intel_mchbar_regs.h"
> diff --git a/drivers/gpu/drm/xe/display/i915_reg.h b/drivers/gpu/drm/xe/display/i915_reg.h
> deleted file mode 120000
> index 67a259605561..000000000000
> --- a/drivers/gpu/drm/xe/display/i915_reg.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/i915_reg.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/icl_dsi.c b/drivers/gpu/drm/xe/display/icl_dsi.c
> deleted file mode 120000
> index 2a1831df0934..000000000000
> --- a/drivers/gpu/drm/xe/display/icl_dsi.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/icl_dsi.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/icl_dsi.h b/drivers/gpu/drm/xe/display/icl_dsi.h
> deleted file mode 120000
> index 6f06694111f0..000000000000
> --- a/drivers/gpu/drm/xe/display/icl_dsi.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/icl_dsi.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/icl_dsi_regs.h b/drivers/gpu/drm/xe/display/icl_dsi_regs.h
> deleted file mode 120000
> index 8ef4e4a8249d..000000000000
> --- a/drivers/gpu/drm/xe/display/icl_dsi_regs.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/icl_dsi_regs.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_acpi.c b/drivers/gpu/drm/xe/display/intel_acpi.c
> deleted file mode 120000
> index 687ee6ee7f2f..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_acpi.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_acpi.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_acpi.h b/drivers/gpu/drm/xe/display/intel_acpi.h
> deleted file mode 120000
> index 988da00b3c16..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_acpi.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_acpi.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_atomic.c b/drivers/gpu/drm/xe/display/intel_atomic.c
> deleted file mode 120000
> index 48b811df4572..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_atomic.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_atomic.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_atomic.h b/drivers/gpu/drm/xe/display/intel_atomic.h
> deleted file mode 120000
> index e3ccf21d1bce..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_atomic.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_atomic.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_atomic_plane.c b/drivers/gpu/drm/xe/display/intel_atomic_plane.c
> deleted file mode 120000
> index 139b2f50f95b..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_atomic_plane.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_atomic_plane.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_atomic_plane.h b/drivers/gpu/drm/xe/display/intel_atomic_plane.h
> deleted file mode 120000
> index 0556c55776bb..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_atomic_plane.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_atomic_plane.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_audio.c b/drivers/gpu/drm/xe/display/intel_audio.c
> deleted file mode 120000
> index 9c5892a08fda..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_audio.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_audio.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_audio.h b/drivers/gpu/drm/xe/display/intel_audio.h
> deleted file mode 120000
> index d45e1292849c..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_audio.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_audio.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_audio_regs.h b/drivers/gpu/drm/xe/display/intel_audio_regs.h
> deleted file mode 120000
> index 1bc2fe1d27af..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_audio_regs.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_audio_regs.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_backlight.c b/drivers/gpu/drm/xe/display/intel_backlight.c
> deleted file mode 120000
> index 75e47d1d1bf9..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_backlight.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_backlight.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_backlight.h b/drivers/gpu/drm/xe/display/intel_backlight.h
> deleted file mode 120000
> index d277b1b0bb26..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_backlight.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_backlight.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_backlight_regs.h b/drivers/gpu/drm/xe/display/intel_backlight_regs.h
> deleted file mode 120000
> index 9d3919c9b31f..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_backlight_regs.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_backlight_regs.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_bios.c b/drivers/gpu/drm/xe/display/intel_bios.c
> deleted file mode 120000
> index c41ea3374da3..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_bios.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_bios.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_bios.h b/drivers/gpu/drm/xe/display/intel_bios.h
> deleted file mode 120000
> index 431ad6b3184f..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_bios.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_bios.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_bw.c b/drivers/gpu/drm/xe/display/intel_bw.c
> deleted file mode 120000
> index a7d701a83498..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_bw.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_bw.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_bw.h b/drivers/gpu/drm/xe/display/intel_bw.h
> deleted file mode 120000
> index a3742f627475..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_bw.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_bw.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_cdclk.c b/drivers/gpu/drm/xe/display/intel_cdclk.c
> deleted file mode 120000
> index a2c04b6e768f..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_cdclk.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_cdclk.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_cdclk.h b/drivers/gpu/drm/xe/display/intel_cdclk.h
> deleted file mode 120000
> index b80d7208da6e..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_cdclk.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_cdclk.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_color.c b/drivers/gpu/drm/xe/display/intel_color.c
> deleted file mode 120000
> index 0c5371c9dd67..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_color.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_color.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_color.h b/drivers/gpu/drm/xe/display/intel_color.h
> deleted file mode 120000
> index 00fd91f94752..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_color.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_color.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_combo_phy.c b/drivers/gpu/drm/xe/display/intel_combo_phy.c
> deleted file mode 120000
> index d459ce79ef4d..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_combo_phy.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_combo_phy.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_combo_phy.h b/drivers/gpu/drm/xe/display/intel_combo_phy.h
> deleted file mode 120000
> index 18d50bcc01a5..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_combo_phy.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_combo_phy.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_combo_phy_regs.h b/drivers/gpu/drm/xe/display/intel_combo_phy_regs.h
> deleted file mode 120000
> index 3dbdfb88ca72..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_combo_phy_regs.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_combo_phy_regs.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_connector.c b/drivers/gpu/drm/xe/display/intel_connector.c
> deleted file mode 120000
> index 18c91af30246..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_connector.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_connector.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_connector.h b/drivers/gpu/drm/xe/display/intel_connector.h
> deleted file mode 120000
> index 9fb4e9cfa7c0..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_connector.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_connector.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_crtc.c b/drivers/gpu/drm/xe/display/intel_crtc.c
> deleted file mode 120000
> index 5160fba21c04..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_crtc.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_crtc.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_crtc.h b/drivers/gpu/drm/xe/display/intel_crtc.h
> deleted file mode 120000
> index 0cf7909bc5ad..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_crtc.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_crtc.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_crtc_state_dump.c b/drivers/gpu/drm/xe/display/intel_crtc_state_dump.c
> deleted file mode 120000
> index f23e0597fea6..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_crtc_state_dump.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_crtc_state_dump.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_crtc_state_dump.h b/drivers/gpu/drm/xe/display/intel_crtc_state_dump.h
> deleted file mode 120000
> index 6e4daa77558a..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_crtc_state_dump.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_crtc_state_dump.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_cursor.c b/drivers/gpu/drm/xe/display/intel_cursor.c
> deleted file mode 120000
> index 740715826c84..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_cursor.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_cursor.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_cursor.h b/drivers/gpu/drm/xe/display/intel_cursor.h
> deleted file mode 120000
> index 5fb2fc440479..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_cursor.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_cursor.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_ddi.c b/drivers/gpu/drm/xe/display/intel_ddi.c
> deleted file mode 120000
> index b8bd93acc243..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_ddi.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_ddi.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_ddi.h b/drivers/gpu/drm/xe/display/intel_ddi.h
> deleted file mode 120000
> index 48eba126b662..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_ddi.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_ddi.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/xe/display/intel_ddi_buf_trans.c
> deleted file mode 120000
> index 25205d44064b..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_ddi_buf_trans.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_ddi_buf_trans.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_ddi_buf_trans.h b/drivers/gpu/drm/xe/display/intel_ddi_buf_trans.h
> deleted file mode 120000
> index 0144b866e6c6..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_ddi_buf_trans.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_ddi_buf_trans.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display.c b/drivers/gpu/drm/xe/display/intel_display.c
> deleted file mode 120000
> index 156027497bf0..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display.h b/drivers/gpu/drm/xe/display/intel_display.h
> deleted file mode 120000
> index fbdf72fadf7a..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display_core.h b/drivers/gpu/drm/xe/display/intel_display_core.h
> deleted file mode 120000
> index 044ffa4021d4..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display_core.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display_core.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display_debugfs.c b/drivers/gpu/drm/xe/display/intel_display_debugfs.c
> deleted file mode 120000
> index a38b035962a5..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display_debugfs.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display_debugfs.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display_debugfs.h b/drivers/gpu/drm/xe/display/intel_display_debugfs.h
> deleted file mode 120000
> index dc10537f5d0d..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display_debugfs.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display_debugfs.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display_power.c b/drivers/gpu/drm/xe/display/intel_display_power.c
> deleted file mode 120000
> index a892bb7f846f..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display_power.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display_power.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display_power.h b/drivers/gpu/drm/xe/display/intel_display_power.h
> deleted file mode 120000
> index 210a06440d8d..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display_power.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display_power.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display_power_map.c b/drivers/gpu/drm/xe/display/intel_display_power_map.c
> deleted file mode 120000
> index 556d5ef34704..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display_power_map.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display_power_map.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display_power_map.h b/drivers/gpu/drm/xe/display/intel_display_power_map.h
> deleted file mode 120000
> index ab553ade715f..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display_power_map.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display_power_map.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display_power_well.c b/drivers/gpu/drm/xe/display/intel_display_power_well.c
> deleted file mode 120000
> index dab308034739..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display_power_well.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display_power_well.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display_power_well.h b/drivers/gpu/drm/xe/display/intel_display_power_well.h
> deleted file mode 120000
> index c4ba490f7bc8..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display_power_well.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display_power_well.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display_trace.c b/drivers/gpu/drm/xe/display/intel_display_trace.c
> deleted file mode 120000
> index 3e64b8d83207..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display_trace.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display_trace.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display_trace.h b/drivers/gpu/drm/xe/display/intel_display_trace.h
> deleted file mode 120000
> index 8e77060b0688..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display_trace.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display_trace.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_display_types.h b/drivers/gpu/drm/xe/display/intel_display_types.h
> deleted file mode 120000
> index 60c391ef8878..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_display_types.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_display_types.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dmc.c b/drivers/gpu/drm/xe/display/intel_dmc.c
> deleted file mode 120000
> index 6758b5fc0af2..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dmc.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dmc.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dmc.h b/drivers/gpu/drm/xe/display/intel_dmc.h
> deleted file mode 120000
> index abbf15cc3883..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dmc.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dmc.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dmc_regs.h b/drivers/gpu/drm/xe/display/intel_dmc_regs.h
> deleted file mode 120000
> index 9460d31a1c8c..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dmc_regs.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dmc_regs.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dp.c b/drivers/gpu/drm/xe/display/intel_dp.c
> deleted file mode 120000
> index e04f8a550df1..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dp.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dp.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dp.h b/drivers/gpu/drm/xe/display/intel_dp.h
> deleted file mode 120000
> index f097e4e1d34a..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dp.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dp.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dp_aux.c b/drivers/gpu/drm/xe/display/intel_dp_aux.c
> deleted file mode 120000
> index bc448c0a93f6..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dp_aux.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dp_aux.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dp_aux.h b/drivers/gpu/drm/xe/display/intel_dp_aux.h
> deleted file mode 120000
> index 4968a8994f20..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dp_aux.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dp_aux.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/xe/display/intel_dp_aux_backlight.c
> deleted file mode 120000
> index 8f7f4647f30b..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dp_aux_backlight.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dp_aux_backlight.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dp_aux_backlight.h b/drivers/gpu/drm/xe/display/intel_dp_aux_backlight.h
> deleted file mode 120000
> index 30058e73c02c..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dp_aux_backlight.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dp_aux_backlight.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dp_hdcp.c b/drivers/gpu/drm/xe/display/intel_dp_hdcp.c
> deleted file mode 120000
> index 41792a7313e5..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dp_hdcp.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dp_hdcp.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dp_hdcp.h b/drivers/gpu/drm/xe/display/intel_dp_hdcp.h
> deleted file mode 120000
> index 07fd9a6d18eb..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dp_hdcp.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dp_hdcp.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dp_link_training.c b/drivers/gpu/drm/xe/display/intel_dp_link_training.c
> deleted file mode 120000
> index c5052f4c2832..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dp_link_training.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dp_link_training.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dp_link_training.h b/drivers/gpu/drm/xe/display/intel_dp_link_training.h
> deleted file mode 120000
> index 2bf6f0327bd7..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dp_link_training.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dp_link_training.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dp_mst.c b/drivers/gpu/drm/xe/display/intel_dp_mst.c
> deleted file mode 120000
> index 6ee2cb589fa6..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dp_mst.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dp_mst.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dp_mst.h b/drivers/gpu/drm/xe/display/intel_dp_mst.h
> deleted file mode 120000
> index 54df2b7009f0..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dp_mst.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dp_mst.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dpio_phy.h b/drivers/gpu/drm/xe/display/intel_dpio_phy.h
> deleted file mode 120000
> index 4f70bd7d5e69..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dpio_phy.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dpio_phy.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dpll.c b/drivers/gpu/drm/xe/display/intel_dpll.c
> deleted file mode 120000
> index d45ab4ac02af..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dpll.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dpll.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dpll.h b/drivers/gpu/drm/xe/display/intel_dpll.h
> deleted file mode 120000
> index dcae42f20ead..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dpll.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dpll.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dpll_mgr.c b/drivers/gpu/drm/xe/display/intel_dpll_mgr.c
> deleted file mode 120000
> index 1f70a7e81eec..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dpll_mgr.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dpll_mgr.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dpll_mgr.h b/drivers/gpu/drm/xe/display/intel_dpll_mgr.h
> deleted file mode 120000
> index 188708bdbd4f..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dpll_mgr.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dpll_mgr.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dpt.h b/drivers/gpu/drm/xe/display/intel_dpt.h
> deleted file mode 120000
> index 3771f0ee9e3b..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dpt.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dpt.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_drrs.c b/drivers/gpu/drm/xe/display/intel_drrs.c
> deleted file mode 120000
> index 9f292c670cd5..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_drrs.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_drrs.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_drrs.h b/drivers/gpu/drm/xe/display/intel_drrs.h
> deleted file mode 120000
> index b760b6f188b4..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_drrs.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_drrs.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dsb.c b/drivers/gpu/drm/xe/display/intel_dsb.c
> deleted file mode 120000
> index 080e3b2b2a3a..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dsb.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dsb.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dsb.h b/drivers/gpu/drm/xe/display/intel_dsb.h
> deleted file mode 120000
> index 8ae3ab260ec0..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dsb.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dsb.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dsi.c b/drivers/gpu/drm/xe/display/intel_dsi.c
> deleted file mode 120000
> index dede46fa511b..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dsi.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dsi.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dsi.h b/drivers/gpu/drm/xe/display/intel_dsi.h
> deleted file mode 120000
> index 444e98104455..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dsi.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dsi.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.c b/drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.c
> deleted file mode 120000
> index 2423e330a9cd..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dsi_dcs_backlight.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.h b/drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.h
> deleted file mode 120000
> index 8c6f6d596cee..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dsi_dcs_backlight.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dsi_vbt.c b/drivers/gpu/drm/xe/display/intel_dsi_vbt.c
> deleted file mode 120000
> index dbbf882b3935..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dsi_vbt.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dsi_vbt.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_dsi_vbt.h b/drivers/gpu/drm/xe/display/intel_dsi_vbt.h
> deleted file mode 120000
> index 17bc45d2b805..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_dsi_vbt.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_dsi_vbt.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_fb.c b/drivers/gpu/drm/xe/display/intel_fb.c
> deleted file mode 120000
> index 7f573cd75157..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_fb.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_fb.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_fb.h b/drivers/gpu/drm/xe/display/intel_fb.h
> deleted file mode 120000
> index b0ea84fef6dd..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_fb.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_fb.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_fb_pin.h b/drivers/gpu/drm/xe/display/intel_fb_pin.h
> deleted file mode 120000
> index 7cb45a179327..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_fb_pin.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_fb_pin.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_fbc.c b/drivers/gpu/drm/xe/display/intel_fbc.c
> deleted file mode 120000
> index 2561b363d18e..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_fbc.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_fbc.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_fbc.h b/drivers/gpu/drm/xe/display/intel_fbc.h
> deleted file mode 120000
> index 1e54107d4faa..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_fbc.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_fbc.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_fbdev.c b/drivers/gpu/drm/xe/display/intel_fbdev.c
> deleted file mode 120000
> index c59c682b886e..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_fbdev.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_fbdev.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_fbdev.h b/drivers/gpu/drm/xe/display/intel_fbdev.h
> deleted file mode 120000
> index 0ce2d63dc1ce..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_fbdev.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_fbdev.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_fdi.c b/drivers/gpu/drm/xe/display/intel_fdi.c
> deleted file mode 120000
> index 92d343e18c27..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_fdi.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_fdi.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_fdi.h b/drivers/gpu/drm/xe/display/intel_fdi.h
> deleted file mode 120000
> index 360365a5b014..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_fdi.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_fdi.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_fifo_underrun.c b/drivers/gpu/drm/xe/display/intel_fifo_underrun.c
> deleted file mode 120000
> index 80be33f1a499..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_fifo_underrun.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_fifo_underrun.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_fifo_underrun.h b/drivers/gpu/drm/xe/display/intel_fifo_underrun.h
> deleted file mode 120000
> index e70367d69c9b..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_fifo_underrun.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_fifo_underrun.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_frontbuffer.c b/drivers/gpu/drm/xe/display/intel_frontbuffer.c
> deleted file mode 120000
> index ac7a8a97606f..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_frontbuffer.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_frontbuffer.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_frontbuffer.h b/drivers/gpu/drm/xe/display/intel_frontbuffer.h
> deleted file mode 120000
> index 5a05d93a0c74..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_frontbuffer.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_frontbuffer.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_global_state.c b/drivers/gpu/drm/xe/display/intel_global_state.c
> deleted file mode 120000
> index d107abcd9339..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_global_state.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_global_state.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_global_state.h b/drivers/gpu/drm/xe/display/intel_global_state.h
> deleted file mode 120000
> index 24c757b52c7f..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_global_state.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_global_state.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_gmbus.c b/drivers/gpu/drm/xe/display/intel_gmbus.c
> deleted file mode 120000
> index 666f8bf04d13..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_gmbus.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_gmbus.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_gmbus.h b/drivers/gpu/drm/xe/display/intel_gmbus.h
> deleted file mode 120000
> index 2cf0b56aef9d..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_gmbus.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_gmbus.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_hdcp.c b/drivers/gpu/drm/xe/display/intel_hdcp.c
> deleted file mode 120000
> index cb8e1ae66c37..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_hdcp.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_hdcp.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_hdcp.h b/drivers/gpu/drm/xe/display/intel_hdcp.h
> deleted file mode 120000
> index 2b4e1dfaf2c6..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_hdcp.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_hdcp.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_hdcp_regs.h b/drivers/gpu/drm/xe/display/intel_hdcp_regs.h
> deleted file mode 120000
> index 297f8d358ecb..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_hdcp_regs.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_hdcp_regs.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_hdmi.c b/drivers/gpu/drm/xe/display/intel_hdmi.c
> deleted file mode 120000
> index 301a48121fb7..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_hdmi.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_hdmi.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_hdmi.h b/drivers/gpu/drm/xe/display/intel_hdmi.h
> deleted file mode 120000
> index 5cc4d8c45b8d..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_hdmi.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_hdmi.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_hotplug.c b/drivers/gpu/drm/xe/display/intel_hotplug.c
> deleted file mode 120000
> index a7f3bd35486e..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_hotplug.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_hotplug.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_hotplug.h b/drivers/gpu/drm/xe/display/intel_hotplug.h
> deleted file mode 120000
> index fb7de83b64fa..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_hotplug.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_hotplug.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_lpe_audio.h b/drivers/gpu/drm/xe/display/intel_lpe_audio.h
> deleted file mode 120000
> index 12ecf90e969e..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_lpe_audio.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_lpe_audio.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_lspcon.c b/drivers/gpu/drm/xe/display/intel_lspcon.c
> deleted file mode 120000
> index 24c00fa0a106..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_lspcon.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_lspcon.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_lspcon.h b/drivers/gpu/drm/xe/display/intel_lspcon.h
> deleted file mode 120000
> index 97c59ade9150..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_lspcon.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_lspcon.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_lvds.c b/drivers/gpu/drm/xe/display/intel_lvds.c
> deleted file mode 120000
> index 9fbbb96a3564..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_lvds.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_lvds.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_lvds.h b/drivers/gpu/drm/xe/display/intel_lvds.h
> deleted file mode 120000
> index 580c10fb55a2..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_lvds.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_lvds.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_modeset_setup.c b/drivers/gpu/drm/xe/display/intel_modeset_setup.c
> deleted file mode 120000
> index 8abfcfad8bd9..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_modeset_setup.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_modeset_setup.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_modeset_setup.h b/drivers/gpu/drm/xe/display/intel_modeset_setup.h
> deleted file mode 120000
> index 699532a8f408..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_modeset_setup.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_modeset_setup.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_modeset_verify.c b/drivers/gpu/drm/xe/display/intel_modeset_verify.c
> deleted file mode 120000
> index 74ed76570cdf..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_modeset_verify.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_modeset_verify.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_modeset_verify.h b/drivers/gpu/drm/xe/display/intel_modeset_verify.h
> deleted file mode 120000
> index ea64f21d0ac8..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_modeset_verify.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_modeset_verify.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_opregion.c b/drivers/gpu/drm/xe/display/intel_opregion.c
> deleted file mode 120000
> index 61b5f4c05b1d..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_opregion.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_opregion.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_opregion.h b/drivers/gpu/drm/xe/display/intel_opregion.h
> deleted file mode 120000
> index 32db39fdec30..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_opregion.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_opregion.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_panel.c b/drivers/gpu/drm/xe/display/intel_panel.c
> deleted file mode 120000
> index 37ca379aa267..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_panel.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_panel.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_panel.h b/drivers/gpu/drm/xe/display/intel_panel.h
> deleted file mode 120000
> index 8ef48628d9f5..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_panel.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_panel.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_pch_display.h b/drivers/gpu/drm/xe/display/intel_pch_display.h
> deleted file mode 120000
> index 8faa264c0dac..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_pch_display.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_pch_display.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_pch_refclk.h b/drivers/gpu/drm/xe/display/intel_pch_refclk.h
> deleted file mode 120000
> index 6bdb700f12e1..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_pch_refclk.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_pch_refclk.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_pipe_crc.c b/drivers/gpu/drm/xe/display/intel_pipe_crc.c
> deleted file mode 120000
> index 40bb44769ac3..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_pipe_crc.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_pipe_crc.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_pipe_crc.h b/drivers/gpu/drm/xe/display/intel_pipe_crc.h
> deleted file mode 120000
> index 2a6c75ff8f00..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_pipe_crc.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_pipe_crc.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_plane_initial.h b/drivers/gpu/drm/xe/display/intel_plane_initial.h
> deleted file mode 120000
> index 1315223e9410..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_plane_initial.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_plane_initial.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_pps.c b/drivers/gpu/drm/xe/display/intel_pps.c
> deleted file mode 120000
> index ce8eef664f23..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_pps.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_pps.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_pps.h b/drivers/gpu/drm/xe/display/intel_pps.h
> deleted file mode 120000
> index 9aeac4c55ca6..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_pps.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_pps.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_psr.c b/drivers/gpu/drm/xe/display/intel_psr.c
> deleted file mode 120000
> index 768587ae29df..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_psr.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_psr.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_psr.h b/drivers/gpu/drm/xe/display/intel_psr.h
> deleted file mode 120000
> index 3dda0616ccaf..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_psr.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_psr.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_qp_tables.c b/drivers/gpu/drm/xe/display/intel_qp_tables.c
> deleted file mode 120000
> index 966f911cddd9..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_qp_tables.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_qp_tables.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_qp_tables.h b/drivers/gpu/drm/xe/display/intel_qp_tables.h
> deleted file mode 120000
> index fe4260d5ce44..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_qp_tables.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_qp_tables.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_quirks.c b/drivers/gpu/drm/xe/display/intel_quirks.c
> deleted file mode 120000
> index b27e4f9cfe8a..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_quirks.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_quirks.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_quirks.h b/drivers/gpu/drm/xe/display/intel_quirks.h
> deleted file mode 120000
> index 2db941dc66f3..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_quirks.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_quirks.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_snps_phy.c b/drivers/gpu/drm/xe/display/intel_snps_phy.c
> deleted file mode 120000
> index b40e895077a1..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_snps_phy.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_snps_phy.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_snps_phy.h b/drivers/gpu/drm/xe/display/intel_snps_phy.h
> deleted file mode 120000
> index 737ee835ec1d..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_snps_phy.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_snps_phy.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_snps_phy_regs.h b/drivers/gpu/drm/xe/display/intel_snps_phy_regs.h
> deleted file mode 120000
> index b5b12e9dea1e..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_snps_phy_regs.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_snps_phy_regs.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_sprite.c b/drivers/gpu/drm/xe/display/intel_sprite.c
> deleted file mode 120000
> index 5dc50a886417..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_sprite.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_sprite.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_sprite.h b/drivers/gpu/drm/xe/display/intel_sprite.h
> deleted file mode 120000
> index a33ed10f3203..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_sprite.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_sprite.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_tc.c b/drivers/gpu/drm/xe/display/intel_tc.c
> deleted file mode 120000
> index 529ea5e9af91..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_tc.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_tc.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_tc.h b/drivers/gpu/drm/xe/display/intel_tc.h
> deleted file mode 120000
> index cc9eb2e620d5..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_tc.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_tc.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_tc_phy_regs.h b/drivers/gpu/drm/xe/display/intel_tc_phy_regs.h
> deleted file mode 120000
> index 99972b50c144..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_tc_phy_regs.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_tc_phy_regs.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_vbt_defs.h b/drivers/gpu/drm/xe/display/intel_vbt_defs.h
> deleted file mode 120000
> index dd3b5c93e2e3..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_vbt_defs.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_vbt_defs.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_vdsc.c b/drivers/gpu/drm/xe/display/intel_vdsc.c
> deleted file mode 120000
> index 60ca4950dd4d..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_vdsc.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_vdsc.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_vdsc.h b/drivers/gpu/drm/xe/display/intel_vdsc.h
> deleted file mode 120000
> index 2b554d01cbc6..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_vdsc.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_vdsc.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_vga.c b/drivers/gpu/drm/xe/display/intel_vga.c
> deleted file mode 120000
> index d4086ba46f1a..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_vga.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_vga.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_vga.h b/drivers/gpu/drm/xe/display/intel_vga.h
> deleted file mode 120000
> index b404f3800e95..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_vga.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_vga.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_vrr.c b/drivers/gpu/drm/xe/display/intel_vrr.c
> deleted file mode 120000
> index 6721f68892b4..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_vrr.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_vrr.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/intel_vrr.h b/drivers/gpu/drm/xe/display/intel_vrr.h
> deleted file mode 120000
> index a3d468fcac9b..000000000000
> --- a/drivers/gpu/drm/xe/display/intel_vrr.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/intel_vrr.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/skl_scaler.c b/drivers/gpu/drm/xe/display/skl_scaler.c
> deleted file mode 120000
> index 8df8eb3fafee..000000000000
> --- a/drivers/gpu/drm/xe/display/skl_scaler.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/skl_scaler.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/skl_scaler.h b/drivers/gpu/drm/xe/display/skl_scaler.h
> deleted file mode 120000
> index 90d00a96fea6..000000000000
> --- a/drivers/gpu/drm/xe/display/skl_scaler.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/skl_scaler.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/skl_universal_plane.c b/drivers/gpu/drm/xe/display/skl_universal_plane.c
> deleted file mode 120000
> index f5f93ec6f66b..000000000000
> --- a/drivers/gpu/drm/xe/display/skl_universal_plane.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/skl_universal_plane.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/skl_universal_plane.h b/drivers/gpu/drm/xe/display/skl_universal_plane.h
> deleted file mode 120000
> index 89c89dffc2f7..000000000000
> --- a/drivers/gpu/drm/xe/display/skl_universal_plane.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/skl_universal_plane.h
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/skl_watermark.c b/drivers/gpu/drm/xe/display/skl_watermark.c
> deleted file mode 120000
> index 2ec3b47dbd72..000000000000
> --- a/drivers/gpu/drm/xe/display/skl_watermark.c
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/skl_watermark.c
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/display/skl_watermark.h b/drivers/gpu/drm/xe/display/skl_watermark.h
> deleted file mode 120000
> index e9351cb0c6f7..000000000000
> --- a/drivers/gpu/drm/xe/display/skl_watermark.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../i915/display/skl_watermark.h
> \ No newline at end of file
> -- 
> 2.39.0
> 
