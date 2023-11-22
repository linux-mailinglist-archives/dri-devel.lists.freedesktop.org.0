Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3FE7F4409
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 11:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6816210E5C8;
	Wed, 22 Nov 2023 10:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A1910E5C8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 10:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700649585; x=1732185585;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zd3axI3Kk54u6J4UtZlRBAD+cm0WoCSogfWk9z+UpQ4=;
 b=jmBQBy0DVa8LhWXAOlXIzDvcrbgwKJkkVc6DUjdiCcXZllJE7EzWykpB
 DHUgX2CS72F8+wcG1pLEEbXXNg5eagcxR2Y0yGBEydJQ1MnOMoWOVvm2C
 AUbAehSlvx/R1g5fcMOLKCLBCXWOBfgKWTLB7/PTgVDrIiTm1DMyEMblc
 2jEuFV0zfsJS696QaQVXBT6ocnoGK/+8UgtmrMc0labSSg8SRxoSCC9yY
 BPLmbTZ1G/ZbO6vEc78QQkIsLfw9LyQGHuZMCQ0ZGPH3NjMFyZKZMzeNJ
 TnnFEAMM4IMRa/znUoCsdTPyXKFpClaHsJY12/jS0RET9WUD9PA9R6ZhH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="395949689"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="395949689"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 02:39:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857671230"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="857671230"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 02:39:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 02:39:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 02:39:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 02:39:42 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 02:39:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7sjODPcY2pvoCRKChyWZI0nxECCozuVlRjNAeN4Y6RjYKW/c58gGP3cMYkeqV9oiVxaLJjP0MD1Sp535LKV9wDFFRXeFtBUhxQeAJhdsRInkHpr/xRii8KoTaT+GWJs6vXQakCOU9kPpQs9uyDTwFoFsAOudQPGvFtmnFlOF5aOjbtEQ65VRm7JHPlmsjxc8a4xY6l/Hs8X2X1ktFnuNEyMy8x4r1XNbH1Zhh6PCw8zWCTVx8sF7mnyCtCacY2ve9mjCU99HM1pqtYi6VUHcf0yg8jQXC5YElTRpV4uZZVUa1n1GryQO8UBAPzmpCWUNZKFSBGKnvUnc8Z0+te7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr+h0ozqdHFNtuLwkr0zR/nR3UllnIOCYZQ+w0ClKNs=;
 b=GYbLCdh8PxtdRpqWO5Cri+fm32j8dxApswNXz4KgacHUm58E8Ew/GSSBypN2UEWM6nYWs9YG1pjirmCYndpTR2YrZcgm/wsTSACIHv3N2yAMaezHB/LoLzHCg8/64yDhWAYiMoY3q0lmoEjGrEKwP1xQj///Tn70MCSX5AvdcAgNBuXRhX0mgxFEOMyBDxjJPq4Ln8lrRUgK0z6Zt58iIAWAtKLlXdOTgUbFYu6dbxEcSfyVlI89CuT8gQtZrv6TxXjRcXkyf9Yo9H4WyjTX1iVgtRzF5ZLVtsmos5OOsVKzucu9/mRPNjjIdatOq5ci0N4gdpz3nYnVnp+CL8xY1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DS0PR11MB7768.namprd11.prod.outlook.com (2603:10b6:8:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 10:39:40 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::e053:28ad:6a0e:9692]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::e053:28ad:6a0e:9692%6]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 10:39:39 +0000
