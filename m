Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOILBe4EhWlW7gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:00:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918D8F750C
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1519310E0E1;
	Thu,  5 Feb 2026 21:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LdHqN68o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3BD10E0AD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770325223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJ0fgGiJg3nMFc2XePDEX8wab9GDsnp8jWnAJ4AGTN4=;
 b=LdHqN68opCoSgzb+dsyWblg2ZcRcFHaWg/1Bq1b6STfHTwLLSWon7VzcscsFoaKt7bhuSw
 hKrpgv7xP/lTAhGbBeKVqGg+WJdc7dxUKqK5tLR7DZYs1NLKYDGFyxTsUSZN4PnqEXq5gg
 qwSGP5uIGEBHop8Th/+1wD82iAWs0dg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-Yb0r18uoNHOIbBfRNxpFDw-1; Thu, 05 Feb 2026 16:00:22 -0500
X-MC-Unique: Yb0r18uoNHOIbBfRNxpFDw-1
X-Mimecast-MFC-AGG-ID: Yb0r18uoNHOIbBfRNxpFDw_1770325222
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8950562d351so88818526d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 13:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770325222; x=1770930022;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aJ0fgGiJg3nMFc2XePDEX8wab9GDsnp8jWnAJ4AGTN4=;
 b=jIk41EKGUS7XfYi6vIcfRgoBzkJeGv34MwdchFdsWScqAh8AkVvZhISCkIedpxWLeC
 LLGenU6lcr3w2PPJJB7J7Ym9DeLG8vphaanmrNgDYKPA6pfRU5ksF+xwvxEZGeVOJ7rO
 asVol0vv5wHLKzSM5ZXFjQ6WQmYRDj504CCOOfi/SoxqJL5OFkXGiH9Vp0U/QmPnAyA2
 L3ypSbA72ELPj5sbxkZes7hcoqSuBMkOdblRB0gTk/m49Sp/UKl3v2ryZC4FeXoPY7Ro
 LyuZ0AL4DgUTl9ujJEf00X5kNyfKx1CvrGKjv8TJRNcAB1CTFcfg7qh8QEva4xuM5dey
 Umeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbjS4SKwdy2zGfFdFrVpydmZrGKUs0qvleJpADcMhoecBj+I+mpRt5bF+IFz4fMGH9K1NDMDNhT/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp/G3a8s8sxIasixb6hRzlX2Eac4nw6YKyaLkHVsIPtnhRsMBt
 2k14cUVyakrZuAaiMGErPm/PeBobEvh2z2cpCzMP2d+z9fbpTMgKIEkJ7t91iwGngXFuEai8W/H
 0qIySFu3VxB63tvoyrK0CnsI9kCctvYpzyC1sTBiyfIepTJmzjTeyM7pQpL8PSwqdHC5sdw==
X-Gm-Gg: AZuq6aLF7bmTrVSQ3TT+tfVlh5za2NmF8lDUKSYmfuaakt4gsfmKrWcbpeqs+P1raKz
 UcmW1Sq194VDBMJCwb7Nt9wbQZniIOyuKwQ/FdUQwBplpcM2aTWa8IB0BBigIUg4J0mIXMraXGz
 gb/qyW23FK+P5IjCzgYCeGFXosF2/lv31bJ8OiDTAmLkkfj77uMoRdK3beB5/c0YUP884v3DTcg
 RaHCAMlyIxpXB+r6KbQmfburlKGrC/G2ADXOVG/0QzDiTkRfRFnVG1mfRfodxt4r6bFue9/LzWy
 JI7kAcWsbIRW/GuprdBuegroarjWpmXuzSS5okw3E1X4Fwg+Vp3Bsj8DJzB4SWBBpuCUlB4fynx
 oIqsL7fL6u1MMzJc=
X-Received: by 2002:a05:620a:7085:b0:8b2:e70c:427a with SMTP id
 af79cd13be357-8caf0d3d77cmr64315485a.44.1770325221624; 
 Thu, 05 Feb 2026 13:00:21 -0800 (PST)
