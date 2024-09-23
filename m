Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED67797EF1A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 18:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FF110E445;
	Mon, 23 Sep 2024 16:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HZSmYWAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081C510E436
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 16:22:37 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4584a719ff5so36265411cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727108556; x=1727713356; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xMAjUDxOyknWcICNvHoeRR5xLaaisNjKFQiCg/h7w/8=;
 b=HZSmYWAh3rD5bQxTe3LmLdoLO92fLGTjxqKTi14QzZ3zBrMTQAC0LpAqHLfw7ictGh
 85qdpCf8Vs78mdHRk9RqYYCuR7p7/ZpHRVEyf7fUJEQfO9td2cfySvOwjSpwuK9JNuDG
 W8DRKXhgYcdO3Bz75AgJvDVPisLIIMW7aSFzfSL3jUMD8zV4uIcfW4msayAH7oFKS42W
 aUh0mJ2H8Mh3YfKS+lF5uKv+ntWUOs+MUAPTqfbrDI+so9dwwdLdnif2alQ9PEoLVjoO
 Px+PL2Vzo4Ak5cl9LUUgRY5OBuGx4DMAPGuV0EikhzigvamQl4ApgeidKN5e/NsUlkMG
 AjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727108556; x=1727713356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xMAjUDxOyknWcICNvHoeRR5xLaaisNjKFQiCg/h7w/8=;
 b=cLU9MFvk30vXXUSVUOPxov3a9VpGGG3JMaBwNscELWIWZVaRbdqbZg1pwHAX8vm5cO
 oUgn7oD3JF4D25qICDG9nqji9yfj75WUk2W1xpIfRkq7/VPlML4XWo+8Ek2V+PxE8ePk
 wN3OdbJ515C7XicFr+k5aY1lJwz7Jozi7DtH+60OKkqm6Z0HvcCF/7lVcsakrnCSpQ98
 tduOrS3SZWRLxt88DVysUKl0flSKf2Q3vjWb8NF8I+zaCMgtbl2AE6zl/xpCsDcrAfop
 DBNmFykdeeuB0GeLkzvI08/hUrUJytaVuZ3mxKqkda/b671khq6XJQSOTbEPB7svVmhE
 Z2sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXOdjoA09maTsY/95nIp12+P99zphYa4E28widY+7X+5kBlFJ4DzSmW/jGbBqeW5yeQo44G4tL9o8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRGXVUdktFsmZ7CZ9gJSiWIBFYzrn/dVnSNdIPJ27vxXId1Ct3
 HkAOjB1e4G8gU29wqwlujsumsHQIPSvRHj0gzUt6HzFRt9XTG5L6
X-Google-Smtp-Source: AGHT+IFCJxsI00ZrQnDdvugyIqeqvv9DQpGecgLpiot6gq0UD9k6CQSR8jxNdqQlbuJjiZbrcWW3uQ==
X-Received: by 2002:ac8:5d4a:0:b0:456:61f0:810d with SMTP id
 d75a77b69052e-45b226d1230mr220772381cf.10.1727108555440; 
 Mon, 23 Sep 2024 09:22:35 -0700 (PDT)
Received: from VM-Arch.gst.l3harris.com ([208.127.73.102])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45b17867fb0sm48587901cf.1.2024.09.23.09.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 09:22:34 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: dmitry.baryshkov@linaro.org, Alex Lanzano <lanzano.alex@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH v7 0/2] Add driver for Sharp Memory LCD
Date: Mon, 23 Sep 2024 12:21:33 -0400
Message-ID: <20240923162205.55658-1-lanzano.alex@gmail.com>
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
Changes in v7:
- Add Reviewed-by tag back to dt-binding patch

Changes in v6:
- Rebase off latest drm-misc-next
- Replace pwm_apply_state with pwm_apply_might_sleep

Changes in v5:
- Address minor style issues in sharp-memory.c

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
2.46.0

