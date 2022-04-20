Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE11508667
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 12:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8A910F1F4;
	Wed, 20 Apr 2022 10:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CB910F17E;
 Wed, 20 Apr 2022 10:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qwy2HRML+MnIBQUGh8etcVbRG9fkbNoL79FAKfWF7U3pfhpikf5iR9Uo2LQ+sR/2BxQELv4z9yNky36RFzqn3wU1F5yZ0UFhb+hGCSpZlCb4qVBhW7jDH5YZJbWxfxk8WNSoYoSFw2Gs8MvuxAJ3LgeP3K1fx8rTYNN1KEsE5W6W9573rkttZSkHYDP/m0+at8wXZgJiYLD0rQUKyJhPKk/YXsdVfnY6UNmqydSYwDq6UAp1/kC49wtXUfQQfY1TAq5drAkJ5L6pmbowGluRBPW2lebtbum1s67ZCgottPrvHb05nkYTbUY1aRaG6QwafLwsG5IRbmMrc2XSeHALCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIZ8mqoB1+9renwZ0U+uHTaOCdQuiATsNFQiOXCop6E=;
 b=iGHUY6uitx3SdSOCHFJ06tjSUW6cFiGoRcTlPQt8fF+QRgjH7/jpLdTENpR5QjAq2eOKLOILfoDm4UHo/FBD2sRBYxRrUuqI7qRaGcsHGcWEaSba16Je/6Tvb42sRelSzE87lGiWPKSyNS51SB8o+qtdMxRuMh3FxeflA1DjZN3+lZlE3qD8QPHPoKSiRsoh9FpcNFTy2/jvA/9iijIcHnQoUYrZoXlRIvVRoDIqzaKukH97znCh3CEkPlmFY1217BVs+3C83ysnsJhbM979P3/1IMwuXMhVlTZl6lLuHvy/HIzBDLo6Jsorfz2GDbe/0cZwTEXYFRLknpYrfHsoDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIZ8mqoB1+9renwZ0U+uHTaOCdQuiATsNFQiOXCop6E=;
 b=dZ04G6ubz/O1WsoGgNB7vN3CDZUoajIia9GJzUr1DgO/GJADCCiJvqt9d7NwthIqKMB24tmKSUuh5dXd+UEYqh8cLDQGmE1SOzif4jk4Y2W185Ll0Tw0WtjJY7+0W966iIgjvL8VGWgHDM1UBiFrRVJV7TvD3ZFhrqALyQ6S+Zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB3732.namprd12.prod.outlook.com (2603:10b6:a03:196::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 10:53:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Wed, 20 Apr 2022
 10:53:21 +0000
Content-Type: multipart/alternative;
 boundary="------------rKz43RiVhnaPBsd0gneERGMJ"
Message-ID: <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
Date: Wed, 20 Apr 2022 12:53:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Content-Language: en-US
To: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
 <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
X-ClientProxiedBy: AS9PR06CA0228.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77c53bc7-eda4-4812-7b0d-08da22bbfc2f
X-MS-TrafficTypeDiagnostic: BY5PR12MB3732:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB37322FC3AE8770789D686EF783F59@BY5PR12MB3732.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wSv5oLuLPDOnE4ndnyBiMPXPb3ImwGbAFTI1LLRntQcSSfgaD0YfGy2jY95OZejot3+EB1Teh7vUDa7KBvsXPfsfXwtWcQwh5p3Wg+zhmQG+Cde1hnJmYRXGycozm1F/dQ2Bz8KrdRAlg1ub0UpZRL6W1tsBJi2hxG4kEybP5uE9ElYcOGTDzbnMF5KUNYLKFajWKumHVy5X6704BzSPBmdfCoGGHGLqyFZ0+8EDoxD5RNyQFFPHYcqK0CV3zK1zs1HdTF26Uy1vz1N65MGJg3ikZwaCyeLnXSgno+SFTWSQrN5+VtNbhzyIIgO7P4Zz5spjpnFO3MqRiGq74U3/c7+ekXvu/KqDhruKHDvB7RGwnSHrINaL7vKUVVB0sq+pLZRXlfdleNhP2CPrZas8/HtVJ8TwaCo+evtxCGCFzvcC3qkDO2aRcQrT2HfCYgBVqqC7X3T3C0LxWdA9HdvMv9ZVxJjBm16u9hAfDcNDENV+4q4JYRawHqXhWB9eEZEb4cbFPaGnoIWi5sUjJhJoaSHL1Ids84jS+3lIWevUjsmmtGfQBkdfDLR2PoDIILSSa1PgqzXSZtRbIL8FdajQ4nTOJXdQ0sZ0hcJUQye6jETqmSnMIYPc2I89yNyNB6FAdPsB7IM+STghGnoo2iUq6nOCVFKCfl8tYlBhB4oPhNGMlThf01F/KMuIlzc65mL4hr3JEfcIhGa8cQtcfsPPcyoa1z0T4hvHDxWQXoEDR+EfSSwFK7dlWBKhSKZILAaH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(66946007)(33964004)(26005)(86362001)(186003)(5660300002)(2906002)(31696002)(2616005)(110136005)(19627405001)(36756003)(31686004)(450100002)(6512007)(66476007)(8676002)(6506007)(83380400001)(66556008)(6666004)(6486002)(8936002)(508600001)(316002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDN5ZllEUXE1LzFJR0JjZjJDWThPaWc2NE1kdnJoM0NnZDByaGkyN3ZDR2oz?=
 =?utf-8?B?T1lJQStQVnBRSWZwT2FjVjlscldZWjBNakhwMXJ3ZTdwOHcyYWVDTVIxTHJv?=
 =?utf-8?B?aUg5T0NBTUh4RlBqWTUrSVQ2bkE4THpmcWQ1eEpiek13WjRlUVdaaGtqYlFu?=
 =?utf-8?B?em9NTnpRNmpoWmNTbmR6TWRoaW1sbVhEcnltaGJvOUFqREkvM0VIc0xVclVj?=
 =?utf-8?B?L0F4M0hNWUo1V25VS2lIU3RNNUdCUUpERUNORFVnWlNkdkpSbnlaQWpjWjg0?=
 =?utf-8?B?VjhETkExWTIzd3dwR3Q4c2NWSUJKbVE1WEErTlBmQ0owMTRpV2J6RTRST3dz?=
 =?utf-8?B?SXJtMVplb3JqZDUyS2xhSzdNZEI1cnpqTWVldG94eEpCdlpjYTcwUjVrbjNE?=
 =?utf-8?B?cUdnSkZ2dmhjMlNCeGZpZm5GUkt5NUZXSlM4bkY3VnVZM01jVGpQYkRaWm83?=
 =?utf-8?B?NkYzcW9UcDBPdFN2ZmZNTU9HYWJLRE0raGVNaTdvR0xvZWtsdWRrNEdIRVVR?=
 =?utf-8?B?YUsrS2wya2RXQnYrL0hsZENabFYwSmYzd2FCTmNFcE1WeEg1YjMxYzljcmtu?=
 =?utf-8?B?TVB3YTZlQm5veG5wcWpsNllrOGdzRDNodndTYmNFZE5neUxvNjdqLysyaHRU?=
 =?utf-8?B?NWJVY1JUZHhsOE04TG1kQ2NOSHR4alJYTmZORVVNcVM0RTlQcVN3MzV4Wml6?=
 =?utf-8?B?L2RHUmNSWmsyN0NQZVcxUzNGREpSazA5Q2tUcEVKMThIUk5PR2RzWEhFSlVl?=
 =?utf-8?B?TndoWGppVmNLOGxqTVVZR2cxNG1RNGVvNVZnMG1ib3BUN2owVVVuR3JtTHpm?=
 =?utf-8?B?UExDbms4OUVNMHg1ZEdqdU93Rkx1M290dmNIeThDcDZoektMd0w2ajZTajFl?=
 =?utf-8?B?bkpvb0tVR0lZaDNoQzdOcTdRWmozQmgzNXlmUlEyNFBkN2MvT2hrSFFaaHhI?=
 =?utf-8?B?bU9PaVd5T2o4Q0R0Q3gxY1BoKzRFSXFCUE52UVhmcndHWi90K0lrZ1h2SmNV?=
 =?utf-8?B?a3NZNlR1Y0tSdENGQ3Y0dHFMaDEyVHhPM3ZzdXFhWkZjZU5TMks0dThJNkU1?=
 =?utf-8?B?T3lUdTFrMWJGWHR5dE5MaFJxVTVJMW4xeTF0c01SUGdQdk45Mit4S0hCeUgr?=
 =?utf-8?B?R3BITDVDMFk3RU80N053NzhMQmNQWkgzMmZFSW9RSjhmRWxFanNrUW1XRE93?=
 =?utf-8?B?L0FCdHc2WU9HOWZHQ2cwdHo4bThzVUZJZ1BGeVJXbzdYL2RsS2ZQY05JWkd1?=
 =?utf-8?B?clJ1YkdFZnBZd2xMeXl1R00ybUEvSHY3VThVR2h5U2tuUzFEN1FaWVFoQnM4?=
 =?utf-8?B?QlNONHBHbmVNeE05SGdCVXNMY0tvL2hHVGdaaG1QV242R1B1S3Z0Q3NERmtX?=
 =?utf-8?B?WnJqcnR6UWZZakgwR3Z1ZmQ4Zmp6ZEpyR2FCUnIrVEFkN1MwWnFXcUFCRGlK?=
 =?utf-8?B?MUNKNzVRQjNCUGY2cG45Z1BQTzg5ZlVUT1pqYzVzeDhEc3plUThZdm9ROTBz?=
 =?utf-8?B?dHRzTjdWSmFyQTJtRE55TExFdU1RS0ErVU9tcnhzWlBpMUlVUFhRV1hhSmJt?=
 =?utf-8?B?by9ZTmJzZEtBdzBxUDBkQVBqYmI5OXkzN3V2RGRyUWp1SkZYa1NQcVVKOVox?=
 =?utf-8?B?QkVxeFp2ZVhPei9jeDVnVGcxYUtONTEyNmhSU1NPZnBEdzltNzVEaVZySTdJ?=
 =?utf-8?B?NlVzeHlDZm5LRExEVldrSDVqNlhUVXlUMm9HNUxHVXdmcEVkMmZPQUU5dXlP?=
 =?utf-8?B?cnZGQnpUMTl2T21naUNOKzUrM3RhVitmU0l3ZlJkcDN2RnNOaU5hTW9ZRklj?=
 =?utf-8?B?Rm9FaTZIZTk4WG9UZWFaUDhKaEtkT0M5K08zQjhob05hWTdJSmtSZ1NCalI2?=
 =?utf-8?B?aVBPbXJTSEJEcDlqNWlEdlV6Wmlha1huYldJTjA2azJmcGlyUG1zejZIZHpy?=
 =?utf-8?B?eWwvS3hveGYvdFl2WlhvdGNKOEFOMjlGQ0hqQi82ZHE0TDNJQlpBUEt5ZXdq?=
 =?utf-8?B?N0NtdUFjV3JPYVc4aEhqc0Q5WlRtT2dyS3cza3VMYXFXNEJwYTZKbC9XN213?=
 =?utf-8?B?QnBiREM1MmUrM1pwRlEwNlJvTHl2ZnNLRG1WMitYcU5nL0xYT2tlWW1TMUpv?=
 =?utf-8?B?Y3IxZldITTlReWtHRVowUEdldExScXhkSFEzRWlVV3ZYdHBPcGwxaVBzbFdI?=
 =?utf-8?B?UDdja0VjWXZXeVRBaGk1cHlJbEJpTkpveWRhRlUvTENKcU9uWkhWY3UzdjU1?=
 =?utf-8?B?TzBMTXJ0ODg0dzNLOENjS1lRQ040c2Q1dFVFdThPMldFc1FKNlRsTzhJYXB2?=
 =?utf-8?B?Z05PcWVFS09GZWZUSjY3cXo2RmtQcU9MRHVsNHk1ZTEzMHBaQXNhdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c53bc7-eda4-4812-7b0d-08da22bbfc2f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 10:53:21.5295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaMF0dV5K8krf26PXKsXK1WMb/E12rhlQr9MUkcV37QCnRu3k3hYZoPpDatpxWG9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3732
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------rKz43RiVhnaPBsd0gneERGMJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):
>
> [AMD Official Use Only]
>
>
>
> ------------------------------------------------------------------------
> *From:* Koenig, Christian <Christian.Koenig@amd.com>
> *Sent:* Wednesday, April 20, 2022 5:00 PM
> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; 
> dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; 
> amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds 
> kmalloc limit
> Am 20.04.22 um 10:56 schrieb Yang Wang:
> > if the __GFP_ZERO is set, the kvmalloc() can't fallback to use vmalloc()
>
> Hui what? Why should kvmalloc() not be able to fallback to vmalloc()
> when __GFP_ZERO is set?
>
> And even that is really the case then that sounds like a bug in 
> kvmalloc().
>
> Regards,
> Christian.
>
> [kevin]:
> it is really test case from libdrm amdgpu test, which try to allocate 
> a big BO which will cause ttm tt init fail.


LOL! Guys, this test case is intended to fail!

The test consists of allocating a buffer so ridiculous large that it 
should never succeed and be rejected by the kernel driver.

This patch here is a really clear NAK.

Regards,
Christian.

> it may be a kvmalloc() bug, and this patch can as a workaround 
> in ttm before this issue fix.
>
> void *kvmalloc_node(size_t size, gfp_t flags, int node)
> {
> ...
>       if ((flags & GFP_KERNEL) != GFP_KERNEL)
>               return kmalloc_node(size, flags, node);
> ...
> }
>
> Best Regards,
> Kevin
>
> > to allocate memory, when request size is exceeds kmalloc limit, it will
> > cause allocate memory fail.
> >
> > e.g: when ttm want to create a BO with 1TB size, it maybe fail.
> >
> > Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
> >   1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> > index 79c870a3bef8..9f2f3e576b8d 100644
> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, 
> bool zero_alloc)
> >   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
> >   {
> >        ttm->pages = kvmalloc_array(ttm->num_pages, sizeof(void*),
> > -                     GFP_KERNEL | __GFP_ZERO);
> > +                                 GFP_KERNEL);
> >        if (!ttm->pages)
> >                return -ENOMEM;
> > +
> > +     memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
> > +
> >        return 0;
> >   }
> >
> > @@ -108,10 +111,12 @@ static int 
> ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
> >        ttm->pages = kvmalloc_array(ttm->num_pages,
> > sizeof(*ttm->pages) +
> > sizeof(*ttm->dma_address),
> > -                                 GFP_KERNEL | __GFP_ZERO);
> > +                                 GFP_KERNEL);
> >        if (!ttm->pages)
> >                return -ENOMEM;
> >
> > +     memset(ttm->pages, 0, ttm->num_pages * (sizeof(*ttm->pages) + 
> sizeof(*ttm->dma_address)));
> > +
> >        ttm->dma_address = (void *)(ttm->pages + ttm->num_pages);
> >        return 0;
> >   }
> > @@ -120,9 +125,12 @@ static int 
> ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
> >   {
> >        ttm->dma_address = kvmalloc_array(ttm->num_pages,
> > sizeof(*ttm->dma_address),
> > -                                       GFP_KERNEL | __GFP_ZERO);
> > + GFP_KERNEL);
> >        if (!ttm->dma_address)
> >                return -ENOMEM;
> > +
> > +     memset(ttm->dma_address, 0, ttm->num_pages * 
> sizeof(*ttm->dma_address));
> > +
> >        return 0;
> >   }
> >
>

