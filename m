Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB7lB2IcpmmeKQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A27101E6985
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E43910E09D;
	Mon,  2 Mar 2026 23:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="IxGNiuBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A78310E076
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 23:25:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772493913; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BogQtQr0xGVABOZ2DNkdB4YYDGCZZJwbjj17S5pd1YBBJAm3hK/qS2AmQSuO5z6BIl3FxNdSn8J2y20ojGUb3+AHcbLiqt+AeNRNFDR/YaWj8ad1fsa4RahQ/F5uyZKdV8xccqho5I3dXcMB8iC2oGiY0D/YSVdtLXGMQ430Q6A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772493913;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fEQDlRMrasKgPU5QpP7ZXP1eBZYjVkPBkfRG1OFa5Cg=; 
 b=UWbkkwr+n+p/u9UI9kMme53bJ1dwlWQ9dVjYDGXkKMye4vDVsQeVJpZsBnrrNjbvqn4nePuGwsHu3ynw2cgsBefR3rbWRTnRLHndlI4P+CnIvHjWIZFmQfHCKmBilKjyU3+PHuuoXqlhIk88BWhauzZ4u22ftwF1XecVo1+fbw8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493913; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=fEQDlRMrasKgPU5QpP7ZXP1eBZYjVkPBkfRG1OFa5Cg=;
 b=IxGNiuBaqwxJUhmzYJfp6uVI0G8oc41XsjVvv9Fbh1tDFhQ8f+BGDKHuRi6kFEvS
 pHrG7lVD0XYV0c+6UjieT5nxKf9icRlhWp6p+oVPG8hpS9GZvx9J/TsCSh7MKxVSBQM
 bOuu2IvuX1msM9kndBADr3NQFPh+Pvswc+KgcYdw=
Received: by mx.zohomail.com with SMTPS id 1772493911612728.389852300208;
 Mon, 2 Mar 2026 15:25:11 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com,
 work@onurozkan.dev, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 03/12] drm/tyr: rename TyrObject to BoData
Date: Mon,  2 Mar 2026 15:24:51 -0800
Message-ID: <20260302232500.244489-4-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260302232500.244489-1-deborah.brouwer@collabora.com>
References: <20260302232500.244489-1-deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: A27101E6985
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Boris Brezillon <boris.brezillon@collabora.com>

Currently the GEM inner driver data object is called `TyrObject` which
is a fairly generic name. To make the code easier to understand,
rename `TyrObject` to `BoData` so that the name better reflects its
role.

No functional change is intended.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Pick up Reviewed-by tags.

 drivers/gpu/drm/tyr/driver.rs | 4 ++--
 drivers/gpu/drm/tyr/gem.rs    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 4fff01478391..eccf36d601ac 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -36,7 +36,7 @@
 
 use crate::{
     file::TyrDrmFileData,
-    gem::TyrObject,
+    gem::BoData,
     gpu,
     gpu::GpuInfo,
     regs, //
@@ -182,7 +182,7 @@ fn drop(self: Pin<&mut Self>) {}
 impl drm::Driver for TyrDrmDriver {
     type Data = TyrDrmDeviceData;
     type File = TyrDrmFileData;
-    type Object<R: drm::DeviceContext> = drm::gem::Object<TyrObject, R>;
+    type Object<R: drm::DeviceContext> = drm::gem::Object<BoData, R>;
 
     const INFO: drm::DriverInfo = INFO;
 
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 0c488984d2ec..87f3890e4be6 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -15,9 +15,9 @@
 
 /// GEM Object inner driver data
 #[pin_data]
-pub(crate) struct TyrObject {}
+pub(crate) struct BoData {}
 
-impl gem::DriverObject for TyrObject {
+impl gem::DriverObject for BoData {
     type Driver = TyrDrmDriver;
     type Args = ();
 
@@ -26,6 +26,6 @@ fn new<Ctx: DeviceContext>(
         _size: usize,
         _args: (),
     ) -> impl PinInit<Self, Error> {
-        try_pin_init!(TyrObject {})
+        try_pin_init!(BoData {})
     }
 }
-- 
2.52.0

