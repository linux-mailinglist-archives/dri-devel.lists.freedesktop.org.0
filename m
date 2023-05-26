Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB337711ED4
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 06:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9BC10E15E;
	Fri, 26 May 2023 04:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F3410E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 04:20:58 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f6dbe3c230so3153945e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 21:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685074857; x=1687666857;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XAOvjr2TqG8F05SdJJ348QTYeQEUwpBjqIHCSAk11gM=;
 b=X+MyXx7x4MbuD0ZwWAijwBJqgCKZalO2vOyWgq77dbQIpuYReVJFpbZ994z0HntHWk
 kIjEgSk7cUAUU3XEq21YJSjkwWUFPWw78aEUUUumn+LIhhstICJ7VrDEK/KhbDfeDg9i
 cpJFPq29rGqLU/OnXBT7ouh/WJFp3KLPfheKQ9khl9WYE46rdSH80Byo3U6yBnojZJmj
 s9mMmHyveRAuJo6unYusovJyCqwY+kvTawosVjfxXZwoAWrVGLEFJR3vwkLuS3bZUx3P
 NyhnVxmZSFeVvrVKkMKSor7D53pDZ/963R4NCGKkVsCO66k0fCdYprSaQxYtJa6QjVy2
 09bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685074857; x=1687666857;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XAOvjr2TqG8F05SdJJ348QTYeQEUwpBjqIHCSAk11gM=;
 b=HuTNfN3AdIBnIKoo/YlRvTxMH2YPvcT6DwbhlVg1noG0S8RoyqmCfoz6RSqThmProU
 N4GCaqWZLE2n3lLdkM8e34W71PgNud7DlgvpaJQP/wa0WjvT4oFsdpv0039RTj32J1fg
 40NEX/Yx5ge5JcvRqT06pPjz2Wlbn7AnuTJArCUjUL6jUbwDBcM5I1QDpXo0BkJJVCJp
 y2eAdpfLGS6HOfEqxWx/g3WCXWwJOIGdaafyXW++vh5ek3zDujRjYGK7ZyhQqQEfpc39
 I0pwcT/rgow2KO9rDCMSPw6sv8H5s1nFRMto49Iu6djOkWKlkNabJMaHQ44ebxFABnIU
 fb9g==
X-Gm-Message-State: AC+VfDzXaYNpa1pRbg0PIwDpd0gipM8VoBNVA6ZNvrq+SVqn3B8fWhYY
 ADgX8SNfweYtlHMLgOna3tjG3Q==
X-Google-Smtp-Source: ACHHUZ6WZk8sxr9zaX9zkLPv4NIjrv2jg8S78VrInmLBdP29HH4UcxCniB9LqeAoodaZfnuF8RiSQg==
X-Received: by 2002:a5d:4402:0:b0:306:2671:7cad with SMTP id
 z2-20020a5d4402000000b0030626717cadmr293085wrq.55.1685074856907; 
 Thu, 25 May 2023 21:20:56 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d6843000000b003095a329e90sm3634348wrw.97.2023.05.25.21.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 21:20:55 -0700 (PDT)
Date: Fri, 26 May 2023 07:20:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rob Clark <robdclark@chromium.org>
Subject: [drm-misc:for-linux-next 5/10] drivers/gpu/drm/drm_file.c:967
 drm_show_memory_stats() error: uninitialized symbol 'supported_status'.
Message-ID: <0634e3a7-c2b8-4f3b-a758-80471e18b8c8@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, lkp@intel.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   dd9e329af7236e34c566d3705ea32a63069b9b13
commit: 686b21b5f6ca2f8a716f9a4ade07246dbfb2713e [5/10] drm: Add fdinfo memory stats
config: x86_64-randconfig-m001-20230524
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305260440.7dv6FZHq-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_file.c:967 drm_show_memory_stats() error: uninitialized symbol 'supported_status'.

vim +/supported_status +967 drivers/gpu/drm/drm_file.c

