Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F854F9110
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 10:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91E110F13C;
	Fri,  8 Apr 2022 08:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F235F10F12E;
 Fri,  8 Apr 2022 08:45:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fg4svKroCs8MkI9PFqoNQlq04C6wJ5C7/XLvFD2hKidNqsp5E90E28enSuDOaiuDDHcOhHMzUp5VfomExj7AE0uod5/piYC8RaMVB5WeIImms3loowh6MgAskPoIkTkelXxoCgk95uyETxmJN/OAYkHQvuRZFbcRcFLDHiiYeIGU/klH6IlRijNQ56DEmQbSP/XfWrzzsG7UvUJ8Yoijvy8lmaqV0yznTJLMkApR8Xu6bzw9+XfQPiiDSx0+SeXVhmDfBY3UPoNxS4LNqFHvE8rbhsWpm7PtczjUFwMPNC4sTu1mm4TwRjsXPC907CzW/nShSYEC9pRJye/I+kNNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpQV3UiKdUfrxYhIpkr7UeF42Scq4tqe9G+/th9Coqw=;
 b=eosT5gMWc4mdqncduyFsZ2F1my35BcSeJJWXedR/rGkDEfHWCpsK59TJ6JnnQdsz/Fek/d4fC6xFL6OH1jUzPa8tvY1hxVMbT1Z0/yDhBFYxIZ1yMooXyZLRFIZedC0kIQ+L3bBtLtAFyT+IVpxjr77cbIq4Fb2Mf5ktiXUzEilYOd9N+g21RYHhfQrScu+nabZQv/BeE6AVghdQeb9DjnUsypOZbXklk8vPOb+aO+aT+GL0bKMQb5goqsGvckd2K17q9DutojIOzeFg3E7xw2KtdSSb/edDr4lwQuJzgHZ6m5J6WCU37vn8RuD+4VD78PdsL97KWswb8+X3laHnuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpQV3UiKdUfrxYhIpkr7UeF42Scq4tqe9G+/th9Coqw=;
 b=TnO0OgckaJFUkvE5ltKFPsmLEZfQPnvWmcrgEeM4X00NPw+YYrfxaYYfpfjcB7j3JlHY8iJFYMOyijzkk3NOqmB+2lmjnPtThDA3alVwe47LW/BNQKIFhZ4AnycyBFWH0yD2GVZxGi/1U5lnluH4B7iVnd/1ogHWANB031B6USw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3279.namprd12.prod.outlook.com (2603:10b6:208:105::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 08:45:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 08:45:24 +0000
Message-ID: <e94fbeb3-ad18-9741-628b-9b3b34bfb738@amd.com>
Date: Fri, 8 Apr 2022 10:45:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/i915: fix broken build
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220407164532.1242578-1-matthew.auld@intel.com>
 <1a4ebf85-4447-8f1b-b8cb-2fe0ad0372a1@amd.com>
 <f5862ea0-908e-def3-df79-db3d06bc389e@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <f5862ea0-908e-def3-df79-db3d06bc389e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0551.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb3942bb-d450-4894-1ec6-08da193c1f63
X-MS-TrafficTypeDiagnostic: MN2PR12MB3279:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3279589D207928CD84FF31C783E99@MN2PR12MB3279.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FM96hvKCd0gmMDGI3A/GskklVX/SW8IJqsbfgXb5f9SnJ1SYTRCo1qIU1TXYKNy+9+Db9i/Ffr0vRmgla7MHwPSoBXRBVVf3+UJOQhUyPH1UJf/wSKVgS6tSZyX6uEe+3cCsyJ5UqYYccPmo2AQy5eA0heasVp/hCJrCelbdDC0p21vK2WLi/InnYt1sI6OAwcAM24I9G1Yfoqp8HrrT5KCXpueHt6VKY7f4/s9rSxlRbo3jUSVEju0qdzlqE94GEqEIp0wm+AW8QDGVxBrArdeNtXDePXhz11xKUwMnayANrxDGpx8S031XygH8qK1cH8reR4VUL5AYeg6HHQjJmv4hSA7xJpLeNBVgih0btp29+y++rKZexEcxciVdfV5IYZ5ZlL5eNphKsx7i1G3L9d+e2OKEr0EjO8b6cyStkxt74hMYXpI06t4TUBaWUp8pZhQKJvCJ6mljoPtYgKI97DdFG9ywPff8a90VBYYu/0aWKTHPdZIix0THQZ9hWQ1UiHFrzhKjG8vBITFOaVAMqpGwimoG8PxAq+YMUqz5RTu4Qo9IKn84yK9hMLSUTO2xE8x9pRLR67cTflo2pPjxqPTkQ11cFJUGFh+383ogYaZ8g/PGxxZAO4H6q61TouvjliXmlcevlGXWRmpP9oyd+n4+IsTiTpzbV8acJo5RDWJ1X0n8OJGRFVlDrt0h5lUBaQsb/dhM4998nneET2KAOOHoCFiHeRJUphtZxJLW3ktqAX+Bmz46S7F09W+zIbV4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6512007)(66574015)(83380400001)(316002)(36756003)(6486002)(31696002)(66556008)(2616005)(186003)(66476007)(8676002)(66946007)(4326008)(508600001)(53546011)(38100700002)(6666004)(6506007)(31686004)(8936002)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjBHQ1hYRnhod0pWbVEzY2g2T0NtVE94a1BGVkxmaW8yYS9oVEdOcXNycTVo?=
 =?utf-8?B?dkN5MjZRUzZibTlEeXh5VTEyOHdMSmZDTTNpT25ON29qR3lqOFd2QVhxUXBB?=
 =?utf-8?B?MlV3NFZTSGhJdzdPdDUzTnJMRk0wWVM1S2pUWXdKNk1CTVZZZnRpNTZPeHJi?=
 =?utf-8?B?Z3dCbmdtdkU0bjN5TmZYYkpZaThzUE5mWnpMZTVUV3JiQU56ZDV6Nm9Fb2lk?=
 =?utf-8?B?eHZnZVM4UENVaExhTGJYS1lPR2I4eDAybVcwV1BpaGRsNzJncXorLzFYQU9T?=
 =?utf-8?B?djdwekJUcUxDUjFMbDgvRVpNWFRSc0pyNzNBaGVwbHhtejB5eXZBc1FsUU55?=
 =?utf-8?B?SVBCVmxrUXFRVytnYTFYdXhkWXZJMktENlVDYi81L282bFJ0QUo4UTV4ZVV4?=
 =?utf-8?B?bGFpVGg3OGh3Qm03dmZESWk5QVNvYmRBd1pvSUVVOEwxL0kxUzBxVE1nT251?=
 =?utf-8?B?SHZmK1U2T0MySis1YmEwR3ZEemM0SVVITEltUEhpbUJad2FMVCtWeGlXTnBW?=
 =?utf-8?B?Y0lidEF3ekc1SGY0NHViWEhuZHBNVDlVZHRCQk1NZ1F3WW5ibm1YSmFGVGlS?=
 =?utf-8?B?eFBmRWVTUFRCZkxPKzgxVmRnUFZPb096YS9aSU9ISkRjZ0M0ZWRoVWI5dE9N?=
 =?utf-8?B?Vm5zVit4eVA1d0N5dFNPeWxPSU41Z0FpekdxTmVUT0EwMDIxY1FEMHR2d1ZX?=
 =?utf-8?B?V3o1bFhsalRZQjVOcjJHK2tVZkI3TktwWnhzdVBEdkprdkRmSlNGWmY5UFIv?=
 =?utf-8?B?dUw0bjVodWsrYjNDODJJMzBzZHpIaGZwQUJEZzR1UjhBak4zMUNjbzVpaHU0?=
 =?utf-8?B?d1gyM2JzeGUxY0lndUlFVE5JR3F6TlpMRXM2WE9rSlQ5RkZxamhwcUNiT253?=
 =?utf-8?B?M1BoL0xVWWErb0NsL2tNWkxSTHM3Wnp0MHBuTGV4VUVGOC9XeHk1WmhmV0xD?=
 =?utf-8?B?Q3Bzem56dytQclJqLzlwS1VPTEFzRitaSmNQV3l2UUpQRStReXVQS2JGNFhB?=
 =?utf-8?B?MnoyaVRDcVBQNTFCUzRlSUJrcjRrWEhsL3JHR1hESGhQaEh4MEx1dVRYVG4y?=
 =?utf-8?B?RGd2cGU2aiszRTBzL2VlTmk1K0NXUnZsQzdDaE5EWHdzaG9BT21NR2hkb2VL?=
 =?utf-8?B?UjZCWWJxbVRlam9qS3dEUUZnMVcvY1pqZGhnWW9WTkhBSHdRSC93RHRaTWxT?=
 =?utf-8?B?NCsvaTlqYi80YkUrMHF5RmM4bmZ1dkpaQ3krUDRiMjF0SHJZSGcvbkx5Umts?=
 =?utf-8?B?a2czYjFqeUFrR2NWMDBzcjkyRkhKeXZLT2VmaytWQkI5aTRqTTRQSGx4REFB?=
 =?utf-8?B?OUo2SG81OXRrQUtqTDc1MThrSWtoY3VEWjNUdFgvOFo2TGpRSW9nbmMyU2dH?=
 =?utf-8?B?SEtPMG10d05ZaElzTkFOUjFvcTN5WmtWWnJEQmR4ZkwwM05meHo3UW9YbFk3?=
 =?utf-8?B?cm01cncxUHFYQUYzUDdDeWNabEVHZzJab05CSlYrL2kzeWR0Y2hiNnl4ZHhF?=
 =?utf-8?B?QUtoeXdZLzJNZXV5cTdEdHB5M2JVeXMvYWhGMmpwYlF2N1BHMTRVWnQ3RDhs?=
 =?utf-8?B?ZFJzMHNPcE9ZSm1EcVRKYVZBN2xKSldSRlczSm1pWVQ0SzA4Qk1QTm9qYWRO?=
 =?utf-8?B?VkthekZrYmpINytWNTNLbk9OVlQ2WWF1U2h2UkJZZkVFcEVLcWxQZzdyZGhp?=
 =?utf-8?B?OFd3RDh2Y0VwUXlCdHJUVm9NT25uQkZUc0F3N1VWUGRSVlAweC8va21lVXdl?=
 =?utf-8?B?ejhDRm1VbXVxdmxKTXdQRXhIZzlVVmZidkxqUW8vbXRFTENIVzRRSGlqS2hS?=
 =?utf-8?B?WDIyRHdtSStqdjFhbjVyL1RqMTFSN291aU9BRnNQYkNxWmplVkliYk9EdGp1?=
 =?utf-8?B?SjRmU1FLMzFub29ENi94VmtsRTVFSitGWVMzWXpBVHYwaXYxUDBkWExmOWox?=
 =?utf-8?B?N0ZQcThVWGlNeHZhbGtVeHZyWlI2d0lOSWM2YzB0dFlMVVdyRDhPSWpFNkFo?=
 =?utf-8?B?WW1NR3I2bkJENk9OSUlab1lEdTBtSFdlSHNrZ2Z1ZHZLL1A1bHkwdU42d3hv?=
 =?utf-8?B?aXYrb0x1czZBblF3VHFaOFFSQkdIOXkwNjNJSDJ4TmNHZERYSkxUY0EybzNi?=
 =?utf-8?B?UVFKam0zcFlIeWxaYWorczkxaHJmUXpNN1gvVVpCeDh3bllUMHBOMC94aTNC?=
 =?utf-8?B?ZFFGQzZ0NzBCdW9GZWczb1RUSGVDMG9xekRaMnFPK1lTbjJzaEVvZWw5cm9R?=
 =?utf-8?B?UjQ3MXVYRFVUWDRac21PblNkVG5jb1RzU0haK2ZVaGFwUFBwelV4bWZiaWNy?=
 =?utf-8?B?dm14dVlld3lYOWMxaGR6eC84VWJvN1cyYnBPSGxvVFQrQWhSZ21NQlJsY0NY?=
 =?utf-8?Q?zo7yIbvJBVXrOhIrCafKaLSZNGHC1m5RENY6IJ11z6AIS?=
