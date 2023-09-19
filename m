Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B0D7A5974
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 07:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BBA10E3D1;
	Tue, 19 Sep 2023 05:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C730910E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 05:40:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+E2sJjw/7Pu0QEdDmtrSl4nY6J3SDmgUAGxjN/9E+B7s2zKyiP0LX/Xo5QJKT4qioNV3zdYAP4FmiT/iDZzHcd1pGI2BYksgPVqW0LMC+7+YuBzJrDewRqbnzOtgdinREEdL0Oc3oOxCSKko8QYPvzNBJJtd7xcX4gOqovQjqTCCrztpArB0GDwrLCq8uY2acUr1L44kyySnJORAbVp7egCT0ZPRxZhMp5rmPSW48da1mZVkTrEJv2xKJCbvULoHFBCrQb//+fL1uxWZEt4uOVNpA+s8ffbjPLLbef+bVozILfmL/tYLHBXqN+oqynaA+OMX6JRdL88FtaIIJu34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCkUYPUKac1HjteIZxAT2v7o1IAuoRhxWNr6CYMh6Sc=;
 b=ijEQbCA1J4LuOjKz+tI9nMq496hcvDQBEqNFCH0Qs6rIiPRDGuuH0AILBlTakQJ1CxBFtrADM3qzFcSInNEgJZLPSEESOoCsUpQYIptI9UTvST5LkgO5SY4QZXkha2H5xRoa1uVbkpPaumK1qxq/iN7eXM2IroMmHxl130PLQXIowT3YxNVLTrSM/gvzfekT9FNd9C+pcnQEik2JGB6B5SWjV8vo2y9+BsQAvG/oamxUx4v4gNPqJ7Upn9yZNfHCBge080rm+SKgYilsAk5q2R1iBU4nQL1Lo0DKr74xcFVgJn9eHXaF2yj8dmr7fFqOqcxSTsOkxb63B3qCy7R5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCkUYPUKac1HjteIZxAT2v7o1IAuoRhxWNr6CYMh6Sc=;
 b=QPkcZ/ZGMCkhmmfl783xa8optLFYArW0t0MLjxsTn6ZvxRws2r5o+tyD5tqdgXTqV8LCZTYE0wnNXnHHWPAwFc+Z76M0zEJhTcvy/itMwjD7pzu513oqrtQExIXZHYTSxJT3wV3j+de/a+Ce1yAwNhqLaKmHVrnSaeDUuyPV5NA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4933.namprd12.prod.outlook.com (2603:10b6:a03:1d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 05:40:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 05:40:03 +0000
Message-ID: <5efd9a5d-7c88-855a-8a2f-5d984ea4a5e7@amd.com>
Date: Tue, 19 Sep 2023 07:39:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Decrypting tt maps in ttm
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "alexdeucher@gmail.com" <alexdeucher@gmail.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
References: <15c9beb5f8dcb091b00c35d6206b84aa100d729e.camel@vmware.com>
 <60f15275-ebfd-2fd6-64c4-c8907520e5dd@amd.com>
 <3fa9b4d0-e12a-59b6-14c5-68f7406df129@linux.intel.com>
 <fc935b9f-9b25-bcab-717c-0c31373fcfee@linux.intel.com>
 <e9ba0f7a0620cd252adfc1df43cd15d16dcea74d.camel@vmware.com>
 <883309f9-fcd3-51c5-52e7-3e0ae5650cba@linux.intel.com>
 <CADnq5_PPAZqusAoMTrG3OE3seZTQZbj1HC1u-4d5hcCQHsPD0g@mail.gmail.com>
 <b8fa7c6a4cd01fdfabef512972f79b67a1cbe58c.camel@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b8fa7c6a4cd01fdfabef512972f79b67a1cbe58c.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::35) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BY5PR12MB4933:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7b61d3-4b85-49bb-c1e7-08dbb8d2dee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xgsYYTHkBbogeGMh2ND6b7iFWtNzXmfuMF19CZXCb85OE949xqsYhxF8aBkwwMvOAJQzKa4/gpNZguWo5t3f0Ey8WC+tCEbrWU/jc5fpWfCZtRS+eW8Z55AWNShC3hYRl0vUKPSud1JeQct+ZKr/P9WhdZqr7HwKPIeiJybgpiI3AWLMOOpC13Z2T4Qs83eKOT/zNV/9+ow3Uigj6DCePBGCQEfbtzr0ouyc4cWi2ildZsfDqqjGR+IRth7m2Dm98kMp5QMZJj9HAYJ/5ZYuWZlq1OVFD5F+1TRAop5mkXPhpcxJNvs3hjB0ee14BheIvIB5ug95BeVBi30esREnBPNVJjSbkXDi4H4KKSm+aPt04ENMIYBhe8ksicI/qBrYogq8C+8pQ2A3cq/uPf0Rx+snQ5ES3ugCNTF3HtP3+J9X63dYeyCLVGv/wpi1S9zb1EcLBdiHkvtSxghON/5BytkNaZKSuns01KQsOPvfPs+MeaYnX1jImLrCqCw4pufReeEz8o5NhCRVVCrO8E2DUa87cDh9FbFQs4v68n1ARAU1SQKvTXDTeqqJyx3Vn3EoY0xc9s3NSQs9JuKI1fLfBfbDbhz+i1AZOpsCJjow286i/4I3V+MznTXAHZFC4APZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199024)(1800799009)(186009)(478600001)(966005)(41300700001)(83380400001)(110136005)(5660300002)(2906002)(6666004)(66556008)(66476007)(316002)(66946007)(54906003)(8676002)(4326008)(8936002)(31686004)(6486002)(53546011)(6506007)(6512007)(2616005)(26005)(66574015)(36756003)(86362001)(38100700002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXltak5LUlJKaUd0Y3g0S2VjZ0FyWEJmTzVlRVVmVTA1S3pVOXJja1JsMGhy?=
 =?utf-8?B?UmpMMTRTSXROcGYvdGJtWndSWlhTMStPQnpvc0pOU2ZsNUVxTEl6czBNdHAx?=
 =?utf-8?B?L3M5QWZ0NkpRUWtWWWdrWVZLUE0vRURzUHNhalU3S2ovY1E2RnY3TXFES1VU?=
 =?utf-8?B?Q2NVS3BkcWtnTFJ0NFBIWnVwamxPaTBPZUVnUHIrTm1GY0NsV3VFc3k5cG5j?=
 =?utf-8?B?YkRWOFgyOTRraGltZHJRNFRtQVBFamNpRU9ValFmTmJTSHZJQkt3eDIxYS9k?=
 =?utf-8?B?Y1FLTW12cm02aGhZMW5mZUJrVWwrYzQxVnh2M0RGSmMvd1BiOWpQNVN1Wm5o?=
 =?utf-8?B?b2hmVDl5Y1JESGtSS3dRbmlNLy9MaUxzTjFkaC9NSy9GcEdQeDlpV0c2TW02?=
 =?utf-8?B?d2ZNTjV3SXpDTU5JK2ZGRWNVZElxV3dVSityTjNTVHNVQm1leUN0Z0ZNMDJ2?=
 =?utf-8?B?aVRYaGpxa0NMdnA4anBnZU03ZmlZOG5veDM4blJGSldZbDRJeVdzVElGWU1x?=
 =?utf-8?B?Ukhvb21MaFI2aHVYUDBpaVVjbTd6S3lmY2dPTkhDdUNjeG5lSTdlZEx5UVRz?=
 =?utf-8?B?enI0YnZldnRNdzdMMzA4RVljVEgyQzNIR3FISytXSmNRamlJS2VLZzVWblVR?=
 =?utf-8?B?aitCeis1T1FrWFFBOFRJMnQyYzFEbTUvNDBCRzBHbmUrZmdtbWppTVh6Q3cy?=
 =?utf-8?B?bHdmTnFqdnA3ZlBMR282RVdDZVpZWnNsWGtvclFpQnk0cGhnQlFJMkxqeGY5?=
 =?utf-8?B?czZvYTFQRTQrNnBHT1c4UnFvVGc1WHhZVllmN3VpN0gvY1JYajdGVSs1NWlU?=
 =?utf-8?B?eE1pVnE0Q1Rmdmt2R3NNUTBuandvMzFOYjdtWXc0NFpNN1JYcFdFREhHRnFB?=
 =?utf-8?B?dENBS1lEeC82bFBmcmRiRERDT28rUXYybFVSTkREVVpXTXdiR3R6VlQreFUy?=
 =?utf-8?B?aFQxU0JLUUhWcWNiSUJCdmUvSmp4K1Q1OTlhekYrNnprUlA5NUovbFVCYWVF?=
 =?utf-8?B?OFVIeWU3endTS2RXNXJ3YXBFRW16Umw5SmRMTGo5bWZzMUNvRnhTUEdsWS9J?=
 =?utf-8?B?citQNExhcXBodkc1cTFtM3A3UkNMUTVxeXJGcHFkTytQWW9LS2ZJYk1aUjZj?=
 =?utf-8?B?b3BJL1Yrd3VPNTl5aTFiK1I5VFR1cXFTSzNyOVM1M1dUZzd0VitaZ3RMVC9v?=
 =?utf-8?B?YzdubnN3MlRGRzcwL2JwNzZKWjhoSVlJSW5FQzh3RVU5Vm1KZk9XbDhNYTBT?=
 =?utf-8?B?U0hjMnJ1ajNlMHIxenMyaXlaeW05UldxdU1ZMkh5T0RBbDhPOTMyOWRBdVdG?=
 =?utf-8?B?V3FXY2hKLzlSLzZPTkY5c24yRDIvSTRhUzdnckRHc21QWmlVVEozbGVjN1d5?=
 =?utf-8?B?dHR3VHNOSFU0OXAxc01HSmJnYjRpR0lidllvV2crNUMyS1JzZXRkWk16aDJR?=
 =?utf-8?B?SGhNeDloVlNWUFNSZUJBdUl2SXRUeW5lcHdkS3c2eS9BUG9JTkMvQldwSEVM?=
 =?utf-8?B?RFZYK3YyaDJkTlpDTEgyU2JMUi9IaEdwT2JNdXJYSys2OCsvb0lwSHhiWWVW?=
 =?utf-8?B?Yk5odlhyYlM4ZmhYYnk1eEdhblpzSklqc0wyMDVGU1BQWmJiTkpWYmowWmRG?=
 =?utf-8?B?U2hXZ3BJQm9XWVlWUytaWTJiQWRNN2VpclRLUzBIM3Z1ZzB4MWIwUlFYSWVB?=
 =?utf-8?B?eUQwd1lVVnVuanpacWtNM1oxSE1XMXFQaFdWZW9xVEFKS1NXVTlaZFEyOHJk?=
 =?utf-8?B?QlR2QTUxWmVJd0psU3QxR0dnRmNrSkYwNElQVkFzTE1YRDZjTjgxMUNBSzNn?=
 =?utf-8?B?aGJFS3o3OGN5ak1rQjVQc2RqVnFNNVpiY3ZJOVpPZCsrclRabTJTMm1lNmhG?=
 =?utf-8?B?Q1BrYmNwSWdEeEZ4N3hzZUVWWmgwRGxZaW52a0hVLzRwejFMZFRZalZNd3RQ?=
 =?utf-8?B?SFFBNHE3blRiU05RUlQyWlJJdnlEenRZTkoyQmlUcVpvN1JwSXpoRkpwWjdp?=
 =?utf-8?B?VUdwRGhQN29IakVKWnVvbjJmMjN6RTY4YmwyclAvZ3BDSVM2VVo2ekV3bmNG?=
 =?utf-8?B?ZVUwUUV1RVFTaTA3Nmx1TEgvZ2RvQzNPc0VkWkJwSmpZV3VPODR4eWRTa3NO?=
 =?utf-8?Q?fWoI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7b61d3-4b85-49bb-c1e7-08dbb8d2dee2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 05:40:02.8536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r22aGLp13f2m8YE7zE1s5hQZ+6a7FWMDq6pcy8Dd9VTGBueAyWbIzFlT/F4Tmarw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4933
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

Am 19.09.23 um 03:26 schrieb Zack Rusin:
> On Mon, 2023-09-18 at 16:21 -0400, Alex Deucher wrote:
>> !! External Email
>>
>> On Mon, Sep 18, 2023 at 3:06 PM Thomas Hellström
>> <thomas.hellstrom@linux.intel.com> wrote:
>>>
>>> On 9/18/23 17:52, Zack Rusin wrote:
>>>> On Mon, 2023-09-18 at 17:13 +0200, Thomas Hellström wrote:
>>>>> Hi,
>>>>>
>>>>> On 9/18/23 16:56, Thomas Hellström wrote:
>>>>>> Hi Zack, Christian
>>>>>>
>>>>>> On 9/18/23 13:36, Christian König wrote:
>>>>>>> Hi Zack,
>>>>>>>
>>>>>>> adding Thomas and Daniel.
>>>>>>>
>>>>>>> I briefly remember that I talked with Thomas and some other people
>>>>>>> about that quite a while ago as well, but I don't fully remember the
>>>>>>> outcome.
>>>>>> Found one old thread, but didn't read it:
>>>>>>
>>>>>> https://lists.freedesktop.org/archives/dri-devel/2019-September/234100.html
>>>>>>
>>>>>>
>>>>>> /Thomas
>>>>>>
>>>>>>
>>>>> Ugh. Now starting to read that thread I have a vague recollection it all
>>>>> ended with not supporting mapping any device pages whatsoever when SEV
>>>>> was enabled, but rather resorting to llvmpipe and VM-local bos.
>>>> Hi, Thomas.
>>>>
>>>> Thanks for finding this! I'd (of course) like to solve it properly and get
>>>> vmwgfx
>>>> running with 3d support with SEV-ES active instead of essentially disabling
>>>> the
>>>> driver when SEV-ES is active.
>>>>
>>>> I think there are two separate discussions there, the non-controversial one
>>>> and the
>>>> controversial one:
>>>> 1) The non-controversial: is there a case where drivers would want encrypted
>>>> memory
>>>> for TT pages but not for io mem mappings? Because if not then as Christian
>>>> pointed
>>>> out we could just add pgprot_decrypted to ttm_io_prot and be essentially done.
>>>> The
>>>> current method of decrypting io mem but leaving sys mem mappings encrypted is
>>>> a bit
>>>> weird anyway.
>>>>
>>>> If the answer to that question is "yes, some driver does want the TT mappings
>>>> to be
>>>> encrypted" then your "[PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support
>>>> support
>>>> AMD memory encryption" solves that. I think getting one of those two in makes
>>>> sense
>>>> regardless of everything else, agreed?
>>> Well, there is more to it I think.
>>>
>>> IIRC, the AMD SME encryption mode has a way for a device to have the
>>> memory controller (?) encrypt / decrypt device traffic by using an
>>> address range alias, so in theory it supports encrypted TT pages, and
>>> the dma-layer may indeed hand encrypted DMA pages to TTM on such systems
>>> depending on the device's DMA mask. That's why I think that
>>> force_dma_unencrypted() export was needed, and If the amdgpu driver
>>> accesses TT memory in SME mode *without* pgprot_decrypted() and it still
>>> works, then I think that mode is actually used. How could it otherwise work?
>> For SME, as long as the encrypted bit is set in the physical address
>> used for DMA, the memory controller will handle the encrypt/decrypt
>> for the device.  For devices with a limited dma mask, you need to use
>> the IOMMU so that the encrypted bit is retained when the address hits
>> the memory controller.
> How does that work on systems with swiotlb, e.g. swiotlb=force, or i.e. what would
> decrypt the ttm tt mappings when copying between system and vram when iommu is
> disabled/absent?

SME makes it mandatory that all devices can handle the physical address 
used for DMA, either native or with the help of IOMMU.

Hacks like SWIOTLB are not directly supported as far as I know. Maybe 
somehow SWIOTLB manually decrypts the data while copying it or something 
like this, but I'm not 100% sure if that is actually implemented.

Regards,
Christian.

>
> z
>

