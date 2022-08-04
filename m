Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD66589C80
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 15:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8423212B771;
	Thu,  4 Aug 2022 13:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC1B11A040
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 11:49:37 +0000 (UTC)
X-QQ-mid: bizesmtp74t1659613769t2zljze1
Received: from localhost.localdomain ( [182.148.15.41])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 04 Aug 2022 19:49:28 +0800 (CST)
X-QQ-SSF: 01000000008000F0U000B00A0000020
X-QQ-FEAT: DWSCcwW/aQZVWJjuyFZXThKOr/fN0z1ZLf3gMeSgEi3IPGYuYRWUTBNjaY7RQ
 MPuwtUXre6YkOreEnxkijQMFfpXjASipe7EbPpuv/h1NAg/Vhd3K1oQIHA/LbrOaDQ1QO6W
 O4vg8QXwqNXQx9b5GxaePui95wEuwW2uJNtSN4mkuorjv0ufNq9CrnjcBbZ9Vyn5N76wtyx
 dGaR9dWvjNJE5HyhkpbMkf1ydnYl9lbbfpkphFt7KDZixCF+uSTdAEhsGUZTawo8bVAuzL7
 vHK3fJ+p9EKr/v1YurSEvgW9QTKHi/ouIBbO3cyWW5+xPaMnryEiZ8N/FNJwNtjy/LrukPP
 QHE0QMpxpwTPc3KpMKYGFAneIvmKrtgMu34I3pnzHGgFdN3Ize6e4BmnZEGMghe5ImTLjqd
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: mripard@kernel.org
Subject: [PATCH] drm/mipi-dsi: Fix comment typo
Date: Thu,  4 Aug 2022 19:49:04 +0800
Message-Id: <20220804114905.47845-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Thu, 04 Aug 2022 13:20:57 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Wang <wangborong@cdjrlc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The double `the' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index c40bde96cfdf..fd2790a5664d 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -606,7 +606,7 @@ EXPORT_SYMBOL(mipi_dsi_turn_on_peripheral);
 
 /*
  * mipi_dsi_set_maximum_return_packet_size() - specify the maximum size of the
- *    the payload in a long packet transmitted from the peripheral back to the
+ *    payload in a long packet transmitted from the peripheral back to the
  *    host processor
  * @dsi: DSI peripheral device
  * @value: the maximum size of the payload
-- 
2.35.1

