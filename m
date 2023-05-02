Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F346F46C2
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDE610E5A9;
	Tue,  2 May 2023 15:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B5110E5A5;
 Tue,  2 May 2023 15:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683039950; x=1714575950;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Kuw6S4dZ2j3vusmvzYTdp81jWf3FcxoY1tWqpBcZExI=;
 b=EUxQcO+C4F5Da/VBGOzd8jP+e0FZVl/o6Sy1cDCI8EZbCIQwCWnuZtuB
 rwt5ddM2xWJN2ZbdzEKH1KZ+rlC90LuoYmCDqDIJ3VGbjiZjXRSl5Rr5t
 G8uAGdYaIgXx9NQwpkS7N9sc1SItl0B8XX7Vi/xjRwrgJbm/vBppz3hW/
 aODloBDiqMDHG32TMKY1TGCHrYkjrHaLxgC9gvgyremphPSlXSU7SPPpk
 y99OhmF8zZ7k6GMsN1nWNjiaYNqefZFUua2AIdQwQlOfLRFnICHXRkVpw
 b97KqtSS5ZxGRRBu+me/FMfoqNfL53ixIba+uWF+Bt9bwbE4KGYvY0QT6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="376487619"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="376487619"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 08:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="761120170"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="761120170"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 02 May 2023 08:03:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 08:03:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 08:03:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 08:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WL6jHCLm09KQatf5Ugt92BldYZk119idaQ7W8OqPLbp5RWhyoXetVlpMf5RT/Avopk+lJw9oXiOFxo5lAszDhiPksoFY5e48K8U53AAuDzvwb2Was8ZJO4+Vxtr/iz5gXBKutyjXJtEe0DX3/7i+keYRTi5sGq8xPmJE9+pVAZ3SPYtjbm2kt2kAJAG+6sPjJ3shOLe9nUaYkqipGRxY45zM/XqLTsW1iOeps9INE56pRMFA8z83hpNjhi67C6nOkiNCuvvrAT2cfckYzd9CcsIbLHsmfk+3xfTTI+6mpU96JVxnRsiRQgBD2TEeayZ1quz0m6BbpfygfT/XU24f0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYv6QrWtGbEi1eHrenFTa8MsIg8lz/jVXMNUD1DRKEA=;
 b=YuExWOQQVxztU4eMqXjuNRwFjKSeHp5fYJUcmmF+WFllm1yirpuHgIORgNyD9ScuTxmuj5g9CwvoKbNZ5//H6BJ95YAaNoU/VpsAHHX9Fn29LullWngYb+HBi57CdAzzqwyMufM6NZiWa+vQxf9Bq5HN3gxfO1p2NaR2HkDgA6oeDCLWbX4K9sRQiVkMAdshxcp9pBswsVMWbyqTIb15tBuuwo2DVBI/IaOuJJsog4j6QmihIDzILKjYLDzCND7d7cvMjjlrfuUcbvKCwfKTmMiat5utV2R874IWxgSZbTza3Si0uHQQToAz74HtmQmUViMpHUrDK69wpKWhrbLTgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 15:03:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 15:03:34 +0000
Date: Tue, 2 May 2023 15:03:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 09/14] drm/xe: Add GuC Submit Engine snapshot to
 xe_devcoredump.
