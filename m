Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF39405C7E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 20:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7BF6E8EE;
	Thu,  9 Sep 2021 18:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154D96E8EE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 18:01:46 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210909180144euoutp023701a7e55c7f73dfed439d1d7719d7e3~jOU_empTI2789327893euoutp02t
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 18:01:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210909180144euoutp023701a7e55c7f73dfed439d1d7719d7e3~jOU_empTI2789327893euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1631210504;
 bh=Arwj0otlihx/wAhFKqYkNqbDC6Ue2LTwGy21YiXkvqs=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=g8/Qek3K/aat6Stm5ki7k5RcDYtM5fD1THrMEpC3Q9JMvzqZHRubPjOrrTu1p5tIj
 CZ52dtqhq5ZZmew60d/F1AtQRCUAuSaGdmJ+bpMZr+xVJg65UqSjmoUGUt4glyUkaM
 f2TEek+sjUTquyZI11yEElyVzGDFliSnI9cXGlEw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210909180143eucas1p1e55a60e1364ee1eca9c691d0193f4bed~jOU_IIZsW2784227842eucas1p11;
 Thu,  9 Sep 2021 18:01:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C0.1A.56448.70C4A316; Thu,  9
 Sep 2021 19:01:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210909180142eucas1p188adef2d3cf8cd8241a2a91989174b05~jOU9WPB4Q2784227842eucas1p10;
 Thu,  9 Sep 2021 18:01:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210909180142eusmtrp16dcbd7cd604030119503490c39d194ec~jOU9VlrKG1744317443eusmtrp1j;
 Thu,  9 Sep 2021 18:01:42 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-68-613a4c0752fd
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 79.B2.31287.60C4A316; Thu,  9
 Sep 2021 19:01:42 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210909180142eusmtip1a1dc1031813eccb31d70502a9a1795d8~jOU9Ah86k2085820858eusmtip1h;
 Thu,  9 Sep 2021 18:01:42 +0000 (GMT)
Message-ID: <cdcfac40-08d0-6918-1287-03b7a03cc348@samsung.com>
Date: Thu, 9 Sep 2021 20:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0)
 Gecko/20100101 Thunderbird/92.0
Subject: Re: [PATCH 1/8] drm/ttm: remove the outdated kerneldoc section
Content-Language: pl
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com, daniel@ffwll.ch, alexdeucher@gmail.com
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210908132933.3269-2-christian.koenig@amd.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduznOV12H6tEg0f31Czu/JnFbvF6zmkm
 i//bJjJbXPn6ns2if+pPVgdWj73fFrB47Jx1l93jfvdxpgDmKC6blNSczLLUIn27BK6ML1PP
 MBVckqzYf/AGWwPjQpEuRk4OCQETiR/fl7B0MXJxCAmsYJR40n+ACcL5wigx4+spVgjnM6PE
 +omLWGBaGk5NZYZILGeUWHHhIiOE855R4vSCJvYuRg4OXgE7iSOvCkAaWARUJI5fmM0IYvMK
 CEqcnPkEbJCoQILE86VfmUBsYQF3iSU3roPVMAuISNx41MIIMkZEIEti18wUiLCXxIYZ38FK
 2AQ0Jf5uvskGYnMK2EpMa1jJBlEjL9G8dTbYbRICBzgkZs87wwIyR0LAReLmaUeI+4UlXh3f
 wg5hy0icntwD9Ve9xP0VLVC9HYwSWzfsZIZIWEvcOfeLDWQOM9Di9bv0IcKOEs0PL7NCjOeT
 uPFWEOIEPolJ26YzQ4R5JTrahCCqFSXun90KNVBcYumFr2wTGJVmIYXJLCS/z0LyzCyEvQsY
 WVYxiqeWFuempxYb56WW6xUn5haX5qXrJefnbmIEJpbT/45/3cG44tVHvUOMTByMhxglOJiV
 RHhPbLBMFOJNSaysSi3Kjy8qzUktPsQozcGiJM67a+uaeCGB9MSS1OzU1ILUIpgsEwenVAPT
 vEjN/e2WB6cIMNl1RQm8+FVofYXjjeBy5r9PMoRMp0zs8Mt4sZ1lheHzubff6x97fWTZhAPH
 LLbq/y608apINT8dc2q3g5fix7t+k69NXNywLSt71oJfM++meHu4XF22o9nk6dXHTyQutm7z
 acjq17O88uLbHkOhhsP+LxbpCOYc5PE0U2Tom3vJzzLfvO/lp5Pnp7++krhO1Hx9vvKLkBuL
 rs9m6fD+kfH/V8fMBINpm5fOfjvvwbSrX7oNlrXtnPn7kIOHos/mOv2z0YGtt3VC5NZsZT75
 arLltcm2kVMSS3b4CVjpHqnI/JH8JkPDZvv245V3HP1FtlxUbflw7rq2RtvEhKV3mvZvs6rx
 CVBiKc5INNRiLipOBACpOxgTmwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsVy+t/xu7psPlaJBt+3mVjc+TOL3eL1nNNM
 Fv+3TWS2uPL1PZtF/9SfrA6sHnu/LWDx2DnrLrvH/e7jTAHMUXo2RfmlJakKGfnFJbZK0YYW
 RnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZX6aeYSq4JFmx/+ANtgbGhSJdjJwc
 EgImEg2npjJ3MXJxCAksZZRY9mA6O0RCXGL3/LfMELawxJ9rXWwQRW8ZJW5/2wuU4ODgFbCT
 OPKqAKSGRUBF4viF2YwgNq+AoMTJmU9YQGxRgQSJ3Ye7wGYKC7hLLLlxHayGWUBE4sajFjBb
 RCBL4nPzV6i4l8SGGd8ZIXYdZpRYfXkSWDObgKbE38032UBsTgFbiWkNK9kgGswkurZ2QTXL
 SzRvnc08gVFoFpI7ZiHZNwtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIExtO2
 Yz8372Cc9+qj3iFGJg7GQ4wSHMxKIrwnNlgmCvGmJFZWpRblxxeV5qQWH2I0BQbGRGYp0eR8
 YETnlcQbmhmYGpqYWRqYWpoZK4nzbp27Jl5IID2xJDU7NbUgtQimj4mDU6qBaUeAaubKZzL3
 zvSkNTV8SwkID9Kt+Tf9HI/C5EjrsxqaGRNeyAbW7NCf5baOR7jtS9PVJe4Jq5+861L0mhf/
 z+ryrb//BEQs9rSXMrH0HGA9VfqFa+epqULMRzhFrwoZbKk9tPhaxafiS8nHZ6ZP7X+9q85I
 4MwtFa2mw9FnJ1lU6dvYLr5oeqNnfoB8cbfz5KD/n7JnbJC97BbEvn3rv2UG9r9nq8VcsXhr
 /nYpY6/YvT3z/jp7Lg/wPB7beyIrX3r74a933vzzUq71+D51w/6oD9NmFu61eF4Z1tOjs0v1
 dZ3Lt0ua6Ztmiy6a2RYXmGRsPZFff0bfNtV55eUmKUyWj50ibNfJ83Zu+nzrjxJLcUaioRZz
 UXEiAK1vpYowAwAA
