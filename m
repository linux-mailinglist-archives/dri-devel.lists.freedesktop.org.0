Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2C2856F37
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 22:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1C310E812;
	Thu, 15 Feb 2024 21:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvH2/UNs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7A910E19B;
 Thu, 15 Feb 2024 21:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708032215; x=1739568215;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YtNmKLX0uV2IbAQdt7QCikQXNgufo5j0xUkAApH2FIo=;
 b=HvH2/UNs0a1zaN9eXNWSvzpw4KJXwkujFFZ4X0V1QOQGOGEjqtlmlLe9
 PGs/4ZtWbXZLsZd04G1LlhtZ4MslT8QdKfE2u3ekfyyod1VjPRbsoyt2A
 scBYTvC1HzIwpAZwDk2uEN6vIa4PB7Dvc5pAw/oyNTqnGspuAIjtULbRT
 psOLn9qnBdtv3zJxHfWRDuseqbfHKwGBxgvGcXNRxvq325N25HN71aEsV
 38HG0zCb9G/F5JrzYqrzI2rP/NprltXbAo0DcHNUz8G5rWDGHSNeS5Ymx
 3brbCHWLNUGc6g6svnS+tAO7ap4u7HUYhmyOoM4OVqn8Hx9/KvUL8wd5d g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="5959234"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="5959234"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 13:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3820369"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 13:23:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 13:23:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 13:23:29 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 13:23:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeGG1+mh5UdMxSuBmD8eD8hpAehxCWVd8Y3bEjoFJ5579+0EhrTc6WfOb8uEML3ogdmQFvhBbOc51XLSanpgHKc8zZVhhJ4GoBpIGGi8dj/NgzQEfS1Utvk55Q80BO+UVttPF0t3o3gR+l1xU3D3iXv5JHt5V4R/K6LtptgSogLmjCTUMx1mD32HCn6QLLdUjfD1ZTnMnKyfVNeskbSXKNq0yxGDLObKdzlbv4ezvHXelaelG1loPFI8rDPn3MiQK5lkplYQ1SUb7Re8+0e9BUeviNnbu9CVV187ABYbCBJDTKGDZRMhI6EleVRvsXAwzrpaUmUAtUrp3r0d9Boj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoFObjbQkDiLaeoiSa8AwmRlHFwZp9J0LSDoNgbqvr4=;
 b=FtrPJEQAz+Hav0rW3yeTr0hLVG5UqxM58VA4h4rUbh3SdWFNPmtjfItmZslMRCXOSxuesLKrBGi0HEqQX/79CfapdMHrYeyreA+lvk+IJt1XGHqq61xHBVYxkM2gi3UvUvw1UQJ6j2Q5mFk7NXgpb3/axpnouO3wIRW3A53AioHypQ8EthY7k3qbsiGdemaaHgR98yQa04Wn7vaKEFxan6af2L9zTpBGSlUGpiYKl/pSX2sfSowZiWmVRFbEqlLQ4PtJvnz2gfpbjdvef5h3KnfMwWEE1d0yqCjxHhjGErf/ouHIHyC6kj6vRO0y39iI2E4n/h2rPLM+UF7RMtVQgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB7961.namprd11.prod.outlook.com (2603:10b6:510:244::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Thu, 15 Feb
 2024 21:23:28 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7292.026; Thu, 15 Feb 2024
 21:23:28 +0000
Message-ID: <be6484e3-d209-4109-97e9-efe02e4e570b@intel.com>
Date: Thu, 15 Feb 2024 13:23:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/gt: Set default CCS mode '1'
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Chris Wilson <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 <stable@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
References: <20240215135924.51705-1-andi.shyti@linux.intel.com>
 <20240215135924.51705-3-andi.shyti@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240215135924.51705-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0010.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3f90ae-2af5-4bee-e8c3-08dc2e6c59c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AG+ugXOxSo/Hh2IxPMoS59/2uG+EXPPU3RzcrboEZ25lqSYkp4lHZPW1H+WIL/UQEfKMI7REXgIoJGvRTo5Qyi33w7gW2/Hn6LgQGna6nLXXnInebP7/X4lCairVLYg9yy7ONPp4DdW1aIWXQfacR8JdYQOG7qjJ3sddJu9bPrw/MiQ3KxU+/BPHS1nw5qqHT5Ayk3Vi5PHdtdWFWjUJiyybig6hqskKpHKamAukKOc1+O56Cn9xUl1hKpPf2jNvfpXQhXGHgImwsKgLGBGgs+RntjIxl8wSTTAUImhfwB90vB8af7gbTq8wJaKDmr1TXvTnCoZRdfRb8w27NpgPUI/C3QiIEE5yKXUDLb0ZSuuADMoNrt/QXOi52IPI0iXVg2N4pRmJyUfBNVgjv471D3tMiA7owQWLHI1yCA6A99oG17DX4QEItbElJYMWv4/3TwqnD2iB3QxTLMFcZKTy6pkW3Sa7Qikbg7gvfaV295wTlrdzoe6wv3q5yA9BDGYDHtY2f8ZJqWqgeRtz3SLm37PDT5uUMEJc9M79gSO1qqGfzkSMB8ZOwFwKqCo+Qc9m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(2616005)(41300700001)(83380400001)(8676002)(8936002)(66476007)(66556008)(66946007)(53546011)(4326008)(6512007)(110136005)(316002)(6666004)(6486002)(6506007)(478600001)(54906003)(36756003)(38100700002)(86362001)(82960400001)(31696002)(26005)(2906002)(5660300002)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODZoNFF1MFF5dkl0UEliUzlicjlUcXNKNXBLMCtST3plbGMvWWFvQk56SVJ4?=
 =?utf-8?B?c1RRMzdIT3JaRVg4QTdGZTBPSHp2R1lVMWd2RkF3QjEzODRFNk52K1BhaGF3?=
 =?utf-8?B?N2F4ZURCT3puQ2JLYWJYeTQvRmRmMzVQQUU0cFRlc24vKy9hYllvTkFnWk9S?=
 =?utf-8?B?VHVrWk5BRWt5T2x2Yk8yaHBScGl3R3VWUkNoZktwTmExQlpIMEduMjRYdGgy?=
 =?utf-8?B?algwYWdGbU5NY3llYzh6bm5RWUJlSnMwcEd3Rm5MS211V1B1ODR2eXprZGhO?=
 =?utf-8?B?ZlR0RDVYamsrbHBnSnAzUmc5VFloZG5QdFcyb0xYY1ZpYzZtUmUrSG1SSVY2?=
 =?utf-8?B?UUM0bkQzOVo0SEQ0a0RNam15aDJXVVdKRExnUm5aNThudTZROU8vTGxFU2lS?=
 =?utf-8?B?YkZZb3dmclpqS3hvVGFKTmNRY05JSlF1M1k3RUVoS21WSFJnY3RNOTkxUDd5?=
 =?utf-8?B?SVYwN2xLa3FBUkQ1VTZLd085RTdjYmFQMW5MZEZ0U1ZTM2NnWUhQdnZzS0dE?=
 =?utf-8?B?S3BjaEM4OENJdzdwUmNaN0IwQzRPREZGZWRiR0JTaEdUN0VmOEg0enQzb0ww?=
 =?utf-8?B?bktHczUxUEVIRXM2VkhhWVNBS2Q0bGovVndXMldwNmxxOU5sM01EYWNnR1BL?=
 =?utf-8?B?MFhTNiswWTdaOStFYlYxa25LK1dXSy9GTWVyL0RWRlNKY0ZRQ0lwS3M0ZXc4?=
 =?utf-8?B?MDNuandYQW94dDByeHRYRmU0WUN6MzBsbGVWTVdqUEdpeExDY1dmbVJucUF3?=
 =?utf-8?B?Q2ZGWFJ0bGVCN2N0UDcwY0tDLzlRcUhvUnk2bjBmNWRIdnZ3dFloWWJFR1BW?=
 =?utf-8?B?cGd6OVlZNy82YWdBZVJLUDBQNmhNRHFyTjE1aE1OU3g1MDZ3TXRIaDIvNXlh?=
 =?utf-8?B?dmc4VzhQeVR2ZGYxck5tQzUwTGNMOXE5SFQ1endTbVdXVGdDdXdQbFZWdXE3?=
 =?utf-8?B?ZElzOEs3M0U1ejRjanovSk1ITDdqWmE0MlNWRm5xaUhkQ1M2V0JOQ2xyRUQr?=
 =?utf-8?B?alpqT08vc2cvMGdpME84RHlIVGpBUkU2ZDB1b0lyUStuM1d3bjB5Yi9yb3pp?=
 =?utf-8?B?RGcxdlp6N1cvS1ZMazV6ZHY4cmVCVDBSdU8vc1Vib0wvbUVCa1lsbnMwNnRF?=
 =?utf-8?B?WllycFJFRlFuRVB0SFVKQk5BU3FTbko0TXdFRnJmd3F2dkUwUFJtZTJXYlAv?=
 =?utf-8?B?bGk4SkFSbFFRQUVvNVFsWHJ3eWVQRXVVbWhDWXdYVjlNMjB1UFN4Y0dXU0RE?=
 =?utf-8?B?NHNWS25sUy9wT2p3MGdFYVppMU9iZXJ0czN6OWE1WklvbllqbW9MR2hYVmds?=
 =?utf-8?B?T24vcTZBUDN1ZkNhRm9USkM1ZUR5MU5QVjVJdDVXd3RIWW83MTI0SldkdmQz?=
 =?utf-8?B?VnRRdWs1bXhBK2pvZHBIUEszWS9xamNuK0hQN0MwNDZOYk44ckRsaTA5N01H?=
 =?utf-8?B?cG1YcFBkNW5RRzNOWHlqcDRJdjVVNDZuZS8wQ0VKUllEdmRDdXNjNWcwV3h1?=
 =?utf-8?B?a2NWcXpRUU9nQXBYYVNZcjFyWmNVMHVRZXVaMDNsM3hnTm9YRHVQcTJmMGw3?=
 =?utf-8?B?Y29MQUlHUVdUV2tpeFYyaUI1aTdlUWpnV2FaZGR3N3FRZFZTZWZBWGEyM2hl?=
 =?utf-8?B?RlhnV0MvQlg2RlR2NVNkNDBCM2FLbGpMWk5nc29pRjE0djZqbi9UY3pXc3ZJ?=
 =?utf-8?B?a0I5akxJQXZGQi9aRFJ6L3VURVFjNEw3ODI2VElZaFVBVU5xMjZMWEt4c055?=
 =?utf-8?B?NlpjZWoyNjN3QitSemlscGpxQkdpb3lGRk1pbjRRbUhpT0k2M0k4Mi92K1pz?=
 =?utf-8?B?cUlzdjIwcFhSSjRaQ1VLL3hBa3JEWDlzUlhqV2k5RWRQdFB3TkxNYVpFMEZJ?=
 =?utf-8?B?VkFOVnJTM0NQelJKamsyc3RicGI4eFN2ZEJUczVDbUpUMmNZSVJmTEtqQ0Zq?=
 =?utf-8?B?U0h2ZXNqVlpJY0lPRGlxMjJvY1dxWGNzVnUxU2IyUzlzTmlxNURuL0pGTHRZ?=
 =?utf-8?B?MktYelN6d3c2WjBmSzk2dVh2aTBqMjM3WmFUeW0zVE1mcjM3TTBtYjF4Vi9V?=
 =?utf-8?B?TnppMXA5OFdQMndLa25kVGtybzNhSkZjUjR0b3E3NjBJMnNycHZrRU1NWXE4?=
 =?utf-8?B?WnNGK1AvWUs5OXppMTh4SWVQSiszajVwWnExU3NyZDYrNWtFSmZpek1Ec3hS?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3f90ae-2af5-4bee-e8c3-08dc2e6c59c9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 21:23:27.9287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAY9A/uBQL7DtIlb5o5kzQDLxLMdAvpnFcNMXXHty6aRXAuySkrojmWAkIl8tEKWqmjM56ekqXNQkfYavmGBfTn2bWSxDH5hdACoHlKHV2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7961
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

On 2/15/2024 05:59, Andi Shyti wrote:
> Since CCS automatic load balancing is disabled, we will impose a
> fixed balancing policy that involves setting all the CCS engines
> to work together on the same load.
>
> Simultaneously, the user will see only 1 CCS rather than the
> actual number. As of now, this change affects only DG2.
These two paragraphs are mutually exclusive. You can't have four CCS 
engines 'working together' if only one engine exists. I think you are 
meaning that we only export 1 CCS engine and that single engine is 
configured to control all the EUs. As opposed to running in 4 CCS engine 
mode where the EUs are (dynamically or statically) divided amongst those 
four engines.

John.

>
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c      | 11 +++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 ++
>   drivers/gpu/drm/i915/i915_drv.h         | 17 +++++++++++++++++
>   drivers/gpu/drm/i915/i915_query.c       |  5 +++--
>   4 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index a425db5ed3a2..e19df4ef47f6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -168,6 +168,14 @@ static void init_unused_rings(struct intel_gt *gt)
>   	}
>   }
>   
> +static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> +{
> +	if (!IS_DG2(gt->i915))
> +		return;
> +
> +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, 0);
> +}
> +
>   int intel_gt_init_hw(struct intel_gt *gt)
>   {
>   	struct drm_i915_private *i915 = gt->i915;
> @@ -195,6 +203,9 @@ int intel_gt_init_hw(struct intel_gt *gt)
>   
>   	intel_gt_init_swizzling(gt);
>   
> +	/* Configure CCS mode */
> +	intel_gt_apply_ccs_mode(gt);
> +
>   	/*
>   	 * At least 830 can leave some of the unused rings
>   	 * "active" (ie. head != tail) after resume which
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index cf709f6c05ae..c148113770ea 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1605,6 +1605,8 @@
>   #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
>   #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
>   
> +#define XEHP_CCS_MODE                          _MMIO(0x14804)
> +
>   #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>   #define   GEN11_CSME				(31)
>   #define   GEN12_HECI_2				(30)
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index e81b3b2858ac..0853ffd3cb8d 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -396,6 +396,23 @@ static inline struct intel_gt *to_gt(const struct drm_i915_private *i915)
>   	     (engine__); \
>   	     (engine__) = rb_to_uabi_engine(rb_next(&(engine__)->uabi_node)))
>   
> +/*
> + * Exclude unavailable engines.
> + *
> + * Only the first CCS engine is utilized due to the disabling of CCS auto load
> + * balancing. As a result, all CCS engines operate collectively, functioning
> + * essentially as a single CCS engine, hence the count of active CCS engines is
> + * considered '1'.
> + * Currently, this applies to platforms with more than one CCS engine,
> + * specifically DG2.
> + */
> +#define for_each_available_uabi_engine(engine__, i915__) \
> +	for_each_uabi_engine(engine__, i915__) \
> +		if ((IS_DG2(i915__)) && \
> +		    ((engine__)->uabi_class == I915_ENGINE_CLASS_COMPUTE) && \
> +		    ((engine__)->uabi_instance)) { } \
> +		else
> +
>   #define INTEL_INFO(i915)	((i915)->__info)
>   #define RUNTIME_INFO(i915)	(&(i915)->__runtime)
>   #define DRIVER_CAPS(i915)	(&(i915)->caps)
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index fa3e937ed3f5..2d41bda626a6 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -124,6 +124,7 @@ static int query_geometry_subslices(struct drm_i915_private *i915,
>   	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
>   }
>   
> +
>   static int
>   query_engine_info(struct drm_i915_private *i915,
>   		  struct drm_i915_query_item *query_item)
> @@ -140,7 +141,7 @@ query_engine_info(struct drm_i915_private *i915,
>   	if (query_item->flags)
>   		return -EINVAL;
>   
> -	for_each_uabi_engine(engine, i915)
> +	for_each_available_uabi_engine(engine, i915)
>   		num_uabi_engines++;
>   
>   	len = struct_size(query_ptr, engines, num_uabi_engines);
> @@ -155,7 +156,7 @@ query_engine_info(struct drm_i915_private *i915,
>   
>   	info_ptr = &query_ptr->engines[0];
>   
> -	for_each_uabi_engine(engine, i915) {
> +	for_each_available_uabi_engine(engine, i915) {
>   		info.engine.engine_class = engine->uabi_class;
>   		info.engine.engine_instance = engine->uabi_instance;
>   		info.flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;

