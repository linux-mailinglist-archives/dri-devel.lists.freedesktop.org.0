Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD514A5810
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8679310E80B;
	Tue,  1 Feb 2022 07:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C672410E807;
 Tue,  1 Feb 2022 07:46:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nc/ROZj+scpmXMAioBEMkB6Vmkm6k7lVqKuKbiMzoWgUCnaI+4qWwSbP34++V4l+bYPzR63fTQvOGJ1V8z2PnPOeQgNh/W9ghye1me65JGbgwF8dH+eEjWqUIkHNrexrB8DdoYLsVe4WXqkXhF0DiR+2d3tFDyO0nTcSL7cpVrbXFl9ChK/Z1NbOSfumN5R7xJEmDl41sRSS+MaYxtB+ZwBS77xDB/xPkBPZhmB7X5a7LFbbSBvnkX8lY6ATjuruBqd8TihOKHuxG2VMjOJiq2agtRm61t5J1Qy2og+tgMLC3msjkU0/4D2cO2ukyKw0s7MlX1WVvOv72c2MgqdDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpwZnOMcwwt2vIqIaWHcvLtC3RasTWorvIUWZaVHqIc=;
 b=hLCOQoMXdYCyn9BEIvpujhxgcJIp/7AEAvPwZODtWPUtgGli+xYe6GGADf1JrAKNrThBLlKvibgBTvhvWTtMOvnqF4MmxHLZJFb4L/+z3YE/X4e8Im82UCsLQb+fke+YDSfUIxCv0+ErRzrpQfJS+YMpFWVyD+wgHCbklXgIDdsMOEcxktMUrgho7hjFNLbg3s/LdQvq8ZQbkT6F6tmxKcfqSFuUUsQ2ZmbM7apXpNCX117arc55oe4PqoJMoAc2BXE/w11dU1/hejEHQk11USHpZjhFDFscSWOCq2GYxuDx1TnFgbhjh2eeQrDkBRDZhKLzxVqyHF+Wh6hNpMhj7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpwZnOMcwwt2vIqIaWHcvLtC3RasTWorvIUWZaVHqIc=;
 b=jqcz88OGy5lJCLZ/ZhFT7rQPaSLTvcwrasMppVIFQbNLiT4t14XHsQh84+xgL6MkXrEC1cdhtDBweOUuQd6hrZYf6VKdChs8TQQN2nyUtmtf1IBRw0Q5YKR/r+8q4ZtznJVF+/UippsswW7TgF3P1U12FV6htD3CEUQ8jaTeObc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1757.namprd12.prod.outlook.com (2603:10b6:300:111::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Tue, 1 Feb
 2022 07:46:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 07:46:22 +0000
Message-ID: <7a6533ae-9a42-06aa-3da6-0986a72c3392@amd.com>
Date: Tue, 1 Feb 2022 08:46:15 +0100
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
 <36a08a90-3614-27b4-166b-9d113b644af3@amd.com>
 <20220201003647.djakrmdebqigpz3j@ldmartin-desk2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220201003647.djakrmdebqigpz3j@ldmartin-desk2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0042.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05fc9a36-f6c6-4bff-2a92-08d9e556f0f3
X-MS-TrafficTypeDiagnostic: MWHPR12MB1757:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1757C1F9180DE1A2135811E083269@MWHPR12MB1757.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zu/KS9AhggP87B0tQarDHN589SXavPuFeQ3PPAd2/oeL4cReVL242I/BnSSrI8mAOOcFBm/fESoCW56RUvdKzRutJfBJF05EwMOhrKrh9ZhridH0M3pXil8Yo1f6wvX6SlPyKTNo17Y3E2iEXViQSUeMj5xxhWrLDTx45IIK2Zr6E+6vFTVJ9GDMLCohysdG1gy5z9a0m7yQhPTf5PQ7lL3POlp2txX7LLZpQ2Pzfud9f/gpOHUbYE0pkhVFxq9GOmz6czgYOxX8I/FmSvvrrFDz+B8fxOWLc2f1FjbE93yz1I3Cd7+Sxi5KHJGuJ9cXX2iSYlKlVoKrgeEKLEjItJjK7s/Ajo4SQ6NJRIXQwpe9yLJ55mMkQxW5bJA6sdWnfi82Q0ZEjHoMoxQFXpSgjVTR7bmIoRizNHTwiuF3wBEV2euFC05jgbQ6rVY9ZQZL1odpIDG42a6Gczcc5odRQHOaMys55KT3MRFEDKC5WteJE1Oc37p/lHxNdGoAPTrJAuBD+qrVgbMlw00rsI2JlSuwz+GAhWeuOPAsiOSX+j4ItqJt+YGJ2okTPziPby7+pEJDOpJi8MhCh8k3DuxLSJeVWZZPJsKRTGyWYCQWn9Cep45o9fbLVw3PXxVLJPOyx8JnoZLMpprcuHmdmQVHA/R7I67Ue1jvIzjBxNFunGiHY0tg61tTGl+e8H85gWqN5qh80vsPiW2c9RjF3K/ixlaBAaVlioOKp3axmnnJeczWaIJQ1FcDvHNBWJzmQ+clDAECoU34RcHqRLWNyN/nGEmQscxcBNJVF89nY9/gtA76hdorYtEjqsFAcDT7u1UY2/vIZMuGpapjsg5wkbaE3jHyaEl1vLWTi99wW/RJvzM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(2906002)(6506007)(6666004)(2616005)(186003)(31696002)(30864003)(8936002)(83380400001)(5660300002)(4326008)(6512007)(7416002)(8676002)(6486002)(966005)(31686004)(36756003)(66946007)(38100700002)(66556008)(66476007)(66574015)(6916009)(45080400002)(316002)(508600001)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFp3NHk1K2MrdGRoYmJWUFl3ZGQrcytPTWNkbFdRZiswVEhTdGhWejhFbmpw?=
 =?utf-8?B?U0cxTmkza0pGdlVEdXczWE01NHlVR283dTZCRlJ1R1Zub3RxMWk5Nk40b0NQ?=
 =?utf-8?B?UkNRMHVMTlhZaG1jc1NQS0V0MjcwR0s0TzVZRndIVTFwTXFNeDMvcG9mcG1X?=
 =?utf-8?B?R296WTUwZzJpeEtFK1dYS0VjTUN3NHN3d2RseGNMY2N1dXlTRnhRMkR2Skx5?=
 =?utf-8?B?UkFwb1J3UlhQVzB4MUNTbTZ2dWlXbzFlZW9jMXpac1Z4WmdpMERGaGc5ek5S?=
 =?utf-8?B?WmRaR3l2eEZEK3IzQms4K3F3YVF0QlE1aEl2ZERISTZ2UE15VEpjODhMdVl0?=
 =?utf-8?B?bVdKTVFoUlE0aDFXeFowSUNZWmc5MW1MSy91eHE5VnRXNTlUaFp2eUtnWmJ5?=
 =?utf-8?B?enVwbTYzRERaR1Rwd1premxJZHNrN3ErUmVPTFFHN242TThvME1UQ2o4QWxu?=
 =?utf-8?B?b0x2MkJ0K0IrVVgxS2NhaU4yR0srT2VEQ3FLSERpRkxJTERTQVpHNjRjQ2NO?=
 =?utf-8?B?a3lkZEZaZFI2N291bFZ5MGR5aGlqeVJtOXJRdU83NlF1UFNCbkVWYi9BMi84?=
 =?utf-8?B?VlZsbDJkdGpDTFluTG9yVGZwdEtXRWI1L3BicEkwYkx4ZGorSG9mWlJtMmJI?=
 =?utf-8?B?cGVZSWVMK1duNmRDOE54YlJZMEJnWE1HcW95UkxvVXNKTVpObTZiaUhsWGNt?=
 =?utf-8?B?YVloTmFZR2RUbzlVVUw4ZGhoYnozRGdBcFJtZy9nMGphMmw2TzJWT3RpNDA1?=
 =?utf-8?B?UzJEVkJYWUtEY3JEY2VaZ1M4WkZBQVBTc3RwZllyaW5zUWlSVVNRSGJxYXpm?=
 =?utf-8?B?VGVHand3VW5HaWIwYU1QYlg5QWxkUnFINStpNGMrNWhQU0hFYTVjYSthRHRp?=
 =?utf-8?B?Z0ZKamo2bVVsY2Z5NmwzNHIwalppNTZLQlUxQko5dW9IUHRsdzNOcjhvZWVh?=
 =?utf-8?B?akd1ZjdSN2lKSkNJSE1ZcWZOTlFia2Q5YS84WVlCaHREL2xxNnhleVh0N1lL?=
 =?utf-8?B?eU9mTGR0YW1nNTcwZVZ1a0xsSE43a1FOOVBTRTFNOFBJSDZoa25hVy9vVFdQ?=
 =?utf-8?B?QkhLTW5zWXZ6cHlqRlNBU01BeDVsWkl6SklJVHpXRUtSQVFMNGptQWs1UkhK?=
 =?utf-8?B?Q3BXQzBFemhNbHAzOTdtVnJjbmRIK3ByYkVLYk1IYnE3aHBVa1RrcE5mdEtk?=
 =?utf-8?B?d1pPdFZzeW9lSS9VU3pjdnVpQnFwTWorMDBYZjdMOGhFRnMxVDlYS0lXelQv?=
 =?utf-8?B?T2M2RDEzRkN6N1N4c1ZuLzJPRmhSZ3dBM0NmYlV6djhrVDBLUnhEQW9maVpB?=
 =?utf-8?B?YnQ5ZnZrNUExaW1WMkMzNVNBV3A0TFJkWWx1bENWQ3RqNVVBTnU3QytTY3Ba?=
 =?utf-8?B?NnRBN1JaMHVWSlhLQktCUGRMMkh1UDBsVXN4NGVOV3R2NkZKWXZZNFp0ejRF?=
 =?utf-8?B?TFR1Z3NHeDUySFBMRWo4YUQ4VmROSXdURVNuZ0Npa2xIKzZYelRJOFFkeHlR?=
 =?utf-8?B?MWF0T2RheWlQaUR6Q0N5SVBLbTBoYVZaSFoxbVNYZ3dYdno1TmhwZkpOeHdx?=
 =?utf-8?B?eXpOaWhDSU1WdHoyMXBEVkxpS2t4bWpDeW5WT0RuUHZzV3FQZFU1UHZ3ZWMv?=
 =?utf-8?B?Z1UwV25nUkJPNUZuUnRocDFZQkhrZzZDa2cweDVNRUsxdHd1ZTBWMFpTSUpV?=
 =?utf-8?B?VmtyWTNuTG8xT2VpRHVGUFJxTEUya0dtUStKSWtvN2F4dlhobkVXblJsTWV5?=
 =?utf-8?B?bDRiMStlTXBnOHdIbnRZRG1SMmVFNHJ3ai9jOWEyMnlqbFMvT1c4ZGM3ZU5L?=
 =?utf-8?B?NFZ4RS91QnVKb1B1WDdDM09jTEg0cEdESTJhcjF4bjNCWXlaMERpNC92WGFM?=
 =?utf-8?B?MkNCc1pmcFI0RzdxT2pMa2ZHR1pNTG5HT0ovRGRYanloNExnNDcrdHE0QzZx?=
 =?utf-8?B?RHVmS0xJTjRTTTBMMUowYUhmUnRyYzN3RzdKbkRoUXNObmF6NGF1MGVES2dv?=
 =?utf-8?B?NTJPMzBuVmdNbDQ2eUhyV1ZLRTk4UUM1aHRsbWkrL3phVVJKSEJzVEx3UUtj?=
 =?utf-8?B?MkcxOXljWjY1QUQ0b3Y4ZENyZVp5MmcvZVJUYnJwMU9neVV1UHdZdWdCYUgy?=
 =?utf-8?B?Mm1wSDN3TENxSWNKemhsVVErS1B2TkR2RVROTGR3YXhJSkV6bkpEWHRLZVZQ?=
 =?utf-8?Q?4Ao9nul7clSpYvclnMyK358=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fc9a36-f6c6-4bff-2a92-08d9e556f0f3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 07:46:22.3301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVJlxMyNiHeJKJV/ACIEr6+4mJ7m45tnyyRht6J8HQ5uFF893Fz8fkZ/BSWfsUUY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1757
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

Am 01.02.22 um 01:36 schrieb Lucas De Marchi:
> On Fri, Jan 28, 2022 at 10:48:42AM +0100, Christian König wrote:
>> Am 28.01.22 um 10:40 schrieb Lucas De Marchi:
>>> On Fri, Jan 28, 2022 at 10:22:00AM +0100, Christian König wrote:
>>>> Am 28.01.22 um 10:12 schrieb Lucas De Marchi:
>>>>> On Fri, Jan 28, 2022 at 09:41:14AM +0100, Christian König wrote:
>>>>>> Rule #1 is to never ever break the build.
>>>>>>
>>>>>> Because of this all those patches needs to be squashed into a 
>>>>>> single one as far as I can see.
>>>>>
>>>>> what config are you building on?
>>>>
>>>> Well I'm not building at all, I'm just looking at the patches as an 
>>>> engineer with 25 years of experience with Linux patches.
>>>>
>>>> Just take a look at patch number 2:
>>>>
>>>> -static int fastrpc_vmap(struct dma_buf *dmabuf, struct dma_buf_map 
>>>> *map)
>>>> +static int fastrpc_vmap(struct dma_buf *dmabuf, struct iosys_map 
>>>> *map)
>>>>
>>>> You are changing the functions signature without changing any of 
>>>> the callers.
>>>>
>>>> At bare minimum that causes a warning and on runtime this only 
>>>> works by coincident now because the structure pointers just happen 
>>>> to have the same layout. This is not something we usually do.
>>>
>>> you missed the magic/hack on patch 1:
>>>
>>> 1) dma-buf-map.h includes iosys-map.h _at the end_
>>> 2) iosys-map.h includes dma-buf-map.h at the beginning
>>>    and initially does a "define iosys_map dma_buf_map".
>>>
>>> So, it doesn't work by coincidence, It's because it was done to allow
>>> converting it piecemeal.
>>
>> Oh, my. Please never do stuff like that again.
>
> It's not uncommon approach to be required by other subsystems. Even
> drm-intel already used similar approach for macro conversions crossing
> drm-intel-next and drm-intel-gt-next branches recently.  As I said, I
> don't mind one way or the other.

