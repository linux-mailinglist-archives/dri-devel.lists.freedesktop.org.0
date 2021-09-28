Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1CD41B898
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 22:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84ED96E994;
	Tue, 28 Sep 2021 20:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717206E994;
 Tue, 28 Sep 2021 20:48:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="222910483"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="222910483"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 13:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="520598278"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 28 Sep 2021 13:48:11 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 13:48:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 28 Sep 2021 13:48:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 28 Sep 2021 13:48:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1VFLgMwK/O2R7lAf/edf+A7i8nmyJN0u8W9sfXzX5GLCVBykx7qO+srXc8HWcu0nHUUgkWJmbTpczz/okj1jRp4NLWg1fQcvvTM5Mrs05/6YGoZTYLAc+75luCbgfCt19uLt5Bldpz/wNQF1ferGhdOQcVtcFsLsNl86j1fvrDsQ9dzWzvfIfsja12JfPDu5h8/qJ/OxTirbQ6+myDAMhS8ylFvvwNtMj89ito/fAnjYnKcFKZgSKmm+td+PSV/FrVyhG2xOEg2seUCahSD8AY9dCCx/EMYexJZlZBlDP2Bix3HM6OYHFuLOOU2iVr3gu2VXgMF0JnnNo7u1s7v+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=kM9wTAcBJMwrwgGptqp58Ff9V69eEa6qryqeycuC1qw=;
 b=ciruoKvJFXRCEiHsgGmTHnNBZ+ch0/5QUb+bTUAZzl99yRR3UFnhDAj1ftwYaKVOf42VH3n+tNz8JFo6zuZm+zDER/xrkDncOS9dklCxiKV9vBiHm+57Ai/XfEetiXwYXnyoWZb6iO3Gx922cKBA44VVUv6GMSzc4N2Rt35X0LuzvRfHHZHY0J145M6KCmQvvzt2NDvJe+YRbOIBtt5G/LWuk8vfoQWxRY/OasWZ7S7+CToLJsNANeQzhN0111btNwMRzq6fqXdaC3J12pgYxzfgXy9C2jLJpuZFRs3AqSOMFPNuriv5fAsQLOah4rDRAQXTc4J8v4s0zrFOoCEsiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kM9wTAcBJMwrwgGptqp58Ff9V69eEa6qryqeycuC1qw=;
 b=if+qfg05lpHTjMwkPifKtBx/kaWQmTvGRpZn4S0HaUIXGeEU3D7C31yAIA7Vt/jTbw5oNAosI/KRD9G2HhZJHp4u9voPhXzR2Dw+R5uN3MreOunLAiRTWJ/imYkePrZE5XbNDwLazxS7WD6xxqN3zqltbgS/mGiRs77ktCMmeW0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 20:48:02 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 20:48:02 +0000
