Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F6C361306
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 21:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927EC6EAD9;
	Thu, 15 Apr 2021 19:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3686EAD9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 19:44:29 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id h10so29472592edt.13
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 12:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jCBFMV7+puiUW4LunOS5oSKSWBIOUTheXXT0UG7Gcbk=;
 b=X0B5rkgVr79wI8ut5bPZ3XPHutXSdLTS+Sk1vLBt7o9vA6QjC3ORXzft3tZ6ZJ2HiX
 Ee9PNMStMowOsMbUXFUy0GuCUBmpBgbkVhev6FuEbXjzFY1fOCyOw/QYFZcYdYddL7W+
 LBLzQFdoUFOtHd4M8eUANzl0lHt+PZHtXxRlZc/gybAiyH8cOZ1yU59Ldp8DGM+5UHUL
 SkeNxS4LKL2SbyOLt1R6pmEW4ROJ28BOXx2LjOjvP4nES06IwJ6J8J9LpGmFa8Rev6iL
 OXov9otGPXUI+UAiIHJpN5ReEbR5hJh2KnV91rHB1ve6c0P8fLyauVj2ipZY7WbWVWrf
 26tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jCBFMV7+puiUW4LunOS5oSKSWBIOUTheXXT0UG7Gcbk=;
 b=mtxJUJXv8PHmq+LlhNhOCfUKGW07mEgDsdISqj3q+JBON3psY8EEtQTKGeb+JvM6Yg
 wENONRvdytJF0pbjzWaq5DLt3lDmhhnhDkpKr5Y5V+lwGW5mxsuwH/lLt790dqjZTJNK
 OHc9U45kJZUjF/64QABz7lYgK/K7WcEdJn6OPfoMFV5xS+tYitbxKJkfzPTB5Ukr1Tik
 tzUztCs/4Q5LM1WoxkyWOG+cbriSeEsCkcQWS1qDk3TtVadjcDGJXGc2OXUNd49oHJNT
 x2JgcC+jwne5sPwPmlePRD6C5l4kLgRdsxwkRFclCn+GOIl1NOqAWEcLIn1aSZaQKJN+
 Fzyg==
X-Gm-Message-State: AOAM531hnrrqJejRS/X4BxTCoorUmmO5tDBgRfHKf1YmpUcNKekYkfJY
 Jr8qV54gXlN/C+WmtXr+hZC7f8z4U56L0pQ/
X-Google-Smtp-Source: ABdhPJyYUCh5+cv1V8efHfxGvhZXdEQ8sJ2CV837c5dToudSGe/n/cV6XQvLoZQYV7XJw7ix6OmyNw==
X-Received: by 2002:a50:8fe6:: with SMTP id y93mr6179609edy.224.1618515868019; 
 Thu, 15 Apr 2021 12:44:28 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id pv21sm2538207ejb.109.2021.04.15.12.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 12:44:27 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH] drm: nouveau: dispnv50: disp.c: Remove set but unused
 variables
Date: Thu, 15 Apr 2021 21:44:23 +0200
Message-Id: <20210415194423.4880-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removed two set but unused variables.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 196612addfd6..828f48d5bdd4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1386,12 +1386,11 @@ nv50_mstm_cleanup(struct nv50_mstm *mstm)
 {
 	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
 	struct drm_encoder *encoder;
-	int ret;
 
 	NV_ATOMIC(drm, "%s: mstm cleanup\n", mstm->outp->base.base.name);
-	ret = drm_dp_check_act_status(&mstm->mgr);
+	drm_dp_check_act_status(&mstm->mgr);
 
-	ret = drm_dp_update_payload_part2(&mstm->mgr);
+	drm_dp_update_payload_part2(&mstm->mgr);
 
 	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
 		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
@@ -1410,10 +1409,9 @@ nv50_mstm_prepare(struct nv50_mstm *mstm)
 {
 	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
 	struct drm_encoder *encoder;
-	int ret;
 
 	NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
-	ret = drm_dp_update_payload_part1(&mstm->mgr);
+	drm_dp_update_payload_part1(&mstm->mgr);
 
 	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
 		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
