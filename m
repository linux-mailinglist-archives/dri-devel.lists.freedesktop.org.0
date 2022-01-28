Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3A149F6A5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 10:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E343410E478;
	Fri, 28 Jan 2022 09:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD0010E455;
 Fri, 28 Jan 2022 09:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtorvoGgSbXqLeo9DfMJ4jNntvb1vcHwa2jTxxIC9sXE1jb+25dc1jtXGBZX454cqHTld2mVwlyYSCPLKPgZwZagNviBTuY2IL7jj2Ko6mv+2fjgtiQAxKevFUDxvI3nnJeGw9QNsjvD3XbG0adGfDSTl1Z2BPqr74s6Df+Sb+c8xHbtpw8iCnwHwSBdFdSkq+qdw+WsAeyMq9VJEA68pYgxUO73teOsEmA8BAPuRDvOuCiiTLYjsszumwxxI1cUlHbxjm3tBRjzg3nmFBhL+xTWOPRc/PnrEqg8WGczNiLEr6Va8y7quyaJfYk88gkCGWQjQ78Wy2W905rqf/RXvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0o9tu1VgJrar7AeBbB52p0jzMqz24aZEMx1rMpqARo=;
 b=k0ndF0e0fL/7V/TBIRSiPs/4dRyZjs1O9o6zKH5Oqlvpfm35uqXXCQ5a873s8hdtsrewZAQeIKCOSTIFC9Xy5nPk2EU8VyvwjkpHOyzceMGQWZpfgvWq/mvTZOZDIgMLORhdHJb31A+Y1eyYs6D9zgRfzbQBs3PUxCQquq4Tw9NBBnHsTWuE+C0ItB1UXEKYBTxmP5ARQw0U5SvrRS7yoV4siBmOz6mKHWOPTcXBCdALj/2rZP/FIaLG2htcZoOzgNQTchYKA+gfaE9kVd640+sf5kEmESgcqCQxJfFMmUepjsjx3sjdEKs+ztWZqopYGe+eHvBO1maNOmPSWBlkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0o9tu1VgJrar7AeBbB52p0jzMqz24aZEMx1rMpqARo=;
 b=UthBbmTH8/oTb738GzvG7p1/Houp1555W3YHSZchcjYeWGZTjNJNbUQq4YOO8peeoav/a0/jQG2MebQLeOZKaEl6Toc4+xvlX6gumH5mEWVSPuzUOUmsSLBuU4b3CoppzyKjjkJwqdUc/64x+0rK2IIsbKthbSz1oXrjPYiM13A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Fri, 28 Jan
 2022 09:48:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Fri, 28 Jan 2022
 09:48:48 +0000
Message-ID: <36a08a90-3614-27b4-166b-9d113b644af3@amd.com>
Date: Fri, 28 Jan 2022 10:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 00/14] Rename dma-buf-map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
 <a45a8cef-f5e7-604c-64f1-e893ec9ba8af@amd.com>
 <20220128091213.qaq6v4vbeerzvd3f@ldmartin-desk2>
 <27870484-6d16-5bd4-aa06-0ec513111d99@amd.com>
 <20220128094018.m7pixeznedoa47gb@ldmartin-desk2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220128094018.m7pixeznedoa47gb@ldmartin-desk2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P250CA0003.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b34f5c64-0f61-4169-6604-08d9e24361a9
