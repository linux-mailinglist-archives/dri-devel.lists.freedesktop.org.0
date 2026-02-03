Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKTvKWYYgmmZPAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:46:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F02DB7A4
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C66B10E6CE;
	Tue,  3 Feb 2026 15:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2lAl5Rhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com
 [74.125.82.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271DF10E6C9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 15:46:41 +0000 (UTC)
Received: by mail-dy1-f201.google.com with SMTP id
 5a478bee46e88-2b74aff34efso10550372eec.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 07:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770133600; x=1770738400;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KdXVf1jtiVVdnaqb+rLnoB8/QmUjcxzniTwKjo2bXrU=;
 b=2lAl5RhiKcXPVUSPBKzUV2jJYcjcA4uUsTzcmPAu2uqzfwY4QOyLwOy82CyPqOcEA8
 hbigFeTeudSBZWJxFDPgJ5rW9TPWxL4M/0FCDvyaFbai0i5rF88uMEFJdhaFxnAlF2Yr
 xXzQcOqXlcn0ZDxyS1jHkvxenSf7+RYFNYf9iZQ0ewKMZ3r9fqq4+5sf9jY45DRXuYUg
 UhZaG8RaAk+nRl+j755QKrzXMn76PJAek4rJDDx23B2Cs1uwJtUnG00K2boIXXcuGBYz
 p3Vaa+WmzKo0u0UKm1SjUkjOnLW9lqGFiq89qbnkBzSEFnyWD7MXKxy8QqzaqIjPy3ca
 c4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133600; x=1770738400;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KdXVf1jtiVVdnaqb+rLnoB8/QmUjcxzniTwKjo2bXrU=;
 b=Ayzc+NTINls0rCHi8LDf+Z2XTWSeJebMi/ILiLxBiI5tKsuFzuSsGmGGP7kbZorPXN
 wy7SDPTAopp8WYebjWwSSa2neP14bPaDwmkOr280hbQ3h6cIUF+oMcU+FpGOCk9hluPn
 uDUMK3Ne6alX3A6JZVCzShXXEIEGy5bpALq7Uyi/HFLZsjnYAYT8baVxmsI2ek/03dhJ
 /FDQilQOSvDBNZfOxbVSF3bxtDCDXM6yH6Ln+s/gV6NI8QxxBSg53P3NlkSMIieLeB2h
 o7NuxMLuhbNST8LvB3hynxIERjY8o20tijTQTotatwM+7D5Z5eLWp+nkvH5pm2mv2OeO
 fNqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFFOXawcZWTFXIU7vqqAIsSz5iTavUT/4kqIuoeyEDogrW3NHFjhgP6GfYEGJA/OlCU/psSRKFjFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc/nYCk81oFYB8PY3lI8Y2AloqzABJJ2/EDM8IJvQSMzxUdgH/
 8ISWRL/klncPK6trrq/zT8JcA/SQOz3ty909B1yfEHNDQk8/OkzthVxrUT76bhCosU9CRjh2Dls
 3RnCQ9IRCIw==
X-Received: from dycrt20.prod.google.com
 ([2002:a05:693c:2d94:b0:2b6:c6a7:636a])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:3002:b0:2b6:c617:f795
 with SMTP id 5a478bee46e88-2b7c86663c1mr7418033eec.17.1770133600442; Tue, 03
 Feb 2026 07:46:40 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:32 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519;
 pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=2963;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=RwCJ/xEwqbjligRdRo7donBAUlsdrVxdbuTW9DJLV3g=;
 b=SQdCmaIOesp2nNqbcmI1qfM3G5NEMlAiTI7JoMUcwHSNW8vyq+fqK1lL17+OwnTzARN5rGU+z
 9PyU4DL3NSyDmB3rGdnOpkIMgMGTW/9HGTk/h/gqJgPbPfyQrUyBmYk
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-3-d6719db85637@google.com>
Subject: [PATCH v2 3/6] rust: device: Support testing devices for equality
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
X-Rspamd-Queue-Id: 56F02DB7A4
X-Rspamd-Action: no action

This allows device drivers to check if, for example, an auxiliary
devices is one of its children by comparing the parent field, or
checking if a device parameter is its own device.

Also convert existing `.as_raw() != .as_raw()` to  use this new
implementation.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/device.rs     | 8 ++++++++
 rust/kernel/devres.rs     | 2 +-
 rust/kernel/drm/driver.rs | 2 +-
 rust/kernel/pwm.rs        | 2 +-
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 94e0548e76871d8b7de309c1f1c7b77bb49738ed..aa10359d3ebdd1c99cc567a35b89f52ddb2ee050 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -516,6 +516,14 @@ unsafe impl Send for Device {}
 // synchronization in `struct device`.
 unsafe impl Sync for Device {}
 
+impl<Ctx: DeviceContext, Ctx2: DeviceContext> PartialEq<Device<Ctx2>> for Device<Ctx> {
+    fn eq(&self, other: &Device<Ctx2>) -> bool {
+        self.as_raw() == other.as_raw()
+    }
+}
+
+impl<Ctx: DeviceContext> Eq for Device<Ctx> {}
+
 /// Marker trait for the context or scope of a bus specific device.
 ///
 /// [`DeviceContext`] is a marker trait for types representing the context of a bus specific
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index cdc49677022a6b466e771d9d8cf3818ab9b9112d..20126daad193370868661b9412937937eda6d3c4 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -281,7 +281,7 @@ pub fn device(&self) -> &Device {
     /// }
     /// ```
     pub fn access<'a>(&'a self, dev: &'a Device<Bound>) -> Result<&'a T> {
-        if self.dev.as_raw() != dev.as_raw() {
+        if self.dev.as_ref() != dev {
             return Err(EINVAL);
         }
 
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index f30ee4c6245cda72ac72852bf9362736d8fe992f..497ef46028d560bc9649dbbdf69316ce4fce8199 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -139,7 +139,7 @@ pub fn new_foreign_owned(
     where
         T: 'static,
     {
-        if drm.as_ref().as_raw() != dev.as_raw() {
+        if drm.as_ref() != dev {
             return Err(EINVAL);
         }
 
diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index cb00f8a8765c8ec58ed78a73275b022b02bf7aa3..033f778909a2633acbc25d5a21a1c8a7b8e41a70 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -680,7 +680,7 @@ impl<T: 'static + PwmOps + Send + Sync> Registration<T> {
     /// calling `pwmchip_remove`. This function should be called from the driver's `probe`.
     pub fn register(dev: &device::Device<Bound>, chip: ARef<Chip<T>>) -> Result {
         let chip_parent = chip.device().parent().ok_or(EINVAL)?;
-        if dev.as_raw() != chip_parent.as_raw() {
+        if dev != chip_parent {
             return Err(EINVAL);
         }
 

-- 
2.53.0.rc2.204.g2597b5adb4-goog

