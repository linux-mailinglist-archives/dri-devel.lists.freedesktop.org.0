Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1E359C8EC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 21:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60F3A10D5;
	Mon, 22 Aug 2022 19:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FCAA0E1C;
 Mon, 22 Aug 2022 19:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661196751; x=1692732751;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QxnylhvyvHzY9aT5d9ozq5b1cD/yLiIs3nsBx/d5tDc=;
 b=oAGFfh30pd7+knjYzTNq5OyOOgy7PbpKuZU+IFwjbqHcvFW6jCoJ9n/Z
 2+WM60cHRGHrQparA89d711pDiRPFaSALYgGMTA0BaTB6CiJZAg3xokUr
 aUDgQP5hSGXO8JHEhppuptbHFDlunOKQ7qXj94rcPp1600LPGk0qX7K7F
 B93y667mkQLrUZMP3+NQikSQiQd1ZOfrFO3R7pMgT0qltBx5+feMOuT1T
 VWB8OJ7tRmaogXl9yb6lDT5lKU+jGnPhHt6hoNqHObz7IRVdsGqivtMNi
 02IvuL3RdmBihapyNjFin7xgRvCE2ceUERCc+rKaTOujAy5cEDilASXRH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273257930"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="273257930"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 12:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="735216887"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 22 Aug 2022 12:32:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 22 Aug 2022 12:32:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 22 Aug 2022 12:32:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 22 Aug 2022 12:32:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 22 Aug 2022 12:32:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpY1az4R+krkVi5ybAt/JXSKuD+JaDTxwoCbGXJpbw/FLib671H4tEFOr72UfxnvGbdsreh1SJlqZsDZpZ9F+gFikbruNyNxQ4oFuSxfNpcXQyGPXztbh7qwSB404QPuPPDU678JSpG9gnI/LYIVT7aPZ8mx0CP4n62wsF+Bk7X4s0eWpZS4CrmUgccA+Sg4+CQH9LVTdPHzzBIidX/pXxSyfqvw+mTcsTpKPhMxVnFm9Gk9dxwDhsGrmog+zYIzszCnmw9b5mgC4mC/+avYG6TaL2KnlQEGmIzu+p3QKV08TVqzNTemUmV3wXq4w8NKV0LVjZUUXxiqcUHhJ6dGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWX0BYOsiUgxu3mB1srLdQLDEmYh24Q3VDp8ynT4Zmo=;
 b=FSsPIUZ+z4BIz4NzaCXk9I9nBCLDInBUYJp8Ief+086aXWmw/VzgcSASZUMCGAKYgNP9FCklRfQ/Y+aYJIstABChA2vTHacYe9xDwYS6ryU54fIII1ptOwJZ3yeOfztcDyYzctuDAu+veNl0EcueR56avBe92AF3WyaQNsnzukgj1PSn34o38GZRx1XYvjJcoTRMTlJAVTlA1o75PUlkFKWETrfGe7Gh45r2kSBwQR8L9ic8SBcBsKuOa10DtAcfd1yIklS3YrIBY4k2ydysRiTwvAM16CIFWhw7eYXEOirrk2KeAPLs65neF+486SDQ6MPC+FBpDMZy49xQ0jgVow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by BYAPR11MB3221.namprd11.prod.outlook.com (2603:10b6:a03:1c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 19:32:26 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::70e4:76ca:fc65:df73]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::70e4:76ca:fc65:df73%3]) with mapi id 15.20.5546.023; Mon, 22 Aug 2022
 19:32:26 +0000
Message-ID: <52c09fde-f788-4c2b-efdc-d1783dbc0f6c@intel.com>
Date: Tue, 23 Aug 2022 04:32:10 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 1/8] overflow: Move and add few utility macros into
 overflow
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, Kees Cook
 <keescook@chromium.org>, Andi Shyti <andi.shyti@linux.intel.com>
