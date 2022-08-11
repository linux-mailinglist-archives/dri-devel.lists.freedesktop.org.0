Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAD4590C73
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C00EA908D;
	Fri, 12 Aug 2022 07:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FF698C7E;
 Thu, 11 Aug 2022 15:30:48 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l4so21711967wrm.13;
 Thu, 11 Aug 2022 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=kbnOtrca+UKfTcKDYWH7RmzECZ4SW71xODW6/SpBFkQ=;
 b=ci+1jI/62tsyH/V1EY4ekoU++rhLYFviuU48qLgL8zl+T0l7ANtJqm2gXRiBqLa+ox
 qpWrBPuThrAOddUuiGN+Rl3hb4kmTH3XPRCVJlJ0+k5F4Mhaxe4swzOhfM8YFT0cNXq8
 LE/C074FR6731ZHOM7/u6OKvlMiGhMsulTGavvdqj9WQbjEbQo0jjI+mqsaAOvrNF0TJ
 GsFouHGa7OieG4d4u6E96D0rfM0b6lCbIjWtDAxgXdi4ApzaWNEOrR4wUzZ/7lMO1gPQ
 qmLZWsRWfqQjVeRd+vTxwIF36ZSbuE9cYssKv9B5kftZ3uLzpPIQehS1Zqnz3gijZuE8
 wnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=kbnOtrca+UKfTcKDYWH7RmzECZ4SW71xODW6/SpBFkQ=;
 b=zZkOZB9k+FIkXbA6FU3yYfKJifhbZLPa4CZQiiJEJblAaXVm7VDKq2AcsDH1EAssEW
 npuZJHRLXYFiF85lX0eUUpOeb7kIn7DC6Dj4IFeBDgI3/zrOmV1S7tT6HlQvWqXP456K
 wM430du7bQV0hLrJaj7gMz/1C5nzFM5Yr4e5UVqcqdKx4veS60mvqr3IjkpCL5JPHzsI
 4mCzx/dL1NU580MvTRfndNqaSRfCL/1DFyyp+flHBP0KbsjM94FM4HJaXCE40QtS45kM
 t40IErDVEkQ9w4eOuAuLNXajmi9P4W78Wa8Lor1BDxtHPWpp13vn1ndq/sFyZgDk2XKJ
 ceYw==
X-Gm-Message-State: ACgBeo2EO8u53pMQwZx1oRiaPpL8OU+db/CTxhqF6Rl5LSVS2GHQHMFr
 +ubvcqyxoaLq+8FNq0zxq7D61X570joWCQ==
X-Google-Smtp-Source: AA6agR4cNBxlswbb37h1EmIOwy/5UEzDGylekvDiyaLDKDyZyyioSmf9PY0tAVvRvBnO5/uiENTDcQ==
X-Received: by 2002:a5d:6687:0:b0:21e:d501:1b03 with SMTP id
 l7-20020a5d6687000000b0021ed5011b03mr20097422wru.387.1660231847121; 
 Thu, 11 Aug 2022 08:30:47 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-27-108-198.retail.telecomitalia.it. [79.27.108.198])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a056000008700b00222ed7ea203sm9805502wrx.100.2022.08.11.08.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:30:45 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/i915: Replace kmap() with kmap_local_page()
Date: Thu, 11 Aug 2022 17:30:38 +0200
Message-Id: <20220811153041.12795-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Aug 2022 07:21:22 +0000
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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