X-MS-TrafficTypeDiagnostic: MW4PR12MB5603:EE_
X-Microsoft-Antispam-PRVS: <MW4PR12MB5603E5B774838C416818852B83229@MW4PR12MB5603.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: heoucX+6hmGfxwl2ghaRWec3Q3MHKBTRHA2iSQbSg5LRdIr07L3AdLaiRNluzEfeBdBBrwACk7AiwW3i3DJIUYdOqEJThz20xrpKS7Z1+iVGBgdDiKjqKy9P/nZ57klPXPfdZaCrYPA7RDHBekg3JmCpkj4OmP2vxODfjmoHFyWC4+SPH8l3sRQwLEZ9eARhXJYEl04Uacr8+S+M6Al0/yJ90lRpeyY5Bpju5aA1ylQOfYKuISWZpKQT5K7NK1PrZxIwdCVDFIxEJsxTr1wvuw9eo4d39GlEJozU3L5j7oo57oMdb8RbfVBxycz/19dkPEilj94yoFwdK7jhOGaJm71yLcfDlSZrXOKMGVYHjPx1uNskW8ZrPOLIlZA3L913tzCavkK9MVeXQmZAH8bXi1GYmCPKhajZ7Ckf1eaQ0HcNwmzMDPsfPSJnT6Dhl2rMp4ZJHiPRFeGUjOvKEaQL0ZQIzuEASoR1rHCI/ll4RAcHss/2oUBGD4g7dI4BTducxH0gddw2AlRLJ8X6upJ+FFYOZczUI3DGEqwHxWvkdTjQ2hx0UnnWuYoLtGRzM4s2JNdqyQQA82XfwFcZ0X0IxUBOe3PJgr+pJVNhgPNiAfz9vWA4j3ymW2qc/B3KCnNJN5IcGNwhuM6BvXeV+3rO8IAmZRS3IXnifMDFhsKSTLQpuTIzEY5JIg6ocSk6JucEnj6zR95pIYjET1U4Yi1UAUcZSIGN5au3piBh+/88LG0QjI4z071519PD9tR6b62a0U4vrfplnmPb/Bk2lGzu9fKr7oM+xZVc5s5jASkSipMzjJaD4D7QZJzX/jAmjG4l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(30864003)(2906002)(8936002)(7416002)(31686004)(86362001)(31696002)(6512007)(316002)(6666004)(66946007)(6506007)(966005)(83380400001)(66556008)(66476007)(36756003)(6486002)(2616005)(8676002)(45080400002)(6916009)(508600001)(5660300002)(38100700002)(4326008)(66574015)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjUxaDFORHl6M0h2azBDS2U4RFRpaTBaZGE5enN6TjQrVlRZTHYzRVlsUWxW?=
 =?utf-8?B?MmJPeFpsVTgwWkM2UTZSSkg4anNHeE5GVnljYW4wRG5vamgxSmxPeEFNSVBv?=
 =?utf-8?B?VlB1Vk5vSGxObFB3NG9vRnhtckJ5UUxxRE9rMW1CanJCVDVlOXdOc0JIODZZ?=
 =?utf-8?B?Vk40MkJrQUM1R3M0RmI3aUcwQ1ZxWTJwb2ZEU0Y0OExSdmZma2VnMGpscFVZ?=
 =?utf-8?B?Q0VuZVBGdmxTd3RYNzUxbUxUV0ZVTXlJZDlndFRtWElFZHEzQWtsYlZFNjRH?=
 =?utf-8?B?ZUZ4b2g2K0J5eW1XK0VSV2xTNGhtd2c1WGZ5aEIvc1dXSDJVUFpDVTFTYVVO?=
 =?utf-8?B?RlhTSWFMMUZkdnhxckJsQVhjOEVmYU5sYUVCM2NlaWRsVzBKeGYrK3dCcFlR?=
 =?utf-8?B?dHZYVUlZdlpNamYrdzZTQ1k4WWZYZWttSjhZQjd6SWFPQTJCNHNsMUZ0Tmx0?=
 =?utf-8?B?Q3hJUURkTDNiU3ArS2c5TkpnVit2N2d5UWp4Ny9vT0pYejEyWW9ORlBHSCsz?=
 =?utf-8?B?YjRxQzA2c2JtS1lsektOT2VTYmxBaVh4M1ZRNFZJTnJVeUxyWllMam4yNWNU?=
 =?utf-8?B?cGJGZEhEdjNJdDEwSUdGbnMyQ2owOGNrQjBuQ2R4SDNwV09keEJBd25UYnE5?=
 =?utf-8?B?RndPNGZINGRiTEtVd0taZDNZTHpGSiswRkpySnB4MjdnT0lkK25sKzZ6d2xu?=
 =?utf-8?B?dytFZmFEZmFDMUdwc3pFZ252YVJvSTVTVmRHNm9rcnRCODRKdnpVVzdLbjVy?=
 =?utf-8?B?Q2pRUlFIUXhzQytVT1hHZnNQWXlRK21MaUR0NzdWcEh6djk1dEY4YUpUVmNY?=
 =?utf-8?B?T2E1NWlPc09MUUpESnNYL1h3dmtvcnJoVXhpZTZ0ZDl0WnBVRjVRY01HeU1t?=
 =?utf-8?B?cG1tSGlxbVdsSEU4UkxPZzBqVW4wWjdtdk9GTnh0aUpnbThrWFk4ZjBmWEUz?=
 =?utf-8?B?bUVUeExwbGhGQlV1cmJZK1RaeFd6THlSN0FvVTZpc0RWV0crTFVvQ0VGTUpE?=
 =?utf-8?B?UURqNGxFeGRtb3QyZnpXci9yVUtISW9vblUxMDZQR1p5VnRTUFRqazVnTXJl?=
 =?utf-8?B?cWFQQmtzRWZUalAyd2Z6LzNobHBZMzVyVDR2dSsvYjZ4MVloM3lYZExLeU5Q?=
 =?utf-8?B?b1NiTTAxYU9sS29QVVBYKzZpL1I5L0R6RjJuWngxZnNWS010UXkzamlRQWFE?=
 =?utf-8?B?U3FtY1FNYm1xKy9qUmoxQ1NlZ200c2Zsdm9uZEp2RkF5K1FnOGtWQ2ZhbGFD?=
 =?utf-8?B?a1NIeUpGbnd0WTNaYUhwenVwNG04cGc5S0cxdkFTVW8zaHJPcU1hb3I0Y1BS?=
 =?utf-8?B?OGJITXRSa0QxbXJDc2hrd2NUZ21RMThRd0FINjBkaFk1WTF5OHltWUtTTFUv?=
 =?utf-8?B?LzRReWVtU1NEWXJHTTM5VVI2WDZwMkI0R0xadkdvVi9uNitKenNUNmxWYU5U?=
 =?utf-8?B?cWM1M3NUd1I2Q08yOHlWdk5VVnl5b0Rpd25QOWtESjl4ZUs1cGNYSXdSNFMr?=
 =?utf-8?B?c1BSenVoSjhPWXpLWTJGUDJDd3hsZi9pdklHd2dadDREM0h3cEk5Sy81VTg3?=
 =?utf-8?B?eGMxcmh1aW9GTk0wb25Ga3NMajJQZzlXU2VVZnV2MzJrelhDckU4NjA1TVow?=
 =?utf-8?B?amdOdFJWeUwzaEpKNHJIaVdMQUJqbDlxVzBERmJCRmJTZTFTMWRIV1cyL3Vv?=
 =?utf-8?B?QjhZNmlxWUFGTUZuV0FDRDlqNWsyUERMcFZyRFJRN3hPcWNwWFBtYzgyQjlo?=
 =?utf-8?B?c29NV2daSmRzeWEzNWc5YjdOTVlOa3ptNWUwM3M2dHVIVFNKcWVmQUNXek1H?=
 =?utf-8?B?UndLTkQ4QXREbSt1MlhzZmxMRnpmbWZPQ0k0a1p0MXVJVXM4THJrNzRxQVk1?=
 =?utf-8?B?WEJOMDJhNmxGemZWVTdaQkNMcnd4Z2FGMit6KzhyeE16d213Z0FDbGk3UUZV?=
 =?utf-8?B?c2FTT2RaMmpPWjhnblp3V3huTHAxSmFwZHZicCtFRTVUZ25SS2l4dkZDWk0w?=
 =?utf-8?B?ZFV3bDhJT0psK2NGN1BScHY5MDlOZjdFeUlsV1N6bnJwUWgzZUdxQjdoU0RU?=
 =?utf-8?B?QmtCeXdaYkYwRVpFS0dXZ0VWUEEvNVV3S3dnL1VyaG94UTdjM0Z6Z3NtTklW?=
 =?utf-8?B?UHFOTDRabXZBcUUxWkVGc0ZUYmU5R0FrMk1TRFI0TXR4UmVEd0dJM0dOd1lx?=
 =?utf-8?Q?MhzW6SOzbRa04y+rHCAdKMQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34f5c64-0f61-4169-6604-08d9e24361a9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 09:48:48.0376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2By1b95U4KIOIcPNSC8JkFCMPIMRWIZBBnHnQRaIqIZevoeghMV0TlvT3m5wlB9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, srinivas.kandagatla@linaro.org,
 tzimmermann@suse.de, gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.01.22 um 10:40 schrieb Lucas De Marchi:
