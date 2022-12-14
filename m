Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE8E64C838
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 12:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11CF89B12;
	Wed, 14 Dec 2022 11:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB3B89B12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 11:41:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id co23so18997832wrb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 03:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mnLxEEtkwDMb5Dhb/JDaNIG/lWifqcCuQhOSzipR1SA=;
 b=isJHvU1ub3SUdofMT6POFlCZBGQXJa/2ddC2lMYjMnh/iQF2KhgRYYlVNRuWh8NhIl
 bwmLlXU1ijTvdXFPjjsUyYDC0ZY4mGF2oF8uD1oFNZzVZPx7RzUw+4T6XaamOr0zBCjD
 Zw9jr/oa4vsEG3BOM92wPawkF0dwycFYuLCKoo8BQIxQU0Zog4XSR4s/foTLjPlr/xLb
 ciEGmD7ticxAPu4Wf6RUpFZBv3rGXo8V/ELVCccNNUqPB5YyL9Nht+lv3HhhoGhM1Q1d
 zSgw3UYbpGee8w+5OFryehiIHOPjuO8CYY/lKEWr5rQ5v23BKvijpXSONFid6y6Ohu/y
 /sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mnLxEEtkwDMb5Dhb/JDaNIG/lWifqcCuQhOSzipR1SA=;
 b=bKGM33/BisRAiaVXgCmdUDp47NM/5ZkIcJhKXqc+ILjWs+JK0j7sw42m4itCK5uEAa
 I7exZRZ51YKiXELwtq95qVfOTMHIkQNqLNwSJWv7mMIxq9IenZVOW7fCqnnl5KKkfWfy
 BAQFsnM2E1BNqdcBvV9OqkqUJ5iADg4xG5cLWHUhDbzLEqYAYbTw4sFbJ0ZOfvKswe80
 o073yoKsRyds8z5UCUw0R/MvX9E/nHovDEur7AuicyCM8pJC7wG/Kz9pqT1choa2vQne
 GAGdcR9XlqaknIZSKPXc3LyWb2C89j0Dq5xEp5pMCg6ZdnqsCNFDhsIFYzZAhFpAQqcM
 bBFA==
X-Gm-Message-State: ANoB5pnLom7UeKWLEtMbLH4bkNDcJ84w04BeK7dU5USf+XMBYi+ssUAK
 lVIocc0w8VlHZhCpOXazuNE=
X-Google-Smtp-Source: AA0mqf6LMR9JT6vXFGbcDlR6xl7ICd1sc9wv75CHxh3AxPEJE63o9fesiJccg7qeGveiU+No4CkZmw==
X-Received: by 2002:a5d:670c:0:b0:242:203c:9ed4 with SMTP id
 o12-20020a5d670c000000b00242203c9ed4mr16122441wru.55.1671018106380; 
 Wed, 14 Dec 2022 03:41:46 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-bc7c-15f1-6c3b-ad74.rev.sfr.net.
 [2a02:8428:46a0:7c01:bc7c:15f1:6c3b:ad74])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05600003c800b0024258722a7fsm2697405wrg.37.2022.12.14.03.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 03:41:45 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul@crapouillou.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for the AUO A030JTN01 TFT LCD
Date: Wed, 14 Dec 2022 12:41:40 +0100
Message-Id: <20221214114142.204041-1-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v1:
 reworked the dt-bindings to add a spi node, dropped properties already 
 present in panel-common.yaml

Christophe Branchereau (1):
  drm/panel: Add driver for the AUO A030JTN01 TFT LCD

Paul Cercueil (1):
  dt-bindings: display/panel: Add AUO A030JTN01

 .../bindings/display/panel/auo,a030jtn01.yaml |  61 ++++
 drivers/gpu/drm/panel/Kconfig                 |   8 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c   | 295 ++++++++++++++++++
 4 files changed, 365 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-auo-a030jtn01.c

-- 
2.35.1

