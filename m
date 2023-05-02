Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 774BC6F4735
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852BF10E2BF;
	Tue,  2 May 2023 15:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315D610E2A0;
 Tue,  2 May 2023 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683041422; x=1714577422;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s7h6i/6rNTfO2XcYBvGqeBw9FzxcjONIa0nrP8OKynU=;
 b=az1iq2E+IdoZfwAXQWaSJLN+qJa8U41iTUT3qS0QmvHm84UnFCleRi4V
 CG6HcA12LXWAiHc/u5GcelVpWOHFd36oZwoY981zGM/xdqsqqFfOvGkU1
 MSrVB6cIYnuxbbaL4LfJclJnL/iII1JoZvTJjppdPizff0uF8V5CdeKdd
 LSJ0AOqT0nMA/Udj2CdOmtEjdGkS3Alp7rSvXpwbDujCO0cWViHTMUb0a
 lP/vu3ZCxZ6qWP1JEwgZ5wKZ0TI27Z7Ghnnxcbd+Li6wrxH3b6uHZsXyK
 hxwlbJGU2ba2DSisTHx78RuC9TuB2x+8SIRIX+SO7FRcYqRyFZk4Vms4P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="413885017"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="413885017"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 08:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026129695"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="1026129695"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 02 May 2023 08:30:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 08:30:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 08:30:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 08:30:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 08:30:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3xA9yTFYfqoIef1POm6AJzWX48XPLOqoKKtyvGOAY4H0xEeamP4IHkc6HGnhiqaYsv2jw6vdDaRLJ5BwMmsZ5DQDOppfkeCu7TcX1UmeSPFbFBoOv86id/WQW1ECLMFN/Iw07FFUbjMG5/9UvnQxqy3zDHE8V1I4REIGvd4CDrHy64q2t0bGcGuWGmtPyUjMy68+4w7AHzHCdpujXubRy37hZ3gzppeNvKMxvsoxo5ltWp3OuEhYXx7uMAPPwkuwUpOKH0WVQWR/pKaRGxq4gia1KD4KfV6pOvybSXhuiUSDpmNAY05/P0//Kb5wBbIyoLPA/nU3a6m6yscd0dlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEhgFLhM2G2GenO85+h4SjPenOX1dYP7Qekc0vlqdV0=;
 b=JLYoGoqzB6SQsye/OM2uMF4tdyV5GX3LQhV88VYyvSWzlBAn25/qeaUMp3s1pOB09Dr8uQW+0zKqy43cdKIqeUG+wuWh5uulnoKqYplAcv1yVK/R8BHQVttJVbTowBmF1H9W85M1O/VmFBIAIG1it7ofk+DpozlTLpplQIoiYa2REf/rpmmEaxHOuwLs/drobfmeh/AVyCwT5Rj7i3kCbngDFotMuJSs1t0yi/gBByNRAQxQ60METff4cjXq1xVm6obiW+XiIr4vO/cOP4VhmysISogZsqPC/3U31SsK0c2bXiKH27mZuys89eOVPA0oBpzqNExWgcLqqeDJZkkQDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5924.namprd11.prod.outlook.com (2603:10b6:806:23b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 15:30:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 15:30:16 +0000
Date: Tue, 2 May 2023 15:30:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH 11/14] drm/xe: Add HW Engine snapshot to
 xe_devcoredump.
