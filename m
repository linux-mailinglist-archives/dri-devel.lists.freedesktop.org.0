Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EB677F97E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 16:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B999110E4B5;
	Thu, 17 Aug 2023 14:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C605E10E4B5;
 Thu, 17 Aug 2023 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692283519; x=1723819519;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=FutW5AThX91TO8Nvh8p23m3mb1R2qlkxbfhwb8DrAXQ=;
 b=AZBlDqUiJ2MaSgFTop3EDVW+9nivX9HvyHOjlqpsglted6EY/hMZcOZT
 IxWXdeFHen2TvCualg777NpkubVpeuZlflSAFGu3bwtmG7Bu0lV+Fikdj
 9Lq0UdE/j/WtNDC3DXC7AyoC7KQ7eNZSzLeqTFTRzWGC1SQYUuY0PnS7J
 mMWBZ4uSFdgGxfYVwvfSdo3jUR3rK8cvz2a4qQ5H1uTAO5mDJ6nGcrHa/
 rcyE0yWRTZ/z9N2nVTRL/8QuHgorwb2pBaILmOvnygvtaMGNijHr7p1gT
 sWDDZ33uR/WsuY4V/oKrKAwzphdP2ANDJjTrPn4xB/I8JOsnMDw/1cQRf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="357801816"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="357801816"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 07:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="711582449"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="711582449"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 17 Aug 2023 07:45:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 07:45:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 07:45:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 07:45:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 07:45:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HInzpm7+gwMKX5ZoBGoXGAr7w06KSZBXrM9Np0vDvWueD8MDU3xmFtdDjT1ou1UDN3YSz6FZ2tzg8U6eyggD2xpSBhYEMVfr/iaceKZnkuJ1ZVIxkE0B75pgNK6jsCs2RNKRdzB86QhGhcLiAufjAppx54bRoD/sj1odwdID0GciZeV5P5Wsr32u49HBNkXJfB/BSnKhlB6k768WsN/rYI/jJ/GJW3a4wGIsPULY+yDxaaR8xu0TUkZs+DdvVDbTezI5htN8myhnA/ZN+h/grpgkXV2SnH2wJFFPNxzQNhhxNW04GCdUmggUlVPUz0x63a3/Nq8YNY8feUugPaGemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcSFWyuseLbHEkoHYKy3BZ5zFCUTeKPUy699AGSy+2c=;
 b=HTxawZ9OUWFYyS2woxFZ/GN9EJ0WFrPxrIMOLT1RH/lrxeny8EJXAb1EZ9zKIFq/ffewkdfDWAz53KrY16VRXCXM7ovOOfyabxTVHtEllR/z35nc5DONYV5k0qnG+OPUom0wBC4KpogF4mTjZzofjvIk0rqBpOhXvq18pJ2hoJ2dv0JTFXeFQZ7xYtM4W71QO2qJBa18t2zFi83aeu6ngXLx0cV/RVbPD4qpfCyqjgVDem3+bSi1V710gAgrdoi2SmFFirRQxu8J9fkkrwk2ED7ipQ+snkQfI1Qro4azk//hxHIu53HOJ71jA+qHdKDkaTowJtsYCIwYDTUTAbC7Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8494.namprd11.prod.outlook.com (2603:10b6:610:1ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 14:45:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 14:45:15 +0000
