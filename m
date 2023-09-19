Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E3D7A6DF8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8C910E2B3;
	Tue, 19 Sep 2023 22:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E26D10E2AA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VeWrNv6y0A8UxFC0LMaVVA7Eb9rkM6ihmiHF44TJExE=;
 b=Ho0wPt1EIb64B8plBIxUllReh6fIFwVZq655nGogiorbVCbSPFnLgOutkLCtVod57ihH6i
 bNMtOXDkSOzRqnB126TE8D1phtbGwYwVevj3UBMEqA4g3f3x8LPRVCuLDUyPpQepT1BU9L
 J5UWK6QaXpjoTBeWfHK9qYZSw+sJlLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-687-0Ns_hya6O_K3zMaJ2yMAyg-1; Tue, 19 Sep 2023 18:05:29 -0400
X-MC-Unique: 0Ns_hya6O_K3zMaJ2yMAyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0CAD185A790;
 Tue, 19 Sep 2023 22:05:28 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5884B40C2064;
 Tue, 19 Sep 2023 22:05:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 09/44] drm/nouveau/disp: rename internal output
 acquire/release functions
Date: Tue, 19 Sep 2023 17:56:04 -0400
Message-ID: <20230919220442.202488-10-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Kees Cook <keescook@chromium.org>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <me@dakr.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

These will be made static later in the patch series, after the code that
uses them has been cleaned up in preparation for GSP-RM support.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c  | 10 ++++++++--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h  |  5 +++--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 16 ++++++++--------
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index fb061144438dc..3ed93df475fcc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -89,7 +89,7 @@ nvkm_outp_xlat(struct nvkm_outp *outp, enum nvkm_ior_type *type)
 }
 
 void
-nvkm_outp_release(struct nvkm_outp *outp, u8 user)
+nvkm_outp_release_or(struct nvkm_outp *outp, u8 user)
 {
 	struct nvkm_ior *ior = outp->ior;
 	OUTP_TRACE(outp, "release %02x &= %02x %p", outp->acquired, ~user, ior);
@@ -142,7 +142,7 @@ nvkm_outp_acquire_hda(struct nvkm_outp *outp, enum nvkm_ior_type type,
 }
 
 int
-nvkm_outp_acquire(struct nvkm_outp *outp, u8 user, bool hda)
+nvkm_outp_acquire_or(struct nvkm_outp *outp, u8 user, bool hda)
 {
 	struct nvkm_ior *ior = outp->ior;
 	enum nvkm_ior_proto proto;
@@ -234,6 +234,12 @@ nvkm_outp_detect(struct nvkm_outp *outp)
 	return ret;
 }
 
+void
+nvkm_outp_release(struct nvkm_outp *outp)
+{
+	nvkm_outp_release_or(outp, NVKM_OUTP_USER);
+}
+
 void
 nvkm_outp_fini(struct nvkm_outp *outp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 1cd70868f2255..76d83fb9c6e59 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -77,8 +77,9 @@ void nvkm_outp_fini(struct nvkm_outp *);
 
 int nvkm_outp_detect(struct nvkm_outp *);
 
-int nvkm_outp_acquire(struct nvkm_outp *, u8 user, bool hda);
-void nvkm_outp_release(struct nvkm_outp *, u8 user);
+int nvkm_outp_acquire_or(struct nvkm_outp *, u8 user, bool hda);
+void nvkm_outp_release(struct nvkm_outp *);
+void nvkm_outp_release_or(struct nvkm_outp *, u8 user);
 void nvkm_outp_route(struct nvkm_disp *);
 
 struct nvkm_outp_func {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 0c4ffa3ffb288..828db77af242b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -141,7 +141,7 @@ nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
 		ior->func->hdmi->ctrl(ior, head->id, false, 0, 0);
 	}
 
-	nvkm_outp_release(outp, NVKM_OUTP_USER);
+	nvkm_outp_release(outp);
 	return 0;
 }
 
@@ -151,7 +151,7 @@ nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE]
 {
 	int ret;
 
-	ret = nvkm_outp_acquire(outp, NVKM_OUTP_USER, hda);
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hda);
 	if (ret)
 		return ret;
 
@@ -172,7 +172,7 @@ nvkm_uoutp_mthd_acquire_tmds(struct nvkm_outp *outp, u8 head, u8 hdmi, u8 hdmi_m
 	if (!(outp->asy.head = nvkm_head_find(outp->disp, head)))
 		return -EINVAL;
 
-	ret = nvkm_outp_acquire(outp, NVKM_OUTP_USER, hdmi && hdmi_hda);
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hdmi && hdmi_hda);
 	if (ret)
 		return ret;
 
@@ -182,7 +182,7 @@ nvkm_uoutp_mthd_acquire_tmds(struct nvkm_outp *outp, u8 head, u8 hdmi, u8 hdmi_m
 		if (!ior->func->hdmi ||
 		    hdmi_max_ac_packet > 0x1f || hdmi_rekey > 0x7f ||
 		    (hdmi_scdc && !ior->func->hdmi->scdc)) {
-			nvkm_outp_release(outp, NVKM_OUTP_USER);
+			nvkm_outp_release_or(outp, NVKM_OUTP_USER);
 			return -EINVAL;
 		}
 
@@ -203,7 +203,7 @@ nvkm_uoutp_mthd_acquire_lvds(struct nvkm_outp *outp, bool dual, bool bpc8)
 	outp->lvds.dual = dual;
 	outp->lvds.bpc8 = bpc8;
 
-	return nvkm_outp_acquire(outp, NVKM_OUTP_USER, false);
+	return nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
 }
 
 static int
@@ -219,7 +219,7 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 
 	switch (args->v0.proto) {
 	case NVIF_OUTP_ACQUIRE_V0_RGB_CRT:
-		ret = nvkm_outp_acquire(outp, NVKM_OUTP_USER, false);
+		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
 		break;
 	case NVIF_OUTP_ACQUIRE_V0_TMDS:
 		ret = nvkm_uoutp_mthd_acquire_tmds(outp, args->v0.tmds.head,
@@ -261,7 +261,7 @@ nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (argc != sizeof(args->v0) || args->v0.version != 0)
 		return -ENOSYS;
 
-	ret = nvkm_outp_acquire(outp, NVKM_OUTP_PRIV, false);
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_PRIV, false);
 	if (ret == 0) {
 		if (outp->ior->func->sense) {
 			ret = outp->ior->func->sense(outp->ior, args->v0.data);
@@ -269,7 +269,7 @@ nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 		} else {
 			ret = -EINVAL;
 		}
-		nvkm_outp_release(outp, NVKM_OUTP_PRIV);
+		nvkm_outp_release_or(outp, NVKM_OUTP_PRIV);
 	}
 
 	return ret;
-- 
2.41.0

