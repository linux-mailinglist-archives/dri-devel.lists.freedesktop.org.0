Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 67TUAQ4elWk2LgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 03:03:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A9A1529E8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 03:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154B110E2CC;
	Wed, 18 Feb 2026 02:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="L3Cq/OUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28AF10E2CA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 02:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771380231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o4cHvKSBZESAOv4yzpaqvORLgvpDRThGyDvq3HOoF2s=;
 b=L3Cq/OUmE39lqbDMi4RD6vO0nKtNjMPE/ztjEMWsLNVlvhTOqH32r9XGzP0KVBn0aRAxFL
 ECWwUisKahCsLGqWNef6y4+tDeZl1lkLIBUtMqQnU21mpb2qa6F7gP0gTMVMYLcLDLChC5
 RNeehsEWsOmhFqPRegVtRrvWEoWC158=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-39-ZNUwuOt-UQYZ-cPQMWA-1; Tue, 17 Feb 2026 21:03:50 -0500
X-MC-Unique: 39-ZNUwuOt-UQYZ-cPQMWA-1
X-Mimecast-MFC-AGG-ID: 39-ZNUwuOt-UQYZ-cPQMWA_1771380230
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8946f51b8c8so455533566d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 18:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771380230; x=1771985030;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4cHvKSBZESAOv4yzpaqvORLgvpDRThGyDvq3HOoF2s=;
 b=rAkWqu7sATU8/4Z1sS6uHFVd42NkdpGd7fGBA0H41DGq9OIifRkgEY+4nJaDRfFgRR
 LW6+ey/cYgjj5DeGJNseuygYdkf+Azivto71dAYKZkv34zWF00M3NvdJehoI2ioulXUA
 oT3r3KC1RCm1if6RtdEq196+9A9CslIcNODMx1HA0e7ZYdBryzLxy6+4guMmp3pY5ZQq
 RnLDz3FMVNtVX/ebrPnpqQ3rkRKrzA4x7c6A+V3otoAoqypSFFxlizWseTmRSXRfz4A4
 mWS2q53Ta9VjdnenEbrvunHCJDL4PnzP15+9lLM5cClE+WKZrH0mQTSRcle3YqhTiDZO
 z3sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbkgJH7a88jWwiaYU4FRW58QTOV8502IKnwwu9JMj87njNU+lNJxAN+ALWkg3iChq6mJx5E0BEK3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIXF++lLHIB32vGpJsozWsnVxIa/QHDN1XO4HQtM0L7s/J5TB4
 L0GnvEOPanH1oe8ifG6v5cLmFq3wXFRxDzvV1DZTey9pN8luWJWC1W97UQ1BsbEh1zfrb6KsTxJ
 4JTszV4P0zmde3g48rvJWpuP12EVKa5kcDPZSHsgvDnvkwmICJtavCXchfLqEBTiQhO7d7g==
X-Gm-Gg: AZuq6aKEMFBbNfOvjmKIvpJ1I/v4ooOpOLc/j6Uu3NoB/JpvRDL2uC6lH4bE0prJwIB
 bC0tipZuXcjUFsgC/HIQk60pV+NrvSVrk/7WhJyfrzKcTL7t/CDql2AFp2x4FgcEvFjv9vDbCQG
 hfCvXG1PKxFmUbXOfq4XU062ikEDznKTwTe2mNiqqYAT513bSv6ooOPFMPjKhMHTZp6h0hYmcz0
 BS/RKPhBJCLC9yRVnPrtAmBAoBeYEaEfFCrGaTLEvovNb14r18I9u6mbRfhh2WHxK4EEO0x9Pg/
 15O7ary7REURb8a4FDiLB40SYSvSAg9+5RCSSby2SQBlhyGAfalUspKGKW/1thzVMEev5/t3dv3
 5i7svp5gUdLbRBqxKRgu31Q==
X-Received: by 2002:ad4:5dee:0:b0:894:6cb7:da94 with SMTP id
 6a1803df08f44-897402c95aamr190213056d6.8.1771380229543; 
 Tue, 17 Feb 2026 18:03:49 -0800 (PST)
X-Received: by 2002:ad4:5dee:0:b0:894:6cb7:da94 with SMTP id
 6a1803df08f44-897402c95aamr190212556d6.8.1771380228953; 
 Tue, 17 Feb 2026 18:03:48 -0800 (PST)
Received: from localhost ([2607:f2c0:b1e3:9a00:3d5c:8422:4052:e7a6])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-8971cc7dc1csm176656526d6.10.2026.02.17.18.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 18:03:48 -0800 (PST)
Date: Tue, 17 Feb 2026 21:03:47 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org,
 driver-core@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 10/10] samples: rust: add SR-IOV driver sample