References: <20220816093525.184940-1-gwan-gyeong.mun@intel.com>
 <20220816093525.184940-2-gwan-gyeong.mun@intel.com>
 <Yv10sQADwdZrIV42@alfio.lan> <202208171657.63AE7AC@keescook>
 <f3370fb1-5318-c662-294b-2c7fe693efd6@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <f3370fb1-5318-c662-294b-2c7fe693efd6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::28) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65ffbcbf-3c93-4d66-a6ba-08da84750b0e
X-MS-TrafficTypeDiagnostic: BYAPR11MB3221:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zWGmtpq2DKeUJ21apxFrmtWesvx2nv5TkiZTtkq4hWbsuzhI/78XzlbSB3W8wnN19xSUFixa9Ahxcs/pGm2N/COdQqt0oR2PZp7vmgj3btPM//owyMCMDwtGVv1mmiGLO7+M+RBZxBgpouJoK1TNtoRxVS0zWHcp99vKELBV8TUQA1H1BTi9bLbi1SKKUOCLpXupT/OzEaEzcVd9TFYXzzIWe65DRdnZPNEBwwNZ0sgsYnIelb5Gv0PqpxyFaNU61ejTKafzcs7ddbjiz8sx7YP77HjCBeu7Lb1oMSo2YbgyieCTMGeZInWArgoYSRJa3dctW2tqtIAqOmz7W5pNvVyZTmXEL3trN8LvLEaE7BhTH58yJPnoN2m60h3qcKZSQXMtV52W1UyH5TowHPdmMRGI2KZrP1IHeU3IIDQOt80srkmsGnnl7qlKVMFDJuKZ0rYqlM0bH1iVmTc6iMahWtM61jXlQTypVVicYB+QU6w8Ja8WnRY+ty3HdEvFdzhJP0AtjnhOHsWu+aheknSH+sfXFN7DV5Adm8LP2aVtWkAi9kywKGA5w6mRy5KVuXojRdfDayLh0Z7i15NP9ONL5p+fD/Urgyl826va1HQlynabER0IhY24m65VlQPo55v1roH8TtP70YR5Fsf4u/jiz90PHGMdYpWOC26p7openeS0J4pUOEHCTsEaD2ClTnwP5BzTEhyHPVd8f5m3SyHnP5hM0xPIXGdMVD4I1EX/aPyV4nhrzC43LB4brz1y80WuTESXcPi+aFIKjGw0HESF8bN7cgTiO2F+7teYZdvfLOlRJj3IpmK/YH0KoPrMoDGX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(346002)(396003)(39860400002)(136003)(8676002)(66556008)(66476007)(966005)(7416002)(6486002)(5660300002)(316002)(66946007)(41300700001)(38100700002)(31686004)(8936002)(4326008)(36756003)(6666004)(110136005)(478600001)(2616005)(53546011)(6512007)(26005)(6506007)(2906002)(186003)(83380400001)(66574015)(86362001)(82960400001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDNsT3BBeS8ydjltL25veW95UjJwSDVUTnNvdmhKb05uV0RJbFJXZ3pBdXFM?=
 =?utf-8?B?Y3gvQ1VEOWp4VCtUR3ErR1pnaFhvRnJDaEY0NGJDb1krTGJGOWZWWnE1YkFz?=
 =?utf-8?B?Mkl3YkZlUjZwU1NWaTJqQS85MXNIbGpKUWpXSGkxK2NkblRiQ2xxLzdmdWxJ?=
 =?utf-8?B?N2x0ZThZOERheXpWZnhwLzJRdWVITkwrTmIxcDhHdG9UTUo4M093c1ZIdXBm?=
 =?utf-8?B?OXNVUHRhcnVrQ2w1ekxSWW54OGQ5dElRK1lSbE1rRXlaZEFKMjB1bDJkSUQ5?=
 =?utf-8?B?UHZaWXRWbXNVOTRUMTRFZ0RPVmZXTmloWGhISWVXQU9lV1NpdGtPZjhvRFBU?=
 =?utf-8?B?UXZ3YXNwWDBiUk9LSlpQRTkzc0xOeG9JVWdBUWRhbzNMekxiZWh0bU9nVWpj?=
 =?utf-8?B?RUh6VHU4L0R4OHlCS0ZzZk9RY2pFSDZNN2loL0xLaUM4WitOOXBuSXNlOGxv?=
 =?utf-8?B?M1FFQ1RwTWlNZlRvZTlmQVBGczB4OXBLTWRqa3NQcU5ySHlVdXhEaWlHU0xC?=
 =?utf-8?B?a1I1RVBUaGpMZFBmNDZsYUM1MFo0cFVIRUQyNVN2OGZNUDhJalp0MWxyZzVi?=
 =?utf-8?B?RU91THVLQWZqNTA3azd1Nk1IVWF3TDVLRmMwYWREUGVEMkVCeWhqRnZDeksw?=
 =?utf-8?B?TlhMRnBRK1VyVzU1SjB2R1grNTlaL25vUEhkMHlDR0J3dEU5WUF3Ymp6SFhD?=
 =?utf-8?B?dEJ6bHNZNHh2UUVZL3lFbjhOandOZGZUV05rbzlwcU55UUJJWFB5SU4veGxJ?=
 =?utf-8?B?NVEzWlR4REhkcWRlMW40TFR1L1c2OUhkNEpLalQ0eVp4cEdJOS9sN0Y0MENh?=
 =?utf-8?B?cnJvYktmc1QzcjkvRnhRdklBeE5BTGc5cklUSmxJNnBSMytESzJCOFBJYUdD?=
 =?utf-8?B?Q2lxbE1hVlEvRmhsL2h0TC9WUFFrM0ltS2V1UkVET2R4T01zTW94eDhrVVoz?=
 =?utf-8?B?bjQxclhrWWkrM005amUwbExQc1dLVmtrR3BPSTk4NzlVRkh5ZjR6d1dnVmNE?=
 =?utf-8?B?Z2JySlNjWkh6Mkx2MmkrL2ZacERyR05sQjVLdXFqUE5YbDFydTRhOWlrelZS?=
 =?utf-8?B?bENpajRodFVVYkFVZnp0a01mYi94STV4RVB5YmJ3NFp4aVYwbDRqRnZJYXpO?=
 =?utf-8?B?QUhZSUZ6Z2tuN2FZWXZzQm02blpsUUxjWmp2c0xZWUhhNVhjK0t4ak80M0I1?=
 =?utf-8?B?ZTJTWUtmQnowUys5YzgraW0xVnZiL1VtU1lUZVJmOUJWR0k3d0hwYm1wUktx?=
 =?utf-8?B?dnVvanhsK3IzY0dvYkNPRDJGRThwS3JNWnpsU0xyaTFZZEdJNldPaGNyL0Q1?=
 =?utf-8?B?UXNPUGFIVmpqcThUU0RnazlRNzZmQ044ZUxWS3pYRnZsc1h1NzVsK0JETndF?=
 =?utf-8?B?eUdsQzVqU1JnZmJFR2lwVURqbFZQemsrOTdjdTJ2R0twa1B3bU1IY1ErT2tF?=
 =?utf-8?B?dTZmdE4yRC84dGZWQmN2NHo3Rmc4QXprbjB6TDRGcFJPdWRINHluTTEveWJx?=
 =?utf-8?B?U0Q1d3NzQitZMW16T2x5b3djZlVwakRwYlBibHJNUHRxcVA0VlptUHlXczFG?=
 =?utf-8?B?bklycHVrZ09zVFNKKzV4dlFuYThVd1FPbzMzUU9pek1QVUhFNUVHbGZmc1dV?=
 =?utf-8?B?MHEvek8yUEJybFhjNnkyRFJUdStJYjFOTUpMYWdwNmErM2plRm9pakF2Z1Zk?=
 =?utf-8?B?Z1RLMjkraFl5RVNvbUFmeGE2WVpnMDNEVnY3RmxpWlovckdHTTF6U2xDUUc5?=
 =?utf-8?B?ZEovQlhhdHJ3UXJhekJ6czROSVZ5RXo0ZnBsVTRwMm1qd2dYRDJoYUpKTkZ2?=
 =?utf-8?B?U2xWRGJrWmVSWkFvbXRSYTZtVGZXRlhWT05ucGlNZkx2eVVDYlRWU1hJam44?=
 =?utf-8?B?Y0VES0VCaUk3ZDJQUGkxRjlzWk5BMTlQUStlZEoyaEJHY056b0lDNWw0WEx4?=
 =?utf-8?B?MndTdG5tSnVIajRWTmhMbzZobTVidk85cmxyaWhhQkRTb2pnWE9Za1QwazhM?=
 =?utf-8?B?OG1kL2MxNEJkckxNZjRvbG10WktsTUIvanNscEdmVlZqM3piQlMxY1ZxdlBY?=
 =?utf-8?B?SW5ZNzNwcEVTMHlnVGZJQ3Q4eVg1dlZ0cjR4eVUyNWdlakppcjB6aktlbGRJ?=
 =?utf-8?B?bko1K1ozdTkrcm10NFdJa0NQK3lCbjZlQW5tVElqU3dyamQyR0FWL1ROSWs2?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ffbcbf-3c93-4d66-a6ba-08da84750b0e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 19:32:26.1516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGvCclKUppSFzTqd8iS4P4CtlvGwn0sRnim5EMKB9LB1cR9uWTxbWvVAFWIEDK0GjG1O7RKxloRnFZGVMPXkW9XoZTwrouFUOV3kG+RmEHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3221
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
Cc: thomas.hellstrom@linux.intel.com,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 nirmoy.das@intel.com, linux-hardening@vger.kernel.org, mchehab@kernel.org,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/22/22 11:05 PM, Andrzej Hajda wrote:
> On 18.08.2022 02:12, Kees Cook wrote:
>> On Thu, Aug 18, 2022 at 01:07:29AM +0200, Andi Shyti wrote:
>>> Hi Kees,
>>>
>>> would you mind taking a look at this patch?
>>
>> Hi! Thanks for the heads-up!
>>
>>>
>>> Thanks,
>>> Andi
>>>
>>> On Tue, Aug 16, 2022 at 06:35:18PM +0900, Gwan-gyeong Mun wrote:
>>>> It moves overflows_type utility macro into overflow header from 
>>>> i915_utils
>>>> header. The overflows_type can be used to catch the truncation 
>>>> between data
>>>> types. And it adds safe_conversion() macro which performs a type 
>>>> conversion
>>>> (cast) of an source value into a new variable, checking that the
>>>> destination is large enough to hold the source value. And the 
>>>> functionality
>>>> of overflows_type has been improved to handle the signbit.
>>>> The is_unsigned_type macro has been added to check the sign bit of the
>>>> built-in type.
>>>>
>>>> v3: Add is_type_unsigned() macro (Mauro)
>>>>      Modify overflows_type() macro to consider signed data types 
>>>> (Mauro)
>>>>      Fix the problem that safe_conversion() macro always returns true
>>>> v4: Fix kernel-doc markups
>>>> v6: Move macro addition location so that it can be used by other 
>>>> than drm
>>>>      subsystem (Jani, Mauro, Andi)
>>>>      Change is_type_unsigned to is_unsigned_type to have the same 
>>>> name form
>>>>      as is_signed_type macro
>>>>
>>>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v5)
>>>> ---
>>>>   drivers/gpu/drm/i915/i915_utils.h |  5 +--
>>>>   include/linux/overflow.h          | 54 
>>>> +++++++++++++++++++++++++++++++
>>>>   2 files changed, 55 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_utils.h 
>>>> b/drivers/gpu/drm/i915/i915_utils.h
>>>> index c10d68cdc3ca..eb0ded23fa9c 100644
>>>> --- a/drivers/gpu/drm/i915/i915_utils.h
>>>> +++ b/drivers/gpu/drm/i915/i915_utils.h
>>>> @@ -32,6 +32,7 @@
>>>>   #include <linux/types.h>
>>>>   #include <linux/workqueue.h>
>>>>   #include <linux/sched/clock.h>
>>>> +#include <linux/overflow.h>
>>>>   #ifdef CONFIG_X86
>>>>   #include <asm/hypervisor.h>
>>>> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>>>>   #define range_overflows_end_t(type, start, size, max) \
>>>>       range_overflows_end((type)(start), (type)(size), (type)(max))
>>>> -/* Note we don't consider signbits :| */
>>>> -#define overflows_type(x, T) \
>>>> -    (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
>>>> -
>>>>   #define ptr_mask_bits(ptr, n) ({                    \
>>>>       unsigned long __v = (unsigned long)(ptr);            \
>>>>       (typeof(ptr))(__v & -BIT(n));                    \
>>>> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
>>>> index f1221d11f8e5..462a03454377 100644
>>>> --- a/include/linux/overflow.h
>>>> +++ b/include/linux/overflow.h
>>>> @@ -35,6 +35,60 @@
>>>>   #define type_max(T) ((T)((__type_half_max(T) - 1) + 
>>>> __type_half_max(T)))
>>>>   #define type_min(T) ((T)((T)-type_max(T)-(T)1))
>>>> +/**
>>>> + * is_unsigned_type - helper for checking data type which is an 
>>>> unsigned data
>>>> + * type or not
>>>> + * @x: The data type to check
>>>> + *
>>>> + * Returns:
>>>> + * True if the data type is an unsigned data type, false otherwise.
>>>> + */
>>>> +#define is_unsigned_type(x) ((typeof(x))-1 >= (typeof(x))0)
>>
>> I'd rather not have separate logic for this. Instead, I'd like it to be:
>>
>> #define is_unsigned_type(x) (!is_signed_type(x))
>>
>>>> +
>>>> +/**
>>>> + * overflows_type - helper for checking the truncation between data 
>>>> types
>>>> + * @x: Source for overflow type comparison
>>>> + * @T: Destination for overflow type comparison
>>>> + *
>>>> + * It compares the values and size of each data type between the 
>>>> first and
>>>> + * second argument to check whether truncation can occur when 
>>>> assigning the
>>>> + * first argument to the variable of the second argument.
>>>> + * Source and Destination can be used with or without sign bit.
>>>> + * Composite data structures such as union and structure are not 
>>>> considered.
>>>> + * Enum data types are not considered.
>>>> + * Floating point data types are not considered.
>>>> + *
>>>> + * Returns:
>>>> + * True if truncation can occur, false otherwise.
>>>> + */
>>>> +#define overflows_type(x, T) \
>>>> +    (is_unsigned_type(x) ? \
>>>> +        is_unsigned_type(T) ? \
>>>> +            (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 
>>>> : 0 \
>>>> +            : (sizeof(x) >= sizeof(T) && (x) >> (BITS_PER_TYPE(T) - 
>>>> 1)) ? 1 : 0 \
>>>> +    : is_unsigned_type(T) ? \
>>>> +        ((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> 
>>>> BITS_PER_TYPE(T)) ? 1 : 0 \
>>>> +        : (sizeof(x) > sizeof(T)) ? \
>>>> +            ((x) < 0) ? (((x) * -1) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>>>> +                : ((x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>>>> +            : 0)
>>
>> Like the other, I'd much rather this was rephrased in terms of the
>> existing macros (e.g. type_min()/type_max().)
> 
> 
Thanks for all of your comments.

The version that implements overflows_type() using type_min() and 
type_max() includes modifications to the following macros.
In implementations of is_signed_type(), __type_half_max(), type_max(), 
type_min(), where types are used as variables, the addition of typeof() 
is necessary.
And the operation was confirmed through previously shared test cases.
https://patchwork.freedesktop.org/patch/492374/?series=104704&rev=3

#define is_signed_type(x)	(((typeof(x))(-1)) < (typeof(x))1)
#define is_unsigned_type(x)	(!is_signed_type(x))
#define __type_half_max(x) (((typeof(x))1) << (BITS_PER_TYPE(x) - 1 - 
is_signed_type(x)))
#define type_max(x) ((typeof(x))((__type_half_max(x) - 1) + 
__type_half_max(x)))
#define type_min(x) ((typeof(x))((typeof(x))-type_max(x)-(typeof(x))1))


#define overflows_type(x, T)	__must_check_overflow(	\
	is_unsigned_type(x) ?				\
		x > type_max(T) ? 1 : 0 		\
	: is_unsigned_type(T) ?				\
		x < 0 || x > type_max(T) ? 1 : 0	\
		: x < type_min(T) || x > type_max(T) ? 1 : 0 )


