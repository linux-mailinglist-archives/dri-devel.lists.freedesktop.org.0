Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F82759844C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 15:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5317F912C2;
	Thu, 18 Aug 2022 13:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E98B994B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 13:39:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1539161668;
 Thu, 18 Aug 2022 13:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AFDC433C1;
 Thu, 18 Aug 2022 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660829947;
 bh=j+GR3xNPkOEEZIReKsoLX51DZZCpOm55zjpW98JIWhQ=;
 h=From:To:Cc:Subject:Date:From;
 b=VDVU+urmE+ZEW42chc83KfdXmTEeVbpDiMmU4yB93fu+QIRGvFQfARyMVv3qM2fky
 UvGXmZB19CSQTd4YnWzzIYLRLq7kTaZLQTZcEgrjVK1jcXpxPGMbyr0j/aEMALUHmC
 8uZCuSH40n2NrqlRv8rJEuoTb7vUQnX28htCLpfE/6cxZPPobhpbl7rj3Vc/DbyQpB
 NxEdu5nr9wRACHQBh1eCme//Ovk84dqqiYsiVMqOvEpnm0ZIOXUR+B6U7CjUudGIa9
 c5Pf5QbVK59YJkgLO6FkEYBPCDH2kyTwxxxucabhBYm3UHKWtEdtHLM3PbqYCIn8it
 nDhsz5L2kppAQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oOfjl-00AY7B-0o;
 Thu, 18 Aug 2022 15:39:05 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	corbet@lwn.net
Subject: [PATCH 00/13] Fix documentation build warnings against 6.0-rc1
Date: Thu, 18 Aug 2022 15:38:46 +0200
Message-Id: <cover.1660829433.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.1
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
Cc: Kosuke Fujimoto <fujimotokosuke0@gmail.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Akira Yokosawa <akiyks@gmail.com>, dri-devel@lists.freedesktop.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Bagas Sanjaya <bagasdotme@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 Alex Shi <alexs@kernel.org>, Xiubo Li <xiubli@redhat.com>,
 Luis Chamberlain <mcgrof@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-cachefs@redhat.com, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Ilya Dryomov <idryomov@gmail.com>, Mike Leach <mike.leach@linaro.org>,
 Madhavan Srinivasan <maddy@in.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Kajol Jain <kjain@linux.ibm.com>,
 coresight@lists.linaro.org, Wu XiangCheng <bobwxc@email.cn>,
 Tsugikazu Shibata <shibata@linuxfoundation.org>,
 Yanteng Si <siyanteng@loongson.cn>, Muchun Song <songmuchun@bytedance.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Jiri Kosina <jkosina@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jon,

This series is against 6.0-rc1, so it should apply fine on the top of your tree.

After applying one fix sent to ACPI:

https://lore.kernel.org/linux-acpi/20220818055156.7456-1-sakari.ailus@linux.intel.com/T/#u

make htmldocs (with Sphinx 2.4.4) produces a very clean result:
:

	Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703
-regulator.yaml references a file that doesn't exist: Documentation/devicetree/b
indings/mfd/siliconmitus,sm5703.yaml
	  SPHINX  htmldocs --> file:///new_devel/v4l/docs/Documentation/output
	  PARSE   include/uapi/linux/dvb/ca.h
	  PARSE   include/uapi/linux/dvb/dmx.h
	  PARSE   include/uapi/linux/dvb/frontend.h
	  PARSE   include/uapi/linux/dvb/net.h
	  PARSE   include/uapi/linux/videodev2.h
	  PARSE   include/uapi/linux/media.h
	  PARSE   include/uapi/linux/cec.h
	  PARSE   include/uapi/linux/lirc.h
	Using sphinx_rtd_theme theme

The only warning is due to a driver that got its upstream way for MFD, but it seems that
the corresponding regulator driver has lost its way.

If we can fix such warning, we could add a sort of "Werror" for:

	- some ABI issues;
	- kernel-doc warnings/errors;
	- broken kernel-doc warnings.

Although there will still have Sphinx warnings that can come up from various sources,
this could help to keep documentation on a better shape, as time goes by.

Regards,
Mauro


Mauro Carvalho Chehab (13):
  scripts: kernel-doc: add support for EXPORT_SYMBOL variants
  docs: update vmemmap_dedup.rst reference
  docs: ja_JP: remove SubmittingPatches
  docs: zh_CN: remove references to rust documentation
  dt-bindings: arm: update arm,coresight-cpu-debug.yaml reference
  Documentation: coresight: fix a documentation build warning
  MAINTAINERS: fix wildcard for mfd da90* files
  MAINTAINERS: fix a typo for hpe,gxp-spifi.yaml
  ABI: sysfs-bus-nvdimm: fix a doc build warning
  docs: leds: add leds-qcom-lpg.rst to the index file
  fscache: fix kernel-doc markup on two functions
  serial: document start_rx member at struct uart_ops
  fs/dcache: fix a kernel-doc markup

 Documentation/ABI/testing/sysfs-bus-nvdimm    |   2 +
 Documentation/leds/index.rst                  |   1 +
 .../trace/coresight/coresight-cpu-debug.rst   |   2 +-
 Documentation/trace/coresight/coresight.rst   |   2 +-
 .../translations/ja_JP/SubmittingPatches      | 722 ------------------
 .../zh_CN/doc-guide/kernel-doc.rst            |   2 -
 MAINTAINERS                                   |   4 +-
 drivers/gpu/drm/scheduler/sched_main.c        |   1 +
 include/drm/gpu_scheduler.h                   |   1 +
 include/linux/dcache.h                        |  10 +-
 include/linux/fscache.h                       |   4 +-
 include/linux/serial_core.h                   |   8 +
 mm/hugetlb_vmemmap.h                          |   2 +-
 scripts/kernel-doc                            |   8 +-
 14 files changed, 33 insertions(+), 736 deletions(-)
 delete mode 100644 Documentation/translations/ja_JP/SubmittingPatches

-- 
2.37.1


