Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61956748F5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 02:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D1D10EA0A;
	Fri, 20 Jan 2023 01:41:54 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B2210E0DB;
 Fri, 20 Jan 2023 01:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674178910; x=1705714910;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1dBC3crXvhFvE7IcyaSo4B6sLwaxW9QaU21xzBgaeeo=;
 b=mS3X2J018ioh4LDDB5070FXFCJ+uXAnhr3tnHA+8be7QgLaG3hkSld3h
 APhx+DD4YKRX+BpYzvedTNYFdq6UBw0qxXkMM7U1Md7WZlDYeY2lOUUeW
 CsVRJy+hJ53GOWJD0ALmfzrWrbrEnsaMQyn1PQgaDnHHj2R3A1Vm7nwXp
 QeLHs/J8mjim0fW3fq6ioV2qRk/M/OYnFlnGKUbkKitA+j0y+7gLXmaGM
 slDrzuI34LcOCYAO4igHm4s/yo56wqlnjerzOw2bznftNAog2TEC919D3
 3wdBx76wLJ936QGmbGZqbd0k9iubfxUPUCbLl2vYlwNyX38AzafMaKD4I Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="352741266"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="352741266"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 17:41:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="637987608"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="637987608"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 19 Jan 2023 17:41:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 17:41:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 17:41:45 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 17:41:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDayM35Jg4+/xrl6qk5iqFEhRPFazTMCTI7FmPunFPafH+kVae4SwaVOYZBRuUNR6VbCxBaxND87A7x/014hUKgK9BO2UMRRnBf8aXzkH6Yr2wkEhESqeFmtPKNpIDAgZcxLsgfz1gSbtLAaeEMRPpWc62SWT4Lj8T08YMO0QjX+gkei41t47DcdFqaa2AbTR3g40OSMtA1X9Proeov9XNaFZLU5syHIF7HTAiISEoGiA2uthxGVW+ljETEQjddKPi+w9daeD2te3xVB5EJYIpiK5hHsGXKiy2VeF/hmc1B8actDuL1PfY2BUen6x2hTFyJmefcBuvVzlWPUJYB1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeaJZ8bTDsOg8P0/jbW24kGM6fcQTl53z980y/nx3nk=;
 b=VedfqRPGl48XDg/saBILpR/eK4oYnXBRO9biTos8z+4Zn1vdZ1HeKzNP6mgI0B8YmxKDFbhgRH7ps3dPJw81xyDjrHlqOX4V9xK5p0uTNGrOH7rQhu+r2ncJQJHylKTVOgolZb4VEhbCgv9eoSGzkrsHcPTyi/USy5+D9GxrA487mzdFVAJ6H9uQ8amzRl/e521opiY05Zf9HkIE7xxChqyduPgDhBDir4r5Mu7Jw4EEX0AriefIZJB51EUhWN1aLoUPE3u904lcXW8jfdqE2TqLWKwkEzTkF7LPJYWIxK0uPRZQMzJ36DafVA8ADGx3LgFwZR0pVrIVarMQKaaoUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 20 Jan
 2023 01:41:43 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a%8]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 01:41:42 +0000
