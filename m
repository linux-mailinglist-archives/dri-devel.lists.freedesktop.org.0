Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA65A2C03
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 18:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A171C10E996;
	Fri, 26 Aug 2022 16:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1600510E996;
 Fri, 26 Aug 2022 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661530118; x=1693066118;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3x92Bo154u6CWPblqkaCj0UcO+gtETn6azuc7XEO85w=;
 b=IoW9BG6HVInDQ9l5DbYhLBbmie222/Ee+7kyPkyAOIlDnBMoEBDKUDRW
 aJzK2ipqTbuoc7ksV1vKyHcq6p3/d+PM7uNXmwFdNdvoUJvPRoLiSAQ2n
 fMQ1ExgiuAjEb1m5YaZDSBIF635H5jzRZT4uACNT1cS1JQuNsj1cAy6Rj
 WCFyYMTMKSUxzCbTvxrpYQREKhO+XdSyYucmpNIgmuKRZtKw6i8TFzV6+
 2BZ+fWKVSRMHVtyz2XfRejVpJlDauwELQWIKKN9UWsiFWFc8cr/7cW+mC
 BuiotM7Ll16D2XlXfF2vww6/wONM7M/GhLjPflhditxj6RSz1Knoshvol Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="356254063"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="356254063"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 09:08:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="736670457"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 26 Aug 2022 09:08:27 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 09:08:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 26 Aug 2022 09:08:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 26 Aug 2022 09:08:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTGzvnNE9y5RA4pODtCrgNFImAnmiV8hk+EAL1/oC+8XHv4bRv1BqN7QudoKCGrTZ541aGbETmSm6aRDs1bR+iPoayU9iJxXZI4LciyQOzhY8Thq9ggbL4CKAjXBykY7bfA3MqOlym9Wqjz/+MuAimj2eE157cP9VmBabyHF4ro+CsvLu7Rb+GNWwICt4noGy9tAuWZURFF4Un5YcBryUHtIb55U39ZNznaonBxXWJTriJ3Rv6UT/cYXjz45Ump5ubJFrwlxUvcOwMO5GC6UybUpx8h4jLGWJw13zSY7ze5aDoDW7QTHVz13n3m5p7ClYPCUNRkrZ+3NaM0gYiUzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c37JdbctJJ2qF/Xi0796Tj47urgXfyRVpmqw7CueRRw=;
 b=Ln5pjq9TOg0tmfuwWSaCBqddnjohse2V0Pr9fDXDbE/aQ6W2rEYjlyqMe7/sUMAeZwhmMcw95Sf1XobjMKGa6lX5cjRfH9dPTfjto+LrRyUJgWWorXZDm8eOuLxVpCM38x/oY/p60a6SENhMjorzXqHVoaZWar5+Jr8xzOp39Q4UG/XodNtiMFOfdGWt2u2ekodZ0h03HZrPpqKl5GG71P2QY2wr364iW6AxnbdIBRc8RXrxlXDF5Y2jhUIA+AE+I7DdF/y3Qn9HKdMGtxdTVKELVarQl3z8HQ7gst7+x2hy2qHDkPA6AthC7edMsHVAsCpUTB9osP9e7XRp6oct/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MWHPR1101MB2336.namprd11.prod.outlook.com (2603:10b6:300:75::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 16:08:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4%7]) with mapi id 15.20.5546.023; Fri, 26 Aug 2022
 16:08:23 +0000
Date: Fri, 26 Aug 2022 12:08:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/guc: Remove log size module
 parameters
