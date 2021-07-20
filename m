Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741B3D04EE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 01:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247F56E13C;
	Tue, 20 Jul 2021 23:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656F86E0AC;
 Tue, 20 Jul 2021 23:00:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="198611882"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="198611882"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 16:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="632471193"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga005.jf.intel.com with ESMTP; 20 Jul 2021 16:00:31 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 16:00:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 16:00:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 16:00:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tf9jpuqRp8IHVtnmmwuX2f0Sy5ua+1FiwkUVHo4eFffeS0kCB1GFtkNTMWd3SF3tT6ndYl/M9fV0aROpVHlNqefqWXFlO2+XRCWFDUYcI+WsURuOU0WmYJVgDtw6XHBFUzKbCMiNVyoZ4gA6qqNINs/do7i2s7ELLwSAGC4Crf5BBQ5IOyjibwgBpuWgqXeU1FLC/AqGUvHygS1TsJpQpqvXS1KvXOkkRtlrvK36Y/JEDQmtH6YdK7vUb+v6DI/aGS02iTSoLYGDMVZq/awOq+e94Gi8kSE/Fe2aM9EuK6Gn61EjZSdXgk2nDuGy/oJKmFhrQ0BKadBsShgCHaatpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrrfJT9VMOxszhGgtt/eloVSyIcknREJljgwGi5AxtU=;
 b=lA+RykH0qKMghmvtSZnaZ4S/Y63X1mh2zis66hk+8F0zBLtMhpEsN24lKkDA3L0c2zTN6VBcBd5I4dXWR6NaPP6a/lUZRSoYawJet2kwSAPo6HU3jvAqI6IzmRTufJ9MCIflIdGn7voe+/+5wTuPQZUGeAuuijWr6osGPqONd+Yz3tG5x3xlyqXf6PG8Shmb5qBRe4lwhd73oGlc2IJL+pWwsixpOpTQlo7bo6p9n/k02yIRCjWp3QoSXJHjH6p4MT8mws2XGrvZzijgfoE0FKC54o9r15PTNYvG8vGyFJnHzZINyRhPntt1iSAzQSDTbrBmRz0vMh2YTg1o4UYr5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrrfJT9VMOxszhGgtt/eloVSyIcknREJljgwGi5AxtU=;
 b=lVK42jyHcCm/v0td08cNAHhXpW4vXYIdIjLjOH9IyxnSrRCGe3xMq+gDsHOFTHVbiLndoPaJjmriXE3+JmM5oGt1iDerUy191ykAQq62ng+mTi7+idHjcLyOYdlOtaK8BAuZ223WETu51ctiYkbMstlURLAXmX3cYqJf4oVWM+8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5569.namprd11.prod.outlook.com (2603:10b6:303:139::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 23:00:25 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%8]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 23:00:25 +0000
Subject: Re: [PATCH 10/16] drm/i915/guc/slpc: Add debugfs for slpc info
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-11-vinay.belgaumkar@intel.com>
 <181d8958-362d-5c00-9e0b-858275272f8f@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <d7e4632e-7941-a18e-308a-75f547af4f8b@intel.com>
