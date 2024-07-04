Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7A0926E8E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 06:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7111A10E00B;
	Thu,  4 Jul 2024 04:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Ikpwk17Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7B310E00B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 04:50:28 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3d56285aa18so104992b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 21:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720068627; x=1720673427; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n3gOQ/pcPbb3LfkKeHQWEv2OM2Ynwqz5rb6saZsnn9M=;
 b=Ikpwk17Y13m15X04d0OVG4UjBZSiwKPuQnQk+f18zHtr8qoOEceDsXB4fcTj0VGSfa
 nZ+mJmU8HDV8WpYobVr16V+Wmbl5MHQ3nB1Sc8zcKmSGMi0y2fiizQ3PXkwK5niUDmsS
 Fdfxw1b/RI8Jak0dL8bENbwZrqU9qKW5vUx84EjSIoElxaL5uMrSA3SkLLI4L4IWZ/7C
 8iUptWQkA3VQLhbEyUpXkvy9Hx84AoLVoOTC0bRsNWopS+eO7fMU0mI6V3Z3gCPh9baB
 F0X1But82d9zVrn4nPMWX1A1EviGWK6OhE5ogRHOdHJljJWFjkT5lbokwkqbvMb/3txR
 px1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720068627; x=1720673427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n3gOQ/pcPbb3LfkKeHQWEv2OM2Ynwqz5rb6saZsnn9M=;
 b=ix1fFOuLUcqBadD/YQXak6HcvpyMgHya+M7/b1qBjkOjTiDEnZnB9MiWvRFb+mRWKC
 ScMsxFDy1oaY0BRU89ljDvQfl/qagP1KTuDKbKQBbbEQckZ4pUIrYCLHTAcxEE/nAoRZ
 Dn0NhLxQaOESB2+tNlyjuq8Iz2qqyZMidq9eCxMGSFdWQqfW0ZNWTpnHZbkU05ieBi4F
 wn1B2KcZU1a8Xw9TjYW+51nvA0wPFme7eTuBELaS5XGyJueOwj2PCGvnsA1MGxUpi8AT
 KaK5jm/o1C+qjxVqQClyLy7N/qx8UkPPnj+U6loUnj6oI9R95cKW4zKuOTaZUtUMT4jM
 Oj+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxnLAyGWN3/2fh0NQuPyWPcHYhnfjL9m3DgkQiKhHfUQoaAvNGcRQ9JSVGu0r/T/jfsS+aAWmYeeT+cFoXT0oqhpCXvKa1PtRfz+MDURfh
X-Gm-Message-State: AOJu0Yzj3Q29RQRnekXf+woZi7JtuBMkLzVsddpKvfvycSGvrQLzE0dQ
 s4qG9f5IAqFiqpqjdcSXWx3/Aqv0O0nCeQU31bc0qVJcQUCb0Ol05cd6/78dDy4PUNNZSOF7474
 /
X-Google-Smtp-Source: AGHT+IFh3qW3mPVxpPZd9G4TjfK5nxFYTDAaYwjcRaRtPMbxGNm18LvdwCp9WL+YLZdj8BA4+9h2Ug==
X-Received: by 2002:a05:6808:8f4:b0:3d5:5d95:fb0 with SMTP id
 5614622812f47-3d914c5e376mr465253b6e.20.1720068627347; 
 Wed, 03 Jul 2024 21:50:27 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70804a8ec1asm11291826b3a.188.2024.07.03.21.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 21:50:26 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org
Cc: lvzhaoxiong@huaqin.corp-partner.google.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/3] Support for Melfas lmfbx101117480 MIPI-DSI panel
Date: Thu,  4 Jul 2024 12:50:14 +0800
Message-Id: <20240704045017.2781991-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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

This series support for Melfas lmfbx101117480 MIPI-DSI panel with
jadard-jd9365da controller.
Add compatible for melfas lmfbx101117480 in dt-bindings.
Break some CMDS into helper functions.

Changes in v2:
- PATCH 1/3: No change.
- PATCH 2/3: No change..
- PATCH 3/7: Break some CMDS into helper functions.
- Link to v1: https://lore.kernel.org/dri-devel/20240702130138.2543711-1-yangcong5@huaqin.corp-partner.google.com/

Cong Yang (3):
  dt-bindings: display: panel: Add compatible for melfas lmfbx101117480
  drm/panel: jd9365da: Support for Melfas lmfbx101117480 MIPI-DSI panel
  drm/panel: jd9365da: Break some CMDS into helper functions

 .../display/panel/jadard,jd9365da-h3.yaml     |   1 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 317 ++++++++++++++++--
 2 files changed, 291 insertions(+), 27 deletions(-)

-- 
2.25.1

