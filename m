Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114E3C9503F
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 15:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F27B10E02B;
	Sun, 30 Nov 2025 14:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="OQsqzUBp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 393 seconds by postgrey-1.36 at gabe;
 Sun, 30 Nov 2025 14:35:45 UTC
Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com
 [203.205.221.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710F910E02B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 14:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1764513342;
 bh=qReGk1WfsHOyiBno1NOk+49x8+G9e2IJ9Nlz9CqVvbE=;
 h=From:To:Cc:Subject:Date;
 b=OQsqzUBpfS4+mQYu0J3/sC7oR8s/8wD1HruvflIsO5knuESQr5AsPdGdvmvGkec6y
 2o6/n4JqOHvkNSQWlI+KI0Vy9oOqrDyz/aIr8uh0OWwOMK/wPxY9X5FAoidRUVES97
 QP6NGncb5GQRFbIO5i+rcR+LU1AyVnqy2OQdAucQ=
Received: from localhost.localdomain ([171.223.167.52])
 by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
 id 8E6A52C2; Sun, 30 Nov 2025 22:35:38 +0800
X-QQ-mid: xmsmtpt1764513338t3z1son2f
Message-ID: <tencent_FD75580BB3BF35F44985E237E7DE56BE2407@qq.com>
X-QQ-XMAILINFO: MJf32pulH4812iR2pxWgduXPSR8oEa1DaOvphV0IbBF3lyi/IvzL7a69v182Mw
 7gauB0JK/LTDfFLut1dVvWm0plgmq+8LrPGRSaR3yvSE1Ke+WQEYjzISxBweKyeVKLNUXqvUypyB
 ftHoJb0a3x611rhwH0zYUeKDfL/kYD5lqdRAF1uTkZNqfUe7Q5Yc64AS/C4FH3ONBfy0pv78thok
 JeSAf9NVB+Dce4rmtsLSCig9hec8mFFSGvUv9h0F1i1ljmC0KtcB76vM8RQNnTp7yc/OnsOp6Yk0
 Mjr1EP8BTQmEnfxG0UWoeS7zEXE98o1Kvoykcp0cr0dXGYsWS6bLeZDAI5C0pioKMtqUyz9dbnEO
 c9oM37ki4GfWueB5SjBSvJRcOu7VedxZfShFjs16E9Z6rlfBnRe6/FVqnYy2S5A4jIm6fCWs6cGb
 4zIWoeDA2lrso1LOeZJkh5aOlL2UDsAUBq3qcg2FudEf85coIsBclyxqNCFoe7LbeImvDePm7kyt
 LN8yWDPEeWnWKMtRHnB3LkRK1lz8ZS9VUh7Tbxqiz+QjYoTjiNA+BkzLNcSk/D8cMdvzmRiv+gxe
 h8lom0tOpt74wrFwuD7rdmZFs4FMSDsRvR6Shy8E5VCyeWP4qI9yphhMDYWVc3D/mjAIFueffS9d
 M+3haVDox4FZvS7jhZWLzqQ6B4YMbryeDjk1nHVr3jAOlLjy2iy3duRaJXHYEZfyN2MRn4IrA+dz
 iCsrm3Xgj+4EmgPh0TxJzslApUzXpAHwCjPgd5zhd1cYRHRS8wNFDTbjqfUi/EbMM9AzRMNAiLKr
 Z/b15DDjEVYTeM0/Hh8IUP9h8k6LiIea2BqcbiTueDWMxe7dgE0qAL4H4IZdbnenYaF1VKotWoDA
 guy6w2KBfaHBddNBR/wLjO+Q9JsVqk1ZD2NzRyqjpH/evCHpme8U4kqHXQziAAENMddWlwwRjJxX
 MhWggQtNrdRV1Yl5YbtkSECmnHKjHCCUmFuTGX/Z3fMp/SkRQtgx4GhcF9g14SxdWpF3R7PfM3bI
 9XGP/tZq/3lDvhtYHoGxIztGMZ1/8WGfbKfNehJmqXsa98rN0HN/rGu+rKYMB3rZCto8YMnrCBZU
 ItLuHs
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Renjun Wang <renjunw0@foxmail.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH 1/2] dt-bindings: display: simple: Add HannStar HSD156JUW2
Date: Sun, 30 Nov 2025 22:35:27 +0800
X-OQ-MSGID: <20251130143527.81309-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the HannStar HSD156JUW2 15.6" FHD (1920x1080) TFT LCD panel to
the panel-simple compatible list.

Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 2017428d8828..918dd6d303cd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -154,6 +154,8 @@ properties:
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
       - hannstar,hsd100pxn1
+        # HannStar Display Corp. HSD156JUW2 15.6" FHD (1920x1080) TFT LCD panel
+      - hannstar,hsd156juw2
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
         # Innolux AT043TN24 4.3" WQVGA TFT LCD panel
-- 
2.39.5

