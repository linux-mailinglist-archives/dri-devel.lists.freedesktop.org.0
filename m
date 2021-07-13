Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03DB3C7A0C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 01:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD616E0AB;
	Tue, 13 Jul 2021 23:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6BE6E0AB;
 Tue, 13 Jul 2021 23:22:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="190635215"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="190635215"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 16:22:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="562257147"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga004.jf.intel.com with ESMTP; 13 Jul 2021 16:22:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 13 Jul 2021 16:22:09 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 13 Jul 2021 16:22:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Tue, 13 Jul 2021 16:22:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 13 Jul 2021 16:22:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i69uOhnT3MPmlY68cvVVYdqMdtUgjTAunw2OnM02GjKTdXyCMUSHk0asj2eKHQZRrdYQbVHHyDvUJYtRa8hczWAw5diFoc184vi+3u/lWC3ggf36y5BCtAx3CgJVyjojTIThFCNAFVI8UiFouefMlCgTR99Dlfn5v97oQ9uGvVzhdu8luwB9GEc0/lAEz7FdIaXUwO8kI0hvJqdvwC9LAnUsOjFEcgf6riahWksqYSpyCgRSf88O8ZDgv7UM+D7agj3GWy3sTuSFf3242wOO0TkqxoeVxFWlWcyPpOFb41mIiFAHptm8IzP+cH7AhL251Kc/sKgTeKl535/YEXimMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s9Ahs7DSHEW//cF/zGm7FqfrCv1IJ8nmQfvIPdDwlA=;
 b=hVwbSY4I60baOJ4WQ/LKGRQ3oIg9JOec6CKAqX8+R03vWyAbTLtnAnL/OgiP6iNhrcmuCmrGHMkls7o7AhQPa9X9fB67AuIoCq8lxh8UGBJxtDhnOd7JujKORMQGVsnieElGR/RVHI5OuyXrz1NMT9teJnrcW4aR+v4WVdEdPlyWAlfVUw6scCG8u2mGnBmg1lXsidb/5HsjRf7oKWmmHTCNSJYMuY4YV30SyxM+ebfq6yR77sUFareeExuv+HMgvxvi07OnTeseRyb/ze7oBa9a7xIivOxM6rkw8yhSMcAaXKsXFB/FzOTv57Ro82EbCIxfq0ypwl4k57xz64ormQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s9Ahs7DSHEW//cF/zGm7FqfrCv1IJ8nmQfvIPdDwlA=;
 b=Tkq/umiEhAS16o9KHjAbhN8pMDzh/qOg6ar3L1v5g/6GlLyWaqcSkTQkMN4kV5/XvRERmTZhgRmeV0U7Pts8fNyYXcs/Gth+3wLQVv3rzkIrIKUBRYwVR/XqkeqJNHZUPO2W2lPuyiMqeTJdtoeT5jK3uX3Jk+p+pratDFOizhE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5618.namprd11.prod.outlook.com (2603:10b6:303:13f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 13 Jul
 2021 23:22:06 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 23:22:06 +0000
Subject: Re: [PATCH 05/16] drm/i915/guc/slpc: Adding slpc communication
 interfaces
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-6-vinay.belgaumkar@intel.com>
 <4b6e863b-a4c4-c317-5383-7b623d659f16@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <e5698109-bed5-e9ce-006c-3c49f72427e6@intel.com>
Date: Tue, 13 Jul 2021 16:22:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <4b6e863b-a4c4-c317-5383-7b623d659f16@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR19CA0023.namprd19.prod.outlook.com
 (2603:10b6:300:d4::33) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MWHPR19CA0023.namprd19.prod.outlook.com (2603:10b6:300:d4::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 13 Jul 2021 23:22:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 317cdae5-29d4-41b9-06b0-08d9465507d1
X-MS-TrafficTypeDiagnostic: CO6PR11MB5618:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5618C9C9E2DF8396548DC3B685149@CO6PR11MB5618.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mR28zpMJA4ONDhfalvJTBiMWt19VBAcnGqoe7TUU9VemCkOgJZNtJTpvpnwhSwmEArOfsgO/d0xLa7ylAMLDDJ6lVE6XTjAp071mE1IBiL3CZcJOGCKnnK1dQTz3iv1Wvfrs/dcwUTSnufiBm1R7QmRCqME1elaMBUQLyNOUD27SXZt66pQsDBBkdyuU+wjfqIDj6NxFNiXNZsKn+8UL/x2QphyKG14uGCm072J8rc4VMe/oaVD35Q3vGjULENvORtvwYi3Ikb9NRRdyDIhAM3RxYuMC+4DyCNSczJQvBJD3KImfWUoj5R+ecrEJAEi5n3c9/z3HHWxWlqKj4sDYCvy8sabIubUkemd15vH7c56skS2IDiQjTZ0B7oHuVvNwrY+A5kogbf/vUdJnuIxct+FV9Y3kL5c5w7FBSwcX23Q6NsEsOvefTdIWCYucdwzm+FuPl+k9aPT81dPsZfZvUghIO10AlPAcjfgJUHieqEM8nx9nCv8tbQ+JNSApDUJOlDirsUAOUs5eNhG+nsmzlI13JmCrCfqtAINKVZZBv0ZEaK8O98Cm8j6fVxAwYSrq4ckUwyRNSq/f0B7yMhniZxfmabP34rOYWkvOn3ORjiB4Iw4691hxf6qwbb3dNfdWBbBNH+LQaWv/J0IsJmntIJRAGC+3OFFiZoVVGte6J1CEUA8DCWREHPLCf4Upz2r/7Fa1h4Yl0snTVbeeCGlV973lIMvQ9iK8+03ptqM8tJ1n5pUx6wv7iV57Z//FlEPv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(450100002)(186003)(4326008)(6486002)(8936002)(31686004)(2906002)(38100700002)(8676002)(31696002)(53546011)(30864003)(26005)(86362001)(107886003)(5660300002)(66946007)(83380400001)(66476007)(36756003)(66556008)(16576012)(316002)(2616005)(956004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEhZaWQ4dDE5bCt4YS9ZUGF5aWJOQ2d4cklJUVF6dXlPWjVKSEttUkdxVjRT?=
 =?utf-8?B?SDNycm94OFY0L2psajU3bWFlVUFxWkRpV01UTUdwTVI5SXFJUk5sTXFoRVNa?=
 =?utf-8?B?eisySDlQcFI1YVlobStMM056Y1NDSzQwT0JuenF0YWVqK2N0aDRyb2Z0MHRL?=
 =?utf-8?B?NEF6azM1WThWcXp6NHpGcndHK0JvVjB1Q0FWQ1JsdUR4R3pRb1BtRHVWZ21E?=
 =?utf-8?B?UmJVcnFoSmhqTi94ZWFsNEVCWmhYODB0TnJMZ1RsRm1mazFZQ2E3ZkFqR1lC?=
 =?utf-8?B?bXhaWTRCYkVjSW10Z1U5U3ZOeVRSdGZOeFEwVSs3LzJRUlJET1VuNjZMSS9M?=
 =?utf-8?B?M2FnOE5tYXVKTnFtcVlKTWk1dmdtbXNEdWZrMHRMVnNMTndoK0owMFR1RkFv?=
 =?utf-8?B?NTRCcjVMeXZ1blRVVDBCeUR0T0dJTmJMb0Z6QS9yTjNxS1paektTWjBkeUxz?=
 =?utf-8?B?Zk9YSjR3Ny95SlhVL01wamVZUEZIRGZpay9TK1pqUWV0VEtRNWpqT3RqQVl2?=
 =?utf-8?B?SmRueEhLKzBvaHBvNHRTVFVPaUNYRjkrU2pxUmVqeWFSejhCZ0c0YzJPZVhl?=
 =?utf-8?B?Y2hQRnFqYUF6aXZ1MWR6MzFBd1MrTktkZG5vL3RhMGtuV0c3WTY4VkN5NzVw?=
 =?utf-8?B?QnVLRkE0SWw4VGRTT3U0d1J3eFRIZWlnaUlpNVo5Vmd1UGxTMkJkbUFCVGp0?=
 =?utf-8?B?THNKR1R2bWdaeUhjNzlUMVdCaFlJRVJHeTdrbDhkcTNaUElsc29yOWtzSzVp?=
 =?utf-8?B?Rkx2MFBxRVV5ZmNCaTlVSGJsWWN3U21nS2dXZktWd3UyQjE3cFl3VlN5U2dS?=
 =?utf-8?B?aGtVUW1NRWNGeFIxZ3pkb0haakhwemtOR1p0RUlMcndyTkR5VEYwcldlZHcz?=
 =?utf-8?B?cmZtRHQzTnd1L2xGSWJvYkE1L2I4ME5kbnZkRzNERzYzT2JVUWhuRmpEUzVK?=
 =?utf-8?B?TTd6WitDb3Y3S1N2Q0lidUJ5TGpNb1p5QWpWaVMxUlZJZUJOblJJeGgvZlVu?=
 =?utf-8?B?Y243c3VSdTVxZmtjakhEVHRKbStBWVNpM1ZWbURXVHhuOTlCb0JCSjd1Q0ZD?=
 =?utf-8?B?NU82SUxuQk1KbUFkSUViaEVtQmxJZVE1SHpScCtmNmtlM3NESm85V1ZsUEhy?=
 =?utf-8?B?ODZjUXdIbnNrclh0ZHE3dEZiNHI1SlVXRExJME92czlVNU94c0RwMFhJRWxn?=
 =?utf-8?B?cDE3OEk0dmhoVWhNNy9odm5rQXpKNDRBYVVrdjg2YURNOWVaeEZFSlNjbENJ?=
 =?utf-8?B?NlBwWnFnbnU3Q3BSTjNlUmZvMVg2WEdzYjVLeWtRTVliNTdLL3RwRGxCMitP?=
 =?utf-8?B?bHZLSy9SR29JZ2tVMklkbEJ6TG5tS21ESWJYNnkrZksrOXZtVG5Xdm5FUkJx?=
 =?utf-8?B?YUJUcjZqSFBjVUQyMjhOdUdpUytyZUlGamlnS3ZERUQySE9TaWZTblhORllN?=
 =?utf-8?B?Z09jSm5rb2tKK0JRc21UY0VZbERQc1FQN3lsc0JHV3diL0IxdTJTUWozOXlE?=
 =?utf-8?B?b0p0a0d2YkRZOG1rQk1vb09pQUlXTGphVUttUC9vNWFraldCc0xsS1Bmbnhl?=
 =?utf-8?B?NmVnTUQvN1hBRHJyMlZka016WHZaYUkzRTNERXJ4aEl0RlZIeTY4ZHk0K204?=
 =?utf-8?B?dkhYOWt4K1BVRDFnSkloUk1wcjlKRmNpcjhTcEMwL1VGd0JXVmVMWlhRSFRJ?=
 =?utf-8?B?ZGJ3UkJSMEVxNkw2MGpVRUVXbit4ZkJrNTVZR2Q4N1JXMENaMW1vd0M2RGdo?=
 =?utf-8?Q?gDmS2dHBuR+FfvIkgBDQn+gQ6n9N4YM9ALdHZ/k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 317cdae5-29d4-41b9-06b0-08d9465507d1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 23:22:06.7785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdvSb98R+BsL7atbLTSFg6zghzGxL3QvS7JqucBbwznavVG7gkAJmoRJf5Y5J/PPLEarVwsBV59B7bTCt50PHZ5bQqFhbyNKqwKBeAnx92U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5618
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



On 7/10/2021 8:52 AM, Michal Wajdeczko wrote:
> 
> 
> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
>> Replicate the SLPC header file in GuC for the most part. There are
> 
> what you mean by "replicate" here?
> 
>> some SLPC mode based parameters which haven't been included since
>> we are not using them.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   4 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |   2 +
>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_fwif.h  | 255 ++++++++++++++++++
>>   4 files changed, 263 insertions(+)
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_fwif.h
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index b9a809f2d221..9d61b2d54de4 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -202,11 +202,15 @@ static u32 guc_ctl_debug_flags(struct intel_guc *guc)
>>   
>>   static u32 guc_ctl_feature_flags(struct intel_guc *guc)
>>   {
>> +	struct intel_gt *gt = guc_to_gt(guc);
>>   	u32 flags = 0;
>>   
>>   	if (!intel_guc_submission_is_used(guc))
>>   		flags |= GUC_CTL_DISABLE_SCHEDULER;
>>   
>> +	if (intel_uc_uses_guc_slpc(&gt->uc))
>> +		flags |= GUC_CTL_ENABLE_SLPC;
>> +
>>   	return flags;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> index 94bb1ca6f889..19e2504d7a36 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> @@ -114,6 +114,8 @@
>>   #define   GUC_ADS_ADDR_SHIFT		1
>>   #define   GUC_ADS_ADDR_MASK		(0xFFFFF << GUC_ADS_ADDR_SHIFT)
>>   
>> +#define GUC_CTL_ENABLE_SLPC            BIT(2)
> 
> this should be defined closer to GUC_CTL_FEATURE

done.

> 
>> +
>>   #define GUC_CTL_MAX_DWORDS		(SOFT_SCRATCH_COUNT - 2) /* [1..14] */
>>   
>>   /* Generic GT SysInfo data types */
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index 74fd86769163..98036459a1a3 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _INTEL_GUC_SLPC_H_
>>   #define _INTEL_GUC_SLPC_H_
>>   
>> +#include "intel_guc_slpc_fwif.h"
> 
> doesn't seem to be needed right now

Removed for this patch.
> 
>> +
>>   struct intel_guc_slpc {
>>   };
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_fwif.h
>> new file mode 100644
>> index 000000000000..2a5e71428374
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_fwif.h
> 
> I've started to move all pure ABI definitions to files in abi/ folder,
> leaving in guc_fwif.h only our next level helpers/wrappers.
> 
> Can you move these SLPC definition there too ? maybe as dedicated:
> 
> 	abi/guc_slpc_abi.h

done.

> 
>> @@ -0,0 +1,255 @@
>> +/*
>> + * SPDX-License-Identifier: MIT
> 
> use proper format
> 
>> + *
>> + * Copyright © 2020 Intel Corporation
> 
> 2021
> 
>> + */
>> +#ifndef _INTEL_GUC_SLPC_FWIF_H_
>> +#define _INTEL_GUC_SLPC_FWIF_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/* This file replicates the header in GuC code for handling SLPC related
>> + * data structures and sizes
>> + */
> 
> use proper format for multi-line comments:
> 
> 	/*
> 	 * blah blah
> 	 * blah blah
> 	 */

done.

> 
>> +
>> +/* SLPC exposes certain parameters for global configuration by the host.
>> + * These are referred to as override parameters, because in most cases
>> + * the host will not need to modify the default values used by SLPC.
>> + * SLPC remembers the default values which allows the host to easily restore
>> + * them by simply unsetting the override. The host can set or unset override
>> + * parameters during SLPC (re-)initialization using the SLPC Reset event.
>> + * The host can also set or unset override parameters on the fly using the
>> + * Parameter Set and Parameter Unset events
>> + */
>> +#define SLPC_MAX_OVERRIDE_PARAMETERS	256
>> +#define SLPC_OVERRIDE_BITFIELD_SIZE \
>> +		(SLPC_MAX_OVERRIDE_PARAMETERS / 32)
>> +
>> +#define SLPC_PAGE_SIZE_BYTES			4096
>> +#define SLPC_CACHELINE_SIZE_BYTES		64
>> +#define SLPC_SHARE_DATA_SIZE_BYTE_HEADER	SLPC_CACHELINE_SIZE_BYTES
>> +#define SLPC_SHARE_DATA_SIZE_BYTE_PLATFORM_INFO	SLPC_CACHELINE_SIZE_BYTES
>> +#define SLPC_SHARE_DATA_SIZE_BYTE_TASK_STATE	SLPC_CACHELINE_SIZE_BYTES
>> +#define SLPC_SHARE_DATA_MODE_DEFN_TABLE_SIZE	SLPC_PAGE_SIZE_BYTES
> 
> can you put some simply diagram that would describe this layout ?

done for the shared data struct.

> 
>> +
>> +#define SLPC_SHARE_DATA_SIZE_BYTE_MAX		(2 * SLPC_PAGE_SIZE_BYTES)
>> +
>> +/* Cacheline size aligned (Total size needed for
>> + * SLPM_KMD_MAX_OVERRIDE_PARAMETERS=256 is 1088 bytes)
>> + */
>> +#define SLPC_SHARE_DATA_SIZE_BYTE_PARAM		(((((SLPC_MAX_OVERRIDE_PARAMETERS * 4) \
>> +						+ ((SLPC_MAX_OVERRIDE_PARAMETERS / 32) * 4)) \
>> +		+ (SLPC_CACHELINE_SIZE_BYTES-1)) / SLPC_CACHELINE_SIZE_BYTES)*SLPC_CACHELINE_SIZE_BYTES)
>> +
>> +#define SLPC_SHARE_DATA_SIZE_BYTE_OTHER		(SLPC_SHARE_DATA_SIZE_BYTE_MAX - \
>> +					(SLPC_SHARE_DATA_SIZE_BYTE_HEADER \
>> +					+ SLPC_SHARE_DATA_SIZE_BYTE_PLATFORM_INFO \
>> +					+ SLPC_SHARE_DATA_SIZE_BYTE_TASK_STATE \
>> +					+ SLPC_SHARE_DATA_SIZE_BYTE_PARAM \
>> +					+ SLPC_SHARE_DATA_MODE_DEFN_TABLE_SIZE))
>> +
>> +#define SLPC_EVENT(id, argc)			((u32)(id) << 8 | (argc))
>> +
>> +#define SLPC_PARAM_TASK_DEFAULT			0
>> +#define SLPC_PARAM_TASK_ENABLED			1
>> +#define SLPC_PARAM_TASK_DISABLED		2
>> +#define SLPC_PARAM_TASK_UNKNOWN			3
> 
> many values below are defined as enum, why these values are #defines ?
> 
> and is there any relation to these ones defined below (look similar)?

