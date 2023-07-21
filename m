Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7675D5EB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 22:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CF510E703;
	Fri, 21 Jul 2023 20:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39B410E700;
 Fri, 21 Jul 2023 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689972285; x=1721508285;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U35SGXHH8UNjt2fjaMRxfaapBMyfI+I5uTFInCxKrX8=;
 b=mN0iooEUtrdx7I9CdnCwYcPxk+shJJ99gxkNhoDUHOQ6lS5meTmw33gs
 aKDyE0xFLPLzEHybjJwBOTZcyD+yBKmbkNa4UJhotKBRuo9zPujNSNtB4
 y6XnanGE5++xwZTlgT+V4+lWAVjzNATyFuOZ6QOIWnpdX97//2HhGx/+d
 9ZHdD3Bvaw8VDLNGlmT2eBRBx2BqWFzTgPlXNfihu/CzEltGilaKLUsH6
 scT2WH2ZzTv01029qmQnQe0xFG6Y2tIZxlPchc3n/J4F8ASmc/dR5u7P5
 3EmR0cwZL6pp8nr/jtrSTi8gqtDR3VFDUX85d+ISD42G72J2knBn+zOFp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347407573"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="347407573"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 13:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795079704"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="795079704"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 13:44:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:44:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:44:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 13:44:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 13:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJNiOZrBxYkn+HijxKlebctvgxdmwyz4z3S4pJ+HeZJDYWQtI1hlYWTV5w5uILenC0jrtZ8fruMfJ4qyoZ4uCrPg8aHvmh2RY71f8sc4f0HmlBDANyAj8GVjYuBiwlbLEWILJMvqjZxAoaHGyQGjaCis4iD5en15+IFchepiSUQctJhPzQOUqZVfTOBH7hwMJYH+DA9yMvqPwShW61IeWPfohziixMUNE/BHMcTb2zGZBIbAVbU1XMwiueSC1mpAqvYXJrGIslInwuaAhuut2AOuekmLm/OdEPv31IySqjsovRwJbejf78MrjzE9bOIYRKspJwGV2MqzL403n1nntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbtHYBomejbBcgUsFnPKvIJig29cKb90eFZVUYF/g6k=;
 b=XgjzABWNveRdf6M1heQ2RbMs3ErXk85ap1MMXF7yaO7dn9WUEcPgU22IM8fL9bF+PH/LrCQVy7upRkBx5dj4ko3SQT2vDnVE4aROHGG3irB4W5eqL0PeitON7uYSqzdSYcI3PmxV+yXZXuNlnmZbYmTbq883vjggN12U8vZf5Zc6OrXhKLnFtp6o+g8R97C7diA/TIOo61fcXQ9ZSyR5DEjAt+Y2W7kgtsb46dn851Db2Jb+/DsceC0bcRcCVPvxuIyVPNfnweVq6GjVO5FHlCStDjLChmt8wAmGl6E+CL57+Fv+BUNA7fsHpJA98FuOCKAKu9sg3v4Y507GURB2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 20:44:37 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::8b4:fdfd:4a61:1e14]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::8b4:fdfd:4a61:1e14%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 20:44:37 +0000
