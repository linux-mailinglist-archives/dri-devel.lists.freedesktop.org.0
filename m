Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E57CC177
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 13:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB3C10E2C9;
	Tue, 17 Oct 2023 11:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727F410E2C9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697540713; x=1729076713;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IQCLTMTKYEUBd/B7jkRq/PEbtpP7WMoGhy/nWL/qXvI=;
 b=lzAH/2b7VGhPhG50+datzLwqFbcZyTKv8VN7G/S8SVTMQrpZ6SRgdJRL
 KGDl3VeatvqsuCaw1/4TkbEslmfs6UwlnqfvxLHnuv+7Kx+TIWBzZyHPm
 Z8zUH0ys5sbP1vfKHwF/BfsovTNdXiqj/jhz+e7jc/h0Msk6QLTJ7zSfZ
 VYIYlx8lt6C8/R6hTRSERpbcVHaouduRYsiU5xkNoElmeAT0wnEUXUjHa
 eoA4yaKbSzpWHbNkWuN5R879FnO+cMyte5MCn6R01OjKgo6JslyPmoyHY
 fekTX4ZqwOOBlSkX5AnioLPvHCWMKTEciXyTiF3iDkyx4zN0cnVBd+tMm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="416841687"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="416841687"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 04:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="4053417"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 04:05:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 04:05:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 04:05:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 04:05:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 04:05:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3xaYjIoC7XtZgaW0obIKq1CIIH/U2VJj2k5pcK0+IWQlzwJGmaodnLyEBdR4pr3W/iHvjeRceTjblpQaf6gVn4mtoDHsnu8aMB4YCo5wG4kDF02zG4krKilDKuJylMFRdgpTtU2qPuVMDHyJOJk33um1vqzjpACqWyKtosgzn+Ni/WNeCw6RUXpe3AzStvS2WEUl/KyM/PWuzN0FYCApf/MceCi6RkYQoTNJyYfW+MAAyXY5rXdu8fQHdNMncYOBlVatmMCHdvi1g3sSSwyNv7rHJlImlYcf5EYN8hKltPSlHXse3bnC464hLMmm7IJ3o348kC7ipx9fRx7lNHlog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0iYnXQdtZVZTHreBLPLANdsFhaFWYqcsFOKbyiHjEc=;
 b=g95R+BKNOQ8at9ZOgJAH1mu0j3Cf5dsDLz/tRda8SKg98DgoX8wG4Igpj8aS2xk8CwqBlJZgabZIzQIjyCNTvomYndhEjrJResectfJcpDbMiR4izL1DqLgxFAYsFQqVDpbgt5+Q3JUy1UgE3OIebmLmMjVjIt3slcSsIeF2xY42LTqpYIFP+mgA3QI+rx+yuqBhmcWBpov/0xQnnPXaWlgucs1PEzWVyXFhsB65pJmPfuAGWDyB88Qq3zonS9y2K7yKMn9gNo1Sclwf+S0ABLAyRZc+FBQyK+rLDnglWubN0Rh6iLToPGT/QtinLaxbs6jnFTyHk+zoGJW42gcKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.36; Tue, 17 Oct 2023 11:05:09 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d%5]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 11:05:09 +0000
