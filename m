Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5F871724F
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 02:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0502F10E455;
	Wed, 31 May 2023 00:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5642210E44B;
 Wed, 31 May 2023 00:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685491928; x=1717027928;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y17rKoqZluInfiDylk7y0qWAMqRPGrYpzl4yBhTh/Yw=;
 b=G+74uHn0oaeYf/ep9AlY9nLUFPvxDs5jiqZDCmrlY8hPJNczF+UWbCSP
 Hl5SAhRn0uYjZLDrcBKFA862MKBrmxDMr3S+1q2ngqG6L0ZpNnJ8vHUMg
 apdP2q/FTLUap9AoCz4RoBH7hTq2g88/163tcFPqNC1CVDfOWowKRjf/R
 jjBpEoBFhlrm+OYTwVTnSqedxFObbKg+jhyiba6Y79+yJkJcUNsJqMAML
 gm3Rf73fTpW9oLQ/qOxTu2Jxp5HdTGeAM0giVF/2fUkt2lrW2Cmn8SsfR
 9Az8cHAx1nG5OAbP6ZfpUqXTM+MglkIEhmqE6o5wY6rhm3eR/7ldvhFiD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="352582900"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="352582900"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 17:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="953379087"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="953379087"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 30 May 2023 17:12:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 17:12:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 17:12:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 17:12:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 17:12:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMHPOLsOjUoGK//JfDmkcFBnNX8GE5iuhu1JpaVFsXmTGGus3uDx0YIsIZZ8C8CJ+SN5D9aoI506gRzesprEIPjmcWpn+3zuFKZq+NH1dghWNXmgB/YMCF4rkMTQHO/Sq9SsTLYbJZHG1jETYZKO2xd/Mz3uUtvu2XV2Qq0Q71+maPWpYDmXWTUbtiplOAivCnkqXzpA0zQS0al8S8q0G7hRqTczzTDfjRKMmeBCcVeAB1GbB48UVtnfNOZ53tIIyZKlcbyUVm2+YyJDaAcidSycf4ipzl8MSdM/P80GHNVccP0WrqUIyh4+1dKIs191SdQYSPnWFvc01geB8Vsd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0id4VGVMP+aRikW/ZA9IdCev1kyOGALCRx+pWIdGg4g=;
 b=XwXrrFsLnH6T6goiVEbc46v9Kmeb97DGHjtVUoHDu/eLW8AWx2HFhmpIL5cPTP/aFFd+jxz3XBpxx0NTg3edvQMn7wBlua6nynznV+FnZuEFE0Je5n0k831ZTzB1ppciLNfNUfD5mqYTnHhVf/W14jehOFUQCA7fpa1ZeifZuJJYA7TkcdlPgOeAcAkV1i0Z8Ig8xwXyEyCn5aC9OE8+UdcVa+TBn8OzD1ciJAaAZuJHtsosQi8DRxhZxITXnzzj4YcPvz4DH4O6iVI9cZCmqbOyktN8DSzWftH11R+ARp2SHZbPCbCLJLdxLVEgMJXZQ/LWT+kSfhj6mWtK/NFfYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.23; Wed, 31 May 2023 00:12:02 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 00:12:01 +0000
Message-ID: <37ba47dc-b796-5ae0-b098-43b30ed5e4dd@intel.com>
Date: Tue, 30 May 2023 17:11:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/7] drm/i915/huc: Load GSC-enabled HuC via DMA xfer if
 the fuse says so
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230527005242.1346093-1-daniele.ceraolospurio@intel.com>
 <20230527005242.1346093-4-daniele.ceraolospurio@intel.com>
 <2dffc6ef-5981-8b6d-c580-44671d396c98@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <2dffc6ef-5981-8b6d-c580-44671d396c98@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::28) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA0PR11MB4605:EE_
