Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A14A97117B7
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B27510E74A;
	Thu, 25 May 2023 19:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC5E10E749;
 Thu, 25 May 2023 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685044472; x=1716580472;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AkdJdXUhaMWIAW+mAJxzDWUxNR6PAhgqsYgpFMFN4Ug=;
 b=dfsIa6QEvDhSMT7jm9c82FVnLKY7XAxEeQMvKLuASgDzhgPZYtN4A4Ea
 fpbUarzmgFo/rY9UIjzeP0OUsrqpdD1BtlsVpd9H5aTCKbfLLFEJQvLX6
 /XifV0xh7T8nFBK2gsudWBtmXcKpQGXXuMy70Pg3etaKsMHu1AEY7nJr7
 KI4pNdQs00nHXIroOQ8oULsaA6CmJf0gNrfDxD+aNAaWRiqvtQEIWc78b
 h4SdYBHlGa2shdAJnqGwjs7sM4hPmrYirOFWBpmnN3tATdQu5UL+n5oy2
 rlAW6N+rTus1KdIdLLONBig4HMwd8PVn7pT/1WW96E+qqKMunjSLSo2sm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="333629024"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="333629024"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 12:54:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="770051020"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="770051020"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 25 May 2023 12:54:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 12:54:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 12:54:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 12:54:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 12:54:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFqCP/Ohs08v4VhmYNkAtrPG5+1b6bR2rKIjCYukkYoz6WRARfJhHeGmDdv8ZntjMjpH1pVJKDp6IwJwRgb7LmEwNDa8BaT+QvkHf8FjEI+8Sbf/T0bhPHlw/VgEzFpa3XlvAoR0E/wMPGbd1cM+MOsWxUHvSpEiVHVSfxy2YeWmft7k0Vvj0fWxSBMcxoQ56x6pu8ntAvH+rQ0EwwoZkNaZjJi0+FLFeIy5tryU49AzZIc6ttgbCqVp+DwhJU4a5vD3eE4psqZ7WziV4nbQWWT0OXMg6NCKhsIMG5ZMz0SYFoicDzfgOAa0mHcNNCUcOmBwI+LT6ex/mT/OuI9l1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0+RUxJx0o4QeSNIyMBo5AimvWma/vMmKH7b4qGTA3M=;
 b=lLJmfWF14YwojUsAr3QzZJyTNibwpcTynuawhJi9pBfNIzoQwAyWj+6AH31+/3eKcNv5Ir5GkSosXf6QdQKg/yynYsBEQTwzQtLKojxua6mRqq3IxJjt6liasgS9+clzUL/P1QF3cK/CUOpZoRWyC6c4OlWwIgXZJwq2xAp5wU2kpMtLhHMi819Wk/td3+nzn5h3bkjfHKNP0RdtSFWAMLzhliI85ax/Jd7+q378tRztDs3oNlLv7y5Gyy9A9Df9DogzS7H6FTiLcobGXC+R0dKIgOVFnWSp+EeN7DeZjm0ydO7LI5w5XtkVcnGeKgh935Nzl8pIMRlq5VhGATs6gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH3PR11MB8140.namprd11.prod.outlook.com (2603:10b6:610:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 19:54:28 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 19:54:28 +0000
Message-ID: <5a0a1373-3b42-27fd-3239-aa364487d481@intel.com>
Date: Thu, 25 May 2023 12:54:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v2 8/8] drm/i915/huc: define HuC FW version
 for MTL
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
 <20230428185810.4127234-9-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230428185810.4127234-9-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::48) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH3PR11MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3b49cd-5f46-4f0c-e7f3-08db5d59d94e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o4b4BamekMYA6lUfpAj4/edgW5N0j+bc3BxnGg3Fo9Yjkz4ASIuPseKNz2rAAD5Cj3rB+IhkBexR4mD8/GmjAIvpnx/qXBDjfLYM6NRYLJMOzG4sWqgT8hr0FDDRnC8Gj8ucBLfremhO2qreZ6HkY9ruoTm4PVjmcKG+Jrbj7zTjuXrxKhWD0Gyh5ZWZNHs3h/MkTBO1kzZ5Cg2IMD8B4YbMTA2L7T4a+42pJUQTZfi4JavTI3/ib8VwRR9Bqp/B1AtWULqPKpgiqHC82BUyXaHWikQqNUvKv85gmV48GqSPReE1w9KVxNGhbDsSkpOIc6PDCFt5cXBWkdj+a1oemikVNxYQ3BZODIHhcDcMJOtHJXSuFJZIc0agSry3s9s6pDA4qsjeiL8CI6DEStxImVKBXk7Wev1JGUkgfp7KFbsERSx85f/WBI4wP8b3jVJQd9yZHmoGJTIu2A2FhvxE0SigMa+rVmYr0iHtp+jUgfgY7YvWMpqWq0PYFFG1hSiqF57A+UjPOjJI8dzs9BGKVzDttrqxoNtw4TE599WgZt84nIyx1/m3qQPfPuagJf4mDlYXVx7qAeNu+riB9KpPDd8Waa7v02pRAt6OfkpxsKYyQElD3niYgvIeHs4oyXBXYNHawP/9VZxarOWsQv7OHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(31686004)(450100002)(66946007)(66556008)(66476007)(478600001)(4326008)(316002)(86362001)(31696002)(36756003)(26005)(6506007)(6512007)(53546011)(186003)(2616005)(5660300002)(41300700001)(8936002)(8676002)(2906002)(6486002)(38100700002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVJMOURZM2MzVHczVTd6bCtMQWhoOXFWZVlUUFRPZ2FRLzA4ZktrVnk2aGpS?=
 =?utf-8?B?TTluNk9ZWEF3OGVIR0FoVzRQK0JJalRvUXAzS1FDdTJGa2hUTWtrMncvTlZV?=
 =?utf-8?B?MzVKK0xhaGZLTDgzTy9QSDhqWW9VOVFOK3JEdk5GZ3BDYVVKNzEzdGxLZUNQ?=
 =?utf-8?B?c0tnbXNKZkFoZ21nVU9WOE1lSW1POUdocUNETmdEeTNpcjJ5Q0srSzJxUjVH?=
 =?utf-8?B?M0dMdDE0YkxDN1RXSnRnSmwzT2hPbklaWXJYRW1lRWtMZmhnOE4yVnA5Y25E?=
 =?utf-8?B?aVBoTXVvejdrVk1OcnBzZ0ZVMWFBR0d0NGQ2ZHRPSi82L2dxSzkzZTIzRnlw?=
 =?utf-8?B?ZG5tNVBVa3QwOUUveXBYYU1DWkVNcVdja0V2VDhFclIrYUIwRXBLak4ydzNQ?=
 =?utf-8?B?YUc3a01qVVQwTDQ1bFcyb25GcThvRDFxMjFudURnbWhydkVwZjRwa3AwRFZi?=
 =?utf-8?B?M1p6KzNEK1VLYzlaeTI1UFVHOFRzUXVOWFlLNGdPOVhYVlgxMmhjdkhsMlo5?=
 =?utf-8?B?ckhZRGRmbHRZV3pVeEcvU3BzUlZmVzEvWENXaTA3Y2pKNmZjRFUzeXB1OWZL?=
 =?utf-8?B?VzIxMm41OW4zRzJFRU9qVHFtTjRPR3gxc2o2SXR1RGQ5bXB4MElMTWVaMmhm?=
 =?utf-8?B?VGJ2K3p4Q0llYkpHVnAxWllBRFl1Z2VGaTRzZC83dTQ3ZkVHYnE0WUUyaHVr?=
 =?utf-8?B?cXpVbkVNVFg2aEQ3Q2pVMFBkbGhwNG5HR0lPQitaSW9NVEQxZUlqVmxqWnpU?=
 =?utf-8?B?RytJZFBYanR2OFNLZ2F2eEc3MDNtU0srWU96Mitva2lIaXRRV1VTRCtvazRB?=
 =?utf-8?B?akFQSU1SL0tkYzZITEFqbG9ZZEE5RFAzZzNTK1Q1MGVXYjVDUVo4bjZYY0h6?=
 =?utf-8?B?WkdWem5wcXJLRGkyYmJnSDloVUQzOVRTNHF3bHorZ0d4Y1plOHgvSERIQU5h?=
 =?utf-8?B?TnZrU3Jyb0orNkdpMEp5dTFEbXd4MTdWSnh2MTBZY2RlcytqQUxHVVM1encv?=
 =?utf-8?B?YS92cmhqM1JweHcrb2lic3ZlWTFBaUtrSHl4OUhGWmhMTFZoZGRnSnBvb2RH?=
 =?utf-8?B?cGgweXc1K2xZM0RxOHFXT0NTa1QvQ25zR3ZDc2RzNWtEUUZsZmh1R3JtRTQy?=
 =?utf-8?B?ZFhIMHIyRnlyN2xTN0FwM1pXRlhEZGUyMHFudHRyYVZxZUt6SjZ3VStVNzdN?=
 =?utf-8?B?KytRbWE3K3htcmJBdytUallWYjJCUUJ1QVNKUW94b2htYlBPaHdSbDIyZGZ1?=
 =?utf-8?B?alFaeGNKRjlDV0tpdUhIaTFic2Y5dlJKbkFyUjVRMWJrVFhaQlNOQ2xaSXdo?=
 =?utf-8?B?Um5nUUJnQUFPbnlEMTcyV0RFZml6Vm1vVlZzMTNVb1VzVjJ5Y0dDdEJDR0gw?=
 =?utf-8?B?WE9tbStGSnppNUpXSHlpdGd3TDdoaGYyRHNqc0d4TUpqQ1NJeDB1eTFhZ24z?=
 =?utf-8?B?eERydTZWbzcrekptbHBrMTRhdkRUZkcxSGhoN3R0Zmw5ajh3WC9YUGlYT1BL?=
 =?utf-8?B?ZXp4c0poa1h0dktMTmhYbjFldlNQZGdFRkVJa3FINnFUUm9ueXpncjFKZjVI?=
 =?utf-8?B?bGdzMEpoOTlWNkI3bHRiKzc3VEN4dENqRmRXQVM3MkxsQ2Qvc2pRUHNDOVBR?=
 =?utf-8?B?M2g4REcxRlE5eklONUxXbUpCdmc1RVFBZnZrZjZhVmdzaklSN3lreU5sNGJR?=
 =?utf-8?B?dnMyNVZYYnpIUkRFUWNtYjBhaW4zWGwwZzIyWk1BNUF0b0Q1MmMvYWRsamNU?=
 =?utf-8?B?WFhPMVVPNDJCanVFMDg0U0d3aUVxazFCN1AycU4vM3pyNFlKaVdyQ094RXc0?=
 =?utf-8?B?OWt0VFZWa2Rzei81R2E3M0t1ei9nUGd3VXU3OHhubjN3Rjl6NTAwQXJoelU0?=
 =?utf-8?B?WGZnZWRpS0lGSVU0dnVrbDN3RFhYOGZxSzVacWx1QnJtZTAraTF0M1FaOHVB?=
 =?utf-8?B?RzdkV1FpRzRVb1RXRk1ndmxhY1BpUnV0djM4eW5nYlJoZVRIeXhmNmZOYU5C?=
 =?utf-8?B?RWlnemlTOVBOUmxqcnVZQjJXSll3RkFJa2xLbFNEcmgvQW90cW94dFRxUEcr?=
 =?utf-8?B?WFJMY2Y4UUJ6S3ZqM1BIcnFrMHI5ZzNpbjk3K0JQckllOHJ6dS8vS29PWW82?=
 =?utf-8?B?SGttcVByYmE1aEtwNFFIQlcxT2ZsL2hxeEh3c0VIUzJ4MTlwNFUwVlBtRjhM?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3b49cd-5f46-4f0c-e7f3-08db5d59d94e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:54:28.3754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4kqv84ADOWDaIIK/WsvovE/nDKHqimvflejMGSUJ0BlO+iAhPU4SW/aP4ntRKa46O+iYCn7ZXaq6HSycl5Coo6V3Z4jZuZkmszUS2LAmmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8140
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
> Follow the same logic as DG2, so just a meu binary with no version number.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 3338dd45e78b..796f54a62eef 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -102,6 +102,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   	fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
>   
>   #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp, huc_gsc) \
> +	fw_def(METEORLAKE,   0, huc_gsc(mtl)) \
>   	fw_def(DG2,          0, huc_gsc(dg2)) \
>   	fw_def(ALDERLAKE_P,  0, huc_raw(tgl)) \
>   	fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \

