Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2430590C75
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A67113E83;
	Fri, 12 Aug 2022 07:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D0BAFD0E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 15:56:50 +0000 (UTC)
X-QQ-mid: bizesmtp82t1660233403tyl386yp
Received: from localhost.localdomain ( [110.188.55.240])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 11 Aug 2022 23:56:35 +0800 (CST)
X-QQ-SSF: 0100000000200080H000B00A0000020
X-QQ-FEAT: ntUToVEOiWoVPRpveSlZH+C/roA2UqPB/y8XhP4iN2dSWbOjCT0FeQqVlLK8A
 HZ3ArrUUBx0AGwShvtWE4XkltAfd6RtAJVwuXZjkPdrYmzJMT53W8Tp2flCe/vAQNtLtv1B
 g28u0I78SSe7vTJFyHEr1TLkhe2lsCsE8UTgMyyY+DP5+x1zdopURsF1h6e+hsDMtROJ024
 HkoZNwuhkjP8XaAfMqVfeZ0oXYjOZc/d6x5RrlcgBJAHNrYVBfVnrrvUz8yUJIVN48g/roZ
 aor7wL8N862bQNzi5ljMuoyiw/lpIxRETahGJSnKsJAwIObGGWe7sdNBr3x/weIN+ZQCVku
 /iX/0Me1XZzVyrvW0TNaLGsN8T5XS30D9Oqjc8NYE2LUADxR2XO1CRpCOIssB0hLewCc6z2
 m0H1pXQRdMg=
X-QQ-GoodBg: 0
From: min tang <tangmin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: Fix comment typo
Date: Thu, 11 Aug 2022 23:56:23 +0800
Message-Id: <20220811155623.13661-1-tangmin@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Fri, 12 Aug 2022 07:21:22 +0000
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
Cc: min tang <tangmin@cdjrlc.com>, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The double `should' is duplicated in line 72, remove one.

Signed-off-by: min tang <tangmin@cdjrlc.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 1d1c8b82c898..7c04e8150fe2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -69,7 +69,7 @@ struct vmw_du_update_plane {
 	 *
 	 * Some surface resource or buffer object need some extra cmd submission
 	 * like update GB image for proxy surface and define a GMRFB for screen
-	 * object. That should should be done here as this callback will be
+	 * object. That should be done here as this callback will be
 	 * called after FIFO allocation with the address of command buufer.
 	 *
 	 * This callback is optional.
-- 
2.17.1


