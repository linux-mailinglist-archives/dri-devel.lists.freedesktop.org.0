Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E9C39EF4B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8AD6EAC0;
	Tue,  8 Jun 2021 07:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926F36EAB5;
 Tue,  8 Jun 2021 07:12:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqatxtYXQFQ1LSGCt8MAah85kI465pMd5/UxUh0dg5h8UP1FjsgMCPhAX91S51lm7dOknmZS6bEwqFam9F+QeVcPQyrEhz5bSFeCYIYERTXsx+rTcn6GpcGwjFBb0vj/UtQLE7CCi2/GAKqkeCpv3GOy8zAKaE4niqnzF8zfhOFLIa0SoQILdt18uZ257lByQ6qHsC1qOHtpCEP8UFT+KO3x7YByICytL3urKayifNjMiPVa6R9bkbldXY/tP/TY/ujOGGx8pasfewjvvdIrd/beHvlTlkn+lBPuv+qfhURlvnlIJZ3Ul7SgdeSOuDaE+Xy/wOXQMlpvWFfxySgxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8xqlbeVj/7bU0UryhIjmHFzuiE+P+VVBuZH+FCsqro=;
 b=g3tZGcOkvX+It7yeT40qPE0+CgdL3kppSJwQuIOlVqNbkxtTC1qAbsgW8UlSCvdarsNTiblFdd4ggZlHRfaJgEDyxdyyGz11k/lJMuvC2anB4W7u1vVqfBcc18HjnXvWGjYn72gDGhGoGBmgxRz764Ak6wg31wdaXQlavEyETpQL7LBb0YAHDq9QhiMFuMo1Iy9HtGpdXlN5HtAXWl19mOCu9hS/CLiPzMqABhDo3Z3X86o7SGg9uIguntV6t8QWuChRLmToU3N6dodC7H72brsPSmrR7BR7gNPnyxCXRqOLlaez2bPO8IFEH+cxcweWnxF1V8OqEeEQybW8Tm+Oow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8xqlbeVj/7bU0UryhIjmHFzuiE+P+VVBuZH+FCsqro=;
 b=aCK2cRWNeXXriRnsepoYvRlUyHExE/ZithRgaqO//BEGxBgpKkrRIwvkirlbZeiXhDyXcyup8RM/sIriWeV0ckyj266mU7UZG//iXjmYOoDLX16b+YuxsvlH/eDIYbMzkxtBBlPHF/UwFGTudibi8uwnz9xTCNwpOdUQpCI9d5o=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4847.namprd12.prod.outlook.com (2603:10b6:208:1ba::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Tue, 8 Jun
 2021 07:12:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 07:12:05 +0000
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Felix Kuehling <felix.kuehling@amd.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210608125046.07c6deca@canb.auug.org.au>
 <22010e38-3686-87ce-532d-4a53cae990b1@amd.com>
 <7b825bc4-9f81-3010-6445-d6708e34a9bd@amd.com>
 <6dc40376-77fc-2f43-693e-1bd2c52d9cbd@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d06e7d13-f24d-40f9-64bd-2b6e45d74462@amd.com>