686b21b5f6ca2f Rob Clark 2023-05-24  923  void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
686b21b5f6ca2f Rob Clark 2023-05-24  924  {
686b21b5f6ca2f Rob Clark 2023-05-24  925  	struct drm_gem_object *obj;
686b21b5f6ca2f Rob Clark 2023-05-24  926  	struct drm_memory_stats status = {};
686b21b5f6ca2f Rob Clark 2023-05-24  927  	enum drm_gem_object_status supported_status;
686b21b5f6ca2f Rob Clark 2023-05-24  928  	int id;
686b21b5f6ca2f Rob Clark 2023-05-24  929  
686b21b5f6ca2f Rob Clark 2023-05-24  930  	spin_lock(&file->table_lock);
686b21b5f6ca2f Rob Clark 2023-05-24  931  	idr_for_each_entry (&file->object_idr, obj, id) {
686b21b5f6ca2f Rob Clark 2023-05-24  932  		enum drm_gem_object_status s = 0;
686b21b5f6ca2f Rob Clark 2023-05-24  933  
686b21b5f6ca2f Rob Clark 2023-05-24  934  		if (obj->funcs && obj->funcs->status) {
686b21b5f6ca2f Rob Clark 2023-05-24  935  			s = obj->funcs->status(obj);
686b21b5f6ca2f Rob Clark 2023-05-24  936  			supported_status = DRM_GEM_OBJECT_RESIDENT |
686b21b5f6ca2f Rob Clark 2023-05-24  937  					DRM_GEM_OBJECT_PURGEABLE;

Smatch is concerned that we might not hit this assignment.  That seems
reasonable, because otherwise why not hard code it at the start?

686b21b5f6ca2f Rob Clark 2023-05-24  938  		}
686b21b5f6ca2f Rob Clark 2023-05-24  939  
686b21b5f6ca2f Rob Clark 2023-05-24  940  		if (obj->handle_count > 1) {
686b21b5f6ca2f Rob Clark 2023-05-24  941  			status.shared += obj->size;
686b21b5f6ca2f Rob Clark 2023-05-24  942  		} else {
686b21b5f6ca2f Rob Clark 2023-05-24  943  			status.private += obj->size;
686b21b5f6ca2f Rob Clark 2023-05-24  944  		}
686b21b5f6ca2f Rob Clark 2023-05-24  945  
686b21b5f6ca2f Rob Clark 2023-05-24  946  		if (s & DRM_GEM_OBJECT_RESIDENT) {
686b21b5f6ca2f Rob Clark 2023-05-24  947  			status.resident += obj->size;
686b21b5f6ca2f Rob Clark 2023-05-24  948  		} else {
686b21b5f6ca2f Rob Clark 2023-05-24  949  			/* If already purged or not yet backed by pages, don't
686b21b5f6ca2f Rob Clark 2023-05-24  950  			 * count it as purgeable:
686b21b5f6ca2f Rob Clark 2023-05-24  951  			 */
686b21b5f6ca2f Rob Clark 2023-05-24  952  			s &= ~DRM_GEM_OBJECT_PURGEABLE;
686b21b5f6ca2f Rob Clark 2023-05-24  953  		}
686b21b5f6ca2f Rob Clark 2023-05-24  954  
686b21b5f6ca2f Rob Clark 2023-05-24  955  		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
686b21b5f6ca2f Rob Clark 2023-05-24  956  			status.active += obj->size;
686b21b5f6ca2f Rob Clark 2023-05-24  957  
686b21b5f6ca2f Rob Clark 2023-05-24  958  			/* If still active, don't count as purgeable: */
686b21b5f6ca2f Rob Clark 2023-05-24  959  			s &= ~DRM_GEM_OBJECT_PURGEABLE;
686b21b5f6ca2f Rob Clark 2023-05-24  960  		}
686b21b5f6ca2f Rob Clark 2023-05-24  961  
686b21b5f6ca2f Rob Clark 2023-05-24  962  		if (s & DRM_GEM_OBJECT_PURGEABLE)
686b21b5f6ca2f Rob Clark 2023-05-24  963  			status.purgeable += obj->size;
686b21b5f6ca2f Rob Clark 2023-05-24  964  	}
686b21b5f6ca2f Rob Clark 2023-05-24  965  	spin_unlock(&file->table_lock);
686b21b5f6ca2f Rob Clark 2023-05-24  966  
686b21b5f6ca2f Rob Clark 2023-05-24 @967  	drm_print_memory_stats(p, &status, supported_status, "memory");
686b21b5f6ca2f Rob Clark 2023-05-24  968  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