Message-ID: <Ywjv8k2ztsFNOC/Q@intel.com>
References: <20220826092343.184568-1-joonas.lahtinen@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220826092343.184568-1-joonas.lahtinen@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::49) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4aa90247-9d7d-4fa2-983b-08da877d3387
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2336:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +UWl1OIuJFF61cC/XbvOENpqkEn53j5kVw7k0Cp33eOPNSKx8cNwNvdZW+E+9dCrvmwWi2U/TnkETpYECfaPVEe5RumMF040kPFwgh1Gv7XhCyYWu10pivbqPbXnqeup/Q8xs7tIYm2SKyFFz4z+HBBEH+3K86DDmnBAqH2PBwoCZpNCI8OcRp1qvWLnxPplXq9pbLYZnVcHT5lh4Uvo40XXyeLYJpEpihElxVJVkdRmbXxxHmd4pCetRUmuut4TyFVMlg/74Y4x70mQZBsiZ0XvUvCJagkLosJQHf2wiQVCuyIYUy6YkZIPdf2KeKYa+9LZFg92tQth//OCrMIxeFo4hovVT9gluKICgq/R3cAdAuM7nGbEZJwAc44N60EI6KLZsi3IlH2LiO0MSii7j9EVLACafrbiRZ9/7jqm9EOiNXLt3kiAyZ7etnE1wTX5DgHGE81vn0E5pnY09vkzl3yuVy++xa8NRVQyq9pndZzCYu5ka5MyP+2x6GWPZuePDtXCxID+scSlJIqpr/FPS09GV8358OJStx2UHAFnb/DPIfKabKRW6LEuUiypf4ubz8jmGQQv/LD0/rIMfRUZhZiPu6PJzAvO5uejly7qAUe0OFc7A1pGelqXvb0A5GH4n/w66lqeJkdFlfwSBF46QLndaIR+VkjuJCAx5NUAHRLR4Wt9SOmo7eQW+iXgVtz6eQO5DqBK/aNGIpST1JeC5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(346002)(39860400002)(366004)(396003)(66476007)(83380400001)(38100700002)(6916009)(54906003)(316002)(8676002)(44832011)(66556008)(5660300002)(8936002)(4326008)(66946007)(2906002)(6506007)(86362001)(36756003)(41300700001)(26005)(6512007)(82960400001)(6666004)(478600001)(6486002)(186003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?++GCV2/wvc38rdaFehdRChOO6qmS2a27SM+vL0lIOaI/9h6MwKG2NHtamDB4?=
 =?us-ascii?Q?bpSQ/Bgxoob2OX24kMUgp82Cw+X2Zq6iFnZTwuprJIcWjhb3QwMJedi7at28?=
 =?us-ascii?Q?r1SFa/xyn0JaN4rihvEInzkZ9+2EcjDXRA4/VdUgpa+NShi/L60Pq9OsTCGU?=
 =?us-ascii?Q?T5GQZYmTd1CZzSoaPawooJP7K0TRCNbV36gqJYbkd3La1Bb4FsZ/jkt76x1U?=
 =?us-ascii?Q?rX3LNsNy5dHfXJY0w59bCl0qx1pDiAirgCx3F/Da0hsYJDsvkro+rVl97QWG?=
 =?us-ascii?Q?8qz76neX032K7jZHV9iEEpVCwVZ61sEBZt+xrLv04CehIASEK2KZIUTL7vQc?=
 =?us-ascii?Q?XeJxpvVaZZwH62Or/DzfOPkKEKAdr43XH1qVyo+yLsVCdB/1477btgapbt/e?=
 =?us-ascii?Q?pERBdBai0fNEtlPNrrDYVDT4Y0i1JU8JU3hJiV5JxpLF9Fu/k9F2yZorM8Dh?=
 =?us-ascii?Q?hmtnsIXBHbUfDyBiWc74tRagK72cv2ZOB3vc0UnRedK26IGuAblYti4NQ0qd?=
 =?us-ascii?Q?nlHgVPCn7WqWxcmqSLfvewAys1/o5ToG6BhJI6p8b3kVn/c0eGaya+17tU4C?=
 =?us-ascii?Q?6hcCHtEfDmcu3SGjOu65ZXUVnLz8ZKJClh9/90Iy3m0mT42r5FnS0mMcJc4e?=
 =?us-ascii?Q?MpfTuTXkxh/tK3Dw2FBUNtsoI+U/Jws1fb1tLKhYtyAU4OZw5F6rXgDGY4sX?=
 =?us-ascii?Q?edu5U38AA2WDBtTdH/0xhV+/PwZB2RxA++F4r2wpvH5WsHPidsnqFCcO4CvV?=
 =?us-ascii?Q?35oLtR4IizGjs371YXaLj6XfQaqWJUJE097bhFmM/SKsmwndLTboXNfqWVa2?=
 =?us-ascii?Q?CjHA2+RtQlUX83BsoA23n8/CsTeaWLr0GdtdB9t6gX0HSB95Navj0j0Ld/iA?=
 =?us-ascii?Q?Y3ChHMIDKxIPktHxui9buIyIXkjtJppwlsaM2bvzyGjQzhLkX8OQLTWXCM4E?=
 =?us-ascii?Q?clLtPBfawOKIEPylQMxcrI8RqSOYSQW4zuS6z+tO4XKArnDyPeCggY8CLzwv?=
 =?us-ascii?Q?7sqBAIk3PbrDtD6aa47El3q00ZUAafNEPudf8OThKnF0HM3lQTOc7F+PDmk/?=
 =?us-ascii?Q?3hlXilRmWNCcx1YAMtD47Ze4axRxj7AHfMMrULaah0SG8o9/XT2ZDG/72hkD?=
 =?us-ascii?Q?WUu4S9vBLBZ8IWgHH7kAwdM0b3+XEUvfXo/mYy1/rrKb+qFX6sMiv7QnUW2i?=
 =?us-ascii?Q?cIEgyUJOFyfcCyfUcrBPYYTjFSj98UPd8ENQYDwhzoZ0DIQl8cMsJPkjBehO?=
 =?us-ascii?Q?ZupQkZaT26bQZOKhu6wlU4/eIInJirixnIBCFomTHd7lfY3Onzea8oJL25Va?=
 =?us-ascii?Q?4xVja2eD3KF1KNPbBmi/moSQhHgNmAEhEqxDyrRabrkiEoy4WUBovPaevvja?=
 =?us-ascii?Q?KRVakzwOKp+z1JrtJDVhs29i0DT1aZrV7CC6Ur+2nJvDmYQQ5Ra1GOWxqfha?=
 =?us-ascii?Q?MkpD3yXZPfTA/dT2/WwEqlB3T9qYQYagcaqEKkyU3H85oJkcs62PHd5gvQH5?=
 =?us-ascii?Q?t79sF0qNy4GZgWDZ9l6yzgpR7u+wvP3MAaM+2s4SLTBws5azhKQ72KkFoGRZ?=
 =?us-ascii?Q?KYaTN08SxWhasB/7ZcR658US6xC02gTuHqEN+QLm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa90247-9d7d-4fa2-983b-08da877d3387
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 16:08:23.7332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7ju6Nrkox03pn7KesUtTCRFP83kdmrKGbLbD82daouM/4D5nh//IxLLhBcnR9CNWXEKe5nJFmtBSytSHR2/qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2336
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 12:23:43PM +0300, Joonas Lahtinen wrote:
> Remove the module parameters for configuring GuC log size.
> 
> We should instead rely on tuning the defaults to be usable for
> reporting bugs.
> 
> v2:
> - Use correct 1M unit
> 
> Fixes: 8ad0152afb1b ("drm/i915/guc: Make GuC log sizes runtime configurable")
> Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  7 +++----
>  drivers/gpu/drm/i915/i915_params.c         | 12 ------------
>  drivers/gpu/drm/i915/i915_params.h         |  3 ---
>  3 files changed, 3 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index 3a2243b4ac9f..55d4b8f8e33e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -79,9 +79,9 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
>  		}
>  	};
>  	s32 params[GUC_LOG_SECTIONS_LIMIT] = {
> -		i915->params.guc_log_size_crash,
> -		i915->params.guc_log_size_debug,
> -		i915->params.guc_log_size_capture,
> +		GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE / SZ_1M,
> +		GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE / SZ_1M,
> +		GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE / SZ_1M,
>  	};
>  	int i;
>  
> @@ -90,7 +90,6 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
>  
>  	/* If debug size > 1MB then bump default crash size to keep the same units */
>  	if (log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes >= SZ_1M &&
> -	    (i915->params.guc_log_size_crash == -1) &&
>  	    GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE < SZ_1M)
>  		log->sizes[GUC_LOG_SECTIONS_CRASH].bytes = SZ_1M;
>  
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index 06ca5b822111..6fc475a5db61 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -171,18 +171,6 @@ i915_param_named(guc_log_level, int, 0400,
>  	"GuC firmware logging level. Requires GuC to be loaded. "
>  	"(-1=auto [default], 0=disable, 1..4=enable with verbosity min..max)");
>  
> -i915_param_named(guc_log_size_crash, int, 0400,
> -	"GuC firmware logging buffer size for crash dumps (in MB)"
> -	"(-1=auto [default], NB: max = 4, other restrictions apply)");
> -
> -i915_param_named(guc_log_size_debug, int, 0400,
> -	"GuC firmware logging buffer size for debug logs (in MB)"
> -	"(-1=auto [default], NB: max = 16, other restrictions apply)");
> -
> -i915_param_named(guc_log_size_capture, int, 0400,
> -	"GuC error capture register dump buffer size (in MB)"
> -	"(-1=auto [default], NB: max = 4, other restrictions apply)");
> -
>  i915_param_named_unsafe(guc_firmware_path, charp, 0400,
>  	"GuC firmware path to use instead of the default one");
>  
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index f684d1ab8707..2733cb6cfe09 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -61,9 +61,6 @@ struct drm_printer;
>  	param(int, invert_brightness, 0, 0600) \
>  	param(int, enable_guc, -1, 0400) \
>  	param(int, guc_log_level, -1, 0400) \
> -	param(int, guc_log_size_crash, -1, 0400) \
> -	param(int, guc_log_size_debug, -1, 0400) \
> -	param(int, guc_log_size_capture, -1, 0400) \
>  	param(char *, guc_firmware_path, NULL, 0400) \
>  	param(char *, huc_firmware_path, NULL, 0400) \
>  	param(char *, dmc_firmware_path, NULL, 0400) \
> -- 
> 2.37.2
> 
