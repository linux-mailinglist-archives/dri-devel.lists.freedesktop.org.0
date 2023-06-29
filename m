Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76DA742136
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 09:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A904B10E3BA;
	Thu, 29 Jun 2023 07:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CFC10E3BA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 07:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688024567; x=1719560567;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sPL8hXolWqMrQQH8ropvuyxoa0M8pagyw/Fxx/EXyjk=;
 b=kFNYHuDbvAMrf0YkQDwFLeEjKrHT4hnP68YcbHuglmeNyRu5//EKHqHR
 rOAJifJdyL4fWtLFvrzJlZb0GMDDaPS7EsE92A6g5yree4jKpxbtL0vD9
 e+/ykZDADanoh5qph4w4gI8XPpPultN5WJJYtsRUypW8AKYjWZuFMRZEs
 WNYwj0aWFq1QIlH0Uyi09L8ChIH7RPK7jdBRInRd/hazojdIH9O3sy7FZ
 ZLunzUjvucs9ic+B3Y5TtVPxsxe/0ldBa/JZmT7X74mV45mpLgnzHW2Nm
 tOFhmFeVFEMDyKeVmJQjihK4PiCUnOwe06TyerKBkSemuTV4/XcpLTYhm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351846921"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="351846921"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 00:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="782599754"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="782599754"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 29 Jun 2023 00:42:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 00:42:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 00:42:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 00:42:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 00:42:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2/zDUg7IoICEzo+dis5louzQjJcXpr6ax5qfoozctAmWO5+whMVdBfedaOJBBngx8GlaYbdc0verjEoO74Ppbm3eeykepG+Sk+cCZHzhAF0dHLQluoOkvIQ0ChfKMySPEuZnM3HUtIFhgl5uXnfEhuWj1abKDqaRq9L39La22T76xmx6k9H1TLSdIcXWIwCRMk8nK0eIAWSJH5aP1jIevCf+rKCQcWSPQjquwBknD69NiI9YoVtBaMi7GN6/poLlPllnAERqf51IWZJhbwo7VAVZm/0E+cVv1u4D34gX9cnDdJKF5WOBaKZoGGR1EXogIneBMxNEz6misGWPSqMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAyZx1djtZlqnYuymIA1GInaxeLmgV5bCvu1osoyBC4=;
 b=dPqvy4TDUYCaZ0FEsHMJI7qHKDlBkl9hd1Zo+FyMuwBFEsQjs1rJRhWiwGPxeb/D8JGvhkQr4Fjfol59sKliOBO+nAwffqIcIXPtgI/hdTlZ7l77eVEIwE7UWLyagMX2GN3ycfhSDGoDJwpcYpRarOcJHE7Sw2+JBBEkdQzIzCFuv7l4amxZpE3uPwKteV5GsIM4l5pCkum3dsQbWTLfkvC3midFstacSDyQJkt8wETT4V9pAr5R9HSVbwGJuLzPOdUKwgz8Uw52+7QUwHvdf+UoQ9HQVOHL+iqIalMllwYM0Dhry9KLmbF8AI+eflGPxTzeAtN1HryiuAYIwcBO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by BY1PR11MB8056.namprd11.prod.outlook.com (2603:10b6:a03:533::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 07:42:28 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63%6]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 07:42:28 +0000
