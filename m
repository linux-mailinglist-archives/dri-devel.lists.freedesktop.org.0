Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375C5777A6
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 19:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0682814A7DD;
	Sun, 17 Jul 2022 17:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBCF11B871
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 17:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=k798q7ML9R4Plrb6TqpakxyUbx1g5KWRA3qhCOyn4ek=;
 b=e4C90Y5+4w0vcw6rF3D2f2kPP3t7AKAHZcUH+DI7+w2S/TiSCVHlJIIDo1BTHWu8uXzcUjI1wRu52
 2zJtbAOys8Wv+uhj3pGNnfUOZEh/aY+NUpDDduf4CZ7mHj8+XoRYw2DYuVYiaWYk9eM9m1vqSFoJnJ
 MbGBsjKP3B+RERK182PCh3q8+RcvUgJ2bgxltXrqQAZZPOkqIRdhdzcDHFLQf+dsy8+Zf0WFmDf5vT
 suoUhkWliBi2VSyuOrwsDNYnBd4E0tI3lJ345y1HAwNMjxKe9UvyirlmZxYr5+qmnk20MXk8HcEv4Z
 VVKzfw1WQwbfXSE32Q1WGB1w08q0cLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=k798q7ML9R4Plrb6TqpakxyUbx1g5KWRA3qhCOyn4ek=;
 b=atAGNS4/GuLbsXt6VCubT00JfzK8dji6XUbvCGx+kiMBvBk+yhcp7ECF/qD3gslmtsoc7xgAbAlme
 hMikQjUAw==
X-HalOne-Cookie: e93fb8437fd3034790c1dedaf93d71e57f69d988
X-HalOne-ID: 0dd61fc2-05fa-11ed-be7f-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 0dd61fc2-05fa-11ed-be7f-d0431ea8bb03;
 Sun, 17 Jul 2022 17:58:25 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v1 12/12] drm/todo: Add bridge related todo items
Date: Sun, 17 Jul 2022 19:58:01 +0200
Message-Id: <20220717175801.78668-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717175801.78668-1-sam@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
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

Add todo in the hope someone will help updating the bridge drivers.

v2:
  - Updated descriptions in todo.rst

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 10bfb50908d1..fbcc232e0bc1 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -480,6 +480,26 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
 Level: Starter
 
+Drop use of deprecated operations in bridge drivers
+--------------------------------------------------
+
+&struct drm_bridge_funcs contains a number of deprecated operations
+which can be replaced by the atomic variants.
+
+The following is more or less 1:1 replacements with the arguments
+and names adjusted:
+* pre_enable => atomic_pre_enable
+* enable => atomic_enable
+* disable => atomic_disable
+* post_disable => atomic_post_disable
+
+* mode_set is no longer required and the implementation shall be merged
+  with atomic_enable.
+
+Contact: bridge maintainers, Sam Ravnborg <sam@ravnborg.org>,
+         Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+Level: Beginner or intermediate (depending on the driver)
 
 Core refactorings
 =================
-- 
2.34.1