> I am not sure how it could be rephrased with type_(min|max), but I guess 
> the shortest could be sth like:
> 
> #define overflows_type(x, T) __builtin_add_overflow_p(x, (typeof(T))0, 
> (typeof(T))0)
> 
And it was confirmed that the method using the gcc built-in functions 
suggested by Andrzej works the same in all cases where it is used.

#define overflows_type(x, T) __must_check_overflow(({	\
	typeof(T) r = 0;				\
	__builtin_add_overflow_p((x), r, r);		\
}))

And if you refer to this link 
(https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html), it 
is explained like this.
   The compiler will attempt to use hardware instructions to implement 
these built-in functions where possible, like conditional jump on 
overflow after addition, conditional jump on carry etc.

Andrzej's suggested way seems better to me. What do you think? Kees 
Cook, can I ask for your feedback?

Additionally, unlike the first implemented method (v7's overflows_type() 
macro), the macros tested above generate errors at build time for 
pointer types.
__type_half_max() throws error "error: invalid operands to binary <<"
  or
For __builtin_add_overflow_p() I get the error 
"__builtin_add_overflow_p' does not have integral type".

So, overflow check for pointer type was confirmed by adding the 
following macro.

#define overflows_ptr(x, T) __must_check_overflow(({	\
	typecheck_pointer(T);				\
	((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 
: 0; \
}))

