Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491A23D7ECA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8686E89B;
	Tue, 27 Jul 2021 20:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9FD6E822;
 Tue, 27 Jul 2021 20:00:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="298100840"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="298100840"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 13:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="662957124"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jul 2021 13:00:42 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 13:00:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 13:00:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 13:00:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgIwEMCDI0y1i+0lUKiUQ+JUK79lIC/EB+tRhV2lnvyWpvHVmNC57FORJSlpOY/Ob0rhgaNEGp7djq5iyZYWcVN5Gb9ih5SrOFYut8wPcw5zlVGN6Qg4wrF5g5LkjjQpbqray55OtW8QsfD0Z9UFcSNnD5+bpDV0+pNixTFPLcWBzoy/ruptHJ0noVrXaDBdD/sPuSdGI/W1f+X7TPNkcHzjDJM5dcw1yWarlaUYEex/Q12PAwlv8BcZhsFkyOyGPDL6eLdVgxW3iwpxTgVdbFYGYau7N1+nTghUIIfzkemyFSBXUDzpYWNZsJrgM5RxzKEQgE/VJT5guVKXy2K6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AktnnbUM4sT1zwQCSE2A+7fnw8v+A9pWo+GCAJJ9rGs=;
 b=R5Vh/221h4Gcs4yYA19ucIZgwow9kZ/8XdlVtRmxKIkkGYkIWDpS1jthcNr5qgFCtcBB485Dvp8ZIqIifec0ayG4G7fLrb4k2W1zE99PCtQOwfbaeznqrqcY8k0thF6Tb/hBRtPPlY4cQ9fR52R7v8gujR2tJT5Jt1DrS+LXELR+6qHXzQIivyNab7mIQDRYUSLyIxP7zfXDkl+Pu94KqdzSljTT4RZARjyPmGX/EhKZn7CUOQzxwZG/fZ2V4kanJDHRNgj2mmlanD9srB0n4JuW6Intc30HU4NEVB3hg3df2UAFjKjr7+g6b/O2JWC4HHRTM0cJSVYEltqYqVQAog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AktnnbUM4sT1zwQCSE2A+7fnw8v+A9pWo+GCAJJ9rGs=;
 b=YjuIqzelSk4th4mAbh1Dd1EP2YrmKJ+i0zS1CC2NiK0h8p++GLiAnzwovEAwgryn3BhqPkWmbrOrP1aJfZdmdzhJRUWFp10/qg5muzAl65BVJU1uZtbSVP4fSvfhDpvNSXFWFCzVgECu8En98IiM7GZdb9PsFok2tFI6bXSeZYY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 27 Jul
 2021 20:00:40 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 20:00:40 +0000
Subject: Re: [Intel-gfx] [PATCH 06/15] drm/i915/guc/slpc: Enable SLPC and add
 related H2G events
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-7-vinay.belgaumkar@intel.com>
 <1e49627f-80a5-5283-eb6d-f06b0f024911@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <dd8d1976-4b3b-be9d-8b7d-e6487f2c06aa@intel.com>