The key point is that you seemed to have a misunderstanding why we 
separate changes into functional independent patches.

The goal of that is *not* to reduce the number of lines in a patch, but 
rather to reduce the complexity of the review.

When you do an automated renamed with a cocci or sed script you can have 
a 100k line patch as result, which is perfectly fine to send out like 
this as long as you include the script/commands used to autogenerate the 
patch.

The background is that everybody on the planet can generate the patch 
with those commands himself and see if the results matches your patch or 
not. The maintainer of the component can then just puts an Acked-by on 
the patch and move on, but separating the patch causes additional work 
for both you as well as the reviewers.

Separating the change into individual patches as much as possible is 
nice to have when you do a functional change and want or need a review 
from each individual driver maintainer. This is usually the default 
case, so sticking with separated changes as much as possible is usually 
still the best practice.

>
> Before I go and respin this into a single mega patch, I'd like to gather
> some feedback on the following topics:
>
> 1) Daniel Vetter and Thomas Zimmermann seemed to be ok with staying with
> the current name, dma_buf_map, while you prefer it renamed. Or at
> least not make the rename a pre-requisite for the API additions in
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220126203702.1784589-1-lucas.demarchi%40intel.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C01142fa3ce484040ade008d9e51aef5d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792726123940514%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ieMZ9Jiwo%2FQpT5kyyQgHNlepiusN%2Fkfff1Op6TVQ%2BaA%3D&amp;reserved=0 
>
>
> One thing I like about the rename is that it makes clear the separation
> between this small shim and dma-buf. There are also some APIs
> that are really dma-buf API (e.g. dma_buf_map_attachment()), but if you
> don't look carefully you may think it's from dma_buf_map.

