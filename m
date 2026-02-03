Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJYuIGUYgmmZPAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:46:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16154DB79D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA8410E6CD;
	Tue,  3 Feb 2026 15:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="F0j/E3ww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com
 [74.125.82.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D304310E6C3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 15:46:37 +0000 (UTC)
Received: by mail-dy1-f202.google.com with SMTP id
 5a478bee46e88-2b7ef896edcso14447384eec.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 07:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770133597; x=1770738397;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=h/wJPUnQVMCcHAFscBghK0MQ8yiIElHndU1rZLXdeks=;
 b=F0j/E3wwxkAN8eyy5glzUPGcWqrTEEZ/BL6oqQz3xnd6jIBqSOVSlGAEBiS07MG6i+
 VabrQ7fFRCDgoTodn/vIAklBZwiRIYr3kTkyKWNxbr+V/MdWZp2eGSh1i35tgtGhf66y
 kg9dEVWEdNFeUtD2Y1k+bR5MV+esEd7wFQ08Ib7mkSDtbn1WeSF5cIS7WtlNbYjueaoH
 znOoBvAtWCK0dcJ4HIbIiDIg7psmfQ59FJiYMFv9QZnNmbSqxK0Ors1V7Fmg9XH7SMwF
 y9BM46IMwWZTFPdP2uX5AMy/lZpJ0ABfZ6AFJUOt28tGkrZcYxteZ+7FX/A1Q41zRLkm
 KbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133597; x=1770738397;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h/wJPUnQVMCcHAFscBghK0MQ8yiIElHndU1rZLXdeks=;
 b=eFZC34tmvBREQEAsMHB2drVfVHzmWtniQn9NZZdu9d3CEqIOEmGSWUlyI3DqbLbwRE
 SHSE5SjY7ZYFE966SSua78hYGWL9D0ecYEmbmPVIvSS0zACMeC7wi3MgCWPIDm89DfYk
 RdBr8pQRnf9YTu35dQFvIkgywuf0fd/ICWuYo0cSUk1mCXSOzeXop5CJ8xxBba6iTQz8
 aY9HsTZOKONlznvsJvFm97hBDuTOZsjOD9NhkO0YEQ2B+6uATaeacprpwNPEm3vVO4O0
 VE0KXSG62vvmgyhzaTrRywuljLZoQg4HMTuhB0OQX7kvWOH8CxI/EKIBYpeKJAzOr4dm
 Di5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkvaICSTc5xTXnkjmE1m7hhZuwBI2CWa2uTXuQ+XoGT8VJ/fru1TkRdplSTFhX48IG40zJkfC/Eqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmGiVPyP0rpFuxHZHPwbWJR0OWlOIfeoK9G8xztlV9npvhp0i1
 UJ+68fHe43lBFpN9QR73b7lVHq8Z07zjdbnq58XHSgooxfsn9tvYwG32QxWDPt6JpXlyU2Nk9Ur
 FkfuYfG4Iuw==
X-Received: from dybny37.prod.google.com
 ([2002:a05:7300:e825:b0:2ae:51e3:c162])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:7bc2:b0:2b7:20c6:36dc
 with SMTP id 5a478bee46e88-2b7c8960b21mr6824371eec.42.1770133597088; Tue, 03
 Feb 2026 07:46:37 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:30 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519;
 pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=1885;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=toV72FONVd+c77Jdi9/X05RZt7qiox3e/hnCpHZii2E=;
 b=HmKT9Wjpe5u2hTdJ2Tcoag2Ev49Zm6fhsS7eX/dQiAxY/wxuUniXmJdhtGMd67QiHayfpx34L
 0bkddcnyzhZATSmzQBb6PghYphGlfrft9E9n7goPvqOGq6riqINeZyj
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-1-d6719db85637@google.com>
Subject: [PATCH v2 1/6] rust: Add sparse_array! helper macro
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
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:mmaurer@google.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER(0.00)[mmaurer@google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_TO(0.00)[kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,linuxfoundation.org,ffwll.ch,samsung.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mmaurer@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 16154DB79D
X-Rspamd-Action: no action

An idiom in C code is to have an array of nullable values which is
partially initialized via `{ [0] = x, [7] = y}`. Because Rust expects
everything to be fully initialized, it does not have this idiom by
default.

`sparse_array!` allows declaration of `[Option<T>; _]` constants to
allow Rust code to more easily mimic the safe version of this pattern.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/slice.rs | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
index ca2cde13506196d46c9169aa6e4ab2ac42af6f5b..826b6f77f0d07775bd22837cc1773b59ec96936c 100644
--- a/rust/kernel/slice.rs
+++ b/rust/kernel/slice.rs
@@ -47,3 +47,40 @@ fn as_flattened_mut(&mut self) -> &mut [T] {
         self.flatten_mut()
     }
 }
+
+/// Create a sparse array of `[Option<T>; _]`.
+///
+/// This is intended for use when C code would write `{ [0] = x, [7] = y}` to perform partial
+/// initialization of an array.
+///
+/// # Example
+/// ```
+/// use kernel::sparse_array;
+/// const FOO: &[Option<usize>] = &sparse_array! {
+///   0: 10,
+///   7: 16,
+/// };
+/// assert_eq!(FOO[0], Some(10));
+/// assert_eq!(FOO[1], None);
+/// assert_eq!(FOO[7], Some(16));
+/// ```
+#[macro_export]
+macro_rules! sparse_array {
+    ($(
+        $index:literal: $value:expr
+    ),* $(,)?) => {{
+        const SIZE: usize = {
+            let mut size = 0;
+            $(if $index >= size {
+                size = $index + 1;
+            })*
+            size
+        };
+
+        const {
+            let mut arr = [None; SIZE];
+            $(arr[$index] = Some($value);)*
+            arr
+        }
+    }}
+}

-- 
2.53.0.rc2.204.g2597b5adb4-goog