X-MS-Exchange-AntiSpam-MessageData-1: ozCGq9Zfvo24Fw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3942bb-d450-4894-1ec6-08da193c1f63
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 08:45:24.6355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9NXwtMYTZ5MfbVwh++ltHBv3y74InZrsPLYcpZqtrBSsVId/DRliCggIeZwRDqB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3279
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 08.04.22 um 10:32 schrieb Matthew Auld:
> On 07/04/2022 17:49, Christian König wrote:
>> Am 07.04.22 um 18:45 schrieb Matthew Auld:
>>> I guess this was missed in the conversion or something.
>>>
>>> Fixes: 7bc80a5462c3 ("dma-buf: add enum dma_resv_usage v4")
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> My best guess is that this is a rebase/merge conflict. I'm 100% sure 
>> i915 was compiling fine before I pushed the patch.
>>
>> Anyway Reviewed-by: Christian König <christian.koenig@amd.com> for 
>> the series.
>
> Christian, could you merge the first patch? I need to re-spin the 
> second patch it seems.

Pushed.

Christian.

>
>>
>> Thanks,
>> Christian.
>>
>>> ---
>>>   drivers/gpu/drm/i915/i915_deps.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_deps.c 
>>> b/drivers/gpu/drm/i915/i915_deps.c
>>> index 999210b37325..297b8e4e42ee 100644
>>> --- a/drivers/gpu/drm/i915/i915_deps.c
>>> +++ b/drivers/gpu/drm/i915/i915_deps.c
>>> @@ -226,7 +226,7 @@ int i915_deps_add_resv(struct i915_deps *deps, 
>>> struct dma_resv *resv,
>>>       struct dma_fence *fence;
>>>       dma_resv_assert_held(resv);
>>> -    dma_resv_for_each_fence(&iter, resv, true, fence) {
>>> +    dma_resv_for_each_fence(&iter, resv, dma_resv_usage_rw(true), 
>>> fence) {
>>>           int ret = i915_deps_add_dependency(deps, fence, ctx);
>>>           if (ret)
>>