Date: Thu, 17 Aug 2023 10:45:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZN4yduyBU1Ev9dc7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR08CA0060.namprd08.prod.outlook.com
 (2603:10b6:a03:117::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: a0228666-421c-4bff-7efa-08db9f3091ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5m5spPYIt/KHcuKrvsb/3l8VYzfiergXhZPl3xj++BCxHZ86/eYpLTLsA32VHFa/+HOgnlPvvYbKKxg18v7W583l2HkOnBbDGT0oq/cMCfAxV/1RgfnZN9p0pa4i5rPSXPmTB91D6OtRmOghupyKkisurgOeFZKAcasUx8p4LO4ajhTWNIpeQtRHPWZs5ML3YG/EPKWkOHRR0TsQerffz7tvFj86CsF7+Cw4xHgUH6GpfYC+etCjFTd375d+I6H8aHF1UlW6kcEp0fITxrlGimDa3Y3C2rG/1j9YtVgy0XQl93xywfoJ56bAbDv/Z3h73N5I59f09D7BhjARMVA2L/BHfZE3WgOxvpZfIlk1bFj2Hf0VdQdAb89O/7RnqB7Xb8hfGzYkW2JLYLnRW55XFBlv/q9roHtl/gs0WB7i4Fuak3zv4/QqqtgSBuQYqlQGElFf9g/hXT4HHs00nRWHhO0FpONykVpfCHuFuLIF/yPcDxfEvuH3NLyQ7vDV6JmbGGUOogp+kExHdwPEMaY01itYJHqQIY1yY7CrW7A7N4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(376002)(346002)(39860400002)(186009)(1800799009)(451199024)(2906002)(7416002)(83380400001)(478600001)(66946007)(66556008)(66476007)(6506007)(54906003)(316002)(6486002)(6666004)(966005)(110136005)(5660300002)(44832011)(2616005)(26005)(6512007)(4326008)(8936002)(8676002)(41300700001)(86362001)(36756003)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZPnvAM8ktLMwynYYCX8NX0yq2UovYTjp2vRZONtFzPvl6zvvw6/ZRIZVaa8s?=
 =?us-ascii?Q?XRkcUCvnBkHSg9Mf1PVarM+ExEhyB79qRexOs5Qv4ddCOVT+yQn3kIxjxrs7?=
 =?us-ascii?Q?WJMdyc8Nfr7rBGHPvrnhB3GYokz5KA6jVHXzjaUZ0uPPh2horMHR9dl4++rC?=
 =?us-ascii?Q?ffm4uyQ9KvjDn6wDs+wT3nAk60B6DbjYcIrVTJ+PxrKX6LGBkXr5IJTperSX?=
 =?us-ascii?Q?zQkPei3XkdwCkZSwYi+KvUafekIMkYUq55SwF9SmLSGI5uozaYMLy9rDeIzO?=
 =?us-ascii?Q?cqsF9MKY+ZToROVK3ZQVf+SR57R2knCKIO1vEPakE4vYuPi+bMH/mo3t41Ws?=
 =?us-ascii?Q?y0dLHqbdtcc/+HFXMViDgAfJd0ZZB0KQiWWR39wvxTQBYKjP9pWrWsQiCM71?=
 =?us-ascii?Q?jhf6vB/QqWWPreefU+MrkVmwRFaSg8qg4d3PWQtcaXPQB8Lwa7Scl7hnAXOx?=
 =?us-ascii?Q?FgGrsvQCSNSgzSIcpy4FZ+yXhstfAquqT8arGMsDGQHkAd53l9TPeg7/qs1s?=
 =?us-ascii?Q?iIsOFUaGukcJjzw0ox1xjdCxVvBhFpXnSNI8dBFiDFtgZJtBFhWChpCbY7PE?=
 =?us-ascii?Q?mNLfwXYDw4Y4gKYdTPW3ODDRXQOKcgpfLb++M7HOpT68oWrj2+WTTOvx7ebt?=
 =?us-ascii?Q?kiS4p6RgsRQZCQWTwG85pr2NFhg2qgmqdaj8qzRshREHjmeL1BYzHH2lW/T7?=
 =?us-ascii?Q?E5aGexCwec3XwmElCg972vGVtM3v7PXPdfFCQXArKA7rwSamTsscFhqOdqAN?=
 =?us-ascii?Q?p9/o+rwCfuREJg/NdjhM1YbHgg1kBnvFmjzcR4vPZ++eKnDI13JeBAxZh90Z?=
 =?us-ascii?Q?ywsRSogAiV88EKFsceFgYosolJ5kTjtAVD8YMbUK9mXbWiDBZE5iSYAA2OLQ?=
 =?us-ascii?Q?Y4vnkKHKZ9XwUPV1Im3CMTRBffxCpgHVddxyYL1kziHuUSRuzN77LXr/3Bnn?=
 =?us-ascii?Q?48HzBNM92rhhbBM8kuOVUntrqMIFLQ+V/6HNMaElLO291xi24v9SdHN6eYpB?=
 =?us-ascii?Q?eQaoKvjEOiaRR2EpHfpLfZQlcvBJ59phPjQI7bxDdr3kAAwg+lBk7FY0fyhj?=
 =?us-ascii?Q?hHWa/mse5788RQ3NIfChrClvfwrrWTYu5l5WRzkUOuLtOOELFuTlQ7VrEJMa?=
 =?us-ascii?Q?K7CY+AlSACTuzFETzH+692Dp3sO9vvY0BFWjXoUYHtjl1h9ypoOpPYmblAfV?=
 =?us-ascii?Q?ClpwB+A0K2YMsIkh2gVTTXoYDA903SZUVwIqjPDL0p7o7876U7naNKhJwefM?=
 =?us-ascii?Q?CJT+nOyAsxeZYYQfQu1c6NMx5LcXiHgZekI/YztpRVL9yvZy9aZn5U3K8Qz3?=
 =?us-ascii?Q?TstVjRRjnJrOGVuJUs38TUpuv0pmHnOT6wCVOc71kRQrfvH1giludr7KSdGI?=
 =?us-ascii?Q?UbuKABjpGqcgyFOvFClyD0E5iS/3Pn+79tmE4tPvF4WHSnaNkk7a9XRabwI7?=
 =?us-ascii?Q?ojM43EPPa7aJjfUz7w6IBQw8qFu3naQ3GhnwSEX8anxdlbSSMtmf6cml7ru7?=
 =?us-ascii?Q?z2teEdsj885HFeokeKYhwRhFVNT4JUpiq59qIMCa0RimaPzt3/mze0Y0T/KC?=
 =?us-ascii?Q?lkwvdQl8/vheoGfQLqrG2G9SwJh76hbuBIpM3Cgm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0228666-421c-4bff-7efa-08db9f3091ad
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 14:45:15.7732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJ57q2GyGx2GZpfEsvvNofYIHnjxow3r7VglBw7P09tN/h+wKZGeivSSn8QzF0yfCaFaR5U1tyCqiUBneKhfew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8494
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

I'm covering for Tvrtko on this week's fixes flow.

These 3 patches were queued since last week, but I had hold
because I had some doubts about the CI results.
I have confirmed those issues were not related to these 3
patches, so, here they are.

drm-intel-fixes-2023-08-17:
- Fix the flow for ignoring GuC SLPC efficient frequency selection (Vinay)
- Fix SDVO panel_type initialization (Jani)
- Fix display probe for IVB Q and IVB D GT2 server (Jani)

Thanks,
Rodrigo.

The following changes since commit 0bc057eae2610c275361766a064a23cc2758f3ff:

  Merge tag 'gvt-fixes-2023-08-02' of https://github.com/intel/gvt-linux into drm-intel-fixes (2023-08-02 08:14:57 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-08-17

for you to fetch changes up to 423ffe62c06ae241ad460f4629dddb9dcf55e060:

  drm/i915: fix display probe for IVB Q and IVB D GT2 server (2023-08-14 11:59:30 -0400)

----------------------------------------------------------------
- Fix the flow for ignoring GuC SLPC efficient frequency selection (Vinay)
- Fix SDVO panel_type initialization (Jani)
- Fix display probe for IVB Q and IVB D GT2 server (Jani)

----------------------------------------------------------------
Jani Nikula (2):
      drm/i915/sdvo: fix panel_type initialization
      drm/i915: fix display probe for IVB Q and IVB D GT2 server

Vinay Belgaumkar (1):
      drm/i915/guc/slpc: Restore efficient freq earlier

 .../gpu/drm/i915/display/intel_display_device.c    | 24 +++++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        | 22 ++++++++++++--------
 3 files changed, 36 insertions(+), 12 deletions(-)
