Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5325071317C
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 03:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DE210E1F3;
	Sat, 27 May 2023 01:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B104E10E1F3;
 Sat, 27 May 2023 01:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685150890; x=1716686890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+J2g0aeL/SonkKHww1FQsL82IDDRtpSnq0S2peABboM=;
 b=Md/Id7LdvawZIb/EKsjI5Vye1lmuKrN2+uO3TCXgeR3mIsOe99ao+E5K
 zGdu+14QHKbrx+k5EdIa3Cr+T2/PzcaJV/NkPqXPf7GHv0MtfxWOQxiuO
 kZ1Zp90n1h/HuXYsFh8Ws+sgcZHRUPkrD33ohrCyfqUR37M259UNpg/4w
 /D8TNm8FsscnM/TPXILItRbwAuFcy2j4jD7hxuQqpU6KtgPTBqInjx52P
 +Qfg+TT/dng8BWug87BbrEstvcni12E7QsRn6rlS/E7cXosHUUhn5AYtL
 Vneh1qtnfPqNaSDAVdg+SWshiKug3QDoOJCiM+mwYNTGPbEZNZSB91HcD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356725633"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="356725633"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 18:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682904477"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="682904477"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 26 May 2023 18:28:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 18:28:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 18:28:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 18:28:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sz5j1fAP4DegC+1E/mSMPdMj4k+bM03ltDSBsDTM0LXdhyj5UtD/yo4zuzqCtSPL15eFz16eHpeXcd45QPQtFgtmzX13xIeDvBA/dmP64a2CgpGVLwsS4H8gcdZavN5cGbXG72T0W8MLS/Ewh6r7CHpyuQCQ8TI0c/9Kwk/l/k4mty7KD8StLt3tohNi7P/inwyK/7YP57OtO+b8jGvKWsPe9pFswcxuElChqoLhyojVe7uC4PMOka14h/CPx4RHcpDZMfd2aTqhiXnwBWeuVWI/rAlgeFQ1dbgO18RfcT/kWulMrayiw85MMELeuPVMmIPQGrSx6Q4iBfzYklILkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L27/rmt01OWevYgTbe6WEETmouSuVgZUCURGnO5w1lU=;
 b=g0BzomAynERH8NRf177kQkEx4LITG74UKjpKatnSWHfoonfunCCKL8x3LRRssll4d3njYx8pYRBfyQG/Sqlsb+WVX6kSdKlS+blhV82JFOOJU0IxucismC+4ac4i2Y8mOBAxkZxFXPUZc3YDJhOHnuq5nvP/zKYd85Iew99WgnMiXfbqhjGP1Rg0Gg0ICHwDMJALeFUczUC0ts8YdHVkzxxbG/lkhFRvRcXnQ6YQThX/wb0vuOYnLCe1ZTuUpmQ60HkP5CMxOCyDlHuZlnm9aL1gOaDrn529XeQSauBk7NdsrS4gxMHRxf07PQMVKDmACSpM49rjcsTYatcP1F/aEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA1PR11MB6219.namprd11.prod.outlook.com (2603:10b6:208:3e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Sat, 27 May
 2023 01:28:00 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953%4]) with mapi id 15.20.6433.018; Sat, 27 May 2023
 01:28:00 +0000
