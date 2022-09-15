Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379A15B9C54
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4157E10EB2F;
	Thu, 15 Sep 2022 13:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D67810EB34;
 Thu, 15 Sep 2022 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663249827; x=1694785827;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=45gfFhqwXb/1ZmWHxVJrOoERkYn/Ks1B/dsOpkPMOC0=;
 b=lWUIW1QS5J+tnOhp7a7a4X7TIlgcYm81bN96ngDK5RnOoumjZvw4xDkJ
 1SPedR4jGoetrLoyc6snwb8m7sXZB+lM/4jtOEl3W82RTa9AN9xxEu8EP
 CCrRlEof/koSHOKKaSlXtDEXO/mXwGAGB4dBCFpqTfnHgGHsUseioo2Vl
 pmyYxhSJdC2mnItPYOU9BSUMcAcIwlymyh0zCw+agTL9zkQYdoIq0yfEu
 gO+PhQnHcoutOSLxxOllJ9QFemPFeWwI2vVwDaWdbSsdcgvqzBV4fx/Ph
 041sYZuuqi4WIVfS9FYPXfpdm3zUhYf31Zan83p5AJjBnozp+7HRDDoch w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="281746318"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; d="scan'208";a="281746318"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 06:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; d="scan'208";a="647831642"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 15 Sep 2022 06:50:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 06:50:25 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 06:50:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 15 Sep 2022 06:50:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 15 Sep 2022 06:50:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGC1t+AnRuBjLZ9xIyPhluGmSWclYWcXZT4IyXufcKtLdgdVR83wMbLjuXiwBXpkfyB19olExnJ/G+WLG98LB6cYWREx0Xf2olJMPvVSH3YbO5kE78y21jJu50obbR6jhKhzTHXMHRydizML2OioU9z9Bf/etI2dDF6aY1iGLVZSsXL01iTnoM4BouUDHkL2sDtxBJbRVhjIN65aEYGYiXNOfGtd5E3mBOGv7Q6Gc4cmU8xbmy4dcIt9Ueax9uq8+NpX+KvyEu4PgPwQ3ZqrS0rRQqVnnEDs50sYEe8y9NDkY1OtUQ6Y/FZsErWhGdLSA3UD2R79p8Dtpi18SPACYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfE60mreBKjANHE0kSZ/e6YfiSvQlUJsDGAO4lpOw1Y=;
 b=U7BnZ3W7aXKhsRQPGlddJgxgmseCwtMH4qfMro78xT/8T8sDf0tUzkg+aR2bLSjwUBjFDZIgxmWPV8ZjwYejSoTM8y+FVNr8awtk5f8oOEBXZIsDQA3mx/OmZOldn3rOvk4RDqgMGdkXNXHsWgRfH3yCGo9TNSLQbOXPOSfc8V3dmpHW690Va1VdzNOG5sVt3UnZ1IRNHVTsMNbGozB98/ZwdSzT6MuVadjBi0v6ahSBtRGNpn4rIeidHuLXv+hfE0PsHkUfwe9jWRPXuMxKHPphB4j6B55rRYz4APhVTqinI/K/TZuQunVyXd24cyyfyFoO1OHKsGou4P7Bq2Ke/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB7007.namprd11.prod.outlook.com (2603:10b6:303:22c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 13:50:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4%9]) with mapi id 15.20.5588.016; Thu, 15 Sep 2022
 13:50:22 +0000