Message-ID: <aZUeA1hmYlZIILQg@earendel>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
 <20260205-rust-pci-sriov-v2-10-ef9400c7767b@redhat.com>
 <0e762787-7270-426f-81ee-b24761617c18@de.bosch.com>
MIME-Version: 1.0
In-Reply-To: <0e762787-7270-426f-81ee-b24761617c18@de.bosch.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MYKd56j_pRZLPIg6-pYXJuANvoGUqs1yHwNEQn9M-8Y_1771380230
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORGED_SENDER(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:dirk.behme@de.bosch.com,m:dakr@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:abdiel.janulgue@gmail.com,m:daniel.almeida@collabora.com,m:robin.murphy@arm.com,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:yilun.xu@intel.com,m:trix@redhat.com,m:mdf@kernel.org,m:rafael@kernel.org,m:linux-pci@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:acourbot@nvidia.com,m:apopple@nvidia.com,m:joelagnelf@nvidia.com,m:jhubbard@nvidia.com,m:zhiw@nvidia.com,m:nouveau@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-fpga@vger.kernel.org,m:driver-core@lists.linux.dev,m:jgg@ziepe.ca,m:alexgaynor@gmail.com,m:boqunfeng@gmail.
 com,m:abdieljanulgue@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,redhat.com,vger.kernel.org,nvidia.com,lists.freedesktop.org,lists.linux.dev,ziepe.ca];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 56A9A1529E8
X-Rspamd-Action: no action

Hi Dirk,

On Mon, Feb 16, 2026 at 09:27:44AM +0100, Dirk Behme wrote:
> Hi Peter,
> 
> On 05.02.2026 21:59, Peter Colberg wrote:
> > Add a new SR-IOV driver sample that demonstrates how to enable and
> > disable the Single Root I/O Virtualization capability for a PCI device.
> > 
> > The sample may be exercised using QEMU's 82576 (igb) emulation.
> > 
> > Link: https://www.qemu.org/docs/master/system/devices/igb.html
> > Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> > ---
> > Changes in v2:
> > - Use "kernel vertical" style on imports.
> > - Demonstrate how to reach driver data of PF device from VF device.
> > ---
> >   MAINTAINERS                       |   1 +
> >   samples/rust/Kconfig              |  11 ++++
> >   samples/rust/Makefile             |   1 +
> >   samples/rust/rust_driver_sriov.rs | 127 ++++++++++++++++++++++++++++++++++++++
> >   4 files changed, 140 insertions(+)
> > 
> ...
> > diff --git a/samples/rust/rust_driver_sriov.rs b/samples/rust/rust_driver_sriov.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..84d057629c7b03d743179a4e05ccc092f814bf6b
> > --- /dev/null
> > +++ b/samples/rust/rust_driver_sriov.rs
> > @@ -0,0 +1,127 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Rust SR-IOV driver sample based on QEMU's 82576 ([igb]) emulation.
> > +//!
> > +//! To make this driver probe, QEMU must be run with `-device igb`.
> > +//!
> > +//! Further, enable [vIOMMU] with interrupt remapping using, e.g.,
> > +//!
> > +//! `-M q35,accel=kvm,kernel-irqchip=split -device intel-iommu,intremap=on,caching-mode=on`
> > +//!
> > +//! and append `intel_iommu=on` to the guest kernel arguments.
> > +//!
> > +//! [igb]: https://www.qemu.org/docs/master/system/devices/igb.html
> > +//! [vIOMMU]: https://wiki.qemu.org/Features/VT-d
> > +
> > +use kernel::{
> > +    device::Core,
> > +    pci,
> > +    prelude::*,
> > +    sync::aref::ARef, //
> > +};
> > +
> > +use core::any::TypeId;
> > +
> > +#[pin_data(PinnedDrop)]
> > +struct SampleDriver {
> > +    pdev: ARef<pci::Device>,
> > +    private: TypeId,
> > +}
> > +
> > +kernel::pci_device_table!(
> > +    PCI_TABLE,
> > +    MODULE_PCI_TABLE,
> > +    <SampleDriver as pci::Driver>::IdInfo,
> > +    [
> > +        // E1000_DEV_ID_82576
> > +        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10c9), ()),
> > +        // E1000_DEV_ID_82576_VF
> > +        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10ca), ())
> > +    ]
> > +);
> > +
> > +#[vtable]
> > +impl pci::Driver for SampleDriver {
> > +    type IdInfo = ();
> > +
> > +    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> > +
> > +    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
> > +        pin_init::pin_init_scope(move || {
> > +            dev_info!(
> > +                pdev.as_ref(),
> 
> The `as_ref()` in the `dev_*()` prints can be dropped. Example:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/samples/rust/rust_driver_pci.rs?id=600de1c008b2302b56d69ff27d12a9d8d14892ac

Thank you for the pointer, dropped in v3.

Peter

> 
> Best regards
> 
> Dirk
> 

