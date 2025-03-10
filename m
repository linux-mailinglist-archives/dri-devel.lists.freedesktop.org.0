Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B50CA58D86
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 09:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D512D10E3AD;
	Mon, 10 Mar 2025 08:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F1QjjFBg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363D110E039
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 08:02:23 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso22232505e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 01:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741593741; x=1742198541; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i8vsoR0XtNwhNc8uqv+HeeAftIb3SZaHuCchGTf/qK4=;
 b=F1QjjFBg2j3ZKfgJ804pjSpNIIRDIFaH7j7Rn+qFlFVD3M/v2zIBDmpW2KZZpOCWby
 7wDJ3oa+HXc5bY7LbaiaV+xHypP25WIKBuRkaz5ONGpwogOkoX62RuBQ7lKG3iS6BMIF
 8UwZNeGYj73dokCbLLcdZnCVwn4XVanVa+LqBWbXY5dcG3aMzEXy8eahYQT/6Yol3+qL
 JDiEGBzEHSwR0Al/OM30NgwCppR6St1ynMxi/Xp1xaBl5sEoKDAh4FF4leRpLDP3LVZf
 dXjr2OpJSSSDjHkY16YUCvl03nISi7xWGwPkzhBZ2e9U8vnPwkUJwpxFnB+6+2+70mxw
 V8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741593741; x=1742198541;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i8vsoR0XtNwhNc8uqv+HeeAftIb3SZaHuCchGTf/qK4=;
 b=crW06/XFS3gW3EV9srGf8J+JynmNLXvxVr4Aw82p+06fViQSe6KwbP/XfKuJAH5zgZ
 BrwNI/i3Shbsm4KJKCBPXe5w3XDwq5u+GFaIuytxC/QA3LxvubpkP/ZH0ruu5dRkS+RV
 SHQ1h+2ZJIJLvadQBhsfy6/iU1z879Oh8VwXvRajlr3XEjiXXxZl/FGlmfo445Py/WtE
 mg7eEa5wZju7HnXutgrCJFYRu6YaDHFsKnB5g3APmwhhjsfrx8coMG2+mSpfufmpD4MB
 PfUb4TIEwM/rtbHai5LSAixCwTGbdfKBFiJhGyQIYft6EItKYvMVM0Pj+i23lweS0LVr
 6TBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9j2jXPFXqoFVwNjdH2ULIwMRM0Y+v9smQ6MB+XzSiY6kC+2A0w/KiwxdBVdyMpe6epq6I+PXwxI4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtCOnh/HXKlbk0A9I/1haq9XW2PUV5eNRb71k+vRvehSWZ4Twq
 2BMWYqKg9jdXtaQtTdU/q09CMBV6DG3umaygZFi39RjmZSeT8LueIjnis+y4He8=
X-Gm-Gg: ASbGncv4W8klXADVHGJJNI//8oBjMDoSa7HXaovFKhy0O6fbBMR7LrZ8XQUBP+KB73T
 B3THIvx8RLcoVJZZxNDt8fiMkD/gEVRaIT8JsfXkojRB5/rdmE/JmhQg/Cllo21lK4riNyiOLne
 SJjoOfyMVPU+VHwOfyCWw24k8sUsTPclUTsoq2MxRzzPULBat968pBD56sbOEo+sVPY0lQKpwk3
 vg3qr8Iaxi1Rxd8kNie0eoO9aHMAOGpJ9L8lG3zgslrusRNgygAbB54mMO/hsLuyvyrIKpB3iOm
 HSup4SUiD7XVVrXqrp/qMznqY5HguHFqJniSP1hIde5o/m6Rxw==
X-Google-Smtp-Source: AGHT+IEmOTKGzx90VNTsmr7R1QpkX49RScln2y40rBh0JpkUW/vdZodH2LPxETHoGOKthxkf0ChEcg==
X-Received: by 2002:a7b:c4d4:0:b0:43c:f513:9591 with SMTP id
 5b1f17b1804b1-43cf5139abdmr22749185e9.14.1741593741591; 
 Mon, 10 Mar 2025 01:02:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43cf7c8249bsm28163885e9.7.2025.03.10.01.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 01:02:20 -0700 (PDT)
Date: Mon, 10 Mar 2025 11:02:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 6/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
Message-ID: <8c122809-5aa9-4531-8967-66e03e5023b2@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307224125.111430-7-jonathan.cavitt@intel.com>
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

Hi Jonathan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-xe-xe_gt_pagefault-Disallow-writes-to-read-only-VMAs/20250308-064247
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250307224125.111430-7-jonathan.cavitt%40intel.com
patch subject: [PATCH v6 6/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
config: i386-randconfig-141-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091053.Hg9hUB8c-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503091053.Hg9hUB8c-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:3557 fill_faults() warn: iterator 'i' not incremented

vim +/i +3557 drivers/gpu/drm/xe/xe_vm.c

24e54814071dd04 Jonathan Cavitt 2025-03-07  3552  static int fill_faults(struct xe_vm *vm,
24e54814071dd04 Jonathan Cavitt 2025-03-07  3553  		       struct drm_xe_vm_get_faults *args)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3554  {
24e54814071dd04 Jonathan Cavitt 2025-03-07  3555  	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->faults);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3556  	struct xe_vm_pf_entry *entry;
24e54814071dd04 Jonathan Cavitt 2025-03-07 @3557  	int ret = 0, i = 0;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3558  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3559  	spin_lock(&vm->pfs.lock);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3560  	list_for_each_entry(entry, &vm->pfs.list, list) {
24e54814071dd04 Jonathan Cavitt 2025-03-07  3561  		struct xe_pagefault *pf = entry->pf;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3562  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3563  		ret = put_user(pf->page_addr, &usr_ptr->address);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3564  		if (ret)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3565  			break;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3566  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3567  		ret = put_user(pf->address_type, &usr_ptr->address_type);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3568  		if (ret)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3569  			break;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3570  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3571  		ret = put_user(1, &usr_ptr->address_precision);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3572  		if (ret)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3573  			break;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3574  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3575  		usr_ptr++;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3576  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3577  		if (i == args->fault_count)

if (++i >= args->fault_count) ?

24e54814071dd04 Jonathan Cavitt 2025-03-07  3578  			break;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3579  	}
24e54814071dd04 Jonathan Cavitt 2025-03-07  3580  	spin_unlock(&vm->pfs.lock);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3581  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3582  	return ret ? -EFAULT : 0;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3583  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