Date: Thu, 15 Sep 2022 09:50:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YyMtmGMXRLsURoM5@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:217::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e12502ba-c293-467c-17ea-08da97213bbf
X-MS-TrafficTypeDiagnostic: MW4PR11MB7007:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7qZ3+nHfa2s5NU4eYZWPEMbQJNK9f+9qH9xS91DziMn+Cau1yx09H6PJfXKpas0wYH12u1xw2rcyNKGWCdy6dlHH2x4GD3eQ5SeK0zL7hNG7KAzdqDsUccjNYM2Wd+R919NX7ZmFP59PUjBHFLTa2biKnSuN2j0aOy8IlBKbSU6BfIIhoN5SVCWWxUDLB6EDIWsBotOg+WlcFd+4Uvr57JhDBtWQES6pQmBoG0dqLEtAKRL4L3MnaW5Cbx9Ph6hWgG+6B/pQN5Iiv/X+YSRMXOzthToeo7+FLzBtFL2CqnSFHJQinCXG0iTAbdmnp7JSikEJRtbXl3btUGYZVHLLh1UXzS2PQJwMLyiZkJrB4YkYox6G33WuZ3eaKW/wGNfGcBbuK+DcPDodJV9U1+HAsAWRvpkzjRscsvHPeZEQPBap9C5JVqbRvAZysD/T9z2ZCf9iTDLyzlVWj/k/d8cEL7nbAWrWU4Zh2VBOasTAWhjpmTIvy8xZI+csENkYZZGFnkUD90hzePgOmEvPzry5mw03PLW+qB22hu7QEXw+dE+3CrwPJM+uCtvJFrI3UJrYrJv5Kwq1sCtfbnrVEIaqelA29JGn8gMyjyFgAQwH4VVUeswMEKmgvkJva18PnfWlGrWgrH41cc3lNx3WbsJMp3XUOcLMGan5g4gGfBZg93eE3N0q0jmOKJj+gT//infKOFXo0LwH3WMRJSHH8CzW+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199015)(82960400001)(54906003)(38100700002)(66556008)(44832011)(7416002)(66476007)(478600001)(8676002)(186003)(5660300002)(26005)(83380400001)(6666004)(36756003)(4326008)(110136005)(6512007)(66574015)(8936002)(2616005)(6506007)(86362001)(41300700001)(316002)(2906002)(6486002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hwowU3JKXOPh/8DbZa8efOQyqfPVv97PpDVLBoSgarL+6YK2WHIXPDUmrM?=
 =?iso-8859-1?Q?ls40orkF4PChwZEbZvPhLePK/vXfhNG1s9ySv7dbSpngb9uFtsfQG1d66v?=
 =?iso-8859-1?Q?GaLAHvq8X3Njupmi4Bi5ZgaurS4+3rkCU3mlQUbaXLaxepsTPs63jkj6Fw?=
 =?iso-8859-1?Q?IxJEzoWLR+3zkjklFdcgdpj2YCYmzxgMNV1Rab49sqNhrhLdqGQEeXate+?=
 =?iso-8859-1?Q?PciqgBlQcfvl4IOYECMEuv0s8XxS6bDTcDz4WWnq2ScgCkI+VBZYYK4l1W?=
 =?iso-8859-1?Q?ZZlQMDRO3f7SdeKOkpU6ymn+8d/ChnqNVjN5WigKab5BImjUCFQ3UNuZb6?=
 =?iso-8859-1?Q?GSFs5wk3xXAWYaY3+J0+1KZPtOl9sIiJ5qBoom7HkGi2p3LPQu27l2jC22?=
 =?iso-8859-1?Q?sDLHJBjfkz8bMBU7ZduxBSV0k7zvFhd75woHv/5mXPtVZ/SjzgjOJWlvj+?=
 =?iso-8859-1?Q?h9a6tBk8MEKOu8LgsvxxGD4r+L/EJsqkSlrCoqsleS+0Cl1ZMkYdvIm6kM?=
 =?iso-8859-1?Q?rWR07Rs2arkHDL+kAURLAwo8jNVkbqPFy6wWGP/ab8GWXTPOJMJmHXoSRw?=
 =?iso-8859-1?Q?i25cnIQuaTOrY/GjWSDTfV3jEijZO+M+k1JRt50Ki9Dg2ygg/LWlo8C35u?=
 =?iso-8859-1?Q?bA5uglJXg08KvBlzNMVYpUqAF+nRFAeyK9i3DAmwmcDxP9jyfgYJFYJ83Q?=
 =?iso-8859-1?Q?3LYYu/hn8GahGRkrdU/QB5Of+I+k9N0SRqvDvfuBUy2CWY4APjDn5WQ4NV?=
 =?iso-8859-1?Q?t3vwISKgYzFGchlFxcVuMsdR8qX2T56LBNLE8/xr6hkel/tknW2Aaw1Jgb?=
 =?iso-8859-1?Q?SsRnOpfAxleC9U5XdY9AFW+YOD1uBiWhPCM0L6rN7aYDmVB28/2HOwgwlE?=
 =?iso-8859-1?Q?qQe+h5JlQ4LGXVhNGq31STr1xNN9ELB6Q59Y2/ip3WuNUos56rvmJ5hehQ?=
 =?iso-8859-1?Q?DfIM+zbh+LANArnuc/iIXNO753lWgza4KV+Z5WCaXJldhPgwxixerRMxdI?=
 =?iso-8859-1?Q?e2MRWxwQB3fCVe3LdvHHxXdLO2WQSZKKN6PjpO0yN3kK2uihhkUdnRFMZW?=
 =?iso-8859-1?Q?UqLR5ZQeodTo1z6smlJSz8O9t/75kCguUL2S6NfLgM9qxZCfL1/G9z4gZ0?=
 =?iso-8859-1?Q?y8ZI8h2Mm1OXTKae0zTWxC5X0CGOSvfvKgPvsyT6/slFpHyXaehKq8ywmQ?=
 =?iso-8859-1?Q?kwwjynfGbDODn6aCYmoaEmUM31sccXRzXhfvkBaysYAIY4lxwHAkqIXHuU?=
 =?iso-8859-1?Q?wr2dpSPyVShG+wfEbGXGWDdATq24hsBUef1sKyazizvjoxx3wVYrcYBvll?=
 =?iso-8859-1?Q?EBdm/X7cU0B6bh9ElGoZOvCTlG4gPIpzLQUQbZg2oW/DvuO7NNBDT1+pXn?=
 =?iso-8859-1?Q?lmfPJY7MK/jwnrG5HrAW4jIvHiJJMIXGWJipzcTufNzEDMeWbvBswioD00?=
 =?iso-8859-1?Q?t5U9WBA/I4WOyuxoCkbjjq4eKTOQxStAlFvTQsgG+qJzJOKCS6T1/ateIT?=
 =?iso-8859-1?Q?uXPwh+RMx2Sj4ED/Er9KzPKEZSJF2VYl0fNNSdysqH+XzGChwxPVWfXUHn?=
 =?iso-8859-1?Q?j1SS9oIe0K6tPJEtO2JCXtT2KMLalUWCCCbOUG9cjjmMzgIg4TNz3LfgHc?=
 =?iso-8859-1?Q?xF3QpxjHM2KIeaZfnqqcgDdlClThmhIRgNM+DlgT8tW6VkMuupVgZQNg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e12502ba-c293-467c-17ea-08da97213bbf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 13:50:22.0784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9+lzduLrArqPPm2e4sYBgucDa1obcrljqRqafrWCGSRxsEk2QmcoE63Lx6ez2Z3fxfVnqKRja9IQ+yW2occdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7007
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

