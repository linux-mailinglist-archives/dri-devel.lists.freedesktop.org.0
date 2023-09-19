Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963DC7A5B88
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DCB10E365;
	Tue, 19 Sep 2023 07:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F235B10E361
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 07:47:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJlVjouwQXY1qMvP0hLwVlAxpZ+XgkeUk0SHQbja7fQQ5qR88w+HpWaeRXH5n2FM2PQn4CzdBppWguB9HZkOisNfUtM6tKL+Nicn693zeb0SHazin00yAJoYMRo4jdHWSFF/KXXHhZ35a8rxNvDTAutC2PeB22y5O3Mqr+YzckWiAWwZ07jvYmLAynxgEE6P93/scAOy7sMxDN3TS0S0D5/aREHO4XKjM6zVdw6aJos7KcdP7XBMYL9//MgRC1WMDh9YTQhrF8NueaBkKM4+uIabZEx5itSbQUneDaXGTQ55U3KUxPHt3ZVtKVcefBNioWuL5lK5r1hz2dxVUrCxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkcJqXXfC99JwfYndP+iNyDbD7jCifoW7kOaRfcSdkQ=;
 b=LapVJ4oXUvmDnAM+3P58gfwWuJpy3XfQceP4Y6uqqMoi2bReOzt/lI5qbLRKJt/kJDZbbEcHmDrOydPO5wyQKdTl8EJ/xRQ0Wmo1zL55Q9+VHlX6SDx/Xs/qRP/nfoQPtSU9D0xc0c8OsHhTaA9+2qAVTRq08n3plnYboTQxXFQs1Ig45nnP5MkKhiAEImu9gmtQ/+LvyPsO2H8Mf01u7Tlo5ZExJyn9plKJBLJrDTMf1gdeeU1sN+f5CLlADyAxsE/1KIscLa9lea/vWi6YXB/j11IGtBDOfOelqYPXBkfHhnh4eVtAsz2lXPOdTe8apqc66x5vmB1MPwiQgGo5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkcJqXXfC99JwfYndP+iNyDbD7jCifoW7kOaRfcSdkQ=;
 b=wzeu9uUUM2Av1fAF4cSqyCTQErxIi5voKFykhKLh3LboGHmtfYaWSrjJdSLGmCZGgBzXlHyvuVVG6JuI8xQc6XgXYwK+23yoVrA2yZGComBOMYTJ/XW8F6YpClVvdteHxiYigcyPXokbATOafmYyDVzxGXqFClrfSpAJQRyp3KE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8041.namprd12.prod.outlook.com (2603:10b6:8:147::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 07:47:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 07:47:31 +0000
Message-ID: <beb209b5-fb67-5b53-62b8-bc1c78b41cc5@amd.com>
Date: Tue, 19 Sep 2023 09:47:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Decrypting tt maps in ttm
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zackr@vmware.com>, "alexdeucher@gmail.com"
 <alexdeucher@gmail.com>
References: <15c9beb5f8dcb091b00c35d6206b84aa100d729e.camel@vmware.com>
 <60f15275-ebfd-2fd6-64c4-c8907520e5dd@amd.com>
 <3fa9b4d0-e12a-59b6-14c5-68f7406df129@linux.intel.com>
 <fc935b9f-9b25-bcab-717c-0c31373fcfee@linux.intel.com>
 <e9ba0f7a0620cd252adfc1df43cd15d16dcea74d.camel@vmware.com>
 <883309f9-fcd3-51c5-52e7-3e0ae5650cba@linux.intel.com>
 <CADnq5_PPAZqusAoMTrG3OE3seZTQZbj1HC1u-4d5hcCQHsPD0g@mail.gmail.com>
 <b8fa7c6a4cd01fdfabef512972f79b67a1cbe58c.camel@vmware.com>
 <5efd9a5d-7c88-855a-8a2f-5d984ea4a5e7@amd.com>
 <53e09f13-eb54-9662-a511-77c012df9646@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <53e09f13-eb54-9662-a511-77c012df9646@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: 90114e43-ae02-40a9-7730-08dbb8e4ade2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6K2zwu1dyQqatB3gHrrFA0XioiLVLWeCODPDxK51xo2pN8fwYhx5fJYB29rwCO4j33siLOZv7nEzV0hX7QAHyuMJSGCvTZITe2k4121SBO8uDX2w1xudlAAJft+QISTdiUJPenuPXs9tz+f9Z1flB7zHSUwQ6Ms8S3fpBH0KPcyY/0JHIwsApyO/B3BgEj233I6SCKSai+6Qmn4TZuE9r+mPLU+FQO6sOO37oQGXRLh4saAs8x0wFuMGbN+ZtGNUUKSgLsnhxn1YdHA1VubvvtgXwc9ACCoiglJuxYY67WSgM8jotX6xN6Yy8/512j9f2wcT/1t5Pu8oySeu9CHgMBpoYw1TaukI0e8wetUw3h/U1m6wMc+vIUX+C9wBnwslUe6SzpCF4n+ba88P778e7RJdLXdYZ/HG2dWB+MlfEo9xK1SlOLJaICJ+ZDwAnZvmyI2AD2h+vhnhaDz+PP6QwTMqtKrPSW4J6Mu21pQNzPxhO9aCgW8JxJVk5J4XQyt2lLObMw+kTIO2q3ioKfH2xYyPVN4kDfW0s26gicU1WLXcXygySvHqBok7Mwp1y69Tj3qgQg+JUSnKP4HA9hzU8vBjS2MnWYgOGXXPQHr4VLO2ltrW2/bT/TN9imhzdGS8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(39860400002)(376002)(396003)(186009)(1800799009)(451199024)(66574015)(83380400001)(6512007)(26005)(2616005)(316002)(41300700001)(110136005)(66946007)(54906003)(66476007)(66556008)(5660300002)(4326008)(8676002)(8936002)(966005)(6666004)(53546011)(6486002)(6506007)(2906002)(478600001)(31696002)(86362001)(36756003)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S25UY00wWGJjSTR5UlBWR0RKRzdqdFg3akZZL0NlNnpuTjlLaVVGcGNxdFZh?=
 =?utf-8?B?VEtSOWl4QkduSHZSQmJja25PNDRDbW1lK280bHVBZVl0THI3ekZSeG1BMFhC?=
 =?utf-8?B?enJvYURPWGQ4R1hkQmZBaGZJWHZsZ2srZXQrVVNZNlBVMWVmcGhjUW1Lekdm?=
 =?utf-8?B?d1pNcllPNURJR3kyQkdyTzZLM3ZxWlhzVEdPRTU5aUF3dDZOVi9uazB0WlNo?=
 =?utf-8?B?RnkzOWV1VlJzeCtqWVRVemVxOGxhMFVsZ2NGOFJVS2xIVWd1OGI1TTdKUjBa?=
 =?utf-8?B?QmFCTkhkRWVrL1VNOE1kL2RkcGlaWXpKTFdZa2dmYTd2NUR4ZXdKK2prMVFC?=
 =?utf-8?B?b25od281S3QxUW4vdDladFZWQnpDM2VSUzJWYjdsc3hiQW9IWWxSazM3Q05w?=
 =?utf-8?B?VDRSVXZtUTJPcEZ6R0hrYXFWLytLdDdlN3pDdXA2bEZVNlpSRTdhZngxUzhY?=
 =?utf-8?B?STRJdXppUzVTMkMzb2lVUEF0dFpQUWY3Zytib1g4dlB4RS9xOW9VTWlQdkRu?=
 =?utf-8?B?a1pWQjM0WW4zRWhzWGpCSmxUZE1lZi9JeElnVUJaZ1VqeCtwMGZWdGU5bWZy?=
 =?utf-8?B?SWN0dWsyWjVlUkZ4alpvMkJpU0t3OFM5Y1ZwRXVGQUdPV1J1TTZmZjlqZUVB?=
 =?utf-8?B?T09TOXo4dDR1U2ZmWS9ERmtQYXF6d0tlSEZqbmtOWHJUQTk4ZUI2L2Z3Mm5G?=
 =?utf-8?B?MzJLOFltWmRqeldVdWxYd0VVQjhPN1Z4R0x2MWlQRDRBbXRkYVFvUC9MMDcy?=
 =?utf-8?B?UVloK2lZZ3lGY2EzYXI3OHB2Lyt2VnEvR2w3cWozNzdmVC9yNUwra3JDbHZz?=
 =?utf-8?B?QWxkM0dUSHN5WDB1QUtyRG55Qm5YNmZSWjZBMk8ySThwS0crbG51QWYwYkVR?=
 =?utf-8?B?MGE2VFBaOFZoci9pZnViYkcrRGNCSXkxS3NoZTk0dDhYczZmM21saklvZ3Az?=
 =?utf-8?B?Q0F6aGNTT3Y2YWJnWlpVVDNleWthMVFnb0pGTStPVmhmdU1VbHlncnhYV0Va?=
 =?utf-8?B?aTdiYlR0NlRLcGlZWTVkc05vTXl1czU1L3Vzc1M5elk2dDU4a010L2FSbXVY?=
 =?utf-8?B?NUk1WHdiNnZiRDNFSUhnZ3lrV1dxRVlkL0tlU0NVSU9zNDN0bUo5SU5YSUVq?=
 =?utf-8?B?bUhSZE15VU9DQW44L2lUOXFDSWFvNjBYLzdrQnVZMkNheFRuOXpsSGIxVm9z?=
 =?utf-8?B?WWNKdHZkZHcrejBtZEg5SWtTLzkzcWNIVEZ1QStEcWQrS29JcEdUMlZvdEVm?=
 =?utf-8?B?Wll2dFpubHgzR1YrOUVjZklNdXFBNktnZndEK3ZMenhBR1hBbXR2N1ZMR3lI?=
 =?utf-8?B?b28ySjRjREx4bVRKWkRHN2ttY3N0VTZhUlU2Wkkvc1FZaGhCZ0ZiQUhRRUgx?=
 =?utf-8?B?Yy9ucTZxdFJsS3JKZDROZU9VMENGSkdlbEsxWWVhWVgzOFpuUExTZXc5Mkdw?=
 =?utf-8?B?eW1xa2FoZUlrRjFReGhCUmxldTB3QUpuak8xd1QyRTl5TFJYSXkva0ljU2hw?=
 =?utf-8?B?aUVER3JGWlFuS0pnTWw4R3dhV3Q5NXhrWUtzcnJiOXFzM1RSMHc5NjR4QjBz?=
 =?utf-8?B?YWlVb0I1Qk9xa0xxeWtVU3dmK3FCSWtHVGRtWWp4L1FuY2hKR1QxZU13UWVn?=
 =?utf-8?B?MmU2aHlnbU0vMUs5d0kxSFNzVEtoYXg2OXVJWVc5TXZ3aENGWjU4UGFBS3NY?=
 =?utf-8?B?Y1RDaVJLRDFnMkFjZ0JZdFdUUFZtRkdlWGdFTkxjc1lIekN2MEJKYnhBLzhw?=
 =?utf-8?B?Rkw3Ukxaem5SSEFGbmZBSUlOMkFtZGxseHpEZG1nVVphUW9mS3pZMXh1cnZJ?=
 =?utf-8?B?a29MKzdEYkFlbGF1TTRjRmFYMkc2SVdSV0VsSFMzRmE2WVdmRURwckRCMlFn?=
 =?utf-8?B?QmZSZDkycndUZHk5eGl2MmdoK2FTdGt0OVF2WUVKTkRXYjBScnpONVRXUVdB?=
 =?utf-8?B?T3dHZDYzOGhwRXVQTno4Q3J6YVArbWtQZTAxMk5zdWlRbXovNGxMWXJtSWp3?=
 =?utf-8?B?QzJIUWhwMGhOd1lMZnZaV2FlTlBzaHJHRGY4RktNTDhkM2NIZjdsL21tWXZU?=
 =?utf-8?B?TSszNzdQN2o5eUlES0JvRndudWtvODB4YVdscU1VM04vbVBlZGtDNGZ3Unk1?=
 =?utf-8?Q?iJBR7yS3BX9DJKlSCByAxoqox?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90114e43-ae02-40a9-7730-08dbb8e4ade2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 07:47:31.4786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FC7C6rw13uOKybOmJF3rSbI83cLjtoFLa8gBOwtcbtduppsMudi/bI01IV5UgrXX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8041
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

Am 19.09.23 um 08:56 schrieb Thomas Hellström:
>
> On 9/19/23 07:39, Christian König wrote:
>> Am 19.09.23 um 03:26 schrieb Zack Rusin:
>>> On Mon, 2023-09-18 at 16:21 -0400, Alex Deucher wrote:
>>>> !! External Email
>>>>
>>>> On Mon, Sep 18, 2023 at 3:06 PM Thomas Hellström
>>>> <thomas.hellstrom@linux.intel.com> wrote:
>>>>>
>>>>> On 9/18/23 17:52, Zack Rusin wrote:
>>>>>> On Mon, 2023-09-18 at 17:13 +0200, Thomas Hellström wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 9/18/23 16:56, Thomas Hellström wrote:
>>>>>>>> Hi Zack, Christian
>>>>>>>>
>>>>>>>> On 9/18/23 13:36, Christian König wrote:
>>>>>>>>> Hi Zack,
>>>>>>>>>
>>>>>>>>> adding Thomas and Daniel.
>>>>>>>>>
>>>>>>>>> I briefly remember that I talked with Thomas and some other 
>>>>>>>>> people
>>>>>>>>> about that quite a while ago as well, but I don't fully 
>>>>>>>>> remember the
>>>>>>>>> outcome.
>>>>>>>> Found one old thread, but didn't read it:
>>>>>>>>
>>>>>>>> https://lists.freedesktop.org/archives/dri-devel/2019-September/234100.html 
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> /Thomas
>>>>>>>>
>>>>>>>>
>>>>>>> Ugh. Now starting to read that thread I have a vague 
>>>>>>> recollection it all
>>>>>>> ended with not supporting mapping any device pages whatsoever 
>>>>>>> when SEV
>>>>>>> was enabled, but rather resorting to llvmpipe and VM-local bos.
>>>>>> Hi, Thomas.
>>>>>>
>>>>>> Thanks for finding this! I'd (of course) like to solve it 
>>>>>> properly and get
>>>>>> vmwgfx
>>>>>> running with 3d support with SEV-ES active instead of essentially 
>>>>>> disabling
>>>>>> the
>>>>>> driver when SEV-ES is active.
>>>>>>
>>>>>> I think there are two separate discussions there, the 
>>>>>> non-controversial one
>>>>>> and the
>>>>>> controversial one:
>>>>>> 1) The non-controversial: is there a case where drivers would 
>>>>>> want encrypted
>>>>>> memory
>>>>>> for TT pages but not for io mem mappings? Because if not then as 
>>>>>> Christian
>>>>>> pointed
>>>>>> out we could just add pgprot_decrypted to ttm_io_prot and be 
>>>>>> essentially done.
>>>>>> The
>>>>>> current method of decrypting io mem but leaving sys mem mappings 
>>>>>> encrypted is
>>>>>> a bit
>>>>>> weird anyway.
>>>>>>
>>>>>> If the answer to that question is "yes, some driver does want the 
>>>>>> TT mappings
>>>>>> to be
>>>>>> encrypted" then your "[PATCH v2 3/4] drm/ttm, drm/vmwgfx: 
>>>>>> Correctly support
>>>>>> support
>>>>>> AMD memory encryption" solves that. I think getting one of those 
>>>>>> two in makes
>>>>>> sense
>>>>>> regardless of everything else, agreed?
>>>>> Well, there is more to it I think.
>>>>>
>>>>> IIRC, the AMD SME encryption mode has a way for a device to have the
>>>>> memory controller (?) encrypt / decrypt device traffic by using an
>>>>> address range alias, so in theory it supports encrypted TT pages, and
>>>>> the dma-layer may indeed hand encrypted DMA pages to TTM on such 
>>>>> systems
>>>>> depending on the device's DMA mask. That's why I think that
>>>>> force_dma_unencrypted() export was needed, and If the amdgpu driver
>>>>> accesses TT memory in SME mode *without* pgprot_decrypted() and it 
>>>>> still
>>>>> works, then I think that mode is actually used. How could it 
>>>>> otherwise work?
>>>> For SME, as long as the encrypted bit is set in the physical address
>>>> used for DMA, the memory controller will handle the encrypt/decrypt
>>>> for the device.  For devices with a limited dma mask, you need to use
>>>> the IOMMU so that the encrypted bit is retained when the address hits
>>>> the memory controller.
>>> How does that work on systems with swiotlb, e.g. swiotlb=force, or 
>>> i.e. what would
>>> decrypt the ttm tt mappings when copying between system and vram 
>>> when iommu is
>>> disabled/absent?
>>
>> SME makes it mandatory that all devices can handle the physical 
>> address used for DMA, either native or with the help of IOMMU.
>>
>> Hacks like SWIOTLB are not directly supported as far as I know. Maybe 
>> somehow SWIOTLB manually decrypts the data while copying it or 
>> something like this, but I'm not 100% sure if that is actually 
>> implemented.
>>
>> Regards,
>> Christian.
>
> A bold guess after looking at various code and patches:
>
> 1) Devices under SME that don't support the encryption bit and SEV:
> a) Coherent memory is unencrypted.
> b) Streaming DMA under IOMMU: The IOMMU sets the encrypted bit.
> c) Streaming DMA with SWIOTLB: The bounce buffer is unencrypted. 
> Copying to/from bounce-buffer decrypts/encrypts.
>
> 2) Devices under SME that do support the encryption bit (which I 
> believe is most graphics devices in general on SME systems, not just 
> amdgpu; it "just works")
> *) Coherent memory is encrypted. The DMA layer sets dma addresses and 
> pgprot accordingly.
> *) Streaming DMA is encrypted.
>
> So the bug in TTM would then be it's not handling 1a) and 1b) correctly.
>
> Remedy:
> 1b) Shouldn't be used with encryption.
> 1a) This is what we should try to fix. Exporting 
> dma_force_unencrypted() didn't seem to be a way forward. Properly 
> fixing this would, I guess, mean implement the missing functionality 
> in the dma layer: For vmap / kmap we could simply reuse the virtual 
> addresses we get back from dma_alloc_coherent(), but for faulting one 
> would want something like dma_coherent_insert_pfn() (if it doesn't 
> exist already) after a proper disussion with Christoph Hellwig.

Christoph once pointed me to dma_mmap_attrs() for this, but I never 
found the time to fully look into it.

Christian.

>
> /Thomas
>
>
>>
>>>
>>> z
>>>
>>

