Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38636577784
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 19:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC0C913B6;
	Sun, 17 Jul 2022 17:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6608F8A8
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=2vLgyicetFZ8VksYnfIhJHbo2JtPKcWdixiwNKw+SGE=;
 b=TwYWbTiUI9ca6WbppfWDbYpUHgEeRlvSoRO4L/8TJ6sjwZUHNaPhBA5wg1DG8pKit8gptQIt8BGGT
 UQEt9UMGduWyReDA8MQzJH08hfwzY4MVy3clFON8D58EzjqNdVy6RKihmATeWy3ERl+csW/SVMcFlB
 UkGnHaKhDo5v19t0b5Fna2aSebtLAYh0C2dPzTODeXigGmxIZ+T6CMc4v9cEDVsTV73xJ/Lbjq4sL6
 romSc6y4AJ8AAaNcUNL4/cT5x7B7f4WcQ7ZGLLSa7THtFWpDJDL54u+Uw4zGBuVznGrLrcVmy1P/g8
 6EJB1QnjdMltJS8summScIzVZpwDE/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=2vLgyicetFZ8VksYnfIhJHbo2JtPKcWdixiwNKw+SGE=;
 b=inFA86pcq7TWYlZW7Unv1A6XMtZ8tyI7aEwLihkz9RlipuETRMnWpDlNhyhEdp1MbRinHOqfGj9m+
 CjeZxLwDg==
X-HalOne-Cookie: c0c0f26bac3daaf8910f2641e6402cdea6b98545
X-HalOne-ID: 2de56c81-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 2de56c81-05f8-11ed-823f-d0431ea8bb10;
 Sun, 17 Jul 2022 17:45:01 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v1 0/12] drm bridge updates
Date: Sun, 17 Jul 2022 19:44:42 +0200
Message-Id: <20220717174454.46616-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 chrome-platform@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Philip Chen <philipchen@chromium.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a collection of bridge patches that I had left unfinished
more than a year ago. Now where I have some spare time I dusted them
off for review and testing.

The patches builds, but has seen no run-time testing.

The patches are grouped like this:

1+2:
  - Updates parade-ps8640 for atomic operation thus allowing
    the use of the atomic variants of drm_bridge_chain_pre_enable/
    post_disable.
    There is thus no users left of the non-atomic variants of
    drm_bridge_chain* so drop them all.
    If other drivers needs this functionality they are supposed
    to use the atomic API.
    This is a DSI to eDP converter, and I did not see a need for
    format negotiation - but I may be wrong?

3+4:
  - Drop chain_mode_fixup in mediatek, and as there are no more
    users, drop the implementation of drm_bridge_chain_mode_fixup.
    The crucial part to review is the updated documentation for
    drm_bridge_funcs.atomic_check().

5-11:
  - Convert all bridge drivers from mode_fixup to atomic_check.
    To do so add the necessary hooks to have an atomic state.
    I think the drivers will work using the atomic API,
    but it has seen no testing!
    I did not see any need for format negotiation, but if needed
    let me know so we can fix it.
    The last patch removes the mode_fixup support in drm_bridge.

12:
  - Add a few todo items, in the hope others will jump in and
    convert some of the bridge drivers to the atomic API.

The patch groups are more or less independent, and I may land them out
of order if one group is reviewed before the rest.
A few of the patches has already seen a review, but they need a
bit more exposure as last review was more than a year ago.

	Sam


Sam Ravnborg (12):
      drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
      drm/bridge: Drop unused drm_bridge_chain functions
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      drm/bridge: Drop drm_bridge_chain_mode_fixup
      drm/bridge: sii8620: Use drm_bridge_funcs.atomic_check
      drm/bridge: cros-ec-anx7688: Use drm_bridge_funcs.atomic_check
      drm/bridge: tc358767: Use drm_bridge_funcs.atomic_check
      drm/mediatek: Drop mtk_hdmi_bridge_mode_fixup
      drm/rcar-du: lvds: Use drm_bridge_funcs.atomic_check
      drm/omapdrm: Use drm_bridge_funcs.atomic_check
      drm/bridge: Drop drm_bridge_funcs.mode_fixup
      drm/todo: Add bridge related todo items

 Documentation/gpu/todo.rst               |  20 ++++
 drivers/gpu/drm/bridge/cros-ec-anx7688.c |  28 ++++--
 drivers/gpu/drm/bridge/parade-ps8640.c   |  18 ++--
 drivers/gpu/drm/bridge/sil-sii8620.c     |  17 ++--
 drivers/gpu/drm/bridge/tc358767.c        |  21 ++---
 drivers/gpu/drm/drm_bridge.c             | 154 +------------------------------
 drivers/gpu/drm/mediatek/mtk_hdmi.c      |  19 ----
 drivers/gpu/drm/omapdrm/dss/dpi.c        |  31 ++++---
 drivers/gpu/drm/omapdrm/dss/sdi.c        |  31 ++++---
 drivers/gpu/drm/omapdrm/dss/venc.c       |  28 ++++--
 drivers/gpu/drm/rcar-du/rcar_lvds.c      |  12 ++-
 include/drm/drm_bridge.h                 |  91 ++++--------------
 12 files changed, 147 insertions(+), 323 deletions(-)


