Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A6A4BFC4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3590E10E231;
	Mon,  3 Mar 2025 12:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="al6bWi0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119FB10E231
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:05:15 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54959d1a856so1861800e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 04:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741003509; x=1741608309; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZD/Y8XoH6xZnndtrVVRfg4SWXIuS1zcDn5ZHGdab0Cc=;
 b=al6bWi0LWFtfdyzG2LrYdKQgaTAOExamGJtAD5e7xolmy+C7/mebo3W6jttWfAOelQ
 xLIz1iGu9aoMFcafEC1Y7U0G2x+85DrSNSDYrEYWWNayjUjOiuaA92Iw7E/p6MV/L1LS
 ZUVxYCehvXWVn+beOi19onyiS69rJT0qpwjuRYyhfHdJsHaD/XsnTvspfscSnTSFSya7
 DiaEChgxU6zv4s94YARialh4fNMYkehXYhbRGf/aFeVZjF6rbhfvNoHuDzdVj3Qu9d1a
 Z18ehKjCeyHQ+B3ZjlWLcHHXNkPihP89bEJoSd4yuruMKbOdgM80w2eFTsVkvMgXfaFg
 9NZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741003509; x=1741608309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZD/Y8XoH6xZnndtrVVRfg4SWXIuS1zcDn5ZHGdab0Cc=;
 b=ayTKFY7CeOAIJDT3fEqlAkexmblboqjFiDmLLZsG5SqGKenykkxqrz8WBUmKfflsx+
 FO5LzIFKLN4VtY6POq5ZSU3tItRXMhpIU+GvIga2qzeFpA0s+ho8grdcmpM08CE3j/8L
 TwfDLKokLmsMVfEcfiqeVVuIZ9Z7pe3iU4aOkik4SEbLYLDTd8bQ0S+2ob0OOxbq1b98
 i1CWzGAAeSPnuaXuLa3/3FVizzVI5d3D1a3ro37DT/Geu9NNPcGqvDW5rwPrvPXYoOLr
 czkr3gv+xVBE/SK8PdtaVefslz54IU/WZrYavczlM6pY5PXVEnlVJrmT94uv4IjELiMZ
 gYIg==
X-Gm-Message-State: AOJu0YzTxSbOYKXbQ+35XZ6yRaPvL2543f6FgtjKxWIBnsM9jgYbuYRK
 xtXLfQ1cq7KUer4toQ6B+TD2UYlPGbQ5UxaAjdS1kMTPT6hZPq5i
X-Gm-Gg: ASbGncsl9eF4CNw6N2TQ4wKzHwRsJXpaCK6TyGe7Jpj3YVU93oSt2AAZycXOfoPD6Dh
 NkJqfF3djqlrHTliXFekgAjZiyaCxuYk+KVOKo0sY7e5AO9ey03f0x9pIIhXOYIY3FZOhqLUk+B
 xqDul0Qyi1oHDM4gf/2Dr+llNThH/j82WJ28/XNxDj0SIP2qLLxbdEEoML5EcBaN8IMx12GBO0w
 6yhVrtlQm3Gu0BWRjWUDxiTxJ8NAKXTa5uYBAAvSM3JOUso46q6uayscwIobRXxP5tYUp6CQGyB
 +Ig6rF05fB5OXhBJ7L1CSYInA4CNtjWlfRcO
X-Google-Smtp-Source: AGHT+IFajLosPc/MMTY5likqjVO4/GgB93fvKU661xoydwj1RgBeY4c9Du1+nVVmh/F5sHfpMzHNmQ==
X-Received: by 2002:a05:6512:ba8:b0:548:878b:ccb3 with SMTP id
 2adb3069b0e04-5494c3756a6mr4633661e87.25.1741003508733; 
 Mon, 03 Mar 2025 04:05:08 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549576b88d9sm869095e87.12.2025.03.03.04.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 04:05:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] drm: bridge: add support for Triple 10-BIT
Date: Mon,  3 Mar 2025 14:04:52 +0200
Message-ID: <20250303120455.90156-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Triple 10-BIT LVDS Transmitter is used in Microsoft Surface RT and
MStar TSUMU88ADT3-LF-1 HDMI bridge is used in ASUS Transformer AiO
P1801-T.

---
Changes on switching from v2 to v3:
- place mstar,tsumu88adt3-lf-1 alphabetically
- fix typos

Changes on switching from v1 to v2:
- sort compatible alphabetically in schema
---

David Heidelberg (1):
  dt-bindings: display: extend the LVDS codec with Triple 10-BIT LVDS
    Transmitter

Maxim Schwalm (1):
  drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1

Svyatoslav Ryhel (1):
  dt-bindings: display: extend the simple bridge with MStar
    TSUMU88ADT3-LF-1

 .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
 .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
 drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++++
 3 files changed, 7 insertions(+)

-- 
2.43.0