Message-ID: <fdd06c82-fb3c-410a-a01f-cc64f3eaf17e@intel.com>
Date: Wed, 22 Nov 2023 11:39:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] drm/ttm/tests: Add tests for ttm_bo functions
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <cover.1700207346.git.karolina.stolarek@intel.com>
 <61e723d67ebf8eaec226eea176fa19da1994a3b7.1700207346.git.karolina.stolarek@intel.com>
 <767a8420-d2e4-43f9-87ee-1c32382d7e0b@amd.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <767a8420-d2e4-43f9-87ee-1c32382d7e0b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DS0PR11MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: d4345516-847a-4d6b-ddaa-08dbeb4753a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oy8mzLrT346GbExbT8djoUmKAHHIatX/0rtAgT48OgOCnHZ2f3rM0Wv4EmY0axteIpt2phlG1mZA1eczBLF4iuxD0gAsN/DNNsfRknhpXWSB+MwuCpJaoK4nVH/s0tSzgM2n2Bxaq3tKv+yECOlzFhjK1ypdSUFmLG3V8kqJAIyU0FvtQQAlWH2Jd6ftipQ5jhRRUPWBtBKeOOgwAI1omFd6D7QUZjFDyX4O2Cgc/5eAWTTlyZNAarpIoY/GSnPbfwF4Hm4yzQYIkaAYuI2pyALxhizig0eF9G9QFVZMRwbsa6l+2PDmpTqFB3cNgEJAZCwfXrH4k5lpamJxc6MJglIbIj8ftjpnTHbqvdDE7JHSu6TAvdBT5uZJ76rdypiNH5qYHyMz+hXqD/VLYX8REKWJ/4ilKS8Ri0Ygmu7oY3GdT39w3OiAWpj8BMHvnV0Kzrb6aCM5dPDGUPS1yQ2PFfpT4O1LgNnU8kuFH0YlannfALtEe61/H1R7xegyAXa6oM5PXTZvSlBTe8j002/v5edaCkSGSyHUwIB2JCd2eAhc6vZuuzLepcAT4dG0bSpE0FxMM5YSxSsNlc/r936ZPNzPEuCJC54PVL2K65jNuQEEcOPHgqKsRZvJvAp5ER5vfLiI+8agW/NzZ7u3VTzfxcXL7DE7LN7iDnSi1WgTTtMsHNwMcFfrZAv0UUPkvqOw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(346002)(136003)(366004)(230273577357003)(230922051799003)(230173577357003)(451199024)(1800799012)(186009)(64100799003)(26005)(83380400001)(66574015)(36916002)(53546011)(6666004)(6506007)(2616005)(6512007)(44832011)(5660300002)(4326008)(8676002)(8936002)(41300700001)(30864003)(2906002)(6486002)(478600001)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(31696002)(86362001)(36756003)(38100700002)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjY0K3lTSEpBZVFxRGQ3bGNBQjF3ekkxZUZMZHRwZjMrOHp5ZkMrOHJYYnRv?=
 =?utf-8?B?MGhIQXpUa2hJRTI0VG5kUkFFNG4yU3RXek9YVDRPOFpBNmQvVlJXV1ZzLzhS?=
 =?utf-8?B?ZkRDM0N6cERFQTM5VWVpOWw3Tm91eWpZV1J4SFdjZWk4Q1RFd1NTVXdpVjVo?=
 =?utf-8?B?bncyeWVzWTRSQmFRWno4dHpKNkNQd0hRZXBOU3hDeTAxRzYrMVFzQ3ZJOW5D?=
 =?utf-8?B?b2oyZFJNOE1IcUN4RW5RcGU4M0ZpZVlzdDhGaG82d0s0bVRqb3dCZkJoOFQx?=
 =?utf-8?B?NlBnMmladmpmMUdDQklYQWF6M0UxbDBrT055RE00MjByb1ZFR25CNHpzVjVt?=
 =?utf-8?B?akswUEsrVHdUV1RoaUZtVHllaHMrellySWtRTXJsSk45OEhFc1VQK1FEOVRo?=
 =?utf-8?B?NXFrMWJDQk53NGVEWG1GYnJiTHJnbXJkNEd2c0ZlY0RWT1RWSWtSbU5FYzVX?=
 =?utf-8?B?aWovTHJMNWVZTGxNUTZoU1hJZ2RwZzFoN093dHc5NkYwMkk3MEt5S2UrYTRs?=
 =?utf-8?B?QldaeUlDZElFZ3MyZEFJRGFGSVp1UWFoOHlFOXRBY2JLeDZTT285TEwvNUR1?=
 =?utf-8?B?Q0M4ckRPNmZnTE5wcXd2ZVV5d1YrZldpWjZnc2JaWThmaFVnb2hZNVNIMU1s?=
 =?utf-8?B?MGtLT21SV25GOTBzU0FFQ1g3aWtWRG54KzJkUldzeXRxOEVpMHZxcTZqQU85?=
 =?utf-8?B?NnphSW5tWVNlVHpRNU5BZGNDSjFER1N0TU0rUDNnc2R1VStmaXppS1l3cXpt?=
 =?utf-8?B?SGNHamVpZXpIcEJmVnA5L0tlanpUTGl0b1FrYUJyZlNGNmVheE9FUjdGSXJ1?=
 =?utf-8?B?dWV6WGFMdGd3R2lEZXgwOXlVUHZPTFRwclQ5T0RpMThnUVlVY2hsbWpkN1Z2?=
 =?utf-8?B?cjJ0MTEyWCtESXpuWDRmRDNDYkFSWXdRZGg4NUQwdDBDT01nS3NvcXVlNkRS?=
 =?utf-8?B?YnU3OC9lZ2ZGUnhVcHBXc0RMRHJiSk53OXEyTjBCV0U5aXk1c3ZmeVdaNDVS?=
 =?utf-8?B?dVVxd0gvL21sU2RIVFJNc2lhZDZNYk1IaXlLNXRVak9WOW9LSVpDVXRMSkUv?=
 =?utf-8?B?c2EwNVBFdlg4aGV3VFRvYXRvQnhYOWJjc3JCUU1jVEhYUkNWcjNRVy9pVVBr?=
 =?utf-8?B?Y28wNkc2M0RwN3dxWGRnb3VReTFPb1RlNDVDNFdoczhsNHdhL3cyTXVaS0do?=
 =?utf-8?B?aXNmWGZXN3BSaDg2MkdCL0lodDA0RnNUcmJvYTNRUUlRVEVvQm5xelhmQ3hB?=
 =?utf-8?B?QmZteE5BU2ZMNjVRUjR3ZUtVb084Z241azVEejdhMXZYSHlRelRyYTMxN0xy?=
 =?utf-8?B?S1NGQzV1QVpudkFCY0dpdkMxVmE0VnpNcnB4dWl3QXpyT2R6N1ZlY2h1V011?=
 =?utf-8?B?ZEVUaStpbnRFWjFmaHY3Q1I5S3pzaDd5WUxvNUZZY24zVTJEMzZGZkFQRWph?=
 =?utf-8?B?QkdiOVhXWVVpRG1XTDFXTTNWK2x4dEVIVEpqOEgwTkxFcnN3aURqTzJBMjNq?=
 =?utf-8?B?Y2xnajJQdDlsVEh3ekgybEtERnFmVmxiaC9LV3dScWJrb2E2cGo1N0QzbDIv?=
 =?utf-8?B?SXZudkZWa1hNb1dlZ2o2dUJDcFJLMGd5cU1IZHo1a29ZMXI1cWxXeWtYVFBj?=
 =?utf-8?B?QmppL0ZEcS9Yd2w3TUxZZDUwL3ZZU25qWTVRTlM5dGtucDkxT3UxTjIzbndz?=
 =?utf-8?B?SjgyaGppbVdZeXU2N0kwb0ZoSVBwQ2lXZUtkbWc1dnFSL3RZelMxMS9qbWpL?=
 =?utf-8?B?R2dDWURjUk1Vakk4eWJpQTJtczJoZlg5VHBFTzZUaFhBV1dIZlZHdkRvd3A3?=
 =?utf-8?B?M0lHaGpzZkQ0Y1JyNE1DV2JET3ZTMHFNMFpLMkRDWUNXdHcra2NJZGxDcHcv?=
 =?utf-8?B?M1h0bFVKNmNwcEh1amV4dXYva3F6RllKUGFMSkNGV3IvTXE3NWc4QWhqbnN2?=
 =?utf-8?B?VzNaazhzU2lMWk1ybXI5RzhjbHkxWlZicE1nQmpKUHcxRm4yZ0ZMai9nTjVY?=
 =?utf-8?B?czlqY04wOTNtM1ZCTDhzWGp6bktMcy9MeHlzWXFtU0tNY1pRQzM4dGRKVmNi?=
 =?utf-8?B?dHowd09vNzBqcUZ0eWxQa2ZsSTFlK1U5OWcwdGNSMkZVMUwxekFSMTE4SHlu?=
 =?utf-8?B?aGRiY1BzUk1teituaExGbkZvRDRpY21xWWJnbll6Y1FPQVlidE9ZaW85bzNs?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4345516-847a-4d6b-ddaa-08dbeb4753a8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:39:38.6873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQGMZg5WpzWlRBNSrQHQLo+ej9EXGTIwboJ+Ljn7SGoDbiynSEMAfOY6kzN8UZ6YbratBYslp1RxoBTRShQV0wbmCKKtTQjbHYpM+aplJ1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7768
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21.11.2023 15:29, Christian König wrote:
> Am 17.11.23 um 09:49 schrieb Karolina Stolarek:
>> Test reservation and release of TTM buffer objects. Add tests to check
>> pin and unpin operations.
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> Tested-by: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>
> 
>  From the TTM side it looks good, but I can't judge if the lockdep hack 
> in the deadlock test is valid or not.
> 
> Feel free to add Acked-by: Christian König <christian.koenig@amd.com>.

