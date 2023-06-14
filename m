Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56CC72F676
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598DB10E19F;
	Wed, 14 Jun 2023 07:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B63E10E0E8;
 Wed, 14 Jun 2023 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686728148; x=1718264148;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hfIdCHc7GrvUnanHbovC9VRD/sKJu9lUWdJlxbuJsWM=;
 b=BU068qkPwT3YyiYM/8LKmcZsA6JfaPHmCivyWr1YfLhq5JA2qc33+Twc
 nnXEItDR/D1pPpdbZcmxW0PfKbivHrwJA/E+Nfz+slCG5ABuQneZLr7Of
 tyJuZ9+d0TwKfwum1alNXAp4vCd0JNSrxZpkIFirwMLNK7TMusxGL2z8Z
 gxee6kYrGcbL9PhsrXJv39Lc8hhxhftJ039QnVfDUzHm3YSoatFadb8/q
 HtI9jy9hbdMARbtiVKboIRkYqz9T2miWniaCsCb2UhweUEYUpARsze4C8
 WiKH3rRPHnThAL2VpDdT6IlNlEdQosBw5O3uBqGf/GVSvkJIab6Bcz+si A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="361027182"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="361027182"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 00:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="741742450"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="741742450"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 14 Jun 2023 00:35:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 00:35:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 00:35:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 00:35:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 00:35:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPOUEhjeEkDA/dVwtI6Ic2/CVCXl7KyhQfrYJiHgRNRvyjzx53VH6lDiqL8/O7keC2YhDV6jjqeYt6zxjzFVNuVbZKl0GSGlbx8OLcmb+ZU87UEnLNztsUAFVvtnKnWz+DSXdYsuntLhIdnatGxD6AlaS9eDGmU+sngq5VrHRWNzzxLX2lrMfh1sv7ykJySU2QL87kS1WUp6cmp/Lmg2Kg4hpLYWNKJdPS4zs+QN4greAH0Pid3IWfET4aF/77PALxOQSxW7jc4l5sZzAr++APlFFKvqBLSI/e/Vb4G/8/ZvSLmMNi1PFAVrkNfRzLh7Je87KPi//OJXP+yy7vpl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=448KFTpznEh+YiYgktho+KwgdQWi2UjPYGmmgAjNoLQ=;
 b=bjM44enV7PzkpSLmL/QX3s6dWqSE24pwde1ofCpFvWVjqanXa62v22Pzh+C7+6PevyTpPTYTs1VLDrLiRoFJh4c7heBdeav64Nk+nMfaJKTpf3odRePeD8j4VI5ny66ZCfaGF/CGZ2hxCj2NHeKGWJ+Dgqn0911PK8c4l6ba3lJ/A6tnwqg58eCb17GIONJrufqwCNAo6i99IXUhwUgMQziJtLzLVOj5JJTioKq/tguaUD33nNY7M+ExbBumMztm7vbpvIz59PJ85RjoDF5Gylny0+b77wrIV73MEQ5tZjKn+ccMEU9vkER2G+4Pxusgre32rKyafVx8WuPif90dSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by CH0PR11MB5361.namprd11.prod.outlook.com (2603:10b6:610:b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 07:35:11 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a%5]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 07:35:11 +0000
