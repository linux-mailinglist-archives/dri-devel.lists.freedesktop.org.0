Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C516C65137C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 20:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B938210E048;
	Mon, 19 Dec 2022 19:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C0210E041
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 19:52:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso7296568wmo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 11:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wM5eORbXs9xHp9Nzr+xVNrJWic+DOQMMiAtYKX4dMVc=;
 b=F3IPUUVYhwFAZkxY3WfwX9CwFv9W91edyXBLF65RdxskKWIHz2CIWQZMJGx2zMswjx
 6TwZfQOPbFv7of0rCSUSUkevvsjoPoKRrLMofBJ3P/UJwEQOdswhVQZxy/3jYXF/MCOt
 me4rYb9sV98LcCVY7ogZ95zWD7R+hOInxcaFzwuO9ksT40lgQuZnCBBc+XAtHjrXAgmr
 US0zSwiEPWJ/N3BjtIjz7e9+1wVHjpukHdEJBmecNVKwKR3usyYQJt4yI1VWhviYyM55
 PYIV9uFxnrh9qB1xvb6xxf1Vnw+llGmfBKoFmNA5hOXrSAxu8ajGr1nEXatck/KFKtnI
 yT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wM5eORbXs9xHp9Nzr+xVNrJWic+DOQMMiAtYKX4dMVc=;
 b=bGht9womXEkG0NfcdM5BIZHhu7sqL+qWW1YAU4qMi91z56sD91AKT2sk0wNtkY8RO9
 5/ZYim5nz4nfPQNDNjPa7EfLU+d9IDGzByJ+OoF4DP3xg0d+dhOwEnzDJ3rGTwSD3ppY
 Lig/+WYm4/TBpryqW2WmEmO4JyBxH/KAxLC1Py3AmLRvjbB6oZ05P1OrKrUyWMkXUyJG
 7gNWuX5BaII2g+LcteyM1Gg6l0IFgOB0NwOBCu3W4uk8W9tNDX8V/KwkW4lpXBZpMT3f
 Z39N9EqukxMnIUA004X0YRRerWLe1a+s/2FDUY0em2pJGkWqsOXCWU7UvRaq5C3CCOAN
 ETig==
X-Gm-Message-State: ANoB5pnfxUiDwVk5Uxd31uSAPnidHjFGO3EuWO1rH1aGZfJFUrF8zIYU
 jxyxkz7JqgayKIneSHOc5vo=
X-Google-Smtp-Source: AA0mqf5ebwfR8R/cCNYMXcdI/7o+HSI33zGO2ZQqU6dF15DNBFHYksCD7lOFmwqHai7rUFKa83TAog==
X-Received: by 2002:a1c:f315:0:b0:3cf:a5df:8bb0 with SMTP id
 q21-20020a1cf315000000b003cfa5df8bb0mr34027155wmq.37.1671479557040; 
 Mon, 19 Dec 2022 11:52:37 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-43c0-f52a-beed-541b.rev.sfr.net.
 [2a02:8428:46a0:7c01:43c0:f52a:beed:541b])
 by smtp.gmail.com with ESMTPSA id
 bg2-20020a05600c3c8200b003b47e75b401sm24469142wmb.37.2022.12.19.11.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 11:52:36 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net,
 linus.walleij@linaro.org
Subject: [PATCH v3 0/2] Add support for the orisetech ota5601
Date: Mon, 19 Dec 2022 20:52:31 +0100
Message-Id: <20221219195233.375637-1-cbranchereau@gmail.com>
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
 - Documented the registers to the best of my knowledge
 - Used macros for on/off panel registers
 - Added SPI id_table (non-requested change, fixes a warning in dmesg)

---
Changes since v1:
 - fixed the dt-bindings maintainer email adress
 - dropped backlight, port, power-supply and reset-gpios as they're
   provided by panel-common.yaml as pointed by Krzysztof Kozlowski
 - changed reg: true to reg : maxItems: 1

Christophe Branchereau (2):
  drm/panel: add the orisetech ota5601a
  dt-bindings: display/panel: Add the Focaltech gpt3

 .../display/panel/focaltech,gpt3.yaml         |  56 +++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-orisetech-ota5601a.c  | 364 ++++++++++++++++++
 4 files changed, 430 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c

-- 
2.35.1

