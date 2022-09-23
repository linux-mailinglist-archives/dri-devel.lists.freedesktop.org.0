Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379465E7EA7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 17:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0B710E583;
	Fri, 23 Sep 2022 15:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5668310E583;
 Fri, 23 Sep 2022 15:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663947674; x=1695483674;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O/3jBoAO5ZNcMlNjBWh8pV1q2JbBhZayHmH4VjFPqVY=;
 b=Pb2l0VYqax4CvBsNnBemZvxMyyz9AuUMdPCXI2VyU4+A3UF+cyJ4UnqY
 4YHodynTTVa01omho8EwNdX4zKlZaa78k2ij/ZPNy9YdNPx7E1/z7fK+S
 qIG9tpuOMv7FXI+zxufrwOJVeTV2og2xg5o3Z6c23ZTiiUmnmsH97m0oU
 DebSkVgxNFUxQtwf5Wg1tm3XDRFuSZAHREgUmfQq13po84pWgE07aOAkE
 jBwLJcnpVpu8HBaPHpqXEb6FZeTuGDiML+hoFaHQgYc0y64tNe9mDTt8E
 zmZkBrNp6de0CQTFoJKCopIWRnKjPiedag3hqcgAq5SoUvePJvg+SqFxX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="302066514"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="302066514"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 08:41:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="949056170"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 23 Sep 2022 08:41:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 08:41:12 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 08:41:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 23 Sep 2022 08:41:12 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 23 Sep 2022 08:41:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxB5IwGatgq3cy/T65Dq2HG20IsW9AHHHaQT5DJ0VXwS3Vf/ppfAlZZm/OPWFCtxp61hZE7528zNPQbhUtZFTYiwQ6BAwby8dIVauOxEP2UVMc7nIcXfsAs4hLcfo8X6a6lwHJ6jd/qGymCkuXMg0gIRHt8ZwxD+rJjD6G/xkvSfaidXUL291gd00EfWSuawPUymowCnjn1m2r6upDe8PKfum5ifIR9gFFDD1ReXFnPK8RgPW1rw+Tv1NhhqY66SgWTpa/+h9aG6qmqVKdGTDMp0DeqdMOk1jKCOWujAq2Lt0zkEEPUiScahqT8nN+PoCd6yzGg6J7129rQxWQ9gVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLNiBTgGEVDtTWnb9aIHKovzwztUsSRGKRBeH5acfHk=;
 b=huL85CdRlQikF7e2tsUDqB9ZyvhyR7B97lMWSAKwgiJQdmxSZTVYv2/J1zDLHRoX3RdYxC+qx3xcMxJIUJMx9v9XkBarwFfG65PsEEADKYnbKqunIZIANvBb60C+4iwvNbTUYlyrj2w3qXOBFrcQ8cGSyPVE51nd/XAaPTxedGlwaf8qP9XYruLP8RkD+mW5ZmP7e9C42EOE/OgYQapxyKs8F7adsjnd96uUHXZjBlvuRK+7KQYb5Lqh99imRU9zxfZYsnYapBc7JzF3nZCMJscuOQCgpTVwvZjQ1PpGHu4rDmH+ORgWEQw81U9TD7BRKfqVkxuG8/9x17eW5YQfvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA1PR11MB6685.namprd11.prod.outlook.com (2603:10b6:806:258::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 15:41:10 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::280f:75b5:17ad:1668]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::280f:75b5:17ad:1668%3]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 15:41:10 +0000