Message-ID: <74d9e79d-4e03-2eb0-e71e-36d692278341@intel.com>
Date: Wed, 14 Jun 2023 00:35:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.1
Subject: Re: [PATCH] drm/i915/guc/slpc: Apply min softlimit correctly
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230609220252.410740-1-vinay.belgaumkar@intel.com>
 <87zg52ye3d.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87zg52ye3d.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::24) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|CH0PR11MB5361:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd8c51f-39ca-4d9e-de7e-08db6ca9e2e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j7Mf8B2CmYqGThnFhaA7TgGsbX5WwW+o+M6+zA/JXP3G0m97i/Vb74eP9DzkQfkBmUpIRid+n1jtym7faXGrEyCvIgpX34z15ssKzIxwSaxzwkUwSbWTcJnyXs5jGlW25TTp2bZMEel/tDZYuqTNx8xTfSRqpDmj34Y6josrCm5AQ9bLn3CM+E/bCJFDAfP3rd5dMfrnoWmslbK8H/zl32WYlXmR9IBbdWwQMrUz+8yv4TSA+U1eaJ0yrbjr4M4fdfwkOPE9EyzTG6IfzXkLwveaDH9BO//RkIEguhKn7QpWMi4nzoHszkp9H6dQwna6AG0TAG/DjfgbTtDbwmL6Rb+5wpHkopJ5xnxp4ufxRZST2E9HZuoZNONnXL4UFySKPwXwpLKWkoVBj5Qf2Tt8zc82TfRibdfpkxW2J8FmZ3iw0lYhtwRwNaGRv9PT83bRwVEhxykRdv3NH8Ni28Sxuomixq36RGg90YHrFd/9XASYXJOKF+36YBrbuMmry0z3J+KVLcregRBhODX4f+qDQLgpIy+C5kX4m3qcabaXxbUcIWVjS9A96sBz4JLmmWufZzDQC2Q6vOXtT9ueak05tE0iTh+V2Bp1i6RtGDJXH0HL8xVbnBCkuJ27GOIpLs9hmu0HIsQMki6PTruq2HjEpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(6862004)(8676002)(8936002)(2906002)(38100700002)(82960400001)(5660300002)(66476007)(66556008)(66946007)(316002)(4326008)(6636002)(31686004)(450100002)(83380400001)(37006003)(41300700001)(2616005)(36756003)(478600001)(186003)(53546011)(6512007)(6506007)(26005)(6486002)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0hoTytJTUs2RGJWQklRQWtTbm1pK3JRQWMyZTQvcEtTSzVoa0lad3pBdFNZ?=
 =?utf-8?B?ak1qckcvYm9NWmhNdGdPNU1KTG9iY21pSm5jaERCYVhJcmVSRFJDQXI2emQx?=
 =?utf-8?B?V1poV3JSVzV5M3lUNnNBdytta1QrVnZpSWs4NXRYaVF1NTdxSCs1ZloycFg2?=
 =?utf-8?B?N3RQNHdGMlJCUFRVRVRsSG44Q1M0di9DaGxBc1FvREtOQ28xQ1QyQm1OOHdw?=
 =?utf-8?B?VTZ5TStFM2RlSTJZZS9JTmRvU3dBdjdabnZ5aHVhVFhWUHVJQlZ0VzFrWXB6?=
 =?utf-8?B?ZTQ3V2ZiQ1dRYmJmZnpHY0VJVktUQkFLTU1GaFkxZ091MlpxdkxvY1VrNDBS?=
 =?utf-8?B?NFM5NEYzRVc2YmdURGZOZWtPeUNIRWpGQlJ5Z2dsNGh2d0xHWldPVy82YUVR?=
 =?utf-8?B?NUdKbEZVLzIyelNWU1RwSUJsUDVEQUVWN0xvVmExYTRzOGl1OUhCVEtBbGZY?=
 =?utf-8?B?Z3ZKbVVOelhDV29oTTZLaVRLLzFWZnFaSTF5bFk2ZzlFZjl3YXRyenI3K2M2?=
 =?utf-8?B?T044WDhDc3c5S2EzdlpWVWJVQ0ZENWNYeXBnWWl4N0NWOHRiYWNBOUczR0V1?=
 =?utf-8?B?ZjJsdGdjYTdQUWJmNDE0QlUyaTRDSitGOFFNcDN4ZEF4SjgzZTRrcnRhTnd6?=
 =?utf-8?B?VjJheWNGWEpiVUtCTjJmL3RmY0lqQ1lJNEVaQ3dTTmp4R1RaWE9qVng5dVpG?=
 =?utf-8?B?RlFVVUpyUVRYek1NSWk0UmZYUzU1eUl5bXY4RUlyZVRBcEEvc2NEeGV0WEtD?=
 =?utf-8?B?cE5VRmtuM3EvclQyVk81MmluSmg4NVJQMWNCQkk3bHpvK3laMy9scVRoYlox?=
 =?utf-8?B?d1NLQTBHMDBpT2IvM05FdGxSbVZKMThaN0V3S1A0YUM1MXNVSjZkT3RwVjRL?=
 =?utf-8?B?Vkh0ZWJiY2xUR2pCSEVzczZuTitETGFjYTBvdjY3Mk5WaVJWdWZEYlc4Q0N5?=
 =?utf-8?B?Tm5SZ1JmWDVHd2pwckZkaitUVjJoOXlMYUVhWEhFMjIzR2F6V2M2L0ZKZnFv?=
 =?utf-8?B?NmVCZnl4dHk5aXZhZ04yd2FPYkdhYjQveEcrMmtGNURYeTh5dTM5TTRjSE1y?=
 =?utf-8?B?ZWZuK2ZxU2VhTkloR0lzdlFVUFN6RStuaG85cWVUS004d2twUGFJM3hOQUpx?=
 =?utf-8?B?RmV1T3lGeENjTGxuUDF0Nm9Oc2c1UzJSbkFsTDFqWVkrbjQrQTJaalh3NUs3?=
 =?utf-8?B?Z1RZckJTVEU3dnFSdkI3NjZxNXR6RkxyQXVaVGZHS1l3d1MwZ2RpMVpmbnRR?=
 =?utf-8?B?aC9FaWcrdkRQQW53YUliMU1uOFFjY2l6T2RKcENIdDdkamJ1MUZnWGUyc1Fu?=
 =?utf-8?B?N3RDRFJIT0hZMGVOdWlqcmRtSUZtQkdGSGlGRDg1TkUxSCtBc3I0S2g4eVAw?=
 =?utf-8?B?YTgydUxWdzZNV1c3V2cxNk01SVdaUTR1L1N6VklHYWNzS3RaRnBmdzd5QlNh?=
 =?utf-8?B?UXcwdnNGcHl5L1VZWVNaL1VhU1NPc2FDMXptcnJZVVB4dXpkTnI1cUNKazhJ?=
 =?utf-8?B?NHRydjFGYkJXOXM4OHRjVGVqV2hKYnNqckRVNEpYcURISXhZVnpUM0xvRG5E?=
 =?utf-8?B?YStvQ1hneWw4ZVZGVGRVT1N1K0FiNHdsUTRQdkp0eWE0RWpwT1U4SDQ5MUlo?=
 =?utf-8?B?WkdwZHd6cS9haDE0TjVaWWFPOXlHdzBuSloxRzVSK3M4d25YVk9obTQrbndI?=
 =?utf-8?B?eXZIZXpqRFMvTFZpQy9seTNITnp4T3ZUVThuTS95d2xtcFY3MXZmajVSdUts?=
 =?utf-8?B?MkQ3bWVlVDNXdDUzd3hheS9uR0k1Z2hIbGtrYnRSNDFFMVd2c3UzTzZoMy9T?=
 =?utf-8?B?UE5Sa1gxbVhYZUxadno1d1h6RllxV01VTjV1QnZKOVpGZU9LejYvOWJyNHB6?=
 =?utf-8?B?WCtoTW5RUXA1L3J3SUxiOEhTaTlXNy8rZTRHZDQzTUhJZDNHMzRHUkFFdXhp?=
 =?utf-8?B?VkF2OFFzN2x1ZnQwZENsRTRqM0R1Vkt3Y1pmNFBNR2R3TlBVb0RqVGRsYlJi?=
 =?utf-8?B?SE9Xa095N0FmT2F4Slg5cmJ1cXFFM0lvRUtKMHVXeVllMnZkanI0ajh6dTA2?=
 =?utf-8?B?enFnb2VnYm5kRTVBSzhQVXVuc0Ewc0tLNXNVaDhKcmFJb2JBaW1EVnA3ZlJw?=
 =?utf-8?B?Y3dQUmxlZkwzZytNeHNUM091SDhlbHlLMjF1ZGJUeUU3T2RBS1hrMHNlZ3la?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd8c51f-39ca-4d9e-de7e-08db6ca9e2e9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 07:35:11.6676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmT296CSIm4eNX3lHTaus1bmSm69A5Fv4HPdeyT2+NtByVKlMZoObhXF5Cf04nbKQSjW09tfI12fQQJZiYRjiNOTyExbtTZ7NdCSie2Bef8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5361
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


