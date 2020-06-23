Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89763205378
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 15:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0502A6E41F;
	Tue, 23 Jun 2020 13:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6072F6E409
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 13:31:45 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD37020888;
 Tue, 23 Jun 2020 13:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592919105;
 bh=3gAIjtEQO4kLlNnBgzwJ90qj5Mg7ihEjEG9ySuz4bCU=;
 h=From:To:Cc:Subject:Date:From;
 b=Kqo/i+hFoZR9gvOMphIo5899TL/A/Yce62Hu6AzvSfg3/IUqs203SsVl7UF5LhhI4
 1N1c+oMvseK12yTsMSmhMP7+NHEXyYhpyBFribyNj1uNunfOognBNicTgHDj1xTwRK
 ZIjNLMIWjah12/AVcmwNPg/Za0Fz3Jh4fd+Q5caA=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
 (envelope-from <mchehab@kernel.org>)
 id 1jnj1Z-007VJW-7s; Tue, 23 Jun 2020 15:31:41 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v3 0/7] Convert the remaining text files to ReST
Date: Tue, 23 Jun 2020 15:31:33 +0200
Message-Id: <cover.1592918949.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stephen Kitt <steve@sk2.org>, David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Pragat Pandya <pragat.pandya@gmail.com>, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Harry Wei <harryxiyou@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Alex Shi <alex.shi@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>,
 Harald Seiler <hws@denx.de>,
 =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Rob Herring <robh+dt@kernel.org>, Nitin Gupta <nigupta@nvidia.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@linux.ibm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-mm@kvack.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Patrick Bellasi <patrick.bellasi@arm.com>, Phong Tran <tranmanphong@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Leach <mike.leach@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The main goal of this series is to finish the ReST conversion. After this
series, we have just those files still in plain old format:

	- Documentation/RCU/RTFP.txt
	- Documentation/atomic_bitops.txt
	- Documentation/memory-barriers.txt
	- Documentation/atomic_t.txt
	- Documentation/filesystems/dax.txt
	- Documentation/filesystems/path-lookup.txt
	- Documentation/virt/kvm/devices/README

PS.: I'm using a script to remove false-positives and ignore non-converted
translated files.

---

- v3:  removed SPDX patches, because upstream discussion about GFDL is not
  finished yet. So, for now, use the old way to specify dual-licensed GPL and GFDL
  files.

  I have already a tree ready for submission once upstream pushes this feat
  on SPDX specs.

Mauro Carvalho Chehab (7):
  docs: dt: convert booting-without-of.txt to ReST format
  docs: trace: ring-buffer-design.txt: convert to ReST format
  docs: move nommu-mmap.txt to admin-guide and rename to ReST
  docs: move mailbox.txt to driver-api and rename it
  docs: move other kAPI documents to core-api
  docs: Add remaining Documentation/*.txt at staging/index.rst
  docs: staging: use small font for literal includes

 Documentation/admin-guide/mm/index.rst        |   1 +
 .../mm/nommu-mmap.rst}                        |   0
 Documentation/admin-guide/sysctl/vm.rst       |   2 +-
 Documentation/arm/booting.rst                 |   2 +-
 .../bus-virt-phys-mapping.rst}                |   0
 Documentation/core-api/index.rst              |   3 +
 .../this_cpu_ops.rst}                         |   0
 .../unaligned-memory-access.rst               |   0
 ...-without-of.txt => booting-without-of.rst} | 298 ++++---
 Documentation/devicetree/index.rst            |   1 +
 Documentation/driver-api/index.rst            |   1 +
 .../{mailbox.txt => driver-api/mailbox.rst}   |   0
 Documentation/gpu/drm-mm.rst                  |   2 +-
 Documentation/staging/index.rst               |  24 +
 Documentation/trace/index.rst                 |   1 +
 ...ffer-design.txt => ring-buffer-design.rst} | 802 ++++++++++--------
 Documentation/translations/zh_CN/arm/Booting  |   2 +-
 arch/Kconfig                                  |   2 +-
 init/Kconfig                                  |   2 +-
 mm/Kconfig                                    |   2 +-
 mm/nommu.c                                    |   2 +-
 21 files changed, 631 insertions(+), 516 deletions(-)
 rename Documentation/{nommu-mmap.txt => admin-guide/mm/nommu-mmap.rst} (100%)
 rename Documentation/{bus-virt-phys-mapping.txt => core-api/bus-virt-phys-mapping.rst} (100%)
 rename Documentation/{this_cpu_ops.txt => core-api/this_cpu_ops.rst} (100%)
 rename Documentation/{process => core-api}/unaligned-memory-access.rst (100%)
 rename Documentation/devicetree/{booting-without-of.txt => booting-without-of.rst} (90%)
 rename Documentation/{mailbox.txt => driver-api/mailbox.rst} (100%)
 rename Documentation/trace/{ring-buffer-design.txt => ring-buffer-design.rst} (55%)

-- 
2.26.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
