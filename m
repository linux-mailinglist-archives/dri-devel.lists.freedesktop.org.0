Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1188770A3F6
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 02:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92DC10E547;
	Sat, 20 May 2023 00:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCD010E547;
 Sat, 20 May 2023 00:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684541153; x=1716077153;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pw/2ZsBlN2Q1HMX90D5WWN1/SXBXXZ4P/uRhfKZJ+uk=;
 b=BRQdI67vb5dCl8rXACyuedeqPWeqI3a8LSK59dPg+QIanc3nkQHqr2kl
 HK0ot0tvBzS8sbagN9FbahZgOa4660cehm+ya+lJBuc5Qwk9Tilti1EHH
 4dqAJuIYF9seLj7xyKpKhJ6Z5vFSA+mlCsUgcVIVBsaI3qiblCTncd5hM
 /+/1dwFSLIo83/xR83KsjdZ44JbAfEkCycCkQ27xkMkdZFJatOhncPbrq
 ho5hZ2/nLq8UYje4CD5EDm2LJIEcATA7wl16Qv3GFaeCFc1ZZ3KRL8P4V
 L+LlVathlwtGyDcSSEzn50PjEH9L4RE6PHV5lQhJGhuXlb6RnRvpRn3YE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="438869296"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="438869296"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 17:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="949296117"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="949296117"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 19 May 2023 17:05:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 17:05:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 17:05:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 17:05:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 17:05:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvMz/NiYDyySX1eIDlz6srvuGmHR+OqkKiyzrmi3aFy1ZGvx/Fq1HhGNqbbwsMkVX+yyJ0RYLqKfob0YnDzonRGjsd8J6rjfPpzq0N6COXW49d7z6/IanQgIb4nLMFiDyx2tFoUSS4OaVbzYrRk9j/wWLIGOjnzRpsJDDtiAYVRSgpsanxhJOhkOnApOayrQcZC5Urd2i5/vBE4jBY+9lBLg0GutIfSYt4MIueVODfBpYHT3N7xTFABzWNgKNtQUzmZG9f+lvRC8V7pmcejFPsWmmL0UmqoXUHCSmPvg9iZQnm8wE3bnrjJ3p6tUDaZZnExfNIRn2lm8DbrSIyn0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QxXLYnKmkiYlbJ8L/Ix3D/rr0NbFa0l5Nq3OtsJrFY=;
 b=oVk8M38kTUcLp5huna6zG0ubjX9RUw0XF/nVlP3V635ExJ+8zuTxMJTkd695q+rHtR3ZJc92zXyGoZGJK9Vb8hNGNGDYRzuzDNt6AnWanP5SWNJUOSqYrNT60yTy+wKiEA/WBDIvH7E5D8+5Gtmk7A4clhh+Tbxeuw7OmIgwzLuITIOo1GyYbHW5FKajmHyNw7IO8nF4yFK0mEZv8A0vppP4z1+jFOvoxS1/ehxkKvQIEyL3DkC/Whgj2d+WujXdhrnRjAtdht528kZVcjSQSfmZEXNZlr2/ObUQxX9z0bzWl/d4hZeflVQLu8DLpP+CnGNzmic/fpIRCr3YshFgLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by DM4PR11MB5295.namprd11.prod.outlook.com (2603:10b6:5:392::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Sat, 20 May
 2023 00:05:50 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::3e21:b089:38bd:7ab2]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::3e21:b089:38bd:7ab2%5]) with mapi id 15.20.6411.021; Sat, 20 May 2023
 00:05:49 +0000
Message-ID: <fffdd9c8-a576-ce9e-55e6-3ce7a7fe80c8@intel.com>
Date: Fri, 19 May 2023 17:05:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [Intel-gfx] [PATCH v2 4/8] drm/i915/huc: Load GSC-enabled HuC via
 DMA xfer if the fuse says so
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
 <20230428185810.4127234-5-daniele.ceraolospurio@intel.com>
 <702e2a4f-0541-d528-421a-8ad783ee2c87@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <702e2a4f-0541-d528-421a-8ad783ee2c87@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:a03:331::19) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|DM4PR11MB5295:EE_
