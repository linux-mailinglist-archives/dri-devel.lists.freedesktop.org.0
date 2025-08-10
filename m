Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62871B20018
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF4910E381;
	Mon, 11 Aug 2025 07:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UxCG9OEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C48810E24A
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 07:40:36 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2405c0c431cso32274865ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 00:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754811636; x=1755416436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f3qWSqA6uMau46FnL/gjHf1qw0j0WRwZWdWAHLL5xbI=;
 b=UxCG9OEwUhC8JO3mxMdE1SyJX4s96w0+f0rr7oNMjOSJXuCjNfTyXp1Ig+7DUgE2XH
 Z1cmXaHMdGkhNSnCGA7mHGQqQChTTw0aWqtVs0ena+ejLrQAJljTngmzMfQfZ5/6QwvK
 Qyto1Q2NHC4xGFbcMevGOW9XirIHt8ES+2nheqS/SNuAcoTg5hneZKWR9Rk24fVZtsKF
 /TSdrjY88QHddepu7h4R1VnonUSZ4yDrKS7cr/JW1fHpjmnAUpnOE6VUE4YlXEbe3vcz
 r6d6MId565jVoLFm9QelIpFS4ZW5xoiTib+logeLGFcZS63PzD5pF2STQp5erCF8p7yb
 97Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754811636; x=1755416436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f3qWSqA6uMau46FnL/gjHf1qw0j0WRwZWdWAHLL5xbI=;
 b=STm4eoMYxwleNAi0zvAhKQPH+ZyLeKfsEbt+NgyNub+j9WWVNfvr9pfn/YBQGorpfv
 gB1gBGUmfLXp756yQzVwpzTRaeO95MLW/oGF7tHI3S7IkifjIlGPYTNxKflJN7Fq+JCo
 q0O8KhqQIu8Ly4CHAZSw7ZCEwTBiyX+yIm45ukW8xSAuobfnDroIkpUti53huSh2mXVI
 6+MFyUOK+lYA6KdvKjey/JiZwmae6w4cfx1fh1oLQI2iPYJK3nF7Q5zms3nfIVLKFy1p
 0Ku2oensxe8D8sIh+L3lYO26uAgoM1XxySwXd2th0XkJn1waIWXy++Ykzo2+jp3WIQ4x
 WHlA==
X-Gm-Message-State: AOJu0YxHkeqEpE/9fxQX0ZY0OWvnJPtPTFxxpvOAsFErjR6A2KJEJXu+
 JX7BTe/qksSyL7uygP8aGZcJfXliejx1K0UMP5Zm5RrmF1yGyZ6A/E6y
X-Gm-Gg: ASbGncvV8yV3RVaQyn6vSYDhIN9dj5NeOAnrLo56lQ8W5NDNFH2uhuANXhciwoxcpea
 o0CUyPjNCBlAmCNEmUxynWn/Ord2FTIw77WPywm0pjLalJzBfXYnv/xuEio6Djrtjnkc8AJUHMV
 7HTQ0yXNlElnIAFnxCT6DY6Fvu8UzNkOAkw+tO6/j+MHzbfBkozw7eO1OXBWAazrk2NlNvSros3
 uyljVliER3H7kX5YCFTVsuglReIyZBFEM8CLouYkPzGeVo+3ZBEoIYGWm/FNmMHJvWh0ocGG+b/
 q4ws/0ahJ7ZyN28LHGwiLYR/itf6b/8dlfOqFSKbTFVTPulM3y0pTCQo28QMv0YQ/LKtgTNDXAB
 SFCd/+t0aeVvyFeyLG8Lv7b3pzai0KH3Dig==
X-Google-Smtp-Source: AGHT+IHj8XJuZT+e8n3ptEvI4d1ZhTGMLL33JrSEDgad1N3hMltDmcEcAbLS/oGZI8f23DZetqYLKQ==
X-Received: by 2002:a17:902:ea0b:b0:240:b073:932b with SMTP id
 d9443c01a7336-242c205fe65mr120641005ad.23.1754811635618; 
 Sun, 10 Aug 2025 00:40:35 -0700 (PDT)
Received: from pop-os.. ([172.59.160.70]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976d13sm244105245ad.109.2025.08.10.00.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 00:40:35 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH] gpu: fix spacing and indentation in
 drm_gpuvm_sm_map_exec_lock description
Date: Sun, 10 Aug 2025 00:40:14 -0700
Message-Id: <20250810074014.339366-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 Aug 2025 07:12:55 +0000
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

Fixes:
./Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2444: ERROR: Unexpected indentation. [docutils]
./Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2446: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
./Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2450: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
./Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2451: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
./Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2455: ERROR: Unexpected indentation. [docutils]

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..17dafa01700f 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2441,21 +2441,26 @@ static const struct drm_gpuvm_ops lock_ops = {
  *        drm_exec_until_all_locked (&exec) {
  *            for_each_vm_bind_operation {
  *                switch (op->op) {
- *                case DRIVER_OP_UNMAP:
- *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
- *                    break;
- *                case DRIVER_OP_MAP:
- *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
- *                                                     op->addr, op->range,
- *                                                     obj, op->obj_offset);
- *                    break;
+ *                    case DRIVER_OP_UNMAP:
+ *                        ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
+ *                        break;
+ * 
+ *                    case DRIVER_OP_MAP:
+ *                        ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
+ *                                                         op->addr, op->range,
+ *                                                         obj, op->obj_offset);
+ * 
+ *                        break;
+ * 
  *                }
  *
  *                drm_exec_retry_on_contention(&exec);
- *                if (ret)
- *                    return ret;
+ *                if (ret) return ret;
+ * 
  *            }
+ * 
  *        }
+ * 
  *    }
  *
  * This enables all locking to be performed before the driver begins modifying
-- 
2.34.1