No, they are different, added an enum.

> 
>   +	SLPC_PARAM_TASK_ENABLE_GTPERF = 0,
>   +	SLPC_PARAM_TASK_DISABLE_GTPERF = 1,
>   +	SLPC_PARAM_TASK_ENABLE_BALANCER = 2,
>   +	SLPC_PARAM_TASK_DISABLE_BALANCER = 3,
>   +	SLPC_PARAM_TASK_ENABLE_DCC = 4,
>   +	SLPC_PARAM_TASK_DISABLE_DCC = 5,
> 
>> +
>> +enum slpc_status {
>> +	SLPC_STATUS_OK = 0,
>> +	SLPC_STATUS_ERROR = 1,
>> +	SLPC_STATUS_ILLEGAL_COMMAND = 2,
>> +	SLPC_STATUS_INVALID_ARGS = 3,
>> +	SLPC_STATUS_INVALID_PARAMS = 4,
>> +	SLPC_STATUS_INVALID_DATA = 5,
>> +	SLPC_STATUS_OUT_OF_RANGE = 6,
>> +	SLPC_STATUS_NOT_SUPPORTED = 7,
>> +	SLPC_STATUS_NOT_IMPLEMENTED = 8,
>> +	SLPC_STATUS_NO_DATA = 9,
>> +	SLPC_STATUS_EVENT_NOT_REGISTERED = 10,
>> +	SLPC_STATUS_REGISTER_LOCKED = 11,
>> +	SLPC_STATUS_TEMPORARILY_UNAVAILABLE = 12,
>> +	SLPC_STATUS_VALUE_ALREADY_SET = 13,
>> +	SLPC_STATUS_VALUE_ALREADY_UNSET = 14,
>> +	SLPC_STATUS_VALUE_NOT_CHANGED = 15,
>> +	SLPC_STATUS_MEMIO_ERROR = 16,
>> +	SLPC_STATUS_EVENT_QUEUED_REQ_DPC = 17,
>> +	SLPC_STATUS_EVENT_QUEUED_NOREQ_DPC = 18,
>> +	SLPC_STATUS_NO_EVENT_QUEUED = 19,
>> +	SLPC_STATUS_OUT_OF_SPACE = 20,
>> +	SLPC_STATUS_TIMEOUT = 21,
>> +	SLPC_STATUS_NO_LOCK = 22,
>> +	SLPC_STATUS_MAX
>> +};
>> +
>> +enum slpc_event_id {
>> +	SLPC_EVENT_RESET = 0,
>> +	SLPC_EVENT_SHUTDOWN = 1,
>> +	SLPC_EVENT_PLATFORM_INFO_CHANGE = 2,
>> +	SLPC_EVENT_DISPLAY_MODE_CHANGE = 3,
>> +	SLPC_EVENT_FLIP_COMPLETE = 4,
>> +	SLPC_EVENT_QUERY_TASK_STATE = 5,
>> +	SLPC_EVENT_PARAMETER_SET = 6,
>> +	SLPC_EVENT_PARAMETER_UNSET = 7,
>> +};
>> +
>> +enum slpc_param_id {
>> +	SLPC_PARAM_TASK_ENABLE_GTPERF = 0,
>> +	SLPC_PARAM_TASK_DISABLE_GTPERF = 1,
>> +	SLPC_PARAM_TASK_ENABLE_BALANCER = 2,
>> +	SLPC_PARAM_TASK_DISABLE_BALANCER = 3,
>> +	SLPC_PARAM_TASK_ENABLE_DCC = 4,
>> +	SLPC_PARAM_TASK_DISABLE_DCC = 5,
>> +	SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ = 6,
>> +	SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ = 7,
>> +	SLPC_PARAM_GLOBAL_MIN_GT_SLICE_FREQ_MHZ = 8,
>> +	SLPC_PARAM_GLOBAL_MAX_GT_SLICE_FREQ_MHZ = 9,
>> +	SLPC_PARAM_GTPERF_THRESHOLD_MAX_FPS = 10,
>> +	SLPC_PARAM_GLOBAL_DISABLE_GT_FREQ_MANAGEMENT = 11,
>> +	SLPC_PARAM_GTPERF_ENABLE_FRAMERATE_STALLING = 12,
>> +	SLPC_PARAM_GLOBAL_DISABLE_RC6_MODE_CHANGE = 13,
>> +	SLPC_PARAM_GLOBAL_OC_UNSLICE_FREQ_MHZ = 14,
>> +	SLPC_PARAM_GLOBAL_OC_SLICE_FREQ_MHZ = 15,
>> +	SLPC_PARAM_GLOBAL_ENABLE_IA_GT_BALANCING = 16,
>> +	SLPC_PARAM_GLOBAL_ENABLE_ADAPTIVE_BURST_TURBO = 17,
>> +	SLPC_PARAM_GLOBAL_ENABLE_EVAL_MODE = 18,
>> +	SLPC_PARAM_GLOBAL_ENABLE_BALANCER_IN_NON_GAMING_MODE = 19,
>> +	SLPC_PARAM_GLOBAL_RT_MODE_TURBO_FREQ_DELTA_MHZ = 20,
>> +	SLPC_PARAM_PWRGATE_RC_MODE = 21,
>> +	SLPC_PARAM_EDR_MODE_COMPUTE_TIMEOUT_MS = 22,
>> +	SLPC_PARAM_EDR_QOS_FREQ_MHZ = 23,
>> +	SLPC_PARAM_MEDIA_FF_RATIO_MODE = 24,
>> +	SLPC_PARAM_ENABLE_IA_FREQ_LIMITING = 25,
>> +	SLPC_PARAM_STRATEGIES = 26,
>> +	SLPC_PARAM_POWER_PROFILE = 27,
>> +	SLPC_IGNORE_EFFICIENT_FREQUENCY = 28,
> 
> no PARAM tag inside this enum name
> 
>> +	SLPC_MAX_PARAM = 32,
> 
> can we move this out of enum, maybe as standalone #define ?
> or remove it as doesn't seem to be useful at all

Added PARAM tag, it needs to be part of this.

> 
>> +};
>> +
>> +enum slpc_global_state {
>> +	SLPC_GLOBAL_STATE_NOT_RUNNING = 0,
>> +	SLPC_GLOBAL_STATE_INITIALIZING = 1,
>> +	SLPC_GLOBAL_STATE_RESETTING = 2,
>> +	SLPC_GLOBAL_STATE_RUNNING = 3,
>> +	SLPC_GLOBAL_STATE_SHUTTING_DOWN = 4,
>> +	SLPC_GLOBAL_STATE_ERROR = 5
>> +};
>> +
>> +enum slpc_platform_sku {
>> +	SLPC_PLATFORM_SKU_UNDEFINED = 0,
>> +	SLPC_PLATFORM_SKU_ULX = 1,
>> +	SLPC_PLATFORM_SKU_ULT = 2,
>> +	SLPC_PLATFORM_SKU_T = 3,
>> +	SLPC_PLATFORM_SKU_MOBL = 4,
>> +	SLPC_PLATFORM_SKU_DT = 5,
>> +	SLPC_PLATFORM_SKU_UNKNOWN = 6,
>> +};
>> +
>> +struct slpc_platform_info {
>> +	union {
>> +		u32 sku;  /**< SKU info */
>> +		struct {
>> +			u32 reserved:8;
>> +			u32 fused_slice_count:8;
>> +			u32 reserved1:16;
>> +		};
>> +	};
>> +        union
>> +	{
>> +		u32 bitfield2;       /**< IA capability info*/
>> +		struct {
>> +			u32 max_p0_freq_bins:8;
>> +			u32 p1_freq_bins:8;
>> +			u32 pe_freq_bins:8;
>> +			u32 pn_freq_bins:8;
>> +		};
>> +	};
>> +	u32 reserved2[2];
>> +} __packed;
> 
> I'm not a big fan of using C bitfields for interface definitions
> 
> can we switch to regular #defines and use FIELD_GET|PREP ?