Message-ID: <c9d088c2-341a-b315-a15b-8b8c0d487548@intel.com>
Date: Tue, 17 Oct 2023 13:05:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 0/4] Improve test coverage of TTM
Content-Language: en-US
To: "Somalapuram, Amaranath" <asomalap@amd.com>
References: <cover.1697445193.git.karolina.stolarek@intel.com>
 <9854008f-6755-4c09-9f23-90fa62911222@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <9854008f-6755-4c09-9f23-90fa62911222@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::19) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DS7PR11MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: b6dc8686-19e7-4699-0f48-08dbcf00eccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e0hdNL+tMmfRSqAwwGOsG2i4msMRECfBC7LGOoRmCZtZ/uU66J0o1iCZuot2ShOz3bjoDDySm6gO47WpmpXi6h70Z4w0SglzO5ait/EYHGVq4bIiZ6JGcZGT6dEpNEbGUUkvCRhJzyo2X1oNdQ4UMQQR1guH6JFB0mxrJBF0TzAo+dAtQ7KDtiaB1w/60U5uVUbsOkebrs7ho2uunXrczO9BUs51t8WI+SiEQRxFMNWvUfsbhomHC02FbisDz+jBBw/pxw50pP61zQYd6DOZPxHo+jZLXv3uvtx7qlVX1s/WBIhKc6lmSr5QH0AUxqwB/QAby9p1V9J0TO8b3NZ3cQlqCm7F+p4j/CEMu6MoO1E/hhIrU0kBCXAxlRKGouZnSstuzxEMpwJxkBqsgOX7lY0KCCIIJJn1pRP7p9oTrvzNvCZ82druwspfodKYpBfJDHTDIP9ZIXzymkqGBLv6Gx7lsyxWDHYXZDH1Fqknv0onlEJiHeDx4WbGvVHmgNH04wEmTaB92zV3rlpFAt9HfU+yzWoH9TwIPSZV/9kePpLHqgjLwrzHvVHITuT+A3V5a5s1ycd9XrIF8j+C5Z7QBstYkPce55qZmEL2OC4VJxCYLR64vS5mXoE3Bx85uyazPEzFeEEkjlikVhA5QTe+Kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(366004)(346002)(136003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(82960400001)(26005)(53546011)(41300700001)(83380400001)(36756003)(2616005)(6512007)(86362001)(38100700002)(31686004)(36916002)(2906002)(6506007)(31696002)(6666004)(5660300002)(6916009)(54906003)(66556008)(66476007)(66946007)(316002)(8936002)(6486002)(478600001)(44832011)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QThiano1emp5aFRaK0Z6QUVNNk14NWNpWHFBWEZDdDE0S256VU9QcEZqSFFJ?=
 =?utf-8?B?QUZ6by9kdVlzTlpIRFZOSkR6cHdMNTcyU1R0Wi9wMTJtcWw0T25KdkhyU2Ry?=
 =?utf-8?B?YnRNd3R6WE9idVZ0MTJoSDNkQUV0WXY4Ylg1NFFobzZzVmluRDNZTGd2d1hY?=
 =?utf-8?B?L1Jqa3M2QTFkeWVYSlkvcUJXUVQvc3JlbXFXd09KYXJJamVwTVJRTi9DeUVU?=
 =?utf-8?B?SUpVWUZRQTFVLzd0dWIvVm9uTDNFeU9TS1E3SzlzSDZaUmRxeDNpSGFwUVlh?=
 =?utf-8?B?dUZ3TFZNNi8xMDVubVFJVXUyQm5MUTUvWW4zdXF5SmQ4VUdqcDZEb3BhTjY3?=
 =?utf-8?B?TUhsYjdRVUV2MWtkUW9ieUNNMDI4Z0hWRWJZaC9BK05ncnplMytGelJlYnhE?=
 =?utf-8?B?U1gxendqSkJBemdlY2RDaDd6TGVWOTlITEFLNE5mNnY2M1BGVDhoUS9TbU9O?=
 =?utf-8?B?V3NnL1RJTlU4bWs1UTNiM21JSlM2dXZsRzd6T2NSdW85WHhEa2xLcUxlUUMx?=
 =?utf-8?B?dWdCcGhGNFRCaG5RUkxXL1N4SVVNSHdDU0tCSGpvQndMeDltalZkTkMxVmtk?=
 =?utf-8?B?cW8weWdOYW0zNFR2Yy9NNWdsY1BIamFmdXJBc3JBNjFQR2xoSld5Um1kajJC?=
 =?utf-8?B?NkJyWFlYcTcrNFdJdXdyMzBFZmtTQy9TcTVEeUpkUWl1RFFydjVrTHlML2Nj?=
 =?utf-8?B?Z3JJdDlGUWNFTHJEbE5pcmYyRk12cnJQa1RoSlFTajhyem9jVmJtb0pnalhr?=
 =?utf-8?B?UWRaY3RrVW81RndHdU9uMndiQ0I2TnZ6TG1ZT05IME5TWXpvNzRhajBlUU53?=
 =?utf-8?B?ajZxYldTK0twa2tSNHV3WlNWU3l3dWF2bFJITjlvanRlczgvNzZRbDJHVUxT?=
 =?utf-8?B?QnBBeG9kZHowWjJacmlDc0crVUVCNXhsREs0K0hJR2dVZkNSanp2QlNtUTV4?=
 =?utf-8?B?ZDBXNEYrRmRSOFJEN0tvMnNNcXFHQmk0dkZ4NTFzNXIvc0tPeXdYcUNpOUxD?=
 =?utf-8?B?enNJQ0dyeXEvOHQyajB3QVpCNHlqYWNXdGFaMXlFY3FzNndCVEtqZDNuQW1Z?=
 =?utf-8?B?MXJvUVBRZ0RJenZnQkZCb29JNkxqbTB3K28wVHhsOTRJWG1DNzRpQmZBeDhQ?=
 =?utf-8?B?M01MY1paMjB3WWZybFlrTTJBL21FVGRVcjdPVksxdnVKbTlTLzFya2NDaGw1?=
 =?utf-8?B?N2trVFhKSFZ6OXByT1NibndZT2pITkdEUkxjdGRhamV4QWVwODlmZXRnTURr?=
 =?utf-8?B?UGFsQlVCYWJoL2d2UWp2SlUwOTRLb1dBTzAvMlZwVXh5ZWpuREVvbTNrQXZP?=
 =?utf-8?B?Y1A4ck1oL1BxZnh6Q2lTUUZodituYjJIZDNwS05FdDZyMFEwZ0IvaE5KS25q?=
 =?utf-8?B?MGxwdXRFQlRJbTF3eEppb2h6ejNEMm9LcDVoZ1BpUjBsdEtFSjJveDZyZDJC?=
 =?utf-8?B?WlphZ3JtS0t5eXUzbDVDcHVva1hpNGVxaFo5eEIzMi9DcEljdVpaNHNPSlIx?=
 =?utf-8?B?TTVqcUx0MmZ2eTdYUjdWc3pnV2EvMWxRMk41NUN3ajYxVWgrRW5jYi9iRVhM?=
 =?utf-8?B?OEpWZFdlNXhVT2lhSXA1dE9CYlp6ZTFXWWJxaWZla3gyZFYwRXhqclNYNi8y?=
 =?utf-8?B?cHExanh0d3hzK1N4SkdUUDdYTHZRdUlJZi9rSnd5U2d2THVWWER2eXZxd29H?=
 =?utf-8?B?Zy80Ty8wa2cwTTdJcnQ3VURKbENKcUhrVTZiSTNKRFFCbkFkSWh0TmwzNUFD?=
 =?utf-8?B?UDdSYnBodWcwTXFRUUlmUEc5MVRveGh1elB4RHl5TVBYZFFYT2s1T2hEVTRS?=
 =?utf-8?B?Y2FKeDVtSTlpTzdMYVNrUlcyOGx4U1NaZmY3ODcwUExCQ2VMZFdjZWw1WmdE?=
 =?utf-8?B?clFVUW5VNVJBTTNNalhjSFdrb2Z6Skd0TGFxbFVEV2NMQVJ4UmhpNlJVQTVl?=
 =?utf-8?B?SGJhZHZiZ1o0SlM1RlFkQXloQURITDFDdTVHeGtqZGYvMU50Y2RYTjZ6OFZ6?=
 =?utf-8?B?Vkx6RmlFSEFJMFVNVExGdmhudS93Z0w1VzZvVXVFa1cwcFc5azFCZExtQXgy?=
 =?utf-8?B?d01PTjRFSlROM3dhT1V3Q1RGU2s2aXlTbGVRbjlDd2tqNVNHVWpUTTNXeWoz?=
 =?utf-8?B?R2Q4SzZDL0Z6bWtYR20rOFZXZ0hoK2dyMmVleUlZd3l5VFhXTUVvQTVRd3F1?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6dc8686-19e7-4699-0f48-08dbcf00eccc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 11:05:08.8282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJepJDuQkRUMXj7CsfMTgXOjvq6nJ+L27DRk1UcD2csMFHNroo+I+Amn0kWpXkszd/7koEAKkb9MLlaPApKRdt+PyKzGt2Be1zfygJ6VCmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Amaranath,

On 16.10.2023 15:08, Somalapuram, Amaranath wrote:
> 
> On 10/16/2023 2:22 PM, Karolina Stolarek wrote:
>> Add tests for building blocks of the TTM subsystem, such as ttm_resource,
>> ttm_resource_manager, ttm_tt and ttm_buffer_object. This series covers
>> basic functions such as initialization, allocation and clean-up of each
>> struct. Testing of ttm_buffer_object also includes locking and unlocking
>> the object for validation, with special scenarios such as an interrupted
>> wait or deadlock.
>>
>> Some of the test cases check the bulk move mechanism and how it interacts
>> with pinned buffers. This is to be seen if we want to add dedicated 
>> testing
>> for bulk move or not. The resource allocation subtests use 
>> ttm_sys_manager
>> for now. Resources that don't use system memory will be indirectly tested
>> via tests for ttm_bo_validate()/ttm_bo_init_validate(), using a mock
>> resource manager.
>>
>> Use kunit_tool script to manually run all the tests:
>>
>> $ ./tools/testing/kunit/kunit.py run 
>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>
>> To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, and
>> then CONFIG_DRM_TTM_KUNIT_TEST.
> Tested [PATCH v4 0/4] Improve test coverage of TTM patches on AMD 
> platform, looks good.

Many thanks for taking a look.

Do I understand correctly that your Tested-by would apply to all the 
patches here?

All the best,
Karolina

> 
> Regards,
> S.Amarnath
>> Many thanks,
>> Karolina
>>
>> v5:
>>    - Actually use the page_flags parameter in ttm_tt_simple_create()
>>
>> v4:
>>    - First unreserve the object before calling ww_acquire_fini() in
>>      ttm_bo_reserve_double_resv subtest
>>    - Silence lockdep in ttm_bo_reserve_deadlock subtest (open to 
>> suggestions
>>      how to fix it in a different way)
>>    - Use a genuine GEM object in ttm_buffer_object instead of an empty 
>> one
>>
>> v3:
>>    - Instead of modifying the main TTM Makefile, use
>>      EXPORT_SYMBOL_FOR_TESTS_ONLY() macro for symbols that are tested but
>>      not widely exported. Thanks to this change, TTM tests can be built
>>      as modules, even when non-exported functions are used
>>    - Change the description of a patch that fixes 
>> ttm_pool_pre_populated()
>>
>> v2:
>>    - Remove Makefile for KUnit tests and move the definitions to the
>>      TTM's one
>>    - Switch on CONFIG_DRM_TTM_KUNIT_TEST=m so the tests and TTM module
>>      are built as one. This allows building the tests as a module, even
>>      if it uses functions that are not exported
>>    - Fix ttm_pool_pre_populated(); a wrong flag was passed to
>>      ttm_tt_kunit_init() function
>>
>> Karolina Stolarek (4):
>>    drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>>    drm/ttm/tests: Add tests for ttm_tt
>>    drm/ttm/tests: Add tests for ttm_bo functions
>>    drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>>
>>   drivers/gpu/drm/ttm/tests/Makefile            |   3 +
>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 ++++++++++++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  51 +-
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 295 +++++++++
>>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>>   9 files changed, 1313 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>>
