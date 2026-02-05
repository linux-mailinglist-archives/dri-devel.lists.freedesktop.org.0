Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI92JQAFhWlW7gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:00:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA5F75AD
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BCB10E10E;
	Thu,  5 Feb 2026 21:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FoAjm2F0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904CE10E109
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770325242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swhoxBv4zwo4dFRpNRtMjzIqauuYaXTIl/FyLukXQWY=;
 b=FoAjm2F0+C0lIDsMprrIgJ8Jwa8OkDVMqK0lixuZ+YVQeY0fqll3qYfI6Hk5ebcu3rnBsF
 NFLpw5V4lpvPfuyE4d0qBhv4K2f3aISa/9jPrHf5TEa6407DKGuTbMG+G1zG9JTGRdDJM4
 HThLzERRi9FNIsfArESOH+OgH4LN/BU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-4819KxAdN9CKj9K_H8lduw-1; Thu, 05 Feb 2026 16:00:40 -0500
X-MC-Unique: 4819KxAdN9CKj9K_H8lduw-1
X-Mimecast-MFC-AGG-ID: 4819KxAdN9CKj9K_H8lduw_1770325240
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c538971a16so350708485a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 13:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770325240; x=1770930040;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=swhoxBv4zwo4dFRpNRtMjzIqauuYaXTIl/FyLukXQWY=;
 b=nkt/sZ8ZfmMVsKRl5ssx9eC8myRF2ldSlWai42kAZ02Fw5GBJoSoqcVQCVxiuxMaYt
 myB7PKREWGUZyb7tSQSHHNOAohgbcd6ls0ggmGLi/4FRKC4aRHtkdu7+llEbt9597Kw4
 uHVwIKjX7iIZcHLDc1AeGP5zyhKjHVLaM63MW2e4fUJp4Rj3Jkk3zqNKrMLUtQ1VxB/G
 Tc9v6shJhBMO3AuAEQa+TcVOYNl5QQxo7UIhmKZiXfCv4JYwZVprxXhK1bdo9bYQTVEN
 bZoVV0C7kpB+pnHdnQJ67LRj8cwODCjRN13FWHbTiY7lQ4v1HAtJDNs4aFOrAguYms4p
 ikSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxFBGJCAhr4rhzl7HsZX6uGd+JAjavTK1p2SiR1hola5iH1dB7/Rhwz3vUtDGJN15+gwC4MjorpEw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNQrEuGDNcoDshR/xFdCsyJIJZdM0dUaIv+kL68CVuk5gzwQMT
 /oEGxnoj+GC8ZJvt3lMbV0EA0aFByQZq6M+8cmioERC2rml19mIbpE/3sq17X5jSCQWKBhLZR20
 OQPeaH055xT39Kbzkli/xg8kgpINuSgYJxpsrPj6kHSJXvrrk7ZsKLy7A7s+dh10AZA9QGg==
X-Gm-Gg: AZuq6aLDRHMZnzDOer5M5D8BloFtNFHOfCkxLAR2RjZvtXErGH/7PU9uKKN+zuHQ/5C
 rvANI24b4nBw4Ya0sUMdDZQPQtZ7izLCi8TEnedYCopj73WTvR8rcyqO/+zLOnfEZgRvv4S+8Ob
 QHvXvp7tqmh+QcAPWQFYGQyXgWvfa1+XfqFHDqLz0dc3XVop24QOJ+JC3POvLroY9hdGQrH5kWX
 LmFcjpA36uxhPlL8+w9jU0QkRhtlH9so9/O2JFb5TpGYbUcmgcKGUz4uDS8eGo4Vx2NE1ZyYsuS
 A6fVY9szpxi5oWNx99MnHW/fFOrJbQjMNPXB0TVTTa66bprdicR6Qdv+5LuKoaQeiLRSqOlIwmt
 44H56lOp9m/r+0Sc=
X-Received: by 2002:a05:620a:3953:b0:8b2:eae0:bbf4 with SMTP id
 af79cd13be357-8caf0487af1mr60628985a.19.1770325239600; 
 Thu, 05 Feb 2026 13:00:39 -0800 (PST)