> On Fri, Jan 28, 2022 at 10:22:00AM +0100, Christian König wrote:
>> Am 28.01.22 um 10:12 schrieb Lucas De Marchi:
>>> On Fri, Jan 28, 2022 at 09:41:14AM +0100, Christian König wrote:
>>>> Rule #1 is to never ever break the build.
>>>>
>>>> Because of this all those patches needs to be squashed into a 
>>>> single one as far as I can see.
>>>
>>> what config are you building on?
>>
>> Well I'm not building at all, I'm just looking at the patches as an 
>> engineer with 25 years of experience with Linux patches.
>>
>> Just take a look at patch number 2:
>>
>> -static int fastrpc_vmap(struct dma_buf *dmabuf, struct dma_buf_map 
>> *map)
>> +static int fastrpc_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>>
>> You are changing the functions signature without changing any of the 
>> callers.
>>
>> At bare minimum that causes a warning and on runtime this only works 
>> by coincident now because the structure pointers just happen to have 
>> the same layout. This is not something we usually do.
>
> you missed the magic/hack on patch 1:
>
> 1) dma-buf-map.h includes iosys-map.h _at the end_
> 2) iosys-map.h includes dma-buf-map.h at the beginning
>    and initially does a "define iosys_map dma_buf_map".
>
> So, it doesn't work by coincidence, It's because it was done to allow
> converting it piecemeal.

