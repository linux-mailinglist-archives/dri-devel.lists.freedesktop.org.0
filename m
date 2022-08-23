Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 542E059F442
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FED81120F1;
	Wed, 24 Aug 2022 07:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C1E10F585
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:21:06 +0000 (UTC)
X-QQ-mid: bizesmtp81t1661264458tp8bojah
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 22:20:56 +0800 (CST)
X-QQ-SSF: 0100000000200040B000B00A0000000
X-QQ-FEAT: Wp4pj0u9TId1/p9vqY4ReYjQFRg3a8LWVD+xyr4nV9JKXGLknbcBEXjK7esi3
 69862IWWlVSEL8Z/h69e2eL20A0F30L1Fxxl2sLyu04RtfnN8Y63IUeOskf3B0OpQiS4Q6d
 /GDJ1OKDZ2v/BUWko3ED5ndKp2RlCy4S0VYEzECdouqdvlop0Cj6tj8ryy+CwtpSrOPoazn
 Pwsiy3mlMOI+xJAT8bSFYpNm21oV5S+OVdb9YuGkiXNpKQ03Xp7ifWT9pjHk7L/zDqNF07A
 dtN/ythjPRhbCxjqZ1HbKCNb7APHX6bcBfXRWfb1TKG9fogl7k0hnejmmPRAI7gISzJbxEW
 koz1Li6Ez/PVte7ssJQo34tLKXsTSJ3vJf7xB3ZdKd/p2bI+bu3Ix1lHA3d7AdBPWIN/+rv
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: hdegoede@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] vboxvideo: fix repeated words in comments
Date: Tue, 23 Aug 2022 22:20:50 +0800
Message-Id: <20220823142050.15519-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:28:14 +0000
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
 drivers/gpu/drm/vboxvideo/vboxvideo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo.h b/drivers/gpu/drm/vboxvideo/vboxvideo.h
index a5de40fe1a76..f60d82504da0 100644
--- a/drivers/gpu/drm/vboxvideo/vboxvideo.h
+++ b/drivers/gpu/drm/vboxvideo/vboxvideo.h
@@ -43,7 +43,7 @@
  * VBE_DISPI_INDEX_VBOX_VIDEO is used to read the configuration information
  * from the host and issue commands to the host.
  *
- * The guest writes the VBE_DISPI_INDEX_VBOX_VIDEO index register, the the
+ * The guest writes the VBE_DISPI_INDEX_VBOX_VIDEO index register, the
  * following operations with the VBE data register can be performed:
  *
  * Operation            Result
-- 
2.36.1

