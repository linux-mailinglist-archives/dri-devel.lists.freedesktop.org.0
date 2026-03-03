Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGdeHJBPp2nKggAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:16:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA31F74FD
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AD410E8E1;
	Tue,  3 Mar 2026 21:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g7FiJDyC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928E810E8FB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772572555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFUtofMKhN11SJynmnwd1bk8v/kag6AshDn9xvNUK9Q=;
 b=g7FiJDyCEV4nBjJ5GEeqwP4/sqGLNKQgLqzVff7r6/MxcGzpwHqT5edfIoHMEWSQ2QNWV9
 1YGG3klrAzaE/EJCvswkul8USCrlzgc93chvli/KgvzqV0uNhHhjbck7585KyQYnP+gsnU
 nUbvYREUuCzvGoNWIpr6Rv0kb+cLDnE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-QikELjFKOSazVE7IDSRt_g-1; Tue, 03 Mar 2026 16:15:54 -0500
X-MC-Unique: QikELjFKOSazVE7IDSRt_g-1
X-Mimecast-MFC-AGG-ID: QikELjFKOSazVE7IDSRt_g_1772572554
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-506b839cafaso83203691cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772572554; x=1773177354;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iFUtofMKhN11SJynmnwd1bk8v/kag6AshDn9xvNUK9Q=;
 b=Jzn3glIJBUPKfdEzhFqyP4Jc8XCydRafHsXRk2GxFfXxBj4T+p//XGk2sn+eioVFFZ
 IlMGVPBlEzojO4uoNHwRR3F89Tou9d7FPLbZKSBSVvOQ5UAYyJi32L6MOamKmbBmQXSj
 DWpfP9iAXmBH57pXoDPjyevD/Q40ZPnO5qudFloMjgsUcRNOyXO/6mi/m0BSplJkg0b/
 Hm3eEWbX9k9sjDVLutMukDt/PnizxGd5BzpQxHPiWmOme+aAbBnVsfPZbu6nb2/afmsA
 78GRroghgfXdaplQ2NJH5mclTIVl9YPrK02uE9HsDnUKcupKlK5di4DV5JPCfWvfK8OO
 25og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFtJBk6K/FwQj2n0fYRmmI+Xh0csN3N3+iWypf8PQmz/rqs9qKk5trNXPU/8YfjKoN2TRSnszWjPw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc9ohxadbb9QO8t74bQ5Wtxj3RD11ZdNeLgWkv8G2fkVrxdDmB
 ePIt/lIwwpOabbvg5+a+eEaRmOQVEVgTjEU03xip5lZ6csIgmRSOWTMWwNB8vXmBFsNKFw2MsrY
 gT/MJHnzycy/it43bWDTBrhPkgihSIMNZvVkHPWvX5/J9i2dmvysaF8Yiyv/PL7b/evg4Eb+9y4
 nDkTx2ARW8baNQgHR2XJ8eBvINSnZMEkUyf81RSe+pIiXZrecM0l7r5xxK
X-Gm-Gg: ATEYQzwoA30djaSBOp2HrFOigPEk4BG3C/wEFaUlcRvLfS6WgFitS3X6rKRiCpXMrZO
 c0h612d9PUC7uoErR7wdQNaA+frN/kGH8WXGeFwo24roHr2APSqxB6KZXfa2P14K2lLhlhniFGB
 p8AEmuntNq1MMFluuP0CriwAAqdARreheP5j+H7dkJhL2nYqHy/8xNfQjyjHtXiqF9CDs3D+svW
 hSmJg54e9bsTSDmS+aYRRxu6AVxjxRATiUEC8ubI5GiF++z4OeHpwzQVU3mS8s0/4ti3CubwPfF
 v+kXU0I9zakpLGYBrludMIsONofp4/ubxzdYbw0bYamiwATxI7dbkNbf/co5e3aUxVFOP4S0Z+7
 A3GY64P9YIuoUDR19tnsM8H7yAg==
X-Received: by 2002:ac8:57d0:0:b0:4f1:ba0b:90 with SMTP id
 d75a77b69052e-50752840191mr212432101cf.8.1772572553772; 
 Tue, 03 Mar 2026 13:15:53 -0800 (PST)
X-Received: by 2002:ac8:57d0:0:b0:4f1:ba0b:90 with SMTP id
 d75a77b69052e-50752840191mr212431321cf.8.1772572553025; 
 Tue, 03 Mar 2026 13:15:53 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 13:15:52 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:30 -0500
Subject: [PATCH v3 10/10] samples: rust: add SR-IOV driver sample
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-10-4443c35f0c88@redhat.com>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
In-Reply-To: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
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
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
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
X-Mimecast-MFC-PROC-ID: wCb1uqyNiS_dkMTxAvjPh1YLPt3xCzQ5-vASZDdFXEk_1772572554
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Queue-Id: EFEA31F74FD
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
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:abdiel.janulgue@gmail.com,m:daniel.almeida@collabora.com,m:robin.murphy@arm.com,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:yilun.xu@intel.com,m:trix@redhat.com,m:mdf@kernel.org,m:rafael@kernel.org,m:boqun@kernel.org,m:linux-pci@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:acourbot@nvidia.com,m:apopple@nvidia.com,m:joelagnelf@nvidia.com,m:jhubbard@nvidia.com,m:zhiw@nvidia.com,m:nouveau@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-fpga@vger.kernel.org,m:driver-core@lists.linux.dev,m:pcolberg@redhat.com,m:jgg@ziepe.ca,m:alexgaynor@gmail.com,m:abdieljanulgue@gmail.com
 ,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qemu.org:url]