Nothing that big for this round, but a couple targeting stable.

Here goes drm-intel-fixes-2022-09-15:

- Revert a display patch around max DP source rate now
  that the proper WaEdpLinkRateDataReload is in place. (Ville)
- Fix perf limit reasons bit position. (Ashutosh)
- Fix unclaimmed mmio registers on suspend flow with GuC. (Umesh)
- A vma_move_to_active fix for a regression with video decoding. (Nirmoy)
- DP DSP fix. (Ankit)

Thanks,
Rodrigo.

The following changes since commit 80e78fcce86de0288793a0ef0f6acf37656ee4cf:

  Linux 6.0-rc5 (2022-09-11 16:22:01 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-09-15

for you to fetch changes up to 8787f6fab41380189865f5751c0f15b0c298b923:

  Revert "drm/i915/display: Re-add check for low voltage sku for max dp source rate" (2022-09-12 10:00:47 -0400)

----------------------------------------------------------------
- Revert a display patch around max DP source rate now
  that the proper WaEdpLinkRateDataReload is in place. (Ville)
- Fix perf limit reasons bit position. (Ashutosh)
- Fix unclaimmed mmio registers on suspend flow with GuC. (Umesh)
- A vma_move_to_active fix for a regression with video decoding. (Nirmoy)
- DP DSP fix. (Ankit)

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/vdsc: Set VDSC PIC_HEIGHT before using for DP DSC

Ashutosh Dixit (1):
      drm/i915/gt: Fix perf limit reasons bit positions

Nirmoy Das (1):
      drm/i915: Set correct domains values at _i915_vma_move_to_active

Umesh Nerlige Ramappa (1):
      drm/i915/guc: Cancel GuC engine busyness worker synchronously

Ville Syrjälä (1):
      Revert "drm/i915/display: Re-add check for low voltage sku for max dp source rate"

 drivers/gpu/drm/i915/display/icl_dsi.c            |  2 ++
 drivers/gpu/drm/i915/display/intel_dp.c           | 33 +++--------------------
 drivers/gpu/drm/i915/display/intel_vdsc.c         |  1 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 ++++-
 drivers/gpu/drm/i915/i915_reg.h                   | 16 +++++------
 drivers/gpu/drm/i915/i915_vma.c                   |  3 ++-
 6 files changed, 22 insertions(+), 40 deletions(-)
