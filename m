Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6869439DC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A054A10E639;
	Thu,  1 Aug 2024 00:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTqAfKoP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E055610E339;
 Thu,  1 Aug 2024 00:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722470499; x=1754006499;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cf0Dvw9fJiazG6GmCpKAy+QJAuNTfJ5CrOARaeFuoYI=;
 b=RTqAfKoPm5m2YxKoVAtmYP63E5lLqchO6yxa2PA6B+goEBU/YmkLOl1j
 +dpZP32e3bfQoT7ucmApaPyirhf7XH+mo+PjPpOOfVHju+lCsSUdad5MI
 3dUcmJYB8bcfS8GMhxRNBbis9Irz9FFlZAwx+sMOQSj7An/y3qZv3cpJi
 Owzu7GJ0eK+tLDdDUoLRMM6PpiV6Pks4vpwSeAvsbSQpanR3fSZX9NnRx
 zt91eewsy2LjNKiCsFtvQjFtOA+tez4dKGByXFKL4wzP3AMVSp9lbjTs9
 1TahNxR2Zy/C7Ie0BP6aIasmt9tHeodXSaoelj9Fyh7U3YI7Plja4U9Wx Q==;
X-CSE-ConnectionGUID: 1+T9qI4pSRCmKCvFHElgjg==
X-CSE-MsgGUID: iQZYGffoTxOZJf/jXEJUQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="30968477"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="30968477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 17:01:38 -0700
X-CSE-ConnectionGUID: xHxUGF1hT5qeuD0AbyYP5A==
X-CSE-MsgGUID: 45ka8AFJT5aa0GNqnwHtyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="85462041"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 17:01:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 17:01:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 17:01:38 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 17:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afE+dKx6Eo2XYGxme3ZMRYWvYrYiLy6ybnDH0x9YcFf8zukWPbG44lokuaGgihFMIgTpFvvSq26ZbNaUgLaMW5p69Gb44eiaZqT15W5yY2+YoExwKi+sEHRzIfAVfc0uj7BCkjyNFAg9i07ZBoOnaQroXWnKfIrjfQPjV9zfYjYjMXTcz5/64kLkeP/1T/vDmwRLukXgIZLaSKwzrN0nOp6i0OvSMVnyHNU4LxEM81uTLPjYNAlMqgCHAeTOHTTj+0CEqFacPcw0EdzzmK6ePAasvtecUaTqZP6KoCWYphlm0lr5eP5bqveHAzJ3mJFPEewLz+qUol37j8sAdRsHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYotNiJFltO5Z+MTwDrHUPNwfZj7I+TFhO4bx3qsqC0=;
 b=h9pl3OOe2/SaCtxVN+oB51qWlnYp+8puBqP8QUHyedL2FMGmJ0hT9Nw/bpfUnJD/KI+5XCg2XCyTl1RLyfJJzEKeHb0vdiCQoCi2XBGov4AFvQc3H1Uh3GQ06f87hTfIVfR5DgHrdEsbaMeOcno6Ctu2+lV5pYeWJawPaVEmAr5pamwYWswsmjSHEj6I3ggUlpr2eaxUtTCa66lVYo0Qt8uSbkL0beqp9FvjCuhtYVHxBTLq7bZyU3bE/cQwL7xz/deuGJ11ajlfzlPC/OhOxbXxyCQtUvESDJnaolo31G+TQwBGfmmL1sNqdPltHJiOJviDORvWpMrh2nVCJy0m1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.29; Thu, 1 Aug
 2024 00:01:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 00:01:34 +0000
