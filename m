Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D22D6D633A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97EA10E66F;
	Tue,  4 Apr 2023 13:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2142D10E552;
 Tue,  4 Apr 2023 13:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680615484; x=1712151484;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=in+8Lf1j+E0bcwzelsWHot+x7nCpV/gwePvperEZLtM=;
 b=ZjEXwRK/EUcOcxBys2BdcYrGZG4I+kMfs9OktLQHxEPg4xISs3+Z5GhF
 tRR3tw9VVFBjyE6W6+17zmPlT6w1x2Fd1W2xpc1SD0+A77JEM4niPXlCq
 9Ca1wW3QIrna0Vnn8n2g1+G3NZAaO7OsmZy+xQv32uj2hi0gqDoAu5hTk
 ZL5PmfH9AMeP3kX3z/xw+nb/qm2vT8GEHTHM6TawAx2Gmv/aam2hLrVTM
 qENA6YFan97fGsfBnH5KuhGbm4eKAcWXIZ/zHT+iU17RwOcetEelm00LR
 rTCJnGDkz8GeMGA6ee/hCVXoWT14kl8A5byByifqxluOcsKdvgaR+bYnO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370000337"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="370000337"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 06:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="663593815"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="663593815"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 04 Apr 2023 06:38:00 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 06:38:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 06:38:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 06:37:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSfK43bsyYquHbSgZLcvTWFNBdmNLa7INk3SSN8lP9JFitAKUvrx0YZn7KwCOsin+giu874dyZ6XmUBk3wY2nGTjvIFplOHq4W6fcxJhbhrj9yH3MGD/zKlS4crT51IO0WcsdsRhbbQtAz8UR1CKxOVPBxDvy4tf5n3AuEnexfv6nnRJRem41bdHsFuXSJb11hRFV7mxFwy1w5VFD9NAjI36dC9uW5T5rUyYWdCAT8YiZhIJlZcPOhXQw9p0LukAqLbiCo+eZ6OpBPXSGkCWaXFlMAvlN+thHs2pwslYqu0Bo6d7XgafehPEwkaw/SKkakU9HaIFLefp2kWV/i9aZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaL5hElxfBKxutabulyvhM+oJzGFsrSra6rhrt0qjNw=;
 b=XrB7PBxVt+cztIFKMpPGnZUEJTg9O4NQNWLD9VWYFhvv5bYqQXjvSpvnZr6NhDUp+UgEVWkQQ4XP9l6dJVU426YnWS7nDbSKW1AYANjP5tWBl5hJPmN0VE+gcFNbNJFWX7G7qRPieqxtD2rhuld29efxRH2IdLVzNvWIPGbBlVEpnli41XTMikucvxpM2RMH0+rTgLNe2bEz9ENOqrZ8+WWTR+ijWMzyCUNer0TW5PmiX/xR5ntg84d7ufm0xNDRU4F0rmcq8477BK2CAJn6aYZN7dJwjlXpSdUEpZGmn3aAKN9krA2gZvgpoZ8EiSqts+ohC23n7Qk/kZ+njp1HLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.24; Tue, 4 Apr
 2023 13:37:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 13:37:57 +0000
