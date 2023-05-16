Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB4770501E
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 16:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D757410E0D1;
	Tue, 16 May 2023 14:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAA610E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684245773; x=1715781773;
 h=message-id:date:to:cc:from:subject:
 content-transfer-encoding:mime-version;
 bh=F/qJwgyjzx4XXl/c9dPwN73xQN87gcS0js2Tu3Q6R2w=;
 b=gjx9yESZU4TNCWHOVG/zNFmXEqS8SfcQ09ggmHCsPkIX9C2guDjv4otr
 BrvsJuavjc5Y7xKKXdsl1XuOFdEN0fIkPJx+sBp5IkJIYhtZ2qPbpKpU4
 0zgSFjo8/GdaAMwIYHmvPfCzkzG+vJkacD6cZiiKDcEDDSIPtP1F+yJf5
 jlJoR3wl80UXB8dzaaQgumwayiXBnyE9MHfrqVdgVG8jcGuzhIju0/NxR
 BazQ2f4QXlI7qni+Z+mIfyZYVRLzK0ydIkhUc6Z2FqxmYz58VOBB3vhL+
 ogNwe6TNxUZNzdl3ygMGbssZ+s+p8RCQpXi5FXsyF2LXD08AT4/AZaxIs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="414890891"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="414890891"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:02:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="791082586"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="791082586"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 16 May 2023 07:02:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:02:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 07:02:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 07:02:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ih4GgALUh3VniS1RVyP1qoQFZ23NVPdLuU5KQSS67HYDpxnuhUlsl4jTzHOO9VXLxxD8gKrTP6SsKpg005GflnhxwfIA1/eTo5SeycbN/9JxVDJ1g0++DcfPabVTWhAxQTG3LftgQu15kO3vlIgjjvzIHeRC7n5ziCzWsLhobZYZVmZ4Dt2KjOT4QOg1ab88cHXfe9Wm6yppnecPi+Zz8TL+2IR1TWDPKJL2Voril8xTGxm/d92cdD8sVe6EBCPUeloGmR2TAOdkmszKjNIzVfYgPGQVotPYnc1xduLecZGPGHWUL6/x/5VtZyO77nurKW7zZJJzTumobiicrEi34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YK6VU/7lvUtxFRcpcDuhJ/BQBEJ0/CBywfS+guv8xBA=;
 b=IFfS1ljLq2uY9GzMTxDG+P16+//eoZmK33ce6dpai3AMokGcjK+PBEDspddr3W38GkrUap4+hLwyiLhYXjmFJEE4DHLtUen8b+5FbL1YkReaq9IVb06bUJ4fs7n7K2gAv+NGVcx/1r0c481Yh58Nn7eBfEgoDL7weeLvAXE1RLrvV7EUy/rhj25EUMZzs5jJBZK6fadniR+4TuwgWdaHAvS0UtFfjiH7siTagrvAvwThvZnQnFiHNkYytC/tjesqFwzoqzUGOYsL6dtZRTrhW2klGY5uXCf35nnFBuol6R2cnqNWuB5Bg9zoDx65ANm3I/q42AYeVBCaHM7Cx/4ZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DS0PR11MB8072.namprd11.prod.outlook.com (2603:10b6:8:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Tue, 16 May
 2023 14:02:43 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::fc54:d7e4:5469:da46]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::fc54:d7e4:5469:da46%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 14:02:43 +0000
