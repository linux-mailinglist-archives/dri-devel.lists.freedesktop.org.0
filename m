Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3481773972
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 11:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A741C10E05E;
	Tue,  8 Aug 2023 09:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F3C10E05E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691488097; x=1723024097;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UlZ+m33zegvrzuSA/kufcnEolVPTCDA/tPj0MMBk2+U=;
 b=Fh6Kc659k4rL8nZzJB0fw7OvZNvFPJT74cVgWrGrrFVTd+Sp6t1+e/nr
 V4lSMl/zQHSdliZrQneWIqiPNiS3lvN/QxweAlye7p7Z+W/3hMaTl1FBK
 9pxqdaWvEUNF1p0ZBT4sB8MX7oxO9QzBRC51tFVUdKyI6QjQ6AV4TRMJb
 KjSruNlCppipxo/PErykgLlVbO2VcDJgBashiksqEOKw0guK4Tycvlj9o
 aoKF9KI/X4P6JQ8vxsv/Yqjlaxi9smTKR3cz0fuUm5Furx++IZVqzgtX9
 ak5Y9/cfDwvECZ6JEAriUaK5rz0Rt6LcywqHyHvprQgGbN4SgPsxAYGM9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350364973"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="350364973"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 02:48:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845400219"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="845400219"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2023 02:48:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 02:48:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 02:48:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 02:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEddP/V7MUV+1i23dpOMjEziHdK2g0cYyGjuK4rxb0OhWvhFB4aptFZs6DYO9YP2DuHG++iF5nHNO5OSFe7eW8mwUdcvPvZ7z+WaotMfc6PWVXh3E1vADz+JbwUb4hjaDIUYrdP8HwWW602ossJvNaWfv/Z2LoZJJRUR3F5fSHs3u6njlqu/Ted5HJXvJlzDGuhjRdRRxkwBkvnKsfJXzVlfmYfncmTExp+zMAwlrvw2/6fBhlZZKCFuYRmoDsciy5n+tW2wU+lx63Z5T2JtI236TZNBY0f1Ag4pbBSKep0kmhqJelIYSVdL7DqnrXNf0iCxAYeVDj6rB7LdTILGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yy1xW1iQWodIn3zPoiPNLU14clZN5syZ+d+ksK+Dgh8=;
 b=GM3hTTZUwLjbR+ZOp4ofX0ql8V/5/FE7FreZ37wLZkOVqASGoETnIIdJPqVvyNVJOMSB8jTCA+p9hWLg7tYit60fB3JbETToeTqPCR5DAR+FkLXgOY13F4J1kLedUxSZc5/wFNFBnH7Eo3Nc8FyOoMyY6E8sF+z0XGr9Q2/JHoZ0LzxjYiHQbTPKGVE/W3lIRNvjApqqqwGxHrpzBteKLI06DxnXqdNaak7rm+qtwPJC+RHwxwp3KEyo/ExDFXwQoyUuJ9rXFP+LfKAX8zJhA2p8dqW22cLDejDfLWwkIa7CvkXjpglpLbJXLDJOzfo012CBaJMxbgTgREt+k6gHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by BN9PR11MB5558.namprd11.prod.outlook.com (2603:10b6:408:103::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 09:48:13 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::f6dd:da7f:fb1:5bce]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::f6dd:da7f:fb1:5bce%7]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 09:48:13 +0000
Message-ID: <7b18cfd5-5d9d-9803-686a-16324c12cdd7@intel.com>
Date: Tue, 8 Aug 2023 11:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v5 0/3] Introduce KUnit tests for TTM subsystem
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1689343130.git.karolina.stolarek@intel.com>
 <c22c2984-70fc-be19-fd7a-a99e06003ec5@amd.com>
 <47890cdd-1ab8-49c5-be64-5927d5640c21@intel.com>
 <406ed60b-6c78-fa2c-0e85-ed171f5babbd@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <406ed60b-6c78-fa2c-0e85-ed171f5babbd@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|BN9PR11MB5558:EE_