Date: Thu, 1 Aug 2024 00:00:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe: Faster devcoredump
Message-ID: <ZqrQKbgyUCrouV+9@DUT025-TGLU.fm.intel.com>
References: <20240731213221.2523989-1-matthew.brost@intel.com>
 <20240731213221.2523989-4-matthew.brost@intel.com>
 <CH0PR11MB5444691DD3B93D99108A22C9E5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444691DD3B93D99108A22C9E5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d7f467-9f99-461f-30ad-08dcb1bd1b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u7Up71WeX56tkxqYwSSLrCXao+UNG/IDuqjVzRkL5hC9L0wvcxh43GHCTA58?=
 =?us-ascii?Q?aTNnwfoiFaZ0M+uz35PDn/cGkTKNR7Pyma/bipIRC+E6ZeXjV3oaGS42KtVp?=
 =?us-ascii?Q?x3i+HDCmbG03O2wu5ryU8qX1KoEjhd61XlNkolizihlm3Y0Mi/p7/gXbiApU?=
 =?us-ascii?Q?RZZdp7bLSe/2hpEFJJHP41Uocrfqex8skyFOXLHEXp2HctzpBvZ7q5gnDE7Z?=
 =?us-ascii?Q?IF9vlKNzXPOgZQrj2RSIpAS8vj5KjTMwGGGMSHtyK+XU5kz432XESLS1YyJT?=
 =?us-ascii?Q?mC+I14aAjLAEaf4NGN5Csh3HzC88FISmRhMpV1h1hXMQcWkwxGYZ2hoRFPlw?=
 =?us-ascii?Q?dpPv6Zg9FQ4mwtG2jl2PzXm6+DkHVsYL28xssx9a5dqaMyTyiM12D56L1WQw?=
 =?us-ascii?Q?h9CfqRX3sh9hQoIiR9wAP+F4KrNHNd9i0YzMKA54f4p+IgOz1y/yrpWg4H1c?=
 =?us-ascii?Q?VRDaGF+x95Oqosf/5iGN7ZQ9yvJLlSW/x5J9Z5E/Rn0V7+ffpkiuPF79tiBH?=
 =?us-ascii?Q?dpoxbXvfeRC6EzJ1HZpW+QRi6kICTJ6ptfIbrv4zvbgIlAPbkW4h3rJl/bIa?=
 =?us-ascii?Q?/BL0ouY8dvkfYLCf7gXb9bD0ySWaAmlCRnz9l82EseAd3HDeKWgruq8r/ETv?=
 =?us-ascii?Q?bztSyg1EGfq+4D0Sn/32QI8cyLnP1DRL2APIv+XQzrt/pltLDacpgR02B7yw?=
 =?us-ascii?Q?K8oIpcOdLRZ7SMooOuwIIo/8fLRwn44cwBhovpAdUJYIn5odqkeX0lhQpH0y?=
 =?us-ascii?Q?Eq4FoE0gT+smZ7nDmKVXZQIzPbZtaIAYrGwEglDMDS5DevJVMuvwzEM/Lc5g?=
 =?us-ascii?Q?UrMzOT3Zsc+UCqmapUAtxJ+YIiYhycVWOBLtulYVYVlWomnR6V9ZC1ALdbSS?=
 =?us-ascii?Q?dd3IyUEBGUaiw4z6gnvqz2P752IPwujDbUsfpOwFAXyRc7hIYri+sGYHodpx?=
 =?us-ascii?Q?uDN7k4PyrzGPypKdccPm7Gjz84HzwKFXSivD4SyEz2XcNgz7r59Pj1zjJYCD?=
 =?us-ascii?Q?pbNbSCX4qRKazciDfOSlrUSsBX0TRxxN6+aNKAcLsOoN8UiAdpZ4GrnjnKOv?=
 =?us-ascii?Q?EASqtTQqIFlPLDkMVIyQWD8FQEgwNHP1hdvxz1J2gMeFMLrz9X9Mnx/8u3MK?=
 =?us-ascii?Q?rHTrxLBWgwm75aInpxt9mzcUhr1zXgUceIn14/m62Lrg3CXGha3HJryA5BG4?=
 =?us-ascii?Q?CQlQkPU8pz3mHbLdwxsWqAW4Bxim7py8OrcpfJdMruF6Mj77Qqy7nxC3UzPX?=
 =?us-ascii?Q?ZUTPI7n9s/r7DPJT/JfTzk8Ita5oBHH2zD8NW2TBJ8fMRio6eut2j+YlZew2?=
 =?us-ascii?Q?YI4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZNgSTcQwKXi3yf9mSQabTISWU5ieYwS6vmxvGxaBwQr1x6OfOAsRHz8XGJwO?=
 =?us-ascii?Q?VeMQuhCMEsjgN3Hd2y7AGhV90yzeVfwpoO9M5IwyqsGykKGUpFsYuMFQobKT?=
 =?us-ascii?Q?w6l82DQWdiCrN1N92nLNxeHOzCaQgXZMrLW43wqkYY1m4vxVBdzDLs9lnTKI?=
 =?us-ascii?Q?mrtFvjCVXTRGlpwk3iOEm3tLPfvgtXntg5YuUErHjItQ38gprgXmCq/sbQgW?=
 =?us-ascii?Q?d7V41JLE3Peqdx3wgIya+brrR4B0nrMt3gu65OlvjWH6KD0Rw7P7NGt+4onl?=
 =?us-ascii?Q?UhWVffYB0laZoxq958ha0nSfJGD9DYVjf12TcKJsLF2bNFfm/IiZRlAuKc2k?=
 =?us-ascii?Q?UXiWTFEqV+kqzkRnj8dsx7c+h8ASSaGhzPVof5epK+/fLYHDKOPHAklOS2qc?=
 =?us-ascii?Q?iDHqR/1ndxSgbe7AzMBusgYe7VgNhbKMSGt+195JoIOJ5qTvMQsADhdnsJD/?=
 =?us-ascii?Q?vrWT99K6hTmJ182CqWPb2CzBnvoKRR0p6NlcpbPRhYuIhdvnFkENX6vCOUm2?=
 =?us-ascii?Q?mRcwVVmFSmO5/OQsrGeHC+dTc8X2U7LMTUIMSdsqYtbUlr2BfpdcHIJGjVXf?=
 =?us-ascii?Q?57/CTAQgk775QktVZPtOtEwn7jmpTGTpQLhcXqs+Eq41AkfMNrYTvjdzpaIC?=
 =?us-ascii?Q?IzJCjbHJtLLFAbBnV26rDBlplaE4pX/eKLKVt4e42HIKwf6TveRWjEW+Ebe0?=
 =?us-ascii?Q?S2PmsFMajbjt+A2VelI+FDKxs0eQWsVS7KVr+AxzBnuLbtvHipH7aclG3MBZ?=
 =?us-ascii?Q?6GPUKH1wO8PnBYMvJCB6276d//JwFNoPkRKrnp1knAvc/mL6qCAKaG5R0cA0?=
 =?us-ascii?Q?SpmubLrSXnYXyalrPOt/LTYVwNrqkRk/ewR5sqWmIApkqSF/QY3GXOSEOEIF?=
 =?us-ascii?Q?XQL6t013QLGXkrvTeyoYfyJJXUlvYuAM/jA3BDwmufDvyDyR6qOv3kumwqNT?=
 =?us-ascii?Q?jFFp7v2/meDNch9ZeAaVSUvQN6H9/h2H7yJcOHazs+1DKHYtz3W3bSdFNWvb?=
 =?us-ascii?Q?zb0IYvmIVsztaVJ8muwQjiwW1187jke9kbimqDhphajBT7n6nnOeLEtX19zj?=
 =?us-ascii?Q?ebM95jG1NFvnNvXYJs23uR02By5DaMoN1zqkhPEOINgt64tLuV9AuljyYIF0?=
 =?us-ascii?Q?9ppmOVKs+6lNPefsHxCrTtk02Vusmj1zyz9adHlNdmfSmT7r4HoFmzIzkyju?=
 =?us-ascii?Q?VHDhjeG92w0gP5dTXnxVcl1HeDwb3VZM3cQd+QjHx33zNUfGRZ2U6zB8PVif?=
 =?us-ascii?Q?qcWkxuTFBYYI0CFcrRwMB5FYx4+GTW49ojhrkscmgsbdnnSLMRh4wbc0pBlk?=
 =?us-ascii?Q?8czWlUZZhn5iuVABrRdamjsvHGsNL6aLkeT913q0JwKF0gMtU8OIsWsqvA3d?=
 =?us-ascii?Q?jiyZB9AMUjM05r37KYG6Yt0kjHZihW7qcqP2EDuOyUtJDEFzH8FnVjrdUeXP?=
 =?us-ascii?Q?wVjAAHg3Zaxjn03U2g3YEMVNxVH1dPzxiEFvrsG14Am//7o+b8HtaI4CMAfo?=
 =?us-ascii?Q?xKDhGxxTEpI9StF3rz6/yJTiKc5FoI7kKyJ2PyRPtHUkij7rqEZ3vKc2yY8k?=
 =?us-ascii?Q?qxobVUwDVN2ILWNIiF4xTE5nXo6Id9SZYC8q0rQSndGvszmtvccWf3Yg1BD2?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d7f467-9f99-461f-30ad-08dcb1bd1b65
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 00:01:34.7869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6s/ugm+zBRZxrp3KpiJF1FwEOy1jbPKbZB01ciSZ5XiwNggfGEr0MeqZGar9s5eEUevWBFTlEO40aLwD710sTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 31, 2024 at 04:31:01PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Wednesday, July 31, 2024 2:32 PM
> To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: maarten.lankhorst@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH v4 3/3] drm/xe: Faster devcoredump
> > 
> > The current algorithm to read out devcoredump is O(N*N) where N is the
> > size of coredump due to usage of the drm_coredump_printer in
> > xe_devcoredump_read. Switch to a O(N) algorithm which prints the
> > devcoredump into a readable format in snapshot work and update
> > xe_devcoredump_read to memcpy from the readable format directly.
> > 
> > v2:
> >  - Fix double free on devcoredump removal (Testing)
> >  - Set read_data_size after snap work flush
> >  - Adjust remaining in iterator upon realloc (Testing)
> >  - Set read_data upon realloc (Testing)
> > v3:
> >  - Kernel doc
> > 
> > Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2408
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_devcoredump.c       | 112 ++++++++++++++++------
> >  drivers/gpu/drm/xe/xe_devcoredump_types.h |   4 +
> >  2 files changed, 85 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index d8d8ca2c19d3..b802a35c22f2 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -66,22 +66,9 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
> >  	return &q->gt->uc.guc;
> >  }
> >  
> > -static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> > -{
> > -	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
> > -
> > -	/* keep going if fw fails as we still want to save the memory and SW data */
> > -	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> > -		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> > -	xe_vm_snapshot_capture_delayed(ss->vm);
> > -	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> > -	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> > -}
> > -
> > -static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > -				   size_t count, void *data, size_t datalen)
> > +static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> > +				     struct xe_devcoredump *coredump)
> >  {
> > -	struct xe_devcoredump *coredump = data;
> >  	struct xe_device *xe;
> >  	struct xe_devcoredump_snapshot *ss;
> >  	struct drm_printer p;
> > @@ -89,18 +76,12 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >  	struct timespec64 ts;
> >  	int i;
> >  
> > -	if (!coredump)
> > -		return -ENODEV;
> > -
> >  	xe = coredump_to_xe(coredump);
> >  	ss = &coredump->snapshot;
> >  
> > -	/* Ensure delayed work is captured before continuing */
> > -	flush_work(&ss->work);
> > -
> >  	iter.data = buffer;
> >  	iter.offset = 0;
> > -	iter.start = offset;
> > +	iter.start = 0;
> >  	iter.remain = count;
> >  
> >  	p = drm_coredump_printer(&iter);
> > @@ -131,13 +112,86 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >  	drm_printf(&p, "\n**** VM state ****\n");
> >  	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
> >  
> > -	return count - iter.remain;
> > +	return iter.offset;
> > +}
> > +
> > +static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
> > +{
> > +	int i;
> > +
> > +	xe_guc_ct_snapshot_free(ss->ct);
> > +	ss->ct = NULL;
> > +
> > +	xe_guc_exec_queue_snapshot_free(ss->ge);
> > +	ss->ge = NULL;
> > +
> > +	xe_sched_job_snapshot_free(ss->job);
> > +	ss->job = NULL;
> > +
> > +	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
> > +		if (ss->hwe[i]) {
> > +			xe_hw_engine_snapshot_free(ss->hwe[i]);
> > +			ss->hwe[i] = NULL;
> > +		}
> > +
> > +	xe_vm_snapshot_free(ss->vm);
> > +	ss->vm = NULL;
> > +}
> > +
> > +static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> > +{
> > +	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
> > +	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
> > +
> > +	/* keep going if fw fails as we still want to save the memory and SW data */
> > +	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> > +		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> > +	xe_vm_snapshot_capture_delayed(ss->vm);
> > +	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> > +	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> > +
> > +	/* Calculate devcoredump size */
> > +	ss->read_data_size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> > +
> > +	ss->read_data = kvmalloc(ss->read_data_size, GFP_USER);
> > +	if (!ss->read_data)
> > +		return;
> > +
> > +	__xe_devcoredump_read(ss->read_data, ss->read_data_size, coredump);
> > +	xe_devcoredump_snapshot_free(ss);
> > +}
> > +
> > +static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > +				   size_t count, void *data, size_t datalen)
> > +{
> > +	struct xe_devcoredump *coredump = data;
> > +	struct xe_devcoredump_snapshot *ss;
> > +	ssize_t byte_copied;
> > +
> > +	if (!coredump)
> > +		return -ENODEV;
> > +
> > +	ss = &coredump->snapshot;
> > +
> > +	/* Ensure delayed work is captured before continuing */
> > +	flush_work(&ss->work);
> > +
> > +	if (!ss->read_data)
> > +		return -ENODEV;
> > +
> > +	if (offset >= ss->read_data_size)
> > +		return 0;
> > +
> > +	byte_copied = count < ss->read_data_size - offset ? count :
> > +		ss->read_data_size - offset;
> > +	memcpy(buffer, ss->read_data + offset, byte_copied);
> > +
> > +	return byte_copied;
> >  }
> >  
> >  static void xe_devcoredump_free(void *data)
> >  {
> >  	struct xe_devcoredump *coredump = data;
> > -	int i;
> >  
> >  	/* Our device is gone. Nothing to do... */
> >  	if (!data || !coredump_to_xe(coredump))
> > @@ -145,13 +199,8 @@ static void xe_devcoredump_free(void *data)
> >  
> >  	cancel_work_sync(&coredump->snapshot.work);
> >  
> > -	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
> > -	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
> > -	xe_sched_job_snapshot_free(coredump->snapshot.job);
> > -	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
> > -		if (coredump->snapshot.hwe[i])
> > -			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
> > -	xe_vm_snapshot_free(coredump->snapshot.vm);
> > +	xe_devcoredump_snapshot_free(&coredump->snapshot);
> > +	kvfree(coredump->snapshot.read_data);
> >  
> >  	/* To prevent stale data on next snapshot, clear everything */
> >  	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
> > @@ -260,4 +309,5 @@ int xe_devcoredump_init(struct xe_device *xe)
> >  {
> >  	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
> >  }
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > index 923cdf72a816..0298037edae4 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > @@ -46,6 +46,10 @@ struct xe_devcoredump_snapshot {
> >  	struct xe_sched_job_snapshot *job;
> >  	/** @vm: Snapshot of VM state */
> >  	struct xe_vm_snapshot *vm;
> > +	/** @read_data_size: size of read data */
> > +	ssize_t read_data_size;
> > +	/** @read_data: Read data */
> > +	void *read_data;
> 
> Perhaps the data size and read data can be stapled together under the same
> struct?
> 
> struct {
> 	ssize_t size;
> 	void *data;
> } read_data;
> 

Yes, I like this better. Will change.

Matt

> It's not that big of a deal if this is untouched, just something to consider.
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> >  };
> >  
> >  /**
> > -- 
> > 2.34.1
> > 
> > 
