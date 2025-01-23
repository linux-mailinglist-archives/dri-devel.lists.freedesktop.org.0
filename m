Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C159A19E87
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 07:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAF010E08E;
	Thu, 23 Jan 2025 06:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="dX+klvCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F2410E08E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 06:48:10 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id
 98e67ed59e1d1-2f441791e40so879327a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 22:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737614890; x=1738219690; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ihO8X/Bibunk5mKcN2BnLX6WPk2+H0kbY5VGF+D42yk=;
 b=dX+klvCGwxhtkf7ONZu1TJhmhfDD0SsAmm/9YeIDbh74Z302hEdeijD/6iaMqQCNYy
 qKyAMmJ6Mg12koQF47KZ9psbeuI9xNbdfUCZflDXLVmedyQ4ognITcIGVl8P+GvhVrqX
 +W0XYEdzKK2/XBptSzaV7pIaI+s5WZZ2SFLLBvJ/d8lFqpblHFGVA9nFDOrRL2KA2k/a
 w4N+ArCcnQ9wYdLObkdJZgXv+bJJhfgGcEO0naMvHyNjVaTKyZGz0KKqTmSlwbfP/HqO
 d+mu54r0ZLk2wcay5wBEsKw8FsyewmY3Op1vF0o+2YUcDzoX5fMC9FJBdIayCKsOqtTl
 YCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737614890; x=1738219690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ihO8X/Bibunk5mKcN2BnLX6WPk2+H0kbY5VGF+D42yk=;
 b=xOIkV+skqdzzXBqADDdQv3ctPVg8EH+i5IaVNh2g77d6meq+Zf98C4hIdnyyctGvFU
 j4YfdUf7o/i7/IWcOKfB+yGtV/+CtHELVJ72xRnkzvzCYFkujW4PcgbsgdKVRF7/4bH5
 +vllIoUmNBlUIGWx8oNnsvMsV6FB3Ve6nRhT4B4TquOsvcr9FEYl55SDWV4S1Q60eV94
 a0m1IPiXrHd8NfuA7hwUj1TImqkEdQTI+Xkb02Q6CxAgqOh+3kC8kPBbRLNf6BtKejA4
 ZmaBEPgdn2w0U3RxQfr2EJeYrPnL1rNE3l2PPQK3GdN8ayso16AkPnq8rjkh2Tg7/wFi
 17zg==
X-Gm-Message-State: AOJu0YyenekIn4JxJPFkIMww5S1ZJapVauy10cEQDX0BUvrzvyIZywLF
 nb8mqn63yIl3J7C1Edo9Od3T1+i2SKgugZoGejKmQKSWJ25xNkeyLKY1VAwtCB4=
X-Gm-Gg: ASbGncsG47vsE3wExxcJaoK5cJFLY82WN1RUENK6Y4KGkSoPxy1KNAl7VPtOEHePVCM
 SPKLjJFJLyRSYS2UxcpwYU6RsfvrBBKE6/Xfk5mub2B5LpGOtImFKdmk6dAXU17XSWiN51puX5L
 X7Y3NNuVZ1f7vKPRz7Dpmra8mwIOKOMJydrwj1IU7PdptoJobFlfGlgaED/lCshxm6IGrIxHM0c
 A9pICL5tWwkybJavMzDs29wztJlFME4JTDVbq8X0XSKW/SCUASYIVrvUvuqTMSw4HcCjGfpwPv/
 5T4zQaZm5rtou+m2YTm/UiOVDDYQmq5HAnPA4Z+Vu7S27ylU9wcT
X-Google-Smtp-Source: AGHT+IG2nhLWzY19SrhP6ztMPfsB/clKVzmRCDCQniHVFDKX6lXFY0kbEQxUiFXyIHbXYuKJx8vKAA==
X-Received: by 2002:a17:90b:520e:b0:2f5:88bb:118 with SMTP id
 98e67ed59e1d1-2f782d4ef17mr30067834a91.22.1737614890004; 
 Wed, 22 Jan 2025 22:48:10 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-a9bcc323777sm11923454a12.20.2025.01.22.22.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 22:48:09 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v4 0/3] drm/panel: support kingdisplay-kd110n11-51ie
Date: Thu, 23 Jan 2025 14:47:55 +0800
Message-Id: <20250123064758.743798-1-yelangyan@huaqin.corp-partner.google.com>
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

Provides a single binding patch with correct alphabetical order for
both panels, and adjusts alphabetical order for compatible properties.

Changes in v4:
- PATCH 1/3: Single bindings patch for both panels with proper alphabetical order
- PATCH 2/3: Adjust the alphabetical order of the compatible attribute
- PATCH 3/3: Adjust the alphabetical order of the compatible attribute
- Link to v3: https://lore.kernel.org/all/20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v3:
- Link to v2: https://lore.kernel.org/all/20250117050410.933312-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/4: Add compatible for KINGDISPLAY KD110N11-51IE
- PATCH 2/4: Add compatible for STARRY 2082109QFH040022-50E
- Link to v1: https://lore.kernel.org/all/20250116130530.3010117-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (3):
  dt-bindings: display: panel: Add compatible for KD110N11-51IE and
    2082109QFH040022-50E
  drm/panel: boe-tv101wum-nl6: support for kingdisplay-kd110n11-51ie
    MIPI-DSI panel
  drm/panel: boe-tv101wum-nl6: support for starry-2082109qfh040022-50e
    MIPI-DSI panel

 .../display/panel/boe,tv101wum-nl6.yaml       |   4 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 270 ++++++++++++++++++
 2 files changed, 274 insertions(+)

-- 
2.34.1

