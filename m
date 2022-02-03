Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761544A82E1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 12:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB3A10E1B9;
	Thu,  3 Feb 2022 11:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A03010E366;
 Thu,  3 Feb 2022 11:07:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QawrJGRJT6u3CyGiy5oLOFKkNCeAF+DRLt4rOcLWlV6XMvn4IwlUtq93sd1Xm4+WRZ1acpvMnRJLQwjUihQepTMfDkJMUiWrhoqHY9mP7XHl/MwQa6uWP6bGGpO+mgp8jKtrEd7k4mDDRYbdL7yySJT53gysFmf94nKjpI/ZMKiz8ELAhjEi/U80yPREn665AgI/QtAFMWN+phSPp5DIh0gyXFF9Z9zY2ZeDNl6rajGnUn2bzjvjtDcDGkHKeZQz2YC6jNxojlhKs9fIUwTcgvmokb9EiAfKUZ9s44e0O9fbw/sVD8KtOVIBM3Hrj0U4ULvHorMVPfJjFHFUeWztfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIv92u0Wo8xkhgDYaJHL4qvb23u9vqpLZ/wIlBzhjAY=;
 b=k0KRCFQHaFon3rW/cZViJy0LDhLFrXbLMTsje/i+Rp4YRIlbLugvQaLL46eB3FzjuiA3Alrj1A67JTooFXhfb69gQ3X8JgV2P/gVorIPRHBcKxXAcyuVMynRpBvYlwx86oEd/LyikKMgLlF1G8gb99yGuT33bfen8P1tQp53m+ISR67JzeguBV4rgcr4pwfqLu4AA1+bV0DwsIBgHLDcCkffH7TLvdid9xwdOWgyF1DU5BbGuk0rrJGV+EctG+uGbBKbGWff1DTGJRJXPBuDqSHtj8IbFw+zFYz4ZoBk/kpEEoRhMtsrYaGI8xzdyWWBvCKk2JbWjdBib6XKT6y5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIv92u0Wo8xkhgDYaJHL4qvb23u9vqpLZ/wIlBzhjAY=;
 b=PsJPehdT9F5HvoH9ajPlHNTxBP8tYIOWff+5EK0fpEjnCwdJQ3ixZGSmCUO6p3Qa6CHcQbSajhRcc08ux13L8UdYPi0jFC513/okc6oWNdSYPwSa3Ega0RYf7esJ2p2j1t1VoPc/oxexzXRWRCbC7G38MVzc7IbQ9fBGA+ltyc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3690.namprd12.prod.outlook.com (2603:10b6:5:149::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Thu, 3 Feb
 2022 11:06:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 11:06:55 +0000
Message-ID: <8678ee17-14b9-9af6-137b-dca4c779a262@amd.com>
Date: Thu, 3 Feb 2022 12:06:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] dma-buf-map: Rename to iosys-map
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220203085614.3896538-1-lucas.demarchi@intel.com>
 <e3813696-7b91-510c-987f-85ed2fd502d6@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e3813696-7b91-510c-987f-85ed2fd502d6@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0045.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34f15dc8-51d1-4455-ad94-08d9e7054965
X-MS-TrafficTypeDiagnostic: DM6PR12MB3690:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3690A6C3C9D610FB098B4E0483289@DM6PR12MB3690.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X1/GJd51xPaf3C8l8PL/u21xIl4GZD4ctCY74s/rn9aaASpZ+NLrT3yQXycn1D+9gCj3BjImK1VaHe78BUOZ1Q8oGlIJWBsy1yCDTh0O1KWsmtbkBpAxkTdxrIbytRDI6iISABixC0rQJ52U7quH6+8RoCq29z4gE6WiN3db5wCe0+uyUAjrcelXpFuMBRjr0w/n7kHQ6u0prxHh3GBuhbOYNYkgOREa/y7lNlsp72nHCS5HcqzPGCgXOHZMRwJgjqpkNUvIQQdvJhjMNFTBkLGWrfpVeROg6vxE3zWNENlAUsTrmC5ykHc4R5+36Vp4PSEpdgB0pfR5EIh+ZtRyzDeDIL+TPuFA8zx3zkOG4PH/YEo8ayzBKO+KqolrqpAGxAO0qqZlMi/Fr6nUffijYr0pmtLOzYVAUlyBwG244LgKBYmRNx2mU2VsKO3q1Jj8F/QJ3g9FYAqBlG0zvJgREbuW8YpefXkJF9qu3HXATuGZqzL9GNGuKgucqy6YpufnY8oV11DdbhR7ITU4xOEA8WP8LytMUa6lYoKz5LjVEOqrfcVocBb4zuRNtyXOs0gP8mPrU8KVwR4ZxlxQjXgtaig2zMWGIQkS9xnYLvykKLF6xbddlCUod2X0TvNqpxqTLArkuincezzjjRTYtfzQyyHHh9XViodojPFdPvXP7dn/87MrT7p7/r/nq3oLu7rZnxr+IzbuMUMCXjPwDhWDcdpT7oB+hsNU2zWvOT2wW7MKgdhRn5f8p8XNOVG7WBs2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(30864003)(36756003)(4326008)(6666004)(86362001)(6486002)(7416002)(110136005)(508600001)(316002)(66476007)(31696002)(38100700002)(5660300002)(6506007)(66946007)(8676002)(8936002)(6512007)(66556008)(83380400001)(2906002)(31686004)(66574015)(186003)(2616005)(26005)(45980500001)(43740500002)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andCM21YbGk0dXVTSkpaOXI2dVRMUDRwWFQ0cjQ5UWN0ZWZHMnhTNGtFc1lI?=
 =?utf-8?B?eXFHcm92NnNIN2wvWG5NN3BsSVUrbVZIOEk4MWJlSWVOOFJQclY4VFRQZFdX?=
 =?utf-8?B?SkRDSXA5Zkp6R3lxbFc2S1ZGTmdFY0NpWVhaQ2h6eWQrMC9hTEtrbE9ETkxR?=
 =?utf-8?B?NEpHMUMwdnZtSGREUTZHRzhlNkVFdkV3eDlONVNHSTlkVzhBUWFEdllkZWF1?=
 =?utf-8?B?V3UxemFLd3F3QUQ2YnF1d1RrNWxwZGJPcFBCTXpyWHZBYm9pdy84bWNMUXJu?=
 =?utf-8?B?cng0OUdoNUprazNKbkJ0YUQrTzgwVWgvckgxTlNHQmN4TStnaTljR24zTDFZ?=
 =?utf-8?B?YlQzQ0kvWTN2Zzg3YVFxMS9peTYyYzUvS0UvYmZzUjhKS1diMXcwMGF4T3hJ?=
 =?utf-8?B?Nmd2K3NDcGdSNFFnTjE1aHNybzUzUVN1VFlEVHRvUlovVEZBS3FqY1ZKMitQ?=
 =?utf-8?B?OUxnZG52S2c3dFBVb3NvMk8rTE1OSVZsUExXUXpOL3FIbkF4SHYrMnZEblNa?=
 =?utf-8?B?cHEycytCL0pFazVEQ09OdXdDc3F0c0czRnJWcEhIdjNtWG44dHVtenhhaVJJ?=
 =?utf-8?B?RWh1ajl4M2ZwazhWdUR4Y1dSbE0yQW5Yb0pId1NxVGZmMjl4WGFxaG5BVVdw?=
 =?utf-8?B?VUEwaE5QbDhHNWcwNzBNY1R0N3NxNERDOWdnY1kwd0c4VmRON2hpWHdmMERm?=
 =?utf-8?B?RVdoSURjMDBIZU9qUC9IbEVydXZ6M20yc25vbmFwWXNwUlVKN0M0RmRrWE5X?=
 =?utf-8?B?SERPcVRNV0l6bkw1d3FFQ2NENXR0Y1ozSnE4WmNMNGVDSElxTzdQQ1ZEQ050?=
 =?utf-8?B?TzAwdUxUTC9BUTJiaUNPcDIySGI5YkwrcHN0UVBBK0VPZkdZS20yS29idGNT?=
 =?utf-8?B?dEdSNnpPZzQ2VXlTaHNhN2F0YlkxSWk1VDRIeWdJQytPYmlzYythNUUyV2Z1?=
 =?utf-8?B?cWlkQk43ckhRMHpkbG9JNUlCSTUvT1drV3FwNjExZTJwY1gwQzFWRWVMTC9m?=
 =?utf-8?B?bUIvZUNnWjdHekdqM3U0MXdVeGo4YmZQOEw0R0pyVk9Gcnc5WXV5cVVuRklu?=
 =?utf-8?B?Y2R6dS9DTGRMSGtDZ3lYTkgwV0dDak50RmpYdmxSUW0rYlZOdFlzZUNLNEp3?=
 =?utf-8?B?TDhTdXRiRDJMR05KQU4rc3E1M2VqT1hnNE5RQ3NVY2pUdWs5UVUvVndBajBY?=
 =?utf-8?B?RzhvcnpUVDJocGxxbnJ0dEJONkxuTW9vaDNRT1hsQUtocEhTdUJMZE50ai8y?=
 =?utf-8?B?U29uZUtWK0ZEY2tjUVJka2srU3NUTE9GUjRoSTkvNmJHV0FCeGtNQXhyUHBP?=
 =?utf-8?B?UUZ0WXdlK3JTcmZiOXhxemNXaGd3TFlma0ZSVlJtVWpsSUo1bTg5dDU2bjZG?=
 =?utf-8?B?QngrZTBaMTJxRmRJRE1FZUxzRFRpQitYZWg5VkVMN2FZTkRuWTlNOGFBazZB?=
 =?utf-8?B?ZUNiTGpWSGJwWHc0ZVVDalZaQ0lYOGdMdVMvNXp4c1BLdWpFNlRUbzhadFFn?=
 =?utf-8?B?a2lGVCszMklvTFlZY1JNWGlsOFNsVU1FQWNUN3pTQ0VGY1dXbFA3Wk1wckNk?=
 =?utf-8?B?VnluYnkzUmtCczVVTEQ4K0gxa2p3N2tmSm1FNk1YNERwSU8rUElDc0dscUNS?=
 =?utf-8?B?QStReGw2eEdPZHpFRGU0ZVJjUzFYUzEzckZLL1JKSkpKWjlGYnFFeEdYaDFR?=
 =?utf-8?B?MHY0SlByWW1WMTVQS3hnTm5wd3MrK2Z2RFRKcEVrMXZ1S0hmeERlaVVYTTBs?=
 =?utf-8?B?bkJTcWdreHhrbHFxalZLMCtnUEhYOFZieGJlakh2UTNzMzdmd3FOcGtibGNm?=
 =?utf-8?B?dDV2YWs3d3JncHZJK09MbXpNbjEyZVVRb3pDV1hST1llaFlFcTVodGNiWlF2?=
 =?utf-8?B?cEhxZDEzZ29hbmtxSVhqNlp1di9GdlE2bGE1bGZ5QUdXSS9HOGJXNGNoN2hz?=
 =?utf-8?B?V2U1cmR3ZmdPajZmcDhhK1RpeFBaS0hwSTh6UmNUeVgxTS9MUkFRLzM5bHlC?=
 =?utf-8?B?ak1SNEF2NUFGendmNmMzcm9IR1A4TVAwYllZS3pocjhNdUJmZkJqWVNzNVI3?=
 =?utf-8?B?TWM5NmhlbW42QjdPc0k5WHRVZEpIT3VQelkramZJWVpwc3hNUi9qNTJnZWZw?=
 =?utf-8?Q?t8Dw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f15dc8-51d1-4455-ad94-08d9e7054965
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 11:06:55.0169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zhhdzq1JCFUVdJ2c68ip5gvlog+eNNx8J8MGWQ1LehLka8NsipWOAYXX036NYk2B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3690
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
Cc: linux-doc@vger.kernel.org, airlied@linux.ie, daniel.vetter@ffwll.ch,
 Jonathan Corbet <corbet@lwn.net>, srinivas.kandagatla@linaro.org,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.02.22 um 10:29 schrieb Thomas Zimmermann:
> Hi
>
> Am 03.02.22 um 09:56 schrieb Lucas De Marchi:
> [...]
>>
>> diff --git a/Documentation/driver-api/device-io.rst 
>> b/Documentation/driver-api/device-io.rst
>> index e9f04b1815d1..f9dede8639c7 100644
>> --- a/Documentation/driver-api/device-io.rst
>> +++ b/Documentation/driver-api/device-io.rst
>> @@ -502,6 +502,15 @@ pcim_iomap()
>>   Not using these wrappers may make drivers unusable on certain 
>> platforms with
>>   stricter rules for mapping I/O memory.
>>   +System/IO memory abstraction
>
> "Generalizing Access to System and I/O Memory"
>
> With the headline changed, please add my
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Technically, this patch belongs into drm-misc-next, but you have a 
> larger use case for i915. The patchset would best go through 
> drm-intel-next, I guess.

Both approaches work for me, just let me know if I should push something 
somewhere.

Regards,
Christian.

