Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D473559167D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 22:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA08410F4D9;
	Fri, 12 Aug 2022 20:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964BE10FEC3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 20:58:08 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4M4GGl43pczDqPf;
 Fri, 12 Aug 2022 20:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1660337888; bh=lqIb/39ravYbx7WCjgTnGhey78nkmC1/ONugMtjoV2A=;
 h=From:To:Cc:Subject:Date:From;
 b=JH4Vzc7nuj19eou1mabDepZQSeG0TMLH1J7AJvQ9WK9ubuLFgJx7dXAFUtChxqA87
 OhkdOl2vXRFefEhXbtd4rWoBtl0zzriPCouKxRw2ch0Exo5C3F2oxXiHWuW86VAe5Y
 +kSqCZCDHfa6yElyc1vy8p/wUxos/QvMsrAF/iQc=
X-Riseup-User-ID: B98CDF838B390E4E878A3EA4F8DA48AF89E37DB8D26B1A3DCA91AE6A05788F60
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4M4GGb0B9hz5vTk;
 Fri, 12 Aug 2022 20:57:58 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/5] Drop of_gpio header
Date: Fri, 12 Aug 2022 17:57:41 -0300
Message-Id: <20220812205746.609107-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Emma Anholt <emma@anholt.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The legacy GPIO header <linux/gpio.h> and the deprecated OF GPIO header
<linux/of_gpio.h> should not be used anymore due to the existance of the
new GPIO header <linux/gpio/consumer.h>. Currently, the DRM still holds
seven OF GPIO header includes. That said, this series drops all the
OF GPIO header includes from the DRM, replacing it, when proper, with
the OF header.

Best Regards,
- Maíra Canal

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: linux-mediatek@lists.infradead.org

Maíra Canal (5):
  drm/bridge: anx7625: Drop of_gpio header
  drm/mediatek: Drop of_gpio header
  drm/msm: Drop of_gpio header
  drm/sti: Drop of_gpio header
  drm/vc4: Drop of_gpio header

 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
 drivers/gpu/drm/mediatek/mtk_dpi.c        | 1 -
 drivers/gpu/drm/mediatek/mtk_hdmi.c       | 1 -
 drivers/gpu/drm/msm/dp/dp_parser.c        | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c           | 1 -
 drivers/gpu/drm/sti/sti_dvo.c             | 2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c            | 1 -
 7 files changed, 2 insertions(+), 7 deletions(-)

-- 
2.37.1

