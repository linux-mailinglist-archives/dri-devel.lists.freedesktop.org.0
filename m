Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD2078063E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 09:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BA210E46E;
	Fri, 18 Aug 2023 07:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE4810E46E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 07:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692343190; x=1723879190;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VKZH3ZKVjSaGjkkCzHqA9XASWkjI5xr4qlf/2qAc9aE=;
 b=a90ODAm6YfkpvlNRyuypAXR12gLt5Qk67xoxbpYTpeZyJfEsf+tVvLsH
 Ti1gd0WzRoYsyV8afNPG9O/thqRigKQTTcr+7XeeRizmheD84arjW9+IE
 5wKbHYyrv3wnOAaGKsR7BjS8mqg9hvgbZ54HGqhk9sd+3xwkITH9PvxEF
 z4Um6c3PjiynbaYm9mngbKwLkBQVPO5Vo3tT5JHf5uqY4ATH3QAL9buv4
 lu9muaROuzWqACv0nmYLOyqyuDAL7oGbQJnVLBIM9KwCbQxcldqalK9qw
 SsxX0r9WV6qrwCmdNrFXI06/6ycpCAjmsn/p5O3gNpdKkWaT4DkoEKrD9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376792312"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="376792312"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 00:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="908756142"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="908756142"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 18 Aug 2023 00:19:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 00:19:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 00:19:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 00:19:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 00:19:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1OGWKxejUeRaiFath0rp/Xg+KMutVPjdRnO/0VzA9KFleFG9xzd7wYk96cbllS2ff7OezIUiLCu4nPWOTxZjV7qoJhH7SBdLZfGHdYH5+zOjjuGKDAdewXwV8Mb2O7EzkWWJ4wZDrIZC6k/20et99yfRJqT2oEUzgZ80UGcIcquCzPiFbKFNMx+uuUr2QCuANM+DNCE0wxroIa/aGWxfsmsPVBPTa1uFyYJu3iKJUgsJuKjHZpwq+kTBN2dZBRd4vZwM/VNknz+NmQpI33Kno0mfS14Iis9cd03uQmTSt0gYUfHoLbWrUlEtqShI9nBxxnQyLtMvst30337x9Ai1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJTgiNwf1oGV/gmmeXGyPVucO7GhHMJ+bJ4TR35P+Qk=;
 b=l8PMmqt+h3Q2N/RmJ3iXnJbbeZiOKR5OSNe9YnbBnSWt4JK9motym/7IV9JT8Vzgl/r25GwVft4k/iJ8ihZoJE7ceTqbR9Kb0ye+OPq7dD95Qio9huENTZTPyHHIV6gf33anAOMA5HgGnbRTVkID82b8nvlkPMyGBt9g+LPpmTqs18sO83RrOkN4+dCyLqtzmfSHi8JRZ/xfkE4NWJky8BxjdiT4mIA9WYpCUOedvEIU3QbVRN5zbI7CM7seBqx6XcYOVuBokn55dAp9a1NGcF5cgMe+tNZ8qLocCCo8raH9On4/+nPKhWKWk+Vf+FAhTe6f4HU2+mxjNSGey+JqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by BL1PR11MB5463.namprd11.prod.outlook.com (2603:10b6:208:315::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 07:19:44 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::6bdd:42c5:dc9d:dc75]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::6bdd:42c5:dc9d:dc75%4]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 07:19:44 +0000
