Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KucQHIVPp2k0gwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:15:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198DA1F7498
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3202610E8D0;
	Tue,  3 Mar 2026 21:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X+snYV5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6016210E8E6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772572544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nmGZI5WblWd631ssrKt08f4BijC6XK/3q+5rIjFI99c=;
 b=X+snYV5YDAJDuDwdhgZsnhFnZfstNwyY7PJzJbTCf7i7oUREYurhBsZZqXs8TFjt4XQ3SG
 pzrkOQ+/uCrutTgiEuBkfK2le0SVVWkltR9l5zrtPz5dL9LluFfjv5g+JqH4Ha7T2k+GtM
 9C1mzkHdotWTzvFg6AHomt7t9+MJJaU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-V8flfqiUNMC6VbptG6UTkw-1; Tue, 03 Mar 2026 16:15:43 -0500
X-MC-Unique: V8flfqiUNMC6VbptG6UTkw-1
X-Mimecast-MFC-AGG-ID: V8flfqiUNMC6VbptG6UTkw_1772572542
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-503915b0a88so661311811cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772572542; x=1773177342;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nmGZI5WblWd631ssrKt08f4BijC6XK/3q+5rIjFI99c=;
 b=G0dNnH11Yp9jTzC9NRRrIAGPEO3H08DbkjkPLsCILbl33vsKlVc46j5UnpxviEgj9M
 w5hiW8s+IWqoABglSjkfqyUr838+ZzpVDbcnIdX67ujhAOH4YE0AHbk/KgtRkj+vAYbf
 iZJ3Z41xmPBFuKEaaL/7ml+SBorRi7I6v8pO8sAitsK3MU3Tnc8TcWCGFSLmrBHPFeOP
 sOtVsNcZQbTh2LylqZU7jo6DzDadp/RwToQI5IF2QIDTSQfjgg4mTxe7izutzpvtjK+O
 ozqRkKStEcQPrMUMXg727h54Ekghyf61/nP3NaczdUrh82wu7bs1RWYlhJJXpIhg/dPS
 R1Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA709ZyYCcfam+pirRDcdPnEXMSumHD8fGjqiDURv1RHbVqcvCkvPcGWoro1kA5S4uc1FdfBgnVLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymjQc3FjtniopbU57rrS2WsSXbXb1EPJaXaitQ0Wbmpj4VgRaE
 lb0Wlo0No/Zn3S/OR0cgHSh6QYOEXCuJ4aU1ktJxJEIO/Vfcj569Xs7s3TOY2kldMUNaFuLg29/
 QeLEkkVE9mf4E5lcc5WNH624N8oObi+zlc4Ttg30mjj6O/NNtyuilQ/Uz400pDFBP4rOyBRSn1n
 qe7P1+guADx5YsdH9etB1kQh/tMHpE7wCCU1r0Z7ykKufrpNo6slzjrjzY
X-Gm-Gg: ATEYQzwogcXHlCHCUEecHP0wg+yW5UO8h7JLUl+1/39zTgUehRPVQXlHsWkLYmDee2B
 N/pphNPmW6i0YWStMz/dgu5aYubfekPqvDH+dX+BrnOKBs5Wczxl5KvcQdY5Ni8tJ7ZZFbxzVaW
 7t1iEOGwqAlKpC/FS0etsGMJqM1iNrN1ZZwDxSMFosWY0E+HWFDcYM1hMnNmhTV8RXzWyVogBSt
 NQLfNBAPJR5+qu55YfsfmJfusNyymfgfK5qqhEwPq0V4VGBCecqOr3VDhMmUSJmTGOW80XuttTi
 k6FaBLOjWdQ6QPx35RrVDYF5b1w+uwvO0lUibdv2NpiFvC620M4wdwESB/nOfXfG7xWlJGIGdtL
 TOFzCTsSrsNjDDJRx6WQttApcUA==
