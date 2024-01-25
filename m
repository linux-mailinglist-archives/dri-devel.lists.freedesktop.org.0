Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245DA83CA14
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 18:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308DD10EC4E;
	Thu, 25 Jan 2024 17:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301E510EC4E;
 Thu, 25 Jan 2024 17:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706203926; x=1737739926;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=//ZGtu4x3OMfbxNQYLopT4w0gKHAfHGmgMtE5OjsobI=;
 b=gs3SD0jodJIPA33b4Ew2VVNvWF6fxJipMzvB6Oocw0C3G4/Za3ft554e
 g6F3Ncl/NoPka64TyVAeYlyJYKSJSLo87MykHvSBKIj3ewnVqIcA1SuVP
 wMAhrgCaMpKCH1gbOy20E730ecl/l+KhPIwGequ5BiVGg6scbj6w3qixc
 92DoW9322ZtArQl18ycqLbrLV5V0NQPX3cPysYaCd6H5NEW0iX7RGT3k/
 Jn5g/9WX0jtB1YEoMyLeLk2GiuP137UpLPBCslCRHzcKeZIn5aT24RlKN
 uO6OP3qyVprRv6B2N942Tcbne8OiwO9ynvAk/xH0RbodAgsSR/xvGhqFQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2105747"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2105747"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 09:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="959911129"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="959911129"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 09:31:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 09:31:43 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 09:31:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 09:31:43 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 09:31:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cobx44wnPKjF0dofSTikYQ3gsliHC3ieVwGq0cCtgT5k85LToh2QpNsxbJeucfaCPTeszAgGjyqcgeBK9UBNgtvZLjbzZiKQSBb9bp5O1zbuJAkl/wom16LZyzQmaSg1zLUBEpi3tPqA8feJoXwMUpsFhQ4+8Ynud5f2JjsQ8aI3f/HnIw3sxQZoXYquryPhgxmXGvLyjoGoUbCyD4SqfJ8/QXuzWwnNj1qk09ajvFyw5Fy/zby5hSjiF53O5u3l6GHrI/QMDvbexDRo9N4xTIbZIbZToJKarHHVST5rL7qDPcsUrHPwcXWqumWFpIy/edB5XeCHkpjebm9T/x2ukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNeTzx5JsTwaX0DvGP/bFzP4ZBP5+nqwWYgJC1WioDo=;
 b=MXsrOD3wL3ZioVsv6vi3Po+LO0Z9rhPzzReYvOjFOGiKXPErD7BP3YGMulUugAZVfn2huAWO9vBE3B0m5WjTF6TAJKXCWag5b1WM4Dm8uI9TyCqDOjSl0/+sd+SNcMR/pyCJjh84fAtcqilRxuKo4A9cQElcBVuWsiagJmTIUvuBoaPyJjckx7AE6gd0McZ/ueSKIfForYwZWsCGIy57HffoGhHv8UuA5OFnEqWg8nz8lPiUcOLTeWDKcslrPThbk3XSdAZjLHHpy0wluxKl8DO4eaoyjHRTkuIs6dAdpYdLa/3jt8hPkw5GX7SZmLqGulcZaRQyLPJBdSTea9DzWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7523.namprd11.prod.outlook.com (2603:10b6:510:280::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 17:31:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.035; Thu, 25 Jan 2024
 17:31:42 +0000
Date: Thu, 25 Jan 2024 17:30:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
Message-ID: <ZbKazWaBOiRLzcNJ@DUT025-TGLU.fm.intel.com>
References: <20240124210811.1639040-1-matthew.brost@intel.com>
 <67f3e729-f5fc-415e-8fa0-f6df4e1336d1@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <67f3e729-f5fc-415e-8fa0-f6df4e1336d1@suse.cz>
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: c503ddd7-a5c7-4573-5ea4-08dc1dcb7e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NEYzLcJn7VbFEKF0eO5BGTvpnxq59mwW/y7JNeMyfcjSQUS8jiiBKsbibMjjiNmMMpBHKf1+OBdDugFHoC344eX29S1zw+GNlQqLrbEdfafTrIkAc6JZwPp+qZO4l2aMc0vTvbYPu8I+wBqesBXqUQxsLHrpJruTCxUHnI29GJ+ySZ/vvbmjX9jO6KVLTxoykedRo48FNa3Q0xYETjW0ArIkJlBvZS5GmmTTC5CgxKpayM4HvcNxqJXnnvfHuwr3lq08eKn4bv6g6A5XO6DUvTNtdrBRPFtqdfWaBEMz4Fgcldf8ozGM3nEe/D4j4+RnKTw3pYql5k+IgyRDz/QLjL9piv3f/jpl5Ip3PDqV99M/F8pYO5yT+f3ZOFaKq9pjb0JM3Sh2Nyua27ws/ozQeEFnR1pNACKGHHPKU8dcWoYvNGL1WCkXOcfvscS+k0Sg6x7ovPl4absLRVYD4LyAoP+meL95CtuWRTVHJ+YI9BnTtR5xX1w00rZhtj9sIraOYp7UH43Q79rBLhKQXpJpkYHYsWd+p1PXD7hJZ4O8Z8BPs3ZTBWuJo4VGlfPO6mB93vS9RUUcXOAcycWwrIjiVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(53546011)(6506007)(6512007)(4326008)(8936002)(8676002)(83380400001)(26005)(66476007)(66556008)(66946007)(6916009)(6486002)(316002)(478600001)(966005)(54906003)(41300700001)(86362001)(6666004)(82960400001)(7416002)(5660300002)(38100700002)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IKuMZn82gYVRw08bXjWiZsfd3/yqNG6SGDyMaQVnCBppeIsCneamObXfR3NR?=
 =?us-ascii?Q?lhKcqsfiuAc/olNj6w85AqTu4tONgMGNs0hH+cja2UUvAViBvBhLZBacqPH8?=
 =?us-ascii?Q?w4+ufXAWCCrBXU22ObT7VGFryPoP57omwpfoe3AyQpNiCCTgFGacDtRa392Y?=
 =?us-ascii?Q?AZEKzLcbpc76m/Qt149/r1l2DNOaVXMHiso/SMh1nq+SccmlkJy/0q33uRwK?=
 =?us-ascii?Q?gQGbyVb7M7tC2AhpLOoiqohHb4UM0SqhysbwGoqkZXnYtxIZFgbD+ZAByOdq?=
 =?us-ascii?Q?2pB/1LCYkFCc3n0rejoFk37/qlW0c1s1DssnMZMIeQhjGlgOnmz4Df7t/9/S?=
 =?us-ascii?Q?QE0ICVIPQG+20BNdylt/BgXGGz6lp5RuQi9oRHHABUKUnUWWhvVgrEVtnwYT?=
 =?us-ascii?Q?j/HCySxLRWykuxtlHrX9b+FHw7uiEG4GNs0FTs7iNh/g2VVHxWl4Th3x1MMp?=
 =?us-ascii?Q?3W0GgA0hSzYFaCHRbjl1r191VT6dsp10floKhTOFqLOrIiUADuG+NwCSnN43?=
 =?us-ascii?Q?5psAhImsduoHrsBfwPacEWLq7ssxOJrhPdoHCzstg90oq6qiDiKUtyB3C+8x?=
 =?us-ascii?Q?kJSoA6aoApkJUykaKGBleZmIUgrfZhFRvVCIkksNAyVGfELmG7rknX7u4+En?=
 =?us-ascii?Q?VfMEJ8O3AM6t8RNVR15W8oDocGEDeJh3JAcHlLXzy0dO80Erxpskr+iOMXUX?=
 =?us-ascii?Q?9WRrKtCxCPd5SZZh7Rkx/awW2Thkiei6w41X91UJGl5x6eeAil4MJsuRDz8e?=
 =?us-ascii?Q?6PE5I1TxfLOVZZsjr3NZjZRGue5INUCncCjEdmLIiUuNeALTN1q5L4XiBjEM?=
 =?us-ascii?Q?Jevmx7bEdt7a66EWqunfqZMNF50xJZIisDCK2I+u4OCb12JnshdGQdo5aixB?=
 =?us-ascii?Q?GkWeifH7laSsphppEie+dsZraGM4uLxMg6MFkCmUlgbLJg//cem/IMJaPy7V?=
 =?us-ascii?Q?F3wynYWUxVTby90D6BluHBGLYAW9sCHA02xnYsLWgUViS79NpAcK4H/Zyndv?=
 =?us-ascii?Q?skE3Xc7XU9bqm1aQz8gnmirgVBSfQe9lgzpK4Sfzn31ebIlKoAyt8V3KQ301?=
 =?us-ascii?Q?6tv+6p8WE01lGWuIbYgarAPq2cYLsgl+39UJX8nm5b2CtE/q70PhExNs+rmk?=
 =?us-ascii?Q?co7kyxN1LdoDiF2jRgMGFK8LqiFzcGmJlRFyOfPaMrnJ4rs1Czxhj/V5pDuk?=
 =?us-ascii?Q?d1zAXccZNwxRjFdWUGJT5fJ83G66te8KCTsC5ZcQqRMZrVZLk5vTqtF9qb+k?=
 =?us-ascii?Q?IZ59ZCsUTCktN7lhLnliEnYfA++mT/kcd6it+maYoh+LkbGZgQEp8Or54oNi?=
 =?us-ascii?Q?LfDcW0TZu3xmeDz6fVqpvGZyCW+kB17mPwDAWkRVdv8XDcOnj47ndFxr+R5g?=
 =?us-ascii?Q?9eUSPTIyk1XWXYc0nnhENR3AqjR0ARV7x7bILnqfq+jnqeehKibtREK8Uc1M?=
 =?us-ascii?Q?1YrMx0ykS4CMy/dOhgjy3kyH4kP9S5vndhEIrmrOKMhMw4FE4xWsvRe6744J?=
 =?us-ascii?Q?3hY3deBjV9uLq9+qBREM9SLI0hVxYUsvi+iKBRWM65ShvVupIdWgOBGUiYrE?=
 =?us-ascii?Q?h+575ccv3I3bsu9py2Alb5A/BXchG32uyN6F1soplqwFrf/o5Qcfiy60kkML?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c503ddd7-a5c7-4573-5ea4-08dc1dcb7e8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 17:31:41.9857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYQaIOF4EybNdsczQav3lr1k7bf6jp31l6y2CTsG5TCTktNcAMry3pMDrV358IwvysczIc16B7jf3WF7QdkDAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7523
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
Cc: ltuikov89@gmail.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>, daniel@ffwll.ch,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, airlied@gmail.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 25, 2024 at 10:24:24AM +0100, Vlastimil Babka wrote:
> On 1/24/24 22:08, Matthew Brost wrote:
> > All entities must be drained in the DRM scheduler run job worker to
> > avoid the following case. An entity found that is ready, no job found
> > ready on entity, and run job worker goes idle with other entities + jobs
> > ready. Draining all ready entities (i.e. loop over all ready entities)
> > in the run job worker ensures all job that are ready will be scheduled.
> > 
> > Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> > Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> > Closes: https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/
> > Reported-and-tested-by: Mario Limonciello <mario.limonciello@amd.com>
> > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3124
> > Link: https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/
> > Reported-by: Vlastimil Babka <vbabka@suse.cz>
> 
> Can change to Reported-and-tested-by: Vlastimil Babka <vbabka@suse.cz>
> 

+1, got it.

Matt

> Thanks!
> 
> > Closes: https://lore.kernel.org/dri-devel/05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com/T/#m0c31d4d1b9ae9995bb880974c4f1dbaddc33a48a
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++--------
> >  1 file changed, 7 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 550492a7a031..85f082396d42 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1178,21 +1178,20 @@ static void drm_sched_run_job_work(struct work_struct *w)
> >  	struct drm_sched_entity *entity;
> >  	struct dma_fence *fence;
> >  	struct drm_sched_fence *s_fence;
> > -	struct drm_sched_job *sched_job;
> > +	struct drm_sched_job *sched_job = NULL;
> >  	int r;
> >  
> >  	if (READ_ONCE(sched->pause_submit))
> >  		return;
> >  
> > -	entity = drm_sched_select_entity(sched);
> > +	/* Find entity with a ready job */
> > +	while (!sched_job && (entity = drm_sched_select_entity(sched))) {
> > +		sched_job = drm_sched_entity_pop_job(entity);
> > +		if (!sched_job)
> > +			complete_all(&entity->entity_idle);
> > +	}
> >  	if (!entity)
> > -		return;
> > -
> > -	sched_job = drm_sched_entity_pop_job(entity);
> > -	if (!sched_job) {
> > -		complete_all(&entity->entity_idle);
> >  		return;	/* No more work */
> > -	}
> >  
> >  	s_fence = sched_job->s_fence;
> >  
> 
