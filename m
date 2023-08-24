Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E307875B9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 18:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6370910E0B1;
	Thu, 24 Aug 2023 16:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482CD10E0B1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 16:42:42 +0000 (UTC)
Received: from ginger.. (unknown [189.115.8.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 18F956607273;
 Thu, 24 Aug 2023 17:42:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692895360;
 bh=KEyNwtYYO4BSXGKpu8cyHNwnu4krA5gnS4naNjnuc2M=;
 h=From:To:Cc:Subject:Date:From;
 b=cR5YHUWiS5gT/bLp5SNr+AGlSISCof/y63WV89l2QZF0ajLiaHtxGbPWJgnv/xOQR
 v/8HkWQRqNbXnznf2uIwb2hEKhOFrrahAXlywrcVepldXtC6Xw0GAiOgP1irS8dtTu
 csO5B/Kx6wjFLtFeaJTs333QYI1TUjnEcJwP5BeDieddArrqsSdweSFxGVjDWe6ld1
 QahCCJSRTUDdInOBjm3iHyG/bu46fOwXBQGdkH4UCsPx+m2WNV+3M9TIAilTDdZJFj
 r8OfNFNYiPklZ+rQn6seWLA5TF0B5TCW5/K0naIlnG3vdP3ETT+PX3xBtnwq2qH/fK
 9G+Cc8gIs4DzQ==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: ci: docs: fix build warning - add missing escape
Date: Thu, 24 Aug 2023 13:42:30 -0300
Message-Id: <20230824164230.48470-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.34.1
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
Cc: daniel.vetter@ffwll.ch, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following warning:

Documentation/gpu/automated_testing.rst:55: WARNING: Inline emphasis start-string without end-string.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Patch for topic/drm-ci

V2:
- Fix typo s/scape/escape

---
 Documentation/gpu/automated_testing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 1b87b802ac7f..469b6fb65c30 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -52,7 +52,7 @@ IGT_VERSION
 drivers/gpu/drm/ci/testlist.txt
 -------------------------------
 
-IGT tests to be run on all drivers (unless mentioned in a driver's *-skips.txt
+IGT tests to be run on all drivers (unless mentioned in a driver's \*-skips.txt
 file, see below).
 
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-fails.txt
-- 
2.34.1