Date: Tue, 27 Jul 2021 13:00:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <1e49627f-80a5-5283-eb6d-f06b0f024911@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0055.prod.exchangelabs.com (2603:10b6:a03:94::32)
 To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BYAPR01CA0055.prod.exchangelabs.com (2603:10b6:a03:94::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Tue, 27 Jul 2021 20:00:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98234e12-432f-4282-b9dd-08d9513935bf
X-MS-TrafficTypeDiagnostic: CO6PR11MB5620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5620AED9B6E9F9CF0DEA718B85E99@CO6PR11MB5620.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQTjVPdZh47yIrFKkA6EaiWxG6QHf+/z9LYNflLecislfxlnP+LecYzmVRPAUgFjeOlwsOErgQenoqkGASyNwaxIZ31UKDN+nbiDePSj19Llkr84p/NFP5ndhS8aeKJT/uwN5b3xAJnMz6GNfjYjNFoSAJSIvXW7yQTuOGULkQcwW0Ilh16nAGGOYrRVdtyscs4nWZEyzVmKXcyvXgSrUsYpXCuv02GWNl905e70jhhJAaxqGSmIXQqjc9jrgWsC7JKMB8xvLcWkZkxzoGu5iEGwku/lz+SxCzKWUxxJPonIru/9x87Fzdigu/ETO5J9A4XUttvJMkjcG2FQ+DpRi2ULpvi+vU1M7PxZwfFwT8fexCr6eHh4eQ8sQQzLZj071tQwUDBaRasfupLReu1NJJYmJ+1nrKCwRwpfxrzw+FJsw7iF4enN96nxA6G2XG0jjKbAejEeGNhtlFCQ4gmHbV7FH4Ql0Wxw8W5wfaykyga6j7Id3HTIEe51QLnt0sHBp1oj2iObsGftHFsOCL1r9ACKOemEXPFLqoqHm9AfinCP+oytWqaGIC7i1np+wQ9CoTDgiX3dAX5uruX+ieXobQovL1nrSfAcxKWetDOHnwuIrMStEqvSyStid99pIcXm6Aay3iM2/+zKLCC3E1TPNI4ZbzTp+b124vZSvlrY9/tGGlRklMphvTTybLSC3GDO5YwbcEDWWgZY+bu1/GMWTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(186003)(38100700002)(8676002)(66556008)(478600001)(86362001)(316002)(8936002)(6486002)(450100002)(83380400001)(26005)(5660300002)(66946007)(956004)(2906002)(36756003)(2616005)(66476007)(53546011)(31696002)(16576012)(31686004)(30864003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2hvdndKS1lRRGwwNmU4WDBOR2JYazZyZWhYRjlTeWk4N3ZYQjhIWkxZZ3A3?=
 =?utf-8?B?bEpubFVIeE5yWW1UeGFhbituUHpLcVpzT1N6c2NuV1M1bFVsdnVTNU9kSmxh?=
 =?utf-8?B?K1ZXdFlJSTc0aVQ5QVB1OXNoVVVCUFl2M0RqRy85RHRkSkJ3cWhZZnQ4V2h3?=
 =?utf-8?B?a2xDQU05TmNHMTBXTG1lVnhHckdOR2VkalZ2OFVLVVdwcHJuTjI0YW9CL29T?=
 =?utf-8?B?c0lFRFkwN25MTUIyNWJyZ0s0djdRZEhHbnJMMHZuelZwcXFJSXpQZlFnN1BL?=
 =?utf-8?B?ZW1MRm44dlNELzcxL1ZyUmpnYmdha0VaemxmVHp1TlpRZjdOOHNNbWp2MVRa?=
 =?utf-8?B?RUlXaGRkZFdYUDVLWFlRWVA0NnZoSHVaUy9QWmZhNU9pRXhDcHZnaTN1RGp5?=
 =?utf-8?B?R0twK3lzRE9FY29aRTdpb1dSL29TSUpqOGlsZGNVK3N2V1BUTnFtcVJOVnNP?=
 =?utf-8?B?Y1JoRWpXNkZUV09GdmhHMHprcm5wYjAzMXNrVFd5OU5aU3d6Z1NGQUlWeDAx?=
 =?utf-8?B?RzNJWE5YYmt4QVRtMVczMGo1NDNYdUFPVWxWUG12enNmS3ZUTjRWem5Zbmxv?=
 =?utf-8?B?UGNpNmxHdCt1dXBpcldOSTVOUndldEM4T2F6V0c2TlY3VDJhSjRlSEx0cklw?=
 =?utf-8?B?aEt2S2pLbFhJRlNWazdnZ2lOY3dEOGF2MllHL3AwdTZ2Z09MQWdEcmlzUzN5?=
 =?utf-8?B?ZWtnSkc4QWlSZFJJNGRld2xEV3NDYXV4NndlKzhWWWltNFFSV3JzUEdrdzFJ?=
 =?utf-8?B?MXRzSFA5T3VBUFEybmFSZmd6RlQxaHFnVnVEUjdvU2ZYT3hJMzYvQUYyTkRt?=
 =?utf-8?B?ekhJM2JTZDhkejVIYThKRGNqVjZ5R0VTbE9mOUgydjU1R3MzMWZJWHkwbFRT?=
 =?utf-8?B?ZndMSFlqTnFibkVGdU1yakVnZ2hWVUFzYStXTVI5KzFQajdMRVN6OE9MejRi?=
 =?utf-8?B?V0JkdjNEc1ZEMHN4Z3dmL2NabnF1WDJ0TUdDVUVrUGsva1hqRWlKMzErWUl6?=
 =?utf-8?B?dDZ1b1Jkb3ZRNWhaaWgyYXlXd2VMZ3UwenRZYmRuYVdPSE9iYzlYbEVKUzR2?=
 =?utf-8?B?M25CSTF6TTF5c3FDVHJkNnNLNCsraVB4b1V0ZUVSUU53VkdoWEpjQTBRbTd6?=
 =?utf-8?B?MEdTcGxOdzQwUGNUQmVXVzFJRkZ0dW9scFlBdUhuUkZwanBxTDZFWnRpbkVR?=
 =?utf-8?B?YWYzL05kd01aNDEyekJka0RFUmxZbXd1YmlkYnN0ZjRQL0I0VURvNlJvdlZp?=
 =?utf-8?B?OXk0Qm0yZm1wYnIrZEdyMWZDajhIc1FpRENZOEYrb1dNWVQ3WmkyZk0yMWgy?=
 =?utf-8?B?UVRicGpiV1Z4Wk8ydU9zdkUvRW5BN3pzQWYxa2FuQXE3Z3JlS3BudzBacWFX?=
 =?utf-8?B?Qnc0S3ZNWm9Ja09Rb1VEMGRWN3R1dEZ3WnZMSk9yb1lHSnlyNkV4V21zWUt6?=
 =?utf-8?B?cUdvY3dNS2V3d2VPbWYwSXhxQk9yVmxnbmpmZHFJVkp2NjJEd3BGS1NrYk0y?=
 =?utf-8?B?WVJqc0JQY2Y1NUNmbURnenlQTm9HejdsYVBEUUFydTRtcWptdG5YRDI2K0xY?=
 =?utf-8?B?ZGQvUGplT1c5MDFZUm5xNHlHa2J6aWh4TnpVeVV6bDdSd01zamxnNmJEeWNm?=
 =?utf-8?B?eXQzK3VpU01UeURJcWxxTHkwWHZhNE1QOEJCN2FIQUdWaTI0dmh5LzgzMDU5?=
 =?utf-8?B?d0QrYkdFcXdkQ1BQcjRIVVlwZVVyVUZrK2dpemtkRDk3S3RpTlQzOFhmYlpF?=
 =?utf-8?Q?mrSAb5WsmbaIvBsDdd5/r9AMN96YXywhxbav5xP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98234e12-432f-4282-b9dd-08d9513935bf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 20:00:40.7424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gqg/+72cQwzl2xj875IvNJZF+BasmEKD3eY9sf1ug3M/WCVkV0TVLYJVpDFVx+ZO1j9DpPw+hJgd/TlkIgEdf4ga54/Z00m59Qf3REsR70A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5620
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



On 7/27/2021 8:12 AM, Michal Wajdeczko wrote:
> 
> 
> On 26.07.2021 21:07, Vinay Belgaumkar wrote:
>> Add methods for interacting with GuC for enabling SLPC. Enable
>> SLPC after GuC submission has been established. GuC load will
>> fail if SLPC cannot be successfully initialized. Add various
>> helper methods to set/unset the parameters for SLPC. They can
>> be set using H2G calls or directly setting bits in the shared
>> data structure.
>>
>> v2: Address several review comments, add new helpers for
>> decoding the SLPC min/max frequencies. Use masks instead of hardcoded
>> constants. (Michal W)
>>
>> v3: Split global_state_to_string function, and check for positive
>> non-zero return value from intel_guc_send() (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 237 ++++++++++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |   2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   8 +
>>   3 files changed, 247 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index bae4e33db0f8..f5808d2acbca 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -45,6 +45,40 @@ void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc)
>>   	guc->slpc_selected = __guc_slpc_selected(guc);
>>   }
>>   
>> +static void slpc_mem_set_param(struct slpc_shared_data *data,
>> +				u32 id, u32 value)
>> +{
>> +	GEM_BUG_ON(id >= SLPC_MAX_OVERRIDE_PARAMETERS);
>> +	/*
>> +	 * When the flag bit is set, corresponding value will be read
>> +	 * and applied by slpc.
> 
> s/slpc/SLPC
ok.

> 
>> +	 */
>> +	data->override_params.bits[id >> 5] |= (1 << (id % 32));
>> +	data->override_params.values[id] = value;
>> +}
>> +
>> +static void slpc_mem_set_enabled(struct slpc_shared_data *data,
>> +				u8 enable_id, u8 disable_id)
>> +{
>> +	/*
>> +	 * Enabling a param involves setting the enable_id
>> +	 * to 1 and disable_id to 0.
>> +	 */
>> +	slpc_mem_set_param(data, enable_id, 1);
>> +	slpc_mem_set_param(data, disable_id, 0);
>> +}
>> +
>> +static void slpc_mem_set_disabled(struct slpc_shared_data *data,
>> +				u8 enable_id, u8 disable_id)
>> +{
>> +	/*
>> +	 * Disabling a param involves setting the enable_id
>> +	 * to 0 and disable_id to 1.
>> +	 */
>> +	slpc_mem_set_param(data, disable_id, 1);
>> +	slpc_mem_set_param(data, enable_id, 0);
>> +}
>> +
>>   static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>>   {
>>   	struct intel_guc *guc = slpc_to_guc(slpc);
>> @@ -63,6 +97,129 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>>   	return err;
>>   }
>>   
>> +static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>> +{
>> +	struct slpc_shared_data *data;
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	drm_clflush_virt_range(slpc->vaddr, sizeof(u32));
>> +	data = slpc->vaddr;
>> +
>> +	return data->header.global_state;
>> +}
>> +
>> +static bool slpc_is_running(struct intel_guc_slpc *slpc)
>> +{
>> +	return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
> 
> extra ( ) not needed

ok.

> 
>> +}
>> +
>> +static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
>> +{
>> +	u32 request[] = {
>> +		INTEL_GUC_ACTION_SLPC_REQUEST,
>> + 		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
>> +		offset,
>> +		0,
>> +	};
>> +	int ret;
>> +
>> +	ret = intel_guc_send(guc, request, ARRAY_SIZE(request));
>> +
>> +	return ret > 0 ? -EPROTO : ret;
>> +}
>> +
>> +static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	u32 shared_data_gtt_offset = intel_guc_ggtt_offset(guc, slpc->vma);
> 
> just "offset" ? or maybe pass directly in call below ?

ok.

> 
>> +	int ret;
>> +
>> +	ret = guc_action_slpc_query(guc, shared_data_gtt_offset);
>> +	if (ret)
>> +		drm_err(&i915->drm, "Query task state data returned (%pe)\n",
> 
> "Failed to query task state (%pe)\n" ?

ok.
> 
>> +				ERR_PTR(ret));
>> +
>> +	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
>> +
>> +	return ret;
>> +}
>> +
>> +static const char *slpc_global_state_to_string(enum slpc_global_state state)
>> +{
>> +	const char *str = NULL;
>> +
>> +	switch (state) {
>> +	case SLPC_GLOBAL_STATE_NOT_RUNNING:
>> +		str = "not running";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_INITIALIZING:
>> +		str = "initializing";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_RESETTING:
>> +		str = "resetting";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_RUNNING:
>> +		str = "running";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
>> +		str = "shutting down";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_ERROR:
>> +		str = "error";
>> +		break;
>> +	default:
>> +		str = "unknown";
> 
> nit: you can do early returns to simplify the code
ok.

> 
>> +		break;
>> +	}
>> +
>> +	return str;
>> +}
>> +
>> +static const char *slpc_get_state_string(struct intel_guc_slpc *slpc)
>> +{
>> +	return slpc_global_state_to_string(slpc_get_state(slpc));
>> +}
>> +
>> +static int guc_action_slpc_reset(struct intel_guc *guc, u32 offset)
>> +{
>> +	u32 request[] = {
>> +		INTEL_GUC_ACTION_SLPC_REQUEST,
>> +		SLPC_EVENT(SLPC_EVENT_RESET, 2),
>> +		offset,
>> +		0,
>> +	};
>> +	int ret;
>> +
>> +	ret = intel_guc_send(guc, request, ARRAY_SIZE(request));
>> +
>> +	return ret > 0 ? -EPROTO : ret;
>> +}
>> +
>> +static int slpc_reset(struct intel_guc_slpc *slpc)
>> +{
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
>> +	int ret;
>> +
>> +	ret = guc_action_slpc_reset(guc, offset);
>> +
>> +	if (unlikely(ret < 0))
>> +		return ret;
> 
> no SLPC error here ?

added.

> 
>> +
>> +	if (!ret) {
>> +		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
>> +			drm_err(&i915->drm, "SLPC not enabled! State = %s\n",
>> +				  slpc_get_state_string(slpc));
>> +			return -EIO;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   {
>>   	GEM_BUG_ON(slpc->vma);
>> @@ -70,6 +227,86 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   	return slpc_shared_data_init(slpc);
>>   }
>>   
>> +static u32 slpc_decode_min_freq(struct intel_guc_slpc *slpc)
>> +{
>> +	struct slpc_shared_data *data = slpc->vaddr;
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	return	DIV_ROUND_CLOSEST(
>> +		REG_FIELD_GET(SLPC_MIN_UNSLICE_FREQ_MASK,
>> +			data->task_state_data.freq) *
>> +		GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>> +}
>> +
>> +static u32 slpc_decode_max_freq(struct intel_guc_slpc *slpc)
>> +{
>> +	struct slpc_shared_data *data = slpc->vaddr;
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	return	DIV_ROUND_CLOSEST(
>> +		REG_FIELD_GET(SLPC_MAX_UNSLICE_FREQ_MASK,
>> +			data->task_state_data.freq) *
>> +		GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>> +}
>> +
>> +/*
>> + * intel_guc_slpc_enable() - Start SLPC
>> + * @slpc: pointer to intel_guc_slpc.
>> + *
>> + * SLPC is enabled by setting up the shared data structure and
>> + * sending reset event to GuC SLPC. Initial data is setup in
>> + * intel_guc_slpc_init. Here we send the reset event. We do
>> + * not currently need a slpc_disable since this is taken care
>> + * of automatically when a reset/suspend occurs and the GuC
>> + * CTB is destroyed.
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>> +{
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	struct slpc_shared_data *data;
>> +	int ret;
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	memset(slpc->vaddr, 0, sizeof(struct slpc_shared_data));
>> +
>> +	data = slpc->vaddr;
> 
> vaddr is "struct slpc_shared_data *"
> do you really need "data" local var?
> 
>> +	data->header.size = sizeof(struct slpc_shared_data);
>> +
>> +	/* Enable only GTPERF task, disable others */
>> +	slpc_mem_set_enabled(data, SLPC_PARAM_TASK_ENABLE_GTPERF,
>> +				SLPC_PARAM_TASK_DISABLE_GTPERF);
>> +
>> +	slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_BALANCER,
>> +				SLPC_PARAM_TASK_DISABLE_BALANCER);
>> +
>> +	slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_DCC,
>> +				SLPC_PARAM_TASK_DISABLE_DCC);
> 
> btw, all this "data" related calls are good candidate for helper like
> 
> static void slpc_shared_data_reset(struct slpc_shared_data *data)
> { ... }

ok.

> 
>> +
>> +	ret = slpc_reset(slpc);
>> +	if (unlikely(ret < 0)) {
>> +		drm_err(&i915->drm, "SLPC Reset event returned (%pe)\n",
>> +				ERR_PTR(ret));
>> +		return ret;
>> +	}
>> +
>> +	drm_info(&i915->drm, "GuC SLPC: enabled\n");
>> +
>> +	slpc_query_task_state(slpc);
> 
> as this still may fail, maybe it should be before we claim success and
> "SLPC: enabled" ?

ok. Added error check for this as well.

> 
>> +
>> +	/* min and max frequency limits being used by SLPC */
>> +	drm_info(&i915->drm, "SLPC min freq: %u Mhz, max is %u Mhz\n",
>> +			slpc_decode_min_freq(slpc),
>> +			slpc_decode_max_freq(slpc));
>> +
>> +
>> +	return 0;
>> +}
>> +
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>>   {
>>   	if (!slpc->vma)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> index edcf4c05bd9f..f14f81821a51 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _INTEL_GUC_SLPC_TYPES_H_
>>   #define _INTEL_GUC_SLPC_TYPES_H_
>>   
>> +#define SLPC_RESET_TIMEOUT_MS 5
>> +
>>   struct intel_guc_slpc {
>>   	struct i915_vma *vma;
>>   	struct slpc_shared_data *vaddr;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index e6bd9406c7b2..b98c14f8c229 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -506,6 +506,12 @@ static int __uc_init_hw(struct intel_uc *uc)
>>   		 "submission",
>>   		 enableddisabled(intel_uc_uses_guc_submission(uc)));
>>   
>> +	if (intel_uc_uses_guc_slpc(uc)) {
>> +		ret = intel_guc_slpc_enable(&guc->slpc);
>> +		if (ret)
>> +			goto err_submission;
> 
> hmm, as this may fail, above success message
> 	"GuC submission enabled"
> will be void
> 
> what you likely need is to split "slpc_enable" with error messages only
> that is called before we start reporting successes, and then
> "slpc_status" part with all drm_info() that could be placed here.

Why? It is totally possible that GuC submission works just fine, but 
SLPC enable fails. In this case, even though we printed "submission 
enabled", we can still fail later with slpc errors.

Thanks,
Vinay.
> 
> Michal
> 
>> +	}
>> +
>>   	if (intel_uc_uses_huc(uc)) {
>>   		drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
>>   			 intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>> @@ -520,6 +526,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>>   	/*
>>   	 * We've failed to load the firmware :(
>>   	 */
>> +err_submission:
>> +	intel_guc_submission_disable(guc);
>>   err_log_capture:
>>   	__uc_capture_load_err_log(uc);
>>   err_out:
>>
