Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05543AF8628
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 06:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED6A10E926;
	Fri,  4 Jul 2025 04:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="Rdl8Y4KC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63E310E210
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 04:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1751601607;
 bh=5WdAXnpdN01wWizT19/bRBejCrM46FxmZi0oSOJeQfs=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=Rdl8Y4KCUnuNzb9QTE9tbJCIOVGEy6f0sJKS5ViWUDRximtiYEXpbHHmV4Dqt9nzP
 FlzP1pgiioQkbko6hbQBljLcz60SY8UzyaosZ/FTpTKa3kA/ZbyQxctuTJ91+wOEx1
 DTEIRxBCp3Ksno0KXF+UNTh8Iro68sT7fIj5Ufq0=
X-QQ-mid: zesmtpip2t1751601591t0f0f8d84
X-QQ-Originating-IP: VGp0x93czLDnQk1UNsF6UZDHq9AcP6vBf9swN7t2mU8=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 04 Jul 2025 11:59:48 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16936787269720412939
EX-QQ-RecipientCnt: 17
From: WangYuli <wangyuli@uniontech.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 wangyuli@uniontech.com, yujiaoliang@vivo.com, cvam0000@gmail.com,
 colin.i.king@gmail.com, jesse.brandeburg@intel.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com, wangyuli@deepin.org
Subject: [PATCH RESEND] drm/uapi: Fix typo "restictions"
Date: Fri,  4 Jul 2025 11:59:26 +0800
Message-ID: <35295656C43C4A38+20250704035926.259228-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OcRy9T4vWyPbH476x1HpA8VF3C3oyzWUe37i8OPVcPOJ10IQfXTekNrn
 FPNTWWH9mpDNvcHPCnz2fTBUnM05FNSdAwjDpyBj4QlB+f6Xw7CdJob0zDSDvJvXKKqtoky
 aowwYhqcrm4gWEpengAy2Zk3qUq61paWoue9IyBUwjjWdutDPWuT2pWfGsz5BxZIrlKXppO
 yebA4uj+g9ow01xqJTXweqJ3BSe+vdwkxW+g3aG746XrWU6OCxrdp8hkjUxzD7lZJPJz0aq
 7+YV1Q5ns7v5re14ILa4UyklcTxBcANgsBcUDsFOoKfu+3qVWYno19Cuccm3v/gaX6RYRay
 yKDb15JRz/ZcLA8A7Wk/imQOd4laLhfbcFKfY9ZD4CIU2l0CiA12qw/MSPalV6wfGey3/Tp
 CINb+E2Zk4D35jCVeQU8nYj2mDdwSWp+gdoG3uBenkx22M1IVXb8xjmgcwLV6iiHn4qPvgc
 QdkmzNvazDRrEy09zhy3Ntzks4VH/B2GkC4RziNWtmSCCGWNiKZoVRfW9tztuYTJDg31Zzu
 0jibqvC2T0KxF7kuZ1lLBQP7VpqSiYJIRyAxpYIHiMKhITZs1L03Sv7kiCHnRGABkxolrg7
 NDt81EwF/S8hzDGhmYj3pwuMDSt8j8vkfdwQ9sVTfz8K/O0IRkHxOrBXU5AIgdU1prgUGTK
 tJ6VNPUO0xGQ1Wwe4gjUnQJ5+TxAo8NmgmcUQBFBD4kAorT6myRUJ+pwVTDTpzIAX7Lcqeo
 GnfqJNQdLVFY/y2hBOR1u8MN0pUs0jC0X3WEF1DaMIyLIklZS3prZLx8fVRGC9KE5kOX+5H
 Bo1qkvhi26nWc2rrlGN463DZ1iVEp2/mxbiTwXIMNfMb5GGJPF+lEPMrioZsICxZ4Ow1QKm
 Qr0Ayqtg/pLohjxz5UGmBZmxpa+ssqf/KJWef4XDtHEvMBT1W5JmRiGehXQdyKSbN6k3RX9
 4WxPLri8yDln8idVVPyGgWYvCrmUV6KFYg4ORECR7M4hSrZazn5SsLWJY74etGhi+yRn4Dn
 NS4qWTSmxKBjNBW1c2RMEkxkzk6csw8rby7SMoGddRrcHdZTJWCr5s0c7LrIAX69fZUUeEU
 Q==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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
index e63a71d3c607..c996d19cb2de 100644
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
2.50.0

