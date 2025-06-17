Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429ADADC69A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 11:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791DF10E5C3;
	Tue, 17 Jun 2025 09:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AvQaWm3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7E410E5BB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 09:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750152920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sxNGLVvBoDB549OTJwTVX80yqxzNkqnyUmP8nOzpMNA=;
 b=AvQaWm3Ht43NUfF8OAsJlinLYj89bH5Eq8bxCkS4mbxA9H1BceW2396vZ1qDdy45emtXj5
 qpqEv05cJWHMFG0aICNwX9jXR1/EZt5eE5lq6cbzeoZSNA6JVBLDpPeGR17emuziG4LTJV
 MnQMM//W58fqwMoG51P8ZntcvTxrYQA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-TZ2mkT9PPt20t7tvdMqxCg-1; Tue, 17 Jun 2025 05:35:18 -0400
X-MC-Unique: TZ2mkT9PPt20t7tvdMqxCg-1
X-Mimecast-MFC-AGG-ID: TZ2mkT9PPt20t7tvdMqxCg_1750152918
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43e9b0fd00cso3047675e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 02:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750152917; x=1750757717;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=sxNGLVvBoDB549OTJwTVX80yqxzNkqnyUmP8nOzpMNA=;
 b=C/A/X9ts/WMcvX5c2hi5ITb/+icQC0sVQsIDn/qxKQhzfdcsEylClvpzs2ZBfHRb9X
 QlM8ixsX2FpPH+uwNvasQIiDRcVwwg5AgOe23BCUQinzd0GLtltrqHmquQ1v4QhuHLxX
 8LWn45BECKxQfxBntQHQ2yn9UrB9PtX3ShoV60A//ouCrAmv032LR4nbjjqYaI9oEkKz
 ywlJgqRENbMNXIw/nksPM0F9I858X6q8LuD1xfLZ+PzUVWek0Z4yTFb5SHlMPSOJl8bI
 RBk+KcgwYa8+CFgmkP0umdXYEBsLJcG9s0hWduTvc+dFkosl6s2WcuzH5/TtlWhAfOlQ
 DOPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNRMGIGX7kXabvjo0ae0dA4UVYLsK+cPVJCMT3rghyC36IE4aH5q62HjC3CPdju5wm0N8KYFlZRjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQ+hnDSK58+qjQALn6Y+dzaJ09m8rZcy36vARjK4/OKumzHEaG
 7QqbrLoli9yvVVfGBR17Roq02nxqOS/oVLNDNmWVc8RAthbX/NMMAxvnevGcRcN4uWFaDrH+vRR
 dKJxr5r7RuQXmVY/UZ6lKl6guQqHT9/o/9khKlFuYYZsTyYy2NnmMpZFSr+yvcbjt+62uCw==
X-Gm-Gg: ASbGncsAQ9lOvCKrj+15yfZR1gNEEKSZ6NriPdLp5sgPoN6qoDxjtF/mnd/3Yqakhm9
 1jL0i1JxoWJdcTnrzXO23HbH/GTJf90n/mz7GW73c4qmfwULKlDGjfftTc3j98Tt5zz1YZ7z4M5
 mgYUTeuCLt9v4tax/bZxe82AswKBmOCW8D/L0jKaRVup2//uij2iQQWJ4IdWEqCUhnj/COq52Kr
 azDGIvrvAgOXs/jcW5JL5vQERHQbHb2k6UNFxMjnTYTjF1zqal1Y3U1BF+qrpsgq2Fesc3rAH/k
 Z1uxAay0+6elR4U5N7gdu+pvGgljeVclCBxUc9e8CHzEyzY/A5kXN5XI5KvnThPuVDtDapUqOsU
 Th/G7GEKueHfm3t3gr5p61X5undh9TvR5W/zOXNpsOc43M/g=
X-Received: by 2002:a05:600c:64c8:b0:442:d9fb:d9a5 with SMTP id
 5b1f17b1804b1-4533c92e02dmr116197035e9.9.1750152917442; 
 Tue, 17 Jun 2025 02:35:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEit+yPVLJbHP2/NKoMhgu9bHwQKBDL8e7RYDOzVbEtAUjPvQmNHH9hZ4psmoetdsF5NGVCyg==
