Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F7C1CE879
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F5F6E5D3;
	Mon, 11 May 2020 22:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785FA6E581
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 20:30:07 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 8so5952080lfp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 13:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DXa0AMi4gkWXUW/zIwqMYWpIfP+GeYLSLJ/VTDkKld4=;
 b=dur+Eq53VB5Sq4DGr8l0G+mFwz9TW0EE+MpS9D6M2MrUz3e8GBOosLVj+6Bt8fWYci
 INx9nP43ArNaggK8bwvXVvv6al3GXYrjZzfaN+fd6N0Izh6grR3X7zpQUsbZML0YG0sS
 QztxZUWKGQWqqsGSl0QYeK/uzsKCR8GvPYzklxMC8d8KWe0zbRVZlFlXGjMg6UGz7wxK
 8tgTx/1Lhd7BdTIrjY0BNfns6qmmYASZxdf+zk1KnJaf92O2Qbd/sSFpHW/zMQx5g7HG
 TzbxpqMxtYq0is1xd41W42cLi2PDS4TI2eM0RFrRicQc8oWee9PsypTTbOFDy/aBZsb/
 1EjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DXa0AMi4gkWXUW/zIwqMYWpIfP+GeYLSLJ/VTDkKld4=;
 b=YgfbMCAtkPNziov/KwpHpYeIjiZPVK9Of9E+D8hFsASUTn19UYdxFlj5wnO84bU3+X
 QovlN0XC7CnHXIZvcx0J834jm8JcXFLsQZHjEa1ckcISewM85rfJ/+AUIrU8vK48FoCQ
 VbgIa8Co9otILvx7jWw+ZVCyTJX7zfyNFy/gvS4T+5bz0IdtQcgl1+nMDRPaUt8/XbwY
 ddTvXNVHmWVckTfwhXCGjEV/bU6WSJaJDDkp5+Zk5PHAuXhIjw+DCt479CVg46PhQzvx
 bcD1EyYav/eRGldVAvXlOc00e1PNB5TF+beaamvUDpr3NIRDhfzJqH1JtfXbqPW17syR
 haFg==
X-Gm-Message-State: AOAM531XyiO7sWNjqYzs7RnHNDwMl4lxJj7YPSbP1bo7baXdGrupzeCm
 TdPeeXxmQifi6N6sWUNQYmw=
X-Google-Smtp-Source: ABdhPJyJ4yzhXbbnMlW4e+TSchP1rCsR/aNWiQXWg2ICEkkxE7JzW83DXln4//7MrQAOeFqJ0GPoWw==
X-Received: by 2002:ac2:5e70:: with SMTP id a16mr12368991lfr.77.1589229005913; 
 Mon, 11 May 2020 13:30:05 -0700 (PDT)
Received: from arrvl-mmelnikov (chargesoft-1.cust.smartspb.net.
 [80.249.187.146])
 by smtp.gmail.com with ESMTPSA id i1sm941863lja.3.2020.05.11.13.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 13:30:05 -0700 (PDT)
From: Maksim Melnikov <approximatenumber@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] dt-bindings: display: panel: Add NEC NL10276BC13-01C
 panel bindings
Date: Mon, 11 May 2020 23:29:25 +0300
Message-Id: <99d72a9aa7027502525439c71bca01a56472474f.1589226066.git.approximatenumber@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1589226066.git.approximatenumber@gmail.com>
References: <cover.1589226066.git.approximatenumber@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 22:51:58 +0000
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
Cc: Maksim Melnikov <approximatenumber@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add panel binding for NEC NL10276BC13-01C.

Signed-off-by: Maksim Melnikov <approximatenumber@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 393ffc6ac..11bbf69f4 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -171,6 +171,8 @@ properties:
       - logictechno,lt170410-2whc
         # Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
       - mitsubishi,aa070mc01-ca1
+        # NEC LCD Technologies, Ltd. 6.5" XGA (1024x768) LVDS TFT LCD panel
+      - nec,nl10276bc13-01c
         # NEC LCD Technologies, Ltd. 12.1" WXGA (1280x800) LVDS TFT LCD panel
       - nec,nl12880bc20-05
         # NEC LCD Technologies,Ltd. WQVGA TFT LCD panel
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
