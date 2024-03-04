Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFED8709A5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 19:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B945D112475;
	Mon,  4 Mar 2024 18:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F6CFGq0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65781112472
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 18:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709577149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5HIrnHCNtl6Z247/wJhmk+Seyt/6rCNU1N0P0o1q0xY=;
 b=F6CFGq0Au7pf7hhYehgWO6Vw9g6M8JPZ7Q/LVuYdISR0M4UrJd0uNNxtQdtQcRTW6D4ZPi
 0Asgdy1l2UIcIvHxATewMt4G/sD/5HX/uZ+MmAlnY8xHyupq99jIlgU/Kte7hZwlxS1RS6
 5Olj3gBnfW629TetOEbZpOkUEITlmyA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-HD7XWihvOyO0veYglNf9EA-1; Mon, 04 Mar 2024 13:32:28 -0500
X-MC-Unique: HD7XWihvOyO0veYglNf9EA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a3ee9c08720so52100266b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 10:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709577147; x=1710181947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5HIrnHCNtl6Z247/wJhmk+Seyt/6rCNU1N0P0o1q0xY=;
 b=if4NHz85dE5UlfZaxeZKAqkjSdeMljaTaJpn5nmoU1+Lf4cAIUMkhz12VRDCUtAHDG
 EVKEoIIIhKkaDXHNY44UcOz2ZUJh2WygZhxzQ6QUDSdDVW25i3+9Wx4Q8I80o6UAU1vW
 x4SNePOrQFrZlr778LGgo9HtZgZGjrClnefiLyrXs7ijOsjMfDy9WCp7/am02i9bY6oS
 SnS/Jjbz/0hIhaV/oDxV+lNTTT4LmyD5TYb9/lb4x/KpYMEhdQQ/418IExC1HGhg0JDe
 9JUeNxX9UmHeaM3rJvImRd2mnvaQ79y8qm3LQltmTpmTQN6CWBGurIX4Jli1g3MHby/s
 4+VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtaig0NB5xo7XvFdWQfgLkAS1SHhasMtBA49USE4WGV8V+G430ecvD+XRJtXekSiVTLp6p1+lIMzhMQg/xBO4wFT7utjhbF2UMzO2PVAlc
X-Gm-Message-State: AOJu0Yx9h7DIfOuu2KVoQxCAApNHeTZeTBzFpvIrT3JyaLlax345DJyO
 Pwr6uk2r4HFmgcqgvA1J0ka/zqlYFaczQrlkn8Fo+kdhfolaM8oCoz4OMd12GADK9KOyKjW8tNY
 6RbW/RgVfmsszYqRDyAdyhgWxmK5OgmWPjT9sU6t0MzSvmCfB2nh1tCQqCcmjKqQnVw==
X-Received: by 2002:a17:907:8e8b:b0:a44:1bcf:4e8d with SMTP id
 tx11-20020a1709078e8b00b00a441bcf4e8dmr8867303ejc.5.1709577146862; 
 Mon, 04 Mar 2024 10:32:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHC/9uJQ7FdpOhZejxBiANmYZJHF+aXDDDzFon+9rcbVgig5VWeAqsBGKNqjOSPCQAW/3TuvQ==
X-Received: by 2002:a17:907:8e8b:b0:a44:1bcf:4e8d with SMTP id
 tx11-20020a1709078e8b00b00a441bcf4e8dmr8867288ejc.5.1709577146532; 
 Mon, 04 Mar 2024 10:32:26 -0800 (PST)
Received: from kherbst.pingu ([77.20.15.65]) by smtp.gmail.com with ESMTPSA id
 me25-20020a170906aed900b00a44efa48c24sm2705672ejb.117.2024.03.04.10.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 10:32:26 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>
Subject: [PATCH 2/2] drm/nouveau: move more missing UAPI bits
Date: Mon,  4 Mar 2024 19:31:57 +0100
Message-ID: <20240304183157.1587152-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240304183157.1587152-1-kherbst@redhat.com>
References: <20240304183157.1587152-1-kherbst@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Those are already de-facto UAPI, so let's just move it into the uapi
header.

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 20 +++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_abi16.h | 12 ------------
 include/uapi/drm/nouveau_drm.h          | 22 ++++++++++++++++++++++
 3 files changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index cd14f993bdd1b..92f9127b284ac 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -312,11 +312,21 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	if (device->info.family >= NV_DEVICE_INFO_V0_KEPLER) {
 		if (init->fb_ctxdma_handle == ~0) {
 			switch (init->tt_ctxdma_handle) {
-			case 0x01: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR    ; break;
-			case 0x02: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPDEC; break;
-			case 0x04: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPPP ; break;
-			case 0x08: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSVLD ; break;
-			case 0x30: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_CE    ; break;
+			case NOUVEAU_FIFO_ENGINE_GR:
+				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
+				break;
+			case NOUVEAU_FIFO_ENGINE_VP:
+				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPDEC;
+				break;
+			case NOUVEAU_FIFO_ENGINE_PPP:
+				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPPP;
+				break;
+			case NOUVEAU_FIFO_ENGINE_BSP:
+				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSVLD;
+				break;
+			case NOUVEAU_FIFO_ENGINE_CE:
+				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_CE;
+				break;
 			default:
 				return nouveau_abi16_put(abi16, -ENOSYS);
 			}
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 11c8c4a80079b..661b901d8ecc9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -50,18 +50,6 @@ struct drm_nouveau_grobj_alloc {
 	int      class;
 };
 
-struct drm_nouveau_notifierobj_alloc {
-	uint32_t channel;
-	uint32_t handle;
-	uint32_t size;
-	uint32_t offset;
-};
-
-struct drm_nouveau_gpuobj_free {
-	int      channel;
-	uint32_t handle;
-};
-
 struct drm_nouveau_setparam {
 	uint64_t param;
 	uint64_t value;
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 77d7ff0d5b110..5404d4cfff4c2 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -73,6 +73,16 @@ struct drm_nouveau_getparam {
 	__u64 value;
 };
 
+/*
+ * Those are used to support selecting the main engine used on Kepler.
+ * This goes into drm_nouveau_channel_alloc::tt_ctxdma_handle
+ */
+#define NOUVEAU_FIFO_ENGINE_GR  0x01
+#define NOUVEAU_FIFO_ENGINE_VP  0x02
+#define NOUVEAU_FIFO_ENGINE_PPP 0x04
+#define NOUVEAU_FIFO_ENGINE_BSP 0x08
+#define NOUVEAU_FIFO_ENGINE_CE  0x30
+
 struct drm_nouveau_channel_alloc {
 	__u32     fb_ctxdma_handle;
 	__u32     tt_ctxdma_handle;
@@ -95,6 +105,18 @@ struct drm_nouveau_channel_free {
 	__s32 channel;
 };
 
+struct drm_nouveau_notifierobj_alloc {
+	__u32 channel;
+	__u32 handle;
+	__u32 size;
+	__u32 offset;
+};
+
+struct drm_nouveau_gpuobj_free {
+	__s32 channel;
+	__u32 handle;
+};
+
 #define NOUVEAU_GEM_DOMAIN_CPU       (1 << 0)
 #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
 #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
-- 
2.43.2

