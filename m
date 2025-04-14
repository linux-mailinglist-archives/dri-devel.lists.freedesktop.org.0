Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBF9A889C6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 19:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206B410E341;
	Mon, 14 Apr 2025 17:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fACcm+I3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9599F10E341
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 17:26:55 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id
 38308e7fff4ca-30bf5d7d107so39208101fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744651614; x=1745256414; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R0Q9W/UyINLoujjybEOJmE4FHkHZ3d3gRZqNAi4IuHs=;
 b=fACcm+I30DvNe2VDiWua3WoPwTt8fa3uo0597uKho4DWHXLolcorVnOVSemeTJIUyA
 YCVsg3WGRywgYzgGFrastDwgMuAQjdbLgPtfMIAMPe5DD4i/Z7U6N8hMOHwphXeNonsc
 M5VdPTgCwo9kxMctc0hiwjSh5gaaunDsWI3LCYtVUxi8SvULBp3LSAbyKkiKn4V5kSav
 7YTNvoGf5GGhIE5Nh4WYFSngGfScW8SgrowUnc/ToiXCbXzDDvTlw4gVMArCRhsz/CZQ
 f8DWtvHH2Zp9h4KvPNJpuMKBZG0LnGqL42MBHjO5yHj5LJIIge2LUnG7xOdQXXJjZqBW
 VqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744651614; x=1745256414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R0Q9W/UyINLoujjybEOJmE4FHkHZ3d3gRZqNAi4IuHs=;
 b=VsAhZQtTbiVU36etRLiTKihTkWrdYYKQ9gzfz5JCmb6wSPSnB+loeF86fTHwv/sF40
 A1lPXcXMe2ewp7lh4XMVy84vARPbhj7XYVsIarJ0C+CXw0bU5SdvjpJeljWVU+W0m6hK
 PyUir2qcHOstrvrzY/+9pvChWl/Z70qe+EB/iXr9Z8xTpX/SdSoblLOWyK6SsQ2k32w4
 aN2cOxLlbs0BdmOm5JTZd80FMygoArloDNwogXkzTRHqPObaRa0S6QsNWdXvpecywK7/
 7gMVaqyBgO2b00xY+Sgds/Di74MZSNqL5VCscUqYRR6Omy1VyBZGTCDR7oMc0X2sAu3u
 t9YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHg4pVN0/AQ0eOOTI5Pt0HM6w7nwuCK8nBvWwAs/lNq6Tn2Q/i984p1MaYMrR7YAV/Jhn7px//O4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9Z+AHBXB1bxOpJnfK/57Lq43sHp4TehCn2DBRanla/uR8+KE8
 6Z2XN7aKvhUPVEfzUN8wqDBB4mGfndjXjWg/Qrk7tzOcmSB4MM6D
X-Gm-Gg: ASbGncv/W5BrLGohIXkJ8XFbhDCZ6BpMkEzeDnCWrgZu7YaUHuA0sVEboP1kgz7c7pG
 WFIxCIfyRNop01O+GlUh2g+Y4aQ/+MVVKjqNxFunsHIeBF3hl0jgojkP9C39C2rRGEmjVr+HkrF
 VxtaT9uigrFga4nzQhaHbf0mRujUFXwyHVGIgSeYDZmzwNuezdDTAOnmS93xss83764y9iPEQPl
 A4A2dkPBjBiAM82BaWyvMuBZcf9TMRSbrk5+pnaWkua2yHhnbxu3WV8mUrV9UetSP+UuHAGi4cI
 8qFVr0aqfViWuhFxEsO4lcjBXtWLVEkyrX8w5e9SVGBsOyGbjsPf9g==
X-Google-Smtp-Source: AGHT+IFBUL3NrvZFbM5PiBSoVRPxqIUBIH5mBMeFKQSY+Dkpj+L+r0Dze4HH2rB7/wId7ZvW3RgEIA==
X-Received: by 2002:a2e:9a04:0:b0:30b:f0fd:fd19 with SMTP id
 38308e7fff4ca-310499e1c62mr42302931fa.16.1744651613492; 
 Mon, 14 Apr 2025 10:26:53 -0700 (PDT)
Received: from PilotMainTrash.lan ([178.34.180.83])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cc441sm17806061fa.35.2025.04.14.10.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 10:26:52 -0700 (PDT)
From: Alexander Baransky <sanyapilot496@gmail.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: Alexander Baransky <sanyapilot496@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add Visionox G2647FB105 panel support
Date: Mon, 14 Apr 2025 20:26:30 +0300
Message-ID: <20250414172637.197792-1-sanyapilot496@gmail.com>
X-Mailer: git-send-email 2.49.0
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

This patch series adds support for the Visionox G2647FB105 panel, used in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Testing has been done by me on sm7150-xiaomi-tucana. According to the
downstream DTS, this driver should be fully compatible with the
sm7150-xiaomi-toco (unfortunately not tested) without requiring any
modifications.

Changes in v3:
- Don't disable regulators in visionox_g2647fb105_prepare() if
visionox_g2647fb105_on() fails (in patch 1)
Link to v2:
https://lore.kernel.org/all/20250327163750.986815-1-sanyapilot496@gmail.com/

Changes in v2:
- Describe the power configuration in commit message
(and fix the sentence style) in patch 1
- Add Krzysztof's Reviewed-by tag to patch 1
- Use a static const struct for supplies in patch 2
- Fix identations in patch 2
Link to v1:
https://lore.kernel.org/all/20250325155756.703907-1-sanyapilot496@gmail.com/

Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>

Alexander Baransky (2):
  dt-bindings: display: panel: Add Visionox G2647FB105
  drm/panel: Add Visionox G2647FB105 panel driver

 .../display/panel/visionox,g2647fb105.yaml    |  79 +++++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-g2647fb105.c | 280 ++++++++++++++++++
 4 files changed, 369 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c

-- 
2.49.0