Message-ID: <f0a77865-265c-6d65-df34-d2d76960d64e@intel.com>
Date: Fri, 23 Sep 2022 08:41:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/huc: only load HuC on GTs that
 have VCS engines
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-2-daniele.ceraolospurio@intel.com>
 <b6d78e11-f0f7-de86-e5c3-e2a12fe55203@linux.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <b6d78e11-f0f7-de86-e5c3-e2a12fe55203@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA1PR11MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 86271dad-e313-4f0a-2f16-08da9d7a09e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MpzaHUdfwGf5UxrQhkAbBKXS0786baRY7V5Ru+3P8UuqtE191FfxZhVeUNFcIh4a14qjFsfW3ChVGPTUgwVu16D9Vot1StdiZoauU4/86vgC/y7bHBw+XdJJDvslgO77eqJPpQXSfXVQM6E8qg3w4aRvFHf0vNdGP/1DoLgayftL9Wt2AKMLgt7/oEEYEvYEd96O9pqu/C4b9w4lVoSdPprZQwFhXn9p0N1pPi7J3hzKnvZNrCRdA1GPV3KnVlwo1Us1355W0cLnSLL2l71o6fPYLbmls4ZPkGB9SPGOvbG/CGNi67+HrufkmIfrzWA2AqdDbBGowKE5dxhNabcOrdnOEMIGHBhlww0vST3eFYuvfZTPdi5h+4kuiQb+RF1d3Twe1Hu6Gu9pigiTZenAVYXrRgSrt0A8tRDNKH5KEImFCyl1uRZDTcKTW4+UrqJHLpr4etsOfbTJZR92MljHDyTQHM3xLa5K3e3gquLNVY2YIDfpyqpxPGYTEfsSB+JUnViVjCx3EgYP41UUsJGknuEPGeRV+GsksYCVJhgFeLZ3d4Hsygxk4uaH63dv0xGN/AFuV1GXVPXsKk3cl+FZNz91DNGbUhRFJGIoagefQKRfDcdAqJ4u410mPYZrQuV+9vtPgQqRoLUV70oim2kJ77qtAErKnzor3u/rDtw04mklbOqi6CAQr4pvJNn7MC1oA/GJoWBXwQcCAJaBqTpj9pIqz8s+U8CFq1AOrntF3mRdH4jccyD0SpSHg2Po3zieBVqyypuLm9630OGkV33LGYyq1TdeoUhSWTFpINk1kEE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199015)(38100700002)(66946007)(8936002)(41300700001)(82960400001)(8676002)(4326008)(66556008)(66476007)(5660300002)(478600001)(53546011)(26005)(6512007)(6506007)(86362001)(316002)(31696002)(6486002)(2616005)(186003)(31686004)(83380400001)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDQyTklRS3pwZER4b1VDZjFZNXBWOER1SC9RaE9OcDhBWDRiNmMyWkxTMmkz?=
 =?utf-8?B?NTdPL0FvbDNzd21zOVNIUjA2SnZWdTg0T3NKYjM4S0sxa1FFUEk5TkRVT1RN?=
 =?utf-8?B?YnZVK0xQNFlZNncySHVrd2M1UXlydjRDa0orQXptdnFLWW90NmpqUndBaXJ5?=
 =?utf-8?B?OFpBYXR1TTByZGN3bVJmOHlzYmQ5NHdROE9kQSt5eFM3V1Vmc2FiQi92c3J1?=
 =?utf-8?B?Y28yQ0dpb05tRCtaUnpna25TSFltSmI5QlFQTkEvYXd5bVVFK25qWXJtMjU0?=
 =?utf-8?B?dlcwL1FBSldySmVFT1pKU1RaYmZ5NTU1ODU5RVUrdEM2WjV2RTZ3ZkJ6c1Ja?=
 =?utf-8?B?anlmWEJZdXRLQ1paRkN1M25kWVpRbzZLUzdDZS9MRWI5YnNJa3pyT1ZJSE9Z?=
 =?utf-8?B?a01LbVlvZHhmRFFMS3l4RU1NZW5IRDZ3NkljNDFyRXRWNGFNZEtBeG5mcDFU?=
 =?utf-8?B?Mm9YUFFYeVNXOG1UZjBkeFQzTC9JbXhRSi9icFZFL0RQamJla3JSMVlteE1C?=
 =?utf-8?B?aS9ld2VNbGRRRXpaakJKcjc1U2FDS0RKQWJBNTJQclNEZDBpVmxPcUxOeU5F?=
 =?utf-8?B?T0pPZnF2OVc2STEyaXROYVlkQzFtNG9zT1VHWjM1aE9VcC9XWmx3QURRdDYw?=
 =?utf-8?B?ako2MFVEOWlzU1IxQWdpTFByM01lNm9scTkwQlh2U05SM09Mc2dFUDg4YS92?=
 =?utf-8?B?VVlwVU1YbnpxbU10WU93Q3FrNEUvOG1BMHZ6NXp4YkNacEM2TnlaNzRtbEFi?=
 =?utf-8?B?MDhwUG1ZQTNqRDVrSVJuTy9nb003OU5tVzB4T0NrNFRvdFoyT3RKOFAwUzli?=
 =?utf-8?B?MW1VTHU2UzQzZDEwVnVDcXRqenFGMGg1cU13a1Vmelo3TC9tdFpONUZ1U1N2?=
 =?utf-8?B?TE5CQ2NGZFVuTlBIUTl1b3dXcnJxbmh2UVpTWkVzbTh0bkp5RTdhVmN2ODA5?=
 =?utf-8?B?NG1CbkFsakppT1BwemVtYzU1WmtMbnEvdDY3MUEycUJ0Nm5lWXFyWTBEa1Fq?=
 =?utf-8?B?VXBnTXIwZWV1UGJMaE1jRFcwMGRKdUFpa3EwZ0JTZFVUdzI4WHhRMmpJME5l?=
 =?utf-8?B?a2FjRG9SZnhpT09kanptWFNXRVRxZzR4K0JKN2N6dEVHbjNpelVrNFV5ZEV0?=
 =?utf-8?B?K005Qno2OXVNa1RKVGZIR1owTU0yeHU4djhPaXVGQjI3UVVmc2l3NHlyYStB?=
 =?utf-8?B?L3BUVjd4MlZlWmJGNFg0NEJsQjZzN0tKcE5OLytKYkppelg0c2NBbkcwREtE?=
 =?utf-8?B?bXZNL2NqR2ZlM0x3RmhGRHNLWk9Wa3FmL3laVU9KRUltSEx1K2pVQ2IzaVlw?=
 =?utf-8?B?c0ZubWY3cWRlTFZOR3RPeUNYbVFQWUhmVFk3dXBDaDFDT1hOOVkwQjB6SG9u?=
 =?utf-8?B?RlcxQVpqcGJHd0wzYnZJM0prbUkvUjlqRkNSZEZvWG1wNUM0SVJTZHBuRjl4?=
 =?utf-8?B?Q3JySnhoM2FqTzZFb3B2MGlkUm9LUHdST0tORTJGVmk1czUzY05KejAyczVT?=
 =?utf-8?B?dkpJZXhObE5mL3JBVmcyRGtKK0dHWXREVFU5bVRTZy9PRE11UEZEQUwrVUtS?=
 =?utf-8?B?TEROb3NQdVkvL0Q1THdaSXdvd2FVYXF3ZG01eCtrVGdSdUE4c3RTcVErYmk1?=
 =?utf-8?B?TitzUEEzNmFxNWxiVGx5MVhhQ291U2ZMOG4vNjhaQkhmenFzamV6WENEajBY?=
 =?utf-8?B?YlF1YnNPMG1LM1dQNTJJRW9VdTQzblFWN2cvSHFCUysycTJCQzlnRjQvazR5?=
 =?utf-8?B?cHdHbTg2clkxclpNUjRuK1N1bEdYT0pMTmUxVjdjdDhFZy9BUHlab3MyaGFi?=
 =?utf-8?B?cXAyWSsxNE01K2d2bVZ3TW9pdGZlYW9Sb3NXV3VjajZXbVFxWFp6YUtpZUl3?=
 =?utf-8?B?cllVanZ4aTVqL3VWbzMrMWQwWDV1NGh1QXJwbTVrUnRFWGdOOE1jUTRJaXNR?=
 =?utf-8?B?RTFyN2xoOVF2cGFPREdza3gzSEhxcHRYNlNtYzhmbFJJeVoxZHpRV2RsRWFT?=
 =?utf-8?B?M2pNKzJ0Z01CS3UrcllZWWFUWE1xZnFkVVhGcEMxSkxJTDcxY2g4M0ZNcnhu?=
 =?utf-8?B?VEwzQ1g4a2RWQXNrSEZ4cWY0ODdvRUd3MWtlRFQ1TWY1b0JUNjFkRDJNOXpm?=
 =?utf-8?B?RytYWXlIK0l1Ynl3bS9UamxHR0Rpb1JpVFZLd2JOMUJsUllJZ3FMUFJJV1F4?=
 =?utf-8?Q?Z16obEHOykTbple8quqjY2Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86271dad-e313-4f0a-2f16-08da9d7a09e3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 15:41:10.6144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jcFH0YlcTG4EyYNzUqteK+XLQPOYz9AHdxMcidV9MIMeIbRz7eFaNEMzxIFhh0xEalo2mmmCH4lXUaI/vvDajhTsD0wa5t5IkKy3rppdVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6685
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