X-Received: by 2002:a05:600c:64c8:b0:442:d9fb:d9a5 with SMTP id
 5b1f17b1804b1-4533c92e02dmr116195515e9.9.1750152915523; 
 Tue, 17 Jun 2025 02:35:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490?
 (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de.
 [2003:d8:2f31:700:3851:c66a:b6b9:3490])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a57b15015fsm7801901f8f.95.2025.06.17.02.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 02:35:15 -0700 (PDT)
Message-ID: <69bea6b9-e9e7-4d17-843c-001029d4f2c2@redhat.com>
Date: Tue, 17 Jun 2025 11:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] mm: Remove callers of pfn_t functionality
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <657be8fef1f0d15c377ad3c420d77ca4db918013.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <657be8fef1f0d15c377ad3c420d77ca4db918013.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xXChCAmCY5yJRrwUwGLalTbIZIJn-fR5eDWm4rdIEk0_1750152918
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 16.06.25 13:58, Alistair Popple wrote:
> All PFN_* pfn_t flags have been removed. Therefore there is no longer
> a need for the pfn_t type and all uses can be replaced with normal
> pfns.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> ---
> 
> Changes since v1:
> 
>   - Rebased on David's cleanup[1]
> 
> [1] https://lore.kernel.org/linux-mm/20250611120654.545963-1-david@redhat.com/
> ---
>   arch/x86/mm/pat/memtype.c                |  1 +-
>   drivers/dax/device.c                     | 23 +++----
>   drivers/dax/hmem/hmem.c                  |  1 +-
>   drivers/dax/kmem.c                       |  1 +-
>   drivers/dax/pmem.c                       |  1 +-
>   drivers/dax/super.c                      |  3 +-
>   drivers/gpu/drm/exynos/exynos_drm_gem.c  |  1 +-
>   drivers/gpu/drm/gma500/fbdev.c           |  3 +-
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c |  1 +-
>   drivers/gpu/drm/msm/msm_gem.c            |  1 +-
>   drivers/gpu/drm/omapdrm/omap_gem.c       |  6 +--
>   drivers/gpu/drm/v3d/v3d_bo.c             |  1 +-
>   drivers/hwtracing/intel_th/msu.c         |  3 +-
>   drivers/md/dm-linear.c                   |  2 +-
>   drivers/md/dm-log-writes.c               |  2 +-
>   drivers/md/dm-stripe.c                   |  2 +-
>   drivers/md/dm-target.c                   |  2 +-
>   drivers/md/dm-writecache.c               | 11 +--
>   drivers/md/dm.c                          |  2 +-
>   drivers/nvdimm/pmem.c                    |  8 +--
>   drivers/nvdimm/pmem.h                    |  4 +-
>   drivers/s390/block/dcssblk.c             |  9 +--
>   drivers/vfio/pci/vfio_pci_core.c         |  5 +-
>   fs/cramfs/inode.c                        |  5 +-
>   fs/dax.c                                 | 50 +++++++--------
>   fs/ext4/file.c                           |  2 +-
>   fs/fuse/dax.c                            |  3 +-
>   fs/fuse/virtio_fs.c                      |  5 +-
>   fs/xfs/xfs_file.c                        |  2 +-
>   include/linux/dax.h                      |  9 +--
>   include/linux/device-mapper.h            |  2 +-
>   include/linux/huge_mm.h                  |  6 +-
>   include/linux/mm.h                       |  4 +-
>   include/linux/pfn.h                      |  9 +---
>   include/linux/pfn_t.h                    | 85 +-------------------------
>   mm/debug_vm_pgtable.c                    |  1 +-
>   mm/huge_memory.c                         | 21 +++---
>   mm/memory.c                              | 31 ++++-----
>   mm/memremap.c                            |  1 +-
>   mm/migrate.c                             |  1 +-
>   tools/testing/nvdimm/pmem-dax.c          |  6 +-
>   tools/testing/nvdimm/test/iomap.c        |  7 +--
>   tools/testing/nvdimm/test/nfit_test.h    |  1 +-
>   43 files changed, 109 insertions(+), 235 deletions(-)
>   delete mode 100644 include/linux/pfn_t.h
> 

Lovely

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

