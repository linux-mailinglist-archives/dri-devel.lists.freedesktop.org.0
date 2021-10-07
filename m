Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708D1424C42
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 05:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6E96E820;
	Thu,  7 Oct 2021 03:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A196E81D;
 Thu,  7 Oct 2021 03:45:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="226107346"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="226107346"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 20:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="484357408"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 06 Oct 2021 20:45:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 6 Oct 2021 20:45:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 6 Oct 2021 20:45:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 6 Oct 2021 20:45:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 6 Oct 2021 20:45:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlthUAXdcV5dndoUNmR+77M3TcnS03LuU2VWLtOIi81qWbIDhKxXzj3Z03Fh5YiZ2/j8OLaGFF5d7vyuP6LRcjQ/5+mnqrneiiStd7yP46NGbYLtHvq2ztJooQLx5V/00VD4r/h22IpZMRWBmgOBPcenEdN1Fak+YVlsGXz2kaVzwdrhJi16aGnj562OLznrXnEpNN6fzUiJZxgv/A90H+pZSwXkJ9kYPtJhW0EFDQZU02w+Myg7htquBirOLSM4Pmgd41ReDpBodA3YQ2wcNzCVhZ1E7okqeVlNWQL1J1HdxpDL5xj+s9lpaOdJ0EiOUwMpkHEHWsqkr8yxApNSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CgmQjtjIk6GnPKQ1U9ufvnDW+hfYjGBOo3gh6eLHrE=;
 b=L2nw3RTt6Wc76vxxWCKq6p3rLAFf/jnsfyT+hkOfeDdMzFrfidAAmm6GLdJVyyZU1XE0PousQbboGwZ3qOq0XyeA9f/+tYt+xY964CIhwcfNuUoBlXRBrGMgWrS0HRRCTQ5mK67QvlsvP8mSR+3t28mhj4lpfj2HYCIuE7sszgTdhYsHRBlnvyAyunQv0C+7bKxlggJhc41+2Mupf+2LVK+Cx4cuNI4keUBr0kFb37OBCGZGz1KbjxSRYN1uU94S7vkfQ72hlNv5uTnNHM6NKUwMFGc6XGJ3wQYuMLd6v0LkFIucNWInJg0lMGcgBYJZmzOzuQKckzASubiKtPuH4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CgmQjtjIk6GnPKQ1U9ufvnDW+hfYjGBOo3gh6eLHrE=;
 b=PpXCq9yKcI6pNNhYzskZE10J3C1w6NbZdMmgPfKYEG4LH1oKus4R/bDv35PSnfcTAfZ5k5RRauSn/oJ7NgtECHtbTGPq3u5oqoK1EUly9/FAkFpGDtwr4l59kA50gueKFnDN8z6sKu0AvqjDKGYe6BATdOIRWIiuaksYaG4ohcU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5633.namprd11.prod.outlook.com (2603:10b6:303:13c::16)
 by CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 03:45:44 +0000
