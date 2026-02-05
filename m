Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEH7KPkEhWlW7gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:00:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D859F7577
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544A610E153;
	Thu,  5 Feb 2026 21:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JDJi63Ad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15F210E0F5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770325237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qEZ/NIGEd7tvljUjuiPoVXU22CsIWWTrf8BQDchgWf0=;
 b=JDJi63Addy8cENNOeSswHF1h3mHrv1iH8O5gpk8BFg/t+cRJ0fGvGLGc28rBKhY+/FPrMW
 eewDQbIuh92XeOADb+guxRBTLAWmShoXu5u3rrpNJO9gJtC2hidnB8loUupbDUbjL3CFHD
 kkKsbs2+NTVIp/aTR7gqNu+bOAzn7so=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-8yMiVwbnN0OezYZH2TOorw-1; Thu, 05 Feb 2026 16:00:34 -0500
X-MC-Unique: 8yMiVwbnN0OezYZH2TOorw-1
X-Mimecast-MFC-AGG-ID: 8yMiVwbnN0OezYZH2TOorw_1770325234
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-89471079a13so54496d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 13:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770325234; x=1770930034;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qEZ/NIGEd7tvljUjuiPoVXU22CsIWWTrf8BQDchgWf0=;
 b=YVsrig9nPVEUAa0q3s4gpmhfwUP0o+XQjZNR1sqgQJnGnAIvcwM0G4LjEQojn7arq1
 tFIhIyIZgbHMnBk7CHqVV7+ZmQfwG4OO9eAUiBwuFx0EW7LYtqlVgM69BmkncDFvqTQD
 r32MXAdYjbZkUBdWmXYjSII32ld+DH2g1u48o96240ub1ghmLbGFy6ykqjN8cmSKqkx5
 kh46yJzkQNcivBH3MP9qpC3gdLND1rEsXQEzXJHLHAc/9U1x5XUVgS/KREPNw/0W79go
 FcM74TGM3qjvXKFHj/40xeNf0UXfRigMPxkSEmOxxDQkpG//etpHeuRCQpJUs5V6Cinc
 5Oxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfRTe6sH3iXEXilt7QKuAo71Lip/kjgQcJF2OjWQzCa8OPPjJbjUBRttBkOmce9h2VgMMjazUP330=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+O1BtIZvnQIrs5EwAOvsjU7IpGTQubCo4yLHsXResxN8XkXj5
 nPbzuyiIEO8aIwdH07wQDGjS/rk+Z3tVftQtEWs9T+IzNd1EH1Ei1EAZ73uJTw/F2yEq6jryV0j
 fQBIl8TNAB8kxKLkxUK07IQ/oxM2vlMvpU/G69fniEGdjGPChdnU49zKnbb80khDWv5D5Yg==
X-Gm-Gg: AZuq6aIEX7Ck5XNtP02gHBe1mGYhlIp26vacWjHEcClZhZTvsiOjcNNOqpDQEQouCEx
 EK1ElVHtTbocebLCz/9G50smvEsacQacW/b5fRJBTbVHA5SXIAufjrFfamvKne4kq2WsQRpvkoO
 42PP9Jky2B7qNMl1uTSFrwDlt1eZcPgMktOpO5czMlJiHM85tO/PgnO14EqRzT8RBlVKN2ixHRF
 4wZxKyef18uelytZx9PCr/y5v4DJYinIEtoJZid+N9lWW75lllL+Wai6lVqeHF03vvyHyAQQXZn
 H8RQG7NjvPZ5HwDzd/f5ciSF5T2D54SjV/X/5o8fNxdo9v6P6dCsQRUpPHhx0+0m4Ufbz1DdGQp
 RgVJxP3L3tvoqtvo=
X-Received: by 2002:a05:6214:4017:b0:88a:3681:1d96 with SMTP id
 6a1803df08f44-8953cd9c94fmr5941986d6.63.1770325233466; 
 Thu, 05 Feb 2026 13:00:33 -0800 (PST)
X-Received: by 2002:a05:6214:4017:b0:88a:3681:1d96 with SMTP id
 6a1803df08f44-8953cd9c94fmr5941106d6.63.1770325232827; 
 Thu, 05 Feb 2026 13:00:32 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 13:00:32 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:53 -0500
Subject: [PATCH v2 06/10] rust: pci: add is_virtfn(), to check for VFs
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-6-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: IYbrQUUzJfxTAyDGxMjCJUYGkNBmhb7WRtSIXyK0KMI_1770325234
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 3D859F7577
X-Rspamd-Action: no action

From: John Hubbard <jhubbard@nvidia.com>

Add a method to check if a PCI device is a Virtual Function (VF) created
through Single Root I/O Virtualization (SR-IOV).

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Add #[inline] to is_virtfn().

This patch was originally part of the series "rust: pci: expose
is_virtfn() and reject VFs in nova-core" and modified as follows:
- Replace true -> `true` in doc comment.
- Shorten description and omit justification specific to nova-core.

Link: https://lore.kernel.org/rust-for-linux/20250930220759.288528-2-jhubbard@nvidia.com/
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 88bd114970431bf8c3edef94c1d48567d895eaf6..db05641186c3a42922e2b6a463de9c1b099a4673 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -484,6 +484,13 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns `true` if this device is a Virtual Function (VF).
+    #[inline]
+    pub fn is_virtfn(&self) -> bool {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).is_virtfn() != 0 }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {

-- 
2.52.0

