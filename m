Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B27568F3D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 18:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2EA11B704;
	Wed,  6 Jul 2022 16:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EECA11B916;
 Wed,  6 Jul 2022 16:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657125251; x=1688661251;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q+ZoYI95DwFoOopVUfgt7VdIjvOQoHiP7c4O4/8kZ1w=;
 b=arTeSsRNruO4Ezmic+qq3S6DiM53ORKquj2DaQb6qPlt7AFv0/5P8fmH
 aT9plOBkNmGmAmnxJ2e+fUfCDF8P2ymbvmBqpvRXf44s78Yj7JlqzHidD
 /J6N+6hdYk2NDW5AM7yH2WcWt1dpnZRLGOoOJ3IS2T5knsuLcR2VRKU43
 dr7TcjlGdxvkegLvIiUDOuJ3uR9rkWuqAxbatl/8vw04wp4bLsVC9q76r
 bjoDQ9SxcIbMg9DTpj02veTwJn9mW7krsF+C8fz2vy2QqdrStAo4vMu9M
 uGiCyW5VnMOsDm+rnDBHZ2AJCB6s/i63Kh7iMzwGZQ7zNTJ2az48Y/tOJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="284927726"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="284927726"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 09:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="735635940"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2022 09:33:32 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 6 Jul 2022 09:33:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 6 Jul 2022 09:33:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 6 Jul 2022 09:33:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxUl/T6OCcpfGrsiuTeyl4UQeIdhGOQG9scr7BqUqIqPlb10hZ9TIrjs+B5QnJSBp/X692ai1EwX0Q4WWOTh6tS9a1jjcW2hMtQC9Y5JjLe1LqHKG44voloaw/4ivWWxYYy+XIJwOShfstS3FWTQqcrLR0LlE9rbNo5DL9M/7NLUYpUV4waSrjqSCGVAs7aYEm+NXxNJhXPMClqxLx30JlMD5gU4XkCzpI5hbX2sBvT4WR5P8AMIl9m8srjT9HXPa1twtH7qEgBxBDzJo8OtxGl003XJZhABG905xZYF+/AZCrB/Rpnd7qFX7CnrfOS1aWUqeT+rqnwZPj++/m1mJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXS9EnHwXQgN408PmQZZjEqpgMrEFjrBkjrx1Q/oH/E=;
 b=Ln4U2ALJzSI8N12vBzFPE+L/VbdTlTjxN94wp4ZNCkGf/wgZz2deKYXGQri4LnLhqdNqaKXuVRqsR36vH93ouoM6hkUQ0jYxftGHu7QrnJjwK5HhLC9/0RRKBUQsggDdQ7Lk14istkCfI5zrT+Bo0NSvIspZwP2AcJKh9kqzTecaivlbUkv04oOhIZfpzNXW+f+Xrbt9cfB1BE/8Xi7HFlMul3KnDarBnp99/7VlLwjrZdratcsr20CAHwskG1IKrx8c7a51JfF4F3/TichJ3rZGXLvWGO8gGTLeGgPbsetFXj+RZii46b+tctEs+IRGG6UFuWPtdTW6GL5LyERMPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by DM8PR11MB5607.namprd11.prod.outlook.com (2603:10b6:8:28::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 16:33:29 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::49da:18ae:2975:c398]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::49da:18ae:2975:c398%9]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 16:33:29 +0000
Message-ID: <f2f2dd4e-c6b5-8d69-3ddc-e1e1bfdd02f3@intel.com>
Date: Wed, 6 Jul 2022 19:33:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 2/7] drm/i915/gem: Typecheck page lookups
Content-Language: en-US
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
 <20220705122455.3866745-3-gwan-gyeong.mun@intel.com>
 <20220705163508.4dc35087@maurocar-mobl2>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220705163508.4dc35087@maurocar-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41cdd1a3-0057-43a3-c32f-08da5f6d41c9
