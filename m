Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F8182B233
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 16:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B1410E945;
	Thu, 11 Jan 2024 15:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B397010E945
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 15:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704988506; x=1736524506;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/HWqc45pT8Xy4iSQc9ZMhRZ82kF6FrAwPW6jXJ7KqQM=;
 b=mtFBkmD0WK6PegL0pf1Y6WhZEhd+CgIHm+I9p7h6kM8PMeHUM5nn9NcH
 ndfhxTS7JP/seJKmWmxo/trY+GrH6iLIbQ6FTBQAOua0TfHoPs7/kl9oo
 2tAJnq705he9KNkDCPouLd2eZhm14RZviZj5Wg610WI/ua/ia1fW7s9rm
 9uGmYbF73KVYSyE/LfBRbB4KIuVKLyFk0mF5jFsbsIRpl4aH36i6L5qLd
 OXMEYr6okJnKGLAJxUyymXi1VgbeKgUz5vCliqORSeeevOVavnroGY976
 r9p0p5TFVkUf3q8sIK3HeuJZ8IYraTDHkj0Z9gSzNuf8J2CpRwI3Kcz4y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="17490049"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="17490049"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 07:55:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="782678208"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="782678208"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 07:55:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 07:55:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 07:55:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 07:55:04 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 07:55:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ljxg8tGvTiAg0dq0qMYbP7Z96ClT8R3ppBo0ge8SdHWy26ZGRQdMdlxnPyPUhTL0ps+jkuma3WMMY0hTmJnadG5JyxQvlK1LsOtWsU8/PbW/Q5Wz+QQeZACmsdrXLEXQS1MU+Yfie6VRSSqaTVf2LQqR/OvhpBkW1r1dofMQEtI4+A2wDeW8seRdCvDL5BRsJ2uLJtol0sOqso1rehw5nJmfxB+za8zE5IpPsnDlxOSP55dOwZB19aYZ2rZWB3pYUhXJMnriWxlnKfp4NfIwbjRZSIpxZgUt4AT0r4usVitDb0hZgyUWFaRofo9lrVFnJRRbdDq853pkBlDu8FTmag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PV7Spi0AQhaRoLMNGFsmKionPxAsxkjP6UD19jo7ByI=;
 b=VH0+vKUlxUyNwPIIn4i8qjsBhQbphAiuzti2HjdpAyD8rXCTYaKy0tno0JZ9nTmnOqx1Q78Fu0X5hcAnmirC9jd1eUOjyDAJNE6wzZq92jyC5M1sFe09jRuuu4zkFamzqAcuoitoURvw+oY7qlUvNgcM0KozP3gJIZSI8H5eR/nOt1PhxnZpP78pCQ8pVR3Gfjewpl5aAcNWCgfYmyeCONqQS6RrGiVgHHnTH3z3DInR19T6w1mA1783IH0tPQGIXmitqHZzHu0SDKlV8ZGneEDHa5k5FeH0SVABPrpLWfKHzt1UH9XcsYEeJg5VlweTpPjC0YUm+Xs+CsjJklnm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by BL1PR11MB5400.namprd11.prod.outlook.com (2603:10b6:208:311::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Thu, 11 Jan
 2024 15:54:58 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566%4]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 15:54:58 +0000