On 6/13/2023 7:25 PM, Dixit, Ashutosh wrote:
> On Fri, 09 Jun 2023 15:02:52 -0700, Vinay Belgaumkar wrote:
> Hi Vinay,
>
>> We were skipping when min_softlimit was equal to RPn. We need to apply
>> it rergardless as efficient frequency will push the SLPC min to RPe.
> regardless
>
>> This will break scenarios where user sets a min softlimit < RPe before
>> reset and then performs a GT reset.
> Can you explain the reason for the patch clearly in terms of variables in
> the code, what variable has what value and what is the bug. I am not
> following from the above description.

Hi Ashutosh,

Scenario being fixed here is exactly the one in i915_pm_freq_api 
reset/suspend subtests (currently in review). Test sets min freq to RPn 
and then performs a reset. It then checks if cur_freq is RPn.

Here's the sequence that shows the problem-

RPLS:/home/gta# modprobe i915
RPLS:/home/gta# echo 1 > /sys/class/drm/card0/gt/gt0/slpc_ignore_eff_freq
RPLS:/home/gta# echo 300 > /sys/class/drm/card0/gt_min_freq_mhz (RPn)
RPLS:/home/gta# cat /sys/class/drm/card0/gt_cur_freq_mhz --> cur == RPn 
as expected
300
RPLS:/home/gta# echo 1 > /sys/kernel/debug/dri/0/gt0/reset --> reset
RPLS:/home/gta# cat /sys/class/drm/card0/gt_min_freq_mhz --> shows the 
internal cached variable correctly
300
RPLS:/home/gta# cat /sys/class/drm/card0/gt_cur_freq_mhz --> actual freq 
being requested by SLPC (it's not RPn!!)
700

We need to sync up driver min freq value and SLPC min after a 
reset/suspend. Currently, we skip if the user had manually set min to 
RPn (this was an optimization we had before we enabled efficient freq 
usage).

Thanks,

Vinay.

>
> Thanks.
> --
> Ashutosh
>
>
>> Fixes: 95ccf312a1e4 ("drm/i915/guc/slpc: Allow SLPC to use efficient frequency")
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 01b75529311c..ee9f83af7cf6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -606,7 +606,7 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>> 		if (unlikely(ret))
>> 			return ret;
>> 		slpc_to_gt(slpc)->defaults.min_freq = slpc->min_freq_softlimit;
>> -	} else if (slpc->min_freq_softlimit != slpc->min_freq) {
>> +	} else {
>> 		return intel_guc_slpc_set_min_freq(slpc,
>> 						   slpc->min_freq_softlimit);
>> 	}
>> --
>> 2.38.1
>>
