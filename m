Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFA47A0BFD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 19:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0B610E2A5;
	Thu, 14 Sep 2023 17:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1458310E2A1;
 Thu, 14 Sep 2023 17:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694713803; x=1726249803;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h3w44W0wbXlgdEnTz1PLM0MPZFVctwiiHbPTViE+bBg=;
 b=EeIzKvBbiORr4uAej/wYobylt7xuUGOHHqoE4M6luHJ6mrqxBxzj3pTp
 MpERGIEPwWuewVujBMGGXB/O2PwywjqgJdDFSjHAZO4uCarF3R3nuEWAI
 e4rAkPhDN8gHmG587hIVkETPhdkWoxg89ou6SnZ8NIOBuE8kwtQZ2cQMo
 B1x6YMpSqZtvoko5rkL9tMs3kLxfQrcVX62ZMokbR+2hHU4HrGptMrJaP
 JnQo//Cw1Lv27eE4gEhlrLqub7fbAH7Lml+kYRHcpr/Dfxb+O2wExY+jU
 AOBxEm4ImO446u7h6H2xgU64JJj67/9hdFCFRnHRhOkaAcJq/dFX61MbR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="364077125"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="364077125"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 10:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="814809227"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="814809227"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 10:49:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 10:49:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 10:49:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 10:49:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2NNyC3Cl0xP19/Adl1s1ChEyWGDjMNlXi4/+LhGQZDGELVVuwMtGVG1csh09B0h/4J5/cwNZCx8R9uGTWyxvp0aAHDMktiB4323zph/1g3UWeSWg8+zyiZ0G8PxLBvRnWORO0Qxubap4t/zPrp9UeNnue4mz3NfxaUcYyX9wpBcG8G0t3bnzocK+kQWyrICSJk4UyzCcRivSyugx2XnXH8s3FG79Mchg8DjZKOZa3Y9SchoksxKuf+mZxaxCOK895wIvM0JVu+B5yKwANWLMJnXHcAWEnMb+qg65u0xonK8eyPWn0TJcAhTxPLUxiYZX0SeBAzNA2bkISXWPH9sAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPe+RBNS5F/niXLqTliANFoceiPtbO7RuLI7VcdhOF8=;
 b=Nt3Nq+aGRGfyOAT0BmqV6zS36lppjMomY4FmKXNWwB2A/mSUHjgBEIPcIomvj88Kcuw5ZwA0lLrctGPhuNZyzCXzBzBglnj9nNxdv638bz6KohqyHsu669BJOQ8W0sOcRYOLR1ldH7re74RlvRtP35zipJ/18O3SExqg/AahbghwqAEvbJQMxuO/XuZ9Gksn67aHc6mYyZzirkYGKLP7emzGKWD8haIV3iAcgakW1YYYVKj9mRvmQusvwdG91MQizPjAppMjwnV/8hEsXBGz2X3+1BwjZf1/pXoOxOcoxpmeMwPI5X3eVHbCjqpbOje7QTnQ2uUoQPfIVeEkQ5If0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7152.namprd11.prod.outlook.com (2603:10b6:303:222::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Thu, 14 Sep
 2023 17:49:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 17:49:27 +0000
Date: Thu, 14 Sep 2023 17:48:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v3 09/13] drm/sched: Submit job before starting TDR
Message-ID: <ZQNHZm4HPeyPBPMQ@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-10-matthew.brost@intel.com>
 <ed3aca10-8a9f-4698-92f4-21558fa6cfe3@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ed3aca10-8a9f-4698-92f4-21558fa6cfe3@amd.com>