> Regards
> Andrzej
> 
> 
>>
>>>> +
>>>> +/**
>>>> + * safe_conversion - perform a type conversion (cast) of an source 
>>>> value into
>>>> + * a new variable, checking that the destination is large enough to 
>>>> hold the
>>>> + * source value.
>>>> + * @ptr: Destination pointer address
>>>> + * @value: Source value
>>>> + *
>>>> + * Returns:
>>>> + * If the value would overflow the destination, it returns false.
>>>> + */
>>>> +#define safe_conversion(ptr, value) ({ \
>>>> +    typeof(value) __v = (value); \
>>>> +    typeof(ptr) __ptr = (ptr); \
>>>> +    overflows_type(__v, *__ptr) ? 0 : ((*__ptr = 
>>>> (typeof(*__ptr))__v), 1); \
>>>> +})
>>
>> I try to avoid "safe" as an adjective for interface names, since it
>> doesn't really answer "safe from what?" This looks more like "assign, but
>> zero when out of bounds". And it can be built from existing macros here:
>>
>>     if (check_add_overflow(0, value, ptr))
>>         *ptr = 0;
>>
>> I actually want to push back on this a bit, because there can still be
>> logic bugs built around this kind of primitive. Shouldn't out-of-bounds
>> assignments be seen as a direct failure? I would think this would be
>> sufficient:
>>
>> #define check_assign(value, ptr)    check_add_overflow(0, value, ptr)
>>
>> And callers would do:
>>
>>     if (check_assign(value, &var))
>>         return -EINVAL;
>>
Yes, I also like check_assign() you suggested more than safe_conversion.
As shown below, it would be more readable to return true when assign 
succeeds and false when it fails. What do you think?
/**
  * check_assign - perform a type conversion (cast) of an source value into
  * a new variable, checking that the destination is large enough to 
hold the
  * source value.
  *
  * @value: Source value
  * @ptr: Destination pointer address, If the pointer type is not used, 
a warning message is output during build.
  *
  * Returns:
  * If the value would overflow the destination, it returns false. If 
not return true.
  */
#define check_assign(value, ptr) __must_check_overflow(({	\
	typecheck_pointer(ptr); 		\
	!__builtin_add_overflow(0, value, ptr);	\
}))

Br,
G.G.
>> etc.
>>
>>
> 
