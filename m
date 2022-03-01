Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F144C9450
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 20:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F3810E7F9;
	Tue,  1 Mar 2022 19:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC28D10E7F6;
 Tue,  1 Mar 2022 19:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646163110; x=1677699110;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J9ip8eW/9M4q8+8K7foOm4UrebFWZdw8ACrcc8THOTI=;
 b=mAcfD07Y4Bnqtnb3JN+i6zJhKX2fIz4QKoqgVjYBM/vSDvOyOIHcVruc
 1poch8AzZsZZMJk+XRIcQ9gtSsMs+h9WAQcKCHYFfldObBVP9JzVOkE1S
 P1tymJ6nN5tz5D6CEej040BAfOV6LT8X1RW8rys1Tm0WJi+tUN9uUrLAg
 pXkT6BXIl57R1jMnu6C59NrrQrBpcVJCCa/s/A7B2ob4LcSfgpPLMyXoH
 FG9mO+S5grkeOv9gkSToicemGhfSeKuBQ9py8qqjpx7MTP0INbnjTL4zr
 +2u8usMKcB79ka0kylAZLcmNskbl60N+QkGkZrq8xrWLENphxmrmkasMT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233838142"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233838142"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:31:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="545212679"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 01 Mar 2022 11:31:50 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 11:31:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 11:31:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 1 Mar 2022 11:31:49 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Mar 2022 11:31:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQKIWk9dHFP6Gt0KTbaclKOrlZplu3s74XlESvJbLCFX2hwqW8dO51JXeGaOangzt4val7WUH42pTJrz5LIn2DXHJeWy5ju6o0BMQDdP+C4C6KjtFH0dy5gR/bk4XER9ImqN3X93VS3R1tzM29//07HnFXWqKJY/kE4gdGXge8nwMWjrG5ifLJR108ZqIqq1c3eM/FvRp2glp3SASqwt+APu2l2sm20FOKoTkJ9S678EiP48vuKItjBN9mdW+4uBEg0cSpNe1T49cfJS6f175mZmIV0PH36QU0p8JRHxIgbo6/hvg1KLatWqNP1mcGxtb5Wgx9A4NY91czy3LrGy4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhEedbr0xGlEtiEBeDlM0HDq5HMyqAWXq4N4mMM3z2I=;
 b=fAXITmWEKgEa+teQ7lZZ5Pf7OZZKiIwUnJSdECdlb9D1qeb7K1qHxEaly9HCWCU5dTcFq9ic07JsctNkn+YHeutwpHEenXfRxnGKJshSWR/FVs+2uGEctHIfhSTV7wcdJuru2nlq0Z7M3E/0KB865QS+yrH3IdmxCpuNEi7ISEGdElYf86Z3bNTJ6F7+zhl0bm4PvWkT1UyxskpSKD91CuE/vIHtcWmHBS7niPQsGsK682U4RytebxKwBl2wobRx7zvIBDdlbaHoMopzrgRvUq7erooZAyY9J8n4t5F7SSrMY3qtyFy/dT3eSD57O4AM8HnrxOt/0a30j14hMREaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB3370.namprd11.prod.outlook.com (2603:10b6:5:56::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.26; Tue, 1 Mar 2022 19:31:47 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 19:31:47 +0000
Message-ID: <454fde98-2ebe-dc12-78ed-6493712139cb@intel.com>
Date: Tue, 1 Mar 2022 11:31:44 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH v2 12/13] drm/i915/xehp: Add compute
 workarounds
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
 <20220228174245.1569581-13-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220228174245.1569581-13-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0064.namprd02.prod.outlook.com
 (2603:10b6:a03:54::41) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6ff2f06-1a9a-44db-79e0-08d9fbba1fe2
