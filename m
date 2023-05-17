Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1550A70736D
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 22:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA6410E2AB;
	Wed, 17 May 2023 20:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7629A10E2AB;
 Wed, 17 May 2023 20:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684357162; x=1715893162;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N0tHeUo5pd9MbhuMpL7L8JpYBfnDuYDQN/r8xj/lWac=;
 b=B7Udezoq3v9Fqy4RMwMyJFiZ1jWlXBAqofqTtPpor3PfgzMcMy5cVrDA
 IAT6hRVtP08WskyXPQsuyV8PjqpE9yY3s5eXEv7J4cdfRXFLIvDeWEgE9
 hHxTbaF5fYmcSJYs/RQmML7CSnutDFGcOSw9kpsJ3ArOVskl222VEdBTy
 gkpX3BTYBJrcUEfuSbtzGXXLacSr7fl9qeXHUdeFmivwX5NFyjienzXS1
 X5kDyFS699QsRwxoz7Rx/AHt7CIckfGfJppZ/L1wz7/E44Ymk/5czHb5r
 u+1zivTPvnaHrptvE7rU9Dq1TfOIDOeJR7/epsgFmkESuFcHCyiuRcMfL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="380075173"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="380075173"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 13:59:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="652365812"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="652365812"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 17 May 2023 13:59:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 13:59:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 13:59:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 13:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7+NjToLv3c5oPIumewBrqmRXQrhPsV6W4ipk36LmAFxdRl88CObyDnYldprnnCxQucTW5aN7ts43VEhFNrvjzR2uZeQAxEXN83w4gSzOI0VqYKhdazc4F01K9Gmk1esfVkOIhCRlxwKLJuHIHjiba5v2ZxvY/WuROCq0YejwYzSzeehXHza4qGlbVC456uiuQ36Diqev7KHO9qZvmvkdqWZDTfXIprofHFurhOKEMPzlIAyU58B8S8F9J03VPU9DNGM94JpH8j5K3oTBlc9fNsH8n5blOX8NQAEVjo7bRIKZnjaRjT1YHAktoGIiRd2c9CeBEij5JbXZnKIwwgvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f85ZJkFakLUqt1HflpuAjyLfrlI+r5YOG0TlVtzinHY=;
 b=Ga0mMYjqQKy3oSPWVkP+XmWhMN3rl72TfNSEFFWqymtEMMo0mszzDOId+ZSZXFdaLJmvdSns/Mkod6j3xrML48YjJkHz5UR6sRcw9aBP2qVo9cC/xhopCoarM3vHXwjwZSLi58kYngeX+P96ItwM3psU3sAnDql894feZwLUhhjx2V4e6ayK4OgA+lKHJ/rJqcwpSPsY1LER72LoxKaFhw1KGydCfyJaUmqdDDo3NUxIf6u0ir0CPNgg0aDP56iE6s6NAW4922S7ld9AAfPhk92ICPiFEtg3SEY+ZYxOmM8Ar5ujNf1UjfOu993tX+WEqjkT5Fw5n7YLIECk8z0kyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 20:59:05 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 20:59:05 +0000
Message-ID: <064b5612-c8f6-3310-1323-31886090b39c@intel.com>
Date: Wed, 17 May 2023 13:59:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
From: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/8] drm/i915/uc: perma-pin firmwares
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
 <20230428185810.4127234-3-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