Message-ID: <0741f41c-51bb-0396-f2dc-e456f7c9e543@intel.com>
Date: Fri, 18 Aug 2023 09:19:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-misc-next] drm/ttm/tests: Require MMU when testing
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>
References: <20230811113649.697886-1-karolina.stolarek@intel.com>
 <c5506f08-f9a1-aa58-58b8-1c5969f85c2e@suse.de>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c5506f08-f9a1-aa58-58b8-1c5969f85c2e@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0291.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::17) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|BL1PR11MB5463:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1f600c-6a62-4897-561f-08db9fbb7e7a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZEe8EeIr/UeUamrRODI/v7LKeV59BZpZpkIZeHVxPWIP9EuprNh7TJ0Ze+sTho6AVy1ViBYJdiKwDGs9SgszvaZeTzYdF5nvt4lrc6Y7BOqo+qYXKFmcCwjTAfIFN8xQzMvZXhLGLCDa/F5R49xl/MKpS1ZHV2VuKs4e7GxluMmhs1ra9kv3awAG2rKYYnTUPEk23FawY7lYnTiCB7rTCVc4oC6Y/PI64xCm01QjYXxrg8v1MfwDTQvQcftqD2YtQYIKtKVgOxHnx9jjDIO8SFtWmqH9mch2ihodEcw6PaWPxASCKlZ4+e8PbntyAIsdw0BE0HnWzWc0Gid/n3IrwdvBzGvFQU8hwHlT4ZFG6GhXW6s6eIQM+lK4HqRs9qDYnLLWQb4LuD86zHAGn5utqijHs95cRSlhTbKBuFV8FJ2rVfoDpSfNdZfn14ohF2q9Uxg7hvOUYo4bo39dXtalSPzJmdk89es5DEZkRB9x/Dm+jMYYBJpND3fD8PSXIynRXc4M3zIGFletYC8HmFIvRIEu0FaAkaHDH+SDTHSXg5cAXmT1qvmVQq7kb/ubBNpYsT22myncjuPFt58ARQ/sj/i4vkfofdetJ6MkSwJ+o89CL+m8WUIpIScKSXahJfySTVCgXjpAAqJZJnS4kvh+TR6ZBAs/DJRLbk3YH5jmdg8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199024)(186009)(1800799009)(2616005)(107886003)(6666004)(6486002)(6512007)(6506007)(36916002)(53546011)(66574015)(83380400001)(44832011)(5660300002)(8936002)(8676002)(4326008)(2906002)(478600001)(966005)(41300700001)(66946007)(54906003)(66476007)(66556008)(316002)(38100700002)(82960400001)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1VKVStqQUhXN3YxcXh5NXhKN1M0aVo4bUpiR1poYjhkeHNTM2w4Ynhad2Iv?=
 =?utf-8?B?dE9ycnNuT2lXaW9SZ0xpVkJLVHQwdzBxR3hoNGhDamZia0MvSFBwTGxxOGtU?=
 =?utf-8?B?MnpVblo3T3pCNmxJdjI5QlFkOWxJOHJ0Q0hHNjhpK2JnTTJnU3pwK2VqcFFO?=
 =?utf-8?B?V0IvMGMxMVphbmdpczBVK3pGNTJFeFY3dnh4QjhaZXlxOW9udXByUko1emkx?=
 =?utf-8?B?bWhzT2JiRXUyanl3MWc0T0RFelpFRWdmT0FwQ0gvNUdHcXN1YjhOY1VGV0pE?=
 =?utf-8?B?QWkybTNZaVJBVkxoS2s1QTBPaHJuZzBhUmxBZUErMjRyQ0p3eWdtdnNmM2Fz?=
 =?utf-8?B?YmpCNEJZRi8zdVRmZnFScDhwT3dvdGJlQUl4NTB3aXRta2Q4T1ZuVFhCLzNQ?=
 =?utf-8?B?SkVWSmJaLy9TdmJjZENVK3dxT0Q0S0pEd01aaXdUWkZ5UVF0V3VaYVUvQ1Z6?=
 =?utf-8?B?T1B1dTA0NDZOM3d3SHhkVGVVcTBNb3pUeHY5MzA2am4vOWZ4RzFzNzFmTlpm?=
 =?utf-8?B?UkJ1Y0FxYVpSUGJ5Q3h2SzdsQ1Z4ZFRIQ2IycG9sckYzZUpKTWtXOExIUEVz?=
 =?utf-8?B?cjNiUzVQbWREeGg1WUNNWVoybUdBR0VLN3RFZ3JLeDFTWWc0MmZWV0dTcW1D?=
 =?utf-8?B?ZkttOFVvRUZrdmU2blVSMzgrSEorWkpjZUdZbmtHZDFqV0tWeDMyWC9zRXVS?=
 =?utf-8?B?Z2lnNWVEZmZXUkZiS1NIbm53N3doT2xWZVNPbGRmaHlKVnRkQVN2YzlCVkJL?=
 =?utf-8?B?ZzFEV0lXakUxY1JTWWpRbE13NUw5N0tLWFB0ZlEzMUN0WCsvWGpDWFZyZU12?=
 =?utf-8?B?MVoxa05zSCs0aC8rRHl5Nld2RGlQVjJFMGt4UEN4R1A1NkRqK3lNZFRrRUZN?=
 =?utf-8?B?NVFldmQ3VEpUUGZwdFNLMW1vS3ZVbWx5WFdaRGFSMUV1NDZPU0pVZS9mcDVY?=
 =?utf-8?B?Q1Zpc3dROFdrMzhCOVBJTDJ4cElEeW9Rbi9hcWxzMTVWUGxzN1ZwUm8ySXdu?=
 =?utf-8?B?UlBjSlBPQkZzOXJFZS9VOTZpNUl3RnVvMTZmaGVySkZtY294bzdlS04yTit2?=
 =?utf-8?B?QjFQa3g4OENYdytjZmpQREtPNk5HQWxnTEwybWV4d0p4UUVTemRUTE0xODdj?=
 =?utf-8?B?V2ZndGJFNGlIS0NMSjBPbCsyUG1WMTdhVkxVQ1BRNDhvdCs0bytMU3NqeE9m?=
 =?utf-8?B?OGVXWlBWRVV3Ui9MUHJOTE5rNUYveHE2Q3Nxa2xPYXZhRUJPTmlkOFdQbXBx?=
 =?utf-8?B?dWZLSDZqUW9ESUREOFRPVFZRNk9HOUFWOGpBWU9sUGk2RmJkS2RRemhTSEVU?=
 =?utf-8?B?dWtHaEdPNDN6bVNML2Uzcng3QW9rSjBHNDcxV3BwZEt5VlA1bllTWktiQWVY?=
 =?utf-8?B?NU1YeW9RMHdCOTRxemVzejNhdWtlUzdpQW9VTjRnNk1OR0lwT2ExMXk0QUpU?=
 =?utf-8?B?aXpoeVczZjZyb0E3RlFRYVdpeHc0Q0J3dmprY0lkejZocnU5QnZoS2FTeit6?=
 =?utf-8?B?VGlWck9rNDljd2RlR01VYjZFLzNia01QT09nRHBhTGRoNmltWG1MbVhFZVNz?=
 =?utf-8?B?MnAvVFhnMkZVSndycEFTZUljUVlkMDVZTmFLeko2ZFVjc1dGVFdlM2R0d3Bl?=
 =?utf-8?B?b2lmSEw2YnpSMFFoaG1TRDg1d09sVTBzeWZGUXVEcSsweWwxTUloeUZTVk1i?=
 =?utf-8?B?VVd4Y2hGQld1YWNCNVF6TUxLcTROa1AwYWt0VUZORFhmY1FwOHd6aHUvTmpM?=
 =?utf-8?B?QWlrSjI5bHdJT3RHNEFIdWxjN3lFNzJheXR5eE96a0twVysrNkVTMGNuYmoz?=
 =?utf-8?B?MEl6TkU2em52eGRZQmp4Q1hjVWNNc1dkWFNPdVUwcU04c3UyQlk3dTVKZW5i?=
 =?utf-8?B?cHlMMmJwb3JuRFE4ZEJscTA3cmFTTXVsMTMyd1VqMHNrcmVrN3N3ajRrWGNa?=
 =?utf-8?B?TCtXZDNDaDlzd3NsbXMzcTNHNUoxZVRJZXZZQ2p6UTBEdTdsbkZMZ3o0enBl?=
 =?utf-8?B?NDMweG5BRnpZOTNBcElOY0tGV2RCenRqUStBWVl4NjRNTW5KaVJvNy9VZ1dE?=
 =?utf-8?B?d1d5cWJlL3FsUkZQRzc4RFJkRVVTZUNvZFAyNVhWdVdPK0o5Yjl4eVlzdk9i?=
 =?utf-8?B?bEt3VnRDdDFOZjhkM245L2w1bFpVTVFib1phZGJUcDFYUkovV0xQU1g5YXhD?=
 =?utf-8?B?NDhMMnVRdWl2RWQvbFJ3NytWVTFydS9iTkpsNXhhR3VqRGkzZTRtdHpDSmUv?=
 =?utf-8?B?cVlqRlBGeG5VTVRqN1lrb21VVkpBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1f600c-6a62-4897-561f-08db9fbb7e7a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 07:19:43.9942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SF4ESvtXk36P+seCSHJqlMAB6v0b4U6Yn1ibwz0BZpX13DYW6YM+Wz+XA/gN/jNgDZAFqoYGlwWsPwtEb3L7CE6zs9wZ0Cozogk2jCd+5V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5463
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, kernel test
 robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 17.08.2023 15:11, Thomas Zimmermann wrote:
