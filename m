Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A762D56C8B4
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 12:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9457C10E071;
	Sat,  9 Jul 2022 10:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B0188F0D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 10:07:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16FDC60EFD;
 Sat,  9 Jul 2022 10:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EAE2C341C7;
 Sat,  9 Jul 2022 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657361259;
 bh=KJtmXylkYfBUCP9nKw3ANSOdLovVVTpFPXktiDmYhX8=;
 h=From:To:Cc:Subject:Date:From;
 b=LnWbmh+eLrmzEUuOUtwt1Zk7RPhAHxviv/xN1zz17DDCm7ZZ2jcjIeAUW4KTxMXed
 KM6hlnyvwgcE/ucoKBLNi3lTI0HLQorkZBQKDriJ83QapG5TazYrBSO0s5jpBgI518
 zjHSfekRlLlgNoH4pC8Bvx7SWcUhuyyANeCxHX9hJfkXhijte2QxQFmBhEqOt4NAki
 WRxJiBGp9FbjYtPunI+ANm5ybjHbUrO7XEI2HfTHJrTDCbiOpxKJM0muKF/npo2L8i
 8btVRvA0c3zQa7eBwzLXG2Hotce3pbtGp96wKaC+VQwn/aYfgAwZb7CnJrfDBP08B6
 LAxmYYMrturXw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oA7N9-004EGQ-BD;
 Sat, 09 Jul 2022 11:07:35 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v3 00/21] Update Documentation/ cross references and fix issues
Date: Sat,  9 Jul 2022 11:07:13 +0100
Message-Id: <cover.1657360984.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-cachefs@redhat.com, kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, Alexander Potapenko <glider@google.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 kasan-dev@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Wolfgang Grandegger <wg@grandegger.com>,
 Mike Leach <mike.leach@linaro.org>, Marco Elver <elver@google.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 linux-can@vger.kernel.org, Max Staudt <max@enpas.org>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Muchun Song <songmuchun@bytedance.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 linux-sgx@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Leo Yan <leo.yan@linaro.org>, linux-fsdevel@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fix almost all fixable issues when building the html docs at
linux-next (next-20220608):

- Address some broken cross-references;
- Fix kernel-doc warnings;
- Fix bad tags on ReST files.

With this series applied, plus other pending patches that should hopefully
be merged in time for the next merge window, htmldocs build will produce
just 4 warnings with Sphinx 2.4.4.

Sphinx >=3 will produce some extra false-positive warnings due to conflicts
between structs and functions sharing the same name. Hopefully this will
be fixed either on a new Sphinx 5.x version or Sphinx 6.0.

Mauro Carvalho Chehab (21):
  docs: networking: update netdevices.rst reference
  docs: update vmalloced-kernel-stacks.rst reference
  docs: update vmemmap_dedup.rst reference
  docs: zh_CN: page_migration: fix reference to mm index.rst
  dt-bindings: arm: update arm,coresight-cpu-debug.yaml reference
  x86/sgx: fix kernel-doc markups
  fscache: fix kernel-doc documentation
  fs: namei: address some kernel-doc issues
  drm/scheduler: fix a kernel-doc warning
  drm/scheduler: add a missing kernel-doc parameter
  kfence: fix a kernel-doc parameter
  genalloc: add a description for start_addr parameter
  textsearch: document list inside struct ts_ops
  dcache: fix a kernel-doc warning
  docs: ext4: blockmap.rst: fix a broken table
  docs: PCI: pci-vntb-function.rst: Properly include ascii artwork
  docs: PCI: pci-vntb-howto.rst: fix a title markup
  docs: virt: kvm: fix a title markup at api.rst
  docs: ABI: sysfs-bus-nvdimm
  docs: leds: index.rst: add leds-qcom-lpg to it
  Documentation: coresight: fix binding wildcards

 Documentation/ABI/testing/sysfs-bus-nvdimm             |  2 ++
 Documentation/PCI/endpoint/pci-vntb-function.rst       |  2 +-
 Documentation/PCI/endpoint/pci-vntb-howto.rst          |  2 +-
 Documentation/filesystems/ext4/blockmap.rst            |  2 +-
 Documentation/leds/index.rst                           |  1 +
 Documentation/trace/coresight/coresight-cpu-debug.rst  |  2 +-
 Documentation/trace/coresight/coresight.rst            |  2 +-
 Documentation/translations/zh_CN/mm/page_migration.rst |  2 +-
 .../translations/zh_CN/mm/vmalloced-kernel-stacks.rst  |  2 +-
 Documentation/virt/kvm/api.rst                         |  6 +++---
 arch/x86/include/uapi/asm/sgx.h                        | 10 ++++++++--
 drivers/gpu/drm/scheduler/sched_main.c                 |  1 +
 drivers/net/can/can327.c                               |  2 +-
 fs/namei.c                                             |  3 +++
 include/drm/gpu_scheduler.h                            |  1 +
 include/linux/dcache.h                                 |  2 +-
 include/linux/fscache.h                                |  4 ++--
 include/linux/genalloc.h                               |  1 +
 include/linux/kfence.h                                 |  1 +
 include/linux/textsearch.h                             |  1 +
 mm/hugetlb_vmemmap.h                                   |  2 +-
 21 files changed, 34 insertions(+), 17 deletions(-)

-- 
2.36.1


