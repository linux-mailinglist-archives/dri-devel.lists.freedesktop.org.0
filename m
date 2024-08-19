Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41779576D2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 23:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA8410E02C;
	Mon, 19 Aug 2024 21:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="alaeRfbI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D416A10E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 21:50:17 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-70936061d0dso2963327a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724104217; x=1724709017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZsX0vPn3VODiXEEmMvN5E790VYxq/T9uwkFRTYpicVI=;
 b=alaeRfbIzVHYaSYRD+GdOui7Wal1w38ECaPiUP0w6QN0rznaFVqfRApYDUPUBdIwPV
 S9ObPO30YlwJmmw++A++/Y0qnMXu87Cj/hpbfhjAZUnEY/dO6siXbyxiNLlAlM5wlZJa
 Xm8A6J0LH2HTLqBVeeosTIhU/r0FNF14gECxGmvERSko3ZRLzXCiJEju4+w+CXp8isju
 OgXBaOk5/UKaDZ6tJUhp8DUXqvAmqH6lqeonrjqPzZ46fcgvV/BpkzAPkUV9RmGtu2Zx
 MosCbKibjKWAgScekwMi1mb/TN3Y5ugKFGiVcORqn4M7HQAabtyzcZsXCIMoqRu4YDmm
 SLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724104217; x=1724709017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZsX0vPn3VODiXEEmMvN5E790VYxq/T9uwkFRTYpicVI=;
 b=OtWsPdEIQRvUOqiUtvpcFpr50g2aRz0l0DYkVoSJ3GCzPTSxYtPzXH8PSwSA/2GNiV
 P/fnMqQrrjEAnaRP9sESELP+p9izUEP+V+PwHnmZ22FU3/369HUjowe1suNAEnDSLziG
 qpVavqIo8LmseqT4mLguH6zVwgPcBbjquMt3U5pmMM4KidUZFKuqgvlXgOM08KY7o8JA
 eyJSLzEuOhmNSQ8Cr+0zmWVveF1/uphiEs61GJYfZxaDyGxD6jjJxzyAqySYSed/MdkH
 iVEBya1P0tLOGdtQgiFeKGQbCsqceVFuqfhQn+cq1vUzmXza48eBQPCcdjdIcuaneFk6
 75mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlCA3VnC0wCb4KFBSFKIGFPh+pN0Z5ysMk4SvTDU7WHUM6V8ZkhanJ9IQp354d2iR09YdFPJW5CLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yycn8/2oLFIQqASdLXlq6HpSEgYGKZgLqmB0+RrKMZ7OsKqYweR
 7fBI9UKQic2bq3yXIWYf1WmQi46FSmMXEVPUrPxiGyA1G+t9CCf+
X-Google-Smtp-Source: AGHT+IF8lRfjvuUw72IwxAv1oLnDVPpLNWK7tjRn9lxxCoLd1VPxtPvwrsyGtsANNHGHJ39LlnYTOA==
X-Received: by 2002:a05:6830:43aa:b0:703:68d0:a267 with SMTP id
 46e09a7af769-70cac82e9d6mr10568079a34.3.1724104216717; 
 Mon, 19 Aug 2024 14:50:16 -0700 (PDT)
Received: from localhost.localdomain (23.sub-174-193-28.myvzw.com.
 [174.193.28.23]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454e5b2b0dfsm2432741cf.53.2024.08.19.14.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 14:50:16 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: christophe.jaillet@wanadoo.fr, Alex Lanzano <lanzano.alex@gmail.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v4 0/2] Add driver for Sharp Memory LCD
Date: Mon, 19 Aug 2024 17:48:59 -0400
Message-ID: <20240819214943.1610691-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.0
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

This patch series add support for the monochrome Sharp Memory LCD
panels. This series is based off of the work done by Mehdi Djait.

References:
https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf

Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
---
Changes in v4:
- Remove redundant dev_err

Changes in v3:
- Fix file path in MAINTAINERS file
- Address review comments
- Simplify mode selection based on match data instead of model

Changes in v2:
- Credited Mehdi Djait in commit messages
- Renamed sharp,sharp-memory.yaml to sharp,ls010b7dh04.yaml
- Using strings instead of int for vcom-mode in dt-binding
- Fixed indentation of binding example
- Removed binding header
- Removed extra whitespace in sharp-memory.c
- Fixed error handling in sharp-memory.c
- Added match data to of_device_id table to be in-sync with spi_device_id table
- Replaced redundant function with spi_get_device_match_data
- Sorted header files in sharp-memory.c
---

Alex Lanzano (2):
  dt-bindings: display: Add Sharp Memory LCD bindings
  drm/tiny: Add driver for Sharp Memory LCD

 .../bindings/display/sharp,ls010b7dh04.yaml   |  92 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  20 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/sharp-memory.c           | 682 ++++++++++++++++++
 5 files changed, 801 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.45.2