In-Reply-To: <20230428185810.4127234-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ2PR11MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: a829d3cf-c3be-4c2e-521e-08db57198d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6iXZmgj149GxTbJ/c+7dySdwEwdHf6d8u4s/m0K9dDocIiLdIRyb3JhvFO6DyYYJVsDzokfSvItBqdZbtlR0i+AQQLytw28ozsIal3XyGt/quZX8GmNgWSh350NN7+cVryO9gjfAtXOHfNKAA69gK01XWZ+D2APiSHsQE4dCwlyj2evP0JiEB9L3y7kr3hDYAsumAbjYK8bKdr/r8Rl4A2IswUWOhPzc+EhJiXakTqEfOVywumBErg4j3aHeEGMEF5pcTTLFXo0rqvzF8YxdexRYuHH5bxZFv7cDnB0GCjZVl3irxWds4gPqdeFizPJTNKvF5pQ8r0psni/Q95BUrJxhJp/l+90VM5+m+NkBrw8p1eWTwFC4XxfFWgbt1z3TT1QXaa8gQ9a/1DQ+9a/DRFmz8cfWT7xWFGpVrcliDk+Ocru7bKEAgzzErWNdV0NarkRP/JbtIjQHsiVN9tYEBhk2z7ogrth7K4tzjncZU1FSW1ejyp4tBAx7r2WbiCWUteuMnuRHWLKsKTknGKLtWnD0K/pGuqizVR9T2R1r7wmT1R7BFuIl0L6rOqixDp3eDmbq92zMFLRqylW/RFGxz+JIOqMyzah1Tzrmb3GdF6+OTj7096l4+8wJW9ACMxXbXPDbFBx536vBK6f/1QEpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199021)(6506007)(6512007)(26005)(186003)(2616005)(8676002)(8936002)(82960400001)(2906002)(53546011)(83380400001)(38100700002)(30864003)(450100002)(66556008)(66946007)(66476007)(316002)(4326008)(6486002)(31686004)(478600001)(41300700001)(31696002)(36756003)(86362001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkNjUDJ5a2ZINGhIelh4eTQyMFlaYzd0TEdsbjVQbUpEWFJ2VFhBc2dPcW9D?=
 =?utf-8?B?cUVIRHk2KytKQ3Z5NE5LdS9rYkxXTiszQkNaNy9HU2ZwVyswS3hPTDJJZlp0?=
 =?utf-8?B?SjU4YjJyeEZSRlVJdXJOckJraS9INkFFa3NkRHE4MzF2MStmUjBPZ0dSbmpS?=
 =?utf-8?B?WE5rcTUwc0ZNNm5Nd1lQcE5jVXRDdTVnbHVQM0tyN1hPWmU0R3lFQWlydFN5?=
 =?utf-8?B?QWpPMVEyWklVY2pyc2xhUElyaThoOHVwL3RKTHI5R0lwMjk3R2pMOFBqd0c5?=
 =?utf-8?B?SWl5TjJCTVQ1bVBITVl3SFQzTXAyOVNaMVQrbmovVGdyRk5pcHY2OG9xRGNR?=
 =?utf-8?B?MmlVTjlha1hHZ1FyMU1NL2F0bXFxU044WXY0ODJqTVdMbk03LzRwU1h3K2pD?=
 =?utf-8?B?dXNNVFlTN0RsdkM1eGM4TEJPZXM0cGZaV0xWd0JTSG5oR2hpa0o4WlFINzMz?=
 =?utf-8?B?SjBrS3dqTU9TWEU1d1NUcU51SmZ4L2NUT2VCZHZQalFrdSsxdE5NL05Vc1Ew?=
 =?utf-8?B?NjBkbWkzQ29NZDZxWnQyMlNvRmY1NUJBM20raFFDbHNXcHNlVkdiRngvcWlQ?=
 =?utf-8?B?eEJSNFNEZU5PZjFRdGtrdVA2QkRwTi9kb3FLQml3bFBEaVlGMzkvVWpPMVpD?=
 =?utf-8?B?dW1HeHBRRUtOSVVYVGlQSEVvdzhKT0ttT3ZRUkhScFIyaXljMm9JRm1XS3lE?=
 =?utf-8?B?Vm05Q3VSTTVnUVRTek5IUmlpeERGUUsyeUcrZDJoNFhvQ0FyQS9VNEpsRFZh?=
 =?utf-8?B?NFdOckhIQWZHNHFEM3c3UWtpVDBFOXc2OEJ0WHhlRklmUGJpVEdpdnE4aklZ?=
 =?utf-8?B?b2pXeTh0NnlwSlp4VXVaVnN1VGVwWFlaTHROS3lPeDgzYkE5M0xWcEhmZGRm?=
 =?utf-8?B?OEJ2ODdpOXo0VUg2dU5vcEN5TWhJc2MxaHZXTm1NWk53SWpzSWtxa3R3c1pH?=
 =?utf-8?B?SnVzMFZCL1J4REdoalNJRzJvMEI5VTRDcFBEd2JydnZFdFArdENxL2Z5Ynhw?=
 =?utf-8?B?eWZLYU5pTC9wdWVWOHRrc3J3cDhMMU5IRWVCNHVBZWJydlZwalhKcXZTY3Bu?=
 =?utf-8?B?RnlYTlRGR3hZT0hHN1hpMkNTQ0hyUXRETGorTU44SFMwZ00vbUxZN3cyUTBF?=
 =?utf-8?B?ZGxVT2dMVTluYlZqa0cxWWRQN0VScEpVRVBLM0pHVVVmRDVxTVQ0eGR3bzk1?=
 =?utf-8?B?M1ZVYXQ0WTROWlZlNUhISUpmTC9RcnNlOENkTDJRY3JmVStLZm1hWDY5RWJK?=
 =?utf-8?B?dEd3VE16K0wyMXRFSjkvRStrSTNqZXplRjFuQndYaDdLVHR3U2R3SkFGWWs2?=
 =?utf-8?B?NzEzSHoySmJvNVFkNklDaWVRdkUweTFPRzVQMDZtUE9ObktBb0w3Q1R1UXli?=
 =?utf-8?B?c1dwVmtiUmtObFlVdEkvbGpRZ09jZktkdmIvZElva1hpNkhZS3FTaE9va2lL?=
 =?utf-8?B?bENyelkzeGtWL2RLbzY4b0JZaVB4cUtibS9GUDlsT251RkZGU3NWR0JOZUFz?=
 =?utf-8?B?SE5TaG1uZzN5cnhPeWJ1QXlQVmlyOTBLSTQzTThRT3B3SzdLMmxFOG80WU1M?=
 =?utf-8?B?U0VQSmorY1Q5U1ZNMGRySVJnZnlWMFdGQWhQU094SG8ybFlMVUdzSjBjUTJB?=
 =?utf-8?B?ZkJ0eVQ0Z1ZQSkIvQnMwZUl3Vm9seVlraWlTbkVtbitiMFRMRWtoL2cvZS9R?=
 =?utf-8?B?MER5MFFIR3hOdzg1dzJ0SkhIdkFFdWJDSnNmZDBqYk1mekFnRTJCVjNJQjdk?=
 =?utf-8?B?ay9sK2dBeHQ5NVUvMXl4SlJVUTk2djdhQ3ZTZ2VCblVNRXJUSHluK01GTjBN?=
 =?utf-8?B?ZjZ1SFFnOEoxeVpJTFY4QzZwN2N2cDZiaCttMk9kYnJjL3ROc1g4V2h2MmRO?=
 =?utf-8?B?UTNDU1JjYVJNWEFOdG1Qa3g3cHVtazF0TUlxRll3QTA5ODB2N20xbzBNbXNu?=
 =?utf-8?B?RTA1L1N0WEF2ZU9jUmtmYTZrdkEvV0thQVNpQWVJSWk1QTg5bTdnRDVlUzhj?=
 =?utf-8?B?SmJ4SkZCYjh4bzJPRXp2eW1zbU5BUm1BcGQwb21uVGNoZmFaZEgyUzA5RWw0?=
 =?utf-8?B?TE8zVkVBOG04eHB4RmZoVUlmU1ozNEw2YUx0SkxWK3IxMk5PdUR1WTNQT0RM?=
 =?utf-8?B?dEY2R0I3ZlZkdDJQT3RGVU9HRHNCMXlaZTJ0NXNlR3g0Vi9RemhkaVloclI5?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a829d3cf-c3be-4c2e-521e-08db57198d08
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 20:59:05.7946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2Bpu9AISUAADdXxJ6g6L3uAXiLbCkgU85FNLpGmAjYcd91QuqujtxQ95PLCMH56qhFiOqktyU3NTHc1SD7q1xp0Yzb6/L1k8oD378dNm/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/28/2023 11:58, Daniele Ceraolo Spurio wrote:
> Now that each FW has its own reserved area, we can keep them always
> pinned and skip the pin/unpin dance on reset. This will make things
> easier for the 2-step HuC authentication, which requires the FW to be
> pinned in GGTT after the xfer is completed.
> Given that we use dummy vmas for the pinning, we do need to explicitly
> re-pin on resume because the automated helper won't cover us.
>
> Signed-off-by: Daniele Ceraolo Spurio<daniele.ceraolospurio@intel.com>
> Cc: Alan Previn<alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_ggtt.c      |  3 ++
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c |  7 ++++-
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  8 +++++
>   drivers/gpu/drm/i915/gt/uc/intel_uc.h     |  2 ++
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 36 ++++++++++++++++++-----
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  5 +++-
>   8 files changed, 53 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 20915edc8bd9..ab71ed11de79 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -1322,6 +1322,9 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>   		ggtt->vm.scratch_range(&ggtt->vm, ggtt->error_capture.start,
>   				       ggtt->error_capture.size);
>   
> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +		intel_uc_resume_mappings(&gt->uc);
> +
>   	ggtt->invalidate(ggtt);
>   
>   	if (flush)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> index 64bff01026e8..af542e3cb3e9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> @@ -80,7 +80,12 @@ void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc)
>   {
>   	struct intel_gt *gt = gsc_uc_to_gt(gsc);
>   
> -	intel_uc_fw_init_early(&gsc->fw, INTEL_UC_FW_TYPE_GSC);
> +	/*
> +	 * GSC FW needs to be copied to a dedicated memory allocations for
> +	 * loading (see gsc->local), so we don't need to GGTT map the FW image
> +	 * itself into GGTT.
> +	 */
> +	intel_uc_fw_init_early(&gsc->fw, INTEL_UC_FW_TYPE_GSC, false);
>   	INIT_WORK(&gsc->work, gsc_work);
>   
>   	/* we can arrive here from i915_driver_early_probe for primary
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index c9f20385f6a0..2eb891b270ae 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -164,7 +164,7 @@ void intel_guc_init_early(struct intel_guc *guc)
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	struct drm_i915_private *i915 = gt->i915;
>   
> -	intel_uc_fw_init_early(&guc->fw, INTEL_UC_FW_TYPE_GUC);
> +	intel_uc_fw_init_early(&guc->fw, INTEL_UC_FW_TYPE_GUC, true);
>   	intel_guc_ct_init_early(&guc->ct);
>   	intel_guc_log_init_early(&guc->log);
>   	intel_guc_submission_init_early(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index aefdaa62da99..9721761373fb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -276,7 +276,7 @@ void intel_huc_init_early(struct intel_huc *huc)
>   	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
>   	struct intel_gt *gt = huc_to_gt(huc);
>   
> -	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
> +	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC, true);
>   
>   	/*
>   	 * we always init the fence as already completed, even if HuC is not
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 996168312340..b6adfda3761e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -697,6 +697,12 @@ void intel_uc_suspend(struct intel_uc *uc)
>   	}
>   }
>   
> +static void __uc_resume_mappings(struct intel_uc *uc)
> +{
> +	intel_uc_fw_resume_mapping(&uc->guc.fw);
> +	intel_uc_fw_resume_mapping(&uc->huc.fw);
> +}
> +
>   static int __uc_resume(struct intel_uc *uc, bool enable_communication)
>   {
>   	struct intel_guc *guc = &uc->guc;
> @@ -764,4 +770,6 @@ static const struct intel_uc_ops uc_ops_on = {
>   
>   	.init_hw = __uc_init_hw,
>   	.fini_hw = __uc_fini_hw,
> +
> +	.resume_mappings = __uc_resume_mappings,
>   };
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> index 5d0f1bcc381e..c2783e6e752b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> @@ -24,6 +24,7 @@ struct intel_uc_ops {
>   	void (*fini)(struct intel_uc *uc);
>   	int (*init_hw)(struct intel_uc *uc);
>   	void (*fini_hw)(struct intel_uc *uc);
> +	void (*resume_mappings)(struct intel_uc *uc);
>   };
>   
>   struct intel_uc {
> @@ -113,6 +114,7 @@ intel_uc_ops_function(init, init, int, 0);
>   intel_uc_ops_function(fini, fini, void, );
>   intel_uc_ops_function(init_hw, init_hw, int, 0);
>   intel_uc_ops_function(fini_hw, fini_hw, void, );
> +intel_uc_ops_function(resume_mappings, resume_mappings, void, );
>   #undef intel_uc_ops_function
>   
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 6b71b9febd74..03f0b258aea7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -422,12 +422,14 @@ static void __uc_fw_user_override(struct drm_i915_private *i915, struct intel_uc
>    * intel_uc_fw_init_early - initialize the uC object and select the firmware
>    * @uc_fw: uC firmware
>    * @type: type of uC
> + * @needs_ggtt_mapping: whether the FW needs to be GGTT mapped for loading
>    *
>    * Initialize the state of our uC object and relevant tracking and select the
>    * firmware to fetch and load.
>    */
>   void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
> -			    enum intel_uc_fw_type type)
> +			    enum intel_uc_fw_type type,
> +			    bool needs_ggtt_mapping)
>   {
>   	struct drm_i915_private *i915 = ____uc_fw_to_gt(uc_fw, type)->i915;
>   
> @@ -440,6 +442,7 @@ void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
>   	GEM_BUG_ON(uc_fw->file_selected.path);
>   
>   	uc_fw->type = type;
> +	uc_fw->needs_ggtt_mapping = needs_ggtt_mapping;
>   
>   	if (HAS_GT_UC(i915)) {
>   		__uc_fw_auto_select(i915, uc_fw);
> @@ -699,7 +702,7 @@ static int try_firmware_load(struct intel_uc_fw *uc_fw, const struct firmware **
>   	if (err)
>   		return err;
>   
> -	if ((*fw)->size > INTEL_UC_RSVD_GGTT_PER_FW) {
> +	if (uc_fw->needs_ggtt_mapping && (*fw)->size > INTEL_UC_RSVD_GGTT_PER_FW) {
>   		gt_err(gt, "%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
>   		       intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
>   		       (*fw)->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
> @@ -880,6 +883,9 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>   	struct i915_vma_resource *dummy = &uc_fw->dummy;
>   	u32 pte_flags = 0;
>   
> +	if (!uc_fw->needs_ggtt_mapping)
> +		return;
> +
>   	dummy->start = uc_fw_ggtt_offset(uc_fw);
>   	dummy->node_size = obj->base.size;
>   	dummy->bi.pages = obj->mm.pages;
> @@ -901,11 +907,13 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>   
>   static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
>   {
> -	struct drm_i915_gem_object *obj = uc_fw->obj;
>   	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
> -	u64 start = uc_fw_ggtt_offset(uc_fw);
> +	struct i915_vma_resource *dummy = &uc_fw->dummy;
I'm confused as to why this was using uc_fw->obj previously? Why was it 
not originally using dummy? And why if that was correct before, why is 
not correct now?

> +
> +	if (!dummy->node_size)
> +		return;
>   
> -	ggtt->vm.clear_range(&ggtt->vm, start, obj->base.size);
> +	ggtt->vm.clear_range(&ggtt->vm, dummy->start, dummy->node_size);
>   }
>   
>   static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
> @@ -922,7 +930,7 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
>   	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>   
>   	/* Set the source address for the uCode */
> -	offset = uc_fw_ggtt_offset(uc_fw);
> +	offset = uc_fw->dummy.start;
Same question here.

John.

>   	GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
>   	intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, lower_32_bits(offset));
>   	intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, upper_32_bits(offset));
> @@ -996,9 +1004,7 @@ int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
>   		return -ENOEXEC;
>   
>   	/* Call custom loader */
> -	uc_fw_bind_ggtt(uc_fw);
>   	err = uc_fw_xfer(uc_fw, dst_offset, dma_flags);
> -	uc_fw_unbind_ggtt(uc_fw);
>   	if (err)
>   		goto fail;
>   
> @@ -1102,6 +1108,8 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
>   		goto out_unpin;
>   	}
>   
> +	uc_fw_bind_ggtt(uc_fw);
> +
>   	return 0;
>   
>   out_unpin:
> @@ -1112,6 +1120,7 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
>   
>   void intel_uc_fw_fini(struct intel_uc_fw *uc_fw)
>   {
> +	uc_fw_unbind_ggtt(uc_fw);
>   	uc_fw_rsa_data_destroy(uc_fw);
>   
>   	if (i915_gem_object_has_pinned_pages(uc_fw->obj))
> @@ -1120,6 +1129,17 @@ void intel_uc_fw_fini(struct intel_uc_fw *uc_fw)
>   	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_AVAILABLE);
>   }
>   
> +void intel_uc_fw_resume_mapping(struct intel_uc_fw *uc_fw)
> +{
> +	if (!intel_uc_fw_is_available(uc_fw))
> +		return;
> +
> +	if (!i915_gem_object_has_pinned_pages(uc_fw->obj))
> +		return;
> +
> +	uc_fw_bind_ggtt(uc_fw);
> +}
> +
>   /**
>    * intel_uc_fw_cleanup_fetch - cleanup uC firmware
>    * @uc_fw: uC firmware
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 6ba00e6b3975..26a9d6e0dc00 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -105,6 +105,7 @@ struct intel_uc_fw {
>   	 * threaded as it done during driver load (inherently single threaded)
>   	 * or during a GT reset (mutex guarantees single threaded).
>   	 */
> +	bool needs_ggtt_mapping;
>   	struct i915_vma_resource dummy;
>   	struct i915_vma *rsa_data;
>   
> @@ -282,12 +283,14 @@ static inline u32 intel_uc_fw_get_upload_size(struct intel_uc_fw *uc_fw)
>   }
>   
>   void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
> -			    enum intel_uc_fw_type type);
> +			    enum intel_uc_fw_type type,
> +			    bool needs_ggtt_mapping);
>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw);
>   void intel_uc_fw_cleanup_fetch(struct intel_uc_fw *uc_fw);
>   int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 offset, u32 dma_flags);
>   int intel_uc_fw_init(struct intel_uc_fw *uc_fw);
>   void intel_uc_fw_fini(struct intel_uc_fw *uc_fw);
> +void intel_uc_fw_resume_mapping(struct intel_uc_fw *uc_fw);
>   size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len);
>   int intel_uc_fw_mark_load_failed(struct intel_uc_fw *uc_fw, int err);
>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p);

