Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6C36F218F
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 02:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5506B10EE0F;
	Sat, 29 Apr 2023 00:17:08 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3357B10EE0E;
 Sat, 29 Apr 2023 00:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682727426; x=1714263426;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ya60uZ4HUmhxod4YyGzbn61AD1b+TsMKwPI+HqgFBtI=;
 b=bQJvJ2Rxml94WHKL54SVCW+FWrR7QOtMZy4y6/UyQHXrLqkPlj+Z8uZP
 hc1th7zktqW2wHdqcjX8U+/mvzx39FMqQMEiSnhVYa0fW9YBzj/M5O9gr
 +VNSS1Ikc44eMLrjWoQGKNA1H6LcdWrJSCMpm6STYC/y7JCJl8DX+JiXs
 fIihY28JBOP/qOiiSN387MYNgUNChcTArYSoexOwaWgz4sk8TI03FF1qN
 tXpogWO9PmrJ1c4Q1RkDF9n0EU3e5PTwWXp4UrLVhVk9feh9Lqsgr+nH4
 LQ0tQO/k35RsfDgfTUYtlZYbhkqwj90kBoR9KcsZMSU1GHmrqCs3++8I+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="328223628"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="328223628"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 17:17:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="759856848"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="759856848"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 28 Apr 2023 17:17:04 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:17:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 17:17:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 17:17:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xkk+6djBO8lr3KthU0EUeoaHpfWif5/1tZHgfarpKRfcJuVA4E4wopV/H+WhgVECi0XqXy5nGBjf6YULcE4+dGzIFhuwLLzuSfyr9VmHWKtDmxnVme7ZVlJC0ZdKg9KQ6wDpP+J3uX85XWMBOxml8UaGBRHhXa3TvjE/q9Ab6ZGS5VVP/DGpqofYH1yQDBCsCxqOaEuunQPQjjzr0KaQ8NQCWI30pezwGmpcBvSIhFBzP76QvklFpbTBnVJUY9Vhy+XMrmsL0BYHRJmMO/bpfBKMnBx6w8gakldo4MK9WgAsrOHZgmgxSLNXhdTA0Uu6SRQslm3EAepysg38+hKDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8Ynk6kAYyU6wbuybwB9FaOYMHwWZAPtkTTzh71tHu8=;
 b=E0NWVMGV8Sja2E59d7D4CjH0fw0cBxHPoJe7X1EWw6KjXTup2oHwIGNbCXAQgpeOql6hxmY1ZiPrqZFKHkVHB02vqb5OGiqPYoCzreBvbwzPFnBGgC893//4vJv51uUq7Zpyh/mI1NwBp21cWuGQb+TmkLUrUKCqP/yIVzJ9ZKsDhL0m82BFuvxti/6AfYtiXDFb8040wMh+dLEbyQbveq4VsCtmyufKC9uXnRxa9D53getuo05lFW8Zs7WDSA33OrY4/4lOvVPck8U5O/y9MRgtVkhFlQ25HnhEK4FPwqudspLlkVR0917Eemj7rVgochrPjCmj77yTFeEJlN2XoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by PH7PR11MB8034.namprd11.prod.outlook.com (2603:10b6:510:247::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Sat, 29 Apr
 2023 00:16:54 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833%2]) with mapi id 15.20.6340.025; Sat, 29 Apr 2023
 00:16:54 +0000
