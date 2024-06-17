Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D2D90B10D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1064510E141;
	Mon, 17 Jun 2024 14:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SgfQeZQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FB710E3B9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:09:21 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42172ed3487so32208985e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718633360; x=1719238160; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1gYFbVZSR1dJf0iOwy3Gs/2RtGXxduy8gw+Ee2OK2y0=;
 b=SgfQeZQqZVPhIBJFh6xS2Evteyuh1PSO9djTibsn8WAYQuztsSyROQ5AnXyCby9vTY
 9ZC23LFU+cj71eQ+jfT5eqkgQ9+7yoUr7lbox0K0nCfaoRiUnd4WSuOnKtT7G8ionh/D
 bhwC5J5zYeKi9m79RnE6eQBGcx4arZjOqvAFOKT1in567CIyX5G3Kv3g0siGnzt4fJdv
 wiIh5ypFYjToVBzC0toAZ/V8k6Gv4mnMZfELC3Q9PRs5HKAWNvzX1uTZMZl8SeShVWWz
 lsfWHEDf8HHMOUJ7NJjtwDMZYUHNH+C5nx2vK14+JhojqyxPlTHBXv6s9jUBoPQZG5c0
 CFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718633360; x=1719238160;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1gYFbVZSR1dJf0iOwy3Gs/2RtGXxduy8gw+Ee2OK2y0=;
 b=GUO7Jg+3erZI+gPUHa4zTu5bUOVsk5obH8mvz8B2cM7fx/hDzeicaewBTLKQg08xEd
 d6Z9s/6n3xty61TTfE2rdOADEp/Bp4BuZEoYj7RIK6LTVcOOlyUl6j0ifAO4Yb82Onlt
 gWJi+ZdTs6A/fW4FLbWC6X+tmKcOihB6AFZXZO+ittclzUeX2CEI+nsUkND9v9qeoCkD
 0UGRkb94nJW02ClYkdKL9EtBcYTo1z3lbBuM2M3k24n4D0e1PffRH6/L369ZKHqK6695
 y9AphIOLCd27yCq2vJr/FpcxmHdyE58/JqKAONapwwCNczYtnfxPzPc8oApX+ZcjqzWQ
 oftw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9IISPbiAYQEKGQvEtj+eB63XOYS2NDnfDcFY6SP0sMjoKJQXAOFC+S024yuiFVGMMMkXIQkmJi4PJW7ipijQLH4J0OzoLYq0XcLTnOOA4
X-Gm-Message-State: AOJu0Yyw5OBQ/prC+1aKiAAdF8H/v4qlzHqS8I95Z6f6n/DV8L3rN4G+
 igzfM8xqK4ukRdU6ldq+l/Tbi+09KBNJRI7PL53vK80P6AbeBem++kLmdP2/ZBo=
X-Google-Smtp-Source: AGHT+IF89ub/bTYppiV6Zahl61F3KmzNpcO+gb7uLo/5I8P47UFh48RCrUXbcRA1pdZXpLdtZkFucQ==
X-Received: by 2002:a05:600c:3550:b0:421:e3d6:920b with SMTP id
 5b1f17b1804b1-42304811e38mr79919105e9.3.1718633359775; 
 Mon, 17 Jun 2024 07:09:19 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874de646sm199893195e9.35.2024.06.17.07.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 07:09:19 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:09:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 08/12] drm/ttm: Add a virtual base class for graphics
 memory backup
Message-ID: <de143b6f-461d-4c26-8ab7-bd07795696ed@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614102548.4364-9-thomas.hellstrom@linux.intel.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240614-182911
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240614102548.4364-9-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v4 08/12] drm/ttm: Add a virtual base class for graphics memory backup
config: x86_64-randconfig-161-20240617 (https://download.01.org/0day-ci/archive/20240617/202406170559.WdDkFEiU-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406170559.WdDkFEiU-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_backup_shmem.c:130 ttm_backup_shmem_create() error: dereferencing freed memory 'sbackup'

vim +/sbackup +130 drivers/gpu/drm/ttm/ttm_backup_shmem.c

827540d42dec01 Thomas Hellström 2024-06-14  119  struct ttm_backup *ttm_backup_shmem_create(loff_t size)
827540d42dec01 Thomas Hellström 2024-06-14  120  {
827540d42dec01 Thomas Hellström 2024-06-14  121  	struct ttm_backup_shmem *sbackup =
827540d42dec01 Thomas Hellström 2024-06-14  122  		kzalloc(sizeof(*sbackup), GFP_KERNEL | __GFP_ACCOUNT);
827540d42dec01 Thomas Hellström 2024-06-14  123  
827540d42dec01 Thomas Hellström 2024-06-14  124  	if (!sbackup)
827540d42dec01 Thomas Hellström 2024-06-14  125  		return ERR_PTR(-ENOMEM);
827540d42dec01 Thomas Hellström 2024-06-14  126  
827540d42dec01 Thomas Hellström 2024-06-14  127  	sbackup->filp = shmem_file_setup("ttm shmem backup", size, 0);
827540d42dec01 Thomas Hellström 2024-06-14  128  	if (IS_ERR(sbackup->filp)) {
827540d42dec01 Thomas Hellström 2024-06-14  129  		kfree(sbackup);
                                                                      ^^^^^^^
Freed

827540d42dec01 Thomas Hellström 2024-06-14 @130  		return ERR_CAST(sbackup->filp);
                                                                                ^^^^^^^^^^^^^
Use after free

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

