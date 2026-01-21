Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK6YIDC5cGmWZQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 12:32:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F275956068
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 12:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E2E10E1E6;
	Wed, 21 Jan 2026 11:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nIYwuvMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CC710E1E6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 11:31:56 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-658102e94c6so1462761a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 03:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768995114; x=1769599914;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=n0kCZZM6p+E0DmFtSo+zls4mReeu1EP5jRXjRI1bQ8M=;
 b=nIYwuvMmI+kVwtwYaWGBox226gyd/L/P/Q/7IcDkRFXKu2UMKCuOhLb0lvHRLaHVB2
 GV2HdIeuDk42wWhp8xNWgYEp2CfA9c3W6qest6je3n/4HFs5de34o9syCK+Yfo5bCOoU
 RA6Ouj99+GlxD9pg/NkX1sg/dFP4Jw3DzlRwtXz/0RyUcPKwf2GJl2SEpejaHNTCHHoc
 I8yin2jQaWj61TXszbX9f40U5Gjuw8sa9dK2eJQVh4UrkG0lBpIwTmJYW7p5qboj2/Ax
 KyeNnWRm9zi0ZHS9x0DQRQDn5t/LMllapBl+G7a/yU8cs3A/JRjfJwm2/U1eM0R4R8+9
 7Ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768995114; x=1769599914;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n0kCZZM6p+E0DmFtSo+zls4mReeu1EP5jRXjRI1bQ8M=;
 b=eackkyQhKsf+UiYXEO0NrAicB62EiKhZF1A6Gg33Z4WE/glz8y+Uzs+jBJkeqa6t3i
 GrFJUYPVpUuFqlIqNTEr3DW2Aaye4/B/rwqb1R3N5zTSJtdyfA03dctpssgzDEwVHE3c
 O2k00isqDwt+dwQIrQbSDphe00sv4Zaboveu6Tu5013e1kz9kVKW35NxwNr5ng8t2pky
 PWcR0fDL+wUHLoJZxk3tqyTShd2wEuzYmITP7PFOH2ZQ+0dcYfXS+Im/JnyEWHuh0NPV
 9aCM0iSzbnhkCfmuAvJE9QWVhgaCaw9FJz07pVdC1Dduc2hvPeAg6pV842AG2BMIye15
 Ilww==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6txhU4SMTLA0TOS8PjkhlUJp+jLMbb63E4xSCrm4wpsXz7R9Y6LxV7aAQAhAQb/ZzYeDx8Y1l5LM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVTMwGGd+NvxcC7VjLUsu6gZiTxEWTijHv4NR9p+GLtmX8GQOV
 zqjaxHAeoFUFF6D52E/1qo9kcp+aIGq7QSl4Gbv4ovxJiNd6QK7xbmAGp7sjYeqf+HNZqAgfD4N
 86kh7Fv5orOF4e1r5GA==
X-Received: from ejcb5.prod.google.com ([2002:a17:906:36c5:b0:b7c:eb5d:caa1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:6a1b:b0:b80:4108:f826 with SMTP id
 a640c23a62f3a-b8796aee516mr1388441366b.36.1768995114622; 
 Wed, 21 Jan 2026 03:31:54 -0800 (PST)
Date: Wed, 21 Jan 2026 11:31:18 +0000
In-Reply-To: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2156; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=1z0yLHaRNnuMNmurQRoqGqVcNNO3MBwRXrJ8DuvVV9s=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpcLkdj+BPjbRCtGqjLAHynwm2GJjp67dFSVfjd
 anNEQ9bBDqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXC5HQAKCRAEWL7uWMY5
 RjsRD/9Qa7uaYEVUkWWEcDspFV55uc+SZPuy6VeJHSgm6lIpAoBeIe9TRWGXbVwsPtXR8atAqUZ
 6t9+o5o1CyDD4mxImiOl9XaIBPgEFnb7f8p7sk0MdZz1VWVeHT4fb7g8kMaxvixsDBpMKnb6Zn3
 GDiOCx/DeiJc7Iiht2GwFqMhCi1BgX2HBCO6eAcEu2NhHCRU4PgSFRX7Cl0eLt2CDyyPR8wexgE
 yCT7T/XAqsyY2SYt/GEQxk9WadlOQvthMwJR8i3lmjVvcxjpbFHw2NWddFSiW2qASIuV5ld8+ZE
 SJYBqqjFi/6uGnQpMAMP/sTNAI/hkvDgtMUQNVSjlgkBAQ9QBQlNc9tYA66lUpNU0zeHhw4RM3x
 SFjSKvc2VsEeaEjc1StrUJNlI9arTrrTPdDj+/+0XwKNhhSo1BDXO7Lw72bQybhP7rBMyKbJlx7
 kHoswT/MmLHqMOHzcIRkAWrxkXPoFdNeaSoYqZn9DLXnZvC4fonDYEWKRawkmsODIpGtGSiY9PQ
 oxV1f1uEHAXQIbOqd7IVHN6TsgxkuXrtdD9WQ58ZdwaceTVxIIwyTSaYluDseGgYhj5nMnqXgjd
 pEl7iNsF7M9408d6h0GmH2rLYiRVlATdI4a6zywi6m+JA6V2ujhW87RI892nJJDfjwqGryE607x
 yBAC3Wr9u1PDhqw==
X-Mailer: b4 0.14.2
Message-ID: <20260121-gpuvm-rust-v3-2-dd95c04aec35@google.com>
Subject: [PATCH v3 2/6] rust: helpers: Add bindings/wrappers for dma_resv_lock
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>, 
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alice Ryhl <aliceryhl@google.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,asahilina.net:email,collabora.com:email,jannau.net:email]
X-Rspamd-Queue-Id: F275956068
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Asahi Lina <lina+kernel@asahilina.net>

This is just for basic usage in the DRM shmem abstractions for implied
locking, not intended as a full DMA Reservation abstraction yet.

Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Taken from:
https://lore.kernel.org/all/20251202220924.520644-3-lyude@redhat.com/
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/dma-resv.c         | 13 +++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 15 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index dd60a5c6b142ec2c5fd6df80279ab6813163791c..ed80dd8088bc60c67b02f7666e602e33158bb962 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -52,6 +52,7 @@
 #include <linux/device/faux.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-resv.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/fdtable.h>
diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
new file mode 100644
index 0000000000000000000000000000000000000000..05501cb814513b483afd0b7f220230d867863c2f
--- /dev/null
+++ b/rust/helpers/dma-resv.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-resv.h>
+
+int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
+{
+	return dma_resv_lock(obj, ctx);
+}
+
+void rust_helper_dma_resv_unlock(struct dma_resv *obj)
+{
+	dma_resv_unlock(obj);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0943d589b7578d3c0e207937f63a5e02719c6146..aae78c938b0b5848b1740fb3f2dc4b7f93b1a760 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -25,6 +25,7 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#include "dma-resv.c"
 #include "drm.c"
 #include "drm_gpuvm.c"
 #include "err.c"

-- 
2.52.0.457.g6b5491de43-goog

