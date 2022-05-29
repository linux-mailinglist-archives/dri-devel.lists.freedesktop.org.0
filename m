Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378EA537454
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 08:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A8B10EDF7;
	Mon, 30 May 2022 06:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74A810EAFD
 for <dri-devel@lists.freedesktop.org>; Sun, 29 May 2022 18:06:10 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e25so1351765wra.11
 for <dri-devel@lists.freedesktop.org>; Sun, 29 May 2022 11:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=egOqVJUvNJLIiV7jwC1/3AK6X0edWl7/LSTpDO7/hxw=;
 b=iiPG0jYLC3KBNhr/u8+qCRThSj4O9RQg/wByapvQyntKOpUOgTfPpP10Q6Vi6uRxqS
 jbQadlB+dSaPF4XhRWx1tw+S+/MOsmjQSU4fy6nv2FWUjlc3hRbMAg3gEQLjJCcDPUFC
 RRqteZnBhBjcbFHaIgzWhOxrqb4c9KoZyzgehw4quG7y9Jyl9KnsZ/Hvuk/wW4GeFWA+
 s6RP0LDjSCB3UeWbzuPBq+ezsJwR22WKZ23MGKnbUtPqU2MBsvxrllQnDR98+lcCvJqH
 sBc6fqX0umsujotzrjy3eQ6ttUbTO+caMbcLMi/6wvf1/Dny2w7XoMqdjQ+NR9jW6vMa
 3rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=egOqVJUvNJLIiV7jwC1/3AK6X0edWl7/LSTpDO7/hxw=;
 b=TnheRm6ZASC6WyIKSxpWORV2JhRtmHnFHpDXOu3YY4aBkLKglCPxsE1X+MJtH0RSdK
 wz1yTgba9Pa4ebBm3hWWcwN8zqVmau60CvU3Fv6252/xxC8Zi6aIE9h4nX8HoeZ2uWi6
 Uzt39sn5ZqKvhXoPR/KGo6h1KeehSdmebA3d0p49xR1YQ8YEsSdtZ73y8n0Un/PDidqm
 UnJftREIRsDc/94Ht3oNqeMTLc9GwkUu36iOmBq+8Kq2QN9aaLYsNyIa4TvKgjxu+gHK
 /uPQgIYn1o8+wCdKADCaqXrxCW4zLulSTZOmEI+7oY44Z0+Wb/tZkmTq95iXf0OWY99R
 YSVg==
X-Gm-Message-State: AOAM531VKEsLWUV4lk8V9ReN+kOSVcGPBOMlCfpwoE7CEZ641hnBr48M
 miizpDLBvtLL11lqke+59fU=
X-Google-Smtp-Source: ABdhPJwxNisg9lbeEIOBcPGM5wnGOuNoVK2NmwHGZY/ZrI+8SGNGwNuQeMoYPKVxGZFA6B5ZdkHE3g==
X-Received: by 2002:a05:6000:1843:b0:20e:79ca:3e12 with SMTP id
 c3-20020a056000184300b0020e79ca3e12mr37523479wri.150.1653847569072; 
 Sun, 29 May 2022 11:06:09 -0700 (PDT)
Received: from localhost.localdomain ([188.163.112.60])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056000136700b002100f2e6a7dsm7008516wrz.93.2022.05.29.11.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 11:06:08 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Svyatoslav Ruhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v5 0/3] Support Sharp LQ101R1SX03 and HannStar HSD101PWW2
 panels
Date: Sun, 29 May 2022 21:05:45 +0300
Message-Id: <20220529180548.9942-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 30 May 2022 06:15:25 +0000
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for Sharp LQ101R1SX03 and HannStar HSD101PWW2
display panels that are used by Asus Transformer tablets, which we're
planning to support since 5.17 kernel.

Changelog:
v5: - previously patches were sent by Dmitry and he asked me to resend them

v4: - Added r-b from Rob Herring that he gave to the LQ101R1SX01 DT patch
      of v2. I missed to add it to the v3 by accident.

v3: - No changes. Re-sending for 5.18. Device-trees of devices that use
      these panels were merged to 5.17, so we're missing the display support.

v2: - Added ack from Rob Herring to the HSD101PWW2 binding.

    - Updated LQ101R1SX01 binding, like it was suggested by Rob Herring,
      making LQ101R1SX03 directly compatible with the LQ101R1SX01.
      Such that ["sharp,lq101r1sx03", "sharp,lq101r1sx01"] could be
      used in DT. This removes need to update panel driver with the new
      compatible.

    - Improved commit message of the LQ101R1SX03 patch.

    - Added my s-o-b to all patches.

Anton Bambura (1):
  dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03

Svyatoslav Ryhel (2):
  dt-bindings: display: simple: Add HannStar HSD101PWW2
  drm/panel: simple: Add support for HannStar HSD101PWW2 panel

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 .../display/panel/sharp,lq101r1sx01.yaml      |  7 ++++-
 drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.25.1

