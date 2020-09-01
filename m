Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0DA25A003
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 22:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113CC6E2D3;
	Tue,  1 Sep 2020 20:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81576E2D3;
 Tue,  1 Sep 2020 20:32:58 +0000 (UTC)
IronPort-SDR: hS5uSv2SOBtAYEafTiRSKfGLibeHC5KJHi6arbyFGiqVh/YHsmheO93GyAvtMGpT8jqhDF8gez
 JWQZKTQZwUFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="157270820"
X-IronPort-AV: E=Sophos;i="5.76,380,1592895600"; d="scan'208";a="157270820"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 13:32:58 -0700
IronPort-SDR: gFe5hnRXldd7fJbFc44nwSHmVrBpVDQxPgbNR4BG7BgaaJWVkVWIwMg89IkXwFGt5CqnaBottM
 K5BiW+C33tjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,380,1592895600"; d="scan'208";a="297441679"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 01 Sep 2020 13:32:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Sep 2020 13:32:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Sep 2020 13:32:43 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Tue, 1 Sep 2020 13:32:43 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [Intel-gfx] [PATCH v9 08/32] drm: i915: fix common struct
 sg_table related issues
Thread-Topic: [Intel-gfx] [PATCH v9 08/32] drm: i915: fix common struct
 sg_table related issues
Thread-Index: AQHWe3Ml/rRJPBw9lEWMq6REwJ0ovqlUN/gwgAB5zQD//4+ngA==
Date: Tue, 1 Sep 2020 20:32:43 +0000
Message-ID: <56ae8ce4ebe6423ea669b85d6dae8318@intel.com>
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063532eucas1p2a9e0215f483104d45af0560d5dbfa8e0@eucas1p2.samsung.com>
 <20200826063316.23486-9-m.szyprowski@samsung.com>
 <259df561c4bb4ef484799e3776dbb402@intel.com>
 <1825327a-efd5-b836-d57e-d9356e279762@arm.com>
