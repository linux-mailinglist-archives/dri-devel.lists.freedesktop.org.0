Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCSjIntPp2nKggAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:15:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3A51F744C
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093AF10E8CE;
	Tue,  3 Mar 2026 21:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iGkVIflW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3716110E8CF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772572534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wrmpWbz/D0LbSjhwAo9Mxe/RiGjDGWcxtMIqyIp8KYQ=;
 b=iGkVIflW/q203O//UxT3xpDOHkD/nUl7boXfrz/w+3PDbWQIAILlJU1Qa6DGysR6mfLOMW
 Gp3i6LZpxgi8RBwTazB95oC1Vw7FG+qTlRoDq1Iilron7wSZTQ96BBa8ZVbEm3yddp+9b2
 7mAMiBlqhxcDxBHHWbN26vMJAWZgRJE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543--0utYUueNJS7BHZwFaXTcg-1; Tue, 03 Mar 2026 16:15:33 -0500
X-MC-Unique: -0utYUueNJS7BHZwFaXTcg-1
X-Mimecast-MFC-AGG-ID: -0utYUueNJS7BHZwFaXTcg_1772572533
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-506c0da79c5so529575821cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772572533; x=1773177333;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wrmpWbz/D0LbSjhwAo9Mxe/RiGjDGWcxtMIqyIp8KYQ=;
 b=GB7ILI+FWdSq3WpUrBA9TSEuTcLkKXUkeFl6yb9IftAoxY5qSo/okWZt55WZxE/I9u
 DGu7IoDGcVZYWPGHlVHYfFupkGG/vm0WwXsGNLEugi5W6QXtEOLKODX/CNT0rG8t96O8
 d8pGfSaw0QBpAgfseSUAL9Jj3rqrZcmE+Ioo1EmtgFn/5VJmMlz13CcyQI3VankEE0MV
 3p7RVfse2xW38i9xeBAqXbybYYQJ/ELzvnT4mxKsN944R0PNkOeb6eei2jbmC8DihDAT
 2D7ODQNy9WKSnv8NdE2ApJ3cROfbpDoRDmFW75DKGVUWMrEIoc54kl4TzVd46Q+NbqmR
 cAeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuEmux4GH7fDRz/CEFfeDnu6x5qwfAf/s3DZgyf3Syi7EA2yonQSD/YLPpG52W7G9po7y3UbXNj30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGJn3ijVuzEiD1fR/TKspmZSA24bVKhLq13rN5hcj5tpmjfu8U
 /Dl/mWUUdxEUZE2U0QyLG0AbsMntuV3ukYTITT7zZ/z1DCaOeWyzUXMfLa+FKAJh/4bviRP13Mx
 bBpiBiOKp6iYrxE1n9YIzacOIMaagPVxMpEchhLmW9npfKBtd7h4QSa8GIi8vCB6qtdELYKtfm0
 zKGnh3PnIXm3gmX2HFUvL/R2BcBhProwiBMZFJdhbKj9otGJzbT7qcSMR/
X-Gm-Gg: ATEYQzziy5H/cxzcWVrcq7FUknKGx85DoHmK1ZKRp9bSqvP3Tn/qD4RFO1gYgIZLcnQ
 9Z5oWHdkQkdpOLBxuImSQyOIysWBPmVS9CrV3ajWPnsWk/U4WkgysGDcKmQOww0XWxzQW83RMKH
 IFB8qaOHWk22gJqV80h20puxQEmsAIqqqcX41CN/vlUGcjtt4m9Y1eVUCmAYiLM/mMQQZNeQI/N
 TMG5bIWb85fD/0Mb/45JdboquhMj0bNA2KOcjdRr9pILhfs0/Vs3OLvO8+gkwdxhGvHw2I7pzs6
 y8U67xHcL2kKhKHnB5aApNl/mms0c7bipuRzSWLSoxsAE8vjufYHhaJR6/2uQHF6cEE3IUPN124
 iCjSprvajoEtQ5kO8rT22bXja+g==
X-Received: by 2002:a05:622a:214:b0:4f1:83e4:6f55 with SMTP id
 d75a77b69052e-5075273cf0dmr220407961cf.16.1772572532485; 
 Tue, 03 Mar 2026 13:15:32 -0800 (PST)
X-Received: by 2002:a05:622a:214:b0:4f1:83e4:6f55 with SMTP id
 d75a77b69052e-5075273cf0dmr220406951cf.16.1772572531594; 
 Tue, 03 Mar 2026 13:15:31 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 13:15:31 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Subject: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV capability
Date: Tue, 03 Mar 2026 16:15:20 -0500
Message-Id: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMQQ6CMBCF4auQrh0zLZRSV97DuChlkFlITYtND
 OHuNhoX6urlX3xvFYkiUxKHahWRMicOc4l6Vwk/uflCwENpoVBpiaqFeE8L3DxDihwyeNeNGmW
 vHNWioInTEuLj9ZdlmdObSml/aZaA0HW1s4221llzjDRMbtn7cBXn8pXVx7eoUP95VTyNtkH0x
 rSm//Lbtj0BNUVq1N0AAAA=
