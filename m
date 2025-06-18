Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43359ADF470
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 19:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E1610E8F9;
	Wed, 18 Jun 2025 17:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qmbUHWGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C060A10E8ED
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 17:43:28 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-60efc773b5fso3886100eaf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 10:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750268608; x=1750873408; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vNQd+s4c7fZ/c1u+NR4VFA1VDON+kx4gKdQrhwnx4oE=;
 b=qmbUHWGhW0nkLXY5Zo2ABpxBmDjmWOCh2D4m2EpTiOMCOkjpC0gDNiZj2B4xE72qvF
 bNeOPriBB3+cRtn6JfjLS4DFlcR1Z1HnbkYgD5NAQCblwdsr3HNzb/Dxp9FeQJ+/2SHF
 43SONiyv79pqKoU4A1CTGQ/UAPgU4MRcGgvknoFxcxFhcfFgoeZhovsPLsFVOoHEPic2
 CeCHU1RpJGvOar4b/udhzZyqBSMnWv7yfJUq6O2Fr0Do96N22az+U/KLVEjS7i6scgev
 40bdyea4iqjVQOLYjeW652bsWwYSU7Q/mJkFFjbDMpkHTeQwCaVCp+lkWSXXaER6CdnE
 psUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750268608; x=1750873408;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vNQd+s4c7fZ/c1u+NR4VFA1VDON+kx4gKdQrhwnx4oE=;
 b=YBZPq9oK0GOvt1vzu/vAnDJqQPlHMfVJbJhAz+xz2+VdUgaNDwVMbzC4MtsegWiMfq
 eo3o3owL+TuhHI53YHWYmD65vhMCEXEU/VWmK3R5V7uGqNpZ2oLbCH4rhY02u3F/Do1h
 Ppv+foKwn1CNJwZtkuSdL43fwPso/elRoS8erYQY5s3TSMnla40ro5PuOYscLxKfYI8K
 GG5DpJUCaoPuJaDg4UFL/Xd64s5/2T1r8UA1ZyrVNvkBtmWu1/S+Kv9SUESOZsmQiFFu
 RFvnzbeWD9y4l8WTHahJWgnx6jm/DeOlpPTjgbbaUclKPN7bAZ2LoQeTmRn3JHDJAK4O
 zGXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWonPKmmdQ8fPOMIrxPesIq8+dn3B3V9FER6DJsbdTBk4tjMuzrg/FErKpJig8TsBi0l3yIRpwiHes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yydpr5jzo7jyO94UTebVuUYrvIMtKUdKMQ9SXBhslOHEGz5Z0Lf
 0fw9GFFJMLey20VtQzHR55QK8ObCaVsB40Wr1NE786MzdBtf4QcO6tO6Fye/+OBvaL4=
X-Gm-Gg: ASbGnctmtUgFWwnTIdGDF1IsmprBRNNPK0KUBC3T9sEEAZhT6fjM9nxYW+kb3nJQEVj
 iub98KnLO84Eed5M6nXkSk+0rjLKFxOiNJSnJB+W0NkFRhjhzTJZlidKfI2DvWiY4HONY3z0wNY
 oHNEmfq5A0wQ95DpWWYs16/PuX2GP1kpxXmPrUpTcsNFjnmRUpkiohUpkSwr9ACVSS9FEFeMS8m
 She/pWBtfS6p30fnWHfZq0V+eJjmAs9Woupycbh3yWsCPFLu988x9WdvM5lLlyXwswchKLBZGUx
 vREtCMHqaXYNdlTHjL2L4Kby7IOn9ombkHYNQezuyfrebak5rs/DStIliFMrQb6oYrhCCA==
X-Google-Smtp-Source: AGHT+IGs9y4YrLtKzq6Kz0kcquCWy6Yh0zVB81lvYnZESWbuJcIsS2VOc4LPbw1BHhsB9ZG3W8MT8A==
X-Received: by 2002:a05:6820:627:b0:60b:cd81:9079 with SMTP id
 006d021491bc7-61110f10f38mr10142367eaf.5.1750268607871; 
 Wed, 18 Jun 2025 10:43:27 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-61108ebd993sm1496207eaf.21.2025.06.18.10.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 10:43:27 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:43:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 3/3] drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict()
 using the guarded LRU iteration
Message-ID: <4c7a6891-3925-428d-8df8-6576abd63eb3@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613151824.178650-4-thomas.hellstrom@linux.intel.com>
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

