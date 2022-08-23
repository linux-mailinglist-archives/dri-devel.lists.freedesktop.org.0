Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F90E59CE8C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 04:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA370A9FCA;
	Tue, 23 Aug 2022 02:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E649D9321F;
 Tue, 23 Aug 2022 02:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661221877; x=1692757877;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4XN8dqd4YawNXX84KmBJD1tl+U1vacAdNS2p7QIzb/8=;
 b=hLGouaj8DLD/n/HPxYPOtPQwc/jRrW3wzrSXApk4Ns0XcjgrbodDWf2C
 53I+LJ/zZL976LyGJ38TG3GxIHrA7DZVcOfHKYshep/L6P6ki5+jYyivc
 FkR0xgcEhUubJfXuQHE/9jMuvLKxCMKycwKfkrUAtrbp5TdNDKLBLw/Nj
 NlYIo//KsWjICoMd+zSpOz+QP0q4A0HjWN1DRpa7ni0Fhl1T16xTxxc6u
 i7h/IDR2eR5gMF10hYZEAFWp2D/M+LUE4BJSRtKdUb5JN3kQpg9kjgTNB
 r3sopY4e3GEy5tZAspL4e6ZxnWaaRgDco7wCRNmsSLdM209xdBv/txHyn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="293570198"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="293570198"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 19:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="559989582"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 22 Aug 2022 19:31:14 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 22 Aug 2022 19:31:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 22 Aug 2022 19:31:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 22 Aug 2022 19:31:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjMbJKBb4UtzM1IRrbrPH0N9g7a9FIDnzBWFgYUgYd8dOdgGEPb36SGryTmIfTdW1rN8hpJFtCanQNlntHgDxB7k58KlfyuZnoF+zlw66fbG7uswB8J4dEyyqflBZFuKFIW6NRQZh9FnkShQi4Jb8w/D0Cl0kVkMW+1PcxrNmKFxdS9RkxubyHNWD0pIFunjjrTEJi6RG9c25vHCUzsykLRzUU+tRqnmsDZlBCO38VgEV0OEmHKfo2TU6R1ZePfApWJY5GCJxGCSQs8xfRfGFQflgjm+T3xrjE4qdCEQbw3badqywYMgo5p5TTICVU5F6ugSARrDHegGQhuW5buBpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVm5lECUkqw4zy13FRMlK8eIXRYwbeygmpinV+qKS1g=;
 b=R2nTP3QGIRNcWZemQpOgs7rUX3wmLrXvVO0BVaw9VpVdZQ50/QbBW65w2AUuSAvuLjTsJBLzUqO7E/QRcWszQ0SH+Ju+1y2EH+hp4Dyq9MyjYyUHZSzQhbGnKUXXnkltQmu6YA/erEwljxdl5rGk8T6sC/fYYfu1JpnGv2ZW7ivgYxUNVb1cEPBoN+I24CK0u/O7JICwhmTksWj340uqou0prpL+56la8pylc3Kl6Mr9zoRqXS9e1ayjalrvpfunJJhzhEtcFkDwj/nWQuhreqNFugWVzb6Tr/JyfkLBqZfdJPhvsrzZV4emKjbGRSLX7wowedgdXv6RZMbc5BjgQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by SN6PR11MB2944.namprd11.prod.outlook.com (2603:10b6:805:cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 02:31:09 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::70e4:76ca:fc65:df73]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::70e4:76ca:fc65:df73%3]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 02:31:09 +0000
Message-ID: <9c9d4c86-d77c-adc0-5dc0-d1821a6a3723@intel.com>
Date: Tue, 23 Aug 2022 11:30:54 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 1/8] overflow: Move and add few utility macros into
 overflow
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20220816093525.184940-1-gwan-gyeong.mun@intel.com>
 <20220816093525.184940-2-gwan-gyeong.mun@intel.com>
 <Yv10sQADwdZrIV42@alfio.lan> <202208171657.63AE7AC@keescook>
 <f3370fb1-5318-c662-294b-2c7fe693efd6@intel.com>
 <52c09fde-f788-4c2b-efdc-d1783dbc0f6c@intel.com>
 <202208221301.366A33DACA@keescook>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <202208221301.366A33DACA@keescook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::8) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e503878-d83c-4f7e-363d-08da84af89bb