Subject: Re: [Intel-gfx] [PATCH 22/27] drm/i915/guc: Add basic GuC multi-lrc
 selftest
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-23-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <d5068bdb-9582-1bad-705d-bb83b39763e7@intel.com>
Date: Tue, 28 Sep 2021 13:47:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210820224446.30620-23-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0307.namprd03.prod.outlook.com
 (2603:10b6:303:dd::12) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR03CA0307.namprd03.prod.outlook.com (2603:10b6:303:dd::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.13 via Frontend Transport; Tue, 28 Sep 2021 20:48:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cb9fcaa-5b19-4ad0-9684-08d982c14398
X-MS-TrafficTypeDiagnostic: PH0PR11MB5577:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55774BF8B9C48225EE877A26BDA89@PH0PR11MB5577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M/1riRAoxaVx9M5gmb8L/NYkmX8ojIDEDUXefzeSVXrWUnjo1nBuiN5CfVR2APPSYS8IXi4fr7EDPYskl31bScRrpRiwvDpEElz34WpioOQ7ab4rbtN4TUG5SeKwW+P8aEAOqNmxlzvgPtAZWrkNhv4BeZ8yGV8TwCj+Rln8HXArtoOx2lW236KROlFMtCU6SweuhfXB3v5NLNN/K93QDYuFO6hsAbP62TPs2X5/Ex9Tv6IZAAR3EJNelKuIX5IXzSgPbs9VEO9fWFtvv777EpVuzxsK5T+jB3oCaNzBk+xtKGGq6kqQKx3FnYkbai4lBeLqSzRfJZWjl3wKExQuHBhN7kygSANkdOZFChbqRzRySe6UVTiVC3GTjmLkEdwyttyGBnbgAYwUIMBcXtOI6J+8jL3O9ptQ4WoUA1FEjSmFLNrk7q59gvo/pJfUQGeNIgVf+wKCI+hMxuQrwy0Vw3b6xJMgeRKuf3hphr9+HCm/KEhdC9nj84o+1yGWTYjDJevLKJikoKuCuQQy5sryt4Jnw6VXsciH6N8s4RwVAbC14itZ59uvoech6tXg6A/km8yS/VPhklvouH2Ix8MnD1eBkuIcsmXDLkaxLCkwOYTdcTGdLrGxnvEKMYOVDLE9BTPOGbYwQMeLWH06eBcbLR/tI5O6p1eiLwqLa6YL+uC9tboqRhkL3DJoFcCE/zQgIrfFeraDCN72GuwDnngYCa67BVxnORTaD+vcNd5CJog=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(66946007)(66556008)(316002)(66476007)(83380400001)(38100700002)(31696002)(4326008)(5660300002)(31686004)(36756003)(16576012)(86362001)(107886003)(2906002)(53546011)(186003)(26005)(8676002)(8936002)(508600001)(2616005)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akcvU25HRWNieGpRank1SWo5d0NpbDdITCtyLzFYZStSTnd6TEM4RWlSeHVI?=
 =?utf-8?B?VDJJNEM4aDF3N1ZHK3NJaUxyTFJoNC8xaFV1WnhHclFqMkNRU1FublhzWXA0?=
 =?utf-8?B?aXlGUzhYS2JPc1hpMnhKeWprVlRhTWRWVUs2QnZ5OVEzbVVQTDU1U052bVg1?=
 =?utf-8?B?aVBmVFdZQ2VGanB2cUE5aytDVHZyNHVCeEd4KzFybnB5bTZ5ejNLcDVxQ3lr?=
 =?utf-8?B?RVE2T1l0RVMrUUcvMW9Uc3p2c0JyMnE2TTV5M0pETHA2cUE2ZWUwblAyZzV0?=
 =?utf-8?B?cEIyMHNwOFNkTGFOYjVhVFBDejdVbzFSaG9yTGNPTjNQUk4zUVdlUG5MTGx3?=
 =?utf-8?B?YytMYnlRZnpaZVRwek8zZC8wcENKQWpNTVlOeEZGS3JLYkRZNTZ6cVVITi9q?=
 =?utf-8?B?UVZOdWQwWkdzanpvUGZuVlRoUW53WDJDZGZ6bXY2eERlYkVUZ3VVZlIxVVJz?=
 =?utf-8?B?eUVCeWtlWWV0Q1VhSUd0QVZZcGhSRnZveUhQK2k2NWZIcWlNTFpqM2hFSy9T?=
 =?utf-8?B?b04xVlJicHorS0t6SVZEem1IeXdkRS9haEZtVTZ5dlQxZlA1MnZqUkVrbUpB?=
 =?utf-8?B?RU5saC93dGxhL096QlF4RjJ1QklzeGFoaGZHNk5aSXBaUXdMTkNHOGszUmRu?=
 =?utf-8?B?cWJqR0E5cGl1M2g1WmlZdTRYTkY3VndNNkhMeDhTQk1CUTBNbitYcGg5T3ND?=
 =?utf-8?B?ZzRhSTZ3UGMxTmYrcHZkc0x3YlE3emhTWHE0dEhDTXZLb3ZDVElmUEQwSWpZ?=
 =?utf-8?B?VmRBUEZndzlDcS9KZTZrUW5nbDN2WGdPckIxM0NrbWhEaGxlUTdLNjZJb0hH?=
 =?utf-8?B?eSsvT2xkUkl6d0RHWktkYUdhWERmTlVpb1VQc0h3Qmpsc0gxVnBuQjNOZ0pQ?=
 =?utf-8?B?Sm9YTWltTFJXQ0JBMitrRkp2Y2FOM2s1M1NoRyt4NXp3ZHBZbzB4R2Y1YXBY?=
 =?utf-8?B?azNwYUhXOFV1SXlHZXRndW1FRlRFNUY1K3ByRkd5UXBGRlFKTjJ5WHQ1RkVT?=
 =?utf-8?B?Z0FjWUdUcWVvaGNISkNlR0pSWSttZlAyeVhRczZSWTJvemo3YkUxWHFTbFhJ?=
 =?utf-8?B?b1JYQkNqVEJlQ1IvUlBGcGhIb0lMeXhNcGk3bGpJc0hqN0xtR0VoMDdneHRC?=
 =?utf-8?B?WlpQUzlxa1Z0eDlzWHpuM0Zod1pmYWxGVnF5NlZmUGUvVDlqQkVyT0JCMUdr?=
 =?utf-8?B?anZESDRVeXRUb3VCMkt0Z2h0R3YwT0syZ2xOY05Fckg5OUZLdjdtYkl3dk81?=
 =?utf-8?B?SGdpNjRaMkxaa25ZMkRYYmRyOTUvNDAwb3FWUXVYVE1MNHNLaWo2aFNiYW1j?=
 =?utf-8?B?ZVRNYzVzNE5aWG9wVVZMNUxlZ3I3TnNLS1RhSExlN09tQ1BFakQwYng2ZnV5?=
 =?utf-8?B?VWJUL0F2VkQ3eWR6WDdQeDY4Z0hyRk9xcFZhayt4TkdraDU4bDFUTFBrTmpk?=
 =?utf-8?B?RXdickxVRlFHWlJ1TGlzc3U2TVowOFhKZk9rbURRazcxdmt1VUx1RUM2Y3h4?=
 =?utf-8?B?akRPRFJKRnJwb1N2RVpkdC85SjhuaDcvVE12NS9DUnFMSUJIOUFYT0owSjdJ?=
 =?utf-8?B?bFFNVjk0VDRpSUdxVUh1SUtsRy9URG93NjZibTZqNWVjVEZnMGZXM1JpczBi?=
 =?utf-8?B?VHh5b0lvdFBPbG5keUd6RWVic3o3QzFCT0Mzd2hvYnhzWW1kb3lEWmgyaHV1?=
 =?utf-8?B?WFh3RWpwbVVab3RDSEJ4RXUyclRRUUNFelczSjc3cW1iQitnRFFGbVZBcThj?=
 =?utf-8?Q?AQqkCtQ/WTXsfYQhDquBVBhVi57erG1qIlS9hXu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb9fcaa-5b19-4ad0-9684-08d982c14398
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 20:48:02.6138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wcrl4rhQGaCPOryfZ/Dhey7K/JEPQR8AGOjy7xRtUErFCzBd3ODEX5Fe42IGhL/a0bmCoKowAklKS/f4BoZnaD5f1kHYHJg4T//WgdJgcr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5577
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

On 8/20/2021 15:44, Matthew Brost wrote:
> Add very basic (single submission) multi-lrc selftest.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   1 +
>   .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   | 180 ++++++++++++++++++
>   .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>   3 files changed, 182 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 2554d0eb4afd..91330525330d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3924,4 +3924,5 @@ bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
>   
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftest_guc.c"
> +#include "selftest_guc_multi_lrc.c"
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
> new file mode 100644
> index 000000000000..dacfc5dfadd6
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright �� 2019 Intel Corporation
> + */
> +
> +#include "selftests/igt_spinner.h"
> +#include "selftests/igt_reset.h"
> +#include "selftests/intel_scheduler_helpers.h"
> +#include "gt/intel_engine_heartbeat.h"
> +#include "gem/selftests/mock_context.h"
> +
> +static void logical_sort(struct intel_engine_cs **engines, int num_engines)
> +{
> +	struct intel_engine_cs *sorted[MAX_ENGINE_INSTANCE + 1];
> +	int i, j;
> +
> +	for (i = 0; i < num_engines; ++i)
> +		for (j = 0; j < MAX_ENGINE_INSTANCE + 1; ++j) {
> +			if (engines[j]->logical_mask & BIT(i)) {
> +				sorted[i] = engines[j];
> +				break;
> +			}
> +		}
> +
> +	memcpy(*engines, *sorted,
> +	       sizeof(struct intel_engine_cs *) * num_engines);
> +}
> +
> +static struct intel_context *
> +multi_lrc_create_parent(struct intel_gt *gt, u8 class,
> +			unsigned long flags)
> +{
> +	struct intel_engine_cs *siblings[MAX_ENGINE_INSTANCE + 1];
> +	struct intel_engine_cs *engine;
> +	enum intel_engine_id id;
> +	int i = 0;
> +
> +	for_each_engine(engine, gt, id) {
> +		if (engine->class != class)
> +			continue;
> +
> +		siblings[i++] = engine;
> +	}
> +
> +	if (i <= 1)
> +		return ERR_PTR(0);
> +
> +	logical_sort(siblings, i);
> +
> +	return intel_engine_create_parallel(siblings, 1, i);
> +}
> +
> +static void multi_lrc_context_unpin(struct intel_context *ce)
> +{
> +	struct intel_context *child;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	for_each_child(ce, child)
> +		intel_context_unpin(child);
> +	intel_context_unpin(ce);
> +}
> +
> +static void multi_lrc_context_put(struct intel_context *ce)
> +{
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	/*
> +	 * Only the parent gets the creation ref put in the uAPI, the parent
> +	 * itself is responsible for creation ref put on the children.
> +	 */
> +	intel_context_put(ce);
> +}
> +
> +static struct i915_request *
> +multi_lrc_nop_request(struct intel_context *ce)
> +{
> +	struct intel_context *child;
> +	struct i915_request *rq, *child_rq;
> +	int i = 0;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	rq = intel_context_create_request(ce);
> +	if (IS_ERR(rq))
> +		return rq;
> +
> +	i915_request_get(rq);
> +	i915_request_add(rq);
> +
> +	for_each_child(ce, child) {
> +		child_rq = intel_context_create_request(child);
> +		if (IS_ERR(child_rq))
> +			goto child_error;
> +
> +		if (++i == ce->guc_number_children)
> +			set_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL,
> +				&child_rq->fence.flags);
> +		i915_request_add(child_rq);
> +	}
> +
> +	return rq;
> +
> +child_error:
> +	i915_request_put(rq);
> +
> +	return ERR_PTR(-ENOMEM);
> +}
> +
> +static int __intel_guc_multi_lrc_basic(struct intel_gt *gt, unsigned int class)
> +{
> +	struct intel_context *parent;
> +	struct i915_request *rq;
> +	int ret;
> +
> +	parent = multi_lrc_create_parent(gt, class, 0);
> +	if (IS_ERR(parent)) {
> +		pr_err("Failed creating contexts: %ld", PTR_ERR(parent));
> +		return PTR_ERR(parent);
> +	} else if (!parent) {
> +		pr_debug("Not enough engines in class: %d",
> +			 VIDEO_DECODE_CLASS);
Should be 'class'.

With that fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> +		return 0;
> +	}
> +
> +	rq = multi_lrc_nop_request(parent);
> +	if (IS_ERR(rq)) {
> +		ret = PTR_ERR(rq);
> +		pr_err("Failed creating requests: %d", ret);
> +		goto out;
> +	}
> +
> +	ret = intel_selftest_wait_for_rq(rq);
> +	if (ret)
> +		pr_err("Failed waiting on request: %d", ret);
> +
> +	i915_request_put(rq);
> +
> +	if (ret >= 0) {
> +		ret = intel_gt_wait_for_idle(gt, HZ * 5);
> +		if (ret < 0)
> +			pr_err("GT failed to idle: %d\n", ret);
> +	}
> +
> +out:
> +	multi_lrc_context_unpin(parent);
> +	multi_lrc_context_put(parent);
> +	return ret;
> +}
> +
> +static int intel_guc_multi_lrc_basic(void *arg)
> +{
> +	struct intel_gt *gt = arg;
> +	unsigned int class;
> +	int ret;
> +
> +	for (class = 0; class < MAX_ENGINE_CLASS + 1; ++class) {
> +		ret = __intel_guc_multi_lrc_basic(gt, class);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int intel_guc_multi_lrc_live_selftests(struct drm_i915_private *i915)
> +{
> +	static const struct i915_subtest tests[] = {
> +		SUBTEST(intel_guc_multi_lrc_basic),
> +	};
> +	struct intel_gt *gt = &i915->gt;
> +
> +	if (intel_gt_is_wedged(gt))
> +		return 0;
> +
> +	if (!intel_uc_uses_guc_submission(&gt->uc))
> +		return 0;
> +
> +	return intel_gt_live_subtests(tests, gt);
> +}
> diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> index 3cf6758931f9..bdd290f2bf3c 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> @@ -48,5 +48,6 @@ selftest(ring_submission, intel_ring_submission_live_selftests)
>   selftest(perf, i915_perf_live_selftests)
>   selftest(slpc, intel_slpc_live_selftests)
>   selftest(guc, intel_guc_live_selftests)
> +selftest(guc_multi_lrc, intel_guc_multi_lrc_live_selftests)
>   /* Here be dragons: keep last to run last! */
>   selftest(late_gt_pm, intel_gt_pm_late_selftests)

