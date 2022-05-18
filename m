Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1385752B93A
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 13:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA6D10E0A6;
	Wed, 18 May 2022 11:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AF710E2C5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 11:56:15 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id wh22so3182174ejb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 04:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oF+fUnzGRmCla6wkP2ZWWEZ7GzfOYIjKQWRL+xL61A4=;
 b=ZhOdUoZvH+KX2I9nBjZp3CtDu3nBvOk3p9ODvo5x1oIeBFD5fYyBJONJC9otmNNT6e
 toOCz1jR42Z4SpnKfNTHRZTqqTDFB1wGQQ+JNFAKKgC/UVWR1mAl3IIZCgJ3522FLH0t
 7MfwtDN5RlpMHFeXqqe2u3GnNDOWSPkG3WYjXV2ZQ/djEf/FL+8kct1Vt97X9Hj6HFBL
 R3gcv5yzbA7wkOfxzw/yJAVqnIbsr9rWHcRA3wk4lGLElIrBj9FKLETjF44MX0lk2YN/
 Ia+7Hny0BlRYxo6a/C7Jqg0tWqLdEh9KD+8H3i9+QLMIH1AqS7vEQvTZvZ2C0k/shZ1f
 7JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oF+fUnzGRmCla6wkP2ZWWEZ7GzfOYIjKQWRL+xL61A4=;
 b=XDryLxHUHhMUWS3XUsMSlxGLmq+zLi7Awc9HWelx567OJLO2bGOcJcBmNiqF951YW0
 zVDrFihh45FX6EOcRz8Bb8xBjVwT5KuGxMCmOVY6tPKO9Qb1ERXtTeI/RCFFolyd6Ymz
 uIqwTA87jJhORUSsfJFr2Kl9tc62gzk37r/kxTsXdQcOQCcA+m7FfGf8QI0R7VOcqF1G
 QnalDwtWryKKeGVqgluQI7knOWdBAbDueJqtb98uPCzc6MvcF9erE1FIFzuWPuKWfNTt
 TuiELKNuHsKm4CG2Gxh46z5H1zkVrs/BL1oiyXqdDEzwxzFPlwPZolA9r9tf2x6hRaL/
 52hw==
X-Gm-Message-State: AOAM531x1idQt/vhZpE18PBcIPODHBP2d1EUAz5nMPSv6H32zp1KEKR0
 VhEEvKwEQstM24WWIIbiHkU=
X-Google-Smtp-Source: ABdhPJyrMnKyVZWMc4n6Os+y/tg06UNnOrohRbv7mLb78lVsDCcAwXxErgbNu4RxUJjh76agRgw/2w==
X-Received: by 2002:a17:907:d89:b0:6f5:be3:b06d with SMTP id
 go9-20020a1709070d8900b006f50be3b06dmr23900488ejc.74.1652874973392; 
 Wed, 18 May 2022 04:56:13 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 dq20-20020a170907735400b006f5294986besm873999ejc.111.2022.05.18.04.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 04:56:12 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com
Subject: [PATCH v2 0/3] drm/panel: simple: add bus-format support for panel-dpi
Date: Wed, 18 May 2022 13:55:37 +0200
Message-Id: <20220518115541.38407-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Nikita Kiryanov <nikita@compulab.co.il>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Max Krummenacher <max.krummenacher@toradex.com>


Commit 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support") added
support for defining a panel from device tree provided data.

However support for setting the bus format is missing, so that with
the current implementation a 'panel-dpi' panel can only be used
if the driver of the display interface connected can cope with a
missing bus_format.

This patch series defines the new property bus-format and adds it to
the panel-dpi implementation.

Check initial discussions [1] and [2].
[1] https://lore.kernel.org/all/20220201110717.3585-1-cniedermaier@dh-electronics.com/
[2] https://lore.kernel.org/all/20220222084723.14310-1-max.krummenacher@toradex.com/


Changes in v2:
    - Fix errors found by dt_binding_check

Max Krummenacher (3):
  dt-bindings: display: add new bus-format property for panel-dpi
  dt-bindings: display: startek,startek-kd050c: allow bus-format
    property
  drm/panel: simple: add bus-format support for panel-dpi

 .../bindings/display/panel/panel-dpi.yaml     | 11 +++++
 .../display/panel/startek,startek-kd050c.yaml |  1 +
 drivers/gpu/drm/panel/panel-simple.c          | 43 +++++++++++++++++++
 .../dt-bindings/display/dt-media-bus-format.h | 23 ++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 include/dt-bindings/display/dt-media-bus-format.h

-- 
2.20.1