X-CMS-MailID: 20210909180142eucas1p188adef2d3cf8cd8241a2a91989174b05
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210908132952eucas1p1a12bfa29e9e02b88823ac897c570dd16
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210908132952eucas1p1a12bfa29e9e02b88823ac897c570dd16
References: <20210908132933.3269-1-christian.koenig@amd.com>
 <CGME20210908132952eucas1p1a12bfa29e9e02b88823ac897c570dd16@eucas1p1.samsung.com>
 <20210908132933.3269-2-christian.koenig@amd.com>
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


W dniu 08.09.2021 o 15:29, Christian König pisze:
> Clean up to start over with new and more accurate documentation.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>


Thanks for fixing documentation, I hope it will be also expanded :)

For the whole series:

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej


> ---
>   Documentation/gpu/drm-mm.rst | 49 ------------------------------------
>   1 file changed, 49 deletions(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 0198fa43d254..8ca981065e1a 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -30,55 +30,6 @@ The Translation Table Manager (TTM)
>   
>   TTM design background and information belongs here.
>   
> -TTM initialization
> -------------------
> -
> -    **Warning**
> -    This section is outdated.
> -
> -Drivers wishing to support TTM must pass a filled :c:type:`ttm_bo_driver
> -<ttm_bo_driver>` structure to ttm_bo_device_init, together with an
> -initialized global reference to the memory manager.  The ttm_bo_driver
> -structure contains several fields with function pointers for
> -initializing the TTM, allocating and freeing memory, waiting for command
> -completion and fence synchronization, and memory migration.
> -
> -The :c:type:`struct drm_global_reference <drm_global_reference>` is made
> -up of several fields:
> -
> -.. code-block:: c
> -
> -              struct drm_global_reference {
> -                      enum ttm_global_types global_type;
> -                      size_t size;
> -                      void *object;
> -                      int (*init) (struct drm_global_reference *);
> -                      void (*release) (struct drm_global_reference *);
> -              };
> -
> -
> -There should be one global reference structure for your memory manager
> -as a whole, and there will be others for each object created by the
> -memory manager at runtime. Your global TTM should have a type of
> -TTM_GLOBAL_TTM_MEM. The size field for the global object should be
> -sizeof(struct ttm_mem_global), and the init and release hooks should
> -point at your driver-specific init and release routines, which probably
> -eventually call ttm_mem_global_init and ttm_mem_global_release,
> -respectively.
> -
> -Once your global TTM accounting structure is set up and initialized by
> -calling ttm_global_item_ref() on it, you need to create a buffer
> -object TTM to provide a pool for buffer object allocation by clients and
> -the kernel itself. The type of this object should be
> -TTM_GLOBAL_TTM_BO, and its size should be sizeof(struct
> -ttm_bo_global). Again, driver-specific init and release functions may
> -be provided, likely eventually calling ttm_bo_global_ref_init() and
> -ttm_bo_global_ref_release(), respectively. Also, like the previous
> -object, ttm_global_item_ref() is used to create an initial reference
> -count for the TTM, which will call your initialization function.
> -
> -See the radeon_ttm.c file for an example of usage.
> -
>   The Graphics Execution Manager (GEM)
>   ====================================
>   