Message-ID: <ZFEmNgxw9FUQk1yf@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-10-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe3fe05-9728-48e5-d488-08db4b1e6657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zn2vQ/RvaxcPiS7C5xbHVGsSWMQKFoT0kbuFF4AhlFR5+pl3ix5TJrwIugPENh4FF7Z61h9erxtir9tIKx7DDoooiEfh8BOm7PqQwi8o9dNtsEQxG/wHm+TTPWK8Qh+QEcNZa3PLwsw+Va+sOtAPBrt/65xaqNB+T50dKi8cyuEE3Zhthd2oyssEHnLvH6FUtbqBWhUO6MJLIpSCuEqIIcdQ7r/8Pd+MUK1N104MLIuTlTBEJT1bKhWYXetAQxQy5A8ZI+Bn1pvLtn1HE2cpvO9XvGqaUJWSs8aTE/QW34Supcv/mEVxAJCRBRDJXWDS/+TvWuFtJN+xH0sVF5OaEDnBlpTNET2A4JbnEMP8GIfG76A5Uy2LrCwHzvrrslbzoVZ5p0F461t+TYnDJvwcNIVzx60Bynhq0sQLyKkJVE1foOSF7/RrSGA+fP6yJihSFo+V3uG0xXd5tcYq0aoPKwUqumWiQiSa0zNAYK25s/glqxwNhI5FF5JlgsX2gGqnp4BFTwqhXwIh8ouA19IbIwCzRyFyJvYc9Fj+H8bH/DQXALKeV0OfwfU+pwcpDUmW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199021)(6666004)(478600001)(82960400001)(450100002)(6636002)(5660300002)(4326008)(86362001)(6862004)(44832011)(41300700001)(316002)(66556008)(66946007)(66476007)(38100700002)(2906002)(8676002)(8936002)(6512007)(6506007)(186003)(26005)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ja+5lTXXARgJ92DOiCVVDvOjUYKTWKFpoc+X+bOXjRa7otfHAND8b9nSzc6A?=
 =?us-ascii?Q?Zx/1kXnPMp1fmKOBIL3GHbimU0m8RdrtbSs7VbO05RzQSOduspAZILd/HtnX?=
 =?us-ascii?Q?bLe050DXG3DgviMwEi6fxb9ySpTXltZ5i4FI1/VSiGW03UH3WuWxKFep4Woi?=
 =?us-ascii?Q?+Cyq/uQfE7yU1Zdu2hGtWcjSd1O4vX+aOhUd1A5jxnqecZBALBUbmolknPl+?=
 =?us-ascii?Q?YvKp4ZuRPMjIpOS9aQUY6uT7qiSb+4RYsbwamluSwvi0s5TSHevi+AxO9xAP?=
 =?us-ascii?Q?4FOyMt9kHjqbfaV0ONKloLDLEkWVab+MZMoLYqBqH+z76oj2+Sgi4s9/UnDZ?=
 =?us-ascii?Q?EKaUH+GxAZj6t67X0Nyl74Z7L+uayHf3ql+AZq2QraJ5ZBbnCelxeUGzbMki?=
 =?us-ascii?Q?HuV3Z91IRk949xnsdZE50uE9oC4S0shtFK48d152Qx+l3gg3hU/jzhLs1nFN?=
 =?us-ascii?Q?vwXt7XW6cw8eCpWzeC93mI2hk3RPSpJh18hgWWGS7ZN1rxMU4CvdOnQPRB4x?=
 =?us-ascii?Q?8n5uHoUXB0JAHlhEVOmGQxUAtyprPicc1zDPVWnePrktJfa1Gej557AMSLcR?=
 =?us-ascii?Q?ST80XZzf6tdFfi9Y4UrHopvuGTVPJAQFkW0WVgDh3F+8B1iCLeQYTZQ3sdCb?=
 =?us-ascii?Q?5XnllyzFcoBMa+Kb4cg+qLpIHOlFC9iQ9FVZUAQdbC+RIDKW9h6St3EoyYyJ?=
 =?us-ascii?Q?VrPFGdaAuyMI93JlY5Ms+KDUNfADYeLsJTPWOeuhzcCLyA/ZH+xqjMT/Cw8h?=
 =?us-ascii?Q?l11Ok5MGz/vmRlZ7k9SVliYzs9QxcskIo2Vh5CvNfDt2ljPUBr8XP1mV+yjB?=
 =?us-ascii?Q?RYECTER/Z6GvSzGUjM29UXYSD85F+LJ6HVD0StEYpn25q8fraFsSjNUHFatw?=
 =?us-ascii?Q?9J9ODxy+iV91vcUkYK9G26Jc6QN2ouZIYrxl1ecjpjazWztKqc2jTg+9Z4VN?=
 =?us-ascii?Q?aDksFVV6CnglGZcSAVOPHHgarQm4W5aJbW2iWm2kAoOTMGr71bLAjqihQkFx?=
 =?us-ascii?Q?kkRTRC0dN/yrxJD7FpBf04rl3slvZdlCOioj7rAr1DmvkRwm54bznODA22bu?=
 =?us-ascii?Q?0sd2S6xa2jW1myDwK8ZiYNc2+RA/2KW24BRtotd3qTt4DJd73CS76pwS4q2l?=
 =?us-ascii?Q?n9uolcXb5q5k7JKanUvGD4FuBoWVwiJlVyU7nhYA8nxf9fjoc72AJp330E2G?=
 =?us-ascii?Q?Rzaj+Xp10E8ym7DqJqdXdt2cJmcdGvtmJgcBbc55u5UJae2aIvYVzeey3IeY?=
 =?us-ascii?Q?2SiPWpcRDWGe8jtrkz6aQPzoQfUFaRHJur+UOHEj0VBnK+M1GOosttLlxWD5?=
 =?us-ascii?Q?qO34LZioh3Avhp08RrHKTdE8ZDpNdoA9KWGX2NVZcW+bV3NdsxNkOKUS+Vxr?=
 =?us-ascii?Q?Zb+GP0t7JNogLgJalgxbIuS6u3BGlgtd55XFfC/yH0l4IsWJ3aA2GZpBAJCi?=
 =?us-ascii?Q?sUVWyr1LijH+J0pAAXy833JGw4t7h+ThAfX6iWmHDVaGnO9JEEKEmhyZKMCH?=
 =?us-ascii?Q?llPmklPJAK8duHWg5Hwm6z9UBQdQU2pkiWblv0y4uPidcpSewF7P6ag5RpG+?=
 =?us-ascii?Q?Gq6v4kJBCW6MSRJCN6huXw3jlAfbMui+tQXOCsAJe0bdqT3n6pIRb6AOm8vo?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe3fe05-9728-48e5-d488-08db4b1e6657
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 15:03:34.2969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CwJRDxlJIOCohQmMHGudbsF1rDKPIdxUToV5Z4LvwXOVtBVfchK3UG3V5cpD7ZtQe0XY75q4LuRtsSFgFJuBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