X-Rspamd-Action: no action

Add a new SR-IOV driver sample that demonstrates how to enable and
disable the Single Root I/O Virtualization capability for a PCI device.

The sample may be exercised using QEMU's 82576 (igb) emulation.

Link: https://www.qemu.org/docs/master/system/devices/igb.html
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v3:
- Drop redundant `.as_ref()` for `dev_*` prints.

Changes in v2:
- Use "kernel vertical" style on imports.
- Demonstrate how to reach driver data of PF device from VF device.
---
 MAINTAINERS                       |   1 +
 samples/rust/Kconfig              |  11 ++++
 samples/rust/Makefile             |   1 +
 samples/rust/rust_driver_sriov.rs | 127 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 140 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61bf550fd37c274843e516e00068bb2ab1e152ac..8551a9474fc26309d0714aafa104a5e1ed29156b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20454,6 +20454,7 @@ F:	rust/helpers/pci.c
 F:	rust/kernel/pci.rs
 F:	rust/kernel/pci/
 F:	samples/rust/rust_driver_pci.rs
+F:	samples/rust/rust_driver_sriov.rs
 
 PCIE BANDWIDTH CONTROLLER
 M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index c49ab910634596aea4a1a73dac87585e084f420a..f244df89c4fc9d741915f581de76107e8eb0121b 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -128,6 +128,17 @@ config SAMPLE_RUST_DRIVER_PLATFORM
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_SRIOV
+	tristate "SR-IOV Driver"
+	depends on PCI_IOV
+	help
+	  This option builds the Rust SR-IOV driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_sriov.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_USB
 	tristate "USB Driver"
 	depends on USB = y
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 6c0aaa58ccccfd12ef019f68ca784f6d977bc668..19d700f8210151e298cc049dacc249a121d0f2c4 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_I2C_CLIENT)		+= rust_i2c_client.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_SRIOV)		+= rust_driver_sriov.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
diff --git a/samples/rust/rust_driver_sriov.rs b/samples/rust/rust_driver_sriov.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a4f7b99d9490f8fed2ab1fedb238c53304af89ee
--- /dev/null
+++ b/samples/rust/rust_driver_sriov.rs
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust SR-IOV driver sample based on QEMU's 82576 ([igb]) emulation.
+//!
+//! To make this driver probe, QEMU must be run with `-device igb`.
+//!
+//! Further, enable [vIOMMU] with interrupt remapping using, e.g.,
+//!
+//! `-M q35,accel=kvm,kernel-irqchip=split -device intel-iommu,intremap=on,caching-mode=on`
+//!
+//! and append `intel_iommu=on` to the guest kernel arguments.
+//!
+//! [igb]: https://www.qemu.org/docs/master/system/devices/igb.html
+//! [vIOMMU]: https://wiki.qemu.org/Features/VT-d
+
+use kernel::{
+    device::Core,
+    pci,
+    prelude::*,
+    sync::aref::ARef, //
+};
+
+use core::any::TypeId;
+
+#[pin_data(PinnedDrop)]
+struct SampleDriver {
+    pdev: ARef<pci::Device>,
+    private: TypeId,
+}
+
+kernel::pci_device_table!(
+    PCI_TABLE,
+    MODULE_PCI_TABLE,
+    <SampleDriver as pci::Driver>::IdInfo,
+    [
+        // E1000_DEV_ID_82576
+        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10c9), ()),
+        // E1000_DEV_ID_82576_VF
+        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10ca), ())
+    ]
+);
+
+#[vtable]
+impl pci::Driver for SampleDriver {
+    type IdInfo = ();
+
+    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
+
+    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
+        pin_init::pin_init_scope(move || {
+            dev_info!(
+                pdev,
+                "Probe Rust SR-IOV driver sample (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+
+            if pdev.is_virtfn() {
+                let physfn = pdev.physfn()?;
+                let drvdata = physfn.as_ref().drvdata::<Self>()?;
+
+                assert!(physfn.is_physfn());
+
+                dev_info!(
+                    pdev,
+                    "Parent device is PF (PCI ID: {}, 0x{:x}).\n",
+                    physfn.vendor_id(),
+                    physfn.device_id()
+                );
+
+                dev_info!(
+                    pdev,
+                    "We have access to the private data of {:?}.\n",
+                    drvdata.private
+                );
+            }
+
+            pdev.enable_device_mem()?;
+            pdev.set_master();
+
+            Ok(try_pin_init!(Self {
+                pdev: pdev.into(),
+                private: TypeId::of::<Self>()
+            }))
+        })
+    }
+
+    fn sriov_configure(pdev: &pci::Device<Core>, nr_virtfn: i32) -> Result<i32> {
+        assert!(pdev.is_physfn());
+
+        if nr_virtfn == 0 {
+            dev_info!(
+                pdev,
+                "Disable SR-IOV (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+            pdev.disable_sriov();
+        } else {
+            dev_info!(
+                pdev,
+                "Enable SR-IOV (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+            pdev.enable_sriov(nr_virtfn)?;
+        }
+
+        assert_eq!(pdev.num_vf(), nr_virtfn);
+        Ok(nr_virtfn)
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for SampleDriver {
+    fn drop(self: Pin<&mut Self>) {
+        dev_info!(self.pdev, "Remove Rust SR-IOV driver sample.\n");
+    }
+}
+
+kernel::module_pci_driver! {
+    type: SampleDriver,
+    name: "rust_driver_sriov",
+    authors: ["Peter Colberg"],
+    description: "Rust SR-IOV driver",
+    license: "GPL v2",
+}

-- 
2.53.0