Date: Tue, 4 Apr 2023 13:37:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZCwoL3Wgv90tlQWR@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <87c7f659-387c-3e23-69c6-03e0c9820bab@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87c7f659-387c-3e23-69c6-03e0c9820bab@amd.com>
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: fb84eb85-9c00-4c79-94e7-08db3511cceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGdlBqFF9k6w0e/n6l275/JCh9D+6fpGpcY3yqptYOMIuSETBV0EYi9Yo3BUCSfA5OVq/kYzocv8Vur6uIfMXvFMiIRcrzG/mDJqFcRDBsAkMPKCxBLDHUNBLnFmwTqHFJoJ1cPR9HbbTk2nwFg9g9OXrEtgrU1RO+Fd3LK9AQWrlfQDSGpcjvhDN0bGvjLr3m3TobQAPc77uze8vonD9ovAapT4c90Y2fDqRP5nQ3YexusghLnP4j0if34/nngUQzljb+bUwsxzQhc+/FImgUx7UdQTuQKZ0KFxJGaCxfYP2oAXOQEPPfTqkmL0Q7+zSGayfcBmScxxkkDoXRRvop+OFO7nAAoKywizSGUFgFIqxjFnj8hYumBa3rStI736CbCsB9XVhfPSUKdgGVXrppPAsv2pz5uhGzZno22u1lxznc6Fqy+N5xiifZBWbEyamslJLS3MOnDJDoamE0HJTNZg9HY2Y+ddgxRHAEPqp1YzDghAvVHxgHKb4LA7rJYyPyrOMR9g7wBrBN3BGwKMrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199021)(41300700001)(5660300002)(2906002)(8936002)(66556008)(6916009)(66946007)(8676002)(66476007)(4326008)(38100700002)(44832011)(66899021)(6666004)(86362001)(82960400001)(966005)(478600001)(316002)(26005)(6512007)(186003)(6506007)(66574015)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b0XRzapBWSjpWc/ZAkUg8bk+Y34L6cpaJDAycTc3eHowtFgqGGkWTzbMzt?=
 =?iso-8859-1?Q?qUXpQ/DTZI80GNZH26rF3TAt5dM4+YtIbXPYygV02UTHhMNX0ebWJQlg2m?=
 =?iso-8859-1?Q?UaxqDxlGZwxiQCsu9NVClSll7ems0Z9MWVJEswJVH9KdgZlJwVi9866FPz?=
 =?iso-8859-1?Q?kTdLhJxkC5edpVL80u6RPyWgl72KFzRpSPYJJiQhB6u8wLcTIUkxv6fi6g?=
 =?iso-8859-1?Q?H4jCs7FZSlYHYO6tMCkQ0qXZ1qAy3AYTFOQNs5vagZ8r6fY/7B8wxy4eNL?=
 =?iso-8859-1?Q?9vsh/U0k3oVqTDJpU4V+KYxmiaKNgfoYwYjzUiHeU0W8PtZY3BmoQSrtTt?=
 =?iso-8859-1?Q?H3m4LOtcT6N9o67SjEl3mnynNs8QtrgBLkIB8F0jjuWu4UBZyBpWbGqnUK?=
 =?iso-8859-1?Q?NdbjdqClZC6zQk6jptTXNuy3odHCIOL/OWnYr1qOWAc9QyyGqRIravOdOH?=
 =?iso-8859-1?Q?H1WxQOY+kwAlEJFmP/Aa9k0asr9anOJFT4LoXpV7mw6rS0/0d9kKha1LS1?=
 =?iso-8859-1?Q?9OLwUuHNAkVAr1Q7XinUyJ+1BYZ7ZIRY97wseK4m62spOKuyKEYwYp3CMD?=
 =?iso-8859-1?Q?ctIpN8zV7vSl5i5zcFgl4EdZ1mDJ5r5i47ODNu4Y69Z+sUEA6lxFtYj3N+?=
 =?iso-8859-1?Q?6mAEDILpYDDEUBS3v4jWbanNav4cg2d4JHkeJM+NKJuCbGksvPvUCh9igC?=
 =?iso-8859-1?Q?NLuc9JUs5adk7szNUzZ2DGUMte4Tonp68fC4KoHnIq3ZECWAOX6gG3p7/l?=
 =?iso-8859-1?Q?Y882tGD4nPLHlclcyQWDaFig0jMaUZ5zTsq+Dnb30JZNYcgByCzwh5z3oW?=
 =?iso-8859-1?Q?UHvtjMNQjFP4RIT3hsmT0TB+8jnZQ4ZOo5NbzdvspUBs0P3WCHQD5di8jc?=
 =?iso-8859-1?Q?tI0VpR7bqPu/Mupu7OdwXPXqaqeVNwcuZ9MHOueo5KAPONtJMSWbO+tFFK?=
 =?iso-8859-1?Q?H+dr8sHpcfcHJN1GZY3H+o8WPB5zIvD0Y6tIRl887v8PfpCfQqzd+wEMel?=
 =?iso-8859-1?Q?fzHSq5k9r14InAhJLZStSHsgjmQ5xfRIvQ2TMbslqc5FPHCOdQ0EisNRQy?=
 =?iso-8859-1?Q?ELmQIh0mwC9NT1HDqdBgOMmnUlQNn9nNGKR9wOh2hfIlPhV4fyppUM8FYR?=
 =?iso-8859-1?Q?nSH0JgB5HkhgBmfc7VlG0HhKmYVJlHmINdSg2rqo/QArrEfPTM5H7jNm+1?=
 =?iso-8859-1?Q?JXSSWN+i58MQBJYvWIycoI0seL5RScZ7L/+hzyDzvqqUtpZSgKGtZ9oh0M?=
 =?iso-8859-1?Q?maFOyIjyFB7A5xUrC/EU4caF7dKFL/s+JXBzPXOnBKhQxc+cOYKiwVOdFU?=
 =?iso-8859-1?Q?S5XMsxFDhGlK48V+4ibDOS+eg8rUGdMG3m4jk8/g0vsQoNLVDqqNNMys+2?=
 =?iso-8859-1?Q?IQ+W2NWzw8u7DEe6qT0tEJQPun+PFGcJelsvEJzO3RV/ZIwiXLCmhXPpUD?=
 =?iso-8859-1?Q?n/F6uz7pzoZRDd/37/8/GkPiUNZ/C1FtcmPfxMoAUqw71qGNm0bzsknu2B?=
 =?iso-8859-1?Q?QFmGeQ3DWCgi2YTWEfaecns/REqaJn2VwkiyaeI1nuJChsIcRuhvU1GLpV?=
 =?iso-8859-1?Q?pqQesU02Rk9YO+RXIF2yuoSe6Pj+BEhVfRLz+4zQRCDyf6+1yZ7aNcPrhq?=
 =?iso-8859-1?Q?+Jww9AjPx3uMRIk/H2en/9v3zs9UPQFUwLa9/FjgpPMRh6LZDSKkFYhg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb84eb85-9c00-4c79-94e7-08db3511cceb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 13:37:57.3701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6OPQg1jHb4T+uvD957emTbQPwdCDVI0w2NytP0rQnaEF6P9mcuMhL5rx1oMeYFbnvxPJGE3YcjaZRtcPm2a4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, dri-devel@lists.freedesktop.org,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 11:13:28AM +0200, Christian König wrote:
