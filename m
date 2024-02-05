Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3612F849BDB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 14:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3811410ED37;
	Mon,  5 Feb 2024 13:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4lZaaQo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78C310F996;
 Mon,  5 Feb 2024 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707140010; x=1738676010;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GTrW2xKce5nsHtzkHt7aKAD9zmxXhoqPbCYwRmKObBc=;
 b=L4lZaaQoqUIUOvQ1erHhontsgstB5e9o81hnMMbGdINCMeYDuYzExSnT
 qAES4rvTs99m6P1KVi55kqtrKnta2Z2vD+DfwDFUdys6m3XAuSTupp5Fk
 7Lfa2kH1FhknIA8xI9Vx5yOcdf/yHoDRCBhq602wnJU7fLKN17bzMA1Ky
 j/12KQ4fmzUJIBokYNCx2nq2aTIeXcPjhLw8q3sWG5tlQQa2rRfONdcYd
 FygQ6VXg5tim3MBjPVU+aWqNSEJ2+re+oFmV5BuUeBhdM2guh81oQww5B
 XrhaPUzwQpBskfoj3ZFlduniT6i04QyL3RchBCybg7xwHw9GTVvSYi9UZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11877030"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11877030"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:33:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1035129"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2024 05:33:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 05:33:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 05:33:28 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 05:33:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 05:33:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hffbNQ7PueXzRiOvjZzsKcqh47whsUQT8N9c1srIoexjhmClodsUIb/Ott08N7cxac4DCw+wMTl/nuWsEUan8Pi/3KRDVY07lb1sAmHCQtSm8l54NGhBpaSnfFayOMTRe/8OmUcRa+5fRAYl3XJ9fyJ2NLjtigJ4Q3ncyAu6T+OYUiu4565GO00rJHWzo6DXGoL1BoeOObt7lGKqhXzH/lPB5TE0a8GT53vBVaR1GGlnNLS1alPH2LC6qoXjC1lSwHQa87ipGHikwSvbRT1PxcgOXjpuCc2kHUVlLuDca+devDwK2c+sZ4ygZxxcjttk5k39nvrOD+VfFWC7Favfeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYT+7O9xzCJcyrG/PoT/dqXI3zNzrLyyQPVUjOhyd+o=;
 b=XB9s3KeNDUDG079j2N+WUfb84pJjnhe5909Gt9eNhEu0J6BtpuTAXpn0MusPYJ9xPfnD5rmP1TsEHHbrH9gdQcgrhogx7iYQ3wNmM7U5SU0xHtb7S+0JykNoS/zSv+6xKnjRERbVfs3gZfmamYwUqNTroiFX1Zjs0D9Ha5OsnRIBXUC8SoMKArkRXW2BRe7XFUyUdT+/FyAa58Pq+AUlcWYzai9dL0jKuJix+G4nEwaxGVSHmxBUAXDBuNruQ4NJrMOnt7VZejjyfIw5vQky0P+iQJoNtlhE/RbOLLZMm2A1bXj5UFiF2sXOp0oGMbM4ImAfM16BmbC5KRtYy+/HUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Mon, 5 Feb
 2024 13:33:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 13:33:26 +0000
Date: Mon, 5 Feb 2024 08:33:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@gmail.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <airlied@gmail.com>,
 <ltuikov89@gmail.com>
Subject: Re: [PATCH] drm/sched: Re-queue run job worker when
 drm_sched_entity_pop_job() returns NULL
Message-ID: <ZcDjoek_l_cqE4Rr@intel.com>
References: <20240130030413.2031009-1-matthew.brost@intel.com>
 <e7707834-9298-4392-a7ec-f4e5f382fa02@amd.com>
 <Zb1ll0rXlbaAaxKP@intel.com>
 <c5a7ae52-98e2-4edf-a539-71e4166fe3a4@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5a7ae52-98e2-4edf-a539-71e4166fe3a4@amd.com>
