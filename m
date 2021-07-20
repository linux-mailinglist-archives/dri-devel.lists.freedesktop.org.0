Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C3A3D057B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 01:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3E46E20C;
	Tue, 20 Jul 2021 23:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CA76E194;
 Tue, 20 Jul 2021 23:38:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="211403890"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="211403890"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 16:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="496388105"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 20 Jul 2021 16:38:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 16:38:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 16:38:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 16:38:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCvLPfdNbXIY+PgEEulrwGfqqWwRFh7zh9mmtmmSkwYNXKqCpKbKBY0WsgNYgdJMatDB7V9+R9Xv2BQCL2KbQd/+12nvWe6Faqugm6CTD/JAPWix9CdsO89uhAR9xqvIGfAiuP6OQZmLn2R4fzDT6iqTJe/MJYlPzZ53ubBvoDWc4/zT//JAYJeJVPEzTlkOsb5t7amH32zN6fY5Lc90Zswzm7TovMq82BQkdOuHpo2zMXS7JGQ88ausSDUD/410x+iyG9TFSJebUj8ZQpGOld/2YBfOfxVX5oejyZ3q1jU0W8cBqIDZiiy9ChoyOkwbjJbKDjwCAF3tkGeu7E3Klg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uXo3hKGZ92LpM4D3tlVmDscTHSLxbKvpwBeL9laamg=;
 b=MhiZX33YKNorpO/0ftpp/0pKhjo3Dot7DwZHw5thT262ATBAyVERULMR+MOLWkSbYfPjSK0vg5niw1yuECyaD8DPXNkEUESy8DsAQubky6q2FCGz3nlWrrw3WidVSLmSa29egl8uhwt0D6KhxWS7UllJdAWAav90Su3J2OFw4QuJmyipUwLRYH4lFAmvNaRV3qKfayMJyeEyVt9I4WUwUhA5owVnZ2lTGjYH/OaowGeeGQqOY48veflq2NzA+kNBFXkfFzhEzIiUCgr4xY/i4JtUd6NPAo1SzK+urfgP+B8m6bGp0AwBkNVQiup57Xa9mzSDvxwYc0YMUeyJMKwVpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uXo3hKGZ92LpM4D3tlVmDscTHSLxbKvpwBeL9laamg=;
 b=GS/UrY6IvTJJUmDJiNfDxIDRc/1N8zpBPe/YOBnmeyqegUzY1Qr/VmID1A0zH1g45cbdq9mtFoWZDjbDznGGLn+L6meLGf3GNQ+tkInbm163G1YyyYg3NJWQiVia6+tSF1a0BXFoFWxQvzObxZSA0ZDZGBo+1UzpE/NclP6QaXo=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5650.namprd11.prod.outlook.com (2603:10b6:5:35a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.32; Tue, 20 Jul
 2021 23:38:46 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%8]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 23:38:46 +0000
Subject: Re: [PATCH 14/16] drm/i915/guc/slpc: Sysfs hooks for slpc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-15-vinay.belgaumkar@intel.com>
 <11439c24-118c-1dc2-17cd-5b7f9bcd97de@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <6ac94843-ae76-dd2d-87b7-92f6748f4116@intel.com>