X-MS-TrafficTypeDiagnostic: SN6PR11MB2944:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iYGSXtbsIepsOOSIdduUk7G/k1q6ruKKggJcvxswYIwL2piVog8BMkjsfI52EWKxwuvZmEDoXiWpOePIHts60T+uXlPP3lYa+PjZowwFVsKzOQPCgBr5lc9vTqbrdo7K7sl9IxS0WM6+85NDuLZ1Jy/7+frzQlZPiDX6cDYjPDxdOHJPT6PrdWcW31gsDUkSBkGKRg5YKrYDbb4R6+JFoKy1mM5rFxdoST0t4/Uhk+lLrybenMGkL9A2O0tbvDn3XPvXici5MILX4aLC9ccJ0VE09IbBlDAwGSCmUwAILcueTSYxld5rRZjtqH+Pydt6StLkMYuvMI+RFUR5RUvu4Cu42RmUJMIhu5nT5gCXVqcuHeAWA19Ewh3RErWKz3Hd+0u30cBuZEj4S9foGw52UypWsZuE4hOae7PE61lbMIpEVjp28kNXbvcBH9Ifr9NpDJtpYgu1vGocICKrKtXXBuAtI3Yht9mY4ZGw1/KFL6x3hC119Bk8wuRKYhA/WzrciaXwMylWPu/z+9DlgHLvpV+H2w16uUjLFxg8QGEXr0oC8pOGIBFcR/uggPF7S92Oxi1zf4TaMeNG1IYXi12CTpeQo2S7lix4H1oeXCNUA0n6tLb6yMdi0qPbQYh+tkvIt8j4++dqIiEgqVB8Ho29l1l8Z7QhuzmNXxlGECgSS4i1Qrehgc93KJJlKGfKxtjgZHQKwRt7ACcGdLnwnOeGbx4ixZwdvvjvG+ywNggGUDaL3KWTNuO0F3WUrXycOjH/ZFM4eE929kKADFNZjV/l3JuSsdn3UkpkgrcSOCwS4VU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(366004)(396003)(346002)(39860400002)(36756003)(8936002)(7416002)(66946007)(316002)(2906002)(8676002)(66556008)(66476007)(6916009)(54906003)(31686004)(53546011)(6666004)(26005)(5660300002)(41300700001)(6512007)(6486002)(4326008)(478600001)(2616005)(82960400001)(6506007)(186003)(38100700002)(86362001)(83380400001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MitOSGpTaUVZSHpJSU5uN293SzJvUjJWQ0hLT05zN205Z2lWZjRhUnZCWndK?=
 =?utf-8?B?cGJBaGR6S21wdXFDem91US9DWk9oa3cyMnR0ZEsyRWpMTTA2QytmYS96dS93?=
 =?utf-8?B?YlNDRkFlYldFVlB5dlMyZ0xEbTJJZXhKeTIxS25EUmxud0cvcDl3VTRHczh0?=
 =?utf-8?B?L2ZUcCtsMXZhdlhLZWJOZW9CSS8weDJkTlMzWWxXdXpyWG5zQkNoclVSUWVx?=
 =?utf-8?B?OWlaKzNxeFlWS0h1VWJoZzY5b3hxWCt0MmJIOTJOdHBTZjNOczlKM0RzVHd2?=
 =?utf-8?B?VDBycGJEb2ZUTmZGNUVXODlIa01SN1BkTjdTUVBJMVV3RElCWktzTDQwbDNL?=
 =?utf-8?B?WGdZRWQ5M2o4YUJjWkRjSzhKOUN6ZTFIeW9SalVaUDEzbkhTa2NBVnpvcVpp?=
 =?utf-8?B?N1d5QnZEc1R6WGxldVk0djB1b0FPVDFnWDl3K2JwdWZWRkM0VitjN2QwZEdF?=
 =?utf-8?B?byttaUVtQURPRzJ3VWVlbTlzMms1enNNZnJKdCs2cUMwOUZzaHZBWFFUVm1I?=
 =?utf-8?B?STU5ckI1ZjdHdG85RlpNTy8wdmhGYzlLcnhLSm44UGRuQk92U0pPT2Vjbzh5?=
 =?utf-8?B?SC8wejk5NHVXMUlMclFPRTlrREVpd2U0L3pqR1Q3MkU4b0hkdEQ4WW96eWlu?=
 =?utf-8?B?c01DNWRLbnFRYjIzbEl6R3ZBcngxbFZWY214OTRWZHJnRktlODNxekgwdEZV?=
 =?utf-8?B?TWNIejdQRkROUVcwb2U0VXRySjhnTWoybitrUWNaS1RIZnBrMThBaHRtRC8z?=
 =?utf-8?B?cFdER3Q5NGVTSzNqV3ZWdEMrMC9YdkkvTGxXeExUTmgwOTE4VTJIRjhxVzRN?=
 =?utf-8?B?dmV2eXEyaXI5MmVxTkFoZ1BDSTE1QmVGcVVMOHNralpDUEQ0MEZ3RFFPMmxS?=
 =?utf-8?B?Z0VXYkl6M2tHeUxTOWQxZDNOOS9XVFI2MVJ3MGl6ZDN0a3VkZWtNRzdJb0ht?=
 =?utf-8?B?dU5NejUvU1BMYWlpMFd5OHhWbnFDQ01ETUJNZWlVdXNIeThUaDFWaDk3NjQv?=
 =?utf-8?B?MDNOTEhiN2pEZzR6UFlVSzhDR2VjUFVWWG5jNzNLdVRCM2hhckVMRENKTjd1?=
 =?utf-8?B?NzZkMHpsWnkzZjBxQUQ1TEFvenVKdnhPTTlYNXh6NmthdDI2R3pyRkpaSzZD?=
 =?utf-8?B?ZTBzY2ZtOTRwZHpHbkM2SFI4QjY2ZThrYjhKOFhmbGxpRTZaejNVUEFpeUpE?=
 =?utf-8?B?Q3pmMmErczY5N0NYR0NnLytxY2hONUcvSVcvbkZVSXNRdlNianJlVVRtOW52?=
 =?utf-8?B?blkvZ25YN3BaZFlRZTRWbUtuSW5rUjZXdWJOMHRLOVplTHVmQVhDQ3d1Nks4?=
 =?utf-8?B?ckV1NmVRWktTdVVkdkZjQm1pTlNWd0V2YmNBUm9SdXVCd1JRNjBmSlVWSVN4?=
 =?utf-8?B?SlBBM3ZCUG03MTU0V2NoVnJzTk8wQmhIWFpzTXAxUjlhR3RBVWVrWmpNZnNC?=
 =?utf-8?B?cWE3ZVJLL2pjTFNJWEkwZ2tmZHh5bi9FSzBTVVRZbWJ3TWpHSkV1blZiL1dI?=
 =?utf-8?B?b3dSSytqS3UyQjY4dXc5LzRCTmRFTXlBMmtIQzdBcVpYRXg0T3lsOFFYMndB?=
 =?utf-8?B?VGNITWprRUlHUGlSbGNObFEvaWxDek1UYkNKUVlmYXJnb1d1bEs2UjVyb3hs?=
 =?utf-8?B?TlBXNm15RE45OHltdG5ZSmRDVElYTkplVTFESjFUazNkZ3c4YmRockdBTWFD?=
 =?utf-8?B?SUZuV1p3c3NLZFhsenc3S05ndlAzRFJTWDRiRUtrZjR2T1cxdWVJTGViUGlM?=
 =?utf-8?B?TDZXQzMxS1FKVnZYWU8raEpNUFZMb25ySzZoQ0VUYUJDN0dMUlQ4aEFOc3o5?=
 =?utf-8?B?R21HeU5sMENBR3VRTzkzSWVEOEt3a1gwOHM2cU8xb25xRjgwUU1BYWQ3VUlo?=
 =?utf-8?B?WkJWOTZXTUowVWtyWGRDZjRKVndhTmRaZ1R6VFRFcUVjSHRpWmtnMm91TkZj?=
 =?utf-8?B?V2lvQlh5Ukl1UVBLTDJ2bWhsNnJETGlFN2ljaGFXRzdUQzZmTlQyWXlPRWg2?=
 =?utf-8?B?c2k5SndMQVA1Q1lHZmxQMkppeHdkcGJxb3pMOXNJdUw2ZTVSOWk1cWowV0l3?=
 =?utf-8?B?OERIdXcrZFZTZ3NjLzkrS3NVa21tb0ZkaWRobmU0SlNvREkvbi9RUGp0L3F1?=
 =?utf-8?B?bzNzYmhTUHdDb0F1WUdMYzRVSWkwR3prNkR2YjBQdWNLTlFDQ1ZGU2liYmJH?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e503878-d83c-4f7e-363d-08da84af89bb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 02:31:09.4674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpW48n6Qva8vdys66lB9iS6A6pU7Tt1R4+TKUWvgEHsKHebr3r0mWxigappW3WyMiFUsfGanGYIGzryVXFtSWiEGPMLQRPHxy7HruNNElmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2944
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
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 nirmoy.das@intel.com, linux-hardening@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, mchehab@kernel.org,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/23/22 5:12 AM, Kees Cook wrote:
> On Tue, Aug 23, 2022 at 04:32:10AM +0900, Gwan-gyeong Mun wrote:
>> On 8/22/22 11:05 PM, Andrzej Hajda wrote:
>>> On 18.08.2022 02:12, Kees Cook wrote:
>>>> On Thu, Aug 18, 2022 at 01:07:29AM +0200, Andi Shyti wrote:
>>>>> [...]
>>>>>> +#define safe_conversion(ptr, value) ({ \
>>>>>> +    typeof(value) __v = (value); \
>>>>>> +    typeof(ptr) __ptr = (ptr); \
>>>>>> +    overflows_type(__v, *__ptr) ? 0 : ((*__ptr =
>>>>>> (typeof(*__ptr))__v), 1); \
>>>>>> +})
>>>>
>>>> I try to avoid "safe" as an adjective for interface names, since it
>>>> doesn't really answer "safe from what?" This looks more like "assign, but
>>>> zero when out of bounds". And it can be built from existing macros here:
>>>>
>>>>      if (check_add_overflow(0, value, ptr))
>>>>          *ptr = 0;
>>>>
>>>> I actually want to push back on this a bit, because there can still be
>>>> logic bugs built around this kind of primitive. Shouldn't out-of-bounds
>>>> assignments be seen as a direct failure? I would think this would be
>>>> sufficient:
>>>>
>>>> #define check_assign(value, ptr)    check_add_overflow(0, value, ptr)
>>>>
>>>> And callers would do:
>>>>
>>>>      if (check_assign(value, &var))
>>>>          return -EINVAL;
>>>>
>> Yes, I also like check_assign() you suggested more than safe_conversion.
>> As shown below, it would be more readable to return true when assign
>> succeeds and false when it fails. What do you think?
> 
> No, this inverts the style of all the other check_*() functions, so it
> should remain "non-zero is failure".
> 
Hi Kees,
Yes, I will not invert this part as you commented.
>> /**
>>   * check_assign - perform a type conversion (cast) of an source value into
>>   * a new variable, checking that the destination is large enough to hold the
>>   * source value.
>>   *
>>   * @value: Source value
>>   * @ptr: Destination pointer address, If the pointer type is not used, a
>> warning message is output during build.
>>   *
>>   * Returns:
>>   * If the value would overflow the destination, it returns false. If not
>> return true.
>>   */
>> #define check_assign(value, ptr) __must_check_overflow(({	\
>> 	typecheck_pointer(ptr); 		\
>> 	!__builtin_add_overflow(0, value, ptr);	\
>> }))
> 
> Please don't use the __builtin*s, instead stick to the check_* family,
> as they correctly wrap the builtins and perform type checking, etc. As
> mentioned, check_assign() should just be:
> 
> #define check_assign(value, ptr)    check_add_overflow(0, value, ptr)
> 
> I don't think any of the other code is needed? What's the use-case for
> the other stuff? i.e. Why does anything need overflows_type()?
> 
And, the reason for using the __builtin_add_overflow() built-in function 
directly instead of using the check_add_overflow() function is ,

#define check_add_overflow(a, b, d) __must_check_overflow(({	\
	typeof(a) __a = (a);			\
	typeof(b) __b = (b);			\
	typeof(d) __d = (d);			\
	(void) (&__a == &__b);			\
	(void) (&__a == __d);			\
	__builtin_add_overflow(__a, __b, __d);	\
}))

In this part of the implementation of check_add_overflow()
	(void) (&__a == &__b);
	(void) (&__a == __d);


When comparing the pointer types of a, b, and d, if the pointer types of 
source and ptr in check_assign() are different, a warning may occur when 
building, I used the __builtin_add_overflow() built-in function directly.

Br,

G.G.
> -Kees
> 
