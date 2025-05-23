Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79763AC1F92
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 11:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD41B10E2EF;
	Fri, 23 May 2025 09:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hTGrENHX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C2210E2EF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 09:15:57 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso90172645e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747991756; x=1748596556; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y3WXBjLGDXin9jsjtnZSl8cR3pHiWFrfIXJVJ0zqrII=;
 b=hTGrENHXD2Xpq92JITmUFy4AQR9VeYpL9AxQoTNQzR+OAXEr0JsCcZUn1wuk21XKyR
 SKm4N5k1KKeL4N5gGO1Wldcxaub7TyM16JQixVVP7Ue+lRyB4wLaN/4+55xFQQVg3mj4
 hcPFUs9Awz7JtsBZHLHSaI/zlA8Acd/otjQeLIzfUBbWbaDUz7gwh9dQ3x478+gPiXPG
 qt0BDUu30gOd6XoYkOMhtyRAcduxu4PDEspG3rH3BKTvcJOaRhAaaU5m84/WCiAGlZ0F
 fVNG9x0rMf2AE5lxqyrn45LFtvBzDZs0+ckbILfK9lEPr9HNxna0na4tIfLPVAfPHUJf
 x3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747991756; x=1748596556;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y3WXBjLGDXin9jsjtnZSl8cR3pHiWFrfIXJVJ0zqrII=;
 b=JR3Nk8sL5Yo42EyZDUDQqqzgDhlFGscf7ffYRi7zrdOuvXZ3OvVbnMP0aLf3F+cFmI
 ikemcpmYR3RDZ6ngaYaLsSPNImjgKBp6MKTz/sFV1nCp2+3Bf1iFMmQONPTkLthVPInA
 Li5Mj1vsAbZGqMPupY+070LN7prncT3QyrIWwBvVcRK9gaiixU2/iQd03A9jX+wI+Xlw
 9jEGl+AiQci8leELtgxa/cGszPitt2TMp19+FXu+cNM8PMAPhPY/htrxSP9O8I0oCLj+
 4hUv3/JskiajmFgVXA5SelAmS1XXSoDIafWG1yum5XGQeky4uJzmJt3QNuQsmQOUZgD4
 ZN7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUazv1TDuETz+NwmgyL0vORVRgBkSr1nzwy+6m1OiW2GIP8skQAh+76f+PDYssJRqpzyUYOHC6sqGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yympd86WWAAG6VNZzSgimsF9BFa1NKtgg3EMyLTitKZ//8LW0mN
 Sz+uE5i+mzULzQwoFaowYOoz8f34t7vbNqzNHaKhr5uGe+QsgF4pv7cAYmTnjeih9Zk=
X-Gm-Gg: ASbGncs4QLRB/yA0ZQ8MUlh3LpTh+fNkPmNAwPcZspHK1JfGKmOvytUfsF60HxmqrA+
 W9WBPKth6blp9LSAbCTb8slX4FmjNdLkzj2vlhMBasWaVsjxEhD0FsB02uGL/OwbYS0ZuN96trg
 pVLQ0+6yC5FsAgrFGF475oj7auuSCiMVCZAgzdY+ceKV4p16QKLJsecca5HQxzzuZ2mapp8mw1O
 Xh12nsTKqwv+LMhTVgEsVVfK9btzgGvY1TNNraKbeSlavusFan346oWomf8xpNov44fbrQhBT4n
 NPsYKYV49BJAnebM6nwCxY+oN9ycdSVK0b2UhJlyw5YBC/HwekSSNEC3
X-Google-Smtp-Source: AGHT+IErc1cQ7uKFa9JTPR19qj1Saui5L/XCi2xVWkEt00vpj8C2BFDVqFxExb/6CuDcpsIEAnQTkQ==
X-Received: by 2002:a05:6000:4203:b0:3a3:64c2:2a8b with SMTP id
 ffacd0b85a97d-3a4c235127cmr2545309f8f.49.1747991756327; 
 Fri, 23 May 2025 02:15:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35fa8c6d6sm25016404f8f.26.2025.05.23.02.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 02:15:55 -0700 (PDT)
Date: Fri, 23 May 2025 12:15:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Francis <David.Francis@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, tvrtko.ursulin@igalia.com,
 Felix.Kuehling@amd.com, David.YatSin@amd.com,
 Chris.Freehill@amd.com, Christian.Koenig@amd.com,
 dcostantino@meta.com, sruffell@meta.com, simona@ffwll.ch,
 mripard@kernel.org, tzimmermann@suse.de,
 David Francis <David.Francis@amd.com>
Subject: Re: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
Message-ID: <202505230705.6EOoxLbq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521140649.4058526-3-David.Francis@amd.com>
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

Hi David,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Francis/drm-amdgpu-Adding-amdgpu-CRIU-ioctl/20250521-230706
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250521140649.4058526-3-David.Francis%40amd.com
patch subject: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
config: loongarch-randconfig-r073-20250522 (https://download.01.org/0day-ci/archive/20250523/202505230705.6EOoxLbq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505230705.6EOoxLbq-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:160 amdgpu_criu_checkpoint() warn: potential ! vs ~ typo

vim +160 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c

d970da5c8545bbc David Francis 2025-05-21  145  	vm_buckets = kvzalloc(args->num_vms * sizeof(*vm_buckets), GFP_KERNEL);
d970da5c8545bbc David Francis 2025-05-21  146  	if (!vm_buckets) {
d970da5c8545bbc David Francis 2025-05-21  147  		ret = -ENOMEM;
d970da5c8545bbc David Francis 2025-05-21  148  		goto free_vms;
d970da5c8545bbc David Francis 2025-05-21  149  	}
d970da5c8545bbc David Francis 2025-05-21  150  
d970da5c8545bbc David Francis 2025-05-21  151  	idr_for_each_entry(&data->object_idr, gobj, id) {
d970da5c8545bbc David Francis 2025-05-21  152  		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
d970da5c8545bbc David Francis 2025-05-21  153  		struct drm_amdgpu_criu_bo_bucket *bo_bucket;
d970da5c8545bbc David Francis 2025-05-21  154  		struct amdgpu_vm_bo_base *vm_bo_base;
d970da5c8545bbc David Francis 2025-05-21  155  
d970da5c8545bbc David Francis 2025-05-21  156  		bo_bucket = &bo_buckets[bo_index];
d970da5c8545bbc David Francis 2025-05-21  157  
d970da5c8545bbc David Francis 2025-05-21  158  		bo_bucket->size = amdgpu_bo_size(bo);
d970da5c8545bbc David Francis 2025-05-21  159  		bo_bucket->offset = amdgpu_bo_mmap_offset(bo);
d970da5c8545bbc David Francis 2025-05-21 @160  		bo_bucket->alloc_flags = bo->flags & (!AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);

This looks like it was supposed to clear the AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE
bit.

	bo_bucket->alloc_flags = bo->flags & ~AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;

Currently it just sets "bo_bucket->alloc_flags = 0;"

d970da5c8545bbc David Francis 2025-05-21  161  		bo_bucket->preferred_domains = bo->preferred_domains;
d970da5c8545bbc David Francis 2025-05-21  162  
d970da5c8545bbc David Francis 2025-05-21  163  		if (is_import(bo))
d970da5c8545bbc David Francis 2025-05-21  164  			bo_bucket->flags |= AMDGPU_CRIU_BO_FLAG_IS_IMPORT;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

