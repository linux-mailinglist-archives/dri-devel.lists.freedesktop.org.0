Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5729C686A6B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 16:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC5010E40F;
	Wed,  1 Feb 2023 15:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3428A10E40F;
 Wed,  1 Feb 2023 15:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675265573; x=1706801573;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3r//c4+5Sjd+iJEFNT1BbOtIs1xQHUtwkX0mdbGf9bo=;
 b=ZM3BinKrUIuE9SPXYx3nsX4B1DRnKJ0SeBKU6KqzSnSJsVmk7M/wBRqB
 IhZNVzIA2xypQ2TAZ3c4kEdtlnR0AMqn2CjLdtuASM8Bjpd1pMk2ZI1xH
 YjuSWgC9zT1Wvy6bN5eDKngsrnwnGUG1xRfzTQnOymGOk68pPq4vyzk1w
 uQ7SWHuGDJoL0zqkf5he3Ez9xLJieSDgMLx9OkSYd/E4X21VcKg16U39P
 vIXNMxyrxbQculFYiHfG1K2tTstPzvwqVrPqGlikFepTTBXXRCzmD3qrF
 EIb+gYduWlvKSTNNz51DLwEec2XfPBUeY5CyKPum+DcB5rtqDgLmS+PJZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414381398"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="414381398"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 07:31:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="910350519"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="910350519"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2023 07:31:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 07:31:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 07:31:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 1 Feb 2023 07:31:35 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Feb 2023 07:31:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1bFDHPKW637D6ZPmC2XGUQqB6/DBAv/ll/Ud+FNHyJUyNOJ6CRwhucDneRCYlrEB1YrE6bz5ax1cQW+h/yekb2yQ7GbW/Hjtymnr9OdhYO27stjSxm20oBcNljWmtiC6llGlEwt40TfJwmXmwTcMKY0Ih1D1Ki/bNW9TmDqpd3DvaQPrcIEEDRNIkdkzv2HzXIbYgXdsEPN7ATWr6L7D5iXECdjlFSih1SyFY9lQOaXKT0JcVhsIHiJo+ulUgbvZt+NNCQpeFaDtkBUR6hYoPKw8zr9TOsUAACdn+9e8dEhz2FLW+GL9z/bYrFLu4A/TUF65MCvTSUQATWcObLYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9nJrUobmTVI5lr3JhKoN0Mg3gPhOnIs2JnuVJzj3Kg=;
 b=kQ3T/0KMsOELZ4V5uICtw3UwPKl2hnbrKJYQFpjXQ0B1DZKYcZjEXVL2NphWz5uwk4CAnFp9buL0wKXffvsrIBvLnds/taQwD/ehUuA6c6cVp1j8R5s5z7tkqcqXLlLD9l6p+CjiHszE1MxKbfwSLmFjhzRyiPUKKQ/YHoZqdqG2yE2sfpK5xkTwKTos+eW7MehP4yd+nVVtGB4jiOkU3PamcKkcpcNEHqukZwR4HlVt9uDS7cnhg+VbMXqqbHpDFw79vAMy9ugQUor/IcMB4ShEy6vTZgg+HpsAcyUdFD2NAIDfkDOl0TnkxqxlXQPiAVLdGDB7FXq56E09p73pFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6333.namprd11.prod.outlook.com (2603:10b6:8:b4::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.24; Wed, 1 Feb 2023 15:31:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Wed, 1 Feb 2023
 15:31:31 +0000
Date: Wed, 1 Feb 2023 10:31:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the usb tree with the
 drm-intel-fixes tree
Message-ID: <Y9qFmmi2C20AFQB7@intel.com>
References: <20230131130305.019029ff@canb.auug.org.au>
 <Y9kNRVppj5Uxa9ub@smile.fi.intel.com>
 <9566dc52-2ff1-760d-c9cb-fdfef9278f05@intel.com>
 <20230201151113.22382269@oak.ozlabs.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230201151113.22382269@oak.ozlabs.ibm.com>
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b90b4d2-f6dc-4789-a77e-08db046964c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDYrOMeqi6Avk8D14Yc46U/W3Rc5chEf7oeNeJ2E0YilqgfR6TvFV/ONWYpoOfePvTvxY11DlcaXdpLJkwPcC6ostL9/YNIZ3u5Rox50hIFj9p3IXLsxNMrqb2ypiTZPh2MyiCbXNkyu8zGVARjtS8Yzod7r3LRGa1oUNTMsyEXfl3hoi+k5m5nAvV580iIwD3GeUaZ5ztydYZwnmPjf6peCKOv7Ou5xikRP3tUv0EBfji1cTaFNMTacTi57K0MzHLQzXjVObB73ZyYy96IjgcErz2z3Ghh6a66QL4AjVcmeCgiBb9t74NPcG4fqRSfwcvfxQ+6g3EjzfXWDWWzsJ2IKdFk8ddVazLUIPVPfkxQzFDd2BLS/6pcTfDYnu3KjFAXAE0jOGexAsT7PBMmsiHoANFivfEFwN6KdiscjTRILtUJNmMeWaesDm8WuBkcgn4xykg6G0SwsVbhSYpPDlVLJx+dV9LnrwfT5hChN9XePeDCdA/WSNeHp/Yresmr3hqIzr6afLgRYBwDsiwXm4BblJu0qXJRE1qlNA0Ez31lN30gnNzqirrcACfmXNA8b6oWXnXBGY/j3hk9jBgFIdxjVx5YhOQtAOUZecbzxVphe+y4CQzR91qnjGTh6BvBgc/VVWxFV4lQBw5dEtz21Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199018)(6512007)(186003)(26005)(82960400001)(2616005)(38100700002)(53546011)(6506007)(6666004)(2906002)(478600001)(6486002)(36756003)(7416002)(316002)(5660300002)(54906003)(8936002)(86362001)(44832011)(41300700001)(66476007)(66946007)(83380400001)(66556008)(6916009)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XKJV8SJ19mDFW+RrZyNrJY2wMpmfIzZwj2gHgev+LaC6up/TPNklmGWSKqOs?=
 =?us-ascii?Q?MKkBJDVri/QPf086fWOS931wxrPcPxEzAZ6V584JX+g4XsNL9xePVeUJK/4K?=
 =?us-ascii?Q?whrLkCvZXMOMRuseFst4XRZAT6w/QUtO9l1cQSo8BALdkuwE82ezA368V6nQ?=
 =?us-ascii?Q?gf3OmfAq2YL13TX+2bSarAUG/C4qTxeFY8GtZZqNPegf+7gcnqkIAkDLKPil?=
 =?us-ascii?Q?wSeV58Wi27U1uyRB6i3VoWeigoMYp4jkK+HJKdK44izMxIqyEe/m+ih/jyFG?=
 =?us-ascii?Q?FCcooYdmwXCyST2vy2ZyhRAm1G/ht7guF810lCFNWG7sLIcywvooTngV9FUE?=
 =?us-ascii?Q?Kc/nkjPR+nQDPNAvLxMoLZBUPCt/86Yx1QxTuKkqHGL9rcc7whOL2v3hiUfF?=
 =?us-ascii?Q?dRIgKtU9LN6nGoOrdmde16cy8eixY6zXUZYp7GTFRDroyGTZbtenCz5r48qi?=
 =?us-ascii?Q?aF7xidQq9HxiyK759aGaU9r9muQozbD7vXUoBSfdOSfYHGNIgvfBz2oHM71M?=
 =?us-ascii?Q?H8cRzclcEX1JXjE+zIIHtiWP6zLGf8Z+a2HerbfT+1KE9yy18GRY8k5CwxY+?=
 =?us-ascii?Q?ajtswxGxAiU1e2hkmWFJ8OEe4/i1+4rgegJKiNgSr6dlZA9FWmeuDeXm/Ht1?=
 =?us-ascii?Q?IeK+xzsUWdBGyzXCIiX0R7SmA6x4Jbtoda1cib63NEPROap9WtYGBh7CvzWC?=
 =?us-ascii?Q?RB/BFZ0cEsTki0uDbsyspsC0xjS7E6SByXuGBkbv/TuVKzE2UPV4R6UUKL9w?=
 =?us-ascii?Q?C7qzRWc15oGjIyyQv/OxaJjv5tKhpXPmzjjrFwrD5+c0+y4fufD0b4OTZ/XJ?=
 =?us-ascii?Q?1okDlnu7NCWCDw2GyFGK3nV0/Lc4JhCGQlSRXrhzCioH34QD5LDd6QGKHdd7?=
 =?us-ascii?Q?2EpgW0yfDcQDKj/tMucRucX3053t7MIf14M0tHxpxpzgvM6WaGfkk5tmITtm?=
 =?us-ascii?Q?jTEUMv8pCVP02iiEwBt69hwPojORhX3hH0nF2zzzBDACW22e5swB1Ko26Ayc?=
 =?us-ascii?Q?4gulUdnOjYk2bVu++kPocqzeCIB1E2LAdDissIh/SDDArOi0/oyBIZBK6V20?=
 =?us-ascii?Q?jOLCNvw8iagaCeI+1bshHGpBVUj949SUqqaBTn0SY5gpWAEYbGpPSXv/XSOz?=
 =?us-ascii?Q?jGHsPGbfIWz4myU4upiH3ae6yH+U+gGuLPakJW70YWyM7A3Jcp4mghDpZcO9?=
 =?us-ascii?Q?pVESUnyrC+QBy7haCFa90bHlyklR29MA54OVkua8Panuguj1ztdbJ4RDxRaI?=
 =?us-ascii?Q?lE844EhCqT7dIJb2lWF/Sgx8BkBKmVV/ciXA7Bqyr52/3PF2ktC+eq2TJ27m?=
 =?us-ascii?Q?3optrngeg/YaoMFCL4RW5wOHfg9RXOpthdVxSf2ubDKyZb9QJ7Sfn5vhXDsV?=
 =?us-ascii?Q?mhYRMy/YIXjpM6aTeVKxuFmVjVen2NB6617g2UjsqK0u13efwMSZUNqxTKXb?=
 =?us-ascii?Q?0oMubuU1Iq6Jv8JYYohHzYOfJpPohxaQQkReBL0mzrtPfCHqk3I4TdblU5wh?=
 =?us-ascii?Q?bQnvjayDXkoK6ME95d2SWNKCCqNHvHJQgIR5VIa0505UanHfF47O9CGchKCJ?=
 =?us-ascii?Q?PnPCuskeWCHBy5LPDFSHyvtnLSzjA7BNuvK569VBdJWlLvYUSM46CyfmOL+7?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b90b4d2-f6dc-4789-a77e-08db046964c3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 15:31:31.8083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HU+wZvHxBT3KQjBGiOagxEC5swP5K8ZkYi5uwfFHZCPFxW97gWh2kr45pu0q/vzS8uJvSf4Ay12Taq2h9mLqdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6333
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Greg KH <greg@kroah.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 01, 2023 at 03:11:31PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 31 Jan 2023 10:27:29 -0800 John Harrison <john.c.harrison@intel.com> wrote:
> >
> > On 1/31/2023 04:44, Andy Shevchenko wrote:
> > > On Tue, Jan 31, 2023 at 01:03:05PM +1100, Stephen Rothwell wrote:  
> > >>
> > >> Today's linux-next merge of the usb tree got a conflict in:
> > >>
> > >>    drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > >>
> > >> between commit:
> > >>
> > >>    5bc4b43d5c6c ("drm/i915: Fix up locking around dumping requests lists")
> > >>
> > >> from the drm-intel-fixes tree and commit:
> > >>
> > >>    4d70c74659d9 ("i915: Move list_count() to list.h as list_count_nodes() for broader use")
> > >>
> > >> from the usb tree.
> > >>
> > >> I fixed it up (the former removed the code changed by the latter)  
> > > Hmm... Currently I see that 20230127002842.3169194-4-John.C.Harrison@Intel.com
> > > moves the code to the drivers/gpu/drm/i915/gt/intel_execlists_submission.c.
> > >
> > > Is there any new series beside the above mentioned that touches that file and
> > > actually _removes_ that code?  
> > As long as the removal is limited to list_count/list_count_nodes,
> > that's fine. I only moved it from one file to another because the one
> > and only function that was using it was being moved to the other
> > file. If someone else has found a use for the same and wants to move
> > it to a more common place then great. I assume there was no conflict
> > happening in the i915 specific code.
> 
> I have added this fix up patch to linux-next today (more or less - this
> is a hand hacked version, but you get the idea):
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 1 Feb 2023 13:13:01 +1100
> Subject: [PATCH] i915: fix up for "drm/i915: Fix up locking around dumping requests lists"
> 
> interacting with "i915: Move list_count() to list.h as list_count_nodes() for broader use"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  .../gpu/drm/i915/gt/intel_execlists_submission.c    | 15 +------------
>  1 file changed, 2 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 3c573d41d404..e919d41a48d9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -4150,17 +4150,6 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
>  	spin_unlock_irqrestore(&sched_engine->lock, flags);
>  }
>  
> -static unsigned long list_count(struct list_head *list)
> -{
> -	struct list_head *pos;
> -	unsigned long count = 0;
> -
> -	list_for_each(pos, list)
> -		count++;
> -
> -	return count;
> -}
> -
>  void intel_execlists_dump_active_requests(struct intel_engine_cs *engine,
>  					  struct i915_request *hung_rq,
>  					  struct drm_printer *m)
> @@ -4172,7 +4161,7 @@ void intel_execlists_dump_active_requests(struct intel_engine_cs *engine,
>  	intel_engine_dump_active_requests(&engine->sched_engine->requests, hung_rq, m);
>  
> -	drm_printf(m, "\tOn hold?: %lu\n",
> -		   list_count(&engine->sched_engine->hold));
> +	drm_printf(m, "\tOn hold?: %zu\n",
> +		   list_count_nodes(&engine->sched_engine->hold));

something awkward here.
The resolution on linux-next should align with the resolution on drm-tip
where we have the list_count still there as we preferred the version
on drm-intel-gt-next as the resolution of the conflict instead of the
fixes one.

>  
>  	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>  }
> -- 
> 2.35.1
> 
> -- 
> Cheers,
> Stephen Rothwell


