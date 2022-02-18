Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7314BC1BE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 22:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C76C10E900;
	Fri, 18 Feb 2022 21:18:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E56B10E4E4;
 Fri, 18 Feb 2022 21:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645219121; x=1676755121;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1xWbfy7vz6og/A/dQD6EecoPZtm+8vEOtZH1ahGy1Dk=;
 b=W6u5Otn2DBTc4M9xxrGFYaIcPqr3KpU9u7uLKSzHYKepoMWtY5W2xwTW
 aVKBwpeYjVfcMWOaeXK+7CgUqgLDMas0EdUGK7xRoOwjvhLdKj+2doMJr
 uI5rQBZAd6JFNftB9imOSYJaIeCZgMPRcq2qHz5FzhbW3hNQbZ5UL+l3E
 uQAMi7qTnB0r4uiviotRsJ1NVMiRNGQhrJcz9VtX9fEqSJcFy/8lUWiTm
 lJLP5py5OADNWzRRSgKdi/WoE3iI7YWOKk0gqwDQwqPOM0b4sFc4Cr9yn
 9MJ5wDqOSVofYGTW/sPMoH7FSsFBl7zzSxon3c6rvNI65M1NLnDze1Rmt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="251411074"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="251411074"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:18:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="590324577"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga008.fm.intel.com with ESMTP; 18 Feb 2022 13:18:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 13:18:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 13:18:39 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 13:18:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3dave7yaciMJsE61RfExk1FKUjC6DDPBul3GOTksa8Vv7TuKT95e4yPJmW8Wd7qPWZaI9Mqsii4zHFWTWUljTMF2iOGrxN83bwZNDtHafb5iW2viPWeUhc06YAiUEGRiYJ5TuZ+w0GdKrWuDNfLByFs9cpzeqkOTpvRiTSYL2qD6MabnL8wT8vvGPDLtSqmaVQRI9eWydkahREUXfyZ3dCCnKSAt67X9BzE5NfGoNBgZ07WJkWuluQAK/99NiYtNW1XYVWxQI0Bw/dMC/ISi6ng2f/RsLPHJS1gn1RdM8Qv1LPZQcEwYJUDXWhv+7tJa8oOstU2u9SdZDtIxBk+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIUiBpqPstuxoDIlvXf3/oVUuS/iBt6jqevZ9AEpIrw=;
 b=FMGqwUg9k7HBbc9OndyZeMDPunkU/j1otEb6+BTfg88PAdRn4bore3+z6Ggwyf9I22IivrO7RKSJ3dVJeMyeAICOwmkUENHRY37sJy2KCMBvgzs4CYwt7izX39tzXU+YTpyWdOJ6UHTEBeE4775vyfHRwJ34Q+ZX/c2LUlK7q5IYqewoH2pWa4TX99sH9nUomifa35OnqAA4pltTe33ikgDIG+efjo+WHArTFbYK1vjZtLIqSQcUX5hOdUShJiWu7/xQlN+kOzRug7Om25pBY/IaiUemxLqg+ptpqHR3cTu7rPZEanvcwoS/XAve+43GLXo54UwZMVRKd5KGcKTzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by BN6PR1101MB2116.namprd11.prod.outlook.com (2603:10b6:405:58::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 18 Feb
 2022 21:18:32 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e041:f94a:d733:9573]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e041:f94a:d733:9573%2]) with mapi id 15.20.4995.024; Fri, 18 Feb 2022
 21:18:32 +0000
