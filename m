Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EE714634E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 09:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECFA6FB2D;
	Thu, 23 Jan 2020 08:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E886F8FB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 21:33:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so721786wrh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 13:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xlgFMAe3CXQknrnEstYCKTiflc61mrdbI7J8/Qg+nfc=;
 b=qEEMJ6KodmkvEJk1ow/4ZKAnTI/+H6b+jITcODtPTnFG7MbwU8vSoV3D3TA2z18VpH
 Qj3xLLnnzOIPwu4i2XVGV0RSirNHV5z2pjrXdtHHEKy4ajyrfF0jcLGrQFCz4RjL8CJq
 7rgJlD6O0efiLXmbrARGJb4TnLTmkfqwjWrhr80/Zm2pho9vAb0ra57H3ANhd1gjqjYD
 BDEcLrSeor0SU5F1OIYlsj3aWLyOKHkcKSn+vdRKsdTf+NQNjd7vg7sM322tvfC6vnQU
 XjZxjC/AXQS//GBtBjQDuusPXj2WqjFs2OB7XJ7anmX40ZE13bJF7Kwc34cSZdI1jFG4
 R12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xlgFMAe3CXQknrnEstYCKTiflc61mrdbI7J8/Qg+nfc=;
 b=p+Rggy5B01Isyy1xFEZrPt4q1a/4mPL1PLa2467liONSR/CjqFsaLzMUZaXznrDeUJ
 1LrF0Ozq7Fm6WCgpiweqyJcqJtfVPyy+qHaXtf/YrTypGG6KnJlu/4vXHhP7ATnYirXw
 BhClpkzqlHI2gr/TD5+Hp/WRBO43mxmDJJkU+7POKDb5tE5LKAHQTlkRLMBo/01lSbiW
 g0811Bq0G5kwHQeC3kAtZMQGh38cBoB7O9Nvnn8OzVpojok7VDAIyf6Ldltuf6lHs3u0
 M29n8C+BEXyENN0tCpHsdv8R5SJ6Oh7+zuAqpAw9Pu/HoupXZYEU9TwQ1ixwPDAgkwcT
 xOSg==
X-Gm-Message-State: APjAAAVlPUUbfLuI9zLGMB4WN0VkAPluIWLY7Ph/Glyb89E/FlXACbGe
 J183llNJLUFDAuz50uoi/9g=
X-Google-Smtp-Source: APXvYqzpnqhxzhO0Avyv6Bhhwq2PJP8KkLIfadSmpO8fWsYydMZxekW0ght2Xvxur4m5mB8jgzv7HQ==
X-Received: by 2002:adf:e290:: with SMTP id v16mr13843989wri.16.1579728833822; 
 Wed, 22 Jan 2020 13:33:53 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id w8sm6474630wmd.2.2020.01.22.13.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 13:33:53 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH V4 1/3] dt: bindings: brcmnand: Add support for flash-edu
Date: Wed, 22 Jan 2020 16:33:11 -0500
Message-Id: <20200122213313.35820-2-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122213313.35820-1-kdasu.kdev@gmail.com>
References: <20200122213313.35820-1-kdasu.kdev@gmail.com>
X-Mailman-Approved-At: Thu, 23 Jan 2020 08:19:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Paul Burton <paulburton@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 James Hogan <jhogan@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding support for EBI DMA unit (EDU).

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/brcm,brcmnand.txt          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index 82156dc8f304..05651a654c66 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -35,11 +35,11 @@ Required properties:
                      (optional) NAND flash cache range (if at non-standard offset)
 - reg-names        : a list of the names corresponding to the previous register
                      ranges. Should contain "nand" and (optionally)
-                     "flash-dma" and/or "nand-cache".
-- interrupts       : The NAND CTLRDY interrupt and (if Flash DMA is available)
-                     FLASH_DMA_DONE
-- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done", if broken out as
-                     individual interrupts.
+                     "flash-dma" or "flash-edu" and/or "nand-cache".
+- interrupts       : The NAND CTLRDY interrupt, (if Flash DMA is available)
+                     FLASH_DMA_DONE and if EDU is avaialble and used FLASH_EDU_DONE
+- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done" or "flash_edu_done",
+                     if broken out as individual interrupts.
                      May be "nand", if the SoC has the individual NAND
                      interrupts multiplexed behind another custom piece of
                      hardware
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
