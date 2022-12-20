Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38AE652017
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B39410E3B5;
	Tue, 20 Dec 2022 12:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A774C10E3B3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:01:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so10972013wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DeemBtPg6mOFyQLgVazTDdJ9OFj3WHLHd2wy3KkmqpE=;
 b=QrmME4+fTy6zjhgfdY8ufn8YD77vsf9+1M5FA8g4J6BM5/9tjyrg34mwunw0qTAC0R
 ST/IRBaesxka9oidLucP9jQ2EyQ5TgdUqFBfYXlh/1PaLXVbVMHt6bHDubMCaJOYrp95
 CaD+A2aWL/Dyk+8Dx3wxifYTVZzy+WKkYlTSEaU9yr/OuLn9Ncpw1ujDU9pnXTkLQYFD
 4BSklOcqsm/aHXhefi2/eh1vt+GhQGaGAKcrIY3b4bRe2hijfdUw7mHkZ2O8yFHPKL7s
 y0U5Rf7dbizRkMFEXdHVaKlfZ+DZuWxzUbMSFC1NKuPrczDmhqebZsom1ykYGB5i/jIJ
 CN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DeemBtPg6mOFyQLgVazTDdJ9OFj3WHLHd2wy3KkmqpE=;
 b=TmuaFDQcvkPiQvHAUtwTkh4eA5a94wBWDAXs7iBiN8aqjgix0bstPspdeG0Aw67urc
 /TUSdVT+EnCF2/Nwn2z0t2T3hceiorHeYmp1AT7bO6l8gbnipRRHyhRiq85kn5dcI9Zb
 BvyM7pIjP+vgo5S/SEm4Ymdjel+cgvb122gWFmlEHQvS3YOREr4bJdYL/JKU9Z/P+egJ
 DSSjpADiaZh3pEVrvSVGzgqPmp2f0y3X8nepGh4YBMoAcoRkQS92hXS5DSo5+s04wh0R
 oxIpLxabecIAKXIrWXCp4B+ONIZrQyOW3V2gX4uMQhuhW0phrcKvtvQacIbWzxOSXswh
 ev3g==
X-Gm-Message-State: ANoB5plnzaHPSTYi8TyrRKpJ8Fs6pLR6hDbk5DD7ofz7JeySdI6up8E1
 HQ96mtCA8ufDlFWEYW4cLP8=
X-Google-Smtp-Source: AA0mqf68tRpxDGSZYOVUGM3XS0vay0E9GCiXB4tqPRGnQbRdjUp6Hak3m0UunuiZW6MKtiXq+qHQfQ==
X-Received: by 2002:a05:600c:1ca8:b0:3cf:7dc1:f424 with SMTP id
 k40-20020a05600c1ca800b003cf7dc1f424mr35762717wms.3.1671537674890; 
 Tue, 20 Dec 2022 04:01:14 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-43c0-f52a-beed-541b.rev.sfr.net.
 [2a02:8428:46a0:7c01:43c0:f52a:beed:541b])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a1c4301000000b003d04e4ed873sm22843188wma.22.2022.12.20.04.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:01:14 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul@crapouillou.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add support for the AUO A030JTN01 TFT LCD
Date: Tue, 20 Dec 2022 13:01:06 +0100
Message-Id: <20221220120108.481554-1-cbranchereau@gmail.com>
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

Changes since v2:
 - added macros for stanby mode (untested, please review @pcercuei)
 - added SPI table_id
 - changed description in the bindings to describe the hw more

---
Changes since v1: 
- fixed the dt-bindings maintainer email adress
- dropped backlight, port, power-supply and reset-gpios as they're
  provided by panel-common.yaml as pointed by Krzysztof Kozlowski
- changed reg: true to reg : maxItems: 1 

Christophe Branchereau (1):
  drm/panel: Add driver for the AUO A030JTN01 TFT LCD

Paul Cercueil (1):
  dt-bindings: display/panel: Add AUO A030JTN01

 .../bindings/display/panel/auo,a030jtn01.yaml |  54 +++
 drivers/gpu/drm/panel/Kconfig                 |   8 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c   | 307 ++++++++++++++++++
 4 files changed, 370 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-auo-a030jtn01.c

-- 
2.35.1