> Hi,
> 
> Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > Hello,
> > 
> > As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> > have been asked to merge our common DRM scheduler patches first as well
> > as develop a common solution for long running workloads with the DRM
> > scheduler. This RFC series is our first attempt at doing this. We
> > welcome any and all feedback.
> > 
> > This can we thought of as 4 parts detailed below.
> > 
> > - DRM scheduler changes for 1 to 1 relationship between scheduler and
> > entity (patches 1-3)
> > 
> > In Xe all of the scheduling of jobs is done by a firmware scheduler (the
> > GuC) which is a new paradigm WRT to the DRM scheduler and presents
> > severals problems as the DRM was originally designed to schedule jobs on
> > hardware queues. The main problem being that DRM scheduler expects the
> > submission order of jobs to be the completion order of jobs even across
> > multiple entities. This assumption falls apart with a firmware scheduler
> > as a firmware scheduler has no concept of jobs and jobs can complete out
> > of order. A novel solution for was originally thought of by Faith during
> > the initial prototype of Xe, create a 1 to 1 relationship between scheduler
> > and entity. I believe the AGX driver [3] is using this approach and
> > Boris may use approach as well for the Mali driver [4].
> > 
> > To support a 1 to 1 relationship we move the main execution function
> > from a kthread to a work queue and add a new scheduling mode which
> > bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> > The new scheduling mode should unify all drivers usage with a 1 to 1
> > relationship and can be thought of as using scheduler as a dependency /
> > infligt job tracker rather than a true scheduler.
> > 
> > - Generic messaging interface for DRM scheduler
> > 
> > Idea is to be able to communicate to the submission backend with in band
> > (relative to main execution function) messages. Messages are backend
> > defined and flexable enough for any use case. In Xe we use these
> > messages to clean up entites, set properties for entites, and suspend /
> > resume execution of an entity [5]. I suspect other driver can leverage
> > this messaging concept too as it a convenient way to avoid races in the
> > backend.
> 
> Oh, please absolutely *don't* do this.
> 
> This is basically the design which makes a bunch of stuff so horrible broken
> on Windows.
> 
> I can explain it in more detail if necessary, but I strongly recommend to
> not go down this path.
> 

