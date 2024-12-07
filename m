Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DADC9E8098
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CF710E2FC;
	Sat,  7 Dec 2024 16:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b2VXD5T0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5121710E28D;
 Sat,  7 Dec 2024 16:17:19 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-724ffe64923so3595092b3a.2; 
 Sat, 07 Dec 2024 08:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588238; x=1734193038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+uFEdHLp4VUZbVW3eaLyXZ1CLYX+lqZJRxIQr83XVZ4=;
 b=b2VXD5T0GfRrNvEcCJf7y5s5y/oFv/2obNgIBqWXQ0VJ4qem9C9XzuJqTiMDEdpCJd
 22yZaYEI8xuWYsuJOfWaN3aehJcfAmaJ31QL533/F/b5a+r/g8FRImBCDiXSfCej77ex
 kfRh/lBGjpa73zWpf7aG8jqnD/XBeM9HBz1C/Cdx94S1iMkLLJvYLfUqX7ai+TA+x9v4
 khxqZu/X2c+bg7R/lAc3A6DtV0L2N0Y1W7F2JmUeUtUmHJf5PCev8Kd+W2fsYJqRfrUg
 0JjGLDRJfKYqknyhQkKsBaAval13VEWInjxAShxXeCkmLcIx1SNpXizpQ/vSaHxb5FBF
 hsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588238; x=1734193038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+uFEdHLp4VUZbVW3eaLyXZ1CLYX+lqZJRxIQr83XVZ4=;
 b=G2svvlv2OfbgDFQv+k5zJwgRy45O+IIRXP+WJ5EUGB/13ZhTNUrndF8RXR6GTCBsow
 by5l+DY3524P8lti4+9Wlb6rXU/E3aqhcUEg96aWb0liCs4wEpjUP51I9+CNTRAx30PE
 RG5W9TTe8IoiChQPjP0X+vVqGtOu0/cUNT5CPNp5IBkHnYgv6RCP1v1XP2Ifufpu76C8
 jzXkH+mqoBEUVhAuYt8fXBuhTy4oSOLuYPOuC/7/7isR6JQ0rIUufB7exLydLaoqEluK
 Tr6+Hp1A27vOl7kxq/254y6gTOl3pwtsgm/c2p0HHAkl63S0E7V5wxcjxUbFZBwByvUq
 qlFQ==
X-Gm-Message-State: AOJu0YzX435HKwu9/tblubNZmaJ7HrblMH/ppEIrHRgwnYiE5WEqmfZV
 7cIHBNTFVyaekY3EXS6wfm7e//FPP0+6eHbbD//EZ+3YaIFO4zRilGpjww==
X-Gm-Gg: ASbGnct1M/NKudE3aKiuF5u+lW+dJOcADCjtABcKhe202XLnQvbcJFSUOjxuNMa1YEC
 PAaaA0B1sPoSb64DmR71Paw8KsVRP3rkM/9TAUN6IOXSJ7ytIsMzHBHqY/81z/I3MgWHhc66XqU
 XhiMDr4rYCNXRdeGfF9QLjgwZsqtj49ElcRNeJqxZumgf9NsetgZm++zUTwEIciD5kjbRXjzX+p
 N7FTnkeb5GmUmIHTC/6c73v4NF6TSnc9icBTiK6N0x1ep3W8SQW80/UtACO6Dzjo5rUPiTMOIyd
 ELuozmEz
X-Google-Smtp-Source: AGHT+IFzlQQnmd+Nye1RouxY4f7B/5e6cN53cpBTcztHP8nFGwlNi+lJxK+QOrngvG79eePW7ncK3g==
X-Received: by 2002:a05:6a20:734c:b0:1e1:9fef:e976 with SMTP id
 adf61e73a8af0-1e19fefeb02mr485499637.23.1733588238404; 
 Sat, 07 Dec 2024 08:17:18 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e2f2d5f0sm68691b3a.40.2024.12.07.08.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:17:17 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [RFC 02/24] drm/gpuvm: Don't require obj lock in destructor path
Date: Sat,  7 Dec 2024 08:15:02 -0800
Message-ID: <20241207161651.410556-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
msm_gem_free_object()") for justification.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..1e89a98caad4 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	if (kref_read(&obj->refcount) > 0)
+		drm_gem_gpuva_assert_lock_held(obj);
+
 	list_del(&vm_bo->list.entry.gem);
 
 	if (ops && ops->vm_bo_free)
@@ -1871,7 +1873,8 @@ drm_gpuva_unlink(struct drm_gpuva *va)
 	if (unlikely(!obj))
 		return;
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	if (kref_read(&obj->refcount) > 0)
+		drm_gem_gpuva_assert_lock_held(obj);
 	list_del_init(&va->gem.entry);
 
 	va->vm_bo = NULL;
-- 
2.47.1

