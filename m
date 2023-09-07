Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59752797169
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 12:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DA510E7AD;
	Thu,  7 Sep 2023 10:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FF810E7AD
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 10:03:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31adc5c899fso863058f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 03:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694080997; x=1694685797; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xeGzb3Erff18jo9CQXt1zkXNyc0LLxENLPAQOePXlG4=;
 b=KCA4ZW+2S/8/Q0Wm4udV8+x6btU/fo2Oi/MrHI4LkiPRQ3ioNWzXX8u210NPsXEuuS
 x5u6BnNDxEMd6wvP7xZpFGA06N8RlIoD6mm/XebV9Qm6WGjZ2wIJg6OV14oqylGVZ6Ej
 ZzLH6DpOBoyafHPaA55erQMuX8zLXuITHx+4XYc+k1Vd9KCv9Wnw45/F20193UNsWOe3
 K7hRLRPVTZvHy2DjdInaKp+JnV7Hhui196Hw/zHuJyFCZ2MAf2tZl7gCAZhEBpdty6K9
 8PcZ4uSMXrD3/MEfsXMiZ4YOjA7C+cDLSPgyNu7FQkKd1vZnt2wY7NhgILkdCLHQfkyg
 c3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694080997; x=1694685797;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xeGzb3Erff18jo9CQXt1zkXNyc0LLxENLPAQOePXlG4=;
 b=ahHOG2jYKS2SHy5UmayM9PlwMggGnzngSUPPhaf507E+mMoc48eDxSbctTgsD7A4pC
 kClLnUx/SbbJ+JPeLfI6ZqacgURI3R+qQqK+YZ3BGjS0cPest7MqSb4r1nGzZaqWr0qc
 yIOCLLlZaZRK1/TVayajk+SwPceZ9TiErVKDyTAJGoFkTp3rbRiq07WC/yqB+c66onGt
 f4H5l/G/9ToD6viqFEJUZbHK9Uw9JaTv28agmni7i30nHndmdZkrG7iGF6c14eAEth7o
 BeKYVn7ySQRVnMkuVfNlFXpeojiuWpmj4FkzSD+ZbSddtzcEnnGPKld1sTtiSxoC39Yw
 HKwg==
X-Gm-Message-State: AOJu0Yw55o0mxjPjsEJ9M7XRXR9LJlW/+8eNHtEozXuxv5P2umFOs503
 fu2ekdbf8tZbrJ7z9AfaqvsWGQ==
X-Google-Smtp-Source: AGHT+IGY0h7WcTk6nrH2GKB5AeQw5TEuZroHYOktVcTxrpTsoqZptvoAwNyaRLvYhuRDptYyw9C0/g==
X-Received: by 2002:a5d:4651:0:b0:317:e08b:7b1d with SMTP id
 j17-20020a5d4651000000b00317e08b7b1dmr4125801wrs.11.1694080996869; 
 Thu, 07 Sep 2023 03:03:16 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q20-20020a056000137400b003142c85fbcdsm22997110wrz.11.2023.09.07.03.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 03:03:16 -0700 (PDT)
Date: Thu, 7 Sep 2023 13:03:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v16 15/20] drm/shmem-helper: Add memory shrinker
Message-ID: <55952e5b-8c55-4888-ba22-eda33525c3b9@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230903170736.513347-16-dmitry.osipenko@collabora.com>
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 oe-kbuild-all@lists.linux.dev, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/drm-shmem-helper-Fix-UAF-in-error-path-when-freeing-SGT-of-imported-GEM/20230904-011037
base:   linus/master
patch link:    https://lore.kernel.org/r/20230903170736.513347-16-dmitry.osipenko%40collabora.com
patch subject: [PATCH v16 15/20] drm/shmem-helper: Add memory shrinker
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070814.jyGJOJzY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230907/202309070814.jyGJOJzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309070814.jyGJOJzY-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_gem_shmem_helper.c:733 drm_gem_shmem_fault() error: we previously assumed 'shmem->pages' could be null (see line 724)

vim +733 drivers/gpu/drm/drm_gem_shmem_helper.c

