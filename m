Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEBCAAECE6
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F00210E8AE;
	Wed,  7 May 2025 20:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KH6tRSuj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2825810E8A8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:41 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-72c47631b4cso135858a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649360; x=1747254160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CStNfNX+Qe9CAKa9kWGR0bBTgEey43qr4WYZEcf8hj0=;
 b=KH6tRSujLBi7KUDZy7IJOKL/Mzb3PuvntP2PjCd9bCuilzTawGsi3CjstLusSCwgrO
 aYyXff9PfnyR6y5bDZH+68pwA7cVVxgyrlue5E7QxqRhhf7JV+aeQIjZIuUIvDxGxijc
 kh9bES2cpfGodA7bIewTlfAK6aZabiqglBVkXaJU83B9Vj+ynMHdzrbDuVcAIT7Dx+bS
 Mo2yeAxnDtML4vzdrtQfbjg1wf6TgDinoG5gr7tbnp0V1NE2qEaxDBKDhX4MhfTdEDYe
 qfLjMT13rO1tYgfLyiWFx4nyybGssARKI2uSsm0uMjCEXGZOwSnLH9Qq+6vSniSKzZ6t
 ZbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649360; x=1747254160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CStNfNX+Qe9CAKa9kWGR0bBTgEey43qr4WYZEcf8hj0=;
 b=YmoW/ckAciHqg/bLNCsA/KxIjmREAxxkr4rxiw5Wy8s+xOcm1rgEcncszNm9qFRSqU
 /MF/79yPSX6iBKJ78EI6guQLFwLEjE9j6qFBIa+v9x8+t5PJt3NYHBDwZAmBNZDQI5PY
 zk7yjXy2TSiOzlC1wjvbg16A0zcmmzkBLdGKQCQyP0hWFaqjNgOQPyQpCLAd/DgI8xMJ
 Qz7TaSwmrgA+6AbZly5gQAa581F3PE5R5IooaU3T7uLX7xX4TrwytAYW///drS9ZVfcY
 L8XvRf024+g1z5hJhHDorlGBoE2BBxi9nt742F2pe4suYnRU50JacGbdw9yCCQ49oeIv
 /+mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5XfDjtU/2p1vooTLm73N2a4KLbYG9lBdZV0Y077lOOaI631rjqcLrJ27W/euyz9C42oChx7aX35E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO7m4NJfEw7w9vlLbcbsDjgw2yedl42cJPUjOQOEMJJCRmzRtN
 T7ldvnQBL86AoUGYZLaCZg7Y/JrjhetdO+JnJI2xbB1mZjI/l74r
X-Gm-Gg: ASbGncsB4A5eldEeDKdDmd5IJpyzY7vVJGqdelisQ0SEtS4/wp48INAwo/0cWjbNvE+
 fQpeYZvK6plCNPLRcNQmXhovMsbSyApaC9WI5MT3MyWd4GjaZgm6iS53139j21Rbp3XjEGqXcVL
 bcYXmkt+EjGtMz/2y0k5PGAwzswqQWFMwSe35RomuaD8pRy5QsVe4JXuvQBpFSw0xoFtYqeacDX
 LpZAwQxPLskPqFA3wKsr3ETO38sGtZbbT172tkSiVovsymeq0ZWO0C3bkDKO7p2DqEsjwvV/3jK
 90SakLWXNzS60yJ00/mzlL6g21Y0exOViTMGUdrW3LmsyZkYUC35UwGGu8Rv
X-Google-Smtp-Source: AGHT+IHU/L1zNpnFPbQN5H7v31jrky1fO0rvKzweVlqImDkjzQ6zRsRlAWp/aFFj145iJs3SabcqmA==
X-Received: by 2002:a05:6830:4410:b0:72b:9cc7:25c4 with SMTP id
 46e09a7af769-7321c9bc300mr462737a34.22.1746649360382; 
 Wed, 07 May 2025 13:22:40 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:40 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 17/24] dt-bindings: sram: sunxi-sram: Add H616 SRAM C
 compatible
Date: Wed,  7 May 2025 15:19:36 -0500
Message-ID: <20250507201943.330111-18-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add a compatible string for the H616 SRAM C region which is
functionally similar to the A64 SRAM C region.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/sram/allwinner,sun4i-a10-system-control.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index a7236f7db4ec..976d3320c803 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -102,7 +102,9 @@ patternProperties:
                       - allwinner,sun7i-a20-sram-d
                   - const: allwinner,sun4i-a10-sram-d
               - items:
-                  - const: allwinner,sun50i-h6-sram-c
+                  - enum:
+                      - allwinner,sun50i-h6-sram-c
+                      - allwinner,sun50i-h616-sram-c
                   - const: allwinner,sun50i-a64-sram-c
 
 required:
-- 
2.43.0