Date: Tue, 20 Jul 2021 16:00:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <181d8958-362d-5c00-9e0b-858275272f8f@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 SJ0PR03CA0183.namprd03.prod.outlook.com (2603:10b6:a03:2ef::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 23:00:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2abd1b2f-b2ff-4251-092a-08d94bd228db
X-MS-TrafficTypeDiagnostic: CO6PR11MB5569:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB556945C68F6E639779193CAC85E29@CO6PR11MB5569.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +vLy1H7c9Wzi663V8oMMCloefD7q7vrA6n+I9NdMuR0svQE0DYRCgrP7NgtMy7I/4o36PM+wKgBqtLs61rGHo2Jqp2WzSv15niKOt5E+Xm6/HejSzY1zH3godEZv3jne9WlJ0fh/wOEvlAactl2VP3r6cmT/Hvmp4HOpEo8mtYP3c0sA9ehRlM03YFfUPpyu8pXJ7I3L4ZwjoM+VE7FU4kFeQCNqJHTv/p3aEK5eQn4HonW7uZnmK3a6N/SShV658LIUob3TTK+auBULneeyeaVtHYpyV8lXalWbPJoY4eEBLnP5quzKc+sOdbnY6gnYKJIzbfsjnP7WktxHW9Si+kcUESeq0dD9VPGLb8nw11kRImUQNMBS+x8lcbteXpBCyyHbFVRm9nP9MnDow95+M1qDkRI5XeP3XBXc7qdgJip6PjVivIzW09QjcLoBynOYnyCDNWY8wv7hS3aJ35wsiPwoFK+tBzNUx5XjZcARVSs8ENzy/H5RmsKXsKsksPwI1X2WAa9drEOGkvUFTD/AEw+VlLux1wneomyt8JGwPq7APxxkVG084+keZHG4vu4nplxONV1DYIClVzaqx/Q7riZIFtqAJZ7k8vDFqKGmGgQ2PDddiWKVql0i7jZg4AglUhB/BIKQJut01bRYiqXnDi7cDfYFEcZlS+OFaEA0TnkSBvxHNmz0VULGvK3WnoivKRlWPBtCFIRiXqC9e1qDZtlIeAde9jac8LKwNelnctU93J2g4Ys3AlisIyTsBGA3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(316002)(66946007)(38100700002)(86362001)(26005)(16576012)(83380400001)(53546011)(66556008)(66476007)(956004)(2616005)(8676002)(186003)(478600001)(5660300002)(6486002)(450100002)(8936002)(36756003)(4326008)(31696002)(31686004)(2906002)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDNuUm1SVHpBMW05eXMwNGFtSGRsNTBWZWRJK1RnUGIvV205Skc3NlI5d0ZC?=
 =?utf-8?B?dFlYRGZ3TVlOS3phRVROS09tVTRmSUN6UTJvMEFDWEtFNmVaZWFEOW1NQ1dF?=
 =?utf-8?B?TXJkQldReXJobWRKZyt4Skw2c2FTcUYxa0dPRG1qTk4vU1BLQ3FxSk42TXNM?=
 =?utf-8?B?bTlVMDNYZjRuS0ZjbE1HSzNodGViL2tsVTJZSjd1N0djL080TDY2c2pTOU9L?=
 =?utf-8?B?anpHT3c2U3NQN3g4ZFdveUFGbDNrb0JTeDVnb29RTjYrbmNJbi9ucW4wbE1n?=
 =?utf-8?B?Q2N1dUQwSC9SOVJwemp1c0dwdGMrWmVRWUdWMDFlTUI3RC9oZ1ZJOVhSK2JB?=
 =?utf-8?B?L2lsSi9ETEJCOGZhVnhsZHhmKy9HSjJSZmU5ZTlra1dXNkRxNXZQUWRiV04w?=
 =?utf-8?B?ZlpFNW9IbHExL0FYTW5ZU3RQalpicFVjK1ZBd3h0L1N5SnlNd0pFVjBURXBP?=
 =?utf-8?B?RUYydUNDS3pXc2VhNkQvMlh2bTh1b1o2OVJGSFRHejRLTGMrTHMwK2VEampD?=
 =?utf-8?B?Y2VrOXB5L0tna1B6OGZxU3BRNk52NkJnQ3hjajRoSUU1MTRzbUxrVUVTTFdG?=
 =?utf-8?B?bmtEOUZsb1J4S2JNVVl3OHY1TkYxRURJT3gvSmVQdnc2RWJ0NDVOZ2NWd201?=
 =?utf-8?B?eXZLYmd2OFV4cFY1dVFwdzRCYm5kWGE0WG5EV2tCN1lrbDlHaTIxZVNFZWdC?=
 =?utf-8?B?dnNzMkpkVm44ZnVyTXNoRm1OdFpYQStqUjdiaFo0K29DR3J3LzNpUFJZVkhP?=
 =?utf-8?B?QitmSVNKRDhtOTd4a1JwRjlWZmp0QlZGN3pQc1BtNzVrSnRYdmNlNVIva2U4?=
 =?utf-8?B?QllsbG9ETyt6Sm94SXp5R0s4NE9TWlRGOG1ZcFI5ZFU1QjFKcXdMeVFuaGFX?=
 =?utf-8?B?RXRhc0RxUDZVRlZleEFMVzFoaElTK0V5d0NtTWJTdUllV3R3NnVNYUd5ZlVz?=
 =?utf-8?B?V3poYTYzZ1FEM3hrdkNxWHNrZXZRZ3lUdHZycnVBNlNmRXRKRFR6UUwyZzFK?=
 =?utf-8?B?TzhyQnZtMlVpMnFjQkRHenBZMldIU2lWaUw1RjA3Qy91UFdtWllZejlDcXhP?=
 =?utf-8?B?UFZoZHkrMHVNL01nT3pLV3JHVi8yWkl5b0JMMmZSb0hKa09MVWdRRFV2c0lj?=
 =?utf-8?B?d2wyYVlRdHQ5Y1Y3ZytGSnc1b00ra05DblJKUUZsRUhqL0QwR2ZFZkM2SlI1?=
 =?utf-8?B?NDNPUE9GZ09mMmR1MGswQWsraFc1Q3dKbWtmcE9qYkVacklkS29RWUs2OVY0?=
 =?utf-8?B?Z0pDQ2ROY0ZCZHVOWjRuS1VpTXQzOXQwOXRkd3ZlUTZpUTJsbTFEeFExT21C?=
 =?utf-8?B?Uno4MHdLaDB4cUo2TDY3cGVvb2Vyc3YyditSZ2h5OWRwQUV6RjdvWTlOSWlJ?=
 =?utf-8?B?OHJvMC9yMnlBOWxVMkRlUHRFcWxMZkhWVjlWMG9BZFlTTWxpR0ppNDlHek54?=
 =?utf-8?B?US9lVlROYmIrSVlaZVpiYk9KaXB4WW9RQVRGUW1FN0FtRWkwaFp2N3lNRHZh?=
 =?utf-8?B?M2QvbU9DZVcvd3d1c2tRZXh3Y1RjTlMwNUx1Q2U3MFdYaitwdFVrVDU3UWg0?=
 =?utf-8?B?VHR4T3NBMDMxbmp1VUlKdGFia3V0eDRaYjFHYk5LZzVEQm1lNzc4UUp6SmFt?=
 =?utf-8?B?TXJ2WGxtRXVNdU9hZnRTUUFqMitKQ1ROVXN0MmMxTm0wT2VTTVNpOWJmL21k?=
 =?utf-8?B?MnY5SXZWSkQvTkUwelZPS0FiRERheGdsaVk1dmJ3d203UEhOV2NuOEdOZkJw?=
 =?utf-8?Q?RV4QuMQGs5SliOLC2aANsel1gMcEXdm/jxAxDi/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abd1b2f-b2ff-4251-092a-08d94bd228db
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 23:00:25.1260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mk3Ad0R9/TQtC8rkW1fqIg5Y1ddRLcALnMbiaLWeuRHHAPYTiA94YFDb8Fd3FoY/PZ6MM59YVhNs9xGSURBH1FoWIJCmmKIhCZ9U1JVmvy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5569
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



On 7/10/2021 11:08 AM, Michal Wajdeczko wrote:
> 
> 
> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
>> This prints out relevant SLPC info from the SLPC shared structure.
>>
>> We will send a h2g message which forces SLPC to update the
>> shared data structure with latest information before reading it.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    | 16 ++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 53 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  3 ++
>>   3 files changed, 72 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
>> index 9a03ff56e654..bef749e54601 100644
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
>> @@ -50,11 +51,26 @@ static int guc_registered_contexts_show(struct seq_file *m, void *data)
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
>> +
> 
> other entries don't have empty line here

Removed.

> 
>> +DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_slpc_info);
>> +
>>   void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
>>   {
>>   	static const struct debugfs_gt_file files[] = {
>>   		{ "guc_info", &guc_info_fops, NULL },
>>   		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
>> +		{ "guc_slpc_info", &guc_slpc_info_fops, NULL},
> 
> IIRC last field is "eval" where maybe you could add your own to check if
> intel_guc_slpc_is_used() to avoid exposing this info if N/A
ok, added.

> 
>>   	};
>>   
>>   	if (!intel_guc_is_supported(guc))
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 98a283d31734..d179ba14ece6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -432,6 +432,59 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   	return 0;
>>   }
>>   
>> +int intel_guc_slpc_info(struct intel_guc_slpc *slpc, struct drm_printer *p)
>> +{
>> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
>> +	struct slpc_shared_data *data;
>> +	struct slpc_platform_info *platform_info;
>> +	struct slpc_task_state_data *task_state_data;
>> +	intel_wakeref_t wakeref;
>> +	int ret = 0;
>> +
>> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>> +
>> +	if (slpc_read_task_state(slpc)) {
>> +		ret = -EIO;
>> +		goto done;
>> +	}
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));
> 
> likely will go away if integrated into slpc_read_task_state

