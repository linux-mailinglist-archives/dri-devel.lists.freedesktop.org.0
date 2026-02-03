Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBpJL2cYgmmZPAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:46:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D73DB7AB
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A7910E6D8;
	Tue,  3 Feb 2026 15:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ubp+mG2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com
 [74.125.82.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B281910E6CE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 15:46:42 +0000 (UTC)
Received: by mail-dy1-f201.google.com with SMTP id
 5a478bee46e88-2b795cff830so18085153eec.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 07:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770133602; x=1770738402;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=yriD2nT/Os7MHztKIgeqU92FBaPsLQ1akZyLJCP9KTY=;
 b=ubp+mG2UnLPiQd9vGDc23KqZB8C1XPWNE1dtNjHg7a1x1IfEQcS/Mi95iVSLryhmhd
 YYo+UliwJbXEfsE5PW2oC9uBslAIL1QApRoPmDg8OaeGmNwbvWGCQY/c+i4SYwpFzOl5
 oT71A/ZUin9jmibErX21Snb5fIS8iQf2hLTz9K0+9Kv0jDXcuPuVeHPCEuGY14ypmMPZ
 RXS/bMyj/m2VJQH3eDPG6GHh7qWAZ89fWbECNMqt8R/RG10LZNorn3YLvgixSy716n0a
 ZM/bA8ammCARLnF12bqodT+8x8qR4oPN3Fq4dRgassD+c87gYMOBmJcYnA9i5Hc+qVB+
 f8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133602; x=1770738402;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yriD2nT/Os7MHztKIgeqU92FBaPsLQ1akZyLJCP9KTY=;
 b=NzGp9ILo1ihtckXvGoESHB9wy9OQ8ocyTKY6OUufySPn+xdz5B2AYR4X2QKolvwkE0
 JmSgpcv39FsTHh0WrbrJhqBCQMZM6I8x9L9aA5j4zRn4fGrGVwmXufvw9sVo000rNVe6
 N+4FTuRAmmMmR8PRWBc9mThI4BSagVXKDsCDMLdLMV7znA9kVjBSuUMRbPcpJ/ap3fFB
 l03aPyZZOj4IjFTI4I7eNd9mY4DHMpYE4vv8Cuog8DgWGN3wXtS7j31ioDsDmx+QUMBM
 zIeRHlDdESjNIfvKx6pY8xuXHBzTEqrVLsIL7+s3emcKW+15zUloRcMTzDkjJNOK6CEy
 S74A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXayD4zdPQbDFS+EUArJRpg8EKdLrpHjKlLKdJfN3ZnV5W8WIvnZMQohCRLw+vCywRbRMHJKfRUABM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwU5xrDdgJuU3JspZZlMsjRVtIOH4jO1GOOgz+6fyvnnzNCjEqX
 maEowPhWfqMQR6BHh5Fmf7GcZJkyqIwqpH/N7GJtGh5qqU8q9KgCA4PQgDHx7c94RYIWlmlUCOW
 QXuahS9YFtQ==
X-Received: from dybhk18.prod.google.com ([2002:a05:7301:2892:b0:2b7:d91:b4a2])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:7491:b0:2b7:f28d:c8c1
 with SMTP id 5a478bee46e88-2b8327328c7mr4126eec.0.1770133601984; Tue, 03 Feb
 2026 07:46:41 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:33 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519;
 pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=1096;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=sLbxFTX2mTYV2vSHOwak0YCZYcQva6hVw82FQCeYKlk=;
 b=lrUfeO8BzxGoH2q0cLzXZitIHc5mxhrmhIP1EvIGlTolROpSubzosdu4ukDgERhXMbVdgqt6B
 hy4MuPfZ3YMDwryq+n6Z7b1/52uJBUTXJBD7xC/OlPQKkhC26hmI+cu
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-4-d6719db85637@google.com>
Subject: [PATCH v2 4/6] rust: auxiliary: Support accessing raw aux pointer
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
X-Rspamd-Queue-Id: 65D73DB7AB
X-Rspamd-Action: no action

While it's preferable to add bindings in the kernel crate rather than
using raw pointers where possible, access to the raw aux pointer is
required to pass it to C interfaces provided by a driver.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/auxiliary.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 93c0db1f66555c97ec7dc58825e97c47c0154e54..1a88277f0fd9ea5ff32cc534dfe5682009de94c2 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -237,7 +237,11 @@ pub struct Device<Ctx: device::DeviceContext = device::Normal>(
 );
 
 impl<Ctx: device::DeviceContext> Device<Ctx> {
-    fn as_raw(&self) -> *mut bindings::auxiliary_device {
+    /// Returns the underlying auxiliary device
+    ///
+    /// Prefer to add bindings in the kernel crate for any use other than calling driver-specific
+    /// functions.
+    pub fn as_raw(&self) -> *mut bindings::auxiliary_device {
         self.0.get()
     }
 

-- 
2.53.0.rc2.204.g2597b5adb4-goog

