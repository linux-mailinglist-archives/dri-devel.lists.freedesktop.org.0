Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEApEINPp2nKggAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:15:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15AA1F747F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266ED10E8CD;
	Tue,  3 Mar 2026 21:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H2VPsfiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F4F10E8DA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772572542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dKSiyMf0ynPRuLtK//gTM+BGK6ixt+B/8DTHGEJv69g=;
 b=H2VPsfiBAnbN03VWYdZcVLruNC20irdicCD3XsepdLxO1Ca2Xk+avR3kNuRQaiDT+/jzcD
 VrMneWcRg3RknjfRCMj2DOtUV1PY7aEQmwZ40ZfSH6u4N7d6Kl+zoASN2GxccJRhOWsfWW
 fq5wrkMde8ibK6CaPnMCnYOMTxSaByw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-oa8pZgeoO8uGzJjA6a-wxw-1; Tue, 03 Mar 2026 16:15:40 -0500
X-MC-Unique: oa8pZgeoO8uGzJjA6a-wxw-1
X-Mimecast-MFC-AGG-ID: oa8pZgeoO8uGzJjA6a-wxw_1772572539
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-503810dba87so873100311cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772572539; x=1773177339;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dKSiyMf0ynPRuLtK//gTM+BGK6ixt+B/8DTHGEJv69g=;
 b=by72W2FF1EK0oPg98OW7h9mAbnbRAwYxWYIn40dghjd0SwEFFT3/zEXY2I2fYs+pkq
 dFKu9gJVomSixNDZ1st3G21SQB11hpaLcUv5nMPc+7FwYUqUoW1TSSqWf1E3395Zcfoc
 z9AirULuKpB+bDDANXYmD/MKj3GHuOlNUubNJIKPk21TArfS3tzovBIlBcs9hHysHc8U
 llJwcGKapUT1lE0J4mmu4PUWY8Yb3mI5pPxzjzmAoAltEdRtfO9D/uWqc6FYHYTAQsXD
 cc9bf9NaBli39Z+SpzYk4/L5/ALZeENgzbWEPEtNIwgrTENSuHJOZPdzxh0VCUzDp0Wg
 i4TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGSFDxPwkmOg4i4bX/dZ4to6m0Ia4ZrNDgae0mZyE21M+oZ4NstMep7FMhUB/dsP4BCMCfp19MWEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyUd3BAYVEqBSgz/uORPRg1z6kY89YiXZwH3Y+pSKgk1ANVocK
 HyKmaD1VqgHV+lZVRA5pLUw/a6PDUjBxPn0iNXt69emqT7k8ncdFFzz7ERdESY0FUsgNqQ5wjec
 LeCGrPB3LniMScBx2YIxs//nUyoF0VBvj7gGFlTpIOBUH4LaJCyYNyO5HIyJj8Fhv4+NwTPNTtb
 NjpyZm/j4+rfE7S5Mf+n0z6jbUzrTvxBXQICV7K1FHaxGkgZ3LSt35zUrg
X-Gm-Gg: ATEYQzwJ8g+tTlneYtp/MFD4iyytlqC+40p2C5uF+aYSsKU5X5C+cO7l+j1ZYwHJTHf
 Lp7RbRxPha3g7JM63dT3V2WF8U8nVevRJa8kRmniBkyIrGKUYvF7L/jmsxkhezk3IBd6f4Q0AGf
 A9dbWB6RSwgYPSQYN2o2mtMe4CDCJ+1uwQYu3ieEIAxj+tmccUTTV9HFf2JtA5BuswrPvrQ4CMz
 cFrEaQ5LZVvf7h62A2ZD8p0cmHXzPTkjBSCx0VhDh2WjjXFz0ZaLWX4r+SwURH/Gb6CPOeoQWp4
 KfCP3hUha07dSXte5B6iKrPhe28WDzvep2V+HkS9/X82RWcnc8YzrHIxXkJTqs2b+tz7aL/nQSB
 MXpt2PUCyRlJpweKQh6DE+3qogg==