Message-ID: <711d967f-a38f-5ef1-0d5b-5291293cdfba@intel.com>
Date: Thu, 19 Jan 2023 17:41:40 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v3 2/6] drm/i915: Fix up locking around
 dumping requests lists
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
 <20230119065000.1661857-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230119065000.1661857-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b1c3fa-9054-4613-af78-08dafa877b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QEBw45GfwLac+lEeXpn6SD68wl/QrkhIZ76w2FH7GJY5jhGuZWWYhsA8YQK/4DhKXCpAOBEU0npLDAj1ljfg0VSx1ZkDQSHWg40upY7m21XH5va2hb9KLREr1kbVNNvDK4UOaa8EYVIEoM6OappnjRP2P/N8oAlm+EMisnfElXt3uOK5F8V/kFHSQrMtPFqCzz7PeiFLxIilfTqRSPS2DsnsyU6nVYPzcR2eG0VsGw6eWIgpTrHO+qOsz2OrKjq8mkk+NleNQc4EqHR6cpLoLzsihuTLTrJ/hEghXmIsNdeOFCHDwshG8HenPLFwZYOLE/b3ej4tVFY5ZpRepLTYXyTYW0pSXJeor5Ymr/J+4HPisvUkMoyZJh9nbxh5O8VN7xineQfPCyjLKY/i9yyvvtqNI2CclZ7Lu5JIwTQGgzxekjZsf+l2TEAbbuw9d0PIgxJV1FXufvogJDZE7YKZA2ZbxEqjhDgRipS4cbAgjXiUQnz3SeJihGPrJdGmlaw0JwZfiFC6x13WU/Xil2rZx7ONW+Qg5XmUIFNN6+eHfka/XpfZYLdUScmPzsyHgRUQjm7Ku0gIMUKm5pdjX2k/YUms/cFboaqY8iYK0QbBUf2dGKqGcXl1ooj8MC4rXpRHzryV5wZ8vOODxpyxht6cjUer9Rodzs6frSCJmqaV2droLWT78I43lYBKWivP+HN0L3d/HjR5L8E1kUaujWaKDA1HworXBESNOq2irEf53F4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199015)(6512007)(186003)(26005)(83380400001)(8936002)(5660300002)(478600001)(53546011)(6506007)(6486002)(31686004)(2616005)(316002)(450100002)(66946007)(8676002)(4326008)(66476007)(66556008)(36756003)(82960400001)(38100700002)(41300700001)(2906002)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzFiQkxpMXgwK0kvV1FuZ1lRM0FJR0d4SEE1NTBFaU41QjVQYlliK2lETFZC?=
 =?utf-8?B?Mitid3BmRUlzVURVb3RkZVIwZE1DdTV6MWlXcW1DRXg5bDZUZlJySVBlSkE2?=
 =?utf-8?B?ZXE4UDBZaXQ2WGdNTUUzbXUrblYvOVpRNFBPRnhFRlRQTzlXZC9ZZEtqR1Fm?=
 =?utf-8?B?Q0Z1SFV1QnY1TTdMTUlVajIvclhzaDRaQXNFMTUwbjNnd2NIczR6eVNwb0xo?=
 =?utf-8?B?YmhXeFV6TU1KZVVDTVViVEZIbFMzbTJ2T0dmV1RZaDNjclJkQVBKb3lhTWdV?=
 =?utf-8?B?UmVLd29uT0VUbW1MT21TaFQ5TWJRRUp5ZnZ2eVlqMlovZnZDSEUyckJyN3Vn?=
 =?utf-8?B?OCtPM0FHUkNsd1M2aVFxVk9ERGZqRXZPTWtybVZscEx3aDk5dC9uMGpnOFh0?=
 =?utf-8?B?TEQyZ0F5cG1kbURWd1lwdG0yVFVRaVAwclUyajZ0cndpQzlJWm1oY2N0WFNo?=
 =?utf-8?B?TTdCSWF3ZEh6VXRFdXBST0pjTDAvbWVObVY1MU1UU0VCNGdOcmJvT3JESkEr?=
 =?utf-8?B?QmtlalQvU2k4VktzSzVYdy9JOGorNUFxUDJrb0FKdnBXK3FYUXNBdkxCZDdM?=
 =?utf-8?B?eVdjZzFjOVJFQ0wweWFuUUlxNTZ1eTdSVG5lZWFpbWpBSFlZZGRHWkVPeUJn?=
 =?utf-8?B?eU9VWWlhaVNCaVNBNGtZNWx1UURPSGM4ZUtqQWFnY1VCQWdDVW9XbXRzNVhG?=
 =?utf-8?B?YnczUVorSlg2UEdmVGZzWUFSVnFOajBPRUFvZ1hTUVN4dGMyWHk2M2dUZVhZ?=
 =?utf-8?B?eXlqV3c4ViszcE9oditOeEI0Z1cxQ0h1S3pPdHhKTlpjMnB5UmFGYmJad0lH?=
 =?utf-8?B?UXNPalFJQWVSZmFib05Qam9zZ0dONWdxSDlieFEvU3RUUnlmaUNML3ZzT3Ax?=
 =?utf-8?B?cFZjQjRhZ1lDVUJFV2hmeFBoNDRkMFZib3hiY1NISHBGZXUxMFZ3V2NRVGlw?=
 =?utf-8?B?RnlmQnd4YnhBNlRlK3Q3RjNleU5SM0kvaElWSXNCQllqb0F4Q3ozaUxaQTU3?=
 =?utf-8?B?Y2VyOEFFYkR1Vm5DSE5vd2xCeE9Yc2FDYkhxK0cyb3FYeGRGenl1YWl5OHpZ?=
 =?utf-8?B?M1VwNkp2TVVTTUw0Ym9UUXJIMTRtZXkvVFhUdXdwZXNUa3FBakdKOWlCSlds?=
 =?utf-8?B?L2E4NSs4ekRrbzQ3OUs4SE40SmZMRTdOK1NVZnhsNmxOUDlybTRkc3FldWxL?=
 =?utf-8?B?Q0ZTZkJXc2l1SlE0MEFBNlFORVBzeVB1cmVYTmZKWFpmd3JnWmxuenJYRUd5?=
 =?utf-8?B?TGFKQ0twb3JsaW4vKzd1UDZBUkVhRDA2YnlkVXBHVG9PdWt1KzZiYzVYbXhJ?=
 =?utf-8?B?eUdEOTZHbHlmQXhqT09nc3FYVENPUzQ4WmNESWlRK0ZWeW5CUHNRcitOOHRT?=
 =?utf-8?B?WUNaQmRaL0hoZFRWVk5sZG9hVUN3d3l0V3lHRHdLYmlUVzVmVHd6Um82SklQ?=
 =?utf-8?B?M2ZCU3BvNHFpdWlNOHNQOGZDWXk1OEJWd2xrRjhTcVRLeUt1TldWY1hJS3lh?=
 =?utf-8?B?TVhDU2JFSDl6UWhXVEdEbXBMTUE2T2JFL2s1VjVneTh2RWxkNGdHc2lwN1Mz?=
 =?utf-8?B?Z0ZzVGIzWDBhcjVCT0l1WVc4SmJLaHlOYTVwcjNOaVlxbVVFRm9zc2QyWXJ3?=
 =?utf-8?B?QTZhdGVDUnFCSTdDZDJhMXg4VG10Qi9vSThONE9TSTFiYkJ6ZnFCV2pxakla?=
 =?utf-8?B?Zmx5SThHUlRycHBLNWEvTlYrajVpQnB5U0dOeHNFSUxNQUpMRWZjTHY4U1NY?=
 =?utf-8?B?VHVuVjhJb0xRcktQb2ZUUytPMkdrS2lPTElwdCtBQ2VNdTlKbHZ6M21vdGJC?=
 =?utf-8?B?MkxhcHJQaTZ6NFd0K3pXS3N4QkdDYmxnQitLaU5LYlllSnlhOUVrQThsNHZq?=
 =?utf-8?B?Y3FFWkhDV3Z1bFc1a0trbmduZ2JzMGp2SXg2LzR1eXBvbUNBZGlCMU1RNTAr?=
 =?utf-8?B?WExkVWErTXNNZU1tdlhueG9ucnRBMHJuWHRGS1pPNlI1WVZzKzA2dmw1enJk?=
 =?utf-8?B?a3NqTERPNThZaFBGVHlyK1p3QzY0NEhVVFhxdDRmUUhaYUdPczhkU2RackZv?=
 =?utf-8?B?aVBhQXEvSXl1aGRia3BudGZQMXVPWFFzZmlWaHVVUUk1L1hIMndjZkpzZkNw?=
 =?utf-8?B?VVhNOFlpYVBxQnl1S21SOHFibmZodFYvS0YyeXloeER6WnB6SWVRZnRoWmY5?=
 =?utf-8?Q?N2QqUXWh57MPr07+axb/Asw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b1c3fa-9054-4613-af78-08dafa877b75
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 01:41:42.7059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GApR/rvSoBw/MVE0QXa3vPEes+tPAvO4Wx1WRSnG0ClivRDBU4cpTdF6Bfmy5YkSrgttZmtiKogllc0NS6aj4Ws4HJCvkoC/FNSpT9PZOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/18/2023 10:49 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The debugfs dump of requests was confused about what state requires
> the execlist lock versus the GuC lock. There was also a bunch of
> duplicated messy code between it and the error capture code.
>
> So refactor the hung request search into a re-usable function. And
> reduce the span of the execlist state lock to only the execlist
> specific code paths.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c   | 29 +++++++++++++
>   drivers/gpu/drm/i915/gt/intel_context.h   |  3 ++
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 51 +++++++++++------------
>   drivers/gpu/drm/i915/i915_gpu_error.c     | 27 ++----------
>   4 files changed, 60 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index e7c5509c48ef1..a61f052092ed9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -559,6 +559,35 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
>   	return active;
>   }
>   
> +void intel_get_hung_entity(struct intel_engine_cs *engine,
> +			   struct intel_context **ce, struct i915_request **rq)
IMO this belongs in the engine_cs.c file, given that the engine is the 
input. Might also be worth renaming to intel_engine_*