Message-ID: <b2d9a3ed-899d-fc21-dc70-5e3cd7a42652@intel.com>
Date: Thu, 29 Jun 2023 09:42:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v2 0/3] Introduce KUnit tests for TTM subsystem
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1687779215.git.karolina.stolarek@intel.com>
 <d4d9cccb-498d-673a-6727-7785e91f6e73@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <d4d9cccb-498d-673a-6727-7785e91f6e73@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0453.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::26) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|BY1PR11MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 611c002d-3780-477b-a3e9-08db7874633a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N6mY2ikFwxRq7P0LRyJ9Wo+UcKNwqT5pCXbkgg7f9TwB6u8ReITdJOo5GIkYveAzeavCTporHnDSZcFk1+9rj2X/RexMkOxV1wLS1AiLjo/fiLU6Ms8/hE+cNzf6bNe4cbhFXlDhm5TXWNt6FiJAK2TI8xZIKtKEkEYfbH2hFkIuCMxzReZ7Y8o5H+HVeKL2rIPgNcu42zJSGw0lLqdepIRDQk/5iWNvnDSaHGuB8EDLmJlZEhSs3ViGjvqSD1u/QJAETAIHM5M6cBVoldzdN4FJtrBKgb5tr8UDIjWK3cNTF5lndYzmM07LzhFvCz8Kn/v7CCLAzbp7LzXyhytjmya5JGYcGAZZZXPAcGsAS4pmdzaam3YTtvKPEWoAG1X44Dc1W6bdv5wnbkOhiRTs8B8AIKLI6ii+zY9VCI8GK9HTVRDy3u9JGJboGbRNnpOJYx1ucqqJbm4Hm96d50Q8ZAaJtyHLRAI2E8MxGtv23KDC4FynDoURnmkT5cxCHkMY3J2HRSq5KYQbS7qHfAFjjyMMTmK5S3VXV2rVspOgO/RegywvuKiGiG9Q1Mq7mWO+rfpQ4zVoVWMRD6Kv+b42Pb0f8QUjiOczKGh/m6vkL6kVYUND3Nkto5F6OQA+qxYi++uwhZGqy4tYnkDUmhpTY0FZSY2a4pwWNSxbmdQ8T5r0e2Fav1VUaw1MtryDYzz0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(478600001)(36916002)(6666004)(4326008)(54906003)(53546011)(6506007)(6512007)(26005)(186003)(966005)(6486002)(2906002)(41300700001)(8676002)(8936002)(66946007)(66476007)(66556008)(316002)(5660300002)(44832011)(38100700002)(82960400001)(31696002)(86362001)(36756003)(66574015)(2616005)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0hiekNxYzkvNFQrbEFPczYxckhKR2NscHBTZUFSNXZtQ09KUkZub1RUK1J0?=
 =?utf-8?B?c01xbE5pTG5aV1V4clFJNkdNc3NYdkZmSVJ6YTVScUdoVmt2WWVDNkxNb3dE?=
 =?utf-8?B?ZXJSek1xTjRET2s5ZjFJWFdOTUtXN1V6UkxFV1FTN1BrQ0htVTZKaTF4R2h6?=
 =?utf-8?B?NXlDc2RXNkRkVS9CaWpEb3ZLaE5haDRPSGFncll0MXV4K2lCamFiVE53eUoy?=
 =?utf-8?B?SGtGVG9SbGlPOUdpMzdqdEZoaHpZemdzT1ZXYWVHYnBJbkI0Vk5kSU5oUDRq?=
 =?utf-8?B?NTlOdUw0OWJxRkIzcjRsdE9sTEx2c1hPd1FtdHBJelhaNkRIZU5meU1mbVky?=
 =?utf-8?B?NkdWK1ZyWE01SHUzcWxoTTFoTGlIUndSa0tXNncycnNZUkRvb1B3ZlNlN1E4?=
 =?utf-8?B?c2pCS1NjTVlGMlh6MnIwUnMrZjVYMGxhM3oyanpSUkhwUS9wY291NGMrcHVL?=
 =?utf-8?B?NnRaNGZpN0h1dHd4aEdaUm9GbVlPT3BLYlI5RWx0RGhWVkNtVCtoclRMZnlU?=
 =?utf-8?B?d3l2aVVMMWFoNThIZEF4K0FWVFdBUWNmVHJwdDYvVXgzK1dBeEtCZjcyZ2sy?=
 =?utf-8?B?bDNKNU1GUS8wTGpwamdGTEtmS0hrTnFueCtBS2w4STltOVJaWkRXemV0ZWY2?=
 =?utf-8?B?eElrYjdqblZxNEd2NDdFZHpPckUzQndTeFVhaXZRQXo5dFRLTU9WYzFvUlFS?=
 =?utf-8?B?cGp2YStrQjJSKzhRVExxbHBYUEdPSDdHQzhHRldpd0pjeVo3T3ZOOGJtQ1Ay?=
 =?utf-8?B?Y25uSS9iMHgxdlNQckRWdWp4eUF3MS90bEI3RlhudmlZelQ3aU5hUlduY0Zo?=
 =?utf-8?B?dmNxZWx2SEpOcUp1S2tmZjkxSldkQU1UdHNHYXBZOGdnZXhLc2JiNkM2Tk5E?=
 =?utf-8?B?aldTdlR2bURKVGRnRkFGcllCUndqTFhzV1UzZndTRGtHU2FOQ003aktrZkM3?=
 =?utf-8?B?b0JDMHNtY0g5WDFiMmdSR1UyRTYxNmRER25lM09Fak1Cb05zdVR5WEVnbURh?=
 =?utf-8?B?a2FLSkJFbDY1Um1odlI4dDh2b2ZlUmNJM29wRTk1Q0FFZDlMeEIrVitjeGRJ?=
 =?utf-8?B?R3dLQ05Pak9RMWxnK2FmVEhYeU1YQWQra1QrQTA3Nlk0Mjk0Z0hDVWlRN0R5?=
 =?utf-8?B?RnVnc2UvWmpKa0szR2h1Z2w3WXNZelI0Y3lJTUNKY0VnUW9BU0lxUnpya2lU?=
 =?utf-8?B?SWNtYVJzakRkMU0yNkZrb05Vc1k2d1VDZXNxN3ZtbjhKNkM2QnFLbEQ4blFM?=
 =?utf-8?B?MlpmOTU0aE84NzNrNHhxWVdacEQvL1IydC9RY2JHcWxIYlV5QzduTThrSzlw?=
 =?utf-8?B?aXFZbzFPRHBYWlFTOFlFYkN1YTNXOUdKMXovVkNXeCtHaFB1QjFiZzBiVlRP?=
 =?utf-8?B?Y3V1dVBrdTBwRllWUmNSbXJZMEZ0RTdJWmZ1dGlUS3Nsd09SYU1GanVPY09G?=
 =?utf-8?B?d21wajZ6RUpWZWkyV2dCRVlGQngyRkFuR25OSUtKemVnRzkzOTNScHZ3bWFh?=
 =?utf-8?B?bENiajJkd1l6UEpMaU1DSlJtOGdsOWhiRFhURjBpYUZKbXFudEtBaVVBZTJQ?=
 =?utf-8?B?WkhBUVJKcTZLUXRsUWhCREt3bERic0p1SURseFgydCtyYTRpMS9TWi9aZVdJ?=
 =?utf-8?B?WTZxMURCYWJZaEJPYk1wZ25yL1djSVNEZ3gxVGpDVWR4cUNJREpPTkcvNDRL?=
 =?utf-8?B?eEFsK2JUTmRoZStsaEtXZGhPUmZxQXZCNFhIdlhMTEw5alFFQkkxWGIzY1hL?=
 =?utf-8?B?NzBocnNhMFEzYzRLdG1OR3IrYnBnV05VMmtVU044SnU5RG11akM3bU95SU9h?=
 =?utf-8?B?cFVZVGsrdlArR3RkcTQ3RC8xN3dGY2c4U2tINExteGhwekxNN3Y4dXpJc2VP?=
 =?utf-8?B?bWxycHVnYlpZbVRlTFlTYWU3UEJXUHV6TGlXUVFpa09lSDBKWWVSVnhpTGJ0?=
 =?utf-8?B?c3hIRHhwT2JuMXJybElralVsYnZKTUhBWnN2VmlpSlV2WDZqNTc5UFFlUmZ1?=
 =?utf-8?B?T25xUmVpSUplNmljNUZUUW5tbEkveDBpMm9vL09VZ21MbGUrN0MvK1AxZ29I?=
 =?utf-8?B?YjRDNGp3cjBKaUdydEVSUVh6c2N1YkNMZXpuQXpJVWVGdzVFd2Z0ZlNnc3ZM?=
 =?utf-8?B?T2s4dmRrd3d4ODlwaER6eU94d2xCeXFBUndPR0xQQVpZblMrM3hvN28rUjMr?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 611c002d-3780-477b-a3e9-08db7874633a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 07:42:28.4382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqHWZp9PeHonRwkaJqLlZa3qkkIvZNpxyogwVR26nZ3MKBGZsZvjtWsnyg2Fx/WHK/e5QGKEYw7EeJzZ1MKlytpp2Y5mGQ2CDAoZGAwBsqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8056
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Shuah Khan <shuah@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.06.2023 09:39, Christian König wrote:
> Sorry for the delayed response, AMD had some mail server issues and I 
> simply missed this through the web access interface.