Message-ID: <ZFEseKmH80QwwN4L@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-12-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-12-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c34b612-c67e-45ba-ab9a-08db4b222102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y8NOuJdULJqmN4mUfK1X6driu2roQPzMPS2GXbF1YB2e5CVUtNwjzAc93PB2K1NCEfwQvLqndE55WsDUyJFo5B45aYkBUvGyb1fHzAbWBiqLUaBMNPgkvECyYbtR601nPRgPOPBqIML/r8zwuVog6xi92z9qGmd6Dbs8FXE08WB4pBhYAQw0J3Jps+7tPaqeNc64eSs9UtcUQcaEu7hFRzOv7t4nKu5gNzam+Ev5BdmNIgBMbF+v4CMGlnVSxZhs/QWEaiC9mu2FcbrDhfRh8+7ORb+W73ZReV+RNyTfYPwk2yyUxa7zgCjFD5X4Bel0tFSi1uE/wtftQ88NRREuR9lb2hMGzsw5xtZgDsEX1QDrZ1bXLzNlqN+JEKMn0IRj8JTvuAUM9i7gHk2To1+Jvx5xg7hgnhe3UHN6y7Lw0RhzI3ljWNh75DP9DunX6ojPQ8IsiRPnr83n6itSCzLIqjrrqJYyfbjdzLSH3v2Kj63h/Euj/8oIkb6Gjb6Y8uDq/qduicadWmWmq7Ljzn83kIlvkMbD5HSyEXIlOfeKj+xYklo/AgRogLiEEjtqafoG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199021)(6666004)(6486002)(83380400001)(2906002)(6512007)(6506007)(26005)(186003)(478600001)(41300700001)(450100002)(66476007)(66556008)(66946007)(82960400001)(316002)(38100700002)(8936002)(8676002)(86362001)(6862004)(4326008)(6636002)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M0zw/8nWLG/yeoxaGS1slEd+6TdnXddNwVBc5+/zi8gwRMboWiA/BjPZ7Exq?=
 =?us-ascii?Q?fUYs+m9JZALwqG2PacuXh5FNIXhTjXSbd5ECrhZqncFezveaK2MzaDt5u33n?=
 =?us-ascii?Q?+x0fhWK3SlPviNE4JxZY/Io+LNMefj7Le7ggkHnx7zLmBeCpa8A09ZSwLbeh?=
 =?us-ascii?Q?nl1IEaymhE7UcTbaGSdyoIOwjY7qA51FxNdpukQjzI8bbcpHNHUi40RTERgh?=
 =?us-ascii?Q?hjxjClumhRL9wFbx6o68ULLaqWvjBh8e4K7IJTS2u/fEJsI6+xTJ7j2EMvWa?=
 =?us-ascii?Q?R3SlRp3nbgVah9Afjcpyalf+EgFoTNXtJx9aCvnyVPCNe2ED7KoYY6BP+nsx?=
 =?us-ascii?Q?9QlennbE9NpmfaTCOXVa9KKPs9JF5WkaXnpY2/cgQNn6sho6lDSAA29jZNRk?=
 =?us-ascii?Q?YcTIatc83a9o+z4y2ZLMRVXjPW2FKuSuxwt6/SZv1v+F6ql6ok3kGd7vMigF?=
 =?us-ascii?Q?VGipyNIxKNS+YQMjsY2Vp6dLmZ2mExQFhLFM/p4qPGKFxa+2bzMYjsooyNcZ?=
 =?us-ascii?Q?e8cADfkXnHibnKKm5N3lt1VEx1GQXJZ+/YxJw0Mlyx5GZ+E8gR3hfh2OYFyP?=
 =?us-ascii?Q?EzS2Api+0ytaAbWyssRY8Ei2DwMp3TVqQLjNx6H4FYzegW5LXhzG38Rr+3qz?=
 =?us-ascii?Q?k0wT5wxUs9kZKISoeNovXzLl/8LBgRg4PiuMlTy3gRC1q5ewU+8WCEQetWnk?=
 =?us-ascii?Q?B1AIGD0fSyrxraQh+kBVSyWulFtn+96s1Kc+FywStGJQppHhQHP4n8p4X0ti?=
 =?us-ascii?Q?EDxZP/h5Kgyx0y8gwTgFiTIDLN+9KNtYaAnzsqe1KH1OdXLZvUcx6CxEep9L?=
 =?us-ascii?Q?riuie1k3UPv3Vud9EOgR3St8fCAvUlORtum0jemo8RHOr2xGZxGT8X4LM2u3?=
 =?us-ascii?Q?ZpiKM5jMMULX28Dd3hRo3VAFzfkvMd+SAQa5B+96kof+VsFAoqv8D9fO+BLJ?=
 =?us-ascii?Q?vfgE3a9JfSq4vjDTc+0rxsvT8ve/AYy1zYnMRnECo4230W2+XhgN2WcRmp5R?=
 =?us-ascii?Q?4/yCPPE6tvsz7VpWZCZG+nh73uBhvD5XGdr9NENjGXGczpVGBr9VKQPPkplV?=
 =?us-ascii?Q?IumYFItZfJpvFgKkst3j4LGuaH8HcISZ/DYhy+jFEN9mezY1iuebaOsDUSmH?=
 =?us-ascii?Q?9xOw7plYZcfoKo81gQyR/Wlgi5AF6kUicsEBlHpW2Ax3QylKF0o4RGO9I58P?=
 =?us-ascii?Q?lt89yQcOwUTA2xKFGTZzQMyqhtprst4vT31SlCWPFKe4RCS377nzDH+Xtk/b?=
 =?us-ascii?Q?FZADbJOJZpKfkcfh3SC7xTW7N/oc+zFePQ4uub1m+t4Zd3Y/KO4gwLG4iygU?=
 =?us-ascii?Q?rkAka9rjnJlcGqcZBfW6hH/YBXUurSBdM+9nS7g+cRnMOdtz3oKuBdQWdY62?=
 =?us-ascii?Q?57aROKMiTZLZo6Q59SeAzxrBpO5UUlHZvSIVQrN+s7EFUQ58pk+jrzdA6prO?=
 =?us-ascii?Q?JrUdbvWlM1eGhwTGKyuJNeKjsjngRUFmAeVbETAJQgFoNfQP/f+Bm58OXayR?=
 =?us-ascii?Q?XWJYB/CzCtU+E09naVSyi7o/anHilcU+0OrwUi93tX97K6xvFAf8vFSUFWyO?=
 =?us-ascii?Q?VvZcI+ZKerP9DT3MIPNqj0B64zljHBfkpTabRMbeON/g1a2twoS4GGx8eQ2A?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c34b612-c67e-45ba-ab9a-08db4b222102
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 15:30:15.9643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SouwosugbxcrYcAOYunS47mC2B4EQf3mVbE2k12BkuJxrBbT17buUiN7/EScH7aaPrNv8b+nha1EVf0atngtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5924
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 04:57:10PM -0400, Rodrigo Vivi wrote:
> Let's continue to add our existent simple logs to devcoredump one
> by one. Any format change should come on follow-up work.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 45 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 0e7ec654a9f2..1ffd12646a99 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -9,10 +9,13 @@
>  #include <linux/devcoredump.h>
>  #include <generated/utsrelease.h>
>  
> +#include "xe_device.h"
>  #include "xe_engine.h"
> +#include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
> +#include "xe_hw_engine.h"
>  
>  /**
>   * DOC: Xe device coredump
> @@ -62,6 +65,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	struct drm_printer p;
>  	struct drm_print_iterator iter;
>  	struct timespec64 ts;
> +	struct xe_engine *e;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
>  
>  	/* Our device is gone already... */
>  	if (!data || !coredump_to_xe(coredump))
> @@ -75,6 +81,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	mutex_lock(&coredump->lock);
>  
>  	ss = &coredump->snapshot;
> +	e = coredump->faulty_engine;
>  	p = drm_coredump_printer(&iter);
>  
>  	drm_printf(&p, "**** Xe Device Coredump ****\n");
> @@ -92,6 +99,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
>  	xe_guc_engine_snapshot_print(coredump->snapshot.ge, &p);
>  
> +	drm_printf(&p, "\n**** HW Engines ****\n");
> +	for_each_hw_engine(hwe, e->gt, id)
> +		xe_hw_engine_snapshot_print(coredump->snapshot.hwe[id], &p);
> +
>  	mutex_unlock(&coredump->lock);
>  
>  	return count - iter.remain;
> @@ -100,6 +111,8 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  static void xe_devcoredump_free(void *data)
>  {
>  	struct xe_devcoredump *coredump = data;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
>  
>  	/* Our device is gone. Nothing to do... */
>  	if (!data || !coredump_to_xe(coredump))
> @@ -109,6 +122,8 @@ static void xe_devcoredump_free(void *data)
>  
>  	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
>  	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
> +	for_each_hw_engine(hwe, coredump->faulty_engine->gt, id)
> +		xe_hw_engine_snapshot_free(coredump->snapshot.hwe[id]);
>  
>  	coredump->faulty_engine = NULL;
>  	drm_info(&coredump_to_xe(coredump)->drm,
> @@ -122,13 +137,43 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump)
>  	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
>  	struct xe_engine *e = coredump->faulty_engine;
>  	struct xe_guc *guc = engine_to_guc(e);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	u32 adj_logical_mask = e->logical_mask;
> +	u32 width_mask = (0x1 << e->width) - 1;
> +	int i;
> +	bool cookie;
>  
>  	lockdep_assert_held(&coredump->lock);
>  	ss->snapshot_time = ktime_get_real();
>  	ss->boot_time = ktime_get_boottime();
>  
> +	cookie = dma_fence_begin_signalling();

Why the annotation here? Otherwise LGTM.

Matt

> +	for (i = 0; e->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
> +		if (adj_logical_mask & BIT(i)) {
> +			adj_logical_mask |= width_mask << i;
> +			i += e->width;
> +		} else {
> +			++i;
> +		}
> +	}
> +
> +	xe_force_wake_get(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
> +
>  	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct);
>  	coredump->snapshot.ge = xe_guc_engine_snapshot_capture(e);
> +
> +	for_each_hw_engine(hwe, e->gt, id) {
> +		if (hwe->class != e->hwe->class ||
> +		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
> +			coredump->snapshot.hwe[id] = NULL;
> +			continue;
> +		}
> +		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
> +	}
> +
> +	xe_force_wake_put(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
> +	dma_fence_end_signalling(cookie);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index e055b266af70..8b17ecf1b6e6 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -9,6 +9,8 @@
>  #include <linux/ktime.h>
>  #include <linux/mutex.h>
>  
> +#include "xe_hw_engine_types.h"
> +
>  struct xe_device;
>  
>  /**
> @@ -29,6 +31,8 @@ struct xe_devcoredump_snapshot {
>  	struct xe_guc_ct_snapshot *ct;
>  	/** @ge: Guc Engine snapshot */
>  	struct xe_guc_submit_engine_snapshot *ge;
> +	/** @hwe: HW Engine snapshot array */
> +	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
>  };
>  
>  /**
> -- 
> 2.39.2
> 
