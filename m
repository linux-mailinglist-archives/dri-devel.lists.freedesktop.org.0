Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKtZHoZPp2k0gwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:15:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4A11F74A6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE2910E8F1;
	Tue,  3 Mar 2026 21:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UatT3xYS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D4C10E8D7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772572544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjMC0WxfV6FSNfe+9wyhxlyiyTMxjfq8oevr0CbOGEQ=;
 b=UatT3xYSruZfpjqVDf4AAd2t9EzKJjXY55MRpcvFzjVonc0uZncFQejFys8eSBcI1rWH3M
 LJgBE4oaR+/GpzYhH8O6n8m8t94J6OMCvSH0/UK7sQb+gU/IehSfGxBs3tq/4d18CJww70
 LxOFvkEbdZYQY9RX5syMnylNNlHDtuk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-z5z3Jp89NmWI76Rz37egzg-1; Tue, 03 Mar 2026 16:15:43 -0500
X-MC-Unique: z5z3Jp89NmWI76Rz37egzg-1
X-Mimecast-MFC-AGG-ID: z5z3Jp89NmWI76Rz37egzg_1772572543
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-503342386c7so91934241cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772572543; x=1773177343;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XjMC0WxfV6FSNfe+9wyhxlyiyTMxjfq8oevr0CbOGEQ=;
 b=B0PfM5iaC3/32jEl4hN+adIDBerhlYZ90lRYzDGjdGRIxXcnMO5MEEARwV+xecwOE2
 6DpRkXVxX8+ZRHy4WEZn1fKzoLHgw2D/WJG97268hqJBl66Thh6rXsKrSvt/yEBKomh2
 B68X/xDomj0j3q+TLF5Nz+d6jDyB6ZyGP2+y6Y3sW0l2v+5TOuNXda8sSGCS3kDmIVnN
 xpC9Fuvjh4rcPu8p4la82A2tSJbI+7wGzvKJMqCJZ5yIn+GYZY/Stzi8wU6P42v8YmmM
 2s48es7bGkCS14mXmHRFy6WYiy0AsOQ4yd9BEyEITBv9ZyW34nxf7ZMCP3c8pAVfVsiZ
 DMeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsjI8zqjeBJclXlxjLDQeK+F4KptNebzN/TzON6VOZH7eSwnNim0StXGsNOA85J08NzlWSLSJ/B2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyA2EjBUkM+I/UxQi297lFmuueTD7dMAMiu3MsbuYJw7nbz1qL3
 5pnstFG0l+Cm5r2aSIdzK543kol9ilQ64m/eJanxI5p76Z3xiofgeDmIAA7Anly44ec+EePCAGs
 EEbsZzaq0dLOkqGRcneY2LK6RZ7UV9nYe3P66JZ164+WTpJvm/4kNfnK0NMIfoNQ1R1e2478bbW
 NdkfB6jNiq6kEDJHC5ZhfxmP4LAfZoxITMwvl5i02TRJQko4X3aDjNvCJd
X-Gm-Gg: ATEYQzxQkuPjPa6ryIRcQ8bhnljsYxMZzbSSH3H78dkFQ7ypPr+HTGRNEinb+7521bt
 LrPYrYs7PAXE23mvVOJEDgdCt7woaaJJ/EecWHHzDHEisLla3kxjCKVfmHz3jZqwaKz9HyzrnIT
 v1wne5xlIvtbM/PFboLPlVx3WWZp7HhUq+cfn+A9tl2aKjOG+HIECB2vFXVEuchLnzJmBym50GS
 GQ4hENawiTDToEvZckJPhQss73Sq7LL4rq4BmxYHScNkJxnXBI1YI3itP7OSvr0zBsvM4Dal2ep
 sXL9g1n0aoao56o7itinSIB5M16zyO8M1kuKwnaiGcyb4ktmxtE+2dpZvTVvXYXUtJ3e9KZOFmx
 aZhGF/akpA+Silfmy25tOGed8qw==
X-Received: by 2002:a05:622a:14d2:b0:502:ad63:e15e with SMTP id
 d75a77b69052e-5075281833dmr229351421cf.55.1772572543106; 
 Tue, 03 Mar 2026 13:15:43 -0800 (PST)