X-Received: by 2002:a05:620a:7085:b0:8b2:e70c:427a with SMTP id
 af79cd13be357-8caf0d3d77cmr64305385a.44.1770325220994; 
 Thu, 05 Feb 2026 13:00:20 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 13:00:20 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:48 -0500
Subject: [PATCH v2 01/10] PCI: add driver flag to opt into disabling SR-IOV
 on remove()
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-1-ef9400c7767b@redhat.com>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
In-Reply-To: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev, 
 Peter Colberg <pcolberg@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ySZ0s4SpHkbmKxRinGuGT7EY6tp0G6pfOO8OZzcFVeY_1770325222
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:abdiel.janulgue@gmail.com,m:daniel.almeida@collabora.com,m:robin.murphy@arm.com,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:yilun.xu@intel.com,m:trix@redhat.com,m:mdf@kernel.org,m:rafael@kernel.org,m:linux-pci@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:acourbot@nvidia.com,m:apopple@nvidia.com,m:joelagnelf@nvidia.com,m:jhubbard@nvidia.com,m:zhiw@nvidia.com,m:nouveau@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-fpga@vger.kernel.org,m:driver-core@lists.linux.dev,m:pcolberg@redhat.com,m:jgg@ziepe.ca,m:alexgaynor@gmail.com,m:boqunfeng@gmail.com,
 m:abdieljanulgue@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[41];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,redhat.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 918D8F750C
X-Rspamd-Action: no action

Add a flag managed_sriov to the pci_driver structure that allows a
driver to opt into disabling the Single Root I/O Virtualization (SR-IOV)
capability of the device when the driver is unbound.

Add a new function pci_iov_disable() that is invoked before the remove()
callback of a PCI driver and checks for the presence of the new flag.
If the flag is set, invoke the sriov_configure() callback to allow the
driver to gracefully disable SR-IOV. Warn if the driver fails to do so
and forcibly disable SR-IOV using sriov_disable().

Since a (broken) driver may theoretically re-enable SR-IOV during its
remove() callback, extend pci_iov_remove() to forcibly disable SR-IOV
after remove() if needed and only if the flag managed_sriov is set.

Altogether the flag ensures that when a Virtual Function (VF) is bound
to a driver, the corresponding Physical Function (PF) is bound to a
driver, too, since the VF devices are destroyed when the PF driver is
unbound. This guarantee is a prerequisite for exposing a safe Rust
API that allows a VF driver to obtain the PF device for a VF device
and subsequently access the device private data of the PF device.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Move logic to disable SR-IOV on remove() from Rust to C.
- Add driver flag managed_sriov to opt into disabling SR-IOV on remove().
---
 drivers/pci/iov.c        | 41 ++++++++++++++++++++++++++++++++++++++++-
 drivers/pci/pci-driver.c |  3 ++-
 drivers/pci/pci.h        |  2 ++
 include/linux/pci.h      |  8 ++++++++
 4 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 00784a60ba80bb55ff2790d8f87e15a90c652a24..5b6ed251b4b1e940ec5781bb10dd5c58d3609fc8 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1011,20 +1011,59 @@ void pci_iov_release(struct pci_dev *dev)
 		sriov_release(dev);
 }
 