> +{
> +	unsigned long flags;
> +
> +	*ce = intel_engine_get_hung_context(engine);
> +	if (*ce) {
> +		intel_engine_clear_hung_context(engine);
> +
> +		/* This will reference count the request (if found) */
> +		*rq = intel_context_find_active_request(*ce);
> +
> +		return;
> +	}
> +
> +	/*
> +	 * Getting here with GuC enabled means it is a forced error capture
> +	 * with no actual hang. So, no need to attempt the execlist search.
> +	 */
> +	if (intel_uc_uses_guc_submission(&engine->gt->uc))
> +		return;
> +
> +	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> +	*rq = intel_engine_execlist_find_hung_request(engine);
> +	if (*rq)
> +		*rq = i915_request_get_rcu(*rq);
> +	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> +}
> +
>   void intel_context_bind_parent_child(struct intel_context *parent,
>   				     struct intel_context *child)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index fb62b7b8cbcda..ca50f3312a941 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -271,6 +271,9 @@ struct i915_request *intel_context_create_request(struct intel_context *ce);
>   struct i915_request *
>   intel_context_find_active_request(struct intel_context *ce);
>   
> +void intel_get_hung_entity(struct intel_engine_cs *engine,
> +			   struct intel_context **ce, struct i915_request **rq);
> +
>   static inline bool intel_context_is_barrier(const struct intel_context *ce)
>   {
>   	return test_bit(CONTEXT_BARRIER_BIT, &ce->flags);
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 6a082658d0082..5e173dfc8849e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -2216,11 +2216,27 @@ void intel_engine_dump_active_requests(struct list_head *requests,
>   	}
>   }
>   
> -static void engine_dump_active_requests(struct intel_engine_cs *engine, struct drm_printer *m)
> +static void execlist_dump_active_requests(struct intel_engine_cs *engine,

Might be worth moving this to the execlists submission file, to be 
symmetrical with the GuC submission one. Other execlists functions are 
in this file though, so not a blocker.

> +					  struct i915_request *hung_rq,
> +					  struct drm_printer *m)
>   {
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> +
> +	intel_engine_dump_active_requests(&engine->sched_engine->requests, hung_rq, m);
> +
> +	drm_printf(m, "\tOn hold?: %lu\n",
> +		   list_count(&engine->sched_engine->hold));
> +
> +	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> +}
> +
> +static void engine_dump_active_requests(struct intel_engine_cs *engine,
> +					struct drm_printer *m)
> +{
> +	struct intel_context *hung_ce = NULL;
>   	struct i915_request *hung_rq = NULL;
> -	struct intel_context *ce;
> -	bool guc;
>   
>   	/*
>   	 * No need for an engine->irq_seqno_barrier() before the seqno reads.
> @@ -2229,31 +2245,20 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
>   	 * But the intention here is just to report an instantaneous snapshot
>   	 * so that's fine.
>   	 */
> -	lockdep_assert_held(&engine->sched_engine->lock);
> +	intel_get_hung_entity(engine, &hung_ce, &hung_rq);
>   
>   	drm_printf(m, "\tRequests:\n");
>   
> -	guc = intel_uc_uses_guc_submission(&engine->gt->uc);
> -	if (guc) {
> -		ce = intel_engine_get_hung_context(engine);
> -		if (ce) {
> -			/* This will reference count the request (if found) */
> -			hung_rq = intel_context_find_active_request(ce);
> -		}
> -	} else {
> -		hung_rq = intel_engine_execlist_find_hung_request(engine);
> -		if (hung_rq)
> -			hung_rq = i915_request_get_rcu(hung_rq);
> -	}
> -
>   	if (hung_rq)
>   		engine_dump_request(hung_rq, m, "\t\thung");
> +	else if (hung_ce)
> +		drm_printf(m, "\t\tGot hung ce but no hung rq!\n");
>   
> -	if (guc)
> +	if (intel_uc_uses_guc_submission(&engine->gt->uc))
>   		intel_guc_dump_active_requests(engine, hung_rq, m);
>   	else
> -		intel_engine_dump_active_requests(&engine->sched_engine->requests,
> -						  hung_rq, m);
> +		execlist_dump_active_requests(engine, hung_rq, m);
> +
>   	if (hung_rq)
>   		i915_request_put(hung_rq);
>   }
> @@ -2265,7 +2270,6 @@ void intel_engine_dump(struct intel_engine_cs *engine,
>   	struct i915_gpu_error * const error = &engine->i915->gpu_error;
>   	struct i915_request *rq;
>   	intel_wakeref_t wakeref;
> -	unsigned long flags;
>   	ktime_t dummy;
>   
>   	if (header) {
> @@ -2302,13 +2306,8 @@ void intel_engine_dump(struct intel_engine_cs *engine,
>   		   i915_reset_count(error));
>   	print_properties(engine, m);
>   
> -	spin_lock_irqsave(&engine->sched_engine->lock, flags);
>   	engine_dump_active_requests(engine, m);
>   
> -	drm_printf(m, "\tOn hold?: %lu\n",
> -		   list_count(&engine->sched_engine->hold));

This print moves from the global function to the execlists submission 
one. AFAICS this is only used in execlists mode so not an issue, but a 
note in the commit message would've been nice.

> -	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> -
>   	drm_printf(m, "\tMMIO base:  0x%08x\n", engine->mmio_base);
>   	wakeref = intel_runtime_pm_get_if_in_use(engine->uncore->rpm);
>   	if (wakeref) {
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 7ea36478ee52d..78cf95e4dd230 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1596,36 +1596,15 @@ capture_engine(struct intel_engine_cs *engine,
>   {
>   	struct intel_engine_capture_vma *capture = NULL;
>   	struct intel_engine_coredump *ee;
> -	struct intel_context *ce;
> +	struct intel_context *ce = NULL;
>   	struct i915_request *rq = NULL;
> -	unsigned long flags;
>   
>   	ee = intel_engine_coredump_alloc(engine, ALLOW_FAIL, dump_flags);
>   	if (!ee)
>   		return NULL;
>   
> -	ce = intel_engine_get_hung_context(engine);
> -	if (ce) {
> -		intel_engine_clear_hung_context(engine);
> -		/* This will reference count the request (if found) */
> -		rq = intel_context_find_active_request(ce);
> -		if (!rq || !i915_request_started(rq))
> -			goto no_request_capture;
> -	} else {
> -		/*
> -		 * Getting here with GuC enabled means it is a forced error capture
> -		 * with no actual hang. So, no need to attempt the execlist search.
> -		 */
> -		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
> -			spin_lock_irqsave(&engine->sched_engine->lock, flags);
> -			rq = intel_engine_execlist_find_hung_request(engine);
> -			if (rq)
> -				rq = i915_request_get_rcu(rq);
> -			spin_unlock_irqrestore(&engine->sched_engine->lock,
> -					       flags);
> -		}
> -	}
> -	if (!rq)
> +	intel_get_hung_entity(engine, &ce, &rq);
> +	if (!rq || !i915_request_started(rq))
>   		goto no_request_capture;

This has been a pain to review, but AFAICS all the locking is correct, 
so with the get_hung function moved to the intel_engine file this is:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

>   
>   	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);

