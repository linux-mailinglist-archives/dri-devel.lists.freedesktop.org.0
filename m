Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB3pNmgYgmmZPAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:46:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8670CDB7B2
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB4210E6DA;
	Tue,  3 Feb 2026 15:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DGvEqasy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6455710E6DA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 15:46:45 +0000 (UTC)
Received: by mail-dl1-f73.google.com with SMTP id
 a92af1059eb24-124627fc58dso9318498c88.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 07:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770133604; x=1770738404;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wdhof5UcFa0LauNDEG7A5hw9JfGF2S2FIbHiIBJlkVI=;
 b=DGvEqasydIeHVSfsJMjiksJg/KIkBXaKewpnNCs5FMK6XVU4xMz+/s1lPJSYBiDGJz
 hCw7Bu2R9yjc/Sij4dK8US8/s5LkB+jUTSSyv0nZQBpoesTwg8XqGObnlCZuPsDsrIZi
 9VufiReQs0V2q2UgPBmSqnR/rHtP8t4vRSe9NsMlSEp4wjJsESSNSYY4lPCtBrBKH35z
 7lY3mrBPqLws59P7XyTKUfloqyBpkYye3/ESmaEAY8sLBV6Tf/w565bWeG4R9Yr24jbl
 qg4xqByCJqyUn0lGHAaVuTOqIPrW+sPRHtACNTxviYplcvpvFZWUuHBTVEV79YJHEySA
 vO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133604; x=1770738404;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wdhof5UcFa0LauNDEG7A5hw9JfGF2S2FIbHiIBJlkVI=;
 b=BicWt1SgccNuf+xGLD+9+5PXBmRi05n5mKWtwaxUfJojW+npWALY9+Vh3gPXn2kzr1
 NI6IBoSCgdZdr1X6zdcIGcj9CR1FrUKnxUFSrxTuP5TH3u+zjOYGG25p8/FO0yEzTI3y
 YiDXPlKnddi32ByJAYzAdigUQwuZvGuDKh4sEpeoZ79byg23WIOONOMFztA+JOElbwCY
 dHdbqlThiAGnVoImwYjwdP3+oMVjx5J9kPeuBNCcicyL1Wr8LMAU8eMTnWcEpQFQrSxd
 5XGyavFFG+OP8jJS5hZ6YCdTXdyCPpO+9JtrZnzoXAg+Sl4+j9EJGc5jN3Jl3w5JlIwW
 tljg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKVHt5HP8LbeBg90AexBBq9XUKr02QZ5WFR0SJCjhIrCmViC/6Vqk5/uVEMSCHPXSwkW3qZE/7Aww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxubrvTxJjyR5kyIfqxRZhh6yU1vKLgoG62/mKzA0oTIY3M24BF
 KYxj4d5Sw5GXn8LCKZ0dwmTigKAUAXDvj4PJNWnZ+J1DEyA3SZYFtJ0Fy1fcNR0nMxiU1KFJZ6W
 y1oiUbKnxcw==
X-Received: from dlcip4.prod.google.com ([2002:a05:7023:c084:b0:124:a6e8:e9eb])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:6281:b0:11b:9386:8271
 with SMTP id a92af1059eb24-125c10081bamr8120436c88.46.1770133603693; Tue, 03
 Feb 2026 07:46:43 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:34 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519;
 pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=2442;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=WtZdKvjX12D2Jmn1kMkn/+vs+NvlqXqrgcd1O83Ixd4=;
 b=y1zunl2p/I9o6cmWUb2NnYfAPstnO8iv9BQaW1CxpWleUmklNBei8N2Of6dN4lKwNKIrkORJy
 w7+q2IWbzENDidaJ41cve7e/37dXsY/YHczM8JnE76IbaJ4tUPyi7qM
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-5-d6719db85637@google.com>
Subject: [PATCH v2 5/6] rust: debugfs: Allow access to device in
 Devres-wrapped scopes
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
X-Rspamd-Queue-Id: 8670CDB7B2
X-Rspamd-Action: no action

This adds support for creating a DebugFS directory which is aware that
it is bound to a device. As a result, callbacks under that directory
have access to a bound device which gives them efficient access to other
Devres, ability to use dev_err! and friends, etc.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index d7b8014a6474698235203f2b7d8fec96f2bb43f8..ac614d693fa73929d095b669e9ba61958bec609e 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -11,6 +11,11 @@
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
 use crate::{
+    device::{
+        Bound,
+        Device, //
+    },
+    devres::Devres,
     fmt,
     prelude::*,
     str::CStr,
@@ -722,3 +727,38 @@ fn new(name: &CStr) -> ScopedDir<'data, 'static> {
         }
     }
 }
+
+impl<'a, T: 'a + Send> Devres<Scope<T>> {
+    /// Creates a new scope, which is a directory at the root of the debugfs filesystem,
+    /// associated with some data `T`, enclosed in a [`Devres`] for the provided device.
+    ///
+    /// The `init` closure is called to populate the directory with files and subdirectories. These
+    /// files can reference the data stored in the scope. Because it is stored inside a `Devres`,
+    /// the init method is granted access to a `&Device<Bound>`.
+    ///
+    /// This can be used for cheaply accessing device-protected data inside DebugFS methods or
+    /// accessing device-specific methods (e.g. [`dev_err!`]).
+    ///
+    /// The entire directory tree created within the scope will be removed when the returned
+    /// `Scope` handle is dropped.
+    pub fn dir<E: 'a, F>(
+        dev: &'a Device<Bound>,
+        data: impl PinInit<T, E> + 'a,
+        name: &'a CStr,
+        init: F,
+    ) -> impl PinInit<Self, Error> + 'a
+    where
+        F: for<'data, 'dir> FnOnce(&'data T, &'data Device<Bound>, &'dir ScopedDir<'data, 'dir>)
+            + 'a,
+        Error: From<E>,
+    {
+        Devres::new(
+            dev,
+            Scope::new(data, |data| {
+                let scoped = ScopedDir::new(name);
+                init(data, dev, &scoped);
+                scoped.into_entry()
+            }),
+        )
+    }
+}

-- 
2.53.0.rc2.204.g2597b5adb4-goog