In-Reply-To: <1825327a-efd5-b836-d57e-d9356e279762@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: Robin Murphy <robin.murphy@arm.com>
>Sent: Tuesday, September 1, 2020 3:54 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>; Marek Szyprowski
><m.szyprowski@samsung.com>; dri-devel@lists.freedesktop.org;
>iommu@lists.linux-foundation.org; linaro-mm-sig@lists.linaro.org; linux-
>kernel@vger.kernel.org
>Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>; David Airlie
><airlied@linux.ie>; intel-gfx@lists.freedesktop.org; Christoph Hellwig
><hch@lst.de>; linux-arm-kernel@lists.infradead.org
>Subject: Re: [Intel-gfx] [PATCH v9 08/32] drm: i915: fix common struct
>sg_table related issues
>
>On 2020-09-01 20:38, Ruhl, Michael J wrote:
>>> -----Original Message-----
>>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>>> Marek Szyprowski
>>> Sent: Wednesday, August 26, 2020 2:33 AM
>>> To: dri-devel@lists.freedesktop.org; iommu@lists.linux-foundation.org;
>>> linaro-mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org
>>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>; David Airlie
>>> <airlied@linux.ie>; intel-gfx@lists.freedesktop.org; Robin Murphy
>>> <robin.murphy@arm.com>; Christoph Hellwig <hch@lst.de>; linux-arm-
>>> kernel@lists.infradead.org; Marek Szyprowski
>>> <m.szyprowski@samsung.com>
>>> Subject: [Intel-gfx] [PATCH v9 08/32] drm: i915: fix common struct sg_table
>>> related issues
>>>
>>> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg()
>>> function
>>> returns the number of the created entries in the DMA address space.
>>> However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
>>> dma_unmap_sg must be called with the original number of the entries
>>> passed to the dma_map_sg().
>>>
>>> struct sg_table is a common structure used for describing a non-contiguous
>>> memory buffer, used commonly in the DRM and graphics subsystems. It
>>> consists of a scatterlist with memory pages and DMA addresses (sgl entry),
>>> as well as the number of scatterlist entries: CPU pages (orig_nents entry)
>>> and DMA mapped pages (nents entry).
>>>
>>> It turned out that it was a common mistake to misuse nents and orig_nents
>>> entries, calling DMA-mapping functions with a wrong number of entries or
>>> ignoring the number of mapped entries returned by the dma_map_sg()
>>> function.
>>>
>>> This driver creatively uses sg_table->orig_nents to store the size of the
>>> allocated scatterlist and ignores the number of the entries returned by
>>> dma_map_sg function. The sg_table->orig_nents is (mis)used to properly
>>> free the (over)allocated scatterlist.
>>>
>>> This patch only introduces the common DMA-mapping wrappers operating
>>> directly on the struct sg_table objects to the dmabuf related functions,
>>> so the other drivers, which might share buffers with i915 could rely on
>>> the properly set nents and orig_nents values.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>> drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       | 11 +++--------
>>> drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c |  7 +++----
>>> 2 files changed, 6 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> index 2679380159fc..8a988592715b 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> @@ -48,12 +48,9 @@ static struct sg_table
>*i915_gem_map_dma_buf(struct
>>> dma_buf_attachment *attachme
>>> 		src = sg_next(src);
>>> 	}
>>>
>>> -	if (!dma_map_sg_attrs(attachment->dev,
>>> -			      st->sgl, st->nents, dir,
>>> -			      DMA_ATTR_SKIP_CPU_SYNC)) {
>>> -		ret = -ENOMEM;
>>
>> You have dropped this error value.
>>
>> Do you now if this is a benign loss?
>
>True, dma_map_sgtable() will return -EINVAL rather than -ENOMEM for
>failure. A quick look through other .map_dma_buf callbacks suggests
>they're returning a motley mix of error values and NULL for failure
>cases, so I'd imagine that importers shouldn't be too sensitive to the
>exact value.

I followed some of our code through to see if anyone is checking for -ENOMEM...

I have found in some test paths... However, it is not clear to me if we can get
to those paths from here.

Anyways,

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Mike

>Robin.
>
>>
>> M
>>
>>> +	ret = dma_map_sgtable(attachment->dev, st, dir,
>>> DMA_ATTR_SKIP_CPU_SYNC);
>>> +	if (ret)
>>> 		goto err_free_sg;
>>> -	}
>>>
>>> 	return st;
>>>
>>> @@ -73,9 +70,7 @@ static void i915_gem_unmap_dma_buf(struct
>>> dma_buf_attachment *attachment,
>>> {
>>> 	struct drm_i915_gem_object *obj = dma_buf_to_obj(attachment-
>>>> dmabuf);
>>>
>>> -	dma_unmap_sg_attrs(attachment->dev,
>>> -			   sg->sgl, sg->nents, dir,
>>> -			   DMA_ATTR_SKIP_CPU_SYNC);
>>> +	dma_unmap_sgtable(attachment->dev, sg, dir,
>>> DMA_ATTR_SKIP_CPU_SYNC);
>>> 	sg_free_table(sg);
>>> 	kfree(sg);
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>>> b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>>> index debaf7b18ab5..be30b27e2926 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>>> @@ -28,10 +28,9 @@ static struct sg_table *mock_map_dma_buf(struct
>>> dma_buf_attachment *attachment,
>>> 		sg = sg_next(sg);
>>> 	}
>>>
>>> -	if (!dma_map_sg(attachment->dev, st->sgl, st->nents, dir)) {
>>> -		err = -ENOMEM;
>>> +	err = dma_map_sgtable(attachment->dev, st, dir, 0);
>>> +	if (err)
>>> 		goto err_st;
>>> -	}
>>>
>>> 	return st;
>>>
>>> @@ -46,7 +45,7 @@ static void mock_unmap_dma_buf(struct
>>> dma_buf_attachment *attachment,
>>> 			       struct sg_table *st,
>>> 			       enum dma_data_direction dir)
>>> {
>>> -	dma_unmap_sg(attachment->dev, st->sgl, st->nents, dir);
>>> +	dma_unmap_sgtable(attachment->dev, st, dir, 0);
>>> 	sg_free_table(st);
>>> 	kfree(st);
>>> }
>>> --
>>> 2.17.1
>>>
>>> _______________________________________________
>>> Intel-gfx mailing list
>>> Intel-gfx@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