Thanks a lot for taking a look. I'll get someone else to verify if that
hack makes sense.

All the best,
Karolina

> 
> Regards,
> Christian.
> 
>> ---
>>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 ++++++++++++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |   6 +
>>   3 files changed, 626 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>> b/drivers/gpu/drm/ttm/tests/Makefile
>> index f570530bbb60..468535f7eed2 100644
>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>           ttm_pool_test.o \
>>           ttm_resource_test.o \
>>           ttm_tt_test.o \
>> +        ttm_bo_test.o \
>>           ttm_kunit_helpers.o
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> new file mode 100644
>> index 000000000000..71bca47205ed
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> @@ -0,0 +1,619 @@
>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#include <linux/dma-resv.h>
>> +#include <linux/kthread.h>
>> +#include <linux/delay.h>
>> +#include <linux/timer.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/mutex.h>
>> +#include <linux/ww_mutex.h>
>> +
>> +#include <drm/ttm/ttm_resource.h>
>> +#include <drm/ttm/ttm_placement.h>
>> +#include <drm/ttm/ttm_tt.h>
>> +
>> +#include "ttm_kunit_helpers.h"
>> +
>> +#define BO_SIZE        SZ_8K
>> +
>> +struct ttm_bo_test_case {
>> +    const char *description;
>> +    bool interruptible;
>> +    bool no_wait;
>> +};
>> +
>> +static const struct ttm_bo_test_case ttm_bo_reserved_cases[] = {
>> +    {
>> +        .description = "Cannot be interrupted and sleeps",
>> +        .interruptible = false,
>> +        .no_wait = false,
>> +    },
>> +    {
>> +        .description = "Cannot be interrupted, locks straight away",
>> +        .interruptible = false,
>> +        .no_wait = true,
>> +    },
>> +    {
>> +        .description = "Can be interrupted, sleeps",
>> +        .interruptible = true,
>> +        .no_wait = false,
>> +    },
>> +};
>> +
>> +static void ttm_bo_init_case_desc(const struct ttm_bo_test_case *t,
>> +                  char *desc)
>> +{
>> +    strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
>> +}
>> +
>> +KUNIT_ARRAY_PARAM(ttm_bo_reserve, ttm_bo_reserved_cases, 
>> ttm_bo_init_case_desc);
>> +
>> +static void ttm_bo_reserve_optimistic_no_ticket(struct kunit *test)
>> +{
>> +    const struct ttm_bo_test_case *params = test->param_value;
>> +    struct ttm_buffer_object *bo;
>> +    int err;
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +
>> +    err = ttm_bo_reserve(bo, params->interruptible, params->no_wait, 
>> NULL);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    dma_resv_unlock(bo->base.resv);
>> +}
>> +
>> +static void ttm_bo_reserve_locked_no_sleep(struct kunit *test)
>> +{
>> +    struct ttm_buffer_object *bo;
>> +    bool interruptible = false;
>> +    bool no_wait = true;
>> +    int err;
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +
>> +    /* Let's lock it beforehand */
>> +    dma_resv_lock(bo->base.resv, NULL);
>> +
>> +    err = ttm_bo_reserve(bo, interruptible, no_wait, NULL);
>> +    dma_resv_unlock(bo->base.resv);
>> +
>> +    KUNIT_ASSERT_EQ(test, err, -EBUSY);
>> +}
>> +
>> +static void ttm_bo_reserve_no_wait_ticket(struct kunit *test)
>> +{
>> +    struct ttm_buffer_object *bo;
>> +    struct ww_acquire_ctx ctx;
>> +    bool interruptible = false;
>> +    bool no_wait = true;
>> +    int err;
>> +
>> +    ww_acquire_init(&ctx, &reservation_ww_class);
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +
>> +    err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
>> +    KUNIT_ASSERT_EQ(test, err, -EBUSY);
>> +
>> +    ww_acquire_fini(&ctx);
>> +}
>> +
>> +static void ttm_bo_reserve_double_resv(struct kunit *test)
>> +{
>> +    struct ttm_buffer_object *bo;
>> +    struct ww_acquire_ctx ctx;
>> +    bool interruptible = false;
>> +    bool no_wait = false;
>> +    int err;
>> +
>> +    ww_acquire_init(&ctx, &reservation_ww_class);
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +
>> +    err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
>> +
>> +    dma_resv_unlock(bo->base.resv);
>> +    ww_acquire_fini(&ctx);
>> +
>> +    KUNIT_ASSERT_EQ(test, err, -EALREADY);
>> +}
>> +
>> +/*
>> + * A test case heavily inspired by ww_test_edeadlk_normal(). Checks
>> + * if -EDEADLK is properly propagated by ttm_bo_reserve()
>> + */
>> +static void ttm_bo_reserve_deadlock(struct kunit *test)
>> +{
>> +    struct ttm_buffer_object *bo1, *bo2;
>> +    struct ww_acquire_ctx ctx1, ctx2;
>> +    bool interruptible = false;
>> +    bool no_wait = false;
>> +    int err;
>> +
>> +    bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +    bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +
>> +    ww_acquire_init(&ctx1, &reservation_ww_class);
>> +    mutex_lock(&bo2->base.resv->lock.base);
>> +
>> +    /* The deadlock will be caught by WW mutex, don't warn about it */
>> +    lock_release(&bo2->base.resv->lock.base.dep_map, 1);
>> +
>> +    bo2->base.resv->lock.ctx = &ctx2;
>> +    ctx2 = ctx1;
>> +    ctx2.stamp--; /* Make the context holding the lock younger */
>> +
>> +    err = ttm_bo_reserve(bo1, interruptible, no_wait, &ctx1);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    err = ttm_bo_reserve(bo2, interruptible, no_wait, &ctx1);
>> +    KUNIT_ASSERT_EQ(test, err, -EDEADLK);
>> +
>> +    dma_resv_unlock(bo1->base.resv);
>> +    ww_acquire_fini(&ctx1);
>> +}
>> +
>> +#if IS_BUILTIN(CONFIG_DRM_TTM_KUNIT_TEST)
>> +struct signal_timer {
>> +    struct timer_list timer;
>> +    struct ww_acquire_ctx *ctx;
>> +};
>> +
>> +static void signal_for_ttm_bo_reserve(struct timer_list *t)
>> +{
>> +    struct signal_timer *s_timer = from_timer(s_timer, t, timer);
>> +    struct task_struct *task = s_timer->ctx->task;
>> +
>> +    do_send_sig_info(SIGTERM, SEND_SIG_PRIV, task, PIDTYPE_PID);
>> +}
>> +
>> +static int threaded_ttm_bo_reserve(void *arg)
>> +{
>> +    struct ttm_buffer_object *bo = arg;
>> +    struct signal_timer s_timer;
>> +    struct ww_acquire_ctx ctx;
>> +    bool interruptible = true;
>> +    bool no_wait = false;
>> +    int err;
>> +
>> +    ww_acquire_init(&ctx, &reservation_ww_class);
>> +
>> +    /* Prepare a signal that will interrupt the reservation attempt */
>> +    timer_setup_on_stack(&s_timer.timer, &signal_for_ttm_bo_reserve, 0);
>> +    s_timer.ctx = &ctx;
>> +
>> +    mod_timer(&s_timer.timer, msecs_to_jiffies(100));
>> +
>> +    err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
>> +
>> +    timer_delete_sync(&s_timer.timer);
>> +    destroy_timer_on_stack(&s_timer.timer);
>> +
>> +    ww_acquire_fini(&ctx);
>> +
>> +    return err;
>> +}
>> +
>> +static void ttm_bo_reserve_interrupted(struct kunit *test)
>> +{
>> +    struct ttm_buffer_object *bo;
>> +    struct task_struct *task;
>> +    int err;
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +
>> +    task = kthread_create(threaded_ttm_bo_reserve, bo, 
>> "ttm-bo-reserve");
>> +
>> +    if (IS_ERR(task))
>> +        KUNIT_FAIL(test, "Couldn't create ttm bo reserve task\n");
>> +
>> +    /* Take a lock so the threaded reserve has to wait */
>> +    mutex_lock(&bo->base.resv->lock.base);
>> +
>> +    wake_up_process(task);
>> +    msleep(20);
>> +    err = kthread_stop(task);
>> +
>> +    mutex_unlock(&bo->base.resv->lock.base);
>> +
>> +    KUNIT_ASSERT_EQ(test, err, -ERESTARTSYS);
>> +}
>> +#endif /* IS_BUILTIN(CONFIG_DRM_TTM_KUNIT_TEST) */
>> +
>> +static void ttm_bo_unreserve_basic(struct kunit *test)
>> +{
>> +    struct ttm_test_devices *priv = test->priv;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_device *ttm_dev;
>> +    struct ttm_resource *res1, *res2;
>> +    struct ttm_place *place;
>> +    struct ttm_resource_manager *man;
>> +    unsigned int bo_prio = TTM_MAX_BO_PRIORITY - 1;
>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>> +    int err;
>> +
>> +    place = ttm_place_kunit_init(test, mem_type, 0);
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_device_kunit_init(priv, ttm_dev, false, false);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    priv->ttm_dev = ttm_dev;
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +    bo->priority = bo_prio;
>> +
>> +    err = ttm_resource_alloc(bo, place, &res1);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    bo->resource = res1;
>> +
>> +    /* Add a dummy resource to populate LRU */
>> +    ttm_resource_alloc(bo, place, &res2);
>> +
>> +    dma_resv_lock(bo->base.resv, NULL);
>> +    ttm_bo_unreserve(bo);
>> +
>> +    man = ttm_manager_type(priv->ttm_dev, mem_type);
>> +    KUNIT_ASSERT_EQ(test,
>> +            list_is_last(&res1->lru, &man->lru[bo->priority]), 1);
>> +
>> +    ttm_resource_free(bo, &res2);
>> +    ttm_resource_free(bo, &res1);
>> +}
>> +
>> +static void ttm_bo_unreserve_pinned(struct kunit *test)
>> +{
>> +    struct ttm_test_devices *priv = test->priv;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_device *ttm_dev;
>> +    struct ttm_resource *res1, *res2;
>> +    struct ttm_place *place;
>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>> +    int err;
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_device_kunit_init(priv, ttm_dev, false, false);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    priv->ttm_dev = ttm_dev;
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +    place = ttm_place_kunit_init(test, mem_type, 0);
>> +
>> +    dma_resv_lock(bo->base.resv, NULL);
>> +    ttm_bo_pin(bo);
>> +
>> +    err = ttm_resource_alloc(bo, place, &res1);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    bo->resource = res1;
>> +
>> +    /* Add a dummy resource to the pinned list */
>> +    err = ttm_resource_alloc(bo, place, &res2);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    KUNIT_ASSERT_EQ(test,
>> +            list_is_last(&res2->lru, &priv->ttm_dev->pinned), 1);
>> +
>> +    ttm_bo_unreserve(bo);
>> +    KUNIT_ASSERT_EQ(test,
>> +            list_is_last(&res1->lru, &priv->ttm_dev->pinned), 1);
>> +
>> +    ttm_resource_free(bo, &res1);
>> +    ttm_resource_free(bo, &res2);
>> +}
>> +
>> +static void ttm_bo_unreserve_bulk(struct kunit *test)
>> +{
>> +    struct ttm_test_devices *priv = test->priv;
>> +    struct ttm_lru_bulk_move lru_bulk_move;
>> +    struct ttm_lru_bulk_move_pos *pos;
>> +    struct ttm_buffer_object *bo1, *bo2;
>> +    struct ttm_resource *res1, *res2;
>> +    struct ttm_device *ttm_dev;
>> +    struct ttm_place *place;
>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>> +    unsigned int bo_priority = 0;
>> +    int err;
>> +
>> +    ttm_lru_bulk_move_init(&lru_bulk_move);
>> +
>> +    place = ttm_place_kunit_init(test, mem_type, 0);
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_device_kunit_init(priv, ttm_dev, false, false);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    priv->ttm_dev = ttm_dev;
>> +
>> +    bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +    bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +
>> +    dma_resv_lock(bo1->base.resv, NULL);
>> +    ttm_bo_set_bulk_move(bo1, &lru_bulk_move);
>> +    dma_resv_unlock(bo1->base.resv);
>> +
>> +    err = ttm_resource_alloc(bo1, place, &res1);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    bo1->resource = res1;
>> +
>> +    dma_resv_lock(bo2->base.resv, NULL);
>> +    ttm_bo_set_bulk_move(bo2, &lru_bulk_move);
>> +    dma_resv_unlock(bo2->base.resv);
>> +
>> +    err = ttm_resource_alloc(bo2, place, &res2);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    bo2->resource = res2;
>> +
>> +    ttm_bo_reserve(bo1, false, false, NULL);
>> +    ttm_bo_unreserve(bo1);
>> +
>> +    pos = &lru_bulk_move.pos[mem_type][bo_priority];
>> +    KUNIT_ASSERT_PTR_EQ(test, res1, pos->last);
>> +
>> +    ttm_resource_free(bo1, &res1);
>> +    ttm_resource_free(bo2, &res2);
>> +}
>> +
>> +static void ttm_bo_put_basic(struct kunit *test)
>> +{
>> +    struct ttm_test_devices *priv = test->priv;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_resource *res;
>> +    struct ttm_device *ttm_dev;
>> +    struct ttm_place *place;
>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>> +    int err;
>> +
>> +    place = ttm_place_kunit_init(test, mem_type, 0);
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_device_kunit_init(priv, ttm_dev, false, false);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    priv->ttm_dev = ttm_dev;
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +    bo->type = ttm_bo_type_device;
>> +
>> +    err = ttm_resource_alloc(bo, place, &res);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    bo->resource = res;
>> +
>> +    dma_resv_lock(bo->base.resv, NULL);
>> +    err = ttm_tt_create(bo, false);
>> +    dma_resv_unlock(bo->base.resv);
>> +    KUNIT_EXPECT_EQ(test, err, 0);
>> +
>> +    ttm_bo_put(bo);
>> +}
>> +
>> +static const char *mock_name(struct dma_fence *f)
>> +{
>> +    return "kunit-ttm-bo-put";
>> +}
>> +
>> +static const struct dma_fence_ops mock_fence_ops = {
>> +    .get_driver_name = mock_name,
>> +    .get_timeline_name = mock_name,
>> +};
>> +
>> +static void ttm_bo_put_shared_resv(struct kunit *test)
>> +{
>> +    struct ttm_test_devices *priv = test->priv;
>> +    struct ttm_buffer_object *bo;
>> +    struct dma_resv *external_resv;
>> +    struct dma_fence *fence;
>> +    /* A dummy DMA fence lock */
>> +    spinlock_t fence_lock;
>> +    struct ttm_device *ttm_dev;
>> +    int err;
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_device_kunit_init(priv, ttm_dev, false, false);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    priv->ttm_dev = ttm_dev;
>> +
>> +    external_resv = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, external_resv);
>> +
>> +    dma_resv_init(external_resv);
>> +
>> +    fence = kunit_kzalloc(test, sizeof(*fence), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, fence);
>> +
>> +    spin_lock_init(&fence_lock);
>> +    dma_fence_init(fence, &mock_fence_ops, &fence_lock, 0, 0);
>> +
>> +    dma_resv_lock(external_resv, NULL);
>> +    dma_resv_reserve_fences(external_resv, 1);
>> +    dma_resv_add_fence(external_resv, fence, DMA_RESV_USAGE_BOOKKEEP);
>> +    dma_resv_unlock(external_resv);
>> +
>> +    dma_fence_signal(fence);
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +    bo->type = ttm_bo_type_device;
>> +    bo->base.resv = external_resv;
>> +
>> +    ttm_bo_put(bo);
>> +}
>> +
>> +static void ttm_bo_pin_basic(struct kunit *test)
>> +{
>> +    struct ttm_test_devices *priv = test->priv;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_device *ttm_dev;
>> +    unsigned int no_pins = 3;
>> +    int err;
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_device_kunit_init(priv, ttm_dev, false, false);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    priv->ttm_dev = ttm_dev;
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +
>> +    for (int i = 0; i < no_pins; i++) {
>> +        dma_resv_lock(bo->base.resv, NULL);
>> +        ttm_bo_pin(bo);
>> +        dma_resv_unlock(bo->base.resv);
>> +    }
>> +
>> +    KUNIT_ASSERT_EQ(test, bo->pin_count, no_pins);
>> +}
>> +
>> +static void ttm_bo_pin_unpin_resource(struct kunit *test)
>> +{
>> +    struct ttm_test_devices *priv = test->priv;
>> +    struct ttm_lru_bulk_move lru_bulk_move;
>> +    struct ttm_lru_bulk_move_pos *pos;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_resource *res;
>> +    struct ttm_device *ttm_dev;
>> +    struct ttm_place *place;
>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>> +    unsigned int bo_priority = 0;
>> +    int err;
>> +
>> +    ttm_lru_bulk_move_init(&lru_bulk_move);
>> +
>> +    place = ttm_place_kunit_init(test, mem_type, 0);
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_device_kunit_init(priv, ttm_dev, false, false);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    priv->ttm_dev = ttm_dev;
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +
>> +    err = ttm_resource_alloc(bo, place, &res);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    bo->resource = res;
>> +
>> +    dma_resv_lock(bo->base.resv, NULL);
>> +    ttm_bo_set_bulk_move(bo, &lru_bulk_move);
>> +    ttm_bo_pin(bo);
>> +    dma_resv_unlock(bo->base.resv);
>> +
>> +    pos = &lru_bulk_move.pos[mem_type][bo_priority];
>> +
>> +    KUNIT_ASSERT_EQ(test, bo->pin_count, 1);
>> +    KUNIT_ASSERT_NULL(test, pos->first);
>> +    KUNIT_ASSERT_NULL(test, pos->last);
>> +
>> +    dma_resv_lock(bo->base.resv, NULL);
>> +    ttm_bo_unpin(bo);
>> +    dma_resv_unlock(bo->base.resv);
>> +
>> +    KUNIT_ASSERT_PTR_EQ(test, res, pos->last);
>> +    KUNIT_ASSERT_EQ(test, bo->pin_count, 0);
>> +
>> +    ttm_resource_free(bo, &res);
>> +}
>> +
>> +static void ttm_bo_multiple_pin_one_unpin(struct kunit *test)
>> +{
>> +    struct ttm_test_devices *priv = test->priv;
>> +    struct ttm_lru_bulk_move lru_bulk_move;
>> +    struct ttm_lru_bulk_move_pos *pos;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_resource *res;
>> +    struct ttm_device *ttm_dev;
>> +    struct ttm_place *place;
>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>> +    unsigned int bo_priority = 0;
>> +    int err;
>> +
>> +    ttm_lru_bulk_move_init(&lru_bulk_move);
>> +
>> +    place = ttm_place_kunit_init(test, mem_type, 0);
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_device_kunit_init(priv, ttm_dev, false, false);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    priv->ttm_dev = ttm_dev;
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +
>> +    err = ttm_resource_alloc(bo, place, &res);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    bo->resource = res;
>> +
>> +    dma_resv_lock(bo->base.resv, NULL);
>> +    ttm_bo_set_bulk_move(bo, &lru_bulk_move);
>> +
>> +    /* Multiple pins */
>> +    ttm_bo_pin(bo);
>> +    ttm_bo_pin(bo);
>> +
>> +    dma_resv_unlock(bo->base.resv);
>> +
>> +    pos = &lru_bulk_move.pos[mem_type][bo_priority];
>> +
>> +    KUNIT_ASSERT_EQ(test, bo->pin_count, 2);
>> +    KUNIT_ASSERT_NULL(test, pos->first);
>> +    KUNIT_ASSERT_NULL(test, pos->last);
>> +
>> +    dma_resv_lock(bo->base.resv, NULL);
>> +    ttm_bo_unpin(bo);
>> +    dma_resv_unlock(bo->base.resv);
>> +
>> +    KUNIT_ASSERT_EQ(test, bo->pin_count, 1);
>> +    KUNIT_ASSERT_NULL(test, pos->first);
>> +    KUNIT_ASSERT_NULL(test, pos->last);
>> +
>> +    dma_resv_lock(bo->base.resv, NULL);
>> +    ttm_bo_unpin(bo);
>> +    dma_resv_unlock(bo->base.resv);
>> +
>> +    ttm_resource_free(bo, &res);
>> +}
>> +
>> +static struct kunit_case ttm_bo_test_cases[] = {
>> +    KUNIT_CASE_PARAM(ttm_bo_reserve_optimistic_no_ticket,
>> +             ttm_bo_reserve_gen_params),
>> +    KUNIT_CASE(ttm_bo_reserve_locked_no_sleep),
>> +    KUNIT_CASE(ttm_bo_reserve_no_wait_ticket),
>> +    KUNIT_CASE(ttm_bo_reserve_double_resv),
>> +#if IS_BUILTIN(CONFIG_DRM_TTM_KUNIT_TEST)
>> +    KUNIT_CASE(ttm_bo_reserve_interrupted),
>> +#endif
>> +    KUNIT_CASE(ttm_bo_reserve_deadlock),
>> +    KUNIT_CASE(ttm_bo_unreserve_basic),
>> +    KUNIT_CASE(ttm_bo_unreserve_pinned),
>> +    KUNIT_CASE(ttm_bo_unreserve_bulk),
>> +    KUNIT_CASE(ttm_bo_put_basic),
>> +    KUNIT_CASE(ttm_bo_put_shared_resv),
>> +    KUNIT_CASE(ttm_bo_pin_basic),
>> +    KUNIT_CASE(ttm_bo_pin_unpin_resource),
>> +    KUNIT_CASE(ttm_bo_multiple_pin_one_unpin),
>> +    {}
>> +};
>> +
>> +static struct kunit_suite ttm_bo_test_suite = {
>> +    .name = "ttm_bo",
>> +    .init = ttm_test_devices_init,
>> +    .exit = ttm_test_devices_fini,
>> +    .test_cases = ttm_bo_test_cases,
>> +};
>> +
>> +kunit_test_suites(&ttm_bo_test_suite);
>> +
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> index ba4e5c689164..7b7c1fa805fc 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> @@ -22,6 +22,10 @@ static void ttm_tt_simple_destroy(struct ttm_device 
>> *bdev, struct ttm_tt *ttm)
>>       kfree(ttm);
>>   }
>> +static void dummy_ttm_bo_destroy(struct ttm_buffer_object *bo)
>> +{
>> +}
>> +
>>   struct ttm_device_funcs ttm_dev_funcs = {
>>       .ttm_tt_create = ttm_tt_simple_create,
>>       .ttm_tt_destroy = ttm_tt_simple_destroy,
>> @@ -61,6 +65,8 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct 
>> kunit *test,
>>       KUNIT_ASSERT_EQ(test, err, 0);
>>       bo->bdev = devs->ttm_dev;
>> +    bo->destroy = dummy_ttm_bo_destroy;
>> +
>>       kref_init(&bo->kref);
>>       return bo;
> 