X-ClientProxiedBy: SJ0PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a1d6acd-0044-47a1-d717-08dbb54af0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: knVucIsD6sgtas9UTXNO2dqrvN8GgONIXeCagTtYHQOuFyNKHEaD4pbPnwKV2dDqZr7fOxAI+CfnM/Nu1DM97bWgnBcgMMqW2FGKtn0Zs8AU3odG6bYAYth/mfKSi3EL1Dmg440ckhKWOZ/y2ZpbXnRLXp+hahuukI/0VLB1pcxBgwpeopvZL8ZH95PNdPWvWsEiC98VzrxIM9lLJ8q4nJmFLMMDmG69sPnx/6QikCh0zqh9cwJgDUXi0M6dyR1p8eDRknZSTDyPxCe4PA4Qrbg3zEhBzQ2oeJ4nizO+08rYHfr0lQy9M+lkBoA3+PqdN2onglZKkMbNUC847hS8KpEDYiUmHlmH35+v3fkPyqZ3xntc8EMIln+sxyYOZ1IMDGNDthDx/VpnMbZM+REiXYkROp26Vm+CBd+EEFbnL6LLa43zg3GJ6xphRxK8qowoW9vrPcXyXC+Ht96Htc+rViEDsL3bhBtaXfYPR1Oyg+b6wkuCmc0s253rH3fcqwPtXKdvlsZJMJ8Kq4yrt5TQ8Nn+ld24n4J2eD1iRkp7X+azfa9C0+vphiTveUZPfHzb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199024)(186009)(1800799009)(26005)(8676002)(4326008)(8936002)(5660300002)(83380400001)(44832011)(6512007)(6916009)(7416002)(53546011)(66476007)(41300700001)(6506007)(6486002)(66946007)(38100700002)(6666004)(82960400001)(316002)(66556008)(2906002)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0eWQ6OBz7N4Ek/OkU5NbhorczsWSg5PQpiqQ7c4foejdikVNVuknfrQiJ9Q7?=
 =?us-ascii?Q?8sAI3awLZ9mg6ppR6yCfTiSXN2Ewa+jUG7dojWhXQhp71B5/6GkdxLLahkIc?=
 =?us-ascii?Q?rBAZBePBA8TKoXCDUYCshaddtHAbaLYDge2avcW80YJodk4cEja+TqHWGA+W?=
 =?us-ascii?Q?t+37UEWA16WgKzDcIcvS53/GmQEO9TC8sbe3oq2gRieNtta6v8r38G7uDv5P?=
 =?us-ascii?Q?cXAPmrDxvL3Ek9G9HUmm1JKExeIHDPiNCGSfG8IdM1Qgngy00T8C/ub4rPxm?=
 =?us-ascii?Q?gGxJtyQWDCEfLhpRy/Cf4W4Hw6CG2QYjoNG+3E3jhIrR2Mrpdc0Lkq8/veJp?=
 =?us-ascii?Q?/Ct1wzZDkTnn9ybJRh9j3nIwruJm1IGXQjt5bDH51vSHE124b7VWicLVbOXG?=
 =?us-ascii?Q?deOlJHEgZTMCyzz4ANnLVyxvqmzeYbQTsIsDN37cJTijNzg5C42F9QrfapvY?=
 =?us-ascii?Q?SixdB4XUaJyUwlzBDc+oyLKsqlxcnldF6dCMwiAnS+vpC/R/oGQPB56RS1s2?=
 =?us-ascii?Q?EteFnkMwlZ72omHm8lf3BfhvxmglUVyItZCb/ETeoCSfOEmW+BbV7SW7608X?=
 =?us-ascii?Q?Gccv7e23HpVgsO7SSitFBO1YDajK9P8FLOpkXI/AiMwrKMwVI6RMBp3WEQ+S?=
 =?us-ascii?Q?3EBemvhInpWjYpfUm0FNWLHeW5MkGsUb+pvhDRNO+Bdy808tMgtzxrrSA4px?=
 =?us-ascii?Q?5HopEtO0hQ30wjldkyEayHpoUhrjku7kgXxIs8yH8yiK8WV64HeleOu9T03d?=
 =?us-ascii?Q?/+i91cyUnbK9wX2eYBTBU3lmtbySmCiHI8tkFKDwcDDz80fzWQ4BzFL4ZYzV?=
 =?us-ascii?Q?HRbvYDMPTUcx1vdD25oMVMnHb8w3YJVhmZQSsspkvHStG3/NlVu0yFYxSYYD?=
 =?us-ascii?Q?Fv8gFmjt1bCUe7wG4YvtXJASYA1tkY9TX0Xlta5txCV0rLPmtbo7u7FJsO+t?=
 =?us-ascii?Q?O+FTSCIESEmkTE4jFU9bWO9DyYU8BdGkOUnp3oE+BAYzqGeSsOim8C/8Wu8x?=
 =?us-ascii?Q?Zhyi2C++IEC4ZkiEVmxTowzPQP1iXdpF4cW6tL0U9zWMP6AIJ3qoGWFp0WDg?=
 =?us-ascii?Q?/vfcDGHxKPc33BPNcr87KomNGBRo2ZC95V8J15c5z9WkZiocCt9jwl4mad73?=
 =?us-ascii?Q?LHcSUlXAY7nGNRgHuBFeONUnuZWwcoUWowxBFK9YjaGwE9lDYxmnPcyKGLc6?=
 =?us-ascii?Q?4gZnGEzkMwRAu2M1jR6oGwj4bbw17XXZY6qoWdemxus8B5P6dBkvUo/CsADh?=
 =?us-ascii?Q?ccB2xOwS4+9/R8+8NP06Rk7hAVOFm0TtlHGC6g8PdR4fmaDkNyw7c2Y8Mz6Z?=
 =?us-ascii?Q?wDEq8wOJ9S/QlmTkLUKdExBGP3jKQlIVJJ2IHX/fGRDwH13ts6utzwNcaLYI?=
 =?us-ascii?Q?+31ceQl6Uu7ib8fiqGCTyPnQgq4puaQSHPE4juDfT9/cNXbBnXAwHCAfPc5z?=
 =?us-ascii?Q?cPtwcs2w+Q58hCv3EgrDASldGPgrcxqJKkrWeLRXQ7fgeZYp5+aIFCPf/j6r?=
 =?us-ascii?Q?H8Z0Ja5/yS1iJLV3LlgLFV92UCmZCS1CydFGU/fLS0PLa0qEDDNFifffsACy?=
 =?us-ascii?Q?i89HbccFX9fg7NroMG8gYZkjvqOp21MmwfJ8VGgeFF6xRVv2f+YOsPoq1/pX?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1d6acd-0044-47a1-d717-08dbb54af0a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 17:49:27.4394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zK5lWg5La8q0x0a1AvR7NASO38JJo5PvPuJC14BFBmj+T9S2v0T3imjFqGXNG5Wq/mGoYRc5fwxHLQP7llIC0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7152
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, donald.robson@imgtec.com, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 13, 2023 at 10:56:10PM -0400, Luben Tuikov wrote:
> On 2023-09-11 22:16, Matthew Brost wrote:
> > If the TDR is set to a value, it can fire before a job is submitted in
> > drm_sched_main. The job should be always be submitted before the TDR
> > fires, fix this ordering.
> > 
> > v2:
> >   - Add to pending list before run_job, start TDR after (Luben, Boris)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index c627d3e6494a..9dbfab7be2c6 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -498,7 +498,6 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
> >  
> >  	spin_lock(&sched->job_list_lock);
> >  	list_add_tail(&s_job->list, &sched->pending_list);
> > -	drm_sched_start_timeout(sched);
> >  	spin_unlock(&sched->job_list_lock);
> >  }
> >  
> > @@ -1234,6 +1233,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
> >  		fence = sched->ops->run_job(sched_job);
> >  		complete_all(&entity->entity_idle);
> >  		drm_sched_fence_scheduled(s_fence, fence);
> > +		drm_sched_start_timeout_unlocked(sched);
> >  
> >  		if (!IS_ERR_OR_NULL(fence)) {
> >  			/* Drop for original kref_init of the fence */
> 
> So, sched->ops->run_job(), is a "job inflection point" from the point of view of
> the DRM scheduler. After that call, DRM has relinquished control of the job to the
> firmware/hardware.
> 
> Putting the job in the pending list, before submitting it to down to the firmware/hardware,
> goes along with starting a timeout timer for the job. The timeout always includes
> time for the firmware/hardware to get it prepped, as well as time for the actual
> execution of the job (task). Thus, we want to do this:
> 	1. Put the job in pending list. "Pending list" means "pends in hardware".
> 	2. Start a timeout timer for the job.
> 	3. Start executing the job/task. This usually involves giving it to firmware/hardware,
> 	   i.e. ownership of the job/task changes to another domain. In our case this is accomplished
> 	   by calling sched->ops->run_job().
> Perhaps move drm_sched_start_timeout() closer to sched->ops->run_job() from above and/or increase
> the timeout value?

I disagree. It is clear race if the timeout starts before run_job() that
the TDR can fire before run_job() is called. The entire point of this
patch is to seal this race by starting the TDR after run_job() is
called.

Matt

> -- 
> Regards,
> Luben
> 
