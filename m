Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E472BB037EA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 09:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF5D10E075;
	Mon, 14 Jul 2025 07:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dQZBivx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392F810E1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:00:07 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-74b27c1481bso2317434b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 20:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752462007; x=1753066807; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FidiboXZ0gzp0Kec1LGu7nNmgcY3DYoC/ILAAPmTqbA=;
 b=dQZBivx8cwpwc2PQqJD/XnC3hXBMPQUk5hskpumiI1Mcz42lqD7wsJo8ZgK7jiqCKt
 o/fDQHVyXwFjcUcbvKFEgUvfOHusTpApC5pV/Q37CbwX9KQcxf6u3kACzjlxROgr8tQX
 iALgGXtf3wS+fyQnnxsu5P58ok244lxVZvr5OU+cgIhX3fYZcwqRyNc7ace/NDlfNwo4
 TgQTcWjvN7D8svAvWEy5681Y52Sz69ZHd7UzoIG0sUocZrIhD+yRsUMsJwgI3POHY7SA
 34ku7nhI0uukOJMSKG8MDziGwHry6wdYxO3jfR9IjdIauRywcd9/Ry+MSqHLd8UXNhTC
 AoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752462007; x=1753066807;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FidiboXZ0gzp0Kec1LGu7nNmgcY3DYoC/ILAAPmTqbA=;
 b=NpO32ioWLYXK4jDCyOacYNKvTCBp7y8vtRg2r9GY0/pIpCnvKIZeHRABczh393xdLn
 ysjFS+xbyT5ur7QNQ861aHkIvq3+T/zFj3Y6RWmwJktF1mrwGB++T4O0tKyClbaZXpDB
 /e2OSWkvQv2bHeKUD3SGtM0s0/JAxOj1GzcwFZvzbDKxR1+qBlYlJ9hdN8J74c0EpBoZ
 YmGnD2R5RZlTYF5ZhCXzEap+vm92Ii9VhvGNT1yPnXHUrdjC4YfFAQD/4AO2ix8g1Iaz
 R6pxAxPkLr7PESl0c051wUWTuCwidF2dUT8nDBGZLYFV69jb8j9beT04eu3CKSomYrsn
 UpeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXvpj6GMbpgGKvWHj4b64MW3Z1O60K3i3PGn8k4CAAtSYoXEC0u1X12gyRXfDGH+r/Py6/fUN1Hqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxjqtss7lWHBLcCZLZIFcgXS79RHUl4cd8cn7DaoMbn3N7qRZX/
 aVKWi6dmzZEaj3MMBN1dl9gQJg4I10yhN6oNsCJcS9jDYoN+UYlwwMES
X-Gm-Gg: ASbGncv+JWRx8D4nAWNicapx48QgEZMCLGHsHpzPTYZjhwb4C6+ji8YioLrbAJQW85K
 M/Yi+PGvW23PZmnSepn2nFSyubbt5nCzUO7OxjTXYfSnFVnc+/CaaNohNOqQ4nGDaPOBVHUOQQf
 XMJ3FqJ+P9eo4WHlr8ki7aSBtDK+l0O+UzOWi9TIPrOUKYS8iDr9LDw3hvP5KQXZ4iuGeRqMMOv
 l9zNjpsLN2W6nNA/CSZgkgG6TWcVK6jRFW3PzIBdFW3EKxKwrSY8vFDAeKEFFg8Uszzd1WGA5+S
 j0KDa3HGjBQpEOtyaRnecZaNz5lJusL2/DCYRqxEx80aco9hJ44hjnYwT/bymxNNnyAKIsTAqgB
 JEYLG48Er1eU5/renwWY1uWQ9f30/PpqKRNqN/4lK21xCTVjZg4s=
X-Google-Smtp-Source: AGHT+IH5caNcot5rufCM801pMKMcJNnVBxs4MQDUCmauS0GuJD8f/jmEIiUwQJLStIh8Hs9SG+uPjw==
X-Received: by 2002:a05:6a21:3995:b0:226:d295:bd6a with SMTP id
 adf61e73a8af0-2317ad4d434mr22221164637.0.1752462006623; 
 Sun, 13 Jul 2025 20:00:06 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4af33sm9034577b3a.122.2025.07.13.20.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 20:00:06 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Mon, 14 Jul 2025 10:59:39 +0800
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Mayqueen name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-drm-v2-1-5d1a2e12796c@gmail.com>
References: <20250714-drm-v2-0-5d1a2e12796c@gmail.com>
In-Reply-To: <20250714-drm-v2-0-5d1a2e12796c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752462000; l=911;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=7tai5uwBpFBvYaeY6h5Abr0Rx7uTXpN3nWfu/5kwtvM=;
 b=PTk6z5OttFAwlkOYLaSqtqEFMcQso17k4gOt5F0dDpANZ1EhfqHAnmQlUvSrxPf9Y+e8msXU+
 Nq3uo1ge796DnUaLs37szJr4K33FI1cYSaQrRh1Gs3ktOGLbGd6OXyD
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Mon, 14 Jul 2025 07:28:12 +0000
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

From: Wig Cheng <onlywig@gmail.com>

Mayqueen is a Taiwan-based company primarily focused on the development
of arm64 development boards and e-paper displays.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..9207c25a3490a3aa5cc9d513290e7890799f92cf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -916,6 +916,8 @@ patternProperties:
     description: Maxim Integrated Products
   "^maxlinear,.*":
     description: MaxLinear Inc.
+  "^mayqueen,.*":
+    description: Mayqueen Technologies Ltd.
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":

-- 
2.34.1