Date: Tue, 20 Jul 2021 16:38:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <11439c24-118c-1dc2-17cd-5b7f9bcd97de@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 SJ0PR13CA0160.namprd13.prod.outlook.com (2603:10b6:a03:2c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.9 via Frontend
 Transport; Tue, 20 Jul 2021 23:38:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8eef48ee-df4e-4c84-d985-08d94bd7842d
X-MS-TrafficTypeDiagnostic: CO6PR11MB5650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5650DA7D84B0EE776FFE815485E29@CO6PR11MB5650.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8pF2YGI4Eo6DNfKi5KjReC5OCx0P38SS6YpxdzcdViWwJdFg1Tno86DMcRqCD6RwnSlTzvrQWHUHkTruCweLwvWtaIio8W/rJyuBT9tL4BcWswrFVBu4ckYrB0tJRgP3ClZ5r8g1FctoO18ERnTtj5wWxb12W2ADSvcS1Ru5UYWOm0zRghHi5wrD8Vo9rrihD65sGL+l5Ea0UGyCZ1z8hU6se89pdVdIRIXX4RvQRQ8LpCjaSQExSafG6bduWJVHDQlAhIcII+iDibb9PaMia6Ee5L2dC3VgCprJjCbWBV4wPdAgsunD6isgaj4Rzk7gCGOScFErBgqCbDVFm+Z8TgPyh0P1onVADPE0J7fLduGWiWUI9VnHXIlkp666NKQSUa5CU793gbMBJCOb1YZquczq+k2PaDjuu5s1syGjCe0O259jR6ENJ9EiY2BU4kRVQ1sAfHDcmBlIlPqlhTV6AecxLSTa3IM5/HsmA70HIh+iKydsMpUojFO5aBOwYKdNFi1lTFo2nIV4g0+q3iv8uUldSmCXCHNKkxa4yKzxuUjzQHeQe1ArhkNyzPp54/9xBMujTzPMIkNntWr6eOSdBH/gVFGuiSbs4gxgrU59ABdwN32ZH+w4UqQ4pYBm/C/ngWxQPZ+ULWYUtRkmfK/YTFka9Uvc2UhY5GK0binRUz8cZcaEFwe5qUcDFq2EIc0Jx53EW/ozFsdTQUKeR+rhcFT5LwlBUa+lGTbQOulHpnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(38100700002)(186003)(86362001)(31696002)(66476007)(66556008)(66946007)(6486002)(8676002)(956004)(30864003)(26005)(2906002)(8936002)(36756003)(53546011)(4326008)(478600001)(2616005)(316002)(31686004)(16576012)(54906003)(5660300002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW1PWEZTS2YyRUlPNnA1UFhrLzZmM3hoRTlNZkJJNFNpTWoweFdoSlNncjJS?=
 =?utf-8?B?dWtLcXZuRWdMalFYQ2Jod1IrQmE0K2k1NG1GemhhOG5TemoyT2ZmMGJnWEtL?=
 =?utf-8?B?RFQ1VWtKdDROOEIzOURWemtBMjJIRWI1b1hBOUh1amJCem4xVTdtaHJSdzVM?=
 =?utf-8?B?LzFKN0FCSnFhQXlQMFQ3SnV5SUpZQXorSzN3bXRaR2tESkI4RitiaUdXd1Qr?=
 =?utf-8?B?eFpWd2tzMXhvdDVzSGZOKzVuMng3SlE4bUpVcm0rKzBwU3lqcUxOSlhDM0p1?=
 =?utf-8?B?RzBIWFREWHE4aUFpMTZnbnVKN0M2WDkzcllrMDFDREhtWjZDcjVnaUNoRFhB?=
 =?utf-8?B?UlpWRWFNN0tvWTdYdDlzRDY0UEw5eDljMG1Kem9Nbm81NGp2azcvRDhCQUd1?=
 =?utf-8?B?VlpnWVh6YjRQZUh2KzN0Um12NDFXS0VQYXQyUDcwUEpuT0VXTDdUV1pLUHVZ?=
 =?utf-8?B?MEhnRlJLb3RUV2xhajdISC9LU3U2aGowUXI4OG5lVElReW9JYUc4M3ArZEFk?=
 =?utf-8?B?c2EybElmdU00a3dsd041b053bG4rS2NnaldjWmlyMFRaa2ZWalNvSGhBNlE4?=
 =?utf-8?B?WUFDdnp4UmFuVGEwNVFlUTFQeXZickVSS2xXL09lWVB2TU95cmw4NjBUVDZl?=
 =?utf-8?B?R0pyZEdaTk40MUI5aGF3a2VnaFpnVFY0MmpkZHc1ODNlM2EybkxYNDM4aFR3?=
 =?utf-8?B?dDVlR3pRMFVpOE15UXVGNlNUQ3NUbmo4WllsSXNIbEJoT3ljaGczcEdnT3FG?=
 =?utf-8?B?cFdYYTJmQm9MVjErRStWWGpjVFQ2QzFnTUZxc0ZWZEJGSWtLalRCdGgrQUZC?=
 =?utf-8?B?NEt3ZEN5eDBCcWJ5cm9hT28wN3ovMnIzMDNOV2dQdzJOSnBCdytPMlhZUVdT?=
 =?utf-8?B?Vzhsc0xHNTlab0NmSUloQnBocTBkRm5pb2I3dks1Z3F2QWZ1UkRBcGxKUmJt?=
 =?utf-8?B?OC9Cb2lMT2ZzUWJEUWxVbktQSUV5RmFCcmd2VWhBcjlHK2lUY1dHQ3A0VzVp?=
 =?utf-8?B?VTg0Nk5ZTnJPZENoZFJIeExVZHlQZjdkZVRYdm5qMUpkRjdjaWZvQkRlWk51?=
 =?utf-8?B?WW5lQkVDckRNa05YWTBZYXNsckkwdmZOcEZkVGVTWUJZWlVjSEoyUzQ4b082?=
 =?utf-8?B?NGNlbnNVeDU3ODlUVTEzVjJWc240NUJVa0Z0SURpeDJrdzdEdlZCaytlL2My?=
 =?utf-8?B?bGZ2ZStuSWpmSUdpUTQ2ZzRpdjFMeDNNZ1k2SHJEM3JTbUxXSlg3OHViT0Fl?=
 =?utf-8?B?ZUdMUkc2M2tJdmVvS1hDaGZKY2hKTWFUOHhaeGxOOXJMVkNIVW16RFY5S0xk?=
 =?utf-8?B?aHpKc3FNYnNwSGlLZm5hOXpERUtTNWpTeWJNdFhRL1B1NVh6L2UybldHa3dk?=
 =?utf-8?B?OVE2WEJTR0JlTkdqRzgvYmxmK2kxTHNXTFZjREJNV0hOSG43VEtua3JDditp?=
 =?utf-8?B?NkNGczc2TDU0MkZBdm5FNElUYXlJR0g1ekpsSGErdnFmNnZWclZEVWNNUFh5?=
 =?utf-8?B?V0toSEsvemxGUlpPaHlsQi85dGdXR2JOUFRGRkpvMzVFQU45SjNTOWRpcGtD?=
 =?utf-8?B?WDYyeEtPUG1WWHc5QVlkWDZEeFVucFk4c3I1NVJkdS9aZHgrbklSbXpKa0FI?=
 =?utf-8?B?SFFuakR2S0pIR1pIbHFGSWJuL1ZPbGVnMzJnOEprYzJmNE1mQXVLTjRPSUkz?=
 =?utf-8?B?eGtpeHFEUmh4TkhsRmk1TzQydmNCUWRTQzBQVzBPS2Z3UXljbTZhSTF4azlY?=
 =?utf-8?Q?KiYM17Xsb6I+we+aATaxJ7OTacDi9ao/KDuDSGY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eef48ee-df4e-4c84-d985-08d94bd7842d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 23:38:45.8698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bobNyi8Qj5ifRLuV2P2o1qj2sB8dKRVg5KDRDhn31x4A9TvDi+je+cR2f+r+M7tSuDSlzGenMw2t5oZHxLo6bcHSTz3flARygug0q8i/kVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5650
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/10/2021 11:20 AM, Michal Wajdeczko wrote:
> 
> 
> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
>> Update the get/set min/max freq hooks to work for
>> slpc case as well. Consolidate helpers for requested/min/max
>> frequency get/set to intel_rps where the proper action can
>> be taken depending on whether slpc is enabled.
> 
> 2x s/slpc/SLPC

done.
> 
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c | 135 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_rps.h |   5 ++
>>   drivers/gpu/drm/i915/i915_pmu.c     |   2 +-
>>   drivers/gpu/drm/i915/i915_reg.h     |   2 +
>>   drivers/gpu/drm/i915/i915_sysfs.c   |  71 +++------------
>>   5 files changed, 154 insertions(+), 61 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index e858eeb2c59d..88ffc5d90730 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -37,6 +37,12 @@ static struct intel_uncore *rps_to_uncore(struct intel_rps *rps)
>>   	return rps_to_gt(rps)->uncore;
>>   }
>>   
>> +static struct intel_guc_slpc *rps_to_slpc(struct intel_rps *rps)
>> +{
>> +	struct intel_gt *gt = rps_to_gt(rps);
>> +	return &gt->uc.guc.slpc;
> 
> either add empty line between decl/code or make it one-liner

done.

> 
>> +}
>> +
>>   static bool rps_uses_slpc(struct intel_rps *rps)
>>   {
>>   	struct intel_gt *gt = rps_to_gt(rps);
>> @@ -1960,6 +1966,135 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
>>   	return freq;
>>   }
>>   
>> +u32 intel_rps_read_punit_req(struct intel_rps *rps)
>> +{
>> +	struct intel_uncore *uncore = rps_to_uncore(rps);
>> +
> 
> drop empty line

done.
> 
>> +	u32 pureq = intel_uncore_read(uncore, GEN6_RPNSWREQ);
>> +
>> +	return pureq;
>> +}
>> +
>> +u32 intel_rps_get_req(struct intel_rps *rps, u32 pureq)
>> +{
>> +	u32 req = pureq >> GEN9_SW_REQ_UNSLICE_RATIO_SHIFT;
>> +
>> +	return req;
>> +}
>> +
>> +u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps)
>> +{
>> +	u32 freq = intel_rps_get_req(rps, intel_rps_read_punit_req(rps));
>> +
>> +	return intel_gpu_freq(rps, freq);
>> +}
>> +
>> +u32 intel_rps_get_requested_frequency(struct intel_rps *rps)
>> +{
>> +	if (rps_uses_slpc(rps))
>> +		return intel_rps_read_punit_req_frequency(rps);
>> +	else
>> +		return intel_gpu_freq(rps, rps->cur_freq);
>> +}
>> +
>> +u32 intel_rps_get_max_frequency(struct intel_rps *rps)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return slpc->max_freq_softlimit;
>> +	else
>> +		return intel_gpu_freq(rps, rps->max_freq_softlimit);
>> +}
>> +
>> +int intel_rps_set_max_frequency(struct intel_rps *rps, u32 val)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +	int ret;
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return intel_guc_slpc_set_max_freq(slpc, val);
>> +
>> +	mutex_lock(&rps->lock);
>> +
>> +	val = intel_freq_opcode(rps, val);
>> +	if (val < rps->min_freq ||
>> +	    val > rps->max_freq ||
>> +	    val < rps->min_freq_softlimit) {
>> +		ret = -EINVAL;
>> +		goto unlock;
>> +	}
>> +
>> +	if (val > rps->rp0_freq)
>> +		DRM_DEBUG("User requested overclocking to %d\n",
> 
> use drm_dbg

Done.

Thanks,
Vinay.
> 
> Michal
> 
>> +			  intel_gpu_freq(rps, val));
>> +
>> +	rps->max_freq_softlimit = val;
>> +
>> +	val = clamp_t(int, rps->cur_freq,
>> +		      rps->min_freq_softlimit,
>> +		      rps->max_freq_softlimit);
>> +
>> +	/*
>> +	 * We still need *_set_rps to process the new max_delay and
>> +	 * update the interrupt limits and PMINTRMSK even though
>> +	 * frequency request may be unchanged.
>> +	 */
>> +	intel_rps_set(rps, val);
>> +
>> +unlock:
>> +	mutex_unlock(&rps->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +u32 intel_rps_get_min_frequency(struct intel_rps *rps)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return slpc->min_freq_softlimit;
>> +	else
>> +		return intel_gpu_freq(rps, rps->min_freq_softlimit);
>> +}
>> +
>> +int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +	int ret;
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return intel_guc_slpc_set_min_freq(slpc, val);
>> +
>> +	mutex_lock(&rps->lock);
>> +
>> +	val = intel_freq_opcode(rps, val);
>> +	if (val < rps->min_freq ||
>> +	    val > rps->max_freq ||
>> +	    val > rps->max_freq_softlimit) {
>> +		ret = -EINVAL;
>> +		goto unlock;
>> +	}
>> +
>> +	rps->min_freq_softlimit = val;
>> +
>> +	val = clamp_t(int, rps->cur_freq,
>> +		      rps->min_freq_softlimit,
>> +		      rps->max_freq_softlimit);
>> +
>> +	/*
>> +	 * We still need *_set_rps to process the new min_delay and
>> +	 * update the interrupt limits and PMINTRMSK even though
>> +	 * frequency request may be unchanged.
>> +	 */
>> +	intel_rps_set(rps, val);
>> +
>> +unlock:
>> +	mutex_unlock(&rps->lock);
>> +
>> +	return ret;
>> +}
>> +
>>   /* External interface for intel_ips.ko */
>>   
>>   static struct drm_i915_private __rcu *ips_mchdev;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
>> index 1d2cfc98b510..9a09ff5ebf64 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
>> @@ -31,6 +31,11 @@ int intel_gpu_freq(struct intel_rps *rps, int val);
>>   int intel_freq_opcode(struct intel_rps *rps, int val);
>>   u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat1);
>>   u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
>> +u32 intel_rps_get_requested_frequency(struct intel_rps *rps);
>> +u32 intel_rps_get_min_frequency(struct intel_rps *rps);
>> +int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val);
>> +u32 intel_rps_get_max_frequency(struct intel_rps *rps);
>> +int intel_rps_set_max_frequency(struct intel_rps *rps, u32 val);
>>   
>>   void gen5_rps_irq_handler(struct intel_rps *rps);
>>   void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>> index 34d37d46a126..a896bec18255 100644
>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>> @@ -407,7 +407,7 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>>   
>>   	if (pmu->enable & config_mask(I915_PMU_REQUESTED_FREQUENCY)) {
>>   		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_REQ],
>> -				intel_gpu_freq(rps, rps->cur_freq),
>> +				intel_rps_get_requested_frequency(rps),
>>   				period_ns / 1000);
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 7d9e90aa3ec0..8ab3c2f8f8e4 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -9195,6 +9195,8 @@ enum {
>>   #define   GEN9_FREQUENCY(x)			((x) << 23)
>>   #define   GEN6_OFFSET(x)			((x) << 19)
>>   #define   GEN6_AGGRESSIVE_TURBO			(0 << 15)
>> +#define   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT 	23
>> +
>>   #define GEN6_RC_VIDEO_FREQ			_MMIO(0xA00C)
>>   #define GEN6_RC_CONTROL				_MMIO(0xA090)
>>   #define   GEN6_RC_CTL_RC6pp_ENABLE		(1 << 16)
>> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
>> index 873bf996ceb5..f2eee8491b19 100644
>> --- a/drivers/gpu/drm/i915/i915_sysfs.c
>> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
>> @@ -272,7 +272,7 @@ static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
>>   	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
>>   	struct intel_rps *rps = &i915->gt.rps;
>>   
>> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->cur_freq));
>> +	return sysfs_emit(buf, "%d\n", intel_rps_get_requested_frequency(rps));
>>   }
>>   
>>   static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
>> @@ -326,9 +326,10 @@ static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
>>   static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
>>   {
>>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>> -	struct intel_rps *rps = &dev_priv->gt.rps;
>> +	struct intel_gt *gt = &dev_priv->gt;
>> +	struct intel_rps *rps = &gt->rps;
>>   
>> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->max_freq_softlimit));
>> +	return sysfs_emit(buf, "%d\n", intel_rps_get_max_frequency(rps));
>>   }
>>   
>>   static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>> @@ -336,7 +337,8 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>>   				     const char *buf, size_t count)
>>   {
>>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>> -	struct intel_rps *rps = &dev_priv->gt.rps;
>> +	struct intel_gt *gt = &dev_priv->gt;
>> +	struct intel_rps *rps = &gt->rps;
>>   	ssize_t ret;
>>   	u32 val;
>>   
>> @@ -344,35 +346,7 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>>   	if (ret)
>>   		return ret;
>>   
>> -	mutex_lock(&rps->lock);
>> -
>> -	val = intel_freq_opcode(rps, val);
>> -	if (val < rps->min_freq ||
>> -	    val > rps->max_freq ||
>> -	    val < rps->min_freq_softlimit) {
>> -		ret = -EINVAL;
>> -		goto unlock;
>> -	}
>> -
>> -	if (val > rps->rp0_freq)
>> -		DRM_DEBUG("User requested overclocking to %d\n",
>> -			  intel_gpu_freq(rps, val));
>> -
>> -	rps->max_freq_softlimit = val;
>> -
>> -	val = clamp_t(int, rps->cur_freq,
>> -		      rps->min_freq_softlimit,
>> -		      rps->max_freq_softlimit);
>> -
>> -	/*
>> -	 * We still need *_set_rps to process the new max_delay and
>> -	 * update the interrupt limits and PMINTRMSK even though
>> -	 * frequency request may be unchanged.
>> -	 */
>> -	intel_rps_set(rps, val);
>> -
>> -unlock:
>> -	mutex_unlock(&rps->lock);
>> +	ret = intel_rps_set_max_frequency(rps, val);
>>   
>>   	return ret ?: count;
>>   }
>> @@ -380,9 +354,10 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>>   static ssize_t gt_min_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
>>   {
>>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>> -	struct intel_rps *rps = &dev_priv->gt.rps;
>> +	struct intel_gt *gt = &dev_priv->gt;
>> +	struct intel_rps *rps = &gt->rps;
>>   
>> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->min_freq_softlimit));
>> +	return sysfs_emit(buf, "%d\n", intel_rps_get_min_frequency(rps));
>>   }
>>   
>>   static ssize_t gt_min_freq_mhz_store(struct device *kdev,
>> @@ -398,31 +373,7 @@ static ssize_t gt_min_freq_mhz_store(struct device *kdev,
>>   	if (ret)
>>   		return ret;
>>   
>> -	mutex_lock(&rps->lock);
>> -
>> -	val = intel_freq_opcode(rps, val);
>> -	if (val < rps->min_freq ||
>> -	    val > rps->max_freq ||
>> -	    val > rps->max_freq_softlimit) {
>> -		ret = -EINVAL;
>> -		goto unlock;
>> -	}
>> -
>> -	rps->min_freq_softlimit = val;
>> -
>> -	val = clamp_t(int, rps->cur_freq,
>> -		      rps->min_freq_softlimit,
>> -		      rps->max_freq_softlimit);
>> -
>> -	/*
>> -	 * We still need *_set_rps to process the new min_delay and
>> -	 * update the interrupt limits and PMINTRMSK even though
>> -	 * frequency request may be unchanged.
>> -	 */
>> -	intel_rps_set(rps, val);
>> -
>> -unlock:
>> -	mutex_unlock(&rps->lock);
>> +	ret = intel_rps_set_min_frequency(rps, val);
>>   
>>   	return ret ?: count;
>>   }
>>
