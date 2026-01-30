Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AA9KiG/fGlVOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:24:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3660BBB8FE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A1B10E9FD;
	Fri, 30 Jan 2026 14:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jL/udimt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE3110E9FC
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 14:24:27 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4806e7c4220so18087535e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 06:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769783066; x=1770387866;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Fh9S7yV54xV/K3laFzFwLiYnpQQhQ4Nm8f/AYMtVUuA=;
 b=jL/udimtZBYaBbxaaUxxOqBXCh7ImMX7V+fVtjQMDibtL4bWQQ0Ebly/rwD8QBxSEv
 umV1qdypZ9UhJAIW89d5Fyzae41SQ/Rg5YsMAZEntxhTkCfGQ0il6jVwLDlNfz8rllBU
 ZNwpmEVIjhQhnuoRnq5m4anHCrhLHW3I7Oq36pI1ivsbiz9drN1u/GdEWta0++bWzCjb
 owl8zSyvGwQS4lfO7BvQmxb+AiWjWSmdIxT0/l1NaREaPeFzesDOMqMNizoCX5P1Suul
 68NK0mVQr6kqnb+Fz8rk35uhISKgH50fMP7BDiVRo4Ld/UboQ+ZsjnOns+UWnMXVmjan
 P6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769783066; x=1770387866;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fh9S7yV54xV/K3laFzFwLiYnpQQhQ4Nm8f/AYMtVUuA=;
 b=xHEo53IyGbK3Cf2UQC697l6FWhMz7TgQ5qd5DKraR6i8wx31qlVQl6b2o7sk3D1ixr
 di/iwIMVc7J9d5zqS2App8n67KUSdtpEf1RfUipLStOXBmjD/Ope+Rwu/no4RtmC722v
 AmDi/9f/Ph4I1ZJCqayj1tLn/SN5Q+4GLpwDNSsMkW65fVnXaFMY0esGa2xdVuhFk2Yv
 jdGWLfgr41lqhseRWAtWh7Vb2ftsmQphK9ie5AIpxp7ycPr3R7us8ODyobgij/YuE7IE
 WuSl21ikrSFuOUJ9bXqwxvCTVSF2eFK/PwFzRfOKd2pIe0/L6LCzIRMe6r+T69CA1xAZ
 vtjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhY/Le493m7DqbtgkYyWjuFoD4KO2yONo7c/f/JaEYLJwdxRIMmJgZoqZmFsw4lWEuqgFzKgN4DE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWenTq2zoX/ACYeC+RLNbidTTS2dczd4qUJ+7chwdOLqHYqKbK
 T98WYp680z2v0VdRmaU9e4E304SN6KFVSE4Nq5EzaTHRr18jHRrGGQsVMeI3x78HNX/8+gzQq7d
 rzCudSDo+SFRuV7O3Wg==
X-Received: from wmbhi15.prod.google.com
 ([2002:a05:600c:534f:b0:480:6b05:6b8e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b2f:b0:47f:f952:d207 with SMTP id
 5b1f17b1804b1-482db48c8a2mr36951215e9.19.1769783066519; 
 Fri, 30 Jan 2026 06:24:26 -0800 (PST)
Date: Fri, 30 Jan 2026 14:24:11 +0000
In-Reply-To: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2790; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=/ynqDc2nL4j3GmY/nB7jtyhKdp90gurfdQg25PJaHYI=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpfL8SCH4OjJAHyDSphTaLdJMNdcF+hUYl/QxDy
 Jl9WyDfD3CJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXy/EgAKCRAEWL7uWMY5
 RpAAD/9aqNKc1ryV2T6NERDr2GzUvpb5oetrSoGiMEv2TW+otQ+VvrJMKBTBLkXOpz56mIZ3R8X
 aSvRLQlYOL4DxXUVf7DICLvVF4lzEWsfc4NGGE9dMJkY98AJ5z+Xr3mGFDnftzX8wU/w/UaDZjl
 lTvxvdIrtRoXX7/awedOx/WGXHqyn+x1jQMgflEwaFlexQBcp1lkTjzMp4e8x090xPeZ9YZk5XM
 kiahskQQlPWCdaiX9iqQ1E2GTPYBsZto2PXYrzjeYwTELo0ebcVUjI86asMqAGesaDy9HQj/+6n
 rnN3+3rEvNJTMm4fgxaPtFItLFgQrLnWtdNjLfGXf6ayH/ZMq1MZM1tsNov1XJ+xo8mRiHs1nSQ
 gk9jk1TebJegcNhvp6RnyudUCZpYFKEbREe6BaOtqGgV6hXBG7nPo9Nr9PlCjVO7kA51rsL9cPb
 ri/PptsrdKIIMNV9bRzNK5+EVBVoO85H3SghP5OcOOgTucFjREpXzrZAiYFS5bHe9bk+9ksZFWZ
 E+HVuLxRbwXdy5oCUdr/dlQYsLU9Ds101wWgIWG6vNYS6134JuqIPzVnafKUhs4l0Jq9hrT3Sch
 nriDL7JwNU04A964jcfOziktOxTw42Miiykz9s/4hCx/M3xpdyS4PfDqdzxXa51k1wY3yLpuKvk
 n0pxGwBXwACvH8A==
X-Mailer: b4 0.14.2
Message-ID: <20260130-gpuvm-rust-v4-2-8364d104ff40@google.com>
Subject: [PATCH v4 2/6] rust: helpers: Add bindings/wrappers for dma_resv_lock
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
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
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.940];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[asahilina.net:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3660BBB8FE
X-Rspamd-Action: no action

From: Asahi Lina <lina+kernel@asahilina.net>

This is just for basic usage in the DRM shmem abstractions for implied
locking, not intended as a full DMA Reservation abstraction yet.

Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Janne Grunau <j@jannau.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Taken from:
https://lore.kernel.org/all/20251202220924.520644-3-lyude@redhat.com/
with __rust_helper added.
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/dma-resv.c         | 14 ++++++++++++++
 rust/helpers/helpers.c          |  1 +
 4 files changed, 17 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 618becae72985b9dfdca8469ee48d4752fd0ca41..8d44728261ffa82fc36fa0c5df3b11a5bfb4339b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7467,6 +7467,7 @@ L:	rust-for-linux@vger.kernel.org
 S:	Supported
 W:	https://rust-for-linux.com
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
+F:	rust/helpers/dma-resv.c
 F:	rust/helpers/dma.c
 F:	rust/helpers/scatterlist.c
 F:	rust/kernel/dma.rs
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
index 0000000000000000000000000000000000000000..71914d8241e297511fdf7770336756c3e953a4f4
--- /dev/null
+++ b/rust/helpers/dma-resv.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-resv.h>
+
+__rust_helper
+int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
+{
+	return dma_resv_lock(obj, ctx);
+}
+
+__rust_helper void rust_helper_dma_resv_unlock(struct dma_resv *obj)
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
2.53.0.rc1.225.gd81095ad13-goog