Message-ID: <0b37018d-2805-bea8-085c-1deede3f102a@intel.com>
Date: Fri, 26 May 2023 18:27:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/6] drm/i915/uc/gsc: extract release and security
 versions from the gsc binary
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-4-daniele.ceraolospurio@intel.com>
 <674e85c47cd29b39ad902e5445234b93b2f99883.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <674e85c47cd29b39ad902e5445234b93b2f99883.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:217::34) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA1PR11MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: d84ae9d5-a5e6-4a27-0dc8-08db5e519b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LUg6bwxzUqOVwcJMjHW2GMuoYz85MsRL5b8huNppiYC2t9gVOZtxUXnqV4Cb98xLM+7Yc7KcJD6SFHgwnfwCe8qnnWeSt314im42LP6Zg1mPxUigQ3IT4CFhMDQAycH4vbccLyFs72v1xZXba4J/R6yZ5iTWvH2UIUmmQkWWAUJ5B6nAGhtbUr1l1NLYOLH1m3AnzlQaOOJ0zqlB0mWx35PTMyu54MAxjWvtrdfzqWHXqcJw0LQRZ3tVXdLiYQmRi46etg8Fnc381QIHHl7FZlgg12SIZD0MjhTmnzSo29bAaolCCgXS3ELNC8iLCO4MMAqcAeZphysNgyOk+q+eUpw4lIUxZc6hvtgTx1DRnf2PIIAtKa85YAL+lO/QBQU55SUbovXKLF0xBWfFtdMaF8svQB8jg7oYmLpDpDJif+p68Qh+bd4lRLoRJlLXoxHRcNEeNXih6IDQ4riiKuxKxpBIzqIklnrb8SXZM6cJc2lt5LHONevDc9gXus8Qwtcdt2sJXxtEyDNQP2y3HdrqAhJfHEzJVYSp4VN+H9v0b3vXrr+f0bAoc7ie2EYNaXqciF1JxTorqQDQT9HmNZLO5Pg0b/QQFLHbaxUdY6eu6zyUKI/5A1t6loGz53HLZbDES3kpoGaTcd/dI6aHCXi6cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(41300700001)(86362001)(2906002)(186003)(66946007)(4326008)(66556008)(2616005)(450100002)(66476007)(36756003)(82960400001)(6506007)(26005)(6512007)(31686004)(31696002)(8936002)(5660300002)(8676002)(38100700002)(6486002)(316002)(6666004)(478600001)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTdjRTFVcHlaZklKYkRiemtrWlFzZFUydW9ObnRDUjluMFJRSUFNb254bWRT?=
 =?utf-8?B?aExiVC9Kak1jL3ViS09zOGxpbURIQWpQaTBzTkJoOUoyVVpPM0ZDdU5OMTEy?=
 =?utf-8?B?Wlc2ZHZ3Y0VFSnNkQzU3a0ZQMk50SVZUYW5EeVNpOHdHaTVTN2xIQk1aeS84?=
 =?utf-8?B?anp4dFJmSnN1N1M4N3dWWWRNWW8xdUg4VFpRT3IvaW93QkxaVzlCQzZuR2hQ?=
 =?utf-8?B?dHo3VmpDZ1hYdVBCOWw4a1cyQ1JJbkZEN0QrRStVR2lLMklpQy9sZnlBcmc1?=
 =?utf-8?B?cmt5bG8wNDlLd1lEMkQxa1h0cU9CYW5YYVIxWTlaUWtNQ2dldWtCM0ZRZnBz?=
 =?utf-8?B?MW1IYzhHNE4vQSszWUhHVU9XdEpUam00Z3lhc1ZTYWpjZlR6VFVKaFczbmlo?=
 =?utf-8?B?U1l0QXFNT2c2VVVBL0dDTWwyejMrakhWNUo4ek8rZXdPdHFKbExHWjNmNmFR?=
 =?utf-8?B?S2QyalFsbklMOC8wVnlHNVdEWUxDK0J0elhKUWVyVHZBbjEvMk1venhIdkp3?=
 =?utf-8?B?Rzg5aTZRQ0tQTk9YVVg1S3NvSkgwZEFrRURETlBhQmVER2kvL1RxeFhiZTdp?=
 =?utf-8?B?OWhDNlpXbW5Db2dyWUVpRVo0R1FjV0Y3ZWJyWEpLcm0wZTg1cmozcDVXalN2?=
 =?utf-8?B?b2M4TEplUEptYitZcVl4S1VMcFd0Zy9Qak5nOUcyZUJZckRmU1hxRHBRb3Vt?=
 =?utf-8?B?V1BiNVZjNUJoVWtMQjRWd3dHNnd4UDlDNFRWK2U4aDRmOXFsSXU5dEcwc2ln?=
 =?utf-8?B?THBKZEp5YmZGc0RBdGM3Unk3T2NCS3hyM24veXNSTVY1RFJsRWZlMFEzRkc2?=
 =?utf-8?B?SnpzbktzT1c1NUU2YlJpMzFTOUxxbWt4V3NTY2hxVWozQVBxZytXVG45VkZj?=
 =?utf-8?B?am9PYlY4bno1WUJvQjFMTVZEYWFNc2UzQmdia1NEaGVTVFAwdTlmYVVtc3Zi?=
 =?utf-8?B?VFdSZEhEMnhZY292OU4ydnlPVTU5OEpLbGZ5NmxVaTJMK1N4bjNjdlo2WGlG?=
 =?utf-8?B?NWlzakF2VWFDRmg1ek9qVTRzTk5NOUlBT280cEdIeXdXbW5yRkNJdUtoVFBv?=
 =?utf-8?B?UmNKelQ3TVVWRmtJdkZZUlJOMHBwVVNCai9Fb08raFZKVkl4cVZ1a0NWaUlR?=
 =?utf-8?B?ckd2UG9oT3QxSVpSMlE0U1JNdUdDanIzTVVSY1doa2dYSmxXTmw0WHk3YVBp?=
 =?utf-8?B?enJXVldYbVFScTVyMm5MZkhwa1J3T0tFcStTY2tNN3ZDamIxbWVIZnY2bHJ6?=
 =?utf-8?B?eGx1V0JGSzZ6SzY3bXI5Mm5ISCsrNll0akIvVnJRSWVBTUVaeUhDU3doSHZ1?=
 =?utf-8?B?eU1lckREOXpPZXhEeTB2ZkhCS0x3NTU2c2VoUmtzcGk0VHpic3d0Q0dSaC9H?=
 =?utf-8?B?eUxGclp4U21Rc1pkVkFMeHA2dU8xMU1UNVdKODYwRjIwZFBYN0xDUE1jeTNu?=
 =?utf-8?B?bG9HQ0pIVDJmQjRRamZuRWN2Y1k3YzQ5ZmxGQitoWUNjU2E3SisycG4zd0ps?=
 =?utf-8?B?enYyK3htVFZOUm5xUU44ek5xVk9lbmYzbmFMQ2lQL1V0aWoxai9SQUs4WG5p?=
 =?utf-8?B?VmJPSjBYY3pPdVJpeFZkK2E1N1ZYNTF0TExsa3VualZ1R1VEU0hZV1ZxQU4z?=
 =?utf-8?B?c2VjUTF1aVlCUWg1TCtwZ1Jna2JVSUtOc1oycjhGamI2Rng0VUdSZkVJWU9B?=
 =?utf-8?B?MXlkSlZkWklqTnhvZnViYzFOWWNkaWQ1OUw0NUhHWk9pZVl6UEtVMkxzMC9T?=
 =?utf-8?B?QzZhNmZLVlRHeG15ZVpxWDdsMVI3QnlYRFBnSms4bXNsSGFwLzF4S0RXNW1z?=
 =?utf-8?B?VlMyWURFc2pzMTlldzRBcEpUOWkwdTVrdEVOdm1TWlRxcWQ4aDR3cVF3OWwx?=
 =?utf-8?B?bmIrdklBalN3TFNPZ29wZkJ0KzNsbzlscGZFZGhLWlRUeXN2SVZmOG94ZWp5?=
 =?utf-8?B?dGFZTlozTjcvTWVIMUd6ekg4R21VTmw1eVpTdnVIMnRTeGR2UVFiTTI0bUF2?=
 =?utf-8?B?VG13R2J5ak5MbnJoTEltbllxbkRyc0NvV0lEVVkvdkJpaElnai8yb1ZpZFBB?=
 =?utf-8?B?ZERvbnRhbmlha1FubE1ZNXB4bUZsK1FTbkVUTVhiSW5lMXlObExYei8wN3lO?=
 =?utf-8?B?MFhvSkg2cUUvRGdhRlJPYXFlWVI5Y0haeE9MaHNubWxZYm1HTXMybkFvLzcv?=
 =?utf-8?Q?ymY1rjiyQ09svigo9dNKW8s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d84ae9d5-a5e6-4a27-0dc8-08db5e519b4d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2023 01:27:59.6856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsUd0rOm+YSylyOqNNxXD3kv9dAoXyCjVMlHniIWvtSMuEvwHVaj0dt6N7X02LscXbFxAsFuA9aQHnIdPVW1Wuk+qbL/buvQGW8MLbX4y+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6219
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<snip>

>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
>> index d55a66202576..8bce2b8aed84 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
> alan:snip
>
>
>
>> +struct intel_gsc_layout_pointers {
>> +	u8 rom_bypass_vector[16];
> alan:snip...
>> +	u32 temp_pages_offset;
>> +	u32 temp_pages_size;
>> +} __packed;
> alan: structure layout seems unnecessarily repetitive... why not ->
> struct partition_info {
> 	u32 offset;
> 	u32 size;
> };
> struct intel_gsc_layout_pointers {
> 	u8 rom_bypass_vector[16];
> 	...
> 	struct partition_info datap;
> 	struct partition_info bootregion[5];
> 	struct partition_info trace;
> }__packed;
>

I've just realized that I didn't reply to this comment. The specs have 
the structure defined that way, so I tried to keep a 1:1 match like we 
usually do. I think switching to a partition_info structure is ok, but 
I'll avoid the array because the GSC partition are 1-based, which could 
cause confusion (i.e. partition boot1 would be bootregion[0]).

Daniele

