Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE577263C4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D89E10E503;
	Wed,  7 Jun 2023 15:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CD310E503
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 15:11:34 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9768fd99c0cso150913366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686150692; x=1688742692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fVGis/rTcZr0vzPZaXtByS8SSJioRsVHgE4mgu1eoWM=;
 b=spq/RM/dNbFQuTXPY2sPsA/aibgvpksiop/LevkGp/FWybfXYU2k1nvoislNHdCw4W
 wSdAHMDyz7EVjlm5OErhFBu/dybUozjzN00xXwhbrlyTeI3ZGzVRouvB+1WPEhkgF1Vr
 OWiMFSwBv7N9IYdwU68QAeNgcda30cfuy66UiZHx3wEdmhLkMxBEJvTwU/ya6ncO1GmR
 kqBqn0R+2HvlH6bGbBM4ndaFrTW1ak7eREiK0UFRUGJD4v+9+s/+isgtov/wT1+lxYmq
 gW6ijZbyd8Zi49JyJ0tWW+sQsPWXoV8vlQjN2w8aaaEHVLsozhlbet2K752E6fDC3Xof
 87Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686150692; x=1688742692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fVGis/rTcZr0vzPZaXtByS8SSJioRsVHgE4mgu1eoWM=;
 b=PKhjfNrUa0WJ4ZHpFSiZNE97HmRA6Aw0qmMuSPCZw6p0tYnY4pX1i1WJtqKzaQ9ANl
 OJMgjBdE3TC8WxvS3fChk4RsCk/2CRu/0N3Pm0paam2HsuvG/mBz7n9Fsgk1ewzrTa6S
 CXvlzSbWULhixWbGTeNQb2t2q1WChqmdk4AjnV8QWG8zOwnbwucnew/DNJgfovHNPUUk
 yWaWQXFA2KVx7MdHZYTvzMNru4HKdLL8OTPMeBrgSdwVypK3jrb9cEgM870GVkG92rcv
 6H+u4T21QupmoisoExy0PRMhNjkj1qIgCfYgekqvGCPcghAa4U5ce2fLT7684NR+AHQ8
 tb7g==
X-Gm-Message-State: AC+VfDxgFmNLpeVGM7J2wpsWpJAzEFDWk1wy9ejXthw6FeYNhfG7O6QV
 BjM93MTdVlPeB7jsMu7xKWA=
X-Google-Smtp-Source: ACHHUZ7b7bz7T9J2KeyxrecP+EhKZCCXFFupI1T8bkMfAEqF3RD87rlXw9HCzXySDal0y7jqrODRrQ==
X-Received: by 2002:a17:906:5d07:b0:96a:2210:7dd8 with SMTP id
 g7-20020a1709065d0700b0096a22107dd8mr5206553ejt.38.1686150691954; 
 Wed, 07 Jun 2023 08:11:31 -0700 (PDT)
Received: from fedora.. ([46.188.160.176]) by smtp.gmail.com with ESMTPSA id
 m19-20020a170906235300b00967a18df1easm7006222eja.117.2023.06.07.08.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 08:11:31 -0700 (PDT)
From: Paulo Pavacic <pavacic.p@gmail.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Subject: [PATCH v4 0/3] drm/panel: add fannal c3004 panel
Date: Wed,  7 Jun 2023 17:11:24 +0200
Message-Id: <20230607151127.1542024-1-pavacic.p@gmail.com>
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
  drm/panel-fannal-c3004: Add fannal c3004 DSI panel

 .../bindings/display/panel/fannal,c3004.yaml  |  78 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-fannal-c3004.c    | 314 ++++++++++++++++++
 6 files changed, 412 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-fannal-c3004.c

-- 
2.40.1

