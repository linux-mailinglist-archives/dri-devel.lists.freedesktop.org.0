Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B89F26F3EA6
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 09:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D498710E1D6;
	Tue,  2 May 2023 07:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1E610E1D6;
 Tue,  2 May 2023 07:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683014243; x=1714550243;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OvsUf26Tt7eza0qBs3XTt/vBORJo/qK9kRU3csgHo98=;
 b=ET99k35Sj1o7rqaGkaW+WkOF32+7STv8DyxGWNHiSVjGsbyegLv/taZx
 rSNbYad0JyfgimJsYkhYmZ+lAVZ8Op60hnppdoLgXfVwfyilyPgg1HuG6
 8qCyYKmfLH/GkoOaVURTu9PGZSTZrOMGD4xIuPCURqR1IfFamVRb/hHwi
 lV3TIkZFe0Wgi2/6tfIE9P7avMCaWNwdqCaVQ/fpPwBPsFHsbe9maTSnc
 gGOtdVE4/DRdd9SD1cfDBc/jpui7hByxNzVOkCWsLsGo7ntpBm79o3yFv
 vKQVEbudDEieetN2RCK4302ifnifNqgqFAyEk69vI+jE+ZootwzqKjJVH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="434652802"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="434652802"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 00:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="673547523"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="673547523"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 02 May 2023 00:57:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 00:57:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 00:57:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 00:57:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 00:57:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iybiYUgtAgppXjpDbs9vsoU4Q5XG0mGchO/OpsFX3mS/1WvxtTYIYmvIPN2ICIobSgsOcbqGKy7zUsHOpItKMSRhQepxMVWk6wbJBpnAdfACf8uvtRkQmtyxHaePHZ3DKnsjyBxU+kbNAU65jgJZwbKrV1m3PAvelO0bIm5oagAh+FDlE3O2I449YKE9ji1Jtwhq0PA0SNhdVKzHZQGTrh2Ss+S20OlsNguzSvQETrWeek1GyD391Yu+hS5r6hDsvy21icgl/pniJ12VD9Z1RUdYV3D9PlY01U3/kiEuguvE8q1EGb6pveC/ZcsUcvQVncNoj3WEwEisjB3KX73f+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iA4e3UIui7j953FmeMQLjHkKjVKnYwQjKuHza2/DzKo=;
 b=e3gV8WqJnBaNFT764iPg+a/09mLCCvpux3L2AX5A+Db6fIQG3wE2A1iqpGdVNEFB++yHfFlGEyGhCvVxF1eUIjTFx+eRxxQKZfR5wvAMwq9Zk3nIdy7ZgjXHbteuxWWfZCQ8YP12YhuqiGhP8O+g1K5uu3SDus36TLz5DfgkRTNb4ntKAvxmrcKm+XyckCflB7zNsotbztks+09ums6bugq7Cyzz9V+MITf8La6MT+P/6TcdlAPKHPgrF+j7ypVefGJa+k+vH//MuId6m7xkTrvB/ZaACigp4BQkWyYOnt0qgzvo6OtwgTHWhpdal+zdh5SPOZEFM0T3DHLF7niI0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7503.namprd11.prod.outlook.com (2603:10b6:a03:4c8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 07:57:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 07:57:18 +0000
Date: Tue, 2 May 2023 07:57:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 02/14] drm/xe: Introduce the dev_coredump
 infrastructure.