X-MS-TrafficTypeDiagnostic: DM8PR11MB5607:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aA3mBhWBUbAJsK08+QeoDnzSF61/3JyywbHcBJeXH5fL7CQdRimR5ySjZCORHfJSZY0Uwuzn3JmIMBKNdmDTH0TdrkEUrNLLUp3m0XyohELZF1W3K2U7o8Vbf+NBS81s+MVgN4cw2Wb6kqzkylJDGRxlg64wEtXEr61r5qo8ww7ch9fOnKmnnznrAqtqcu0L1WUG3tD6efjFVpCNUKMM+HmlfI6fblitYeBko0iSusP0iCeoflDlPxWRSTI/OXZdjKhLIO9GnyvWPnKOBSvBzqOsEZZ5AXkoiM/e6XGZL6GGYXzmDobIt4E9uBw0jcu9UBsxi0nsl8ccZbQGKottsot7xbBPrG09vkPJwCoObkecNI0tEwI6N/2kbUpv1QPos3DJ+thmxPtenlnsuU2e/k9o8/sv4ape2R2OVksyfcqCVipFC+ZhpsrU7Hhye8CJFdxG8MHd7nMrYqLvZM40UODuq09pIdMkcTuR3HlgpxkdTWb2jVeTCWHCtXUT8Fg1EildTxTILIlZIxpsnylBUV4mxvrsLxEylyiJ1+eWJxpJPN7UbsOP0wShn1vZDmrUodt4gAvioKQluvXVjw03Ku5uHQyRouLFZrHM8ff7BDQpPk0JmPAaFq8Br12VYs3qwk47HT7Om+L5B421Avz85woZJj7nUss++gfnkgaaKU4ljP3qEaxyThGa6m8YNGZjcLYKxYKeSPOx9fszMNbZsSXmm6abixEY255KZVqsPXwViHbzD54ppjBzyMcKmkufoooScMUB/4+QB0M2wV8RvPS+H2tkoAe+tyBkQDarLnkBq+ASQJk6zhv7TTLdczR1w4hBINDz4NPrnH9vFucqiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(366004)(396003)(376002)(136003)(186003)(26005)(6506007)(83380400001)(2906002)(41300700001)(6666004)(66574015)(53546011)(6916009)(31686004)(36756003)(316002)(38100700002)(6486002)(82960400001)(6512007)(8936002)(66556008)(31696002)(66476007)(5660300002)(2616005)(30864003)(86362001)(4326008)(66946007)(8676002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk92YVNxbldQa3dIdFY5T0UrVEFLYVIwdlV1Q1dNUHVUOTl4QkZiMFVuTkpI?=
 =?utf-8?B?WmNSOGJ5SklnYXN1WEExZkJNSFpVN1dlUVJBclUzbEt0a0Vxdmp4bXYxMXBk?=
 =?utf-8?B?UWd1MmF1eVFSMHpPSXRVcXUxcDJZcjZUdjdFZzdyTXIwWlNtbWtEVVk4cXBL?=
 =?utf-8?B?d29zeFo3K1FQOEpzdTRXd3l2OHd4eXM4YzBRL0hpREhiQUhyaUc1V1VHT2ha?=
 =?utf-8?B?RlBnMGd0NWRNMU9EK2h0eVdBUXVvZmFmVC9NdVdCU2d0NnlkbGE4WjNQa3RU?=
 =?utf-8?B?WGd5bVJPV3Q4Vk5xSVRYd3U1Q29jcEJxMzVSSy9TSlZqKytoM28xTVZBYjV6?=
 =?utf-8?B?dFVBYUZYRmFvbmVvWjFDTm5EaFJkWC9iSzJWQ0EySVgrNWdieUdORXVES2JR?=
 =?utf-8?B?T0NoKzZnaFp3ZDdRTG5WaWpLVFdCRFhFeFJTdVpueDQya1NFeU9ReHNVLzhU?=
 =?utf-8?B?QzE1c0xJNDA4dmc1R2dwVW9KOWM3Ykd0cmtFV1BvNTFPK1dXZEsrbkRrU243?=
 =?utf-8?B?Q3JFQTlYY240MGxpWFlMY1NFQ1BvVy9HaC9WNEIxRWVBV1hoMlJIWThtci9N?=
 =?utf-8?B?WkkyaVlqdFk2RXpWdTRGWGQ4YXlqYzBSM1hXQ1hib1BCYzY3aWtkRXdRcXhD?=
 =?utf-8?B?c250anZQMXRvczE1QmhSYmlKd2RsamY5TjZ0S01GYlQ4UG01WWV0YUQvWkt4?=
 =?utf-8?B?RUZ5U2xSd2ZQL0N3ZWtPSWdrZms5WGdRUUFWSlRIcWhNV25YTFJlUmh1R0dq?=
 =?utf-8?B?QWYwd3BKYkQxN0VCcktweGRVMkd6bXJkTTJMUy9TSEE2RlFJeTVWbktzWU40?=
 =?utf-8?B?Rmgrc1RNVG9ISEhhT29OczN4SVE2VG0yY0htQ1MxVG1Kb0QvYmdDMXVCcnFL?=
 =?utf-8?B?T2l2TDRPczRlemljVmlHWG5lY0MxNGN3MEtreGV2L2VzVjM4MDl2MXB6YlNR?=
 =?utf-8?B?dUNRc2VSc1U4SzcrVDlNZFpnaFRDVk9vakZ2SDcxR0dMUHhGMFg2SW5DRkxW?=
 =?utf-8?B?dDJDdUcva3RWNlMrUWRhdmdzNjhFdGM3ZmtSTWQvZVp2eGFEUlA1ZVEvZ09J?=
 =?utf-8?B?KzhLMi82d0ZIeHJEb2h2RUpCMlZVSEVBRnkxUnJWNmg0U0ZTUG9JRk1KYTBy?=
 =?utf-8?B?ZENzSVd4OFMwQnl2bG93SHFjZ2VtSCtPdlZPYWphbXVMVkRTV1RZZ2kzQlh2?=
 =?utf-8?B?bm5JWTI1dEZ2d2Y4RHpYTGNod2ZvWVR3cEVVRnRFOEp4VktoK1I5NVFrb0E1?=
 =?utf-8?B?S2dZZ0huaWZKQ1M3eTJPQi9JME5EeVVmMVFOSkRuWVhqeUtyZ0JzSjF3MUlq?=
 =?utf-8?B?dVlRWUZxNWN5ZXlKNHhCQWQwbmVGUHNud2FaaEE4L3psb01kT1Y1UDRQbGZh?=
 =?utf-8?B?alJIMlNvTVBjWlZ4Nk42UVZaSFVYTEljVG5jMzg5RkpEMDBWeXlDNDkxTWFJ?=
 =?utf-8?B?YU1pWnVsN3h5SEFJckRpZmorbFpXT004WFZYcXFOTjZHS2cyRGFyVU9IalU3?=
 =?utf-8?B?TDgxazVZa0YrNEpNeWV2ek50cnpDOEVaRXY4YTdoWXFxaUY3UnE5ZVNoNHpp?=
 =?utf-8?B?YmViNm1WSHlOVXIzWk5DU3k5Q2tlUWFPaHloY3JqdzZtY0o5cmE1SGsvMy9T?=
 =?utf-8?B?eDZmN1NUYzBVRVIxQ2Z4dG1ac1hzKzBKQkNRenJZMVVIc3RJY1pQRW9Sblow?=
 =?utf-8?B?QWE0S08weDFYcXE5YXZPSFVqeG5HbU9YTUEyelFQeGxkYVFmaiswKzhtKzN3?=
 =?utf-8?B?STRwWW9yT1BPY3hPUGxKRENzUzZoVEprR3NFWjluaEtpWFh6VTFIamhWTnhz?=
 =?utf-8?B?SVBMYmdiMWROZzU3WU5ONTVrb2t6NUl2NVRPVDlUZXVIUGpvRUFtNmowc29H?=
 =?utf-8?B?MGI2VUxBdk9objh5SjRFV1pObzJ2NXFVYnRHZzRzOGJCdnEra0pUSXYzUnY2?=
 =?utf-8?B?UTFGTTh0TzRwWXlCbzg3cWgvR01xRzM0T1ZKZ0lzTXRqWHpERjd5cUgyQ201?=
 =?utf-8?B?cnVuYU9IcDRqbmdYUE53bTAvYXBnTFZROEgxSkp3NjFkRlR3dUFTdjRmNnhM?=
 =?utf-8?B?WWw4RkQvU0VGVVRWTnFENU1GZ0pMRG5lT0wvcnhVRjRWN21zeFhaSzlOTzRU?=
 =?utf-8?B?NUJDRXZzTFJKZHExQTVvT01qdk5FY0tWKzBINkV1MG1vL3NXRVh2c3JKWnVS?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cdd1a3-0057-43a3-c32f-08da5f6d41c9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 16:33:28.9130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KansCn5Rh4DJacSWLPC4Pd6Uh9TN0f119gdRI5Lx7NKaT+56aUvqd6Kowhdeni5PzPqM+2WxQ2Bfjg6FKIm4tp2yUjGT++EK8PnHIASXDtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5607
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/5/22 5:35 PM, Mauro Carvalho Chehab wrote:
> On Tue,  5 Jul 2022 15:24:50 +0300
> Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> 
>> From: Chris Wilson <chris@chris-wilson.co.uk>
>>
>> We need to check that we avoid integer overflows when looking up a page,
>> and so fix all the instances where we have mistakenly used a plain
>> integer instead of a more suitable long. Be pedantic and add integer
>> typechecking to the lookup so that we can be sure that we are safe.
>> And it also uses pgoff_t as our page lookups must remain compatible with
>> the page cache, pgoff_t is currently exactly unsigned long.
>>
>> v2: Move added i915_utils's macro into drm_util header (Jani N)
>>
>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  7 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    | 67 ++++++++++++++-----
>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 25 ++++---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
>>   .../drm/i915/gem/selftests/i915_gem_context.c | 12 ++--
>>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  8 +--
>>   .../drm/i915/gem/selftests/i915_gem_object.c  |  8 +--
>>   drivers/gpu/drm/i915/i915_gem.c               | 18 +++--
>>   drivers/gpu/drm/i915/i915_vma.c               |  8 +--
>>   9 files changed, 100 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index ccec4055fde3..90996fe8ad45 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -421,10 +421,11 @@ void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
>>   static void
>>   i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
>>   {
>> +	pgoff_t idx = offset >> PAGE_SHIFT;
>>   	void *src_map;
>>   	void *src_ptr;
>>   
>> -	src_map = kmap_atomic(i915_gem_object_get_page(obj, offset >> PAGE_SHIFT));
>> +	src_map = kmap_atomic(i915_gem_object_get_page(obj, idx));
>>   
>>   	src_ptr = src_map + offset_in_page(offset);
>>   	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
>> @@ -437,9 +438,10 @@ i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, u64 offset,
>>   static void
>>   i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
>>   {
>> +	pgoff_t idx = offset >> PAGE_SHIFT;
>> +	dma_addr_t dma = i915_gem_object_get_dma_address(obj, idx);
>>   	void __iomem *src_map;
>>   	void __iomem *src_ptr;
>> -	dma_addr_t dma = i915_gem_object_get_dma_address(obj, offset >> PAGE_SHIFT);
>>   
>>   	src_map = io_mapping_map_wc(&obj->mm.region->iomap,
>>   				    dma - obj->mm.region->region.start,
>> @@ -468,6 +470,7 @@ i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset
>>    */
>>   int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
>>   {
>> +	GEM_BUG_ON(overflows_type(offset >> PAGE_SHIFT, pgoff_t));
>>   	GEM_BUG_ON(offset >= obj->base.size);
>>   	GEM_BUG_ON(offset_in_page(offset) > PAGE_SIZE - size);
>>   	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index 6f0a3ce35567..a60c6f4517d5 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -27,8 +27,10 @@ enum intel_region_id;
>>    * spot such a local variable, please consider fixing!
>>    *
>>    * Aside from our own locals (for which we have no excuse!):
>> - * - sg_table embeds unsigned int for num_pages
>> - * - get_user_pages*() mixed ints with longs
>> + * - sg_table embeds unsigned int for nents
>> + *
>> + * We can check for invalidly typed locals with typecheck(), see for example
>> + * i915_gem_object_get_sg().
>>    */
>>   #define GEM_CHECK_SIZE_OVERFLOW(sz) \
>>   	GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX)
>> @@ -366,41 +368,70 @@ int i915_gem_object_set_tiling(struct drm_i915_gem_object *obj,
>>   struct scatterlist *
>>   __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>>   			 struct i915_gem_object_page_iter *iter,
>> -			 unsigned int n,
>> -			 unsigned int *offset, bool dma);
>> +			 pgoff_t  n,
>> +			 unsigned int *offset);
>> +
>> +#define __i915_gem_object_get_sg(obj, it, n, offset) ({ \
>> +	exactly_pgoff_t(n); \
>> +	(__i915_gem_object_get_sg)(obj, it, n, offset); \
>> +})
>>   
>>   static inline struct scatterlist *
>> -i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>> -		       unsigned int n,
>> +i915_gem_object_get_sg(struct drm_i915_gem_object *obj, pgoff_t n,
>>   		       unsigned int *offset)
>>   {
>> -	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset, false);
>> +	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset);
>>   }
>>   
>> +#define i915_gem_object_get_sg(obj, n, offset) ({ \
>> +	exactly_pgoff_t(n); \
>> +	(i915_gem_object_get_sg)(obj, n, offset); \
>> +})
>> +
>>   static inline struct scatterlist *
>> -i915_gem_object_get_sg_dma(struct drm_i915_gem_object *obj,
>> -			   unsigned int n,
>> +i915_gem_object_get_sg_dma(struct drm_i915_gem_object *obj, pgoff_t n,
>>   			   unsigned int *offset)
>>   {
>> -	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset, true);
>> +	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset);
>>   }
>>   
>> +#define i915_gem_object_get_sg_dma(obj, n, offset) ({ \
>> +	exactly_pgoff_t(n); \
>> +	(i915_gem_object_get_sg_dma)(obj, n, offset); \
>> +})
>> +
>>   struct page *
>> -i915_gem_object_get_page(struct drm_i915_gem_object *obj,
>> -			 unsigned int n);
>> +i915_gem_object_get_page(struct drm_i915_gem_object *obj, pgoff_t n);
>> +
>> +#define i915_gem_object_get_page(obj, n) ({ \
>> +	exactly_pgoff_t(n); \
>> +	(i915_gem_object_get_page)(obj, n); \
>> +})
>>   
>>   struct page *
>> -i915_gem_object_get_dirty_page(struct drm_i915_gem_object *obj,
>> -			       unsigned int n);
>> +i915_gem_object_get_dirty_page(struct drm_i915_gem_object *obj, pgoff_t n);
>> +
>> +#define i915_gem_object_get_dirty_page(obj, n) ({ \
>> +	exactly_pgoff_t(n); \
>> +	(i915_gem_object_get_dirty_page)(obj, n); \
>> +})
>>   
>>   dma_addr_t
>> -i915_gem_object_get_dma_address_len(struct drm_i915_gem_object *obj,
>> -				    unsigned long n,
>> +i915_gem_object_get_dma_address_len(struct drm_i915_gem_object *obj, pgoff_t n,
>>   				    unsigned int *len);
>>   
>> +#define i915_gem_object_get_dma_address_len(obj, n, len) ({ \
>> +	exactly_pgoff_t(n); \
>> +	(i915_gem_object_get_dma_address_len)(obj, n, len); \
>> +})
>> +
>>   dma_addr_t
>> -i915_gem_object_get_dma_address(struct drm_i915_gem_object *obj,
>> -				unsigned long n);
>> +i915_gem_object_get_dma_address(struct drm_i915_gem_object *obj, pgoff_t n);
>> +
>> +#define i915_gem_object_get_dma_address(obj, n) ({ \
>> +	exactly_pgoff_t(n); \
>> +	(i915_gem_object_get_dma_address)(obj, n); \
>> +})
>>   
>>   void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
>>   				 struct sg_table *pages,
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> index 97c820eee115..1d1edcb3514b 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> @@ -503,14 +503,16 @@ void __i915_gem_object_release_map(struct drm_i915_gem_object *obj)
>>   }
>>   
>>   struct scatterlist *
>> -__i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>> +(__i915_gem_object_get_sg)(struct drm_i915_gem_object *obj,
>>   			 struct i915_gem_object_page_iter *iter,
>> -			 unsigned int n,
>> -			 unsigned int *offset,
>> -			 bool dma)
>> +			 pgoff_t n,
>> +			 unsigned int *offset)
>> +
> 
> Nitpick: no need to place the function name in parenthesis.
> 
>>   {
>> -	struct scatterlist *sg;
>> +	const bool dma = iter == &obj->mm.get_dma_page ||
>> +			 iter == &obj->ttm.get_io_page;
>>   	unsigned int idx, count;
>> +	struct scatterlist *sg;
>>   
>>   	might_sleep();
>>   	GEM_BUG_ON(n >= obj->base.size >> PAGE_SHIFT);
>> @@ -618,7 +620,7 @@ __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>>   }
>>   
>>   struct page *
>> -i915_gem_object_get_page(struct drm_i915_gem_object *obj, unsigned int n)
>> +(i915_gem_object_get_page)(struct drm_i915_gem_object *obj, pgoff_t n)
> 
> Same as above: why are you placing parenthesis at the function name here?
> Just use:
> 	
> 	struct page *
> 	i915_gem_object_get_page(struct drm_i915_gem_object *obj, pgoff_t n)
>
In this case, the macro and function have the same name. If parenthesis 
is not used, the following compile error occurs as the macro is applied 
to the c code.

