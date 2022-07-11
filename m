Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675235702DC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 14:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B115D8DFAC;
	Mon, 11 Jul 2022 12:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC118DFAC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 12:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657543271; x=1689079271;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z+kapo5dnbFedt+f2HcQKTJrZdJNpomPB/C4P6C9jy0=;
 b=b7OmRdgRs87hKAI0j7HQHNHfzNLz3fFjjc5ApWpI32tdhoqL3Fpk7Gva
 nKQYOobaidny5tI/pbmJhYwkQlnT6i5e3csjW1VUoqmGO2M6kWoumM+ii
 2sG839YXdJCl4pYRVbGei2RcGhkoG6s6F32p1RzAxcEvbcQh5GfwebYNU
 GD2brwlgtfNXAyn3hbxj1/zmRI/oPjZfcqljyJlWs6xVRPxhO1W7LWCIz
 1zeJyBKYVcPLVBBALNNC1c6e9dtxb84j7PDraZGZTv+QIzy3kxDW/Ktwl
 mY15V9MG/6mNbYiBrqIihW9yQkS20rfAKqo3dL2CvOXryXoZ8BYTavkIG A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="282199546"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="282199546"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 05:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="662535467"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2022 05:41:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 05:41:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 05:41:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Jul 2022 05:41:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Jul 2022 05:41:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DH96jnAF0iPmU/XWt9Q8EBsuFsZ7bam7AXfuEoD3IqgwMp/+1WS7q3Z7xDYAM9nudT+K/M+OsY5ju9aVfUvEQjd9CDagZp0lUJvx/Yo2VVW3K8KVglYJ/MM5R9pcT3tQqwcwOarXKIUPxUrufrX+m3IaYoUFYc3OPOz2bGXcCthBgF/+DNT/SOMy6fdeddmD0TyFBie51rkfYgsGTMCi04ExnpXcjOWX6uw5L+f+MsC7NxhIdM86gVuTVwA1Gi1cgvHQGHUTJR6jCK35EGl3KLRHu4O0GOz4TudZAjXQaWOcZ3ZyWGHsyupVaFHRXQOjVyvNTsLB+mOhjp/s8Vt8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1mJksXUCSbb4RJv0de3PQrtQHOXZM0MX2Bv2X4mPhc=;
 b=ccSLncFZJbyls+OJJno6NCvONd+hfPC+ov7AsrOG0fRZbvxRxjd7/THirMdWz1TkiJU8y+6Rq5xiIH4uVJXG9MAxGRkhEzwmn2t0WudXVKptXVv0W2VuFd9Hwo4kvK6GZ2r7yWyWE7uzNkRykZtsJiGUDhns49sWf36YwnLNlNQKVpi/+3O53E+HmBHXhln+iRT/fHvfkJV0e8MmNYiaAO1RTg8yzj41g6Fb1ffPUMqQGcxi3IKFK2cQUlh+DajXp9THW9EQsOF5wY3g+caWtd96zgdy3r2NcZiyD6PyDQOB+tEDjOYn2XlKPDlgGFkviWNV15L+T0qjbRfxgnfSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DM5PR11MB1259.namprd11.prod.outlook.com (2603:10b6:3:15::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.23; Mon, 11 Jul 2022 12:41:08 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::d84a:6462:d08d:d35a]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::d84a:6462:d08d:d35a%4]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 12:41:08 +0000
Message-ID: <e1604e52-42e0-f98e-3f0d-72a2b00943ca@intel.com>
Date: Mon, 11 Jul 2022 14:41:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/5] dma-buf: return only unsignaled fences in
 dma_fence_unwrap_for_each v3
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220506141009.18047-1-christian.koenig@amd.com>
 <20220506141009.18047-3-christian.koenig@amd.com>
 <f67d23e2-3953-7717-9c41-65075929525c@intel.com>
 <4c9598f0-4ba7-c18e-2ccd-f508769a72e9@amd.com>
 <fe4cfc97-ca20-b28d-8369-5cd404f27e19@intel.com>
 <b28cca8f-ea2c-bab9-0de7-b469df121e09@amd.com>