2194a63a818db7 Noralf Trønnes  2019-03-12  702  static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
2194a63a818db7 Noralf Trønnes  2019-03-12  703  {
2194a63a818db7 Noralf Trønnes  2019-03-12  704  	struct vm_area_struct *vma = vmf->vma;
2194a63a818db7 Noralf Trønnes  2019-03-12  705  	struct drm_gem_object *obj = vma->vm_private_data;
2194a63a818db7 Noralf Trønnes  2019-03-12  706  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
2194a63a818db7 Noralf Trønnes  2019-03-12  707  	loff_t num_pages = obj->size >> PAGE_SHIFT;
d611b4a0907cec Neil Roberts    2021-02-23  708  	vm_fault_t ret;
2194a63a818db7 Noralf Trønnes  2019-03-12  709  	struct page *page;
11d5a4745e00e7 Neil Roberts    2021-02-23  710  	pgoff_t page_offset;
2c607edf57db6a Dmitry Osipenko 2023-09-03  711  	bool pages_unpinned;
2c607edf57db6a Dmitry Osipenko 2023-09-03  712  	int err;
11d5a4745e00e7 Neil Roberts    2021-02-23  713  
11d5a4745e00e7 Neil Roberts    2021-02-23  714  	/* We don't use vmf->pgoff since that has the fake offset */
11d5a4745e00e7 Neil Roberts    2021-02-23  715  	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
2194a63a818db7 Noralf Trønnes  2019-03-12  716  
21aa27ddc58269 Dmitry Osipenko 2023-05-30  717  	dma_resv_lock(shmem->base.resv, NULL);
2194a63a818db7 Noralf Trønnes  2019-03-12  718  
2c607edf57db6a Dmitry Osipenko 2023-09-03  719  	/* Sanity-check that we have the pages pointer when it should present */
2c607edf57db6a Dmitry Osipenko 2023-09-03  720  	pages_unpinned = (shmem->evicted || shmem->madv < 0 ||
2c607edf57db6a Dmitry Osipenko 2023-09-03  721  			  !refcount_read(&shmem->pages_use_count));
2c607edf57db6a Dmitry Osipenko 2023-09-03  722  	drm_WARN_ON_ONCE(obj->dev, !shmem->pages ^ pages_unpinned);
2c607edf57db6a Dmitry Osipenko 2023-09-03  723  
2c607edf57db6a Dmitry Osipenko 2023-09-03 @724  	if (page_offset >= num_pages || (!shmem->pages && !shmem->evicted)) {
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Should this be || instead of &&?  (The other thing that people do is
add "!shmem->evicted" for readability even though it doesn't need to be
checked.  So maybe that's the issue, but the checker assumes it needs to
be checked).

d611b4a0907cec Neil Roberts    2021-02-23  725  		ret = VM_FAULT_SIGBUS;
d611b4a0907cec Neil Roberts    2021-02-23  726  	} else {
2c607edf57db6a Dmitry Osipenko 2023-09-03  727  		err = drm_gem_shmem_swapin_locked(shmem);

Or maybe it's because the kbuild bot can't use the cross function db
and shmem->pages is assigned here?

2c607edf57db6a Dmitry Osipenko 2023-09-03  728  		if (err) {
2c607edf57db6a Dmitry Osipenko 2023-09-03  729  			ret = VM_FAULT_OOM;
2c607edf57db6a Dmitry Osipenko 2023-09-03  730  			goto unlock;
2c607edf57db6a Dmitry Osipenko 2023-09-03  731  		}
2c607edf57db6a Dmitry Osipenko 2023-09-03  732  
11d5a4745e00e7 Neil Roberts    2021-02-23 @733  		page = shmem->pages[page_offset];
                                                                       ^^^^^^^^^^^^
Unchecked dereference

2194a63a818db7 Noralf Trønnes  2019-03-12  734  
8b93d1d7dbd578 Daniel Vetter   2021-08-12  735  		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
d611b4a0907cec Neil Roberts    2021-02-23  736  	}
d611b4a0907cec Neil Roberts    2021-02-23  737  
2c607edf57db6a Dmitry Osipenko 2023-09-03  738  unlock:
21aa27ddc58269 Dmitry Osipenko 2023-05-30  739  	dma_resv_unlock(shmem->base.resv);
d611b4a0907cec Neil Roberts    2021-02-23  740  
d611b4a0907cec Neil Roberts    2021-02-23  741  	return ret;
2194a63a818db7 Noralf Trønnes  2019-03-12  742  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

