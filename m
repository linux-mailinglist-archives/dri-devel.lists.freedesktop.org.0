Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E8AECB2C
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 05:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5192A10E21D;
	Sun, 29 Jun 2025 03:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C8efq+qM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F9110E21D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 03:51:36 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-40a8013d961so1139461b6e.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 20:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751169096; x=1751773896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ein2cSz8c4RxoxLOXGqxta+H3Ne79xxNK5RWPVdPFqI=;
 b=C8efq+qMmGts/eiJ9NzcQZlMRIJbownSXkuf/ZNfqtP81+a/Mrhg/mz5zBmjnztBe6
 tHbAeWA9cr3BAKF3mEOBdrUedCgwdUNlDix9PVyyMxBaT9dXEssIRMepWud82Kfthc6d
 V/4+ggCkfCxlJ6akAaHwfjQvLvOY5gYCfjtoi5P5XaGLexBI6GLG2rjFzYEA6p5V7UIL
 czIp0lzg+FbyS16eZRf4AEcDb9Yn5kxRvVjMcGyis3d9Pe+2P2fcPOuuwpwTc43lcVmh
 eQ4t9nqQfR8Bas0rg+LQfq3KCaTIWUV4cMMURXfJ2/GhF6pnZGij7elCQ9qymdGvKuot
 k+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751169096; x=1751773896;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ein2cSz8c4RxoxLOXGqxta+H3Ne79xxNK5RWPVdPFqI=;
 b=Il5keSPJFMLXwboinflVDTs9EzK1+UCy3AqgpzEfw/x0r92H+sXqglMS8ADtHs3Om2
 sWKMfl7i00xcnLCy+16I3C48oUbFKE/4yOvaToJY716ZRe73LWGKvfhVmMRQuWbkuJjv
 7Th+3e7yYwR+PtzLjXxc9Hn+t1erhdkLdw/gOerNTWSRsH5H/o1roKmVOh+ZTlodAbTP
 hDlaJB6ghWkPKY8uuCJhWgQmRTcsMt5mFPVHP+Legmf/SkIClmQbdBCDHyspKd/76v7j
 7dbAcpsvHrgX/JysOlHyEVSGcq4jL/cgx/GtK/HOyRzbUD8jKg8w7VPvC9fr7jFM1wLb
 jIqg==
X-Gm-Message-State: AOJu0YwJ5CmK2Sn7gWo8uHF/X06EJ6rqFTkQST1EKj0fzOTsnGG5OkMK
 PZWx46HxwJjr67d8Qdn7k9Y/mIB9EAy2GLXIzGyLlwIln+CH+wxl1h/wBXRMlyHD2mA=
X-Gm-Gg: ASbGnctrDQTD2CUnvspRHBud2h5nklE0hxki8erdINdVeCj4OOz1NrSvqo8Zb+S2KTq
 GH11cR5Fm/47MjYQeob/sATNOlzWUICtMRg7un5cV4QCCW+Xp22cpPCI1QUoRicDH0096Vc/Ix9
 c8m+le9e9NU8niFLBK6N5dOpSPZU1jgMHrVm2n7l1SowksNmzQEfNvEESSoIo1NrMnVCAci7cEF
 Gd6Ql3mUtpkgP9Qqe6grbcFOyg7guuZZGCioHDJiGSQh0rQ6dENCM0WzzS352NSrcrc33k+Ab7O
 Hype8W2psUusxoiRMuYTSjFennmbv2N+7x9zpUviEmEXGh9KNH4kzDqb7iNdBdNRYt0=
X-Google-Smtp-Source: AGHT+IGqalbxrpdbvHx/jFHXiEqKEd+IA515NsGh/ReOntYLhKfdecAiMK9KOm6FcK8ABsl0f+yk8A==
X-Received: by 2002:a05:6871:3806:b0:2e9:1fae:4aef with SMTP id
 586e51a60fabf-2efed4b355fmr5319926fac.13.1751169095842; 
 Sat, 28 Jun 2025 20:51:35 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:54c5:571:691:5e5a])
 by smtp.gmail.com with UTF8SMTPSA id
 586e51a60fabf-2efd4ea6c7bsm1854717fac.3.2025.06.28.20.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 20:51:34 -0700 (PDT)
Date: Sat, 28 Jun 2025 22:51:31 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict()
 using the guarded LRU iteration
Message-ID: <cc9453cb-6f6e-4122-aa17-3fdf8af312e0@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hello Thomas Hellström,

Commit bb8aa27eff6f ("drm/ttm, drm_xe, Implement
ttm_lru_walk_for_evict() using the guarded LRU iteration") from Jun
23, 2025 (linux-next), leads to the following (unpublished) Smatch
static checker warning:

	drivers/gpu/drm/ttm/ttm_bo_util.c:991 __ttm_bo_lru_cursor_next()
	warn: duplicate check 'res' (previous on line 952)

drivers/gpu/drm/ttm/ttm_bo_util.c
   931  __ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
   932  {
   933          spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
   934          struct ttm_resource *res = NULL;
   935          struct ttm_buffer_object *bo;
   936          struct ttm_lru_walk_arg *arg = curs->arg;
   937          bool first = !curs->bo;
   938  
   939          ttm_bo_lru_cursor_cleanup_bo(curs);
   940  
   941          spin_lock(lru_lock);
   942          for (;;) {
   943                  int mem_type, ret = 0;
   944                  bool bo_locked = false;
   945  
   946                  if (first) {
   947                          res = ttm_resource_manager_first(&curs->res_curs);
   948                          first = false;
   949                  } else {
   950                          res = ttm_resource_manager_next(&curs->res_curs);
   951                  }
   952                  if (!res)
   953                          break;

This is the only break statement

   954  
   955                  bo = res->bo;
   956                  if (ttm_lru_walk_trylock(curs, bo))
   957                          bo_locked = true;
   958                  else if (!arg->ticket || arg->ctx->no_wait_gpu || arg->trylock_only)
   959                          continue;
   960  
   961                  if (!ttm_bo_get_unless_zero(bo)) {
   962                          if (curs->needs_unlock)
   963                                  dma_resv_unlock(bo->base.resv);
   964                          continue;
   965                  }
   966  
   967                  mem_type = res->mem_type;
   968                  spin_unlock(lru_lock);
   969                  if (!bo_locked)
   970                          ret = ttm_lru_walk_ticketlock(curs, bo);
   971  
   972                  /*
   973                   * Note that in between the release of the lru lock and the
   974                   * ticketlock, the bo may have switched resource,
   975                   * and also memory type, since the resource may have been
   976                   * freed and allocated again with a different memory type.
   977                   * In that case, just skip it.
   978                   */
   979                  curs->bo = bo;
   980                  if (!ret && bo->resource && bo->resource->mem_type == mem_type)
   981                          return bo;
   982  
   983                  ttm_bo_lru_cursor_cleanup_bo(curs);
   984                  if (ret && ret != -EALREADY)
   985                          return ERR_PTR(ret);
   986  
   987                  spin_lock(lru_lock);
   988          }
   989  
   990          spin_unlock(lru_lock);
   991          return res ? bo : NULL;

So we know res is NULL and we could just change this to "return NULL;"

   992  }

regards,
dan carpenter
