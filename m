Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC893D8479
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DBD6E10B;
	Wed, 28 Jul 2021 00:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A056E0E3;
 Wed, 28 Jul 2021 00:10:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="192145952"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="192145952"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634576755"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 27 Jul 2021 17:10:44 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 17:10:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 17:10:44 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 17:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rgl3nJym6f5au1/gcnPsdFGiaFY7FNgcgalqTJLI+9j2i21wOches63xSP1Q7vAzV/wo4208O1Rf7AnT5oePoOEtgVqAWmFWorFbbIfgv/2Xa8+hrrGsJ4xyhNhROjLNTB3iK1NR4Ppf45C5ICnfjBJ99hKkAnqZq53F+raUX8NBNIOL7rG6BDGmf6SSQIz1NkW5dZanmpQafrZ74D6OXFin9dmOLxnr3duS+NzjfUS9FxufTlk1h0AQvy5ARJhvWqcCZQkspV3PS8n7Y06j83OnQ/+6aIBQ4LJusxzT6a/XJKU9BH9QU01Qj6g4PLWbygnXgLvEZYf0XJV7GOnpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rbmV3J8jktVpbCngKrj1fq3ORD30YaxVydr4fjYBa4=;
 b=Gp/Jlxc5i6V5GhXwG8w/qOk6TuXl1Qu3jPTTMqC/tVhPYfsHYz+PoiWfwxDgeQ1E1Qwnd7jNlBABDQ3uggP/JcIwdnLIM5sKW41TUJFbOHlBLuvCQuLhQFmuTbFUqyPcoLjE6zTAO+hGf9BI8igM94bh/Izm0gVUun76ePTkZlfCTc1v4B7FAv5t4H3AO4Le/SJ3PLeQTHLHx2YaiO+Jurejk3LdkCuE1TivgYi6Ush+JhnZpanNxiWZQeQsrRGJIMjvyUhDqadbJW+ZTR4xehMv0+0Xx67IjmYbjV0aIBSxnkkl/G9CUVy8jC8F1f9bZkT6LZQbSTnE3VMqKRqVgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rbmV3J8jktVpbCngKrj1fq3ORD30YaxVydr4fjYBa4=;
 b=P2jqJn+N8pZ0RaM8DvoYVAyfTUDkMRWVn8S43oyiPgrhFMl4QJvRW2Pef8K4p9gV3/SZ5JM4e5uWOnyKlkjPkz+t7opSIN+DrGhovY5ACHb6WerE1Aem23EHKVDGxlstcP0mJ2BLV7+gDY+qupIZrzfFgEV0jsa9w8wp4S97k8o=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5652.namprd11.prod.outlook.com (2603:10b6:5:35e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Wed, 28 Jul
 2021 00:10:43 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 00:10:43 +0000
Subject: Re: [PATCH 10/15] drm/i915/guc/slpc: Add debugfs for SLPC info
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-11-vinay.belgaumkar@intel.com>
 <b4ab8758-6483-fbef-bfb4-2a9e55419698@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <519ef80e-521c-7f62-4cd9-2b7b504cecfb@intel.com>
Date: Tue, 27 Jul 2021 17:10:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <b4ab8758-6483-fbef-bfb4-2a9e55419698@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::16) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 SJ0PR13CA0221.namprd13.prod.outlook.com (2603:10b6:a03:2c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.9 via Frontend
 Transport; Wed, 28 Jul 2021 00:10:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab6f6560-ecd7-440b-1f51-08d9515c2433
X-MS-TrafficTypeDiagnostic: CO6PR11MB5652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5652F3910E02344E9A61108685EA9@CO6PR11MB5652.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:272;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dgjunC7YEj08G7SYnc8+ezANJaNjJOTCnb9hEyd6mylin4yArgVs7nzfE74zgGr/AWr5aX9mCImcTTlft4AlnkWFNeVxaRdw1KaDQmU+x5Hg3NKEjy+eRu/e7o8r73/UUN/p9XfByln27KOClaIDm92uwY9dv7YKpEPBKwVJMR+IthOlbG9alhkX4U4dG1LCPuYbX6t+BDyBTxAmdFYARH6FMRnOJDFS9k+wYNuaWAamgRGuDEikAzcBOJgoKwHLFbFPHvPKo8YfrWflJcJ4e6uXBbpoLWXfnD9fShZesUgEEY7nj75S9XhOK2Zm2sok61cr1VSdEqXLePCSFfv+hIY67YWxIpIwrNZ08gbUIB2E90nYvkRKrr/vsbPK6YoIgqk0P6sDrvNHfOFar3i0u1jISw2zgjr//FYK8UZqiY2ZGAFEVa+fvnA8axyR3cZe9O6Jaz3L6uy9rI7wDKh2QO+iFxMj1Dd4mlVSqCFTuyUJiC1LwytD+BdXJujzWspn3ctaF50wzBPdGx5zaUXE4so6iCKss6LaCllsrGt8SOeH6OU+ehFZ1HiniRWb2i4GA8lzvMi19JbWqf7rNtVl8TWimEmop5WqKU3L2L7gpuB1E6LHmcDidEQwNRw97p6hrEssnfosUh3FcD+aF3Txb/tmNt5rBKZ0ZWojawqoN3aHDIiUwahOesMgNdOjXkBzQ0IGWw4ovYXaIH8+ELLrPYze789HMAClZW3gSK7y41WTvvUz1JBggJ2crBi3OGvw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(36756003)(31696002)(8676002)(186003)(2906002)(4326008)(2616005)(316002)(956004)(450100002)(8936002)(31686004)(66946007)(16576012)(66476007)(66556008)(478600001)(107886003)(6486002)(83380400001)(26005)(86362001)(38100700002)(53546011)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFQ2ekJEZHg1SXcvdC91MEtOdWZGaUc4TWcrUnRkenp2NWxNeDY2ajZsZ0VT?=
 =?utf-8?B?R3BldW1Ba1JaUVpMSjJyTy9QakRqTklYOGFFT1VWZG9OOGFWMTVhUFlDVjFi?=
 =?utf-8?B?NGVFamx3TjRUbGZaZzRMakRJKzgvOVJidjQweE9hZERuSGJFYmdxMkc4N3ZQ?=
 =?utf-8?B?VTlwUmNvU2F6dmc3Um5QMU1RVmRENGdINHFRcDR3NUtwMTRqZDl2THFJVUJC?=
 =?utf-8?B?V1pHZ042Z1RVWlFHNFlycVM5b1Mvb1ZxU3g5QytEU2FQNmRZbGFxY1lCUTlm?=
 =?utf-8?B?Y0I0UVpiZTI2U3JyODM2YktQLzNieExtVjFMWWVTSTdKM2VveEltNWVvdC9x?=
 =?utf-8?B?ZVN2dW1GWVVSNUZRd1FWbmZjYU40WmoxYUpmUHhBeFJjU1czTEZQcm00aWRq?=
 =?utf-8?B?OEJIenRpSWVYUHpXZ2NNdDJKempBRzBQTmhsUmxaZm5GejVrRVV1eVZBUGZW?=
 =?utf-8?B?VW5oZmFtYm95MlpxZno4OHY2SWVyNmN0VkFBQTA4TG5BQlMrSHdXQm8yc2NU?=
 =?utf-8?B?SGZwME5DY2c5T2tILzlaSjhpaXlwektuLzViMlh5RXRrM0xPWlU5cTV5cGZ6?=
 =?utf-8?B?NXFZbVZ6T3liM3YrMy9zTEhUL3FqWitwOGx1Skk3am5oK01lOTVPTUFVM0VU?=
 =?utf-8?B?RUpuRVVBRkE4WGlOcVJWL2p2ZFpnZ3E2OG05NW95OFBZRmRpeGZmaHhpMXUz?=
 =?utf-8?B?YUxmc3hiazZPU09xTDFpdnRGQnBNT3h4NVM3VHRsKzZJT05hMjhzN2pkZy9L?=
 =?utf-8?B?QVZjSEJmRTB1eUpCSGFRRUVDc1VkY3E2Tm5SbXo1TVo5Q1pvN2h0b1k3Skh2?=
 =?utf-8?B?OTUvckJCMmV2Y3ZTYlB2d1NHRHYxcDZWdU5rNHJNYTh6TytCUzNUMzZEZUt0?=
 =?utf-8?B?d3ErR1hEZEJLb2FQa2pjY1VDTnZROHlTbWtid1c5NGRIbUJ4K1Q5enB4T1BG?=
 =?utf-8?B?b1cyeFFxK09FMXgyUkt1UDZ2cWZ0M0IwWTVtRTRDUU9sSEhYL2s2R1c4NjBm?=
 =?utf-8?B?a0V4VGhpQ2xBZmM0T29xL1ZDc2s4TEhrS0dPd2hoS2thQWJoM2hNcE1LUE1N?=
 =?utf-8?B?ZGFXWGoxcU5UM0tVSk5zMzkrY3VqdUVwUkpWdG9VQ0ZrMjl5VkxsalJIUGJC?=
 =?utf-8?B?YitGN1E1NUhMS09FMnEza0tWVnM0TUZkbUxmVmlUUjZmTU9IRzJlbXBMc2ll?=
 =?utf-8?B?d1daSURXbXhvRmwwMWhOL2VjVStIaVFjQUpNSnFhYzMyWUQ2cjdxMFlGOEpQ?=
 =?utf-8?B?QWJ2aUprY1ZPMXFwZFV4L0pEYXN3TVJ6ZXoyeSs1MWIzdUliVmVXSjZZWHlS?=
 =?utf-8?B?UE4wcVVVVkVvRExUNVVHN1hVc2grNnJhdXFPdE42VURJNk9FQWw4NzBFa0Z2?=
 =?utf-8?B?VVFWZWhGelkxZHpsYUc1aWxNRS9BTVd4dytpTithdnVvdFRTRGM5MVBMTGIy?=
 =?utf-8?B?b0sraEUvcGFURVRwMytKeDVEd1JHTWNPYTI0QkxpTFVaVSs4OGJvN3dJU1JR?=
 =?utf-8?B?YkFnZHhoUVNnZkh2eVNZT01sSFRXQThnWDZCWUFKa05hSjEvT0UzTWN3R2k3?=
 =?utf-8?B?d3lDQlFML3haZEtOZjFUMGdxRXhVYWVrYjFoUkF5ZXFRTjJicDlCdjZVM0w3?=
 =?utf-8?B?T2Y4OGJUbnp2S1NRVlRYd2lqQ1B0aVpwenRpalhpNzF0T1lIOWtjZVNtTGNj?=
 =?utf-8?B?a0JvclU5V0Rnd1BEQlloWFVURnBLVzQ0Yi9tbzJUb0lvQmd1YzlvWFhSWFlH?=
 =?utf-8?Q?PWDmdPGAh/9i5OGcHvMX+VyYiHb2WT9XNDBOaoF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6f6560-ecd7-440b-1f51-08d9515c2433
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 00:10:43.7131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: du0fUwdJMb51fJc1cdea9hQGcN1bbzvX3UlgG2EA/07PXQrZWRSj3I322i1MWRn/ac15V0hOsSGV60axI312pH4e0lREFviUqfEEPvpxIEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5652
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
Cc: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/27/2021 8:37 AM, Michal Wajdeczko wrote:
> 
> 
> On 26.07.2021 21:07, Vinay Belgaumkar wrote:
>> This prints out relevant SLPC info from the SLPC shared structure.
>>
>> We will send a h2g message which forces SLPC to update the
> 
> s/h2g/H2G

ok.
> 
>> shared data structure with latest information before reading it.
>>
>> v2: Address review comments (Michal W)
>> v3: Remove unnecessary tasks from slpc_info (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    | 22 ++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 29 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  4 ++-
>>   3 files changed, 54 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
>> index 72ddfff42f7d..3244e54b1337 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
>> @@ -12,6 +12,7 @@
>>   #include "gt/uc/intel_guc_ct.h"
>>   #include "gt/uc/intel_guc_ads.h"
>>   #include "gt/uc/intel_guc_submission.h"
>> +#include "gt/uc/intel_guc_slpc.h"
>>   
>>   static int guc_info_show(struct seq_file *m, void *data)
>>   {
>> @@ -50,11 +51,32 @@ static int guc_registered_contexts_show(struct seq_file *m, void *data)
>>   }
>>   DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_registered_contexts);
>>   
>> +static int guc_slpc_info_show(struct seq_file *m, void *unused)
>> +{
>> +	struct intel_guc *guc = m->private;
>> +	struct intel_guc_slpc *slpc = &guc->slpc;
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +
>> +	if (!intel_guc_slpc_is_used(guc))
>> +		return -ENODEV;
>> +
>> +	return intel_guc_slpc_info(slpc, &p);
>> +}
>> +DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_slpc_info);
>> +
>> +static bool intel_eval_slpc_support(void *data)
>> +{
>> +	struct intel_guc *guc = (struct intel_guc *)data;
>> +
>> +	return intel_guc_slpc_is_used(guc);
>> +}
>> +
>>   void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
>>   {
>>   	static const struct debugfs_gt_file files[] = {
>>   		{ "guc_info", &guc_info_fops, NULL },
>>   		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
>> +		{ "guc_slpc_info", &guc_slpc_info_fops, &intel_eval_slpc_support},
>>   	};
>>   
>>   	if (!intel_guc_is_supported(guc))
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index c653bba3b5eb..995d3d4807a3 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -448,6 +448,35 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   	return 0;
>>   }
>>   
>> +int intel_guc_slpc_info(struct intel_guc_slpc *slpc, struct drm_printer *p)
> 
> nit: intel_guc_slpc_print_info ?