X-Received: by 2002:a05:622a:14d2:b0:502:ad63:e15e with SMTP id
 d75a77b69052e-5075281833dmr229350471cf.55.1772572542372; 
 Tue, 03 Mar 2026 13:15:42 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 13:15:42 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:25 -0500
Subject: [PATCH v3 05/10] rust: pci: add bus callback sriov_configure(), to
 control SR-IOV from sysfs
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-5-4443c35f0c88@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 5dWy54ckRGym0g2qlFiFAMnVo-F-AzbC6K_W-5uoITQ_1772572543
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
X-Rspamd-Queue-Id: 1F4A11F74A6
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

Add an optional bus callback sriov_configure() to pci::Driver trait,
using the vtable attribute to query if the driver implements the
callback. The callback is invoked when a user-space application
writes the number of VFs to the sysfs file `sriov_numvfs` to
enable SR-IOV, or zero to disable SR-IOV for a PCI device.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index a4c27c674bd8bdf5e3316789d38d566e90b93fe2..88bd114970431bf8c3edef94c1d48567d895eaf6 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -83,6 +83,10 @@ unsafe fn register(
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
             (*pdrv.get()).managed_sriov = true;
+            #[cfg(CONFIG_PCI_IOV)]
+            if T::HAS_SRIOV_CONFIGURE {
+                (*pdrv.get()).sriov_configure = Some(Self::sriov_configure_callback);
+            }
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
@@ -135,6 +139,20 @@ extern "C" fn remove_callback(pdev: *mut bindings::pci_dev) {
 
         T::unbind(pdev, data);
     }
+
+    #[cfg(CONFIG_PCI_IOV)]
+    extern "C" fn sriov_configure_callback(
+        pdev: *mut bindings::pci_dev,
+        nr_virtfn: c_int,
+    ) -> c_int {
+        // SAFETY: The PCI bus only ever calls the sriov_configure callback with a valid pointer to
+        // a `struct pci_dev`.
+        //
+        // INVARIANT: `pdev` is valid for the duration of `sriov_configure_callback()`.
+        let pdev = unsafe { &*pdev.cast::<Device<device::CoreInternal>>() };
+
+        from_result(|| T::sriov_configure(pdev, nr_virtfn))
+    }
 }
 
 /// Declares a kernel module that exposes a single PCI driver.
@@ -325,6 +343,44 @@ pub trait Driver: Send {
     fn unbind(dev: &Device<device::Core>, this: Pin<&Self>) {
         let _ = (dev, this);
     }
+
+    /// Single Root I/O Virtualization (SR-IOV) configure.
+    ///
+    /// Called when a user-space application enables or disables the SR-IOV capability for a
+    /// [`Device`] by writing the number of Virtual Functions (VF), `nr_virtfn` or zero to the
+    /// sysfs file `sriov_numvfs` for this device. Implementing this callback is optional.
+    ///
+    /// Further, and unlike for a PCI driver written in C, when a PF device with enabled VFs is
+    /// unbound from its bound [`Driver`], the `sriov_configure()` callback is invoked to disable
+    /// SR-IOV before the `unbind()` callback. This guarantees that when a VF device is bound to a
+    /// driver, the underlying PF device is bound to a driver, too.
+    ///
+    /// Upon success, this callback must return the number of VFs that were enabled, or zero if
+    /// SR-IOV was disabled.
+    ///
+    /// See [PCI Express I/O Virtualization].
+    ///
+    /// [PCI Express I/O Virtualization]: https://docs.kernel.org/PCI/pci-iov-howto.html
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{device::Core, pci, prelude::*};
+    /// #[cfg(CONFIG_PCI_IOV)]
+    /// fn sriov_configure(dev: &pci::Device<Core>, nr_virtfn: i32) -> Result<i32> {
+    ///     if nr_virtfn == 0 {
+    ///         dev.disable_sriov();
+    ///     } else {
+    ///         dev.enable_sriov(nr_virtfn)?;
+    ///     }
+    ///     Ok(nr_virtfn)
+    /// }
+    /// ```
+    #[cfg(CONFIG_PCI_IOV)]
+    fn sriov_configure(dev: &Device<device::Core>, nr_virtfn: i32) -> Result<i32> {
+        let _ = (dev, nr_virtfn);
+        build_error!(crate::error::VTABLE_DEFAULT_ERROR)
+    }
 }
 
 /// The PCI device representation.

-- 
2.53.0

