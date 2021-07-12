Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD683C6718
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 01:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1356C89F6D;
	Mon, 12 Jul 2021 23:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE3889F6D;
 Mon, 12 Jul 2021 23:43:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="208252188"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="208252188"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 16:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="412760108"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga003.jf.intel.com with ESMTP; 12 Jul 2021 16:43:24 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 12 Jul 2021 16:43:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 12 Jul 2021 16:43:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 12 Jul 2021 16:43:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vl/AfcFlFf9EKRi6WJzagFz+zQUL/+ajaXqhmw8LjX3CJo+8Qdx1RrMNIqgyeCtpxlfxoRnGFEqbWpj1XmCZtUldQwOdoQjoT8RMSFq/lMB65eE+2egBkvG3lLaI+mGu4kgtzInv9225hlD6HwmodVUkUmAQhY+JFJKDzxNSBnrObWzyVupldimIBSsQlBkpxII01PzJFDeIlRXWCTlnrvy4MOUdemUQ2IZzYoXQZTCRRIidcN2v5sR2Uk3g1oLkIJz6dz4k55rCe7G1WS/AkJ4uldInXNJuSPBBF18BzG23wWdfoV2zzJEsaE11NOMSKtFm3JAl9BB7xeAzu7JXAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoMdTRK5WfJb2L3HHpAopV1m40zy/bkEaqHaljRcBmY=;
 b=VdAB1F2bTyTNXNvgsLDjaYc1YYP0ek+V/u9yZTIDwFbu2NxjlyppaFSW4k5bw/doFmIjQb1nJWmWNmMlm0UpHgG5j5qJ4e9kxXNUI64jTQxSuTft7dqi82MoCCzqfWDgum51Srwfi2nERypXiDd5oqhqPw+pey/pzZ7D0SPmnDC/ALwZb16vYUgvSDIyuyBo9GZwgpXXOfCtTEw08aK6Q1g3wbo+EMegw9oPtbrR88VmMmUh6jh7clpuCBoTst5AbEDv+zl0308lznPGjKzXHUh8RVAx+7kbImCR49RZTTDAgHONJAxXsXLjAXXi01GHoUWcB4cy0/3xXne1FfbRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoMdTRK5WfJb2L3HHpAopV1m40zy/bkEaqHaljRcBmY=;
 b=u4tQeozrcMN9apuBUXIAfUM1uR7mvUbsflCY5wJL0hklT80510lEdBqNK1Uh7Q0uB4hrCMe6vje40ATLD7ivTzozkWHe9eChox8Kpm7lpUKRX3TkmQyL+OCTSX3krgYJLAvEBVskbCWVTBsqUbCKqVt6hjjySpp2A0hDoA6h3aY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 23:43:22 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4308.027; Mon, 12 Jul 2021
 23:43:22 +0000
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 02/16] drm/i915/guc/slpc: Initial definitions for slpc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-3-vinay.belgaumkar@intel.com>
 <1e1debcc-3439-10ac-6c58-8be5f56340da@intel.com>