On 9/23/2022 3:53 AM, Tvrtko Ursulin wrote:
>
> On 22/09/2022 23:11, Daniele Ceraolo Spurio wrote:
>> On MTL the primary GT doesn't have any media capabilities, so no video
>> engines and no HuC. We must therefore skip the HuC fetch and load on
>> that specific case. Given that other multi-GT platforms might have HuC
>> on the primary GT, we can't just check for that and it is easier to
>> instead check for the lack of VCS engines.
>>
>> Based on code from Aravind Iddamsetty
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 21 +++++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_drv.h        |  9 ++++++---
>>   2 files changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index 3bb8838e325a..d4e2b252f16c 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -42,12 +42,33 @@
>>    * HuC-specific commands.
>>    */
>>   +static bool vcs_supported(struct intel_gt *gt)
>> +{
>> +    intel_engine_mask_t mask = gt->info.engine_mask;
>> +
>> +    /*
>> +     * we can reach here from i915_driver_early_probe for primary
>> +     * GT with it being not fully setup hence fall back to the 
>> device info's
>> +     * engine mask
>> +     */
>> +    if (!mask && gt_is_root(gt))
>> +        mask = RUNTIME_INFO(gt->i915)->platform_engine_mask;
>
> Is it possible for all instances to be fused off? Wondering if the 
> function shouldn't just use platform_engine_mask.

The spec says that there is always going to be at least 1 VCS (bspec 
55417 in case you want to double-check). I don't see that changing in 
the future, because what's the point of having a media GT if you don't 
have any enabled VCS engines on it?
Also, platform_engine_mask only contains the entries of the primary GT, 
for the other GTs we'd have to navigate the array in the device info 
structure and I don't think we want to do that from here when we've 
already copied the mask inside gt->info.engine_mask.

Daniele

>
> Regards,
>
> Tvrtko
>
>> +
>> +    return __ENGINE_INSTANCES_MASK(mask, VCS0, I915_MAX_VCS);
>> +}
>> +
>>   void intel_huc_init_early(struct intel_huc *huc)
>>   {
>>       struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
>> +    struct intel_gt *gt = huc_to_gt(huc);
>>         intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
>>   +    if (!vcs_supported(gt)) {
>> +        intel_uc_fw_change_status(&huc->fw, 
>> INTEL_UC_FIRMWARE_NOT_SUPPORTED);
>> +        return;
>> +    }
>> +
>>       if (GRAPHICS_VER(i915) >= 11) {
>>           huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
>>           huc->status.mask = HUC_LOAD_SUCCESSFUL;
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>> b/drivers/gpu/drm/i915/i915_drv.h
>> index 134fc1621821..8ca575202e5d 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -777,12 +777,15 @@ IS_SUBPLATFORM(const struct drm_i915_private 
>> *i915,
>>   #define __HAS_ENGINE(engine_mask, id) ((engine_mask) & BIT(id))
>>   #define HAS_ENGINE(gt, id) __HAS_ENGINE((gt)->info.engine_mask, id)
>>   -#define ENGINE_INSTANCES_MASK(gt, first, count) ({        \
>> +#define __ENGINE_INSTANCES_MASK(mask, first, count) ({            \
>>       unsigned int first__ = (first);                    \
>>       unsigned int count__ = (count);                    \
>> -    ((gt)->info.engine_mask &                        \
>> -     GENMASK(first__ + count__ - 1, first__)) >> first__;        \
>> +    ((mask) & GENMASK(first__ + count__ - 1, first__)) >> first__;    \
>>   })
>> +
>> +#define ENGINE_INSTANCES_MASK(gt, first, count) \
>> +    __ENGINE_INSTANCES_MASK((gt)->info.engine_mask, first, count)
>> +
>>   #define RCS_MASK(gt) \
>>       ENGINE_INSTANCES_MASK(gt, RCS0, I915_MAX_RCS)
>>   #define BCS_MASK(gt) \

