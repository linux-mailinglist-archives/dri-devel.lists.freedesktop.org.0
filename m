Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F011C2414
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497156EDB3;
	Sat,  2 May 2020 08:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29F76ECD3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 15:38:05 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47ADD24972;
 Fri,  1 May 2020 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588347483;
 bh=UmrP/hoKXS1X0eTMC7eo7TOZzxfnIVaKR9qol1Dq/Bc=;
 h=From:To:Cc:Subject:Date:From;
 b=KA+ZZ5vaGp4af7L1FIvczyp64NtuVk/7PJp0nGQoLbtxSvVYCH9dGlcV8erL/XrwN
 g2bVEWnVohJbxmhaJBM4zY/lz9bfpdnSGeRulrEYr4qofsrwAyib0Sj8w6JhkKD9/y
 jRAO4uKWmKWhR+/3X+J47Le6iXTeDi/zgpDX0sjA=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
 (envelope-from <mchehab@kernel.org>)
 id 1jUXjk-00FE4N-Ss; Fri, 01 May 2020 17:38:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 00/14] Move the ReST files from Documentation/*.txt
Date: Fri,  1 May 2020 17:37:44 +0200
Message-Id: <cover.1588345503.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Alan Stern <stern@rowland.harvard.edu>, Allison Randal <allison@lohutok.net>,
 openipmi-developer@lists.sourceforge.net, Harald Seiler <hws@denx.de>,
 Guenter Roeck <linux@roeck-us.net>, Ohad Ben-Cohen <ohad@wizery.com>,
 Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Tom Vaden <tom.vaden@hpe.com>,
 Marcos Paulo de Souza <marcos.souza.org@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-ia64@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Harry Wei <harryxiyou@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexandre Ghiti <alex@ghiti.fr>, Helge Deller <deller@gmx.de>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Andrea Parri <parri.andrea@gmail.com>, Juergen Gross <jgross@suse.com>,
 Corey Minyard <minyard@acm.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Tony Luck <tony.luck@intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Patrick Bellasi <patrick.bellasi@arm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-pci@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 Peter Xu <peterx@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Alex Shi <alex.shi@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Darren Hart <dvhart@infradead.org>, Jade Alglave <j.alglave@ucl.ac.uk>,
 Fenghua Yu <fenghua.yu@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-remoteproc@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 SeongJae Park <sj38.park@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Luc Maranget <luc.maranget@inria.fr>, Dan Williams <dan.j.williams@intel.com>,
 Peter Collingbourne <pcc@google.com>, linux-parisc@vger.kernel.org,
 Sameer Rahmani <lxsameer@gnu.org>, iommu@lists.linux-foundation.org,
 Baolin Wang <baolin.wang7@gmail.com>, Logan Gunthorpe <logang@deltatee.com>,
 "David S. Miller" <davem@davemloft.net>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Pragat Pandya <pragat.pandya@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Daniel Lustig <dlustig@nvidia.com>, Simon Horman <horms+renesas@verge.net.au>,
 Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, tee-dev@lists.linaro.org,
 Changbin Du <changbin.du@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The main goal of this series is to cleanup the Documentation/
directory.

Most of the files under Documentation/*.txt are already in ReST format.
They just need to be moved to some place. So, most of the work here is
to just move files for them to generate an output using the docs building
system.

After this change, the  Documentation/ dir will contain:

- the main ReST file:
	- index.rst

- TUX and its copyright:
	- logo.gif and COPYING-logo

- Files required to do ReST builds:
	- .gitignore, Makefile,  conf.py,  docutils.conf,  Kconfig

- A pre-git file used to generate patches:
	- dontdiff
  (I guess we should get rid of it, as I doubt this is useful those days).

-

Besides the above rightful files, the Documentation/ dir will also
contain some left-overs:

- two somewhat new ReST files that should be moved to somewhere:
	- asm-annotations.rst and watch_queue.rst

- Two files that helps people looking for some well known documents
  that are referenced at the web, pointing to their new location inside
  the process/ dir:
	- SubmittingPatches and CodingStyle

- Three .txt files that weren't converted to ReST:
	- atomic_bitops.txt, memory-barriers.txt, atomic_t.txt

It should be noticed that I'm in doubt about the location of some files,
and some stuff may well belong to a trash can. So, this series create
a temporary place for orphaned documents in the form of a
Documentation/staging directory.

This series is also on my development git tree, at:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=rename-main-docs

The built output documentation on html format is at:

	https://www.infradead.org/~mchehab/kernel_docs/

(it contains also other documents I converted to ReST)


Mauro Carvalho Chehab (14):
  docs: move DMA kAPI to Documentation/core-api
  docs: add bus-virt-phys-mapping.txt to core-api
  docs: fix references for DMA*.txt files
  docs: move IPMI.txt to the driver API book
  docs: fix references for ipmi.rst file
  docs: debugging-via-ohci1394.txt: add it to the core-api book
  docs: add IRQ documentation at the core-api book
  docs: move kobject and kref docs into the core-api book
  docs: move digsig docs to the security book
  docs: move locking-specific documenta to locking/ directory
  docs: move other kAPI documents to core-api
  docs: move remaining stuff under Documentation/*.txt to
    Documentation/staging
  docs: staging: don't use literalinclude
  docs: staging: use small font for literal includes

 Documentation/PCI/pci.rst                     |  6 +-
 Documentation/admin-guide/hw-vuln/l1tf.rst    |  2 +-
 .../admin-guide/kernel-parameters.txt         |  2 +-
 .../admin-guide/kernel-per-CPU-kthreads.rst   |  2 +-
 Documentation/admin-guide/sysctl/vm.rst       |  2 +-
 Documentation/block/biodoc.rst                |  2 +-
 .../bus-virt-phys-mapping.rst}                |  2 +-
 .../debugging-via-ohci1394.rst}               |  0
 .../dma-api-howto.rst}                        |  0
 .../{DMA-API.txt => core-api/dma-api.rst}     |  6 +-
 .../dma-attributes.rst}                       |  0
 .../dma-isa-lpc.rst}                          |  2 +-
 Documentation/core-api/index.rst              | 14 +++++
 .../{IRQ.txt => core-api/irq/concepts.rst}    |  0
 Documentation/core-api/irq/index.rst          | 11 ++++
 .../irq/irq-affinity.rst}                     |  0
 .../irq/irq-domain.rst}                       |  3 +-
 .../irq/irqflags-tracing.rst}                 |  0
 Documentation/core-api/kobject.rst            |  2 +-
 Documentation/{kref.txt => core-api/kref.rst} |  0
 .../{mailbox.txt => core-api/mailbox.rst}     |  0
 .../nommu-mmap.rst}                           |  0
 .../this_cpu_ops.rst}                         |  0
 .../unaligned-memory-access.rst}              |  0
 Documentation/driver-api/index.rst            |  1 +
 .../{IPMI.txt => driver-api/ipmi.rst}         |  0
 Documentation/driver-api/usb/dma.rst          |  6 +-
 Documentation/gpu/drm-mm.rst                  |  2 +-
 Documentation/ia64/irq-redir.rst              |  2 +-
 Documentation/index.rst                       | 13 ++++
 .../futex-requeue-pi.rst}                     |  0
 .../hwspinlock.rst}                           |  0
 Documentation/locking/index.rst               |  7 +++
 .../percpu-rw-semaphore.rst}                  |  0
 .../{pi-futex.txt => locking/pi-futex.rst}    |  0
 .../preempt-locking.rst}                      |  0
 .../robust-futex-ABI.rst}                     |  0
 .../robust-futexes.rst}                       |  0
 Documentation/locking/rt-mutex.rst            |  2 +-
 Documentation/memory-barriers.txt             |  6 +-
 Documentation/networking/scaling.rst          |  4 +-
 .../{digsig.txt => security/digsig.rst}       |  0
 Documentation/security/index.rst              |  1 +
 .../{crc32.txt => staging/crc32.rst}          |  0
 Documentation/staging/index.rst               | 59 +++++++++++++++++++
 .../{kprobes.txt => staging/kprobes.rst}      |  0
 Documentation/{lzo.txt => staging/lzo.rst}    |  0
 .../remoteproc.rst}                           |  2 +-
 .../{rpmsg.txt => staging/rpmsg.rst}          |  0
 .../speculation.rst}                          |  8 ++-
 .../static-keys.rst}                          |  0
 Documentation/{tee.txt => staging/tee.rst}    |  1 +
 Documentation/{xz.txt => staging/xz.rst}      |  0
 Documentation/trace/kprobetrace.rst           |  2 +-
 .../translations/ko_KR/memory-barriers.txt    |  6 +-
 Documentation/translations/zh_CN/IRQ.txt      |  4 +-
 MAINTAINERS                                   | 20 +++----
 arch/Kconfig                                  |  2 +-
 arch/ia64/hp/common/sba_iommu.c               | 12 ++--
 arch/parisc/kernel/pci-dma.c                  |  2 +-
 arch/x86/include/asm/dma-mapping.h            |  4 +-
 arch/x86/kernel/amd_gart_64.c                 |  2 +-
 drivers/char/ipmi/Kconfig                     |  2 +-
 drivers/char/ipmi/ipmi_si_hotmod.c            |  2 +-
 drivers/char/ipmi/ipmi_si_intf.c              |  2 +-
 drivers/parisc/sba_iommu.c                    | 14 ++---
 include/asm-generic/bitops/atomic.h           |  2 +-
 include/linux/dma-mapping.h                   |  2 +-
 include/linux/jump_label.h                    |  2 +-
 include/media/videobuf-dma-sg.h               |  2 +-
 init/Kconfig                                  |  2 +-
 kernel/dma/debug.c                            |  2 +-
 lib/Kconfig.debug                             |  2 +-
 lib/crc32.c                                   |  2 +-
 lib/lzo/lzo1x_decompress_safe.c               |  2 +-
 lib/xz/Kconfig                                |  2 +-
 mm/Kconfig                                    |  2 +-
 mm/nommu.c                                    |  2 +-
 samples/kprobes/kprobe_example.c              |  2 +-
 samples/kprobes/kretprobe_example.c           |  2 +-
 80 files changed, 191 insertions(+), 81 deletions(-)
 rename Documentation/{bus-virt-phys-mapping.txt => core-api/bus-virt-phys-mapping.rst} (99%)
 rename Documentation/{debugging-via-ohci1394.txt => core-api/debugging-via-ohci1394.rst} (100%)
 rename Documentation/{DMA-API-HOWTO.txt => core-api/dma-api-howto.rst} (100%)
 rename Documentation/{DMA-API.txt => core-api/dma-api.rst} (99%)
 rename Documentation/{DMA-attributes.txt => core-api/dma-attributes.rst} (100%)
 rename Documentation/{DMA-ISA-LPC.txt => core-api/dma-isa-lpc.rst} (98%)
 rename Documentation/{IRQ.txt => core-api/irq/concepts.rst} (100%)
 create mode 100644 Documentation/core-api/irq/index.rst
 rename Documentation/{IRQ-affinity.txt => core-api/irq/irq-affinity.rst} (100%)
 rename Documentation/{IRQ-domain.txt => core-api/irq/irq-domain.rst} (99%)
 rename Documentation/{irqflags-tracing.txt => core-api/irq/irqflags-tracing.rst} (100%)
 rename Documentation/{kref.txt => core-api/kref.rst} (100%)
 rename Documentation/{mailbox.txt => core-api/mailbox.rst} (100%)
 rename Documentation/{nommu-mmap.txt => core-api/nommu-mmap.rst} (100%)
 rename Documentation/{this_cpu_ops.txt => core-api/this_cpu_ops.rst} (100%)
 rename Documentation/{unaligned-memory-access.txt => core-api/unaligned-memory-access.rst} (100%)
 rename Documentation/{IPMI.txt => driver-api/ipmi.rst} (100%)
 rename Documentation/{futex-requeue-pi.txt => locking/futex-requeue-pi.rst} (100%)
 rename Documentation/{hwspinlock.txt => locking/hwspinlock.rst} (100%)
 rename Documentation/{percpu-rw-semaphore.txt => locking/percpu-rw-semaphore.rst} (100%)
 rename Documentation/{pi-futex.txt => locking/pi-futex.rst} (100%)
 rename Documentation/{preempt-locking.txt => locking/preempt-locking.rst} (100%)
 rename Documentation/{robust-futex-ABI.txt => locking/robust-futex-ABI.rst} (100%)
 rename Documentation/{robust-futexes.txt => locking/robust-futexes.rst} (100%)
 rename Documentation/{digsig.txt => security/digsig.rst} (100%)
 rename Documentation/{crc32.txt => staging/crc32.rst} (100%)
 create mode 100644 Documentation/staging/index.rst
 rename Documentation/{kprobes.txt => staging/kprobes.rst} (100%)
 rename Documentation/{lzo.txt => staging/lzo.rst} (100%)
 rename Documentation/{remoteproc.txt => staging/remoteproc.rst} (99%)
 rename Documentation/{rpmsg.txt => staging/rpmsg.rst} (100%)
 rename Documentation/{speculation.txt => staging/speculation.rst} (97%)
 rename Documentation/{static-keys.txt => staging/static-keys.rst} (100%)
 rename Documentation/{tee.txt => staging/tee.rst} (99%)
 rename Documentation/{xz.txt => staging/xz.rst} (100%)

-- 
2.25.4


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
