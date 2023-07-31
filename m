Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47007768DFF
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 09:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA53810E065;
	Mon, 31 Jul 2023 07:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826D610E065
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 07:19:33 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b9d3dacb33so34367321fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 00:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690787972; x=1691392772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HDhfU2FoK8aIJGXr0hUVQrh/P1Qtr8xU+ls50+YP7vQ=;
 b=pKUFzvIbDXE4qehMCnW185ujZVoxzM64vjsTHYaa8ZifxCwJAiCOV4K51poAf0woPb
 muInJ8nf1Af/KfLwxvGlbcAUyoJOZ0qV8NBPaysp7o5K37pth4xxejw2Pg0iBvQYW4JE
 mZzqjyezpf6KybQarU40lVrLbZwaPufKxzExD2aL3F+CsesXxcNMl05REvmtpK25WGrG
 TpdhGXnGeN2HSZR+t8j5Trb59cIfT8YhhM1LT41WTyvF+1QwUcNWCsxOKLZ2MKbSy4Yg
 zdsTSFzD5Xp5hRP3u5GdBIPYiUtm+oUlJptM/AqhbnMiqCNFoAZ/G8n4mCJ9Jhgr4qIw
 CHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690787972; x=1691392772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HDhfU2FoK8aIJGXr0hUVQrh/P1Qtr8xU+ls50+YP7vQ=;
 b=O/7fgv481sIj6CddI2hfdQCUQf4IAcwytoYo9CYDOb53UVJGRDvsOpneWGD9OvpJ7v
 0MH6DQ03Elc45MpfyOlrzC3fScLMjFhy3Zbfbi53Y47x/RG8dFAvhwuT7rXo9WdG9Pm5
 Alcq+Z8Ijpx+IURnAoyf0OeI/nb2I1IZC0MeUEBq1oo7b+a/7Tx/ewn8a0PF2bvVUrkT
 6SOvvu8CMoMgf52ActdPi9j5LXLbCZe8ZE7uJvSyW0VmPvMwVqT4doaLx97+Sl5tNO5J
 xEzYOHe4ljK2V0K9vBoVjQ8kideo/FiuVSGHYgoJp6Jc/0IKgWgvKfdeWbQlieqBqsml
 R8tw==
X-Gm-Message-State: ABy/qLYVLTFM5fIv6sQfFEqxSze3pjGNuFedCX/NUau13gS96Z+aD97y
 hZWSqT03XrV5xRhG4+d7nsl8YCGkiuIZJi9HFzo=
X-Google-Smtp-Source: APBJJlEFmmxgVpsb4VKdX/OmDgm7CzXZk2Cy1ts84q1OxjZfrnZW6wz1kgkFsMhlbMY/DhcQwIQTHA==
X-Received: by 2002:a2e:8ed0:0:b0:2b9:4b2e:5420 with SMTP id
 e16-20020a2e8ed0000000b002b94b2e5420mr5467379ljl.52.1690787971721; 
 Mon, 31 Jul 2023 00:19:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a2ea1c4000000b002b71c128ea0sm2413267ljm.117.2023.07.31.00.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 00:19:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] drm/display: simplify support for transparent DRM
 bridges
Date: Mon, 31 Jul 2023 10:19:27 +0300
Message-Id: <20230731071930.3928150-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Supporting DP/USB-C can result in a chain of several transparent
bridges (PHY, redrivers, mux, etc). This results in drivers having
similar boilerplate code for such bridges.

Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
bridge can either be probed from the bridge->attach callback, when it is
too late to return -EPROBE_DEFER, or from the probe() callback, when the
next bridge might not yet be available, because it depends on the
resources provided by the probing device.

Last, but not least, this results in the the internal knowledge of DRM
subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.

To solve all these issues, define a separate DRM helper, which creates
separate aux device just for the bridge. During probe such aux device
doesn't result in the EPROBE_DEFER loops. Instead it allows the device
drivers to probe properly, according to the actual resource
dependencies. The bridge auxdevs are then probed when the next bridge
becomes available, sparing drivers from drm_bridge_attach() returning
-EPROBE_DEFER.

Proposed merge strategy: immutable branch with the drm commit, which is
then merged into PHY and USB subsystems together with the corresponding
patch.

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge

Dmitry Baryshkov (3):
  drm/display: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_SIMPLE_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE

 drivers/gpu/drm/display/Kconfig             |   9 ++
 drivers/gpu/drm/display/Makefile            |   2 +
 drivers/gpu/drm/display/drm_simple_bridge.c | 125 ++++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c   |  44 +------
 drivers/usb/typec/mux/Kconfig               |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c          |  44 +------
 include/drm/display/drm_simple_bridge.h     |  19 +++
 8 files changed, 161 insertions(+), 86 deletions(-)
 create mode 100644 drivers/gpu/drm/display/drm_simple_bridge.c
 create mode 100644 include/drm/display/drm_simple_bridge.h

-- 
2.39.2

