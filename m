Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CDCD13EA2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F48510E416;
	Mon, 12 Jan 2026 16:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ynp7bLHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51D610E412
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 16:08:02 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-64b560e425eso9312979a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 08:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768234081; x=1768838881; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XFchl4IL2iHP7X4M9jCzRqchpxPAMZ+ZvVMJ6ag12p4=;
 b=Ynp7bLHis+5vafnJYF/AR0oCQMoyRGFKmPGL8Aos0Qzqzrc8kMcymxCkqxubDWk4S+
 FqcS9+zIB6iIY6+ujJ2XkO/cXR+U1BHMP/L5B1BUiqqtu3QOqiW+CWg1xTW/frIKuOAD
 zi7dGNlca3lbGG//0oxMCP12w1cJd8a3fcEDafq717N5ACwLp5PoYz4o/Io46vlZF7Kd
 Cnz1BppQ+vt8P70jfRI4PpVCjAluDZuIPewcN/g39c9DDP8XED+jobiZlQBEiqWu5kEY
 Pf9AGgQq9Lf08WBweaceqw+s4ObVXMaOymLFHNiJM57cDFgVdQAyt/0ZPOWHSNQq2l5t
 P2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768234081; x=1768838881;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFchl4IL2iHP7X4M9jCzRqchpxPAMZ+ZvVMJ6ag12p4=;
 b=aC+2yNoDeP0YdoVGD+EWYCPtXu4BKyP0RxJp9zuGvxpD3vzcPyk7eM+mvUM21wiEAn
 FiECTzM0iPTmL3Rd4vxIRJsilQmOEZ8S9q0ce9oWsm9qmcTDiy+pTpSlYZgMchconAnP
 jbJQpeaDgZ5en7xNap8a6Jfz1l8fG8QEiTp+8jHMfHeEjxbtT7XO0YXn5wFwh3MFxJh0
 RvJbpHmR4g3egsVymBgr0sayVaxPXalXFr8DhyJf+7k2WnmXUYy3Kye55+2U3EySZIwn
 pNCc8Wfpq6quS2Sva+atZ4mMMIaxCH+1Bhs6flSTBswveYe0YlVUtpEqy7dZIN9/AwKC
 RO9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4GijCUIsPeJBMMrqeJCbYiWAGKou98HO3CwmFg3lBEpPCXmq1V7yhELtZ5AkDITP07C9iV6EAIAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWF46YR0++WKYwk/Zewil/HCxNvz4WbNnPu/GF6d6pRc+49oK3
 S9fJP0YbaHoGhpj0xw+SbbfY01v3s6qzYDGooOoyq8rYa5lUpGoGg78T
X-Gm-Gg: AY/fxX6pKzrUtHkSsXcKNjsiSt81R6pg5d1C9o1m8tmCasABmxwhVvKqVTeg20iqUBy
 CZuIs1kkdcwy6cXJON3AlCBlZ42It2pUpY5Cs6pwcz/J716YQxnr5Jie3/fyV07sdE88NU3fZTk
 krVtYlU7hoIhKZFmtjk/YqAW15HfGRTefKU7v/aaybb1BGVhTex/IBcb3kI5/MY+NKf840t9nuW
 phJQd/2dK8dq9ilbLyqG1lrNT+ta6YR+ze6BT/RdVfjtJnq89xBW2K2NXmFuSMKBbf9k7sb75d3
 QYBdzcv6rr/ti3E1q9x96aosSQmddxZO8GPe+jOstbsJe76TD2E8tppEKQZWKvUDFY6GA4XkBBc
 SqzK/bBfTWUt0xciAZ/3ACb9lT/JlSWREQxNvAXtXEyqWHRK0QM77ZPyf0BKuLcOleZvYGZbuWv
 Jv59ZnCgqxLSIPSOeXr7OsmsEjtDdJTUrCsZtjDnzxUQw=
X-Google-Smtp-Source: AGHT+IFz4Glbd4ZA3dxtqcV317tXnM3myln6ByCS2T281F927mkqk5Eht9v3v1U1SGONoSGsJThyfg==
X-Received: by 2002:a17:907:9403:b0:b87:7e8:e287 with SMTP id
 a640c23a62f3a-b8707e91202mr564365466b.30.1768234080781; 
 Mon, 12 Jan 2026 08:08:00 -0800 (PST)
Received: from MacBookPro ([2a02:8071:2186:3703:6de9:eb98:99c8:7af2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86f9a9103bsm667481666b.30.2026.01.12.08.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 08:08:00 -0800 (PST)
From: Nauman Sabir <officialnaumansabir@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Nauman Sabir <officialnaumansabir@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: display: mediatek: Fix typo 'hardwares'
 to 'hardware'
Date: Mon, 12 Jan 2026 17:07:59 +0100
Message-ID: <20260112160759.19027-1-officialnaumansabir@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Jan 2026 16:13:39 +0000
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

Fix incorrect plural form of the uncountable noun 'hardware' in the
MediaTek DP binding description.

Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 274f590807ca..8f4bd9fb560b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Jitao shi <jitao.shi@mediatek.com>
 
 description: |
-  MediaTek DP and eDP are different hardwares and there are some features
+  MediaTek DP and eDP are different hardware and there are some features
   which are not supported for eDP. For example, audio is not supported for
   eDP. Therefore, we need to use two different compatibles to describe them.
   In addition, We just need to enable the power domain of DP, so the clock
-- 
2.52.0