yup.

> 
>> +	data = slpc->vaddr;
>> +
>> +	platform_info = &data->platform_info;
> 
> is this used ?

no, removed.
> 
>> +	task_state_data = &data->task_state_data;
> 
> as it looks that you treat these sections separately, then maybe it
> would be cleaner to have:
> 
> static void print_global_data(*global_data, *p) {}
> static void print_platform_info(*platform_info, *p) {}
> static void print_task_state_data(*task_state_data, *p) {}

If we make these indivudal functions, we'll need to duplicate a lot
of code - like getting wakeref and reading task state. Better to keep
it all in one function instead. There is no other use case to print them
except for debugfs.

> 
>> +
>> +	drm_printf(p, "SLPC state: %s\n", slpc_state_stringify(data->global_state));
>> +	drm_printf(p, "\tgtperf task active: %d\n",
>> +			task_state_data->gtperf_task_active);
>> +	drm_printf(p, "\tdcc task active: %d\n",
>> +				task_state_data->dcc_task_active);
>> +	drm_printf(p, "\tin dcc: %d\n",
>> +				task_state_data->in_dcc);
>> +	drm_printf(p, "\tfreq switch active: %d\n",
>> +				task_state_data->freq_switch_active);
>> +	drm_printf(p, "\tibc enabled: %d\n",
>> +				task_state_data->ibc_enabled);
>> +	drm_printf(p, "\tibc active: %d\n",
>> +				task_state_data->ibc_active);
>> +	drm_printf(p, "\tpg1 enabled: %s\n",
>> +				yesno(task_state_data->pg1_enabled));
>> +	drm_printf(p, "\tpg1 active: %s\n",
>> +				yesno(task_state_data->pg1_active));
>> +	drm_printf(p, "\tmax freq: %dMHz\n",
>> +				DIV_ROUND_CLOSEST(data->task_state_data.max_unslice_freq *
>> +				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER));
>> +	drm_printf(p, "\tmin freq: %dMHz\n",
>> +				DIV_ROUND_CLOSEST(data->task_state_data.min_unslice_freq *
>> +				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER));
> 
> you defined task_state_data but in above 2 you're accessing it from data

Fixed.

Thanks,
Vinay.

> 
> Michal
> 
>> +
>> +done:
>> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>> +	return ret;
>> +}
>> +
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>>   {
>>   	if (!slpc->vma)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index 2cb830cdacb5..cd12c5f19f4b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -10,6 +10,8 @@
>>   #include <linux/mutex.h>
>>   #include "intel_guc_slpc_fwif.h"
>>   
>> +struct drm_printer;
>> +
>>   struct intel_guc_slpc {
>>   	/*Protects access to vma and SLPC actions */
>>   	struct i915_vma *vma;
>> @@ -38,5 +40,6 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>>   int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>>   int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
>>   int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
>> +int intel_guc_slpc_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
>>   
>>   #endif
>>
