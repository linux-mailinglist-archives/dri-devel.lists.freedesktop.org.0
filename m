Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEISAmQYgmmZPAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:46:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EC6DB796
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DB410E6C5;
	Tue,  3 Feb 2026 15:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RhWg0rIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com
 [74.125.82.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFF010E6C5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 15:46:39 +0000 (UTC)
Received: by mail-dy1-f201.google.com with SMTP id
 5a478bee46e88-2b74aff34efso10550080eec.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 07:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770133599; x=1770738399;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3QkppxUftz38QVidHBNdTmT2F8VCX5EZWUQmqLBEfqQ=;
 b=RhWg0rITAW6Fnnv9uVVsJ1IHCoW2AKkQEQED/0L2DmTmWHM+fjBFtlmcZyUXqV4H2u
 prRjOpCaZTQSZ7FWrAqEsAPF30a9g7rd4E3XL5+X7ozBzG+CLpbBkdj4ujJEe/9TA2s1
 FGRLio3mhgvqmPNW+tuh94Z/hoYUudTI9NgGAsbR6myDzkKfvQ55s61M5zll5U4CYRU7
 0vVbbf9xXnEISpKo4+4LJ9d+LULtgMfeGc2GfD8caH1ntr1XNxvewCAzXse2eB8wozgt
 2sqpNWxJbluUiWptDBXh7kl8HxdKdzsNehMSwzl0xX/T4kODe5WkCAzs3/hYqGkGxOiE
 i7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133599; x=1770738399;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3QkppxUftz38QVidHBNdTmT2F8VCX5EZWUQmqLBEfqQ=;
 b=sd90E8u77MMFgPQilQLh32dEr8IYmpUwDngi0SRJm7gcgr2TYQ+kpV/Z92HuVqRjiC
 RRxEwv6Mcnzc9J89ochEN+uz4DFAQmrteQiZO7pFgc2ZB4eabDh+BvhnelgJpk0ndBOP
 xSpgTG57es/X+TeEkiC5XdpveY/V4dhMROm2JTxl1WOHctI5fZQOwZc+qjhJ3TULSy8z
 2RIuXFGAI46dvUeqBuScNGxrA33LM/qEFj+w1KwGs4IlrFSdMRLwBdNU1TOUY+FqP4KR
 4r7XpR/DL+uDS2bBch/adNoD3VwJ/ZoQM6paCa71Miywwp/fuzzDnjF48Oq4rX1p0PoO
 Vg7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRWfpt4qftr0NYpKIzf00oEqTcs+gI4oEbS8bRHKAkO4XMFIhK2x0MmrG5ObbdvPuhKAG6ZnWkC8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbbJgB/ejm/UghN/dq66rkGityNABAw4L6t1FcGZgS/aV7GYR4
 7QkgS8ay0YBaHpimWKpnVEWheSyfwP6CZ07lP+evA3qAsXy95iNft3RrLpXT8Pz7dL1OPXqxJ8j
 ypg/JGYlKew==
X-Received: from dydb13.prod.google.com ([2002:a05:7300:80cd:b0:2b6:b139:8515])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:c8d:b0:2b7:f415:53da
 with SMTP id 5a478bee46e88-2b7f41562demr4507487eec.39.1770133598871; Tue, 03
 Feb 2026 07:46:38 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:31 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519;
 pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=4973;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=B6pUx1j5pFgygp5i69R4pVf7HKotofgGAbGCOoefnlg=;
 b=fxAPn9jEKutvpJgCWN9uhdCYYPvpNSAPYUiC58vFHXa9srmJAEVvTYAI4ltyhlDhosBAKf3Rg
 E9oiUBNs6ZcCvvrOXXHz6bHCDz2FOMAAS2YvT7aTHhFBqLoubFyOfDq
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-2-d6719db85637@google.com>
Subject: [PATCH v2 2/6] rust: io: Support copying arrays and slices
From: Matthew Maurer <mmaurer@google.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>
Cc: Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-pwm@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:mmaurer@google.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mmaurer@google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_TO(0.00)[kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,linuxfoundation.org,ffwll.ch,samsung.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mmaurer@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A6EC6DB796
X-Rspamd-Action: no action

Adds support for doing array copies of data in and out of IO regions.
Fixed size arrays allow for compile-time bound checking, while slice
arguments allow for dynamically checked copies.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/io.rs | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 056a3ec71647b866a9a4b4c9abe9a0844f126930..6e74245eced2c267ba3b5b744eab3bc2db670e71 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -266,8 +266,9 @@ macro_rules! define_write {
 #[inline]
 const fn offset_valid<U>(offset: usize, size: usize) -> bool {
     let type_size = core::mem::size_of::<U>();
+    let type_align = core::mem::align_of::<U>();
     if let Some(end) = offset.checked_add(type_size) {
-        end <= size && offset % type_size == 0
+        end <= size && offset % type_align == 0
     } else {
         false
     }
@@ -323,6 +324,25 @@ fn io_addr<U>(&self, offset: usize) -> Result<usize> {
         self.addr().checked_add(offset).ok_or(EINVAL)
     }
 
+    /// Returns the absolute I/O address for a given `offset`, performing runtime bounds checks
+    /// to ensure the entire range is available.
+    #[inline]
+    fn io_addr_range<U>(&self, offset: usize, count: usize) -> Result<usize> {
+        if count != 0 {
+            // These ranges are contiguous, so we can just check the first and last elements.
+            let bytes = (count - 1)
+                .checked_mul(core::mem::size_of::<U>())
+                .ok_or(EINVAL)?;
+            let end = offset.checked_add(bytes).ok_or(EINVAL)?;
+            if !offset_valid::<U>(offset, self.maxsize()) || !offset_valid::<U>(end, self.maxsize())
+            {
+                return Err(EINVAL);
+            }
+        }
+
+        self.addr().checked_add(offset).ok_or(EINVAL)
+    }
+
     /// Returns the absolute I/O address for a given `offset`,
     /// performing compile-time bound checks.
     // Always inline to optimize out error path of `build_assert`.
@@ -605,4 +625,54 @@ pub unsafe fn from_raw(raw: &MmioRaw<SIZE>) -> &Self {
         pub try_write64_relaxed,
         call_mmio_write(writeq_relaxed) <- u64
     );
+
+    /// Write a known size buffer to an offset known at compile time.
+    ///
+    /// Bound checks are performed at compile time, hence if the offset is not known at compile
+    /// time, the build will fail, and the buffer size must be statically known.
+    #[inline]
+    pub fn copy_from<const N: usize>(&self, src: &[u8; N], offset: usize) {
+        let addr = self.io_addr_assert::<[u8; N]>(offset);
+        // SAFETY: By the type invariant `addr` is a valid address for MMIO operations, and by the
+        // assertion it's valid for `N` bytes.
+        unsafe { bindings::memcpy_toio(addr as *mut c_void, src.as_ptr().cast(), N) }
+    }
+
+    /// Write the contents of a slice to an offset.
+    ///
+    /// Bound checks are performed at runtime and will fail if the offset (plus the slice size) is
+    /// out of bounds.
+    #[inline]
+    pub fn try_copy_from(&self, src: &[u8], offset: usize) -> Result<()> {
+        let addr = self.io_addr_range::<u8>(offset, src.len())?;
+        // SAFETY: By the type invariant `addr` is a valid address for MMIO operations, and by the
+        // range check it's valid for `src.len()` bytes.
+        unsafe { bindings::memcpy_toio(addr as *mut c_void, src.as_ptr().cast(), src.len()) };
+        Ok(())
+    }
+
+    /// Read a known size buffer from an offset known at compile time.
+    ///
+    /// Bound checks are performed at compile time, hence if the offset is not known at compile
+    /// time, the build will fail, and the buffer size must be statically known.
+    #[inline]
+    pub fn copy_to<const N: usize>(&self, dst: &mut [u8; N], offset: usize) {
+        let addr = self.io_addr_assert::<[u8; N]>(offset);
+        // SAFETY: By the type invariant `addr` is a valid address for MMIO operations, and by the
+        // assertion it's valid for `N` bytes.
+        unsafe { bindings::memcpy_fromio(dst.as_mut_ptr().cast(), addr as *mut c_void, N) }
+    }
+
+    /// Read into a slice from an offset.
+    ///
+    /// Bound checks are performed at runtime and will fail if the offset (plus the slice size) is
+    /// out of bounds.
+    #[inline]
+    pub fn try_copy_to(&self, dst: &mut [u8], offset: usize) -> Result<()> {
+        let addr = self.io_addr_range::<u8>(offset, dst.len())?;
+        // SAFETY: By the type invariant `addr` is a valid address for MMIO operations, and by the
+        // range check, it's valid for `dst.len()` bytes.
+        unsafe { bindings::memcpy_fromio(dst.as_mut_ptr().cast(), addr as *mut c_void, dst.len()) }
+        Ok(())
+    }
 }

-- 
2.53.0.rc2.204.g2597b5adb4-goog