Message-ID: <ade31c78-8e49-cd22-75f1-1ef3910013d3@intel.com>
Date: Mon, 12 Jul 2021 16:43:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <1e1debcc-3439-10ac-6c58-8be5f56340da@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR1601CA0014.namprd16.prod.outlook.com
 (2603:10b6:300:da::24) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MWHPR1601CA0014.namprd16.prod.outlook.com (2603:10b6:300:da::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Mon, 12 Jul 2021 23:43:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e18c79f-20fa-4676-9bb4-08d9458ed5e0
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5586744AB931975DB6C91A2085159@CO6PR11MB5586.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8UpQMqlIIQFUH5TkYHdn/TiRL4+u7Bopi87r0uXSPWmkZjQaQvoDTnywuWuzmLU+xXlYSZx+eI3yx7COGrQbCjc32FQ9tmfOtZEUgARxPBzITVIRa7k/g5MOOuwvR2/3bfsh4/3MxVz77QczNwK1ixFSO46A2ETI+yXRWWoCBTeTtaFa4FzzEF+u7gkUjuE4S0HTKTZKzxUq7YSOPRIQW+6rIrp//VfV0Qe3BWFY1/MpiFacyVL+z4t+adr0mofCTEZWH8Yvne0VMF0Zq1jJqhiqJ41KMtIds/P+HZPlQq2IYPbNIeQf4wEAZyD+PWTKU/y2qynd7yOSyGMjCFljIK9+Y4dWJXaxsN6/RbBtHzzlurXfoyMddSe4y4NEEXrst8bJFOPjA/3/0AEv+KwSRxqK1otTrwlN3vI8245I8EOHhyE4AFE16Bde5TQeoN5mFUEicDFmGjEfHTKyxoBaqx/gg6uEVL4xzQFzqh/n9Uz5P5P+qBTVvAA6aEjtg9jsKosbzFUs8uxwKz9uhAghhLwMgRREo7b4Wxl//mMbfD+Dk02gsPiejVKY54v0Ogq9d92ktg4BqTHp/J5/MZzaLbeZl0FmTZSAbDEvIGkt+eetG5ZyyfcKuR3mTffRxd+YsY3C9okl4ZxkKeFDrOcDal2bwE5+fbmahs/YAkhxy12u+qeng76rc0zaJ5Du0k93vhGXX48sZkqvckAbWCP+YbZcRcA/u5DYIQAE8jz5Ybg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(956004)(54906003)(36756003)(86362001)(66476007)(107886003)(6486002)(2906002)(2616005)(8936002)(186003)(16576012)(31696002)(316002)(5660300002)(8676002)(31686004)(26005)(4326008)(83380400001)(450100002)(53546011)(66946007)(38100700002)(66556008)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UktFdUJFdi81ck9KbW15T1FhWHBlYjRaUkVWc3RXcktYKzVxSnc2ZVNHa1Zz?=
 =?utf-8?B?WFFGRXV4K3E3OU1qMHJLbS9yNEdCaXVrWFJNMlEzS2svajlaZFZncElybnBN?=
 =?utf-8?B?cVVKL3dMTGhDcExiVmdyNkhmbWVnT0FRek5rQ3BvNzBRbWFqdDRFM1BEWE1Y?=
 =?utf-8?B?bTI3RkhGc2E0Qk5MeG5nTWk2WDZ4Nk9UU2gwZExyWFFQK0Z0cCthdmtRek1I?=
 =?utf-8?B?VjN0UVpsUFZubHdtR0psSDZoT09PZ1dEaU55QjY5alU1Y3NWYXlEcWZJTHJ0?=
 =?utf-8?B?RC9JaXMyS1JUK2h5VXhraFFpQTN6R1lFNVZueTZOdVVCM213ck0yNHVFK1g0?=
 =?utf-8?B?UTFjd2ZaU2ozcGNVWTJzaG1MT28zaXhLUkV4WEVTVjNGZWRtdXA2RmJmd205?=
 =?utf-8?B?aEVrTkRKam82NHExb2Fvdi9heHVtVm5FdERHS1BmUkdDODhzTGV1QjNDTWsx?=
 =?utf-8?B?aHFUb2tJSTJ6Y0V0VlFJbGx2Q0J1ZXA2Unc4bnh4eXVLeWwyanRIdmNIaWVS?=
 =?utf-8?B?d3B6NkZBaHo5L0ZjNkJwUkRnZlNUUEZJN25TaXBBNi9wREl4MFgwb25QZmZv?=
 =?utf-8?B?N0srWVNkZ1piUlBHaHFkVWZ5d2V1bUdWREJXVWVkMjhDRWQxYkdxdlZxUjhC?=
 =?utf-8?B?S1ZVSWdOMmpJbU4yWjdkSHlHb3diVUR3YmM1ckRhWllyK2tPV21HUTQrWXpF?=
 =?utf-8?B?ZG5nR3FPRC91LzVlZDBWYk9sUy9pSXdsWXBrbnJWSGhsakVPZkM3cG05NGZR?=
 =?utf-8?B?S2d4UnlSdkdWek92WHU2dnBVQnZIdTl5MFB2b3dDekJZVVRoakJhd2w4NmFC?=
 =?utf-8?B?akZUajk3cHFwdDNwUHFmclJqUFFia2c5VUI4NVdQSTdKWFlvYzQ4V2ZNUE5q?=
 =?utf-8?B?cm9nZmZoMmM2WnhpWFd2OFFSN3Z2SGRVODVSTGl1NzNoSEZuQ1B2OTNxV2Ja?=
 =?utf-8?B?V2YxTUFaTFU4MjVtVytWSnNrU2d5UC9zQk9RV3JUVEJEMVV0ejZJSEt3aHA5?=
 =?utf-8?B?RUtmQ0xNM3FpaDdjcitFNEw1T2lidTdiekJ6MEExYUwreWc5d0lSdmlqbHRR?=
 =?utf-8?B?bVl0ZW9NSC9YRHVoL2VEY3plUzl4ZlZzR05UdG9WMmcwck81bVhNdGZhajRZ?=
 =?utf-8?B?a0VIbHpuK1ovWURMa25pRFRjOTUxb2JaOGRTYVNtRDM3U1VaY0VZRTg1RXNz?=
 =?utf-8?B?NjhMRWpyeVN4eUJEVGp0NTAwNGpUdDFiYlpIWnVabG94ME1yN3NqSFhlQmZj?=
 =?utf-8?B?QzZ2cE5mQU5KSnJ2TThQQVBxRkR3RFNjblpKQ2VVdGs3UTNuN2FwdmF5elZO?=
 =?utf-8?B?bjREM2Z5N3k4c0Fmc1FzV3loS1RpTlM4UkZHeGZ5WjFTcGZwR21KWFcvSTg3?=
 =?utf-8?B?YWwrbEpwYXpHYjhhc1FKWGhhN3ZBZzg1Tnc2dGZhV3M3SURNTm43dGxTTHln?=
 =?utf-8?B?TUlNL3VQOWpITXZNSXBsenlkTVg5bG81anRHalZRYWxyYXR5dm12VzN4Z2t6?=
 =?utf-8?B?Z0FHaE9UMkp5UU5ldFFUWm0zbklrVHQ5bW9zbU85c3FwK211UjFvUHNlRmd0?=
 =?utf-8?B?OWZ0QWVkMmlHNndjai84a1FTWk9nRjJPYjBHTGJiNnBnNEZUTkxWY1pzRDYw?=
 =?utf-8?B?c281U0x5Rkh4U056ZmV3SFIzbWc0dFRwbGMxbFpkR05wWGttTDlTamMvcndM?=
 =?utf-8?B?bXBTUHRwOE5Vc2lqbFA1NTR1bjJZL3JTN1FFWktUYmkvUmpQR2pnNXNGK2ta?=
 =?utf-8?Q?1DpnGglnNr7qXGZ23TjCM81K5UxkJD7xXy+td/Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e18c79f-20fa-4676-9bb4-08d9458ed5e0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 23:43:22.6760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLDMkeWRAuFbpAKy4iN7GrzL1HoN+KhTFxks5EfE5hanTFFY3ENo8hE0S5yy+DF6IAXytV4SdIQ0OGnQfwADZTyg2DLHspRdu5+6t3TbVmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5586
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Sundaresan
 Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/10/2021 7:27 AM, Michal Wajdeczko wrote:
> Hi Vinay,
> 
> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
>> Add macros to check for slpc support. This feature is currently supported
>> for gen12+ and enabled whenever guc submission is enabled/selected.
> 
> please try to use consistent names across all patches:
> 
> s/slpc/SLPC
> s/gen12/Gen12
> s/guc/GuC

Ok.

> 
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 ++
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 21 +++++++++++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h | 16 ++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  6 ++++--
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  1 +
>>   6 files changed, 45 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 979128e28372..b9a809f2d221 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -157,6 +157,7 @@ void intel_guc_init_early(struct intel_guc *guc)
>>   	intel_guc_ct_init_early(&guc->ct);
>>   	intel_guc_log_init_early(&guc->log);
>>   	intel_guc_submission_init_early(guc);
>> +	intel_guc_slpc_init_early(guc);
>>   
>>   	mutex_init(&guc->send_mutex);
>>   	spin_lock_init(&guc->irq_lock);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index 5d94cf482516..e5a456918b88 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -57,6 +57,8 @@ struct intel_guc {
>>   
>>   	bool submission_supported;
>>   	bool submission_selected;
>> +	bool slpc_supported;
>> +	bool slpc_selected;
>>   
>>   	struct i915_vma *ads_vma;
>>   	struct __guc_ads_blob *ads_blob;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 9c102bf0c8e3..e2644a05f298 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2351,6 +2351,27 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
>>   	guc->submission_selected = __guc_submission_selected(guc);
>>   }
>>   
>> +static bool __guc_slpc_supported(struct intel_guc *guc)
> 
> hmm, easy to confuse with intel_guc_slpc_is_supported, so maybe:
> 
> __detect_slpc_supported()
> 
> (yes, I know you were following code above)
> 
>> +{
>> +	/* GuC slpc is unavailable for pre-Gen12 */
> 
> s/slpc/SLPC

  Ok.

> 
>> +	return guc->submission_supported &&
>> +		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
>> +}
>> +
>> +static bool __guc_slpc_selected(struct intel_guc *guc)
>> +{
>> +	if (!intel_guc_slpc_is_supported(guc))
>> +		return false;
>> +
>> +	return guc->submission_selected;
>> +}
>> +
>> +void intel_guc_slpc_init_early(struct intel_guc *guc)
>> +{
>> +	guc->slpc_supported = __guc_slpc_supported(guc);
>> +	guc->slpc_selected = __guc_slpc_selected(guc);
>> +}
> 
> in patch 4/16 you are introducing intel_guc_slpc.c|h so to have proper
> encapsulation better to define this function as
> 
> void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc) { }
> 
> and move it to intel_guc_slpc.c