ok.

> 
>> +{
>> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
> 
> use slpc_to_i915()

ok.

> 
>> +	struct slpc_shared_data *data = slpc->vaddr;
>> +	struct slpc_task_state_data *slpc_tasks;
>> +	intel_wakeref_t wakeref;
>> +	int ret = 0;
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> +		ret = slpc_query_task_state(slpc);
>> +
>> +		if (!ret) {
>> +			slpc_tasks = &data->task_state_data;
>> +
>> +			drm_printf(p, "\tSLPC state: %s\n", slpc_get_state_string(slpc));
>> +			drm_printf(p, "\tGTPERF task active: %s\n",
>> +				yesno(slpc_tasks->status & SLPC_GTPERF_TASK_ENABLED));
>> +			drm_printf(p, "\tMax freq: %u MHz\n",
>> +					slpc_decode_max_freq(slpc));
>> +			drm_printf(p, "\tMin freq: %u MHz\n",
>> +					slpc_decode_min_freq(slpc));
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>>   {
>>   	if (!slpc->vma)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index 92d7afd44f07..d133c8020c16 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -9,6 +9,8 @@
>>   #include "intel_guc_submission.h"
>>   #include "intel_guc_slpc_types.h"
>>   
>> +struct drm_printer;
>> +
>>   static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
>>   {
>>   	return guc->slpc_supported;
>> @@ -25,7 +27,6 @@ static inline bool intel_guc_slpc_is_used(struct intel_guc *guc)
>>   }
>>   
>>   void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc);
>> -
> 
> this should be fixed in earlier patch
> 
> with all that fixed,

Done.
Thanks,
Vinay.
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>> @@ -33,5 +34,6 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>>   int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>>   int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
>>   int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
>> +int intel_guc_slpc_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
>>   
>>   #endif
>>