./drivers/gpu/drm/i915/gem/i915_gem_object.h:356:55: error: expected 
identifier or ‘(’ before ‘{’ token
   356 | #define __i915_gem_object_get_sg(obj, it, n, offset) ({ \
       |                                                       ^
drivers/gpu/drm/i915/gem/i915_gem_pages.c:506:1: note: in expansion of 
macro ‘__i915_gem_object_get_sg’
   506 | __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
       | ^~~~~~~~~~~~~~~~~~~~~~~~

And all of the parts you leave comments below are cases where the names 
of macros and functions are the same.

G.G.


>>   {
>>   	struct scatterlist *sg;
>>   	unsigned int offset;
>> @@ -631,8 +633,7 @@ i915_gem_object_get_page(struct drm_i915_gem_object *obj, unsigned int n)
>>   
>>   /* Like i915_gem_object_get_page(), but mark the returned page dirty */
>>   struct page *
>> -i915_gem_object_get_dirty_page(struct drm_i915_gem_object *obj,
>> -			       unsigned int n)
>> +(i915_gem_object_get_dirty_page)(struct drm_i915_gem_object *obj, pgoff_t n)
> 
> Same as above.
> 
>>   {
>>   	struct page *page;
>>   
>> @@ -644,9 +645,8 @@ i915_gem_object_get_dirty_page(struct drm_i915_gem_object *obj,
>>   }
>>   
>>   dma_addr_t
>> -i915_gem_object_get_dma_address_len(struct drm_i915_gem_object *obj,
>> -				    unsigned long n,
>> -				    unsigned int *len)
>> +(i915_gem_object_get_dma_address_len)(struct drm_i915_gem_object *obj,
>> +				      pgoff_t n, unsigned int *len)
> 
> Same as above.
> 
>>   {
>>   	struct scatterlist *sg;
>>   	unsigned int offset;
>> @@ -660,8 +660,7 @@ i915_gem_object_get_dma_address_len(struct drm_i915_gem_object *obj,
>>   }
>>   
>>   dma_addr_t
>> -i915_gem_object_get_dma_address(struct drm_i915_gem_object *obj,
>> -				unsigned long n)
>> +(i915_gem_object_get_dma_address)(struct drm_i915_gem_object *obj, pgoff_t n)
> 
> Same as above.
> 
>>   {
>>   	return i915_gem_object_get_dma_address_len(obj, n, NULL);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 7e1f8b83077f..50a02d850139 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -717,7 +717,7 @@ static unsigned long i915_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
>>   	GEM_WARN_ON(bo->ttm);
>>   
>>   	base = obj->mm.region->iomap.base - obj->mm.region->region.start;
>> -	sg = __i915_gem_object_get_sg(obj, &obj->ttm.get_io_page, page_offset, &ofs, true);
>> +	sg = __i915_gem_object_get_sg(obj, &obj->ttm.get_io_page, page_offset, &ofs);
>>   
>>   	return ((base + sg_dma_address(sg)) >> PAGE_SHIFT) + ofs;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> index c6ad67b90e8a..a18a890e681f 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> @@ -455,7 +455,8 @@ static int gpu_fill(struct intel_context *ce,
>>   static int cpu_fill(struct drm_i915_gem_object *obj, u32 value)
>>   {
>>   	const bool has_llc = HAS_LLC(to_i915(obj->base.dev));
>> -	unsigned int n, m, need_flush;
>> +	unsigned int need_flush;
>> +	unsigned long n, m;
>>   	int err;
>>   
>>   	i915_gem_object_lock(obj, NULL);
>> @@ -485,7 +486,8 @@ static int cpu_fill(struct drm_i915_gem_object *obj, u32 value)
>>   static noinline int cpu_check(struct drm_i915_gem_object *obj,
>>   			      unsigned int idx, unsigned int max)
>>   {
>> -	unsigned int n, m, needs_flush;
>> +	unsigned int needs_flush;
>> +	unsigned long n;
>>   	int err;
>>   
>>   	i915_gem_object_lock(obj, NULL);
>> @@ -494,7 +496,7 @@ static noinline int cpu_check(struct drm_i915_gem_object *obj,
>>   		goto out_unlock;
>>   
>>   	for (n = 0; n < real_page_count(obj); n++) {
>> -		u32 *map;
>> +		u32 *map, m;
>>   
>>   		map = kmap_atomic(i915_gem_object_get_page(obj, n));
>>   		if (needs_flush & CLFLUSH_BEFORE)
>> @@ -502,7 +504,7 @@ static noinline int cpu_check(struct drm_i915_gem_object *obj,
>>   
>>   		for (m = 0; m < max; m++) {
>>   			if (map[m] != m) {
>> -				pr_err("%pS: Invalid value at object %d page %d/%ld, offset %d/%d: found %x expected %x\n",
>> +				pr_err("%pS: Invalid value at object %d page %ld/%ld, offset %d/%d: found %x expected %x\n",
>>   				       __builtin_return_address(0), idx,
>>   				       n, real_page_count(obj), m, max,
>>   				       map[m], m);
>> @@ -513,7 +515,7 @@ static noinline int cpu_check(struct drm_i915_gem_object *obj,
>>   
>>   		for (; m < DW_PER_PAGE; m++) {
>>   			if (map[m] != STACK_MAGIC) {
>> -				pr_err("%pS: Invalid value at object %d page %d, offset %d: found %x expected %x (uninitialised)\n",
>> +				pr_err("%pS: Invalid value at object %d page %ld, offset %d: found %x expected %x (uninitialised)\n",
>>   				       __builtin_return_address(0), idx, n, m,
>>   				       map[m], STACK_MAGIC);
>>   				err = -EINVAL;
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> index 3ced9948a331..86e435d42546 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> @@ -95,11 +95,11 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
>>   	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>   	struct i915_ggtt_view view;
>>   	struct i915_vma *vma;
>> +	unsigned long offset;
>>   	unsigned long page;
>>   	u32 __iomem *io;
>>   	struct page *p;
>>   	unsigned int n;
>> -	u64 offset;
>>   	u32 *cpu;
>>   	int err;
>>   
>> @@ -156,7 +156,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
>>   	cpu = kmap(p) + offset_in_page(offset);
>>   	drm_clflush_virt_range(cpu, sizeof(*cpu));
>>   	if (*cpu != (u32)page) {
>> -		pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%llu + %u [0x%llx]) of 0x%x, found 0x%x\n",
>> +		pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%lu + %u [0x%lx]) of 0x%x, found 0x%x\n",
>>   		       page, n,
>>   		       view.partial.offset,
>>   		       view.partial.size,
>> @@ -212,10 +212,10 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
>>   	for_each_prime_number_from(page, 1, npages) {
>>   		struct i915_ggtt_view view =
>>   			compute_partial_view(obj, page, MIN_CHUNK_PAGES);
>> +		unsigned long offset;
>>   		u32 __iomem *io;
>>   		struct page *p;
>>   		unsigned int n;
>> -		u64 offset;
>>   		u32 *cpu;
>>   
>>   		GEM_BUG_ON(view.partial.size > nreal);
>> @@ -252,7 +252,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
>>   		cpu = kmap(p) + offset_in_page(offset);
>>   		drm_clflush_virt_range(cpu, sizeof(*cpu));
>>   		if (*cpu != (u32)page) {
>> -			pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%llu + %u [0x%llx]) of 0x%x, found 0x%x\n",
>> +			pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%lu + %u [0x%lx]) of 0x%x, found 0x%x\n",
>>   			       page, n,
>>   			       view.partial.offset,
>>   			       view.partial.size,
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
>> index fe0a890775e2..bf30763ee6bc 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
>> @@ -33,10 +33,10 @@ static int igt_gem_object(void *arg)
>>   
>>   static int igt_gem_huge(void *arg)
>>   {
>> -	const unsigned int nreal = 509; /* just to be awkward */
>> +	const unsigned long nreal = 509; /* just to be awkward */
>>   	struct drm_i915_private *i915 = arg;
>>   	struct drm_i915_gem_object *obj;
>> -	unsigned int n;
>> +	unsigned long n;
>>   	int err;
>>   
>>   	/* Basic sanitycheck of our huge fake object allocation */
>> @@ -49,7 +49,7 @@ static int igt_gem_huge(void *arg)
>>   
>>   	err = i915_gem_object_pin_pages_unlocked(obj);
>>   	if (err) {
>> -		pr_err("Failed to allocate %u pages (%lu total), err=%d\n",
>> +		pr_err("Failed to allocate %lu pages (%lu total), err=%d\n",
>>   		       nreal, obj->base.size / PAGE_SIZE, err);
>>   		goto out;
>>   	}
>> @@ -57,7 +57,7 @@ static int igt_gem_huge(void *arg)
>>   	for (n = 0; n < obj->base.size / PAGE_SIZE; n++) {
>>   		if (i915_gem_object_get_page(obj, n) !=
>>   		    i915_gem_object_get_page(obj, n % nreal)) {
>> -			pr_err("Page lookup mismatch at index %u [%u]\n",
>> +			pr_err("Page lookup mismatch at index %lu [%lu]\n",
>>   			       n, n % nreal);
>>   			err = -EINVAL;
>>   			goto out_unpin;
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
>> index 702e5b89be22..dba58a3c3238 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -229,8 +229,9 @@ i915_gem_shmem_pread(struct drm_i915_gem_object *obj,
>>   		     struct drm_i915_gem_pread *args)
>>   {
>>   	unsigned int needs_clflush;
>> -	unsigned int idx, offset;
>>   	char __user *user_data;
>> +	unsigned long offset;
>> +	pgoff_t idx;
>>   	u64 remain;
>>   	int ret;
>>   
>> @@ -383,13 +384,17 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
>>   {
>>   	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>   	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>> +	unsigned long remain, offset;
>>   	intel_wakeref_t wakeref;
>>   	struct drm_mm_node node;
>>   	void __user *user_data;
>>   	struct i915_vma *vma;
>> -	u64 remain, offset;
>>   	int ret = 0;
>>   
>> +	if (overflows_type(args->size, remain) ||
>> +	    overflows_type(args->offset, offset))
>> +		return -EINVAL;
>> +
>>   	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>>   
>>   	vma = i915_gem_gtt_prepare(obj, &node, false);
>> @@ -540,13 +545,17 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
>>   	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>   	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>>   	struct intel_runtime_pm *rpm = &i915->runtime_pm;
>> +	unsigned long remain, offset;
>>   	intel_wakeref_t wakeref;
>>   	struct drm_mm_node node;
>>   	struct i915_vma *vma;
>> -	u64 remain, offset;
>>   	void __user *user_data;
>>   	int ret = 0;
>>   
>> +	if (overflows_type(args->size, remain) ||
>> +	    overflows_type(args->offset, offset))
>> +		return -EINVAL;
>> +
>>   	if (i915_gem_object_has_struct_page(obj)) {
>>   		/*
>>   		 * Avoid waking the device up if we can fallback, as
>> @@ -654,8 +663,9 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *obj,
>>   {
>>   	unsigned int partial_cacheline_write;
>>   	unsigned int needs_clflush;
>> -	unsigned int offset, idx;
>>   	void __user *user_data;
>> +	unsigned long offset;
>> +	pgoff_t idx;
>>   	u64 remain;
>>   	int ret;
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index ef3b04c7e153..28443c77b45a 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -911,7 +911,7 @@ rotate_pages(struct drm_i915_gem_object *obj, unsigned int offset,
>>   	     struct sg_table *st, struct scatterlist *sg)
>>   {
>>   	unsigned int column, row;
>> -	unsigned int src_idx;
>> +	pgoff_t src_idx;
>>   
>>   	for (column = 0; column < width; column++) {
>>   		unsigned int left;
>> @@ -1017,7 +1017,7 @@ add_padding_pages(unsigned int count,
>>   
>>   static struct scatterlist *
>>   remap_tiled_color_plane_pages(struct drm_i915_gem_object *obj,
>> -			      unsigned int offset, unsigned int alignment_pad,
>> +			      unsigned long offset, unsigned int alignment_pad,
>>   			      unsigned int width, unsigned int height,
>>   			      unsigned int src_stride, unsigned int dst_stride,
>>   			      struct sg_table *st, struct scatterlist *sg,
>> @@ -1076,7 +1076,7 @@ remap_tiled_color_plane_pages(struct drm_i915_gem_object *obj,
>>   
>>   static struct scatterlist *
>>   remap_contiguous_pages(struct drm_i915_gem_object *obj,
>> -		       unsigned int obj_offset,
>> +		       pgoff_t obj_offset,
>>   		       unsigned int count,
>>   		       struct sg_table *st, struct scatterlist *sg)
>>   {
>> @@ -1109,7 +1109,7 @@ remap_contiguous_pages(struct drm_i915_gem_object *obj,
>>   
>>   static struct scatterlist *
>>   remap_linear_color_plane_pages(struct drm_i915_gem_object *obj,
>> -			       unsigned int obj_offset, unsigned int alignment_pad,
>> +			       pgoff_t obj_offset, unsigned int alignment_pad,
>>   			       unsigned int size,
>>   			       struct sg_table *st, struct scatterlist *sg,
>>   			       unsigned int *gtt_offset)
> 
> Once fixed the above nitpicks, feel free to add:
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