X-MS-Office365-Filtering-Correlation-Id: c5dca382-7287-421b-e862-08db616ba838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5iRwP6zTjh6HMb7d3LzyLSZJHZ/0jcLwYOvVbXlTh49fD7yJL63PmuqAoHQMpIbdLag6XZZ7tiTx9ZKRe13J1Rs07RxcS91grhI2rwpFYoNVXMIEiQ3Oykm5sAn2Oqtqva2RdPdHrhh3HSwSW6VIS4GwSibS98S66X9x+4Q1uWW5SN6y349sIJWZkQkPv4NDotpc4JNfEPzlvmiPQV4NtrmKieFvEw+M7zE6OazM73M4c3uXyE2BuHQNMoNn26whjPPtkV4XJeXEiTpPCHnXAyFlg5Q/1on8P+3YHaeksgnW3iktjtYy0/XDBSINlAPAaA2vc667Y782dN6/xrlWD6LYCWEHJSKg7gKQ6MUfoW00+/Ds/uNskSRVX34NFZSavYD592lMRE92UdPRIlb7UqAExADhp/17o4TFGOTatPQeM0lniMYK58pZmfVOPGyNp8Li0TWd7DmZt8IUqSfj9Y1dhIPu8xd1U1qh351HlWqZ9bTIpwG71hjvGDtuHRgcglkfnU1LbZ/PIvTZHSiwWGfXl420AIDfxSvJhGfL9TJQXkwL+G6QA2KGcXM0zBdiqx0DyG+DOdHgUq4kf+IaIu8J4NZdAQfMDoYIhonQ8lIhCnObinfAPAe1eDs6Lh3gLJN9MQSZTk3vfiKLGgQdfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199021)(478600001)(8936002)(8676002)(5660300002)(36756003)(2906002)(31696002)(86362001)(450100002)(66556008)(66946007)(4326008)(66476007)(82960400001)(316002)(38100700002)(41300700001)(26005)(107886003)(83380400001)(31686004)(6512007)(186003)(6506007)(53546011)(2616005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW9sQm1RMlByOEZmaTN0UG1qWldkK2pQT1lQV2M4UWIzUGtnVTVXemZNelJ2?=
 =?utf-8?B?T1krWkJsQS94NEdmNDVsdzJnV3MzdG50SndGc0hreEhMa0ora1dOUWdMVVcv?=
 =?utf-8?B?NVNHY0Z3S0JwSENvWVp2MW9KVEVNRkl3YkZDdGErMURXVEMrK1c3YzZEM3NK?=
 =?utf-8?B?RlN1b2JaOVRENHVSQThleWo3NENkQXVham16aHE3RHAzaSs4UUxqU2pOT1lz?=
 =?utf-8?B?ZjlsSFlMWnZTaWU3TGNGaXg4NjRBOEU0SENGK1pXaG1heDNiS1BoVFA3clJh?=
 =?utf-8?B?bjA3VWczMXo1VGx1R1d0M2IyenBzSWVMRjRDVXBCUVlBSWc0aWk5Rmw0Y3VC?=
 =?utf-8?B?d01xODh5ZnpHWXV0bE9CT1ZpT2F3ZktKOGxCaWhGU1cvMFpJU0o1TUtKWjlq?=
 =?utf-8?B?T2VkY0lWTWJqUFV3WTJxSC90Q3o5YU4vbFRFWlFlMUhGcU5DdWpaRjFtWWUv?=
 =?utf-8?B?UU5wWk1CanpzSUdJb0dEVzQwdGNTN0M2bWtQbnRZUllub2s3VGEvQ3NFMk5t?=
 =?utf-8?B?d2l4ZDlRNFhSaXErNjBkSTNrV29xL0dzRElOeWxMUlFid0ZYZFM3YVZMRklC?=
 =?utf-8?B?aG1kNzJxekk4bkl3YUZidG5vT1pPU1BiK1I2U09GSjNRWVFpd2g4TjNzYWJO?=
 =?utf-8?B?aU1HQml4ZVovUzNtU0hLNDBIRXBwMnhXQW9UeVNjcS84RzI0UldWZithejl0?=
 =?utf-8?B?d00raUZFNENMc2JPaGR3Y3MvUFpobDhmamVYRk5aTE1WM3c1amQranE0cmI1?=
 =?utf-8?B?REF1emVKa2pkMC92NHE0MEV2MFVLdE13Y2pTMU1nZlRjb0JjMWNQK21qVzQ3?=
 =?utf-8?B?MXNjMTJZc3pWWVFZRnBqTFFIaDZiTWhZNDZuaGwwV2RWckhZOStPcHBGOER0?=
 =?utf-8?B?dCtmSWtSRkVNVDg1QmZJWHlvd29jaXNJa1p5dUJVWS9tcXBuZXZIMGd5YjJt?=
 =?utf-8?B?OEhXbDRvOEtXMVh4NGk4Tyt2R3AxeGpiTkUxVEtaYzk5SlpaUy93YU9maUxH?=
 =?utf-8?B?SHhWMDYwUktXb2k3ZytUL1UxaFJCVzh3KzY1WFJLdUF5YUlWM1ZoZk9UL3kv?=
 =?utf-8?B?Sm4vNlM0SzdIRkVtVVQ1Yjc4SHZKVEJuT1RTbVlCZVRmejBsSXpibnBZRlZk?=
 =?utf-8?B?a2FSUklJaHhJMWIyaXluc1dHcllSOUZkY3RSWUliTDJUS1RyM2VFOUZ5WjZz?=
 =?utf-8?B?OVc0akpPSC9hT0txM0Faa2h1L2QrUlhrcmZ4UU1FU0VrbjBBSHYwKzA3REwr?=
 =?utf-8?B?MmViYkFJN09FNjNaZkoyUlRUeW5CWXI3NW9oeG5nRmJqaXpPc3EzcjZOYmIx?=
 =?utf-8?B?ZXlwRVBGWkdvZG5tRlF1L1pJalZ3L2tXUUhkR1hqNkdXdnU0ekV4cE4yeTZO?=
 =?utf-8?B?NXphYjJrazJQaS9sMlRsUVB1c0R5MW9mcEJ1T3hNM3dGZmtmQzFpS1RsTGps?=
 =?utf-8?B?S0RTSFpNbzNrQnp6UGNGNnhCdkNNSWNIODlVMys1VzE3STJlWVBqOTJRNHB6?=
 =?utf-8?B?aUorb1plQ1FJQWhUNFpzMEE2cnVodjBBYU1QanN5aXhUZ210aVJyL0dtZE5q?=
 =?utf-8?B?N0wwbDFUZWxhQVM3V1U5ZW5ISFd6bzlOV3RuaGJTY3ZqMUJQbXVERW1TTFRh?=
 =?utf-8?B?eXNUNzl4eXhvY3ZkNHlyMzVtMm1Cdjc0QXYzd09rdmZJRmlJY215Y1doQUxn?=
 =?utf-8?B?cVVUV1lEOGZvQjZCZzJKOFIrVG9Ya1h2ci8zenpQS2NXWEZzTXZmOTBZMWNk?=
 =?utf-8?B?aXNFL2RpYTZ4SmM0SU9VZVdyV05CV1doK2pjMS9zdUxVamc2Z3hIc3pReGVa?=
 =?utf-8?B?VzJ0cTJaV2NzSWsxT3hXcHRVOGx6NEFZSklpVHdHY3VQejN1dm1RK2dkOU9F?=
 =?utf-8?B?SExxQlQvWXBITUx5V3BUWXpCdWt1WmZFMzI3Ri9wNjRNckV0NFJlZnRCc3U2?=
 =?utf-8?B?MG8rZmp5bm9WVjBPUHFJc0lFeWIvSGZxaDZGUFp5ZlFSdWpGbjIyOENQMHdD?=
 =?utf-8?B?cGIzb09DajljMzFXWWJ0cUdDMFMwc1ZucEMwSjM4QzBvUlpiOWVrRUN1Q1hU?=
 =?utf-8?B?SGM0dk9TRVVKclVRUUlFS1ZseFVwZmJhbHU1dGdKenlsajAzVllDekdVN1c3?=
 =?utf-8?B?Q01XaEg0aDlsVnU4MzVjdkVkTVFTVmVXSk9VbGNGT3NlekFIZlBMejNHMnBG?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5dca382-7287-421b-e862-08db616ba838
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 00:12:01.6515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAJnIeVJN7uPz8pT+KhF7nIzahSH3hAE6QyuptlB6MYjX9X1toXF4hgBxVvrdFGH+O8tD0ZBzCTduX15+R3dtrNeD1m/3vn/pycFO1oVBQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/30/2023 4:51 PM, John Harrison wrote:
> On 5/26/2023 17:52, Daniele Ceraolo Spurio wrote:
>> In the previous patch we extracted the offset of the legacy-style HuC
>> binary located within the GSC-enabled blob, so now we can use that to
>> load the HuC via DMA if the fuse is set that way.
>> Note that we now need to differentiate between "GSC-enabled binary" and
>> "loaded by GSC", so the former case has been renamed to "has GSC 
>> headers"
>> for clarity, while the latter is now based on the fuse instead of the
>> binary format. This way, all the legacy load paths are automatically
>> taken (including the auth by GuC) without having to implement further
>> code changes.
>>
>> v2: s/is_meu_binary/has_gsc_headers/, clearer logs (John)
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 29 ++++++++++++++---------
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.h    |  4 +++-
>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  2 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 12 +++++-----
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +-
>>   5 files changed, 29 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index 6d795438b3e4..37c6a8ca5c71 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -298,31 +298,38 @@ void intel_huc_init_early(struct intel_huc *huc)
>>   static int check_huc_loading_mode(struct intel_huc *huc)
>>   {
>>       struct intel_gt *gt = huc_to_gt(huc);
>> -    bool fw_needs_gsc = intel_huc_is_loaded_by_gsc(huc);
>> -    bool hw_uses_gsc = false;
>> +    bool gsc_enabled = huc->fw.has_gsc_headers;
>>         /*
>>        * The fuse for HuC load via GSC is only valid on platforms 
>> that have
>>        * GuC deprivilege.
>>        */
>>       if (HAS_GUC_DEPRIVILEGE(gt->i915))
>> -        hw_uses_gsc = intel_uncore_read(gt->uncore, 
>> GUC_SHIM_CONTROL2) &
>> -                  GSC_LOADS_HUC;
>> +        huc->loaded_via_gsc = intel_uncore_read(gt->uncore, 
>> GUC_SHIM_CONTROL2) &
>> +                      GSC_LOADS_HUC;
>>   -    if (fw_needs_gsc != hw_uses_gsc) {
>> -        huc_err(huc, "mismatch between FW (%s) and HW (%s) load 
>> modes\n",
>> -            HUC_LOAD_MODE_STRING(fw_needs_gsc), 
>> HUC_LOAD_MODE_STRING(hw_uses_gsc));
>> +    if (huc->loaded_via_gsc && !gsc_enabled) {
>> +        huc_err(huc, "HW requires a GSC-enabled blob, but we found a 
>> legacy one\n");
>>           return -ENOEXEC;
>>       }
>>   -    /* make sure we can access the GSC via the mei driver if we 
>> need it */
>> +    /*
>> +     * Newer GSC_enabled blobs contain the old FW structure inside. 
>> If we
>> +     * found that, we can use it to load the legacy way.
>> +     */
>> +    if (!huc->loaded_via_gsc && gsc_enabled && 
>> !huc->fw.dma_start_offset) {
>> +        huc_err(huc,"HW in DMA mode, but we have an incompatible 
>> GSC-enabled blob\n");
>> +        return -ENOEXEC;
>> +    }
> The comment above doesn't seem to match the check. The comment says 
> 'we can load the old way if possible' whereas the check is more 'can 
> we load the old way if we need to'.

I'll reword it.

>
>> +
>> +    /* make sure we can access the GSC if we need it */
>>       if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && 
>> IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
>> -        fw_needs_gsc) {
>> -        huc_info(huc, "can't load due to missing MEI modules\n");
>> +        !HAS_ENGINE(gt, GSC0) && huc->loaded_via_gsc) {
> This test still looks wrong when you read it. I think it needs a more 
> detailed comment. Some kind of explanation that the modules only apply 
> to one platform and the engine to a different platform. Or even 
> breaking into two separate tests with an 'if(DG2)' between them? It 
> certainly confuses me every time I look at it.

Is it clearer if I split it like this?

/*
  * if the FW is loaded via GSC and we're not on a platform that
  * has the GSC CS, we need the mei modules to access the GSC.
  */
if (huc->loaded_via_gsc && !HAS_ENGINE(gt, GSC0)) {
         if (!IS_ENABLED(MEI_PXP) || !IS_ENABLED(MEI_GSC)
                 // error
}

Daniele

>
> John.
>
>> +        huc_info(huc, "can't load due to missing mei modules or 
>> GSCCS\n");
>>           return -EIO;
>>       }
>>   -    huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(fw_needs_gsc));
>> +    huc_dbg(huc, "loaded by GSC = %s\n", 
>> str_yes_no(huc->loaded_via_gsc));
>>         return 0;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>> index 0789184d81a2..112f0dce4702 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>> @@ -39,6 +39,8 @@ struct intel_huc {
>>           struct notifier_block nb;
>>           enum intel_huc_delayed_load_status status;
>>       } delayed_load;
>> +
>> +    bool loaded_via_gsc;
>>   };
>>     int intel_huc_sanitize(struct intel_huc *huc);
>> @@ -73,7 +75,7 @@ static inline bool intel_huc_is_used(struct 
>> intel_huc *huc)
>>     static inline bool intel_huc_is_loaded_by_gsc(const struct 
>> intel_huc *huc)
>>   {
>> -    return huc->fw.loaded_via_gsc;
>> +    return huc->loaded_via_gsc;
>>   }
>>     static inline bool intel_huc_wait_required(struct intel_huc *huc)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> index 037d2ad4879d..3355dc1e2bc6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> @@ -50,7 +50,7 @@ int intel_huc_fw_get_binary_info(struct intel_uc_fw 
>> *huc_fw, const void *data, s
>>       size_t min_size = sizeof(*header);
>>       int i;
>>   -    if (!huc_fw->loaded_via_gsc) {
>> +    if (!huc_fw->has_gsc_headers) {
>>           huc_err(huc, "Invalid FW type GSC header parsing!\n");
>>           return -EINVAL;
>>       }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 9ced8dbf1253..b752a7f1ed99 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -186,7 +186,7 @@ struct __packed uc_fw_blob {
>>       u8 major;
>>       u8 minor;
>>       u8 patch;
>> -    bool loaded_via_gsc;
>> +    bool has_gsc_headers;
>>   };
>>     #define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>> @@ -197,7 +197,7 @@ struct __packed uc_fw_blob {
>>     #define UC_FW_BLOB_NEW(major_, minor_, patch_, gsc_, path_) \
>>       { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>> -      .legacy = false, .loaded_via_gsc = gsc_ }
>> +      .legacy = false, .has_gsc_headers = gsc_ }
>>     #define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
>>       { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>> @@ -310,7 +310,7 @@ __uc_fw_auto_select(struct drm_i915_private 
>> *i915, struct intel_uc_fw *uc_fw)
>>           uc_fw->file_wanted.ver.major = blob->major;
>>           uc_fw->file_wanted.ver.minor = blob->minor;
>>           uc_fw->file_wanted.ver.patch = blob->patch;
>> -        uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
>> +        uc_fw->has_gsc_headers = blob->has_gsc_headers;
>>           found = true;
>>           break;
>>       }
>> @@ -736,7 +736,7 @@ static int check_fw_header(struct intel_gt *gt,
>>       if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
>>           return 0;
>>   -    if (uc_fw->loaded_via_gsc)
>> +    if (uc_fw->has_gsc_headers)
>>           err = check_gsc_manifest(gt, fw, uc_fw);
>>       else
>>           err = check_ccs_header(gt, fw, uc_fw);
>> @@ -998,7 +998,7 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, 
>> u32 dst_offset, u32 dma_flags)
>>       intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>>         /* Set the source address for the uCode */
>> -    offset = uc_fw->vma_res.start;
>> +    offset = uc_fw->vma_res.start + uc_fw->dma_start_offset;
>>       GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
>>       intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, 
>> lower_32_bits(offset));
>>       intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, 
>> upper_32_bits(offset));
>> @@ -1237,7 +1237,7 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw 
>> *uc_fw, void *dst, u32 max_len)
>>   {
>>       struct intel_memory_region *mr = uc_fw->obj->mm.region;
>>       u32 size = min_t(u32, uc_fw->rsa_size, max_len);
>> -    u32 offset = sizeof(struct uc_css_header) + uc_fw->ucode_size;
>> +    u32 offset = uc_fw->dma_start_offset + sizeof(struct 
>> uc_css_header) + uc_fw->ucode_size;
>>       struct sgt_iter iter;
>>       size_t count = 0;
>>       int idx;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> index b3daba9526eb..054f02811971 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> @@ -120,7 +120,7 @@ struct intel_uc_fw {
>>         u32 dma_start_offset;
>>   -    bool loaded_via_gsc;
>> +    bool has_gsc_headers;
>>   };
>>     /*
>

