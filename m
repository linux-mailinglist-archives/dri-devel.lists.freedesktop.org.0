Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA246A2D5B4
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 11:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383FF10E3AC;
	Sat,  8 Feb 2025 10:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="AQNwu128";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F4710E0CA
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 10:53:34 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2f9bac7699aso4271028a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 02:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1739012014; x=1739616814; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ifyUzZDgKebdTMDynBzlQYZwVvqMuxRcC6rov9fIYS8=;
 b=AQNwu1284MUofnLbILLCnupgXSD7syJO/pkZCkzGTwPHz42H0gEg8phv39xaRyo7FN
 wZQg9g8EeoGtElHX7d0n/X4PZbW4INbtH3IMUHS3LVF7O8RYaNbGVtFEDivTK3hJNtk2
 4efu+6mqh88aD3p1EelNVLtx0SZP5CqIFG4sqJPCRo4D42TRdPR3rJWckYFXctF2+SLR
 E1P2fGx3Eh9esihgmmKCcPaI0y3q7eBR7W2TZSfULsqpZ2Pb4HGsnWGY2RU7vSPunCOV
 EFGJ3E6O55OE0DYO3ZLXtq/FS/u8JZ75xcvRnQk0C28NfvP5IbXHEwTGntXDfoh5BRw1
 tZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739012014; x=1739616814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ifyUzZDgKebdTMDynBzlQYZwVvqMuxRcC6rov9fIYS8=;
 b=Os0r0Ld+PfcbnOrAKaYXgmMBBAYeClA44Nx8S+DxbtrCI8AG8f3Z+AOJbNT+VEXi3C
 oFtCJ+amVdWl3OyvQ7o9p9D5mPy9Ff47kDi5ZP/zEq9ncWMID0z/+MZ9c53fXY7PaOZJ
 8bNfWvVLPb1ix1j4uYkMtsqXZS0nWo3/EziqDnClr7O93mpVnJtM2Immn2V/jWQrbJI4
 AEEQSM8sfXTS9ecXg+3s2aWnaN0Rxs9V7ey9cRQBQs8PJPSJt9Fa7/9Gx6ZPaw5aUgfX
 0m/fzi2Bk8Jr4eSpRceMCiWlG1nc35IQS6tuNouiiKQE+KEamDvtc7AwWpB3Yi705a3E
 YPGQ==
X-Gm-Message-State: AOJu0YyOb53tMwEXVdzt4fUVZXDjo4GK9d3Vz3NtHGQ+xDJnnAceDsN+
 Q+wfoHU9dH8HZk3uDSijywQvqtCuvRZ5uPM22gvfuueOJpBSkCW+8opJEfSQboQ=
X-Gm-Gg: ASbGncuhRb89zQwWgufern3q7X9ojMyP3Wc7fur54l5IBb6RIBbRliCZfTJGZso1Agx
 bU/0pipnDThjtpqBAsOj4SyZOaZ6I9wBIyoNoQt9g/wbwVxlbXd71cRGE1eVFUck0Q/XsWnN/xv
 CXnva1YEhzqgq6rQWWIGHD7ZOXlo75mSM0vmGioiwPWacQO8pt7oB3JpdXS9LEXHiIBDSJSn4jy
 qD0zzYvZtYD5curRD1+TxaTwp9QnFmA5a093A9ZF0dOf1Ai5zKCH/d1CTYTASTgrsuyTeIL5sMD
 IJue8+oLOOCIpUW8LtKmIMgLwrtiNNGq10LrOL3wzcrzvVSC8/RTncGGjHyePS4=
X-Google-Smtp-Source: AGHT+IHy+71MYu/SjllpM7v8QcUoDCgx3OAzOTwkCu/N39mwnXIJTHVNc5qk3wqrJl8nWKdmmQrJdw==
X-Received: by 2002:a17:90b:3fc3:b0:2ee:8008:b583 with SMTP id
 98e67ed59e1d1-2fa24274b87mr11174906a91.16.1739012013966; 
 Sat, 08 Feb 2025 02:53:33 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa36f185c5sm2142003a91.16.2025.02.08.02.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 02:53:33 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v5 0/3] support kingdisplay-kd110n11-51ie and
 starry-2082109qfh040022-50e MIPI-DSI panels
Date: Sat,  8 Feb 2025 18:53:23 +0800
Message-Id: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
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

Both panels, kingdisplay-kd110n11-51ie and starry-2082109qfh040022-50e,
use the HX83102 IC, so add the compatibility to the hx83102 binding file.

Both kingdisplay-kd110n11-51ie and starry-2082109qfh040022-50e panels use
HX83102 IC, so add these two panels to the driver panel-himax-hx83102.c.

Dropped Neil's tags since V5 is very different from V4.

Changes in v5:
- PATCH 1/3: Both panels use the HX83102 IC so add the compatible to the hx83102 bindings file.
- PATCH 2/3: The kd110n11-51ie panel uses the HX83102 IC, so add it to the hx83102 driver.
- PATCH 3/3: The 2082109qfh040022-50e panel uses the HX83102 IC, so add it to the hx83102 driver.
- Link to v4: https://lore.kernel.org/all/20250123064758.743798-1-yelangyan@huaqin.corp-partner.google.com/

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
  dt-bindings: display: panel: Add a new compatible for the panels
    KD110N11-51IE and 2082109QFH040022-50E
  drm/panel: panel-himax-hx83102: support for kingdisplay-kd110n11-51ie
    MIPI-DSI panel
  drm/panel: panel-himax-hx83102: support for
    starry-2082109qfh040022-50e MIPI-DSI panel

 .../bindings/display/panel/himax,hx83102.yaml |   4 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 260 ++++++++++++++++++
 2 files changed, 264 insertions(+)

-- 
2.34.1