X-MS-TrafficTypeDiagnostic: DM6PR11MB3370:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB3370F705D30E50ED6064ED4FF4029@DM6PR11MB3370.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8uY1Owndcm7udMlYwFx5QW0UeZABnkAC++0TEgY7qIWEXwu9zgjUjMYhgO00Ln0j+Oa6KDE8u1+A7Fr6er5E749pbrzRdVGv5WvjrN/aScXUcdOu5FhtKKy5LZ6Lfg5RegdLAIX3fRwz8waT8Cg4Co3gVEI31XbV6za12AjLiMFbIVmCBAOFE0XyLNSSx24PO0TtvHxNZhY3JucFsL95xcENiwTpSSBQKiqWXCTbuPZ5h91D7Vv+8cCIMNmQ/YZnplKwUcO3gU8/mhVwPbuQMA4NbYHuOOGne5IQAAxjfp+Ys9/suXH5ZfiI9K6UnC0AnGrp2EWe38X/VIp+WGep1OzM7Eif/UoWnRwwdUk7eRHhJZT96VPph6+Jl16V98GcB1QP+3pnOxH2QHP43tUoGU5JxBNbDYGuEVmWcUOwGAGjvGaLnu7wA9gUpphHSfqrLZb/Dwqm9Wu2lLWJj1IwEHkWutrqJfLRbaUfRPujXzWJIYL/rez6Z+DC6Ti4E/+zBVdKsJMgSdap51rP0EwLmVY0jcKXBg6Kv3EfH7+oTq+jCh4fpn6ajZQa3yGS51lBTR6yupMi0G+D2MAwTNT01+8NuYAjx65+EhHemDwa3HVBkpCQrmnVorRMDf5Yfe+lFsIijs8v3X8/4VU6JEOdasjqpY+3+1WMTDjHAj9NHp1zKSKue61/deV6wmijfPGl/HP4y1xplB1vBXtczay3PH36Q50k7MbF4e648Gs5XVJiPDLQA9PbE10fqm67WtUN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(6512007)(6506007)(8936002)(450100002)(53546011)(186003)(5660300002)(82960400001)(2906002)(316002)(31696002)(38100700002)(6486002)(508600001)(26005)(86362001)(2616005)(66476007)(66556008)(66946007)(4326008)(8676002)(31686004)(83380400001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWttdnE5cDliNG1MWEp4WlpaRDZRejJqVE1nandMZm9uYU9pSkZWcGs4TWVK?=
 =?utf-8?B?SnQwOTF0bjBCZ0svZVUzcFNpakw5QWpkYlBsMHIzNkdnVXJSL0xmc0M3NXJl?=
 =?utf-8?B?b0hLRzB1UW9KRytpQVJDcjFyK2RsZGUrdDRWWEE5dGxoZVBMTmpod2RUQm5F?=
 =?utf-8?B?dk1UTDdkL3N4Rndxb0xpVkZpa2dTQzdSRWkyZXFpSGFJNzgwajBVSHdtbXlU?=
 =?utf-8?B?NXhxMmtyMThEbjZhV2hMYkRnTitVM2dSQUY4SmdnQXErRmRYZ0R3VmIvZG12?=
 =?utf-8?B?dkNCSE5VeFdIVy9FNDhkTkVhbm1SRk45TFBBeWJ2aXpwM3ZUSHlaY00vZjI0?=
 =?utf-8?B?RlVPTHVFZkpnRXhqZTROaHB2MDF1UlRiYW9FZmhVaHFMbmpvNHhqNk51Z1NQ?=
 =?utf-8?B?aUs2ZCtXeUV6UEJsYTVXZnlvME80dEsvM0Rja0pvalNxRFVRWEkxdHBwNkF1?=
 =?utf-8?B?R0xLMW9RQm9rbjJGOFVNUGNCRXRtZGtnWmx0WVFHckFKMDhjTXByWXN5alVE?=
 =?utf-8?B?YkJMWjQ0TG5mU2ZjcHN2Q0ZzUlpUS0dvRm8xRndNMEp6MnVtZkw3NXF3VnVT?=
 =?utf-8?B?WHBvTzQrRmJzQlhQa1ZweWFZRU5pQkc1dHZBMm5zUDBqclNXTWZ6T21ic3NP?=
 =?utf-8?B?NlpHVjlBcEl4SUxIOWExOHl2bXdBb1hGZDBWOFY0Vkh0U0ZnSEZuTS84NCtH?=
 =?utf-8?B?YUpxMEtzVFovOTlLb2J1Y0hWYlhlQTcrekgzbnUvT1hMdC9BbGczb3EzNVhG?=
 =?utf-8?B?ZVM5N1YrdEk0V1Zjd0RkUzRGWU5mUUNRSkdodkxnRm9nM0RkR0pCb2FFVlR2?=
 =?utf-8?B?ME92YmdvQmEwK3NCM1c5U0VEVXBUS29UaDVqT05PZWZ1cW5COVZXUVUrWmwy?=
 =?utf-8?B?ZWVLUEdObmVOZU1OZE9MNm9leVlqd0lRbGlvazZ1dkgyR2l0YnBCUG1jQ3Vp?=
 =?utf-8?B?RkFUZThFd0U4R0dWU3Q0ZWgyOEhpckpSUU95SXh6WEhPcWppVGdJK2NOTkxF?=
 =?utf-8?B?K1R1ZFlIMDExTW9ZRG1wM2haWWVoZG1yUGc1QjNiNVBMZ1VCdCtTdTFTa3ha?=
 =?utf-8?B?SmVrakZFZTczTHJpZFE3K09EWUpuVm9teVgwUitaQ1VCQTkyRGtvMVpqVGpK?=
 =?utf-8?B?MmlabWRZTlQ2aU51cnZOZlJzeG12US85RzNYSFUybEpLSndjaHRielVEUjJB?=
 =?utf-8?B?MXRyMzBhdHhWMi9sRGVQVUpLZHg2SmpJa0VYV2dMV25xQzZoZEZ5WWUrend1?=
 =?utf-8?B?U0VUbWFKUldPVDJzWFYvSjFaeTFZV05ZaTc3OVdORmg1T3FqaE5KZGZsUldP?=
 =?utf-8?B?RGl2RlFFTkRPdXFYeHR4NG1NbGJ6aFBmcHZXWG5BOWZidWwzQWV3VW5qS1Nk?=
 =?utf-8?B?Qnp5K1lNMXhSRTlGOE5NUGpJSlJRTGNCSHhGQlllRTl0WU8rckgzbmNVLytL?=
 =?utf-8?B?Q1dtVGh6YTRGV2gwZkFLbjJheEtVcFEyUlBnYnhXMlErdHZYZmM1eWc5Zml0?=
 =?utf-8?B?TXJqSHhtMUFGd0lFaDlvanI1V1VKN1VwL1VSZUNWeHFRR2JOMDFnbCthZ1pL?=
 =?utf-8?B?S0dFVHBacEZOdmR4UEdEQWcwNndZbUk4bm9zMnJuOEo3Smt5R2JmMDdpQ3hR?=
 =?utf-8?B?L2hucFRHby9ON0hEZ1l1dmlZVEpMdzU5VWlaOTlmZW5UL1VPWktDT3Rxcit5?=
 =?utf-8?B?OTBTZGRaN24xbjN2dUpsUmFIN1hNSGt4ZXM1d1c3ZlJKSFdINTY5UjhxNUow?=
 =?utf-8?B?L2NtaVpQc3U1WXhWZTcyQ05vRDlYQmpyeTFSR1d4NHlzcnduNDR1YmVoRDZF?=
 =?utf-8?B?ajJKZmJKazBFWFVoNzl6OHU1bXkxU3dqNno5SDA3ZHJHb2E5RkplZ1V4WUhZ?=
 =?utf-8?B?SW5MeHhJeDNSQWtKQmMwUkh1Q1FaMDdJTlVmY2FzQ1VEOFpvMnA3UURuZzU0?=
 =?utf-8?B?T2xCdzZ5eElpa3lpY2E1VW1ac1NDbjNRRkoxMjRtdmxBbVpyWnVlNUxaNDFW?=
 =?utf-8?B?SEFMYmNrT0lRVnM4WEM4NG50TGVtU2RkRXp4NER2V1V0SERKMUgyM1p6akRV?=
 =?utf-8?B?UmxrNU16aHNNWm02aUFYYW10WHYvTlVLNXJScnltN3pVZXM4NEthcnFrZ2tL?=
 =?utf-8?B?UHhGSHhUVys1WDJwdVdNQU80Njg1aWQreTFyTUFWQ21uQisyK1NwQlVWRVIz?=
 =?utf-8?B?c2VvWVRKelA2VXB3TnE4UVQrU2Y0WmhIR0VJOW5CaTZnUHJOUUxBNysrZjRm?=
 =?utf-8?B?Y3dycXZhSGs2Rm1rVlhKR1cxbHR3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ff2f06-1a9a-44db-79e0-08d9fbba1fe2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 19:31:46.9091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hzVIiUTvx0iYAHP3g6CpwQHoPpVoeHOpwicng5JP/Qz3YHtUsgA31l02MpHlzUBrW2PaJvXF26Yls6FMRMw1hosw1FugWOKgjM6x69WL7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3370
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/28/2022 9:42 AM, Matt Roper wrote:
> Additional workarounds are required once we start exposing CCS engines.
>
> Note that we have a number of workarounds that update registers in the
> shared render/compute reset domain.  Historically we've just added such
> registers to the RCS engine's workaround list.  But going forward we
> should be more careful to place such workarounds on a wa_list for an
> engine that definitely exists and is not fused off (e.g., a platform
> with no RCS would never apply the RCS wa_list).  We'll keep
> rcs_engine_wa_init() focused on RCS-specific workarounds that only need
> to be applied if the RCS engine is present.  A separate
> general_render_compute_wa_init() function will be used to define
> workarounds that touch registers in the shared render/compute reset
> domain and that we need to apply regardless of what render and/or
> compute engines actually exist.  Any workarounds defined in this new
> function will internally be added to the first present RCS or CCS
> engine's workaround list to ensure they get applied (and only get
> applied once rather than being needlessly re-applied several times).
>
> Co-author: Srinivasan Shanmugam
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
>   drivers/gpu/drm/i915/gt/intel_lrc.c         |  6 +++
>   drivers/gpu/drm/i915/gt/intel_workarounds.c | 47 +++++++++++++++++++++
>   3 files changed, 54 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index e629443e07ae..19cd34f24263 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1060,6 +1060,7 @@
>   #define   FLOW_CONTROL_ENABLE			REG_BIT(15)
>   #define   UGM_BACKUP_MODE			REG_BIT(13)
>   #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> +#define   SYSTOLIC_DOP_CLOCK_GATING_DIS		REG_BIT(10)
>   #define   PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE	REG_BIT(8)
>   #define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
>   #define   THROTTLE_12_5				REG_GENMASK(4, 2)
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index d333400d29fe..e9ea576b96a4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1217,6 +1217,12 @@ gen12_emit_indirect_ctx_xcs(const struct intel_context *ce, u32 *cs)
>   	cs = gen12_emit_timestamp_wa(ce, cs);
>   	cs = gen12_emit_restore_scratch(ce, cs);
>   
> +	/* Wa_16013000631:dg2 */
> +	if (IS_DG2_GRAPHICS_STEP(ce->engine->i915, G10, STEP_B0, STEP_C0) ||
> +	    IS_DG2_G11(ce->engine->i915))
> +		if (ce->engine->class == COMPUTE_CLASS)
> +			cs = gen8_emit_pipe_control(cs, PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE, 0);
> +
>   	return cs;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 0471d475e680..0b9435d62808 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1921,6 +1921,11 @@ static void dg2_whitelist_build(struct intel_engine_cs *engine)
>   					  RING_FORCE_TO_NONPRIV_RANGE_4);
>   
>   		break;
> +	case COMPUTE_CLASS:
> +		/* Wa_16011157294:dg2_g10 */
> +		if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0))
> +			whitelist_reg(w, GEN9_CTX_PREEMPT_REG);
> +		break;
>   	default:
>   		break;
>   	}
> @@ -2581,6 +2586,40 @@ xcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	}
>   }
>   
> +/*
> + * The workarounds in this function apply to shared registers in
> + * the general render reset domain that aren't tied to a
> + * specific engine.  Since all render+compute engines get reset
> + * together, and the contents of these registers are lost during
> + * the shared render domain reset, we'll define such workarounds
> + * here and then add them to just a single RCS or CCS engine's
> + * workaround list (whichever engine has the XXXX flag).
> + */
> +static void
> +general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
> +{
> +	struct drm_i915_private *i915 = engine->i915;
> +
> +	if (IS_XEHPSDV(i915)) {
> +		/* Wa_1409954639 */
> +		wa_masked_en(wal,
> +			     GEN8_ROW_CHICKEN,
> +			     SYSTOLIC_DOP_CLOCK_GATING_DIS);
> +
> +		/* Wa_1607196519 */
> +		wa_masked_en(wal,
> +			     GEN9_ROW_CHICKEN4,
> +			     GEN12_DISABLE_GRF_CLEAR);
> +
> +		/* Wa_14010670810:xehpsdv */
> +		wa_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);

These 2 WAs are also implemented for DG2 (with different IDs). Are you 
planning to move them over to this function as a follow up?
All the WA implementations match the specs, so as long as there is a 
plan for DG2 this is:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele


> +
> +		/* Wa_14010449647:xehpsdv */
> +		wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
> +			     GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
> +	}
> +}
> +
>   static void
>   engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   {
> @@ -2589,6 +2628,14 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
>   
>   	engine_fake_wa_init(engine, wal);
>   
> +	/*
> +	 * These are common workarounds that just need to applied
> +	 * to a single RCS/CCS engine's workaround list since
> +	 * they're reset as part of the general render domain reset.
> +	 */
> +	if (engine->class == RENDER_CLASS)
> +		general_render_compute_wa_init(engine, wal);
> +
>   	if (engine->class == RENDER_CLASS)
>   		rcs_engine_wa_init(engine, wal);
>   	else

