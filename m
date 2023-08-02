Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FDB76C215
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 03:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4595310E46B;
	Wed,  2 Aug 2023 01:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E925910E406
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 01:18:48 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9a828c920so97724031fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 18:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690939127; x=1691543927;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V+gWA/tO3az5qnPtCpr5Q7+4MvP6fpYV/Vi7gO7EqLw=;
 b=WkuenX1ZTdY/VOYXWxbQJV8Vc00bZbCUdBzSDngguxOoG6ibp25OywDJSSx75jNId8
 jEp4UwttDm1pFZfJzhWp2WIC26nRfduG+Xj1bwckcg87vt1Rv5z+dyqKqMtVMWv/fk1r
 8eCoraLT1t5H4p7VcZUH7mNNXZi5x3qcTSK7qeTzNSBlEae8I15/yGpZW1cKnJQxdXRt
 Cf54hC/ZeMUw2oCwHMmhkZapJFk8YDQr0HSpMrvpR9Uua+ODp+fWyy69iFkIXzWmDZE6
 bqzMpzt1MyzIfu8TXYeFCny+buMiUmGpa+ZU2Ws+bfzwyo0Yvq+KRWYBlzB4F9nuXUXo
 /1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690939127; x=1691543927;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V+gWA/tO3az5qnPtCpr5Q7+4MvP6fpYV/Vi7gO7EqLw=;
 b=l2UzceNsL7RsiT5O6T3m858KPMQFLQPurUhnHMDU0DKptVljhh1ZWUSHR2sft5upaC
 9TZa9fhEtBaeNIDAqEkYVatmItBljhbIe5pbLxBypNcVWHdx4WrepUgqj6D1xqBEyh3K
 /l1/sJ9uVeIFpVvN50xC3+PQRkkTKvKlO1zWk9e25BpMCeErsqlAdVo6g2XVKFpPpE+A
 YLGIBz06jMd/gV7IXk8p4jNR97Lg44uG8bSLSdT8HwGTjxiEoXdHu/+Lzb5HPSEiNq+N
 Vpn0HAFCEuZSBclna8tmxd8Jn21rfforPFCsh+Gvq+8qXjmrevtNsutWb8kMyZmVLDzD
 T3xA==
X-Gm-Message-State: ABy/qLbr2ZRmKiJBzgkMGAwEqBXwCNvW7gpWIlBjS9ZJjvmSCLOzWo69
 +WR9rLty/49Es/XU9Iv8Vbj/EQ==
X-Google-Smtp-Source: APBJJlGTXU+qU/iB+Qs91qxaj6dsnClWjqfDO9bvss9c5WHdTTrVKMq8s3kynB6XVZ1Gf6nY1uUfuw==
X-Received: by 2002:a19:2d4b:0:b0:4fb:89e3:5ac6 with SMTP id
 t11-20020a192d4b000000b004fb89e35ac6mr3626211lft.62.1690939126825; 
 Tue, 01 Aug 2023 18:18:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a056512388e00b004faeedbb29dsm2775842lft.64.2023.08.01.18.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 18:18:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/3] drm/display: simplify support for transparent DRM
 bridges
Date: Wed,  2 Aug 2023 04:18:42 +0300
Message-Id: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
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

Changes since v2:
 - ifdef'ed bridge->of_node access (LKP)

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge

Dmitry Baryshkov (3):
  drm/display: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_SIMPLE_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE

 drivers/gpu/drm/display/Kconfig             |   9 ++
 drivers/gpu/drm/display/Makefile            |   2 +
 drivers/gpu/drm/display/drm_simple_bridge.c | 127 ++++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c   |  44 +------
 drivers/usb/typec/mux/Kconfig               |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c          |  44 +------
 include/drm/display/drm_simple_bridge.h     |  19 +++
 8 files changed, 163 insertions(+), 86 deletions(-)
 create mode 100644 drivers/gpu/drm/display/drm_simple_bridge.c
 create mode 100644 include/drm/display/drm_simple_bridge.h

-- 
2.39.2

