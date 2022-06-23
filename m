Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D9B557AB6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 14:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7A910E100;
	Thu, 23 Jun 2022 12:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB4210E100
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:52:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmrbqOwaZHJ7nJNEujBo8W3Srk6blKSBXhwPEb+jZyIHYhtWzDHyvq1Q5WYQITTIk6NC2o5gnwMjk8Fpcg3wsdDmbYptUtWy6ArTYh3MS2o0mSOFxN7MhhqqVINe8nZIwTKBiIROIYF9LOgHm68z2zYBVAMEA4gXfFXxch2jWrjqFz1FuuVZ+khb96WxOMboZehTETsejb0NYxxYxwrhQfSWb50lj71OH/qau+n8+1giHlL/y5xL3i/gn+IyEV0Gh3wyqBW46/ioSWqbZea6Md5eMNZbT8JBhwMCPDcaTLTH/gmdfShiT7dkCuj40t+pF/8lGXfU7k+aSSyG/dXn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k18tJqJaSuedBHJ8To1ftoAuWQNKYZJt9xWlLrrL0t8=;
 b=DANLBpAUhr0x4zZv1Sc56EYKQqcXntUfbUWUJcAF5x4oriRr8YT9jFo+tEK9JbNIuY+87FTe8hRR70JhnsEDJTOBPPN/UWyMQORUHnTXAUoHNS/X9OThNEGcyQ3lz0ocCoEWfZeeRLf+uT5cH9tv+ItAZSmkbTTqY4rHyzdxqYvdXhKKQMW5vuOTtntVK0DiBcddFNQwQdsVUDi7glTfrtGim5Rbc24MIPrlV0068ImbTnIxoWkZIzO2bzlZM6TxhFICQ0AkQeakZ14cOJD56E88SYXizjwa1HZ2vw6RNHjFJ/0XQkWVVAdYuCPF5EJ1U4miK+RMkDPXL+a/1aUd3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k18tJqJaSuedBHJ8To1ftoAuWQNKYZJt9xWlLrrL0t8=;
 b=5Slu9W0px+VGnPwMa/IDyYAokCmj03mQrI2sl3E9hTg4vP0neejLuaih+Y8tMWCIXp+BJjMbERMhRQok7rdRD5+xDXrC9kYj9OTfVDkpErlzI1NuSFh4msJnSmUFeI4dzY4yrT7i2we2fNMHTj0pdFz3oeABDoUFz0Y+CmD1Zpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR1201MB2555.namprd12.prod.outlook.com (2603:10b6:3:ea::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 12:52:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 12:52:33 +0000
Message-ID: <4ea37684-5dda-94e4-a544-74d3812e8d9d@amd.com>
Date: Thu, 23 Jun 2022 14:52:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: DMA-buf and uncached system memory
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Pekka Paalanen <ppaalanen@gmail.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
 <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
 <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
 <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
 <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
 <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
 <05814ddb-4f3e-99d8-025a-c31db7b2c46b@amd.com>
 <708e27755317a7650ca08ba2e4c14691ac0d6ba2.camel@pengutronix.de>
 <6287f5f8-d9af-e03d-a2c8-ea8ddcbdc0d8@amd.com>
 <f3c32cdd2ab4e76546c549b0cebba8e1d19d1cb0.camel@pengutronix.de>
 <34a1efd9-5447-848b-c08c-de75b48e997e@amd.com>
 <3c088a9a511762f7868b10dbe431942d3724917a.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <3c088a9a511762f7868b10dbe431942d3724917a.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0601CA0068.eurprd06.prod.outlook.com
 (2603:10a6:206::33) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9206c228-2d66-49bb-27ba-08da55173d51
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2555:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB25552DE77B39F93824F4A10E83B59@DM5PR1201MB2555.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWq2B3WzWKAStAs4DMqY1vGm/eQpWviefE2jGtOKphliiERkX1h1pwpJlJfMsVylJeGdZpp+vN7d/Qqd87UuYhcYqj5m8uNkUgirvWqVxgkBZCsmmRQupAXPXwpUCMa/YFnpXXb65UCbhuv36c65aV294P4sCBwhsZIlDR+YFTQ38zKtOm4Vl+MOD96gI1oxQdNmBoJ3QXq5eVEnOKp7C5i1OhWMkwIb/TEX/pP3TniXdFetBgRmnTjEPUlnGga8zD1KiycxCKhTIdBh7xPbyDchYcSCZag9by7qdgvjPgG8Dz0CoDekkb3fT7joeeLyq433qkCxlDiH5LUzRpwCvrh8JQNgP8YU2xBPdiUCBUEhUU2hqdP19OQ2MgeDwUGLYdiWeukkSVE3+VvzJpRIxzbcOnB2okKKVXmsmxCzxdwS7OF52eSfzRScdcwzMTqWARkktrfJdtRRsjLGYHHpWH1ATLqBuW4dL4J8CKoIWN3YnySkDc4PEVgGPAyk0xtIHl0WbkOiicbNzm4togtbypYr6mnjFWHcIAEznPq73+25lhhO/AaJ/spnlhBZc7On/sqGdy4xfNSI4ndwfb/PI9Ux67qRRa0wr4nC+KbTnoOFhnSbDwtX1WBmJP36G1qRRR1aZqE+cbwvt7vhrff6s1NNGI1nBpLZikx4O6N/eODYZSECEjyEVu66xyZu/V1oU7qZIzlyrVWsW5v7zu9z2Vkyb0ECA9rhNVhziot/4mE4QgQjsDFiXHVre0AwKiRoCcYtP4/e+i2Fl5WzYFgs2vhitJ33Yk52Ix9Pb1rPjrs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(316002)(31696002)(66476007)(26005)(8936002)(86362001)(38100700002)(2906002)(478600001)(36756003)(66946007)(41300700001)(54906003)(6506007)(83380400001)(66574015)(8676002)(5660300002)(31686004)(4326008)(6486002)(110136005)(6512007)(2616005)(186003)(66556008)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3hWWXo0UDRzTTdHcU1XM1V0UmNxSTR1UXYvdGhuMEc5RkFDNkswSzZzREI2?=
 =?utf-8?B?Um1CVkZ1eDdDYXp6Vm1naXpuOE9WL3hLL1oyZklwdjZ6dlpHMkpMaWdMNkk5?=
 =?utf-8?B?dDEyTll3WHRlanM5L3lvdzNUQzl0aWVKdWc1MkFRTUo4cDlzb2JnU3cvMG5E?=
 =?utf-8?B?WTBZbDNnZTU4YjJnSENMZUdIdWN1TE9CSU5abTFreVRJdXJ2eHZQS01HWVBM?=
 =?utf-8?B?R05MYzN6VFpJcitxMlVmaWdETEZDRVFNempvRGZnd1E4TXVReUJMbzZEaDVS?=
 =?utf-8?B?ZytmaVVLbkUyQmx0VW01SndjcGVsQml4Lzl5SEwvaHVJcDhlWElWWW03UEJ6?=
 =?utf-8?B?M3NoMVhRU3pNSWhVMHRYV2JDYzFtUjJkTWRQenNWQ05YQXNPS0pqK0FJdHJi?=
 =?utf-8?B?Yk8rOUh4ZW9GY2ZMdEM5dU9OTnFpam56ZXg4MFFydWdxWHhTSXN4Q0E4dmVi?=
 =?utf-8?B?NUMxM2RNYWkyNkxMbDAwbXBZK2pCNGNVa3B2SWZ1TW1NS3NveGpVMmJoSU1a?=
 =?utf-8?B?bVlPNUFGRmNQaTVpRDN2Q2VkckZ3d3BzRmF5K1hrSjdGbnJnVzRpZnIyVFRr?=
 =?utf-8?B?VXcwRGpMTmxxMW9DTTg2Wlcxd1g1TkZXN2RnK1lvZ2o3djZmeFVJVmZiMnky?=
 =?utf-8?B?UmJjOW5hdHlaZEU1VVJYU1VaQjM5Z0NXdm83M3N6RnBLcStCb3ZRdzcveWx4?=
 =?utf-8?B?NTdFMjhnMklLakdrL0VuVTMzKy9oNWlldDd4bEdjTjdwMWEvUGFxQ3h4T1V5?=
 =?utf-8?B?VzBVYkpQRkhTSGdrVU90SmdXQWN5d1VZcGE0VlY2Y1VSQkxRR1VEZEZ2YVA4?=
 =?utf-8?B?UG9odHBvbU4yRGdxYlR6WWFwTkJMdFh5ZjloNFBaT21rRUljbXVhK1hsMXFG?=
 =?utf-8?B?MlRmTkNSWkNSR0huODB0NzVSak9Obm5aVzAyM2hxNjhUUm5hOCs4YWdBNmxM?=
 =?utf-8?B?SVZFSUVNM2dxb2djVnA5R2VSWVV2M3NWOGt6R1J0TytzZzg0ZEtybnBQOHRL?=
 =?utf-8?B?dXN2NnlEbFRDeXV1cVhhTFFQVlpZazVDaWVvZUFDbzFBQWR1ZGNMaytpc2xL?=
 =?utf-8?B?ZnpSYkVnVkRNTVpsNTlJTld5UUR6cklnUSs5M0JoaG1lZlRRUHZyNGhiZWxw?=
 =?utf-8?B?T2RNbVJnVjNDOVdaOVdhMFQydS9rTzVJcW41ZzlibUg3Z0oyNWg4dHRleG1S?=
 =?utf-8?B?V2dYZHlhTmRlN3ZBNWR2c0hBeXZOQ1B0am5udCt2cCs3Y0JuU25jRU13WDF6?=
 =?utf-8?B?dWdKdTg1eTk2NjYwd2hTNVZka3BwYlBITmRQZTFHRVUrQ1FlemJKZElIbmgw?=
 =?utf-8?B?bVgrZnBTNm40bFpjUVh4czJzektXVC9YUW42MFhmdFRPN0RLNEVCK1NDOXEv?=
 =?utf-8?B?N0UzcWs0ZVdXbVBLNVovQ1ZmQmRuakJyVHNuL0E2cERoNlFYeHFoUjl2Vk9L?=
 =?utf-8?B?a2ZtSGNUbGFoVjBFSkwxUkRXTk1BRlFLbkdjM0R5SFluUy9xZ1JGbG9MNGZ0?=
 =?utf-8?B?aHYrYWk2WG0zMlprY3h0QU1LMDVHVUhYTjVrbjB0M1NVNVRCbUFQbmFBQnBr?=
 =?utf-8?B?aVVDTnhHQXFqcjhhQXVCUStNN0pSVzNxck1PNFhYMjRRMzJsc080R3N5d2Zz?=
 =?utf-8?B?R2hNbHhJeGR5ejN0c2J3NVlVa2pZZyt0bkNVR0FoQ0lZN05WaThZVzVNMklv?=
 =?utf-8?B?elVUeitGQzJQVTBvbHhra0k5NStFWGxVU1NodTFyNVV5Z0FqN2ZPODdEcE51?=
 =?utf-8?B?Y3NkUWJOakNXMFhZUFd0TmEzdVY2MVUrTW9uUmVqVml0c3VBZHMyeDNNUldO?=
 =?utf-8?B?NTlZU2dUZ2lIQkNZZDZLVFNmRmk5cEJpVWRuZGlSd1R0Q0pHd1FtOXN0aVZG?=
 =?utf-8?B?MVZ3TVhNeTRNc0E2dDEyTmpYa0hpQkdDME1VYmhOWkxWczRmSXkySGhrbDd3?=
 =?utf-8?B?bERxS21DdnpqdlBHenRVSnVrT3FPNlNUZ3VnQy85ZHEyd2MyT1M2RnZOYmZN?=
 =?utf-8?B?TUFIdkNxb2JiV0lkMy9nRjhtaWc5WnpicmFTc3VXQU0ybWpPZUgyaDV4WmdM?=
 =?utf-8?B?N2lKVjRsM2pHa1RQb1FZcVljUDduZlNTVGlxSjRkRnFMNjQxZC90bWNyTDVL?=
 =?utf-8?Q?nk8KueZQ4zyVRgGHP0nZrAR1W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9206c228-2d66-49bb-27ba-08da55173d51
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 12:52:32.9402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJcUBIToynekO4bPRFH4MWl5iNZbaoat3sS1rbTvPbJOJbQzsDnOkT8kaqX3NkYa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2555
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.22 um 14:14 schrieb Lucas Stach:
> Am Donnerstag, dem 23.06.2022 um 13:54 +0200 schrieb Christian König:
>> Am 23.06.22 um 13:29 schrieb Lucas Stach:
>> [SNIP]
>> I mean I even had somebody from ARM which told me that this is not going
>> to work with our GPUs on a specific SoC. That there are ARM internal use
>> cases which just seem to work because all the devices are non-coherent
>> is completely new to me.
>>
> Yes, trying to hook up a peripheral that assumes cache snooping in some
> design details to a non coherent SoC may end up exploding in various
> ways. On the other hand you can work around most of those assumptions
> by marking the memory as uncached to the CPU, which may tank
> performance, but will work from a correctness PoV.

Yeah, and exactly that's what I meant with "DMA-buf is not the framework 
for this".

See we do support using uncached/not snooped memory in DMA-buf, but only 
for the exporter side.

For example the AMD and Intel GPUs have a per buffer flag for this.

The importer on the other hand needs to be able to handle whatever the 
exporter provides.

>> [SNIP]
>>> Non coherent access, including your non-snoop scanout, and no domain
>>> transition signal just doesn't go together when you want to solve
>>> things in a generic way.
>> Yeah, that's the stuff I totally agree on.
>>
>> See we absolutely do have the requirement of implementing coherent
>> access without domain transitions for Vulkan and OpenGL+extensions.
>>
> Coherent can mean 2 different things:
> 1. CPU cached with snooping from the IO device
> 2. CPU uncached
>
> The Vulkan and GL "coherent" uses are really coherent without explicit
> domain transitions, so on non coherent arches that require the
> transitions the only way to implement this is by making the memory CPU
> uncached. Which from a performance PoV will probably not be what app
> developers expect, but will still expose the correct behavior.

Quite a boomer for performance, but yes that should work.

>>> Remember that in a fully (not only IO) coherent system the CPU isn't
>>> the only agent that may cache the content you are trying to access
>>> here. The dirty cacheline could reasonably still be sitting in a GPU or
>>> VPU cache, so you need some way to clean those cachelines, which isn't
>>> a magic "importer knows how to call CPU cache clean instructions".
>> IIRC we do already have/had a SYNC_IOCTL for cases like this, but (I
>> need to double check as well, that's way to long ago) this was kicked
>> out because of the requirements above.
>>
> The DMA_BUF_IOCTL_SYNC is available in upstream, with the explicit
> documentation that "userspace can not rely on coherent access".

Yeah, double checked that as well. This is for the coherency case on the 
exporter side.

>>>> You can of course use DMA-buf in an incoherent environment, but then you
>>>> can't expect that this works all the time.
>>>>
>>>> This is documented behavior and so far we have bluntly rejected any of
>>>> the complains that it doesn't work on most ARM SoCs and I don't really
>>>> see a way to do this differently.
>>> Can you point me to that part of the documentation? A quick grep for
>>> "coherent" didn't immediately turn something up within the DMA-buf
>>> dirs.
>> Search for "cache coherency management". It's quite a while ago, but I
>> do remember helping to review that stuff.
>>
> That only turns up the lines in DMA_BUF_IOCTL_SYNC doc, which are
> saying the exact opposite of the DMA-buf is always coherent.

Sounds like I'm not making clear what I want to say here: For the 
exporter using cache coherent memory is optional, for the importer it isn't.

For the exporter it is perfectly valid to use kmalloc, get_free_page 
etc... on his buffers as long as it uses the DMA API to give the 
importer access to it.

The importer on the other hand needs to be able to deal with that. When 
this is not the case then the importer somehow needs to work around that.

Either by flushing the CPU caches or by rejecting using the imported 
buffer for this specific use case (like AMD and Intel drivers should be 
doing).

If the Intel or ARM display drivers need non-cached memory and don't 
reject buffer where they don't know this then that's certainly a bug in 
those drivers.

Otherwise we would need to change all DMA-buf exporters to use a special 
function for allocation non-coherent memory and that is certainly not 
going to fly.

> I also don't see why you think that both world views are so totally
> different. We could just require explicit domain transitions for non-
> snoop access, which would probably solve your scanout issue and would
> not be a problem for most ARM systems, where we could no-op this if the
> buffer is already in uncached memory and at the same time keep the "x86
> assumes cached + snooped access by default" semantics.

Well the key point is we intentionally rejected that design previously 
because it created all kind of trouble as well.

For this limited use case of doing a domain transition right before 
scanout it might make sense, but that's just one use case.

Regards,
Christian.

>
> Regards,
> Lucas
>
>

