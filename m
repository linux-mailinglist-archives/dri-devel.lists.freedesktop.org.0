Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGOsEBmacmnBmwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 22:43:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F556DE65
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 22:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2B310EADF;
	Thu, 22 Jan 2026 21:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c4JT8gCi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742D910EADF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769118228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAQV4O1UaX/OoIDeCzrBseKKhkGScnjnhRmZuyKIEn0=;
 b=c4JT8gCiBd6fnGtuu2FQGfER12rYw/aD16CRJYbjWFIxlfpEmTIK8wOayT4/dpXuBKyzja
 uMmsjE7sxzITizvWOCe/wFgufFF8cbkH5XGiHj9m4hdxcG/ZWmD/fYW8S0gQWCja4LyXnT
 37D18Z21yGL9Y7KtY1FGgTaYkR+EYnM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-82-Ld1vsUYTN9WFTl1Ae8tWlA-1; Thu,
 22 Jan 2026 16:43:43 -0500
X-MC-Unique: Ld1vsUYTN9WFTl1Ae8tWlA-1
X-Mimecast-MFC-AGG-ID: Ld1vsUYTN9WFTl1Ae8tWlA_1769118221
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DE4DF18005BB; Thu, 22 Jan 2026 21:43:40 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 798D530002D1; Thu, 22 Jan 2026 21:43:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: "Ewan Chorynski" <ewan.chorynski@ik.me>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Shankari Anand" <shankari.ak0208@gmail.com>,
 "David Airlie" <airlied@gmail.com>,
 "Asahi Lina" <lina+kernel@asahilina.net>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v2 2/2] rust/drm: Remove imports covered by prelude::*
Date: Thu, 22 Jan 2026 16:43:03 -0500
Message-ID: <20260122214316.3281257-2-lyude@redhat.com>
In-Reply-To: <20260122214316.3281257-1-lyude@redhat.com>
References: <20260122214316.3281257-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ik.me,kernel.org,google.com,ffwll.ch,gmail.com,asahilina.net,collabora.com,redhat.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:dakr@kernel.org,m:ewan.chorynski@ik.me,m:ojeda@kernel.org,m:aliceryhl@google.com,m:simona@ffwll.ch,m:shankari.ak0208@gmail.com,m:airlied@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:lyude@redhat.com,m:shankariak0208@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.291];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E0F556DE65
X-Rspamd-Action: no action

This just removes any explicit imports of items in files that are already
being pulled in by `use prelude::*;`.

There should be no functional changes in this patch.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/device.rs  |  5 +----
 rust/kernel/drm/driver.rs  | 10 +++-------
 rust/kernel/drm/file.rs    |  6 +-----
 rust/kernel/drm/gem/mod.rs |  6 +-----
 4 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 23c457c90a6ab..30116d78cabe0 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -12,10 +12,7 @@
         self,
         driver::AllocImpl, //
     },
-    error::{
-        from_err_ptr,
-        Result, //
-    },
+    error::from_err_ptr,
     prelude::*,
     sync::aref::{
         ARef,
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index c8ec5c0819a06..2940fece7d59e 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -8,15 +8,11 @@
     bindings,
     device,
     devres,
-    drm, //
-    error::{
-        to_result,
-        Result, //
-    },
+    drm,
+    error::to_result,
     prelude::*,
-    sync::aref::ARef,
+    sync::aref::ARef, //
 };
-use macros::vtable;
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
 pub(crate) const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
index 7dade6dfa1ba2..10160601ce5af 100644
--- a/rust/kernel/drm/file.rs
+++ b/rust/kernel/drm/file.rs
@@ -7,14 +7,10 @@
 use crate::{
     bindings,
     drm,
-    error::Result,
     prelude::*,
     types::Opaque, //
 };
-use core::{
-    marker::PhantomData,
-    pin::Pin, //
-};
+use core::marker::PhantomData;
 
 /// Trait that must be implemented by DRM drivers to represent a DRM File (a client instance).
 pub trait DriverFile {
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 56b7641b1405e..b4199945db378 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -5,7 +5,6 @@
 //! C header: [`include/drm/drm_gem.h`](srctree/include/drm/drm_gem.h)
 
 use crate::{
-    alloc::flags::*,
     bindings,
     drm::{
         self,
@@ -14,10 +13,7 @@
             AllocOps, //
         },
     },
-    error::{
-        to_result,
-        Result, //
-    },
+    error::to_result,
     prelude::*,
     sync::aref::{
         ARef,
-- 
2.52.0

