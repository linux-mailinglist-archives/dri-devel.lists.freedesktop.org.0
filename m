Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F3786F2D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 14:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C8410E548;
	Thu, 24 Aug 2023 12:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FB510E546;
 Thu, 24 Aug 2023 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692880456; x=1724416456;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=lk177MLvsl+XXL5kkOyOSLoSAA151zTMWoDWXQj5YZk=;
 b=XUnjYPsprrsJbu7WzEU+7SOwqNg6h+5yo1rAI9IiaA7n7P7zpuoKZMeD
 XQpNDkxy8Ouz4rBXF/OEB0J7hvpbD+H/cIMQq17kenKM7QTyJaQ52wv3m
 pfZLywX18yxifBujZvOrq7LUvBLyjLyTti2MUdraI9d1kh+e9bumimN67
 yIDdSjl4Htt6JzWQ0ijxO7rcgsFO1Vc9mpOzpomOy/RIJ2gn5kPO51200
 vrHPbw3dKHDpg7IYznUrKSw+44Rn0lI/codgbR5mJ4TK0+2tE5EWtRnr1
 HZjPSyKwPEvqVKgFSGbMhjeYYXfwiUkLbJ7aaW/ykhkBEQYfGhmM6/Xcy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438359272"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="438359272"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 05:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="737030486"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="737030486"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 24 Aug 2023 05:34:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 05:34:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 05:34:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 05:34:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dA9VDkXnVWUGCZGB/KRDEamjZvw86t+l1+1ROddNKBSljGYrbAFj5UTOWp0ndSWs1sTf3a0TMTQaOWVF7TYEQS/nqfOh63F6kgnzW1EK7OhhPSzTUAOUyg3tI2qjBHOKlxzhpaSfibWylIagbLWxAO0hEhC+tQI+NV/lYEA/jhfsA9FVXdF5DeQGeuKB8hfeoI1wzoS/unB4BVn/oDifsmat7fqX0KToANZKsO1/E/fiS5deXuAwGAtdqaTXx+hJ0CNInm1R5wFgl7YYr4Q4HF8WRo6x508MTM+/el5ftxlM1fwUA2sY55XQ2BpguxdJwUHh8pYmQwGutjszMWcndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xp0vE/0lIIWipVmgc86XAESqALbKM9C+P75jhA4voYo=;
 b=eiBBQQNzAUBuK6O0fh04JP3vWhwITqdWUeZijRRLy9q1fhh7Hv3pGthUdgNBxoNZID8t5pi/JyuEXuXHQ+JPHzJwU+FFvBCgioiTg895RUzcO64xN4KQsPXo/TVKsLXgDkKHsvUPb0CVdLSvKppSb4EiEH1sXjRWxo4aJ0vfEz6D8Kcf9Goh8iZN7s1TavwukBbHF1S2hpJGnsK0Rl6B13gHjnm6M7gutiRQngNniHs+78j0vFLO27T+mjv8DThZ9fFZBtS8+Pmscgdd7UcT4cLtwE+DBRus6Gkch+OFg9TNlHtcgAhLCyEM3tKqHxZoL9jlXnqAb1JLzcHSRU/Nyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5430.namprd11.prod.outlook.com (2603:10b6:208:31e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Thu, 24 Aug
 2023 12:34:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.026; Thu, 24 Aug 2023
 12:34:12 +0000
Date: Thu, 24 Aug 2023 08:34:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZOdOP31OE/Cf1ojo@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5430:EE_
X-MS-Office365-Filtering-Correlation-Id: 83bdf90f-2093-47cf-1d8c-08dba49e6bb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: miIPMcItUDzWBvW16SieWAo1VCJMWwAM9qOQcQvv6xr5kvA5ROdYBpt6d7hPnyRcYA7fsfhWtN4u2DF8x/jpf1ogK4Sepa5reRoeTCXiQODDRXLRQHhH9g84TaqmRVcjpMd81IrdsS19LmQiCBrqFfDP5Rz0m79q5PeQnU6szTYwEqstLsj5OTG0szYG/t3X6SUBAE7jSTY6+6BwWN0Xvs47JdxsNr287dNvLaw5H6rW0rAVqJNrkzhzabsxXtxlilT6ppUcnp4YKAENEuClN9fVj6zt/nRnkkgI6wf1bOR4+o34o/DLHUtIgYLpFtJXzNy21GoYEEfkFhGRKrF7AjLGyz9sz/PUUOxGUr/m/2KS3DUAK+sz1gFd7baRXmaxB5DrNXWpd5N47RT3+U5PIl+FWllkfBSGIbojVhCfNOYfbEtElEqswbuCyREIWrbMuLpWr/MDdMdNouHwtHcO754821hzcg/jjOnbyhx70dMp5nChZZCFSJEH11Q+SrMVqwmwmAGx0V0+mBjXP2IYfncNQdLu5ahZw0WJ6T4PkG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(186009)(1800799009)(451199024)(6666004)(6486002)(6506007)(6512007)(2616005)(86362001)(66556008)(5660300002)(2906002)(7416002)(44832011)(82960400001)(54906003)(4326008)(66946007)(8676002)(66476007)(8936002)(36756003)(41300700001)(110136005)(38100700002)(316002)(966005)(478600001)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FrPbt+lvjuqGcf6H7WntQGZ3N0XV89eHP6AD/DiBG1TRCZiew/twxAaH9xJ3?=
 =?us-ascii?Q?Emm4s3s+d60hY8+xVrZs91VbfCHxqOkKThxGiB+++7qqaGoM1uEHr5EeeX1k?=
 =?us-ascii?Q?SPQbz0Eo2gPs/1demn5fpAo7hhm0525kiey/hRSutSAzfQRWn2ZhRhCxNi6J?=
 =?us-ascii?Q?wJHwBdWK+sK+MDlrzFsM9ApKMjXE4sWSU6tfASAyivqz8aFXgjw39ZDh2XP1?=
 =?us-ascii?Q?ipc1AQj4qSVOU6nkRS2OZK/v+kBp2efFZNfOTgr4rIJyd0aUgnjviglznzlR?=
 =?us-ascii?Q?sgqXvsIJbNEpuHv9fm0IHlygOadD5Tv+hdRu68LnYZ0B9ewSfElwPpksZYAm?=
 =?us-ascii?Q?hTGZv0D2VaExHzGGYcLL7ZbM0AAlfMN6Yv0s6pH/3xrIbNYZuUt60DIP+OG0?=
 =?us-ascii?Q?qrSe/DBPS7UeFhN4E6EABOQQSxBvnY/9ZFSYSxync+//6++PaIref6EmB/Ev?=
 =?us-ascii?Q?NgN5/RULDYM83MjEtsnymzozMpAfeTi3a56/j0YDzk/UsehlsM3L0y0aqTsF?=
 =?us-ascii?Q?T0ucUsXrS/drlMw/cO8rvlVlFs5hQTfDuE/VSyuAJB19/qKA7i/dW7Mz9nrZ?=
 =?us-ascii?Q?/orlYOXj2FjpRzpxblpQYwQ1h89OZ+S+Fhj9+Mdm0OIyLCHLHXLL4GrZat7Y?=
 =?us-ascii?Q?TWpOLevHjJz35XssdEOx3iDwymPclXMeZlE8f3R6Su8dP7+pl+SuGi2ok7x+?=
 =?us-ascii?Q?5btuxhIZ8ssXLf/N7JI25aYygZfOi9H/EQCg6Pi0rLEALdm+KRiu+xIELqOD?=
 =?us-ascii?Q?YWDMgyPAZtfqHWLeUwOiAneCZ7BPu3Pwgwd7hKTBvXY9Fztxk6hdMOEZljG7?=
 =?us-ascii?Q?vaWOylx9bZwc9IYdFTSDd5eI+WYThIHOI2Rn/I9PHkznsMRXv1xFFDOv/wGb?=
 =?us-ascii?Q?84S7of6FuvnyyykNvKQypWaOCKGCyZycn4jyq3gf0V8+c7P2sAC1bCDjK38m?=
 =?us-ascii?Q?YZf2wuaFDak90PyjB2PvMt0Ypp3dDmPRVcOyZMxpeK4DxuqWn2e4YuMVUVzQ?=
 =?us-ascii?Q?lRBMWANVVLpWZgWiBn5XLgqvDHpoHVk6RXsTGF1m6b56q/vTP18rYRm2jvYF?=
 =?us-ascii?Q?BOJB/J7ZcyyuU5kimHujuK6LlB1CJU6nRIPdslkCd4qrzNTxuFVqR1qs6sT+?=
 =?us-ascii?Q?mbHX0naqgFixT+qyAcD8jsCTEGDYzy9EDA4LGjqqlRlEXNvFFnTuVBGMc+A7?=
 =?us-ascii?Q?naVmFpmRcQQUgKhmGNU2ncWlJEbxAYiG69VLao/YxqRGhZUkP5HQPbnYZ7I8?=
 =?us-ascii?Q?ZHHzfNOYVu6hAux5L2TUt0evC02arn4OCssBWl6DbG4FfcVWboWcgPYM0JCI?=
 =?us-ascii?Q?xwR5cDapju0goXGT5GvR2gKDvZYy2EXxKi6l5Qs7X7Kn2dJpIDNtGCQuqCVB?=
 =?us-ascii?Q?9lQmaWFMi4muoQMsdC3RlI6GE7aB4PlVkztCfJ3d4q9+m+PFjdaxRTDMpAr2?=
 =?us-ascii?Q?6TEAK1y7R3W34mscU0n+JYb80JAhtJPokdQOmo3fm611+Xbj4lzmlYiotsa1?=
 =?us-ascii?Q?Z3SVds1PO2Cd1dyjRS+ueF7jvMQ1uJ15ecpKrC/oS548fyI8dXSBFBdaE1Qv?=
 =?us-ascii?Q?R8q2bYDi/7ufTsBXXySWZ4GBBddkJFPKo1gv7qir2i9vwOXUhbPn/TjtB9YH?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bdf90f-2093-47cf-1d8c-08dba49e6bb3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 12:34:12.4654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTu6Jz3PHaaGO/e3ANBg2IvExk+tnMGW55cWRKEwpmoa+gH2u16zrEnmAClhCVLY7K48ww8Ld93bm+oDJNNVHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5430
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

Here goes our next-fixes targeting 6.6-rc1.

Please notice that we have 2 drm level patches there,
one to fix the display HPD polling and one dependency
introducing a helper to reschedule the poll work.

drm-intel-next-fixes-2023-08-24:

- Fix TLB invalidation (Alan)
- Fix Display HPD polling (Imre)

Thanks,
Rodrigo.

The following changes since commit cacaeb27ade4b793c456179bb6eda4592d206cd8:

  Merge tag 'amd-drm-next-6.6-2023-08-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-08-21 12:32:16 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2023-08-24

for you to fetch changes up to cfd48ad8c4a9137b0fde7f0ecf463d44b01875dc:

  drm/i915: Fix HPD polling, reenabling the output poll work as needed (2023-08-23 17:15:41 -0400)

----------------------------------------------------------------
- Fix TLB invalidation (Alan)
- Fix Display HPD polling (Imre)

----------------------------------------------------------------
Alan Previn (1):
      drm/i915: Fix TLB-Invalidation seqno store

Imre Deak (2):
      drm: Add an HPD poll helper to reschedule the poll work
      drm/i915: Fix HPD polling, reenabling the output poll work as needed

 drivers/gpu/drm/drm_probe_helper.c           | 68 +++++++++++++++++++---------
 drivers/gpu/drm/i915/display/intel_hotplug.c |  4 +-
 drivers/gpu/drm/i915/i915_vma.c              |  2 +-
 include/drm/drm_probe_helper.h               |  1 +
 4 files changed, 50 insertions(+), 25 deletions(-)