X-MS-Office365-Filtering-Correlation-Id: afe8aa3e-331f-4cf6-7c5c-08db58c5f7ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x0Ev6JwjKomXr+8Jwx9XF0s5kdfgBQO3UDKRFBF/wbsFE0473HwiPqiuKgyNZqWQyujiyZ5AFcboT5uOD7ujDDSzu3v3tEvPm2ui9dPYguYlWUNJK8gQNsS7ZlHThE2rD07DVcS3jJqA/xaNAQakQbt4eAJkm7EoAOJBOTd0GGQ8fY7sDFic94yIPUccoiQ2QPQ1OdhUS1gurDXWVmPU6O9/MqCmoyEBMvhxKKAazuqqhsvyobpJGyH2RjOEl9Et+IcnkW6jlu4annNujAHJt9G9GVsDN5em01uxe7SbBDCpxym6QNx4htkWao9TqNbGhEYChE78ItPwhFeFYnUq7gKZ8o6Lbu7WOodlHDe7zhbwVl5bLLlOmYQzhmabNrK3X0VrfunAk6MZYvOS9m5es7lDOdA9Ir6cE8nLZKUDZYCJqSmGPQcxJ/mAkxnBlALN650zKmly3yx3yvF/CjTfLt8NF3GBMGFEQoRPRMjvFQ9kqILHrFEEZPDgJm58BC4xdyxynZaKu7gPxa6xZx/Jm865BlvaF31MwHmDv6JYOcHwEjPFJHOTqdZdM/w6v89wwixAILVK3OZMuKT86sdYmip9TwmnB0C06cOY0QWoaE+A+0IugdHXnq+n6XGUq7olM4Qg79OSNl55Wkwg9wq/ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(39860400002)(366004)(376002)(396003)(451199021)(450100002)(53546011)(83380400001)(6512007)(6666004)(478600001)(6486002)(2616005)(2906002)(26005)(6506007)(186003)(5660300002)(82960400001)(4326008)(8936002)(8676002)(38100700002)(36756003)(316002)(66476007)(66556008)(86362001)(66946007)(31696002)(41300700001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjFLRUhoYmFnN2NIV0ZjbWUrUGtlNDJUSFFGS3pIRXI0VjQrNHJPOTA5TW5K?=
 =?utf-8?B?NWV0c3BLVTFSUkgwV3VUV2Q5Z3FiTGFBQmdxTHUxNlZrRzhET2FRRlVQTEhL?=
 =?utf-8?B?SVl3cHdaSklIelYrRUJGMzdwUjNsaHNXQzVkUk93M1VNV2M5eDBQeUJHeXFt?=
 =?utf-8?B?YkJ3NGJrQnZWN3lzbG4xZDZlYmFqdERvWlI2bkhHWVFwcDhheVA5NFNSbkli?=
 =?utf-8?B?M1RyZ3htK1hPQUZ3SjVnUnF2dFZ2SWsraHBiS1V1L2ZEQ3VsT0VRNkNBMmNq?=
 =?utf-8?B?MVZSRGkxbUVwTGJ0VmJ0bVFpZjNUOGcxdlpjbVM1aFNWaWp5aDNsRW83ejhL?=
 =?utf-8?B?UDRoVlZ3blBLTjZ4STZqVmp2WXNTa2pLa2lGRFlBME5NYVRWeEUwUDhVNnpz?=
 =?utf-8?B?cWhldWpmYnRVR0FsVG5DSVJuSEl5VUNia2ZjWHhydzVhYi9BWmxVOFIvWVUv?=
 =?utf-8?B?dWV0MzVjdnNFTjR2TWk5VXgraU1uaWV2WXRGUzJuVVd6S0JTTHphM0lHd2x3?=
 =?utf-8?B?VUltNjZlUHBUcHJvQ0Vkdk14SVE1OXZ6ZDZ3RVIzS3QrcmJYYkdXdGFEVmNX?=
 =?utf-8?B?bjVYcmt0QThUKzFSbjE5VUcvZnBuTUhPZnhuejE5SHd0cG92SnliSVVRQXU3?=
 =?utf-8?B?WVcwZlR3dFpIUmE5c1BDU3VEbEt6WDZGMnFvWGlPUHpsZC8zSjg5ZjN4elhK?=
 =?utf-8?B?elZkU3NrU3VKZTRLMm5DaVd0VkVQaVcxaEdadDl0VjYyQ3VPTUcrbURJK0Vp?=
 =?utf-8?B?QUhmTExwd1ZUQUFRQzQrODFzZ2IwUlA2QW1SbXNNU0s0VEs5czZQZnd6cm4r?=
 =?utf-8?B?aVlpRlpzRnBnY3B0cVJQTFU2TlhGWk5CTEN4bDc2UGlGWjd3bHRsaFU3d2Ru?=
 =?utf-8?B?Rk01MVY1N1dheXMxUlNZejlpM3YvVTVXNnB6Mk5wT1F5dDl3QWFIdGMvb2JQ?=
 =?utf-8?B?TmtMcmgvQjBqNTd5Z0xmV0lRNmNzVmNHTmcwT3hmekl6NjVCc3pwK1ZKcDJH?=
 =?utf-8?B?T2lldGNTOU42NG5NQUNkSkptN0xKZmtUQldWZThVeHMzRWRob3p2Q0lLbkNQ?=
 =?utf-8?B?emxQNmtiNU1KYklMY2k1dzFGMDlLTEtJYVNkYWJtVmNXaHVCZGFxekZQRlZ6?=
 =?utf-8?B?UHVINGhHUGNWWnRJTDd3c1BSb3Evc1JBWk85b2h6ajYrNEdVck9yMm4wbzVj?=
 =?utf-8?B?alVmYVdVdXJiWGhCTXMxUG9pRWl2dk1kMWVxS21mMG55QldrOTNrYVgrU1Fu?=
 =?utf-8?B?VUhBNm5GbVdKOHJUaUZ5eXJWM3FhbGxQaWk4TTBVWkZDMklxS284T2tFYmVz?=
 =?utf-8?B?Qy9wN3BLRmFIVDJPR2dHd0MzMGNhY2Q2Y053T2pHQisydFZLbURqbXNrOWxM?=
 =?utf-8?B?b25yWFNpbXlLTjI3YVF0b2x1UHhOQzhQa0RKMmloOU8wbkcveWpoUzZoNXpR?=
 =?utf-8?B?dGxjWVM2QlRTcHVyNkxNU1lBUS9POWlUQmh4L2VuVUZLeEt2d3IzWHpYWHFk?=
 =?utf-8?B?VUlLVnVnNUFWdWdZMFU5RFcvTG1GekxZUE5IVEdwWVJlYk1BZTZ3Y0NiYWti?=
 =?utf-8?B?MWFtYktCaVJseTdkS2JqUHNUKzMwOC8vTXgyTkxpZEhiWHlTSlM3V2JoNklq?=
 =?utf-8?B?ZjR6TXpOWkE1cDJJaWRIT1Vsa1dzTFBrZWtmL2NPWkVlcXFuVEYrRVRmN0Qv?=
 =?utf-8?B?R05IcjJnVm9kazcwRDhLV3ZVa0IybzZtckhXaE4wUHZGRCtpMjgrbStWZFFB?=
 =?utf-8?B?b3pFUkZVNVE5UWEvY0F5SXhtWW8xVG5GcXFjaHRhQlpYeGFXdXRycFdiWVFP?=
 =?utf-8?B?a0ZKVFF4VEJyZnBBTUxNKzNYVElsQTNLUVJKQ3BZdDd2bVc1UWpDVTNHV0d6?=
 =?utf-8?B?aCtpVk9PWmtBYVdZa1ROOHVTNStDZHpPNUVyQyswNVZiTHhCSUVFYkpNWTNO?=
 =?utf-8?B?RjFwZ0dkK0QzMkpVMVlQU1dJZXpSSkxLVkp4R3JoZ0FSRjhIMCtiR2F1MWFP?=
 =?utf-8?B?aENFZFYrbElrc0xZcDhyMGx1RDNEbkpTdnBLbm9ZQk93WVBpSzNJM3FtZmMr?=
 =?utf-8?B?ay9KRGdsanVpbEs5bTlCeTNUVmtOamhjRFJVcDdxbDB4WXArdVFEalZuWHRq?=
 =?utf-8?B?WitNUnB6cXVTeEViNmNZR0dQelFtZWNIdnRPYWVnTEx2ZkFNZVoxd21seGE2?=
 =?utf-8?Q?msn0ic4DaVzApuWGV2eR7HE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afe8aa3e-331f-4cf6-7c5c-08db58c5f7ad
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2023 00:05:49.2329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ymjmr6UGzuMJ5tOeOqrJz+E1Guehzv8BVDbcCGlp4tNIMCjIQvnZpYzXA/Hjyes4cJq2q0s+bvclZ8venht6EHYGD4o+cNaAKvAqTK0xdu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5295
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



On 5/19/2023 11:03 AM, John Harrison wrote:
> On 4/28/2023 11:58, Daniele Ceraolo Spurio wrote:
>> In the previous patch we extracted the offset of the legacy-style HuC
>> binary located within the GSC-enabled blob, so now we can use that to
>> load the HuC via DMA if the fuse is set that way.
>> Note that we now need to differentiate between "GSC-enabled binary" and
>> "loaded by GSC", so the former case has been renamed to "MEU binary" for
>> clarity, while the latter is now based on the fuse instead of the binary
>> format. This way, all the legacy load paths are automatically taken
>> (including the auth by GuC) without having to implement further code
>> changes.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 27 ++++++++++++++---------
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.h    |  4 +++-
>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  2 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 14 ++++++------
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +-
>>   5 files changed, 29 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index 062ff914b274..c189ede4ef55 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -298,31 +298,38 @@ void intel_huc_init_early(struct intel_huc *huc)
>>   static int check_huc_loading_mode(struct intel_huc *huc)
>>   {
>>       struct intel_gt *gt = huc_to_gt(huc);
>> -    bool fw_needs_gsc = intel_huc_is_loaded_by_gsc(huc);
>> -    bool hw_uses_gsc = false;
>> +    bool fw_is_meu = huc->fw.is_meu_binary;
>>         /*
>>        * The fuse for HuC load via GSC is only valid on platforms 
>> that have
>>        * GuC deprivilege.
>>        */
>>       if (HAS_GUC_DEPRIVILEGE(gt->i915))
>> -        hw_uses_gsc = intel_uncore_read(gt->uncore, 
>> GUC_SHIM_CONTROL2) &
>> -                  GSC_LOADS_HUC;
>> +        huc->loaded_via_gsc = intel_uncore_read(gt->uncore, 
>> GUC_SHIM_CONTROL2) &
>> +                      GSC_LOADS_HUC;
>>   -    if (fw_needs_gsc != hw_uses_gsc) {
>> -        huc_err(huc, "mismatch between FW (%s) and HW (%s) load 
>> modes\n",
>> -            HUC_LOAD_MODE_STRING(fw_needs_gsc), 
>> HUC_LOAD_MODE_STRING(hw_uses_gsc));
>> +    if (huc->loaded_via_gsc && !fw_is_meu) {
>> +        huc_err(huc, "HW requires a MEU blob, but we found a legacy 
>> one\n");
>>           return -ENOEXEC;
>>       }
>>   -    /* make sure we can access the GSC via the mei driver if we 
>> need it */
>> +    /*
>> +     * Newer meu blobs contain the old FW structure inside. If we found
>> +     * that, we can use it to load the legacy way.
>> +     */
>> +    if (!huc->loaded_via_gsc && fw_is_meu && 
>> !huc->fw.dma_start_offset) {
>> +        huc_err(huc," HW in legacy mode, but we have an incompatible 
>> meu blob\n");
> Leading space in the message? MEU or meu?

As mentioned in the reply on the previous patch, I'm going to drop the 
meu tag.

>
>> +        return -ENOEXEC;
>> +    }
>> +
>> +    /* make sure we can access the GSC if we need it */
>>       if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && 
>> IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
>> -        fw_needs_gsc) {
>> +        !HAS_ENGINE(gt, GSC0) && huc->loaded_via_gsc) {
> Should that be || !HAS_ENGINE ?

No. The config check is for DG2, while the engine check is for MTL+. We 
need one of the two to be true, not both, so we only fail if both are false.

>
>>           huc_info(huc, "can't load due to missing MEI modules\n");
> 'missing MEI modules or GSC engine'?

I'll update it to "missing requirements" or something like that.

>
>>           return -EIO;
>>       }
>>   -    huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(fw_needs_gsc));
>> +    huc_dbg(huc, "loaded by GSC = %s\n", 
>> str_yes_no(huc->loaded_via_gsc));
>>         return 0;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>> index db555b3c1f56..345e1b9aa062 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>> @@ -39,6 +39,8 @@ struct intel_huc {
>>           struct notifier_block nb;
>>           enum intel_huc_delayed_load_status status;
>>       } delayed_load;
>> +
>> +    bool loaded_via_gsc;
>>   };
>>     int intel_huc_sanitize(struct intel_huc *huc);
>> @@ -73,7 +75,7 @@ static inline bool intel_huc_is_used(struct 
>> intel_huc *huc)
>>     static inline bool intel_huc_is_loaded_by_gsc(const struct 
>> intel_huc *huc)
>>   {
>> -    return huc->fw.loaded_via_gsc;
>> +    return huc->loaded_via_gsc;
>>   }
>>     static inline bool intel_huc_wait_required(struct intel_huc *huc)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> index f1c973e1c676..88ad2c322c4a 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> @@ -34,7 +34,7 @@ int intel_huc_fw_get_binary_info(struct intel_uc_fw 
>> *huc_fw, const void *data, s
>>       size_t min_size = sizeof(*header);
>>       int i;
>>   -    if (!huc_fw->loaded_via_gsc) {
>> +    if (!huc_fw->is_meu_binary) {
>>           huc_err(huc, "Invalid FW type MEU parsing!\n");
>>           return -EINVAL;
>>       }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index da6fcfe1d80a..3338dd45e78b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -180,7 +180,7 @@ struct __packed uc_fw_blob {
>>       u8 major;
>>       u8 minor;
>>       u8 patch;
>> -    bool loaded_via_gsc;
>> +    bool is_meu_binary;
>>   };
>>     #define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>> @@ -189,9 +189,9 @@ struct __packed uc_fw_blob {
>>       .patch = patch_, \
>>       .path = path_,
>>   -#define UC_FW_BLOB_NEW(major_, minor_, patch_, gsc_, path_) \
>> +#define UC_FW_BLOB_NEW(major_, minor_, patch_, meu_, path_) \
>>       { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>> -      .legacy = false, .loaded_via_gsc = gsc_ }
>> +      .legacy = false, .is_meu_binary = meu_ }
> Should we be changing the filename suffix to be 'meu' instead of 'gsc'?

The dg2 filename already used gsc and I don't want to change that. As 
already mentioned, I'll just drop the meu tag.

Daniele

>
> John.
>
>>     #define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
>>       { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>> @@ -296,7 +296,7 @@ __uc_fw_auto_select(struct drm_i915_private 
>> *i915, struct intel_uc_fw *uc_fw)
>>           uc_fw->file_wanted.path = blob->path;
>>           uc_fw->file_wanted.ver.major = blob->major;
>>           uc_fw->file_wanted.ver.minor = blob->minor;
>> -        uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
>> +        uc_fw->is_meu_binary = blob->is_meu_binary;
>>           found = true;
>>           break;
>>       }
>> @@ -680,7 +680,7 @@ static int check_fw_header(struct intel_gt *gt,
>>       if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
>>           return 0;
>>   -    if (uc_fw->loaded_via_gsc)
>> +    if (uc_fw->is_meu_binary)
>>           err = check_gsc_manifest(gt, fw, uc_fw);
>>       else
>>           err = check_ccs_header(gt, fw, uc_fw);
>> @@ -929,7 +929,7 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, 
>> u32 dst_offset, u32 dma_flags)
>>       intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>>         /* Set the source address for the uCode */
>> -    offset = uc_fw->dummy.start;
>> +    offset = uc_fw->dummy.start + uc_fw->dma_start_offset;
>>       GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
>>       intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, 
>> lower_32_bits(offset));
>>       intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, 
>> upper_32_bits(offset));
>> @@ -1168,7 +1168,7 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw 
>> *uc_fw, void *dst, u32 max_len)
>>   {
>>       struct intel_memory_region *mr = uc_fw->obj->mm.region;
>>       u32 size = min_t(u32, uc_fw->rsa_size, max_len);
>> -    u32 offset = sizeof(struct uc_css_header) + uc_fw->ucode_size;
>> +    u32 offset = uc_fw->dma_start_offset + sizeof(struct 
>> uc_css_header) + uc_fw->ucode_size;
>>       struct sgt_iter iter;
>>       size_t count = 0;
>>       int idx;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> index 2691bb6bde48..8f2306627332 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> @@ -115,7 +115,7 @@ struct intel_uc_fw {
>>         u32 dma_start_offset;
>>   -    bool loaded_via_gsc;
>> +    bool is_meu_binary;
>>   };
>>     /*
>