X-Received: by 2002:a05:622a:18a8:b0:502:a1bc:5691 with SMTP id
 d75a77b69052e-507525a5444mr232050931cf.0.1772572542284; 
 Tue, 03 Mar 2026 13:15:42 -0800 (PST)
X-Received: by 2002:a05:622a:18a8:b0:502:a1bc:5691 with SMTP id
 d75a77b69052e-507525a5444mr232049271cf.0.1772572540438; 
 Tue, 03 Mar 2026 13:15:40 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 13:15:40 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:24 -0500
Subject: [PATCH v3 04/10] rust: pci: add vtable attribute to pci::Driver trait
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-4-4443c35f0c88@redhat.com>
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
X-Mimecast-MFC-PROC-ID: LpqH-z8sPVVsVZFmz5t3wAOF33mpPkaDApAE7fDCP3Q_1772572542
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
X-Rspamd-Queue-Id: 198DA1F7498
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add the #[vtable] attribute to pci::Driver trait and implementations,
to prepare a subsequent patch that adds an optional bus callback
sriov_configure() to enable or disable the SR-IOV capability.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Add missing #[vtable] attribute in PCI driver trait example.
- Add missing #[vtable] attribute in nova-core driver.
---
 drivers/gpu/nova-core/driver.rs       | 1 +
 rust/kernel/pci.rs                    | 2 ++
 samples/rust/rust_dma.rs              | 1 +
 samples/rust/rust_driver_auxiliary.rs | 1 +
 samples/rust/rust_driver_pci.rs       | 1 +
 5 files changed, 6 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5a4cc047bcfc9fcef61373ace84ed43958a3bcbd..66a68048006fb33477bb00f61856c1aa92c0a8f1 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -64,6 +64,7 @@ pub(crate) struct NovaCore {
     ]
 );
 
+#[vtable]
 impl pci::Driver for NovaCore {
     type IdInfo = ();
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index e1cab1574a3d309d25bf5267c0b0d8da8fb66d44..a4c27c674bd8bdf5e3316789d38d566e90b93fe2 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -278,6 +278,7 @@ macro_rules! pci_device_table {
 ///     ]
 /// );
 ///
+/// #[vtable]
 /// impl pci::Driver for MyDriver {
 ///     type IdInfo = ();
 ///     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
@@ -292,6 +293,7 @@ macro_rules! pci_device_table {
 ///```
 /// Drivers must implement this trait in order to get a PCI driver registered. Please refer to the
 /// `Adapter` documentation for an example.
+#[vtable]
 pub trait Driver: Send {
     /// The type holding information about each device id supported by the driver.
     // TODO: Use `associated_type_defaults` once stabilized:
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 9c45851c876ef33414eb0071c42a2fb4ac3f1e78..ae6f7328b830e32bcaf7f8b5f8b1f117135ebf8e 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -51,6 +51,7 @@ unsafe impl kernel::transmute::FromBytes for MyStruct {}
     [(pci::DeviceId::from_id(pci::Vendor::REDHAT, 0x5), ())]
 );
 
+#[vtable]
 impl pci::Driver for DmaSampleDriver {
     type IdInfo = ();
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index 5c5a5105a3fff90f5e396186776e1b3ffdf479b4..2f7ac8f7391f45827c086b704950fd01907c1825 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -65,6 +65,7 @@ struct ParentDriver {
     [(pci::DeviceId::from_id(pci::Vendor::REDHAT, 0x5), ())]
 );
 
+#[vtable]
 impl pci::Driver for ParentDriver {
     type IdInfo = ();
 
diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index d3d4a7931deb0c1085cfd817990737717f466ea9..27e603a9509c19b6845c10ef06a0af897aa0e84b 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -92,6 +92,7 @@ fn config_space(pdev: &pci::Device<Bound>) {
     }
 }
 
+#[vtable]
 impl pci::Driver for SampleDriver {
     type IdInfo = TestIndex;
 

-- 
2.53.0

