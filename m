Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5D34A3C02
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 01:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399351124C7;
	Mon, 31 Jan 2022 00:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B441124A6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 00:00:02 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n8so23367214lfq.4
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 16:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dSRXr5ZF0nstHXuLDJqj0kP/ADj336Vx1akoatH/1f4=;
 b=QCaUpwAprGHXP3AkP+bziM+wqojb7xFEfUeDy/40PxRMK3ropDDtOFSrg4W2lpY1T4
 bkPat1SCKo4lpe/LlE9AzrraVql9QcJiHNjbijwxvT++r5B88TlqpjT04DbqNKKkHB1m
 CFaGZe6/9O1ahyR4fFvQ7TRtm8TLE6uotDhrplk+tFqbtLURgXjM4guWBtH56J1MCVDt
 JOL6N8q3lvdX3j6SLap+6QOeMR/coq2y/+FyUOHhdZkVft5xaNM1uxou6nSxU9EqvM8J
 KhGBd7ZAcvzqc01Nfd4h6LTARxZu//yXHzBxLtVs2tUgqZuD56vMWGy1g8ny5/+trtx5
 Hb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dSRXr5ZF0nstHXuLDJqj0kP/ADj336Vx1akoatH/1f4=;
 b=irFjRVysnjAzLLl0tzWSW05yoPFG9TaD6P0RxKKvjedfsg7VvFr4Kyyq5Cv+clAei1
 0mskDkG6fpKBbVybznBkHh08sgxFkOcakYSscRthzwQroceVHjyNGM8s1Fo0kA4/NEeT
 w8+S9TfKyQFBudLiil2pE/XTP/Jpigx6IfsKd/QHAoR4P4EYHat4WJ5D/jH05lkP7d0E
 eYe0imefdQ4FM+tOid/3Zk5StbbgpAkMNtAU3hET+jQlWttp6DRjmRW/oNxZKoGJzLzI
 S1JG4I7s/0O7GApT7zG08hMCG+WLyTxcIBmILTT80wCqa5gNXOnT0WWRVktCjCEtN8Mb
 AJNg==
X-Gm-Message-State: AOAM532DJqu+GRMxF5GhDJ0tq8lbjl/A8bF5o0DR8Lyh0KU2RJizxiwR
 LUU2OU8ar72zoMu08XEL6q4=
X-Google-Smtp-Source: ABdhPJxYEuAYHQSlw/+GIa/vwm5WXcLSmoc7ThaeQRELpG3jBxBX9v+KGy5wC/15zu6eB4EbBnVjJQ==
X-Received: by 2002:ac2:490b:: with SMTP id n11mr13663286lfi.134.1643587200667; 
 Sun, 30 Jan 2022 16:00:00 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id e7sm3443193lfb.17.2022.01.30.16.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 16:00:00 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v3 1/3] dt-bindings: sharp,
 lq101r1sx01: Add compatible for LQ101R1SX03
Date: Mon, 31 Jan 2022 02:59:43 +0300
Message-Id: <20220130235945.22746-2-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130235945.22746-1-digetx@gmail.com>
References: <20220130235945.22746-1-digetx@gmail.com>
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

From: Anton Bambura <jenneron@protonmail.com>

LQ101R1SX03 is compatible with LQ101R1SX01 from software perspective,
document it. The LQ101R1SX03 is a newer revision of LQ101R1SX01, it has
minor differences in hardware pins in comparison to the older version.
The newer version of the panel can be found on Android tablets, like
ASUS TF701T.

Signed-off-by: Anton Bambura <jenneron@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/display/panel/sharp,lq101r1sx01.yaml          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
index a679d3647dbd..9ec0e8aae4c6 100644
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
@@ -30,7 +30,12 @@ allOf:
 
 properties:
   compatible:
-    const: sharp,lq101r1sx01
+    oneOf:
+      - items:
+          - const: sharp,lq101r1sx03
+          - const: sharp,lq101r1sx01
+      - items:
+          - const: sharp,lq101r1sx01
 
   reg: true
   power-supply: true
-- 
2.34.1

