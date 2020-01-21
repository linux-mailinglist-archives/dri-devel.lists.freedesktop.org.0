Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AD9144D73
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F7C6FB01;
	Wed, 22 Jan 2020 08:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355FD6EDC5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 23:31:40 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id t8so3752840iln.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 15:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=9OWdM7jeMtF+WYXakFsc6aduNxa9sMPyI8h5Yizfygc=;
 b=gkFLEianet9wd61hyr7FjW2r9FxY2JC5paWGNccuCWxARUMU2WrHQ7izVcuL0Df63S
 +2IOhAbSOXYg59SF15BFHFExKWxWp27F7SWKZJnPjAD6j+0ALyFROT0aAFq2lMb3DFN5
 p+nZGDPlyZDf8PzPQNrBdddnXsv+DE9T9VugnfQOweW1pRgkB6w6ZbAizx8gRqpoW9NV
 DDwKR8gGFt0TgTb9KvXX8czBnhcP5qBTAGjBgBUywugZkExER5XBuQa0rKtzJAtOMGMd
 QK8SkYU8YpmW2255BNvkYDUi9M+gdVvYQilo1DGarayR+e3MMVkwOeD/M+KsOCoJrm/v
 utCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9OWdM7jeMtF+WYXakFsc6aduNxa9sMPyI8h5Yizfygc=;
 b=ZFwqPOvQbGA+Z2KxK/hDMmFVA6t4EeItD1csYVF4iYYL6b9waxF880AtegYLvU6tRN
 8kL2Pb+05bQ//t4qwO0wQX4Kjxr0f533+DYErizLdnamu19y/JexRFaV1shz8ADJVeQd
 fcdQ9L8h1cE8yNpjBnZhosgwrIMTHs/vVmfoNrTlV4vP6q/Vgi9A9nekQXHOPLbp7t7D
 tcSt6b20C6MLxmVdLSUD4krxK7DETb6OJeqoCok+7MUJcYeNEQwc5gvLXoGckzJjN9ex
 uJBIaPIxw1ihlIjp6Q1qXLRRtxNrXTf40QEksGx6OcCb3X39CQ5dLO0CSaz/EqCHAi4a
 QJ6w==
X-Gm-Message-State: APjAAAVA0XzKeR1Cc3RnKrGtBkXJyC7k7MmgMAGTTJPBgnqvmhH5Evr6
 IupX5LiBgP2AgaQWEQuso/c7nq+yrXlrLnoh/GQ=
X-Google-Smtp-Source: APXvYqyRv4BHNv3ZaXTEKb81W5fmS6oWBF6Kqy7uz6LSZtFO9B0QDFpMD6FEYTHSFsBDniQu9QYRQ57FcmgQHKu2e8o=
X-Received: by 2002:a92:d3cd:: with SMTP id c13mr5391955ilh.21.1579649499513; 
 Tue, 21 Jan 2020 15:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20200121200011.32296-1-kdasu.kdev@gmail.com>
In-Reply-To: <20200121200011.32296-1-kdasu.kdev@gmail.com>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Tue, 21 Jan 2020 18:31:28 -0500
Message-ID: <CAC=U0a35ihnGfsiytqHY8mBS4raJ48DoJTVhawd=tGry57cLSQ@mail.gmail.com>
Subject: [PATCH V2 1/3] dt: bindings: brcmnand: Add support for flash-edu
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>, 
 James Hogan <jhogan@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-mips@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding support for EBI DMA unit (EDU).

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 .../devicetree/bindings/mtd/brcm,brcmnand.txt          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index 82156dc8f304..05651a654c66 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -35,11 +35,11 @@ Required properties:
                      (optional) NAND flash cache range (if at
non-standard offset)
 - reg-names        : a list of the names corresponding to the previous register
                      ranges. Should contain "nand" and (optionally)
-                     "flash-dma" and/or "nand-cache".
-- interrupts       : The NAND CTLRDY interrupt and (if Flash DMA is available)
-                     FLASH_DMA_DONE
-- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done", if broken out as
-                     individual interrupts.
+                     "flash-dma" or "flash-edu" and/or "nand-cache".
+- interrupts       : The NAND CTLRDY interrupt, (if Flash DMA is available)
+                     FLASH_DMA_DONE and if EDU is avaialble and used
FLASH_EDU_DONE
+- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done" or
"flash_edu_done",
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
