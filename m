Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9ED992057
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 20:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB4D10E1A2;
	Sun,  6 Oct 2024 18:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OHmUPCFH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4C910E1A2
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 18:21:05 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5c882864d3aso4134633a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 11:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728238864; x=1728843664; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PS4ett3l2EHxVZaMcuE7ULJZXssUAZ9snL0a9gceBMw=;
 b=OHmUPCFHeEAOZby22w5j62DYrbUBcxrSqv7IEmXDICwgUMvJa1y8Chg+U3dSLq0ocE
 0t1LNjD87bFI+u6s/B5PXrVSGosvNmKehX30IuNnDVG7VZRvVuQJ4qJoaIuNNjGCQzoL
 U7+LdLisVGh4LsP/tuAlIPc0jsrZ3uOQ5BsNBj+91HEUuKGpeT2gUjtzpO+uAIje6OqB
 3ZxSMSQDdczw2p55iAerLMNUX6S/RDB+wFT/HKMfdeD13b774ojNk2Mcsn5jmHQqxXVb
 W83jFAOCjh2Y1F9Nxs9FGu00DYZKYcbX3XE2VF0Ms1/szf7yUcyyfpv7CXE75U5isZ9h
 eIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728238864; x=1728843664;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PS4ett3l2EHxVZaMcuE7ULJZXssUAZ9snL0a9gceBMw=;
 b=jlmfhbnugk06MF0QkFQq00QTZIoq699AEMeyLqGz1t9t4ARYVqbQvJux05Fo8QUia/
 c0qYCl9kHwJEmLemN6zeN91108uZXwLIe8bT8y8vj08heZGT9EFreLxG1tFPbrts4VRC
 xGlTpZMLVhqarFn5sGOB/1JtihuIwyqjtDmYZyg/SraOnatjP+43e8nNyOrljjVIqXE8
 3vUenp1FupJU+hmeFsZcj5yDsKL1WFRYr2reCCCljkaN9Y8u9T2Lj012X6D5ESfZApDO
 +YnZJPEZkzo2JaCIFsZlI3Q+qeBPLHwDngj+TMoX27P1g03LMfnV/VO1zIxsHGq87Pnn
 eWFw==
X-Gm-Message-State: AOJu0Yxe6YGIlarQ+qbUKADCsa7awrTws0DFs4RF5wvPPOb0EPT8QiXK
 DLyV6jFnsoNqrCKi6o2mUAeboPqatFZpqqQg6aEKvBLB9JO+a3ht
X-Google-Smtp-Source: AGHT+IGuSjKg3/X6gdYt9rPMCtuV/cAyywZeJU0HycE+dAIVBfs5TEzseaBOxUam0JjHnaS6J1WYEg==
X-Received: by 2002:a17:907:3f89:b0:a99:4879:ec2d with SMTP id
 a640c23a62f3a-a994879ed0dmr326507866b.5.1728238863442; 
 Sun, 06 Oct 2024 11:21:03 -0700 (PDT)
Received: from [127.0.1.1] ([109.126.148.51])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a992e5ba407sm294080866b.14.2024.10.06.11.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 11:21:02 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v6 0/3] Add Samsung S6E3HA8 panel driver
Date: Sun, 06 Oct 2024 21:18:18 +0300
Message-Id: <20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvUAmcC/43O0QrCIBQG4FcJrzOcTre66j0iQt1xEzZXaqOIv
 XunIIpu6vL/4Xz/uZEE0UMim8WNRJh88mPAoJYLYjsdWqC+wUw44yVTRUVT1vHUZ7BdOPiQoY0
 6483hfEw5gh6osbWqJTPcgSDIGJ2AmqiD7RAK577H8hjB+ctzd7fH3PmUx3h9vjGJR/tarH8vT
 oIyCsIppTgrKm237aB9v7LjQB74VL7BdSH+AEsEecPBNdLKuqq+QfkBcvUHKBEsrGFQClBcuE9
 wnuc72QlAbIcBAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728238859; l=1598;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=vECLD/CXQIREz3jN3PkpOzpo7UsKkPVEAIX/Y6pK4QE=;
 b=v3siVd7HJ2mwX/KJp7hwJYmu8D3x2Q16Qtb0S+zlGwj+Wg5De9/4+V8oCWKSlYZcrnbMYvjOl
 TIR38Ex7UrEARufeSN9SKYnXRUs4A5LwLtLzOUYyEn5Sut5/jPJ0Spp
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
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

The s6e3ha8 is a 1440x2960 DPI AMOLED display panel from Samsung Mobile
  Displays (SMD)

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- add new patch with mipi_dsi_compression_mode_multi function
- Link to v5: https://lore.kernel.org/r/20240926-starqltechn_integration_upstream-v5-0-1cb0e43e623f@gmail.com

Changes in v5:
- Split patchset per subsystem
- Link to v4: https://lore.kernel.org/r/20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com

---
Dzmitry Sankouski (3):
      drm/mipi-dsi: add mipi_dsi_compression_mode_multi
      dt-bindings: panel: add Samsung s6e3ha8
      drm/panel: Add support for S6E3HA8 panel driver

 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml |  75 +++++++++++++++++++++
 MAINTAINERS                                                          |   6 ++
 drivers/gpu/drm/drm_mipi_dsi.c                                       |  16 +++++
 drivers/gpu/drm/panel/Kconfig                                        |   7 ++
 drivers/gpu/drm/panel/Makefile                                       |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c                        | 342 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                                           |   2 +
 7 files changed, 449 insertions(+)
---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