Date: Tue, 8 Jun 2021 09:11:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <6dc40376-77fc-2f43-693e-1bd2c52d9cbd@amd.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:197a:8536:afbe:3762]
X-ClientProxiedBy: AM3PR07CA0121.eurprd07.prod.outlook.com
 (2603:10a6:207:7::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:197a:8536:afbe:3762]
 (2a02:908:1252:fb60:197a:8536:afbe:3762) by
 AM3PR07CA0121.eurprd07.prod.outlook.com (2603:10a6:207:7::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.10 via Frontend Transport; Tue, 8 Jun 2021 07:12:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d9a7a1c-2523-46ec-aaf8-08d92a4cb875
X-MS-TrafficTypeDiagnostic: MN2PR12MB4847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB48477B607B85851F9020896D83379@MN2PR12MB4847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tP9JKlJbM5ktHLkGw2wvfvwjCUFJDhqRPGQiOLJEpoXBeElVUQpcg7f4Wm+o2ps30cWC4NMAYBPfEZvfI8UhOBcc3hjAKThZelxYQHADbH8tThsf0fPa5haLDDKGpNeGiu/sYuW+zY+BAUOYg2vuMeoCbmHH45kSndB4w7hO5prPfhvw8Kd48ZZyAkp19U78UA6aPS/lWJG/+/6kZUSY72gV1pFGd41Vy3316FAYBieyvlJdGDRWRrakYQ8u2V2PtcFjx1+FizckqYdH5+GGvvtk/eRi6rvtk+BB54+Exbr5THwEQCLbvBJQkJTTFpXPNhH4M9hT/LMC+G7cRL43UlL3YUofMC9HWbFLWa7dn2H8POgWTow5WD21rIeD3EkR+0CC0pC5oA1ddDw38vF7FDH/fMvdGkt3/n/Cj48O1NNuZsBUOvlwEj+k/10IBUUElp2v+tdKMWRb9vrbI2BAIIPNKvkv7BpE5g9IckT5FLr1adBRC4jIBxj5r9lqXdpKoyLSn251iyqmlRoSQ2sD6uv5+C2Urs/ImyHVHeNjBPtFUIO0xYIZZrLqvspQxBo00njLIJRFioRLAX+9Hj+OLftAJkUkWorQMbsU+Vqa32psxpLxXvogidkl01+2wCPRba899ouZ+r0/f9XN4Ky8ChK750Lz9Rwreubvgbc+LkKLiQEZdQDvsqKj4T2xsrAy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(53546011)(66476007)(316002)(16526019)(4326008)(8676002)(5660300002)(66574015)(110136005)(54906003)(83380400001)(478600001)(36756003)(31696002)(31686004)(38100700002)(86362001)(66556008)(186003)(2616005)(8936002)(66946007)(6486002)(6666004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?Z6G4l04P9A1aF48KUWPgoKlhiIPHOdq5oR3Or0d1Lor9Go/Bcyvwc3RH?=
 =?Windows-1252?Q?0zw9njoxbBOl/PIJj8WZvL+nTz3w+GquSm9DvlIEPijr8VvGFn/31JCh?=
 =?Windows-1252?Q?vOVxRm0op72zb5y0OXBZqxl5Cj+q3enq+ETY7MLztOwbsj+8dqWkvqcr?=
 =?Windows-1252?Q?HS3SnBPKGBzz3w7kPKj5yCww7FmTE6Ysf/ZgZmuswaee4LQXfZ443stk?=
 =?Windows-1252?Q?ScxDGRGqAB/2U2ecDNvChazePDvU/c1l4folyTGAG7VvWWALvfqvkoO4?=
 =?Windows-1252?Q?E/gXqqZvIcUrWv2fQfThOz8JiH8SvvPyulBz/E+11iV3UhSc7dQzorPQ?=
 =?Windows-1252?Q?pasDOLrA/e1+YB5SL/BXtx/lIrG2+VOaQsG6P5fBVpqIEjYSOJFAZ9R1?=
 =?Windows-1252?Q?4WuW3IJ1nCKBKal+YH0jl4snePc2q3gC6rr7CbJY8GfyfYNd9OUg/Fxu?=
 =?Windows-1252?Q?YLZ6BQKX2N1O4+8fvyJAMY/XNRzpTwiO/8jK6cQNEG3aUqKmJzTFfMse?=
 =?Windows-1252?Q?FZahosj7UUjwVYr2YxiUdO2RC6V+os3kIT2pZ9v7wL9ZyV/ZVbhmZwTY?=
 =?Windows-1252?Q?BBHkyMRPjSWmsasI6h3Jp/x5dhfpFO9vXeuP/pmYF0HU0RiAPEKsLN/t?=
 =?Windows-1252?Q?Y6ST/SCTQtWlhgHxB9p/mGdxMaE68xtyhd3DM3hf6GSz4WOA4S3fg0gm?=
 =?Windows-1252?Q?FM3Wv6bexvU8xdnF8RrLBjYJQrnggLWqOJEw7EJxjvVt+vc+Yr+h8Dx4?=
 =?Windows-1252?Q?FS9QII2q+n8UC+2zkx5XqATcaPk4XikbgXERcIfN/8WzvYI5+N00q2OB?=
 =?Windows-1252?Q?1s3xmMNPnO1A0i5gL8NSQtx05PqbPkWocYPG0KBhO2s5ntwVxqVAcveP?=
 =?Windows-1252?Q?oOX3FSTFJEVdTnqBv63kfVj+j4N+WCrME6eBysV51yoXuvEjPNTkVd8G?=
 =?Windows-1252?Q?dFwGD0N5beN2bFZiqFriay9quij28bPOdds5cDiW66Mp9870roY3sDn0?=
 =?Windows-1252?Q?qVzitp3dLy6IIlNG0tx9NR3PMuw8xx7/YxXg/iidnjqcNNTDzKSs3ltK?=
 =?Windows-1252?Q?Cad3YY6Qz2f0JxNJuLHBx0l0z5XlX4zqgWptC6rDVpxdDNXU0mf5GKWG?=
 =?Windows-1252?Q?hi4wory3iAb9UCkgdP9+MfDlw1d7Kr1Csq3iv/nSOOu/8n4qOcmzHTUI?=
 =?Windows-1252?Q?6NpyTfOOlhSekcvbWF5MuCUlG6CCEDDcjm2jIpHgYTnGIZ4Idw0F9XW0?=
 =?Windows-1252?Q?7ylsuOe7PYNyHrE98NMFnjfQ7mb0tU2pnNmX1+lOeYW7/EIEgySc6/l3?=
 =?Windows-1252?Q?wp6A5WFNZyuLBbymtecWLkjRNAk7HzLbywN0u0xzXUbthsprX2YkMe4h?=
 =?Windows-1252?Q?mM1bdyxd+7pNYEbZkcJCFabC/mrU18ynhsuCaMULpIRrCet8sIrjzhRD?=
 =?Windows-1252?Q?QUeG0s8RrLDjR07FeeJ2UF/NGiAlteNL1DHq7b6EseE/2PLZkJt5GC8H?=
 =?Windows-1252?Q?GXuA2zAs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9a7a1c-2523-46ec-aaf8-08d92a4cb875
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 07:12:05.2115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJ8+A+vC6cg2ONYZPAsVcPIt5S8TWFkayDHO6gNdbTMmErO4CFvzvVhSznFSc3FC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4847
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.06.21 um 09:06 schrieb Felix Kuehling:
> Am 2021-06-08 um 2:55 a.m. schrieb Christian König:
>> Hi Felix,
>>
>> that should already be fixed in drm-tip as part of the merge of the
>> TTM changes.
> No, the preempt_mgr doesn't exist in drm-misc-next. It does exist in
> drm-next, but that doesn't seem to have the TTM changes yet.
>
> Is there another DRM branch or repository that you're referring to with
> drm-tip?

drm-tip is an integration branch for conflict resolution.

E.g. when we have changes in drm-misc-next which break when we merge 
with drm-next I'm informed and need to provide a conflict resolution patch.

This is automatically applied when drm-next and drm-misc-next are merged 
together again.

It just looks like that drm-next and drm-misc-next are merged manually 
into linux-next and then the conflict resolution doesn't apply and 
everything breaks into pieces.

Adding Daniel as well. How should that be handled? Should we merge 
drm-misc-next into drm-next now?

Thanks,
Christian.

>
> Regards,
>    Fel
>
>> Regards,
>> Christian.
>>
>> Am 08.06.21 um 07:37 schrieb Felix Kuehling:
>>> Hi Christian,
>>>
>>> I based amdgpu_preempt_mgr on amdgpu_gtt_mgr and now I'm looking at what
>>> changed there. Looks like I'll need to create a dummy node in
>>> amdgpu_preempt_mgr_new to satisfy TTM, and free it in
>>> amdgpu_preempt_mgr_del.
>>>
>>> Thanks,
>>>     Felix
>>>
>>>
>>> Am 2021-06-07 um 10:50 p.m. schrieb Stephen Rothwell:
>>>> Hi all,
>>>>
>>>> After merging the drm-misc tree, today's linux-next build (x86_64
>>>> allmodconfig) failed like this:
>>>>
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: In function
>>>> 'amdgpu_preempt_mgr_new':
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:75:5: error: 'struct
>>>> ttm_resource' has no member named 'mm_node'
>>>>      75 |  mem->mm_node = NULL;
>>>>         |     ^~
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: At top level:
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:129:11: error:
>>>> initialization of 'int (*)(struct ttm_resource_manager *, struct
>>>> ttm_buffer_object *, const struct ttm_place *, struct ttm_resource
>>>> **)' from incompatible pointer type 'int (*)(struct
>>>> ttm_resource_manager *, struct ttm_buffer_object *, const struct
>>>> ttm_place *, struct ttm_resource *)'
>>>> [-Werror=incompatible-pointer-types]
>>>>     129 |  .alloc = amdgpu_preempt_mgr_new,
>>>>         |           ^~~~~~~~~~~~~~~~~~~~~~
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:129:11: note: (near
>>>> initialization for 'amdgpu_preempt_mgr_func.alloc')
>>>>
>>>> Caused by commit
>>>>
>>>>     cb1c81467af3 ("drm/ttm: flip the switch for driver allocated
>>>> resources v2")
>>>>
>>>> from the drm-misc tree interacting with commit
>>>>
>>>>     b453e42a6e8b ("drm/amdgpu: Add new placement for preemptible SG
>>>> BOs")
>>>>
>>>> from the drm tree.
>>>>
>>>> I don't know how to fix this, so I added the following hack (a better
>>>> fix would be nice):
>>>>
>>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>>> Date: Tue, 8 Jun 2021 12:41:16 +1000
>>>> Subject: [PATCH] hack fix up for needed amdgpu_preempt_mgr_new() fix up
>>>>
>>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>>> index d607f314cc1b..e1a7b3e967b9 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>>> @@ -66,14 +66,16 @@ static DEVICE_ATTR_RO(mem_info_preempt_used);
>>>>    static int amdgpu_preempt_mgr_new(struct ttm_resource_manager *man,
>>>>                      struct ttm_buffer_object *tbo,
>>>>                      const struct ttm_place *place,
>>>> -                  struct ttm_resource *mem)
>>>> +                  struct ttm_resource **res)
>>>>    {
>>>> +#if 0
>>>>        struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
>>>>          atomic64_add(mem->num_pages, &mgr->used);
>>>>          mem->mm_node = NULL;
>>>>        mem->start = AMDGPU_BO_INVALID_OFFSET;
>>>> +#endif
>>>>        return 0;
>>>>    }
>>>>    