--------------rKz43RiVhnaPBsd0gneERGMJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):<br>
    <blockquote type="cite" cite="mid:CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p style="font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" align="Left">
        [AMD Official Use Only]<br>
      </p>
      <br>
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Koenig, Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a><br>
            <b>Sent:</b> Wednesday, April 20, 2022 5:00 PM<br>
            <b>To:</b> Wang, Yang(Kevin) <a class="moz-txt-link-rfc2396E" href="mailto:KevinYang.Wang@amd.com">&lt;KevinYang.Wang@amd.com&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
            <b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail
            when size exceeds kmalloc limit</font>
          <div>&nbsp;</div>
        </div>
        <div class="BodyFragment"><font size="2"><span style="font-size:11pt">
              <div class="PlainText elementToProof">Am 20.04.22 um 10:56
                schrieb Yang Wang:<br>
                &gt; if the __GFP_ZERO is set, the kvmalloc() can't
                fallback to use vmalloc()<br>
                <br>
                Hui what? Why should kvmalloc() not be able to fallback
                to vmalloc() <br>
                when __GFP_ZERO is set?<br>
                <br>
                And even that is really the case then that sounds like a
                bug in kvmalloc().</div>
              <div class="PlainText elementToProof"><br>
                Regards,<br>
                Christian.</div>
              <div class="PlainText elementToProof"><br>
                <div class="PlainText" style="margin:0px;background-color:rgb(255, 255, 255)">[kevin]:</div>
              </div>
              <div class="PlainText elementToProof"><span class="PlainText" style="margin:0px;background-color:rgb(255, 255, 255)">it
                  is really test case from libdrm amdgpu test, which try
                  to allocate a big BO which will cause ttm tt init
                  fail.</span><br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
    <br>
    <br>
    LOL! Guys, this test case is intended to fail!<br>
    <br>
    The test consists of allocating a buffer so ridiculous large that it
    should never succeed and be rejected by the kernel driver.<br>
    <br>
    This patch here is a really clear NAK.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com">
      <div>
        <div class="BodyFragment"><font size="2"><span style="font-size:11pt">
              <div class="PlainText elementToProof">
              </div>
              <div class="PlainText elementToProof"><span class="PlainText" style="margin:0px;background-color:rgb(255, 255, 255)">it
                  may be a kvmalloc() bug, and this patch can as a
                  workaround in<span style="background-color:rgb(255,
                    255, 255);display:inline !important">&nbsp;ttm</span>&nbsp;before
                  this issue fix.</span></div>
              <div class="PlainText elementToProof"><span class="PlainText" style="margin:0px;background-color:rgb(255, 255, 255)"><br>
                </span></div>
              <div class="PlainText elementToProof"><span class="PlainText" style="margin:0px;background-color:rgb(255, 255, 255)">void
                  *kvmalloc_node(size_t size, gfp_t flags, int node)&nbsp;<br>
                </span></div>
              <div class="PlainText elementToProof"><span class="PlainText" style="margin:0px;background-color:rgb(255, 255, 255)">{</span></div>
              <div class="PlainText elementToProof"><span class="PlainText" style="margin:0px;background-color:rgb(255, 255, 255)">...</span></div>
              <div class="PlainText elementToProof"><span class="PlainText" style="margin:0px;background-color:rgb(255, 255, 255)">&nbsp;
                  &nbsp; &nbsp; &nbsp; if ((flags &amp; GFP_KERNEL) != GFP_KERNEL)<br>
                </span></div>
              <div class="PlainText elementToProof"><span class="PlainText" style="margin:0px;background-color:rgb(255, 255, 255)">&nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return kmalloc_node(size, flags, node);<br>
                </span></div>
              <div class="PlainText elementToProof"><span class="PlainText" style="margin:0px;background-color:rgb(255, 255, 255)">...</span></div>
              <div class="PlainText elementToProof"><span class="PlainText" style="margin:0px;background-color:rgb(255, 255, 255)">}</span></div>
              <div class="PlainText elementToProof"><br>
              </div>
              <div class="PlainText elementToProof">Best Regards,</div>
              <div class="PlainText elementToProof">Kevin<br>
                <br>
                &gt; to allocate memory, when request size is exceeds
                kmalloc limit, it will<br>
                &gt; cause allocate memory fail.<br>
                &gt;<br>
                &gt; e.g: when ttm want to create a BO with 1TB size, it
                maybe fail.<br>
                &gt;<br>
                &gt; Signed-off-by: Yang Wang
                <a class="moz-txt-link-rfc2396E" href="mailto:KevinYang.Wang@amd.com">&lt;KevinYang.Wang@amd.com&gt;</a><br>
                &gt; ---<br>
                &gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---<br>
                &gt;&nbsp;&nbsp; 1 file changed, 11 insertions(+), 3 deletions(-)<br>
                &gt;<br>
                &gt; diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
                b/drivers/gpu/drm/ttm/ttm_tt.c<br>
                &gt; index 79c870a3bef8..9f2f3e576b8d 100644<br>
                &gt; --- a/drivers/gpu/drm/ttm/ttm_tt.c<br>
                &gt; +++ b/drivers/gpu/drm/ttm/ttm_tt.c<br>
                &gt; @@ -97,9 +97,12 @@ int ttm_tt_create(struct
                ttm_buffer_object *bo, bool zero_alloc)<br>
                &gt;&nbsp;&nbsp; static int ttm_tt_alloc_page_directory(struct
                ttm_tt *ttm)<br>
                &gt;&nbsp;&nbsp; {<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =
                kvmalloc_array(ttm-&gt;num_pages, sizeof(void*),<br>
                &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL | __GFP_ZERO);<br>
                &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL);<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
                &gt; +<br>
                &gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;pages, 0, ttm-&gt;num_pages *
                sizeof(void *));<br>
                &gt; +<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
                &gt;&nbsp;&nbsp; }<br>
                &gt;&nbsp;&nbsp; <br>
                &gt; @@ -108,10 +111,12 @@ static int
                ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =
                kvmalloc_array(ttm-&gt;num_pages,<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                sizeof(*ttm-&gt;pages) +<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                sizeof(*ttm-&gt;dma_address),<br>
                &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL |
                __GFP_ZERO);<br>
                &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL);<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
                &gt;&nbsp;&nbsp; <br>
                &gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;pages, 0, ttm-&gt;num_pages *
                (sizeof(*ttm-&gt;pages) +
                sizeof(*ttm-&gt;dma_address)));<br>
                &gt; +<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address = (void *)(ttm-&gt;pages
                + ttm-&gt;num_pages);<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
                &gt;&nbsp;&nbsp; }<br>
                &gt; @@ -120,9 +125,12 @@ static int
                ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)<br>
                &gt;&nbsp;&nbsp; {<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address =
                kvmalloc_array(ttm-&gt;num_pages,<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                sizeof(*ttm-&gt;dma_address),<br>
                &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL
                | __GFP_ZERO);<br>
                &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                GFP_KERNEL);<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;dma_address)<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
                &gt; +<br>
                &gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;dma_address, 0,
                ttm-&gt;num_pages * sizeof(*ttm-&gt;dma_address));<br>
                &gt; +<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
                &gt;&nbsp;&nbsp; }<br>
                &gt;&nbsp;&nbsp; <br>
                <br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------rKz43RiVhnaPBsd0gneERGMJ--
