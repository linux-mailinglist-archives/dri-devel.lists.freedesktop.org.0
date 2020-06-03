Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37781ECED2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 13:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E6789AEA;
	Wed,  3 Jun 2020 11:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E45489A44;
 Wed,  3 Jun 2020 11:46:31 +0000 (UTC)
IronPort-SDR: VtjIrxg2v6CaUxOjXC9aPa8kA/xT5UUOnGQsMFjcM7Vyg4BIVSxtcoGLE1KXcKN/EWZ6fcR4Ut
 v0Lft05dCE3A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 04:46:30 -0700
IronPort-SDR: Q94X9qPKVl71qdIrOAFFgbTGyF3AE77MO4MqUWVQgQJjOxjmL31V62gRhPhld6Hwc1sLALK73m
 Aq6qF9BxPGWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; d="scan'208";a="471047512"
Received: from gklab-125-110.igk.intel.com ([10.91.125.110])
 by fmsmga006.fm.intel.com with ESMTP; 03 Jun 2020 04:46:20 -0700
From: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Subject: [PATCH v2 02/15] PCI: Add shorthand define for message signalled
 interrupt types
Date: Wed,  3 Jun 2020 13:45:50 +0200
Message-Id: <20200603114553.12866-1-piotr.stankiewicz@intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200603114212.12525-1-piotr.stankiewicz@intel.com>
References: <20200603114212.12525-1-piotr.stankiewicz@intel.com>
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
Cc: Krzysztof Wilczynski <kw@linux.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Igor Russkikh <irusskikh@marvell.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Jim Gill <jgill@vmware.com>,
 netdev@vger.kernel.org, Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 linux-media@vger.kernel.org, Tom Lendacky <thomas.lendacky@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Antoine Tenart <antoine.tenart@bootlin.com>,
 linux-kernel@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Salil Mehta <salil.mehta@huawei.com>, Denis Efremov <efremov@linux.com>,
 dmaengine@vger.kernel.org, Brian King <brking@us.ibm.com>,
 VMware PV-Drivers <pv-drivers@vmware.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
 linux-crypto@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Piotr Stankiewicz <piotr.stankiewicz@intel.com>,
 Kelsey Skunberg <skunberg.kelsey@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several places in the kernel which check/ask for MSI or MSI-X
interrupts. It would make sense to have a shorthand constant, similar to
PCI_IRQ_ALL_TYPES, to use in these situations. So add PCI_IRQ_MSI_TYPES,
for this purpose.

Signed-off-by: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 Documentation/PCI/msi-howto.rst | 5 +++--
 include/linux/pci.h             | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/PCI/msi-howto.rst b/Documentation/PCI/msi-howto.rst
index aa2046af69f7..2800ff5aa395 100644
--- a/Documentation/PCI/msi-howto.rst
+++ b/Documentation/PCI/msi-howto.rst
@@ -105,7 +105,8 @@ if it can't meet the minimum number of vectors.
 The flags argument is used to specify which type of interrupt can be used
 by the device and the driver (PCI_IRQ_LEGACY, PCI_IRQ_MSI, PCI_IRQ_MSIX).
 A convenient short-hand (PCI_IRQ_ALL_TYPES) is also available to ask for
-any possible kind of interrupt.  If the PCI_IRQ_AFFINITY flag is set,
+any possible kind of interrupt, and (PCI_IRQ_MSI_TYPES) to ask for message
+signalled interrupts (MSI or MSI-X).  If the PCI_IRQ_AFFINITY flag is set,
 pci_alloc_irq_vectors() will spread the interrupts around the available CPUs.
 
 To get the Linux IRQ numbers passed to request_irq() and free_irq() and the
@@ -160,7 +161,7 @@ the single MSI mode for a device.  It could be done by passing two 1s as
 Some devices might not support using legacy line interrupts, in which case
 the driver can specify that only MSI or MSI-X is acceptable::
 
-	nvec = pci_alloc_irq_vectors(pdev, 1, nvec, PCI_IRQ_MSI | PCI_IRQ_MSIX);
+	nvec = pci_alloc_irq_vectors(pdev, 1, nvec, PCI_IRQ_MSI_TYPES);
 	if (nvec < 0)
 		goto out_err;
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 83ce1cdf5676..b6c9bf70363e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1422,8 +1422,8 @@ int pci_set_vga_state(struct pci_dev *pdev, bool decode,
  */
 #define PCI_IRQ_VIRTUAL		(1 << 4)
 
-#define PCI_IRQ_ALL_TYPES \
-	(PCI_IRQ_LEGACY | PCI_IRQ_MSI | PCI_IRQ_MSIX)
+#define PCI_IRQ_MSI_TYPES	(PCI_IRQ_MSI | PCI_IRQ_MSIX)
+#define PCI_IRQ_ALL_TYPES	(PCI_IRQ_LEGACY | PCI_IRQ_MSI_TYPES)
 
 /* kmem_cache style wrapper around pci_alloc_consistent() */
 
-- 
2.17.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
