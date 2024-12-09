Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4706C9EA071
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 21:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3C410E563;
	Mon,  9 Dec 2024 20:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BKaD0bZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3542810E563
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 20:40:52 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7fc93152edcso3825632a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 12:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733776851; x=1734381651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PXvsuXMERf6df08VQWVzjea3IcYfHYsxE45+1XCwwhA=;
 b=BKaD0bZCKCQ7t5hEoix1bdtbTdeHg99PqHOwdnM1dYfcaa0GeFDVBu5UX1bT7sVBiH
 TellfySaXCodC8nRMSIGswcdOqJ6Lz320Zu9h89rl66YyS8SlxSW6DCA97OuJSk9cBpJ
 epU8a4r4+R1WMpEj3NLeNQzeYMoiHj04lpX0B9k9WBtfbX4Li+Q06DBqSMXablQfVLAF
 ngucxCwwgJIL/gSXKTGKWgvho8bWt0sSa/w5I+dFLmZgcgmYNvaPgj1nHpHoWvWmJrkY
 AMUGfMeosz3A5nw+mhekO4DA7URTgEuaj4QE4tGoXp7CtCapXfr9XFtjWSRMhjCUEGZE
 AoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733776851; x=1734381651;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PXvsuXMERf6df08VQWVzjea3IcYfHYsxE45+1XCwwhA=;
 b=WHODk7GSuKRQTniCS5Nm6WEc2QImW3/eIDThAzPBD8oOJ1AIyVx1+YnxwrywZAoHYb
 2n8A8hruScG+Lhb0LfOccNffpTDQEu4+ooCo1XlNfrDtdavklpPOGw0edfuFvBfKp4MD
 BcbVq8muH7oCmMHBZOYnScubLm/vkXHxio0HBUI5k1GPsHkfEIEDcId1N+x3fQMBQHXh
 Y8d1/nwpZ7L8epV905DLZsR9pPIzVYYjHZgg1MytIo2I4T1gmdHDf4DO/NMcxX7HNkd1
 0pg3iZzV68M3rbmbdmHwmiG7SATKgHthWZ2efF8GwpegVrlBqOWFmaYim0G77X8st+tE
 mNKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWStnI6Wey7HZ24eRz0QYl25vPIJwzShaEcJYoddu14kNvdRpa4XxUGwYBHXuFMjU5K1e2zb366hk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5nbPqi7t8a7a2TAM/pTxWJ66lC5CBQ7j+1vytBQI2n++bh+pj
 Ippkq+4TtFx9jDMf1my+pwQGsvSfRHDmVqt4tBYxVwwR4Tp0l6X/CggE/Q==
X-Gm-Gg: ASbGncsBE0+eMPHjVJkK5IrgD+nYd0CfYp7HV5SQ48TLMz6FFdmEGj5T5H4LqlCTdQ6
 NdoJm+YuWa/qxgg4ZopNGTHmIVZrjUWXq3wwdOiWpDM6nwJJRPngD4w3emtZMfXPdpzK8Mjy2aU
 CXwkb8E95YVGi/lQfVX7+8sDKqSFqO6gs7sq/EBqMeLJ1ewcx4mIC9gNlpmVeePJsx2A9mxIFvd
 VdYynpJKcbAUTldelXqDZa3outiMp5JggjuuQFmOiZJIgu1kelNbsxUd/tHQHMkj+4=
X-Google-Smtp-Source: AGHT+IFc2Lceg6DjJ7cqQKBERaygfwtBeBltRK5cwNCLJrhI05ONbYSi9ksuO0DeTsh5Sp/KeBQ1Aw==
X-Received: by 2002:a05:6a20:729c:b0:1db:e327:dd82 with SMTP id
 adf61e73a8af0-1e1b43c4e93mr1397192637.5.1733776851595; 
 Mon, 09 Dec 2024 12:40:51 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d7c4:c4a9:e35:ccbf])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd5207528csm1707219a12.36.2024.12.09.12.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 12:40:51 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: display: panel-lvds: Add compatible for AUO
 G084SN05 V9
Date: Mon,  9 Dec 2024 17:40:02 -0300
Message-Id: <20241209204003.1295503-1-festevam@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

The AUO G084SN05 V9 is a 8.4" 800x600 LVDS display.

Add a compatible entry for this LVDS display model.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 5af2d6930075..fcb5834f799a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -42,6 +42,8 @@ properties:
           # Admatec 9904379 10.1" 1024x600 LVDS panel
           - admatec,9904379
           - auo,b101ew05
+          # AUO G084SN05 V9 8.4" 800x600 LVDS panel
+          - auo,g084sn05
           # Chunghwa Picture Tubes Ltd. 7" WXGA (800x1280) TFT LCD LVDS panel
           - chunghwa,claa070wp03xg
           # EDT ETML0700Z9NDHA 7.0" WSVGA (1024x600) color TFT LCD LVDS panel
-- 
2.34.1

