Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B96B6002AF
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 20:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13F010E657;
	Sun, 16 Oct 2022 18:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8E010E0D0;
 Sun, 16 Oct 2022 18:09:47 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r13so15126247wrj.11;
 Sun, 16 Oct 2022 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lKX8sLbXqFEyfL/b3ZjUwDYXx8N7tsBaTEOHjLLDLgg=;
 b=T0ksjtS64SgZg+ynjnhdZrQdSg4bAyz710FjraW3gjDq2p8ORsc6wHFhCa/aePZurJ
 ytDBmb7rVC0T/RvAZclMcIDWL0AZp4gWSml78Zg26uo7JFkTQncC92Ks9Axb/Boshpkt
 l8PMYuyCVxq4vpOSf/Uj09dbbfLKN94En1stpAWCvNLSJ7zRKP2uge/793nvWvw3N2aP
 IuZPiWof0s6JKlg3QUW7yw0yYQt4Zi4/LW9sbZLXgnSFTyK2ohwpq6V9gFFPCRnm5dso
 J0JURalvtRI5PamaE1DttY2ToJ50QaJs0Lo+lN6QQtByYr/wpjf5b0uTP5U7mP+fFwxR
 h1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lKX8sLbXqFEyfL/b3ZjUwDYXx8N7tsBaTEOHjLLDLgg=;
 b=iQzb+Ct3zHy/REFjbWQHmOG+5i0gWxmyhYUcQd7Sc4TzOC84g6J5iuyyWb3JpDUobm
 1xIVH/7qNFwUx3ZgvhhxdytQpdWJ2Q6PBXgLcSF1Hp6Vq68/R+SQCZQ+TWzOymtLyJdO
 oZUV6r0tXQCgx8aXz5klUHwu2LeaOoqYwjVOsCvBHZ5FYWTXGfq7C1vAtZRvh/PKGAao
 PwY8YaiiDD2/RIe/91ZjMiP0D2l3Ya8kTlTuoXkRinOoRHCKRZ57srT1ovS0doWtKK6d
 +7VQgDDOJCdSXLcz/10EbcLjy0zApsg/q8rhHTGju3+gLlYmRHabST40toSecfMVirds
 eh+Q==
X-Gm-Message-State: ACrzQf274KTCneSPAKlvO7q96sU2Dgfb0sidzZ4prZxRnGwCaTrAWc1V
 iBuYnPrNIGdoA+nu21W8UZk=
X-Google-Smtp-Source: AMsMyM5OBZbpCpK+rtWXQ5hh89eacxaqxDOXFM4ZEp/IMVaftu5b7+IXgZMPp0kzBWoOY7N/Fo2ArQ==
X-Received: by 2002:adf:e2c8:0:b0:230:ba81:cf0c with SMTP id
 d8-20020adfe2c8000000b00230ba81cf0cmr4520684wrj.357.1665943785730; 
 Sun, 16 Oct 2022 11:09:45 -0700 (PDT)
Received: from localhost.localdomain
 (host-95-250-231-122.retail.telecomitalia.it. [95.250.231.122])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003c6f8d30e40sm156225wmn.31.2022.10.16.11.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 11:09:44 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org
Subject: [RESEND PATCH 0/3] drm/i915: Replace kmap() with kmap_local_page()
Date: Sun, 16 Oct 2022 20:09:35 +0200
Message-Id: <20221016180938.17403-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Ira Weiny <ira.weiny@intel.com>, "Venkataramanan,
 Anirudh" <anirudh.venkataramanan@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kmap() is being deprecated in favor of kmap_local_page().

There are two main problems with kmap(): (1) It comes with an overhead as
mapping space is restricted and protected by a global lock for
synchronization and (2) it also requires global TLB invalidation when the
kmap’s pool wraps and it might block when the mapping space is fully
utilized until a slot becomes available.

With kmap_local_page() the mappings are per thread, CPU local, can take
page faults, and can be called from any context (including interrupts).
It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore,
the tasks can be preempted and, when they are scheduled to run again, the
kernel virtual addresses are restored and still valid.

Since its use in drm/i915 is safe everywhere, it should be preferred.

Therefore, replace kmap() with kmap_local_page() in drm/i915.

These changes should be tested in an 32 bits system, booting a kernel
with HIGHMEM enabled. Unfortunately I have no i915 based hardware,
therefore any help with testing would be greatly appreciated.

I'm resending this little series because I suspect that it has been
lost, since it was submitted on Aug 11, 2022. In the meantime I'm
adding one more recipient (Anirudh) who is helping, along with others, Ira
and me with these conversions / removals of kmap() and kmap_atomic() 

Cc: "Venkataramanan, Anirudh" <anirudh.venkataramanan@intel.com>
Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Fabio M. De Francesco (3):
  drm/i915: Replace kmap() with kmap_local_page()
  drm/i915/gt: Replace kmap() with kmap_local_page()
  drm/i915/gem: Replace kmap() with kmap_local_page()

 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  6 ++----
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  8 ++++----
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |  4 ++--
 drivers/gpu/drm/i915/gt/shmem_utils.c              | 11 ++++-------
 drivers/gpu/drm/i915/i915_gem.c                    |  8 ++++----
 5 files changed, 16 insertions(+), 21 deletions(-)

-- 
2.37.1