Message-ID: <3ba54e32-f1b3-8c31-1135-f6d754269afe@intel.com>
Date: Fri, 21 Jul 2023 13:44:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/i915/guc/slpc: Restore efficient freq earlier
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230721180349.1737284-1-vinay.belgaumkar@intel.com>
 <ZLrtcwN1TkUk/yxf@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ZLrtcwN1TkUk/yxf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DM4PR11MB5373:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e16159b-d3f7-4010-ce00-08db8a2b4bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NkVGYpvYCTDQZggZOADmgQv2GbqGbm2soCnsRyZnCU4cVQ1UKsohnkFKRMr3/9ppibMTOVJ8ko2GcjoLc8b00yYrveuug7Lf6av5asdlXLNTdN+piJoiilh1XL5A3fzcflrtLqkT8/UckdAo40nYQsxCf4GrNpqtdQr7PYzx5ftIhANMqfg+sfgXhqRRLcoGbrrV5vJhA1XkCtwHIJgQ4BL8pK100j1vNrp2iEjvqv49rWw7tQJocp8z/vRUFEAdmywzR1M2xyk42sVSGjsPPLnMGLXs23wU+M8TaFIBfukxiLqvJzVZLflaM6U0+jaH7uimFMPhsn/0ov2ww9ISlerL6acMNyOQMvBdLCn3i9r2XOrJHJkGPnrAOYEHTfZmY7hv6aB/lOx9Wf9SoUdpvfETkNslLIOa9RSzBMZ8jhmr2rzH3hlxbYSkPZ9nmaYBml9iFtvXpS7D5i2cFpXPL4Yo9WiX+39bVcivKA4AUleu2HxSKxshk8sVD1U7RJei1GVy+l8E6umSRq5cGSpKMM3VM2LiQaBaTnUvLpYigXue66nCKxZBmasv07CN1LGIT87t8CEnqOeA2dQM6d0VnIc7E8TqlDr3CXY2OUpCuq82eyQUWBW+c4JLHTaPqXJevYCPyxt5uWSCvoP02l2dbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199021)(450100002)(2906002)(66476007)(66946007)(66556008)(4326008)(6636002)(6486002)(6666004)(83380400001)(37006003)(6512007)(478600001)(36756003)(186003)(82960400001)(86362001)(2616005)(53546011)(6506007)(38100700002)(26005)(31696002)(966005)(41300700001)(5660300002)(8936002)(6862004)(8676002)(31686004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1dOZVhscHVIbEdFYzRXSjFoRmFlelVON1c2cW8zSktXeDJOd0I1R1U5S1VT?=
 =?utf-8?B?bjZTQW1ic2RPTVV0ZDZhSmo4TWdHVUk0RDBzYVVjcWVzRWwxRVhuNGlsMi94?=
 =?utf-8?B?VVZFTE5ycDNYTmtuWkxzY3MwdE1aRDAyVnlXWG91bjlDYko3TEZTeFJEejJV?=
 =?utf-8?B?Sk56SmM5Vis0NjVJRllGam1GWGtPWFU3anJNSEw3bUNQMHZ5dEpmNm5LdW1o?=
 =?utf-8?B?bDhVbzBycVVLeVh2bWFqZHhKTk5Ra21sazR6b05ieGpydS9ONHJhQUdvdk81?=
 =?utf-8?B?WE5ZY1pSN2M5RmxCZWpxOGhuOFhpUmc2UktYUWZ3YVFoaGVVRHVOcC9EdUxt?=
 =?utf-8?B?L012ckZqZ1ZiZmJMK29QMWN4cm5nVXVoNUxQNnBmcUNHSTFVbDBja1NRNlZj?=
 =?utf-8?B?bzJaNEx2OGdKNkw5aER2YWtnRXJuM2k1UEFRMFA3N3dJYmxXWEdHMmN1Uklo?=
 =?utf-8?B?SktKb2JpaDk3S3cwdUpWdHNBcEJPNlFORldlaWJCelNVcDJlTXkwbkdBNWJr?=
 =?utf-8?B?Y3llOWwxdmN0SWMvVGtjQzdVek9oZ25QZm5vN2tZcGJwd1B6VVowR3dydmFC?=
 =?utf-8?B?VDczaXdwRm5sMnRjOFdrVmtLSEVheWs3TTlxckpWLzNzaWNFSFFwWW80T2Z5?=
 =?utf-8?B?TUJ5ZWJmV0NaRkdDOUFxM3FlRHV2aXV0T1FjbVRLSmd6Z054b3g5cFp1aCtZ?=
 =?utf-8?B?bGF4QWF0Ylgrb05ENDFtQTduVnV2aENLWjM0UE1yRG9qaHJTOFBUckhwazYz?=
 =?utf-8?B?YWNkNTBLWEVIb2Irc1dUMTZQeWpwVXRvMHpFWVNNQ2FydzUyQ1FxcDBibUxE?=
 =?utf-8?B?cXBPWFVEMUZHSmZCYUxtNHUvODZvdTUrcVRZWVRmakxaeml3UExxL1BSS0dT?=
 =?utf-8?B?K3hvVkRsQ0N6dzAzWkR2MSt5SmRkRUZMNFl5QjlvelpidEV4WjhjRE1ld2Jy?=
 =?utf-8?B?citFa3gvQlVxVlpRV3JUa2oxNUEycFh4MnRsNm01bnFmTWFKR0NhY1RNQTIx?=
 =?utf-8?B?UG9oVnplbU02T3UvejIxWFRubHN5UjdEK0ttenROZHFIRFZ1MXBmMzM0YkNo?=
 =?utf-8?B?WjFRcWJXaldJU2FVVzZTa0NVUndpMVNDblhseGV5SHloRUxpU2pWMFNid1hk?=
 =?utf-8?B?ZWVadmhzTjdXMkNpRE41eEk2SEhXZGxyNUNYS1NrN3lUTWMrNTVtUE5hQVA2?=
 =?utf-8?B?RWlVdGpxRlhCZkJiMlZudDNlVndSQkRUTFdnV1l5WUt0QkExaVBsSXZmeCtR?=
 =?utf-8?B?RWpOV1B0YzNCR0FsaGg1dnlVdllFNlN6T1NNMkdqSlMrQk1XWE4wNFpORUg0?=
 =?utf-8?B?QjdMbzVFUGUzQTBwS09oTXpkUjltSmdCdEczUE5yTEdtQUJWay9yRmFQQVFy?=
 =?utf-8?B?M1pxWXBsRHM0Nm1pclV4OEZLQ2Z2OFByUWhEMS9wSGNJTjJVcWgva0JvTkd2?=
 =?utf-8?B?SkdxRjdVaS9lakQvLy9NMGZkNjVCWk1oSDhyRWp1dUJoeVFRMUZ6b1VRZDBj?=
 =?utf-8?B?YnlKc0JqdVh4Zjhlc1EyZnZzbXk3Mlp2bWVXWGMxSi8rTGEwVlhUbnlVRVdv?=
 =?utf-8?B?YnE1cHlGRDZwNGNvTCtzSEVPT1lEZFhESGlUNGplaXVRMnpGRHJJWVBMb2FS?=
 =?utf-8?B?SGpSeXhxaThRTG1WakNaMVF4OUtSaDhhSGJaU09zMzdaTjkvcDBrTW4vdUVS?=
 =?utf-8?B?MUU0VVNxaWNPMVpLeW42N2lCYy9XaEhCZDhQVm1RUWZyTW1oWmhvWU5ZWE82?=
 =?utf-8?B?TzM2L2JGK1owdTJWcmFjbldYbEorNk5PR0FWK0ZCOEJRcVZmQ3NzRTRrSEd3?=
 =?utf-8?B?NVdCT2Z0alVPUGQ5d0VlTU45My92SHVpOFBSb2picTBFbVVNMlpaeW1qZUJQ?=
 =?utf-8?B?ZURkOHp1Qm8rYkpGYVg5MnlCVERySUxaUkxsRG5XNXkyN3hVek85a0hDY2FN?=
 =?utf-8?B?RHcxcmJlNzM1NzB6NTNDK3YvbHdUUUNFMmpVcUVHbnBZZU5PRHpDSnZVNkVk?=
 =?utf-8?B?T1N0Wk1aQisrbTRqTDRBbVpnSXlHcDhrdGNHVENUY2xvdTdpemFHUmFTWFVn?=
 =?utf-8?B?ZmxkeTNTVHpYLzhnQ2xwRlVHRzR3WkttR0hhUDgvbkh0aWlrM1A0SjN6ODZz?=
 =?utf-8?B?TFBUelRlWE40S0lBTlBpWjlROC9oL2lCRnkyZkZuSVYwN2hkdnhtOHluTi9j?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e16159b-d3f7-4010-ce00-08db8a2b4bf9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 20:44:36.7316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lG+zE4zt//taGdyk7BNG3lyRc7+bSuDnpB8wMKtUuJSm7JdWKAsYu9C9Z2OLfsIG85WcFHk0JxELMooAuxqJnI48Y1KYLDixGT/dxw+9zyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5373
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/21/2023 1:41 PM, Rodrigo Vivi wrote:
> On Fri, Jul 21, 2023 at 11:03:49AM -0700, Vinay Belgaumkar wrote:
>> This should be done before the soft min/max frequencies are restored.
>> When we disable the "Ignore efficient frequency" flag, GuC does not
>> actually bring the requested freq down to RPn.
>>
>> Specifically, this scenario-
>>
>> - ignore efficient freq set to true
>> - reduce min to RPn (from efficient)
>> - suspend
>> - resume (includes GuC load, restore soft min/max, restore efficient freq)
>> - validate min freq has been resored to RPn
>>
>> This will fail if we didn't first restore(disable, in this case) efficient
>> freq flag before setting the soft min frequency.
> that's strange. so guc is returning the rpe when we request the min freq
> during the soft config?
>
> we could alternatively change the soft config to actually get the min
> and not be tricked by this.
>
> But also the patch below doesn't hurt.
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> (Although I'm still curious and want to understand exactly why
> the soft min gets messed up when we don't tell guc to ignore the
> efficient freq beforehand. Please help me to understand.)

The soft min does not get messed up, but GuC keeps requesting RPe even 
after disabling efficient freq. (unless we manually set min freq to RPn 
AFTER disabling efficient).

Thanks,

Vinay.

>
>
>> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8736
>> Fixes: 55f9720dbf23 ("drm/i915/guc/slpc: Provide sysfs for efficient freq")
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index ee9f83af7cf6..f16dff7c3185 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -743,6 +743,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   
>>   	intel_guc_pm_intrmsk_enable(slpc_to_gt(slpc));
>>   
>> +	/* Set cached value of ignore efficient freq */
>> +	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
>> +
>>   	slpc_get_rp_values(slpc);
>>   
>>   	/* Handle the case where min=max=RPmax */
>> @@ -765,9 +768,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   	/* Set cached media freq ratio mode */
>>   	intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
>>   
>> -	/* Set cached value of ignore efficient freq */
>> -	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
>> -
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.38.1
>>
