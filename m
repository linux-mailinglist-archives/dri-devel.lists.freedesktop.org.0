Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F3625665F
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB366EC0D;
	Sat, 29 Aug 2020 09:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5296E4CB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 15:49:14 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 185so1825184ljj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DATJ7eGMNLZCyNQeCZmAD8QoZWEBPYduaVIGDRd+5bc=;
 b=nzknUlPzMEIXFNOmpAbizHT3DoDelUgK0gNjKN4NA28tF+mhCDf/obNn2844u6eUGX
 aNot7EshiEXSmo5UIm6ANs5Mh9g4rDHT6KoDEtILrgIGcRrZrhPsFD1v+jIpvWbzwjlK
 G4QakOu0thp0ddFdr+8CIXpkSqq3vYMvhqTTZLIKHm8sefuqUo9Na31PN2VilvVS/z2c
 PalifO5pdSm9IEnmr440qwaNW/A4hRIX1zpJqBF8culOIruNvswChUt7qD6DuL+hZZNr
 jxSkus74eluryEUOW6H2F5hrVi8xx0gJyrnKoImGkTJ64CwlWlQ5mnue74BSoqkeRVAc
 /DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DATJ7eGMNLZCyNQeCZmAD8QoZWEBPYduaVIGDRd+5bc=;
 b=QhLQuVga7wl/D8Rk8V6I5w52FGi+rPN1xcxW04lGXs/R2919w3/ocYqoiHMXVxZpLl
 SOQXtYAU/pHw2pQI+WRvozgUX9WwFo0vkv2YbhaW7I169Vhs/T4NpiMZY7ZOfQ/2Jaab
 vY2PXuMkWiMw66gKbE8AJ+1v0LDPfhFNWzOpdRMNh1ap5pOiwgpXEFGfCWtZtKT9FGdI
 2mzTUfM/o4FHWcfaXlKkw4+xDCz/5kXLPdSWKTe00gSzANOv/alfqYeJk2eipFj9R8E2
 MmCfmSQvpz7gs6ICAAti0fbagWCWgiJDTMRWkRNUbyUZr9Jm5TDfhrf199JeJzhvqxNW
 BZfg==
X-Gm-Message-State: AOAM5322wYWtT2aEnOfIZN9kcLPQwOxx1WMHuAZFRUfTwscKq0XJFXQc
 gI7wA1xZws2LMr/iy2Cd2RC7Tg==
X-Google-Smtp-Source: ABdhPJziUwmaraoePdxpXH3+GScZIfhka4CTJabY988lQZeK6M/194Z8ps7rwFVxsT6VoII+kzN8kA==
X-Received: by 2002:a2e:9c96:: with SMTP id x22mr1228969lji.337.1598629753199; 
 Fri, 28 Aug 2020 08:49:13 -0700 (PDT)
Received: from eriador.lan ([188.162.64.62])
 by smtp.gmail.com with ESMTPSA id r16sm270215ljd.71.2020.08.28.08.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 08:49:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] Add LT9611UXC DSI to HDMI bridge support
Date: Fri, 28 Aug 2020 18:49:03 +0300
Message-Id: <20200828154906.1662611-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds support for Lontium LT9611UXC bridge chip which takes
MIPI DSI as input and provides HDMI signal as output.

The chip can be found in Qualcomm RB5 platform [1], [2].

[1] https://www.qualcomm.com/products/qualcomm-robotics-rb5-platform
[2] https://www.thundercomm.com/app_en/product/1590131656070623

Changes since v1:
 - Fix whitespaces/indentation
 - Support working without DRM_BRIDGE_ATTACH_NO_CONNECTOR



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