Message-ID: <cc04343a-de20-4e60-aca0-695ba69253df@intel.com>
Date: Tue, 16 May 2023 16:02:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Subject: KUnit tests for TTM subsystem
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DS0PR11MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 456892ce-0003-4554-d7aa-08db56163821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gvE5AZ48Kmr2Lfl3VXdbNTuGQl6zfhoqDEK6pMVJmqc1i7EEzPBatkcSjdE3AszZzVw083dBkmRPg8j+KyXUKjupkvy02HwgH4IbSnR3vYABhGQdMj9CXBqMM5BxJeAtu6iNj4isabwaDt5mu2x4qTenloXnvkSnCSVc/oxzs6Vqj28Jitc76RL5RX+Jv/o4lbXAXJhyfhQixtT7JMS5uL2OfFk8yh5sSp79yMW3MqzljctEDCM3NOX1sD9lqOeK7MZTFl2Pz4PoYyIgYb7nbKaSdA1Z3MVSNKpeQ8B1CAbu2S/AfLTNn3t9okpnwrstCMzvrmVheKXgBnMikg9VwWg6e85d02M3KcrIEPBBvfcke0cHuy+uBlx2XDZzqmSqDG88gO7CVQclIjS9ttJDH4Q/oGPGbPcu1KAwm6URPAI7xJxTNm9NTsuLvvjRVjOKNg5Z699KSJtj1CpHoJab7hXmmPGLF4Si3w9GilWjM63hX04WQDTYBoZPaPophlhg9kpBIZ2oiuNGhj9MXWBISYI66AKcLZeJPiaTcpqDQFU8KcKfAS1ZtVKPN7SQrvtQw8bWjix+oYq3/gxSS/GPww8NO0/j7UOCAKrYroePFHBTs93J5HrmZTTGu40eONh/YXLajMf5UwB37xEF8BFDkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(66899021)(83380400001)(31686004)(2616005)(36756003)(6486002)(186003)(66946007)(6916009)(41300700001)(8936002)(5660300002)(66476007)(2906002)(4326008)(8676002)(82960400001)(26005)(66556008)(6506007)(6512007)(316002)(54906003)(31696002)(86362001)(44832011)(6666004)(36916002)(38100700002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXRBaGNDZWs2aG5zcXZYaVBobFFRTWxFRDNvdkxKVUQ3Q2c1dFNvK3FBSGtr?=
 =?utf-8?B?b2svOW52NEkrYUQ4V05MbzJEN3BpcWhsSDBnWlVwTVVuZlYxSnk2RmdWN2VJ?=
 =?utf-8?B?WWluNVdPbHlWV2NkNzBLdlRjUnlzRnBoUkRoK1h1bXQzU2FYSjBnUVhGK1Bh?=
 =?utf-8?B?Tmo2WTVJT1IxYXAraTlZL3pYZm1KR1VCdnRSVFNHdVVrcnhPdkVVVGFNcS8w?=
 =?utf-8?B?MVhFckE0aCtPVGdKdHhzamN6Vmpaamt5MXEwNSsvNnZzN0l4KythempKT1N2?=
 =?utf-8?B?R0xYZ0RJOCs4L01NUzdaZzNJdE1iZ0V0dGwwWDhFNG1FclhycVQ0MXNyQ2VD?=
 =?utf-8?B?L3owNUFPSWl1Q0tjck92M0RZNmxxWmpUQUJPeWZmK09OUjJETnd2RXExdWNC?=
 =?utf-8?B?REhHRjVPU05JRFVjTTVJWER6NWM1Nk1pYUp3ZG5EemV5SEFZY2g0aWlLYWxw?=
 =?utf-8?B?NWw0TUtZVlFIL0h4TnlEVW84TEhQNmJBSVEzdm95Y1hQN3JnYWE3QnphL3RK?=
 =?utf-8?B?cFNRa3EzVlRrckNONzBzQU1sTUE1UjNsc0ZTRFpody9kWVhYVk1pMk1iZzJi?=
 =?utf-8?B?YWkveitxdzNKT2xlRk5jdVVhbC9JNWVjd0J2QUZIV0d5YThwVFQzZ0swd2VG?=
 =?utf-8?B?S1lBQXh6ZFRWNWZVRm52dTJObU9wYXJTWUFpVlF6ZEJwQnZDb0I1aGhiUWww?=
 =?utf-8?B?eVVtQXhUaStjNnIzaXJOSXUzZWNNNTFDTDNZK1BsMlYwdkRuamYvaHN3ci8x?=
 =?utf-8?B?U1MrZU01L0M1a1pHc3lLd3VndVlDOUtQb0cvL3NTZTRqWTcyK0dMQkJzMk1J?=
 =?utf-8?B?U2ZVL3FNYllEdHMrNi9uQTA3cWNjWEdyallQcGdCcGtMK0d2b0NSRVdLakJB?=
 =?utf-8?B?TDJoczAwVDZvRDY0WkZrVWplbGRqbHU0YU1MUXhCVmUvNVlsQ1VQck9DS2tQ?=
 =?utf-8?B?RGRzSGFXMFlDWDNTMVhjdTRXQ01ZZkZySFRpRjAxRGYrTk1hUi9CNTd1VllG?=
 =?utf-8?B?OWxGVXI2Wld1YWFIUEtWY0RhS0pBTXpIbUl0RXhDRWswVDRKV0xwNDR5ZUQ2?=
 =?utf-8?B?WWhMN2d3M0cvVjJoeUM5eklWT3VlN3FiM2VOSzNjckk3T1Vnenl2a1ZPTG5a?=
 =?utf-8?B?OHh6K2NQSk1ibW9nanJCTEdic0FsYzlQd3IzWWhtOXdLZVJGZG1tK3d3WW9M?=
 =?utf-8?B?SzhsazlYUSt3NXo1Mkw1dEhIRUdlK3BaaXZTSTBvMlhjdm9Dc3p1MTMya2Rk?=
 =?utf-8?B?QSs4M1ZRWVd6STNuY2duaUNsdDF4a2h2UlZlNVAvbWlyVnNZR1duOTV5Y05N?=
 =?utf-8?B?K2d4T05FeXZ2Q0phd3VZcDZoTGRnczBsQjU4UkJKUUNFTEVxeW5kUkJDZFpw?=
 =?utf-8?B?d3ZpWlYvNncxQlFqTzNCQTVMNlhTUUFMQ3F1QXZIdFdwcVc4dFVBM2NySVBt?=
 =?utf-8?B?dzNCUFhhV1JCa0dMTEF3Q2pXWFI5dXU4eVk2LzhLdCtrZEQyNFdnZHVjdDZp?=
 =?utf-8?B?T25XMlByL2VXOHozanlSQWJVcTZrdVVKRG5LR3VmcFJUTHdOUHQyMUZ3U2F4?=
 =?utf-8?B?cWZTSGFneTl3bjVZQlJ4cFZ1VEUrTE5VMEVVRlVGSVRkM3FadENyUmN2UWhK?=
 =?utf-8?B?Ymh2TlZvUERlaFk2dEpMY1JPUE15NnBraGFoeSszTm9kMEovOUcyWUJxK21k?=
 =?utf-8?B?am95WHdkRzIzUHNqVmFVanplUkVJVy8zaU9YREhGY0I5YUNxNGlwZGE2dWc5?=
 =?utf-8?B?a2FHVEloR3BnQXJlMDVZN2hCcVl1M2VKcWhOTnB4UVV1VFBvSldVOHZibldv?=
 =?utf-8?B?RE5FQ2hpK1M0S1crSDcvZ1ZibWY0Um5TaTgzMkNLeEV2V0xGbGc5QVRUNWVs?=
 =?utf-8?B?emIxVXBFZSt1WkRHbFdkbUNXdjBSRFdFT3FtKzV5OU9LeTNZUmw1N1FiRGcz?=
 =?utf-8?B?SG1GSTIzSGhDQi83STFkcklmSndZSnR0RUUvcy9hVTNqTmNVUTFlOGtBRnFs?=
 =?utf-8?B?WTdjTFpyZ3ZET1N1UDBETzVDN0FZdnZYbXlIYVVIMTBQZWZDUFZMcThlU0JQ?=
 =?utf-8?B?bHlVbXJUK3FCL2hvUWVjdlkvVHZFSlVyTmJSRkd3QjJ6OVNRVEhnZlZlVjYx?=
 =?utf-8?B?MWZnMGEyNlFpS1FoRFZ1S1pLOENIc0ZESDRFalVtQmh4Qm15THRxYUtUNFNY?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 456892ce-0003-4554-d7aa-08db56163821
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:02:43.5288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fV/Vv2LqMX4+vU8ts7Rnri4ei617mZ974K1w0vQEM5ufIbMQEG6i2SIMFdcLRA2X7HCR/SmUxzk/yBa1hjvi7ueLdYBtjIrupG34XRzliw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8072
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>, Mauro
 Carvalho Chehab <mauro.chehab@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi all,

I'm working on KUnit tests for TTM subsystem (nothing RFC-worthy yet), 
with an aim to provide better test coverage for the code used by i915 
and Xe. Before digging deeper, I wanted to check if the priorities 
outlined here make sense and clarify a couple of things.

My plan is to focus on testing the higher layer structs to cover what's 
below, e.g. test ttm_pool functions by testing ttm_device_init() and 
ttm_tt_populate(). I want to split the work into a couple of batches:

1. Basic testing of structs (init/fini and reserve/unreserve), with an 
introduction of fake VRAM resource manager to test ttm_resource_manager 
init. Add some ttm_bo_validate() test stubs.

2. Eviction-specific testing with ttm_bo_validate() to trigger 
ttm_mem_evict_first(), possibly with a separate testing of 
ttm_resource_*_bulk_move() and ttm_bo(un)pin(). Add tests for 
ttm_resource_manager struct, including ttm_sys_man.

3. ttm_tt_(un)populate() testing, adding more coverage to what was 
implemented in (1) and (2).

4. Testing of ttm_bo_vm_ops and mmap/kmap/other features offered by 
ttm_bo_util (not quite clear on how to approach it; suggestions are 
welcome).

Is there something else I should pay attention to here? I can share more 
detailed plan listing specific functions and what tests could cover 
what, if needed.

Also, I have a question on how should I treat drm_gem_object when 
testing ttm_buffer_object. From what I understand, the majority of 
drivers initialize and use the object, but the TTM BO can work without 
it. Should I write the tests against TTM-backed gem objects or use TTM 
BOs with a dummy gem object embedded?

Many thanks,
Karolina