Received: from CO6PR11MB5633.namprd11.prod.outlook.com
 ([fe80::e577:c555:e1c:23e4]) by CO6PR11MB5633.namprd11.prod.outlook.com
 ([fe80::e577:c555:e1c:23e4%6]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 03:45:44 +0000
Subject: Re: [PATCH 03/26] drm/i915/guc: Take engine PM when a context is
 pinned with GuC submission
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-4-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <a2d5377a-ec8e-40ec-d0cf-c91aa51bba48@intel.com>
Date: Wed, 6 Oct 2021 20:45:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:303:86::15) To CO6PR11MB5633.namprd11.prod.outlook.com
 (2603:10b6:303:13c::16)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR04CA0190.namprd04.prod.outlook.com (2603:10b6:303:86::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Thu, 7 Oct 2021 03:45:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe99ddbd-294d-4740-c7a6-08d98944f0f3
X-MS-TrafficTypeDiagnostic: CO6PR11MB5636:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB56360924DCF1673C34629022BDB19@CO6PR11MB5636.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2mUQM3beqJ/14Sx/GzhEck9Vx83xZeUgep82SXYCNpBNfexRoJhrCsDZZpjK2d7QgXfgfB5M08KRcPm5RZXEpfQd6Kvp8CkMG9Ww/Wn87sHe4MTyyhu6jkdp75/h8lnWJ5HgX/GWEgbUw9hVQEa1duM7YXYG+K7E6gCPk2Feg6qcnT3Y0e8sNPvQ7rW7HCKkgbFgGlp2gtU1xa7ybxEB4EmikD+AI0s+Up0LfhI+jXraqUw3GCALEd91rNGsI0BpEn8/tXm/nS58pcdjtrsTXP/PAm9Rswkri5oot38TLDAJjATzOL8bdJBgW6G2jkIahSIb/1e4QYLvt3Wj4PAQMaqr/58EotAEHLY8iEP9N6MQyQ0UwLlKLBb4VF8xBS6HWnfEfsXwq2qfQpgNGZDeiJj/4qpvnCcQhMzaEK+pOXROwZBfllrwMUs8sdIGW3nv6QFr5P21EoOUyZaWuxyCcYiYKFflHZmr1QEZl0rtKGboa1Vd2YkMU0aZELxuWDh7f78FmCT71wdDelo9WYuSZjudNVZmqFQ2fsLHhVb6Zgr6i6rvgW5h4xi/+/fBTodxYjZnIiQKNmb2+YANFqlEGiI0JhV5wfR9EsGC7tUqyorvpHclhxPg0i7J30dbsExKx3w8IpsPikvLO1v3/2HQmB6/YQFYcv4fKrBWqsSGdgEKXI4N16njsNLuqvzbUp0BrDW7+xw0tSQh1MoHHvloaQZE0iHNHtj/i3q+57XkK6wzBS8DcQtjBWogI5YoZIRJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(66946007)(53546011)(36756003)(66476007)(5660300002)(31696002)(186003)(26005)(956004)(2616005)(16576012)(316002)(86362001)(6486002)(107886003)(31686004)(8936002)(38100700002)(450100002)(4326008)(8676002)(83380400001)(508600001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzZveFNXZzNpT3M1bS9pM0hqZ0FtQlJvYVNEellaRFMySjNyYTR1WHRMSkc2?=
 =?utf-8?B?S29nc2c0d1FvbTlRZkJ4SnRmbXdmL1E4UUVQRjVTciswMmYxOWdGMFR4aGkx?=
 =?utf-8?B?b010UHJxVUVIeFdUdm5BTVZOajNBWnJTK2ZTdzRQaldnSlRtWnRBM1dNOFha?=
 =?utf-8?B?cTN6ZnFtMmNkMmZQSDd4cnVGVWZzMHBIdVVtbWkwL0E1YWE5bTk4M3FrYk1R?=
 =?utf-8?B?NjZHSysxM09xQVVLYm9DTnViYk1jMWtITXRpTk1KTDE4RUNaT0NjNm1oZzRM?=
 =?utf-8?B?NGhjY1JkSFJITTNaQVdhVGFva1YxYmV4T3MxYXMvMDByVUhpcFhuUUh3ZlU5?=
 =?utf-8?B?dWVuY3VuZ0h0bzlQMDVpU1NMcjVqNmpuRDNmWDJVaGttRm5ET1RkdnpDcXJq?=
 =?utf-8?B?ZmFYd25Xald3REZzZXg4QW5uNlU1UitlUFg5N2dTdTl2RlROYVRoQlM2R3Jl?=
 =?utf-8?B?L2NpUGZNUXRPODZUZXA5RWJiUitsaTJENi9BcytYWmpNeTRaUzN4d3FTa2Yy?=
 =?utf-8?B?U3h1SkQvbFgrTVFKaTdjelRlSkNXMXV5ZC9UTzR3MjdHUllHN1pXVkNQYUJN?=
 =?utf-8?B?OVcxVVJic1VCMjljSk9zQkI5VnVmSmhSM0ROVFB6YUw4TXR1MnlZMHo3VWFD?=
 =?utf-8?B?NUllRWtNNFVnemYzbUJRZXFUbnRodGgvUDZsZWI2bWxJNjVrQUdyOG1BL1kx?=
 =?utf-8?B?bFBROXVPRlZacjlXTmFaL1E5d2xrRm11a2NVU0ZCTk40V2Y3QXZxSGE0RDN1?=
 =?utf-8?B?ZlJ1TE1ySElsdDlSakxRZTE5dXF5b2NIMUNsc016UVc2aHpvdEFGWFAzTCt0?=
 =?utf-8?B?S1VsbkxwWlM2SEdOeitCb2VKb0phUUx5RmMzYThqdEtOeGExWXYrTks0VjJi?=
 =?utf-8?B?WTJ3czFXdVg4cXo5enpic1JvdFE1VjRjRGJXcmZoQUhDTlBuS1RTVXc5ZjJ2?=
 =?utf-8?B?UVFKUTFOS3NSVnkrM05QY1BJMjBBSHplMUVZL2xlU05jUFF6dTNtU1Riejhs?=
 =?utf-8?B?NFIzTU9OOUxPRjM5bnp6NEs4VzhaRmh3bkw3MldHZkw0aWpYREh4YVlQR0Fy?=
 =?utf-8?B?V0RETnNnbWVoZDlGeWkzNytMSGpLd0t2YUJURmNORG9LbU5MMFUzbnZyVkgv?=
 =?utf-8?B?V3VRYjJIeEtOTlA5alZ1VmE4YU1CWWJITGl4VjQ5a1p2eHptQW8yOEY1QWVM?=
 =?utf-8?B?Z29hT3hCdkRTWXpLN2c4Q1ZtOUhqelZhRjJJNmZFbzgrUTJKcjhILzVSdXBX?=
 =?utf-8?B?aHVuWGs5dVh2NG5GMEg3MG1TMjNVUVRROEU1Q2VOeWx4YWpBaVluNDlzWm5J?=
 =?utf-8?B?R0FDM3V0cEp6Tk9MRllxY2piNFVXVjNiN0o1aU9nQXo5ZUFwdmhxUXVyWE9o?=
 =?utf-8?B?eVZGa3Z0Mlp5TzNHaXQzcmJyRDBMTC9TaWwxS2tZQ1VpRCthWWRSaTUvdjNo?=
 =?utf-8?B?Mms3N1Bqc0o4Y3BzZXFwdy84bzdtd3dIV2h2bXpRRERnRlVNWjJzTXhmSEZr?=
 =?utf-8?B?UXJUUGxabm14UEdZWHc5RkFqZW1OWUJmSjRnWnNoWUhTaEZZRXlIa2l4Nmpr?=
 =?utf-8?B?MUt3eEVheFFMWjQ2eUEyVFRNV1ZGTE1uWG0vdUtaZ1daVEhaUHVpdmM3U3VP?=
 =?utf-8?B?aW0ybnFPSUtpOWNudENoWUh3Uy9MSVIwb3lGb050dEc0U1NyWUNOS0RoMk84?=
 =?utf-8?B?eW1zcHFZUUY0dHBKckNUYXlIdTZabTl0cTV6VitteHA4UFQxQkN5NnBvZkp5?=
 =?utf-8?Q?aD6uhUwdf5NIjX+aFSnJ/BMfe5Dw04Bg9TK57+P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe99ddbd-294d-4740-c7a6-08d98944f0f3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 03:45:44.4787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/KlathbYAuvLMdAUewBoFY32aWVHk8R+2Y24ipfen9cex37IrKZFIJTCxmPOAnK2PiAPDexZ+M2RPS7h5zVH+4gk3gfTrIccUOmzhPfhHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5636
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

On 10/4/2021 15:06, Matthew Brost wrote:
> Taking a PM reference to prevent intel_gt_wait_for_idle from short
> circuiting while a scheduling of user context could be enabled.
I'm not sure what 'while a scheduling of user context could be enabled' 
means.

John.

> Returning GT idle when it is not can cause all sorts of issues
> throughout the stack.
>
> v2:
>   (Daniel Vetter)
>    - Add might_lock annotations to pin / unpin function
> v3:
>   (CI)
>    - Drop intel_engine_pm_might_put from unpin path as an async put is
>      used
> v4:
>   (John Harrison)
>    - Make intel_engine_pm_might_get/put work with GuC virtual engines
>    - Update commit message
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |  2 ++
>   drivers/gpu/drm/i915/gt/intel_engine_pm.h     | 32 +++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 10 ++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++--
>   drivers/gpu/drm/i915/intel_wakeref.h          | 12 +++++++
>   5 files changed, 89 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 1076066f41e0..f601323b939f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -240,6 +240,8 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
>   	if (err)
>   		goto err_post_unpin;
>   
> +	intel_engine_pm_might_get(ce->engine);
> +
>   	if (unlikely(intel_context_is_closed(ce))) {
>   		err = -ENOENT;
>   		goto err_unlock;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> index 6fdeae668e6e..d68675925b79 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> @@ -6,9 +6,11 @@
>   #ifndef INTEL_ENGINE_PM_H
>   #define INTEL_ENGINE_PM_H
>   
> +#include "i915_drv.h"
>   #include "i915_request.h"
>   #include "intel_engine_types.h"
>   #include "intel_wakeref.h"
> +#include "intel_gt_pm.h"
>   
>   static inline bool
>   intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
> @@ -31,6 +33,21 @@ static inline bool intel_engine_pm_get_if_awake(struct intel_engine_cs *engine)
>   	return intel_wakeref_get_if_active(&engine->wakeref);
>   }
>   
> +static inline void intel_engine_pm_might_get(struct intel_engine_cs *engine)
> +{
> +	if (!intel_engine_is_virtual(engine)) {
> +		intel_wakeref_might_get(&engine->wakeref);
> +	} else {
> +		struct intel_gt *gt = engine->gt;
> +		struct intel_engine_cs *tengine;
> +		intel_engine_mask_t tmp, mask = engine->mask;
> +
> +		for_each_engine_masked(tengine, gt, mask, tmp)
> +			intel_wakeref_might_get(&tengine->wakeref);
> +	}
> +	intel_gt_pm_might_get(engine->gt);
> +}
> +
>   static inline void intel_engine_pm_put(struct intel_engine_cs *engine)
>   {
>   	intel_wakeref_put(&engine->wakeref);
> @@ -52,6 +69,21 @@ static inline void intel_engine_pm_flush(struct intel_engine_cs *engine)
>   	intel_wakeref_unlock_wait(&engine->wakeref);
>   }
>   
> +static inline void intel_engine_pm_might_put(struct intel_engine_cs *engine)
> +{
> +	if (!intel_engine_is_virtual(engine)) {
> +		intel_wakeref_might_put(&engine->wakeref);
> +	} else {
> +		struct intel_gt *gt = engine->gt;
> +		struct intel_engine_cs *tengine;
> +		intel_engine_mask_t tmp, mask = engine->mask;
> +
> +		for_each_engine_masked(tengine, gt, mask, tmp)
> +			intel_wakeref_might_put(&tengine->wakeref);
> +	}
> +	intel_gt_pm_might_put(engine->gt);
> +}
> +
>   static inline struct i915_request *
>   intel_engine_create_kernel_request(struct intel_engine_cs *engine)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index 05de6c1af25b..bc898df7a48c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -31,6 +31,11 @@ static inline bool intel_gt_pm_get_if_awake(struct intel_gt *gt)
>   	return intel_wakeref_get_if_active(&gt->wakeref);
>   }
>   
> +static inline void intel_gt_pm_might_get(struct intel_gt *gt)
> +{
> +	intel_wakeref_might_get(&gt->wakeref);
> +}
> +
>   static inline void intel_gt_pm_put(struct intel_gt *gt)
>   {
>   	intel_wakeref_put(&gt->wakeref);
> @@ -41,6 +46,11 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt)
>   	intel_wakeref_put_async(&gt->wakeref);
>   }
>   
> +static inline void intel_gt_pm_might_put(struct intel_gt *gt)
> +{
> +	intel_wakeref_might_put(&gt->wakeref);
> +}
> +
>   #define with_intel_gt_pm(gt, tmp) \
>   	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
>   	     intel_gt_pm_put(gt), tmp = 0)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 17da2fea1bff..8b82da50c2bc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1571,7 +1571,12 @@ static int guc_context_pre_pin(struct intel_context *ce,
>   
>   static int guc_context_pin(struct intel_context *ce, void *vaddr)
>   {
> -	return __guc_context_pin(ce, ce->engine, vaddr);
> +	int ret = __guc_context_pin(ce, ce->engine, vaddr);
> +
> +	if (likely(!ret && !intel_context_is_barrier(ce)))
> +		intel_engine_pm_get(ce->engine);
> +
> +	return ret;
>   }
>   
>   static void guc_context_unpin(struct intel_context *ce)
> @@ -1580,6 +1585,9 @@ static void guc_context_unpin(struct intel_context *ce)
>   
>   	unpin_guc_id(guc, ce);
>   	lrc_unpin(ce);
> +
> +	if (likely(!intel_context_is_barrier(ce)))
> +		intel_engine_pm_put_async(ce->engine);
>   }
>   
>   static void guc_context_post_unpin(struct intel_context *ce)
> @@ -2341,8 +2349,30 @@ static int guc_virtual_context_pre_pin(struct intel_context *ce,
>   static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
>   {
>   	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +	int ret = __guc_context_pin(ce, engine, vaddr);
> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> +
> +	if (likely(!ret))
> +		for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> +			intel_engine_pm_get(engine);
>   
> -	return __guc_context_pin(ce, engine, vaddr);
> +	return ret;
> +}
> +
> +static void guc_virtual_context_unpin(struct intel_context *ce)
> +{
> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> +	struct intel_engine_cs *engine;
> +	struct intel_guc *guc = ce_to_guc(ce);
> +
> +	GEM_BUG_ON(context_enabled(ce));
> +	GEM_BUG_ON(intel_context_is_barrier(ce));
> +
> +	unpin_guc_id(guc, ce);
> +	lrc_unpin(ce);
> +
> +	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> +		intel_engine_pm_put_async(engine);
>   }
>   
>   static void guc_virtual_context_enter(struct intel_context *ce)
> @@ -2379,7 +2409,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   
>   	.pre_pin = guc_virtual_context_pre_pin,
>   	.pin = guc_virtual_context_pin,
> -	.unpin = guc_context_unpin,
> +	.unpin = guc_virtual_context_unpin,
>   	.post_unpin = guc_context_post_unpin,
>   
>   	.ban = guc_context_ban,
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
> index 545c8f277c46..4f4c2e15e736 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.h
> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
> @@ -123,6 +123,12 @@ enum {
>   	__INTEL_WAKEREF_PUT_LAST_BIT__
>   };
>   
> +static inline void
> +intel_wakeref_might_get(struct intel_wakeref *wf)
> +{
> +	might_lock(&wf->mutex);
> +}
> +
>   /**
>    * intel_wakeref_put_flags: Release the wakeref
>    * @wf: the wakeref
> @@ -170,6 +176,12 @@ intel_wakeref_put_delay(struct intel_wakeref *wf, unsigned long delay)
>   			    FIELD_PREP(INTEL_WAKEREF_PUT_DELAY, delay));
>   }
>   
> +static inline void
> +intel_wakeref_might_put(struct intel_wakeref *wf)
> +{
> +	might_lock(&wf->mutex);
> +}
> +
>   /**
>    * intel_wakeref_lock: Lock the wakeref (mutex)
>    * @wf: the wakeref