Message-ID: <d034db87-b79e-9d27-a4dd-a1b7eba8ecf0@intel.com>
Date: Fri, 18 Feb 2022 13:18:28 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH 2/8] drm/i915/guc: Add an explicit
 'submission_initialized' flag
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
 <20220217235207.930153-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220217235207.930153-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR1201CA0020.namprd12.prod.outlook.com
 (2603:10b6:301:4a::30) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f476ef4d-b804-4f13-d597-08d9f3243710
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2116:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1101MB2116B80B9799D5A1D826599EF4379@BN6PR1101MB2116.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ktg0kzXPTdUlnDrgdICy6CbA0U08275vdcKrtlfoKF++IZ2TNhO/a0zABGfqeAlbbcfRkN1RCmaksz/LOWHTadoWgSkYvbeK3qH7kHvPB/ZtJx7TEh3mVtd/VEblcTHaz7osYoaOiz0FCZdKdMVB2VB3jHnBIshNSxkPWv17DGbOzL0haI5oxkuwudQ4emMvV/W10YHdIMuQ7s7j03XsU67Bhb93keiVziT7/kyOILaQ9nbXLqKgSNQcQdfiUpgl7pliSWlWs7t5af8JIelICNY/jM7PFd6ZvoCNgpYpfZDy35fEQo+EC8EUsHkgTWxkNsA5OXJixRHkpG1cqywhJQr6yWKYGGr4CoUuQRjzahNUh+Gwtbpk8lk3RZzDb9EcETcEkO3DN5oa1OD061fHbpjSUIcSN+TlDar+5nGGt3pEp+yDf46M4Y1z8n+4G+PmewLOBzfs3IMCDxQbYRdzoTTELKZ7Sj73UC7p9TvRsmG6UQNV37oHYjq9sdUSCHOheQe/vVFKa6wjr7UZwKS4IGNBzpWRDLLNS2SymsEBslO53dQXGuMfgeGVvEijzxKflZYJpXK944yJJ4EcKFmNgx8N6kKwM5J1viCaf7WmTWIZ9FYJiIP402OVjgDLuLiX0vIyIGBadj4JsWiWSGQPzB9j5Y1v7lMbN8KIQK0mr3VX12CcLJJ7lG0vFV1mCgNeE5CWibSYcSED6ytlYJfjg95UDozObJa80pfnDhIhH/bdVE1x2LWFNd4RuAzSoFJJnnIsWSmEBKfFdb20ad6lpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(53546011)(31696002)(83380400001)(36756003)(82960400001)(8676002)(4326008)(66556008)(2906002)(316002)(86362001)(6666004)(26005)(6512007)(186003)(6506007)(508600001)(2616005)(38100700002)(31686004)(6486002)(66946007)(5660300002)(66476007)(450100002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUhKVVkyZit5L0p3R3hQRVoxTG1UU281ZFJKRFR1SjROUEVlU1B0Ri8wRHJq?=
 =?utf-8?B?U3NsVWgvMFhhRkxpS3VqZnhyMVhxRUN3Qm1WWWJpSFpRek1Cdmhpak5aTWow?=
 =?utf-8?B?aWJvZmxFQWVpWE93RWpRZmpyVURSWUE0MnI1U3RRdVNIWXNJcGgyLzVTNVFT?=
 =?utf-8?B?Z3A4Qm1PN1NQZVROcWlTNjRsOUxZWEQrYkpVclpTSHdjMjFydzdITkRXcXFy?=
 =?utf-8?B?YmRXWXMrVkpsQnNpZk9ESkRWQ3BlRExzZFpxVU4xbUlYS1hFVWFhK1FXQi9p?=
 =?utf-8?B?d3llU1V1WnVITEhKNUJNUjBoeUVBOHZmbE9LSG9BOE1BNm5rM09mVmt3WmJm?=
 =?utf-8?B?bXdveVZ3OUE4Z1Z6RGRXWlVjZ1IwdktqZkdiUmdKQzQ4YmR1NjZLWFhoRCtj?=
 =?utf-8?B?Zmk5dTR0RFBEZ0NDZ0dwV3Zrd2doWEdydnkyNDk3MEFXMXo0bjBYb0tvVGo5?=
 =?utf-8?B?b2Z3ZGtmTzNEcDhCaHJBNjJRK3dhZVJhS0ovQ3E5OXNFbHBCUlVFQnJhUEVF?=
 =?utf-8?B?YXBkb0NDbTE3bkh2WnZzZVlSTm5VNTVyTElvdWdwM014VHZrUHhETU5EZGpu?=
 =?utf-8?B?MTdabHIycGVVQm9OR2tqOWQ3aFBHTW5xaXdwZVlEUHpXUzdqamZiUTBUN0ZZ?=
 =?utf-8?B?aTlUZnp0NGNyVEI2NVVYREdacnhiU1dvcHlSMkhiSHZrSzBGaVZjQWhLei9k?=
 =?utf-8?B?dHpyV1JFbmJOQkJWYndmWi9ycm0zRUwyN0NHZWlLdE1YQVhRUUZlc2VaZUpQ?=
 =?utf-8?B?OWN4YjJRanREMStmWi9DNmF6cHpQMWZvOGZtYlR4YkJXZUc1by9sS05YV2Za?=
 =?utf-8?B?KzdQbThuNzZVSW5nam1EeXM3clVCUHFzTzBGbkxqYnBJZ21IRGZPeW9MaFJk?=
 =?utf-8?B?eVBhSWhLZGZ1SzJwQjdGTXUvZnl3LzdDMDhFSERXbS9GdjJjNW5yK0JrNVov?=
 =?utf-8?B?OGxRZVUySmRqYUM3SWowZExkbEhIWVFYSkQzOVFwbldHdFI5NkV2VXZ3Y2l3?=
 =?utf-8?B?aWg5bjhsenYwWkdMeElySHh2bnhIeG8zMzJlOHh0Q3Nkb21JZVdadHZ5NkhT?=
 =?utf-8?B?UGVVTXhNS3g5NzR0TGRpK3V3QW9pQ3VDL2NGUTdDNkcvQXNwQWp0dXZxaWNS?=
 =?utf-8?B?MTZRQXdSS2RKdFhUTjJTZ0k4QlJkc3F2QTViMXNHWUhGaHJtaFZ3SXQ1TG5h?=
 =?utf-8?B?endMZ0IxWXV0VlhYRzkwREc0MmRBNmFpQmticXMvenFsb2Z5U0EwSE9aK1Ja?=
 =?utf-8?B?d0ZSQURCWk5YZ2phQ2NobFF1bzlHU1k4S2pCQzN2NDdvSjF1eWVYMHVkc1BZ?=
 =?utf-8?B?YWNwOXlKb2lLZUV0Z1Jqc2lmZGszRzdCZXhJaVByY0FwbU5IeE11T0FDcU1J?=
 =?utf-8?B?UjZPRHZBcXNWNEowRTAvQTY2Q05xeS9uNTJzQkZDMUNkVElCSWVzTDVoYmVu?=
 =?utf-8?B?UnR4YkJwQ0VwSXBXOWNPdXM1ejBOVVlXbzB5clFSUkExTEVvMnBGeStyTzNk?=
 =?utf-8?B?UEFkUWdqbUZwZGdHZ1hMZ2Rrc1lrY1RIUHdIQVBaYmNOTzIycmgxRTN5RkJX?=
 =?utf-8?B?UHM0UU1FaTF1aUxwRFcybG0rTjZlZ0t0RktXVW1uS2VrOFU3ZkV1bW50SUM3?=
 =?utf-8?B?UThRTWd6RDVyRUVtc2p0eGVxaVlXTUlPSUhXbGNLcENRb284cXdHdGJzZEs2?=
 =?utf-8?B?dFpEajA4WE9FZTl4SUhtRjNYQjZhbFpLK3pTOXFxUHErdlhzUkhOOGFPaTBv?=
 =?utf-8?B?UUxQZmFRaTZOcHQ5TnR0RFlSUEdMUXNMR3hvMXJCaHp6L2d4TFBpa2pEMWdT?=
 =?utf-8?B?VWYyT3Y4OG84czJTUDA4TVdMM3hXM0tQVlZESnlMTThjRGNySUIvcXFmV1ls?=
 =?utf-8?B?dm1pMGVlbFJaVUNmV3VCbWUzWm9rRWhSSWZWOVgwVHFXWHVrYnZuTmE2U2sv?=
 =?utf-8?B?RjlBZDNJckFSNmh6S3pKRVQrcS9KMy9rK25MVEZiRXRmTFo4WE1Dcyt6QmFw?=
 =?utf-8?B?czRDeTVabDBWTElpWkwyL1pyVTBWQVRnWUJSTVE2eG0zdVNLV1dWSjNYR2lK?=
 =?utf-8?B?WkYrQ3haVFFhY1BRbW96V0NJNXYrQ0U3NkZzdDV1Q09RSTlsSFpBT3l0RDh6?=
 =?utf-8?B?S0wzMGQ0SVBLdjhVSm5BTGlXd0RJaG9LcU5FMThsbnV1ajNyRkZkVzlFc1lt?=
 =?utf-8?B?ZlRMWGM4NmFYbGpKT0JPSlJIU1I2TU56M2Z1YlBMbE1RTHA0YWJVN2IxblRo?=
 =?utf-8?B?bm54eVY5ZWtlSU56V3JnNlRsY1NRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f476ef4d-b804-4f13-d597-08d9f3243710
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 21:18:31.9901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soutm7RYste15UAY68/E34BPi7fSgY6T9jdB3IKKOQoavi5sdBNkJ2Em2tV9Mj6Brg4Xo4/jkodr2oUaXzFR4T8UZOPXMBeKnLtxxN4D78M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2116
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



On 2/17/2022 3:52 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The LRC descriptor pool is going away. So, stop using it as a check
> for whether submission has been initialised or not.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

grep confirmed those are the only places we use the pool that way, so:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h            | 2 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 +++++---
>   2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 9d779de16613..568eb6352ef0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -137,6 +137,8 @@ struct intel_guc {
>   	bool submission_supported;
>   	/** @submission_selected: tracks whether the user enabled GuC submission */
>   	bool submission_selected;
> +	/** @submission_initialized: tracks whether GuC submission has been initialised */
> +	bool submission_initialized;
>   	/**
>   	 * @rc_supported: tracks whether we support GuC rc on the current platform
>   	 */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 7fb889e14995..11bf56b5a266 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -511,7 +511,7 @@ static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
>   
>   static inline bool guc_submission_initialized(struct intel_guc *guc)
>   {
> -	return !!guc->lrc_desc_pool_vaddr;
> +	return guc->submission_initialized;
>   }
>   
>   static inline void _reset_lrc_desc(struct intel_guc *guc, u32 id)
> @@ -1813,7 +1813,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	int ret;
>   
> -	if (guc->lrc_desc_pool)
> +	if (guc->submission_initialized)
>   		return 0;
>   
>   	ret = guc_lrc_desc_pool_create(guc);
> @@ -1845,19 +1845,21 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
>   	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
>   	guc->timestamp.shift = gpm_timestamp_shift(gt);
> +	guc->submission_initialized = true;
>   
>   	return 0;
>   }
>   
>   void intel_guc_submission_fini(struct intel_guc *guc)
>   {
> -	if (!guc->lrc_desc_pool)
> +	if (!guc->submission_initialized)
>   		return;
>   
>   	guc_flush_destroyed_contexts(guc);
>   	guc_lrc_desc_pool_destroy(guc);
>   	i915_sched_engine_put(guc->sched_engine);
>   	bitmap_free(guc->submission_state.guc_ids_bitmap);
> +	guc->submission_initialized = false;
>   }
>   
>   static inline void queue_request(struct i915_sched_engine *sched_engine,

