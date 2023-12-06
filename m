Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA43806EE2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1F210E6E6;
	Wed,  6 Dec 2023 11:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6E910E6E6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 11:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701863399; x=1733399399;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lA+nrUFmjjOxipiO8U5iafIWGDzqM45IwkK/q7jXKyA=;
 b=Z8qDFnCiHLBv8Ro/C7EDTo97dIFSo96P/n9yLbR8ptYWfSBd4Bouapn1
 lO+ekyXTppZPOLKJUH6eFStowuJBYtMIejTRL6jWSfQFC8PYSOAySaY01
 S8pBRBsV3bcDWwxUqYSMPbVY36lSHZB/ohd77oBmH5zUyYUYq2XUYsqim
 AuM7x+V2hmSF0vmtMgg6Rq7RDX5i/UbKrdSynwdm0MuObbzdtCz0VMHXh
 s7LCHNKcWhFsIQlWZ8ilgDiqPxijmsXF8eVIyrcv/bh4psSxu/nP5LfTO
 J8GObvFtvu+omXxYbyLCDgSiD0ZXWJ37GpykvaYXCwBuDnEcT9ChSjzrM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393778417"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="393778417"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 03:49:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944630973"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="944630973"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 03:49:58 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 03:49:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 03:49:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 03:49:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBTuHXoFLVob7+PV9YMLmwhVxWvrcKfT0ribdoOPxGZrDkJ5ZNG1uQkooqwJuwdryNzVd/2PzoaPBZDsnNnyVq/J461UCq31EzWBmIQUnbaL9wFs2ul8EKwBY4vge/T/LulXQp1ZqqazDok+V4fvujtN8B5qJBy/iSWlQwpxDvlNO0/s8f44GYTv+hP8Tg9uOeJf5INCeyu3TRbg3qL9kvYjRSghp05Fw1f9jTkWkDorXUb5O+i0eTSa66eKTXxi6A87EWRhqo4r0T3k0JWxc4sxFUnCjkUSm5MqALuE/7Cn6h2+gP9L4xFo+w2hUnSXchBnFUHrYnT9e1moDxIsPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5921mexC8YyOCYJPdNnahsrivKx1749tZpxp2Z4A2I=;
 b=Z7KTAD9sU6OTwNx+ds/67qzc/ckEx6fCQqyXuzs6JZGI5VsSsU4SAl243jnk2MQssiOELdqlc1Gx2Ln0hnDcgmYv1WWokIg1Kej+Qn4uUEobCvvq6vZ2kb/KlLx+LcOa0tWIAnJ5V1ageGrnCVkVyPVcfClXjNsbels67kd1TCgyljHnH0H2M3nWKX0/Eu5lVeAq8TXGJViMoAObAeZV1eG2+goT7+MefgjlDW1HBH+Df/5VvfQat/HuBHgoOzSXztJaOc41M/LkA4sYJ+NZz4jAJjNB0NMilwwKV7D/gx5NtFrFhiHLoXowYgzPNl/OOQDNa2JYtmclRuh8dNmo5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DS0PR11MB7508.namprd11.prod.outlook.com (2603:10b6:8:152::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 11:49:56 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::e053:28ad:6a0e:9692]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::e053:28ad:6a0e:9692%6]) with mapi id 15.20.7046.036; Wed, 6 Dec 2023
 11:49:56 +0000
