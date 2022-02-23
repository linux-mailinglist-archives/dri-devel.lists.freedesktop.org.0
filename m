Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B254C066B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 01:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232E910E265;
	Wed, 23 Feb 2022 00:52:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5687110E216;
 Wed, 23 Feb 2022 00:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645577552; x=1677113552;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F2Ka6Ugw4qkVnxWcxsB0plqFOpBJmtVWoYLvvnDaNVk=;
 b=YOP6D3ff5imh7gPDlNck4cSw2rUYKw7OX+gJPrCLAMHUmdFwnST/oByo
 WG78Z54tL0QnJ777ICBw/sd2gZJ1MDTiiRzOO6ICpvNxnpxhtgnVkUGg5
 2LXIfp1KrPWGlugDiXQAJVnJSeiih8xKlVncvxCv5wHsMB1NYijgQEdrY
 sT+fRbhvhqQtZWmVm/ZC8A3PsT9UFCukmDx/nU+nx5BYCT7gRMXBqa5at
 Hnl7HF0V943RvsKtxDrGpw+k2lW/QHkZ0nELFrXndbRwjFqRegrrg68TY
 YOzgICuKZCdxVx+RtoWtsqXsJYnEhpEm0/U9iO4ykZPOQZs7nWVKxH1Bm w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="235362050"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="235362050"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 16:52:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="548005595"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 22 Feb 2022 16:52:31 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 16:52:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 16:52:31 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 16:52:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beyQRL+p9iXx+fJx/pgAtL5NwSk9oqoyP2Bb9UK+krF4s9Cu/bPwi/h+z4agUwTHs5RuQVqDVZZlECP4tTiTDdbvVOE5lDGKioPSPlcJKJYnq/576K8bNfetIylUIO98MqMGpMHNEtZppE3EK4WEYHtKVNSN81bi1tr+pvdSgFiEwEmfYBrK602x3XGXEBqYEzb/dsU+PqPZfL2+e9GOCVD+ze84C1SAnzTrg2Ib1oWHMWG87IPJfqVeoul55uBvq2uWi6b/Dxl5Qj0k9QElFbTnIp4OZz4JckPTWmC3N6cntQoFMx3rkHbJ6igpQtvTcjcNlbNMgqJ4NrXW1UkkIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ghqeEluiBhwQkfUqYWyOgOGxQniwn6gMPBX/BFmE+0=;
 b=ZXTWy5T6pCx+alQpJiv81sVzIpWDV5jL9qlIa7cCBjjtmOuKtVSTd4eg2K20sA3embyTLqXOEO5NlpCiy7589z59VU3vi/u2JZmxgEb8JLpm5/GVbKy7o2rcixdMSmgoGWmhJxHirNsWPOb9cdtI1rRPacbLZ+lkosdSpzTg2Fme71XQQ63kqNbtxTaGJcTAOV8fZBzSuqZV0TNgJM4sPTiJHD2+0dIiN93b7W+sCGyKx77i/+Ymzt8jnUeMgOyij+o1Hx0quQ9uTEYlWAaGOB7vaZVD6DajaKn3Bo8i4pAmAAn7M0ISW70ZAqfRZiI/ZG0h44N9ls3jNj71cg/u+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CY4PR1101MB2119.namprd11.prod.outlook.com (2603:10b6:910:20::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 23 Feb
 2022 00:52:28 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 00:52:28 +0000
Message-ID: <43188569-1b01-9e87-6b57-36920eccae92@intel.com>
Date: Tue, 22 Feb 2022 16:52:25 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Limit scheduling properties
 to avoid overflow
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220218213307.1338478-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::35) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37ad8558-fc4c-46fa-2759-08d9f666c39a
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2119:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1101MB211930ED3E6FA2B321F266D6F43C9@CY4PR1101MB2119.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xP5kifEUJ0rqqMXYJBMu9t+/PEPKkLGpgSgQRzfByQ9x0kIADU/+QqaBG7F4/1j8M4NHbxII23s+8Yz6c+gLcjzBpJbHSXebNpd6TcJEY3q8Oz5uXD2/KKO2wH2aacMlT//6/uQY9xPIXCS0xRsf8WvLxoL8NQRme5PmC0BJ0mrJEBKZWwxMqbveqi9vbXwCCJYagvldhrB7qnNWDJOi0kr4g7NgQFkTRPOsU0qRHpqvhE1E9GacHMEJTRmW+jTAmkDNQOsR1R7Jwr9dqY+3lkXzHkloG+K8rX2k1WpNaRce0RlGhpBrlfEC2T1P8G/Xi5V4qtFU27+p3e6e7FjSSia1F83KJ+mI6m1PjUFWN6N38p3PzDrMcr5Jz5KTOipN3Jk7CbaISQhZXH9KYVg383qobof2OOhIxOBkIjDvKAjH2TUDRGaoJjAfn/7njf1CB4xh/DlbDkJ/fkj08WCpCk+XQ8AXFknV77j6qrjUzrYVoSs5PVFJ9HdDGc0C9p8V74fvhjGuL7Edp+E7kSb4WJZTP/54tdxa9hcHtyWHO6jKDI+BXKGgZqfcEj52FoGFmuvbLfPDvIomQhWIC74q2MnEuOH1m/viue8D9bZp5rchdZWohV9C4vS9xT5ObEdmiGP3oewI7mMV+oawqMItBWZQCf+78P9jVhfva96DKfGadtRDVs1z0jlkV3W7dcPscSV4XlYnYPRBgO59DXG0Q7NKkbIHFNGlQOZt/4Z7VuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(31696002)(38100700002)(26005)(186003)(82960400001)(31686004)(6666004)(2906002)(8936002)(86362001)(36756003)(6512007)(316002)(450100002)(508600001)(66476007)(6486002)(2616005)(5660300002)(53546011)(6506007)(4326008)(8676002)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUgwR0x5RWNlNlh0cHlFVVdLTUxkQ3FpK0d3UWQxUnVOUlpzWnYzRVMrZ01S?=
 =?utf-8?B?TUZyQ2NwMW9BZ1hNdVRlZUFTR2Y0QlAvbXBRQjNLb1huYjYzenliOHRSdWw3?=
 =?utf-8?B?YVgyWnNjR1J2SThIUHN1KzhqUzlCbHBSZDhpN3FYdUtIMExSOXVKTVYyR0V3?=
 =?utf-8?B?dlp1bHQzY2RDdlRpOXJFOEdqZEZzOUNNWStZUHI2Qk94eUtYL3RvZDE1MUFm?=
 =?utf-8?B?UUo1NUZNZTdKbnpMbUxkQjhhQnBiYiswamF1Ym0zNVVtVHZYTncySHE5cUQx?=
 =?utf-8?B?UGNTSUordU5CcUZiYU5PNVpGOTRkcUdUU3hQbC92RUhIcGc1V3kwYktkWGhz?=
 =?utf-8?B?RWRyblZrS01qbUlDUFZlc1FycGdmWk9JQm9ueDNLcmpFeUtGc1RZa3M0WTNh?=
 =?utf-8?B?ZW5YMmV0Wmlqc1JCM0FWUG1kZnAyZ1pUL1NTK2VFS09xZktmcnI4U2pEVXZX?=
 =?utf-8?B?UTdPNVRGUmg0MHRpaFluK1NRWXdnVXZlNVFSMXFJbHE3cUhxbW1lS0t4SjM5?=
 =?utf-8?B?Ry8rUm4vYmFlMXh0aHFFOGRRM01NR1lEWHJ1Mlh2NHNHd004YVJkb1NnZ2JB?=
 =?utf-8?B?YVp3RjNHNlBteEFCL1B3T25FQ2hEb1AvUnltd1VBOC9ORW9DY2c4a3FBOTFI?=
 =?utf-8?B?ckUyNXBkNDgwL2ZhZDBSV0dIWk5VSHJkLzRmcDFWVzhNeCtrN0w2YXhYbndi?=
 =?utf-8?B?Q3o2V3Q1ZEtOUUxGSmVGMWx4a2VNZUJBZmQxVnJYMDdFSmxWWVNkNlFrZjRl?=
 =?utf-8?B?TXFxRWllYXJWaDFzN1FYOSt5TUtSdnJBdVlUait3RDA2dU5vZG5NQUVTZDRw?=
 =?utf-8?B?T0VXTWw2MFNUemkvUmJXcGRHN2hib3BkeEh3b2UxZmNxQ3RDN2h1TkVjaHRj?=
 =?utf-8?B?V1VPYVVRa2RUTGR2YzU1NkMvMVlqSVZ3bElKUythc3BNbzk1cVZjTW1HbTN3?=
 =?utf-8?B?TUY5T0hhUEFWajNENHRDbHhIb2RjMEw1ZWtsajBZeVFBelhyenBFZExjWXF4?=
 =?utf-8?B?cDE4WjgwQ3BJQWpaMGR5YXA1YmZxVWp4SnNkUkEvU01NMTE1Q2Exb1RIRE44?=
 =?utf-8?B?RUoxYUtOOU51MzFRV3dQbmJiUXZweitHOWxMdGxHWHhWSGEwdjdvSzBYNlhl?=
 =?utf-8?B?bHNEdE40cW5TSEpTQjNjM014VGdaR1UwZkg4K0pwMmFNeGdNaHBLREhNYVpn?=
 =?utf-8?B?ZUZDMEk3a1MxMm9PQVBXMVhkWjZvTmhsWTg2bk8vNlNoYmdrTEZmWjhJU2Zy?=
 =?utf-8?B?bnFBMzdJN0FKcVNXYlczRWJiaWhISHRvcXdrbVBHMEJNTHp5TTZZYWhJZ01R?=
 =?utf-8?B?QUM2WnBmOHh4VjJCRW41L2ZWMTk2alVJY3ZxZHA3bE5iNHZkY2Z5bFZXOHR5?=
 =?utf-8?B?TDlrTTBDV25nTGZ3NCtkMWh4VEZkRE1rQ1BYTmNxQVFUOUdzSWRubXlEOWpi?=
 =?utf-8?B?L2lPU01ZbnZjY21jRU9veE9BbjdHODJkcGVIWkRNL0J4M0JsYVZTN1RPNHFp?=
 =?utf-8?B?NlFxazZxYnF3emIxb20xUXJlLy9ienY2WS9WOWF3NVA0MXZGZHpqTFZwTzUr?=
 =?utf-8?B?dWlqVlVXTzRIenVNV3RNV1p3VU1SQVREU3hpKzVWNGIyRWs1bmxBOUlmdkhi?=
 =?utf-8?B?RytoTGZMcFpBVVg5UWE2cmdDMzhvd3RHM09jTGlNci9SdVJXQWtiWW9kbEoy?=
 =?utf-8?B?cjl3aFA0K2gySE5EOVNvRHNHRlFCUEx0UlY5Y2dRYnBJbm02aUhVWDRIWWZw?=
 =?utf-8?B?ZWJDeWg5NlR5U2JYb2hGUE5WSnB2azFxV1o2Q1ovb0pGc2lkcnhIV1BMTUFj?=
 =?utf-8?B?V2NmaGlQOUJFMkZ1eit4Q3pRQTVTYWlQTDgzKzRMcnJidzUrL01JRjJWMmw5?=
 =?utf-8?B?dnVUQWt5TEtFa1VqOUtna0xkcmhIb2RhZGkxd0xNVW9HandSbEdOOEliTUtD?=
 =?utf-8?B?SG45NjFWMjVDUTN5RElRMlBPdGhkUHFRandBZC9Bd2U0VWNzM1pLczJJVzNH?=
 =?utf-8?B?ZS9JQjgrZnJWSlR6M09qVk8rdDNJV1BpSkYyd2tpMk8wYjJTV3dieW1zSEU5?=
 =?utf-8?B?K2pybkIxNEtWN1F0OFVBRURCNGx3T2ROcU56VFZIRnNoZGlnRnBEY0Nsc3Nz?=
 =?utf-8?B?SFU1Z0ttYXdDQkNXbW5wZUFrSk15aGJMRG5VY0tucFBCd1VGR3dlQUt4Z1Fu?=
 =?utf-8?B?OUZ1ang0Szl4ckU1bWZUdDlFRVpEeGZoVkJ6cjYwc2h5TXI5OTI0U2VrUGNL?=
 =?utf-8?B?Q3p0aStQcTRjdkRSR09kblpaZ1RBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ad8558-fc4c-46fa-2759-08d9f666c39a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 00:52:28.0592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mWLJvpvd+L49brtsZGt1yy3Z/1ZrAY6OPK/PZXWB8FXoJCiu+260zYTitjxuwmi3M4nRtiLDbwQGSJcMRaOPAwf+tFQqyrWKHPm+f1F624=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2119
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



