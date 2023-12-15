Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6208143C8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 09:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7434E10E33B;
	Fri, 15 Dec 2023 08:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D3A10E31C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 06:07:03 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1d32c5ce32eso10948485ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 22:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702620422; x=1703225222; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sl/MGXp1U5MDFkgrPsmaeRMSAGD9eidIYfifMeLoKI8=;
 b=hCZyGpTFwyQqLOD6hwdFXE6VbasI9xm5u5NE10zeqqQZFnLoenb7I+z39fffRiddjS
 Bi1f47FBH0PHKIUy7NzxwUYaum1XdWD9whugfT/g3mAGR2o6/FKd4i7EuYTalO6Tb+P/
 VKFpOSLvhn9N/JYL4b2lcN9CtJj+B/PsMOLoJDZrjT1BQcGhjA6jql7Jed091j5hxPW7
 S0RdtJkpZmsl7zJaBt61USBagxi21D9jwyEZDpYYEp3XUaniTSTcWbwNvC7wtN2FnW0+
 /FIb6Jl7mxU69XmV6bvhgbla/2qOl5dOmsRauknMrULJRDUCJgkFu/nudXtnph51cXBX
 t9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702620422; x=1703225222;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sl/MGXp1U5MDFkgrPsmaeRMSAGD9eidIYfifMeLoKI8=;
 b=njinHe9kqiEEg17aKY8e9n6oLw4b1gNf+m7t8IcP368UhjYRbE5UYFAJfIC7Ey6w4l
 nlZI1fWeHqszEjtfQsghIGrcJ0Y5lLwVg7gxvJqE1a+WpCarDV7gdHugBsLaIZis3BT7
 hqmqK5Nz2EGbDs9aN0qFIXNbkB+8aIldp87FEOo0OX9aT9TRFUWuPLq2vKeX7jSYW9ac
 TVJMRMfZ46e4Hdr9PcNWcoSqoa7Gc2B5TPq2g3qfP1j5ct9DXyvySc6LI658G+nzehvm
 QUUbgY+M7tk9azZmYwkADQSX3c2p+J5hTGssm9gImIOabP2EnXW4/clFon/xtgppS0sh
 Jcog==
X-Gm-Message-State: AOJu0YyYWG8LEEzdf3t6f8FUjzQgjxN9esdhLd0WT+tREFm2v55QpnbR
 W/lsxTTJjd4+4wzCCFP5ck2l9OBgZvHwDhTd
X-Google-Smtp-Source: AGHT+IGn5waI4kzFSgJWNCebQVQ9h6LycSBdt5bMWMtMhwDg52tEKqFTaUO4GtDyQQogiOrjRr5Rjw==
X-Received: by 2002:a17:903:24e:b0:1d0:4759:bb60 with SMTP id
 j14-20020a170903024e00b001d04759bb60mr15725492plh.26.1702620422477; 
 Thu, 14 Dec 2023 22:07:02 -0800 (PST)
Received: from localhost.localdomain ([202.137.218.19])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170902c19500b001d368c778d1sm2344726pld.213.2023.12.14.22.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 22:07:02 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: zackr@vmware.com, linux-graphics-maintainer@vmware.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH V2] drivers: gpu: drm: vmwgfx: fixed typos
Date: Fri, 15 Dec 2023 11:31:59 +0530
Message-Id: <20231215060159.555229-1-ghanshyam1898@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 15 Dec 2023 08:39:42 +0000
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
Cc: Ghanshyam Agrawal <ghanshyam1898@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed multiple typos in vmwgfx_execbuf.c

Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
V2:
Fixed some more typos suggested by codespell
and the community.

V1:
Fixed multiple typos

 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 36987ef3fc30..76aa72e8be73 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -127,7 +127,7 @@ struct vmw_ctx_validation_info {
  * @func: Call-back to handle the command.
  * @user_allow: Whether allowed from the execbuf ioctl.
  * @gb_disable: Whether disabled if guest-backed objects are available.
- * @gb_enable: Whether enabled iff guest-backed objects are available.
+ * @gb_enable: Whether enabled if guest-backed objects are available.
  * @cmd_name: Name of the command.
  */
 struct vmw_cmd_entry {
@@ -621,10 +621,10 @@ static int vmw_resources_reserve(struct vmw_sw_context *sw_context)
  * @sw_context: Pointer to the software context.
  * @res_type: Resource type.
  * @dirty: Whether to change dirty status.
- * @converter: User-space visisble type specific information.
+ * @converter: User-space visible type specific information.
  * @id_loc: Pointer to the location in the command buffer currently being parsed
  * from where the user-space resource id handle is located.
- * @p_res: Pointer to pointer to resource validalidation node. Populated on
+ * @p_res: Pointer to pointer to resource validation node. Populated on
  * exit.
  */
 static int
@@ -1069,7 +1069,7 @@ static int vmw_query_bo_switch_prepare(struct vmw_private *dev_priv,
  * object following that query wait has signaled, we are sure that all preceding
  * queries have finished, and the old query buffer can be unpinned. However,
  * since both the new query buffer and the old one are fenced with that fence,
- * we can do an asynchronus unpin now, and be sure that the old query buffer
+ * we can do an asynchronous unpin now, and be sure that the old query buffer
  * won't be moved until the fence has signaled.
  *
  * As mentioned above, both the new - and old query buffers need to be fenced
-- 
2.25.1