X-ClientProxiedBy: BY5PR16CA0021.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4726:EE_
X-MS-Office365-Filtering-Correlation-Id: cb746492-1512-4ffd-d1fb-08dc264f082f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GBw0h8hTLUQkmXnc+V6uzHUhdiUAwPSWqDBE1T9DzexxXsvNVt+43OLdb5s5n6hduI2yZ8vJb5sH4G35AnfEOSURVQnH+fhM0AQfF+mRgB8I8DeOTeTPYipO0syPmj4wC2+p7iskr1yrdbQvN6lOFcTqLEfJSlgA747AyanWW06imOQetdr70GZStTVLx5gyPpCme7PBGzujvW6YqHpFd6fXoP8vhvXrkugq2oT8Umh4UzUABsbGkxrnt6tn73HitGxoWplIA4U/lUZBMwf/C6WokLmn2eTpvXnhMfjTjsBrB686AwL9ZucKw9Oozn/f7Kzzrgcsdi/LeH9B8aTnc1X3A78MnuKohbCBlfy7HpOc54oPlkYOk6eAJiUel5Vey+UI6BbTcNlj6N4KCpb38gVFZbpJ+fSmvupZImYa9HQR4n6TwUQ+a63PEpn5+O1W+AWFqUF7qQH2hu+O6IY/VE0jtBf+YVAMIYHv4QB/SOTQEkgHfQllaIleRgNfkzfvtpsz00Y0wTQJMT2sfhqoSITHR+Ag735Pef3kL3I/9EKs0hq4wZg2RUIgNEZErXOK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(41300700001)(110136005)(66946007)(66476007)(66556008)(36756003)(316002)(5660300002)(8676002)(8936002)(4326008)(2906002)(44832011)(83380400001)(82960400001)(38100700002)(6512007)(6666004)(6506007)(6486002)(86362001)(66574015)(26005)(2616005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nzrjlYrStZFoH+sc8v4uSG7WV4h3zl8I3pmQhUw5dFlL18JGQRLtSXH2VR?=
 =?iso-8859-1?Q?Q6YR5xPfRotpBMS9MEQ2sHLOb870P05NW+qKCRB8ey14cC4ZyyRXatGaS1?=
 =?iso-8859-1?Q?HtdpNz+73lTxV69qsDkH/3dfYy9nR4O/Brzi74w8EQ+Xz81fE7YtyyZoWE?=
 =?iso-8859-1?Q?IrhODkdRsncyp5pTbMtVVN2vNEZ6ZqTuwHn7ADTP5nIfo5EXthYc6fPpuH?=
 =?iso-8859-1?Q?hnLl/zk+XveYuvYvcifAKAh2bh1DtKxCqoDc+DDb0YbfexszwbArrI1VZZ?=
 =?iso-8859-1?Q?6mLQY2TzNqE3FRJVnGRM+RCxf1ZwZWwEoVkFxmo1s1Bj+OvMA5bYZTaLhW?=
 =?iso-8859-1?Q?1SIxUSlangxfkCe+p/E2DAarYLbAtTPEkoSYVHfSSOA1ngvtkQr3EvJVF1?=
 =?iso-8859-1?Q?4478t7j9yGwCGmlAX3WQuIyaawNXV10qaU/d8iyMN5rCCBN/qemKt9WKUg?=
 =?iso-8859-1?Q?M6fkI4EGSy2Mh7C4JYaDpJNqlfwxNcFq3HoUpFCVoUBlPr8bhxFYMYtEge?=
 =?iso-8859-1?Q?/dsDXAiS4QCgAb6uLZP+4/9tyTMSURNeDYgvet/JfNB53DtK7q4GFj0TOr?=
 =?iso-8859-1?Q?YgiHI0BIZ6F8/AEXn+FRq9xb5lFRtChTSRIO3cookNcg5wWZ45MCzuSYfH?=
 =?iso-8859-1?Q?oNf4gzsj0LBBTRLsacBuMcV9c+TxO7PC9oGzbDIQQomt9QJpza4bTI0Ywn?=
 =?iso-8859-1?Q?OsUG+yGn76CKV3I/0O+DyqTxICd3J5cEDTotfr7RKS9R2/Ach4SVxtWpkJ?=
 =?iso-8859-1?Q?cgEebPIsrExnFA3b0qddm38AzY8nJe4SsQ9dWB7qjKXppmDcj47C5FV5pt?=
 =?iso-8859-1?Q?0gLKDsYvigDRprC7wn5+B3siFCOLqw0e8uDnLj3iaaemzdhmoIyLjPtz7W?=
 =?iso-8859-1?Q?xp55pNXUb4UcG/X2+NlqXUd5OL7A0meXQU1I5US/hLFGXmjzD4SLaYW73X?=
 =?iso-8859-1?Q?Ojkb5GrMvNmyEumhMwfojvQea3yRDJN8J+8/o24A+C4MstHch9pNbYps1h?=
 =?iso-8859-1?Q?92S1ji+LX8bhJOZIMmWV9Q00J78b1kHfdPU6r/uUEQLT87BmzELKoJ+u7k?=
 =?iso-8859-1?Q?5MPSEg18IaienP7r3iRH+ZvkwwugwFYVtRgWUhq2K94jy8Hffes2B4+c6L?=
 =?iso-8859-1?Q?UC+9XhO8KRSFgYDLC6/VxA2IJB7aPSuFnyIQGMKXVonH4/YHPdMHzUjr5A?=
 =?iso-8859-1?Q?ZOt64b/fw7LdUR0UMJhXDfMljb4vnURrhribvzuH8JC5dcW0YQd6YF6nB8?=
 =?iso-8859-1?Q?m11Eqcu95iFjcGl5sWnCYQkrkU2rB0v7yDjbjSXhpWewSGfSvJ9YGi1har?=
 =?iso-8859-1?Q?tCqoDfdMPfiOxG8wRRf/Py+94lKbAWnX7avMfIWHPRKgc4zVa1YBvaRAQ+?=
 =?iso-8859-1?Q?bb3lZF4MTO/alrb9NUobhFfESE67yFfqxCVqePYlftqJvqJ9TPVDAQiCCU?=
 =?iso-8859-1?Q?WYHT6BYOIMT2/NvEJldGvi3colvImx44ucdAN325ctC6IhBmpRNMj+ivP0?=
 =?iso-8859-1?Q?7GFwq6fLANFynfg8F/kztbXxlno4YziHoXlbxsPplOcHJUSmnb+BnnEKQd?=
 =?iso-8859-1?Q?sbaZCQN43nkUhn8b0q0EmmxuxUewhqWEoDF53rH6BzjTWjxzQhO5a9maJO?=
 =?iso-8859-1?Q?7/xrmC89rOZ4HmXa3/7zKAwPD6QYWX1lpE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb746492-1512-4ffd-d1fb-08dc264f082f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 13:33:26.4779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AtyfYBYVMrH9T75JWmdL2zw+dXERGVUkD6gUwttOVa5DQkPGfTdM5R/eiq3uPxZI+wzh5Stk8rsT6Vnmh61dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
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

On Mon, Feb 05, 2024 at 09:44:56AM +0100, Christian König wrote:
> Am 02.02.24 um 22:58 schrieb Rodrigo Vivi:
> > On Tue, Jan 30, 2024 at 08:05:29AM +0100, Christian König wrote:
> > > Am 30.01.24 um 04:04 schrieb Matthew Brost:
> > > > Rather then loop over entities until one with a ready job is found,
> > > > re-queue the run job worker when drm_sched_entity_pop_job() returns NULL.
> > > > 
> > > > Fixes: 6dbd9004a55 ("drm/sched: Drain all entities in DRM sched run job worker")
> > First of all there's a small typo in this Fixes tag that needs to be fixed.
> > The correct one is:
> > 
> > Fixes: 66dbd9004a55 ("drm/sched: Drain all entities in DRM sched run job worker")

Cc: Dave Airlie <airlied@redhat.com>

> > 
> > But I couldn't apply this right now in any of our drm-tip trees because it
> > is not clear where this is coming from originally.
> > 
> > likely amd tree?!
> 
> No, this comes from Matthews work on the DRM scheduler.
> 
> Matthews patches were most likely merged through drm-misc.

the original is not there in drm-misc-next.
it looks like Dave had taken that one directly to drm-next.
So we either need the drm-misc maintainers to have a backmerge or
Dave to take this through the drm-fixes directly.

> 
> Regards,
> Christian.
> 
> > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > Christian, if this came from the amd, could you please apply it there and
> > propagate through your fixes flow?
> > 
> > Thanks,
> > Rodrigo.
> > 
> > > > ---
> > > >    drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++++------
> > > >    1 file changed, 9 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index 8acbef7ae53d..7e90c9f95611 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -1178,21 +1178,24 @@ static void drm_sched_run_job_work(struct work_struct *w)
> > > >    	struct drm_sched_entity *entity;
> > > >    	struct dma_fence *fence;
> > > >    	struct drm_sched_fence *s_fence;
> > > > -	struct drm_sched_job *sched_job = NULL;
> > > > +	struct drm_sched_job *sched_job;
> > > >    	int r;
> > > >    	if (READ_ONCE(sched->pause_submit))
> > > >    		return;
> > > >    	/* Find entity with a ready job */
> > > > -	while (!sched_job && (entity = drm_sched_select_entity(sched))) {
> > > > -		sched_job = drm_sched_entity_pop_job(entity);
> > > > -		if (!sched_job)
> > > > -			complete_all(&entity->entity_idle);
> > > > -	}
> > > > +	entity = drm_sched_select_entity(sched);
> > > >    	if (!entity)
> > > >    		return;	/* No more work */
> > > > +	sched_job = drm_sched_entity_pop_job(entity);
> > > > +	if (!sched_job) {
> > > > +		complete_all(&entity->entity_idle);
> > > > +		drm_sched_run_job_queue(sched);
> > > > +		return;
> > > > +	}
> > > > +
> > > >    	s_fence = sched_job->s_fence;
> > > >    	atomic_add(sched_job->credits, &sched->credit_count);
> 