X-Change-ID: 20251026-rust-pci-sriov-ca8f501b2ae3
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
X-Mimecast-MFC-PROC-ID: Dz1iUnyp9Stg3rohh-OF-D5cvZOevkqe_lVeeGJrlmg_1772572533
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
X-Rspamd-Queue-Id: ED3A51F744C
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

Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
capability of a PCI device. Provide a minimal set of wrappers for the
SR-IOV C API to enable and disable SR-IOV for a device, and query if
a PCI device is a Physical Function (PF) or Virtual Function (VF).

Using the #[vtable] attribute, extend the pci::Driver trait with an
optional bus callback sriov_configure() that is invoked when a
user-space application writes the number of VFs to the sysfs file
`sriov_numvfs` to enable SR-IOV, or zero to disable SR-IOV [1].

Add a method physfn() to return the Physical Function (PF) device for a
Virtual Function (VF) device in the bound device context. Unlike for a
PCI driver written in C, guarantee that when a VF device is bound to a
driver, the underlying PF device is bound to a driver, too.

When a device with enabled VFs is unbound from a driver, invoke the
sriov_configure() callback to disable SR-IOV before the remove()
callback. To ensure the guarantee is upheld, call disable_sriov()
to remove all VF devices if the driver has not done so already.

For PF drivers written in C, disabling SR-IOV on remove() may be opted
into by setting the flag managed_sriov in the pci_driver structure. For
PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.

This series is based on Danilo Krummrich's series "Device::drvdata() and
driver/driver interaction (auxiliary)" applied to driver-core-next,
which similarly guarantees that when an auxiliary bus device is bound to
a driver, the underlying parent device is bound to a driver, too [2, 3].

Add an SR-IOV driver sample that exercises the SR-IOV capability using
QEMU's 82576 (igb) emulation and was used to test the abstractions [4].

[1] https://docs.kernel.org/PCI/pci-iov-howto.html
[2] https://lore.kernel.org/rust-for-linux/20251020223516.241050-1-dakr@kernel.org/
[3] https://lore.kernel.org/rust-for-linux/20260107103511.570525-7-dakr@kernel.org/
[4] https://www.qemu.org/docs/master/system/devices/igb.html

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v3:
- Replace SR_IOV -> SR-IOV in description.
- Drop redundant `.as_ref()` for `dev_*` prints.
- Link to v2: https://lore.kernel.org/r/20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com

Changes in v2:
- Move logic to disable SR-IOV on remove() from Rust to C.
- Add driver flag managed_sriov to opt into disabling SR-IOV on remove().
- Demonstrate flag managed_sriov for dfl-pci driver.
- Uphold safety guarantee for physfn() when PF driver is written in C.
- Let physfn() return error if driver flag managed_sriov is unset.
- Use "kernel vertical" style on imports.
- Use to_result() to handle error in enable_sriov().
- Note Bound device context in SAFETY comments for {enable,disable}_sriov().
- Demonstrate how to reach driver data of PF device from VF device.
- Add missing #[vtable] attribute in PCI driver trait example.
- Add missing #[vtable] attribute in nova-core driver.
- Define struct MyDriver such that physfn() example compiles.
- Replace VF -> PF in doc comment of is_physfn().
- Add #[inline] to is_physfn() and is_virtfn().
- Link to v1: https://lore.kernel.org/r/20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com

---
John Hubbard (1):
      rust: pci: add is_virtfn(), to check for VFs

Peter Colberg (9):
      PCI: add driver flag to opt into disabling SR-IOV on remove()
      fpga: dfl-pci: set driver flag to disable SR-IOV on remove()
      rust: pci: add {enable,disable}_sriov(), to control SR-IOV capability
      rust: pci: add vtable attribute to pci::Driver trait
      rust: pci: add bus callback sriov_configure(), to control SR-IOV from sysfs
      rust: pci: add is_physfn(), to check for PFs
      rust: pci: add num_vf(), to return number of VFs
      rust: pci: add physfn(), to return PF device for VF device
      samples: rust: add SR-IOV driver sample

 MAINTAINERS                           |   1 +
 drivers/fpga/dfl-pci.c                |  17 ++--
 drivers/gpu/nova-core/driver.rs       |   1 +
 drivers/pci/iov.c                     |  41 ++++++++-
 drivers/pci/pci-driver.c              |   3 +-
 drivers/pci/pci.h                     |   2 +
 include/linux/pci.h                   |   8 ++
 rust/kernel/pci.rs                    | 165 ++++++++++++++++++++++++++++++++++
 samples/rust/Kconfig                  |  11 +++
 samples/rust/Makefile                 |   1 +
 samples/rust/rust_dma.rs              |   1 +
 samples/rust/rust_driver_auxiliary.rs |   1 +
 samples/rust/rust_driver_pci.rs       |   1 +
 samples/rust/rust_driver_sriov.rs     | 127 ++++++++++++++++++++++++++
 14 files changed, 366 insertions(+), 14 deletions(-)
---
base-commit: 1b9a5bc8513d081c1bfe2c096b6dc502a4660f47
change-id: 20251026-rust-pci-sriov-ca8f501b2ae3

Best regards,
-- 
Peter Colberg <pcolberg@redhat.com>

