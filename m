Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CC187206A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 14:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417ED10E266;
	Tue,  5 Mar 2024 13:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O6HrI93Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70CE112AFA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709645938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11CPXNNF150pfEUFPWGbUJ1IKwl89RXoTZySYxmoYV8=;
 b=O6HrI93QwkG7/JiaZ2bi4bjyOJPS52JpflvpeTqaD56nILjD/Jg3ZfkH0HmLMRDM1p6aF1
 9eoXYEd+yfLavfOSYplOVSxUiOXNp985V5W2aPo5gLShtGuRcmlBzM/5RqoZQlUlDf/nIl
 tNq1W5VnWYdLA9d6aP3w4+LCMZFUtBg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-dNPiGzOrPN-Ag-HoWnmg5g-1; Tue, 05 Mar 2024 08:38:56 -0500
X-MC-Unique: dNPiGzOrPN-Ag-HoWnmg5g-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a2777fdf6d4so117018466b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 05:38:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709645935; x=1710250735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11CPXNNF150pfEUFPWGbUJ1IKwl89RXoTZySYxmoYV8=;
 b=ZvlpPzWQBc45CkphDb7VVTUa5EFMRrXKiGLgz5fjRZ+unEgdthehah6jBu7z8x/Tqe
 VbKBLnN1EujDGdlX3J5K5J89yIH0etxevPPi5kZeTDj50cXiulglZ+yyW9gltElYRy9s
 zODZBTDRgF8JSuhmI3uhwMCY6AY0eyKPqSDMdNL3aPEvfuxD22M5FD3s/yJPXeGvoIVz
 czxWphW1xCYjFopV+y9ULdAgANR7Xq6MiM+Rlx6s0CZS5cR6wd2NFbUlrl1XFCh0COu1
 /TKPKhDkmCroJuPKu63ezmypATAya7eGic5tMEEYUwGy0DHZ+1LqiYddxY+5eSPrQA9g
 F45g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwmUDJ6Du/W9sDQLm5CZL8faPmHBxMxsX9KFh4F2x+1+ejqrYoFlOqxDIOFLe/Q730bkJwV0rOr/jaM6kLLWvIsxv9cyqnHRxmVyiZ5vhr
X-Gm-Message-State: AOJu0Yzajf89kbUrF31Jqy0qSQf1qrp9NSiLPZTTdIT3raI3ycB1sjxH
 xG85e8YzbArT5V1VJtMl2eB4bpJNjM/VOpIVQmietaSS9nUmjJCkO+CSLgZ+4WfnQ0QP5VuN4rX
 K3Fl64/QmzgkH+B+yrzZFCip8bJrdXpu1ZLgF1nVuoBLfA+UooSqfiGrXsy+7CObsxQ==
X-Received: by 2002:a17:907:a68b:b0:a3f:161b:cc13 with SMTP id
 vv11-20020a170907a68b00b00a3f161bcc13mr402047ejc.7.1709645935539; 
 Tue, 05 Mar 2024 05:38:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGf3/3KYPfk68CgY/nW360g4A9tp+KNIVj9PFBRcH+lHdipruHA8YbSsz9ZbASe2wCJh5jOw==
X-Received: by 2002:a17:907:a68b:b0:a3f:161b:cc13 with SMTP id
 vv11-20020a170907a68b00b00a3f161bcc13mr402031ejc.7.1709645935129; 
 Tue, 05 Mar 2024 05:38:55 -0800 (PST)
Received: from kherbst.pingu ([77.20.15.65]) by smtp.gmail.com with ESMTPSA id
 wk16-20020a170907055000b00a4532d289edsm2641326ejb.116.2024.03.05.05.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 05:38:54 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>
Subject: [PATCH v2 2/2] drm/nouveau: move more missing UAPI bits
Date: Tue,  5 Mar 2024 14:38:53 +0100
Message-ID: <20240305133853.2214268-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240305133853.2214268-1-kherbst@redhat.com>
References: <20240305133853.2214268-1-kherbst@redhat.com>
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240304183157.1587152-2-kherbst@redhat.com
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
2.44.0