Done.

> 
>> +
>> +struct slpc_task_state_data {
>> +	union {
>> +		u32 bitfield1;
>> +		struct {
>> +			u32 gtperf_task_active:1;
>> +			u32 gtperf_stall_possible:1;
>> +			u32 gtperf_gaming_mode:1;
>> +			u32 gtperf_target_fps:8;
>> +			u32 dcc_task_active:1;
>> +			u32 in_dcc:1;
>> +			u32 in_dct:1;
>> +			u32 freq_switch_active:1;
>> +			u32 ibc_enabled:1;
>> +			u32 ibc_active:1;
>> +			u32 pg1_enabled:1;
>> +			u32 pg1_active:1;
>> +		};
>> +	};
>> +	union {
>> +		u32 bitfield2;
>> +		struct {
>> +			u32 max_unslice_freq:8;
>> +			u32 min_unslice_freq:8;
>> +			u32 max_slice_freq:8;
>> +			u32 min_slice_freq:8;
>> +		};
>> +	};
>> +} __packed;
>> +
>> +struct slpc_shared_data {
>> +	union {
>> +		struct {
>> +			/* Total size in bytes of this buffer. */
>> +			u32 shared_data_size;
>> +			u32 global_state;
>> +			u32 display_data_addr;
>> +		};
> 
> below all structs are named, this one not, why ?
> 
>> +		unsigned char reserved_header[SLPC_SHARE_DATA_SIZE_BYTE_HEADER];
> 
> this could be just "u8"
> 
> and I assume all these "reserved" are in fact padding, no ?
> 
>> +	};
>> +
>> +	union {
>> +		struct slpc_platform_info platform_info;
>> +		unsigned char reserved_platform[SLPC_SHARE_DATA_SIZE_BYTE_PLATFORM_INFO];
>> +	};
> 
> maybe we can avoid these unions by declaring padding explicitly:
> 
> 	struct slpc_platform_info platform_info;
> 	u8 platform_info_pad[SLPC_SHARE_DATA_SIZE_BYTE_PLATFORM_INFO -
> 	                     sizeof(struct slpc_platform_info)];
> 
>> +
>> +	union {
>> +		struct slpc_task_state_data task_state_data;
>> +		unsigned char reserved_task_state[SLPC_SHARE_DATA_SIZE_BYTE_TASK_STATE];
>> +	};
>> +
>> +	union {
>> +		struct {
>> +		u32 override_params_set_bits[SLPC_OVERRIDE_BITFIELD_SIZE];
>> +		u32 override_params_values[SLPC_MAX_OVERRIDE_PARAMETERS];
>> +		};
>> +		unsigned char reserved_override_parameter[SLPC_SHARE_DATA_SIZE_BYTE_PARAM];
>> +	};
>> +
>> +	unsigned char reserved_other[SLPC_SHARE_DATA_SIZE_BYTE_OTHER];
>> +
>> +	/* PAGE 2 (4096 bytes), mode based parameter will be removed soon */
>> +	unsigned char reserved_mode_definition[4096];
>> +} __packed;
>> +
>> +enum slpc_reset_flags {
>> +	SLPC_RESET_FLAG_TDR_OCCURRED = (1 << 0)
>> +};
>> +
>> +#define SLPC_EVENT_MAX_INPUT_ARGS  9
>> +#define SLPC_EVENT_MAX_OUTPUT_ARGS 1
>> +
>> +union slpc_event_input_header {
>> +	u32 value;
>> +	struct {
>> +		u32 num_args:8;
>> +		u32 event_id:8;
>> +	};
>> +};
> 
> I guess earlier #define SLPC_EVENT is related to above
> can we keep related definitions together ?
> 
>> +
>> +struct slpc_event_input {
>> +	u32 h2g_action_id;
>> +	union slpc_event_input_header header;
>> +	u32 args[SLPC_EVENT_MAX_INPUT_ARGS];
>> +} __packed;
> 
> this looks like a attempt to define details of the
> INTEL_GUC_ACTION_SLPC_REQUEST HXG request message.
> 
> so maybe it can be moved to abi/guc_actions_slpc_abi.h ?
> best if you can define it in the same fashion as CTB registration one
> 

Moved all this to the slpc_abi file and removed the fwif file for now.

Thanks,
Vinay.

> Michal
> 
>> +
>> +#endif
>>
