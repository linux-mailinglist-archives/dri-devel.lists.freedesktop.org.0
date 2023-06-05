Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F44722B26
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 17:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E292210E2E6;
	Mon,  5 Jun 2023 15:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C025510E2E6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 15:35:46 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f730c1253fso17359095e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685979344; x=1688571344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=htyzL0DjV5Lc50hokO9Af5DiNz1kzZvBY/56oEJzmVM=;
 b=qaF4+yXoTFnr3l0g8hEf2fNbEUSs5asWf98he64/HqfXZ4im2qr0wYATDTZdOAATTX
 Z8ESksFQz9OfbhCyu/KUNtTcLCyjjbx5iPUZhXAxh38zuEfwatL15p7EGSNhNYI3Uu/R
 gY+MsXdLyAUeawOi3qNa6wLXmddXf2ESs67hv+VTcBJD+DzfCq8px3le8wftcOImRtWC
 +XVI5g6v2mCS089T5oKI9eGDxuAcOLLJSDHIGyoPUrnla5q9DAZJIO1zkQvwA1xOw0wX
 ch/y2Z05doMVavDXZwlCSw3nyrucJ/SkPzBplSeJkqBFIAzHB/4iLsxv4yoE+4iBC9gs
 FjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685979344; x=1688571344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=htyzL0DjV5Lc50hokO9Af5DiNz1kzZvBY/56oEJzmVM=;
 b=CEhmc9ciNqedIaNW01Ib/cRSYrNYy7dp9D0DPakaf4EcXdfVLU+cYIqUvb93NnJlE/
 MhBdj8ZtiTRsK55uhXRcAb+eVTK2EYYarMtpATa+T9YfeqwMIfVN+KdQB7tqC/kt7DLh
 3INUFtP1tWhCZDVX/XZGo3FQVzdFwSy2rCV4yAxkSfO5p5T1SiV+TxlO7xVa1eN34fc3
 J8sRyQP63ar087qaSa3Efe5o94YJ73xrwcJAa6BHPSmxk/jKhQaNM+X5z99pqjLcbDW8
 fZX8lBw2F6r7jCp+hCCusCi6q9nii8aqL8RyfZYO8WTI3T4ZR/kUudZ0/SF7/vKfOTVd
 THNw==
X-Gm-Message-State: AC+VfDxRDYa00/YetFrrO5xrGiGRGDZ7TD0X+mQtHkgCNjarBOclZ3FI
 12jxTXM1kWh0SYIDyzWTP5w=
X-Google-Smtp-Source: ACHHUZ6k2cu5hNqWNN2GDgt+MuYzzz5eHpOFCbz4N/i4rluW/D/mdeKV38uycJVoLCYjFYL77p+Qjw==
X-Received: by 2002:a1c:7413:0:b0:3f4:298b:d925 with SMTP id
 p19-20020a1c7413000000b003f4298bd925mr7525469wmc.41.1685979344453; 
 Mon, 05 Jun 2023 08:35:44 -0700 (PDT)
Received: from fedora.. ([95.168.107.36]) by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003f7298a32ccsm9741165wma.41.2023.06.05.08.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 08:35:43 -0700 (PDT)
From: Paulo Pavacic <pavacic.p@gmail.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Subject: [PATCH v2 0/3] drm/panel: add fannal c3004 panel
Date: Mon,  5 Jun 2023 17:35:36 +0200
Message-Id: <20230605153539.497602-1-pavacic.p@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paulo Pavacic <pavacic.p@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fannal C3004 is a 2 lane MIPI DSI 480x800 panel which requires initialization with DSI DCS
commands. After few initialization commands delay is required.

Paulo Pavacic (3):
  dt-bindings: add fannal vendor prefix
  dt-bindings: display: panel: add fannal,c3004
  drm/panel-fannal-c3003: Add fannal c3004 DSI panel

 .../bindings/display/panel/fannal,c3004.yaml  |  78 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-fannal-c3004.c    | 319 ++++++++++++++++++
 6 files changed, 418 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-fannal-c3004.c

-- 
2.40.1