On Wed, Apr 26, 2023 at 04:57:08PM -0400, Rodrigo Vivi wrote:
> Let's start to move our existent logs to devcoredump one by
> one. Any format change should come on follow-up work.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 7 ++++++-
>  drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 ++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 795581c58d90..0e7ec654a9f2 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -12,6 +12,7 @@
>  #include "xe_engine.h"
>  #include "xe_gt.h"
>  #include "xe_guc_ct.h"
> +#include "xe_guc_submit.h"
>  
>  /**
>   * DOC: Xe device coredump
> @@ -89,6 +90,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  
>  	drm_printf(&p, "\n**** GuC CT ****\n");
>  	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
> +	xe_guc_engine_snapshot_print(coredump->snapshot.ge, &p);
>  
>  	mutex_unlock(&coredump->lock);
>  
> @@ -106,6 +108,7 @@ static void xe_devcoredump_free(void *data)
>  	mutex_lock(&coredump->lock);
>  
>  	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
> +	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
>  
>  	coredump->faulty_engine = NULL;
>  	drm_info(&coredump_to_xe(coredump)->drm,
> @@ -117,13 +120,15 @@ static void xe_devcoredump_free(void *data)
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump)
>  {
>  	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> -	struct xe_guc *guc = engine_to_guc(coredump->faulty_engine);
> +	struct xe_engine *e = coredump->faulty_engine;
> +	struct xe_guc *guc = engine_to_guc(e);
>  
>  	lockdep_assert_held(&coredump->lock);
>  	ss->snapshot_time = ktime_get_real();
>  	ss->boot_time = ktime_get_boottime();
>  
>  	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct);
> +	coredump->snapshot.ge = xe_guc_engine_snapshot_capture(e);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 1e44d5346364..e055b266af70 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -27,6 +27,8 @@ struct xe_devcoredump_snapshot {
>  	/* GuC snapshots */
>  	/** @ct_snapshot: GuC CT snapshot */
>  	struct xe_guc_ct_snapshot *ct;
> +	/** @ge: Guc Engine snapshot */
> +	struct xe_guc_submit_engine_snapshot *ge;
>  };
>  
>  /**
> -- 
> 2.39.2
> 