done.

> 
>> +
>>   static inline struct intel_context *
>>   g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>>   {
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> index be767eb6ff71..7ae5fd052faf 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> @@ -13,6 +13,7 @@
>>   struct drm_printer;
>>   struct intel_engine_cs;
>>   
>> +void intel_guc_slpc_init_early(struct intel_guc *guc);
> 
> it really does not belong to this .h
> 
>>   void intel_guc_submission_init_early(struct intel_guc *guc);
>>   int intel_guc_submission_init(struct intel_guc *guc);
>>   void intel_guc_submission_enable(struct intel_guc *guc);
>> @@ -50,4 +51,19 @@ static inline bool intel_guc_submission_is_used(struct intel_guc *guc)
>>   	return intel_guc_is_used(guc) && intel_guc_submission_is_wanted(guc);
>>   }
>>   
>> +static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
>> +{
>> +	return guc->slpc_supported;
>> +}
>> +
>> +static inline bool intel_guc_slpc_is_wanted(struct intel_guc *guc)
>> +{
>> +	return guc->slpc_selected;
>> +}
>> +
>> +static inline bool intel_guc_slpc_is_used(struct intel_guc *guc)
>> +{
>> +	return intel_guc_submission_is_used(guc) && intel_guc_slpc_is_wanted(guc);
>> +}
> 
> did you try to define them in intel_guc_slpc.h ?
> 
> note that to avoid circular dependencies you can define slpc struct in
> intel_guc_slpc_types.h and then
> 
> in intel_guc.h:
> 	#include "intel_guc_slpc_types.h" instead of intel_guc_slpc.h
> 
> in intel_guc_slpc.h:
> 	#include "intel_guc.h"
> 	#include "intel_guc_slpc_types.h"
> 	#include "intel_guc_submission.h"
> 

