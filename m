Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9553F3994
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 10:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2DB6EB4D;
	Sat, 21 Aug 2021 08:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90A888F06;
 Sat, 21 Aug 2021 02:11:31 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id x5so8991490qtq.13;
 Fri, 20 Aug 2021 19:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMOMaJvaeTN/zMSoH+yottbjrmkkaZ//2BiPGEM7agI=;
 b=AqXuCh9/8Gm644jDgI2P8NHhFOE05XE2pP0Mi6OJqgKdrdFVIBYUokPuBPnApxJgFE
 3+VMh/BLiG9oQUQShDiF80pIoYwLiY+Yoq+7qTXfMQRAnMacSCNMqcYxSRO9byfG6yKc
 HJTu+WCwXBArb2J6MSFbJeHqjplAgWLLPl6k8HjMCvvRy3bVBCysfdwjg6tOOlm9OWZI
 /1F/JEl6klG1/zEap+9tln/P8wdOk1njxgbOyMsEXIX4CeSRFiRiYN8h7P27ubvEYB9q
 w//VOEHSFC/A/yb3h94Ea96VsypxaC4Aab+AotXxU73dzZkxgkD1nkyje9c4AJcxxbND
 HgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMOMaJvaeTN/zMSoH+yottbjrmkkaZ//2BiPGEM7agI=;
 b=ObONfN8tIsZ2N6C0T8Ud/IlO4kO1qgHQFRmDXapt5QD+ecQLCe1Eu3yKa05H8wK3t6
 JDQ+azgBBKPK7gqDldE+bHyRWAboQiyq9EKTr2gfCsmNMOQ1GcyY2VL1Ngk0SJPBWoGI
 wHs+UGcGM6vIntV4ISple6mJg1hBFibQD62wyUc3djDsCnKGlSnp+CuWyhNU3ruH4y6E
 HbZe2JYKxGn8fFF4r8xkLPGLCE+TjR2uRPDP2pKzWOg0xx80ynQhs196IIp3azrTQc7/
 bHQ8nO6wqsQtVAKsvZ1pmUVOX1tPTmF5saHey5O2cSKfkooSCtzfgfjhSvlcOIF//Ft0
 fNvw==
X-Gm-Message-State: AOAM532u/eWCvURGkWwMenyA0uzdxUX+O0wb2g+mtMwMBIxOeguafQ8s
 y2wPMg7mPfbDWXymo1iFNo8=
X-Google-Smtp-Source: ABdhPJx7jHQlITGbPG1pD7X0WSMeLJdpYKDi+OcXhx+LFEb+S4DIg5FSZMDGWs9MqJK+54Ikcn7Hig==
X-Received: by 2002:aed:2029:: with SMTP id 38mr20651107qta.71.1629511890769; 
 Fri, 20 Aug 2021 19:11:30 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id c2sm4186054qkd.57.2021.08.20.19.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 19:11:30 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <luo.penghao@zte.com.cn>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luo penghao <luo.penghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drm/nouveau/mmu: drop unneeded assignment in the
 nvkm_uvmm_mthd_page()
Date: Fri, 20 Aug 2021 19:11:06 -0700
Message-Id: <20210821021106.27010-1-luo.penghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 21 Aug 2021 08:46:30 +0000
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

From: Luo penghao <luo.penghao@zte.com.cn>

In order to keep the code style consistency of the whole file,
the 'ret' assignments should be deleted.

The clang_analyzer complains as follows:

drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:317:8:warning:
Although the value storedto 'ret' is used in the enclosing expression,
the value is never actually read from 'ret'.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Luo penghao <luo.penghao@zte.com.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index c43b824..d9f8e11 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -314,7 +314,7 @@ nvkm_uvmm_mthd_page(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	page = uvmm->vmm->func->page;
 	for (nr = 0; page[nr].shift; nr++);
 
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
+	if (!(nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
 		if ((index = args->v0.index) >= nr)
 			return -EINVAL;
 		type = page[index].type;
-- 
2.15.2