I'm afraid we are going to have to discuss this further. Let me explain
my reasoning, basically the idea is to have a single main entry point to
backend - the work queue. This avoids the need for lock between run_job
and any message that changes an entites state, also it really helps
during the reset flows (either TDR or GT reset) as we can call
drm_sched_run_wq_stop can ensure that nothing else is in the backend
changing an entity state. It all works out really nicely actually, our
GuC backend is incredibly stable (hasn't really had a bug pop in about a
year) and way simpler than what we did in the i915. I think the simplity
to largely due to this design of limiting the entry points.

I personally don't see how this a poor design, limiting entry points
absolutely makes sense to me, if it didn't why not just call cleanup_job
bypassing the main execution thread (now worker), this is the exact same
concept.

FWIW Asahi liked the idea as well and think it could be useful for AGX.
Matt

> Regards,
> Christian.
> 
> > 
> > - Support for using TDR for all error paths of a scheduler / entity
> > 
> > Fix a few races / bugs, add function to dynamically set the TDR timeout.
> > 
> > - Annotate dma-fences for long running workloads.
> > 
> > The idea here is to use dma-fences only as sync points within the
> > scheduler and never export them for long running workloads. By
> > annotating these fences as long running we ensure that these dma-fences
> > are never used in a way that breaks the dma-fence rules. A benefit of
> > thus approach is the scheduler can still safely flow control the
> > execution ring buffer via the job limit without breaking the dma-fence
> > rules.
> > 
> > Again this a first draft and looking forward to feedback.
> > 
> > Enjoy - Matt
> > 
> > [1] https://gitlab.freedesktop.org/drm/xe/kernel
> > [2] https://patchwork.freedesktop.org/series/112188/
> > [3] https://patchwork.freedesktop.org/series/114772/
> > [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
> > [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
> > 
> > Matthew Brost (8):
> >    drm/sched: Convert drm scheduler to use a work queue rather than
> >      kthread
> >    drm/sched: Move schedule policy to scheduler / entity
> >    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
> >    drm/sched: Add generic scheduler message interface
> >    drm/sched: Start run wq before TDR in drm_sched_start
> >    drm/sched: Submit job before starting TDR
> >    drm/sched: Add helper to set TDR timeout
> >    drm/syncobj: Warn on long running dma-fences
> > 
> > Thomas Hellström (2):
> >    dma-buf/dma-fence: Introduce long-running completion fences
> >    drm/sched: Support long-running sched entities
> > 
> >   drivers/dma-buf/dma-fence.c                 | 142 +++++++---
> >   drivers/dma-buf/dma-resv.c                  |   5 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
> >   drivers/gpu/drm/drm_syncobj.c               |   5 +-
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
> >   drivers/gpu/drm/lima/lima_sched.c           |   5 +-
> >   drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
> >   drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
> >   drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
> >   drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
> >   drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
> >   drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
> >   include/drm/gpu_scheduler.h                 | 130 +++++++--
> >   include/linux/dma-fence.h                   |  60 ++++-
> >   16 files changed, 649 insertions(+), 184 deletions(-)
> > 
> 