Oh, my. Please never do stuff like that again.

>
> But as I said, I don't really have a preference. When crossing
> subsystems one thing that is hard is that different people have different
> preferences on these things. At least squashing now is much easier than
> if I had to split it
>
> Try to imagine how much complain I received on going the other way in
> 25985edcedea6396277003854657b5f3cb31a628 with
> 2463 files changed, 4252 insertions(+), 4252 deletions(-)

Well exactly that is perfectly fine.

What you do here is applying your personal hack which is absolutely not 
welcomed.

Regards,
Christian.

> :)
>
>
> Lucas De Marchi
>
>>
>> Regards,
>> Christian.
>>
>>> I built this series, full config with
>>> CONFIG_COMPILE_TEST and doing:
>>>
>>>     git rebase -i <base> -x "make -j$(nproc)"
>>>
>>> I split these patches in a way that wouldn't break the build on 
>>> purpose.
>>> There were a couple that I couldn't build without cross compiling: 
>>> tegra
>>> and rockchip. The others were ok.
>>>
>>> I'm not really against squashing everything in one to merge, though.
>>> It will be hard on the conflicts later, but should get the job done 
>>> much
>>> quicker.
>>>
>>> Lucas De Marchi
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> Am 28.01.22 um 09:36 schrieb Lucas De Marchi:
>>>>> Motivation for this started in
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20220126203702.1784589-1-lucas.demarchi%40intel.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C635084a520994d35a16e08d9e2423319%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637789596221829397%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ruHpD3DbyyqQuZIFEQU%2B2RH31OwsdFnn1v7N4z75U0Y%3D&amp;reserved=0 
>>>>>
>>>>>
>>>>> when trying to extend the dma-buf-map API to cover new use cases: 
>>>>> help a
>>>>> single driver with allocations and sharing code paths for IO and 
>>>>> system
>>>>> memory. I'm leaving the API additions aside and first renaming the
>>>>> interface as requested.
>>>>>
>>>>> There are already some users in tree outside the context of dma-buf
>>>>> importer/exporter. So before extending the API, let's dissociate 
>>>>> it from
>>>>> dma-buf.
>>>>>
>>>>> The iosys-map.h is introduced in the first patch in a way that allows
>>>>> the conversion of each driver to happen separately. After all the
>>>>> conversions are done we can remove the old one, which is the last 
>>>>> patch.
>>>>> Another possible way is to squash everything and merge together,
>>>>> but I believe this would make much harder for review.
>>>>>
>>>>> The conversion was done with the following semantic patch:
>>>>>
>>>>>     @r1@
>>>>>     @@
>>>>>     - struct dma_buf_map
>>>>>     + struct iosys_map
>>>>>
>>>>>     @r2@
>>>>>     @@
>>>>>     (
>>>>>     - DMA_BUF_MAP_INIT_VADDR
>>>>>     + IOSYS_MAP_INIT_VADDR
>>>>>     |
>>>>>     - dma_buf_map_set_vaddr
>>>>>     + iosys_map_set_vaddr
>>>>>     |
>>>>>     - dma_buf_map_set_vaddr_iomem
>>>>>     + iosys_map_set_vaddr_iomem
>>>>>     |
>>>>>     - dma_buf_map_is_equal
>>>>>     + iosys_map_is_equal
>>>>>     |
>>>>>     - dma_buf_map_is_null
>>>>>     + iosys_map_is_null
>>>>>     |
>>>>>     - dma_buf_map_is_set
>>>>>     + iosys_map_is_set
>>>>>     |
>>>>>     - dma_buf_map_clear
>>>>>     + iosys_map_clear
>>>>>     |
>>>>>     - dma_buf_map_memcpy_to
>>>>>     + iosys_map_memcpy_to
>>>>>     |
>>>>>     - dma_buf_map_incr
>>>>>     + iosys_map_incr
>>>>>     )
>>>>>
>>>>>     @@
>>>>>     @@
>>>>>     - #include <linux/dma-buf-map.h>
>>>>>     + #include <linux/iosys-map.h>
>>>>>
>>>>> and then some files had their includes adjusted so we can build
>>>>> everything on each commit in this series. Also some comments were 
>>>>> update
>>>>> to remove mentions to dma-buf-map. Simply doing a sed to rename 
>>>>> didn't
>>>>> work as dma-buf has some APIs using the dma_buf_map prefix.
>>>>>
>>>>> Once finalized, I think most of this, if not all, could go through 
>>>>> the
>>>>> drm-misc-next branch. I split i915, msm, nouveau, and radeon in their
>>>>> own patches in case it's preferred to take those through their own
>>>>> trees.
>>>>>
>>>>> Lucas De Marchi
>>>>>
>>>>> Lucas De Marchi (14):
>>>>>   iosys-map: Introduce renamed dma-buf-map
>>>>>   misc: fastrpc: Replace dma-buf-map with iosys-map
>>>>>   dma-buf: Replace dma-buf-map with iosys-map
>>>>>   media: Replace dma-buf-map with iosys-map
>>>>>   drm/ttm: Replace dma-buf-map with iosys-map
>>>>>   drm: Replace dma-buf-map with iosys-map in drivers
>>>>>   drm/i915: Replace dma-buf-map with iosys-map
>>>>>   drm/msm: Replace dma-buf-map with iosys-map
>>>>>   drm/nouveau: Replace dma-buf-map with iosys-map
>>>>>   drm/tegra: Replace dma-buf-map with iosys-map
>>>>>   drm/radeon: Replace dma-buf-map with iosys-map
>>>>>   drm: Replace dma-buf-map with iosys-map in common code
>>>>>   Documentation: Refer to iosys-map instead of dma-buf-map
>>>>>   dma-buf-map: Remove API in favor of iosys-map
>>>>>
>>>>>  Documentation/driver-api/dma-buf.rst          |   4 +-
>>>>>  Documentation/gpu/todo.rst                    |  20 +-
>>>>>  MAINTAINERS                                   |   2 +-
>>>>>  drivers/dma-buf/dma-buf.c                     |  22 +-
>>>>>  drivers/dma-buf/heaps/cma_heap.c              |  10 +-
>>>>>  drivers/dma-buf/heaps/system_heap.c           |  10 +-
>>>>>  drivers/gpu/drm/ast/ast_drv.h                 |   2 +-
>>>>>  drivers/gpu/drm/ast/ast_mode.c                |   8 +-
>>>>>  drivers/gpu/drm/drm_cache.c                   |  18 +-
>>>>>  drivers/gpu/drm/drm_client.c                  |   9 +-
>>>>>  drivers/gpu/drm/drm_fb_helper.c               |  12 +-
>>>>>  drivers/gpu/drm/drm_gem.c                     |  12 +-
>>>>>  drivers/gpu/drm/drm_gem_cma_helper.c          |   9 +-
>>>>>  drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  16 +-
>>>>>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  15 +-
>>>>>  drivers/gpu/drm/drm_gem_ttm_helper.c          |   4 +-
>>>>>  drivers/gpu/drm/drm_gem_vram_helper.c         |  25 +-
>>>>>  drivers/gpu/drm/drm_internal.h                |   6 +-
>>>>>  drivers/gpu/drm/drm_mipi_dbi.c                |   8 +-
>>>>>  drivers/gpu/drm/drm_prime.c                   |   4 +-
>>>>>  drivers/gpu/drm/etnaviv/etnaviv_drv.h         |   2 +-
>>>>>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   8 +-
>>>>>  drivers/gpu/drm/gud/gud_pipe.c                |   4 +-
>>>>>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   5 +-
>>>>>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   8 +-
>>>>>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   6 +-
>>>>>  .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |   6 +-
>>>>>  drivers/gpu/drm/lima/lima_gem.c               |   3 +-
>>>>>  drivers/gpu/drm/lima/lima_sched.c             |   4 +-
>>>>>  drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   7 +-
>>>>>  drivers/gpu/drm/mediatek/mtk_drm_gem.h        |   5 +-
>>>>>  drivers/gpu/drm/mgag200/mgag200_mode.c        |   4 +-
>>>>>  drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
>>>>>  drivers/gpu/drm/msm/msm_gem_prime.c           |   6 +-
>>>>>  drivers/gpu/drm/nouveau/nouveau_gem.c         |   2 +
>>>>>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  13 +-
>>>>>  drivers/gpu/drm/qxl/qxl_display.c             |   8 +-
>>>>>  drivers/gpu/drm/qxl/qxl_draw.c                |   6 +-
>>>>>  drivers/gpu/drm/qxl/qxl_drv.h                 |  10 +-
>>>>>  drivers/gpu/drm/qxl/qxl_object.c              |   8 +-
>>>>>  drivers/gpu/drm/qxl/qxl_object.h              |   4 +-
>>>>>  drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>>>>>  drivers/gpu/drm/radeon/radeon_gem.c           |   1 +
>>>>>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   9 +-
>>>>>  drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |   5 +-
>>>>>  drivers/gpu/drm/tegra/gem.c                   |  10 +-
>>>>>  drivers/gpu/drm/tiny/cirrus.c                 |   8 +-
>>>>>  drivers/gpu/drm/tiny/gm12u320.c               |   7 +-
>>>>>  drivers/gpu/drm/ttm/ttm_bo_util.c             |  16 +-
>>>>>  drivers/gpu/drm/ttm/ttm_resource.c            |  26 +-
>>>>>  drivers/gpu/drm/ttm/ttm_tt.c                  |   6 +-
>>>>>  drivers/gpu/drm/udl/udl_modeset.c             |   3 +-
>>>>>  drivers/gpu/drm/vboxvideo/vbox_mode.c         |   4 +-
>>>>>  drivers/gpu/drm/virtio/virtgpu_prime.c        |   1 +
>>>>>  drivers/gpu/drm/vkms/vkms_composer.c          |   4 +-
>>>>>  drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
>>>>>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +-
>>>>>  drivers/gpu/drm/vkms/vkms_writeback.c         |   2 +-
>>>>>  drivers/gpu/drm/xen/xen_drm_front_gem.c       |   7 +-
>>>>>  drivers/gpu/drm/xen/xen_drm_front_gem.h       |   6 +-
>>>>>  .../common/videobuf2/videobuf2-dma-contig.c   |   8 +-
>>>>>  .../media/common/videobuf2/videobuf2-dma-sg.c |   9 +-
>>>>>  .../common/videobuf2/videobuf2-vmalloc.c      |  11 +-
>>>>>  drivers/misc/fastrpc.c                        |   4 +-
>>>>>  include/drm/drm_cache.h                       |   6 +-
>>>>>  include/drm/drm_client.h                      |   7 +-
>>>>>  include/drm/drm_gem.h                         |   6 +-
>>>>>  include/drm/drm_gem_atomic_helper.h           |   6 +-
>>>>>  include/drm/drm_gem_cma_helper.h              |   6 +-
>>>>>  include/drm/drm_gem_framebuffer_helper.h      |   8 +-
>>>>>  include/drm/drm_gem_shmem_helper.h            |  12 +-
>>>>>  include/drm/drm_gem_ttm_helper.h              |   6 +-
>>>>>  include/drm/drm_gem_vram_helper.h             |   9 +-
>>>>>  include/drm/drm_prime.h                       |   6 +-
>>>>>  include/drm/ttm/ttm_bo_api.h                  |  10 +-
>>>>>  include/drm/ttm/ttm_kmap_iter.h               |  10 +-
>>>>>  include/drm/ttm/ttm_resource.h                |   6 +-
>>>>>  include/linux/dma-buf-map.h                   | 266 
>>>>> ------------------
>>>>>  include/linux/dma-buf.h                       |  12 +-
>>>>>  include/linux/iosys-map.h                     | 257 
>>>>> +++++++++++++++++
>>>>>  80 files changed, 579 insertions(+), 552 deletions(-)
>>>>>  delete mode 100644 include/linux/dma-buf-map.h
>>>>>  create mode 100644 include/linux/iosys-map.h
>>>>>
>>>>
>>