Message-ID: <ZFDCTkAD5M0wdJ0f@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-3-rodrigo.vivi@intel.com>
 <2f09ea83-59f0-f210-797f-40dc13908f7d@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f09ea83-59f0-f210-797f-40dc13908f7d@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ca8242-7b2a-4490-2a69-08db4ae2d983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ejuEkmi4eET0pcjjmq1v9L7r9rbVZcrc3KUKVnOZUomEcI3g0MxlrTgqIhlzQKtoeZ/gvA6+B88nVIImkJgJmF1wBPRxG1LQ8CKZlosShudhL/ny6xzX2H4nLg0pfStsJR1pPkbBZnFmO6gjkfVVnsIb+mx80Kl3KDbYC5t1w/uQbMFXkTx3cxJ108uDaej/QJwNPLeUidrwsj5adVmUJIJb8NkbRRrIipOm/2D0RqyqBhuidze7VxHHCSz3/3yEMQ8L+z1ODo0B6CcgFXwkkgIab5nqAp06jnNAPwvCTwjKfEebMnuc2GPoe7GoqNcoGMV2PMf/knRHCCHntMIs2G3xb6e2M/AF7I51l32sTFkrowUwhS0f1UUA+wVtqZ4FBLviHbAGMwwCM7c7JIrRMDMB2+UPy1SbZBM3YAgEzbw7GgYjP5XfXOEZVyolgWsVypLg0QPMmGv4bR6cNNkp0eO3euiQpgBdSSxJJtqDPW7ZHXani8BPZTlsvNd0PMxSCVkb+Og41hAwmmBUM/HR/zUIp/Ad0KrgF4yr44hLXfvezznY1p8wrH4SFdvIiBVu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199021)(6666004)(53546011)(26005)(6512007)(6506007)(6486002)(316002)(30864003)(2906002)(66476007)(66556008)(66946007)(4326008)(6916009)(5660300002)(86362001)(8676002)(8936002)(44832011)(82960400001)(41300700001)(38100700002)(186003)(478600001)(66574015)(54906003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?a3wYOonHoGuLNRKq4w0MGSPus5t1ILZXgtoHTHVlqMdASo5MWOjkHSkcCl?=
 =?iso-8859-1?Q?c+urfLCKASaXQmyp63PIwghQMevT3dUCJvWTg07FGm2dluCblgfvAvQgxi?=
 =?iso-8859-1?Q?sdKKTgRD6n+csZOpL4fwG+D6krUDaJrUz5T6nykpZ4kuoWCjIbvzZNWjsE?=
 =?iso-8859-1?Q?9HOXCMJBMrEeOx1PuYlM3L1QHjH9xbLKs1kjJ0C8eK2mjDk++cYrmEglBV?=
 =?iso-8859-1?Q?n3diR8DI6oAmfpkVUlc6FGCkjPP+zBPd5sy/Rrsuw7THxDRNPbnwFX+2z/?=
 =?iso-8859-1?Q?1EZpGM2x67oYKqAZ1jnLA/yrXgy6hfEegw5wn1kxIHqaxH8MnFlXWWJsg4?=
 =?iso-8859-1?Q?Qw/X6P6K7O+eiZljd9psrIiJyirnzB72O7NEGhweyvhfgPSVHfnU1REVqh?=
 =?iso-8859-1?Q?5rAzB7pFUufvrIlXwuQcf4bo7zax9fqQd3YhaPMQkQvbsQSEoWO6Utq9FZ?=
 =?iso-8859-1?Q?fPzSLVU4fvSNoI2Qjo0A2Mp3SXPc0nagX+gCI6XIloX1UrdKCWjvtiY9vi?=
 =?iso-8859-1?Q?UKAnZ+KDSmJvBCvrD/rIb5Yy3/F4/Igbb5FTPHNlh+dqyfk0TUs3PKQ+ie?=
 =?iso-8859-1?Q?t06Zgq5I/9KpjhU0BCi5GOOWLyWhW5epUHkWy5kg9KB/3vvGJRsZH3Mn97?=
 =?iso-8859-1?Q?RvN9PKREReXG8PCMb9ci8n4I1bQUQQzj98BwFUDeH/jYSyjIeOkp0CN6FD?=
 =?iso-8859-1?Q?+SnyzwDPO14AINYu0kfHO8//zQuB/3rTxaae0rc+2KJH6rOvOlk0yyM6H/?=
 =?iso-8859-1?Q?hpp0NYc3u1AFqKdgjL+Bjh55A34Uz9vFJyuwu6yzaL+T/qm9WjCWAZikQW?=
 =?iso-8859-1?Q?3XW3rkr7IxLNaAjksL5l/tR58iea/E9uOllWaz/CX1jolIHwRAkS11E5RB?=
 =?iso-8859-1?Q?CyHP8J2WOSh2qdKRve97DWScVTvh7HDBdlqPZRBw5VynLDQPbN/ONWWGJ+?=
 =?iso-8859-1?Q?vS/2d5T7Jc6MUPC68ULX/Wz7qHJrKlW9Ja1FEi5WevujxzeAaXmGaCMwqU?=
 =?iso-8859-1?Q?DxjmanrfaSJ4Ul8SlA+7f3lhA67cSNEFvc3+TGm6Nk5wxtcQ+F1AoIrqOc?=
 =?iso-8859-1?Q?EupWlhkRH7DwtCmkgx7d1yv+UhqrX/LAVBZ7tgCD3F+/5FgtKDXZHqmn5B?=
 =?iso-8859-1?Q?SLoEdLbCnHnC+fqnsCSwtHh2qIhZXdquGeS85MNla2cW6kIxE/EFFnWvgk?=
 =?iso-8859-1?Q?f7jP49tVkNoFggJMksa/3W6ZbTmffcBC+DPkeIya+4PuB8asKS38Wt6o3D?=
 =?iso-8859-1?Q?o+vVUU2WzsFpO/tSPLWEcMbOUXUmmxpjTkVHl/H//ineqTk6S7iBCUQerP?=
 =?iso-8859-1?Q?a57TDponPUoo/j06ckCFSdqEBRyYqzOt55YDtZDhK7mAhCBdpzVAWNDfFU?=
 =?iso-8859-1?Q?S6Ym2vG0anTqyvFsP4FdC3IjlMtwMWMO0p48CXbACQsMWfGrF1+1GsoOfD?=
 =?iso-8859-1?Q?30DtjU9v9pElCHcQZEIjFXHZjC4vTqKnJDInmtCcRvj/Ve0PaLRxHZV+/x?=
 =?iso-8859-1?Q?F3vdn1goLOfab0pcSyeuac273+KePund2rJNqDKsF8tyJNhBv/OskVWWyp?=
 =?iso-8859-1?Q?BKewrKvGYeYuktXnKwtf/qUwFgB3Mmdyvo0T3nUokCthUYVKzMfJsbEQ1q?=
 =?iso-8859-1?Q?LtIXlEwIaHCFbGNheZBGNDJFz8S+Hn88ZZmEJTzBTnGTgjx1QFa48ZGQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ca8242-7b2a-4490-2a69-08db4ae2d983
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 07:57:17.7600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pxjwq/hqHMX3xkGP+z7lnqR0MLJyfgPbcCaumxU9EuJYz4EpOXC7QnrU88n+xhowVuYFE0MNwom0DvLC1mSMjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7503
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 10:28:13AM +0200, Thomas Hellström wrote:
> 
> On 4/26/23 22:57, Rodrigo Vivi wrote:
> > The goal is to use devcoredump infrastructure to report error states
> > captured at the crash time.
> > 
> > The error state will contain useful information for GPU hang debug, such
> > as INSTDONE registers and the current buffers getting executed, as well
> > as any other information that helps user space and allow later replays of
> > the error.
> > 
> > The proposal here is to avoid a Xe only error_state like i915 and use
> > a standard dev_coredump infrastructure to expose the error state.
> > 
> > For our own case, the data is only useful if it is a snapshot of the
> > time when the GPU crash has happened, since we reset the GPU immediately
> > after and the registers might have changed. So the proposal here is to
> > have an internal snapshot to be printed out later.
> > 
> > Also, usually a subsequent GPU hang can be only a cause of the initial
> > one. So we only save the 'first' hang. The dev_coredump has a delayed
> > work queue where it remove the coredump and free all the data withing a
> > few moments of the error. When that happens we also reset our capture
> > state and allow further snapshots.
> > 
> > Right now this infra only print out the time of the hang. More information
> > will be migrated here on subsequent work. Also, in order to organize the
> > dump better, the goal is to propose dev_coredump changes itself to allow
> > multiple files and different controls. But for now we start Xe usage of
> > it without any dependency on dev_coredump core changes.
> > 
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/Kconfig                |   1 +
> >   drivers/gpu/drm/xe/Makefile               |   1 +
> >   drivers/gpu/drm/xe/xe_devcoredump.c       | 144 ++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_devcoredump.h       |  22 ++++
> >   drivers/gpu/drm/xe/xe_devcoredump_types.h |  47 +++++++
> >   drivers/gpu/drm/xe/xe_device_types.h      |   4 +
> >   drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +
> >   drivers/gpu/drm/xe/xe_pci.c               |   2 +
> >   8 files changed, 223 insertions(+)
> >   create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
> >   create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
> >   create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index f6f3b491d162..d44794f99338 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -35,6 +35,7 @@ config DRM_XE
> >   	select DRM_TTM_HELPER
> >   	select DRM_SCHED
> >   	select MMU_NOTIFIER
> > +	select WANT_DEV_COREDUMP
> >   	help
> >   	  Experimental driver for Intel Xe series GPUs
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index ee4a95beec20..9d675f7c77aa 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -34,6 +34,7 @@ xe-y += xe_bb.o \
> >   	xe_bo.o \
> >   	xe_bo_evict.o \
> >   	xe_debugfs.o \
> > +	xe_devcoredump.o \
> >   	xe_device.o \
> >   	xe_dma_buf.o \
> >   	xe_engine.o \
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > new file mode 100644
> > index 000000000000..d9531183f03a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -0,0 +1,144 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#include "xe_devcoredump.h"
> > +#include "xe_devcoredump_types.h"
> > +
> > +#include <linux/devcoredump.h>
> > +#include <generated/utsrelease.h>
> > +
> > +#include "xe_engine.h"
> > +#include "xe_gt.h"
> > +
> > +/**
> > + * DOC: Xe device coredump
> > + *
> > + * Devices overview:
> > + * Xe uses dev_coredump infrastructure for exposing the crash errors in a
> > + * standardized way.
> > + * devcoredump exposes a temporary device under /sys/class/devcoredump/
> > + * which is linked with our card device directly.
> > + * The core dump can be accessed either from
> > + * /sys/class/drm/card<n>/device/devcoredump/ or from
> > + * /sys/class/devcoredump/devcd<m> where
> > + * /sys/class/devcoredump/devcd<m>/failing_device is a link to
> > + * /sys/class/drm/card<n>/device/.
> > + *
> > + * Snapshot at hang:
> > + * The 'data' file is printed with a drm_printer pointer at devcoredump read
> > + * time. For this reason, we need to take snapshots from when the hang has
> > + * happened, and not only when the user is reading the file. Otherwise the
> > + * information is outdated since the resets might have happened in between.
> > + *
> > + * 'First' failure snapshot:
> > + * In general, the first hang is the most critical one since the following hangs
> > + * can be a consequence of the initial hang. For this reason we only take the
> > + * snapshot of the 'first' failure and ignore subsequent calls of this function,
> > + * at least while the coredump device is alive. Dev_coredump has a delayed work
> > + * queue that will eventually delete the device and free all the dump
> > + * information. At this time we also clear the faulty_engine and allow the next
> > + * hang capture.
> > + */
> > +
> > +static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > +				   size_t count, void *data, size_t datalen)
> > +{
> > +	struct xe_devcoredump *coredump = data;
> > +	struct xe_devcoredump_snapshot *ss;
> > +	struct drm_printer p;
> > +	struct drm_print_iterator iter;
> > +	struct timespec64 ts;
> > +
> > +	iter.data = buffer;
> > +	iter.offset = 0;
> > +	iter.start = offset;
> > +	iter.remain = count;
> > +
> > +	mutex_lock(&coredump->lock);
> > +
> > +	ss = &coredump->snapshot;
> > +	p = drm_coredump_printer(&iter);
> > +
> > +	drm_printf(&p, "**** Xe Device Coredump ****\n");
> > +	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> > +	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> > +
> > +	ts = ktime_to_timespec64(ss->snapshot_time);
> > +	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > +	ts = ktime_to_timespec64(ss->boot_time);
> > +	drm_printf(&p, "Boot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > +	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
> > +	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > +
> > +	mutex_unlock(&coredump->lock);
> > +
> > +	return count - iter.remain;
> > +}
> > +
> > +static void xe_devcoredump_free(void *data)
> > +{
> > +	struct xe_devcoredump *coredump = data;
> > +	struct xe_device *xe = container_of(coredump, struct xe_device,
> > +					    devcoredump);
> > +	mutex_lock(&coredump->lock);
> > +
> > +	coredump->faulty_engine = NULL;
> > +	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
> > +
> > +	mutex_unlock(&coredump->lock);
> > +}
> > +
> > +static void devcoredump_snapshot(struct xe_devcoredump *coredump)
> > +{
> > +	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> > +
> > +	lockdep_assert_held(&coredump->lock);
> > +	ss->snapshot_time = ktime_get_real();
> > +	ss->boot_time = ktime_get_boottime();
> > +}
> > +
> > +/**
> > + * xe_devcoredump - Take the required snapshots and initialize coredump device.
> > + * @e: The faulty xe_engine, where the issue was detected.
> > + *
> > + * This function should be called at the crash time. It is skipped if we still
> > + * have the core dump device available with the information of the 'first'
> > + * snapshot.
> > + */
> > +void xe_devcoredump(struct xe_engine *e)
> > +{
> > +	struct xe_device *xe = gt_to_xe(e->gt);
> > +	struct xe_devcoredump *coredump = &xe->devcoredump;
> 
> For !long running engines, this is the dma-fence signalling critical path,
> and since the drm_scheduler has not yet been properly annotated, we should
> probably annotate that here, to avoid seeing strange deadlocks during
> coredumps....
> 
> /Thomas
>

+1

Matt
 
> 
> 
> > +
> > +	mutex_lock(&coredump->lock);
> > +	if (coredump->faulty_engine) {
> > +		drm_dbg(&xe->drm, "Multiple hangs are occuring, but only the first snapshot was taken\n");
> > +		mutex_unlock(&coredump->lock);
> > +		return;
> > +	}
> > +	coredump->faulty_engine = e;
> > +	devcoredump_snapshot(coredump);
> > +	mutex_unlock(&coredump->lock);
> > +
> > +	drm_info(&xe->drm, "Xe device coredump has been created\n");
> > +	drm_info(&xe->drm, "Check your /sys/class/drm/card<n>/device/devcoredump/data\n");
> > +
> > +	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
> > +		      xe_devcoredump_read, xe_devcoredump_free);
> > +}
> > +
> > +/**
> > + * xe_devcoredump_init - Initialize xe_devcoredump.
> > + * @xe: Xe device.
> > + *
> > + * This function should be called at the probe so the mutex lock can be
> > + * initialized.
> > + */
> > +void xe_devcoredump_init(struct xe_device *xe)
> > +{
> > +	struct xe_devcoredump *coredump = &xe->devcoredump;
> > +
> > +	mutex_init(&coredump->lock);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> > new file mode 100644
> > index 000000000000..30941d2e554b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> > @@ -0,0 +1,22 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_DEVCOREDUMP_H_
> > +#define _XE_DEVCOREDUMP_H_
> > +
> > +struct xe_device;
> > +struct xe_engine;
> > +
> > +void xe_devcoredump_init(struct xe_device *xe);
> > +
> > +#ifdef CONFIG_DEV_COREDUMP
> > +void xe_devcoredump(struct xe_engine *e);
> > +#else
> > +static inline void xe_devcoredump(struct xe_engine *e)
> > +{
> > +}
> > +#endif
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > new file mode 100644
> > index 000000000000..3f395fa9104e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > @@ -0,0 +1,47 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_DEVCOREDUMP_TYPES_H_
> > +#define _XE_DEVCOREDUMP_TYPES_H_
> > +
> > +#include <linux/ktime.h>
> > +#include <linux/mutex.h>
> > +
> > +struct xe_device;
> > +
> > +/**
> > + * struct xe_devcoredump_snapshot - Crash snapshot
> > + *
> > + * This struct contains all the useful information quickly captured at the time
> > + * of the crash. So, any subsequent reads of the coredump points to a data that
> > + * shows the state of the GPU of when the issue has happened.
> > + */
> > +struct xe_devcoredump_snapshot {
> > +	/** @snapshot_time:  Time of this capture. */
> > +	ktime_t snapshot_time;
> > +	/** @boot_time:  Relative boot time so the uptime can be calculated. */
> > +	ktime_t boot_time;
> > +};
> > +
> > +/**
> > + * struct xe_devcoredump - Xe devcoredump main structure
> > + *
> > + * This struct represents the live and active dev_coredump node.
> > + * It is created/populated at the time of a crash/error. Then it
> > + * is read later when user access the device coredump data file
> > + * for reading the information.
> > + */
> > +struct xe_devcoredump {
> > +	/** @xe: Xe device. */
> > +	struct xe_device *xe;
> > +	/** @falty_engine: Engine where the crash/error happened. */
> > +	struct xe_engine *faulty_engine;
> > +	/** @lock: Protects data from races between capture and read out. */
> > +	struct mutex lock;
> > +	/** @snapshot: Snapshot is captured at time of the first crash */
> > +	struct xe_devcoredump_snapshot snapshot;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 1cb404e48aaa..2a0995824692 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -12,6 +12,7 @@
> >   #include <drm/drm_file.h>
> >   #include <drm/ttm/ttm_device.h>
> > +#include "xe_devcoredump_types.h"
> >   #include "xe_gt_types.h"
> >   #include "xe_platform_types.h"
> >   #include "xe_step_types.h"
> > @@ -55,6 +56,9 @@ struct xe_device {
> >   	/** @drm: drm device */
> >   	struct drm_device drm;
> > +	/** @devcoredump: device coredump */
> > +	struct xe_devcoredump devcoredump;
> > +
> >   	/** @info: device info */
> >   	struct intel_device_info {
> >   		/** @graphics_name: graphics IP name */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index e857013070b9..231fb4145297 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -14,6 +14,7 @@
> >   #include <drm/drm_managed.h>
> >   #include "regs/xe_lrc_layout.h"
> > +#include "xe_devcoredump.h"
> >   #include "xe_device.h"
> >   #include "xe_engine.h"
> >   #include "xe_force_wake.h"
> > @@ -800,6 +801,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
> >   			 xe_sched_job_seqno(job), e->guc->id, e->flags);
> >   		simple_error_capture(e);
> > +		xe_devcoredump(e);
> >   	} else {
> >   		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u, guc_id=%d, flags=0x%lx",
> >   			 xe_sched_job_seqno(job), e->guc->id, e->flags);
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index e512e8b69831..1d496210b580 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -16,6 +16,7 @@
> >   #include "regs/xe_regs.h"
> >   #include "regs/xe_gt_regs.h"
> > +#include "xe_devcoredump.h"
> >   #include "xe_device.h"
> >   #include "xe_display.h"
> >   #include "xe_drv.h"
> > @@ -657,6 +658,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >   		return err;
> >   	}
> > +	xe_devcoredump_init(xe);
> >   	xe_pm_runtime_init(xe);
> >   	return 0;