On 2/18/2022 1:33 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> GuC converts the pre-emption timeout and timeslice quantum values into
> clock ticks internally. That significantly reduces the point of 32bit
> overflow. On current platforms, worst case scenario is approximately
> 110 seconds. Rather than allowing the user to set higher values and
> then get confused by early timeouts, add limits when setting these
> values.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 +++++++++++++++
>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 14 ++++++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++++++++
>   3 files changed, 38 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index e53008b4dd05..2a1e9f36e6f5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -389,6 +389,21 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
>   	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
>   		engine->props.preempt_timeout_ms = 0;
>   
> +	/* Cap timeouts to prevent overflow inside GuC */
> +	if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
> +		if (engine->props.timeslice_duration_ms > GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
> +			drm_info(&engine->i915->drm, "Warning, clamping timeslice duration to %d to prevent possibly overflow\n",

I'd drop the word "possibly"

> +				 GUC_POLICY_MAX_EXEC_QUANTUM_MS);
> +			engine->props.timeslice_duration_ms = GUC_POLICY_MAX_EXEC_QUANTUM_MS;
> +		}
> +
> +		if (engine->props.preempt_timeout_ms > GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
> +			drm_info(&engine->i915->drm, "Warning, clamping pre-emption timeout to %d to prevent possibly overflow\n",
> +				 GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
> +			engine->props.preempt_timeout_ms = GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
> +		}
> +	}
> +
>   	engine->defaults = engine->props; /* never to change again */
>   
>   	engine->context_size = intel_engine_context_size(gt, engine->class);
> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> index 967031056202..f57efe026474 100644
> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> @@ -221,6 +221,13 @@ timeslice_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>   		return -EINVAL;
>   
> +	if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
> +	    duration > GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
> +		duration = GUC_POLICY_MAX_EXEC_QUANTUM_MS;
> +		drm_info(&engine->i915->drm, "Warning, clamping timeslice duration to %lld to prevent possibly overflow\n",
> +			 duration);
> +	}
> +
>   	WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
>   
>   	if (execlists_active(&engine->execlists))
> @@ -325,6 +332,13 @@ preempt_timeout_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>   		return -EINVAL;
>   
> +	if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
> +	    timeout > GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
> +		timeout = GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
> +		drm_info(&engine->i915->drm, "Warning, clamping pre-emption timeout to %lld to prevent possibly overflow\n",
> +			 timeout);
> +	}
> +
>   	WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
>   
>   	if (READ_ONCE(engine->execlists.pending[0]))
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 6a4612a852e2..ad131092f8df 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -248,6 +248,15 @@ struct guc_lrc_desc {
>   
>   #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
>   
> +/*
> + * GuC converts the timeout to clock ticks internally. Different platforms have
> + * different GuC clocks. Thus, the maximum value before overflow is platform
> + * dependent. Current worst case scenario is about 110s. So, limit to 100s to be
> + * safe.
> + */
> +#define GUC_POLICY_MAX_EXEC_QUANTUM_MS		(100 * 1000)
> +#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS	(100 * 1000)

Those values don't seem to be defined in the GuC interface. If I'm 
correct, IMO we need to ask the GuC team to add them in, because it 
shouldn't be our responsibility to convert from ms to GuC clocks, 
considering that the interface is in ms. Not a blocker for this patch.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +
>   struct guc_policies {
>   	u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
>   	/* In micro seconds. How much time to allow before DPC processing is