No worries, that gave me an opportunity to fix my series :)

All the best,
Karolina

> 
> Going to take a look at this now,
> Christian.
> 
> Am 27.06.23 um 10:32 schrieb Karolina Stolarek:
>> This series introduces KUnit[1] tests for TTM (Translation Table Manager)
>> subsystem, a memory manager used by graphics drivers to create and manage
>> memory buffers across different memory domains, such as system memory
>> or VRAM.
>>
>> Unit tests implemented here cover two data structures:
>>    - ttm_device -- referred as a buffer object device, which stores
>>      resource managers and page pools
>>    - ttm_pool -- a struct of pools (ttm_pool_type) of different page
>>      orders and caching attributes, with pages that can be reused on
>>      the next buffer allocation
>>
>> Use kunit_tool script to manually run the tests:
>>
>> $ ./tools/testing/kunit/kunit.py run 
>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>
>> The kunit tool might not work with older python versions. To fix that,
>> apply [2] patch.
>>
>> To build a kernel with TTM KUnit tests, enable CONFIG_DRM_TTM_KUNIT_TEST
>> symbol.
>>
>> As for now, tests are architecture-agnostic (i.e. KUnit runner uses UML
>> kernel), which means that we have limited coverage in some places. For
>> example, we can't fully test the initialization of global page pools,
>> such as global_write_combined. It is to be decided if we want to stick
>> to UML or use CONFIG_X86 (at least to some extent).
>>
>> These patches are just a beginning of the work to improve the test
>> coverage of TTM. Feel free to suggest changes, test cases or priorities.
>>
>> Many thanks,
>> Karolina
>>
>> v2:
>>    - Add missing symbol exports in ttm_kunit_helpers.c
>>    - Update helpers include to fix compilation issues (didn't catch it as
>>      KUnit tests weren't enabled in the kernel I tested, an oversight
>>      on my part)
>>    - Add checks for ttm_pool fields in ttm_pool_alloc_basic(), 
>> including the
>>      one for NUMA node id
>>    - Rebase the changes on the top of drm-tip
>>
>> --------------------------------
>> [1] - https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html
>> [2] - 
>> https://lore.kernel.org/lkml/20230610175618.82271-1-sj@kernel.org/T/
>>
>> Karolina Stolarek (3):
>>    drm/ttm: Introduce KUnit tests
>>    drm/ttm/tests: Add tests for ttm_device
>>    drm/ttm/tests: Add tests for ttm_pool
>>
>>   drivers/gpu/drm/Kconfig                       |  15 +
>>   drivers/gpu/drm/ttm/Makefile                  |   1 +
>>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   4 +
>>   drivers/gpu/drm/ttm/tests/Makefile            |   6 +
>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 213 +++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  88 ++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  34 ++
>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 406 ++++++++++++++++++
>>   8 files changed, 767 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>
> 
