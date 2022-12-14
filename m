Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5D64C795
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 12:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C0410E05F;
	Wed, 14 Dec 2022 11:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A0D10E05E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 11:00:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h16so9912804wrz.12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 03:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IM7/rTUFOP/ct9XAoTb4YaT/tqN70SwMVuKsM+i658Q=;
 b=kYAxkFOjJ8BzuJeJmxU+yCTPFfcPQ4CGTFE+FGQ5UtFy6M0nKKdnUZ2gIyS8kicJjR
 5AUagbwxxuWAmtXf7hxZzi5v1dUHwD8mQs1aqViQ5L0AVEQ2ILHJvcBMg2jbZ6T/fy0u
 IJsIPXvYe6HF4z4q2v2axS1K+gmGMr54L5+sS9J23Fg2vdGhvJpgNeEyJDwaMs0m0CFR
 iotMZNEgNXYFMyjjboG/omRGCfbjLhtfv1bFPnqrzq7Bma4+uBj8m67zES6/CHfoBETq
 AiniCMICab2NZUEDrm4OIiFiG9zLOkBdaJz2aeOI1TmQbqCSrrbHsfVmbRSLKDgjE9Ny
 FxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IM7/rTUFOP/ct9XAoTb4YaT/tqN70SwMVuKsM+i658Q=;
 b=CltmRVAO5bpbjPqYW1No2JoDu1FqKDuHEczWV0er6UeOySWNy82VbkatjPqWBCtSOg
 t/MrwF3iW+ODtHopZcBLdDITPDH56y0hq0u9Zp9s8ncTy1HpY+cmv2BOaEKhMIFtUbjf
 4fSkIw546ab6Tp1LC3xbLo5D4ozRlJC6UWwrZTpl+FY6ZLpV+xRy6nMM7fEETjon7mdm
 kPQ/UH/td26muiRifBGbYzo0Jg45DybILpy3KH0nCgxmKf1R7/sRRuqGbnb90P9G8rM5
 yqvhWgX5Xot/MVHKF8/RdpDzMr+pcjoI3UBbIh7UfG0yxjJrBsbtIilRp6HJPZ6FkvRs
 Dl6w==
X-Gm-Message-State: ANoB5pnzKZKOOvz7u54k20jKff5OS88HDsGyL/g/hhXFABi92CGZM5XG
 E/LPGf+Ceryrx7VWMjy6Eik=
X-Google-Smtp-Source: AA0mqf40IOBJjIuybK11ISF0mlVEOSvpvOyzSUCsEaC14iHI3HUh7JjXxqyCzjP6/dgLtkI/h+MqhA==
X-Received: by 2002:adf:fbc7:0:b0:236:6c33:2130 with SMTP id
 d7-20020adffbc7000000b002366c332130mr15129620wrs.68.1671015648754; 
 Wed, 14 Dec 2022 03:00:48 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-bc7c-15f1-6c3b-ad74.rev.sfr.net.
 [2a02:8428:46a0:7c01:bc7c:15f1:6c3b:ad74])
 by smtp.gmail.com with ESMTPSA id
 h1-20020adfaa81000000b002366c3eefccsm2462096wrc.109.2022.12.14.03.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 03:00:47 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for the AUO A030JTN01 TFT LCD
Date: Wed, 14 Dec 2022 12:00:35 +0100
Message-Id: <20221214110037.149387-1-cbranchereau@gmail.com>
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
 fixed the dt-bindings maintainer email adress

 dropped backlight, port, power-supply and reset-gpios as they're 
 provided by panel-common.yaml as pointed by Krzysztof Kozlowski

 changed reg: true to reg : maxItems: 1

Christophe Branchereau (2):
  drm/panel: add the orisetech ota5601a
  dt-bindings: display/panel: Add the Focaltech gpt3

 .../display/panel/focaltech,gpt3.yaml         |  56 +++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-orisetech-ota5601a.c  | 351 ++++++++++++++++++
 4 files changed, 417 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c

-- 
2.35.1

