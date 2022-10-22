Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5C26084ED
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 08:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF1810E241;
	Sat, 22 Oct 2022 06:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100C710E241
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 06:07:16 +0000 (UTC)
X-QQ-mid: bizesmtp62t1666418829tqj9mya4
Received: from localhost.localdomain ( [182.148.15.254])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 22 Oct 2022 14:07:07 +0800 (CST)
X-QQ-SSF: 01000000000000C0E000000A0000000
X-QQ-FEAT: vqKIKKdRGsxDH5i+9QIw5s1dQzvr+IZCA0gIoU16ztiaT59WKq8wUX+0LbcR0
 yMA/pJnmYjsuLH5NDDv9uGhlb1XKpdptLRAu9sOmWomcyrBGZcBvjPPSiLtah4Z788oPgpL
 f1GyRAmfG7xzzWb1diH6u+zh3j9Ruftv8aPIy7vT5WYsl8kxbGWhPRnOVDmNGCI0qY0xBvU
 Jrnhw+TO8/tgDOq7l8Cf0o0FJN+MeiJShVh6RaaHAE5RHe2HBJzkExi5kpeSE5t0ELVAGio
 cfEJyzLTqzcz5yBPv7jFGR22oJBph7VhtyOwDscRM/8jLZ4cpjf0aayqP35kmm9U2uGX6Lt
 fnboXCXDwhlZkW4X2EKUSEQPk83CCtsYw7sS5YCgvHixJOVeRc=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu/drm: fix repeated words in comments
Date: Sat, 22 Oct 2022 14:07:01 +0800
Message-Id: <20221022060701.58280-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
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
Cc: wangjianli <wangjianli@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'the'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/drm_rect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_rect.c b/drivers/gpu/drm/drm_rect.c
index 0460e874896e..85c79a38c13a 100644
--- a/drivers/gpu/drm/drm_rect.c
+++ b/drivers/gpu/drm/drm_rect.c
@@ -80,7 +80,7 @@ static u32 clip_scaled(int src, int dst, int *clip)
  * @dst: destination window rectangle
  * @clip: clip rectangle
  *
- * Clip rectangle @dst by rectangle @clip. Clip rectangle @src by the
+ * Clip rectangle @dst by rectangle @clip. Clip rectangle @src by
  * the corresponding amounts, retaining the vertical and horizontal scaling
  * factors from @src to @dst.
  *
-- 
2.36.1