X-Received: by 2002:a05:620a:3953:b0:8b2:eae0:bbf4 with SMTP id
 af79cd13be357-8caf0487af1mr60617885a.19.1770325238937; 
 Thu, 05 Feb 2026 13:00:38 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 13:00:38 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:56 -0500
Subject: [PATCH v2 09/10] rust: pci: add physfn(), to return PF device for
 VF device
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-9-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: mWVKo3ybb6VPgYr0Sf26cUbv-c69jEQGvLYcLHH1RUM_1770325240
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
X-Rspamd-Queue-Id: 20DA5F75AD
X-Rspamd-Action: no action

Add a method to return the Physical Function (PF) device for a Virtual
Function (VF) device in the bound device context.

Unlike for a PCI driver written in C, guarantee that when a VF device is
bound to a driver, the underlying PF device is bound to a driver, too,
by always setting the flag managed_sriov in the pci_driver structure.

In case SR-IOV has been enabled by a C driver that has not set the flag
managed_sriov in pci_driver, return an error from physfn().

This change depends on commit a995fe1a3aa7 ("rust: driver: drop device
private data post unbind") to also uphold the safety guarantee in case
a (broken) PF driver re-enables SR-IOV in its unbind() callback. That
commit extends the lifetime of the device private data beyond the
remove_callback() wrapper. In particular, that commit ensures that the
device private data for the PF device is still alive until after the
function pci_iov_remove() is called and forcibly re-disables SR_IOV,
which means the data can be safely accessed by VF drivers until then.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Uphold safety guarantee when PF driver is written in C.
- Let physfn() return error if driver flag managed_sriov is unset.
---
 rust/kernel/pci.rs | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 581930d0afe98ccc29d729e4d9aab75b4144e46c..3b11f73a9f2b69a02fe003b8feadd61864adc8c0 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -525,6 +525,59 @@ pub fn pci_class(&self) -> Class {
     }
 }
 
+impl Device<device::Bound> {
+    /// Returns the Physical Function (PF) device for a Virtual Function (VF) device.
+    ///
+    /// # Examples
+    ///
+    /// The following example illustrates how to obtain the private driver data of the PF device,
+    /// where `vf_pdev` is the VF device of reference type `&Device<Core>` or `&Device<Bound>`.
+    ///
+    /// ```
+    /// # use kernel::{device::Core, pci};
+    /// /// A PCI driver that binds to both the PF and its VF devices.
+    /// struct MyDriver;
+    ///
+    /// impl MyDriver {
+    ///     fn connect(vf_pdev: &pci::Device<Core>) -> Result {
+    ///         let pf_pdev = vf_pdev.physfn()?;
+    ///         let pf_drvdata = pf_pdev.as_ref().drvdata::<Self>()?;
+    ///         Ok(())
+    ///     }
+    /// }
+    /// ```
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn physfn(&self) -> Result<&Device<device::Bound>> {
+        if !self.is_virtfn() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct pci_dev`.
+        // `physfn` is a valid pointer to a `struct pci_dev` since `is_virtfn()` is `true`.
+        let pf_dev = unsafe { (*self.as_raw()).__bindgen_anon_1.physfn };
+
+        // SAFETY: `pf_dev` is a valid pointer to a `struct pci_dev`.
+        // `driver` is either NULL or a valid pointer to a `struct pci_driver`.
+        let pf_drv = unsafe { (*pf_dev).driver };
+        if pf_drv.is_null() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `pf_drv` is a valid pointer to a `struct pci_driver`.
+        if !unsafe { (*pf_drv).managed_sriov } {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `physfn` may be cast to a `Device<device::Bound>` since the
+        // driver flag `managed_sriov` forces SR-IOV to be disabled when the
+        // PF driver is unbound, i.e., all VF devices are destroyed. This
+        // guarantees that the underlying PF device is bound to a driver
+        // when the VF device is bound to a driver, which is the case since
+        // `Device::physfn()` requires a `&Device<Bound>` reference.
+        Ok(unsafe { &*pf_dev.cast() })
+    }
+}
+
 impl Device<device::Core> {
     /// Enable memory resources for this device.
     pub fn enable_device_mem(&self) -> Result {

-- 
2.52.0