Message-ID: <8540acf3-82bc-629c-1bb2-24ee377e851d@intel.com>
Date: Fri, 28 Apr 2023 17:16:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Subject: Re: [PATCH 4/6] drm/i915/uc: Enhancements to firmware table validation
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
 <20230421011525.3282664-5-John.C.Harrison@Intel.com>
 <7716eaf2-41e8-9b28-3b87-70b5ff2962a3@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <7716eaf2-41e8-9b28-3b87-70b5ff2962a3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|PH7PR11MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 746c032b-7627-45be-6874-08db4847094a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y8GQiE12Ctt5Lb+CYSgvTItfSf1I0dt82DAXcjRf3u0DN0SDWO1Uq6VagFcS3uHvWSqq78QDDBWBeg1I/zQ+O+eUefPvA817u4zN6uRbsR79+SDkXkGlfeQ7qNvFaNKyOAElb6s9rye2VYnMOttMVax/uuwhKX49T1CVMmlGaaN7wxpVBASL5T0LM4BewXgfJ1CYjxEpQHl6U3tO1BBvmEpn62LhxEold0fnK2B3LXraCeFWKSeEKzcpdUNge6bw363OWdMz/82CIKiSZWdoRqP7M1WSQc0iO5626DW8VxN4nnXHtjBBfQSXjdXw8wMIStYFEPOljZisbBQbrtowBVwSfp1cHhoMAewdPFfBSA+Q8MCusx4vOO0U4PAAbqQsUtbEW7AIlcxuPTowhLl4yLnXkPeIjLcshO6CbRKaVm6ONevVXyNqe/QyBpCu0MnsUlP9Ol5USHYlXI98ywqUbgcRE30VgZ86QmzNpyNG6vGv5Q4I2prgoFN5M7/bv6iBUqRTr3l0t298mmLE4h6v8PZ6MNKX6DIaSoFIQ7wHMvvDtkyvK3cIVTXanKlMmhqVarj/ODIgtso2JcU3n+SS5KsbAKnVZe5DnEZHniHzIaJXoqy6/6MotSQFWgolottR8vq16Y8NtRezcMEmSOEAsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(450100002)(4326008)(31686004)(41300700001)(66946007)(316002)(66476007)(66556008)(5660300002)(8936002)(8676002)(2906002)(83380400001)(478600001)(6666004)(6486002)(86362001)(6506007)(82960400001)(186003)(6512007)(53546011)(2616005)(36756003)(38100700002)(26005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHg4SldSaGQ4ZU1JZ0JEYlA0SWkwQlVtM2tvVUJ5aTlLeDMzNnRzZzZ6V3E4?=
 =?utf-8?B?bnJma1YxL1FFSllubjM0QlA1Z3hHcUdVSEJlVjF3bDkrV2ZKbXRWNmZvN1Uz?=
 =?utf-8?B?RTd3dWRXUjk5SVczeURWeHJrZjRoQnQ0U3VRbTVoZm0vTzA3RHRKbVBlR3Zm?=
 =?utf-8?B?UlQ5azlvaFZ2NUJyem5RMTVMTit0bzBUdTNtU2lVd285bERyU3FFOEc0dkNj?=
 =?utf-8?B?bXJhWjlRbFZRSlo4aDQ2dWhDdHN3OUNQcmwyd3RtQ1RUL003SnRMdEZpdEl4?=
 =?utf-8?B?cUlrM2lieExhWlJZZzlxUXkvamRRSmdSaXozNVc3REZieGZVZVFJdEs0TU5W?=
 =?utf-8?B?Y1gzUUx0eU9LMXZCbHhmR0FKZmlXQ3BlS01YYkYxQmdBa05WWk1yNURoNzZm?=
 =?utf-8?B?cWpJaTVGUWhCQUNueGZuVVBoeE1iTUZJWnBhSHlOL0I5Vm9UaU5YZlpjeTFw?=
 =?utf-8?B?cW5DN2dVZEJja0sya05QcWRMTStqV0w5aXZWOUdhTm5QT0cwb2RjU3g3cTdE?=
 =?utf-8?B?SUczUDJCTDg3elUyTG0yZ1RkQlhuUTNrNWRUZ3MzYm5kZExWb0NDNWVST2pm?=
 =?utf-8?B?UHh6dy8rb2VaN1Rwd0czbFUrMWZvNitzY0dyRWVLclc1Y3ZQYWh6SGRwd2Jy?=
 =?utf-8?B?U2MwRW13SXVmbFdhZWVhREIrU0JRODRXeitUZENzWHdBdFNrYWpKWWdxQUcz?=
 =?utf-8?B?STBWMWVZT1dCc0VTS3ZEanV1MTV5WnhZNFlqTzYzbDFMRlZjUWRMTXpXT0pY?=
 =?utf-8?B?VHNmN01MS21OdU1NZE16d20wbHhjaktQTU1TMzdRZWpja1U0aDdob0tkTzE3?=
 =?utf-8?B?Tkc5U3JJdStMTUtLbkNEakZMSkZJS1U1L1hNQXRQb0h3RDl0dkRLdEVIems4?=
 =?utf-8?B?SlA2dHVySVNiUXNBWTVqZmlmdEV5UmdIclQvaCtxQzNZWi9QNmtvejZrTGxP?=
 =?utf-8?B?TkVwNVZaWXlNd2JqSE5wUlRmUGpEZTl5SzJpVlNHVmNZdEFjeXhSc3gyc2lZ?=
 =?utf-8?B?SjJBenpteGpxbW5aaUtVT3FFeDkyZGNndi9lazdPMTA1MUh3bXpCUmY1aVNS?=
 =?utf-8?B?TUFvOWNabTNtQ2pZcVJNbmV5THJiOWV5R2UvUklIS1lxQ0czcDJJbW9RTE1w?=
 =?utf-8?B?dUdkNDRXRGhIdndzUVA4YWNkbTRZVzFKL0dzaFNxR3pxSU4ySHBTUlNQSDlt?=
 =?utf-8?B?Ti9oUmxMUGRvYmZHWW9HODVNczZYbWU5Tkh4QWs1UUUrZk8zTWd6YTUxdWZJ?=
 =?utf-8?B?M29Za2tQNFZmcXNoZ3lWUDAxSExtT3JvNjhHUHV0S1dNQThFUThkWWZWODJK?=
 =?utf-8?B?YzROWnpTdWVCMW1ad243YWhST0RxRmd3eXdyck5rR3JidS9HQ2lGeWVpWkhm?=
 =?utf-8?B?QTVuUy9xYUdSY1JHRXFlT296cCtOaDRaWXF1Tm0zVFRXZjA1V1o5S1JGaFNr?=
 =?utf-8?B?TW16NS9OTzhocEdEQ3dpdG5GU3grd0RJQkMvTy9TNVdLMnRTb2w0YVlRUnVN?=
 =?utf-8?B?MDNEb2t6OWxGRkozblhXN1pVcU43R2VDVForSEh2cGFrRUYzTHdXdFhHVTdS?=
 =?utf-8?B?UTFPZFB5RlgxZWdPU0RSZWw2S2REaGRyWmJDMUNCcEhTSW90czNwK0QvYjRC?=
 =?utf-8?B?cVBCS1hkV1VWL253ZGVMTFdGOVZTY2VMR1hkaVR3cG5OdnAwWGhqdnErQW82?=
 =?utf-8?B?c2FUamY1SFgvN1N4NC9uaStnY2NnOVluc1A4UVRxVngrQVk0UEYwOUM0RlZC?=
 =?utf-8?B?RFJTNVNmSDhUc0lYei94ZGpueG9WUmxDKzQzYk5ZbGdmZW9PVE1MeFhLSW9y?=
 =?utf-8?B?OE1CYjJkY3dXSUtmRmc5SWxITU1hUWxWSFMxemxVRTFETkJjbXZ6MlBIamI2?=
 =?utf-8?B?MzB6K3E4TVE2bm9ENnZLeFpqSUVubXI5QmFOeW5yVHBwWEtVMTRGd3dmY1V5?=
 =?utf-8?B?T0lWNGRZUWlIWHV0WlQ3WXVrenFGakZ2MGVrOXc2WGtUcWJidHhaNjFmbmtn?=
 =?utf-8?B?YXZZTUFhL1RPdEg2eVpOc091Y0JlalRWME5GTlRkVHRCamxYMERxL2p2Z1B2?=
 =?utf-8?B?R0VaN1VKSkVhWFF3YVZDM2hrTUZ4TE1IcWkxVnRSTVFnMmxCa09zeXdweU93?=
 =?utf-8?B?dVY1UFllZHhLQWhSZmU4cGhpUjBOcUhLSHFXdzd4WStxQU84UllvZE5XbDlN?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 746c032b-7627-45be-6874-08db4847094a
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 00:16:54.1062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fLCLQnEyeNtocmkcpbkUQVlffjeV0Zml4CaslXsjWi75MsDzKTLeoFTLNBhpLAiWBXeJ5C7Fvqr14TKeV6cXjDR+jPWzQheauDivFGiplc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8034
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

On 4/28/2023 17:04, Ceraolo Spurio, Daniele wrote:
> On 4/20/2023 6:15 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The validation of the firmware table was being done inside the code
>> for scanning the table for the next available firmware blob. Which is
>> unnecessary. So pull it out into a separate function that is only
>> called once per blob type at init time.
>>
>> Also, drop the CONFIG_SELFTEST requirement and make errors terminal.
>> It was mentioned that potential issues with backports would not be
>> caught by regular pre-merge CI as that only occurs on tip not stable
>> branches. Making the validation unconditional and failing driver load
>> on detecting of a problem ensures that such backports will also be
>> validated correctly.
>>
>> v2: Change to unconditionally fail module load on a validation error
>> (review feedback/discussion with Daniele).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 157 +++++++++++++----------
>>   1 file changed, 92 insertions(+), 65 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index c9cd9bb47577f..eb52e8db9ae0b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -233,20 +233,22 @@ struct fw_blobs_by_type {
>>       u32 count;
>>   };
>>   +static const struct uc_fw_platform_requirement blobs_guc[] = {
>> +    INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, GUC_FW_BLOB_MMP)
>> +};
>> +
>> +static const struct uc_fw_platform_requirement blobs_huc[] = {
>> +    INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>> HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>> +};
>> +
>> +static const struct fw_blobs_by_type 
>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>> +    [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
>> +    [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
>> +};
>> +
>>   static void
>>   __uc_fw_auto_select(struct drm_i915_private *i915, struct 
>> intel_uc_fw *uc_fw)
>>   {
>> -    static const struct uc_fw_platform_requirement blobs_guc[] = {
>> -        INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, 
>> GUC_FW_BLOB_MMP)
>> -    };
>> -    static const struct uc_fw_platform_requirement blobs_huc[] = {
>> -        INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>> HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>> -    };
>> -    static const struct fw_blobs_by_type 
>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>> -        [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
>> -        [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
>> -    };
>> -    static bool verified[INTEL_UC_FW_NUM_TYPES];
>>       const struct uc_fw_platform_requirement *fw_blobs;
>>       enum intel_platform p = INTEL_INFO(i915)->platform;
>>       u32 fw_count;
>> @@ -286,6 +288,11 @@ __uc_fw_auto_select(struct drm_i915_private 
>> *i915, struct intel_uc_fw *uc_fw)
>>               continue;
>>             if (uc_fw->file_selected.path) {
>> +            /*
>> +             * Continuing an earlier search after a found blob 
>> failed to load.
>> +             * Once the previously chosen path has been found, clear 
>> it out
>> +             * and let the search continue from there.
>> +             */
>>               if (uc_fw->file_selected.path == blob->path)
>>                   uc_fw->file_selected.path = NULL;
>>   @@ -306,76 +313,91 @@ __uc_fw_auto_select(struct drm_i915_private 
>> *i915, struct intel_uc_fw *uc_fw)
>>           /* Failed to find a match for the last attempt?! */
>>           uc_fw->file_selected.path = NULL;
>>       }
>> +}
>>   -    /* make sure the list is ordered as expected */
>> -    if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && 
>> !verified[uc_fw->type]) {
>> -        verified[uc_fw->type] = true;
>> +static bool validate_fw_table_type(struct drm_i915_private *i915, 
>> enum intel_uc_fw_type type)
>> +{
>> +    const struct uc_fw_platform_requirement *fw_blobs;
>> +    u32 fw_count;
>> +    int i;
>>   -        for (i = 1; i < fw_count; i++) {
>> -            /* Next platform is good: */
>> -            if (fw_blobs[i].p < fw_blobs[i - 1].p)
>> -                continue;
>> +    if (type >= ARRAY_SIZE(blobs_all)) {
>> +        drm_err(&i915->drm, "No blob array for %s\n", 
>> intel_uc_fw_type_repr(type));
>> +        return false;
>> +    }
>>   -            /* Next platform revision is good: */
>> -            if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>> -                fw_blobs[i].rev < fw_blobs[i - 1].rev)
>> -                continue;
>> +    fw_blobs = blobs_all[type].blobs;
>> +    fw_count = blobs_all[type].count;
>>   -            /* Platform/revision must be in order: */
>> -            if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>> -                fw_blobs[i].rev != fw_blobs[i - 1].rev)
>> -                goto bad;
>> +    if (!fw_count)
>> +        return true;
>>   -            /* Next major version is good: */
>> -            if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>> -                continue;
>> +    /* make sure the list is ordered as expected */
>> +    for (i = 1; i < fw_count; i++) {
>> +        /* Next platform is good: */
>> +        if (fw_blobs[i].p < fw_blobs[i - 1].p)
>> +            continue;
>>   -            /* New must be before legacy: */
>> -            if (!fw_blobs[i].blob.legacy && fw_blobs[i - 
>> 1].blob.legacy)
>> -                goto bad;
>> +        /* Next platform revision is good: */
>> +        if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>> +            fw_blobs[i].rev < fw_blobs[i - 1].rev)
>> +            continue;
>>   -            /* New to legacy also means 0.0 to X.Y (HuC), or X.0 
>> to X.Y (GuC) */
>> -            if (fw_blobs[i].blob.legacy && !fw_blobs[i - 
>> 1].blob.legacy) {
>> -                if (!fw_blobs[i - 1].blob.major)
>> -                    continue;
>> +        /* Platform/revision must be in order: */
>> +        if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>> +            fw_blobs[i].rev != fw_blobs[i - 1].rev)
>> +            goto bad;
>>   -                if (fw_blobs[i].blob.major == fw_blobs[i - 
>> 1].blob.major)
>> -                    continue;
>> -            }
>> +        /* Next major version is good: */
>> +        if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>> +            continue;
>>   -            /* Major versions must be in order: */
>> -            if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
>> -                goto bad;
>> +        /* New must be before legacy: */
>> +        if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
>> +            goto bad;
>>   -            /* Next minor version is good: */
>> -            if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>> +        /* New to legacy also means 0.0 to X.Y (HuC), or X.0 to X.Y 
>> (GuC) */
>> +        if (fw_blobs[i].blob.legacy && !fw_blobs[i - 1].blob.legacy) {
>> +            if (!fw_blobs[i - 1].blob.major)
>>                   continue;
>>   -            /* Minor versions must be in order: */
>> -            if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>> -                goto bad;
>> -
>> -            /* Patch versions must be in order: */
>> -            if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>> +            if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
>>                   continue;
>> +        }
>> +
>> +        /* Major versions must be in order: */
>> +        if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
>> +            goto bad;
>> +
>> +        /* Next minor version is good: */
>> +        if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>> +            continue;
>> +
>> +        /* Minor versions must be in order: */
>> +        if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>> +            goto bad;
>> +
>> +        /* Patch versions must be in order: */
>> +        if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>> +            continue;
>>     bad:
>> -            drm_err(&i915->drm, "Invalid %s blob order: %s r%u 
>> %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>> -                intel_uc_fw_type_repr(uc_fw->type),
>> -                intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 
>> 1].rev,
>> -                fw_blobs[i - 1].blob.legacy ? "L" : "v",
>> -                fw_blobs[i - 1].blob.major,
>> -                fw_blobs[i - 1].blob.minor,
>> -                fw_blobs[i - 1].blob.patch,
>> -                intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>> -                fw_blobs[i].blob.legacy ? "L" : "v",
>> -                fw_blobs[i].blob.major,
>> -                fw_blobs[i].blob.minor,
>> -                fw_blobs[i].blob.patch);
>> -
>> -            uc_fw->file_selected.path = NULL;
>> -        }
>> +        drm_err(&i915->drm, "Invalid %s blob order: %s r%u 
>> %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>> +            intel_uc_fw_type_repr(type),
>> +            intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 
>> 1].rev,
>> +            fw_blobs[i - 1].blob.legacy ? "L" : "v",
>> +            fw_blobs[i - 1].blob.major,
>> +            fw_blobs[i - 1].blob.minor,
>> +            fw_blobs[i - 1].blob.patch,
>> +            intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>> +            fw_blobs[i].blob.legacy ? "L" : "v",
>> +            fw_blobs[i].blob.major,
>> +            fw_blobs[i].blob.minor,
>> +            fw_blobs[i].blob.patch);
>> +        return false;
>>       }
>> +
>> +    return true;
>>   }
>>     static const char *__override_guc_firmware_path(struct 
>> drm_i915_private *i915)
>> @@ -443,6 +465,11 @@ void intel_uc_fw_init_early(struct intel_uc_fw 
>> *uc_fw,
>>       uc_fw->type = type;
>>         if (HAS_GT_UC(i915)) {
>> +        if (!validate_fw_table_type(i915, type)) {
>> +            intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_ERROR);
>
> In our hierarchy of firmware statuses, INTEL_UC_FIRMWARE_ERROR 
> includes the fact that the fw has been selected, which in turns 
> implies that file_selected.path is valid. this means that even with 
> enable_guc=0 the wants/uses_guc macro might end up returning true, 
> which is not something we want.
>
> Daniele
Suggestions for a better plan? Add an another status enum? Nothing 
earlier in the sequence seems appropriate. And the init_early stack does 
not support returning error codes.

John.


>
>> +            return;
>> +        }
>> +
>>           __uc_fw_auto_select(i915, uc_fw);
>>           __uc_fw_user_override(i915, uc_fw);
>>       }
>