>
> Best regards
> Thomas
>
>> +----------------------------
>> +
>> +.. kernel-doc:: include/linux/iosys-map.h
>> +   :doc: overview
>> +
>> +.. kernel-doc:: include/linux/iosys-map.h
>> +   :internal:
>> +
>>   Public Functions Provided
>>   =========================
>>   diff --git a/Documentation/driver-api/dma-buf.rst 
>> b/Documentation/driver-api/dma-buf.rst
>> index 2cd7db82d9fe..55006678394a 100644
>> --- a/Documentation/driver-api/dma-buf.rst
>> +++ b/Documentation/driver-api/dma-buf.rst
>> @@ -128,15 +128,6 @@ Kernel Functions and Structures Reference
>>   .. kernel-doc:: include/linux/dma-buf.h
>>      :internal:
>>   -Buffer Mapping Helpers
>> -~~~~~~~~~~~~~~~~~~~~~~
>> -
>> -.. kernel-doc:: include/linux/dma-buf-map.h
>> -   :doc: overview
>> -
>> -.. kernel-doc:: include/linux/dma-buf-map.h
>> -   :internal:
>> -
>>   Reservation Objects
>>   -------------------
>>   diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
>> index 1b2372ef4131..ee842606e883 100644
>> --- a/Documentation/gpu/todo.rst
>> +++ b/Documentation/gpu/todo.rst
>> @@ -222,7 +222,7 @@ Convert drivers to use drm_fbdev_generic_setup()
>>   Most drivers can use drm_fbdev_generic_setup(). Driver have to 
>> implement
>>   atomic modesetting and GEM vmap support. Historically, generic 
>> fbdev emulation
>>   expected the framebuffer in system memory or system-like memory. By 
>> employing
>> -struct dma_buf_map, drivers with frambuffers in I/O memory can be 
>> supported
>> +struct iosys_map, drivers with frambuffers in I/O memory can be 
>> supported
>>   as well.
>>     Contact: Maintainer of the driver you plan to convert
>> @@ -234,7 +234,7 @@ Reimplement functions in drm_fbdev_fb_ops without 
>> fbdev
>>     A number of callback functions in drm_fbdev_fb_ops could benefit 
>> from
>>   being rewritten without dependencies on the fbdev module. Some of the
>> -helpers could further benefit from using struct dma_buf_map instead of
>> +helpers could further benefit from using struct iosys_map instead of
>>   raw pointers.
>>     Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
>> @@ -434,19 +434,19 @@ Contact: Emil Velikov, respective driver 
>> maintainers
>>     Level: Intermediate
>>   -Use struct dma_buf_map throughout codebase
>> -------------------------------------------
>> +Use struct iosys_map throughout codebase
>> +----------------------------------------
>>   -Pointers to shared device memory are stored in struct dma_buf_map. 
>> Each
>> +Pointers to shared device memory are stored in struct iosys_map. Each
>>   instance knows whether it refers to system or I/O memory. Most of 
>> the DRM-wide
>> -interface have been converted to use struct dma_buf_map, but 
>> implementations
>> +interface have been converted to use struct iosys_map, but 
>> implementations
>>   often still use raw pointers.
>>   -The task is to use struct dma_buf_map where it makes sense.
>> +The task is to use struct iosys_map where it makes sense.
>>   -* Memory managers should use struct dma_buf_map for 
>> dma-buf-imported buffers.
>> -* TTM might benefit from using struct dma_buf_map internally.
>> -* Framebuffer copying and blitting helpers should operate on struct 
>> dma_buf_map.
>> +* Memory managers should use struct iosys_map for dma-buf-imported 
>> buffers.
>> +* TTM might benefit from using struct iosys_map internally.
>> +* Framebuffer copying and blitting helpers should operate on struct 
>> iosys_map.
>>     Contact: Thomas Zimmermann <tzimmermann@suse.de>, Christian 
>> König, Daniel Vetter
>>   diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0d914702950f..45c97e71c8c1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -5675,7 +5675,7 @@ T:    git 
>> git://anongit.freedesktop.org/drm/drm-misc
>>   F:    Documentation/driver-api/dma-buf.rst
>>   F:    drivers/dma-buf/
>>   F:    include/linux/*fence.h
>> -F:    include/linux/dma-buf*
>> +F:    include/linux/dma-buf.h
>>   F:    include/linux/dma-resv.h
>>   K:    \bdma_(?:buf|fence|resv)\b
>>   @@ -9977,6 +9977,13 @@ F:    include/linux/iova.h
>>   F:    include/linux/of_iommu.h
>>   F:    include/uapi/linux/iommu.h
>>   +IOSYS-MAP HELPERS
>> +M:    Thomas Zimmermann <tzimmermann@suse.de>
>> +L:    dri-devel@lists.freedesktop.org
>> +S:    Maintained
>> +T:    git git://anongit.freedesktop.org/drm/drm-misc
>> +F:    include/linux/iosys-map.h
>> +
>>   IO_URING
>>   M:    Jens Axboe <axboe@kernel.dk>
>>   R:    Pavel Begunkov <asml.silence@gmail.com>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 602b12d7470d..df23239b04fc 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -1047,8 +1047,8 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, 
>> DMA_BUF);
>>    *
>>    *   Interfaces::
>>    *
>> - *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct 
>> dma_buf_map \*map)
>> - *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct 
>> dma_buf_map \*map)
>> + *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct 
>> iosys_map \*map)
>> + *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct 
>> iosys_map \*map)
>>    *
>>    *   The vmap call can fail if there is no vmap support in the 
>> exporter, or if
>>    *   it runs out of vmalloc space. Note that the dma-buf layer 
>> keeps a reference
>> @@ -1260,12 +1260,12 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>>    *
>>    * Returns 0 on success, or a negative errno code otherwise.
>>    */
>> -int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>> +int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>>   {
>> -    struct dma_buf_map ptr;
>> +    struct iosys_map ptr;
>>       int ret = 0;
>>   -    dma_buf_map_clear(map);
>> +    iosys_map_clear(map);
>>         if (WARN_ON(!dmabuf))
>>           return -EINVAL;
>> @@ -1276,12 +1276,12 @@ int dma_buf_vmap(struct dma_buf *dmabuf, 
>> struct dma_buf_map *map)
>>       mutex_lock(&dmabuf->lock);
>>       if (dmabuf->vmapping_counter) {
>>           dmabuf->vmapping_counter++;
>> -        BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
>> +        BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
>>           *map = dmabuf->vmap_ptr;
>>           goto out_unlock;
>>       }
>>   -    BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
>> +    BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
>>         ret = dmabuf->ops->vmap(dmabuf, &ptr);
>>       if (WARN_ON_ONCE(ret))
>> @@ -1303,20 +1303,20 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
>>    * @dmabuf:    [in]    buffer to vunmap
>>    * @map:    [in]    vmap pointer to vunmap
>>    */
>> -void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>> +void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
>>   {
>>       if (WARN_ON(!dmabuf))
>>           return;
>>   -    BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
>> +    BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
>>       BUG_ON(dmabuf->vmapping_counter == 0);
>> -    BUG_ON(!dma_buf_map_is_equal(&dmabuf->vmap_ptr, map));
>> +    BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
>>         mutex_lock(&dmabuf->lock);
>>       if (--dmabuf->vmapping_counter == 0) {
>>           if (dmabuf->ops->vunmap)
>>               dmabuf->ops->vunmap(dmabuf, map);
>> -        dma_buf_map_clear(&dmabuf->vmap_ptr);
>> +        iosys_map_clear(&dmabuf->vmap_ptr);
>>       }
>>       mutex_unlock(&dmabuf->lock);
>>   }
>> diff --git a/drivers/dma-buf/heaps/cma_heap.c 
>> b/drivers/dma-buf/heaps/cma_heap.c
>> index 0c05b79870f9..07ace3ccb266 100644
>> --- a/drivers/dma-buf/heaps/cma_heap.c
>> +++ b/drivers/dma-buf/heaps/cma_heap.c
>> @@ -200,7 +200,7 @@ static void *cma_heap_do_vmap(struct 
>> cma_heap_buffer *buffer)
>>       return vaddr;
>>   }
>>   -static int cma_heap_vmap(struct dma_buf *dmabuf, struct 
>> dma_buf_map *map)
>> +static int cma_heap_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>>   {
>>       struct cma_heap_buffer *buffer = dmabuf->priv;
>>       void *vaddr;
>> @@ -209,7 +209,7 @@ static int cma_heap_vmap(struct dma_buf *dmabuf, 
>> struct dma_buf_map *map)
>>       mutex_lock(&buffer->lock);
>>       if (buffer->vmap_cnt) {
>>           buffer->vmap_cnt++;
>> -        dma_buf_map_set_vaddr(map, buffer->vaddr);
>> +        iosys_map_set_vaddr(map, buffer->vaddr);
>>           goto out;
>>       }
>>   @@ -220,14 +220,14 @@ static int cma_heap_vmap(struct dma_buf 
>> *dmabuf, struct dma_buf_map *map)
>>       }
>>       buffer->vaddr = vaddr;
>>       buffer->vmap_cnt++;
>> -    dma_buf_map_set_vaddr(map, buffer->vaddr);
>> +    iosys_map_set_vaddr(map, buffer->vaddr);
>>   out:
>>       mutex_unlock(&buffer->lock);
>>         return ret;
>>   }
>>   -static void cma_heap_vunmap(struct dma_buf *dmabuf, struct 
>> dma_buf_map *map)
>> +static void cma_heap_vunmap(struct dma_buf *dmabuf, struct iosys_map 
>> *map)
>>   {
>>       struct cma_heap_buffer *buffer = dmabuf->priv;
>>   @@ -237,7 +237,7 @@ static void cma_heap_vunmap(struct dma_buf 
>> *dmabuf, struct dma_buf_map *map)
>>           buffer->vaddr = NULL;
>>       }
>>       mutex_unlock(&buffer->lock);
>> -    dma_buf_map_clear(map);
>> +    iosys_map_clear(map);
>>   }
>>     static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
>> diff --git a/drivers/dma-buf/heaps/system_heap.c 
>> b/drivers/dma-buf/heaps/system_heap.c
>> index ab7fd896d2c4..fcf836ba9c1f 100644
>> --- a/drivers/dma-buf/heaps/system_heap.c
>> +++ b/drivers/dma-buf/heaps/system_heap.c
>> @@ -241,7 +241,7 @@ static void *system_heap_do_vmap(struct 
>> system_heap_buffer *buffer)
>>       return vaddr;
>>   }
>>   -static int system_heap_vmap(struct dma_buf *dmabuf, struct 
>> dma_buf_map *map)
>> +static int system_heap_vmap(struct dma_buf *dmabuf, struct iosys_map 
>> *map)
>>   {
>>       struct system_heap_buffer *buffer = dmabuf->priv;
>>       void *vaddr;
>> @@ -250,7 +250,7 @@ static int system_heap_vmap(struct dma_buf 
>> *dmabuf, struct dma_buf_map *map)
>>       mutex_lock(&buffer->lock);
>>       if (buffer->vmap_cnt) {
>>           buffer->vmap_cnt++;
>> -        dma_buf_map_set_vaddr(map, buffer->vaddr);
>> +        iosys_map_set_vaddr(map, buffer->vaddr);
>>           goto out;
>>       }
>>   @@ -262,14 +262,14 @@ static int system_heap_vmap(struct dma_buf 
>> *dmabuf, struct dma_buf_map *map)
>>         buffer->vaddr = vaddr;
>>       buffer->vmap_cnt++;
>> -    dma_buf_map_set_vaddr(map, buffer->vaddr);
>> +    iosys_map_set_vaddr(map, buffer->vaddr);
>>   out:
>>       mutex_unlock(&buffer->lock);
>>         return ret;
>>   }
>>   -static void system_heap_vunmap(struct dma_buf *dmabuf, struct 
>> dma_buf_map *map)
>> +static void system_heap_vunmap(struct dma_buf *dmabuf, struct 
>> iosys_map *map)
>>   {
>>       struct system_heap_buffer *buffer = dmabuf->priv;
>>   @@ -279,7 +279,7 @@ static void system_heap_vunmap(struct dma_buf 
>> *dmabuf, struct dma_buf_map *map)
>>           buffer->vaddr = NULL;
>>       }
>>       mutex_unlock(&buffer->lock);
>> -    dma_buf_map_clear(map);
>> +    iosys_map_clear(map);
>>   }
>>     static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
>> diff --git a/drivers/gpu/drm/ast/ast_drv.h 
>> b/drivers/gpu/drm/ast/ast_drv.h
>> index 00bfa41ff7cb..9c8d56b0a41b 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -107,7 +107,7 @@ struct ast_cursor_plane {
>>         struct {
>>           struct drm_gem_vram_object *gbo;
>> -        struct dma_buf_map map;
>> +        struct iosys_map map;
>>           u64 off;
>>       } hwc[AST_DEFAULT_HWC_NUM];
>>   diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index 6fa8042a0dfd..2759e977d95d 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -804,11 +804,11 @@ ast_cursor_plane_helper_atomic_update(struct 
>> drm_plane *plane,
>>       struct drm_shadow_plane_state *shadow_plane_state = 
>> to_drm_shadow_plane_state(new_state);
>>       struct drm_framebuffer *fb = new_state->fb;
>>       struct ast_private *ast = to_ast_private(plane->dev);
>> -    struct dma_buf_map dst_map =
>> +    struct iosys_map dst_map =
>> ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
>>       u64 dst_off =
>> ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].off;
>> -    struct dma_buf_map src_map = shadow_plane_state->data[0];
>> +    struct iosys_map src_map = shadow_plane_state->data[0];
>>       unsigned int offset_x, offset_y;
>>       u16 x, y;
>>       u8 x_offset, y_offset;
>> @@ -886,7 +886,7 @@ static void ast_cursor_plane_destroy(struct 
>> drm_plane *plane)
>>       struct ast_cursor_plane *ast_cursor_plane = 
>> to_ast_cursor_plane(plane);
>>       size_t i;
>>       struct drm_gem_vram_object *gbo;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>         for (i = 0; i < ARRAY_SIZE(ast_cursor_plane->hwc); ++i) {
>>           gbo = ast_cursor_plane->hwc[i].gbo;
>> @@ -913,7 +913,7 @@ static int ast_cursor_plane_init(struct 
>> ast_private *ast)
>>       struct drm_plane *cursor_plane = &ast_cursor_plane->base;
>>       size_t size, i;
>>       struct drm_gem_vram_object *gbo;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       int ret;
>>       s64 off;
>>   diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>> index f19d9acbe959..4bb093ccf1b8 100644
>> --- a/drivers/gpu/drm/drm_cache.c
>> +++ b/drivers/gpu/drm/drm_cache.c
>> @@ -28,10 +28,10 @@
>>    * Authors: Thomas Hellström <thomas-at-tungstengraphics-dot-com>
>>    */
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/cc_platform.h>
>>   #include <linux/export.h>
>>   #include <linux/highmem.h>
>> -#include <linux/cc_platform.h>
>> +#include <linux/iosys-map.h>
>>   #include <xen/xen.h>
>>     #include <drm/drm_cache.h>
>> @@ -214,14 +214,14 @@ bool drm_need_swiotlb(int dma_bits)
>>   }
>>   EXPORT_SYMBOL(drm_need_swiotlb);
>>   -static void memcpy_fallback(struct dma_buf_map *dst,
>> -                const struct dma_buf_map *src,
>> +static void memcpy_fallback(struct iosys_map *dst,
>> +                const struct iosys_map *src,
>>                   unsigned long len)
>>   {
>>       if (!dst->is_iomem && !src->is_iomem) {
>>           memcpy(dst->vaddr, src->vaddr, len);
>>       } else if (!src->is_iomem) {
>> -        dma_buf_map_memcpy_to(dst, src->vaddr, len);
>> +        iosys_map_memcpy_to(dst, src->vaddr, len);
>>       } else if (!dst->is_iomem) {
>>           memcpy_fromio(dst->vaddr, src->vaddr_iomem, len);
>>       } else {
>> @@ -305,8 +305,8 @@ static void __drm_memcpy_from_wc(void *dst, const 
>> void *src, unsigned long len)
>>    * Tries an arch optimized memcpy for prefetching reading out of a 
>> WC region,
>>    * and if no such beast is available, falls back to a normal memcpy.
>>    */
>> -void drm_memcpy_from_wc(struct dma_buf_map *dst,
>> -            const struct dma_buf_map *src,
>> +void drm_memcpy_from_wc(struct iosys_map *dst,
>> +            const struct iosys_map *src,
>>               unsigned long len)
>>   {
>>       if (WARN_ON(in_interrupt())) {
>> @@ -343,8 +343,8 @@ void drm_memcpy_init_early(void)
>>           static_branch_enable(&has_movntdqa);
>>   }
>>   #else
>> -void drm_memcpy_from_wc(struct dma_buf_map *dst,
>> -            const struct dma_buf_map *src,
>> +void drm_memcpy_from_wc(struct iosys_map *dst,
>> +            const struct iosys_map *src,
>>               unsigned long len)
>>   {
>>       WARN_ON(in_interrupt());
>> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
>> index ce45e380f4a2..af3b7395bf69 100644
>> --- a/drivers/gpu/drm/drm_client.c
>> +++ b/drivers/gpu/drm/drm_client.c
>> @@ -3,7 +3,7 @@
>>    * Copyright 2018 Noralf Trønnes
>>    */
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/list.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>> @@ -309,9 +309,10 @@ drm_client_buffer_create(struct drm_client_dev 
>> *client, u32 width, u32 height, u
>>    *    0 on success, or a negative errno code otherwise.
>>    */
>>   int
>> -drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct 
>> dma_buf_map *map_copy)
>> +drm_client_buffer_vmap(struct drm_client_buffer *buffer,
>> +               struct iosys_map *map_copy)
>>   {
>> -    struct dma_buf_map *map = &buffer->map;
>> +    struct iosys_map *map = &buffer->map;
>>       int ret;
>>         /*
>> @@ -342,7 +343,7 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
>>    */
>>   void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>>   {
>> -    struct dma_buf_map *map = &buffer->map;
>> +    struct iosys_map *map = &buffer->map;
>>         drm_gem_vunmap(buffer->gem, map);
>>   }
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c 
>> b/drivers/gpu/drm/drm_fb_helper.c
>> index 805c5a666490..709d1eb31899 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -373,7 +373,7 @@ static void drm_fb_helper_resume_worker(struct 
>> work_struct *work)
>>     static void drm_fb_helper_damage_blit_real(struct drm_fb_helper 
>> *fb_helper,
>>                          struct drm_clip_rect *clip,
>> -                       struct dma_buf_map *dst)
>> +                       struct iosys_map *dst)
>>   {
>>       struct drm_framebuffer *fb = fb_helper->fb;
>>       unsigned int cpp = fb->format->cpp[0];
>> @@ -382,11 +382,11 @@ static void 
>> drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
>>       size_t len = (clip->x2 - clip->x1) * cpp;
>>       unsigned int y;
>>   -    dma_buf_map_incr(dst, offset); /* go to first pixel within 
>> clip rect */
>> +    iosys_map_incr(dst, offset); /* go to first pixel within clip 
>> rect */
>>         for (y = clip->y1; y < clip->y2; y++) {
>> -        dma_buf_map_memcpy_to(dst, src, len);
>> -        dma_buf_map_incr(dst, fb->pitches[0]);
>> +        iosys_map_memcpy_to(dst, src, len);
>> +        iosys_map_incr(dst, fb->pitches[0]);
>>           src += fb->pitches[0];
>>       }
>>   }
>> @@ -395,7 +395,7 @@ static int drm_fb_helper_damage_blit(struct 
>> drm_fb_helper *fb_helper,
>>                        struct drm_clip_rect *clip)
>>   {
>>       struct drm_client_buffer *buffer = fb_helper->buffer;
>> -    struct dma_buf_map map, dst;
>> +    struct iosys_map map, dst;
>>       int ret;
>>         /*
>> @@ -2316,7 +2316,7 @@ static int drm_fb_helper_generic_probe(struct 
>> drm_fb_helper *fb_helper,
>>       struct drm_framebuffer *fb;
>>       struct fb_info *fbi;
>>       u32 format;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       int ret;
>>         drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 4dcdec6487bb..8c7b24f4b0e4 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -36,7 +36,7 @@
>>   #include <linux/pagemap.h>
>>   #include <linux/shmem_fs.h>
>>   #include <linux/dma-buf.h>
>> -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/mem_encrypt.h>
>>   #include <linux/pagevec.h>
>>   @@ -1165,7 +1165,7 @@ void drm_gem_unpin(struct drm_gem_object *obj)
>>           obj->funcs->unpin(obj);
>>   }
>>   -int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>> +int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>>   {
>>       int ret;
>>   @@ -1175,23 +1175,23 @@ int drm_gem_vmap(struct drm_gem_object 
>> *obj, struct dma_buf_map *map)
>>       ret = obj->funcs->vmap(obj, map);
>>       if (ret)
>>           return ret;
>> -    else if (dma_buf_map_is_null(map))
>> +    else if (iosys_map_is_null(map))
>>           return -ENOMEM;
>>         return 0;
>>   }
>>   EXPORT_SYMBOL(drm_gem_vmap);
>>   -void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map 
>> *map)
>> +void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>>   {
>> -    if (dma_buf_map_is_null(map))
>> +    if (iosys_map_is_null(map))
>>           return;
>>         if (obj->funcs->vunmap)
>>           obj->funcs->vunmap(obj, map);
>>         /* Always set the mapping to NULL. Callers may rely on this. */
>> -    dma_buf_map_clear(map);
>> +    iosys_map_clear(map);
>>   }
>>   EXPORT_SYMBOL(drm_gem_vunmap);
>>   diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c 
>> b/drivers/gpu/drm/drm_gem_cma_helper.c
>> index cefd0cbf9deb..88c432a7cb3c 100644
>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>> @@ -209,7 +209,7 @@ drm_gem_cma_create_with_handle(struct drm_file 
>> *file_priv,
>>   void drm_gem_cma_free(struct drm_gem_cma_object *cma_obj)
>>   {
>>       struct drm_gem_object *gem_obj = &cma_obj->base;
>> -    struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(cma_obj->vaddr);
>> +    struct iosys_map map = IOSYS_MAP_INIT_VADDR(cma_obj->vaddr);
>>         if (gem_obj->import_attach) {
>>           if (cma_obj->vaddr)
>> @@ -480,9 +480,10 @@ 
>> EXPORT_SYMBOL_GPL(drm_gem_cma_prime_import_sg_table);
>>    * Returns:
>>    * 0 on success, or a negative error code otherwise.
>>    */
>> -int drm_gem_cma_vmap(struct drm_gem_cma_object *cma_obj, struct 
>> dma_buf_map *map)
>> +int drm_gem_cma_vmap(struct drm_gem_cma_object *cma_obj,
>> +             struct iosys_map *map)
>>   {
>> -    dma_buf_map_set_vaddr(map, cma_obj->vaddr);
>> +    iosys_map_set_vaddr(map, cma_obj->vaddr);
>>         return 0;
>>   }
>> @@ -557,7 +558,7 @@ drm_gem_cma_prime_import_sg_table_vmap(struct 
>> drm_device *dev,
>>   {
>>       struct drm_gem_cma_object *cma_obj;
>>       struct drm_gem_object *obj;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       int ret;
>>         ret = dma_buf_vmap(attach->dmabuf, &map);
>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c 
>> b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> index 746fd8c73845..f4619803acd0 100644
>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> @@ -321,7 +321,7 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
>>    * @data: returns the data address for each BO, can be NULL
>>    *
>>    * This function maps all buffer objects of the given framebuffer into
>> - * kernel address space and stores them in struct dma_buf_map. If the
>> + * kernel address space and stores them in struct iosys_map. If the
>>    * mapping operation fails for one of the BOs, the function unmaps the
>>    * already established mappings automatically.
>>    *
>> @@ -335,8 +335,8 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
>>    * 0 on success, or a negative errno code otherwise.
>>    */
>>   int drm_gem_fb_vmap(struct drm_framebuffer *fb,
>> -            struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES],
>> -            struct dma_buf_map data[DRM_FORMAT_MAX_PLANES])
>> +            struct iosys_map map[static DRM_FORMAT_MAX_PLANES],
>> +            struct iosys_map data[DRM_FORMAT_MAX_PLANES])
>>   {
>>       struct drm_gem_object *obj;
>>       unsigned int i;
>> @@ -345,7 +345,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb,
>>       for (i = 0; i < DRM_FORMAT_MAX_PLANES; ++i) {
>>           obj = drm_gem_fb_get_obj(fb, i);
>>           if (!obj) {
>> -            dma_buf_map_clear(&map[i]);
>> +            iosys_map_clear(&map[i]);
>>               continue;
>>           }
>>           ret = drm_gem_vmap(obj, &map[i]);
>> @@ -356,9 +356,9 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb,
>>       if (data) {
>>           for (i = 0; i < DRM_FORMAT_MAX_PLANES; ++i) {
>>               memcpy(&data[i], &map[i], sizeof(data[i]));
>> -            if (dma_buf_map_is_null(&data[i]))
>> +            if (iosys_map_is_null(&data[i]))
>>                   continue;
>> -            dma_buf_map_incr(&data[i], fb->offsets[i]);
>> +            iosys_map_incr(&data[i], fb->offsets[i]);
>>           }
>>       }
>>   @@ -386,7 +386,7 @@ EXPORT_SYMBOL(drm_gem_fb_vmap);
>>    * See drm_gem_fb_vmap() for more information.
>>    */
>>   void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
>> -               struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES])
>> +               struct iosys_map map[static DRM_FORMAT_MAX_PLANES])
>>   {
>>       unsigned int i = DRM_FORMAT_MAX_PLANES;
>>       struct drm_gem_object *obj;
>> @@ -396,7 +396,7 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
>>           obj = drm_gem_fb_get_obj(fb, i);
>>           if (!obj)
>>               continue;
>> -        if (dma_buf_map_is_null(&map[i]))
>> +        if (iosys_map_is_null(&map[i]))
>>               continue;
>>           drm_gem_vunmap(obj, &map[i]);
>>       }
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c 
>> b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index 621924116eb4..3e738aea2664 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -286,13 +286,14 @@ void drm_gem_shmem_unpin(struct 
>> drm_gem_shmem_object *shmem)
>>   }
>>   EXPORT_SYMBOL(drm_gem_shmem_unpin);
>>   -static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object 
>> *shmem, struct dma_buf_map *map)
>> +static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object 
>> *shmem,
>> +                     struct iosys_map *map)
>>   {
>>       struct drm_gem_object *obj = &shmem->base;
>>       int ret = 0;
>>         if (shmem->vmap_use_count++ > 0) {
>> -        dma_buf_map_set_vaddr(map, shmem->vaddr);
>> +        iosys_map_set_vaddr(map, shmem->vaddr);
>>           return 0;
>>       }
>>   @@ -319,7 +320,7 @@ static int drm_gem_shmem_vmap_locked(struct 
>> drm_gem_shmem_object *shmem, struct
>>           if (!shmem->vaddr)
>>               ret = -ENOMEM;
>>           else
>> -            dma_buf_map_set_vaddr(map, shmem->vaddr);
>> +            iosys_map_set_vaddr(map, shmem->vaddr);
>>       }
>>         if (ret) {
>> @@ -353,7 +354,8 @@ static int drm_gem_shmem_vmap_locked(struct 
>> drm_gem_shmem_object *shmem, struct
>>    * Returns:
>>    * 0 on success or a negative error code on failure.
>>    */
>> -int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem, struct 
>> dma_buf_map *map)
>> +int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>> +               struct iosys_map *map)
>>   {
>>       int ret;
>>   @@ -368,7 +370,7 @@ int drm_gem_shmem_vmap(struct 
>> drm_gem_shmem_object *shmem, struct dma_buf_map *m
>>   EXPORT_SYMBOL(drm_gem_shmem_vmap);
>>     static void drm_gem_shmem_vunmap_locked(struct 
>> drm_gem_shmem_object *shmem,
>> -                    struct dma_buf_map *map)
>> +                    struct iosys_map *map)
>>   {
>>       struct drm_gem_object *obj = &shmem->base;
>>   @@ -400,7 +402,8 @@ static void drm_gem_shmem_vunmap_locked(struct 
>> drm_gem_shmem_object *shmem,
>>    * This function hides the differences between dma-buf imported and 
>> natively
>>    * allocated objects.
>>    */
>> -void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct 
>> dma_buf_map *map)
>> +void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>> +              struct iosys_map *map)
>>   {
>>       mutex_lock(&shmem->vmap_lock);
>>       drm_gem_shmem_vunmap_locked(shmem, map);
>> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c 
>> b/drivers/gpu/drm/drm_gem_ttm_helper.c
>> index ecf3d2a54a98..d5962a34c01d 100644
>> --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
>> @@ -61,7 +61,7 @@ EXPORT_SYMBOL(drm_gem_ttm_print_info);
>>    * 0 on success, or a negative errno code otherwise.
>>    */
>>   int drm_gem_ttm_vmap(struct drm_gem_object *gem,
>> -             struct dma_buf_map *map)
>> +             struct iosys_map *map)
>>   {
>>       struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
>>   @@ -78,7 +78,7 @@ EXPORT_SYMBOL(drm_gem_ttm_vmap);
>>    * &drm_gem_object_funcs.vmap callback.
>>    */
>>   void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
>> -            struct dma_buf_map *map)
>> +            struct iosys_map *map)
>>   {
>>       struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
>>   diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c 
>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index 3f00192215d1..dc7f938bfff2 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-or-later
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/module.h>
>>     #include <drm/drm_debugfs.h>
>> @@ -116,7 +116,7 @@ static void drm_gem_vram_cleanup(struct 
>> drm_gem_vram_object *gbo)
>>        */
>>         WARN_ON(gbo->vmap_use_count);
>> -    WARN_ON(dma_buf_map_is_set(&gbo->map));
>> +    WARN_ON(iosys_map_is_set(&gbo->map));
>>         drm_gem_object_release(&gbo->bo.base);
>>   }
>> @@ -365,7 +365,7 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object 
>> *gbo)
>>   EXPORT_SYMBOL(drm_gem_vram_unpin);
>>     static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
>> -                    struct dma_buf_map *map)
>> +                    struct iosys_map *map)
>>   {
>>       int ret;
>>   @@ -377,7 +377,7 @@ static int drm_gem_vram_kmap_locked(struct 
>> drm_gem_vram_object *gbo,
>>        * page mapping might still be around. Only vmap if the there's
>>        * no mapping present.
>>        */
>> -    if (dma_buf_map_is_null(&gbo->map)) {
>> +    if (iosys_map_is_null(&gbo->map)) {
>>           ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
>>           if (ret)
>>               return ret;
>> @@ -391,14 +391,14 @@ static int drm_gem_vram_kmap_locked(struct 
>> drm_gem_vram_object *gbo,
>>   }
>>     static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object 
>> *gbo,
>> -                       struct dma_buf_map *map)
>> +                       struct iosys_map *map)
>>   {
>>       struct drm_device *dev = gbo->bo.base.dev;
>>         if (drm_WARN_ON_ONCE(dev, !gbo->vmap_use_count))
>>           return;
>>   -    if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
>> +    if (drm_WARN_ON_ONCE(dev, !iosys_map_is_equal(&gbo->map, map)))
>>           return; /* BUG: map not mapped from this BO */
>>         if (--gbo->vmap_use_count > 0)
>> @@ -428,7 +428,7 @@ static void drm_gem_vram_kunmap_locked(struct 
>> drm_gem_vram_object *gbo,
>>    * Returns:
>>    * 0 on success, or a negative error code otherwise.
>>    */
>> -int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct 
>> dma_buf_map *map)
>> +int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct 
>> iosys_map *map)
>>   {
>>       int ret;
>>   @@ -463,7 +463,8 @@ EXPORT_SYMBOL(drm_gem_vram_vmap);
>>    * A call to drm_gem_vram_vunmap() unmaps and unpins a GEM VRAM 
>> buffer. See
>>    * the documentation for drm_gem_vram_vmap() for more information.
>>    */
>> -void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct 
>> dma_buf_map *map)
>> +void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
>> +             struct iosys_map *map)
>>   {
>>       int ret;
>>   @@ -567,7 +568,7 @@ static void 
>> drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_object *gbo)
>>           return;
>>         ttm_bo_vunmap(bo, &gbo->map);
>> -    dma_buf_map_clear(&gbo->map); /* explicitly clear mapping for 
>> next vmap call */
>> +    iosys_map_clear(&gbo->map); /* explicitly clear mapping for next 
>> vmap call */
>>   }
>>     static int drm_gem_vram_bo_driver_move(struct drm_gem_vram_object 
>> *gbo,
>> @@ -802,7 +803,8 @@ static void drm_gem_vram_object_unpin(struct 
>> drm_gem_object *gem)
>>    * Returns:
>>    * 0 on success, or a negative error code otherwise.
>>    */
>> -static int drm_gem_vram_object_vmap(struct drm_gem_object *gem, 
>> struct dma_buf_map *map)
>> +static int drm_gem_vram_object_vmap(struct drm_gem_object *gem,
>> +                    struct iosys_map *map)
>>   {
>>       struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
>>   @@ -815,7 +817,8 @@ static int drm_gem_vram_object_vmap(struct 
>> drm_gem_object *gem, struct dma_buf_m
>>    * @gem: The GEM object to unmap
>>    * @map: Kernel virtual address where the VRAM GEM object was mapped
>>    */
>> -static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem, 
>> struct dma_buf_map *map)
>> +static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem,
>> +                       struct iosys_map *map)
>>   {
>>       struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
>>   diff --git a/drivers/gpu/drm/drm_internal.h 
>> b/drivers/gpu/drm/drm_internal.h
>> index 17f3548c8ed2..1fbbc19f1ac0 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -33,7 +33,7 @@
>>     struct dentry;
>>   struct dma_buf;
>> -struct dma_buf_map;
>> +struct iosys_map;
>>   struct drm_connector;
>>   struct drm_crtc;
>>   struct drm_framebuffer;
>> @@ -174,8 +174,8 @@ void drm_gem_print_info(struct drm_printer *p, 
>> unsigned int indent,
>>     int drm_gem_pin(struct drm_gem_object *obj);
>>   void drm_gem_unpin(struct drm_gem_object *obj);
>> -int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>> -void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map 
>> *map);
>> +int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
>> +void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>>     int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device 
>> *dev,
>>                u32 handle);
>> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c 
>> b/drivers/gpu/drm/drm_mipi_dbi.c
>> index 0327d595e028..9314f2ead79f 100644
>> --- a/drivers/gpu/drm/drm_mipi_dbi.c
>> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
>> @@ -201,8 +201,8 @@ int mipi_dbi_buf_copy(void *dst, struct 
>> drm_framebuffer *fb,
>>                 struct drm_rect *clip, bool swap)
>>   {
>>       struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
>> -    struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>> -    struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
>> +    struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>> +    struct iosys_map data[DRM_FORMAT_MAX_PLANES];
>>       void *src;
>>       int ret;
>>   @@ -258,8 +258,8 @@ static void mipi_dbi_set_window_address(struct 
>> mipi_dbi_dev *dbidev,
>>     static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct 
>> drm_rect *rect)
>>   {
>> -    struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>> -    struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
>> +    struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>> +    struct iosys_map data[DRM_FORMAT_MAX_PLANES];
>>       struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
>>       unsigned int height = rect->y2 - rect->y1;
>>       unsigned int width = rect->x2 - rect->x1;
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index c773d3dfb1ab..e3f09f18110c 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -674,7 +674,7 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>>    *
>>    * Returns 0 on success or a negative errno code otherwise.
>>    */
>> -int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map 
>> *map)
>> +int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
>>   {
>>       struct drm_gem_object *obj = dma_buf->priv;
>>   @@ -690,7 +690,7 @@ EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
>>    * Releases a kernel virtual mapping. This can be used as the
>>    * &dma_buf_ops.vunmap callback. Calls into 
>> &drm_gem_object_funcs.vunmap for device specific handling.
>>    */
>> -void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct 
>> dma_buf_map *map)
>> +void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map 
>> *map)
>>   {
>>       struct drm_gem_object *obj = dma_buf->priv;
>>   diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h 
>> b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>> index 049ae87de9be..f32f4771dada 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>> @@ -49,7 +49,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device 
>> *dev, void *data,
>>     int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 
>> *offset);
>>   struct sg_table *etnaviv_gem_prime_get_sg_table(struct 
>> drm_gem_object *obj);
>> -int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map);
>> +int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> iosys_map *map);
>>   struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct 
>> drm_device *dev,
>>       struct dma_buf_attachment *attach, struct sg_table *sg);
>>   int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c 
>> b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> index 6788ea8490d1..3fa2da149639 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> @@ -25,14 +25,14 @@ struct sg_table 
>> *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
>>       return drm_prime_pages_to_sg(obj->dev, etnaviv_obj->pages, 
>> npages);
>>   }
>>   -int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map)
>> +int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> iosys_map *map)
>>   {
>>       void *vaddr;
>>         vaddr = etnaviv_gem_vmap(obj);
>>       if (!vaddr)
>>           return -ENOMEM;
>> -    dma_buf_map_set_vaddr(map, vaddr);
>> +    iosys_map_set_vaddr(map, vaddr);
>>         return 0;
>>   }
>> @@ -62,7 +62,7 @@ void etnaviv_gem_prime_unpin(struct drm_gem_object 
>> *obj)
>>     static void etnaviv_gem_prime_release(struct etnaviv_gem_object 
>> *etnaviv_obj)
>>   {
>> -    struct dma_buf_map map = 
>> DMA_BUF_MAP_INIT_VADDR(etnaviv_obj->vaddr);
>> +    struct iosys_map map = IOSYS_MAP_INIT_VADDR(etnaviv_obj->vaddr);
>>         if (etnaviv_obj->vaddr)
>> dma_buf_vunmap(etnaviv_obj->base.import_attach->dmabuf, &map);
>> @@ -77,7 +77,7 @@ static void etnaviv_gem_prime_release(struct 
>> etnaviv_gem_object *etnaviv_obj)
>>     static void *etnaviv_gem_prime_vmap_impl(struct 
>> etnaviv_gem_object *etnaviv_obj)
>>   {
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       int ret;
>>         lockdep_assert_held(&etnaviv_obj->lock);
>> diff --git a/drivers/gpu/drm/gud/gud_pipe.c 
>> b/drivers/gpu/drm/gud/gud_pipe.c
>> index a150a5a4b5d4..4873f9799f41 100644
>> --- a/drivers/gpu/drm/gud/gud_pipe.c
>> +++ b/drivers/gpu/drm/gud/gud_pipe.c
>> @@ -152,8 +152,8 @@ static int gud_prep_flush(struct gud_device 
>> *gdrm, struct drm_framebuffer *fb,
>>   {
>>       struct dma_buf_attachment *import_attach = 
>> fb->obj[0]->import_attach;
>>       u8 compression = gdrm->compression;
>> -    struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>> -    struct dma_buf_map map_data[DRM_FORMAT_MAX_PLANES];
>> +    struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>> +    struct iosys_map map_data[DRM_FORMAT_MAX_PLANES];
>>       void *vaddr, *buf;
>>       size_t pitch, len;
>>       int ret = 0;
>> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c 
>> b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
>> index 93f51e70a951..e82b815f83a6 100644
>> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
>> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
>> @@ -19,7 +19,7 @@
>>   #include "hyperv_drm.h"
>>     static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
>> -                    const struct dma_buf_map *map,
>> +                    const struct iosys_map *map,
>>                       struct drm_rect *rect)
>>   {
>>       struct hyperv_drm_device *hv = to_hv(fb->dev);
>> @@ -38,7 +38,8 @@ static int hyperv_blit_to_vram_rect(struct 
>> drm_framebuffer *fb,
>>       return 0;
>>   }
>>   -static int hyperv_blit_to_vram_fullscreen(struct drm_framebuffer 
>> *fb, const struct dma_buf_map *map)
>> +static int hyperv_blit_to_vram_fullscreen(struct drm_framebuffer *fb,
>> +                      const struct iosys_map *map)
>>   {
>>       struct drm_rect fullscreen = {
>>           .x1 = 0,
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> index 1b526039a60d..14fdb0796c52 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -74,7 +74,8 @@ static void i915_gem_unmap_dma_buf(struct 
>> dma_buf_attachment *attachment,
>>       kfree(sg);
>>   }
>>   -static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct 
>> dma_buf_map *map)
>> +static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf,
>> +                struct iosys_map *map)
>>   {
>>       struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
>>       void *vaddr;
>> @@ -83,12 +84,13 @@ static int i915_gem_dmabuf_vmap(struct dma_buf 
>> *dma_buf, struct dma_buf_map *map
>>       if (IS_ERR(vaddr))
>>           return PTR_ERR(vaddr);
>>   -    dma_buf_map_set_vaddr(map, vaddr);
>> +    iosys_map_set_vaddr(map, vaddr);
>>         return 0;
>>   }
>>   -static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct 
>> dma_buf_map *map)
>> +static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf,
>> +                   struct iosys_map *map)
>>   {
>>       struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
>>   diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c 
>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> index 3cc74b0fed06..b071a58dd6da 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> @@ -266,7 +266,7 @@ static int igt_dmabuf_import(void *arg)
>>       struct drm_i915_gem_object *obj;
>>       struct dma_buf *dmabuf;
>>       void *obj_map, *dma_map;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       u32 pattern[] = { 0, 0xaa, 0xcc, 0x55, 0xff };
>>       int err, i;
>>   @@ -349,7 +349,7 @@ static int igt_dmabuf_import_ownership(void *arg)
>>       struct drm_i915_private *i915 = arg;
>>       struct drm_i915_gem_object *obj;
>>       struct dma_buf *dmabuf;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       void *ptr;
>>       int err;
>>   @@ -400,7 +400,7 @@ static int igt_dmabuf_export_vmap(void *arg)
>>       struct drm_i915_private *i915 = arg;
>>       struct drm_i915_gem_object *obj;
>>       struct dma_buf *dmabuf;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       void *ptr;
>>       int err;
>>   diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c 
>> b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>> index 2855d11c7a51..b2a5882b8f81 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>> @@ -61,7 +61,7 @@ static void mock_dmabuf_release(struct dma_buf 
>> *dma_buf)
>>       kfree(mock);
>>   }
>>   -static int mock_dmabuf_vmap(struct dma_buf *dma_buf, struct 
>> dma_buf_map *map)
>> +static int mock_dmabuf_vmap(struct dma_buf *dma_buf, struct 
>> iosys_map *map)
>>   {
>>       struct mock_dmabuf *mock = to_mock(dma_buf);
>>       void *vaddr;
>> @@ -69,12 +69,12 @@ static int mock_dmabuf_vmap(struct dma_buf 
>> *dma_buf, struct dma_buf_map *map)
>>       vaddr = vm_map_ram(mock->pages, mock->npages, 0);
>>       if (!vaddr)
>>           return -ENOMEM;
>> -    dma_buf_map_set_vaddr(map, vaddr);
>> +    iosys_map_set_vaddr(map, vaddr);
>>         return 0;
>>   }
>>   -static void mock_dmabuf_vunmap(struct dma_buf *dma_buf, struct 
>> dma_buf_map *map)
>> +static void mock_dmabuf_vunmap(struct dma_buf *dma_buf, struct 
>> iosys_map *map)
>>   {
>>       struct mock_dmabuf *mock = to_mock(dma_buf);
>>   diff --git a/drivers/gpu/drm/lima/lima_gem.c 
>> b/drivers/gpu/drm/lima/lima_gem.c
>> index f9a9198ef198..d0c2b1422b3b 100644
>> --- a/drivers/gpu/drm/lima/lima_gem.c
>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>> @@ -2,6 +2,7 @@
>>   /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
>>     #include <linux/mm.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/sync_file.h>
>>   #include <linux/pagemap.h>
>>   #include <linux/shmem_fs.h>
>> @@ -182,7 +183,7 @@ static int lima_gem_pin(struct drm_gem_object *obj)
>>       return drm_gem_shmem_pin(&bo->base);
>>   }
>>   -static int lima_gem_vmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map)
>> +static int lima_gem_vmap(struct drm_gem_object *obj, struct 
>> iosys_map *map)
>>   {
>>       struct lima_bo *bo = to_lima_bo(obj);
>>   diff --git a/drivers/gpu/drm/lima/lima_sched.c 
>> b/drivers/gpu/drm/lima/lima_sched.c
>> index 5612d73f238f..390c969f74ad 100644
>> --- a/drivers/gpu/drm/lima/lima_sched.c
>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>> @@ -1,7 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0 OR MIT
>>   /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/kthread.h>
>>   #include <linux/slab.h>
>>   #include <linux/vmalloc.h>
>> @@ -284,7 +284,7 @@ static void 
>> lima_sched_build_error_task_list(struct lima_sched_task *task)
>>       struct lima_dump_chunk_buffer *buffer_chunk;
>>       u32 size, task_size, mem_size;
>>       int i;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       int ret;
>>         mutex_lock(&dev->error_task_list_lock);
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c 
>> b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
>> index d0544962cfc1..139d7724c6d0 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
>> @@ -220,7 +220,7 @@ struct drm_gem_object 
>> *mtk_gem_prime_import_sg_table(struct drm_device *dev,
>>       return &mtk_gem->base;
>>   }
>>   -int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map)
>> +int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> iosys_map *map)
>>   {
>>       struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
>>       struct sg_table *sgt = NULL;
>> @@ -247,12 +247,13 @@ int mtk_drm_gem_prime_vmap(struct 
>> drm_gem_object *obj, struct dma_buf_map *map)
>>     out:
>>       kfree(sgt);
>> -    dma_buf_map_set_vaddr(map, mtk_gem->kvaddr);
>> +    iosys_map_set_vaddr(map, mtk_gem->kvaddr);
>>         return 0;
>>   }
>>   -void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map)
>> +void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj,
>> +                  struct iosys_map *map)
>>   {
>>       struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
>>       void *vaddr = map->vaddr;
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h 
>> b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
>> index 9a359a06cb73..78f23b07a02e 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
>> @@ -42,7 +42,8 @@ int mtk_drm_gem_dumb_create(struct drm_file 
>> *file_priv, struct drm_device *dev,
>>   struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object 
>> *obj);
>>   struct drm_gem_object *mtk_gem_prime_import_sg_table(struct 
>> drm_device *dev,
>>               struct dma_buf_attachment *attach, struct sg_table *sg);
>> -int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map);
>> -void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map);
>> +int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> iosys_map *map);
>> +void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj,
>> +                  struct iosys_map *map);
>>     #endif
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> index cd9ba13ad5fc..6e18d3bbd720 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -9,7 +9,7 @@
>>    */
>>     #include <linux/delay.h>
>> -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>     #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_atomic_state_helper.h>
>> @@ -848,7 +848,7 @@ mgag200_simple_display_pipe_mode_valid(struct 
>> drm_simple_display_pipe *pipe,
>>     static void
>>   mgag200_handle_damage(struct mga_device *mdev, struct 
>> drm_framebuffer *fb,
>> -              struct drm_rect *clip, const struct dma_buf_map *map)
>> +              struct drm_rect *clip, const struct iosys_map *map)
>>   {
>>       void __iomem *dst = mdev->vram;
>>       void *vmap = map->vaddr; /* TODO: Use mapping abstraction 
>> properly */
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
>> b/drivers/gpu/drm/msm/msm_drv.h
>> index eb984d925f4d..c70868a3ac53 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -306,8 +306,8 @@ void msm_gem_shrinker_init(struct drm_device *dev);
>>   void msm_gem_shrinker_cleanup(struct drm_device *dev);
>>     struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object 
>> *obj);
>> -int msm_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map);
>> -void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map);
>> +int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map 
>> *map);
>> +void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct 
>> iosys_map *map);
>>   struct drm_gem_object *msm_gem_prime_import_sg_table(struct 
>> drm_device *dev,
>>           struct dma_buf_attachment *attach, struct sg_table *sg);
>>   int msm_gem_prime_pin(struct drm_gem_object *obj);
>> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c 
>> b/drivers/gpu/drm/msm/msm_gem_prime.c
>> index fc94e061d6a7..e8f1b7a2ca9c 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
>> @@ -22,19 +22,19 @@ struct sg_table 
>> *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>>       return drm_prime_pages_to_sg(obj->dev, msm_obj->pages, npages);
>>   }
>>   -int msm_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map)
>> +int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map 
>> *map)
>>   {
>>       void *vaddr;
>>         vaddr = msm_gem_get_vaddr(obj);
>>       if (IS_ERR(vaddr))
>>           return PTR_ERR(vaddr);
>> -    dma_buf_map_set_vaddr(map, vaddr);
>> +    iosys_map_set_vaddr(map, vaddr);
>>         return 0;
>>   }
>>   -void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map)
>> +void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct 
>> iosys_map *map)
>>   {
>>       msm_gem_put_vaddr(obj);
>>   }
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c 
>> b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
>> index 1d36df5af98d..bc0df93f7f21 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
>> @@ -1,16 +1,17 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /* Copyright 2019 Collabora Ltd */
>>   -#include <drm/drm_file.h>
>> -#include <drm/drm_gem_shmem_helper.h>
>> -#include <drm/panfrost_drm.h>
>>   #include <linux/completion.h>
>> -#include <linux/dma-buf-map.h>
>>   #include <linux/iopoll.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/slab.h>
>>   #include <linux/uaccess.h>
>>   +#include <drm/drm_file.h>
>> +#include <drm/drm_gem_shmem_helper.h>
>> +#include <drm/panfrost_drm.h>
>> +
>>   #include "panfrost_device.h"
>>   #include "panfrost_features.h"
>>   #include "panfrost_gem.h"
>> @@ -73,7 +74,7 @@ static int panfrost_perfcnt_enable_locked(struct 
>> panfrost_device *pfdev,
>>   {
>>       struct panfrost_file_priv *user = file_priv->driver_priv;
>>       struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       struct drm_gem_shmem_object *bo;
>>       u32 cfg, as;
>>       int ret;
>> @@ -181,7 +182,7 @@ static int panfrost_perfcnt_disable_locked(struct 
>> panfrost_device *pfdev,
>>   {
>>       struct panfrost_file_priv *user = file_priv->driver_priv;
>>       struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
>> -    struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(perfcnt->buf);
>> +    struct iosys_map map = IOSYS_MAP_INIT_VADDR(perfcnt->buf);
>>         if (user != perfcnt->user)
>>           return -EINVAL;
>> diff --git a/drivers/gpu/drm/qxl/qxl_display.c 
>> b/drivers/gpu/drm/qxl/qxl_display.c
>> index 9e0a1e836011..9a9c29b1d3e1 100644
>> --- a/drivers/gpu/drm/qxl/qxl_display.c
>> +++ b/drivers/gpu/drm/qxl/qxl_display.c
>> @@ -25,7 +25,7 @@
>>     #include <linux/crc32.h>
>>   #include <linux/delay.h>
>> -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>     #include <drm/drm_drv.h>
>>   #include <drm/drm_atomic.h>
>> @@ -566,8 +566,8 @@ static struct qxl_bo *qxl_create_cursor(struct 
>> qxl_device *qdev,
>>   {
>>       static const u32 size = 64 * 64 * 4;
>>       struct qxl_bo *cursor_bo;
>> -    struct dma_buf_map cursor_map;
>> -    struct dma_buf_map user_map;
>> +    struct iosys_map cursor_map;
>> +    struct iosys_map user_map;
>>       struct qxl_cursor cursor;
>>       int ret;
>>   @@ -1183,7 +1183,7 @@ int qxl_create_monitors_object(struct 
>> qxl_device *qdev)
>>   {
>>       int ret;
>>       struct drm_gem_object *gobj;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       int monitors_config_size = sizeof(struct qxl_monitors_config) +
>>           qxl_num_crtc * sizeof(struct qxl_head);
>>   diff --git a/drivers/gpu/drm/qxl/qxl_draw.c 
>> b/drivers/gpu/drm/qxl/qxl_draw.c
>> index 7d27891e87fa..a93de9e1977a 100644
>> --- a/drivers/gpu/drm/qxl/qxl_draw.c
>> +++ b/drivers/gpu/drm/qxl/qxl_draw.c
>> @@ -20,7 +20,7 @@
>>    * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
>> SOFTWARE.
>>    */
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>     #include <drm/drm_fourcc.h>
>>   @@ -44,7 +44,7 @@ static struct qxl_rect 
>> *drawable_set_clipping(struct qxl_device *qdev,
>>                             unsigned int num_clips,
>>                             struct qxl_bo *clips_bo)
>>   {
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       struct qxl_clip_rects *dev_clips;
>>       int ret;
>>   @@ -146,7 +146,7 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
>>       int stride = fb->pitches[0];
>>       /* depth is not actually interesting, we don't mask with it */
>>       int depth = fb->format->cpp[0] * 8;
>> -    struct dma_buf_map surface_map;
>> +    struct iosys_map surface_map;
>>       uint8_t *surface_base;
>>       struct qxl_release *release;
>>       struct qxl_bo *clips_bo;
>> diff --git a/drivers/gpu/drm/qxl/qxl_drv.h 
>> b/drivers/gpu/drm/qxl/qxl_drv.h
>> index 29641ceaab7d..47c169673088 100644
>> --- a/drivers/gpu/drm/qxl/qxl_drv.h
>> +++ b/drivers/gpu/drm/qxl/qxl_drv.h
>> @@ -30,7 +30,7 @@
>>    * Definitions taken from spice-protocol, plus kernel driver 
>> specific bits.
>>    */
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/dma-fence.h>
>>   #include <linux/firmware.h>
>>   #include <linux/platform_device.h>
>> @@ -50,7 +50,7 @@
>>     #include "qxl_dev.h"
>>   -struct dma_buf_map;
>> +struct iosys_map;
>>     #define DRIVER_AUTHOR        "Dave Airlie"
>>   @@ -80,7 +80,7 @@ struct qxl_bo {
>>       /* Protected by tbo.reserved */
>>       struct ttm_place        placements[3];
>>       struct ttm_placement        placement;
>> -    struct dma_buf_map        map;
>> +    struct iosys_map        map;
>>       void                *kptr;
>>       unsigned int                    map_count;
>>       int                             type;
>> @@ -427,9 +427,9 @@ struct sg_table 
>> *qxl_gem_prime_get_sg_table(struct drm_gem_object *obj);
>>   struct drm_gem_object *qxl_gem_prime_import_sg_table(
>>       struct drm_device *dev, struct dma_buf_attachment *attach,
>>       struct sg_table *sgt);
>> -int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map);
>> +int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map 
>> *map);
>>   void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
>> -              struct dma_buf_map *map);
>> +              struct iosys_map *map);
>>     /* qxl_irq.c */
>>   int qxl_irq_init(struct qxl_device *qdev);
>> diff --git a/drivers/gpu/drm/qxl/qxl_object.c 
>> b/drivers/gpu/drm/qxl/qxl_object.c
>> index fbb36e3e8564..b42a657e4c2f 100644
>> --- a/drivers/gpu/drm/qxl/qxl_object.c
>> +++ b/drivers/gpu/drm/qxl/qxl_object.c
>> @@ -23,7 +23,7 @@
>>    *          Alon Levy
>>    */
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/io-mapping.h>
>>     #include "qxl_drv.h"
>> @@ -158,7 +158,7 @@ int qxl_bo_create(struct qxl_device *qdev, 
>> unsigned long size,
>>       return 0;
>>   }
>>   -int qxl_bo_vmap_locked(struct qxl_bo *bo, struct dma_buf_map *map)
>> +int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
>>   {
>>       int r;
>>   @@ -184,7 +184,7 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, 
>> struct dma_buf_map *map)
>>       return 0;
>>   }
>>   -int qxl_bo_vmap(struct qxl_bo *bo, struct dma_buf_map *map)
>> +int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
>>   {
>>       int r;
>>   @@ -210,7 +210,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device 
>> *qdev,
>>       void *rptr;
>>       int ret;
>>       struct io_mapping *map;
>> -    struct dma_buf_map bo_map;
>> +    struct iosys_map bo_map;
>>         if (bo->tbo.resource->mem_type == TTM_PL_VRAM)
>>           map = qdev->vram_mapping;
>> diff --git a/drivers/gpu/drm/qxl/qxl_object.h 
>> b/drivers/gpu/drm/qxl/qxl_object.h
>> index cee4b52b75dd..53392cb90eec 100644
>> --- a/drivers/gpu/drm/qxl/qxl_object.h
>> +++ b/drivers/gpu/drm/qxl/qxl_object.h
>> @@ -59,8 +59,8 @@ extern int qxl_bo_create(struct qxl_device *qdev,
>>                u32 priority,
>>                struct qxl_surface *surf,
>>                struct qxl_bo **bo_ptr);
>> -int qxl_bo_vmap(struct qxl_bo *bo, struct dma_buf_map *map);
>> -int qxl_bo_vmap_locked(struct qxl_bo *bo, struct dma_buf_map *map);
>> +int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map);
>> +int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map);
>>   int qxl_bo_vunmap(struct qxl_bo *bo);
>>   void qxl_bo_vunmap_locked(struct qxl_bo *bo);
>>   void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct 
>> qxl_bo *bo, int page_offset);
>> diff --git a/drivers/gpu/drm/qxl/qxl_prime.c 
>> b/drivers/gpu/drm/qxl/qxl_prime.c
>> index 4a10cb0a413b..142d01415acb 100644
>> --- a/drivers/gpu/drm/qxl/qxl_prime.c
>> +++ b/drivers/gpu/drm/qxl/qxl_prime.c
>> @@ -54,7 +54,7 @@ struct drm_gem_object *qxl_gem_prime_import_sg_table(
>>       return ERR_PTR(-ENOSYS);
>>   }
>>   -int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map)
>> +int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map 
>> *map)
>>   {
>>       struct qxl_bo *bo = gem_to_qxl_bo(obj);
>>       int ret;
>> @@ -67,7 +67,7 @@ int qxl_gem_prime_vmap(struct drm_gem_object *obj, 
>> struct dma_buf_map *map)
>>   }
>>     void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
>> -              struct dma_buf_map *map)
>> +              struct iosys_map *map)
>>   {
>>       struct qxl_bo *bo = gem_to_qxl_bo(obj);
>>   diff --git a/drivers/gpu/drm/radeon/radeon_gem.c 
>> b/drivers/gpu/drm/radeon/radeon_gem.c
>> index a36a4f2c76b0..f563284a7fac 100644
>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>> @@ -26,6 +26,7 @@
>>    *          Jerome Glisse
>>    */
>>   +#include <linux/iosys-map.h>
>>   #include <linux/pci.h>
>>     #include <drm/drm_device.h>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c 
>> b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>> index 63eb73b624aa..985584147da1 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>> @@ -510,7 +510,7 @@ rockchip_gem_prime_import_sg_table(struct 
>> drm_device *drm,
>>       return ERR_PTR(ret);
>>   }
>>   -int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map)
>> +int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> iosys_map *map)
>>   {
>>       struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
>>   @@ -519,18 +519,19 @@ int rockchip_gem_prime_vmap(struct 
>> drm_gem_object *obj, struct dma_buf_map *map)
>>                     pgprot_writecombine(PAGE_KERNEL));
>>           if (!vaddr)
>>               return -ENOMEM;
>> -        dma_buf_map_set_vaddr(map, vaddr);
>> +        iosys_map_set_vaddr(map, vaddr);
>>           return 0;
>>       }
>>         if (rk_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
>>           return -ENOMEM;
>> -    dma_buf_map_set_vaddr(map, rk_obj->kvaddr);
>> +    iosys_map_set_vaddr(map, rk_obj->kvaddr);
>>         return 0;
>>   }
>>   -void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map)
>> +void rockchip_gem_prime_vunmap(struct drm_gem_object *obj,
>> +                   struct iosys_map *map)
>>   {
>>       struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
>>   diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h 
>> b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
>> index 47c1861eece0..72f59ac6d258 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
>> @@ -31,8 +31,9 @@ struct drm_gem_object *
>>   rockchip_gem_prime_import_sg_table(struct drm_device *dev,
>>                      struct dma_buf_attachment *attach,
>>                      struct sg_table *sg);
>> -int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map);
>> -void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, struct 
>> dma_buf_map *map);
>> +int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct 
>> iosys_map *map);
>> +void rockchip_gem_prime_vunmap(struct drm_gem_object *obj,
>> +                   struct iosys_map *map);
>>     struct rockchip_gem_object *
>>       rockchip_gem_create_object(struct drm_device *drm, unsigned int 
>> size,
>> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
>> index d38fd7e12b57..ef208384665e 100644
>> --- a/drivers/gpu/drm/tegra/gem.c
>> +++ b/drivers/gpu/drm/tegra/gem.c
>> @@ -135,7 +135,7 @@ static void tegra_bo_unpin(struct device *dev, 
>> struct sg_table *sgt)
>>   static void *tegra_bo_mmap(struct host1x_bo *bo)
>>   {
>>       struct tegra_bo *obj = host1x_to_tegra_bo(bo);
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       int ret;
>>         if (obj->vaddr) {
>> @@ -152,7 +152,7 @@ static void *tegra_bo_mmap(struct host1x_bo *bo)
>>   static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
>>   {
>>       struct tegra_bo *obj = host1x_to_tegra_bo(bo);
>> -    struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(addr);
>> +    struct iosys_map map = IOSYS_MAP_INIT_VADDR(addr);
>>         if (obj->vaddr)
>>           return;
>> @@ -650,17 +650,17 @@ static int tegra_gem_prime_mmap(struct dma_buf 
>> *buf, struct vm_area_struct *vma)
>>       return __tegra_gem_mmap(gem, vma);
>>   }
>>   -static int tegra_gem_prime_vmap(struct dma_buf *buf, struct 
>> dma_buf_map *map)
>> +static int tegra_gem_prime_vmap(struct dma_buf *buf, struct 
>> iosys_map *map)
>>   {
>>       struct drm_gem_object *gem = buf->priv;
>>       struct tegra_bo *bo = to_tegra_bo(gem);
>>   -    dma_buf_map_set_vaddr(map, bo->vaddr);
>> +    iosys_map_set_vaddr(map, bo->vaddr);
>>         return 0;
>>   }
>>   -static void tegra_gem_prime_vunmap(struct dma_buf *buf, struct 
>> dma_buf_map *map)
>> +static void tegra_gem_prime_vunmap(struct dma_buf *buf, struct 
>> iosys_map *map)
>>   {
>>   }
>>   diff --git a/drivers/gpu/drm/tiny/cirrus.c 
>> b/drivers/gpu/drm/tiny/cirrus.c
>> index ecf2475d0f16..c8e791840862 100644
>> --- a/drivers/gpu/drm/tiny/cirrus.c
>> +++ b/drivers/gpu/drm/tiny/cirrus.c
>> @@ -16,7 +16,7 @@
>>    * Copyright 1999-2001 Jeff Garzik <jgarzik@pobox.com>
>>    */
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>>   @@ -313,7 +313,8 @@ static int cirrus_mode_set(struct cirrus_device 
>> *cirrus,
>>       return 0;
>>   }
>>   -static int cirrus_fb_blit_rect(struct drm_framebuffer *fb, const 
>> struct dma_buf_map *map,
>> +static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>> +                   const struct iosys_map *map,
>>                      struct drm_rect *rect)
>>   {
>>       struct cirrus_device *cirrus = to_cirrus(fb->dev);
>> @@ -345,7 +346,8 @@ static int cirrus_fb_blit_rect(struct 
>> drm_framebuffer *fb, const struct dma_buf_
>>       return 0;
>>   }
>>   -static int cirrus_fb_blit_fullscreen(struct drm_framebuffer *fb, 
>> const struct dma_buf_map *map)
>> +static int cirrus_fb_blit_fullscreen(struct drm_framebuffer *fb,
>> +                     const struct iosys_map *map)
>>   {
>>       struct drm_rect fullscreen = {
>>           .x1 = 0,
>> diff --git a/drivers/gpu/drm/tiny/gm12u320.c 
>> b/drivers/gpu/drm/tiny/gm12u320.c
>> index 6bc0c298739c..648e585d40a8 100644
>> --- a/drivers/gpu/drm/tiny/gm12u320.c
>> +++ b/drivers/gpu/drm/tiny/gm12u320.c
>> @@ -95,7 +95,7 @@ struct gm12u320_device {
>>           struct drm_rect          rect;
>>           int frame;
>>           int draw_status_timeout;
>> -        struct dma_buf_map src_map;
>> +        struct iosys_map src_map;
>>       } fb_update;
>>   };
>>   @@ -395,7 +395,8 @@ static void gm12u320_fb_update_work(struct 
>> work_struct *work)
>>           GM12U320_ERR("Frame update error: %d\n", ret);
>>   }
>>   -static void gm12u320_fb_mark_dirty(struct drm_framebuffer *fb, 
>> const struct dma_buf_map *map,
>> +static void gm12u320_fb_mark_dirty(struct drm_framebuffer *fb,
>> +                   const struct iosys_map *map,
>>                      struct drm_rect *dirty)
>>   {
>>       struct gm12u320_device *gm12u320 = to_gm12u320(fb->dev);
>> @@ -438,7 +439,7 @@ static void gm12u320_stop_fb_update(struct 
>> gm12u320_device *gm12u320)
>>       mutex_lock(&gm12u320->fb_update.lock);
>>       old_fb = gm12u320->fb_update.fb;
>>       gm12u320->fb_update.fb = NULL;
>> -    dma_buf_map_clear(&gm12u320->fb_update.src_map);
>> +    iosys_map_clear(&gm12u320->fb_update.src_map);
>>       mutex_unlock(&gm12u320->fb_update.lock);
>>         drm_framebuffer_put(old_fb);
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 544a84fa6589..2b8caa1efaa3 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -33,7 +33,7 @@
>>   #include <drm/ttm/ttm_placement.h>
>>   #include <drm/drm_cache.h>
>>   #include <drm/drm_vma_manager.h>
>> -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/io.h>
>>   #include <linux/highmem.h>
>>   #include <linux/wait.h>
>> @@ -93,7 +93,7 @@ void ttm_move_memcpy(bool clear,
>>   {
>>       const struct ttm_kmap_iter_ops *dst_ops = dst_iter->ops;
>>       const struct ttm_kmap_iter_ops *src_ops = src_iter->ops;
>> -    struct dma_buf_map src_map, dst_map;
>> +    struct iosys_map src_map, dst_map;
>>       pgoff_t i;
>>         /* Single TTM move. NOP */
>> @@ -390,7 +390,7 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
>>   }
>>   EXPORT_SYMBOL(ttm_bo_kunmap);
>>   -int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map 
>> *map)
>> +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>>   {
>>       struct ttm_resource *mem = bo->resource;
>>       int ret;
>> @@ -418,7 +418,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>> struct dma_buf_map *map)
>>           if (!vaddr_iomem)
>>               return -ENOMEM;
>>   -        dma_buf_map_set_vaddr_iomem(map, vaddr_iomem);
>> +        iosys_map_set_vaddr_iomem(map, vaddr_iomem);
>>         } else {
>>           struct ttm_operation_ctx ctx = {
>> @@ -442,25 +442,25 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>> struct dma_buf_map *map)
>>           if (!vaddr)
>>               return -ENOMEM;
>>   -        dma_buf_map_set_vaddr(map, vaddr);
>> +        iosys_map_set_vaddr(map, vaddr);
>>       }
>>         return 0;
>>   }
>>   EXPORT_SYMBOL(ttm_bo_vmap);
>>   -void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct 
>> dma_buf_map *map)
>> +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>>   {
>>       struct ttm_resource *mem = bo->resource;
>>   -    if (dma_buf_map_is_null(map))
>> +    if (iosys_map_is_null(map))
>>           return;
>>         if (!map->is_iomem)
>>           vunmap(map->vaddr);
>>       else if (!mem->bus.addr)
>>           iounmap(map->vaddr_iomem);
>> -    dma_buf_map_clear(map);
>> +    iosys_map_clear(map);
>>         ttm_mem_io_free(bo->bdev, bo->resource);
>>   }
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c 
>> b/drivers/gpu/drm/ttm/ttm_resource.c
>> index 68344c90549b..eedda3761506 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -22,7 +22,7 @@
>>    * Authors: Christian König
>>    */
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/io-mapping.h>
>>   #include <linux/scatterlist.h>
>>   @@ -244,7 +244,7 @@ void ttm_resource_manager_debug(struct 
>> ttm_resource_manager *man,
>>   EXPORT_SYMBOL(ttm_resource_manager_debug);
>>     static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter 
>> *iter,
>> -                      struct dma_buf_map *dmap,
>> +                      struct iosys_map *dmap,
>>                         pgoff_t i)
>>   {
>>       struct ttm_kmap_iter_iomap *iter_io =
>> @@ -271,11 +271,11 @@ static void 
>> ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
>>       addr = io_mapping_map_local_wc(iter_io->iomap, 
>> iter_io->cache.offs +
>>                          (((resource_size_t)i - iter_io->cache.i)
>>                       << PAGE_SHIFT));
>> -    dma_buf_map_set_vaddr_iomem(dmap, addr);
>> +    iosys_map_set_vaddr_iomem(dmap, addr);
>>   }
>>     static void ttm_kmap_iter_iomap_unmap_local(struct ttm_kmap_iter 
>> *iter,
>> -                        struct dma_buf_map *map)
>> +                        struct iosys_map *map)
>>   {
>>       io_mapping_unmap_local(map->vaddr_iomem);
>>   }
>> @@ -326,14 +326,14 @@ EXPORT_SYMBOL(ttm_kmap_iter_iomap_init);
>>    */
>>     static void ttm_kmap_iter_linear_io_map_local(struct 
>> ttm_kmap_iter *iter,
>> -                          struct dma_buf_map *dmap,
>> +                          struct iosys_map *dmap,
>>                             pgoff_t i)
>>   {
>>       struct ttm_kmap_iter_linear_io *iter_io =
>>           container_of(iter, typeof(*iter_io), base);
>>         *dmap = iter_io->dmap;
>> -    dma_buf_map_incr(dmap, i * PAGE_SIZE);
>> +    iosys_map_incr(dmap, i * PAGE_SIZE);
>>   }
>>     static const struct ttm_kmap_iter_ops ttm_kmap_iter_linear_io_ops 
>> = {
>> @@ -369,7 +369,7 @@ ttm_kmap_iter_linear_io_init(struct 
>> ttm_kmap_iter_linear_io *iter_io,
>>       }
>>         if (mem->bus.addr) {
>> -        dma_buf_map_set_vaddr(&iter_io->dmap, mem->bus.addr);
>> +        iosys_map_set_vaddr(&iter_io->dmap, mem->bus.addr);
>>           iter_io->needs_unmap = false;
>>       } else {
>>           size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
>> @@ -377,23 +377,23 @@ ttm_kmap_iter_linear_io_init(struct 
>> ttm_kmap_iter_linear_io *iter_io,
>>           iter_io->needs_unmap = true;
>>           memset(&iter_io->dmap, 0, sizeof(iter_io->dmap));
>>           if (mem->bus.caching == ttm_write_combined)
>> -            dma_buf_map_set_vaddr_iomem(&iter_io->dmap,
>> +            iosys_map_set_vaddr_iomem(&iter_io->dmap,
>>                               ioremap_wc(mem->bus.offset,
>>                                      bus_size));
>>           else if (mem->bus.caching == ttm_cached)
>> -            dma_buf_map_set_vaddr(&iter_io->dmap,
>> +            iosys_map_set_vaddr(&iter_io->dmap,
>>                             memremap(mem->bus.offset, bus_size,
>>                                  MEMREMAP_WB |
>>                                  MEMREMAP_WT |
>>                                  MEMREMAP_WC));
>>             /* If uncached requested or if mapping cached or wc 
>> failed */
>> -        if (dma_buf_map_is_null(&iter_io->dmap))
>> -            dma_buf_map_set_vaddr_iomem(&iter_io->dmap,
>> +        if (iosys_map_is_null(&iter_io->dmap))
>> +            iosys_map_set_vaddr_iomem(&iter_io->dmap,
>>                               ioremap(mem->bus.offset,
>>                                   bus_size));
>>   -        if (dma_buf_map_is_null(&iter_io->dmap)) {
>> +        if (iosys_map_is_null(&iter_io->dmap)) {
>>               ret = -ENOMEM;
>>               goto out_io_free;
>>           }
>> @@ -422,7 +422,7 @@ ttm_kmap_iter_linear_io_fini(struct 
>> ttm_kmap_iter_linear_io *iter_io,
>>                    struct ttm_device *bdev,
>>                    struct ttm_resource *mem)
>>   {
>> -    if (iter_io->needs_unmap && dma_buf_map_is_set(&iter_io->dmap)) {
>> +    if (iter_io->needs_unmap && iosys_map_is_set(&iter_io->dmap)) {
>>           if (iter_io->dmap.is_iomem)
>>               iounmap(iter_io->dmap.vaddr_iomem);
>>           else
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>> index 79c870a3bef8..ef6343b78d71 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> @@ -406,18 +406,18 @@ void ttm_tt_mgr_init(unsigned long num_pages, 
>> unsigned long num_dma32_pages)
>>   }
>>     static void ttm_kmap_iter_tt_map_local(struct ttm_kmap_iter *iter,
>> -                       struct dma_buf_map *dmap,
>> +                       struct iosys_map *dmap,
>>                          pgoff_t i)
>>   {
>>       struct ttm_kmap_iter_tt *iter_tt =
>>           container_of(iter, typeof(*iter_tt), base);
>>   -    dma_buf_map_set_vaddr(dmap, 
>> kmap_local_page_prot(iter_tt->tt->pages[i],
>> +    iosys_map_set_vaddr(dmap, 
>> kmap_local_page_prot(iter_tt->tt->pages[i],
>>                                iter_tt->prot));
>>   }
>>     static void ttm_kmap_iter_tt_unmap_local(struct ttm_kmap_iter *iter,
>> -                     struct dma_buf_map *map)
>> +                     struct iosys_map *map)
>>   {
>>       kunmap_local(map->vaddr);
>>   }
>> diff --git a/drivers/gpu/drm/udl/udl_modeset.c 
>> b/drivers/gpu/drm/udl/udl_modeset.c
>> index 32232228dae9..e67c40a48fb4 100644
>> --- a/drivers/gpu/drm/udl/udl_modeset.c
>> +++ b/drivers/gpu/drm/udl/udl_modeset.c
>> @@ -264,7 +264,8 @@ static int udl_aligned_damage_clip(struct 
>> drm_rect *clip, int x, int y,
>>       return 0;
>>   }
>>   -static int udl_handle_damage(struct drm_framebuffer *fb, const 
>> struct dma_buf_map *map,
>> +static int udl_handle_damage(struct drm_framebuffer *fb,
>> +                 const struct iosys_map *map,
>>                    int x, int y, int width, int height)
>>   {
>>       struct drm_device *dev = fb->dev;
>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c 
>> b/drivers/gpu/drm/vboxvideo/vbox_mode.c
>> index 4227a915b06a..4017b0a621fc 100644
>> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
>> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
>> @@ -10,7 +10,7 @@
>>    *          Hans de Goede <hdegoede@redhat.com>
>>    */
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/export.h>
>>     #include <drm/drm_atomic.h>
>> @@ -398,7 +398,7 @@ static void vbox_cursor_atomic_update(struct 
>> drm_plane *plane,
>>       u32 height = new_state->crtc_h;
>>       struct drm_shadow_plane_state *shadow_plane_state =
>>           to_drm_shadow_plane_state(new_state);
>> -    struct dma_buf_map map = shadow_plane_state->data[0];
>> +    struct iosys_map map = shadow_plane_state->data[0];
>>       u8 *src = map.vaddr; /* TODO: Use mapping abstraction properly */
>>       size_t data_size, mask_size;
>>       u32 flags;
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c 
>> b/drivers/gpu/drm/vkms/vkms_composer.c
>> index 9e8204be9a14..c6a1036bf2ea 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -157,7 +157,7 @@ static void compose_plane(struct vkms_composer 
>> *primary_composer,
>>       void *vaddr;
>>       void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
>>   -    if (WARN_ON(dma_buf_map_is_null(&primary_composer->map[0])))
>> +    if (WARN_ON(iosys_map_is_null(&primary_composer->map[0])))
>>           return;
>>         vaddr = plane_composer->map[0].vaddr;
>> @@ -187,7 +187,7 @@ static int compose_active_planes(void **vaddr_out,
>>           }
>>       }
>>   -    if (WARN_ON(dma_buf_map_is_null(&primary_composer->map[0])))
>> +    if (WARN_ON(iosys_map_is_null(&primary_composer->map[0])))
>>           return -EINVAL;
>>         vaddr = primary_composer->map[0].vaddr;
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h 
>> b/drivers/gpu/drm/vkms/vkms_drv.h
>> index 9496fdc900b8..91e63b12f60f 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -23,14 +23,14 @@
>>   #define NUM_OVERLAY_PLANES 8
>>     struct vkms_writeback_job {
>> -    struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>> -    struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
>> +    struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>> +    struct iosys_map data[DRM_FORMAT_MAX_PLANES];
>>   };
>>     struct vkms_composer {
>>       struct drm_framebuffer fb;
>>       struct drm_rect src, dst;
>> -    struct dma_buf_map map[4];
>> +    struct iosys_map map[4];
>>       unsigned int offset;
>>       unsigned int pitch;
>>       unsigned int cpp;
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c 
>> b/drivers/gpu/drm/vkms/vkms_plane.c
>> index 32409e15244b..d8eb674b49a6 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0+
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>     #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c 
>> b/drivers/gpu/drm/vkms/vkms_writeback.c
>> index 8694227f555f..af1604dfbbaf 100644
>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0+
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>     #include <drm/drm_atomic.h>
>>   #include <drm/drm_fourcc.h>
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c 
>> b/drivers/gpu/drm/xen/xen_drm_front_gem.c
>> index dd358ba2bf8e..5a5bf4e5b717 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
>> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
>> @@ -280,7 +280,8 @@ xen_drm_front_gem_import_sg_table(struct 
>> drm_device *dev,
>>       return &xen_obj->base;
>>   }
>>   -int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj, 
>> struct dma_buf_map *map)
>> +int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj,
>> +                 struct iosys_map *map)
>>   {
>>       struct xen_gem_object *xen_obj = to_xen_gem_obj(gem_obj);
>>       void *vaddr;
>> @@ -293,13 +294,13 @@ int xen_drm_front_gem_prime_vmap(struct 
>> drm_gem_object *gem_obj, struct dma_buf_
>>                VM_MAP, PAGE_KERNEL);
>>       if (!vaddr)
>>           return -ENOMEM;
>> -    dma_buf_map_set_vaddr(map, vaddr);
>> +    iosys_map_set_vaddr(map, vaddr);
>>         return 0;
>>   }
>>     void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
>> -                    struct dma_buf_map *map)
>> +                    struct iosys_map *map)
>>   {
>>       vunmap(map->vaddr);
>>   }
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.h 
>> b/drivers/gpu/drm/xen/xen_drm_front_gem.h
>> index eaea470f7001..a718a1f382a3 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.h
>> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.h
>> @@ -12,7 +12,7 @@
>>   #define __XEN_DRM_FRONT_GEM_H
>>     struct dma_buf_attachment;
>> -struct dma_buf_map;
>> +struct iosys_map;
>>   struct drm_device;
>>   struct drm_gem_object;
>>   struct sg_table;
>> @@ -32,9 +32,9 @@ struct page **xen_drm_front_gem_get_pages(struct 
>> drm_gem_object *obj);
>>   void xen_drm_front_gem_free_object_unlocked(struct drm_gem_object 
>> *gem_obj);
>>     int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj,
>> -                 struct dma_buf_map *map);
>> +                 struct iosys_map *map);
>>     void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
>> -                    struct dma_buf_map *map);
>> +                    struct iosys_map *map);
>>     #endif /* __XEN_DRM_FRONT_GEM_H */
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c 
>> b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> index 556e42ba66e5..f274f48aefeb 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> @@ -99,7 +99,7 @@ static void *vb2_dc_vaddr(struct vb2_buffer *vb, 
>> void *buf_priv)
>>           return buf->vaddr;
>>         if (buf->db_attach) {
>> -        struct dma_buf_map map;
>> +        struct iosys_map map;
>>             if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
>>               buf->vaddr = map.vaddr;
>> @@ -446,7 +446,7 @@ vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf 
>> *dbuf,
>>       return 0;
>>   }
>>   -static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct 
>> dma_buf_map *map)
>> +static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct 
>> iosys_map *map)
>>   {
>>       struct vb2_dc_buf *buf;
>>       void *vaddr;
>> @@ -456,7 +456,7 @@ static int vb2_dc_dmabuf_ops_vmap(struct dma_buf 
>> *dbuf, struct dma_buf_map *map)
>>       if (!vaddr)
>>           return -EINVAL;
>>   -    dma_buf_map_set_vaddr(map, vaddr);
>> +    iosys_map_set_vaddr(map, vaddr);
>>         return 0;
>>   }
>> @@ -737,7 +737,7 @@ static void vb2_dc_unmap_dmabuf(void *mem_priv)
>>   {
>>       struct vb2_dc_buf *buf = mem_priv;
>>       struct sg_table *sgt = buf->dma_sgt;
>> -    struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buf->vaddr);
>> +    struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
>>         if (WARN_ON(!buf->db_attach)) {
>>           pr_err("trying to unpin a not attached buffer\n");
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c 
>> b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>> index 90acafd9a290..f8a21c560ad2 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>> @@ -303,7 +303,7 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
>>   static void *vb2_dma_sg_vaddr(struct vb2_buffer *vb, void *buf_priv)
>>   {
>>       struct vb2_dma_sg_buf *buf = buf_priv;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       int ret;
>>         BUG_ON(!buf);
>> @@ -492,11 +492,12 @@ vb2_dma_sg_dmabuf_ops_end_cpu_access(struct 
>> dma_buf *dbuf,
>>       return 0;
>>   }
>>   -static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf, struct 
>> dma_buf_map *map)
>> +static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf,
>> +                      struct iosys_map *map)
>>   {
>>       struct vb2_dma_sg_buf *buf = dbuf->priv;
>>   -    dma_buf_map_set_vaddr(map, buf->vaddr);
>> +    iosys_map_set_vaddr(map, buf->vaddr);
>>         return 0;
>>   }
>> @@ -581,7 +582,7 @@ static void vb2_dma_sg_unmap_dmabuf(void *mem_priv)
>>   {
>>       struct vb2_dma_sg_buf *buf = mem_priv;
>>       struct sg_table *sgt = buf->dma_sgt;
>> -    struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buf->vaddr);
>> +    struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
>>         if (WARN_ON(!buf->db_attach)) {
>>           pr_err("trying to unpin a not attached buffer\n");
>> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c 
>> b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
>> index 0bbfea66554f..948152f1596b 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
>> @@ -312,11 +312,12 @@ static void 
>> vb2_vmalloc_dmabuf_ops_release(struct dma_buf *dbuf)
>>       vb2_vmalloc_put(dbuf->priv);
>>   }
>>   -static int vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf, 
>> struct dma_buf_map *map)
>> +static int vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf,
>> +                       struct iosys_map *map)
>>   {
>>       struct vb2_vmalloc_buf *buf = dbuf->priv;
>>   -    dma_buf_map_set_vaddr(map, buf->vaddr);
>> +    iosys_map_set_vaddr(map, buf->vaddr);
>>         return 0;
>>   }
>> @@ -372,7 +373,7 @@ static struct dma_buf 
>> *vb2_vmalloc_get_dmabuf(struct vb2_buffer *vb,
>>   static int vb2_vmalloc_map_dmabuf(void *mem_priv)
>>   {
>>       struct vb2_vmalloc_buf *buf = mem_priv;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>       int ret;
>>         ret = dma_buf_vmap(buf->dbuf, &map);
>> @@ -386,7 +387,7 @@ static int vb2_vmalloc_map_dmabuf(void *mem_priv)
>>   static void vb2_vmalloc_unmap_dmabuf(void *mem_priv)
>>   {
>>       struct vb2_vmalloc_buf *buf = mem_priv;
>> -    struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buf->vaddr);
>> +    struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
>>         dma_buf_vunmap(buf->dbuf, &map);
>>       buf->vaddr = NULL;
>> @@ -395,7 +396,7 @@ static void vb2_vmalloc_unmap_dmabuf(void *mem_priv)
>>   static void vb2_vmalloc_detach_dmabuf(void *mem_priv)
>>   {
>>       struct vb2_vmalloc_buf *buf = mem_priv;
>> -    struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buf->vaddr);
>> +    struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
>>         if (buf->vaddr)
>>           dma_buf_vunmap(buf->dbuf, &map);
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 4ccbf43e6bfa..5c0503655212 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -587,11 +587,11 @@ static void fastrpc_dma_buf_detatch(struct 
>> dma_buf *dmabuf,
>>       kfree(a);
>>   }
>>   -static int fastrpc_vmap(struct dma_buf *dmabuf, struct dma_buf_map 
>> *map)
>> +static int fastrpc_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>>   {
>>       struct fastrpc_buf *buf = dmabuf->priv;
>>   -    dma_buf_map_set_vaddr(map, buf->virt);
>> +    iosys_map_set_vaddr(map, buf->virt);
>>         return 0;
>>   }
>> diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
>> index cc9de1632dd3..22deb216b59c 100644
>> --- a/include/drm/drm_cache.h
>> +++ b/include/drm/drm_cache.h
>> @@ -35,7 +35,7 @@
>>     #include <linux/scatterlist.h>
>>   -struct dma_buf_map;
>> +struct iosys_map;
>>     void drm_clflush_pages(struct page *pages[], unsigned long 
>> num_pages);
>>   void drm_clflush_sg(struct sg_table *st);
>> @@ -74,7 +74,7 @@ static inline bool drm_arch_can_wc_memory(void)
>>     void drm_memcpy_init_early(void);
>>   -void drm_memcpy_from_wc(struct dma_buf_map *dst,
>> -            const struct dma_buf_map *src,
>> +void drm_memcpy_from_wc(struct iosys_map *dst,
>> +            const struct iosys_map *src,
>>               unsigned long len);
>>   #endif
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index f07f2fb02e75..4fc8018eddda 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -3,7 +3,7 @@
>>   #ifndef _DRM_CLIENT_H_
>>   #define _DRM_CLIENT_H_
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/lockdep.h>
>>   #include <linux/mutex.h>
>>   #include <linux/types.h>
>> @@ -144,7 +144,7 @@ struct drm_client_buffer {
>>       /**
>>        * @map: Virtual address for the buffer
>>        */
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>         /**
>>        * @fb: DRM framebuffer
>> @@ -156,7 +156,8 @@ struct drm_client_buffer *
>>   drm_client_framebuffer_create(struct drm_client_dev *client, u32 
>> width, u32 height, u32 format);
>>   void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
>>   int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, 
>> struct drm_rect *rect);
>> -int drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct 
>> dma_buf_map *map);
>> +int drm_client_buffer_vmap(struct drm_client_buffer *buffer,
>> +               struct iosys_map *map);
>>   void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>>     int drm_client_modeset_create(struct drm_client_dev *client);
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index 35e7f44c2a75..e2941cee14b6 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -39,7 +39,7 @@
>>     #include <drm/drm_vma_manager.h>
>>   -struct dma_buf_map;
>> +struct iosys_map;
>>   struct drm_gem_object;
>>     /**
>> @@ -139,7 +139,7 @@ struct drm_gem_object_funcs {
>>        *
>>        * This callback is optional.
>>        */
>> -    int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
>> +    int (*vmap)(struct drm_gem_object *obj, struct iosys_map *map);
>>         /**
>>        * @vunmap:
>> @@ -149,7 +149,7 @@ struct drm_gem_object_funcs {
>>        *
>>        * This callback is optional.
>>        */
>> -    void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map 
>> *map);
>> +    void (*vunmap)(struct drm_gem_object *obj, struct iosys_map *map);
>>         /**
>>        * @mmap:
>> diff --git a/include/drm/drm_gem_atomic_helper.h 
>> b/include/drm/drm_gem_atomic_helper.h
>> index 0b1e2dd2ac3f..6e3319e9001a 100644
>> --- a/include/drm/drm_gem_atomic_helper.h
>> +++ b/include/drm/drm_gem_atomic_helper.h
>> @@ -3,7 +3,7 @@
>>   #ifndef __DRM_GEM_ATOMIC_HELPER_H__
>>   #define __DRM_GEM_ATOMIC_HELPER_H__
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>     #include <drm/drm_fourcc.h>
>>   #include <drm/drm_plane.h>
>> @@ -59,7 +59,7 @@ struct drm_shadow_plane_state {
>>        * The memory mappings stored in map should be established in 
>> the plane's
>>        * prepare_fb callback and removed in the cleanup_fb callback.
>>        */
>> -    struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>> +    struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>>         /**
>>        * @data: Address of each framebuffer BO's data
>> @@ -67,7 +67,7 @@ struct drm_shadow_plane_state {
>>        * The address of the data stored in each mapping. This is 
>> different
>>        * for framebuffers with non-zero offset fields.
>>        */
>> -    struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
>> +    struct iosys_map data[DRM_FORMAT_MAX_PLANES];
>>   };
>>     /**
>> diff --git a/include/drm/drm_gem_cma_helper.h 
>> b/include/drm/drm_gem_cma_helper.h
>> index adb507a9dbf0..fbda4ce5d5fb 100644
>> --- a/include/drm/drm_gem_cma_helper.h
>> +++ b/include/drm/drm_gem_cma_helper.h
>> @@ -38,7 +38,8 @@ void drm_gem_cma_free(struct drm_gem_cma_object 
>> *cma_obj);
>>   void drm_gem_cma_print_info(const struct drm_gem_cma_object *cma_obj,
>>                   struct drm_printer *p, unsigned int indent);
>>   struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_cma_object 
>> *cma_obj);
>> -int drm_gem_cma_vmap(struct drm_gem_cma_object *cma_obj, struct 
>> dma_buf_map *map);
>> +int drm_gem_cma_vmap(struct drm_gem_cma_object *cma_obj,
>> +             struct iosys_map *map);
>>   int drm_gem_cma_mmap(struct drm_gem_cma_object *cma_obj, struct 
>> vm_area_struct *vma);
>>     extern const struct vm_operations_struct drm_gem_cma_vm_ops;
>> @@ -106,7 +107,8 @@ static inline struct sg_table 
>> *drm_gem_cma_object_get_sg_table(struct drm_gem_ob
>>    * Returns:
>>    * 0 on success or a negative error code on failure.
>>    */
>> -static inline int drm_gem_cma_object_vmap(struct drm_gem_object 
>> *obj, struct dma_buf_map *map)
>> +static inline int drm_gem_cma_object_vmap(struct drm_gem_object *obj,
>> +                      struct iosys_map *map)
>>   {
>>       struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
>>   diff --git a/include/drm/drm_gem_framebuffer_helper.h 
>> b/include/drm/drm_gem_framebuffer_helper.h
>> index 905727719ead..1091e4fa08cb 100644
>> --- a/include/drm/drm_gem_framebuffer_helper.h
>> +++ b/include/drm/drm_gem_framebuffer_helper.h
>> @@ -2,7 +2,7 @@
>>   #define __DRM_GEM_FB_HELPER_H__
>>     #include <linux/dma-buf.h>
>> -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>     #include <drm/drm_fourcc.h>
>>   @@ -40,10 +40,10 @@ drm_gem_fb_create_with_dirty(struct drm_device 
>> *dev, struct drm_file *file,
>>                    const struct drm_mode_fb_cmd2 *mode_cmd);
>>     int drm_gem_fb_vmap(struct drm_framebuffer *fb,
>> -            struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES],
>> -            struct dma_buf_map data[DRM_FORMAT_MAX_PLANES]);
>> +            struct iosys_map map[static DRM_FORMAT_MAX_PLANES],
>> +            struct iosys_map data[DRM_FORMAT_MAX_PLANES]);
>>   void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
>> -               struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES]);
>> +               struct iosys_map map[static DRM_FORMAT_MAX_PLANES]);
>>   int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum 
>> dma_data_direction dir);
>>   void drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum 
>> dma_data_direction dir);
>>   diff --git a/include/drm/drm_gem_shmem_helper.h 
>> b/include/drm/drm_gem_shmem_helper.h
>> index 311d66c9cf4b..68347b63fc71 100644
>> --- a/include/drm/drm_gem_shmem_helper.h
>> +++ b/include/drm/drm_gem_shmem_helper.h
>> @@ -113,8 +113,10 @@ int drm_gem_shmem_get_pages(struct 
>> drm_gem_shmem_object *shmem);
>>   void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
>>   int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
>>   void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
>> -int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem, struct 
>> dma_buf_map *map);
>> -void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct 
>> dma_buf_map *map);
>> +int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>> +               struct iosys_map *map);
>> +void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>> +              struct iosys_map *map);
>>   int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct 
>> vm_area_struct *vma);
>>     int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int 
>> madv);
>> @@ -226,7 +228,8 @@ static inline struct sg_table 
>> *drm_gem_shmem_object_get_sg_table(struct drm_gem_
>>    * Returns:
>>    * 0 on success or a negative error code on failure.
>>    */
>> -static inline int drm_gem_shmem_object_vmap(struct drm_gem_object 
>> *obj, struct dma_buf_map *map)
>> +static inline int drm_gem_shmem_object_vmap(struct drm_gem_object *obj,
>> +                        struct iosys_map *map)
>>   {
>>       struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>>   @@ -241,7 +244,8 @@ static inline int 
>> drm_gem_shmem_object_vmap(struct drm_gem_object *obj, struct d
>>    * This function wraps drm_gem_shmem_vunmap(). Drivers that employ 
>> the shmem helpers should
>>    * use it as their &drm_gem_object_funcs.vunmap handler.
>>    */
>> -static inline void drm_gem_shmem_object_vunmap(struct drm_gem_object 
>> *obj, struct dma_buf_map *map)
>> +static inline void drm_gem_shmem_object_vunmap(struct drm_gem_object 
>> *obj,
>> +                           struct iosys_map *map)
>>   {
>>       struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>>   diff --git a/include/drm/drm_gem_ttm_helper.h 
>> b/include/drm/drm_gem_ttm_helper.h
>> index 78040f6cc6f3..4c003b4f173e 100644
>> --- a/include/drm/drm_gem_ttm_helper.h
>> +++ b/include/drm/drm_gem_ttm_helper.h
>> @@ -10,7 +10,7 @@
>>   #include <drm/ttm/ttm_bo_api.h>
>>   #include <drm/ttm/ttm_bo_driver.h>
>>   -struct dma_buf_map;
>> +struct iosys_map;
>>     #define drm_gem_ttm_of_gem(gem_obj) \
>>       container_of(gem_obj, struct ttm_buffer_object, base)
>> @@ -18,9 +18,9 @@ struct dma_buf_map;
>>   void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int 
>> indent,
>>                   const struct drm_gem_object *gem);
>>   int drm_gem_ttm_vmap(struct drm_gem_object *gem,
>> -             struct dma_buf_map *map);
>> +             struct iosys_map *map);
>>   void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
>> -            struct dma_buf_map *map);
>> +            struct iosys_map *map);
>>   int drm_gem_ttm_mmap(struct drm_gem_object *gem,
>>                struct vm_area_struct *vma);
>>   diff --git a/include/drm/drm_gem_vram_helper.h 
>> b/include/drm/drm_gem_vram_helper.h
>> index b4ce27a72773..c083a1d71cf4 100644
>> --- a/include/drm/drm_gem_vram_helper.h
>> +++ b/include/drm/drm_gem_vram_helper.h
>> @@ -12,7 +12,7 @@
>>   #include <drm/ttm/ttm_bo_driver.h>
>>     #include <linux/container_of.h>
>> -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>     struct drm_mode_create_dumb;
>>   struct drm_plane;
>> @@ -51,7 +51,7 @@ struct vm_area_struct;
>>    */
>>   struct drm_gem_vram_object {
>>       struct ttm_buffer_object bo;
>> -    struct dma_buf_map map;
>> +    struct iosys_map map;
>>         /**
>>        * @vmap_use_count:
>> @@ -97,8 +97,9 @@ void drm_gem_vram_put(struct drm_gem_vram_object 
>> *gbo);
>>   s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
>>   int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long 
>> pl_flag);
>>   int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
>> -int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct 
>> dma_buf_map *map);
>> -void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct 
>> dma_buf_map *map);
>> +int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct 
>> iosys_map *map);
>> +void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
>> +             struct iosys_map *map);
>>     int drm_gem_vram_fill_create_dumb(struct drm_file *file,
>>                     struct drm_device *dev,
>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>> index 54f2c58305d2..2a1d01e5b56b 100644
>> --- a/include/drm/drm_prime.h
>> +++ b/include/drm/drm_prime.h
>> @@ -54,7 +54,7 @@ struct device;
>>   struct dma_buf_export_info;
>>   struct dma_buf;
>>   struct dma_buf_attachment;
>> -struct dma_buf_map;
>> +struct iosys_map;
>>     enum dma_data_direction;
>>   @@ -83,8 +83,8 @@ struct sg_table *drm_gem_map_dma_buf(struct 
>> dma_buf_attachment *attach,
>>   void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>>                  struct sg_table *sgt,
>>                  enum dma_data_direction dir);
>> -int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map 
>> *map);
>> -void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct 
>> dma_buf_map *map);
>> +int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map 
>> *map);
>> +void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map 
>> *map);
>>     int drm_gem_prime_mmap(struct drm_gem_object *obj, struct 
>> vm_area_struct *vma);
>>   int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct 
>> vm_area_struct *vma);
>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>> index c17b2df9178b..155b19ee12fb 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -47,7 +47,7 @@ struct ttm_global;
>>     struct ttm_device;
>>   -struct dma_buf_map;
>> +struct iosys_map;
>>     struct drm_mm_node;
>>   @@ -481,17 +481,17 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>>    * ttm_bo_vmap
>>    *
>>    * @bo: The buffer object.
>> - * @map: pointer to a struct dma_buf_map representing the map.
>> + * @map: pointer to a struct iosys_map representing the map.
>>    *
>>    * Sets up a kernel virtual mapping, using ioremap or vmap to the
>>    * data in the buffer object. The parameter @map returns the virtual
>> - * address as struct dma_buf_map. Unmap the buffer with 
>> ttm_bo_vunmap().
>> + * address as struct iosys_map. Unmap the buffer with ttm_bo_vunmap().
>>    *
>>    * Returns
>>    * -ENOMEM: Out of memory.
>>    * -EINVAL: Invalid range.
>>    */
>> -int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
>> +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>>     /**
>>    * ttm_bo_vunmap
>> @@ -501,7 +501,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>> struct dma_buf_map *map);
>>    *
>>    * Unmaps a kernel map set up by ttm_bo_vmap().
>>    */
>> -void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map 
>> *map);
>> +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map 
>> *map);
>>     /**
>>    * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
>> diff --git a/include/drm/ttm/ttm_kmap_iter.h 
>> b/include/drm/ttm/ttm_kmap_iter.h
>> index 8bb00fd39d6c..cc5c09a211b4 100644
>> --- a/include/drm/ttm/ttm_kmap_iter.h
>> +++ b/include/drm/ttm/ttm_kmap_iter.h
>> @@ -8,7 +8,7 @@
>>   #include <linux/types.h>
>>     struct ttm_kmap_iter;
>> -struct dma_buf_map;
>> +struct iosys_map;
>>     /**
>>    * struct ttm_kmap_iter_ops - Ops structure for a struct
>> @@ -24,22 +24,22 @@ struct ttm_kmap_iter_ops {
>>        * kmap_local semantics.
>>        * @res_iter: Pointer to the struct ttm_kmap_iter representing
>>        * the resource.
>> -     * @dmap: The struct dma_buf_map holding the virtual address after
>> +     * @dmap: The struct iosys_map holding the virtual address after
>>        * the operation.
>>        * @i: The location within the resource to map. PAGE_SIZE 
>> granularity.
>>        */
>>       void (*map_local)(struct ttm_kmap_iter *res_iter,
>> -              struct dma_buf_map *dmap, pgoff_t i);
>> +              struct iosys_map *dmap, pgoff_t i);
>>       /**
>>        * unmap_local() - Unmap a PAGE_SIZE part of the resource 
>> previously
>>        * mapped using kmap_local.
>>        * @res_iter: Pointer to the struct ttm_kmap_iter representing
>>        * the resource.
>> -     * @dmap: The struct dma_buf_map holding the virtual address after
>> +     * @dmap: The struct iosys_map holding the virtual address after
>>        * the operation.
>>        */
>>       void (*unmap_local)(struct ttm_kmap_iter *res_iter,
>> -                struct dma_buf_map *dmap);
>> +                struct iosys_map *dmap);
>>       bool maps_tt;
>>   };
>>   diff --git a/include/drm/ttm/ttm_resource.h 
>> b/include/drm/ttm/ttm_resource.h
>> index 69eea9d6399b..4fd727b52da1 100644
>> --- a/include/drm/ttm/ttm_resource.h
>> +++ b/include/drm/ttm/ttm_resource.h
>> @@ -27,7 +27,7 @@
>>     #include <linux/types.h>
>>   #include <linux/mutex.h>
>> -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/dma-fence.h>
>>   #include <drm/drm_print.h>
>>   #include <drm/ttm/ttm_caching.h>
>> @@ -41,7 +41,7 @@ struct ttm_resource;
>>   struct ttm_place;
>>   struct ttm_buffer_object;
>>   struct ttm_placement;
>> -struct dma_buf_map;
>> +struct iosys_map;
>>   struct io_mapping;
>>   struct sg_table;
>>   struct scatterlist;
>> @@ -210,7 +210,7 @@ struct ttm_kmap_iter_iomap {
>>    */
>>   struct ttm_kmap_iter_linear_io {
>>       struct ttm_kmap_iter base;
>> -    struct dma_buf_map dmap;
>> +    struct iosys_map dmap;
>>       bool needs_unmap;
>>   };
>>   diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
>> deleted file mode 100644
>> index 19fa0b5ae5ec..000000000000
>> --- a/include/linux/dma-buf-map.h
>> +++ /dev/null
>> @@ -1,266 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-only */
>> -/*
>> - * Pointer to dma-buf-mapped memory, plus helpers.
>> - */
>> -
>> -#ifndef __DMA_BUF_MAP_H__
>> -#define __DMA_BUF_MAP_H__
>> -
>> -#include <linux/io.h>
>> -#include <linux/string.h>
>> -
>> -/**
>> - * DOC: overview
>> - *
>> - * Calling dma-buf's vmap operation returns a pointer to the 
>> buffer's memory.
>> - * Depending on the location of the buffer, users may have to access 
>> it with
>> - * I/O operations or memory load/store operations. For example, 
>> copying to
>> - * system memory could be done with memcpy(), copying to I/O memory 
>> would be
>> - * done with memcpy_toio().
>> - *
>> - * .. code-block:: c
>> - *
>> - *    void *vaddr = ...; // pointer to system memory
>> - *    memcpy(vaddr, src, len);
>> - *
>> - *    void *vaddr_iomem = ...; // pointer to I/O memory
>> - *    memcpy_toio(vaddr, _iomem, src, len);
>> - *
>> - * When using dma-buf's vmap operation, the returned pointer is 
>> encoded as
>> - * :c:type:`struct dma_buf_map <dma_buf_map>`.
>> - * :c:type:`struct dma_buf_map <dma_buf_map>` stores the buffer's 
>> address in
>> - * system or I/O memory and a flag that signals the required method of
>> - * accessing the buffer. Use the returned instance and the helper 
>> functions
>> - * to access the buffer's memory in the correct way.
>> - *
>> - * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its 
>> helpers are
>> - * actually independent from the dma-buf infrastructure. When 
>> sharing buffers
>> - * among devices, drivers have to know the location of the memory to 
>> access
>> - * the buffers in a safe way. :c:type:`struct dma_buf_map 
>> <dma_buf_map>`
>> - * solves this problem for dma-buf and its users. If other drivers or
>> - * sub-systems require similar functionality, the type could be 
>> generalized
>> - * and moved to a more prominent header file.
>> - *
>> - * Open-coding access to :c:type:`struct dma_buf_map <dma_buf_map>` is
>> - * considered bad style. Rather then accessing its fields directly, 
>> use one
>> - * of the provided helper functions, or implement your own. For 
>> example,
>> - * instances of :c:type:`struct dma_buf_map <dma_buf_map>` can be 
>> initialized
>> - * statically with DMA_BUF_MAP_INIT_VADDR(), or at runtime with
>> - * dma_buf_map_set_vaddr(). These helpers will set an address in 
>> system memory.
>> - *
>> - * .. code-block:: c
>> - *
>> - *    struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(0xdeadbeaf);
>> - *
>> - *    dma_buf_map_set_vaddr(&map, 0xdeadbeaf);
>> - *
>> - * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
>> - *
>> - * .. code-block:: c
>> - *
>> - *    dma_buf_map_set_vaddr_iomem(&map, 0xdeadbeaf);
>> - *
>> - * Instances of struct dma_buf_map do not have to be cleaned up, but
>> - * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
>> - * always refer to system memory.
>> - *
>> - * .. code-block:: c
>> - *
>> - *    dma_buf_map_clear(&map);
>> - *
>> - * Test if a mapping is valid with either dma_buf_map_is_set() or
>> - * dma_buf_map_is_null().
>> - *
>> - * .. code-block:: c
>> - *
>> - *    if (dma_buf_map_is_set(&map) != dma_buf_map_is_null(&map))
>> - *        // always true
>> - *
>> - * Instances of :c:type:`struct dma_buf_map <dma_buf_map>` can be 
>> compared
>> - * for equality with dma_buf_map_is_equal(). Mappings the point to 
>> different
>> - * memory spaces, system or I/O, are never equal. That's even true 
>> if both
>> - * spaces are located in the same address space, both mappings 
>> contain the
>> - * same address value, or both mappings refer to NULL.
>> - *
>> - * .. code-block:: c
>> - *
>> - *    struct dma_buf_map sys_map; // refers to system memory
>> - *    struct dma_buf_map io_map; // refers to I/O memory
>> - *
>> - *    if (dma_buf_map_is_equal(&sys_map, &io_map))
>> - *        // always false
>> - *
>> - * A set up instance of struct dma_buf_map can be used to access or 
>> manipulate
>> - * the buffer memory. Depending on the location of the memory, the 
>> provided
>> - * helpers will pick the correct operations. Data can be copied into 
>> the memory
>> - * with dma_buf_map_memcpy_to(). The address can be manipulated with
>> - * dma_buf_map_incr().
>> - *
>> - * .. code-block:: c
>> - *
>> - *    const void *src = ...; // source buffer
>> - *    size_t len = ...; // length of src
>> - *
>> - *    dma_buf_map_memcpy_to(&map, src, len);
>> - *    dma_buf_map_incr(&map, len); // go to first byte after the memcpy
>> - */
>> -
>> -/**
>> - * struct dma_buf_map - Pointer to vmap'ed dma-buf memory.
>> - * @vaddr_iomem:    The buffer's address if in I/O memory
>> - * @vaddr:        The buffer's address if in system memory
>> - * @is_iomem:        True if the dma-buf memory is located in I/O
>> - *            memory, or false otherwise.
>> - */
>> -struct dma_buf_map {
>> -    union {
>> -        void __iomem *vaddr_iomem;
>> -        void *vaddr;
>> -    };
>> -    bool is_iomem;
>> -};
>> -
>> -/**
>> - * DMA_BUF_MAP_INIT_VADDR - Initializes struct dma_buf_map to an 
>> address in system memory
>> - * @vaddr_:    A system-memory address
>> - */
>> -#define DMA_BUF_MAP_INIT_VADDR(vaddr_) \
>> -    { \
>> -        .vaddr = (vaddr_), \
>> -        .is_iomem = false, \
>> -    }
>> -
>> -/**
>> - * dma_buf_map_set_vaddr - Sets a dma-buf mapping structure to an 
>> address in system memory
>> - * @map:    The dma-buf mapping structure
>> - * @vaddr:    A system-memory address
>> - *
>> - * Sets the address and clears the I/O-memory flag.
>> - */
>> -static inline void dma_buf_map_set_vaddr(struct dma_buf_map *map, 
>> void *vaddr)
>> -{
>> -    map->vaddr = vaddr;
>> -    map->is_iomem = false;
>> -}
>> -
>> -/**
>> - * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to 
>> an address in I/O memory
>> - * @map:        The dma-buf mapping structure
>> - * @vaddr_iomem:    An I/O-memory address
>> - *
>> - * Sets the address and the I/O-memory flag.
>> - */
>> -static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
>> -                           void __iomem *vaddr_iomem)
>> -{
>> -    map->vaddr_iomem = vaddr_iomem;
>> -    map->is_iomem = true;
>> -}
>> -
>> -/**
>> - * dma_buf_map_is_equal - Compares two dma-buf mapping structures 
>> for equality
>> - * @lhs:    The dma-buf mapping structure
>> - * @rhs:    A dma-buf mapping structure to compare with
>> - *
>> - * Two dma-buf mapping structures are equal if they both refer to 
>> the same type of memory
>> - * and to the same address within that memory.
>> - *
>> - * Returns:
>> - * True is both structures are equal, or false otherwise.
>> - */
>> -static inline bool dma_buf_map_is_equal(const struct dma_buf_map *lhs,
>> -                    const struct dma_buf_map *rhs)
>> -{
>> -    if (lhs->is_iomem != rhs->is_iomem)
>> -        return false;
>> -    else if (lhs->is_iomem)
>> -        return lhs->vaddr_iomem == rhs->vaddr_iomem;
>> -    else
>> -        return lhs->vaddr == rhs->vaddr;
>> -}
>> -
>> -/**
>> - * dma_buf_map_is_null - Tests for a dma-buf mapping to be NULL
>> - * @map:    The dma-buf mapping structure
>> - *
>> - * Depending on the state of struct dma_buf_map.is_iomem, tests if the
>> - * mapping is NULL.
>> - *
>> - * Returns:
>> - * True if the mapping is NULL, or false otherwise.
>> - */
>> -static inline bool dma_buf_map_is_null(const struct dma_buf_map *map)
>> -{
>> -    if (map->is_iomem)
>> -        return !map->vaddr_iomem;
>> -    return !map->vaddr;
>> -}
>> -
>> -/**
>> - * dma_buf_map_is_set - Tests is the dma-buf mapping has been set
>> - * @map:    The dma-buf mapping structure
>> - *
>> - * Depending on the state of struct dma_buf_map.is_iomem, tests if the
>> - * mapping has been set.
>> - *
>> - * Returns:
>> - * True if the mapping is been set, or false otherwise.
>> - */
>> -static inline bool dma_buf_map_is_set(const struct dma_buf_map *map)
>> -{
>> -    return !dma_buf_map_is_null(map);
>> -}
>> -
>> -/**
>> - * dma_buf_map_clear - Clears a dma-buf mapping structure
>> - * @map:    The dma-buf mapping structure
>> - *
>> - * Clears all fields to zero; including struct dma_buf_map.is_iomem. So
>> - * mapping structures that were set to point to I/O memory are reset 
>> for
>> - * system memory. Pointers are cleared to NULL. This is the default.
>> - */
>> -static inline void dma_buf_map_clear(struct dma_buf_map *map)
>> -{
>> -    if (map->is_iomem) {
>> -        map->vaddr_iomem = NULL;
>> -        map->is_iomem = false;
>> -    } else {
>> -        map->vaddr = NULL;
>> -    }
>> -}
>> -
>> -/**
>> - * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
>> - * @dst:    The dma-buf mapping structure
>> - * @src:    The source buffer
>> - * @len:    The number of byte in src
>> - *
>> - * Copies data into a dma-buf mapping. The source buffer is in system
>> - * memory. Depending on the buffer's location, the helper picks the 
>> correct
>> - * method of accessing the memory.
>> - */
>> -static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, 
>> const void *src, size_t len)
>> -{
>> -    if (dst->is_iomem)
>> -        memcpy_toio(dst->vaddr_iomem, src, len);
>> -    else
>> -        memcpy(dst->vaddr, src, len);
>> -}
>> -
>> -/**
>> - * dma_buf_map_incr - Increments the address stored in a dma-buf 
>> mapping
>> - * @map:    The dma-buf mapping structure
>> - * @incr:    The number of bytes to increment
>> - *
>> - * Increments the address stored in a dma-buf mapping. Depending on the
>> - * buffer's location, the correct value will be updated.
>> - */
>> -static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t 
>> incr)
>> -{
>> -    if (map->is_iomem)
>> -        map->vaddr_iomem += incr;
>> -    else
>> -        map->vaddr += incr;
>> -}
>> -
>> -#endif /* __DMA_BUF_MAP_H__ */
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index 7ab50076e7a6..2097760e8e95 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -13,7 +13,7 @@
>>   #ifndef __DMA_BUF_H__
>>   #define __DMA_BUF_H__
>>   -#include <linux/dma-buf-map.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/file.h>
>>   #include <linux/err.h>
>>   #include <linux/scatterlist.h>
>> @@ -283,8 +283,8 @@ struct dma_buf_ops {
>>        */
>>       int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>>   -    int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>> -    void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>> +    int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>> +    void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>   };
>>     /**
>> @@ -347,7 +347,7 @@ struct dma_buf {
>>        * @vmap_ptr:
>>        * The current vmap ptr if @vmapping_counter > 0. Protected by 
>> @lock.
>>        */
>> -    struct dma_buf_map vmap_ptr;
>> +    struct iosys_map vmap_ptr;
>>         /**
>>        * @exp_name:
>> @@ -628,6 +628,6 @@ int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
>>     int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>>            unsigned long);
>> -int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>> -void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>> +int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map);
>> +void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map);
>>   #endif /* __DMA_BUF_H__ */
>> diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>> new file mode 100644
>> index 000000000000..f4186f91caa6
>> --- /dev/null
>> +++ b/include/linux/iosys-map.h
>> @@ -0,0 +1,257 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Pointer abstraction for IO/system memory
>> + */
>> +
>> +#ifndef __IOSYS_MAP_H__
>> +#define __IOSYS_MAP_H__
>> +
>> +#include <linux/io.h>
>> +#include <linux/string.h>
>> +
>> +/**
>> + * DOC: overview
>> + *
>> + * When accessing a memory region, depending on its location, users 
>> may have to
>> + * access it with I/O operations or memory load/store operations. 
>> For example,
>> + * copying to system memory could be done with memcpy(), copying to 
>> I/O memory
>> + * would be done with memcpy_toio().
>> + *
>> + * .. code-block:: c
>> + *
>> + *    void *vaddr = ...; // pointer to system memory
>> + *    memcpy(vaddr, src, len);
>> + *
>> + *    void *vaddr_iomem = ...; // pointer to I/O memory
>> + *    memcpy_toio(vaddr, _iomem, src, len);
>> + *
>> + * The user of such pointer may not have information about the 
>> mapping of that
>> + * region or may want to have a single code path to handle 
>> operations on that
>> + * buffer, regardless if it's located in system or IO memory. The type
>> + * :c:type:`struct iosys_map <iosys_map>` and its helpers abstract 
>> that so the
>> + * buffer can be passed around to other drivers or have separate 
>> duties inside
>> + * the same driver for allocation, read and write operations.
>> + *
>> + * Open-coding access to :c:type:`struct iosys_map <iosys_map>` is 
>> considered
>> + * bad style. Rather then accessing its fields directly, use one of 
>> the provided
>> + * helper functions, or implement your own. For example, instances of
>> + * :c:type:`struct iosys_map <iosys_map>` can be initialized 
>> statically with
>> + * IOSYS_MAP_INIT_VADDR(), or at runtime with iosys_map_set_vaddr(). 
>> These
>> + * helpers will set an address in system memory.
>> + *
>> + * .. code-block:: c
>> + *
>> + *    struct iosys_map map = IOSYS_MAP_INIT_VADDR(0xdeadbeaf);
>> + *
>> + *    iosys_map_set_vaddr(&map, 0xdeadbeaf);
>> + *
>> + * To set an address in I/O memory, use iosys_map_set_vaddr_iomem().
>> + *
>> + * .. code-block:: c
>> + *
>> + *    iosys_map_set_vaddr_iomem(&map, 0xdeadbeaf);
>> + *
>> + * Instances of struct iosys_map do not have to be cleaned up, but
>> + * can be cleared to NULL with iosys_map_clear(). Cleared mappings
>> + * always refer to system memory.
>> + *
>> + * .. code-block:: c
>> + *
>> + *    iosys_map_clear(&map);
>> + *
>> + * Test if a mapping is valid with either iosys_map_is_set() or
>> + * iosys_map_is_null().
>> + *
>> + * .. code-block:: c
>> + *
>> + *    if (iosys_map_is_set(&map) != iosys_map_is_null(&map))
>> + *        // always true
>> + *
>> + * Instances of :c:type:`struct iosys_map <iosys_map>` can be 
>> compared for
>> + * equality with iosys_map_is_equal(). Mappings that point to 
>> different memory
>> + * spaces, system or I/O, are never equal. That's even true if both 
>> spaces are
>> + * located in the same address space, both mappings contain the same 
>> address
>> + * value, or both mappings refer to NULL.
>> + *
>> + * .. code-block:: c
>> + *
>> + *    struct iosys_map sys_map; // refers to system memory
>> + *    struct iosys_map io_map; // refers to I/O memory
>> + *
>> + *    if (iosys_map_is_equal(&sys_map, &io_map))
>> + *        // always false
>> + *
>> + * A set up instance of struct iosys_map can be used to access or 
>> manipulate the
>> + * buffer memory. Depending on the location of the memory, the 
>> provided helpers
>> + * will pick the correct operations. Data can be copied into the 
>> memory with
>> + * iosys_map_memcpy_to(). The address can be manipulated with 
>> iosys_map_incr().
>> + *
>> + * .. code-block:: c
>> + *
>> + *    const void *src = ...; // source buffer
>> + *    size_t len = ...; // length of src
>> + *
>> + *    iosys_map_memcpy_to(&map, src, len);
>> + *    iosys_map_incr(&map, len); // go to first byte after the memcpy
>> + */
>> +
>> +/**
>> + * struct iosys_map - Pointer to IO/system memory
>> + * @vaddr_iomem:    The buffer's address if in I/O memory
>> + * @vaddr:        The buffer's address if in system memory
>> + * @is_iomem:        True if the buffer is located in I/O memory, or 
>> false
>> + *            otherwise.
>> + */
>> +struct iosys_map {
>> +    union {
>> +        void __iomem *vaddr_iomem;
>> +        void *vaddr;
>> +    };
>> +    bool is_iomem;
>> +};
>> +
>> +/**
>> + * IOSYS_MAP_INIT_VADDR - Initializes struct iosys_map to an address 
>> in system memory
>> + * @vaddr_:    A system-memory address
>> + */
>> +#define IOSYS_MAP_INIT_VADDR(vaddr_)    \
>> +    {                \
>> +        .vaddr = (vaddr_),    \
>> +        .is_iomem = false,    \
>> +    }
>> +
>> +/**
>> + * iosys_map_set_vaddr - Sets a iosys mapping structure to an 
>> address in system memory
>> + * @map:    The iosys_map structure
>> + * @vaddr:    A system-memory address
>> + *
>> + * Sets the address and clears the I/O-memory flag.
>> + */
>> +static inline void iosys_map_set_vaddr(struct iosys_map *map, void 
>> *vaddr)
>> +{
>> +    map->vaddr = vaddr;
>> +    map->is_iomem = false;
>> +}
>> +
>> +/**
>> + * iosys_map_set_vaddr_iomem - Sets a iosys mapping structure to an 
>> address in I/O memory
>> + * @map:        The iosys_map structure
>> + * @vaddr_iomem:    An I/O-memory address
>> + *
>> + * Sets the address and the I/O-memory flag.
>> + */
>> +static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
>> +                         void __iomem *vaddr_iomem)
>> +{
>> +    map->vaddr_iomem = vaddr_iomem;
>> +    map->is_iomem = true;
>> +}
>> +
>> +/**
>> + * iosys_map_is_equal - Compares two iosys mapping structures for 
>> equality
>> + * @lhs:    The iosys_map structure
>> + * @rhs:    A iosys_map structure to compare with
>> + *
>> + * Two iosys mapping structures are equal if they both refer to the 
>> same type of memory
>> + * and to the same address within that memory.
>> + *
>> + * Returns:
>> + * True is both structures are equal, or false otherwise.
>> + */
>> +static inline bool iosys_map_is_equal(const struct iosys_map *lhs,
>> +                      const struct iosys_map *rhs)
>> +{
>> +    if (lhs->is_iomem != rhs->is_iomem)
>> +        return false;
>> +    else if (lhs->is_iomem)
>> +        return lhs->vaddr_iomem == rhs->vaddr_iomem;
>> +    else
>> +        return lhs->vaddr == rhs->vaddr;
>> +}
>> +
>> +/**
>> + * iosys_map_is_null - Tests for a iosys mapping to be NULL
>> + * @map:    The iosys_map structure
>> + *
>> + * Depending on the state of struct iosys_map.is_iomem, tests if the
>> + * mapping is NULL.
>> + *
>> + * Returns:
>> + * True if the mapping is NULL, or false otherwise.
>> + */
>> +static inline bool iosys_map_is_null(const struct iosys_map *map)
>> +{
>> +    if (map->is_iomem)
>> +        return !map->vaddr_iomem;
>> +    return !map->vaddr;
>> +}
>> +
>> +/**
>> + * iosys_map_is_set - Tests if the iosys mapping has been set
>> + * @map:    The iosys_map structure
>> + *
>> + * Depending on the state of struct iosys_map.is_iomem, tests if the
>> + * mapping has been set.
>> + *
>> + * Returns:
>> + * True if the mapping is been set, or false otherwise.
>> + */
>> +static inline bool iosys_map_is_set(const struct iosys_map *map)
>> +{
>> +    return !iosys_map_is_null(map);
>> +}
>> +
>> +/**
>> + * iosys_map_clear - Clears a iosys mapping structure
>> + * @map:    The iosys_map structure
>> + *
>> + * Clears all fields to zero, including struct iosys_map.is_iomem, so
>> + * mapping structures that were set to point to I/O memory are reset 
>> for
>> + * system memory. Pointers are cleared to NULL. This is the default.
>> + */
>> +static inline void iosys_map_clear(struct iosys_map *map)
>> +{
>> +    if (map->is_iomem) {
>> +        map->vaddr_iomem = NULL;
>> +        map->is_iomem = false;
>> +    } else {
>> +        map->vaddr = NULL;
>> +    }
>> +}
>> +
>> +/**
>> + * iosys_map_memcpy_to - Memcpy into iosys mapping
>> + * @dst:    The iosys_map structure
>> + * @src:    The source buffer
>> + * @len:    The number of byte in src
>> + *
>> + * Copies data into a iosys mapping. The source buffer is in system
>> + * memory. Depending on the buffer's location, the helper picks the 
>> correct
>> + * method of accessing the memory.
>> + */
>> +static inline void iosys_map_memcpy_to(struct iosys_map *dst, const 
>> void *src,
>> +                       size_t len)
>> +{
>> +    if (dst->is_iomem)
>> +        memcpy_toio(dst->vaddr_iomem, src, len);
>> +    else
>> +        memcpy(dst->vaddr, src, len);
>> +}
>> +
>> +/**
>> + * iosys_map_incr - Increments the address stored in a iosys mapping
>> + * @map:    The iosys_map structure
>> + * @incr:    The number of bytes to increment
>> + *
>> + * Increments the address stored in a iosys mapping. Depending on the
>> + * buffer's location, the correct value will be updated.
>> + */
>> +static inline void iosys_map_incr(struct iosys_map *map, size_t incr)
>> +{
>> +    if (map->is_iomem)
>> +        map->vaddr_iomem += incr;
>> +    else
>> +        map->vaddr += incr;
>> +}
>> +
>> +#endif /* __IOSYS_MAP_H__ */
>