Message-ID: <4dfd07aa-a4d5-4f60-a9cf-5dbdcea95bcb@intel.com>
Date: Wed, 6 Dec 2023 12:49:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] drm/ttm/tests: Add test cases dependent on fence
 signaling
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <cover.1701257386.git.karolina.stolarek@intel.com>
 <e0fcb8fb08cc8ed7ce0a7f9b8a3a82741cb3cf90.1701257386.git.karolina.stolarek@intel.com>
 <ZW9B1TGuvynBfKOA@ashyti-mobl2.lan>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZW9B1TGuvynBfKOA@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::8) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DS0PR11MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd005a3-5dcf-4db8-d94d-08dbf65176f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vI6xBUBz5XzN9ZjhRjL/caJX0yyTpw73LH4DY1hntIhMVdOSM1K0TdTFxele6gM/Vrctoj2bk4BJ9buxYhKwyVFW+RR+PtroBmdTYU1PpTqiJg63Jy2dOj+yyA+z86tXLadH++nFQWX6rk9cnQclXauPTFe4xSYBtbHGqSDyHUGtJhwomMVvmoBARgud6tnIc/JJqHogNYntbm3ximshxRuJtVOvmstkQhEUPqM9lUk8YyufqebeqjS1MnhP7l9bclmWoffD0Hyr7X1W+2j5zaxQ6dWD7u5eTYUy+LkoqCEm2rltEzhGdOdIGqoQmXgErRJeAvPXFjBRXX4g9C80uzUQyNWR8zPHfGZVmffEggt3vP96vTEx+Yh/M/d4FWRLuPTXpEPQVYOaxfY4j5oQoZxXLE5KiXsPJ91eew7dN7OffwBGnA0Admdg4DZVhon7T/uX62W9BC5nXkeQ22ne8Qkw9+E4lokWxzn0RFs91T+gm0EgPvwCgMAIY4RnOnzFUJV2W7AurWmnon9VyxQkmaKjoTBn/dNUx+EQCkvNqWbPeIgwypeFab08p40VgIWj0JFSZwF0TePtXyIDQjIkT8WNqaZ+6YFb0Mod6ipDwDYuJjXNjQTMZVUOIIwQHpXlZLI2i1kOggsKpZzppN4Acw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(5660300002)(44832011)(36756003)(41300700001)(86362001)(31686004)(4326008)(8936002)(8676002)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(31696002)(38100700002)(82960400001)(6486002)(478600001)(36916002)(83380400001)(6666004)(6506007)(26005)(6512007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWVsMjZHVk1UTVJlanV1M3pvZmk2bXJmRGpqblJESnFyVVZTcDhmNG5FT2h4?=
 =?utf-8?B?M0lDaVJ5cEFialRvNFY0ZHc5bDF5cEIwS0VSMmgxZStYMHE4elgvTGdrZjlR?=
 =?utf-8?B?Kzc3Ti9SZ3R5cmtzRnAvdXlXS1BHaXIrd3BIRnFsbnluOEh3a3ppVnN5eFFL?=
 =?utf-8?B?cDJBYTJwamxKZm5rYlR1OTM2bHBKc1RMMmtjMTIrdTFvbUdTWEVUcjRYODly?=
 =?utf-8?B?QTFsaWp2UXNFOTEvTTZiOWgvZTRYcmlnQVJkS2RGSkNDZGZOcGxWREJXVmRk?=
 =?utf-8?B?U2VvM3kxRmoyY1RnS0dxbis4dGQ4VEIxM21hZkoydGpPcm5EYTBKSytnL1k5?=
 =?utf-8?B?dVR2dUFNWENYSUU2MktiS2NCSEpidTFPZXFCSzhTajJkeHBmK1FSWXJjTEJp?=
 =?utf-8?B?YVdST0VBSnJ0ZlQwNktKdThLcml2eW1mb2R2aEJMcEZ3cTZXc29sS0FVWnA5?=
 =?utf-8?B?UXlpZTkzQ2JONVNwUDAxWVZ4RFZTSTJKWWpWRUJHUkZIaUczaWJzandWdXVt?=
 =?utf-8?B?U1lqTjFqelBla0FYaHdzV0I1UXB1bXBDb1lLcTZaYjA3V2JPdHMxVlluK2x2?=
 =?utf-8?B?aU9oeDFkOHJrRUxHc1djSkxqQXkwUHVyYlUyOGZwQzNSWDhXOHlHQjFFQ2Vs?=
 =?utf-8?B?cHpXb2RJbExaVGFLTjdRcy9wdyszdmpXc0lhcTJJNkRtZlJOZDhSd2N4RkFK?=
 =?utf-8?B?Y2d6QTdkYkdTSTgvUGJlVlhJTTlSRXRTcDl2SUhiUkF6aVZyanBqNVVLb0ZZ?=
 =?utf-8?B?K0d2bkxraHFWYS9TQWF5S1B0YldZN0wxbjMxYVNYRVVzRjRrZWZ2bW14M3l3?=
 =?utf-8?B?QWNtSk1Cck1ldStBMEhuQUVVbFBMSkVzWS91Uk8xMi9aRTR0bHlZMk5kN0hU?=
 =?utf-8?B?ZkZnUHlEcVV3OVZEWnJXNk9tQjVPT1kyd25PMXZwV1l5Rmw2VHNqVmJydmdu?=
 =?utf-8?B?MnhjSzRYN0JaT0pjbVQyUDhxWFJsMjNpZmU4WWtZTFNtRmNvem5QK0JVTGQ0?=
 =?utf-8?B?SFFzUDl3b213NWJ3cVdpT1NRc2JJcnJTMDVJR3hpZVJaaW1Ya0NNc2x0dU1U?=
 =?utf-8?B?MTdHY3pXWDcrRlNzWU9ONmtPVmoybkFCWk5lZnlPMVlqWUZ4Y3kvamwwZG54?=
 =?utf-8?B?TlVvU1NiSndYSzlJdk4xT1JxM01NeHMvK2h4cWovbFdSL3dZQ0UxdndMREVH?=
 =?utf-8?B?bUl1ZUJyOEN2WGlTekwzR2lnb24vYlBGLzR0WWRtZGZ3MVptODBwV1owWHlI?=
 =?utf-8?B?cmttOVB6K2hlWWhNOFJqcHRGVmJKaTk3NkVvckVkaXpuOVNDRVVVTTEybHpV?=
 =?utf-8?B?OXJtRTNhZmpROVJZK3hTcER4VE5vdXJZUXBMOUlHUXdTcURIZTdma21aSzNj?=
 =?utf-8?B?NytWcnl5amlTc1kza0Y5WFhIV1MzaDVxUUZUa0ZXbnNSdHJRaHVEaVQ0K3VQ?=
 =?utf-8?B?ck5aNnZxQXZXMjFwZG5hS0tsMFJTTWFiRmYySUpXL3ozL2o4azJJT3pmcmZM?=
 =?utf-8?B?ZUdUNW9NVHVwTWc2VEgyWmRTSjhQSUdWVWNmSENOdWtxWGx1WGxKWkJ3K1lV?=
 =?utf-8?B?Y3phNWhsMnA5QkRlRVJoSHNXYk0xeW1wYnY2MDN0UnByWmZjOG1jL2VvKzhj?=
 =?utf-8?B?S1p4M3I4Q1EvTXovUHpwMWp3YkltbEsrbm1yaGdudEQva2dPRXdjdWdUWlRz?=
 =?utf-8?B?MCtsR0FObVVWcCtINHRIUEsyM2JNWEFEYlpjZWF3b1FFOVFSSGxVU0wyYmtY?=
 =?utf-8?B?eXBrS1pXcTBGYlB3UnlmYmE3WWlDbXl1S29iZWRvZjQvbFl6TFBFK2FDVVZY?=
 =?utf-8?B?NmlhSVRmQlhUV0FBM2VqZDRHeTBPMGhXRU92OC9oVGhIeU0xNzBFNE53U3gw?=
 =?utf-8?B?ZDJpY2dhWCt1Um01RXN6VE5LcnhTMTFoWDB0Q3hBd2JSRjMwTHhCb3pZNWhW?=
 =?utf-8?B?c3JmUmRvSHJna1g3djFmMDdhQ1RycmVkVDVhVWdrRzdmQmdNaVhKRDhxMlgw?=
 =?utf-8?B?ck90YjBoKzh2ZnFCQ09SUFNhZVA5ZnE2M1VPOENmVkRpcjJqRWljeStYRXNm?=
 =?utf-8?B?aWpqcUNyZk4rTU1nb0xZL3BBRktvRENrMkZtWU9rZENaNk13dEh3Z3gvSTgv?=
 =?utf-8?B?T0NsOUljRTRoblNUWFp6LzY1dE14RE1BTHJqdWlna1g0NmFOUlJYRTdUY0Fy?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd005a3-5dcf-4db8-d94d-08dbf65176f1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 11:49:55.8228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+N9AxJbVt9yVObkJQ64hSyhu3FPFnrQKvxOmv/IoMRta9+7dZ4uQMZvVRBsKAbblJxuE8LL4a1DYeeu35mF0RRu7HhZ9CNdcPnycILD7Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7508
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Andi,

> For next time, I find it difficult to follow all these variables,
> it's easier to read
> 
> 	man = ttm_manager_type(priv->ttm_dev, TTM_PL_SYSTEM);
> 
> than
> 
> 	mem_type = TTM_PL_SYSTEM;
> 	...
> 	...
> 	...
> 	man = ttm_manager_type(priv->ttm_dev, mem_type);
> 
> 
>> +	bo = ttm_bo_kunit_init(test, test->priv, size);
>> +	bo->type = bo_type;
> 
> same here... the bo_type variable is not giving any value.
> 
> 	bo->type = ttm_bo_type_device;
> 
> is way more readable. You keep doing this all the way and I need
> to check everytime what's the value in the declaration :-)

The idea was that I'd provide these as parameters, but I limited the
scope of my tests and stick to set values. Also, in some cases, I
defined them because I keep checking for them in assertions, and didn't
want to repeat myself.

> 
> I'm not going to comment on this anymore.
> 
>> +	if (params->with_ttm) {
>> +		old_tt = priv->ttm_dev->funcs->ttm_tt_create(bo, 0);
>> +		ttm_pool_alloc(&priv->ttm_dev->pool, old_tt, &ctx);
>> +		bo->ttm = old_tt;
>> +	}
>> +
>> +	err = ttm_resource_alloc(bo, place, &bo->resource);
>> +	KUNIT_EXPECT_EQ(test, err, 0);
>> +	KUNIT_ASSERT_EQ(test, man->usage, size);
>> +
>> +	placement = kunit_kzalloc(test, sizeof(*placement), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, placement);
>> +
>> +	ttm_bo_reserve(bo, false, false, NULL);
>> +	err = ttm_bo_validate(bo, placement, &ctx);
>> +	dma_resv_unlock(bo->base.resv);
> 
> why don't you use here ttm_bo_unreserve()?

That's a good question! I think that unreserve would work here as well.

(...)

>> +static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
>> +{
>> +	struct ttm_test_devices *priv = test->priv;
>> +	struct ttm_buffer_object *bo;
>> +	struct ttm_place *place;
>> +	struct ttm_placement *placement;
>> +	struct ttm_resource_manager *man;
>> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
>> +	uint32_t mem_type = TTM_PL_SYSTEM;
>> +	struct ttm_operation_ctx ctx = { };
>> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
>> +	int err;
>> +
>> +	man = ttm_manager_type(priv->ttm_dev, mem_type);
>> +	spin_lock_init(&fence_lock);
> 
> where are we using the fence_lock here?

Argh, it's a copy-paste mistake, sorry. We don't need it, as we use a
stub fence in man->move. I will delete that.

> 
>> +	man->move = dma_fence_get_stub();
>> +
>> +	bo = ttm_bo_kunit_init(test, test->priv, size);
>> +	bo->type = bo_type;
>> +	place = ttm_place_kunit_init(test, mem_type, 0);
>> +	placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
>> +
>> +	ttm_bo_reserve(bo, false, false, NULL);
>> +	err = ttm_bo_validate(bo, placement, &ctx);
>> +	dma_resv_unlock(bo->base.resv);
>> +
>> +	KUNIT_EXPECT_EQ(test, err, 0);
>> +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, mem_type);
>> +	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
> 
> Do we want to check also bo->ttm here?

Hmm, I think that I covered that case with "normal" testing of
ttm_bo_validate, and kept this one minimal. Here, I'm just making sure
that a signaled move fence doesn't get into a way of BO validation.

> 
>> +	ttm_bo_put(bo);
>> +	dma_fence_put(man->move);
>> +}
>> +
>> +static const struct ttm_bo_validate_test_case ttm_bo_validate_wait_cases[] = {
>> +	{
>> +		.description = "Waits for GPU",
>> +		.no_gpu_wait = false,
>> +	},
>> +	{
>> +		.description = "Tries to lock straight away",
>> +		.no_gpu_wait = true,
>> +	},
>> +};
>> +
>> +KUNIT_ARRAY_PARAM(ttm_bo_validate_wait, ttm_bo_validate_wait_cases,
>> +		  ttm_bo_validate_case_desc);
>> +
>> +static int threaded_fence_signal(void *arg)
>> +{
>> +	struct dma_fence *fence = arg;
>> +	int err;
>> +
>> +	msleep(20);
>> +	err = dma_fence_signal(fence);
>> +
>> +	return err;
> 
> if you do here "return dma_fence_signal(fence);" you don't need
> for err.

That is true!

> Not a binding review, though, your choice.

You spotted a couple of things I can improve, so I plan to include them 
in the next version, after getting more review comments.

All the best,
Karolina