Message-ID: <6a52ba4a-d025-4257-82d9-989d7f24f8b1@intel.com>
Date: Thu, 11 Jan 2024 16:54:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 1/8] drm/ttm/tests: Fix argument in
 ttm_tt_kunit_init()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1704959786.git.karolina.stolarek@intel.com>
 <db34f34a039cf951c5933e8ae046b4ed72d20dcb.1704959786.git.karolina.stolarek@intel.com>
 <c0cf8ae9-7915-4102-97a2-2159ac6b69d1@amd.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c0cf8ae9-7915-4102-97a2-2159ac6b69d1@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::11) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|BL1PR11MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: f769c561-33e1-4efb-9f7d-08dc12bda9a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OZCYwyX6wglh3Bn81xL+rqWobGxaiCKZHMbgT7JSCSLK/klLb+DqDVQd3eQl7RoG1MLuvWHBT8Q77ttoFtkdn2gYpqWkAeM1foqSpHnJLKjkJ88YXPLNWq1mYui4s/wtk8kqzSTkwaoxxMFwlBfK4juL410puL3C91A9/wZe9gjxXnxnWKGEOXlj1EkfmVc2GL3n+e1X6yLw+UbrrjadtLYd7PTQyRU/EX6pGt3vlAf59fcQJ+dQ9hCxy0v6Lu8dnBL5zVNvbzzfdsRpQQR0aOg7AVERrFGRsEKEaxTDNWXmPyNBCEWm8LZBMy1uTX+BElEkY0mDAPq5m0ExcXEc4D74olk4DCVYFexazJAw6V96tgOTnDk6q9aU12IUPXRLiHITd1LNUsuXKnYw/RNvYM4my483X1BSKuxtNr85tynNu6bu2F6XRX5UNyQ7pbGHFF8kZ1ApSr0ABKykalstpfTvBguT9vNf3Uuw87alvoB/c0lgVAlLoligLFhmdXRBOc6+zYBJSREjmbyammdGEGgt1te1P4LEj2VzMlHoXWyUrweleOfddsfmhVxSuZprjFI6trkyisL6FJ/W5HAKuPAhPX5weNCmNpIOI0G0g2Gf+xZs63+kQ5kaw8BfFXjmPR2BhXFJMfnJWx2qrf6lDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39860400002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(31686004)(6506007)(6512007)(53546011)(26005)(66476007)(66574015)(478600001)(66946007)(36916002)(2616005)(6666004)(6486002)(31696002)(82960400001)(83380400001)(86362001)(66556008)(54906003)(316002)(5660300002)(8676002)(44832011)(36756003)(41300700001)(2906002)(8936002)(4326008)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTBxZGNWdGtqYVU1aElENjZmWHhoaEFucGVlRXF2eU9wbS9nOFlSeHlJcXVR?=
 =?utf-8?B?MW93UVFibW9UTng1UENHa0h0UVJnSlhkR3NzdTV3dk9WWjVjN24rUmFsb3pQ?=
 =?utf-8?B?T0lGS1ZjYnNwdjEwY0hZeU9ZSnBYVHNyeTFSampIMHFEYi9FbXlSREkycnZy?=
 =?utf-8?B?cThCNjlIYjlzbXB3T1U1ZU5uTlozNVVtUmFVY09xamZWRkFzMy9peC9LUnk5?=
 =?utf-8?B?dS9ySEhvaHZXS0hUNURtNkUwM25TbGJYOG1lTFI3VzVDMXo3dSs4STU3VGEy?=
 =?utf-8?B?bFNDeG1xczNWVkxuS0RSQmxOdVpzeUl0ektzYWtYMkthVVR5YXJVempUNnhR?=
 =?utf-8?B?OG0yZUVGRk9ENmp1MGRLNDRQTEw1aVBkVjBTcHVuUjZEUnZmbHg3SjhXZUJj?=
 =?utf-8?B?NkdEOXE5bFJNOHlRRDJ4Zm9XVmxmOHlTU1FuWFErMzV0VDluMjlGQTVPejZS?=
 =?utf-8?B?N0p5REZaV3ozOHNZN2QycmZWdDEra2dzMkdycW1nUVRTM0RHTmI1Y2J6REwv?=
 =?utf-8?B?ck5FSnJZTGFEM3FOUzFGaU1VNE1maVVNekM5a2wvVFF4YmF3alpCZEJTcXpH?=
 =?utf-8?B?Uk9NdUduenRiOVJ1TDdRd05LZmJEQlcwY3JUaVk3cnFkS2k1a0duNElZcGRL?=
 =?utf-8?B?SmxDMWhReUpiV2xpaUdqdmV3ZUlkeG5kSk5zcFF0cEdLVGFadGdtUzN1ZjRR?=
 =?utf-8?B?S1hmMWozODVhMUphZ1kyU2Z0S041N0RSRW02NnRCNnRIOUQ2SjlGbC8yaEh1?=
 =?utf-8?B?b0cwUm05aDNHOVp2UjlzalVKbzZ2NjFDMFhYUzdyYWQ4OFFjeUh1YjUvNWlF?=
 =?utf-8?B?NVJrbkZjNFZSU08rU1ZkNmlwNk4vb3dpR2o3a1R1WTZIbGJySVdQVFpSNW1G?=
 =?utf-8?B?U2hLQ29Icm1BNjNvV0k0cm9LZDdTY0E1U3hWUmZkTnA0RU1MbzkvVWxoNFRa?=
 =?utf-8?B?YnJkVXJOWFduOFg3ajN3azNtSk1aejRwOCt1WGxHa0FnczR2bEVIQ2Y4L1NS?=
 =?utf-8?B?SDdVOU83cVVBQlIzdU13ZGZGMUxxYmVUN1VwL3JTOURJSXpvQnliWTdpMWVZ?=
 =?utf-8?B?cUwvYy8yMnpsaXVFaEFScG9WZ095RGpRREJzbVZqenlKT1hEY1RDOWthSHB6?=
 =?utf-8?B?RC9tekNXNVh2QnYvQjY3eUhqSklENDBpMUkrdEM0Q2lMQzJuMmlyRHBxcDRL?=
 =?utf-8?B?WGIrc2Y3U3E3cklDVTk2bFRlSGdDTUdpS2lhTDNvQWd3a1dzYmFvZEU4RG9F?=
 =?utf-8?B?c0tZQnNJRk0xUm1lYnNqMzVBb1RJZVl1QjJYMkVWbHR6NFlNU0I3bVoxQmVK?=
 =?utf-8?B?MG9KVGpXRnNYUDEwQk9OWmhoQzNKVVJFU3J1NU1Rd2pOZ3J1d3d5b2xjazhj?=
 =?utf-8?B?RVNzZVJpSWZuclNxV0hrMUZqcW5oUGM1RHBIekxVb1NVaktJNk9YWlpva1JI?=
 =?utf-8?B?ZEQrdVRmUWppSkdZY3pZU1RsWm01ZGxhbVF3d3k3eTZmajFwVDQ3TzdiT0Q0?=
 =?utf-8?B?T0l3NlorLzFLcW1JRE5yN1cvMkR6a3c5UHZuMi84TVZBRzYrV1IrT2lBNm5V?=
 =?utf-8?B?TktTZW5DYzdORzVaRTY0NTFTZEQwbkYvamhNZnFmQ1R6OU9rWEhkWGc2S05J?=
 =?utf-8?B?eVUrY1BqU3dXTjE5aDUvWXNiU1cwejJabVZGWVdlK1hWQTFSQjR1WDU2dmxB?=
 =?utf-8?B?d3k0blBKMkNaYXpRYnFkVkhLamo0UG5wSE9HNlBGRk83dDVvdlVVNmkyRkdj?=
 =?utf-8?B?TW5XbWlmK3lWbTdadkVpQUN0ZVZxMm83ekZsN0Z1bGFzbVNSNVlHdktoYSsv?=
 =?utf-8?B?MkRoemVXV09CaFFZWk1OMEhwOGFsZUc3ZlR2UkVGK2NxYUExZ3oybXVGWmRO?=
 =?utf-8?B?YStJbitoN0dCckRoYk1BSXZ2MXFzV3BXMHRUTEhyRUYwbHNGbkl2N0g5YXMz?=
 =?utf-8?B?alR5YTJtZTJnTW9VQ216V1FYdFM1MUEzb1EzU3dqOGtUSSsyYWJDVU4zMHpD?=
 =?utf-8?B?TS9aMkFsNHd4WktTay8ybUVHUjVDanltNkVSaVoySkF2UlVmTytzc1RBaVRo?=
 =?utf-8?B?MURrczBDWU94SERKTkhyZ0t6TFRvNDd2RWFkenAxOXUzU1E0cXY4MHZhTjNl?=
 =?utf-8?B?R3MvdmJROCtXQWVuM3JtZEdsQjA3ak5qc05mZkpRY3czVWRYdDlsK1RMT3Vp?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f769c561-33e1-4efb-9f7d-08dc12bda9a9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 15:54:58.6518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxYkiB8LWBoLTn0OklBOJA/yV4/mr4apXNufwgBArHSkKFxrN51/cPgmEf/ViB/Scmu2YxHocWgjnVlP1Zu7WKHniiMws3P8MrdqHEzyg0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5400
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
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.01.2024 15:59, Christian König wrote:
> I've gone ahead and pushed this one to drm-misc-next.
> 
> Going to take a look at the rest as well.

Awesome, thanks a lot!

All the best,
Karolina

> 
> @Amar could you run another test round with those? And maybe ping Kenny 
> if we can integrate them into the CI.
> 
> Thanks,
> Christian.
> 
> Am 11.01.24 um 11:28 schrieb Karolina Stolarek:
>> Remove a leftover definition of page order and pass an empty flag value
>> in ttm_pool_pre_populated().
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> Tested-by: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>
>> Reviewed-by: Dominik Karol Piątkowski 
>> <dominik.karol.piatkowski@intel.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> index 2d9cae8cd984..b97f7b6daf5b 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> @@ -78,10 +78,9 @@ static struct ttm_pool 
>> *ttm_pool_pre_populated(struct kunit *test,
>>       struct ttm_test_devices *devs = priv->devs;
>>       struct ttm_pool *pool;
>>       struct ttm_tt *tt;
>> -    unsigned long order = __fls(size / PAGE_SIZE);
>>       int err;
>> -    tt = ttm_tt_kunit_init(test, order, caching, size);
>> +    tt = ttm_tt_kunit_init(test, 0, caching, size);
>>       KUNIT_ASSERT_NOT_NULL(test, tt);
>>       pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> 