X-MS-Office365-Filtering-Correlation-Id: f97d7c9e-94f6-4910-acbf-08db97f494d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3da4+kFG/jNKUnVYfQuuBabi/f0Sh5p3mE6eAAmadWVvPUwgAjeI0rliTUqdSMWIrVaPH1DWxYYk4jhk3QoShZoj5OclnFmy72sZvXAKJOpOoejggkkCRcRGnZ5dnZowCI+GUrnVFVIyFT6NOLuRmWHgFXasMgPJBq694t1NAk+ZR6xJZNlRdYYCwOxhyOeub7PyoMKPlo037veyflh+TL6+fGaBzpEJNl7gMRsf6a+s+S5F0Iw4wVzXe7oZZMp4pw/lzBxbGOl4ZqMSDgx93q/wJq9zT+8jARa12ApUKdxC7lIeyCAgF2J4b3qYpvnEk83+Fg/imdk9xtFiZusY/FpyGaIxl8dQn0vmGEzaiPVgPPlKjLeN2KEDKjctFX/aRmIBIC+tBoWN+uBFXUacZbu0WehEFLnWGFdNryuBFUT0yiFAzGx9AzbqYvrKPgGzVbB2RzDbDmkXbghLASo3BtN7d78TFT4qaXzng87K+z80ontTBB+UrHox+NgSOdeZ0F60h2caNyKLxRKOTy29rPJmi2nEXFNJ/9BJCGBzqQeQaRvU/Ou8MF/40nLlAWGmjgbQ7KUocYC/ASmSe8byaLMHu3AKTpjy0l7CdefJyWz9qR6iwUicMcukimrxgApYLyMWLDmFccrbnjW9CxXdSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(186006)(1800799003)(44832011)(8936002)(8676002)(5660300002)(4326008)(41300700001)(316002)(86362001)(83380400001)(31696002)(66574015)(2906002)(6486002)(6512007)(966005)(36916002)(2616005)(6506007)(26005)(53546011)(36756003)(66946007)(66476007)(66556008)(82960400001)(478600001)(31686004)(54906003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXh1WGFNRnBpK0c5VXQreWwwWEpzNWV4dGNPd1ZOQlRRUUx2eEc1VGZmNjht?=
 =?utf-8?B?TC83Rkh1bjFHWWh3REJwVUNOb0tKWndJUGVYalhEVjdqUDVHM2hNM01DUER2?=
 =?utf-8?B?eHpBK1dlbzhPeExYZ21wdFM4M1ZRREZnVFdQOWhKRnRUZk5ZSmpLcG5pS1hm?=
 =?utf-8?B?cXdFdGpHdlhvR0dDMy84MThxTDh2c2tHcHdLdGFoZ3c5emxlODRVTktHcTRz?=
 =?utf-8?B?RG95U1RDYzR0U2tmdTZTdlRjVksyOXA1QXQyQ3ZMb2pzTmZCa1JIVVBXVStw?=
 =?utf-8?B?M1BLcGN1dlJCNWFrSjF3Zi9idFA0RzFsVGNCSHJmTzlXMzVTL2w5dzJGSVNj?=
 =?utf-8?B?ZlczMEdIdnA3MjNJN2VuS3IwS2xUUlQxV1BxenJDbjdzVjhlbW5LVHVTTXUr?=
 =?utf-8?B?L2llS2tQMGNRTzlWSHJBVWFnZk05a0FYRFVVR2R1UkpoSjVKa3dlWDlDd3NT?=
 =?utf-8?B?Y2dsU3lvZVVENGpFeFBtbExsZnBheXdKcnlHcGtudXlkRkJTNnE0dDBiekEx?=
 =?utf-8?B?WTVWNk9sbWhDY3BxaE02YWg4WTlGVUxZRXJVUXR1dVZDYjFSdVRxUXhyMndW?=
 =?utf-8?B?RzNLM3JYWFdvTDZBL3lUYkp6UkN6d3NueEFaZEsvayttc2twaVZSVE5HRUhH?=
 =?utf-8?B?VU9OajBZcDM5ZWUwUWF5T3JIWmNLZUxONHJvVitmd0V0cXZMRXNoVU5ReFB6?=
 =?utf-8?B?dUMybjlqV0NGNlZFcnNoWVRsc2NRZWhRWERGV2lpNjNwWitZMFpBcEdjbitu?=
 =?utf-8?B?MFlwWjVtMjQ2bXA5UmF1QnJRZ1hqZitOZDNpMFg2U2tFZy9uR1VpUSs4TEVQ?=
 =?utf-8?B?VzdGMHlzc0t3ZnFiaXlMZFhwZUlaaEVDTy9KdUcrNWVHdjFsVlFjVTlGaTV1?=
 =?utf-8?B?ek0rTzBrdFlCcVRySkJzNnNwSXJPaDVMZ040VG1UbDhBblJFV05vNGUvV3hh?=
 =?utf-8?B?dmVvdHJ5aUkvMDg2anNFN0R6Y0FsYTlJRGY1K0FMcmNZenU4a2Q3aHYvdHdD?=
 =?utf-8?B?a01IdlYrV2FxSHpLVXVnZDVRS2EzMGIxS25NMkRUdlB5RlhUNmJyMmY4WU1Q?=
 =?utf-8?B?bTcvUENwWDUvZlR6bHdDQmdDSnhQckRiRXRRT2lTbmphRTUrRVBWaFJvQ1pz?=
 =?utf-8?B?WXlNOHF0WU9JWTV3NmYwZ2k4T3VwM3M3TGFDREZQVzgwRS80V2ZMMUEvdDhX?=
 =?utf-8?B?WTVaVjY4NGdUSzNNdEtjUGFFKzFZVFpBZFlQNllxQ1Bpb0FiUWZkamthbWNu?=
 =?utf-8?B?aGtNQXRBbXJDc24wVXRhZUo5dytWZlJaZUVRZWJrL3ZPUjgwWk1UVTE5SjZN?=
 =?utf-8?B?alg2Y0FvcHMwWGg3U2Z3S3IreUZCTWtGVk15TE85dWo5OWt2UkhOTDUxS0VL?=
 =?utf-8?B?QnlIWmlnTmExWHdxbUgyNmIya0crd2ZtdWM0YnBCRmM4K1BQdEMvSjA2ajlw?=
 =?utf-8?B?MlI2WGtJTktZaTN1cVl2RXRjdk0yb2tucnVZQUQ4YVE0T0RGYWVZUHNnbzVN?=
 =?utf-8?B?cGdEaGNnc0owWDUybHU4L0NOOFc5SENmdnVSWDdhSGZXT0ZzdlF5cXYxYmZa?=
 =?utf-8?B?akFWb3dIdGY5MGRDSllvOXptZ0NQZGxVNFZzMWYxWjVzdGNjcHRwQTIxek8v?=
 =?utf-8?B?QXVJdW1EQnpTeXBWdFo4eU95YUg0VXI1S0kxRWJwMENYOEh5RTAyRjNNTldk?=
 =?utf-8?B?eWxmaHVJbFRJRWlvRHhaNGVVd2NYOXdKVXV3WW51Zkd5YXJoVStBL0ZKR1pj?=
 =?utf-8?B?eFFiTzhPYzhtWFZJOXhibEM1ZGZ3ZjFyWDhNV2FwUTAxdkdaaUxJV0dCeCs1?=
 =?utf-8?B?eWZFZGphMUdxeWxiRWE0MW0zcGFBTW5ZSGdTYldtT3dIcXd4T3lWanh3VEI4?=
 =?utf-8?B?bWZoUnNqemJWVlRudEVWR1NkQ0hJL1RqL2M4OG9DbStvc0JYK1hSSlpnMzZ0?=
 =?utf-8?B?emd6WitnbXdURXBiY0tSVE16aFNOSGNDdVB5eFVQUUx0MitIcTR5c3ZLQVZ5?=
 =?utf-8?B?c0x5ZlRNam5QVkErM25HN3UyTVkwd2FPSlZ4TVhFcUNYbXBWeW1URDRUQkdG?=
 =?utf-8?B?clZ2VDg3MTJYS0kzbmVSZkorYk4vMk1OSEpoQ0t3MHZGR3NHalgyZjNBWS83?=
 =?utf-8?B?ZlA2akY1NHlLbXVrM3lMd2tjakl0UW12dFJGaGJXUlBueXlnWVFOd2swekk1?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f97d7c9e-94f6-4910-acbf-08db97f494d9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 09:48:13.0145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plhLTtpKp6tLsi3Jxg6qM8e4y10rhSIVNqjCraFU1jy4yXDoMBRP5+eeZt2Wd53aNz7YoLs/UBDIPdVrva7atekQ92rFy1fYYqRf9lqIvj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5558
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
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 7.08.2023 17:06, Christian König wrote:
> Am 07.08.23 um 14:21 schrieb Karolina Stolarek:
>> Hi Christian,
>>
>> On 3.08.2023 09:56, Christian König wrote:
>>> Feel free to add Reviewed-by: Christian König 
>>> <christian.koenig@amd.com> to the whole series and push to 
>>> drm-misc-next.
>>
>> Thanks for reviewing the patches while I was away.
>>
>> I don't have commit rights to push it to drm-misc-next, so I'll go and 
>> find someone to help me out. Still, I was thinking if I should send v6 
>> of the series. I fixed a couple of small issues while working on new 
>> tests, like UAF warnings from my kunit helpers when running kunit.py 
>> with --raw_output option, but I can include them as a separate patch 
>> in the new series. What's your preference?
> 
> Please send out the series once more based on current drm-misc-next and 
> I can push it later today or tomorrow.

I'll send out the series in a minute or so. I decided to _not_ add your 
r-b to the patches I modified, so you can take the final look and make 
sure everything is fine. There were no conflicts during the rebase, you 
can always take v5 if you fancy so.

Thank you for your help!

All the best,
Karolina

> 
> Regards,
> Christian.
> 
>>
>> All the best,
>> Karolina
>>
>>>
>>> Thanks,
>>> Christian.
>>>
>>> Am 14.07.23 um 16:10 schrieb Karolina Stolarek:
>>>> This series introduces KUnit[1] tests for TTM (Translation Table 
>>>> Manager)
>>>> subsystem, a memory manager used by graphics drivers to create and 
>>>> manage
>>>> memory buffers across different memory domains, such as system memory
>>>> or VRAM.
>>>>
>>>> Unit tests implemented here cover two data structures:
>>>>    - ttm_device -- referred as a buffer object device, which stores
>>>>      resource managers and page pools
>>>>    - ttm_pool -- a struct of pools (ttm_pool_type) of different page
>>>>      orders and caching attributes, with pages that can be reused on
>>>>      the next buffer allocation
>>>>
>>>> Use kunit_tool script to manually run the tests:
>>>>
>>>> $ ./tools/testing/kunit/kunit.py run 
>>>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>>>
>>>> To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, 
>>>> and then
>>>> CONFIG_DRM_TTM_KUNIT_TEST.
>>>>
>>>> As for now, tests are architecture-agnostic (i.e. KUnit runner uses UML
>>>> kernel), which means that we have limited coverage in some places. For
>>>> example, we can't fully test the initialization of global page pools,
>>>> such as global_write_combined. It is to be decided if we want to stick
>>>> to UML or use CONFIG_X86 (at least to some extent).
>>>>
>>>> These patches are just a beginning of the work to improve the test
>>>> coverage of TTM. Feel free to suggest changes, test cases or 
>>>> priorities.
>>>>
>>>> Many thanks,
>>>> Karolina
>>>>
>>>> v5:
>>>>    - Drop unnecessary brackets in 2/3
>>>>    - Rebase KConfig file on the top of drm-tip
>>>>
>>>> v4:
>>>>    - Test helpers have been changed to make the creation of init/fini
>>>>      functions for each test suite easier:
>>>>      + Decouple device creation from test initialization by adding
>>>>        helpers that initialize ttm_test_devices, a struct which stores
>>>>        DRM/TTM devices, and can be used in test-specific init/finis
>>>>        (see ttm_pool_tests.c for an example)
>>>>      + Introduce generic init/fini functions for tests that only need
>>>>        devices
>>>>      + Add ttm_device field to ttm_test_devices (previously
>>>>        ttm_test_devices_priv)
>>>>    - Make TTM buffer object outlive its TT (Christian)
>>>>    - Add a dedicated struct for ttm_pool_test (struct 
>>>> ttm_pool_test_priv)
>>>>    - Rename functions and structs:
>>>>      + struct ttm_test_devices_priv   --> struct ttm_test_devices
>>>>      + ttm_kunit_helper_init_device() --> ttm_device_kunit_init()
>>>>      + ttm_kunit_helper_ttm_bo_init() --> ttm_bo_kunit_init()
>>>>    - Split ttm_kunit_helper_init() into full config (with ttm_device
>>>>      init) and basic (init only with device/drm_device) initialization
>>>>      functions
>>>>
>>>> v3:
>>>>    - Rename ttm_kunit_helper_alloc_device() to 
>>>> ttm_kunit_helper_init_device()
>>>>      (Christian)
>>>>    - Don't leak a full-blown drm_gem_object in 
>>>> ttm_kunit_helper_ttm_bo_init().
>>>>      (Christian). Create a small mock object just to get 
>>>> ttm_tt_init_fields()
>>>>      to init the right number of pages
>>>>    - As a follow up to the change above, delete 
>>>> ttm_kunit_helper_ttm_bo_fini()
>>>>      and just use ttm_bo_put()
>>>>
>>>> v2:
>>>>    - Add missing symbol exports in ttm_kunit_helpers.c
>>>>    - Update helpers include to fix compilation issues (didn't catch 
>>>> it as
>>>>      KUnit tests weren't enabled in the kernel I tested, an oversight
>>>>      on my part)
>>>>    - Add checks for ttm_pool fields in ttm_pool_alloc_basic(), 
>>>> including the
>>>>      one for NUMA node id
>>>>    - Rebase the changes on the top of drm-tip
>>>>
>>>> --------------------------------
>>>> [1] - https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html
>>>>
>>>> Karolina Stolarek (3):
>>>>    drm/ttm: Introduce KUnit test
>>>>    drm/ttm/tests: Add tests for ttm_device
>>>>    drm/ttm/tests: Add tests for ttm_pool
>>>>
>>>>   drivers/gpu/drm/Kconfig                       |  15 +
>>>>   drivers/gpu/drm/ttm/Makefile                  |   1 +
>>>>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   4 +
>>>>   drivers/gpu/drm/ttm/tests/Makefile            |   6 +
>>>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 212 +++++++++
>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 115 +++++
>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  41 ++
>>>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 441 
>>>> ++++++++++++++++++
>>>>   8 files changed, 835 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>>>
>>>
> 