Hi Thomas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Use-a-struct-for-the-common-part-of-struct-ttm_lru_walk-and-struct-ttm_bo_lru_cursor/20250613-232106
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250613151824.178650-4-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 3/3] drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict() using the guarded LRU iteration
config: i386-randconfig-141-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141727.FtEuY8xN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506141727.FtEuY8xN-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_bo_util.c:975 __ttm_bo_lru_cursor_next() error: uninitialized symbol 'ret'.

vim +/ret +975 drivers/gpu/drm/ttm/ttm_bo_util.c

f3bcfd04a52fb1 Thomas Hellström 2025-03-05  927  static struct ttm_buffer_object *
a9654c8f32d9f4 Thomas Hellström 2025-06-13  928  __ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs, bool first)
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  929  {
a9654c8f32d9f4 Thomas Hellström 2025-06-13  930  	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  931  	struct ttm_resource *res = NULL;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  932  	struct ttm_buffer_object *bo;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  933  	struct ttm_lru_walk_arg *arg = curs->arg;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  934  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  935  	ttm_bo_lru_cursor_cleanup_bo(curs);
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  936  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  937  	spin_lock(lru_lock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  938  	for (;;) {
a9654c8f32d9f4 Thomas Hellström 2025-06-13  939  		int mem_type, ret;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  940  		bool bo_locked = false;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  941  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  942  		if (first) {
a9654c8f32d9f4 Thomas Hellström 2025-06-13  943  			res = ttm_resource_manager_first(&curs->res_curs);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  944  			first = false;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  945  		} else {
a9654c8f32d9f4 Thomas Hellström 2025-06-13  946  			res = ttm_resource_manager_next(&curs->res_curs);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  947  		}
a9654c8f32d9f4 Thomas Hellström 2025-06-13  948  		if (!res)
a9654c8f32d9f4 Thomas Hellström 2025-06-13  949  			break;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  950  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  951  		bo = res->bo;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  952  		if (ttm_lru_walk_trylock(arg, bo, &curs->needs_unlock))
a9654c8f32d9f4 Thomas Hellström 2025-06-13  953  			bo_locked = true;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  954  		else if (!arg->ticket || arg->ctx->no_wait_gpu || arg->trylock_only)
a9654c8f32d9f4 Thomas Hellström 2025-06-13  955  			continue;
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  956  
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  957  		if (!ttm_bo_get_unless_zero(bo)) {
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  958  			if (curs->needs_unlock)
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  959  				dma_resv_unlock(bo->base.resv);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  960  			continue;
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  961  		}
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  962  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  963  		mem_type = res->mem_type;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  964  		spin_unlock(lru_lock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  965  		if (!bo_locked)
a9654c8f32d9f4 Thomas Hellström 2025-06-13  966  			ret = ttm_lru_walk_ticketlock(arg, bo, &curs->needs_unlock);

ret is uninitialized on else path

a9654c8f32d9f4 Thomas Hellström 2025-06-13  967  		/*
a9654c8f32d9f4 Thomas Hellström 2025-06-13  968  		 * Note that in between the release of the lru lock and the
a9654c8f32d9f4 Thomas Hellström 2025-06-13  969  		 * ticketlock, the bo may have switched resource,
a9654c8f32d9f4 Thomas Hellström 2025-06-13  970  		 * and also memory type, since the resource may have been
a9654c8f32d9f4 Thomas Hellström 2025-06-13  971  		 * freed and allocated again with a different memory type.
a9654c8f32d9f4 Thomas Hellström 2025-06-13  972  		 * In that case, just skip it.
a9654c8f32d9f4 Thomas Hellström 2025-06-13  973  		 */
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  974  		curs->bo = bo;
a9654c8f32d9f4 Thomas Hellström 2025-06-13 @975  		if (!ret && bo->resource && bo->resource->mem_type == mem_type)
                                                                    ^^^^
warning

f3bcfd04a52fb1 Thomas Hellström 2025-03-05  976  			return bo;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  977  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  978  		ttm_bo_lru_cursor_cleanup_bo(curs);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  979  		if (ret)
a9654c8f32d9f4 Thomas Hellström 2025-06-13  980  			return ERR_PTR(ret);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  981  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  982  		spin_lock(lru_lock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  983  	}
a9654c8f32d9f4 Thomas Hellström 2025-06-13  984  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  985  	spin_unlock(lru_lock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  986  	return res ? bo : NULL;
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  987  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

