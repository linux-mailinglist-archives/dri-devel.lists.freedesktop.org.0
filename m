Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5357EAB4B85
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 07:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B171C10E2F1;
	Tue, 13 May 2025 05:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="Bs7VGmaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520B710E2F1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 05:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1747115791;
 bh=Cdfa9q+LfPj/LtxoZ3TN4HjZOAHkdcdlZlPL8sLbxmM=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=Bs7VGmaC0o8blJE/QG76BqiH7Cp+3IHXLYXB6SymSirKrf+MIh7AJPBtAr0wRtkHQ
 j/NUR+j+5uK8dTaUu4o9wmJolNW1uOZUF6ihMtqB2y6cX2nVuJsa7Gwpb44ZMa6Fpy
 9o2pqJmOgH4p1pgyONAAtRyMUKJ3/ogfegINJDbo=
X-QQ-mid: zesmtpip3t1747115745t002de209
X-QQ-Originating-IP: 74dfBN0ozjFYrRhJVFtCAeE4JnKwu0jg1GRcfTwQ+f0=
Received: from localhost.localdomain ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 13 May 2025 13:55:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13709064314909415111
EX-QQ-RecipientCnt: 16
From: WangYuli <wangyuli@uniontech.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 wangyuli@uniontech.com, yujiaoliang@vivo.com, cvam0000@gmail.com,
 colin.i.king@gmail.com, jesse.brandeburg@intel.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com
Subject: [PATCH] drm/uapi: Fix typo "restictions"
Date: Tue, 13 May 2025 13:55:21 +0800
Message-ID: <DC0C6B72CF24C41B+20250513055521.40969-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: ORCyg9Q6uqVirLKewuSVgAPO3NWkhFQXkgUNn5xVj/BtsYrdnn1Iie5Y
 b0u2WJHhFYF4R0r1EZ/5kPyKnjGaQiJ5WIDFI3JXPwx6UJRTRbl/FjNG7C06DLG68NVO3W7
 HmWAxUlv3CZ+NYzFatSCCutCvZ+jARpsRJqKnOCpeFrVS+bbxk5jhQEZeULkLybzhnK7/L9
 OrT+o317h7lIuzoG8dNq5sd/XVScZhnMpfeAK8SW4sAxhTzoxFa+Jd+pvA7oxDmTli091rs
 dfpbWqCz0GVF4aF6UT1nD4yre70Y80B+ocmB8tjYbQu/tsJMgHuNQ2lOdzVCynCmi1TAL2r
 /yHYzqLB0QJAa1aMXMvofNm5AwEyqJzxziB/5m0SBe1PTA2BlFYVvfW1XKynJ9qJr1d+ZHe
 0E1rurMAixGx6Cz2wbuxvvbrGG7dHTAu8mnS9Ltat+AJgXusk0zgV8MXAkFcekNzCKMWPxP
 xRNW/WQZUjRB38zZaY2MM3xXYDz/FoSj1ivLjgRIxYZp/6NsJhblGopPCjGs7Ois/KzMrIC
 O1jZEmRicYihxCu/PVFxA2vt5ydV/+LR1nk9vuNskBwk/IVGTfiFSj8lwZQexjwR9rjoNTE
 J352Tcl0qlZ9G81O/ECeBXj71KxCaQuAjSerA23aGB/YJpPvYQKILnGDX6J4pih/HIaAZJN
 me2oUaXxqlfitya9rn07LCj17NGRg2QgmQyojnCNGQHEu19zbLvCXeGD9TKVFWNKJtFh7UA
 0yt+kXNJa1UdGurocIZ3YIVRmnl6/W6Tw4QAqNL0cJmPs61EkSt3QDmPXHnlMgOleBHg1ZE
 jJhPSA6YGx3xJ8nWfZnOHvI2yFNlWWhTGyoRiLp15WJimyzmgqnwsVY2TX1uLjUFzH1GBY4
 kt26ROiFiGyfJyRdHYD+hAhaQN2EOTeLSbrbahEpGzgOAMAwKaKeB2KOLdEHy+gyGcvQw8z
 Q2GUyLGLSBTtIThiCrOdPdZ9//i4kb4Y89iA33ZcdTQ1S5az9I5nXM78IUZomEDHcRjpxhc
 QWina8j7OV4sP5T5/I27xkW5P4hx3SYSCU4J2Trg==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
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

There is a spelling mistake of 'restictions' in comments which
should be 'restrictions'.

This typo was not listed in scripts/spelling.txt, thus it was more
difficult to detect. Add it for convenience.

This typo is reported by GitHub Copilot code review. [1]

[1]. https://github.com/deepin-community/kernel/pull/796

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 include/uapi/drm/drm.h | 2 +-
 scripts/spelling.txt   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 7fba37b94401..16f772dd7069 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -860,7 +860,7 @@ struct drm_get_cap {
  * cursor and have correctly set hotspot properties.
  * If this client cap is not set the DRM core will hide cursor plane on
  * those virtualized drivers because not setting it implies that the
- * client is not capable of dealing with those extra restictions.
+ * client is not capable of dealing with those extra restrictions.
  * Clients which do set cursor hotspot and treat the cursor plane
  * like a mouse cursor should set this property.
  * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index ac94fa1c2415..c33128db7163 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -1406,6 +1406,8 @@ ressizes||resizes
 ressource||resource
 ressources||resources
 restesting||retesting
+restiction||restriction
+restictions||restrictions
 resumbmitting||resubmitting
 retransmited||retransmitted
 retreived||retrieved
-- 
2.49.0