> Hi
> 
> I've cherry-picked the patch into drm-misc-next-fixes, so it will show 
> up in upstream soon.

Many thanks for your help. I'm sorry this one slipped through.

> 
> Am 11.08.23 um 13:36 schrieb Karolina Stolarek:
>> Satisfy MMU dependency when testing TTM with KUnit. This fixes
>> compilation errors on platforms that don't select this option
>> by default.
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202308110133.f0lhFwMV-lkp@intel.com/
>> Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202308111032.enU8IisR-lkp@intel.com/
> 
> This should have also mentioned
> 
> Fixes: e3912d09bf8d ("drm/ttm: Introduce KUnit test")

I wasn't sure if for the "Fixes" tag I can refer to drm-misc-next 
commits, so I left it out.

All the best,
Karolina

> 
> Best regards
> Thomas
> 
>> ---
>>   drivers/gpu/drm/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 9d1f0e04fd56..ab9ef1c20349 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -198,7 +198,7 @@ config DRM_TTM
>>   config DRM_TTM_KUNIT_TEST
>>           tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
>>           default n
>> -        depends on DRM && KUNIT
>> +        depends on DRM && KUNIT && MMU
>>           select DRM_TTM
>>           select DRM_EXPORT_FOR_TESTS if m
>>           select DRM_KUNIT_TEST_HELPERS
> 