Exactly that's the reason why I see this rename as mandatory.

Adding the functionality goes beyond the inter driver interface DMA-buf 
provides into driver internal territory and I want to make sure that 
people understand just from the name alone that this is not part of 
DMA-buf but rather an independent functionality.

>
> 2) If renaming, would it still keep the same entry in
> MAINTAINERS? Thomas suggested drivers core, but this all seem to be used
> mainly on drm/, with just one exception.

I would just add a complete new entry for this and use Thomas as 
maintainer (with his permission of course) and dri as mailing list.

>
> 3) If renaming, do we have another preferred name?

Nope, as Daniel said the name itself is only bikesheed. What is 
important is that we see this as functionality separated from the inter 
driver interface.

Regards,
Christian.

>
>
> thanks
> Lucas De Marchi
>
>>
>>>
>>> But as I said, I don't really have a preference. When crossing
>>> subsystems one thing that is hard is that different people have 
>>> different
>>> preferences on these things. At least squashing now is much easier than
>>> if I had to split it
>>>
>>> Try to imagine how much complain I received on going the other way in
>>> 25985edcedea6396277003854657b5f3cb31a628 with
>>> 2463 files changed, 4252 insertions(+), 4252 deletions(-)
>>
>> Well exactly that is perfectly fine.
>>
>> What you do here is applying your personal hack which is absolutely 
>> not welcomed.
>>
>> Regards,
>> Christian.
>>
>>> :)
>>>
>>>
>>> Lucas De Marchi
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> I built this series, full config with
>>>>> CONFIG_COMPILE_TEST and doing:
>>>>>
>>>>>     git rebase -i <base> -x "make -j$(nproc)"
>>>>>
>>>>> I split these patches in a way that wouldn't break the build on 
>>>>> purpose.
>>>>> There were a couple that I couldn't build without cross compiling: 
>>>>> tegra
>>>>> and rockchip. The others were ok.
>>>>>
>>>>> I'm not really against squashing everything in one to merge, though.
>>>>> It will be hard on the conflicts later, but should get the job 
>>>>> done much
>>>>> quicker.
>>>>>
>>>>> Lucas De Marchi
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>> Am 28.01.22 um 09:36 schrieb Lucas De Marchi:
>>>>>>> Motivation for this started in
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20220126203702.1784589-1-lucas.demarchi%40intel.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C01142fa3ce484040ade008d9e51aef5d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792726123940514%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=p8rR28Hn0yMTbwy%2F7bpiGyG9fAu9kG1VUzX2MF44mcs%3D&amp;reserved=0 
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> when trying to extend the dma-buf-map API to cover new use 
>>>>>>> cases: help a
>>>>>>> single driver with allocations and sharing code paths for IO and 
>>>>>>> system
>>>>>>> memory. I'm leaving the API additions aside and first renaming the
>>>>>>> interface as requested.
>>>>>>>
>>>>>>> There are already some users in tree outside the context of dma-buf
>>>>>>> importer/exporter. So before extending the API, let's dissociate 
>>>>>>> it from
>>>>>>> dma-buf.
>>>>>>>
>>>>>>> The iosys-map.h is introduced in the first patch in a way that 
>>>>>>> allows
>>>>>>> the conversion of each driver to happen separately. After all the
>>>>>>> conversions are done we can remove the old one, which is the 
>>>>>>> last patch.
>>>>>>> Another possible way is to squash everything and merge together,
>>>>>>> but I believe this would make much harder for review.
>>>>>>>
>>>>>>> The conversion was done with the following semantic patch:
>>>>>>>
>>>>>>>     @r1@
>>>>>>>     @@
>>>>>>>     - struct dma_buf_map
>>>>>>>     + struct iosys_map
>>>>>>>
>>>>>>>     @r2@
>>>>>>>     @@
>>>>>>>     (
>>>>>>>     - DMA_BUF_MAP_INIT_VADDR
>>>>>>>     + IOSYS_MAP_INIT_VADDR
>>>>>>>     |
>>>>>>>     - dma_buf_map_set_vaddr
>>>>>>>     + iosys_map_set_vaddr
>>>>>>>     |
>>>>>>>     - dma_buf_map_set_vaddr_iomem
>>>>>>>     + iosys_map_set_vaddr_iomem
>>>>>>>     |
>>>>>>>     - dma_buf_map_is_equal
>>>>>>>     + iosys_map_is_equal
>>>>>>>     |
>>>>>>>     - dma_buf_map_is_null
>>>>>>>     + iosys_map_is_null
>>>>>>>     |
>>>>>>>     - dma_buf_map_is_set
>>>>>>>     + iosys_map_is_set
>>>>>>>     |
>>>>>>>     - dma_buf_map_clear
>>>>>>>     + iosys_map_clear
>>>>>>>     |
>>>>>>>     - dma_buf_map_memcpy_to
>>>>>>>     + iosys_map_memcpy_to
>>>>>>>     |
>>>>>>>     - dma_buf_map_incr
>>>>>>>     + iosys_map_incr
>>>>>>>     )
>>>>>>>
>>>>>>>     @@
>>>>>>>     @@
>>>>>>>     - #include <linux/dma-buf-map.h>
>>>>>>>     + #include <linux/iosys-map.h>
>>>>>>>
>>>>>>> and then some files had their includes adjusted so we can build
>>>>>>> everything on each commit in this series. Also some comments 
>>>>>>> were update
>>>>>>> to remove mentions to dma-buf-map. Simply doing a sed to rename 
>>>>>>> didn't
>>>>>>> work as dma-buf has some APIs using the dma_buf_map prefix.
>>>>>>>
>>>>>>> Once finalized, I think most of this, if not all, could go 
>>>>>>> through the
>>>>>>> drm-misc-next branch. I split i915, msm, nouveau, and radeon in 
>>>>>>> their
>>>>>>> own patches in case it's preferred to take those through their own
>>>>>>> trees.
>>>>>>>
>>>>>>> Lucas De Marchi
>>>>>>>
>>>>>>> Lucas De Marchi (14):
>>>>>>>   iosys-map: Introduce renamed dma-buf-map
>>>>>>>   misc: fastrpc: Replace dma-buf-map with iosys-map
>>>>>>>   dma-buf: Replace dma-buf-map with iosys-map
>>>>>>>   media: Replace dma-buf-map with iosys-map
>>>>>>>   drm/ttm: Replace dma-buf-map with iosys-map
>>>>>>>   drm: Replace dma-buf-map with iosys-map in drivers
>>>>>>>   drm/i915: Replace dma-buf-map with iosys-map
>>>>>>>   drm/msm: Replace dma-buf-map with iosys-map
>>>>>>>   drm/nouveau: Replace dma-buf-map with iosys-map
>>>>>>>   drm/tegra: Replace dma-buf-map with iosys-map
>>>>>>>   drm/radeon: Replace dma-buf-map with iosys-map
>>>>>>>   drm: Replace dma-buf-map with iosys-map in common code
>>>>>>>   Documentation: Refer to iosys-map instead of dma-buf-map
>>>>>>>   dma-buf-map: Remove API in favor of iosys-map
>>>>>>>
>>>>>>>  Documentation/driver-api/dma-buf.rst          |   4 +-
>>>>>>>  Documentation/gpu/todo.rst                    |  20 +-
>>>>>>>  MAINTAINERS                                   |   2 +-
>>>>>>>  drivers/dma-buf/dma-buf.c                     |  22 +-
>>>>>>>  drivers/dma-buf/heaps/cma_heap.c              |  10 +-
>>>>>>>  drivers/dma-buf/heaps/system_heap.c           |  10 +-
>>>>>>>  drivers/gpu/drm/ast/ast_drv.h                 |   2 +-
>>>>>>>  drivers/gpu/drm/ast/ast_mode.c                |   8 +-
>>>>>>>  drivers/gpu/drm/drm_cache.c                   |  18 +-
>>>>>>>  drivers/gpu/drm/drm_client.c                  |   9 +-
>>>>>>>  drivers/gpu/drm/drm_fb_helper.c               |  12 +-
>>>>>>>  drivers/gpu/drm/drm_gem.c                     |  12 +-
>>>>>>>  drivers/gpu/drm/drm_gem_cma_helper.c          |   9 +-
>>>>>>>  drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  16 +-
>>>>>>>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  15 +-
>>>>>>>  drivers/gpu/drm/drm_gem_ttm_helper.c          |   4 +-
>>>>>>>  drivers/gpu/drm/drm_gem_vram_helper.c         |  25 +-
>>>>>>>  drivers/gpu/drm/drm_internal.h                |   6 +-
>>>>>>>  drivers/gpu/drm/drm_mipi_dbi.c                |   8 +-
>>>>>>>  drivers/gpu/drm/drm_prime.c                   |   4 +-
>>>>>>>  drivers/gpu/drm/etnaviv/etnaviv_drv.h         |   2 +-
>>>>>>>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   8 +-
>>>>>>>  drivers/gpu/drm/gud/gud_pipe.c                |   4 +-
>>>>>>>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   5 +-
>>>>>>>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   8 +-
>>>>>>>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   6 +-
>>>>>>>  .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |   6 +-
>>>>>>>  drivers/gpu/drm/lima/lima_gem.c               |   3 +-
>>>>>>>  drivers/gpu/drm/lima/lima_sched.c             |   4 +-
>>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   7 +-
>>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_gem.h        |   5 +-
>>>>>>>  drivers/gpu/drm/mgag200/mgag200_mode.c        |   4 +-
>>>>>>>  drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
>>>>>>>  drivers/gpu/drm/msm/msm_gem_prime.c           |   6 +-
>>>>>>>  drivers/gpu/drm/nouveau/nouveau_gem.c         |   2 +
>>>>>>>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  13 +-
>>>>>>>  drivers/gpu/drm/qxl/qxl_display.c             |   8 +-
>>>>>>>  drivers/gpu/drm/qxl/qxl_draw.c                |   6 +-
>>>>>>>  drivers/gpu/drm/qxl/qxl_drv.h                 |  10 +-
>>>>>>>  drivers/gpu/drm/qxl/qxl_object.c              |   8 +-
>>>>>>>  drivers/gpu/drm/qxl/qxl_object.h              |   4 +-
>>>>>>>  drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>>>>>>>  drivers/gpu/drm/radeon/radeon_gem.c           |   1 +
>>>>>>>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   9 +-
>>>>>>>  drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |   5 +-
>>>>>>>  drivers/gpu/drm/tegra/gem.c                   |  10 +-
>>>>>>>  drivers/gpu/drm/tiny/cirrus.c                 |   8 +-
>>>>>>>  drivers/gpu/drm/tiny/gm12u320.c               |   7 +-
>>>>>>>  drivers/gpu/drm/ttm/ttm_bo_util.c             |  16 +-
>>>>>>>  drivers/gpu/drm/ttm/ttm_resource.c            |  26 +-
>>>>>>>  drivers/gpu/drm/ttm/ttm_tt.c                  |   6 +-
>>>>>>>  drivers/gpu/drm/udl/udl_modeset.c             |   3 +-
>>>>>>>  drivers/gpu/drm/vboxvideo/vbox_mode.c         |   4 +-
>>>>>>>  drivers/gpu/drm/virtio/virtgpu_prime.c        |   1 +
>>>>>>>  drivers/gpu/drm/vkms/vkms_composer.c          |   4 +-
>>>>>>>  drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
>>>>>>>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +-
>>>>>>>  drivers/gpu/drm/vkms/vkms_writeback.c         |   2 +-
>>>>>>>  drivers/gpu/drm/xen/xen_drm_front_gem.c       |   7 +-
>>>>>>>  drivers/gpu/drm/xen/xen_drm_front_gem.h       |   6 +-
>>>>>>>  .../common/videobuf2/videobuf2-dma-contig.c   |   8 +-
>>>>>>>  .../media/common/videobuf2/videobuf2-dma-sg.c |   9 +-
>>>>>>>  .../common/videobuf2/videobuf2-vmalloc.c      |  11 +-
>>>>>>>  drivers/misc/fastrpc.c                        |   4 +-
>>>>>>>  include/drm/drm_cache.h                       |   6 +-
>>>>>>>  include/drm/drm_client.h                      |   7 +-
>>>>>>>  include/drm/drm_gem.h                         |   6 +-
>>>>>>>  include/drm/drm_gem_atomic_helper.h           |   6 +-
>>>>>>>  include/drm/drm_gem_cma_helper.h              |   6 +-
>>>>>>>  include/drm/drm_gem_framebuffer_helper.h      |   8 +-
>>>>>>>  include/drm/drm_gem_shmem_helper.h            |  12 +-
>>>>>>>  include/drm/drm_gem_ttm_helper.h              |   6 +-
>>>>>>>  include/drm/drm_gem_vram_helper.h             |   9 +-
>>>>>>>  include/drm/drm_prime.h                       |   6 +-
>>>>>>>  include/drm/ttm/ttm_bo_api.h                  |  10 +-
>>>>>>>  include/drm/ttm/ttm_kmap_iter.h               |  10 +-
>>>>>>>  include/drm/ttm/ttm_resource.h                |   6 +-
>>>>>>>  include/linux/dma-buf-map.h                   | 266 
>>>>>>> ------------------
>>>>>>>  include/linux/dma-buf.h                       |  12 +-
>>>>>>>  include/linux/iosys-map.h                     | 257 
>>>>>>> +++++++++++++++++
>>>>>>>  80 files changed, 579 insertions(+), 552 deletions(-)
>>>>>>>  delete mode 100644 include/linux/dma-buf-map.h
>>>>>>>  create mode 100644 include/linux/iosys-map.h
>>>>>>>
>>>>>>
>>>>
>>