X-Received: by 2002:a05:622a:50b:b0:4f1:b9ec:f6a4 with SMTP id
 d75a77b69052e-507527b8798mr223872821cf.33.1772572539332; 
 Tue, 03 Mar 2026 13:15:39 -0800 (PST)
X-Received: by 2002:a05:622a:50b:b0:4f1:b9ec:f6a4 with SMTP id
 d75a77b69052e-507527b8798mr223871711cf.33.1772572538483; 
 Tue, 03 Mar 2026 13:15:38 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 13:15:38 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:23 -0500
Subject: [PATCH v3 03/10] rust: pci: add {enable,disable}_sriov(), to
 control SR-IOV capability
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-3-4443c35f0c88@redhat.com>
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
X-Mimecast-MFC-PROC-ID: YfcfyYJab_upC6HKcInVM7JGz6wc3jTzB4siXSneJTQ_1772572539
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
X-Rspamd-Queue-Id: E15AA1F747F
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

Add methods to enable and disable the Single Root I/O Virtualization
(SR-IOV) capability for a PCI device. The wrapped C methods take care
of validating whether the device is a Physical Function (PF), whether
SR-IOV is currently disabled (or enabled), and whether the number of
requested VFs does not exceed the total number of supported VFs.

Set the flag managed_sriov to always disable SR-IOV when a Rust PCI
driver is unbound from a PF device. This ensures that when a Virtual
Function (VF) is bound to a driver, the corresponding Physical Function
(PF) is bound to a driver, too, which is a prerequisite for exposing a
safe Rust API that allows a VF driver to obtain the PF device for a VF
device and subsequently access the private data of the PF driver.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Set flag managed_sriov to disable SR-IOV on remove().
- Use to_result() to handle error in enable_sriov().
- Note Bound device context in SAFETY comments.
---
 rust/kernel/pci.rs | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index af74ddff6114db3c2ce8e228c5a953cd0769e8a5..e1cab1574a3d309d25bf5267c0b0d8da8fb66d44 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -82,6 +82,7 @@ unsafe fn register(
             (*pdrv.get()).probe = Some(Self::probe_callback);
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
+            (*pdrv.get()).managed_sriov = true;
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
@@ -458,6 +459,38 @@ pub fn set_master(&self) {
         // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
         unsafe { bindings::pci_set_master(self.as_raw()) };
     }
+
+    /// Enable the Single Root I/O Virtualization (SR-IOV) capability for this device,
+    /// where `nr_virtfn` is number of Virtual Functions (VF) to enable.
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn enable_sriov(&self, nr_virtfn: i32) -> Result {
+        // SAFETY:
+        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
+        //
+        // `pci_enable_sriov()` checks that the enable operation is valid:
+        // - the device is a Physical Function (PF),
+        // - SR-IOV is currently disabled, and
+        // - `nr_virtfn` does not exceed the total number of supported VFs.
+        //
+        // The Core device context inherits from the Bound device context,
+        // which guarantees that the PF device is bound to a driver.
+        to_result(unsafe { bindings::pci_enable_sriov(self.as_raw(), nr_virtfn) })
+    }
+
+    /// Disable the Single Root I/O Virtualization (SR-IOV) capability for this device.
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn disable_sriov(&self) {
+        // SAFETY:
+        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
+        //
+        // `pci_disable_sriov()` checks that the disable operation is valid:
+        // - the device is a Physical Function (PF), and
+        // - SR-IOV is currently enabled.
+        //
+        // The Core device context inherits from the Bound device context,
+        // which guarantees that the PF device is bound to a driver.
+        unsafe { bindings::pci_disable_sriov(self.as_raw()) };
+    }
 }
 
 // SAFETY: `pci::Device` is a transparent wrapper of `struct pci_dev`.

-- 
2.53.0

