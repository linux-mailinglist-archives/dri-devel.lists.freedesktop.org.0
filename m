Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1AB44FB6A
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 21:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D5389E03;
	Sun, 14 Nov 2021 20:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B9189DF9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 20:04:49 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b40so37660546lfv.10
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96RcEWyK1nEHA7WMjfyQIixAVj6RLVNjCyJp7XEuCRk=;
 b=disv6LmuT2rNE98rR+GMp34NKFi2GwApxd95lZEKlpP3tkxbT4QA2R0U6qD3IiA8hI
 f/vtQEBUJlM+Apez7FVu8BGzTrxXjoTf/97Onsizhxb9C7PGsS9lcH3damLK/xq4LR9J
 P6O4wKht25ycSyEu9sS8/puay2MbCA7ISLNITPVhSejhd5JlezxOFsB/wkYOfg4v6xrd
 ZrCe7GhfQAqTVkpfoLIH9JkSv9tr9CPk12vFKyLTCB3gzlaZmhKDzhwts0LX9iJ1OZtz
 zYWXmYFRRR6VFZaP3dPepzjeWLEgQWAerSobVuCmgEDP6yma1oVcgLGgLeXKCZxK4CS8
 wWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96RcEWyK1nEHA7WMjfyQIixAVj6RLVNjCyJp7XEuCRk=;
 b=nTToAn2CyDIUvTUbHaF6iCCtmuO/yeTZcdV5zPYn79PKKm2sGtSt+oDJ2MSNagh0/V
 +pDYwo56OVAelD3XCHLAW4Kx8JPhFsCJR5G8zKfPG/M60046IB/0SDeKkBjHVpXjiMZ6
 uCX9xMol07kuKG2WAFURwKaFuwk9+u8MziasYxGevvywgOnOYsU2f8EosM/861ksm1AX
 8c1HmcR4nWgaO+QLqS5IYgTFWvCMekgMwMA0+EXOkgDBD8JBEmUiNWHV63IIayNDmynN
 rrLivW/tGVSwZzkhq8mlSaBcKc5tAuD4ZxfHcEL5686A2CKnj7ye97ojvdC+uppLgB4J
 nmtw==
X-Gm-Message-State: AOAM531jzSCehHBFaBqooI7WmeHvySqFJ0JyXPK2Ov1nfCo5tQQUtRy6
 em7uKX3tRHnDrbAs6/laUW0=
X-Google-Smtp-Source: ABdhPJxAdg84UeMZ1sSQ0Lsp7SztH6mQo1weUbFhj2NuaWEpLOrH3fM4OrYOvEcRloQ0i8QcuWbYgg==
X-Received: by 2002:ac2:4292:: with SMTP id m18mr29904021lfh.539.1636920288127; 
 Sun, 14 Nov 2021 12:04:48 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id g4sm1193914lfv.288.2021.11.14.12.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 12:04:47 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: display: simple: Add HannStar HSD101PWW2
Date: Sun, 14 Nov 2021 23:04:30 +0300
Message-Id: <20211114200431.28484-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114200431.28484-1-digetx@gmail.com>
References: <20211114200431.28484-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Svyatoslav Ryhel <clamor95@gmail.com>

Add HannStar HSD101PWW2 10.1" WXGA (1280x800) TFT-LCD LVDS panel
to the list of compatibles.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index f3c9395d23b6..ecb9a79c2e78 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -156,6 +156,8 @@ properties:
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
       - hannstar,hsd100pxn1
+        # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
+      - hannstar,hsd101pww2
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
         # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-- 
2.33.1