From: Karolina Drobnik <karolina.drobnik@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b28cca8f-ea2c-bab9-0de7-b469df121e09@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 824ac85d-9d21-476f-50b7-08da633aa07e
X-MS-TrafficTypeDiagnostic: DM5PR11MB1259:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Losb/F6SCLx/Z2E/S1JzodHMrKGq86rs32W+xtOI/sIbXh7of0SJVvLXZc+PYYAcj/c5rPDzPu89NQRVUSNAIRzg09ag6YoAH+U0Q6gX9vWbSYlYwTY5Be4D5dziP2rT9cekS49mlckzw6Hiy15xCQIIoTDi902UPDs6EL2W46o8h8xs/MpdPg5wyAwgZ0wrDB9ReJD0Mrrz1YZo/T6bp8zOceyrIswu/V82Bg7afku6nu7kS6MhfMKwRRNLW8/uKzNkMvA2aSK69ycLKAecj/XGgOGOl1GCDXRT1PQwM5S8Qzv6d/Js5el3b7uFntRgL4okU4xia/4ic0IsQD596lyX5sp2Y1zpq+XrHAwj9EkLSY8KcZYJ9dA2Ki3OoGK+DnQiyyTxecJvGnjH0gj43ts7bfxiLZyk653HRo3LYJomveqvYTrIUUvX3I2tSUwq3HFSFJiI8Xdbk4K8U4TVloI01aJBZOfH6I8ATKhDBzbQLlmKHNDZQrDaDMD7jnxHHspphhsSSD9l9A3SHXdB6haGODMg2xSEL8LgG85oJia/2smWfFcWZkCLP+TOUhTtchUPB2iYx6bnNspWNYs2y7YSrNaKjr7TGDN/0vRDKCAmMTurLyzfeTw67H/RCG4X+D2QISc8HE5qCPLfqTnVqCsbuzprE+pt61AufISEqR2RSPn69wI0NcM5QbNDp63xdJdvxDjKV/oFemQUdzgNeWzWoU0TfDzohwruJFJFKVWADX0dmskwQQF/k+6GC/2u9xUYSSgW9tcJ+wLF7QReVgARbMCWv04drunVaA22qzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(39860400002)(366004)(376002)(136003)(83380400001)(66574015)(38100700002)(66476007)(66946007)(8676002)(2616005)(66556008)(4326008)(186003)(31696002)(82960400001)(86362001)(8936002)(2906002)(44832011)(5660300002)(966005)(316002)(6486002)(6506007)(53546011)(6512007)(41300700001)(26005)(6666004)(110136005)(36756003)(31686004)(478600001)(45080400002)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aytnL2FLdGVXZ3RnY3FVOVptWGRNTStpQ296ZzZONDA3MERIWW9meUdzNGUv?=
 =?utf-8?B?TTh2ZjVVdC9zTm9vcXFZcUNTU3pDanBmNWhtdmtJMDlpQmtKKzBWQXZlNnJC?=
 =?utf-8?B?cXFXUWlIa0F3WVZzWlBHbHVBb2ZKUGplSFRQVFNqbFI5SmhsTHp4WGlWeE4w?=
 =?utf-8?B?QytobXFxM3YveVF1VjFleHdMUG5qRkpiSDBxc3MvQ2dDdmNXSUdkSGl2Z1hY?=
 =?utf-8?B?a1lGNWc0SlNkRG1xYW55SUdFSnQwOEl4dDlZU0Y0U08vN2ZqZ1ZhVURhSkVn?=
 =?utf-8?B?b2pDYU9aZ09Vc2FwY2JWTVRzSWtuZDhHQ2g0RkdaS2VDaDNDRnFYREVrcUMz?=
 =?utf-8?B?MDZvckQ4eXBXRVc2akJXVmdPS1Mrc1dFdkxXdzJqcDg3anAvYzNVUjRCOG1a?=
 =?utf-8?B?VE00TDFYQ3RlcXFWd2lCMHBZSUNOeVYraVRiTFN4Rk5qVWRHM2FlUGdhQTRx?=
 =?utf-8?B?MVRucFJRMUx3K2Z3ekZWSk02aitmbnI1RHJpQVBSd1pXOERLN21Ta09XUUNG?=
 =?utf-8?B?K3YxbEU5VHBXWVJORnZ0Sm1ucFV2b3Nhb0hhSVMxZy9XT200TDJlN1RRVVJM?=
 =?utf-8?B?MzF3UDVjZjB1eUdvb1FzSmhNQXVqd3dheUY5STlzaW9HMkk4aGtQQndteG40?=
 =?utf-8?B?ejk0d244NnJxeG50ZUhiVTVtTUlyWnFKaktIWE1TaVdoVVpVTy9GdjcvUlp1?=
 =?utf-8?B?K25VS0xSYmx5UEx3Lzd5ODRFWEs5WDFpVzd0WFd2ZFNhWTRTbUtyWTNpMWxz?=
 =?utf-8?B?Vjk2Q1JEY1pJcmZXKzNUY0UvUzZtYStib2hWVlNkM0ViRkp2b1J5cllRR1Vj?=
 =?utf-8?B?S0lBc2VKS1lhMStwRjN1MkU2dGF4bjh5akVvQWd5MmUxRXNkTlphNGRVT3BT?=
 =?utf-8?B?bDA3ZHA5RDA0ZEtlRXNvc3gyNWZkby9vZkpoUlFaKzExVWUxWFBxRyt1OFlY?=
 =?utf-8?B?N1NCSmJGQlJFWlpYWmtTVjluY2F6UTZMZFM4ajhXU0VNbjMvTE92eFBQQVN4?=
 =?utf-8?B?NU8rbWZqZDEwbXdtak5VZFNhQXd5WUsyVzlTVEt2TVhnMmVvcDkyWENYTHZ2?=
 =?utf-8?B?c1FpaVNZblVoeUphV0tuWk95VVJQNHlwRUFzcmh0TFlYdDhVKzNGOGFmR2c2?=
 =?utf-8?B?TWZraFZrYk1YcFQwWXQraXhsSWZQalk5Q09jVkRnTmZiMGttSGdta3FveFd4?=
 =?utf-8?B?c2hxZzI2bG5PeUE1UjlsNzdmUzRVRzlxUFdDUWIrcUhjT1hGV3ZpSmp6bDNQ?=
 =?utf-8?B?M2hONzE2Z2VhTmhQbEYxUnEySklsd3U1VVNrdXFNSnBmODZwTGJSUTN5Q2U0?=
 =?utf-8?B?ZXF6a0N1MHBmbGlXNUQ2emNyVjZuOEVpem9LSWgzRXdxTDZ5c21MUW5ncFp1?=
 =?utf-8?B?MDlRT1NSUWQyWkVRZUxyTURVRzMwVWYrL3JaZkx5b2h3dDl2WnIrSFNPYlZV?=
 =?utf-8?B?c1hKSDlpMDBBSks0aXdJOE11K1FJT1NzMmI2WS9zZE14ajF6R0QyU2poMWlD?=
 =?utf-8?B?T0NIWC91eEtyeU4zZ0VGUTZZMlVKUFQyeFZvNWt1WlpRQmc4Snh2azk1aUN4?=
 =?utf-8?B?Z0pZbTJpNFhaS3ZHVEVPVS9XOU03M2ttWUxTbHZhQkdtUTVZbHF1Unp5NHVp?=
 =?utf-8?B?T3BoTS90b29WRFM2Y29Eek9oK3Z2NlV5bXJyYldrNDJqUHpGMHVab2xBNlp5?=
 =?utf-8?B?M0pUcEU0Ym1HWHZMd1hBZkVIbXR0d0dHcThUNmpTa2ZYQTNFb3h3NDhoQlZH?=
 =?utf-8?B?MFBTM3pzdXdlUTR0MExCRG94Tm54RFl4a2F0dXpQUzVncTIwUlMvUFhad290?=
 =?utf-8?B?VTliZzhqa3NtaS9uc1I0K09GWm1yVU1kbmFhT05kR25ycUJBamV2UHpWTEJD?=
 =?utf-8?B?cWJzT1lORVgyUW5HcWdHY1V4Zy85QjFsZUZwdmhqR2JQWmY4SXlXaDN2UlRr?=
 =?utf-8?B?KzZyR2t2VHFQODdyTzFJUnI0eXF2R2pDdTYva1BxNThXR2FDNlBJNEZ0V1dX?=
 =?utf-8?B?VjhHbjllM1R6d1d1ZEdxeFhWSVFjbzB6a2M1eVVrbEMyTzQxNHB6cEFwSU4r?=
 =?utf-8?B?T3gyQldyUU9xMXpYc2RwbnpHZVFlRnBhV0pCRFdpUHJHaDJkWm4yOEZkSUZk?=
 =?utf-8?B?TjU1a3Z4eEE2KzJvK3p6Lzc5OTN2Z0tJSVVYVnZja2ZVUnpOclJWYUNmQTBZ?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 824ac85d-9d21-476f-50b7-08da633aa07e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 12:41:08.0419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rg1JfbRDb+AdE7CwStRzy1wvwXfLUqQ6YA/lnzq7P/xKlaxJg8xaRQ8I9fzaJ6trb5cXiqzNQkXPncyw7kghHMNiM0BIJpVXQ0aL/NTlBIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1259
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 11.07.2022 14:25, Christian König wrote:
> Hi Karolina,
> 
> Am 11.07.22 um 14:17 schrieb Karolina Drobnik:
>> Hi Christian,
>>
>> On 11.07.2022 11:57, Christian König wrote:
>>> Hi Karolina,
>>>
>>> Am 11.07.22 um 11:44 schrieb Karolina Drobnik:
>>>> Hi Christian,
>>>>
>>>> I'm sorry for digging this one out so late.
>>>>
>>>> On 06.05.2022 16:10, Christian König wrote:
>>>>> dma_fence_chain containers cleanup signaled fences automatically, so
>>>>> filter those out from arrays as well.
>>>>>
>>>>> v2: fix missing walk over the array
>>>>> v3: massively simplify the patch and actually update the description.
>>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>   include/linux/dma-fence-unwrap.h | 6 +++++-
>>>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/include/linux/dma-fence-unwrap.h 
>>>>> b/include/linux/dma-fence-unwrap.h
>>>>> index e7c219da4ed7..a4d342fef8e0 100644
>>>>> --- a/include/linux/dma-fence-unwrap.h
>>>>> +++ b/include/linux/dma-fence-unwrap.h
>>>>> @@ -43,9 +43,13 @@ struct dma_fence *dma_fence_unwrap_next(struct 
>>>>> dma_fence_unwrap *cursor);
>>>>>    * Unwrap dma_fence_chain and dma_fence_array containers and deep 
>>>>> dive into all
>>>>>    * potential fences in them. If @head is just a normal fence only 
>>>>> that one is
>>>>>    * returned.
>>>>> + *
>>>>> + * Note that signalled fences are opportunistically filtered out, 
>>>>> which
>>>>> + * means the iteration is potentially over no fence at all.
>>>>>    */
>>>>>   #define dma_fence_unwrap_for_each(fence, cursor, head)            \
>>>>>       for (fence = dma_fence_unwrap_first(head, cursor); fence;    \
>>>>> -         fence = dma_fence_unwrap_next(cursor))
>>>>> +         fence = dma_fence_unwrap_next(cursor)) \
>>>>> +        if (!dma_fence_is_signaled(fence))
>>>>>     #endif
>>>>
>>>> It looks like this particular patch affects merging Sync Fences, 
>>>> which is reflected by failing IGT test (igt@sw_sync)[1]. The failing 
>>>> subtests are:
>>>>   - sync_merge - merging different fences on the same timeline, neither
>>>>          single nor merged fences are signaled
>>>>
>>>>   - sync_merge_same - merging the fence with itself on the same
>>>>          timeline, the fence didn't signal at all
>>>>
>>>>   - sync_multi_timeline_wait - merging different fences on different
>>>>          timelines; the subtest checks if counting fences of
>>>>          various states works. Currently, it can only see 2
>>>>          active fences, 0 signaling (should be 2 active,
>>>>          1 signaling)
>>>>
>>>> Reverting this commit on the top of drm-tip fixes the issue, but I'm 
>>>> not sure if it wouldn't impact other places in the code. Please let 
>>>> me know if I can be of any help.
>>>
>>>
>>> Thanks for letting me know. Not sure what's going on here, but I can 
>>> take a look today if time permits.
>>
>> The reproduction with IGTs should be quite easy. You'll need to 
>> clone/download the IGT code and follow instructions for Building[1] 
>> the project (make sure you have meson and ninja installed):
>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Figt-gpu-tools&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C9a9587aefd2d4ac2d86208da63375cb6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637931386683611766%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=4WsMutcFJ2HwBqld%2BTv9N1Tx6cbFMwJJZ6kjm5rbfoI%3D&amp;reserved=0 
>>
>>
>> Once you have it up and running, go to <igt path>/build/tests, and run 
>> the subtests:
>>
>>   ./sw_sync --run sync_merge
>>   ./sw_sync --run sync_merge_same
>>   ./sw_sync --run sync_multi_timeline_wait
>>
>> You can run all the subtests with ./sw_sync, but I think these are the 
>> most relevant to you.
> 
> Thanks, I've already managed to reproduce it.
> 
> Not sure what's going on here, but could be that the test case was never 
> correct in the first place. Need to double check.

That's also a possibility, but I couldn't verify it before writing to 
you, as it's not my area of expertise.

Thanks for taking a look at this.

All the best,
Karolina

> Thanks,
> Christian.
> 
>>
>> Many thanks,
>> Karolina
>>
>> ------------------
>> [1] - 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Figt-gpu-tools%23building&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C9a9587aefd2d4ac2d86208da63375cb6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637931386683611766%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=FV0Ao6ra8EOyr4cOs4N7mCmpOEUUObTrgyOrd0tvEV8%3D&amp;reserved=0 
>>
>>
>>> Do you have a description how to easy reproduce this? E.g. how to run 
>>> just those specific igts?
>>>
>>> Thanks,
>>> Christian.
>>>
>>>>
>>>> All the best,
>>>> Karolina
>>>>
> 