that worked.

Thanks,
Vinay.

>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index 61be0aa81492..dca5f6d0641b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -76,16 +76,18 @@ static void __confirm_options(struct intel_uc *uc)
>>   	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>>   
>>   	drm_dbg(&i915->drm,
>> -		"enable_guc=%d (guc:%s submission:%s huc:%s)\n",
>> +		"enable_guc=%d (guc:%s submission:%s huc:%s slpc:%s)\n",
>>   		i915->params.enable_guc,
>>   		yesno(intel_uc_wants_guc(uc)),
>>   		yesno(intel_uc_wants_guc_submission(uc)),
>> -		yesno(intel_uc_wants_huc(uc)));
>> +		yesno(intel_uc_wants_huc(uc)),
>> +		yesno(intel_uc_wants_guc_slpc(uc)));
>>   
>>   	if (i915->params.enable_guc == 0) {
>>   		GEM_BUG_ON(intel_uc_wants_guc(uc));
>>   		GEM_BUG_ON(intel_uc_wants_guc_submission(uc));
>>   		GEM_BUG_ON(intel_uc_wants_huc(uc));
>> +		GEM_BUG_ON(intel_uc_wants_guc_slpc(uc));
>>   		return;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> index e2da2b6e76e1..38e465fd8a0c 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> @@ -83,6 +83,7 @@ __uc_state_checker(x, func, uses, used)
>>   uc_state_checkers(guc, guc);
>>   uc_state_checkers(huc, huc);
>>   uc_state_checkers(guc, guc_submission);
>> +uc_state_checkers(guc, guc_slpc);
>>   
>>   #undef uc_state_checkers
>>   #undef __uc_state_checker
>>
