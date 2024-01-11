Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABAB82A9A4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F3A10E829;
	Thu, 11 Jan 2024 08:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id DBAB110E7DA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=FRfjuPEp7SDJ4XD3M8
 xRYyAIebQ9Wi4nXcaxaXpRxH8=; b=T5rcyGSRRbf63M3pk5j3zAvxuwtPbywgdp
 ahJzFUjwD0t0TILrKH1bqysEGeNSdelENEL7NzyVmj6G04iYsuA4cUYu3zQL8tWU
 Bhr1ud1a27TMD/uvcIKLhjjG9uykcq54Ca6FSE45NFQqyv/D5BffvMEyik1dZW2V
 QQzkET2fs=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wD3PxKOlJ9lRoMNAA--.3099S2; 
 Thu, 11 Jan 2024 15:11:10 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: mripard@kernel.org, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, tzimmermann@suse.de, daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: Clean up errors in vmwgfx_streamoutput.c
Date: Thu, 11 Jan 2024 07:11:09 +0000
Message-Id: <20240111071109.9779-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3PxKOlJ9lRoMNAA--.3099S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrKw15uF48Zryrtr1kJw15twb_yoW8Jr48pr
 s0k345Kr1SyFy7tFyjkasYqF9093WkAFyI9ry5u3sxZw12kr18tFW5JrWFyr98GF43Zan8
 JF48t39rWry8ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UF38nUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEBNi1mVOBk3hWAABsv
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited before that close parenthesis ')'

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c b/drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c
index edcc40659038..3daff9537bf8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c
@@ -96,7 +96,7 @@ static int vmw_dx_streamoutput_unscrub(struct vmw_resource *res)
 		SVGA3dCmdDXBindStreamOutput body;
 	} *cmd;
 
-	if (!list_empty(&so->cotable_head) || !so->committed )
+	if (!list_empty(&so->cotable_head) || !so->committed)
 		return 0;
 
 	cmd = VMW_CMD_CTX_RESERVE(dev_priv, sizeof(*cmd), so->ctx->id);
@@ -363,6 +363,6 @@ void vmw_dx_streamoutput_cotable_list_scrub(struct vmw_private *dev_priv,
 	list_for_each_entry_safe(entry, next, list, cotable_head) {
 		WARN_ON(vmw_dx_streamoutput_scrub(&entry->res));
 		if (!readback)
-			entry->committed =false;
+			entry->committed = false;
 	}
 }
-- 
2.17.1

