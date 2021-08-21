Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 088FD3F3997
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 10:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EBE6EB54;
	Sat, 21 Aug 2021 08:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B049D6EB3D;
 Sat, 21 Aug 2021 02:14:57 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id d5so9021231qtd.3;
 Fri, 20 Aug 2021 19:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6STgSGZ0ne/Nx/83VAe+oOZszhRqsF3iqXGqkGSzJtQ=;
 b=QH1qTpBPHpaHV7ujU/tafTzRoGh3Yj6auyTQC+8KUQiQnhbcNjfyKdSu1OqGt1u1OB
 g+3fkf0YkOPjZNofYj6QR9OB+ErT1wb/e7tUIhOkPZUkLdCoUoWvStsvhDVWlBE+bQoE
 xNpYJnQOkP3Z3DotJCZBKVgNg53GOjo1IakiQxqgUKhmdqEdpvBHDrolfkkYB1dQHBRs
 3zM884eUF3ZbreP3E6cQI8ooF+VmTWWeUHPm9r98RKsN/yINGp4OXeJ69r//aolO6g4R
 ASCmlmOWGMyOLORz6Em9Z9pj2S6LzrltjZ4d87QF+vZhCsZg4l3csgeSgNqk5TOX504i
 2aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6STgSGZ0ne/Nx/83VAe+oOZszhRqsF3iqXGqkGSzJtQ=;
 b=ZWSJFNPC+IUcuOAWTkh7JmosPyDkJT02y1burRbVZT4glewBhAvp+xRI4RiqEkNoTE
 ZapbRi1JAzIxMUy8k0jGhD5lu7CYN4gxIknRe+va9lqVFjzRlRo91QkPvvJPiObl76oI
 9up0noq3i2wDOx0rUcg2+/+Iht4XelIBauZ5w7A/imOMzvFrrd+yKt97Ifez7eQ+iT+G
 H5BdrXFOW6Th05n75jkq+RQftinYgZ+puyqTEUpREuRm5hx74dtbDCvcPP+iQnEKjGBG
 XvrwwvzFf1WJbT6kHbffzDhQYd8k+Q1xMH02OCkVROn81dPZP/9bX/31vwPtjqQxKPVF
 t52A==
X-Gm-Message-State: AOAM530m0MvKHmxkmPbYJp2A9TNUsZx4os74+cAhqKhzJvgwFw3erinU
 cW9dG52jN9pHmOUTRKb8dDA=
X-Google-Smtp-Source: ABdhPJwAwcTplKmsBZ6biN522ujUKacGXgA8/tlud3TXc71xAg7CU2I/Q1v+lFMtuRmOPzvkXRa76g==
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr20523886qtc.229.1629512096831; 
 Fri, 20 Aug 2021 19:14:56 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id y13sm4495075qkj.37.2021.08.20.19.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 19:14:56 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <luo.penghao@zte.com.cn>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luo penghao <luo.penghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drm/nouveau/mmu/gp100-: drop unneeded assignment
 in the if condition.
Date: Fri, 20 Aug 2021 19:14:47 -0700
Message-Id: <20210821021447.27097-1-luo.penghao@zte.com.cn>
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
the 'inst' assignments should be deleted.

The clang_analyzer complains as follows:

drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c:499:8: warning:
Although the value storedto 'inst' is used in the enclosing expression,
the value is never actually read from 'inst'.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Luo penghao <luo.penghao@zte.com.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index f02abd9..5d7766a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -502,7 +502,7 @@ gp100_vmm_fault_cancel(struct nvkm_vmm *vmm, void *argv, u32 argc)
 	args->v0.inst |= 0x80000000;
 
 	if (!WARN_ON(nvkm_gr_ctxsw_pause(device))) {
-		if ((inst = nvkm_gr_ctxsw_inst(device)) == args->v0.inst) {
+		if ((nvkm_gr_ctxsw_inst(device)) == args->v0.inst) {
 			gf100_vmm_invalidate(vmm, 0x0000001b
 					     /* CANCEL_TARGETED. */ |
 					     (args->v0.hub    << 20) |
-- 
2.15.2