+/**
+ * pci_iov_disable - disable SR-IOV before PF driver is detached
+ * @dev: the PCI device
+ *
+ * Invoke sriov_configure() callback to allow the driver to gracefully disable
+ * SR-IOV. Warn if the driver fails to do so and forcibly disable SR-IOV.
+ */
+void pci_iov_disable(struct pci_dev *dev)
+{
+	struct pci_driver *drv = dev->driver;
+	struct pci_sriov *iov = dev->sriov;
+
+	if (WARN_ON(!drv))
+		return;
+
+	if (!dev->is_physfn || !iov->num_VFs || !drv->managed_sriov)
+		return;
+
+	if (!drv->sriov_configure) {
+		sriov_disable(dev);
+		return;
+	}
+
+	drv->sriov_configure(dev, 0);
+
+	if (WARN_ON(iov->num_VFs))
+		sriov_disable(dev);
+}
+
 /**
  * pci_iov_remove - clean up SR-IOV state after PF driver is detached
  * @dev: the PCI device
  */
 void pci_iov_remove(struct pci_dev *dev)
 {
+	struct pci_driver *drv = dev->driver;
 	struct pci_sriov *iov = dev->sriov;
 
+	if (WARN_ON(!drv))
+		return;
+
 	if (!dev->is_physfn)
 		return;
 
 	iov->driver_max_VFs = iov->total_VFs;
-	if (iov->num_VFs)
+
+	if (iov->num_VFs && !drv->managed_sriov) {
 		pci_warn(dev, "driver left SR-IOV enabled after remove\n");
+		return;
+	}
+
+	if (WARN_ON(iov->num_VFs))
+		sriov_disable(dev);
 }
 
 /**
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 7c2d9d59625868886d61d8d4045d656ee0165776..e44593c67d147cd70d2d1a8a436a26857b0e446a 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -462,6 +462,7 @@ static void pci_device_remove(struct device *dev)
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct pci_driver *drv = pci_dev->driver;
 
+	pci_iov_disable(pci_dev);
 	if (drv->remove) {
 		pm_runtime_get_sync(dev);
 		/*
@@ -475,8 +476,8 @@ static void pci_device_remove(struct device *dev)
 		pm_runtime_put_noidle(dev);
 	}
 	pcibios_free_irq(pci_dev);
-	pci_dev->driver = NULL;
 	pci_iov_remove(pci_dev);
+	pci_dev->driver = NULL;
 
 	/* Undo the runtime PM settings in local_pci_probe() */
 	pm_runtime_put_sync(dev);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 0e67014aa0013a7086c3a45d576d4b1ca2bb159f..53692e138ed347bfcf6d5923ddd418e9860399d7 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -826,6 +826,7 @@ static inline void pci_restore_pasid_state(struct pci_dev *pdev) { }
 #ifdef CONFIG_PCI_IOV
 int pci_iov_init(struct pci_dev *dev);
 void pci_iov_release(struct pci_dev *dev);
+void pci_iov_disable(struct pci_dev *dev);
 void pci_iov_remove(struct pci_dev *dev);
 void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
@@ -860,6 +861,7 @@ static inline int pci_iov_init(struct pci_dev *dev)
 	return -ENODEV;
 }
 static inline void pci_iov_release(struct pci_dev *dev) { }
+static inline void pci_iov_disable(struct pci_dev *dev) { }
 static inline void pci_iov_remove(struct pci_dev *dev) { }
 static inline void pci_iov_update_resource(struct pci_dev *dev, int resno) { }
 static inline resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev,
diff --git a/include/linux/pci.h b/include/linux/pci.h
index b5cc0c2b99065d4a1ee4581275362e79726a2145..768a02b12ff73aeb4dc3dc33fcca7c46b524c3c0 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -997,6 +997,13 @@ struct module;
  *		how to manage the DMA themselves and set this flag so that
  *		the IOMMU layer will allow them to setup and manage their
  *		own I/O address space.
+ * @managed_sriov: Disable SR-IOV on remove().
+ *		If set, the Single Root I/O Virtualization (SR-IOV)
+ *		capability of the device is disabled when the driver is
+ *		unbound from the device, by calling sriov_configure()
+ *		before remove(). The presence of this flag guarantees
+ *		that when a Virtual Function (VF) is bound to a driver,
+ *		the Physical Function (PF) is bound to a driver, too.
  */
 struct pci_driver {
 	const char		*name;
@@ -1015,6 +1022,7 @@ struct pci_driver {
 	struct device_driver	driver;
 	struct pci_dynids	dynids;
 	bool driver_managed_dma;
+	bool managed_sriov;
 };
 
 #define to_pci_driver(__drv)	\

-- 
2.52.0

