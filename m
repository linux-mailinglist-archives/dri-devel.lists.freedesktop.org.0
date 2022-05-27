Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C7B53583A
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 06:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E08C10E7D0;
	Fri, 27 May 2022 04:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com
 [203.205.221.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE1810E7D0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 04:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1653625155; bh=klKsYD1Nj6hWz9O3S8o23IuwwKAdUpwpOif9gA33l4U=;
 h=From:To:Cc:Subject:Date;
 b=jrN+eUBffdBnnm1uH8RcfPjPGbByjtIAUxh1ABZJrAKNugqlm7dN52LncXZg68qJt
 r4wpx1XQE5oi2SAewL9M6sHGdnPCBIMukhD7vsXIGTXejUn8/dqGCC96pv9m4EtRur
 xDM+vZiVCC2H8MbHzlmDZHzhqlVOePwR7BP8yVEo=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrszc7.qq.com (NewEsmtp) with SMTP
 id 4CE074DA; Fri, 27 May 2022 12:19:14 +0800
X-QQ-mid: xmsmtpt1653625154tvoimzcqd
Message-ID: <tencent_40358B3D828B40AC0C4848516113CAB4BF05@qq.com>
X-QQ-XMAILINFO: NiDupExshEc7gdT0P42cVWnG1f2vuyL6AXgJG6TdCMU4IU+0kvNcK9aQAI8/Dt
 piV/o/aTN3zFns5aTN+D+QzPlagTbNDYogz52uoSw2j00XYKH5WXbPOOM7ha4LaUPXFS31wNhjWp
 HVdq28pz9WSSO5NO5n//vZCM1zgCssZTyczrrXMVG+fDTz6SLotf0rubY02rZFgs9TOGi4XrqXY8
 fATuvgXxin2VLywWYOVqldORE1o10vFYPrwn/BPj6g21O3LxTBYF5eakbJzfan/DL+CGfu71hn/9
 OHl1Ttutu7o1PG8VPXawFX8RQhDvVhz/9WcCbzNVhMcYUW9TZkQwU7O8PvitdSD74rYY68gXXHEm
 j8NozEbv1vJALcBvUtD9RpCcjtgAmdJuZTWzIHJWiQgLb8d0qmpYT9bYVk+Rx8FB94WfhC46wakL
 iwSXe7Q+MF34CW+LEo/UdNULwLsmeTlz16JgkoP+wYJOtNY83PSscs9IfV4a/2f2oCOIPQ1LJRle
 cf95xnZQ3MCIeozsn+koLCcAbPe/rNGCxx7EnU6O+8+heySDgwS18lVOkbWg07HpHjeG8R9XbUkb
 IxR2fX5OdbwQLgtAdOZFjl6dNXiD60Yd5IRyzUvUx0UHZhp+ZhLR9pW4yLh9ZxSHCwOtzxVcfJ8p
 Eal/T2cz5vejY2WciMI8gEmP0b74PcQWbBZLiZC8gQJnNw4SEjIqTol/FxPJLOQi5PJG97nVhPfL
 7ifgPYa6r16UuFWAfDy0dPYAP2kdGxXf3oojjvm27+lGPxfOx/RRAkvT6A4N525oJasmVR9PvG0X
 PDjgEwuZsagwekFBujfRfVBk2CwqIs8VgHexHSOtdL6txynB+8gw4/TyhHEmq5WzFkNQBH9j8Gt9
 sC9v/ed1l8FqHoUYJ3/KRF5XjVoyqyDg==
From: 1064094935@qq.com
To: David Airlie <airlied@linux.ie>
Subject: [PATCH 4/5] drm/mga: Fix spelling typo in comment
Date: Fri, 27 May 2022 12:18:42 +0800
X-OQ-MSGID: <20220527041842.1205071-1-1064094935@qq.com>
X-Mailer: git-send-email 2.25.1
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
Cc: pengfuyuan <pengfuyuan@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: pengfuyuan <pengfuyuan@kylinos.cn>

Fix spelling typo in comment.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/mga/mga_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mga/mga_state.c b/drivers/gpu/drm/mga/mga_state.c
index 5b7247b58451..023e0cf12ef2 100644
--- a/drivers/gpu/drm/mga/mga_state.c
+++ b/drivers/gpu/drm/mga/mga_state.c
@@ -712,7 +712,7 @@ static void mga_dma_dispatch_indices(struct drm_device *dev, struct drm_buf *buf
 	FLUSH_DMA();
 }
 
-/* This copies a 64 byte aligned agp region to the frambuffer with a
+/* This copies a 64 byte aligned agp region to the framebuffer with a
  * standard blit, the ioctl needs to do checking.
  */
 static void mga_dma_dispatch_iload(struct drm_device *dev, struct drm_buf *buf,
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
