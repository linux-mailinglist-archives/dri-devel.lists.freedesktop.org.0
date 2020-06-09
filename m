Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE2E1F36C2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 11:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F3D89D8E;
	Tue,  9 Jun 2020 09:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6482589D8E;
 Tue,  9 Jun 2020 09:16:16 +0000 (UTC)
IronPort-SDR: zCokkDkPLS//ftJydpQWvT76eKQ1fjjNc5Eiij5NRuJHWF4sEz7KprcE+XxHtSDeB8xaKfH4ox
 7L7/6ML1LdEA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 02:16:15 -0700
IronPort-SDR: hp4mnEgwYJN3k5YG9bDAy849AXPGUKmf4LsrxP56qR+DacQiImJi6DClfq8LoeL5sx6zVfbbkf
 ct05bOPM9AqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,491,1583222400"; d="scan'208";a="473008387"
Received: from gklab-125-110.igk.intel.com ([10.91.125.110])
 by fmsmga005.fm.intel.com with ESMTP; 09 Jun 2020 02:16:03 -0700
From: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Subject: [PATCH v3 02/15] PCI: Add macro for message signalled interrupt types
Date: Tue,  9 Jun 2020 11:15:53 +0200
Message-Id: <20200609091556.623-1-piotr.stankiewicz@intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200609091148.32749-1-piotr.stankiewicz@intel.com>
References: <20200609091148.32749-1-piotr.stankiewicz@intel.com>
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
 netdev@vger.kernel.org, Yicong Yang <yangyicong@hisilicon.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
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
 Piotr Stankiewicz <piotr.stankiewicz@intel.com>,
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
 Kelsey Skunberg <skunberg.kelsey@gmail.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several places in the kernel which check/ask for MSI or MSI-X
interrupts. It would make sense to have a macro which defines all types
of message signalled interrupts, to use in such situations. Add
PCI_IRQ_MSI_TYPES, for this purpose.

Signed-off-by: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
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
index c79d83304e52..a99094f17b21 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1431,8 +1431,8 @@ int pci_set_vga_state(struct pci_dev *pdev, bool decode,
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
